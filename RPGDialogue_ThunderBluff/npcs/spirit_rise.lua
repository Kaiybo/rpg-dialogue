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
    first = "Tigor Skychaser teaches shaman on Spirit Rise with long silences and very little praise. He talks about the elements as old neighbors who must be asked politely.",
    third = "{name} met Tigor Skychaser, the eldest of the Skychaser shaman trainers on Spirit Rise.",
  },

  greetings = {
    { id = "g_hi", text = "The spirits are restless this morning, and the wind has a sharp tongue. Speak gently." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The spirits remember you, which is more than I can say for most." },
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
        { text = "Never. The spirits must be asked.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "In great need, I'd compel them.", next = "BACK", fx = { align = { order = -1 } } },
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
    background = { { id = "tp_bg", text = "Skychaser. Shaman. Old enough that the spirits call me by name." } },
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
    first = "Beram Skychaser trains shaman on Spirit Rise and carves totems while he talks. He is more interested in what works in the field than in what the elders say about it.",
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
        { text = "Reverence comes first. Tactics follow.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Use what works. The spirits will understand.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
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
    first = "Siln Skychaser is the youngest of the shaman trainers on Spirit Rise, and the only one who goes down into the Pools of Vision to talk with the Forsaken. The older Skychasers seem to find this worrying.",
    third = "{name} met Siln Skychaser, a young shaman trainer on Spirit Rise.",
  },

  greetings = {
    { id = "o_fk_trust", when = { gossip = { topic = "forsaken", stance = "trust" } }, text = "Bena says you count the Forsaken as Horde like any of us. The spirits below the rise would be glad of more like you, I think." },
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
        { text = "You must visit the Forsaken below.", next = "below" },
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
        { text = "The spirits are wise. Let the Forsaken stay.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Tigor's right. The dead don't belong there.", next = "BACK", fx = { align = { light = -1 } } },
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
    first = "Archmage Shymm teaches mages in the caves beneath Spirit Rise, a Forsaken with a dry voice and a low opinion of amateurs. He warns everyone that magic will burn the untrained, and seems to rather hope it does.",
    third = "{name} met Archmage Shymm, a Forsaken mage trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "o_kt_admire", when = { gossip = { topic = "kirin_tor", stance = "admire" } }, text = "Ghull says you admire the Kirin Tor. They'd admire you right into a cell in the Violet Hold, if you were dead, so think on that." },
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
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren, down here among the books. Your people don't take up the arcane, which is wise of them, and I'd rather you didn't start in my classroom." },
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
        { text = "Farewell, Archmage.", next = "END" },
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
      lines = { { id = "tx_default", text = "He hums. I have asked him not to, in writing, twice. He is a competent mage and an exhausting colleague, and the tauren adore him, which I find faintly insulting to us both." } },
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
        { text = "Then guard it closely. Fools burn kingdoms.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Knowledge hoarded is knowledge wasted.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    kirin_tor = { { id = "tp_kt", text = "Careful wizards in violet robes who let a kingdom rot while they debated the proper response." } },
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
    first = "Ursyn Ghull teaches mages in the Pools of Vision and keeps his notes in perfect order. He speaks of Dalaran the way the living speak of a childhood home.",
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
        { text = "So you studied in Dalaran.", next = "dalaran" },
        { text = "I studied there too, before.", next = "o_dal", when = { origin = "forsaken_dalaran_apprentice" } },
        { text = "Farewell, Ursyn.", next = "END" },
      },
    },
    dalaran = {
      lines = { { id = "d_default", text = "Long ago, before the plague, and before Archimonde's armies left the city in ruins. I still dream in its libraries, if the dead can be said to dream." } },
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
        { text = "Look forward. The past is dead.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Remember the past. It made you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    o_dal = {
      lines = { { id = "od_default", text = "Then we may have passed each other in the halls once, when we both had faces. It's a strange comfort, meeting someone who remembers the same corridors." } },
      choices = { { text = "It is. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A student of Dalaran, before. A teacher in the Pools of Vision, now." } },
    advice = { { id = "tp_ad", text = "Write everything down. Memory is less reliable than you'd think, especially after death." } },
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
    first = "Thurston Xane teaches mages in the caves beneath Spirit Rise and seems to enjoy being dead more than most Forsaken. He is fond of the tauren, and they are slowly getting used to him.",
    third = "{name} met Thurston Xane, a cheerful Forsaken mage trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "g_hi", text = "Hello, hello! Come in, it's warmer down here than you'd think, not that I'd know anymore." },
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
        { text = "Farewell, Thurston.", next = "END" },
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
        { text = "Kindness is a good choice, Thurston.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bitterness is more honest, I think.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    cairne = { { id = "tp_ca", text = "The High Chieftain took in a cave full of corpses and asked nothing for it. I'd do almost anything for him, within reason and a little beyond." } },
    forsaken = { { id = "tp_fk", text = "We're a gloomy lot, mostly. I'm doing my best to bring the average up." } },
    background = { { id = "tp_bg", text = "A mage, before and after. The middle bit I'd rather not discuss." } },
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
    first = "Miles Welsh teaches priests in the Pools of Vision for the Cult of Forgotten Shadows, and speaks of the shadow as calmly as a farmer speaks of rain. He makes no apology for any of it.",
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
        { text = "The Light forgives. Don't give up on it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. Use what answers you.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
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
    first = "Malakai Cross teaches priests in the Pools of Vision with the fervor of a convert. He speaks of the Light with contempt and of the Dark Lady with something close to worship.",
    third = "{name} met Malakai Cross, a fervent Forsaken priest trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "o_sc_pity", when = { gossip = { topic = "scarlet_crusade", stance = "pity" } }, text = "Cobb tells me you pity the Scarlet Crusade. Pity them when they're tying you to the stake, and see how long it lasts." },
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
        { id = "op_light_r3", text = "Cobb says the same thing, and he says it every morning, and the Light has yet to answer him. Believe what you like." },
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
      again = { { id = "h_again", text = "Well? What else? The Dark Lady's work doesn't wait on the curious." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why does the Dark Lady want you here?", next = "why" },
        { text = "What do you think of the Light?", next = "light" },
        { text = "Farewell, Malakai.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because allies need watching as much as enemies, and the tauren are generous hosts. We teach, we listen, and we report what we hear, as any loyal citizen of the Undercity would." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "A comfortable faith for the living, and a cruel one for the dead. The Scarlet Crusade burns my people in its name, so you'll forgive me if I don't light candles to it." } },
      choices = {
        { text = "What would you have me say about it?", next = "op_light" },
        { text = "The Crusade isn't the Light.", next = "light_end", fx = { learn = { "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },
    light_end = {
      big = true,
      lines = { { id = "le_default", text = "They'd say it is, and the Light doesn't argue with them. When it starts striking down the zealots who use it, I'll reconsider." } },
      choices = {
        { text = "The Light is more than its worst followers.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A faith is judged by those who carry it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
  },

  topics = {
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
    first = "Father Cobb teaches priests in the Pools of Vision and still speaks like a village priest, gently and with a sermon never far off. He seems to miss his old parish more than his old life.",
    third = "{name} met Father Cobb, a gentle Forsaken priest trainer in the Pools of Vision.",
  },

  greetings = {
    { id = "o_light_hate", when = { gossip = { topic = "the_light", stance = "hate" } }, text = "Malakai says you've turned your back on the Light. I'll not lecture you, child, but the chapel door is always open, even down here." },
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
      again = { { id = "h_again", text = "Anything more, child? I've nowhere else to be, and no one left in Lordaeron waiting for me." } },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Tell me about your parish.", next = "parish" },
        { text = "You must still pray, Father.", next = "pray" },
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
        { text = "Keep hoping, Father. It's worth it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hope is a luxury for the living.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A village priest, once. A teacher in a cave, now. It's not so different as you'd think." } },
    advice = { { id = "tp_ad", text = "Be gentle with the frightened, child. Fear makes people cruel." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, child. Perhaps ask someone who gets out more, or someone still breathing." } },
  },
}
