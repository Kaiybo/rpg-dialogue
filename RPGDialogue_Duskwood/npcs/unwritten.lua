-- Duskwood folk with no conversation yet: the Night Watch posts across the forest (Blomberg and
-- Hutchins at the crossroads, Corwin in Darkshire, Cutford on the Twilight Grove road, Jordan south
-- of town, and Gelwin, Merant, Sarys, Selkin and Thayer on the road north of the Rotting Orchard,
-- where Stitches walks), and the two Forsaken hiding at Beggar's Haunt, Apothecary Faustin and
-- Deathstalker Zraedus.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Watcher Blomberg: Night Watch at the central crossroads.
P:NPC {
  key = "dusk_watcher_blomberg", id = TODO_NPC("Watcher Blomberg"), name = "Watcher Blomberg", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "gruff", "weary" }, values = { "dutiful" },
  notices = { "watch", "travel" },
  impression = {
    first = "He counts the travellers through the crossroads and the ones who don't return.",
    third = "{name} met Watcher Blomberg of the Night Watch at the Duskwood crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Halt, {class}. State your business, and then move along, because this crossing isn't a place to rest." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Good, I'll mark you down as still alive." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Blomberg, Night Watch. I keep a tally of everyone who passes this crossroads, coming and going, so we know who to look for when they don't come back.", fx = { learn = { "night_watch" } } } },
      again = {
        { id = "h_again", text = "Anything else? I've got names to write." },
        { id = "h_again2", text = "Ask, but keep it quick." },
      },
      choices = {
        { text = "How many don't come back?", next = "tally" },
        { text = "What's the worst thing on these roads?", next = "worst" },
        { text = "Carry on, Watcher.", next = "END" },
      },
    },
    tally = {
      lines = { { id = "t_default", text = "More than I'd like and fewer than you'd think, but every one of them is a name in my book with no mark beside it. I read those names over at night, so I don't forget them." } },
      choices = {
        { text = "Their families deserve to know what happened.", next = "BACK", reply = "They do, and when I can tell them, I do. Most times I can't.", fx = { align = { light = 1 } } },
        { text = "Some people simply aren't meant for the woods.", next = "BACK", reply = "Maybe so, but the woods don't care who's meant for them. Remember that.", fx = { align = { light = -1 } } },
      },
    },
    worst = {
      lines = { { id = "w_default", text = "The dead from Raven Hill, the worgen in the west, and that stitched-together horror from the Rotting Orchard that walks the road whenever it pleases. If you see a thing taller than a man with a cleaver, run toward Darkshire and shout.", fx = { learn = { "raven_hill" } } } },
      choices = { { text = "I'll keep that in mind. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've served the Watch eleven years. Ten of them at this crossroads, and the first one I'd rather forget." } },
    _none = { { id = "tp_none", text = "No idea. Ask in Darkshire, they've more time to think than I do." } },
  },
}

