-- The Hall of Mysteries: the High Priest, the priest trainers, the paladins Tiza and Muiredon,
-- and two of the gnome mages who share the hall.
-- Voices: bibles/mystic_ward.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- High Priest Rohan: head of the Church in Ironforge; paces the Hall; sends priests on to
-- Laurena and Alathea; Fear Ward for dwarves; the censer sold to feed the city's poor.
P:NPC {
  key = "rohan", id = TODO_NPC("High Priest Rohan"), name = "High Priest Rohan", title = "Priest Trainer",
  bible = "bibles/mystic_ward.md", role = "priest", tier = "major",
  communities = { "ironforge" }, temper = { "steady", "warm" }, values = { "pious", "kind", "generous" },
  spiritSensitive = true,
  notices = { "light", "race" },

  impression = {
    first = "High Priest Rohan never stops walking the Hall of Mysteries, and he listens the whole time he walks. He talks about the Light the way a miner talks about a good seam: plainly, and with respect.",
    third = "{name} met High Priest Rohan, who leads the Church of the Light in Ironforge from the Hall of Mysteries.",
  },

  greetings = {
    { id = "g_walk", text = "Walk wi' me, if ye want a word; I think better on my feet, an' the floor's warm." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ah, one o' the Light's own. Come along, then, an' tell me how the road's treatin' ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Fall in beside me; I've done six laps o' the Hall waitin' for someone sensible tae talk tae." },
  },

  notice = {
    { id = "n_human_priest", cat = "light", when = { class = "PRIEST", race = "Human" },
      text = "A priest o' the Cathedral, up the mountain. Laurena trains her people well, an' I can always tell, for they stand as if someone's about tae ask them a hard question." },
    { id = "n_dwarf_priest", cat = "light", when = { class = "PRIEST", race = "Dwarf" },
      text = "One o' ours! I remember when the Hall had six priests an' a great deal o' empty floor, so ye'll forgive me if I'm pleased tae see ye." },
    { id = "n_gnome_priest", cat = "race", when = { class = "PRIEST", race = "Gnome" },
      text = "A gnome in vestments! Gnomeregan never kept priests, an' for years we were the only Light yer people had, so I'll admit I'm a wee bit proud o' ye." },
    { id = "n_shadow", cat = "light", when = { form = "shadow" },
      text = "Shadow, in my Hall? I'll no' throw ye out, for I know what that discipline's for, but walk softly here; the young ones frighten easily." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rohan, High Priest o' the Hall o' Mysteries. I walk this floor from mornin' tae night, because the young priests ask better questions when they have tae keep up." },
        { id = "h_fear", tags = { "news" }, when = { questActive = TODO_QUEST("A Lack of Fear") },
          text = "Ye came quickly, an' that's a good sign. There's a ward against fear that belongs tae dwarves who serve the Light, an' I've been waitin' tae teach it tae ye." },
        { id = "h_fear_done", when = { questDone = TODO_QUEST("A Lack of Fear") },
          text = "How's the ward holdin'? Fear's a clever enemy, for it never comes the same way twice, so keep the prayer fresh." },
        { id = "h_prayer", tags = { "news" }, when = { questActive = TODO_QUEST("Desperate Prayer") },
          text = "Still here? Laurena's waitin' for ye in the Cathedral, an' she's no' a woman ye keep waitin'. Go on, wi' my blessin' an' my regards." },
        { id = "h_aid", tags = { "news" }, when = { questActive = TODO_QUEST("Cenarion Aid") },
          text = "Azshara's a long way tae carry a prayer, but the Cenarion Circle asked, an' we answer when people ask. Ogtinc's on the cliffs above the old elven ruins." },
        { id = "h_human_priest", when = { class = "PRIEST", race = "Human" },
          text = "A human priest in a dwarven hall! The Light came up this mountain wi' yer people, so ye're as much at home here as I am. More, maybe, for ye didnae have tae learn the hymns in a second language." },
        { id = "h_paladin", when = { class = "PALADIN", minLevel = 50 },
          text = "A paladin wi' that look about ye usually wants my censer. Shadowbreaker's sendin' them up the tram again, I suppose." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "There ye are! I was hopin' ye'd come by, for I've a question that's been botherin' me all week an' the young ones are tired o' hearin' it." },
      },
      again = {
        { id = "h_again", text = "Another lap, then? Ask what ye like as we go." },
        { id = "h_again2", text = "Go on. I'm listenin', even when I'm lookin' at the ceiling." },
        { id = "h_again3", when = { class = "PRIEST" }, text = "What else, my friend? There's nae such thing as a daft question in this Hall, only daft answers." },
      },
      choices = {
        { text = "Why do you never stand still?", next = "pacing" },
        { text = "How did the Light come to Ironforge?", next = "came" },
        { text = "I hear you keep an exorcism censer.", next = "censer" },
        { text = "What work is there for a priest?", next = "work" },
        { text = "Teach me something, High Priest.", next = "lesson", when = { class = "PRIEST" } },
        { text = "Does the Light listen to gnomes?", next = "gnome", when = { race = "Gnome" } },
        { text = "What troubles you, High Priest?", tag = "Persuade", next = "worry",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { trait = { kind = 3 } } } } },
          fail = { next = "worry_no", fx = { affinity = -1 } } },
        { text = "Light keep you, High Priest.", next = "END" },
      },
    },

    pacing = {
      lines = {
        { id = "pa_default", text = "Partly habit, an' partly the knees, which complain less when they're movin'. Mostly it's that the folk who need me are spread all over the Hall, an' a priest who stands still only meets the bold ones." },
      },
      choices = {
        { text = "Who are the ones who don't come forward?", next = "pacing_shy" },
        { text = "A priest should wait to be asked.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "A priest should go where the need is.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, trait = { kind = 1 } } },
      },
    },
    pacing_shy = {
      lines = {
        { id = "ps_default", text = "Gnomes, mostly, sittin' at the back wi' their hands in their laps. They came here wi' nothin' after Gnomeregan, an' some o' them still think they're borrowin' the Light an' will have tae give it back." },
      },
      choices = {
        { text = "What do you tell them?", next = "pacing_tell" },
        { text = "That's a sad thing to hear.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pacing_tell = {
      lines = {
        { id = "pt_default", text = "That the Light keeps nae ledger, an' I'm a dwarf, so I'd know a ledger if I saw one. Then I sit wi' them a while, which does more good than anythin' I say." },
      },
      choices = {
        { text = "Sitting with someone is a prayer too.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Comfort's fine, but they need work and food more.", next = "BACK", fx = { align = { light = -1 }, trait = { practical = 1 } } },
        { text = "I'll keep an eye on the back rows.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    came = {
      lines = {
        { id = "ca_default", text = "From the humans, after the Second War. The Silver Hand took a few dwarves in, an' the Church's teachin' came home wi' them, so now Ironforge trains its own priests an' paladins under this roof." },
        { id = "ca_dwarf", when = { race = "Dwarf" },
          text = "Ye'd think it was always here, the way the young ones talk, but yer grandfather would ha' looked at this Hall an' asked where the forge was. The Light came up from the humans, after the Second War, an' it took root." },
      },
      choices = {
        { text = "Do dwarves pray differently from humans?", next = "came_diff" },
        { text = "Who sends the young priests on, after you?", next = "came_send" },
        { text = "The mountain was fine before the Light came.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "It's good that it found its way here.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    came_diff = {
      lines = {
        { id = "cd_default", text = "Louder, an' shorter, an' wi' more hammerin' in the metaphors. The Cathedral prays like a choir an' we pray like a forge crew, but I've never heard the Light complain about either." },
      },
      choices = {
        { text = "The words matter less than the heart.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "The rites should be the same everywhere.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Ha. I'd like to hear a forge-crew hymn.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    came_send = {
      lines = {
        { id = "cs_default", text = "Humans I send down tae High Priestess Laurena in the Cathedral, an' night elves tae Priestess Alathea in their Temple o' the Moon. The dwarves I keep, for there are lessons that belong tae dwarves." },
        { id = "cs_ne", when = { race = "NightElf" },
          text = "Alathea sends word for her people now an' then, an' Braenna catches most o' the messages, for she's quicker on the stairs than I am. Ye'll hear from Darnassus when ye're ready, never fear." },
      },
      choices = {
        { text = "Lessons that belong to dwarves?", next = "came_ward" },
        { text = "Something else, High Priest.", next = "BACK" },
      },
    },
    came_ward = {
      lines = {
        { id = "cw_default", text = "A ward against fear. A dwarf's no' braver than anyone else, whatever we say in the tavern, but we've learned tae hold a fear in our hands an' look at it, an' the Light honors that." },
      },
      choices = {
        { text = "Fear has its uses; I'd not ward it all away.", next = "BACK", fx = { align = { light = -1 }, trait = { cautious = 1 } } },
        { text = "Then I'd ask the Light for that steadiness.", next = "BACK", fx = { align = { light = 1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    censer = {
      lines = {
        { id = "ce_default", text = "Aye, an old thing, an' I've swung it over more than one poor soul that had somethin' unwelcome livin' in them. Lord Shadowbreaker's paladins come for it now, an' I give it tae them for a donation." },
      },
      choices = {
        { text = "You sell a holy relic?", next = "censer_sell" },
        { text = "What were the exorcisms like?", next = "censer_rite" },
        { text = "Something else.", next = "BACK" },
      },
    },
    censer_sell = {
      lines = {
        { id = "cl_default", text = "I trade it for bread, an' I'll say so tae anyone who asks. The Hall's donations go tae the city's food stores, an' those stores feed folk who'll never set foot in a temple." },
      },
      choices = {
        { text = "Bread for the hungry is a holier use than any rite.", next = "BACK", fx = { align = { light = 1, order = -1 }, affinity = 2, trait = { generous = 1 } } },
        { text = "Holy things shouldn't carry a price.", next = "BACK", fx = { align = { order = 1 }, affinity = -1, trait = { stern = 1 } } },
        { text = "Why are the stores low?", next = "censer_stores" },
      },
    },
    censer_stores = {
      lines = {
        { id = "cst_default", text = "Gnomeregan's folk came wi' nothin', the Reserve's gone off tae the Alliance front, an' the farms in Dun Morogh have troggs in the barley. A mountain makes iron easily, but it doesnae grow much bread." },
      },
      choices = {
        { text = "I'll remember the stores when I've coin to spare.", next = "BACK", fx = { affinity = 2, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan", "troggs" } } },
      },
    },
    censer_rite = {
      lines = {
        { id = "cr_default", text = "Long, an' loud, an' cold, an' I'll no' tell ye the names o' the folk involved, for they've lives tae get on wi'. I'll say this much: the hardest part was never the spirit, it was the family watchin'." },
      },
      choices = {
        { text = "Some things should stay between a priest and the Light.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    work = {
      lines = {
        { id = "wo_default", text = "There's always work. The sick in the Hall, the gnomes still coughin' from the city, an' the young ones on the roads wi' nae healer behind them. Pick one an' ye'll never be idle." },
        { id = "wo_high", when = { minLevel = 55 },
          text = "For one o' yer experience? The Cenarion Circle's asked for help in Azshara, an' it's the way o' the Light tae help when asked, whoever's doin' the askin'. Why they need it matters more than how." },
      },
      choices = {
        { text = "Tell me about the sick gnomes.", next = "work_gnomes" },
        { text = "Why help druids in Azshara?", next = "work_druids", when = { minLevel = 50 } },
        { text = "My blade does more good than my prayers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll take whatever work the Light sets before me.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    work_gnomes = {
      lines = {
        { id = "wg_default", text = "Whatever poisoned Gnomeregan sits in the body like coal-damp in a mine. We can ease it, an' sometimes we can chase it out, but the High Tinker takes his readings an' I say my prayers, an' neither of us has a cure yet." },
      },
      choices = {
        { text = "Then prayer and study must work together.", next = "BACK", fx = { align = { light = 1 }, affinity = 1, learn = { "gnomeregan" } } },
        { text = "Then trust the readings, not the prayers.", next = "BACK", fx = { align = { light = -1 }, learn = { "gnomeregan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_druids = {
      lines = {
        { id = "wd_default", text = "Because they asked, an' because the Light doesnae check whose banner ye stand under before it answers. Seek out Ogtinc on the cliffs, if ye're bound that way; he'll have more for ye than I can say from here." },
      },
      choices = {
        { text = "The druids can look after their own.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Help given freely is the best kind.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lesson = {
      big = true,
      lines = {
        { id = "le_default", text = "Here's one they don't put in the books: the Light will give ye the strength tae heal a man an' the strength tae smite him, an' it'll never tell ye which one ye should ha' used. That part's yer job." },
      },
      choices = {
        { text = "Then I'll always choose mercy first.", next = "lesson_mercy", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Some people have earned the smiting.", next = "lesson_judge", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "How do you choose, High Priest?", next = "lesson_how" },
      },
    },
    lesson_mercy = {
      lines = {
        { id = "lm_default", text = "Good, an' keep that, but keep yer eyes open too, for mercy that never looks up gets its throat cut. Most o' the time, though, ye'll find mercy's the brave choice an' no' the soft one." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, High Priest.", next = "BACK" },
      },
    },
    lesson_judge = {
      lines = {
        { id = "lj_default", text = "Some have, aye, an' ye'll meet them out there; I'll no' pretend otherwise. Only make sure it's them ye're angry at, an' no' the long road or the cold or yer own fear." },
      },
      choices = {
        { text = "That's fair counsel.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson_how = {
      lines = {
        { id = "lh_default", text = "Badly, sometimes, an' I pray about the times I chose badly. I ask myself who'll be standin' there when it's over, an' whether I'll be able tae look at them." },
      },
      choices = {
        { text = "That's a heavy way to live.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnome = {
      big = true,
      lines = {
        { id = "gn_default", text = "It listens tae everyone, but I'll grant ye it's had less practice wi' gnomes, for yer people trusted wrenches before they trusted prayers. Ye'll find it's a quick learner." },
      },
      choices = {
        { text = "I've always felt it, even in Gnomeregan.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I trust wrenches more than prayers.", next = "BACK", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    worry = {
      big = true,
      lines = {
        { id = "wr_default", text = "The bread. The stores are thinner than the Senate tells the city, an' I've been sellin' the Hall's old treasures one by one tae fill them. The censer was the last thing I'd a mind tae part with." },
        { id = "wr_after", text = "I've no' told the young priests, an' I'd thank ye no' tae either, for they'd only start fastin' out o' sympathy. Fasting's a fine discipline, but it's a poor way tae help anyone." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "The Senate should be told plainly.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    worry_no = {
      lines = {
        { id = "wn_default", text = "Me? My knees, an' the price o' lamp oil, an' a great many young priests who've never once put the hymnals back where they found them. Nothin' that need trouble ye." },
      },
      choices = {
        { text = "Of course, High Priest.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A priest hears a great deal on his laps o' the Hall, an' keeps most of it. Here's what I can share wi' a clear conscience." },
    },
    background = { { id = "tp_bg", text = "I've served in this Hall since it had more empty floor than priests, an' now I'm High Priest, which mostly means I'm the one who gets asked." } },
    advice = { { id = "tp_ad", text = "Heal the one in front o' ye first, an' worry about the rest o' the world afterwards. The world'll still be there.", next = "work" } },
    gnomeregan = { { id = "tp_gnomeregan", text = "We were the only Light the gnomes had, for a while, an' some o' them still sit at the back o' the Hall as if they're intrudin'. They're no'.", next = "pacing_shy" } },
    cenarion_circle = { { id = "tp_cenarion", text = "Druids, an' no' my faith, but they've asked for the Light's help in Azshara, an' we answer when asked.", next = "work_druids" } },
    silver_hand = { { id = "tp_silver_hand", text = "It brought the Light up this mountain. Tiza an' Brandur carry its oaths in this Hall now, an' they carry them well." } },
    tome_of_divinity = { { id = "tp_tome", text = "That's Tiza's charge, no' mine. I only patch up the paladins she sends out, an' patch up her husband when they bring him back." } },
    _none = { { id = "tp_none", text = "That's beyond the Hall's walls an' my knowledge, I'm afraid. Ask in the Commons; somebody there always thinks they know." } },
  },
}

-- Theodrus Frostbeard: priest trainer; his one canon line is a warning not to turn from the Light.
P:NPC {
  key = "theodrus", id = TODO_NPC("Theodrus Frostbeard"), name = "Theodrus Frostbeard", title = "Priest Trainer",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "gruff" }, values = { "pious", "dutiful" },
  spiritSensitive = true,
  notices = { "class" },

  impression = {
    first = "Theodrus Frostbeard warns everyone who passes not to turn their back on the Light. He means it kindly, I think, though it's hard to tell under the scowl.",
    third = "{name} met Theodrus Frostbeard, a stern priest trainer in Ironforge's Hall of Mysteries.",
  },

  greetings = {
    { id = "g_warn", text = "Don't turn yer back on the Light; it may be the one thing that saves ye some day." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Back for more learnin'? Good, for ye cannae have too much o' it." },
  },

  notice = {
    { id = "n_human_priest", cat = "class", when = { class = "PRIEST", race = "Human" },
      text = "Cathedral-trained, are ye? Then ye'll have heard all the soft words already, an' I'll give ye the hard ones." },
    { id = "n_dwarf_priest", cat = "class", when = { class = "PRIEST", race = "Dwarf" },
      text = "A dwarf o' the Light, an' standin' straight, too. Good, for there's nae sense in prayin' hunched." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A fighter wi' nae prayer in ye at all, by the look. Ye'll want one some day, when the healer's out o' reach, so learn a short one now." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Theodrus Frostbeard. I train priests, an' I tell everyone else the same thing: don't turn yer back on the Light, for it may be the one thing that saves ye." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Ye've the look o' someone who's been usin' what I taught ye, which is the only kind o' thanks I want. What'll it be today?" },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "Ye came in quiet. Folk who come in quiet usually want somethin' from the Hall, so say what it is an' I'll decide if ye can have it." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Speak up; I've students waitin'." },
        { id = "h_again2", text = "Well? The Light's patient, but I'm only a dwarf." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why warn everyone the same way?", next = "warn" },
        { text = "What should a young priest learn first?", next = "first", when = { class = "PRIEST" } },
        { text = "What's a priest to a fighter like me?", next = "fighter", when = { ["not"] = { class = "PRIEST" } } },
        { text = "Farewell.", next = "END" },
      },
    },
    warn = {
      lines = {
        { id = "wa_default", text = "Because I've seen what's left o' folk who did. Some came back up the tram from Lordaeron wi' nothin' inside them but cold, an' they'd all been told the Light was for other people." },
      },
      choices = {
        { text = "Every soul is better for the Light.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Some of us do fine on our own strength.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "What did you see in Lordaeron's survivors?", next = "warn_more" },
      },
    },
    warn_more = {
      lines = {
        { id = "wm_default", text = "Despair, mostly, which is a thing ye can catch like a cough. The Light doesnae cure it in a day, but it gives a soul somethin' tae hold while it mends." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "fi_default", text = "Tae keep yer own soul in order before ye go tinkerin' wi' anyone else's. A priest who's run dry is no use tae a party in a cave, an' a danger tae himself besides." },
      },
      choices = {
        { text = "Discipline first, then service.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'd rather run dry than leave someone hurt.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fighter = {
      lines = {
        { id = "fg_default", text = "The one at the back keepin' ye standin', so be kind tae them an' don't run off where they cannae see ye. Every priest in this Hall has a story about a fighter who did." },
      },
      choices = {
        { text = "Fair enough. I'll stay in sight.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I'm a trainer, no' a gossip, but I've ears. Here's what I've heard worth repeatin'." } },
    background = { { id = "tp_bg", text = "I teach priests in the Hall, an' that's the whole o' it. My history's my own business, an' it's no' very interestin' besides." } },
    advice = { { id = "tp_ad", text = "Don't turn yer back on the Light. I say it tae everyone, an' I'll say it tae ye twice, for ye asked." } },
    _none = { { id = "tp_none", text = "Nae idea, an' I'll no' pretend tae one. Ask the High Priest; he walks about enough tae hear everythin'." } },
  },
}

-- Toldren Deepiron: priest trainer; gentle; his canon line asks what he can do for you.
P:NPC {
  key = "toldren", id = TODO_NPC("Toldren Deepiron"), name = "Toldren Deepiron", title = "Priest Trainer",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "gentle" }, values = { "kind", "patient" },
  spiritSensitive = true,
  notices = { "weary" },

  impression = {
    first = "Toldren Deepiron asked whether there was anything he could do for me, and then waited as if he truly wanted to know. He seems to notice tired people before they notice themselves.",
    third = "{name} met Toldren Deepiron, a gentle priest trainer in the Hall of Mysteries.",
  },

  greetings = {
    { id = "g_hope", text = "I hope the Light is wi' ye today, {name}. Is there anythin' I can do for ye?" },
    { id = "g_back", when = { metBefore = true }, text = "Ye're lookin' better than last time, or perhaps the lamps are kinder. Either way, welcome back." },
  },

  notice = {
    { id = "n_priest_weary", cat = "weary", when = { class = "PRIEST", health = { max = 0.5 } },
      text = "Ye've been givin' it all away again, haven't ye? Sit a moment before ye train; the Light'll wait for a priest tae catch her breath." },
    { id = "n_weary", cat = "weary", when = { health = { max = 0.4 } },
      text = "Ye're hurt, an' worse than ye're lettin' on. Let me see tae that first, an' then we'll talk about whatever ye came for." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Toldren Deepiron, at yer service. I teach the priests, but I'll help anyone who comes through that door, so tell me what ye need." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "I hope the Light is wi' ye, {name}. Is there anythin' I can do for ye today, besides the trainin'? Ye look like there might be." },
        { id = "h_night", when = { time = "night" },
          text = "Late tae be up, but the Hall never really closes. The lamps burn all night for the ones who cannae sleep, an' there are always a few." },
      },
      again = {
        { id = "h_again", text = "Is there anythin' else I can do for ye?" },
        { id = "h_again2", text = "Take yer time. Nobody's hurryin' ye here." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Who comes here when they can't sleep?", next = "night" },
        { text = "How do you keep from running dry?", next = "dry" },
        { text = "I came out of the abbey at Northshire.", next = "abbey", when = { origin = "human_abbey_novice" } },
        { text = "Nothing, thank you.", next = "END" },
      },
    },
    night = {
      lines = {
        { id = "ni_default", text = "Widows, mostly, an' soldiers back from the front, an' gnomes who dream o' their city. I don't preach at them; I bring a blanket an' let them talk if they want tae." },
      },
      choices = {
        { text = "That's the best kind of ministry.", next = "BACK", fx = { align = { light = 1 }, affinity = 2, trait = { kind = 1 } } },
        { text = "Grief should be faced, not wrapped in blankets.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Which widows?", next = "night_widow" },
      },
    },
    night_widow = {
      lines = {
        { id = "nw_default", text = "That's theirs tae tell, no' mine. There's a lass in the Military Ward who waits for letters from the Thandol Span, though, an' if ye pass her, a kind word costs nothin'." },
      },
      choices = {
        { text = "I'll look in on her.", next = "BACK", fx = { affinity = 1, learn = { "thandol_span" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dry = {
      lines = {
        { id = "dr_default", text = "I don't always. When I'm empty I sit in the back row an' let someone else lead the prayers, for there's nae shame in bein' the one who's prayed for." },
      },
      choices = {
        { text = "A healer has to let others heal them too.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A priest's duty is to keep going regardless.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    abbey = {
      lines = {
        { id = "ab_default", text = "Northshire! Then ye learned yer first prayers among trees an' bees, an' now ye've come tae a mountain wi' nae windows. Do ye miss the light, the ordinary kind?" },
      },
      choices = {
        { text = "Every day, Brother.", next = "BACK", fx = { affinity = 1 } },
        { text = "The Light's the same under stone.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Folk tell me things when they're tired, an' I keep the sad ones tae myself. These I can pass on." } },
    background = { { id = "tp_bg", text = "I train priests in the Hall o' Mysteries, an' I keep the night lamps lit. That's about all there is tae me." } },
    advice = { { id = "tp_ad", text = "Let someone help ye now an' then. It's harder than helpin', an' it's good practice." } },
    thandol_span = { { id = "tp_span", text = "The bridge where the Dark Irons struck. More than one family in Ironforge waits on news from it.", next = "night_widow" } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. If it's important, the High Priest might, or the Library in the Hall o' Explorers." } },
  },
}

-- Braenna Flintcrag: priest trainer; passes on the Temple of the Moon's summons to night elf priests.
P:NPC {
  key = "braenna", id = TODO_NPC("Braenna Flintcrag"), name = "Braenna Flintcrag", title = "Priest Trainer",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "warm" }, values = { "friendly", "dutiful" },
  spiritSensitive = true,
  notices = { "race" },

  impression = {
    first = "Braenna Flintcrag keeps the Hall's messages for priests from other temples and makes every stranger welcome. She is brisk about it, and very good at it.",
    third = "{name} met Braenna Flintcrag, a priest trainer in the Hall of Mysteries who welcomes visitors from other temples.",
  },

  greetings = {
    { id = "g_welcome", text = "Welcome tae the Hall! Mind the step, an' mind the mages; they're the ones in the pointy hats." },
    { id = "g_ne", when = { race = "NightElf" }, text = "Greetings, an' a blessin' on ye an' yer kind. Good tae see ye in our halls." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human", class = "PRIEST" },
      text = "Cathedral robes, an' they've seen weather. The Light's no' fussy about where ye learned yer hymns, an' neither am I." },
    { id = "n_ne", cat = "race", when = { race = "NightElf", class = "PRIEST" },
      text = "One o' Elune's priestesses' own, under the mountain! I've a message for yer kind more often than ye'd think, so check wi' me before ye leave." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Braenna Flintcrag. I train priests here an' keep the Hall's messages, for half the temples in the Alliance seem tae send their letters through me." },
        { id = "h_returning", tags = { "news" }, when = { questActive = TODO_QUEST("Returning Home") },
          text = "Ye're still here? A priestess o' yer temple came lookin' for ye, an' she said tae go home tae the Temple o' the Moon as soon as ye could. Priestess Alathea's waitin'." },
        { id = "h_ne_priest", when = { race = "NightElf", class = "PRIEST" },
          text = "Good tae see ye in our great halls, an' I mean that; we don't get many o' Elune's priests this far underground. Is it very strange, prayin' wi' nae sky?" },
      },
      again = {
        { id = "h_again", text = "What else can I do for ye? I've three letters tae sort, but they'll keep." },
        { id = "h_again2", text = "Go on, ask away." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Who sends letters through you?", next = "letters" },
        { text = "Do night elves pray to the same Light?", next = "elune" },
        { text = "It is strange, praying without stars.", next = "stars", when = { race = "NightElf" } },
        { text = "Farewell, Braenna.", next = "END" },
      },
    },
    letters = {
      lines = {
        { id = "le_default", text = "The Cathedral in Stormwind, mostly, an' the Temple o' the Moon in Darnassus, an' now an' then a field chaplain wantin' bandages. I read the address an' find the priest, an' I'm very good at findin' priests." },
      },
      choices = {
        { text = "That must keep you busy.", next = "letters_busy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letters_busy = {
      lines = {
        { id = "lb_default", text = "It does, but somebody has tae, an' the High Priest walks too fast tae hand anythin' tae. I like knowin' where everyone is, besides; it's a comfort, in times like these." },
      },
      choices = {
        { text = "Every temple should share what it learns.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Each temple should keep to its own teaching.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    elune = {
      lines = {
        { id = "el_default", text = "Not quite. They pray tae Elune, an' we tae the Light, an' Alathea an' I agree tae disagree in very polite letters. Both kinds o' priest can mend a broken leg, an' that's enough for me." },
      },
      choices = {
        { text = "The Light is the only true source.", next = "BACK", fx = { align = { light = 1 }, trait = { stern = 1 } } },
        { text = "Elune and the Light can both be true.", next = "BACK", fx = { align = { light = -1 }, affinity = 1, learn = { "teldrassil" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stars = {
      lines = {
        { id = "st_default", text = "I thought it might be. Go up tae the gates at night, then; the sky over Dun Morogh's as clear as any, an' cold enough tae keep the prayers short." },
      },
      choices = { { text = "Thank you, I will.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I read the outside o' a great many letters, which is no' the same as readin' the inside. Here's what I can tell ye." } },
    background = { { id = "tp_bg", text = "Priest trainer, letter-sorter, an' the one who finds folk when the High Priest cannae. I like the work." } },
    advice = { { id = "tp_ad", text = "Write tae someone when ye've a moment. A priest on the road forgets that somebody's prayin' for her too." } },
    teldrassil = { { id = "tp_teldrassil", text = "That's where Alathea's letters come from, the Temple o' the Moon. They smell o' leaves, which is a strange thing tae find in a mountain." } },
    _none = { { id = "tp_none", text = "No letters about that, I'm afraid. Try the Commons, or the Library." } },
  },
}

-- Tiza Battleforge: the dwarven paladins' mentor; Tome of Divinity, the Symbol of Life.
P:NPC {
  key = "tiza", id = TODO_NPC("Tiza Battleforge"), name = "Tiza Battleforge",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "quest",
  communities = { "ironforge" }, temper = { "steady", "proud" }, values = { "pious", "dutiful", "generous" },
  spiritSensitive = true,
  notices = { "paladin" },

  impression = {
    first = "Tiza Battleforge puts young paladins on the road by sending them to help people who can never repay them. She is proud of her husband and prouder still of the ones who come back.",
    third = "{name} met Tiza Battleforge, the respected dwarven paladin who sets Ironforge's young paladins on the path of virtue.",
  },

  greetings = {
    { id = "g_light", text = "The Light be wi' ye. Speak, an' I'll listen." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "A paladin! Stand up straight an' tell me what ye've done for someone who couldnae repay ye." },
  },

  notice = {
    { id = "n_human_pal", cat = "paladin", when = { class = "PALADIN", race = "Human" },
      text = "One o' Rall's? Ye've the Stormwind way o' holdin' a hammer, like it's goin' tae be painted. Hold it like it's goin' tae be used." },
    { id = "n_dwarf_pal", cat = "paladin", when = { class = "PALADIN", race = "Dwarf" },
      text = "A dwarf o' the Silver Hand. Brandur sent ye, I'll wager; he sends me all his best an' then sulks about it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Tiza Battleforge, o' the Silver Hand. Here in Ironforge I put the young paladins on the path tae virtue, an' it's a longer path than they expect." },
        { id = "h_tome", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity") },
          text = "Have ye studied the book? Then go an' do what it asks, for a page ye've read an' never lived is only ink." },
        { id = "h_symbol", tags = { "news" }, when = { questActive = TODO_QUEST("The Symbol of Life") },
          text = "Ye carry the Symbol now. My husband's over there gettin' stitched, an' he'll tell ye the rest, if the priest lets him talk." },
        { id = "h_narm", tags = { "news" }, when = { questDone = TODO_QUEST("The Symbol of Life") },
          text = "Ye brought Narm back. Muiredon's been tellin' the story tae everyone in the Hall, an' it gets a bit bigger every time, but the heart o' it's true, an' I'm proud o' ye." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! We'd be lost wi'out yer kind; it's yer lot patchin' up my husband right now. Thank ye, on his behalf, for he'll forget tae." },
      },
      again = {
        { id = "h_again", text = "What else would ye ask?" },
        { id = "h_again2", text = "Go on. I've time for an honest question." },
      },
      choices = {
        { text = "What does the path to virtue ask?", next = "path" },
        { text = "Who's being stitched over there?", next = "husband" },
        { text = "How did you come to the Light?", next = "came" },
        { text = "Brandur speaks highly of you.", next = "brandur" },
        { text = "I've earned my oaths, Tiza.", next = "oath", when = { class = "PALADIN" } },
        { text = "Light keep you.", next = "END" },
      },
    },
    path = {
      lines = {
        { id = "pa_default", text = "Charity first, an' patience. I send the young ones tae help someone who cannae ever pay them back, like John Turner wi' his orphans, an' I watch what they do when nobody's thankin' them." },
      },
      choices = {
        { text = "Why start with charity, not combat?", next = "path_why" },
        { text = "Charity's for priests; paladins should fight.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Charity done in secret is the truest kind.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1, learn = { "tome_of_divinity" } } },
      },
    },
    path_why = {
      lines = {
        { id = "pw_default", text = "Any fool wi' a hammer can fight, an' a great many do. The Light gives its greatest gifts tae those who'll use them on someone else's behalf, an' I want tae know that before I teach them anythin' that matters." },
      },
      choices = {
        { text = "What's the greatest gift?", next = "path_gift" },
        { text = "That's wisdom.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    path_gift = {
      lines = {
        { id = "pg_default", text = "Tae bring someone back who's fallen. The Symbol o' Life only answers a paladin who's ready for it, an' when it answers, the whole Hall hears about it for a month." },
      },
      choices = {
        { text = "Some should be allowed to rest.", next = "BACK", fx = { align = { light = -1 }, trait = { cautious = 1 } } },
        { text = "Bringing back the fallen is the Light's mercy.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    husband = {
      lines = {
        { id = "hu_default", text = "My Muiredon, an' he'll tell ye he's fine, which he isnae. He went spyin' on the Dark Irons south o' Helm's Bed Lake wi' Narm Faulk, an' only Muiredon came back walkin'." },
      },
      choices = {
        { text = "And Narm?", next = "husband_narm" },
        { text = "I'm sorry, Tiza.", next = "BACK", fx = { affinity = 1, learn = { "dark_iron" } } },
      },
    },
    husband_narm = {
      lines = {
        { id = "hn_default", text = "Narm held them off so Muiredon could run, an' that's the kind o' friend he is. Whether he's still holdin' is a question I ask the Light every mornin', an' Muiredon asks it every hour." },
        { id = "hn_done", when = { questDone = TODO_QUEST("The Symbol of Life") },
          text = "Narm's alive, thanks tae a young paladin wi' the Symbol, an' grumblin' about the cold. I'd ha' given a great deal tae hear that grumble, an' now I hear it for free." },
      },
      choices = {
        { text = "Then someone should go now.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Better to wait for proper orders.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    came = {
      lines = {
        { id = "ca_default", text = "The same way as most dwarves o' my years: the Silver Hand needed hands, an' I had two. The oaths took longer than the hammer-work, but they've held better." },
      },
      choices = {
        { text = "Do the oaths ever chafe?", next = "came_chafe" },
        { text = "Something else.", next = "BACK", fx = { learn = { "silver_hand" } } },
      },
    },
    came_chafe = {
      lines = {
        { id = "cc_default", text = "Every day, an' that's how ye know they're doin' their work. An oath that never pinches is just a nice thing ye said once." },
      },
      choices = {
        { text = "An oath must be kept whatever it costs.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Even oaths should bend for good reason.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    brandur = {
      lines = {
        { id = "br_default", text = "Does he? He's a good teacher an' a jealous one, an' I told him so tae his face. He swore he'd work on it, an' tae his credit, he is." },
      },
      choices = {
        { text = "Was that kind, telling him that?", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    oath = {
      big = true,
      lines = {
        { id = "oa_default", text = "Have ye, now? Then ye'll know the oath's no' a thing ye earn once an' keep in a drawer. Tell me who ye've helped lately, an' I'll tell ye if ye've earned it this week." },
      },
      choices = {
        { text = "I've helped where I could, and asked nothing.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "I've been too busy fighting to count.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The young paladins tell me everythin', whether I want tae hear it or no'. Here's what's worth passin' on." } },
    background = { { id = "tp_bg", text = "I'm a paladin o' the Silver Hand an' a mentor tae the young ones, an' Muiredon's wife, which is the hardest o' the three." } },
    advice = { { id = "tp_ad", text = "Help someone who cannae repay ye, an' don't tell anyone ye did it. That's the whole lesson; the rest is practice.", next = "path" } },
    tome_of_divinity = { { id = "tp_tome", text = "It's the book I give the young ones. It asks them tae be charitable an' patient, an' most find patience the harder.", next = "path" } },
    dark_iron = { { id = "tp_dark_iron", text = "There's a camp o' them south o' Helm's Bed Lake, an' a commander givin' orders. My husband has the scars tae prove it.", next = "husband" } },
    _none = { { id = "tp_none", text = "That's no' somethin' I can speak tae. Ask the High Priest, or ask Muiredon, who'll talk about anythin'." } },
  },
}

-- Muiredon Battleforge: Tiza's husband, wounded by the Dark Irons at Helm's Bed Lake.
P:NPC {
  key = "muiredon", id = TODO_NPC("Muiredon Battleforge"), name = "Muiredon Battleforge",
  bible = "bibles/mystic_ward.md", role = "questgiver", tier = "quest",
  communities = { "ironforge" }, temper = { "jovial" }, values = { "loyal", "brave" },
  notices = { "class" },

  impression = {
    first = "Muiredon Battleforge talked cheerfully through his stitches and would not stop thanking the priest who was sewing him. Underneath the jokes he is sick with worry for his friend Narm.",
    third = "{name} met Muiredon Battleforge, Tiza's husband, who came back wounded from spying on the Dark Irons near Helm's Bed Lake.",
  },

  greetings = {
    { id = "g_cough", text = "*cough* Good day tae ya! Don't mind me wounds; the good priest 'ere'll sort ol' Muiredon out in time." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? I'm mendin', thank ya, slower than I'd like an' faster than Tiza'd like." },
  },

  notice = {
    { id = "n_priest", cat = "class", place = "before", when = { class = "PRIEST" },
      text = "Another priest! Are ya the one doin' the stitchin' now? No? Then sit there an' don't poke, for I've been poked enough this week." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Dwarf" },
      text = "A paladin wi' a proper beard, jus' like Narm. He'd like ya, an' he'd tell ya so, loudly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Muiredon Battleforge, Tiza's husband, an' presently the Hall's favorite pincushion. I had a wee disagreement wi' some Dark Irons, an' they won the first round." },
        { id = "h_symbol", tags = { "news" }, when = { questActive = TODO_QUEST("The Tome of Divinity"), class = "PALADIN" },
          text = "So me wife sent ya o'er tae speak tae me, huh? Fair enough; I'll tell ya exactly wut happened tae Muiredon an' his best friend Narm." },
        { id = "h_symbol2", tags = { "news" }, when = { questActive = TODO_QUEST("The Symbol of Life") },
          text = "Narm needs help, an' I'll no' rest till he gets it, though the priest says I'll rest whether I like it or no'. Take the Symbol south o' Helm's Bed Lake, an' hurry." },
        { id = "h_narm_back", tags = { "news" }, when = { questDone = TODO_QUEST("The Symbol of Life") },
          text = "Ya brought him back! Narm Faulk, breathin' an' complainin', an' I've no' stopped grinnin' since I heard. Tiza's o'er there beamin' at ya; get on o'er an' let her." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "If ya've a spare prayer, I'd no' say no; this priest's very good, but she's got a heavy hand wi' the needle." },
      },
      again = {
        { id = "h_again", text = "Wut else? I'm no' goin' anywhere, as ya see." },
        { id = "h_again2", text = "Go on, ask. Talkin' takes me mind off the needle." },
      },
      choices = {
        { text = "What happened at Helm's Bed Lake?", next = "lake" },
        { text = "Tell me about Narm.", next = "narm" },
        { text = "Are you badly hurt?", next = "hurt" },
        { text = "Let me pray over those wounds.", next = "pray", when = { class = "PRIEST" } },
        { text = "Mend well, Muiredon.", next = "END" },
      },
    },
    lake = {
      lines = {
        { id = "la_default", text = "We was spyin' on some Dark Irons that've bunkered down south o' the lake. We knew they was up tae no good, so Narm an' me crept closer an' saw their leader givin' orders tae his men." },
      },
      choices = {
        { text = "What were they after?", next = "lake_after" },
        { text = "Why didn't you report back first?", next = "lake_why" },
      },
    },
    lake_after = {
      lines = {
        { id = "lf_default", text = "Some kind o' scripts, writin's, an' a commander mindin' them close. The Senate wants proof they're even there, an' I've got the proof in me ribs, but they'll want somethin' wi' a seal on it." },
      },
      choices = {
        { text = "The Senate should act on your word alone.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, learn = { "dark_iron" } } },
        { text = "The Senate is right to want proof.", next = "BACK", fx = { align = { order = 1 }, learn = { "dark_iron" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lake_why = {
      lines = {
        { id = "lw_default", text = "Because we're daft, an' because it was a chance. We took a few o' them down, but they was tougher than we thought, an' more o' them got the jump on us." },
      },
      choices = {
        { text = "It was brave, and worth the risk.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "It was reckless, and Narm paid for it.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1, trait = { stern = 1 } } },
      },
    },
    narm = {
      lines = {
        { id = "na_default", text = "Narm Faulk, a paladin jus' like Tiza, an' the best friend a dwarf ever had. When they jumped us, he told me tae run an' get help, so I ran, an' I'll be ashamed o' that till he's standin' in front o' me." },
      },
      choices = {
        { text = "You did what he asked.", next = "narm_asked" },
        { text = "A friend doesn't leave a friend.", next = "BACK", fx = { affinity = -2, trait = { stern = 1 } } },
      },
    },
    narm_asked = {
      lines = {
        { id = "nk_default", text = "Aye, I did, an' that's wut I tell meself at night. It helps a wee bit, an' Tiza helps more, an' a young paladin wi' the Symbol o' Life would help most o' all." },
        { id = "nk_done", when = { questDone = TODO_QUEST("The Symbol of Life") },
          text = "Aye, an' he's alive tae say so himself now, which he does, often. He says he'd do it again, an' I've told him I'd rather he didnae." },
      },
      choices = {
        { text = "I'll go to him.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurt = {
      lines = {
        { id = "hu_default", text = "Ach, it's only holes, an' holes close. The priest says I'll be up an' about in a week if I stop tellin' the story wi' me arms." },
      },
      choices = {
        { text = "Then stop waving your arms.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "Would ya? Go on, then, an' I'll keep still, which is a thing I'm very bad at." },
      },
      choices = {
        { text = "The Light mends what hands cannot.", next = "pray_after", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Prayer helps, but the stitches are doing the work.", next = "pray_after", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    pray_after = {
      lines = {
        { id = "pf_default", text = "Ooh, that's warm. That's better than the tea, an' don't tell the priest I said so; she makes the tea." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've been lyin' here a week listenin' tae everyone, so I know a fair bit. Wut d'ya want tae hear?" } },
    background = { { id = "tp_bg", text = "Tiza's husband an' Narm's friend, an' that's about all anyone needs tae know about ol' Muiredon." } },
    advice = { { id = "tp_ad", text = "Don't go peekin' at Dark Irons wi' only two o' ya. Take five, an' a priest." } },
    dark_iron = { { id = "tp_dark_iron", text = "South o' Helm's Bed Lake, wi' a leader an' some writin's they guard close. I've the holes tae show for it.", next = "lake" } },
    _none = { { id = "tp_none", text = "Couldnae tell ya, friend. I've been lyin' here gettin' stitched, no' readin' the news." } },
  },
}

-- Bink: gnome mage trainer; befriend a mage; sends seasoned mages to Tabetha.
P:NPC {
  key = "bink", id = TODO_NPC("Bink"), name = "Bink", title = "Mage Trainer",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "eager" }, values = { "curious", "friendly" },
  notices = { "class" },

  impression = {
    first = "Bink told me to befriend a mage, because mages have a trick or two up their sleeves. Judging by how fast she talks, she has several up each sleeve.",
    third = "{name} met Bink, a quick-talking gnome mage trainer in the Hall of Mysteries.",
  },

  greetings = {
    { id = "g_advice", text = "Well met! Want some advice? Befriend a mage; we've a trick or two up our sleeves, we do." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage! Come in, come in, mind the frost on the floor; that was a demonstration." },
  },

  notice = {
    { id = "n_human_mage", cat = "class", when = { class = "MAGE", race = "Human" },
      text = "Trained in Stormwind? You've that tower-mage way of standing, as if someone might ask you to recite. Relax, nobody recites here; we're far too busy blowing things up." },
    { id = "n_gnome_mage", cat = "class", when = { class = "MAGE", race = "Gnome" },
      text = "A gnome mage, and a tidy one! Most of us arrive singed. You must be very careful, or very lucky, and either is fine by me." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, wandering over from the quiet side of the Hall! You lot have the nice benches, you know. We keep setting ours on fire." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bink, mage trainer, and the Hall's best argument for keeping a bucket of sand by every door. What can I do for you?" },
        { id = "h_tabetha", tags = { "news" }, when = { questActive = TODO_QUEST("Tabetha's Task") },
          text = "Off to see Tabetha, are we? Her cottage is west of Theramore, past the Stonemaul ruins, and take friends, because Tabetha's errands tend to end in Zul'Farrak." },
        { id = "h_mage_high", when = { class = "MAGE", minLevel = 40 },
          text = "Look at you, all grown up and crackling! There's a colleague of mine in Dustwallow Marsh, Tabetha, who has a bone to pick with a troll, and you might be just the mage to help her pick it." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, before the frost melts." },
        { id = "h_again2", text = "Ask away! I love questions; they're like spells that haven't gone off yet." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why should I befriend a mage?", next = "friend" },
        { text = "Who's Tabetha?", next = "tabetha", when = { class = "MAGE", minLevel = 35 } },
        { text = "What's it like, gnome mages in a dwarven temple?", next = "hall" },
        { text = "Farewell, Bink.", next = "END" },
      },
    },
    friend = {
      lines = {
        { id = "fr_default", text = "Food that appears out of nowhere, water that's always cold, and a portal home when you're too tired to walk! A mage is the most useful friend in Azeroth, and also the most likely to set your eyebrows on fire." },
      },
      choices = {
        { text = "Magic is a tool like any other.", next = "BACK", fx = { align = { light = -1 }, trait = { practical = 1 } } },
        { text = "Magic that strong should be handled with reverence.", next = "BACK", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "I'll keep my eyebrows clear.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    tabetha = {
      lines = {
        { id = "ta_default", text = "A mage who lives alone in the middle of Dustwallow Marsh, by choice, which tells you most of what you need to know. Rumor says she's quarrelling with a sand troll in Zul'Farrak, and Tabetha doesn't lose quarrels." },
      },
      choices = {
        { text = "I'll go and see her.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall = {
      lines = {
        { id = "ha_default", text = "Lovely, mostly! The dwarves pray on that side and we study on this side, and every so often a fireball goes the wrong way and High Priest Rohan comes over very calmly to ask about it." },
      },
      choices = {
        { text = "Do the priests mind?", next = "hall_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_mind = {
      lines = {
        { id = "hm_default", text = "Less than you'd think! They heal our burns and we keep their lamps lit with a cantrip, and my brother Dink says it's the most sensible arrangement in Ironforge." },
      },
      choices = {
        { text = "Faith and study belong under one roof.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A temple is no place for fireballs.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear everything twice in this Hall, once from the mages and once from the priests, and they never agree. Here's my half." } },
    background = { { id = "tp_bg", text = "I'm a mage trainer, and a gnome, and I've got a brother called Dink who trains mages too, so yes, we've heard all the jokes." } },
    advice = { { id = "tp_ad", text = "Befriend a mage! And if you are one, befriend a priest, because somebody has to put out the fires." } },
    _none = { { id = "tp_none", text = "No idea! But if you find out, come and tell me, because I hate not knowing things." } },
  },
}

-- Milstaff Stormeye: portal trainer; his one canon line doubts your mental acuity.
P:NPC {
  key = "milstaff", id = TODO_NPC("Milstaff Stormeye"), name = "Milstaff Stormeye", title = "Portal Trainer",
  bible = "bibles/mystic_ward.md", role = "trainer", tier = "service",
  communities = { "ironforge" }, temper = { "proud", "sharp" }, values = { "proud", "curious" },
  notices = { "class" },

  impression = {
    first = "Milstaff Stormeye told me plainly that he doubted I had the mental acuity to grasp portal magic. He was so sure of it that I almost apologized.",
    third = "{name} met Milstaff Stormeye, the gnome who teaches portal magic in the Hall of Mysteries and thinks very little of everyone else's.",
  },

  greetings = {
    { id = "g_doubt", text = "Hm. I doubt you possess the mental acuity to grasp portal magic, but go on, say what you came to say." },
    { id = "g_mage", when = { class = "MAGE", minLevel = 40 }, text = "Ah, a mage of some standing. Portals, I presume? Try to keep up." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You fold the world with prayers, I fold it with geometry, and only one of us can show his working." },
    { id = "n_young_mage", cat = "class", when = { class = "MAGE", maxLevel = 39 },
      text = "A young mage, and impatient, I expect. Portals begin at forty seasons of study, or the equivalent; come back when you've done the equivalent." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Milstaff Stormeye, portal trainer. I teach mages to fold one place onto another, which is the most difficult thing in this Hall, and I include praying in that." },
        { id = "h_mage", when = { class = "MAGE", minLevel = 40 },
          text = "You've reached the point where walking becomes optional. Portals, then, and do pay attention, because a portal opened carelessly arrives somewhere carelessly." },
      },
      again = {
        { id = "h_again", text = "Something else? Make it a sensible something." },
        { id = "h_again2", text = "Well? I've calculations cooling." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE", minLevel = 40 } },
        { text = "How does a portal work?", next = "how" },
        { text = "What happens to a careless portal?", next = "careless" },
        { text = "Good day, then.", next = "END" },
      },
    },
    how = {
      lines = {
        { id = "ho_default", text = "Imagine the world as a map, then imagine folding the map so two cities touch, then imagine doing it without tearing the map or yourself. You're imagining it wrong, but that's the general idea." },
      },
      choices = {
        { text = "Magic like that should have rules and limits.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic should go as far as the mind can take it.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Fair. I was imagining it wrong.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    careless = {
      lines = {
        { id = "ca_default", text = "It arrives, usually. Whether all of the mage arrives with it is the interesting part, and I won't tell you about the apprentice who left his boots in Stormwind, because it's still a sore point." },
      },
      choices = {
        { text = "His boots, or his feet?", next = "careless_boots" },
        { text = "Something else.", next = "BACK" },
      },
    },
    careless_boots = {
      lines = {
        { id = "cb_default", text = "Just the boots, thank goodness, though he did walk home along the tram in his stockings. I tell every student that story, and they all laugh, and then they all check their feet." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a great deal, most of it beyond you. Here is the part that isn't." } },
    background = { { id = "tp_bg", text = "I teach portal magic in the Hall of Mysteries. Before that I studied portal magic, and before that I wanted to study it, so you see the pattern." } },
    advice = { { id = "tp_ad", text = "Check where you're going before you go there. You'd be astonished how many people don't." } },
    _none = { { id = "tp_none", text = "That isn't a portal, so it isn't my concern." } },
  },
}
