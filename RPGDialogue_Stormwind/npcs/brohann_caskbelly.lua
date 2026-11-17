-- Brohann Caskbelly, Explorers' League, in Stormwind's Dwarven District. Voice: bibles/brohann_caskbelly.md
-- Old, proud, ready to retire; his last assignment is the lost Temple of Atal'Hakkar.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "brohann_caskbelly", id = TODO_NPC("Brohann Caskbelly"), name = "Brohann Caskbelly",
  title = "Explorers' League",
  bible = "bibles/brohann_caskbelly.md", role = "scholar", tier = "quest",
  communities = { "stormwind" }, temper = { "warm" }, values = { "curious", "proud" },
  notices = { "race", "travel" },

  impression = {
    first = "Brohann Caskbelly has explored more of the world than most people have heard of, and now his knees won't let him finish. Asking for help costs him, and he asked anyway.",
    third = "{name} met Brohann Caskbelly of the Explorers' League, an old dwarf in Stormwind whose final assignment is the sunken Temple of Atal'Hakkar.",
  },

  greetings = {
    { id = "g_op_robbers", when = { opinion = { topic = "explorers_league", stance = "grave_robbers" } }, text = "Here's the one who'd keep every tomb shut! Sit down, sit down; I'll convert ye yet, or I'll die tryin', which at my age is likely." },
    { id = "g_district", text = "Pull up a crate, {g:lad|lass}, if ye've a minute fer an old explorer." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Sit, sit. My knees have been tellin' me ye'd come." },
    { id = "g_temple", when = { questActive = TODO_QUEST("In Search of The Temple") }, text = "The Swamp o' Sorrows, {g:lad|lass}. Find me that temple, an' mind the bogs." },
    { id = "g_tablets", when = { questActive = TODO_QUEST("Into The Temple of Atal'Hakkar") }, text = "The tablets, {name}. If these old bones could brave that swamp I'd be fightin' beside ye." },
    { id = "g_done", when = { questDone = TODO_QUEST("Into The Temple of Atal'Hakkar") }, text = "There's my partner in history! Sit down; I'll tell ye what the League said about it." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}! I've been explorin' the bottom o' my mug while ye were away; it's no' much of an expedition." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at ye now, all scars an' stories. Ye remind me o' myself, back when I could climb a stair without stoppin' halfway." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I hear good things about ye in the District. The League likes folk with good names, an' so do I." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Ye've the look o' Ironforge about ye. Tell me, does the Hall o' Explorers still smell o' old maps an' older beer?" },
    { id = "n_travel", cat = "travel", when = { minLevel = 45 },
      text = "Ye've the sunburn o' Tanaris an' the mud o' somewhere worse on yer boots. Sit down an' tell an old dwarf where ye've been." },
  },

  start = "hello",
  nodes = {
    op_league = {
      lines = {
        { id = "op_league_a", text = "Ach, I've heard it, mostly from priests an' from folk whose great-grandfathers we dug up. We find out where the dwarves came from, {g:lad|lass}, an' sometimes that means openin' a tomb. So tell me straight, what d'ye make o' the work?" },
      },
      choices = {
        { text = "It's noble work. The past belongs to anyone who'll learn from it.", next = "op_league_1", fx = { opinion = { explorers_league = "admire" }, align = { order = -1 }, affinity = 2, trait = { curious = 1 } } },
        { text = "Some tombs should stay shut. The dead have earned their rest.", next = "op_league_2", fx = { opinion = { explorers_league = "grave_robbers" }, align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Useful work, so long as Ironforge pays for it and not Stormwind.", next = "op_league_3", fx = { opinion = { explorers_league = "useful" }, trait = { witty = 1 } } },
        { text = "It's our own history, and King Magni's right to want it back.", next = "op_league_4", when = { race = "Dwarf" }, fx = { opinion = { explorers_league = "admire", magni = "respect" }, affinity = 3 } },
        { text = "I've no opinion on old bones, Brohann.", next = "BACK" },
      },
    },
    op_league_1 = {
      lines = { { id = "op_league_r1", text = "Spoken like a League {g:lad|lass} already! Go tae the Hall o' Explorers an' say that tae Magellas; he'll have ye diggin' by supper." } },
      choices = { { text = "Something else, Brohann.", next = "BACK" } },
    },
    op_league_2 = {
      lines = { { id = "op_league_r2", text = "Aye, my mother said the same, an' she said it tae me at the door o' every barrow I ever opened. I'll not say ye're wrong, only that I never once listened." } },
      choices = { { text = "Something else, Brohann.", next = "BACK" } },
    },
    op_league_3 = {
      lines = { { id = "op_league_r3", text = "Ha! Magni pays, an' Magni grumbles, an' Magni reads every report afore we've dried the ink. Ye've a head fer accounts, I'll give ye that." } },
      choices = { { text = "Something else, Brohann.", next = "BACK" } },
    },
    op_league_4 = {
      lines = { { id = "op_league_r4", text = "Now there's a true son o' Khaz Modan talkin'. The stone remembers us, an' one day we'll read every word o' what it remembers." } },
      choices = { { text = "Something else, Brohann.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brohann Caskbelly, Explorers' League, or what's left o' him. I was young an' full o' vigour like ye once, an' now I'm old an' I mostly remember things." },
        { id = "h_before", when = { questBefore = TODO_QUEST("In Search of The Temple"), minLevel = 38 },
          text = "There was one mystery that eluded me, an' the League sent me after it fer my final quest: the Temple of Atal'Hakkar, said tae be in the Swamp o' Sorrows. I searched from a gryphon's back an' never found it." },
        { id = "h_found", tags = { "news" }, when = { questRecent = { TODO_QUEST("In Search of The Temple"), days = 3 } },
          text = "Sunk beneath the Pool o' Tears, an' surrounded by green dragons? By my beard, no wonder I never saw it from the air. Somethin's gone terribly wrong in that swamp." },
        { id = "h_hinter", when = { questActive = TODO_QUEST("To The Hinterlands") },
          text = "Falstad Wildhammer at Aerie Peak will know the pilot's name, for I'm ashamed tae say I've forgotten it. Find out what happened tae the poor fellow." },
        { id = "h_tablets_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Into The Temple of Atal'Hakkar"), days = 5 } },
          text = "The Atal'ai Tablets! Our names'll go down in history together, {name}. Ye've helped an old dwarf finish his last duty, an' I'll be grateful fer the rest o' my days." },
      },
      again = {
        { id = "h_again", text = "What else? I've stories enough fer a week." },
        { id = "h_again2", text = "Go on, {g:lad|lass}. Old dwarves love a question." },
      },
      choices = {
        { text = "What's the Temple of Atal'Hakkar?", next = "temple" },
        { text = "Why give up exploring?", next = "retire" },
        { text = "What happened to your gryphon pilot?", next = "pilot" },
        { text = "Tell me about the Explorers' League.", next = "league", when = { race = "Dwarf" } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Farewell, Brohann.", next = "END" },
      },
    },
    temple = {
      lines = { { id = "t_default", text = "A holy shrine o' the troll god Hakkar the Soulflayer, kept by a vicious tribe called the Atal'ai. The legends say it was impenetrable, an' that was before it sank." },
      },
      choices = {
        { text = "Why does the League want it?", next = "temple_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple_why = {
      lines = { { id = "tw_default", text = "Because nobody's ever seen inside it an' come back tae write it down, an' that's the whole point o' the League. Knowledge, {g:lad|lass}, an' a wee bit o' glory on the side." },
      },
      choices = {
        { text = "Some places should stay buried.", next = "temple_buried" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple_buried = {
      big = true,
      lines = { { id = "tb_default", text = "Ye sound like my mother. Aye, some places hold things best left alone, but if nobody looks, nobody learns what's dangerous until it comes lookin' fer us." },
      },
      choices = {
        { text = "You're right. Knowledge protects us.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "And some knowledge is better left with the dead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    retire = {
      lines = { { id = "r_default", text = "My knees gave up first, then my back, then my eyes, an' my pride's the last thing holdin' on. One last discovery fer the League, an' I'll hang up my pick wi' my head high." },
      },
      choices = {
        { text = "Then I'll help you finish it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pilot = {
      lines = { { id = "p_default", text = "One o' the finest from the aviary at Aerie Peak flew me over the swamp, an' somewhere above the bogs he fell from his mount. I've lost his name tae old age, an' I'm ashamed of it." },
      },
      choices = {
        { text = "You blame yourself?", next = "pilot_blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pilot_blame = {
      lines = { { id = "pb_default", text = "Who else would I blame? It was my expedition an' my curiosity. If he's alive, I owe him an apology, an' if he isn't, I owe him more than that." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    league = {
      lines = { { id = "l_default", text = "The finest company o' scholars an' diggers in Khaz Modan, or so we tell everyone. Magellas runs it from the Hall o' Explorers now, an' he's a sharper mind than I ever was, though don't tell him." },
      },
      choices = {
        { text = "Some call the League grave-robbers. Are they wrong?", next = "op_league" }, { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Fifty years wi' the Explorers' League, give or take, an' a hundred places I couldnae pronounce tae save my life." } },
    advice = { { id = "tp_ad", text = "Write everythin' down, {g:lad|lass}. Ye'll forget names when ye're old; I'm proof o' that." } },
    _none = { { id = "tp_none", text = "Ah, I may have known once, but it's gone now with the pilot's name. Ask at the Hall o' Explorers in Ironforge." } },
  },
}
