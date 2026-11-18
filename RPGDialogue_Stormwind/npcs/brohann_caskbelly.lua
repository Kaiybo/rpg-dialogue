-- Brohann Caskbelly, Explorers' League, in Stormwind's Dwarven District. Voice: bibles/brohann_caskbelly.md
-- Old, proud, ready to retire; his last assignment is the lost Temple of Atal'Hakkar.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local QT = TODO_QUEST("In Search of The Temple")
local QRT = TODO_QUEST("Rhapsody's Tale")
local QA = TODO_QUEST("Into The Temple of Atal'Hakkar")

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
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Brohann Caskbelly, Explorers' League, or what's left o' him. I was young an' full o' vigour like ye once, an' now I'm old an' I mostly remember things, chiefly the Temple of Atal'Hakkar, which I never found, an' the gryphon pilot I lost lookin' for it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("In Search of The Temple"), minLevel = 38 },
          text = "There was one mystery that eluded me, an' the League sent me after it fer my final quest: the Temple of Atal'Hakkar, said tae be in the Swamp o' Sorrows. I searched from a gryphon's back an' never found it." },
        { id = "h_found", tags = { "news" }, when = { questRecent = { TODO_QUEST("In Search of The Temple"), days = 3 } },
          text = "Sunk beneath the Pool o' Tears, an' surrounded by green dragons? By my beard, no wonder I never saw it from the air. Somethin's gone terribly wrong in that swamp." },
        { id = "h_hinter", when = { questActive = TODO_QUEST("To The Hinterlands") },
          text = "Falstad Wildhammer at Aerie Peak will know the pilot's name, for I'm ashamed tae say I've forgotten it. Find out what happened tae the poor fellow." },
        { id = "h_tablets_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Into The Temple of Atal'Hakkar"), days = 5 } },
          text = "The Atal'ai Tablets! Our names'll go down in history together, {name}. Ye've helped an old dwarf finish his last duty, an' I'll be grateful fer the rest o' my days." },
        { id = "h_rhapsody", when = { questDone = QRT },
          text = "Rhapsody Shindigger! I've said it every mornin' since ye brought me his tale, so I'll never lose it again. Alive, an' brewin' in the Hinterlands, the old devil." },
        { id = "h_explorer", when = { origin = "dwarf_explorers_league" },
          text = "Ye've the League's mark about ye, {g:lad|lass}, the squint o' someone who's read too many maps by candlelight. Sit; we're kin twice over." },
      },
      again = {
        { id = "h_again", text = "What else? I've stories enough fer a week." },
        { id = "h_again2", text = "Go on, {g:lad|lass}. Old dwarves love a question." },
        { id = "h_again3", text = "Where was I? Ach, never mind where I was; ask me somethin' new an' I'll start fresh." },
      },
      choices = {
        { text = "I've never heard of the Temple of Atal'Hakkar.", next = "temple" },
        { text = "Why give up exploring?", next = "retire" },
        { text = "What happened to your gryphon pilot?", next = "pilot" },
        { text = "What's the best thing you ever found?", next = "stories" },
        { text = "This corner of Stormwind smells like a forge.", next = "district" },
        { text = "What are the Atal'ai Tablets, exactly?", next = "tablets", when = { any = { { questActive = QA }, { questDone = QA } } } },
        { text = "Tell me about the Explorers' League.", next = "league", when = { race = "Dwarf" } },
        { text = "I carry the League's mark myself, Brohann.", next = "xexplorer", when = { origin = "dwarf_explorers_league" } },
        { text = "Aerie Peak's my home. I know its riders.", next = "xwildhammer", when = { origin = "dwarf_wildhammer_kin" } },
        { text = "You've dug under Khaz Modan. Ever reached Gnomeregan?", next = "xgnome", when = { race = "Gnome" } },
        { text = "My people fought the trolls long before yours.", next = "xnelf", when = { race = "NightElf" } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Farewell, Brohann.", next = "END" },
      },
    },
    temple = {
      lines = { { id = "t_default", text = "A holy shrine o' the troll god Hakkar the Soulflayer, kept by a vicious tribe called the Atal'ai. The legends say it was impenetrable, an' that was before it sank." },
      },
      choices = {
        { text = "Why does the League want it?", next = "temple_why" },
        { text = "Who was Hakkar the Soulflayer?", next = "temple_hakkar" },
        { text = "How does a whole temple sink?", next = "temple_dragons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple_hakkar = {
      lines = { { id = "th_default", text = "A blood god o' the jungle trolls, back when the Gurubashi ruled all o' Stranglethorn. They called him up tae win their wars, an' he wanted blood fer it, more an' more, till the trolls themselves turned on his priests an' drove them out intae the swamp.",
          fx = { learn = { "sunken_temple", "zul_gurub" } } },
      },
      choices = {
        { text = "And the priests built the temple there?", next = "temple_atalai" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple_atalai = {
      lines = { { id = "ta_default", text = "Aye, the Atal'ai, an' they never stopped prayin' fer him tae come back, by all accounts. That's the part that keeps me up at night, {g:lad|lass}: no' the old stones, but the folk still kneelin' in front o' them." },
      },
      choices = {
        { text = "Then the League's not only after history.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple_dragons = {
      lines = { { id = "td_default", text = "The trolls' own tale says the green dragons pulled it under, tae stop the Atal'ai callin' their god back. I've always laughed at that, but then, I've never found the place, so who's tae say.",
          fx = { learn = { "green_dragons" } } },
        { id = "td_found", when = { questDone = QT },
          text = "The trolls' own tale says the green dragons pulled it under, tae stop the Atal'ai callin' their god back. I laughed at that when I was young, an' then ye came back an' told me there were green dragons sleepin' round the Pool o' Tears, an' I've no' laughed since." },
      },
      choices = {
        { text = "Dragons guarding a temple means something terrible inside.", next = "BACK" },
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
        { text = "What will you do once you've retired?", next = "retire_after" },
        { text = "Why retire in Stormwind, and not Ironforge?", next = "retire_stormwind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    retire_after = {
      lines = { { id = "ra_default", text = "Write it all down afore it leaks out o' my ears, every hole an' every ruin, an' send it tae Magellas fer the Hall. Then sit by a warm forge wi' a pint an' tell lies tae young explorers about how brave I was." },
      },
      choices = {
        { text = "They won't all be lies, Brohann.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    retire_stormwind = {
      big = true,
      lines = { { id = "rs_default", text = "Because the tram brings me home in an hour whenever I'm homesick, an' because the League's southern digs all report through here. An' I'll be honest wi' ye: Ironforge is full o' dwarves who remember me young, an' I'd rather they kept rememberin' it that way." },
      },
      choices = {
        { text = "Pride's a poor reason to stay away from home.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them remember you young. That's a wise choice.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
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
      choices = {
        { text = "His name was Rhapsody Shindigger. He's alive.", next = "pilot_name", when = { questDone = QRT } },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pilot_name = {
      lines = { { id = "pn_default", text = "Rhapsody, aye, Rhapsody Shindigger, an' how did I ever let that slip? Ye tell me he swam out o' that swamp wi' a troll's trinket in his fist, an' now he brews in the Hinterlands an' cannae hold a gryphon's reins fer the shakin'." },
      },
      choices = {
        { text = "He drinks to forget the swamp. That's on your expedition.", next = "pilot_drink" },
        { text = "He seemed happy enough, in his way.", next = "pilot_drink" },
      },
    },
    pilot_drink = {
      big = true,
      lines = { { id = "pd_default", text = "I'll carry that, then, alongside the rest. I've a mind tae send him a cask o' the best Ironforge has, an' I've an equal mind that it's the last thing the poor fellow needs. What would ye do?" },
      },
      choices = {
        { text = "Go and see him yourself. A cask's no apology.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Send the cask. He'll take it the way it's meant.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The tablets
    tablets = {
      lines = { { id = "tb2_default", text = "Stone tablets the Atal'ai carved, tellin' their own history in their own hand, from the Gurubashi wars tae the sinkin'. There's no' a scholar in Ironforge who's read a troll's account o' itself, an' I mean tae be the first who has." },
        { id = "tb2_done", when = { questDone = QA },
          text = "The ones ye brought me are bein' copied in Ironforge as we speak, an' Magellas says there's a passage in them nobody can make sense of yet. It's the Atal'ai tellin' their own history, {g:lad|lass}, an' we're the first who've ever read it." },
      },
      choices = {
        { text = "What happens to the tablets now?", next = "tablets_fate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tablets_fate = {
      big = true,
      lines = { { id = "tf_default", text = "Some say lock 'em in the Hall o' Explorers an' let scholars pore over 'em, an' some priests say smash 'em, so nobody learns the prayers carved on 'em. I've my own view, but I'd like tae hear yers first." },
      },
      choices = {
        { text = "Study them. Knowing the enemy's prayers is how we stop them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Smash them. Some words should never be read again.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "What's your own view, Brohann?", next = "tablets_view" },
      },
    },
    tablets_view = {
      lines = { { id = "tv_default", text = "Copy every word, then bury the stones somewhere only Magellas knows. The knowledge is ours tae keep, but I'll no' leave a ready-made altar lyin' about fer some fool tae kneel at." },
      },
      choices = {
        { text = "A sensible middle road, Brohann.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Stories
    stories = {
      lines = { { id = "st_default", text = "Ach, there's a question tae make an old dwarf's eyes water. I've walked the halls o' Uldaman where the stone's carved finer than any mason alive could manage, an' I've stood at the gate o' Zul'Farrak wi' sand in my beard an' trolls on the wall." },
      },
      choices = {
        { text = "Tell me about Uldaman.", next = "stories_uldaman" },
        { text = "What happened at Zul'Farrak?", next = "stories_zf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stories_uldaman = {
      lines = { { id = "su_default", text = "Deep in the Badlands, an' older than Ironforge by a long road. We found carvin's there that look like dwarves, but made o' stone, as if the titans shaped us an' then went on their way, an' if that's true, {g:lad|lass}, it changes everythin' we thought we knew about ourselves.",
          fx = { learn = { "uldaman" } } },
      },
      choices = {
        { text = "Dwarves made of stone? That's a big claim.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stories_zf = {
      lines = { { id = "sz_default", text = "I got as far as the gate an' no further, fer the Sandfury had a mind tae add my skull tae the decorations. I took one rubbin' off the outer wall an' ran, an' that rubbin' hangs in the Hall o' Explorers wi' my name under it, which is more than most get.",
          fx = { learn = { "zul_farrak" } } },
      },
      choices = {
        { text = "Running was the wise thing to do.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The district
    district = {
      lines = { { id = "di_default", text = "That's the smithies, an' a good honest smell it is. The humans gave us this corner after the war, when half their city needed rebuildin' an' dwarven hands were cheap an' willin', an' most o' us never went home." },
      },
      choices = {
        { text = "Do the humans treat you well here?", next = "district_humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    district_humans = {
      big = true,
      lines = { { id = "dh_default", text = "Well enough, though some o' them think every dwarf is a smith an' every smith is a drunk, an' I'm only one o' those. Stormwind owes Ironforge a great deal, an' I'll say this: the humans remember it better than their nobles do." },
      },
      choices = {
        { text = "Stormwind should honour that debt properly.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Allies help each other. Nobody owes anyone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Who the player is
    xexplorer = {
      lines = { { id = "xe_default", text = "Do ye now! Then Magellas sent ye out green, the way he sent me, wi' a pick an' a notebook an' no' a word o' warnin'. What are they diggin' this season, {g:lad|lass}? I've no' had a letter in a month." },
      },
      choices = {
        { text = "Uldaman, mostly, and arguing about Uldaman.", next = "stories_uldaman" },
        { text = "Too much to tell. I'll write it down for you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xwildhammer = {
      lines = { { id = "xw_default", text = "Then ye'll know Falstad, an' the aviary, an' ye'll know what it means fer a rider tae fall. I flew wi' one o' yer kin over that swamp, an' I lost him, an' I'd count it a kindness if ye'd no' look at me too hard." },
      },
      choices = {
        { text = "Riders know the risk, Brohann. It wasn't your fault.", next = "pilot_blame", fx = { affinity = 1 } },
        { text = "Aerie Peak remembers. You should go and make it right.", next = "pilot_blame" },
      },
    },
    xgnome = {
      lines = { { id = "xg_default", text = "Once, through a side tunnel, an' yer people were so polite about chasin' me out that I've no' forgotten it. I'm sorry fer what's become o' the place; we built the tram together, yer folk an' mine, an' I'd like tae think we'll dig it back together too.",
          fx = { learn = { "gnomeregan" } } },
      },
      choices = {
        { text = "We will. Gnomeregan isn't lost forever.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = { { id = "xn_default", text = "So I've read, an' I'd give my last tooth tae hear it from someone who knows the old tales. Did yer people ever face the Gurubashi, or only the forest trolls o' the north? There's nothin' in our books about it but guesses." },
      },
      choices = {
        { text = "The Amani, in the north. Long before your mountains had names.", next = "BACK", fx = { affinity = 1 } },
        { text = "Those tales are ours to keep, dwarf.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    league = {
      lines = { { id = "l_default", text = "The finest company o' scholars an' diggers in Khaz Modan, or so we tell everyone. Magellas runs it from the Hall o' Explorers now, an' he's a sharper mind than I ever was, though don't tell him." },
      },
      choices = {
        { text = "Some call the League grave-robbers. Are they wrong?", next = "op_league" }, { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    explorers_league = { { id = "tp_explorers_league", text = "The Explorers' League sent me into every hole in Khaz Modan, and I came out of most of them. Now I'm a wee bit too stiff for holes, and I've to send younger knees in my place." } },
    uldaman = { { id = "tp_uldaman", text = "Uldaman's the oldest dig there is, {g:lad|lass}, and there's things in its halls that make the titans look like they were in a hurry. I'd go back tomorrow if my knees would only agree with me." } },
    magni = { { id = "tp_magni", text = "King Magni's the best patron the League ever had, and he funds digs that would make a goblin weep. He wants to know where we came from, and so do I, though I'd settle for knowing where I left my pipe." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "Zul'Farrak's a troll city in the Tanaris sands, full of sandfury trolls and secrets older than the dunes. I got as far as the gate once, and the trolls made it plain I'd go no further." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the only place in Tanaris with water, and the goblins charge for it by the cup. I paid, mind, and I'd pay again, because the sand's no fit place for a thirsty dwarf." } },
    thandol_span = { { id = "tp_thandol_span", text = "I crossed the Thandol Span a hundred times on my way to the Wetlands, and every time I stopped to admire the stonework. If the Dark Irons have harmed it, I'll want a word with them, and so will every mason in Ironforge." } },
    background = { { id = "tp_bg", text = "Fifty years wi' the Explorers' League, give or take, an' a hundred places I couldnae pronounce tae save my life." } },
    advice = { { id = "tp_ad", text = "Write everythin' down, {g:lad|lass}. Ye'll forget names when ye're old; I'm proof o' that." } },
    _none = { { id = "tp_none", text = "Ah, I may have known once, but it's gone now with the pilot's name. Ask at the Hall o' Explorers in Ironforge." } },
  },
}
