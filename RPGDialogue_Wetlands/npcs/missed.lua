-- Menethil Harbor, the folk a roster scan found missing (part 1): the docks, the Grassman house, the
-- Rumdnul family at the general store, and the harbor's smaller traders. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Derina Rumdnul: Gruham's wife, Gimlok's mother; helps at the general store.
P:NPC {
  key = "wl_derina_rumdnul", id = TODO_NPC("Derina Rumdnul"), name = "Derina Rumdnul", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "menethil" }, temper = { "warm", "harried" }, values = { "family", "practical" },
  notices = { "race", "class" },
  impression = {
    first = "Derina Rumdnul keeps the books at her husband Gruham's supply shop and keeps an ear cocked for her son Gimlok, who is never where she left him. She worries loudly and laughs just as loudly.",
    third = "{name} met Derina Rumdnul, wife of Menethil's general supplier and mother of a wandering boy.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, {g:lad|lass}! Ye havenae seen a wee dwarf boy about so high, have ye, likely wet tae the knees?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's yerself again. Where has that boy gotten to now, I ask ye?" },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "It's good tae see another dwarf in this soggy town. Ye'll understand me when I say a child should grow up wi' stone under his feet, an' nae a dock." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, are ye? Then tell my Gimlok the crocolisks are nae pets, for he'll nae hear it from his mother." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Derina Rumdnul, an' that's my husband Gruham behind the counter, sellin' ye things ye didnae know ye needed. I mind the ledger an' I mind our son, an' the ledger's a good deal less trouble." } },
      again = {
        { id = "h_again", text = "What else, dearie? I've one eye on the door, mind." },
        { id = "h_again2", text = "Go on, I'm listenin', mostly." },
      },
      choices = {
        { text = "What does your son get up to?", next = "gimlok" },
        { text = "How did dwarves come to keep shop here?", next = "shop" },
        { text = "You sound like you miss the mountains.", next = "home" },
        { text = "Good day, Derina.", next = "END" },
      },
    },
    gimlok = {
      lines = { { id = "g_default2", text = "Everythin' he shouldnae! He's down at the docks pokin' at crabs, or under the pier, or followin' the Halloran children up somethin' tall. He's half their size an' twice as stubborn, like his father." } },
      choices = {
        { text = "What worries you most?", next = "worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worry = {
      lines = { { id = "w_default", text = "The water, {g:lad|lass}. Dwarves sink like anvils, an' there are murlocs on the sandbars past the pier that would carry off a calf, never mind a boy. I've told him so till my beard... well, till Gruham's beard went grey." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    shop = {
      lines = { { id = "s_default", text = "Gruham said there was coin in a port where every ship needs rope an' every traveller forgets his waterskin, an' he was right, bless him. We came down from Loch Modan when Gimlok was a babe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "ho_default", text = "Aye, I do. I miss dry stockings an' a proper hearth cut from the rock, but trade's good an' the neighbours are kind, so I'll nae complain more than twice a day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a shopkeeper's wife an' a mother, an' both are full days' work in this town." } },
    _none = { { id = "tp_none", text = "I wouldnae know, dearie. Ask Gruham, he hears everythin' over that counter." } },
  },
}

-- Gimlok Rumdnul: dwarf child of Gruham and Derina.
P:NPC {
  key = "wl_gimlok_rumdnul", id = TODO_NPC("Gimlok Rumdnul"), name = "Gimlok Rumdnul", gender = "male",
  bible = "bibles/missed.md", role = "child", tier = "service",
  communities = { "menethil" }, temper = { "cheerful", "stubborn" }, values = { "curious" },
  notices = { "race" },
  impression = {
    first = "Gimlok Rumdnul is a dwarf boy, the shopkeeper's son, and he is smaller than every other child in Menethil and plainly doesn't care. He had a crab in his pocket when I met him.",
    third = "{name} met Gimlok Rumdnul, the shopkeeper's son in Menethil Harbor.",
  },
  greetings = {
    { id = "g_default", text = "Hullo! Are ye off one o' the big ships? I'm goin' tae sail on one when I'm bigger." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! Dinnae tell my mam ye saw me by the water." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ye've a proper beard! My da says mine will come in when I stop askin' about it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Gimlok, an' my da has the shop an' my mam has the shoutin'. I'm nae supposed tae be down here, but the crabs are down here, so what can I do?" } },
      again = {
        { id = "h_again", text = "What else? I've crabs tae catch." },
        { id = "h_again2", text = "Aye, go on!" },
      },
      choices = {
        { text = "What do you do with the crabs?", next = "crabs" },
        { text = "Who do you play with?", next = "play" },
        { text = "Your mother is looking for you.", next = "mam" },
        { text = "Stay out of the water, Gimlok.", next = "END" },
      },
    },
    crabs = {
      lines = { { id = "c_default", text = "I race them along the pier, an' the fastest one gets a name. This one's called Magni, because he's the king o' the crabs an' he pinches hardest." } },
      choices = {
        { text = "Does the king know about that?", next = "king" },
        { text = "Something else.", next = "BACK" },
      },
    },
    king = {
      lines = { { id = "k_default", text = "I dinnae think so, an' ye mustnae tell him! Da says the king has a hammer as big as me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    play = {
      lines = { { id = "p_default", text = "Jesse an' Regina, the tanner's two. Jesse climbs the tower an' I cannae reach the first rung yet, but I'm a better hider than the both of them, because I fit in a barrel." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mam = {
      lines = { { id = "m_default", text = "She's always lookin' for me, that's just how she is. I'll go home when I hear her the third time, because the third time is when she means it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm Gimlok Rumdnul, an' my da's shop is the one wi' all the rope." } },
    _none = { { id = "tp_none", text = "I dinnae know that one. Ask my da, he knows everythin' that costs money." } },
  },
}
