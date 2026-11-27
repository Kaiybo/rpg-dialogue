-- Dalaran's keepers of old things and old words: Archivist Delv Fortuz (Antonidas' Antiquities),
-- Archivist Helm Anvilhand (Archival Exhibit), Ranath Nightstride (Linguists Lounge), Spellweaver
-- Thaldris (Talismanic Textiles) and the Seasoned Adventurer at Cantrips & Crows.
-- The wiki gives these five a name, a place and nothing else; they talk about their work, their
-- rooms and their neighbours. Voice: bibles/archives.md
local P = RPGDialogueAPI:Pack("rpgd.dalaran")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dal_delv", id = TODO_NPC("Archivist Delv Fortuz"), name = "Archivist Delv Fortuz",
  bible = "bibles/archives.md", role = "scholar", tier = "quest",
  communities = { "dalaran", "kirin_tor" }, temper = { "precise", "dry" }, values = { "learned", "loyal" },
  prejudice = { class = "WARLOCK", amount = 12, why = "Antonidas died when Archimonde took the city; he holds every demon-caller partly to blame." },
  notices = { "class", "race" },

  impression = {
    first = "He speaks of Antonidas the way other men speak of a father.",
    third = "{name} met Archivist Delv Fortuz, who keeps Antonidas' Antiquities in Dalaran.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "The Grand Magus died in this city at the hands of a demon lord, and you bargain with that lord's kin. Keep well back from the cases." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "I will not have a warlock near his belongings. Say what you need from where you stand, and then leave me to my work." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You have kept your hands off his things and your creatures out of this shop, every time. I don't like you, but I begin to think he'd have given you a hearing." },
    { id = "g_default", text = "Welcome to Antonidas' Antiquities. Kindly keep your hands off the cases." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A magus. Hands behind your back, if you please; the glass remembers fingers." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good. His things ought to be looked at, and too few people come." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and in that time I've named three more pieces from the rubble. Come and see, but mind the glass." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You'll have learned your first cantrips from his primers, I expect, as every apprentice in the land did. Stand up a little straighter in here; it's his house, after a fashion." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "I'll ask you to keep a pace back from the cases, and I don't think I need explain why. You know well enough what came through this city's gates." },
  },

  start = "hello",
  nodes = {
    dd_gilded = {
      lines = { { id = "dd_gilded_default", text = "Because it tells how the magi of Strom came here and built a city so they could study in peace, and there are perhaps a dozen copies left that the Scourge didn't burn. Now one of them is a gaudy trinket on a goblin's shelf, sold to some fool as an archmage's own." } },
      choices = {
        { text = "You're right. I'll be more careful with Dalaran's past.", next = "BACK", reply = "Thank you. That's all an archivist can ask, and more than most people give.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Someone's reading it now who never would have. That's not nothing.", next = "BACK", reply = "Hm. I hadn't considered that, and I don't much like that you've made me. Perhaps the paint will flake.", fx = { align = { order = -1 } } },
        { text = "Something else, Archivist.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "Arthas killed Antonidas in the street outside, and then Archimonde brought the city down around him. You carry the stink of that lord's kind, so forgive me if I keep the counter between us." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "Ah, you again. I still keep the counter between us, but I've stopped counting the pieces after you leave." },
        { id = "h_default", key = true,
          text = "Archivist Delv Fortuz, keeper of Antonidas' Antiquities. Everything in these cases belonged to the Grand Magus or passed through his hands, and every piece of it was dug out of the rubble after the city fell." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A magus! Then you'll know whose study these came from. Look as long as you like, {class}, but breathe on the glass as little as you can manage." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "If Anvilhand sent you over from the Exhibit to check my labels again, you may tell him they're all spelled correctly. Otherwise, welcome, and please don't touch anything." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're here by Archmage Modera's leave, I'm told. Then you may look, and I'll stand just here while you do, if it's all the same to you." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "We're closed, strictly speaking, but I never seem to be. Come in, keep your voice down, and let the old things sleep." },
        { id = "h_dd_gilded", tags = { "news" }, when = { questDone = TODO_QUEST("Opportunistic Education") },
          text = "I'm told a copy of The Founding of Dalaran went down into the Underbelly by your hand and came back up painted gold. I'll not ask what you were thinking, but I will ask you never to do it again." },
      },
      again = {
        { id = "h_again", text = "Something else? I've a teapot to polish, but it has waited years and can wait a little longer." },
        { id = "h_again2", text = "Go on, then. Questions keep the place alive, which is more than dust does." },
      },
      choices = {
        { text = "Whose things were these?", next = "antonidas" },
        { text = "How did you find them all?", next = "rubble" },
        { text = "What does an archivist do here?", next = "work" },
        { text = "There's a dwarf selling antiques just down the street.", next = "brammold" },
        { text = "I learned my first spells from his primers.", next = "xmage", when = { class = "MAGE" } },
        { text = "You don't trust me near his things.", next = "xforsaken", when = { race = "Scourge" } },
        { text = "I'll leave you to your cases.", next = "END" },
        { text = "It was only a history book, Archivist. Why does it matter?", next = "dd_gilded", when = { questDone = TODO_QUEST("Opportunistic Education") } },
      },
    },

    antonidas = {
      lines = {
        { id = "an_default", key = true, text = "Grand Magus Antonidas, who led the Kirin Tor until the Scourge came through our gates. He died defending this city, and when the masons cleared his tower they brought me whatever they found, cracked and scorched, and asked me what it had been." },
      },
      choices = {
        { text = "Did you know him yourself?", next = "antonidas_knew" },
        { text = "Who leads the Kirin Tor now?", next = "council" },
        { text = "Something else.", next = "BACK" },
      },
    },
    antonidas_knew = {
      lines = {
        { id = "ak_default", text = "I knew him the way a clerk knows the man whose letters he files, which is to say well and not at all. He once handed back a report of mine with the spelling corrected and a note saying the argument was sound, and I've kept that note in my coat ever since." },
      },
      choices = {
        { text = "Then you knew him better than most.", next = "legacy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    legacy = {
      big = true,
      lines = {
        { id = "lg_default", text = "People say now that he ought to have seen what Kel'Thuzad was, and perhaps that's so. But he stood at the gates when the dead came, while the rest of us ran for the cellars, and I'd have him remembered for the standing and not the seeing." },
      },
      choices = {
        { text = "He gave his life for this city. Remember him for that.", next = "BACK", reply = "Thank you, truly, because so few say it now, and I'll write your words on the card beneath his staff where the apprentices can read them.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "A wiser leader would have stopped Kel'Thuzad years before.", next = "BACK", reply = "Perhaps a wiser one would have, and I've lain awake on that very thought, but wiser leaders were not standing at the gates when the dead came, and he was.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    council = {
      lines = {
        { id = "co_default", text = "The council, and you'll get no more than that from me, because archivists who name names end up cataloguing the sewers. Ask Archmage Modera, if you have the nerve and she has the time." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    rubble = {
      lines = {
        { id = "ru_default", text = "Brick by brick, mostly, with the masons calling me over whenever they turned up something that wasn't a brick. Half of it was ash and a third was broken, and I've spent the years since trying to put a name to the rest." },
      },
      choices = {
        { text = "What's the strangest thing you've found?", next = "strange" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = {
        { id = "st_default", text = "A teapot that pours cold water no matter what you put in it, and I've no idea whether it was a jest or an experiment. With the Grand Magus it was often both, and he never wrote down which." },
      },
      choices = {
        { text = "Is anything here dangerous?", next = "dangerous" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dangerous = {
      lines = {
        { id = "dg_default", text = "One cabinet, and it stays locked, with the key in Archmage Celindra's keeping and not in mine. She was his friend, and some evenings she comes in and looks at that cabinet for a long while without opening it." },
      },
      choices = {
        { text = "What's inside it?", next = "dangerous2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dangerous2 = {
      lines = {
        { id = "d2_default", text = "His last notes, I believe, though I've never been allowed to read them, and I've never asked twice. Some things an archivist keeps without knowing, and I've made my peace with that." },
      },
      choices = {
        { text = "That takes discipline.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    work = {
      lines = {
        { id = "wk_default", text = "I catalogue, I clean, I label, and I tell visitors not to touch, which I do most. The Kirin Tor asked that his things be shown rather than shut away, so the city wouldn't forget what it lost. Archivist Anvilhand keeps the Archival Exhibit down the way, and between us we hold most of what Dalaran remembers." },
      },
      choices = {
        { text = "Tell me about Anvilhand.", next = "helm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    helm = {
      lines = {
        { id = "hm_default", text = "A dwarf, and a good archivist, though he lets visitors handle his exhibits and calls that teaching. We argue about it over supper every week, and neither of us has given an inch." },
      },
      choices = {
        { text = "Maybe you're both right.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    brammold = {
      big = true,
      lines = {
        { id = "br_default", text = "Deepmine, yes, who sells old things to anyone with coin. He's honest, I'll grant him that, but every candlestick he sells to a stranger is a little piece of this city leaving it for good." },
      },
      choices = {
        { text = "Some things belong to the city. Keep them here.", next = "BACK", reply = "Precisely so, and I've told the council as much, though they seem to think a candlestick is only a candlestick until it's gone for good.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old things are meant to be used, not kept under glass.", next = "BACK", reply = "That is exactly the argument Deepmine makes, almost word for word, and I find it no more persuasive coming from you, though rather more politely put.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xmage = {
      lines = {
        { id = "xm_default", text = "Then you've his voice in your head already, telling you to mind your focus and check your sums. That worn blue primer in the third case is the first copy, and the notes in its margins are in his hand." },
      },
      choices = {
        { text = "May I read his notes?", next = "xmage2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage2 = {
      lines = {
        { id = "x2_default", text = "Through the glass, yes, and I'll turn the page for you if you ask nicely. On the first leaf he wrote 'Patience before power', and underneath, rather smaller, 'and get some sleep, you fool'." },
      },
      choices = {
        { text = "Good advice, both halves of it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xforsaken = {
      big = true,
      lines = {
        { id = "xf_default", text = "No, I don't, and I'd be a poor keeper if I did. You may be no friend of the Scourge now, but the Scourge is what came through those gates, and it wore faces very like yours." },
      },
      choices = {
        { text = "I'm not what killed him. Judge me by what I do.", next = "BACK", reply = "That is a fair request, and I'll try to honour it. Forgive me if I keep an eye on you near the staff cases all the same.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Distrust me all you like. It changes nothing.", next = "BACK", reply = "It changes how carefully I dust while you're in the room, which is not nothing, and I'd thank you to keep your hands well away from the glass.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what's in these cases and a good deal about the man who owned them. Ask, and I'll answer what an archivist may." } },
    background = { { id = "tp_bg", text = "I was a clerk in the Violet Citadel before the fall and an archivist after it, because someone had to know what all the broken things had been." } },
    advice = { { id = "tp_ad", text = "Write things down, {class}, and date them. You'd be amazed how much of history is lost to people who were sure they'd remember." } },
    _none = { { id = "tp_none", text = "That isn't in my catalogue, I'm afraid. Try Anvilhand at the Exhibit; he collects odder things than I do." } },
  },
}

P:NPC {
  key = "dal_helm", id = TODO_NPC("Archivist Helm Anvilhand"), name = "Archivist Helm Anvilhand",
  bible = "bibles/archives.md", role = "scholar", tier = "quest",
  communities = { "dalaran", "kirin_tor" }, temper = { "jovial", "chatty" }, values = { "learned", "curious" },
  notices = { "race", "class" },

  impression = {
    first = "He hands visitors old relics and dares them to drop one.",
    third = "{name} met Archivist Helm Anvilhand, a dwarf who keeps Dalaran's Archival Exhibit.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in! Pick somethin' up, it's allowed in here." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Well met, cousin! A beard in the Exhibit always cheers me." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more history, are ye? Good, there's plenty of it." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, and I've put up two new cases since. Come and have a look, and mind the elbows." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ironforge stock, by the look of ye. Ye'll be the only one in this city who laughs at my jokes, so stay a while." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! There's a case at the back with a Gnomeregan pressure gauge in it, and I'd be grateful if ye told me which way up it goes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Archivist Helm Anvilhand, keeper of the Archival Exhibit! This is Dalaran's whole story laid out in cases, from the first magi to the day the city fell, and unlike Fortuz's shop up the way, ye're allowed to touch most of it." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Hail, {g:lad|lass}, and welcome! Ye've no idea how good it is to see a proper beard among all these robes. Have a wander, pick things up, and if ye break somethin', ye'll help me glue it." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A magus! Then ye'll know half of what's in these cases already, and I'll wager ye've never held most of it. Go on, it's what the Exhibit's for." },
        { id = "h_gold", when = { questDone = TODO_QUEST("Opportunistic Education") },
          text = "Somebody's been hawkin' a copy of The Founding of Dalaran painted gold, of all the daft things. If ye see it, tell the seller it was worth more before the paint." },
      },
      again = {
        { id = "h_again", text = "What else, then? I've a hundred stories, and most of 'em are even true." },
        { id = "h_again2", text = "Go on, ask away. Fortuz says I talk too much, and he's right, but he's not here." },
      },
      choices = {
        { text = "What's in the Exhibit?", next = "exhibit" },
        { text = "A dwarf archivist in a city of magi?", next = "dwarf" },
        { text = "Fortuz won't let anyone touch his cases.", next = "touch" },
        { text = "What happened to Alterac?", next = "alterac" },
        { text = "Hail, cousin. How's a dwarf fare among wizards?", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "Do you work spells yourself?", next = "xmage", when = { class = "MAGE" } },
        { text = "Farewell, Archivist.", next = "END" },
      },
    },

    exhibit = {
      lines = {
        { id = "ex_default", key = true, text = "Charters and seals, old robes and broken staves, and a lot of letters from magi complainin' about each other, which is my favourite case by far. It starts with the city's founding and runs right up to the rubble outside, and I'm still addin' to the end of it." },
      },
      choices = {
        { text = "Tell me about the founding.", next = "founding" },
        { text = "Something else.", next = "BACK" },
      },
    },
    founding = {
      lines = {
        { id = "fo_default", text = "The first magi came up here from Strom to study away from prying eyes, and the folk round about didn't care much for what they got up to. So the magi formed a council to keep an eye on their own, and that council became the Kirin Tor." },
      },
      choices = {
        { text = "So the Kirin Tor began as a leash.", next = "leash" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leash = {
      big = true,
      lines = {
        { id = "le_default", text = "A leash, a shield, a club for keepin' secrets, it's been all three dependin' on the century. I've seen the letters from both sides, and I still can't tell ye whether the city's better for it." },
      },
      choices = {
        { text = "Magic that strong needs a council watching it.", next = "BACK", reply = "Aye, that's the Kirin Tor's own answer, and I'd not argue with ye in front of them, though I've read a few letters that'd make ye wonder who watches the watchers.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No council should tell a mage what to study.", next = "BACK", reply = "Ha! Ye'd have got on famously with half the magi in my letters, and every one of them came to a bad end. Mind which half ye're joinin', {g:lad|lass}.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dwarf = {
      lines = {
        { id = "dw_default", text = "Ironforge has the Explorers' League diggin' up the past, and I thought, somebody ought to be lookin' after it once it's dug. Dalaran pays its archivists in gold that stays gold, and the roof's a good deal higher." },
      },
      choices = {
        { text = "You've mana about you, though. Do you cast?", next = "dwarf_spark" },
        { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } },
      },
    },
    dwarf_spark = {
      lines = {
        { id = "ds_default", text = "Enough to light a lamp and read a warded seal without losin' my eyebrows, which is more magic than most dwarves want and less than any magus here respects. It suits me fine, {g:lad|lass}." },
      },
      choices = {
        { text = "A useful sort of magic, that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    touch = {
      lines = {
        { id = "to_default", text = "Ha! No, he won't, and he's not wrong, mind, his things are rarer than mine. But a child who's held a real Kirin Tor seal in their hand remembers it forever, and one who saw it through glass forgets by supper." },
      },
      choices = {
        { text = "Do you two get along?", next = "touch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    touch2 = {
      lines = {
        { id = "t2_default", text = "We have supper once a week and argue the whole way through, so aye, as well as two archivists ever get along. He's the best cataloguer in the city, and I'll deny I said so if ye tell him." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    alterac = {
      lines = {
        { id = "al_default", text = "Lord Perenolde sold the Alliance to the Horde in the Second War, and Alterac was carved up for it after. His city's a ruin up in the hills now, and the folk who still call themselves his heirs prowl the roads with knives." },
      },
      choices = {
        { text = "The Syndicate, you mean.", next = "alterac2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alterac2 = {
      lines = {
        { id = "a2_default", text = "Aye, the Syndicate, thieves with a family crest. I've a case on Alterac by the far wall, and twice now some smooth fellow in a good coat has asked me what I'd sell the old Perenolde seal for." },
      },
      choices = {
        { text = "Twice? Who's asking?", next = "alterac3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alterac3 = {
      lines = {
        { id = "a3_default", text = "Never the same face, and never a name, and both times the guards found nothin' odd about him once he'd gone. I keep the seal in my pocket now, and I've told Fortuz to do the same with anything he'd miss." },
      },
      choices = {
        { text = "Wise of you. Keep it close.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xdwarf = {
      lines = {
        { id = "xd_default", text = "Well enough, so long as ye don't mind bein' the shortest person in every room and the only one who's ever lifted anything heavier than a book. I miss the ale, mostly, and the forges at night, and a good shout now and then." },
      },
      choices = {
        { text = "Next time I'm in Ironforge, I'll drink one for you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "A little, and badly, by the standards of this city. I can read a ward and light a lamp and tell ye whether a thing's likely to bite, and that's all an archivist needs from the arcane." },
      },
      choices = {
        { text = "That's a useful kind of magic.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know Dalaran's history, case by case, and a fair bit of gossip that never made it behind glass. What d'ye want to hear?" } },
    background = { { id = "tp_bg", text = "Born under Ironforge, came up here to look after old things, and stayed because nobody else would. That's the whole of it, {g:lad|lass}." } },
    advice = { { id = "tp_ad", text = "Pick things up and learn how they feel. Ye'll know a fake by the weight long before ye know it by the look." } },
    explorers_league = { { id = "tp_league", text = "Grand folk, if a little too fond of holes. They find the old things; I'd like to think I'm the one who keeps 'em from bein' sold." } },
    _none = { { id = "tp_none", text = "Not a thing on that in my cases, I'm sorry to say. Try Fortuz, or the elf with the cats in the Linguists Lounge." } },
  },
}

P:NPC {
  key = "dal_ranath", id = TODO_NPC("Ranath Nightstride"), name = "Ranath Nightstride",
  bible = "bibles/archives.md", role = "scholar", tier = "quest",
  communities = { "dalaran", "kirin_tor" }, temper = { "calm", "wry" }, values = { "learned", "proud" },
  notices = { "race", "class" },

  impression = {
    first = "Four cats sleep around him as if he were a hearth.",
    third = "{name} met Ranath Nightstride, a Highborne spirit who translates old tongues for the Kirin Tor in the Linguists Lounge.",
  },

  greetings = {
    { id = "g_default", text = "Come in. Mind the cats; they are less patient than I am." },
    { id = "g_nightelf", when = { race = "NightElf" }, text = "Ishnu-alah, child of the forest. You may stop staring whenever you like." },
    { id = "g_skyborne", when = { race = "Skyborne" }, text = "Another of the cousins from the sky. Sit, if you wish." },
  },

  notice = {
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Your people sent mine away across the sea, once, and they were not wrong to do it. I say so before you can, so we needn't spend the afternoon on it." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You hold your focus as these young Kirin Tor do, gripping it tight in case it runs away. It will not run, you know; it has nowhere else to go." },
  },

  start = "hello",
  nodes = {
    w8_tr = {
      lines = { { id = "w8_tr_a", text = "A door, as it happens, or the lintel of one, carried up from the ruins under the old city in three pieces. It says 'enter and be welcome', and below that, in a smaller and later hand, 'unless you are Harlan', and I have been laughing about it for a week." } },
      choices = {
        { text = "Who was Harlan?", next = "w8_tr2" },
        { text = "A ghost who laughs. That's a surprise.", next = "w8_tr2" },
        { text = "I'm a mage. Can you show me the script?", next = "w8_tr2", when = { class = "MAGE" } },
        { text = "Something else, Ranath.", next = "BACK" },
      },
    },
    w8_tr2 = {
      lines = {
        { id = "w8_tr2_a", text = "Nobody knows, and nobody ever will, and that is the best kind of mystery, because it cannot disappoint. The dead laugh more than you would think, mortal; we have outlived most of the things that made us solemn." },
        { id = "w8_tr2_mage", when = { class = "MAGE" }, text = "Look, but do not touch, and do not try to read it aloud, because the grammar has teeth. See how the second hand presses harder on the stone? Whoever wrote 'unless you are Harlan' meant it very much." },
      },
      choices = {
        { text = "Poor Harlan.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Ranath Nightstride, and yes, I am dead, which saves us both the awkwardness of you asking. The Kirin Tor bring me words that nobody living can read, and I read them, and the cats keep me company while I do." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "A kaldorei, in a city of human magi, looking at a Highborne shade as if he owed you money. Ishnu-alah all the same; sit down, and let us be civil." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You carry yourself like the old court, cousin, though the sky has thinned you. Ysa'bel, your scholar from the bookshop, has been here three times this month, and I expect she sent you." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A magus. You may watch me work, if you like, so long as you do not try to help; your teachers' teachers were not yet born when these words were written." },
      },
      again = {
        { id = "h_again", text = "What else? I have all the time in the world, which is the one thing the dead have plenty of." },
        { id = "h_again2", text = "Ask. Merry has taken my lap, so I am not going anywhere." },
      },
      choices = {
        { text = "What is the Linguists Lounge?", next = "lounge" },
        { text = "How did you come to be... like this?", next = "dead" },
        { text = "Whose cats are these?", next = "cats" },
        { text = "The Skyborne say they descend from the Highborne.", next = "skyborne" },
        { text = "Why would a kaldorei be glad to see you?", next = "xnightelf", when = { race = "NightElf" } },
        { text = "What did your people know of magic that we don't?", next = "xmage", when = { class = "MAGE" } },
        { text = "What are you translating at the moment?", next = "w8_tr" },
        { text = "I'll leave you to your reading.", next = "END" },
      },
    },

    lounge = {
      lines = {
        { id = "lo_default", text = "A quiet room where the Kirin Tor send whatever they cannot read: old scrolls, carved stones, a door with words on it that one of them brought me in pieces. Most of it is in the tongue of my people as it was spoken long ago, and the young ones mangle it terribly." },
      },
      choices = {
        { text = "Why help the Kirin Tor at all?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "wy_default", text = "Because they asked politely, and nobody has asked me anything politely in a very long time. And because a word that no one can read is a word that has died, and I have some sympathy for the dead." },
      },
      choices = {
        { text = "That's a kind reason.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dead = {
      lines = {
        { id = "de_default", text = "That is a story I keep for myself, and I have kept it longer than this city has stood. I was Highborne, I am still Highborne, and I have been dead far longer than I was ever alive, and that is all you'll have from me." },
      },
      choices = {
        { text = "Does it trouble you, what the Highborne did?", next = "guilt" },
        { text = "Something else.", next = "BACK", fx = { learn = { "highborne" } } },
      },
    },
    guilt = {
      big = true,
      lines = {
        { id = "gu_default", text = "Some days it does, and some days I remember that I was a scholar and not a queen. My people reached for more than the world could hold, and the sea took the rest; whether every one of us deserved it is a question I stopped asking long ago." },
      },
      choices = {
        { text = "Not every Highborne was Azshara. You needn't carry her guilt.", next = "BACK", reply = "You're kind, and the cats would agree with you, though I suspect they'd say anything for a warm lap, so I'll weigh your words a little more carefully than theirs.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Your people drowned a world. Some guilt is earned.", next = "BACK", reply = "It is, and I'll not quarrel with you, because I have had ten thousand years to quarrel with myself on the same point, and the argument never ends in my favour.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cats = {
      lines = {
        { id = "ca_default", text = "Mine, it seems, though I never asked for them. Bub, Merry, Mister Tibbs and Pippin, and they lie against me as if I were a warm stone, which I am certainly not; perhaps cats simply prefer company that does not move." },
      },
      choices = {
        { text = "They like you, plainly.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    skyborne = {
      lines = {
        { id = "sk_default", text = "So they tell me, and their eyes say it before their mouths do. One of their scholars from the bookshop, Ysa'bel, comes here asking about Eldre'Thalas and the old court, and I have told her nothing yet." },
      },
      choices = {
        { text = "Why tell her nothing?", next = "skyborne2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    skyborne2 = {
      lines = {
        { id = "s2_default", key = true, text = "Because she wants to hear that her ancestors were heroes, and I cannot tell her whether they were. I can tell her what the Highborne were like, and I am not certain she will thank me for it." },
      },
      choices = {
        { text = "She'd rather have the truth than a story.", next = "BACK", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xnightelf = {
      lines = {
        { id = "xn_default", text = "I would not expect it, and I would not ask for it. When the Highborne would not give up their magic, your people sent them over the sea, and the ones who stayed learned to keep their heads down; you need not forgive me for being one of them, only let me read in peace." },
      },
      choices = {
        { text = "Read in peace, then, Ranath.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xm_default", text = "Nothing you would want to learn, magus, and much you would want to learn anyway. We knew that magic answers anyone who calls it loudly enough, and we did not know when to stop calling." },
      },
      choices = {
        { text = "I'll remember when to stop.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know old words and older grudges, and a little of what happened in between. Choose carefully; I answer at length." } },
    background = { { id = "tp_bg", text = "Highborne, a scholar, and dead. The rest belongs to me, and I have had a long time to grow fond of keeping it." } },
    advice = { { id = "tp_ad", text = "Learn the words before you learn the spells. A spell is only a word that someone finally understood." } },
    highborne = { { id = "tp_hb", text = "We were the finest scholars this world has seen and the worst neighbours, both at once. I would not choose to be anything else, and I would not wish it on anyone." } },
    _none = { { id = "tp_none", text = "That is a matter for the living, I'm afraid. Ask someone with a pulse." } },
  },
}

P:NPC {
  key = "dal_thaldris", id = TODO_NPC("Spellweaver Thaldris"), name = "Spellweaver Thaldris", title = "Transmogrifier",
  bible = "bibles/archives.md", role = "vendor", tier = "service",
  communities = { "dalaran" }, temper = { "fussy", "wry" }, values = { "proud", "curious" },
  notices = { "race", "class" },

  impression = {
    first = "He judged my clothes first and me second, and me more kindly.",
    third = "{name} met Spellweaver Thaldris, a night elf who weaves glamours at Talismanic Textiles in Dalaran.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my favourite canvas returns. Come, let us see what the road has done to your silhouette this time." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll alter your look, since it's my trade, but I would sooner dress a scarecrow." },
    { id = "g_default", text = "Ah, a customer. Those boots and that coat have never been introduced, have they?" },
    { id = "g_nightelf", when = { race = "NightElf" }, text = "Ishnu-alah. Yes, a kaldorei spellweaver; you may close your mouth now." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and I see you've kept the look. Good taste is catching." },
  },

  notice = {
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "You're wondering what a Sentinel's cousin is doing with arcane thread in a human city. So is my mother, and she writes to ask me every season." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Every warrior I've ever met wears whatever they took off the last thing they killed, and I see you're no exception. Sit down, please, before my eyes give out." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Spellweaver Thaldris, of Talismanic Textiles. I weave glamours, so your armour may look like whatever you please while it goes on doing what it was made to do, and from the look of you, {class}, I came along just in time." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "Ishnu-alah. A kaldorei weaving arcane thread among the Kirin Tor, I know, and before you ask, yes, the Sentinels have heard, and no, they did not approve." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A magus, at last, someone who'll understand that a glamour is the hardest thing in this city to do well and the easiest to do badly. Sit, and tell me what you'd like to look like." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue, so you'll want something darker, I expect, and quieter, with fewer buckles that catch the light. Rogues are my easiest customers and my least talkative." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } },
          text = "You've died rather often, {class}, if the state of that armour is any guide, and my glamours can hide a great many sins but not a spirit healer's handiwork forever. Do try to keep it in one piece for a week." },
      },
      again = {
        { id = "h_again", text = "Something else? Momo is asleep on the silk, so we'll have to talk until she moves." },
      },
      choices = {
        { text = "A look should show who you truly are, not hide it.", next = "BACK", reply = "Spoken like someone with nothing to hide, which in this city is rare and rather refreshing.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "I'd dress as a Kirin Tor magister if it opened doors.", next = "BACK", reply = "You'd be found out by the shoes, but I admire the nerve, if not the ethics.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How does a glamour work?", next = "glamour" },
        { text = "Why does a night elf weave spells here?", next = "why" },
        { text = "Whose cat is that on the silk?", next = "momo" },
        { text = "Your mother writes every season, you said?", next = "mother" },
        { text = "Who are your strangest customers?", next = "cust" },
        { text = "Be honest. What would you change about me?", next = "look" },
        { text = "Could a glamour change a face, too?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What do you make of Skyborne weaving?", next = "xsky", when = { race = "Skyborne" } },
        { text = "Change how my gear looks.", next = "BUSINESS" },
        { text = "I like my look as it is.", next = "END" },
      },
    },

    glamour = {
      lines = {
        { id = "gl_default", text = "A thread of seeming woven over the true thing, so close that the eye takes it for the cloth itself. The steel underneath stays steel, and the axe still bites, and only the eye is fooled, which, in my experience, is the part of a person most worth fooling." },
      },
      choices = {
        { text = "Does it ever fail?", next = "glamour2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    glamour2 = {
      lines = {
        { id = "g2_default", text = "Only when it's woven badly, and I don't weave badly. I've seen cheap glamours in Alterac taverns peel off a cloak in the rain, and the poor fool beneath was wearing his grandmother's curtains." },
      },
      choices = {
        { text = "I'll come to you, then, not a tavern.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      big = true,
      lines = {
        { id = "wy_default", text = "Because my people fear the arcane, and with reason, and I found I couldn't stop wanting to learn it anyway. Here nobody frowns at a spellweaver, except at the length of my waiting list." },
        { id = "wy_nightelf", when = { race = "NightElf" },
          text = "You know why, or you can guess. Our elders remember the Well and what came of it, and they think any kaldorei who touches the arcane is halfway to Azshara's court, and I thought I'd rather prove them wrong somewhere they couldn't watch." },
      },
      choices = {
        { text = "Your elders are right. That magic drowned a world.", next = "BACK", reply = "They are, and I've heard it at every family gathering since I first lit a cantrip, so you'll forgive me if I don't take the lecture any better from a stranger.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Good. Old fears shouldn't decide what you become.", next = "BACK", reply = "How refreshing, and how rare, and if I'd heard that from my mother I might still be living in Ashenvale instead of hemming robes for the Kirin Tor.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    momo = {
      lines = {
        { id = "mo_default", text = "Momo, and she belongs to the shop, or the shop to her; I've stopped arguing. She sleeps on the most expensive bolt in the room every time, so she has better taste than most of my customers." },
      },
      choices = {
        { text = "Present company excepted, I hope.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mother = {
      lines = { { id = "mt_default", text = "Every season, on bark paper, in a hand so neat it's an accusation. She asks whether I've eaten, whether I've come to my senses, and whether the humans have finally burned their city down again, always in that order." } },
      choices = {
        { text = "What do you write back?", next = "mother2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mother2 = {
      lines = { { id = "m2_default", text = "That I've eaten, that my senses are where I left them, and that the city burned once and the humans are putting it back with a great deal of scaffolding. I enclose a scrap of silk each time, woven to look like oak bark, so she can see I've not forgotten what home looks like." } },
      choices = {
        { text = "Has she ever answered the silk?", next = "mother3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mother3 = {
      lines = { { id = "m3_default", text = "Not in words, but the last letter came wrapped in it, which from my mother is very nearly an embrace. I've told no one that, {class}, and I'll thank you to forget I said it." } },
      choices = {
        { text = "Forgotten already. Something else.", next = "BACK", fx = { affinity = 2 } },
      },
    },

    cust = {
      lines = { { id = "cu_default", text = "An archmage who wanted his robes to look exactly like his old robes, only without the scorch marks, and a dwarf who wanted his armour to look like more armour. And once a paladin asked me to make his plate look humbler, which I'm still thinking about." } },
      choices = {
        { text = "Humbler plate? What did you do?", next = "cust2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cust2 = {
      lines = { { id = "c2_default", text = "I took the gilt off the seeming and left it on the steel, so it looked plain and was still the finest thing he owned. He said it felt right, and I suspect his order would have something to say, but that's between him and his Light." } },
      choices = { { text = "That's a clever kind of tailoring.", next = "BACK", fx = { affinity = 1 } } },
    },

    look = {
      big = true,
      lines = {
        { id = "lk_default", text = "Honestly? The question isn't what I'd change, it's what you want people to see when you walk in. Some heroes want a crest the whole room knows, and some want to be the most forgettable person at the bar. Which are you?" },
        { id = "lk_warrior", when = { class = "WARRIOR" }, text = "Honestly? I'd start by making those pauldrons agree with each other. But first tell me what you want a room to see when you walk in, a crest everyone knows, or nothing worth remembering?" },
      },
      choices = {
        { text = "Let them see exactly who I am, crest and all.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Forgettable. A face nobody remembers is a useful thing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xrogue = {
      lines = { { id = "xr_default", text = "It could, and I won't, so put the purse away before you embarrass us both. Cloth and steel will lie for you all day, but I don't weave seemings over faces, because the Kirin Tor take a very dim view of it and so do I." } },
      choices = {
        { text = "Fair enough. The cloak will do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsky = {
      lines = { { id = "xk_default", text = "That your weavers think about wind the way mine think about roots, and it shows in every hem. Belanaa Windveil let me look at a cloak once, a double turn at the hem against the gusts, and I've been jealous for a month." } },
      choices = { { text = "I'll tell her you said so.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "I make things look as their owners wish they did. It's honest work, and it's more honest than most of the faces in this city." } },
    kirin_tor = { { id = "tp_kirin", text = "The Kirin Tor tolerate me because I'm good, and I tolerate them because they're the only people who've never told me the arcane will drown the world again. Not to my face, at least." } },
    background = { { id = "tp_bg", text = "Kaldorei, from Ashenvale's edges, and a disappointment to my mother. The thread was worth it." } },
    advice = { { id = "tp_ad", text = "Pick one colour and keep it, {class}. People remember a hero by the cloak, whatever the bards say about the deeds." } },
    _none = { { id = "tp_none", text = "I couldn't say, I'm afraid. If it can't be worn, it isn't my concern." } },
  },
}

P:NPC {
  key = "dal_seasoned", id = TODO_NPC("Seasoned Adventurer"), name = "Seasoned Adventurer",
  bible = "bibles/archives.md", role = "citizen", tier = "service",
  communities = { "dalaran" }, temper = { "dry", "steady" }, values = { "practical" },
  notices = { "greenness" },

  impression = {
    first = "He gives advice freely and expects nobody to take it.",
    third = "{name} shared a word with a seasoned adventurer drinking at Cantrips & Crows in Dalaran.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back in one piece, I see. Sit down and tell me which of my warnings you ignored this time." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I've known your sort on the road, and I keep my back to the wall when you're in the room." },
    { id = "g_default", text = "Pull up a stool. The ale's warm and the company's worse." },
    { id = "g_green", when = { band = { "Greenhorn", "Blooded" } }, text = "Fresh off the road, are you? Sit, before you fall down." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { band = { "Greenhorn", "Blooded" } },
      text = "You've the look I had once, all buckles and no scars. Keep the buckles, if you can, and let the scars come slowly." },
  },

  start = "hello",
  nodes = {
    dd_deaths = {
      lines = { { id = "dd_deaths_default", text = "The dying doesn't, but the walk back does, once you stop counting. What gets harder is watching the young ones die on their first trip down and never quite come back the same, so I sit here and try to talk them out of the worst of it." } },
      choices = {
        { text = "Every death taught me something. I'd not trade them back.", next = "BACK", reply = "Spoken like a veteran, and a slightly mad one. That's the only kind that lasts, mind.", fx = { align = { order = -1 } } },
        { text = "I'll plan better. Dying is a mistake I mean to stop making.", next = "BACK", reply = "Good, and I wish you luck with it, because I've been saying the same thing for ten years. Buy a better map, at least.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "No name worth giving, friend, just a fellow who's been down more sewers than he can count. I'm waiting on a party for the city's undercroft, and they're late, which is the first thing you learn about parties." },
        { id = "h_sewers", when = { killed = { name = "Atrexis", min = 1 } },
          text = "You've been down under the city and come back up, I hear, which puts you ahead of the last three groups I sat here waiting for. Have a drink, if your stomach will take it." },
        { id = "h_dd_deaths", when = { deaths = { min = 20 } },
          text = "You've the look of someone who's woken up beside a spirit healer more times than they'd admit, friend. Pull up a stool, because so have I, and it's nicer to compare notes than scars." },
      },
      again = { { id = "h_again", text = "Anything else? My party's still late." } },
      choices = {
        { text = "What's down under the city?", next = "sewers" },
        { text = "Any advice for someone starting out?", next = "advice" },
        { text = "Why do you keep doing this?", next = "why" },
        { text = "Who's in this late party of yours?", next = "party" },
        { text = "That's a fine set of scars.", next = "scars" },
        { text = "What about the goblin at the end of the bar?", next = "goblin" },
        { text = "As it happens, I'm a healer.", next = "xheal", when = { class = { "PRIEST", "DRUID", "SHAMAN", "PALADIN" } } },
        { text = "I've seen my share of holes too, friend.", next = "xvet", when = { band = { "Seasoned", "Veteran", "Champion" } } },
        { text = "Good luck with your party.", next = "END" },
        { text = "I've died more often than I'd like. Does it get easier?", next = "dd_deaths", when = { deaths = { min = 20 } } },
      },
    },

    sewers = {
      lines = {
        { id = "sw_default", text = "Rats, loose magic and worse, and a grate on the west wall that won't open without the Kirin Tor's sewer key. I'd not go without four friends and a healer, and I'd not count on the friends." },
      },
      choices = {
        { text = "Worse than loose magic?", next = "sewers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sewers2 = {
      lines = {
        { id = "s2_default", text = "Somebody down there's raising the dead, right under the magi's noses, and I've heard the shuffling through the grate myself. The Kirin Tor say it's in hand, and they say that about everything." },
      },
      choices = {
        { text = "I'll have a look myself.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    advice = {
      lines = {
        { id = "ad_default", text = "Buy bandages before you buy a better sword, and learn to run before you learn to fight. And never, ever touch anything in this city that hums." },
      },
      choices = {
        { text = "Sound advice. Thank you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      big = true,
      lines = {
        { id = "wy_default", text = "Gold, at first, and then habit, and now I'm too old to learn a trade that doesn't involve stabbing things. Why do you do it, then?" },
      },
      choices = {
        { text = "For the people who can't fight for themselves.", next = "BACK", reply = "That's a good answer, and I had one like it once, so hold on to it tight, because the holes get deeper and it gets harder to remember why you went down.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "For the gold, plainly. Same as you.", next = "BACK", reply = "At least you're honest, which puts you ahead of most I've drunk with, and gold has the virtue of being easy to count when everything else isn't.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    party = {
      lines = { { id = "pa_default", text = "A dwarf who swears he can open any lock, a young magus who's read about sewers, and a priest who said she'd be along after evening prayers, three days ago. I'm beginning to suspect the prayers are going very well." } },
      choices = {
        { text = "Why not go without them?", next = "party2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    party2 = {
      lines = { { id = "p2_default", text = "Because the last fellow I knew who went into a hole alone is still in it, friend, and I'd like to finish my ale someday. Nobody's brave enough to go down alone, only foolish enough, and I gave up being foolish around the time I gave up my knees." } },
      choices = {
        { text = "What happened to that fellow?", next = "party3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    party3 = {
      lines = { { id = "p3_default", text = "Went into the Deadmines after a Defias paymaster's strongbox and came out three weeks later in a pine box, courtesy of the Westfall militia. He'd found the strongbox, mind you, and it was empty." } },
      choices = {
        { text = "That's a grim joke.", next = "BACK" },
        { text = "I'll take friends with me. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    scars = {
      lines = { { id = "sc_default", text = "This one's an ogre in the Alterac foothills, and this one's a Defias cutlass, and this one I got falling down the stairs at the Lion's Pride Inn, which I tell people was a gnoll. Which would you like to hear about?" } },
      choices = {
        { text = "The ogre.", next = "scars2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scars2 = {
      lines = { { id = "sc2_default", text = "Crushridge, out past the ruins of Alterac City, swinging a tree trunk with the bark still on. I ducked, which was right, and then I stood up again, which was wrong, and I've been a good deal more careful about standing up ever since." } },
      choices = { { text = "Sound lesson. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    goblin = {
      big = true,
      lines = { { id = "gb_default", text = "Calls herself a fellow Dalaranian, in a robe that fits her like a sail, and she's been watching every purse in the room. She offered to cut me in on a rare tome she's going to rescue from the magi, and I'm still deciding whether to warn them. What would you do?" } },
      choices = {
        { text = "Warn the magi. A thief's still a thief.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Take the cut. The magi have books enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xheal = {
      lines = { { id = "xh_default", text = "Are you, now? Then sit down and let me buy you a drink, because a healer who turns up is worth three who promise. I'll not ask you to come down with us, but I'll not stop you either." } },
      choices = {
        { text = "Ask me again when your party arrives.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xvet = {
      lines = { { id = "xv_default", text = "I can see it in how you sat down, back to the wall and one eye on the door. Then you know the second thing you learn about parties, which is that the late ones are the lucky ones." } },
      choices = { { text = "Then here's to the late ones.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Bandages before swords. I'll keep saying it until somebody listens." } },
    dalaran = { { id = "tp_dalaran", text = "A city full of wizards and loose magic, with dead men under the streets. Best place for an adventurer to drink, because there's always work and there's always a reason to need a drink." } },
    kirin_tor = { { id = "tp_kirin", text = "They say everything's in hand, and they pay on time, and that's all I ask of anyone who sends me down a hole." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. I know holes in the ground, and that's about all." } },
  },
}
