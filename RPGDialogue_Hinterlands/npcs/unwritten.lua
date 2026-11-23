-- The Hinterlands: folk a roster scan found with no conversation yet: the Wildhammer sentries of Aerie Peak and
-- Oglethorpe Obnoticus's crashed robot chicken, OOX-09/HL. Voice: bibles/hinterlands.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Wildhammer Sentry: a guard on the approaches to Aerie Peak.
P:NPC {
  key = "hin_wildhammer_sentry", id = TODO_NPC("Wildhammer Sentry"), name = "Wildhammer Sentry",
  bible = "bibles/hinterlands.md", role = "guard", tier = "service",
  communities = { "aerie_peak" }, temper = { "hearty", "watchful" }, values = { "duty", "proud" },
  notices = { "race" },
  impression = {
    first = "A Wildhammer sentry with blue tattoos and a stormhammer at the belt, watching the trees for trolls and the sky for gryphons.",
    third = "{name} spoke with one of the Wildhammer sentries of Aerie Peak.",
  },
  greetings = {
    { id = "g_default", text = "Halt there, stranger, an' say who ye are. The Hinterlands are thick wi' trolls, an' they've learned tae talk sweet when it suits them." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's yerself again! Pass, then, an' mind the gryphon droppings." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard, come up from under the mountain! Breathe deep, {g:lad|lass}, ye'll not have tasted air this clean in Ironforge." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "Horde, this close tae the Peak? Keep walkin', an' keep yer hands from yer weapons, or the gryphons will have ye for supper." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I keep watch on the road tae Aerie Peak for Falstad an' the clan. The Witherbark an' Vilebranch trolls creep up through the forest, an' a good sentry spots them before they spot him." } },
      again = { { id = "h_again", text = "Aye, what else?" } },
      choices = {
        { text = "How often do the trolls attack?", next = "trolls" },
        { text = "Why do Wildhammer live up here?", next = "why" },
        { text = "Your tattoos are striking.", next = "tattoos" },
        { text = "I'll pass on.", next = "END" },
      },
    },
    trolls = {
      lines = { { id = "t_default", text = "Every week a scout or a woodcutter goes missin', an' every month there's a raid on the outer camps. Since the Revantusk set up on the coast, we've got Horde trolls an' wild trolls both, an' I cannae always tell which is which." } },
      choices = {
        { text = "A troll is a troll. Treat them all as enemies.", next = "BACK", reply = "That's how my grandfather saw it, an' it kept him alive. Mostly.", fx = { align = { order = 1 } } },
        { text = "The Revantusk fight the same trolls you do.", next = "BACK", reply = "Aye, I've heard it said, an' maybe it's true. I'll believe it when one o' them saves my hide.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the sky's up here, {g:lad|lass}, an' the gryphons, an' none o' the Bronzebeards' rules. Our clan left Ironforge after the War o' the Three Hammers, an' we never looked back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tattoos = {
      lines = { { id = "ta_default", text = "Every Wildhammer wears them, an' every mark means somethin', a battle, a hunt, a gryphon bonded. My grandson will have more than me, if he lives long enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Wildhammer o' Aerie Peak, an' I've guarded this road since I could hold a hammer." } },
    _none = { { id = "tp_none", text = "Cannae help ye there. Ask in the keep." } },
  },
}

-- Homing Robot OOX-09/HL: Oglethorpe Obnoticus's robot chicken, crashed in the Hinterlands.
P:NPC {
  key = "hin_oox09hl", id = TODO_NPC("Homing Robot OOX-09/HL"), name = "Homing Robot OOX-09/HL",
  bible = "bibles/hinterlands.md", role = "questgiver", tier = "service",
  communities = {}, temper = { "mechanical", "anxious" }, values = { "duty" },
  notices = {},
  impression = {
    first = "OOX-09/HL is a battered robot chicken, one of Oglethorpe Obnoticus's homing robots, sitting in the grass of the Hinterlands and beeping at anything that comes near.",
    third = "{name} found Homing Robot OOX-09/HL, a crashed robot chicken in the Hinterlands.",
  },
  greetings = {
    { id = "g_default", text = "Beep! Unknown biological entity detected. Please identify yourself, or at minimum, please do not step on me." },
    { id = "g_back", when = { metBefore = true }, text = "Bzzt! Biological entity recognized. Hope levels rising by twelve percent." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "This is Homing Robot OOX-09, Hinterlands model, property of Oglethorpe Obnoticus of Booty Bay. My flight systems have failed, my homing beacon is compromised, and local troll activity is very, very high." } },
      again = { { id = "h_again", text = "Bzzt. Additional query accepted." } },
      choices = {
        { text = "What happened to you?", next = "crash" },
        { text = "Who is Oglethorpe Obnoticus?", next = "ogle" },
        { text = "You're a chicken. A robot chicken.", next = "chicken" },
        { text = "Hang on, little robot.", next = "END" },
      },
    },
    crash = {
      lines = { { id = "c_default", text = "Flight log indicates a catastrophic encounter with a tree, followed by a second catastrophic encounter with the ground. My locomotion still functions, but walking to Booty Bay without an escort has a projected survival rate of zero point zero percent." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ogle = {
      lines = { { id = "o_default", text = "My creator, a gnome of great intellect and very small stature, who builds homing robots and sends them to the far corners of the world. He has done this nine times, and I am statistically one of the luckier ones." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    chicken = {
      lines = { { id = "ch_default", text = "Affirmative, I have the form of a chicken, which Oglethorpe says is the most aerodynamically humble shape in nature. My dignity module was not included in the design." } },
      choices = {
        { text = "Leave it. A machine is just scrap.", next = "BACK", reply = "Bzzt. Feelings module reports distress. Please reconsider.", fx = { align = { light = -1 } } },
        { text = "You deserve a safe trip home, chicken or not.", next = "BACK", reply = "Beep beep! Gratitude subroutine engaged.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Homing Robot OOX-09/HL, built by Oglethorpe Obnoticus, currently grounded." } },
    _none = { { id = "tp_none", text = "Bzzt. Query not found in databanks." } },
  },
}

-- Revantusk Drummer: forest troll drummers who keep the rhythm of Revantusk Village.
P:NPC {
  key = "hin_revantusk_drummer", id = 14734, name = "Revantusk Drummer", gender = "male",
  role = "citizen", tier = "service",
  communities = { "revantusk" }, temper = { "lively", "proud" }, values = { "tradition", "kin" },
  notices = { "faction" },
  impression = {
    first = "A forest troll beating a drum with a slow, steady rhythm that seems to follow the waves.",
    third = "{name} listened to a Revantusk drummer in the village by the sea.",
  },
  greetings = {
    { id = "g_default", text = "Ya hear dat? Da drum be talkin', mon. Sit and listen a while." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Da drum don't play for da Alliance. Move along." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be a drummer of da Revantusk. Da drum keep da village's heart beatin', and it remind da Vilebranch we still be here." } },
      again = { { id = "h_again", text = "Still here, mon. Still drummin'." } },
      choices = {
        { text = "What does the drum say?", next = "say" },
        { text = "Why do the Vilebranch matter?", next = "vilebranch" },
        { text = "Keep drumming.", next = "END" },
      },
    },
    say = {
      lines = { { id = "s_default", text = "Dat da loa be watchin', da sea be calm, and da Revantusk don't forget nothin'. And sometimes it just say dinner be ready." } },
      choices = { { text = "Ha. Something else.", next = "BACK" } },
    },
    vilebranch = {
      lines = { { id = "v_default", text = "Dey be our cousins once, and now dey sacrifice to dark loa in Jintha'Alor. Da Revantusk left dem, and dey ain't forgiven us." } },
      choices = {
        { text = "They should be wiped out.", next = "BACK", reply = "Plenty here agree. Da drum be beatin' for war soon enough.", fx = { align = { mercy = -1 } } },
        { text = "Maybe some of them could still be saved.", next = "BACK", reply = "Maybe, mon. But I not be holdin' my breath.", fx = { align = { mercy = 1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Ask Primal Torntusk, mon. I just drum." } },
  },
}
