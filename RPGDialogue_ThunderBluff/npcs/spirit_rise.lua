-- Spirit Rise and the Pools of Vision: the Skychaser shaman trainers above, and the Forsaken
-- mage and priest trainers in the caves below. Voice: bibles/spirit_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- The Skychasers: shaman trainers on Spirit Rise.
---------------------------------------------------------------------------

-- Tigor Skychaser: the eldest, grave and slow to praise.
P:NPC {
  key = "tigor", id = TODO_NPC("Tigor Skychaser"), name = "Tigor Skychaser", title = "Shaman Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "stern" }, values = { "devout", "wise" },
  notices = { "class" },
  impression = {
    first = "To him the elements are old neighbors who must be asked politely.",
    third = "{name} met Tigor Skychaser, the eldest of the Skychaser shaman trainers on Spirit Rise.",
  },

  greetings = {
    { id = "g_hi", text = "The spirits are restless this morning, and the wind has a sharp tongue. Speak gently." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The spirits remember you, and they do not remember every traveller who climbs to this rise." },
  },

  notice = {
    { id = "n_orc", cat = "class", when = { class = "SHAMAN", race = "Orc" },
      text = "An orc shaman. Your people lost the spirits once and found them again through Thrall, so you of all people should know never to take them for granted." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tigor Skychaser, and the Skychaser tribe has kept the spirits' ways on this rise since the Bluff was raised. If you would speak with earth, fire, water and air, you must first learn to listen to them." },
        { id = "h_notsham", when = { ["not"] = { class = "SHAMAN" } }, text = "You are not of the spirit-speakers, but you may stand here. Only don't shout on Spirit Rise; the spirits dislike it, and so do I." },
      },
      again = { { id = "h_again", text = "Something more? Ask it plainly, as the earth answers." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "How do you ask the elements?", next = "ask" },
        { text = "What happens if you command them instead?", next = "command" },
        { text = "Tell me of the Skychaser tribe.", next = "tribe" },
        { text = "What do you make of the Forsaken in the caves below?", next = "below" },
        { text = "Thrall brought the spirits back to my people.", next = "orc_thrall", when = { race = "Orc", class = "SHAMAN" } },
        { text = "The elders say this rise was always holy ground.", next = "holy_ground", when = { race = "Tauren" } },
        { text = "Farewell, Tigor.", next = "END" },
      },
    },
    ask = {
      lines = { { id = "a_default", text = "As you'd ask an elder for a favor, with respect and with patience, and knowing they might say no. A totem is a request, not a leash." } },
      choices = {
        { text = "What do you thank them with?", next = "ask_thanks" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask_thanks = {
      lines = { { id = "at_default", text = "Water poured on the stone for the earth, a pinch of ash given back to the fire, a breath for the wind, and for the water a little of whatever you carry. It needn't be costly, only meant, and the spirits know the difference better than any merchant at the Crossroads." } },
      choices = {
        { text = "And if they refuse you anyway?", next = "ask_refuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask_refuse = {
      lines = { { id = "ar_default", text = "Then you go without, and you ask yourself what you did to earn the silence. Most often it's nothing against you at all, only that the land is tired or grieving, as the Charred Vale in Stonetalon has grieved for years now." } },
      choices = {
        { text = "I'll remember that, elder.", next = "BACK" },
        { text = "Farewell, Tigor.", next = "END" },
      },
    },
    command = {
      lines = { { id = "c_default", text = "Then you are a warlock, or worse, and the elements will wait for the moment you falter. The orc warlocks once commanded the land of their homeworld, and the orcs themselves will tell you how that ended." } },
      choices = {
        { text = "Surely a shaman must compel the spirits sometimes.", next = "command_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    command_end = {
      big = true,
      lines = { { id = "ce_default", text = "Never, not even when the need is great. Others on this rise would argue with me, but I've seen what an angry spirit does to a careless shaman, and I'd not wish it on anyone." } },
      choices = {
        { text = "Never. The spirits must be asked.", next = "BACK", reply = "Good, then the spirits will hear you when you need them most. A shaman who asks has many friends, and one who commands has only servants waiting for a chance.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "In great need, I'd compel them.", next = "BACK", reply = "Then pray your need is never great, young one. The spirits remember every chain you put on them, and they are patient in a way we are not.", fx = { align = { order = -1 } } },
      },
    },
    tribe = {
      lines = { { id = "tr_default", text = "The Skychasers have watched the sky and listened to the winds since long before Cairne gathered the tribes together. When the Bluff was raised, the High Chieftain gave this rise to us, because the spirits were already here and somebody had to keep them company." } },
      choices = {
        { text = "Beram and Siln are your kin, then?", next = "tribe_kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe_kin = {
      lines = { { id = "tk_default", text = "They are of my blood, and both of them think I am too slow. Beram carves totems as if the wood owed him money, and Siln slips down into the caves whenever my back is turned, which is less often than Siln believes." } },
      choices = {
        { text = "They seem to teach well enough.", next = "tribe_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe_teach = {
      lines = { { id = "tt_default", text = "They do, though I'd not say it to their faces, and neither will you. A tribe needs one who listens, one who builds and one who asks too many questions, and the spirits seem content with the three of us." } },
      choices = {
        { text = "Something else, elder.", next = "BACK" },
        { text = "Farewell, Tigor.", next = "END" },
      },
    },
    below = {
      lines = { { id = "bl_default", text = "The Pools of Vision lie beneath this rise, where shaman have gone to see what the spirits would show them for as long as we have held this place. Now Forsaken mages and priests live in the caves beside them, by Cairne's leave, and I keep my peace because he asked me to." } },
      choices = {
        { text = "You don't trust them.", next = "below_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    below_trust = {
      big = true,
      lines = { { id = "bt_default", text = "I don't know them, which is not the same thing. The dead walk because something unnatural raised them, and the spirits of the earth do not forget a wrong so quickly, whatever the Forsaken have chosen since." } },
      choices = {
        { text = "They broke free of the Scourge. That deserves a welcome.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The dead should stay buried. You're right to be wary.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc_thrall = {
      lines = { { id = "ot_default", text = "He did, and he found them waiting, which tells you how patient the spirits are. Your warlocks poisoned the land of your old world, and still the elements took back the orcs who asked properly, so remember that the next time you are tempted to hurry them." } },
      choices = { { text = "I'll remember. Something else.", next = "BACK" } },
    },
    holy_ground = {
      lines = { { id = "hg_default", text = "The elders are right, and for once I agree with all of them. Before the bluffs held lifts and tents, Skychaser shaman climbed here alone to fast and listen, and the wind still remembers the ones who came up on their own hooves." } },
      choices = { { text = "Something else, elder.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I am Skychaser, a shaman, and old enough that the spirits call me by name." } },
    advice = { { id = "tp_ad", text = "Thank the element that answered you, every time. They notice who forgets." } },
    the_elements = { { id = "tp_el", text = "Earth, fire, water and air, each with its own temper, and none of them yours to own, however long you've spoken with them." } },
    earth_mother = { { id = "tp_em", text = "She is mother to the spirits as much as to the tauren, and they speak of her more kindly than we deserve." } },
    thrall = { { id = "tp_th", text = "The young Warchief understood the spirits better than any orc in generations, and from me that is high praise." } },
    _none = { { id = "tp_none", text = "The spirits haven't told me of that, and I won't guess on their behalf." } },
  },
}

-- Beram Skychaser: the practical one, all totems and fieldwork.
P:NPC {
  key = "beram", id = TODO_NPC("Beram Skychaser"), name = "Beram Skychaser", title = "Shaman Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "practical", "craft" },
  notices = { "class" },
  impression = {
    first = "He cares more for what works than for what the elders say.",
    third = "{name} met Beram Skychaser, a practical shaman trainer on Spirit Rise.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the shavings. Totems don't carve themselves, though the spirits in the wood would like you to think so." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me see your totems; they always tell me how you've been using them." },
  },

  notice = {
    { id = "n_troll", cat = "class", when = { class = "SHAMAN", race = "Troll" },
      text = "A troll shaman. Your people speak to the loa as well as the elements, and I've always wondered how you keep them from quarrelling." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Beram Skychaser. Tigor will teach you to listen to the spirits, and I'll teach you where to put the totem so the spirits can actually help, which is a lesson that's saved more lives than his." },
        { id = "h_notsham", when = { ["not"] = { class = "SHAMAN" } }, text = "Not a shaman? Then you can hold this while I carve. Mind the end, it's sharp." },
      },
      again = { { id = "h_again", text = "Something else? Hand me that knife while you think, and keep your hooves off the cedar." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "Where should a totem go?", next = "where" },
        { text = "Tigor must mind you saying that.", next = "tigor" },
        { text = "What are you carving?", next = "carve" },
        { text = "Our loa and the elements get along fine.", next = "troll_loa", when = { race = "Troll" } },
        { text = "Could a warrior make use of a totem?", next = "warrior_totem", when = { class = "WARRIOR" } },
        { text = "Farewell, Beram.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Behind you, where the enemy has to go through you to kick it over. Young shaman always drop them at their feet and then wonder why the centaur trampled their fire totem first." } },
      choices = {
        { text = "So it's tactics, not prayer.", next = "where_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_end = {
      big = true,
      lines = { { id = "we_default", text = "It's both, and anyone who tells you otherwise has never been in a real fight. The spirits will answer a reverent shaman, but they can't help one who's already dead." } },
      choices = {
        { text = "Reverence comes first, and tactics follow.", next = "BACK", reply = "Fine words, and true enough in the lodge. Let's see if they hold up when a quillboar is charging you and your totem's still in your pack.", fx = { align = { order = 1 } } },
        { text = "Use what works. The spirits will understand.", next = "BACK", reply = "They'll understand, mostly, if you thank them afterward. Just don't let it become a habit, or one day they'll stop picking up when you call.", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    tigor = {
      lines = { { id = "t_default", text = "He minds everything I say, and I mind half of what he says, and between us the students turn out well. That's how a tribe works." } },
      choices = {
        { text = "Do the two of you ever agree?", next = "tigor_agree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tigor_agree = {
      lines = { { id = "ta_default", text = "On the things that matter, yes: the spirits come first, a shaman serves the people, and Siln goes down into the caves far too often. We only argue about everything that comes after that, which keeps us both young." } },
      choices = { { text = "Something else, Beram.", next = "BACK" } },
    },
    carve = {
      lines = { { id = "cv_default", text = "A searing totem for a young shaman from Bloodhoof who burned through his last one in a week. It's cedar from the Stonetalon foothills, because cedar holds a fire spirit without cracking, which is more than I can say for pine." } },
      choices = {
        { text = "Where do you find the cedar?", next = "carve_wood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carve_wood = {
      lines = { { id = "cw_default", text = "On the lower slopes of Stonetalon, when the Venture Company's saws haven't got there first. The goblins cut the old trees by the hundred for coin, and every season I walk farther to find wood worth carving." } },
      choices = {
        { text = "What do the spirits make of that?", next = "carve_venture" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carve_venture = {
      big = true,
      lines = { { id = "cx_default", text = "The druids at Stonetalon Peak send word that whole hillsides are gone, and the spirits of the wood go with them. I'm a practical bull, but there's a difference between using a tree and using up a forest." } },
      choices = {
        { text = "Then drive the goblins out. The forest can't defend itself.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Trees grow back. Trade feeds the Horde.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll_loa = {
      lines = { { id = "tl_default", text = "Do they? Then I'd like to hear how, because Tigor says a shaman can only serve one master, and I've never been sure he's right. If your loa help you set a totem where it ought to go, I'm glad of any help you can get." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior_totem = {
      lines = { { id = "wt_default", text = "Only if you like carrying a lump of carved wood and scowling at it, because it won't answer you. Stand beside a shaman who knows where to plant one, though, and you'll fight twice as long, and I'd call that the next best thing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    venture_company = { { id = "tp_vc", text = "Saws and smoke all over Stonetalon. They take the trees and leave the stumps for the spirits to mourn." } },
    the_elements = { { id = "tp_el", text = "Earth for holding, fire for fighting, water for mending and air for moving. Put each totem where it can do its work." } },
    background = { { id = "tp_bg", text = "Skychaser, shaman, and the best totem-carver on this rise, whatever my cousins say." } },
    advice = { { id = "tp_ad", text = "Carry a spare totem. A broken one in the middle of a fight is no use to anyone." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask Tigor; he'll take an hour to say he doesn't know either." } },
  },
}

-- Siln Skychaser: the youngest, curious about the caves below.
P:NPC {
  key = "siln", id = TODO_NPC("Siln Skychaser"), name = "Siln Skychaser", title = "Shaman Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "eager" }, values = { "curious", "kind" },
  notices = { "race" },
  impression = {
    first = "Only she goes down to talk with the Forsaken.",
    third = "{name} met Siln Skychaser, a young shaman trainer on Spirit Rise.",
  },

  greetings = {
    { id = "o_fk_trust", when = { gossip = { topic = "forsaken", stance = "trust" } }, text = "Bena Winterhoof, the alchemist, says you count the Forsaken as Horde like any of us. The spirits below the rise would be glad of more like you, I think." },
    { id = "g_hi", text = "Oh, hello! Sorry, I was listening to the wind. It's chatty today." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Come and tell me where you've been." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Do you know Apothecary Zamah, from the caves below? I tried to ask her about the spirits of the dead once, and she laughed at me for a long time." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Siln Skychaser, and I teach young shaman with Tigor and Beram, though they'd tell you I'm still learning myself. They're not wrong, but I don't think a shaman ever stops." },
        { id = "h_notsham", when = { ["not"] = { class = "SHAMAN" } }, text = "You're not a shaman, but that's fine, I like talking to people who aren't. They ask better questions." },
      },
      again = { { id = "h_again", text = "What else? I've time, the wind's settled, and the earth spirits are dozing." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "Do you ever visit the Forsaken below?", next = "below" },
        { text = "What does the wind say?", next = "wind" },
        { text = "What are Tigor and Beram like as teachers?", next = "elders" },
        { text = "What's the first thing you teach a shaman?", next = "first_lesson", when = { class = "SHAMAN" } },
        { text = "I could tell you what dying was like.", next = "fk_tell", when = { race = "Scourge" } },
        { text = "Farewell, Siln.", next = "END" },
      },
    },
    below = {
      lines = { { id = "b_default", text = "Sometimes, when Tigor isn't watching. The Pools of Vision are a holy place, and now there are Forsaken mages and priests living in the caves beside them, and I'd like to know what the spirits there think of that." } },
      choices = {
        { text = "And what do they think?", next = "below_end" },
        { text = "Who do you talk to down there?", next = "below_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    below_end = {
      big = true,
      lines = { { id = "be_default", text = "They're uneasy, but they haven't left, and I take that as a good sign. Tigor says the Forsaken shouldn't be so close to the pools, and I think the spirits are more patient than he is." } },
      choices = {
        { text = "The spirits are wise. Let the Forsaken stay.", next = "BACK", reply = "I think so too, though don't tell Tigor I said that loudly. The spirits have stayed, and they're older and wiser than all three of us.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Tigor's right. The dead don't belong there.", next = "BACK", reply = "Maybe he is, and he's certainly older than me. But the pools haven't gone dark yet, and I'd rather watch and learn than shout and guess.", fx = { align = { light = -1 } } },
      },
    },
    wind = {
      lines = { { id = "w_default", text = "Mostly that there's rain coming over the Stonetalon peaks, and that the harpies are squabbling again at the Windfury Ridge. It's a terrible gossip, the wind." } },
      choices = {
        { text = "What else does it carry?", next = "wind_far" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wind_far = {
      lines = { { id = "wf_default", text = "Smoke from the Barrens when the quilboar burn the thorns, salt from the coast when it blows from the west, and once, I swear, the smell of the forges in Orgrimmar. Tigor says I make half of it up, and he's half right." } },
      choices = {
        { text = "Could you teach me to listen?", next = "wind_listen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wind_listen = {
      lines = { { id = "wl_default", text = "Stand at the edge of the rise at dusk, close your eyes and don't think about anything you want. The wind only talks to people who aren't waiting for it, which is why Tigor hears it best and I hear it loudest." } },
      choices = {
        { text = "I'll try it tonight.", next = "BACK" },
        { text = "Farewell, Siln.", next = "END" },
      },
    },
    below_who = {
      lines = { { id = "bw_default", text = "Thurston Xane, mostly, because he's the only one who laughs at my questions kindly. Apothecary Zamah laughs too, though not kindly, and Archmage Shymm won't laugh at anything at all." } },
      choices = {
        { text = "What do you ask them?", next = "below_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    below_ask = {
      lines = { { id = "ba_default", text = "What it felt like to come back, whether they remember dying, and whether they hear the spirits at all. Thurston says the dead hear a great deal, but none of it is worth repeating, and I still can't tell if he was joking." } },
      choices = { { text = "Something else, Siln.", next = "BACK" } },
    },
    elders = {
      big = true,
      lines = { { id = "el_default", text = "Tigor makes you sit until your legs go numb and Beram makes you carve until your hands bleed, and somewhere in between you become a shaman. I'm the one who lets the students ask why, and they both say that's a mistake." } },
      choices = {
        { text = "Asking why is how anyone learns.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Students should listen before they question.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_lesson = {
      lines = { { id = "fl_default", text = "To thank the fire out loud, even when you feel silly doing it. Tigor teaches that with a long speech and I teach it with a burnt finger, and I think mine sticks better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fk_tell = {
      lines = { { id = "fk_default", text = "Would you? Only if you want to, and only as much as you want to. The spirits say death is a door that opens one way, and you came back through it, so I think you know something none of us do." } },
      choices = {
        { text = "It was quiet. I'd rather not say more.", next = "BACK" },
        { text = "Another time, perhaps.", next = "BACK" },
      },
    },
  },

  topics = {
    forsaken = { { id = "tp_fk", text = "They're Horde, and they're our neighbours under the rise, and I think they're lonelier than they let on." } },
    the_elements = { { id = "tp_el", text = "They're like people, really, except fire, which is like my cousins before breakfast." } },
    background = { { id = "tp_bg", text = "Skychaser, the youngest who teaches. I still carry water for Tigor when he asks." } },
    advice = { { id = "tp_ad", text = "Listen to the wind before a long journey. It'll tell you about the weather, at least." } },
    _none = { { id = "tp_none", text = "I don't know! But I'd like to, and the spirits like a curious heart. Tell me if you find out." } },
  },
}

---------------------------------------------------------------------------
-- The Forsaken mage trainers in the Pools of Vision.
---------------------------------------------------------------------------

-- Archmage Shymm: dry, superior, and certain that magic burns the untrained.
P:NPC {
  key = "shymm", id = TODO_NPC("Archmage Shymm"), name = "Archmage Shymm", title = "Mage Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "dry" }, values = { "proud", "careful" },
  notices = { "class", "arcane" },
  impression = {
    first = "He warns that magic burns the untrained, and rather hopes it does.",
    third = "{name} met Archmage Shymm, a Forsaken mage trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "o_kt_admire", when = { gossip = { topic = "kirin_tor", stance = "admire" } }, text = "Ursyn Ghull says you admire the Kirin Tor. They'd admire you right into a cell, if you were one of us, so think on that." },
    { id = "g_hi", text = "Mind the wards on the floor. They're not decorative, and I've no interest in scraping up another careless visitor." },
    { id = "g_back", when = { metBefore = true }, text = "Still unburned, I see. Your control must be improving, which is more than I expected of the living." },
  },

  notice = {
    { id = "n_troll", cat = "class", when = { class = "MAGE", race = "Troll" },
      text = "A troll mage. Your people learned the arcane from the elves of Quel'Thalas, I'm told, mostly by being on the wrong end of it." },
    { id = "n_arcane", cat = "arcane", when = { class = "MAGE" },
      text = "You reek of arcane residue. Wash your hands before you touch my books." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Archmage Shymm, and I teach the arcane to those of the Horde with the wit to learn it. Magic burns the untrained, so if you're not a mage, kindly step back from the wards before something catches." },
        { id = "h_tauren", when = { race = "Tauren", ["not"] = { class = "MAGE" } }, text = "A tauren, down here among the books. Your people don't take up the arcane, which is wise of them, so please don't start in my classroom." },
        { id = "h_tauren_mage", when = { race = "Tauren", class = "MAGE" }, text = "A tauren who has taken up the arcane, against all the good sense of your elders. I am Archmage Shymm, and since you're here, you may as well be taught properly." },
      },
      again = { { id = "h_again", text = "Something more? Do be brief; even the dead tire of amateurs." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why teach mages here, of all places?", next = "here" },
        { text = "I've heard magic can burn the untrained.", next = "burn" },
        { text = "Were you of the Kirin Tor?", next = "kirin" },
        { text = "How do you get along with Thurston Xane?", next = "thurston" },
        { text = "What's the most common mistake you see?", next = "mistake", when = { class = "MAGE" } },
        { text = "Do you miss being alive?", next = "fk_miss", when = { race = "Scourge" } },
        { text = "Tell me the road ahead, Archmage.", next = "m_road", when = { class = "MAGE" } },
        { text = "I'm a tauren mage. Your classroom will have to cope.", next = "m_tauren", when = { class = "MAGE", race = "Tauren" } },
        { text = "I'm an orc mage. Am I a fool too?", next = "m_orc", when = { class = "MAGE", race = "Orc" } },
        { text = "Farewell, Archmage.", next = "END" },
      },
    },
    m_road = {
      hub = true,
      lines = { { id = "mr_default", text = "Very well, the road, and I'll be brief about it, which is more than the road will be. Choose the stretch that worries you, and I'll tell you how most of my students failed on it." } },
      again = { { id = "mr_again", text = "Another stretch? Go on, then; I've nothing better to do until the next amateur arrives." } },
      choices = {
        { text = "Polymorph. Can it ever go wrong?", next = "m_poly", when = { minLevel = 8 } },
        { text = "Ice Block and the frost school. Is it the dead's art?", next = "m_frost", when = { minLevel = 20 } },
        { text = "Arcane Power. Is it worth the cost?", next = "m_ap", when = { minLevel = 40 } },
        { text = "Portals. Should I carry anyone who asks?", next = "m_portal", when = { minLevel = 40 } },
        { text = "Enough of the road, Archmage.", next = "BACK" },
      },
    },
    m_poly = {
      lines = { { id = "mp_default", text = "It goes wrong when you forget it's there. A careless mage sheeps a man, turns his back, sets the whole room alight with the sheep in it, and then wonders why the sheep is suddenly very cross." } },
      choices = {
        { text = "Discipline, then. I'll remember every sheep.", next = "m_road", reply = "Good. Remembering is most of the art, and the rest is not panicking.", fx = { align = { order = 1 } } },
        { text = "A cross sheep is a minor inconvenience.", next = "m_road", reply = "Until it stops being a sheep. Do try to keep up.", fx = { align = { order = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_frost = {
      lines = {
        { id = "mfr_default", text = "It suits us, I'll grant. The living freeze their own fingers learning it, while ours were cold already, so we learn faster and complain less, and a Forsaken in a block of ice is merely a Forsaken having a quiet moment." },
        { id = "mfr_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "You'll freeze your fingers learning it, as the living always do. Persist, because the cold teaches discipline, and your kind tends to arrive here without much of it." },
      },
      choices = { { text = "Back to the road.", next = "m_road" } },
    },
    m_ap = {
      big = true,
      lines = { { id = "map_default", text = "Worth it for the few breaths it lasts, and ruinous if you can't afford the mana it devours. It's the arcane's purest lesson: power always costs more than it seems to, and the bill comes due at once." } },
      choices = {
        { text = "Then I'll spend it only when it matters most.", next = "m_road", reply = "Correct, and rarer than you'd think. Most students spend it on the first boar they see.", fx = { align = { order = 1 } } },
        { text = "I'll spend it freely. Victory pays the bill.", next = "m_road", reply = "Victory pays nothing. Dalaran won a great many victories, and I'm teaching in a cave.", fx = { align = { order = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_portal = {
      lines = { { id = "mpo_default", text = "Certainly not. Carry the ones who'll be useful at the other end and let the rest walk; walking builds character, and most of the living could do with more." } },
      choices = {
        { text = "I'll carry anyone in need, useful or not.", next = "m_road", reply = "Admirable, and exhausting. Thurston will adore you, which I don't recommend.", fx = { align = { light = 1 } } },
        { text = "Only the useful ones. You're right.", next = "m_road", reply = "Of course I'm right. It's the only thing the grave didn't take from me.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_tauren = {
      big = true,
      lines = { { id = "mta_default", text = "Well, someone had to, I suppose, and better in my classroom than unsupervised on a mesa. Your hands are large and your patience is evidently larger, so if you can keep a fireball off the grass, I will teach you everything I know." } },
      choices = {
        { text = "I'll be the most careful student you've ever had.", next = "BACK", reply = "That would not be difficult. Do it anyway.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll learn your way, then find my own.", next = "BACK", reply = "Everyone says that. Very few find anything but scorch marks, but you may be the exception.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_orc = {
      big = true,
      lines = { { id = "mo_default", text = "A fool, no; a risk, certainly. Your people nearly died of reaching for power they didn't understand, and now you've reached again, so I shall watch your hands very closely, orc." } },
      choices = {
        { text = "Watch, then. You'll find nothing fel in them.", next = "BACK", reply = "I hope not. I'd rather be disappointed in my suspicions than proven right.", fx = { align = { honor = 1 } } },
        { text = "Watch all you like. I'll go my own way.", next = "BACK", reply = "That is exactly what the warlocks said, and I was there to hear some of them say it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    here = {
      lines = { { id = "h2_default", text = "Because the High Chieftain offered us a place when few others would, and the caves are quiet, and the tauren leave us alone. One could do worse, and in the Undercity one often does." } },
      choices = {
        { text = "You don't care for the Undercity?", next = "here_uc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    here_uc = {
      lines = { { id = "hu_default", text = "I care for it as one cares for a damp cellar with a throne in it. The Royal Apothecary Society bubbles away in its vats, the Dark Lady's court plots in corners, and nobody there has read a book for pleasure since the Plague." } },
      choices = {
        { text = "And the tauren are better company?", next = "here_tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    here_tauren = {
      lines = { { id = "ht_default", text = "The tauren have no arcane tradition to argue with mine, which makes them excellent neighbours. They bring bread we can't eat and keep their curious calves away from my wards, and I've known worse landlords in Lordaeron." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kirin = {
      lines = { { id = "kt_default", text = "I studied in Dalaran, which is all I'll say, and that was a long time and one death ago. Ursyn Ghull still pines for the place, while I find it simpler to remember that the Kirin Tor would burn us both on sight." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thurston = {
      lines = { { id = "tx_default", text = "He hums, and I have asked him not to, in writing, twice. He is a competent mage and an exhausting colleague, and the tauren adore him, which I find faintly insulting to us both." } },
      choices = {
        { text = "You're fond of him, really.", next = "thurston_fond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thurston_fond = {
      lines = { { id = "tf_default", text = "I am fond of silence, and he is its natural enemy. If something were to happen to him I would notice the quiet, and I suppose that is the nearest I come to sentiment." } },
      choices = { { text = "Something else, Archmage.", next = "BACK" } },
    },
    mistake = {
      lines = { { id = "mi_default", text = "Casting while frightened. Fear makes a frostbolt wobble and a fireball go wherever it likes, and I have the scorch marks on this ceiling to prove it." } },
      choices = { { text = "I'll keep my nerve.", next = "BACK" } },
    },
    fk_miss = {
      lines = { { id = "fm_default", text = "I miss very little, and it's none of your business which little it is. Sleep, perhaps, because it was the only time my colleagues stopped talking, and you'll find the dead are rarely sentimental unless they're Thurston." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    burn = {
      lines = { { id = "b_default", text = "Quite literally, on occasion. I knew apprentices in Lordaeron who reached too far and were carried out in buckets, and I've no wish to see it happen in a cave full of old scrolls." } },
      choices = {
        { text = "So power should be kept from the many.", next = "burn_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn_end = {
      big = true,
      lines = { { id = "be_default", text = "Power should be kept from fools, and most people are fools about magic. Dalaran believed that too, and look what became of Lordaeron while it was busy being careful." } },
      choices = {
        { text = "Then guard it closely. Fools burn kingdoms.", next = "BACK", reply = "At last, someone in this city with sense. Most of the living would hand a fireball to a child and call it fair.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Knowledge hoarded is knowledge wasted.", next = "BACK", reply = "A charming idea, if you enjoy watching villages burn. Lordaeron hoarded nothing in the end, and you see how well that turned out for all of us.", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    kirin_tor = { { id = "tp_kt", text = "They are careful wizards in violet robes, who let a kingdom rot while they debated the proper response." } },
    forsaken = { { id = "tp_fk", text = "We are what the Scourge left behind and the living refused, and we've done rather well with it." } },
    background = { { id = "tp_bg", text = "I studied the arcane in life and I study it still. The details are my own affair." } },
    advice = { { id = "tp_ad", text = "Never cast a spell you don't know how to stop." } },
    _none = { { id = "tp_none", text = "Not my field. Try a library, if you can read, and if the Scarlets haven't burned it." } },
  },
}

-- Ursyn Ghull: careful, studious, a little homesick for Dalaran.
P:NPC {
  key = "ursyn", id = TODO_NPC("Ursyn Ghull"), name = "Ursyn Ghull", title = "Mage Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "curious", "careful" },
  notices = { "origin" },
  impression = {
    first = "She speaks of Dalaran the way the living speak of childhood homes.",
    third = "{name} met Ursyn Ghull, a Forsaken mage trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "g_hi", text = "Ah, welcome. Please don't touch the notes, they're in an order." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. I've been rereading something you might find useful." },
  },

  notice = {
    { id = "n_dal", cat = "origin", when = { origin = "forsaken_dalaran_apprentice" },
      text = "You studied in Dalaran, didn't you, before? You hold your hands the way the Violet Citadel taught us." },
  },

  start = "hello",
  nodes = {
    op_kirin_tor = {
      lines = {
        { id = "opk_q", text = "Some of the Kirin Tor live yet, they say, picking at the ruins behind their barrier. Perhaps you've heard more of them than I have, so what do you make of the old council?" },
      },
      choices = {
        { text = "They're the finest mages in the world. You should be proud of them.", next = "op_kirin_tor_r1", fx = { affinity = 1, align = { order = 1 }, opinion = { kirin_tor = "admire" } } },
        { text = "They let Lordaeron fall while they argued in their towers.", next = "op_kirin_tor_r2", fx = { align = { order = -1 }, trait = { stern = 1 }, opinion = { kirin_tor = "wrong" } } },
        { text = "They'd burn every Forsaken mage on sight, Ursyn.", next = "op_kirin_tor_r3", fx = { opinion = { kirin_tor = "distrust" } }, when = { faction = "Horde" } },
        { text = "They trained Lady Jaina, and she's holding the peace together.", next = "op_kirin_tor_r4", fx = { affinity = 1, opinion = { kirin_tor = "respect" } }, when = { faction = "Alliance" } },
        { text = "I don't know enough about them to say.", next = "BACK" },
      },
    },
    op_kirin_tor_r1 = {
      lines = {
        { id = "op_kirin_tor_r1", text = "I was, once, and I find I still am in my less sensible moments. They never wrote back after I died, but I suppose that's understandable." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_kirin_tor_r2 = {
      lines = {
        { id = "op_kirin_tor_r2", text = "They argued, yes, and Kel'Thuzad was one of them before he wasn't, so you'll hear no defence from me. I only wish I'd argued louder." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_kirin_tor_r3 = {
      lines = {
        { id = "op_kirin_tor_r3", text = "Most of them would, and they'd file a very tidy report afterward. I've made my peace with being on the wrong side of their shelves." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_kirin_tor_r4 = {
      lines = {
        { id = "op_kirin_tor_r4", text = "Proudmoore was a bright student, they said, even then. I'm glad one of us came through with her conscience in one piece." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ursyn Ghull, and I teach the arcane here with Archmage Shymm and Thurston Xane. It's a quiet place to study, and the tauren bring us bread sometimes, which none of us can eat now but all of us remember the taste of." },
        { id = "h_notmage", when = { ["not"] = { class = "MAGE" } }, text = "You're not a mage, but you're welcome to sit. Most people who come down here are lost, and I don't mind the company." },
      },
      again = { { id = "h_again", text = "Something else? Take your time; the grave left me plenty of it." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Where did you study, before?", next = "dalaran" },
        { text = "I studied in Dalaran too, before.", next = "o_dal", when = { origin = "forsaken_dalaran_apprentice" } },
        { text = "What lies ahead for me as a mage, Ursyn?", next = "m_road", when = { class = "MAGE" } },
        { text = "I'm tauren, and I've chosen the arcane.", next = "m_tauren", when = { class = "MAGE", race = "Tauren" } },
        { text = "What do mages make of those who can't cast?", next = "m_others", when = { ["not"] = { class = "MAGE" } } },
        { text = "Farewell, Ursyn.", next = "END" },
      },
    },
    m_road = {
      hub = true,
      lines = {
        { id = "mr_default", text = "I keep a list of what every mage of the Horde should know by each mark on the road, written in a hand I'm rather proud of. Ask, and I'll read you the relevant page." },
        { id = "mr_marsh", when = { questActive = TODO_QUEST("Journey to the Marsh") }, text = "You're bound for Tabetha's hut in Dustwallow Marsh, I see. Take the road south out of the Barrens past Brackenwall, and keep your wards up, because the marsh is thick with mana and thicker with things that feed on it." },
      },
      again = {
        { id = "mr_again", text = "Another page? I've plenty, and they're all in order." },
        { id = "mr_again2", text = "Go on. I'd much rather read to someone than to the walls." },
      },
      choices = {
        { text = "Why should I go to Tabetha?", next = "m_tabetha", when = { minLevel = 24 } },
        { text = "Why is the rune to Thunder Bluff so slow to learn?", next = "m_tele", when = { minLevel = 20 } },
        { text = "Counterspell. When should I use it?", next = "m_counter", when = { minLevel = 24 } },
        { text = "Mana gems. Are they worth conjuring?", next = "m_gem", when = { minLevel = 28 } },
        { text = "I've learned nearly everything. What's left?", next = "m_sixty", when = { minLevel = 56 } },
        { text = "That's enough reading for now, Ursyn.", next = "BACK" },
      },
    },
    m_tabetha = {
      lines = {
        { id = "mtb_default", text = "Because she knows the marsh's mana better than any of us, and she's the nearest thing to a proper Kirin Tor tutor the Horde can send you to without starting a war. She left the towers long before the plague, I'm told, and she judges students on their spells and nothing else." },
        { id = "mtb_done", when = { questDone = TODO_QUEST("Journey to the Marsh") }, text = "You've been to her hut, then, and come back with all your fingers. She sends word of every student I send her, and she wrote that you would do, which from Tabetha is high praise indeed." },
      },
      choices = {
        { text = "She's human. Shouldn't I be wary of her?", next = "m_tabetha2" },
        { text = "Back to the list.", next = "m_road" },
      },
    },
    m_tabetha2 = {
      big = true,
      lines = { { id = "mtb2_default", text = "Wary, yes, as you should be of anyone with that much power living alone in a swamp. But she has taught Forsaken and orc and tauren alike and never once reported one of them to Theramore, and I've learned to value that above any banner." } },
      choices = {
        { text = "Then I'll trust her as she trusts us.", next = "m_road", reply = "Good. Trust is rare enough between the living and the dead that I'd hate to see it wasted.", fx = { align = { light = 1 } } },
        { text = "I'll learn from her and keep my wards up.", next = "m_road", reply = "Sensible, if a little sad. She'll notice, and she won't mind; she keeps hers up too.", fx = { align = { light = -1 } } },
        { text = "Back to the list.", next = "m_road" },
      },
    },
    m_tele = {
      lines = { { id = "mt_default", text = "Because the bluff is high and the winds never stop worrying at its anchor, so the spell takes more holding than the Undercity's or Orgrimmar's. You'll learn those two first and Thunder Bluff some seasons after, and by then you'll understand why we were so slow to teach it." } },
      choices = { { text = "Back to the list.", next = "m_road" } },
    },
    m_counter = {
      big = true,
      lines = { { id = "mco_default", text = "Whenever someone is about to finish a spell that would end you, which in the Barrens means the quilboar's geomancers and later, I'm sorry to say, the Kirin Tor themselves. It's an ugly spell, cutting a mage off mid-sentence, and I've never quite got used to it." } },
      choices = {
        { text = "I'd counter a Kirin Tor mage without a second thought.", next = "m_road", reply = "Many of us would. I only hope you'll have the second thought afterwards.", fx = { align = { light = -1 } } },
        { text = "I'd rather not fight them at all.", next = "m_road", reply = "Nor would I. But they won't ask what either of us would rather.", fx = { align = { light = 1 } } },
        { text = "Back to the list.", next = "m_road" },
      },
    },
    m_gem = {
      lines = { { id = "mg_default", text = "Very much, though Shymm calls them a crutch. A gem is mana set aside for the bad moment, the way a farmer sets aside grain, and I've never yet met a mage who regretted saving." } },
      choices = {
        { text = "Save for the bad moment. Always.", next = "m_road", reply = "Spoken like a student of Dalaran. They taught us to keep everything, and it was the one lesson that kept me alive.", fx = { align = { order = 1 } } },
        { text = "I'd rather spend it all and win now.", next = "m_road", reply = "Then you'll win most fights quickly and lose the last one slowly. Conjure a gem anyway.", fx = { align = { order = -1 } } },
        { text = "Back to the list.", next = "m_road" },
      },
    },
    m_sixty = {
      lines = { { id = "m60_default", text = "Arcane Brilliance, for one, which lends your wit to everyone around you, and that's the most generous spell I know. After that only the deep places are left to teach you, and I hope you'll write down what you find." } },
      choices = {
        { text = "I'll write it down and bring it back here.", next = "m_road", reply = "Then there'll be a page in my list with your name on it, which is the closest thing to a monument a scholar gets.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some things are better left unwritten.", next = "m_road", reply = "Perhaps. Kel'Thuzad wrote very little down, and that was the trouble.", fx = { align = { honor = -1 } } },
        { text = "Back to the list.", next = "m_road" },
      },
    },
    m_tauren = {
      big = true,
      lines = { { id = "mta_default", text = "Then you're one of very few, and I'm honoured you came to us rather than leaving the Bluff for Orgrimmar. Shymm will be rude to you and Thurston will be too kind, so let me simply ask: what did your elders say?" } },
      choices = {
        { text = "I'll show them the arcane can honor the land.", next = "BACK", reply = "Then you'll be teaching them something none of us could. I'd like to watch.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I don't need their blessing to cast.", next = "BACK", reply = "No, but you'll miss it, I think. I missed my father's when I went to Dalaran.", fx = { align = { light = -1 } } },
        { text = "They said the Earth Mother would understand.", next = "BACK", reply = "Then she's wiser than the Kirin Tor, which I'd always suspected of someone.", fx = { affinity = 1 } },
      },
    },
    m_others = {
      lines = { { id = "mot_default", text = "That they're the reason we're still standing, honestly. A mage alone lasts about as long as a candle in the wind, and every Forsaken mage in this cave owes his second life to a warrior or a hunter who stood in front of him." } },
      choices = {
        { text = "Then we'll keep standing in front of you.", next = "BACK", reply = "Thank you. I'll keep the frost off your back in return, which is the least I can do.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Mages should learn to stand alone.", next = "BACK", reply = "Some do, and they're very impressive right up until the second wolf arrives.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran = {
      lines = { { id = "d_default", text = "In Dalaran, long ago, before the plague, and before Archimonde's armies left the city in ruins. I still dream in its libraries, if the dead can be said to dream." } },
      choices = {
        { text = "What do you make of the Kirin Tor now?", next = "op_kirin_tor" },
        { text = "I'd guess you'd go back, if you could.", next = "dalaran_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_end = {
      big = true,
      lines = { { id = "de_default", text = "They'd never let me, and I'm not sure I'd want to see what it's become. The Dark Lady gave us something to do with our second lives, and I think I'd rather look forward than back." } },
      choices = {
        { text = "Look forward. The past is dead.", next = "BACK", reply = "That's my thinking, mostly, though it comes back to me on quiet nights. The Violet Citadel is gone to me either way, so I may as well study here.", fx = { align = { order = -1 } } },
        { text = "Remember the past. It made you.", next = "BACK", reply = "It did, and I suppose it made me rather good at mathematics. I'll remember it, then, but gently, the way you remember a house you can't go back to.", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    o_dal = {
      lines = { { id = "od_default", text = "Then we may have passed each other in the halls once, when we both had faces. It's a strange comfort, meeting someone who remembers the same corridors." } },
      choices = { { text = "It is. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a student of Dalaran before the plague, and now I teach in the Pools of Vision, which is quieter and has fewer committees." } },
    advice = { { id = "tp_ad", text = "Write everything down. Memory rots like everything else, especially after death." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. I'll make a note to find out, as I did in Dalaran, back when I had a heartbeat to hurry me." } },
  },
}

-- Thurston Xane: cheerfully morbid and fond of his tauren neighbors.
P:NPC {
  key = "thurston", id = TODO_NPC("Thurston Xane"), name = "Thurston Xane", title = "Mage Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "jovial" }, values = { "friendly", "curious" },
  notices = { "race" },
  impression = {
    first = "He seems to enjoy being dead more than most Forsaken.",
    third = "{name} met Thurston Xane, a cheerful Forsaken mage trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "g_hi", text = "Hello, hello! Come in, it's warmer down here than up on the rise, not that I'd know anymore." },
    { id = "g_back", when = { metBefore = true }, text = "There you are! I was just telling the walls about you." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren who isn't edging toward the exit! Please, sit down, your elders mostly look at me like I'm about to eat them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Thurston Xane, at your service, mage trainer and resident optimist of the Pools of Vision. Shymm thinks I'm too cheerful for a dead man, but I've noticed it doesn't make me any less dead to be gloomy about it." },
        { id = "h_notmage", when = { ["not"] = { class = "MAGE" } }, text = "Not a mage? Never mind, sit anyway. I don't get many visitors who aren't here to learn fireball." },
      },
      again = { { id = "h_again", text = "What else? I'm in no hurry. I'm in no hurry about anything anymore." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "How do the tauren treat you?", next = "tauren" },
        { text = "Why are you so cheerful?", next = "cheer" },
        { text = "What does Shymm make of you?", next = "shymm" },
        { text = "What do you teach first?", next = "lesson" },
        { text = "My elders are wary of your kind.", next = "tauren_wary", when = { race = "Tauren" } },
        { text = "Do you remember your life before?", next = "before", when = { race = "Scourge" } },
        { text = "Tell me the road ahead, Thurston.", next = "m_road", when = { class = "MAGE" } },
        { text = "I'm a tauren mage. Will my people ever accept it?", next = "m_tauren", when = { class = "MAGE", race = "Tauren" } },
        { text = "Darkspear magic and yours. Are they so different?", next = "m_troll", when = { class = "MAGE", race = "Troll" } },
        { text = "Farewell, Thurston.", next = "END" },
      },
    },
    m_road = {
      hub = true,
      lines = { { id = "mr_default", text = "The road! It's a lovely road, mostly downhill once you've got the hang of it. Pick a bit and I'll tell you the cheerful version, and Shymm can tell you the other one afterwards." } },
      again = {
        { id = "mr_again", text = "What else? I've got all the time in the world, and then some." },
        { id = "mr_again2", text = "Go on, go on! This is the most fun I've had since the flowers." },
      },
      choices = {
        { text = "My conjured bread tastes of nothing.", next = "m_food" },
        { text = "Polymorph. Do the sheep mind?", next = "m_poly", when = { minLevel = 8 } },
        { text = "I can step home now. Where's home for you?", next = "m_home", when = { minLevel = 20 } },
        { text = "Ursyn keeps sending people to Tabetha.", next = "m_tabetha", when = { minLevel = 26 } },
        { text = "I'm sixty. Is that the end of the road?", next = "m_sixty", when = { minLevel = 60 } },
        { text = "Enough of the road, Thurston.", next = "BACK" },
      },
    },
    m_food = {
      lines = { { id = "mfo_default", text = "Because you're thinking about the spell and not the bread! Think of the best loaf you ever ate, the crust and the steam of it, and it comes out a little better. Mine still taste of nothing to me, but the tauren tell me they're very good." } },
      choices = {
        { text = "I'll think of my mother's bread, then.", next = "m_road", reply = "Perfect. That's the whole secret, and Shymm will tell you it's nonsense.", fx = { affinity = 1 } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_poly = {
      lines = { { id = "mp_default", text = "I've often wondered, and I've decided they don't, because I asked one afterwards and he only shouted at me, which is what he'd been doing beforehand. A sheep hasn't a worry in the world for a whole minute, and I rather envy it." } },
      choices = {
        { text = "A minute of peace. That's a kindness.", next = "m_road", reply = "That's what I think! Shymm says I'm sentimental, but Shymm says that about everything.", fx = { align = { light = 1 } } },
        { text = "It's a trick, Thurston, not a kindness.", next = "m_road", reply = "Can't it be both? Most of the best things are.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_home = {
      lines = { { id = "mh_default", text = "Home? This cave, I suppose, and the bluff above it, and the calves who leave flowers. I learned the Undercity's rune first like everybody, and I've used it exactly twice, both times by accident." } },
      choices = {
        { text = "Home is the Undercity, under the Dark Lady.", next = "m_road", reply = "Oh, quite right, quite right, and do give her my regards; she won't remember me.", fx = { align = { order = 1 } } },
        { text = "Home is wherever I choose to be.", next = "m_road", reply = "That's the spirit! I chose a cave full of books and tauren, and I've never been happier, if that's the word.", fx = { align = { order = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_tabetha = {
      lines = { { id = "mtb_default", text = "Ursyn sends everyone to her, and they all come back a little sterner and with a nicer wand, so I'd say she's doing something right. Take her a joke from me, would you? I'm told nobody in that marsh has laughed in years." } },
      choices = { { text = "Back to the road.", next = "m_road" } },
    },
    m_sixty = {
      lines = { { id = "m60_default", text = "The end of the trainers, maybe, but not of the road! Go and see the places I never will, Dire Maul and Winterspring and the rest, and come back and tell me about the colours, because the dead remember colours very badly." } },
      choices = {
        { text = "I'll bring you back every colour I find.", next = "m_road", reply = "Oh, would you? I'll keep a page for them, next to the flowers.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll be too busy to come back.", next = "m_road", reply = "They all say that. Then they come back, because everyone comes back to a friend.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_tauren = {
      big = true,
      lines = { { id = "mta_default", text = "Accept it? They'll do better than that, eventually, and be proud of you, though it may take them twenty winters to say so. Your elders are slow, not unkind, and I've watched them come round to stranger things than a tauren with a spellbook, such as me." } },
      choices = {
        { text = "I'll be patient with them, as they were with me.", next = "BACK", reply = "That's the tauren way, and it'll work, I promise. It worked on me, and I'm much harder to love.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I won't wait twenty winters for their blessing.", next = "BACK", reply = "Then don't wait; just keep being yourself where they can see you. They'll catch up.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_troll = {
      lines = { { id = "mtr_default", text = "Different hats on the same head, I'd say, though your witch doctors would bite me for it. You lot ask the spirits and we ask the books, and the fire doesn't seem to care either way, which I find very fair-minded of it." } },
      choices = {
        { text = "The loa would like you, Thurston.", next = "BACK", reply = "Would they? Then tell them I'm very easy to get on with, and that I'm already dead, which saves time.", fx = { affinity = 1 } },
        { text = "The fire cares. You just can't hear it.", next = "BACK", reply = "Ooh. That's either very wise or very frightening, and I'll be thinking about it all evening." },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "Kindly, and nervously, which is a charming combination. A little calf left a bundle of flowers outside our cave last spring, and I've kept it in a jar ever since, though it's gone a bit brown." } },
      choices = {
        { text = "You really kept the flowers?", next = "flowers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flowers = {
      lines = { { id = "fw_default", text = "Of course I did, it was the first gift anyone gave me after I died. Her mother came to fetch her the next day looking terrified, so I waved, and she waved back, and that was the start of a lovely, nervous friendship." } },
      choices = {
        { text = "Do other tauren come down here?", next = "visitors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    visitors = {
      lines = { { id = "vi_default", text = "A few young shaman come to ask about the arcane, and Siln Skychaser comes to ask about death, which is a cheerier subject than you'd think. The elders never come, but they send bread, and I can't eat it, but I do appreciate the thought." } },
      choices = { { text = "Something else, Thurston.", next = "BACK" } },
    },
    shymm = {
      lines = { { id = "sh_default", text = "He thinks I'm a disgrace to the dead, and he may be right, but somebody has to be. Underneath all that frost he's a fine teacher, and I've caught him smiling twice since the Plague, which must be some sort of record." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lesson = {
      lines = { { id = "le2_default", text = "Conjured water, always, because a mage who can't make a drink is going to have a very short and thirsty career. Then a little fire, and a great deal of advice about not setting yourself on it." } },
      choices = {
        { text = "Magic is dangerous, though.", next = "lesson_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson_danger = {
      big = true,
      lines = { { id = "ld_default", text = "Terribly, which is half the fun! Shymm thinks only the clever few should learn, and I think everyone ought to learn a little, because the Scourge didn't stop to ask who was clever before it came." } },
      choices = {
        { text = "Teach anyone willing. The Scourge won't wait.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Shymm is right. Keep it to the careful few.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren_wary = {
      lines = { { id = "tw_default", text = "Very sensible of them, I'd be wary of me too! But Cairne gave us these caves when no one else would have us, and I'd sooner spend eternity earning your people's trust than wasting it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    before = {
      lines = { { id = "bf_default", text = "Bits and pieces, like a book with the pages torn out. A little house in Lordaeron with a crooked chimney, I think, and a cat that hated me, and if that's all I get to keep, I'll count myself lucky." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cheer = {
      lines = { { id = "c_default", text = "Because I woke up in a grave, my friend, and then I didn't stay in it. Everything since has been a pleasant surprise, even the smell." } },
      choices = {
        { text = "Something about it must trouble you.", next = "cheer_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cheer_end = {
      big = true,
      lines = { { id = "ce_default", text = "Oh, plenty, if I let it. Some of us went bitter and some of us went cold, and I decided to be kind, because it was the one thing the Scourge never made us do." } },
      choices = {
        { text = "Kindness is a good choice, Thurston.", next = "BACK", reply = "Thank you, that's kind of you to say, and I'll keep choosing it. It's a much nicer view from up here than from the bottom of a grave.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bitterness is more honest, I think.", next = "BACK", reply = "Oh, it's honest enough, but so is a corpse, and look how much fun those are. I'll take kindness, thank you, it suits my complexion.", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    cairne = { { id = "tp_ca", text = "The High Chieftain took in a cave full of corpses and asked nothing for it. I'd do almost anything for him, within reason and a little beyond." } },
    forsaken = { { id = "tp_fk", text = "We're a gloomy lot, mostly, so I'm doing my best to bring the average up." } },
    background = { { id = "tp_bg", text = "I was a mage before I died and I'm a mage after, and the middle bit I'd rather not discuss." } },
    advice = { { id = "tp_ad", text = "Keep a sense of humor. It's the last thing to rot." } },
    _none = { { id = "tp_none", text = "Haven't the faintest! Isn't that exciting?" } },
  },
}

---------------------------------------------------------------------------
-- The Forsaken priest trainers in the Pools of Vision.
---------------------------------------------------------------------------

-- Miles Welsh: teaches the shadow, calmly and without apology.
P:NPC {
  key = "miles_welsh", id = TODO_NPC("Miles Welsh"), name = "Miles Welsh", title = "Priest Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "devout", "careful" },
  notices = { "class" },
  impression = {
    first = "He speaks of the shadow as calmly as a farmer of rain.",
    third = "{name} met Miles Welsh, a Forsaken priest trainer of the Forgotten Shadow in the Pools of Vision.",
  },

  greetings = {
    { id = "g_hi", text = "Welcome. The shadows down here are restful, if you let them be, and far more honest than the Light ever was." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. The shadow suits you better than it did." },
  },

  notice = {
    { id = "n_troll", cat = "class", when = { class = "PRIEST", race = "Troll" },
      text = "A troll priest. I can teach you Shadowguard, which your people have always had a gift for. The loa and the shadow seem to get along." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Miles Welsh, of the Forgotten Shadow. I teach priests of the Horde what the Light never taught us, and what the shadow has offered in its place." },
        { id = "h_notpriest", when = { ["not"] = { class = "PRIEST" } }, text = "You are no priest, but the shadow doesn't mind. Sit, if you like, and be quiet." },
      },
      again = { { id = "h_again", text = "Something more? Speak softly here; the dead hear very well." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is the Forgotten Shadow?", next = "shadow" },
        { text = "Why did the Light abandon you?", next = "light" },
        { text = "Why teach here, among the tauren?", next = "here" },
        { text = "Where did you serve, before?", next = "past" },
        { text = "My loa grant Shadowguard. Is that your shadow?", next = "troll_loa", when = { race = "Troll", class = "PRIEST" } },
        { text = "Can a priest walk both the Light and the shadow?", next = "both", when = { class = "PRIEST" } },
        { text = "I don't believe in anything anymore.", next = "fk_doubt", when = { race = "Scourge" } },
        { text = "Farewell, Miles.", next = "END" },
      },
    },
    shadow = {
      lines = { { id = "s_default", text = "A faith for those the Light forgot, or turned away. We were priests in Lordaeron once, many of us, and when we woke we found the Light was silent, and something else was listening instead." } },
      choices = {
        { text = "What does a shadow priest learn?", next = "shadow_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_teach = {
      lines = { { id = "st_default", text = "Shadowguard to the trolls, and Touch of Weakness and Devouring Plague to my own kind. Each people takes its own gift from the dark, and I teach the one they were given." } },
      choices = {
        { text = "Does the shadow ask a price?", next = "shadow_cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_cost = {
      lines = { { id = "sc_default", text = "Everything does. The shadow asks that you look at what you are without flinching, which is harder than any fast or penance the Church ever set me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    here = {
      lines = { { id = "he_default", text = "We don't preach, we teach, and only those who come down to us. The tauren were kind enough to give us these caves, and the Earth Mother's people have their own faith, which I've no wish to take from them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    past = {
      lines = { { id = "pa_default", text = "I served the Church in a village of Lordaeron, and its name doesn't matter now. I blessed the grain the autumn before the Plague, and so I blessed the Plague as well, and I have had a long time to think about that." } },
      choices = {
        { text = "That wasn't your doing.", next = "past_fault" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_fault = {
      big = true,
      lines = { { id = "pf_default", text = "It was the Cult of the Damned's doing, and Kel'Thuzad's, and I know that. Knowing it helps less than you would think." } },
      choices = {
        { text = "Forgive yourself. You couldn't have known.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then carry it. Guilt keeps a priest honest.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll_loa = {
      lines = { { id = "tl_default", text = "Perhaps they are one darkness wearing different masks, and perhaps not. Your people prayed to the loa long before we turned to the shadow, so I would sooner learn from you than lecture you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    both = {
      lines = { { id = "bo_default", text = "Many in the Horde do, the trolls especially, and I don't scold them for it. I only ask that you never pretend the shadow is the Light in a cheaper coat." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fk_doubt = {
      lines = { { id = "fd_default", text = "That is a faith of its own, and a lonely one. Sit with it a while, because the Forgotten Shadow asks nothing of you but honesty, and you've already given that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "I asked it that, for a long time, on my knees in the ruins. It never answered, so I stopped asking and started listening to what did." } },
      choices = {
        { text = "Perhaps the Light is still there, waiting.", next = "light_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_end = {
      big = true,
      lines = { { id = "le_default", text = "Perhaps it is, for some of you. I've no quarrel with priests who still pray to it, but I'll not go back to a door that was closed on me." } },
      choices = {
        { text = "The Light forgives. Don't give up on it.", next = "BACK", reply = "For some, perhaps, and I wish them well of it. But it didn't forgive me when I woke in the dirt, and I've stopped knocking on that door.", fx = { align = { light = 1 } } },
        { text = "You're right. Use what answers you.", next = "BACK", reply = "You understand it, then, which is more than most of the living ever do. Power answers the one who calls it, and the shadow always answers.", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    holy_light = { { id = "tp_hl", text = "A door that closed on us. I don't curse it, but I don't knock either." } },
    scourge = { { id = "tp_sc", text = "They made us, and they would unmake us if they could. We remember both." } },
    background = { { id = "tp_bg", text = "A priest, before and after. The faith changed; the calling didn't." } },
    advice = { { id = "tp_ad", text = "The shadow takes as much as it gives. Keep count." } },
    _none = { { id = "tp_none", text = "I couldn't say. The shadow keeps its own counsel on that." } },
  },
}

-- Malakai Cross: zealous, sharp, and suspicious of the Light.
P:NPC {
  key = "malakai", id = TODO_NPC("Malakai Cross"), name = "Malakai Cross", title = "Priest Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "sharp" }, values = { "devout", "loyal" },
  notices = { "race" },
  impression = {
    first = "He holds the Light in contempt and the Dark Lady near worship.",
    third = "{name} met Malakai Cross, a fervent Forsaken priest trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "o_sc_pity", when = { gossip = { topic = "scarlet_crusade", stance = "pity" } }, text = "Father Cobb tells me you pity the Scarlet Crusade. Pity them when they're tying you to the stake, and see how long it lasts." },
    { id = "g_hi", text = "Another visitor. State your business, and don't waste my time; I've already lost one life to fools." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your devotion is noted." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of our own. Good. The Dark Lady has need of every voice that remembers what was done to us." },
  },

  start = "hello",
  nodes = {
    op_light = {
      lines = {
        { id = "opl_q", text = "Then tell me what it is, if you're so sure of it. What has the Light ever done for you, or for anyone in this cave?" },
      },
      choices = {
        { text = "It's a power like any other. The Crusade only abuses it.", next = "op_light_r1", fx = { align = { light = 1 }, opinion = { the_light = "useful" } } },
        { text = "It abandoned the dead. The Dark Lady never did.", next = "op_light_r2", fx = { affinity = 2, align = { light = -1 }, opinion = { the_light = "hate" } } },
        { text = "I still believe in it, priest, whatever the Crusade does.", next = "op_light_r3", fx = { affinity = -2, trait = { pious = 1 }, opinion = { the_light = "faith" } } },
        { text = "I carry the Light, Cross, and it hasn't burned me yet.", next = "op_light_r4", fx = { opinion = { the_light = "faith" } }, when = { class = "PALADIN" } },
        { text = "I'm not here to argue faith with you.", next = "BACK" },
      },
    },
    op_light_r1 = {
      lines = {
        { id = "op_light_r1", text = "A tool, then, and the Crusade is only holding it wrong. That's more sense than I usually hear, though you'll still never hear me pray to it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_light_r2 = {
      lines = {
        { id = "op_light_r2", text = "Now you're speaking like one of the Forgotten. Come back when you want to learn what shadow can do for someone who has stopped begging." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_light_r3 = {
      lines = {
        { id = "op_light_r3", text = "Father Cobb says the same thing, and he says it every morning, and the Light has yet to answer him. Believe what you like." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_light_r4 = {
      lines = {
        { id = "op_light_r4", text = "Yet, paladin, is the word I'd underline. When it does, come and find me, and we'll speak about something that doesn't flinch from you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Malakai Cross, and I teach priests here because the Dark Lady wished the Forsaken to have a presence among our allies. The tauren tolerate us, and that is enough." },
        { id = "h_notpriest", when = { ["not"] = { class = "PRIEST" } }, text = "You're no priest. Then you've no business here, unless you're lost, and I'm not a guide." },
      },
      again = { { id = "h_again_x", text = "Ask, then, if you have more to ask." }, { id = "h_again", text = "Well? What else? The Dark Lady's work doesn't wait on the curious." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why does the Dark Lady want you here?", next = "why" },
        { text = "What do you think of the Light?", next = "light" },
        { text = "How do the tauren treat you here?", next = "x_ta" },
        { text = "Do you remember your life before?", next = "x_life" },
        { text = "I'm a priest of the Light, Cross.", next = "x_pr", when = { class = "PRIEST" } },
        { text = "Farewell, Malakai.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because allies need watching as much as enemies, and the tauren are generous hosts. We teach, we listen, and we report what we hear, as any loyal citizen of the Undercity would." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "A comfortable faith for the living, and a cruel one for the dead. The Scarlet Crusade burns my people in its name, so I don't light candles to it." } },
      choices = {
        { text = "I see the Light differently, Malakai.", next = "op_light" },
        { text = "The Crusade isn't the Light.", next = "light_end", fx = { learn = { "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    light_end = {
      big = true,
      lines = { { id = "le_default", text = "They'd say it is, and the Light doesn't argue with them. When it starts striking down the zealots who use it, I'll reconsider." } },
      choices = {
        { text = "The Light is more than its worst followers.", next = "BACK", reply = "Than its followers? Then where has it been hiding while they burned our villages? Show me that Light, and I'll gladly bow to it.", fx = { align = { light = 1 } } },
        { text = "A faith is judged by those who carry it.", next = "BACK", reply = "Exactly, and you can see what the Scarlet Crusade carries. A faith is a tool in a hand, and too many of those hands are covered in blood.", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "Politely, and from a careful distance. The tauren are a kind people, and kindness is harder to bear than scorn when it keeps one's eyes so carefully averted. The druids, at least, do not pretend we are anything but dead." },
      },
      choices = {
        { text = "Do they fear you?", next = "x_ta2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_ta2 = {
      lines = {
        { id = "xt2", text = "Some do, and some pity us, which is worse. The Grimtotem would see us thrown from the cliffs, and Cairne keeps us here as a promise to Thrall. I do not ask whether he likes the promise." },
      },
      choices = {
        { text = "Do you like being here?", next = "x_ta3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_ta3 = {
      lines = {
        { id = "xt3", text = "I like the quiet of the Pools of Vision and the absence of paladins. That is the best I can say of any place, now, and I mean it as praise." },
      },
      choices = {
        { text = "High praise, then. Something else.", next = "BACK" },
      },
    },
    x_life = {
      lines = {
        { id = "xl1", text = "I remember my name and my faith, and I remember both of them failing me when the plague came. Beyond that, I find the memories of a living man less useful than I once thought they would be." },
      },
      choices = {
        { text = "A bitter memory. Something else.", next = "BACK" },
      },
    },
    x_pr = {
      lines = {
        { id = "xp1", text = "Then you have chosen the Light, and I have chosen the shadow, and we will both heal a wounded Horde soldier just as well. I will not argue with your faith unless you start preaching it." },
      },
      choices = {
        { text = "A fair truce. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    sylvanas = { { id = "tp_syl", text = "The Dark Lady freed us from the Lich King's chains. Whatever else I believe, I believe that much." } },
    background = { { id = "tp_bg", text = "I serve the Dark Lady. That's all the story I need." } },
    advice = { { id = "tp_ad", text = "Trust no faith that has ever tried to burn you." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't care to. Ask a living fool; they have opinions on everything." } },
  },
}

-- Father Cobb: once a village priest in Lordaeron, wistful and gentle.
P:NPC {
  key = "cobb", id = TODO_NPC("Father Cobb"), name = "Father Cobb", title = "Priest Trainer",
  bible = "bibles/spirit_trainers.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm" }, values = { "kind", "patient" },
  notices = { "class" },
  impression = {
    first = "He seems to miss his old parish more than his old life.",
    third = "{name} met Father Cobb, a gentle Forsaken priest trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "o_light_hate", when = { gossip = { topic = "the_light", stance = "hate" } }, text = "Malakai Cross says you've turned your back on the Light. I'll not lecture you, child, but the chapel door is always open, even down here." },
    { id = "g_hi", text = "Come in, child, come in. Mind the step, it's slippery, and I've no longer the hands to catch anyone." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, child. How have you been keeping? I ask everyone, though I've stopped expecting good answers." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Scourge" },
      text = "A priest of our people. I wonder sometimes whether we'd have known each other's parishes, before." },
  },

  start = "hello",
  nodes = {
    op_scarlet = {
      lines = {
        { id = "opsc_q", text = "There were Scarlets in Tirisfal when I woke, and they burned what they found of my old flock. You may have crossed paths with them yourself, so tell me, what do you make of the Scarlet Crusade?" },
      },
      choices = {
        { text = "They're butchers in the Light's colours, Father, and they must be stopped.", next = "op_scarlet_r1", fx = { affinity = 1, align = { light = 1 }, opinion = { scarlet_crusade = "hate" } } },
        { text = "They fear the plague. I can't blame them for that.", next = "op_scarlet_r2", fx = { align = { light = -1 }, opinion = { scarlet_crusade = "pity" } } },
        { text = "They burned my people, Father. I'll return the favour.", next = "op_scarlet_r3", fx = { trait = { fierce = 1 }, opinion = { scarlet_crusade = "war" } }, when = { race = "Scourge" } },
        { text = "Their cause was just, Father, before it rotted.", next = "op_scarlet_r4", fx = { trait = { curious = 1 }, opinion = { scarlet_crusade = "mixed" } } },
        { text = "I'd rather not speak of them, Father.", next = "BACK" },
      },
    },
    op_scarlet_r1 = {
      lines = {
        { id = "op_scarlet_r1", text = "Stopped, yes, though I pray for them all the same, because once they were village boys like mine. Go carefully if you go north." },
      },
      choices = {
        { text = "Something else, Father.", next = "BACK" },
      },
    },
    op_scarlet_r2 = {
      lines = {
        { id = "op_scarlet_r2", text = "No, I suppose you can't, and I could not either, once. Fear is a terrible shepherd, child, and it led them a long way from their chapels." },
      },
      choices = {
        { text = "Something else, Father.", next = "BACK" },
      },
    },
    op_scarlet_r3 = {
      lines = {
        { id = "op_scarlet_r3", text = "I understand it, child, though I'll not bless it. Come back with your soul still your own, and we'll call that a victory." },
      },
      choices = {
        { text = "Something else, Father.", next = "BACK" },
      },
    },
    op_scarlet_r4 = {
      lines = {
        { id = "op_scarlet_r4", text = "It was, I think, at the very start, and that's the saddest part of it. Every good cause has a first bad day, and theirs came early." },
      },
      choices = {
        { text = "Something else, Father.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Father Cobb, and I keep the priests' lessons here with Miles and Malakai. I had a little parish in Lordaeron once, before the plague came through, and I suppose I still think of my students as a congregation." },
        { id = "h_notpriest", when = { ["not"] = { class = "PRIEST" } }, text = "You're not a priest, but that's no matter. Everyone needs a quiet word now and then, and I've plenty to spare." },
      },
      again = { { id = "h_again_x", text = "Go on, child. I'm listening, as well as I'm able." }, { id = "h_again", text = "Anything more, child? I've nowhere else to be, and no one left in Lordaeron waiting for me." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Tell me about your parish.", next = "parish" },
        { text = "You must still pray, Father.", next = "pray" },
        { text = "How did you come to Thunder Bluff?", next = "x_how" },
        { text = "What do the tauren make of you?", next = "x_ta" },
        { text = "I'm tauren, Father. Are you comfortable here?", next = "x_tt", when = { race = "Tauren" } },
        { text = "Farewell, Father.", next = "END" },
      },
    },
    parish = {
      lines = { { id = "p_default", text = "A small village in the north, with a chapel and a well and the same faces every Sunday. Most of them came back with me, after a fashion, and most of them don't remember the hymns." } },
      choices = {
        { text = "Did the Scarlet Crusade reach your village?", next = "op_scarlet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = { { id = "pr_default", text = "Every morning, though I'm not always sure to whom. Miles says the shadow listens, and Malakai says the Dark Lady does, and I keep praying in case someone kinder is listening too." } },
      choices = {
        { text = "Someone kinder may be.", next = "pray_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray_end = {
      big = true,
      lines = { { id = "pe_default", text = "I like to think so, child. The tauren pray to their Earth Mother up above us, and she seems a gentle sort, so perhaps there's room for an old priest to hope." } },
      choices = {
        { text = "Keep hoping, Father. It's worth it.", next = "BACK", reply = "Bless you, child, I think I will. It's an old habit, and I'd rather keep that one than any of the others I brought back.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hope is a luxury for the living.", next = "BACK", reply = "Perhaps it is, and I've heard it said in the caves more than once. But I was a priest before I was dead, and hope is the one thing I refused to bury.", fx = { align = { light = -1 } } },
      },
    },
    x_how = {
      lines = {
        { id = "xh1", text = "On a zeppelin from Orgrimmar, which I'm told is how most dead men travel these days. The Dark Lady sent three of us to teach priests among her allies, and I asked for the quietest place she had." },
      },
      choices = {
        { text = "Was it quiet?", next = "x_how2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how2 = {
      lines = {
        { id = "xh2", text = "Quieter than Undercity, and with better air, though the wind on these bridges will carry off a dead man's hat if he lets it. I have lost two, and I am told one landed in a kodo's water trough." },
      },
      choices = {
        { text = "Do you miss Lordaeron?", next = "x_how3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_how3 = {
      lines = {
        { id = "xh3", text = "I miss the chapel bells and the smell of bread on a feast morning. I don't miss the Scourge or the Crusade, and I don't miss being afraid of either. That's something, I suppose." },
      },
      choices = {
        { text = "It is something. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "They're patient with me, which I appreciate. A few of the young ones still stare, but the elders nod when I pass, and one shaman brings me tea, though I can't taste it. I drink it anyway." },
      },
      choices = {
        { text = "That's kind of you both. Something else.", next = "BACK" },
      },
    },
    x_tt = {
      lines = {
        { id = "xtt", text = "More than I deserve, child. Your people's Earth Mother has been gentle with a dead man from far away, and I pray she knows I'm grateful, though I don't know what prayers she hears." },
      },
      choices = {
        { text = "She hears them, Father. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    scourge = { { id = "tp_sc", text = "The Scourge took my parish and my life. I won't speak of them more than I must, child." } },
    background = { { id = "tp_bg", text = "A village priest, once. A teacher in a cave, now. It's not so different as you'd think." } },
    advice = { { id = "tp_ad", text = "Be gentle with the frightened, child. Fear makes people cruel." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, child. Perhaps ask someone who gets out more, or someone still breathing." } },
  },
}

---------------------------------------------------------------------------
-- Alodan the Hopeful: a Forsaken paladin trainer in the Pools of Vision (a Forever change). He
-- keeps to the Light though it burns him, and calls every visitor back to it. Gevreka, a quiet
-- tauren of Spirit Rise, follows below.
---------------------------------------------------------------------------
P:NPC {
  key = "alodan", id = TODO_NPC("Alodan the Hopeful"), name = "Alodan the Hopeful", title = "Paladin Trainer",
  gender = "male", race = "Scourge", role = "trainer", tier = "quest",
  communities = { "thunder_bluff", "undercity" }, temper = { "calm" }, values = { "devout", "hopeful" },
  notices = { "class", "race" },
  impression = {
    first = "A Forsaken in plain plate, standing a little apart from the mages, with a faint golden haze about his hands that seems to cost him something.",
    third = "{name} met Alodan the Hopeful, a Forsaken who still trains paladins of the Light in the Pools of Vision beneath Thunder Bluff.",
  },

  greetings = {
    { id = "g_default", text = "Welcome back to the Light, friend. Whatever brought you down these steps, you are welcome at my side." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "Welcome back to the Light, {class}. Do you require training, or only a moment's quiet among those who understand?" },
    { id = "g_other", when = { ["not"] = { class = "PALADIN" } }, text = "You may not be a paladin, but you may yet find solace in the Light, should you seek it." },
    { id = "g_away", when = { away = 14 }, text = "{away} since you came down to the pools. I prayed you would come back, and here you are, which I take as a small kindness from the Light." },
  },

  notice = {
    { id = "n_scourge_pal", cat = "race", when = { race = "Scourge", class = "PALADIN" },
      text = "It burns you too, doesn't it? I can see it in how you hold your hands. Good; it means you are still trying." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "One of the priests from the pool beside mine. We drink from the same well, you and I, though they ask fewer questions of you upstairs." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Alodan, and I teach the ways of the Light to those the Horde sends me. The tauren gave me this corner of the Pools of Vision, and I have tried to repay them by being no trouble at all." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A child of the Earth Mother come to see the dead man who prays. I don't blame you for staring; I would stare too, if I still had the eyes I was born with." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "One of our own. Most of the Forsaken who come down here are looking for the mages, and they walk past me as if I were a ghost, which, I suppose, I nearly am." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I have time; that is the one thing the grave gave me plenty of." },
        { id = "h_again2", text = "Ask, friend. The Light has never minded questions, only the lack of them." },
      },
      choices = {
        { text = "How does one of the Forsaken still wield the Light?", next = "light" },
        { text = "Why do they call you the Hopeful?", next = "hope" },
        { text = "Why train here, and not in the Undercity?", next = "here" },
        { text = "You look like it hurts you, Alodan.", next = "pain" },
        { text = "Who were you, before you died?", next = "before" },
        { text = "What do you teach those who come to you?", next = "teach" },
        { text = "What of the Scarlet Crusade?", next = "scarlet" },
        { text = "The Dark Lady has no use for the Light.", next = "lady" },
        { text = "I walk the Light too. Any counsel?", next = "counsel", when = { class = "PALADIN" } },
        { text = "I'm a shaman. We heal without your Light.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Teach me, Alodan.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Light keep you.", next = "END" },
      },
    },
    light = {
      lines = { { id = "l_default", text = "Not easily, and not without cost. When I woke in the grave I was certain the Light had turned its back on me, so I turned mine on it for a long while, until I learned it had only been waiting for me to ask again." } },
      choices = {
        { text = "And it simply answered?", next = "light2" },
        { text = "The Light abandoned Lordaeron. Why trust it now?", next = "light2" },
      },
    },
    light2 = {
      big = true,
      lines = { { id = "l2_default", text = "It answered the way a cold hearth answers a single spark, slowly and painfully. Every blessing I call down burns my own flesh, and I have decided the burning is a kind of honesty: the Light does not pretend I am what I was, and neither do I." } },
      choices = {
        { text = "Faith that endures pain is the truest kind.", next = "BACK", reply = "That is the hope I live on, friend. If the Light can still find a use for me, there is very little in this world it would give up on.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pain for a god that left you? That's no faith.", next = "BACK", reply = "Many of my people would say the same, and loudly. I only ask that you watch what I do with it, and judge me by that rather than by what I am.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hope = {
      lines = { { id = "ho_default", text = "Because I am the only one in the Pools of Vision who still expects things to get better, I think, and the others found it amusing. I kept the name because it is the best thing anyone has called me since I died." } },
      choices = {
        { text = "Hope seems a strange thing for the Forsaken.", next = "hope2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hope2 = {
      lines = { { id = "ho2_default", text = "It is rare, and the Dark Lady does not preach it, I'll grant you. But we were men and women of Lordaeron once, and Lordaeron had paladins in every village, so some of us remember how it felt to hope and would like to feel it again." } },
      choices = {
        { text = "The Forsaken should look forward, not back to Lordaeron.", next = "BACK", reply = "Forward is where I am looking, friend. I only carry with me the parts of the old kingdom that deserve to be carried.", fx = { align = { order = -1 } } },
        { text = "Then keep the old ways alive. Someone must.", next = "BACK", reply = "Someone must, and I would rather it were a paladin than a ghost on a battlement. Thank you for saying so.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    here = {
      lines = { { id = "he_default", text = "The Undercity has no shortage of my brothers and sisters who would like to see my kind put back in the ground, and the Scarlet Crusade would like it even more. The tauren pray to the sun, and they understood what I was asking for better than my own people did." } },
      choices = {
        { text = "The tauren don't mind a dead man praying in their bluff?", next = "here2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    here2 = {
      lines = { { id = "he2_default", text = "Some mind, and they walk the long way round the stair. But Cairne Bloodhoof let our people into these pools when no one else would, and the Sun Priests speak to me kindly about An'she, whom I think the Light and I have both met under another name." } },
      choices = {
        { text = "You think An'she and the Light are the same?", next = "BACK", reply = "I think the sun does not ask what you are before it warms you. Ask Eylah Sunhorn on the rise above, if you want a wiser answer than mine.", fx = { learn = { "an_she" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pain = {
      lines = {
        { id = "p_default", text = "It does, every time, and I have stopped hiding it. A paladin who pretends his burdens weigh nothing teaches his students to lie, and I would rather teach them to carry things." },
        { id = "p_scourge", when = { race = "Scourge" }, text = "It does, and if you walk this path it will hurt you too. I won't pretend otherwise, but I will tell you the pain grows quieter as the will grows louder." },
      },
      choices = {
        { text = "Then why not stop?", next = "BACK", reply = "Because I stopped once already, in a cold grave in Lordaeron, and I did not care for who I was then." },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "bf_default", text = "A knight of a small chapel near Andorhal, sworn to keep the roads safe for farmers and pilgrims. When the plague grain came, I helped hand it out, because I was told it was a gift, and I have carried that with me past my own grave." } },
      choices = {
        { text = "You couldn't have known.", next = "before2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before2 = {
      big = true,
      lines = { { id = "bf2_default", text = "No, but I could have asked, and I didn't. The Light does not ask me to forgive myself, friend, only to do better with what I have left. Some of my brothers in the Undercity would say guilt is a living man's luxury, and the dead should shed it." } },
      choices = {
        { text = "Carry it. Guilt keeps a paladin honest.", next = "BACK", reply = "It does, and it keeps him humble, which is harder. Thank you for not pretending it away.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shed it. Lordaeron is gone and guilt won't bring it back.", next = "BACK", reply = "You sound like the apothecaries, and perhaps you are wiser than I am. I find I cannot put it down all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach = {
      lines = {
        { id = "tc_default", text = "Whatever the Light will grant them, which is never what they expect. The young ones want hammers and fire, and I give them patience and bandages first, because a paladin who cannot mend has no business breaking anything." },
        { id = "tc_paladin", when = { class = "PALADIN" }, text = "You know the answer already: whatever the Light will grant you, and never what you expect. I teach the blows last and the mending first, as I hope your first teacher did." },
      },
      choices = {
        { text = "Who are your students?", next = "teach2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach2 = {
      lines = { { id = "tc2_default", text = "Whoever the Horde sends, and a few who come on their own and stand at the bottom of the stairs a long while first. The mages beside me think I'm wasting my hours, and Eylah Sunhorn above thinks I'm doing something holy, and I suspect the truth is somewhere in the middle." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    scarlet = {
      lines = { { id = "sc_default", text = "They were my brothers once, some of them, in the same chapels and under the same banners. Now they hold the monastery in Tirisfal and burn anything that has died, and they would burn me first and slowest for daring to pray." } },
      choices = {
        { text = "They should be destroyed, every one.", next = "BACK", reply = "I will not stop you, and I will not cheer you either. I only ask that you do it cleanly, which is more than they would do for you.", fx = { align = { honor = -1 }, learn = { "scarlet_crusade" } } },
        { text = "Some of them might yet be turned from it.", next = "BACK", reply = "That is the hope I keep for them, and you are the first in a long while to say it back to me.", fx = { affinity = 1, align = { honor = 1 }, learn = { "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lady = {
      lines = { { id = "la_default", text = "She has no use for it, and she has never forbidden it either. The Dark Lady freed my will, and I have chosen to spend it on the Light. If that is a strange gift to make of freedom, it is still mine to make." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "sylvanas" } } } },
    },
    counsel = {
      lines = {
        { id = "co_default", text = "Pray when it is easy, so you remember how when it is hard. And never call on the Light to prove you are righteous; call on it to help someone who isn't you." },
        { id = "co_scourge", when = { race = "Scourge" }, text = "Pray when it is easy, though for us it is never easy. Let the burning teach you, not stop you, and never call on the Light to prove you are righteous, only to help someone else." },
      },
      choices = { { text = "I'll remember. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "You do, and beautifully; I have watched the tauren shaman close wounds with water and earth that I could not close with prayer. I do not think the Light is the only answer, friend. I only think it is mine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a paladin in Lordaeron, then I was dead, and now I am a paladin again, though the second time has been much harder than the first." } },
    advice = { { id = "tp_ad", text = "Whatever you are, ask the Light for help anyway. The worst it can do is refuse, and in my experience it rarely does." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They wear the Light like a butcher's apron, and they would burn me for daring to touch it. I pray for them, which they would find far more insulting than any sword." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady gave us back our wills, and for that I owe her my loyalty. She has not asked for my prayers, but she has them all the same." } },
    _none = { { id = "tp_none", text = "I don't know, friend, and I won't pretend to. Ask the mages beside me; they pretend to know everything." } },
  },
}

---------------------------------------------------------------------------
-- Gevreka: a quiet tauren of Spirit Rise. Light entry.
---------------------------------------------------------------------------
P:NPC {
  key = "gevreka", id = TODO_NPC("Gevreka"), name = "Gevreka", gender = "male",
  role = "citizen", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "devout" },
  notices = { "class", "race" },
  impression = {
    first = "A broad tauren who stands near the edge of Spirit Rise, looking out at the plains as if he were waiting for someone in particular.",
    third = "{name} spoke with Gevreka on Spirit Rise.",
  },
  greetings = {
    { id = "g_default", text = "Peace, {class}. Spirit Rise is a quiet place, and I try to keep it so." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Mu'sha is bright tonight. On nights like this the spirits come close to the rise, and I like to be here when they do." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to the rise. The wind is gentle today; stand with me a while." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Forgive me if I stare; I have always wondered what the spirits sound like to those who can truly hear them." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken, on Spirit Rise. The spirits here are restful ones, friend; I hope they are kind to you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I come up to Spirit Rise most days to sit near the shaman and listen to the wind. The Skychasers do the real work of speaking with the spirits, but someone ought to listen when they are finished." },
      },
      again = {
        { id = "h_again", text = "Something more? The wind is in no hurry, so neither am I." },
        { id = "h_again2", text = "Ask what you like. The rise is good for slow questions." },
      },
      choices = {
        { text = "What do you hear in the wind?", next = "wind" },
        { text = "It's a long way down from here.", next = "view" },
        { text = "Who are you waiting for?", next = "waiting" },
        { text = "Tell me about the Skychasers.", next = "skychasers" },
        { text = "You never wished to be a shaman yourself?", next = "shaman" },
        { text = "What lies in the Pools of Vision below?", next = "pools" },
        { text = "Do the spirits speak to you, then?", next = "spirits_sham", when = { class = "SHAMAN" } },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    wind = {
      lines = { { id = "w_default", text = "Mostly the herds on the Golden Plains, and the rain coming in over the Red Rocks a day before it arrives. Some days I think I hear my grandfather, though the shaman tell me that is only wishing." } },
      choices = {
        { text = "The ancestors are always near. Trust what you hear.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The shaman are right. The dead should rest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    view = {
      lines = { { id = "v_default", text = "It is, and that is why I like it. From up here Mulgore looks the way the Earth Mother must see it, small and green and worth keeping." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    waiting = {
      lines = { { id = "wa_default", text = "You see a great deal, friend. My brother went south with a caravan to Camp Taurajo two winters ago and did not come back, and no one found him. I look south because it is the way he went." } },
      choices = {
        { text = "What happened to him?", next = "waiting2" },
        { text = "I'm sorry. Something else.", next = "BACK" },
      },
    },
    waiting2 = {
      big = true,
      lines = { { id = "wa2_default", text = "Centaur, most likely, or the Barrens heat, and the braves say I should burn the incense for him and let him go. But a body was never found, and some part of me will not stop looking. Tell me, would you keep hoping, or let him go?" } },
      choices = {
        { text = "Let him go, and honor him. The living need you.", next = "BACK", reply = "That is what my mother says, and the Skychasers, and now you. Perhaps the wind is trying to tell me the same thing.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep looking. Until there's a body, there's a chance.", next = "BACK", reply = "You may be the only one on this bluff who would say so. I will keep looking south a while longer, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skychasers = {
      lines = { { id = "sc_default", text = "The shaman of Spirit Rise, who listen to the elements and the ancestors on behalf of the tribes. Some go out to the Barrens and the Stonetalon peaks to test themselves against the spirits there, and they come back changed, older in the eyes." } },
      choices = {
        { text = "Do they ever speak with the dead?", next = "sky2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky2 = {
      lines = { { id = "sk2_default", text = "With the ancestors, sometimes, and they are careful about it, because the dead have their own road to walk. They told me they could not find my brother among the spirits, and I don't know whether that is good news or bad." } },
      choices = { { text = "Perhaps it means he's still alive. Something else.", next = "BACK" } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Once, as a calf, I begged the elders to test me. The spirits did not answer, and I was angry for a whole season, until I learned that someone has to carry water to the ones who listen." } },
      choices = {
        { text = "That's a humble way to see it.", next = "BACK", reply = "It is only the true way, friend. A herd needs every kind of tauren." },
        { text = "Something else.", next = "BACK" },
      },
    },
    pools = {
      lines = { { id = "po_default", text = "The Pools of Vision, where the Forsaken mages work, and the one called Alodan who still prays to his Light. Some of my people would rather the dead were not under our feet, but Cairne said they were welcome, and so they are." } },
      choices = {
        { text = "Cairne was right to welcome them.", next = "BACK", reply = "I believe so. Alodan once told me he hears a voice in his Light the way I hear one in the wind, and I could not think how to argue.", fx = { align = { order = 1 } } },
        { text = "I wouldn't trust the dead so close.", next = "BACK", reply = "Many agree with you, friend. I only know that none of them has ever done me harm.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_sham = {
      lines = { { id = "ss_default", text = "Not to me, never to me. But you can hear them, can't you? If you ever hear a young bull's voice on the south wind asking for his brother, tell him Gevreka is still waiting on the rise." } },
      choices = {
        { text = "I will listen for him.", next = "BACK", reply = "Thank you. That is more than I had this morning.", fx = { affinity = 2 } },
        { text = "The spirits don't work that way.", next = "BACK", reply = "No, I suppose not. Forgive an old fool for asking." },
      },
    },
  },
  topics = {
    advice = { { id = "tp_ad", text = "Listen first. Speak after, if you still need to." } },
    cairne = { { id = "tp_cairne", text = "He let the dead into our city and kept the living safe besides. I trust his judgment over my own." } },
    _none = { { id = "tp_none", text = "That I could not tell you, friend. The Skychasers know more than I do about nearly everything." } },
  },
}