-- Watcher Hutchins: Night Watch at the central crossroads.
P:NPC {
  key = "dusk_watcher_hutchins", id = TODO_NPC("Watcher Hutchins"), name = "Watcher Hutchins", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "jovial", "watchful" }, values = { "dutiful", "brave" },
  notices = { "watch", "kit" },
  impression = {
    first = "He jokes about the dark because he's tired of fearing it.",
    third = "{name} met Watcher Hutchins of the Night Watch at the Duskwood crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Evening, {class}, though it's always evening in Duskwood, so that's an easy guess. What brings you to our cheerful little forest?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! You must like it here, which makes you either brave or a bit cracked." },
  },
  notice = {
    { id = "n_priest", cat = "watch", when = { class = { "PRIEST", "PALADIN" } },
      text = "Light-bearer! Stand close for a moment, would you? I could use the glow." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Hutchins, at your service. Blomberg keeps the tally, and I keep the spirits up, which is the harder job, believe me." } },
      again = {
        { id = "h_again", text = "What else? I've jokes to spare, if nothing else." },
        { id = "h_again2", text = "Go on, I'm listening. The trees certainly aren't." },
      },
      choices = {
        { text = "How do you keep laughing in a place like this?", next = "laugh" },
        { text = "Why is it always dark here?", next = "dark" },
        { text = "Take care, Hutchins.", next = "END" },
      },
    },
    laugh = {
      lines = { { id = "l_default", text = "Because the alternative is weeping, and I tried that my first winter in the Watch. It didn't scare off a single ghoul, so I switched to jokes, and the ghouls don't laugh either, but I feel better." } },
      choices = {
        { text = "Laughter's a kind of courage.", next = "BACK", reply = "That's what I tell Blomberg, and he tells me to keep quiet.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dark = {
      lines = { { id = "d_default", text = "Nobody's sure, and everyone's got a theory. The old folk blame the tower of Karazhan off to the east, the priests blame some curse, and Madame Eva just smiles and says nothing, which is worse." } },
      choices = {
        { text = "A curse, surely. Something unnatural did this.", next = "BACK", reply = "Could be, and if so, I'd like a word with whoever cast it.", fx = { align = { light = 1 } } },
        { text = "Dark is just dark. Fear does the rest.", next = "BACK", reply = "Easy to say in daylight, friend. Come back at midnight and tell me again.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Born in Darkshire, joined the Watch at sixteen. Haven't seen the sun properly since." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, but I could tell you a joke instead, if you like." } },
  },
}

-- Watcher Corwin: Night Watch posted in Darkshire.
P:NPC {
  key = "dusk_watcher_corwin", id = TODO_NPC("Watcher Corwin"), name = "Watcher Corwin", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "stern", "watchful" }, values = { "dutiful", "family" },
  notices = { "watch" },
  impression = {
    first = "He guards the town his family has lived in for generations.",
    third = "{name} met Watcher Corwin of the Night Watch, posted in Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Darkshire, {class}. Keep to the lamplight, and if you hear a howl, come inside." },
    { id = "g_back", when = { metBefore = true }, text = "Back in town, I see. Good, the streets are safer with more blades in them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Corwin. I keep the streets of Darkshire, which means I see every face that comes in and remember most of them." } },
      again = {
        { id = "h_again", text = "Anything else you need?" },
        { id = "h_again2", text = "Go on. The town's quiet, for once." },
      },
      choices = {
        { text = "Who's in charge here?", next = "ebonlocke" },
        { text = "What troubles the town most?", next = "trouble" },
        { text = "Good night, Watcher.", next = "END" },
      },
    },
    ebonlocke = {
      lines = { { id = "e_default", text = "Commander Althea Ebonlocke leads the Watch from the town hall, and Lord Ello Ebonlocke, her father, is the town's lord. She gives orders, and he gives speeches, and between them the town mostly holds together." } },
      choices = {
        { text = "You don't sound fond of the lord.", next = "lord" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lord = {
      lines = { { id = "lo_default", text = "I'll not speak against him, he's done right by us in his way. But it's the commander who walks the roads at night and the commander who buries the Watch, and I know which Ebonlocke I'd follow into the woods." } },
      choices = {
        { text = "A leader belongs on the front line.", next = "BACK", reply = "Aye, and that's where she is. More's the pity for the lord.", fx = { align = { honor = 1 } } },
        { text = "Lords must keep their distance to rule.", next = "BACK", reply = "Maybe so in Stormwind. Out here distance just looks like hiding.", fx = { align = { honor = -1 } } },
      },
    },
    trouble = {
      lines = { { id = "t_default", text = "Fear, mostly, because fear makes people leave, and every family that goes leaves the rest weaker. The undead and the worgen are bad, but empty houses are what keep me up at night." } },
      choices = { { text = "Then I'll help where I can. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My grandfather built half these houses, back when it was Grand Hamlet. I'll not see them empty." } },
    _none = { { id = "tp_none", text = "Don't know. Clerk Daltry at the town hall keeps records of everything." } },
  },
}

-- Watcher Cutford: patrols the main road from Darkshire toward Twilight Grove.
P:NPC {
  key = "dusk_watcher_cutford", id = TODO_NPC("Watcher Cutford"), name = "Watcher Cutford", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "brisk", "wary" }, values = { "dutiful" },
  notices = { "watch", "travel" },
  impression = {
    first = "He patrols toward the grove and trusts nothing that glows there.",
    third = "{name} met Watcher Cutford of the Night Watch on the road toward Twilight Grove.",
  },
  greetings = {
    { id = "g_default", text = "Hold, {class}. You're on the grove road, and I'd advise you to turn back unless you've business with the dragons." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still heading for the grove? Light help you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Cutford. I walk the road from Darkshire toward the Twilight Grove, and I turn back before I reach it, because I'm not a fool." } },
      again = {
        { id = "h_again", text = "What else? Talk fast; I keep moving." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "What's in the Twilight Grove?", next = "grove" },
        { text = "What else walks this road?", next = "road" },
        { text = "Safe walking, Cutford.", next = "END" },
      },
    },
    grove = {
      lines = { { id = "g_default", text = "Green dragons, sleeping or something like it, and the trees there glow like nothing natural should. The night elves say it's a holy place, and I'll take their word for it from a good long way off.", fx = { learn = { "green_dragons" } } } },
      choices = {
        { text = "Holy places deserve respect, not fear.", next = "BACK", reply = "Then you go and respect it. I'll stand here and fear it.", fx = { align = { light = 1 } } },
        { text = "Dragons are dragons. Kill them before they wake.", next = "BACK", reply = "You first, friend. I've seen what one sneeze from those beasts does.", fx = { align = { light = -1 } } },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Ghouls out of the Raven Hill cemetery, spiders from the deep woods, and now and then an ogre down from the hills to the east. I've walked it a thousand times, and it's never once been boring." } },
      choices = { { text = "I'd prefer boring. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Darkshire born, Watch sworn. Not much more to it than that." } },
    _none = { { id = "tp_none", text = "Don't know it, and I've a road to walk. Ask in town." } },
  },
}

-- Watcher Jordan: patrols the road south of Darkshire.
P:NPC {
  key = "dusk_watcher_jordan", id = TODO_NPC("Watcher Jordan"), name = "Watcher Jordan", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "earnest", "brave" }, values = { "brave", "dutiful" },
  notices = { "watch", "kit" },
  impression = {
    first = "He is young, eager, and too sure of his own luck.",
    third = "{name} met Watcher Jordan of the Night Watch on the road south of Darkshire.",
  },
  greetings = {
    { id = "g_default", text = "Well met, {class}! You look like you can handle yourself, and that's a rare sight on this road." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Seen anything worth fighting out there?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Jordan, newest in the Watch, though I've already put down three ghouls and a spider the size of a cart. The south road's mine to walk, and I'll keep it clear." } },
      again = {
        { id = "h_again", text = "What else? I've plenty of stories, if you've time." },
        { id = "h_again2", text = "Go on, ask me anything about the road." },
      },
      choices = {
        { text = "Why did you join the Watch?", next = "join" },
        { text = "What's down the south road?", next = "south" },
        { text = "Don't get too bold out there.", next = "bold" },
        { text = "Good luck, Jordan.", next = "END" },
      },
    },
    join = {
      lines = { { id = "j_default", text = "My older brother served before me, until the worgen took him near the Hushed Bank. I joined the week after we buried his boots, because that's all they found, and I mean to finish what he started." } },
      choices = {
        { text = "Vengeance won't bring him back.", next = "BACK", reply = "I know that. But it might stop them taking someone else's brother.", fx = { align = { light = 1 } } },
        { text = "Make them pay for every drop.", next = "BACK", reply = "That's the plan, friend. Every last one of them.", fx = { align = { light = -1 } } },
      },
    },
    south = {
      lines = { { id = "s_default", text = "The Vile Reef along the coast, murlocs and worse, and further on, the road into Stranglethorn. It's quieter than the west, but quiet isn't the same as safe." } },
      choices = { { text = "Wise words for a new watcher. Something else.", next = "BACK" } },
    },
    bold = {
      lines = { { id = "b_default", text = "The commander says the same thing, and so does my mother. I'll be careful, I promise, but somebody has to walk toward the trouble instead of away." } },
      choices = { { text = "Then walk carefully. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Darkshire lad, youngest of four. The Watch is the only family business we've got left." } },
    _none = { { id = "tp_none", text = "Don't know that one, but I'd love to hear about it sometime." } },
  },
}

-- Watcher Gelwin: posted on the road north of the Rotting Orchard, along Stitches' route.
P:NPC {
  key = "dusk_watcher_gelwin", id = TODO_NPC("Watcher Gelwin"), name = "Watcher Gelwin", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "stern", "weary" }, values = { "dutiful" },
  notices = { "watch" },
  impression = {
    first = "He stands where Stitches walks and doesn't pretend to be calm.",
    third = "{name} met Watcher Gelwin of the Night Watch on the road north of the Rotting Orchard.",
  },
  greetings = {
    { id = "g_default", text = "Keep your blade loose, {class}. This stretch of road is where the abomination walks." },
    { id = "g_back", when = { metBefore = true }, text = "Back on this road? Then you're braver than me, and I'm paid to be here." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Gelwin. The commander posted a line of us along this road north of the Rotting Orchard, so if Stitches comes this way, it has to go through all of us first." } },
      again = { { id = "h_again", text = "What else? Keep your voice down; sound carries." } },
      choices = {
        { text = "What is Stitches?", next = "stitches" },
        { text = "Can a handful of watchers stop it?", next = "stop" },
        { text = "Stand fast, Gelwin.", next = "END" },
      },
    },
    stitches = {
      lines = { { id = "s_default", text = "An abomination, stitched together from the dead by some madman out in the Raven Hill country. It walks the road toward Darkshire with a cleaver and a hunger, and the last time it came, it cut down a whole patrol." } },
      choices = { { text = "Who made such a thing?", next = "maker" }, { text = "Something else.", next = "BACK" } },
    },
    maker = {
      lines = { { id = "m_default", text = "Some say a hermit named Abercrombie, out in a shack near the cemetery, though he seems a harmless old man. Commander Ebonlocke has her suspicions, and so do I." } },
      choices = { { text = "I'll look into it. Something else.", next = "BACK" } },
    },
    stop = {
      lines = { { id = "st_default", text = "Not alone, no. But we can slow it, and every moment we hold it is a moment for the town to bar the doors and for someone like you to come and finish it." } },
      choices = {
        { text = "No one should die just to buy time.", next = "BACK", reply = "Tell that to Stitches. We do what the Watch must.", fx = { align = { order = -1 } } },
        { text = "That's duty. The Watch knows its job.", next = "BACK", reply = "Aye, it does, and we'll do it, whatever it costs.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Watch veteran. I've seen too many friends' names go on the stone." } },
    _none = { { id = "tp_none", text = "Not now, friend. My eyes are on the road." } },
  },
}

-- Watcher Merant: posted on the road north of the Rotting Orchard.
P:NPC {
  key = "dusk_watcher_merant", id = TODO_NPC("Watcher Merant"), name = "Watcher Merant", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "wry", "weary" }, values = { "practical" },
  notices = { "watch", "kit" },
  impression = {
    first = "He has drawn lots for this post three times and lost each time.",
    third = "{name} met Watcher Merant of the Night Watch on the road north of the Rotting Orchard.",
  },
  greetings = {
    { id = "g_default", text = "Evening, {class}. Welcome to the worst post in the Watch, which I won fair and square by drawing the short straw." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Come to keep me company? I'd welcome it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Merant. We draw straws in the barracks to see who stands on this road, and I've drawn short three times running, so I'm starting to think somebody's cheating." } },
      again = { { id = "h_again", text = "Anything else? I've nothing to do but watch and worry." } },
      choices = {
        { text = "What's so bad about this post?", next = "post" },
        { text = "Have you ever seen the abomination?", next = "seen" },
        { text = "Better luck next draw.", next = "END" },
      },
    },
    post = {
      lines = { { id = "p_default", text = "The Rotting Orchard to the south, full of ghouls and rotting fruit, and the thing called Stitches that walks this way when it pleases. If you smell something worse than the orchard, it's coming." } },
      choices = {
        { text = "Then someone should rig the draw for you.", next = "BACK", reply = "I like the way you think, friend. Shall we go talk to the quartermaster?", fx = { align = { honor = -1 } } },
        { text = "Fair is fair. Someone has to stand here.", next = "BACK", reply = "Aye, I know, I know. Doesn't mean I have to like it.", fx = { align = { honor = 1 } } },
      },
    },
    seen = {
      lines = { { id = "s_default", text = "Once, from far off, lurching up the road with its cleaver dragging behind. I've never run so fast in my life, and I'm not ashamed to say it, because the ones who stood are on the wall at the town hall now." } },
      choices = { { text = "Running was the sensible choice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Joined the Watch for the steady pay. Nobody told me about the straws." } },
    _none = { { id = "tp_none", text = "Don't know. Ask someone who drew a better post." } },
  },
}

-- Watcher Sarys: posted on the road north of the Rotting Orchard.
P:NPC {
  key = "dusk_watcher_sarys", id = TODO_NPC("Watcher Sarys"), name = "Watcher Sarys", title = "The Night Watch", gender = "female",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "brisk", "stern" }, values = { "dutiful", "brave" },
  notices = { "watch" },
  impression = {
    first = "She knows the orchard road by every rut and root.",
    third = "{name} met Watcher Sarys of the Night Watch on the road north of the Rotting Orchard.",
  },
  greetings = {
    { id = "g_default", text = "Move along quickly, {class}, and stay on the road. The orchard's no place to wander." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still alive, I see. Good." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Sarys. I hold this part of the road against whatever comes up from the Rotting Orchard, and I've done it longer than anyone else on the line." } },
      again = { { id = "h_again", text = "What else? Be quick." } },
      choices = {
        { text = "What happened to the orchard?", next = "orchard" },
        { text = "How have you lasted so long here?", next = "lasted" },
        { text = "Keep the road, Sarys.", next = "END" },
      },
    },
    orchard = {
      lines = { { id = "o_default", text = "It was the finest orchard in the county once, until the dead came up out of the soil and the trees went black. The fruit still grows, but nobody's fool enough to eat it." } },
      choices = { { text = "Can it ever be healed?", next = "healed" }, { text = "Something else.", next = "BACK" } },
    },
    healed = {
      lines = { { id = "h2_default", text = "The priests say yes and the farmers say no, and I've stopped waiting for either to prove it. I'd settle for keeping what's in it from getting out." } },
      choices = {
        { text = "Burn it to the ground, then. Start again.", next = "BACK", reply = "It's been suggested. The Ebonlockes won't hear of it, not yet.", fx = { align = { light = -1 } } },
        { text = "The Light can cleanse even this.", next = "BACK", reply = "I hope you're right. I've seen little sign of it, though.", fx = { align = { light = 1 } } },
      },
    },
    lasted = {
      lines = { { id = "l_default", text = "I listen, I don't wander and I never turn my back on the orchard. Most watchers who fall here make one of those mistakes, and usually the last one." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Watch-born, Watch-raised. My mother held this road before me." } },
    _none = { { id = "tp_none", text = "Not my concern. My concern is this road." } },
  },
}

-- Watcher Selkin: posted on the road north of the Rotting Orchard.
P:NPC {
  key = "dusk_watcher_selkin", id = TODO_NPC("Watcher Selkin"), name = "Watcher Selkin", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "earnest", "wary" }, values = { "family", "dutiful" },
  notices = { "watch", "travel" },
  impression = {
    first = "He writes letters home between watches and never sends them.",
    third = "{name} met Watcher Selkin of the Night Watch on the road north of the Rotting Orchard.",
  },
  greetings = {
    { id = "g_default", text = "Hello, {class}. You're a welcome sight, out here; most faces on this road are dead ones." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Good to see a friendly face." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Selkin. I came to Darkshire from Elwynn when my family moved here for cheap land, and I joined the Watch when I learned why it was cheap." } },
      again = { { id = "h_again", text = "What else? I'm glad of the conversation." } },
      choices = {
        { text = "Do you regret coming here?", next = "regret" },
        { text = "What's on your mind?", next = "letters" },
        { text = "Take care, Selkin.", next = "END" },
      },
    },
    regret = {
      lines = { { id = "r_default", text = "Some days, when the howling's close. But my family's here now, and someone has to stand between them and the woods, so I'd rather it was me." } },
      choices = {
        { text = "Then you should take them back to Elwynn.", next = "BACK", reply = "And leave the town to fall? No, friend, we stay. Darkshire's ours now.", fx = { align = { order = -1 } } },
        { text = "A man stands where his duty puts him.", next = "BACK", reply = "Aye, that's what my father said, and I mean to live up to it.", fx = { align = { order = 1 } } },
      },
    },
    letters = {
      lines = { { id = "l_default", text = "I write letters to my sister in Goldshire, telling her all about the Watch, and then I don't send them. I don't want her to worry, and she would, if she knew the half of it." } },
      choices = { { text = "Send one. She'd want to hear from you. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Elwynn farm boy, Darkshire watchman. I'm still not sure which I am more." } },
    _none = { { id = "tp_none", text = "I don't know, sorry. Ask in town; someone there will." } },
  },
}

-- Watcher Thayer: posted on the road north of the Rotting Orchard.
P:NPC {
  key = "dusk_watcher_thayer", id = TODO_NPC("Watcher Thayer"), name = "Watcher Thayer", title = "The Night Watch", gender = "male",
  role = "soldier", tier = "service",
  communities = { "darkshire" }, temper = { "gruff", "proud" }, values = { "brave" },
  notices = { "kit", "watch" },
  impression = {
    first = "He wants to face Stitches, and thinks the others are cowards.",
    third = "{name} met Watcher Thayer of the Night Watch on the road north of the Rotting Orchard.",
  },
  greetings = {
    { id = "g_default", text = "Another blade on the road. Good, {class}, stand with me if that thing comes." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Still waiting for the abomination, are you? So am I." },
  },
  notice = {
    { id = "n_warrior", cat = "kit", when = { class = "WARRIOR" },
      text = "A warrior. Good, you'll know what to do when it comes, which is more than half this line does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Watcher Thayer. The others on this line hope Stitches never comes, and I hope it does, so I can put an end to it." } },
      again = { { id = "h_again", text = "What else? I'm not going anywhere." } },
      choices = {
        { text = "You want to fight that thing?", next = "fight" },
        { text = "You think the others are afraid?", next = "others" },
        { text = "Good luck, Thayer.", next = "END" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "It killed my patrol partner last spring, and I've been sharpening this blade ever since. I know it's big and I know it's strong, but it's stupid, and stupid things die." } },
      choices = {
        { text = "Courage is good. Recklessness gets you killed.", next = "BACK", reply = "Maybe so. But nobody ever killed an abomination by being careful.", fx = { align = { order = 1 } } },
        { text = "Then break the line and hunt it down yourself.", next = "BACK", reply = "Don't tempt me. The commander would have my badge, but I'd have its head.", fx = { align = { order = -1 } } },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Afraid, aye, though they've a right to be, I suppose. Merant runs, Selkin writes letters, and Sarys has seen too much to think anything can be won, so somebody's got to want the fight." } },
      choices = { { text = "Maybe they're wiser than you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Twelve years a watcher. I've buried more friends than I can count, and I mean to stop counting." } },
    _none = { { id = "tp_none", text = "Don't know, don't care. Ask me about Stitches." } },
  },
}

-- Apothecary Faustin: Forsaken apothecary at Beggar's Haunt, sent south at Varimathras's behest.
P:NPC {
  key = "dusk_apothecary_faustin", id = TODO_NPC("Apothecary Faustin"), name = "Apothecary Faustin", title = "Royal Apothecary Society", gender = "male",
  role = "questgiver", tier = "quest",
  communities = {}, temper = { "sly", "cold" }, values = { "clever" },
  notices = { "craft", "wonder" },
  impression = {
    first = "He brews a truth serum and smiles at the word truth.",
    third = "{name} met Apothecary Faustin of the Royal Apothecary Society at Beggar's Haunt.",
  },
  greetings = {
    { id = "g_default", text = "A visitor to our humble haunt, how delightful. Do keep your voice down, the Night Watch has such sensitive ears." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Oh, dear. A living Alliance face in our little corner of Duskwood. I do hope you're lost, because the alternative is so tiresome." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The brew is coming along nicely, thank you for asking." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist! How refreshing. Most of the Horde think a potion is something you drink, not something you perfect." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Apothecary Faustin, of the Royal Apothecary Society. Zraedus and I were sent south at Varimathras's behest to survey these lands, and I'm making the most of the opportunity.", fx = { learn = { "forsaken" } } } },
      again = {
        { id = "h_again", text = "Something else, my dear? Ask quickly; the brew bubbles." },
        { id = "h_again2", text = "Go on. I always have time for curiosity." },
      },
      choices = {
        { text = "What are you brewing?", next = "serum", when = { faction = "Horde" } },
        { text = "What brings you to Duskwood?", next = "why" },
        { text = "The Society's work makes me uneasy.", next = "society" },
        { text = "Zraedus sent me to help with the serum.", next = "done", when = { questDone = TODO_QUEST("Nothing But The Truth") } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    serum = {
      lines = { { id = "s_default", text = "A truth serum, for a human spy the orcs of Stonard are holding. He saw our camp, you see, and the orcs would so like to know what he saw, so we're being helpful allies." } },
      choices = {
        { text = "Helpful? That sounds like poison.", next = "poison" },
        { text = "Something else.", next = "BACK" },
      },
    },
    poison = {
      lines = { { id = "p_default", text = "What a suspicious mind you have, my friend. A truth serum is a truth serum, and if the spy should die of it before he says anything inconvenient, well, chemistry is an inexact science." } },
      choices = {
        { text = "The Horde deserves honesty from its own.", next = "BACK", reply = "Of course, of course. And it shall have all the honesty that's good for it.", fx = { align = { honor = 1 } } },
        { text = "Some secrets are worth keeping.", next = "BACK", reply = "Now you're thinking like an apothecary. The Dark Lady would approve.", fx = { align = { honor = -1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The Society needs ingredients, and these forests grow some of the most marvellous horrors. Shadow panthers, mire lords, deep striders, all of it ripe for study and all of it so conveniently far from prying eyes." } },
      choices = { { text = "Not so far as you think. Something else.", next = "BACK" } },
    },
    society = {
      lines = { { id = "so_default", text = "It should, my dear, and that's rather the point. We're working on something that will change the world, and the world is rarely comfortable while it's being changed.", fx = { learn = { "new_plague" } } } },
      choices = { { text = "That's what worries me. Something else.", next = "BACK" } },
    },
    done = {
      lines = { { id = "d_default", text = "Splendid, a willing pair of hands. Fetch me what the forests grow and the serum will be ready for our friend in Stonard, and do try not to mention to the orcs who brewed it." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a physician in Lordaeron, once. Now I'm something much more useful." } },
    _none = { { id = "tp_none", text = "How dreary. Ask me about something that can be boiled." } },
  },
}

-- Deathstalker Zraedus: Forsaken deathstalker at Beggar's Haunt, partner to Faustin.
P:NPC {
  key = "dusk_deathstalker_zraedus", id = TODO_NPC("Deathstalker Zraedus"), name = "Deathstalker Zraedus", gender = "male",
  role = "questgiver", tier = "quest",
  communities = {}, temper = { "cold", "wary" }, values = { "dutiful", "clever" },
  notices = { "watch", "kit" },
  impression = {
    first = "He speaks of the orcs as allies with a pause each time.",
    third = "{name} met Deathstalker Zraedus at Beggar's Haunt in Duskwood.",
  },
  greetings = {
    { id = "g_default", text = "Quietly, now. Nobody is supposed to know we're here, and I'd like to keep it that way." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "You've wandered somewhere you shouldn't have, living one. Walk away, and we'll both pretend this never happened." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I hope nobody followed you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Deathstalker Zraedus. I watch over this camp, and over Faustin, who requires more watching than the camp does." } },
      again = {
        { id = "h_again", text = "More questions? Be brief, and be quiet." },
        { id = "h_again2", text = "Go on. I'm listening, and so are the trees." },
      },
      choices = {
        { text = "Who are you hiding from?", next = "hiding" },
        { text = "What happened to the human spy?", next = "spy", when = { faction = "Horde" } },
        { text = "You don't trust the orcs, do you?", next = "orcs" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    hiding = {
      lines = { { id = "h2_default", text = "The Night Watch, the Alliance, the odd worgen, and our dear allies in the Horde, who would ask too many questions about what the Society does down here. The fewer who know of Beggar's Haunt, the better." } },
      choices = { { text = "Even the Horde? Something else.", next = "BACK" } },
    },
    spy = {
      lines = { { id = "s_default", text = "A human infiltrator saw our camp, but before I could deal with him, some of our orcish brethren caught him and took him to Stonard. Faustin is preparing something to help them question him, or to stop him talking, whichever comes first." } },
      choices = {
        { text = "Stopping him from talking is the safer choice.", next = "safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "sa_default", text = "Safer for us, at least. What the orcs never learn, they can never resent, and the Dark Lady values peace among her allies." } },
      choices = {
        { text = "The Horde shouldn't keep secrets from itself.", next = "BACK", reply = "How idealistic. The Horde is many things, and honest has never been one of them.", fx = { align = { honor = 1 } } },
        { text = "Every faction keeps its secrets. Wise of you.", next = "BACK", reply = "Indeed. You understand the Forsaken better than most.", fx = { align = { honor = -1 } } },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "I trust them to be orcs, which is to say loud, proud and useful in a fight. Whether I trust them with the Society's work is another matter, and one I'll keep to myself." } },
      choices = { { text = "Spoken like a true deathstalker. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I served the Dark Lady since the day she freed us. I'll serve her until there's nothing left of me to serve." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't care to. Ask Faustin; he enjoys talking." } },
  },
}
