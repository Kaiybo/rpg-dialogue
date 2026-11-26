-- Orgrimmar folk the roster scan found unwritten, part three: the pond in the Valley of Honor
-- (Shankys, Tharl Stonebleeder, Zas'Tysh), Xan'tish and his snakes,
-- the scouts Stronghand and Tharr, and Warcaller Gorlach. Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Shankys: fishing supplies at Lumak's Fishing, Valley of Honor.
P:NPC {
  key = "shankys", id = TODO_NPC("Shankys"), name = "Shankys", title = "Fishing Supplies", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry", "easy" }, values = { "patient" },
  notices = { "profession" },
  impression = {
    first = "Shankys sells poles, line and bait at Lumak's Fishing, beside the only pond in Orgrimmar. She is unhurried for an orc, and she watches the water even while she counts out change.",
    third = "{name} met Shankys, who sells fishing supplies at Lumak's Fishing in the Valley of Honor.",
  },
  greetings = {
    { id = "g_default", text = "Poles, line and bait, {class}. The pond is behind you, and what you pull out of it is your own affair." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Then either they were biting or you lost another hook to the bottom." },
  },
  notice = {
    { id = "n_fish", cat = "profession", when = { profession = "Fishing" },
      text = "You have a fisher's patience in the way you stand. Most orcs who come in here are tapping a foot before I finish the greeting." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Shankys. Lumak teaches the fishing and I sell what it takes, and between us we have put a pole in the hands of more grunts than you would believe." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? The fish will wait." },
        { id = "h_again2", text = "Go on. Nothing in this shop is in a hurry." },
      },
      choices = {
        { text = "Do orcs really fish?", next = "orcs" },
        { text = "Is there anything worth catching in that pond?", next = "pond" },
        { text = "Fishing seems dull work for a warrior.", next = "dull" },
        { text = "I fish. What bait do you swear by?", next = "bait", when = { profession = "Fishing" } },
        { text = "Good catching, Shankys.", next = "END" },
      },
    },
    orcs = {
      lines = { { id = "or_default", text = "More than will admit to it. Durotar gives us boar, scorpid and more boar, and after a season of that even a proud warrior will sit quietly on a rock for a fish." } },
      choices = {
        { text = "Who are your best customers?", next = "customers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    customers = {
      lines = { { id = "cu_default", text = "The trolls, who were fishing before they could walk, and after them the old soldiers who have learned to like the quiet. The young ones buy one pole, break it in a day, and come back pretending it was stolen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pond = {
      lines = { { id = "pd_default", text = "Small ones, mostly, and now and then something odd that nobody remembers putting in. The good water is down the Southfury or off the coast by Sen'jin, but the pond is where you learn not to snap your line." } },
      choices = {
        { text = "Something odd?", next = "odd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    odd = {
      lines = { { id = "od_default", text = "Old boots, a grunt's helm, and once a whole shield that Lumak swears was not there the day before. The two with the little pets by the water get the blame for most of it, fairly or not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dull = {
      lines = { { id = "dl_default", text = "So is standing guard, and nobody calls that dishonorable. A warrior who can sit still for an hour and feed a war band at the end of it is worth two who can only shout." } },
      choices = {
        { text = "Well argued. I take it back.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd still rather hunt. Something else.", next = "BACK", reply = "Then hunt, and buy your fish from someone with more patience." },
      },
    },
    bait = {
      lines = { { id = "bt_default", text = "Shiny baubles for the shallows, and something that smells truly foul for anything deeper. Fish are like goblins, {class}, in that they will come to glitter or to a stink and to nothing in between." } },
      choices = { { text = "I'll take that to the river. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I sell fishing gear by the pond, and I fish the Southfury when Lumak can spare me. It is a quiet life, and I chose it." } },
    _none = { { id = "tp_none", text = "I would not know, {class}. Ask me about hooks, or ask Lumak about everything else." } },
  },
}

-- Tharl Stonebleeder: keeper of small beasts by the pond, Valley of Honor.
P:NPC {
  key = "tharl", id = TODO_NPC("Tharl Stonebleeder"), name = "Tharl Stonebleeder", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff", "fond" }, values = { "protective" },
  notices = { "pet", "class" },
  impression = {
    first = "Tharl Stonebleeder stands by the pond in the Valley of Honor with small creatures about his boots, and for a scarred orc he steps very carefully among them. He bristles at once if anyone smiles at the sight.",
    third = "{name} met Tharl Stonebleeder, who keeps small beasts by the pond in the Valley of Honor.",
  },
  greetings = {
    { id = "g_default", text = "Watch your feet, {class}. Some of what lives around this pond is small, and all of it is under my protection." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You trod on nothing last time, so you may come closer." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} is well fed and holds its head up. You treat your beast properly, and I think better of you for it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tharl Stonebleeder. Zas'Tysh and I keep the small beasts here, the ones too little for war and too stubborn to die, and if you laugh I will put you in the pond." },
      },
      again = {
        { id = "h_again", text = "What else? Speak softly, some of them are sleeping." },
        { id = "h_again2", text = "Ask, {class}, and mind where you stand." },
      },
      choices = {
        { text = "Why would a warrior keep small beasts?", next = "why" },
        { text = "What sort of creatures are they?", next = "what" },
        { text = "Stonebleeder is a fearsome name for this work.", next = "name" },
        { text = "A hunter knows the worth of a companion.", next = "hunter", when = { class = "HUNTER" } },
        { text = "I'll step carefully. Farewell.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because a warrior far from home wants something living to come back to at the fire, and a wolf is not always to be had. I have seen grunts who feared nothing weep over a lost lizard, and I do not mock them for it." } },
      choices = {
        { text = "Did you have one, on campaign?", next = "campaign" },
        { text = "Something else.", next = "BACK" },
      },
    },
    campaign = {
      lines = { { id = "cp_default", text = "A prairie dog out of the Barrens that rode in my pack through the whole march north. It bit me daily and stole my bread, and I have kept small beasts ever since." } },
      choices = { { text = "A loyal thief. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    what = {
      lines = { { id = "wt_default", text = "Snakes, roaches, prairie dogs and whatever else the peons carry in from Durotar in their helmets. Zas'Tysh has stranger ones than I do, and you should ask him about the little thing that follows him if you want a long answer." } },
      choices = { { text = "I may do that. Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "nm_default", text = "I earned it breaking walls, and I am not ashamed of then or of now. An orc may crack stone in the morning and feed a lizard at dusk, and he is the same orc at both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hn_default", text = "Then you understand better than most of this valley. Yours fights beside you and mine only eat and sleep, but the bond is the same thing in a smaller skin." } },
      choices = { { text = "It is. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a soldier, and I am a keeper of small beasts now. Say what you like about it, but say it from over there." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Zas'Tysh, though he will likely tell you about his beasts instead." } },
  },
}

-- Zas'Tysh: keeper of small beasts by the pond, Valley of Honor.
P:NPC {
  key = "zastysh", id = TODO_NPC("Zas'Tysh"), name = "Zas'Tysh", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "cheerful", "talkative" }, values = { "curious" },
  notices = { "pet", "wonder" },
  impression = {
    first = "Zas'Tysh keeps small creatures by the pond in the Valley of Honor, and he is as merry about it as his friend Tharl is gruff. He will talk about his animals to anyone who slows down near the water.",
    third = "{name} met Zas'Tysh, a cheerful keeper of small beasts by the pond in the Valley of Honor.",
  },
  greetings = {
    { id = "g_default", text = "Ho there, {class}! Come and look, but slowly, because the small ones startle and then I spend an hour finding them." },
    { id = "g_back", when = { metBefore = true }, text = "You are back! Good, they have grown since you saw them, or at least I tell myself they have." },
  },
  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Now that is a fine animal! What is its name? {pet}? A strong name, and it suits the beast." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Zas'Tysh, and these are my charges. Tharl and I look after the little beasts of Orgrimmar, and he pretends it is a solemn duty while I admit that I simply like them." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I have plenty of time." },
        { id = "h_again2", text = "Ask away, {class}." },
      },
      choices = {
        { text = "What is the strangest creature you keep?", next = "strange" },
        { text = "Tharl threatened to put me in the pond.", next = "tharl" },
        { text = "Do the other orcs mock you for this?", next = "mock" },
        { text = "Where do the creatures come from?", next = "xfrom" },
        { text = "I'm a hunter. Could any of these become a companion?", when = { class = "HUNTER" }, next = "xhunter" },
        { text = "Some would say beasts belong in the wild.", next = "xwild" },
        { text = "Take care of them, Zas'Tysh.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "A murloc, no taller than your knee, that a fisher brought up from the coast in a bucket. It should be a terror, but it only splashes in the pond and gurgles at passing grunts, and I have grown fond of it." } },
      choices = {
        { text = "A murloc, in Orgrimmar?", next = "murloc" },
        { text = "Something else.", next = "BACK" },
      },
    },
    murloc = {
      lines = { { id = "mu_default", text = "I asked the guards, and they said that anything that small was my trouble and not theirs. Shankys at the fishing shop says it steals her bait, and I cannot honestly say she is wrong." } },
      choices = {
        { text = "It will grow, you know.", next = "BACK", reply = "So Tharl keeps telling me. I will worry about that when it can see over the wall." },
        { text = "Every keeper has a favourite. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    tharl = {
      lines = { { id = "th_default", text = "Ha! He says that to everyone, and he has only done it twice. Do not let the scowl fool you, {class}, because I have caught him singing to a prairie dog when he thought the valley was asleep." } },
      choices = { { text = "I won't tell him you said so. Something else.", next = "BACK" } },
    },
    mock = {
      lines = { { id = "mk_default", text = "A few did, in the first year. Then their own children began coming here every evening to see the beasts, and it is hard for a warrior to mock the orc his daughter will not stop talking about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfrom = {
      lines = {
        { id = "xfrom_default", text = "Some come from the Barrens on trader carts, some from Durotar's own scrub, and a few wash up from the coast in nets. Each one gets a meal and a corner, and some of them never leave." },
      },
      choices = {
        { text = "Who brings them in?", next = "xwho" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwho = {
      lines = {
        { id = "xwho_default", text = "Goblins, mostly, who find a creature in a crate and want it gone before it bites them. Tharl grumbles about it, but he paid a goblin for a hatchling only last week and thinks I did not see." },
      },
      choices = {
        { text = "Your secret is safe with me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xhunter_default", text = "Not these, hunter, they are too small and too spoiled now. Go to the trainers in the Valley of Honor, and find a beast that has fought for its own supper, because that kind will fight for yours." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwild = {
      lines = {
        { id = "xwild_default", text = "Some would, and some of these could not live a day out there with a broken wing or a gnawed leg. What do you think, {class}?" },
      },
      choices = {
        { text = "The strong survive. Coddling them makes them weak.", next = "BACK", reply = "Maybe so, but the weak ones make Orgrimmar smile, and that is worth something.", fx = { align = { light = -1 } } },
        { text = "Caring for the weak is worthy work.", next = "BACK", reply = "Tell that to Tharl, and watch his face try not to agree.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep small beasts by the pond with Tharl Stonebleeder. It is the best work I have had, and the quietest." } },
    advice = { { id = "tp_x_advice", text = "Move slowly near small creatures, {class}. Most fear is only surprise wearing teeth." } },
    _none = { { id = "tp_none", text = "I have no idea, friend. Unless it has scales, fur or too many legs, I am the wrong orc to ask." } },
  },
}

-- Xan'tish: snake vendor, wanders the Valley of Spirits.
P:NPC {
  key = "xantish", id = TODO_NPC("Xan'tish"), name = "Xan'tish", title = "Snake Vendor", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "sly", "laughing" }, values = { "cunning", "patient" },
  notices = { "race", "class" },
  impression = {
    first = "Xan'tish walks the Valley of Spirits with snakes coiled about his arms and more of them following at his heels. He speaks to them as often as to his customers, and they seem the better listeners.",
    third = "{name} met Xan'tish, the Darkspear snake seller in the Valley of Spirits.",
  },
  greetings = {
    { id = "g_default", text = "Don't step back so quick, {class}. They only bite the ones who be afraid, so stand easy and say hello." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the brave one be back. The crimson one remembers ya, look how she lifts her head." },
    { id = "g_troll", when = { race = "Troll" }, text = "A Darkspear who doesn't flinch at my little ones. Dat's how I know you were raised right, cousin." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Careful with those hooves, big one. You wouldn't feel it, but my snakes surely would." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I be Xan'tish, and I sell snakes: the black, the brown and the crimson. I track them and catch them myself and I teach them manners, which is more than anyone ever did for me." },
      },
      again = {
        { id = "h_again", text = "What else ya want to know, mon?" },
        { id = "h_again2", text = "Ask. The snakes don't mind waiting, they be good at it." },
      },
      choices = {
        { text = "Why would anyone buy a snake?", next = "why" },
        { text = "How do you catch them?", next = "catch" },
        { text = "They follow you like hounds.", next = "follow" },
        { text = "Do the loa favour snakes?", next = "loa", when = { race = "Troll" } },
        { text = "Mind your fingers, Xan'tish.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "For company, mon. A snake eats little and never talks back, and she'll sit in your pack through a whole war and still be glad of your warm hand at the end of it." } },
      choices = {
        { text = "Which is the gentlest?", next = "gentle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gentle = {
      lines = { { id = "gn_default", text = "The brown one, every time. She's as plain as dirt and twice as calm, and I've seen her fall asleep on an orc child's shoulder in the middle of the market." } },
      choices = { { text = "And the crimson?", next = "crimson" }, { text = "Something else.", next = "BACK" } },
    },
    crimson = {
      lines = { { id = "cr_default", text = "She be proud, dat one, and she wants to be looked at. She won't hurt ya, but she'll sulk for a week if you put her in a dark bag, so don't buy her unless you mean to show her off." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    catch = {
      lines = { { id = "ca_default", text = "Slow, and at dawn, when the rock be still cold and they're too sleepy to argue. I play them a little on the flute first, and ya can laugh, but I got all ten fingers and most snake catchers don't." } },
      choices = {
        { text = "A flute? Truly?", next = "flute" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flute = {
      lines = { { id = "fl_default", text = "Truly. They can't hear the tune the way you do, but they feel it and they watch the swaying, and while they watch the flute they aren't watching my other hand." } },
      choices = { { text = "Clever. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    follow = {
      lines = { { id = "fo_default", text = "They know who feeds them, same as hounds do. The orcs up this path used to jump on the benches when I walked by, and now the shamans only nod and lift their feet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    loa = {
      lines = { { id = "lo_default", text = "The Gurubashi had a serpent god, long ago, and dat brought them nothing but blood, so I leave the big names alone. I keep to the small spirits, cousin, the ones that fit in a basket, and they've been kind to me." } },
      choices = { { text = "A wise choice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Darkspear, and a snake catcher since I was small. I walk the Valley of Spirits because the shamans don't scream." } },
    _none = { { id = "tp_none", text = "Can't help ya there, mon. Ask me about anything with scales and no legs." } },
  },
}

-- Scout Stronghand: patrols the streets of Orgrimmar.
P:NPC {
  key = "scout_stronghand", id = TODO_NPC("Scout Stronghand"), name = "Scout Stronghand", gender = "male",
  bible = "bibles/missed_b.md", role = "guard", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk" }, values = { "dutiful", "vigilant" },
  notices = { "stealth", "class" },
  impression = {
    first = "Scout Stronghand walks the streets of Orgrimmar at a pace that eats ground, and his eyes are never on the one he is speaking to for long. He answers questions without breaking stride if he can help it.",
    third = "{name} met Scout Stronghand, who patrols the streets of Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Walk with me if you want to talk, {class}. A scout who stands still is only a guard." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Keep pace, then, and say what you came to say." },
  },
  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You are light on your feet, and I marked you three streets back all the same. Remember that if you ever grow bold inside these walls." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Scout Stronghand. The grunts hold the gates, and we scouts walk everything between them, because an enemy who gets past a gate will not stay near it." },
      },
      again = {
        { id = "h_again", text = "What else? I have half the city still to walk." },
        { id = "h_again2", text = "Quickly, {class}." },
      },
      choices = {
        { text = "What are you looking for?", next = "looking" },
        { text = "Has the Alliance ever got inside?", next = "inside" },
        { text = "The city seems peaceful enough.", next = "peace" },
        { text = "What enemies come for Orgrimmar?", next = "xenemies" },
        { text = "I move quietly too. Could I scout for the Horde?", when = { class = { "ROGUE", "HUNTER" } }, next = "xrogue" },
        { text = "Your feet must ache by nightfall.", next = "xfeet" },
        { text = "I'll not slow you. Go well.", next = "END" },
      },
    },
    looking = {
      lines = { { id = "lk_default", text = "Faces that do not fit, and shadows where there is nothing to cast them. Night elves can walk unseen, and a human assassin will wear a hood and keep to the Cleft, so I look for whoever is trying hardest not to be looked at." } },
      choices = {
        { text = "And when you find one?", next = "find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    find = {
      lines = { { id = "fd_default", text = "I shout, and every grunt in earshot comes running, and that is the whole of my part. I am no great fighter, {class}, but I have the loudest voice of any scout except Tharr, and he and I have argued about that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    inside = {
      lines = { { id = "in_default", text = "Small bands, now and then, who come for glory and mostly find the wrong end of a spear in the Valley of Strength. They have never reached the Warchief, and while I am walking they will not." } },
      choices = { { text = "Good. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    peace = {
      lines = { { id = "pc_default", text = "It seems so because it is watched. The Burning Blade found its way into the Cleft under all our noses, and I have not trusted a quiet street since.", fx = { learn = { "burning_blade" } } } },
      choices = { { text = "A fair lesson. Something else.", next = "BACK" } },
    },
    xenemies = {
      lines = {
        { id = "xenemies_default", text = "The Burning Blade, mostly, cultists who hide in the Cleft and in Ragefire Chasm beneath the city. The Alliance sends spies too, but the cultists already live here, and that makes them worse." },
      },
      choices = {
        { text = "How do you tell a cultist from an honest orc?", next = "xtell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtell = {
      lines = {
        { id = "xtell_default", text = "You watch who goes down into the Cleft and who comes back changed. The demon blood called to us once, and some orcs still miss its voice, so I watch for the ones who look hungry." },
      },
      choices = {
        { text = "Root them out, every one, without mercy.", next = "BACK", reply = "That is a grunt's answer, and sometimes it is the right one, but a dead cultist tells no tales.", fx = { align = { light = -1 } } },
        { text = "Some may be turned back. They are still orcs.", next = "BACK", reply = "The Warchief believes that too, and I try to. Then I find another shrine.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xrogue_default", text = "Perhaps, if you can keep pace and keep quiet in the same breath. Learn the city first, every alley and every roof, and when you can find me before I find you, come and ask again." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xfeet = {
      lines = {
        { id = "xfeet_default", text = "They do, and I have walked every stone of this city a thousand times. Still, my feet complain less than my head does when I sit, because sitting lets me think about what I missed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a scout of Orgrimmar. I walk, I watch, and I shout when it is needed." } },
    burning_blade = { { id = "tp_bb", text = "Demon worshippers, hiding among our own. Ask in Grommash Hold if you want to hunt them." } },
    thrall = { { id = "tp_x_thrall", text = "The Warchief walks his own city at night sometimes, and I am the one who pretends not to see him." } },
    _none = { { id = "tp_none", text = "I cannot say, and I cannot stop to think on it. Ask a guard who is standing still." } },
  },
}

-- Scout Tharr: patrols the streets of Orgrimmar.
P:NPC {
  key = "scout_tharr", id = TODO_NPC("Scout Tharr"), name = "Scout Tharr", gender = "male",
  bible = "bibles/missed_b.md", role = "guard", tier = "service",
  communities = { "orgrimmar" }, temper = { "brisk", "wry" }, values = { "dutiful" },
  notices = { "class", "race" },
  impression = {
    first = "Scout Tharr makes his rounds through Orgrimmar with a walker's long stride and a dry word for every merchant he passes. He knows the city's back ways better than the peons who dug them.",
    third = "{name} met Scout Tharr, who patrols the streets of Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Hail, {class}. If you are lost, say so now, because I pass this spot only once an hour." },
    { id = "g_back", when = { metBefore = true }, text = "You are still in the city, I see. Has it swallowed you yet, or do you know your way?" },
  },
  notice = {
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Forsaken. You are an ally and I will treat you as one, but walk in the light where the grunts can see you, for your own sake." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Scout Tharr. I walk from the front gate to the Valley of Wisdom and back again by a different road each time, so that nobody watching can learn my habits." },
      },
      again = {
        { id = "h_again", text = "Anything more? My round does not walk itself." },
        { id = "h_again2", text = "Ask it, and briefly." },
      },
      choices = {
        { text = "I am lost. Where is everything?", next = "lost" },
        { text = "Which part of the city gives you most trouble?", next = "trouble" },
        { text = "Stronghand says he's the louder of you.", next = "loud" },
        { text = "Do merchants ever cheat in the Drag?", next = "xcheat" },
        { text = "You don't seem to trust the Forsaken.", next = "xforsaken" },
        { text = "Which way should a newcomer walk first?", when = { maxLevel = 15 }, next = "xnew" },
        { text = "Keep to your round, scout.", next = "END" },
      },
    },
    lost = {
      lines = { { id = "ls_default", text = "The Valley of Strength is inside the gate, with the bank and the inn. Go north for Wisdom and the Warchief, east through the Drag for Honor, and west through the Cleft of Shadow for Spirits, if you do not mind the dark." } },
      choices = {
        { text = "What's wrong with the Cleft?", next = "cleft" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cleft = {
      lines = { { id = "cl_default", text = "It is where the warlocks and the knife-sellers keep shop, and where Ragefire's heat comes up through the floor. The Warchief permits it, so I walk it, but I walk it quickly and I count my fingers after." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trouble = {
      lines = { { id = "tr_default", text = "The square inside the front gate, every day. Young warriors come in from Durotar full of pride and challenge each other to duels in front of the bank, and at least once a week one of them lands on a merchant's stall." } },
      choices = {
        { text = "Let them fight. It makes them strong.", next = "BACK", reply = "So I say too, and then the merchant finds me, and I am the one who hears about the stall." },
        { text = "Something else.", next = "BACK" },
      },
    },
    loud = {
      lines = { { id = "ld_default", text = "Stronghand is louder, and I let him believe that is the same as better. I can whistle so that it carries from the Drag to the gate, and a whistle does not tell the enemy which way the guard is coming from." } },
      choices = { { text = "A sly answer. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xcheat = {
      lines = {
        { id = "xcheat_default", text = "Every day, and the goblins are the best at it, though they call it business. I cannot arrest a fellow for a bad price, but I can stand near his stall until his customers get nervous." },
      },
      choices = {
        { text = "Do you ever take a bribe to look away?", next = "xbribe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbribe = {
      lines = {
        { id = "xbribe_default", text = "I am offered one each week, usually in candy or bad wine, and I refuse it each week. A scout who can be bought is worse than none, because the city thinks it is watched when it is not." },
      },
      choices = {
        { text = "The law is the law. Your honesty does you credit.", next = "BACK", reply = "It does me no good with the goblins, but I sleep well.", fx = { align = { order = 1 } } },
        { text = "A little give makes a city run smoother.", next = "BACK", reply = "So the goblins say, and their stalls burn down more often than most.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      lines = {
        { id = "xforsaken_default", text = "I trust them as allies, since the Warchief does, and I watch them as I watch everyone. The grunts are less patient, and I would rather a Forsaken walk where I can stand between them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xnew = {
      lines = {
        { id = "xnew_default", text = "The Valley of Strength first, for the bank and the inn, and then the Drag for supplies. Stay out of the Cleft of Shadow until somebody has a reason to send you there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I scouted the Barrens before the city was built, and now I scout the city. The ground is flatter and the company is worse." } },
    advice = { { id = "tp_x_advice", text = "Know two ways out of any street you walk into, {class}. The city taught me that, and so did the war." } },
    _none = { { id = "tp_none", text = "That is not on my round, {class}. Ask at Grommash Hold." } },
  },
}

-- Warcaller Gorlach: wanders Orgrimmar calling the Horde to its fronts.
P:NPC {
  key = "gorlach", id = TODO_NPC("Warcaller Gorlach"), name = "Warcaller Gorlach", gender = "male",
  bible = "bibles/missed_b.md", role = "crier", tier = "quest",
  communities = { "orgrimmar" }, temper = { "loud", "fervent" }, values = { "loyal", "martial" },
  notices = { "class", "level" },
  impression = {
    first = "Warcaller Gorlach strides through Orgrimmar with a voice that carries over forge and market alike, calling the Horde's fighters to wherever they are needed. He fixes on any armed traveller as though the Warchief had sent them to him personally.",
    third = "{name} met Warcaller Gorlach, who walks Orgrimmar calling the Horde to its far fronts.",
  },
  greetings = {
    { id = "g_default", text = "You there, {class}! The Horde has need of strong arms, and I see two of them standing idle in front of me!" },
    { id = "g_back", when = { metBefore = true }, text = "Ha, {name}! You are back within the walls, so either the work is done or you have come for more of it!" },
    { id = "g_young", when = { maxLevel = 19 }, text = "Hail, young one! Grow strong in Durotar and the Barrens first, and then come and find me, because I will have a place to send you." },
  },
  notice = {
    { id = "n_vet", cat = "level", when = { minLevel = 50 },
      text = "I know a veteran when one walks past me. There is harder work than most can do, and I have been saving it for someone like you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Warcaller Gorlach, and I carry word from every front the Horde holds. The Warchief cannot send a rider to each of you, so he sends me to shout it in the streets until somebody listens." },
      },
      again = {
        { id = "h_again", text = "What else would you hear, {class}? I have news from every wind." },
        { id = "h_again2", text = "Speak up! I have been shouting since dawn and my ears ring." },
      },
      choices = {
        { text = "Where is the Horde hardest pressed?", next = "fronts" },
        { text = "What news from Ashenvale?", next = "ashenvale", when = { minLevel = 20 } },
        { text = "I'm ready for the worst of it.", next = "plague", when = { minLevel = 50 } },
        { text = "Does anybody actually listen to you?", next = "listen" },
        { text = "You must have a voice of iron.", next = "voice" },
        { text = "For the Horde, Warcaller.", next = "END" },
      },
    },
    fronts = {
      hub = true,
      lines = { { id = "fr_default", text = "On every side, and I do not say it to frighten you. The Warsong need hunters in Ashenvale, the tauren of Camp Mojache hold a lonely post in Feralas, and the Forsaken cry out for help against the Scourge in the Plaguelands." } },
      again = { { id = "fr_again", text = "Which front would you hear of, {class}?" } },
      choices = {
        { text = "Tell me of Ashenvale.", next = "ashenvale" },
        { text = "Tell me of Camp Mojache.", next = "mojache" },
        { text = "Tell me of the Plaguelands.", next = "plague" },
        { text = "And the druids? I've heard talk.", next = "druids", when = { minLevel = 50 } },
        { text = "Enough of war for now.", next = "hello" },
      },
    },
    ashenvale = {
      lines = {
        { id = "as_done", when = { questDone = TODO_QUEST("The Ashenvale Hunt") }, text = "You have answered that call already, and Splintertree spoke well of you. The forest still has teeth, {class}, and the Warsong will always find work for a proven hunter." },
        { id = "as_default", text = "The Warsong clan holds the eastern forest for our lumber, and the night elves and the wild things contest every tree. Senani Thunderheart at Splintertree Post has named three great beasts of that wood, and she wants hunters with the heart to bring them down.", fx = { learn = { "warsong" } } },
      },
      choices = {
        { text = "What sort of beasts?", next = "beasts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = { { id = "bs_default", text = "A great bear, a great cat and a spider that the scouts speak of quietly, each one old and cunning and grown fat on careless grunts. Senani will tell you where they den, because my part is only to send you to her." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mojache = {
      lines = { { id = "mj_default", text = "It is a tauren camp deep in the jungle of Feralas, far west of Thousand Needles, with ogres to the north and worse in the ruins beyond. The braves there are few and proud, and they will not ask for help, so I ask it for them." } },
      choices = {
        { text = "The tauren stood by us. I'll stand by them.", next = "BACK", reply = "Lok'tar! That is how the Horde speaks. Take the road through the Needles and look for the totems.", fx = { affinity = 1 } },
        { text = "It's a long way to go for a favour. Something else.", next = "BACK", reply = "It is a long way, and they marched farther than that for us at Hyjal." },
      },
    },
    plague = {
      lines = {
        { id = "pl_young", when = { maxLevel = 49 }, text = "The dead of Lordaeron still walk, and the Forsaken hold the line against them at a place called the Bulwark. It is no place for you yet, {class}, and I will not send a warrior to a death that serves nobody." },
        { id = "pl_default", text = "The Scourge still holds Lordaeron's farmlands, and the Forsaken stand against it at the Bulwark, on the eastern edge of Tirisfal. High Executor Derrington commands there, and he has asked for the strongest that Orgrimmar can spare.", fx = { learn = { "scourge" } } },
      },
      choices = {
        { text = "Why should orcs die for the Forsaken?", next = "forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = {
        { id = "fk_scourge", when = { race = "Scourge" }, text = "You hear that asked in this city, and I answer it the same way to your face as behind your back. The Lich King would make corpses of us all, and your people stand between him and us." },
        { id = "fk_default", text = "Because the Lich King does not care whose corpse he raises, {class}. Every ghoul the Forsaken cut down at the Bulwark is one that will never cross the sea to Durotar, and I would sooner fight that war on their soil than ours." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druids = {
      lines = { { id = "dr_default", text = "You have heard rightly. The druids of the Cenarion Circle are looking beyond their groves, and Arch Druid Hamuul Runetotem in Thunder Bluff seeks seasoned fighters to speak with. I do not know all of his purpose, and I will not guess at it in the street." } },
      choices = { { text = "Then I'll ask him myself. Something else.", next = "BACK" } },
    },
    listen = {
      lines = { { id = "li_default", text = "One in ten, and that one is worth the other nine. Most of them hurry past me to the auction house, and that is their right, but the ones who stop are the ones the songs will be about." } },
      choices = {
        { text = "Do you wish you could go yourself?", next = "self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    self = {
      lines = { { id = "se_default", text = "Every day. But I took a spear through the leg in the Barrens, and I can walk these streets or I can march to war, and not both. So I send better legs than mine, and I remember the name of each one who goes." } },
      choices = { { text = "Then remember mine. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    voice = {
      lines = { { id = "vo_default", text = "My mother said I was born shouting and frightened the wolves. The Warchief's people heard me calling orders across a battlefield and decided it was a better weapon than my axe, and they may have been right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a soldier until a spear ended my marching. Now I am the Warchief's voice in these streets, and I am heard." } },
    warsong = { { id = "tp_ws", text = "Hellscream's clan, in Ashenvale. They fell the trees that built this city, and the elves hate them for it." } },
    scourge = { { id = "tp_sc", text = "The Lich King's dead walk in the north of the eastern lands. The Forsaken hold them at the Bulwark." } },
    _none = { { id = "tp_none", text = "I carry word of war, {class}, and nothing else. Ask in Grommash Hold if it is not a battle." } },
  },
}
