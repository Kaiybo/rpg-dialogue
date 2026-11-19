-- The Undercity's working dead: the bank, the stables, the War Quarter's weapon master and smith,
-- the Magic Quarter's enchanter, the Rogues' Quarter's trainer and poisoner, and the city's
-- teachers of bandages, fishing and mining. No quests and little gossip in the game.
-- Voice: bibles/townsfolk.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Trade Quarter
---------------------------------------------------------------------------

-- William Montague: a banker who kept accounts in Lordaeron's capital before it fell, and still does.
P:NPC {
  key = "wmontague", id = TODO_NPC("William Montague"), name = "William Montague", title = "Banker",
  bible = "bibles/townsfolk.md", role = "banker", tier = "service",
  communities = { "undercity" }, temper = { "dry" }, values = { "precise", "honest" },
  impression = {
    first = "He finds death a poor excuse for sloppy accounts.",
    third = "{name} met William Montague, a banker of the Undercity who still keeps Lordaeron's habits of order.",
  },

  greetings = {
    { id = "g_hi", text = "Deposit or withdrawal? Speak clearly, please; the vaults echo." },
    { id = "g_back", when = { metBefore = true }, text = "Your account is in order. Most of the dead left theirs in a shambles, along with everything else." },
    { id = "g_living", when = { ["not"] = { race = "Scourge" } }, text = "A living customer, how refreshing. Your coins are perfectly safe here, and so are you, mostly." },
  },

  notice = {
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The lamp on my counter goes dim whenever you lean over it, and I've noticed it does that for your sort. I'll count your coins twice, if you don't mind, and not because I doubt you." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Unsettle is a strong word for a banker, who has seen far stranger things deposited. I only note that the Light once condemned everything in this vault as plague-touched, and now it walks in to make a deposit, which is a remarkable turn of the ledger." } },
      choices = {
        { text = "The Light keeps better accounts than the living ever did.", next = "BACK", reply = "A charming thought, and not entirely wrong. Your account is in perfect order, at any rate, which is more than the Church's ever was.", fx = { align = { light = 1 } } },
        { text = "The Light owes me nothing, and I owe it less.", next = "BACK", reply = "Then you and it are square, and I do so like a balanced ledger. Sign here, please.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "It ought to be, by every rule I know, but the Church never formally dissolved and I refuse to close an account on a rumour. I keep it balanced, to the copper, in case someone with the proper seal ever comes asking." } },
      choices = {
        { text = "Keep it open, William. Rules are rules, even now.", next = "BACK", reply = "Exactly so, and I'm pleased someone appreciates it. A closed account is a broken promise, even to a dissolved Church.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Close it and spend it on the living city.", next = "BACK", reply = "Spend it? Without the proper seal? I'd sooner spend my own fingers, thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Considerably, since nobody has yet robbed the vaults of the Undercity, and a great many people have robbed dead warriors. Leave what you don't need with me, and you'll have it again when you come back, if you come back." } },
      choices = {
        { text = "I'll leave it with you. Order keeps things safe.", next = "BACK", reply = "Very sensible, and your belongings will be here, dusted and labelled, when you return.", fx = { align = { order = 1 } } },
        { text = "I keep what's mine on my back, Mister Montague.", next = "BACK", reply = "Then I hope it's a strong back, because the Plaguelands are full of people who'd like what's on it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Pelts, mostly, and the odd fang they're saving for a tanner who'll pay them properly. I keep it all neatly, though I do wish hunters would clean their goods before handing them over the counter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Pelts, mostly, and the odd fang, and I see {pet} eyeing my ledgers as if they were its next meal. I keep it all neatly, though I do wish hunters would clean their goods before handing them over." },
      },
      choices = {
        { text = "I'll bring them clean, then. It's a fair request.", next = "BACK", reply = "Thank you. A clean pelt makes for a clean ledger, and a clean ledger makes for a happy banker.", fx = { align = { order = 1 } } },
        { text = "A bit of blood never hurt a ledger, Mister Montague.", next = "BACK", reply = "It has, frequently, and I have the stains to prove it. Clean them, please.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do, and I've learned to label them all very carefully, because a clerk who can't account for a box that hums is not much of a clerk. Keep your shards in your bags and your gold with me, and we'll both sleep well, or whatever it is we do now." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "They do, and I've learned to label them all very carefully, and I'll ask your demon to stop looming over the counter where the clerks can see it. Keep your shards in your bags and your gold with me, and we'll both sleep well, or whatever it is we do now." },
      },
      choices = {
        { text = "My vault will stay quiet and orderly, Montague.", next = "BACK", reply = "Splendid. An orderly vault is the foundation of an orderly life, or unlife.", fx = { align = { order = 1 } } },
        { text = "What I keep there is none of your business, clerk.", next = "BACK", reply = "Quite right, until it starts humming at the clerks. Then it becomes my business very quickly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "William Montague, of the bank of the Undercity. Whatever you leave with me stays in the vaults beneath the old city until you ask for it, and it can be reached from any bank of the Horde." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "Ah, one of us. I'd advise you to keep your valuables here rather than in your pockets; our pockets do tend to fall apart." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your gold is as welcome as anyone's, and I ask only that you keep the lightning away from the vault doors, since the hinges are older than I am." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, at the bank. I confess I've never understood what a druid keeps in a vault, since you seem to carry everything in your fur." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll be wanting a safe place for your spare arms, I expect, since carrying three swords into the Crusade's camps seems excessive." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. I'd ask that your beast wait outside the counting room, {class}; it isn't personal, but the ledgers are very old and very dry." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The old Church of the Light kept an account here before the city fell, and I confess I've never known quite whom to close it in favour of." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. I'll keep your valuables safe, though I'd ask you not to store anything that moves." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, keeping a vault in the Undercity. I'd ask you not to bless the ledgers, {class}, because some of them are older than the plague and quite fragile, but I confess I'm curious what the Light makes of our accounts." },
      },
      again = {
        { id = "h_again", text = "Anything further? I have accounts to balance, and a depositor who left his own hand in his box by mistake." },
        { id = "h_again2", text = "Ask, by all means. I have been dead for some years and have learned to be patient about interruptions." },
      },
      choices = {
        { text = "Should the old Church's account be closed, William?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you trust the Horde's gold, Mister Montague?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do the Forsaken keep in your vaults, Mister Montague?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Open my vault.", next = "BUSINESS" },
        { text = "You have the look of a man who kept accounts in life.", next = "life" },
        { text = "What do the dead need with gold?", next = "gold" },
        { text = "These vaults look older than the Forsaken.", next = "vaults" },
        { text = "Your vaults must tempt a few thieves, Mister Montague.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do mages bank their reagents with you?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "My gear might be safer in your vaults than on my back.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do hunters bank with you, Mister Montague?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What strange things do my kind lock in your vaults, Montague?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I seem to unsettle you, Mister Montague.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good day, Mister Montague.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "A clerk at a counting house in the capital, three streets from the palace. When the plague came I was in the middle of a ledger, and when I woke up in the Undercity, I'm told the first thing I asked for was a pen." } },
      choices = {
        { text = "You must miss your old life.", next = "life_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life_miss = {
      lines = { { id = "lm_default", text = "I miss the bread, and I miss sunlight on the counting-house windows. I do not miss my employer, who owed me a month's wages, and who I'm fairly sure is shambling about the Plaguelands now." } },
      choices = {
        { text = "The past is gone. Look forward.", next = "BACK", reply = "Forward, yes, though I'll keep a note of what he owes me, just in case.", fx = { align = { order = -1 } } },
        { text = "Some things are worth holding on to.", next = "BACK", reply = "Some are, and that month's wages is one of them. I'll collect, one day.", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    gold = {
      lines = { { id = "g_default", text = "The same as the living, only less of it goes on food. The apothecaries want reagents, the soldiers want steel, and the Dark Lady's war against the Scourge isn't paid for with good intentions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    vaults = {
      lines = { { id = "v_default", text = "They are, and they belonged to the royal family of Lordaeron, after a fashion. These were catacombs and crypts beneath the palace, and some of the vaults were already full of very old kings when we moved in. We've since made other arrangements for them." } },
      choices = {
        { text = "That seems disrespectful.", next = "BACK", reply = "Perhaps, but the kings are very well kept, and they've never complained about the rent.", fx = { align = { light = 1 } } },
        { text = "The dead kings don't need the space.", next = "BACK", reply = "They don't, and they're remarkably quiet neighbours besides. I've rented the spare shelf.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "What arrangements?", next = "vaults_arr" },
      },
    },
    vaults_arr = {
      lines = { { id = "va_default", text = "I don't ask, and I'd advise you not to either. The apothecaries were very interested in the old kings, and that's all I'm prepared to say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I trust gold, which is the only thing in this city that hasn't changed its loyalties since the plague. The Horde's coin spends the same in Orgrimmar as it does here, and I've found the orcs settle their debts more promptly than Lordaeron's nobles ever did." } },
      choices = {
        { text = "Then we'll keep our debts paid, and our word with them.", next = "BACK", reply = "Very proper, and the orcs will appreciate it. A paid debt is the best treaty there is.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Debts are for the weak. I pay what I must.", next = "BACK", reply = "Then you'll pay a little interest on what you must, and I'll be glad of it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Records, chiefly, and the deeds to houses nobody will live in again. Half my vaults are full of Lordaeron's paper, and I keep it in order because somebody ought to remember who owned what, even if every owner is dead or in this city." } },
      choices = {
        { text = "Keep the records. Someone ought to remember.", next = "BACK", reply = "Thank you. Somebody ought to, and it may as well be someone who can read the handwriting.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn the old deeds. The Forsaken own what they hold.", next = "BACK", reply = "They own it, yes, but I'd still like to know whose it was. Burning paper is a habit for the Crusade, not for us.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They tempt a great many, and the Rogues' Quarter is a very short walk away, which I consider a poor piece of city planning. No thief has yet opened one of my vaults without my ledger noting it, and I intend to keep that record." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "If you lifted purses in the capital before the plague, some of that gold may well be sitting in my vaults today. I find that rather tidy, and I hope you'll leave it where it is." },
      },
      choices = {
        { text = "Your vaults are safe from me, sir.", next = "BACK", reply = "Splendid, and I'll not check your pockets on the way out, much.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No ledger catches everything, Mister Montague.", next = "BACK", reply = "No, but mine catches enough to worry the ones it misses. Do try me, if you're feeling brave.", fx = { align = { order = -1 } } },
        { text = "These vaults look older than the Forsaken.", next = "vaults" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They do, and they insist on labelling every pouch in a hand nobody else can read, which plays havoc with my accounts. The Magic Quarter folk are good customers otherwise, though one of them once stored something in a vault that hummed." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran's people banked in the capital too, in the old days, and they were exactly as particular then as they are now. I find the consistency rather comforting." },
      },
      choices = {
        { text = "I'll label my pouches plainly, sir.", next = "BACK", reply = "Bless you. Plainly is the only way a ledger can be kept.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My reagents are my own affair, sir.", next = "BACK", reply = "They are, until one of them leaks onto my counter. Then they're very much mine.", fx = { align = { order = -1 } } },
        { text = "What do the dead need with gold?", next = "gold" },
      },
    },
  },

  topics = {
    new_plague = { { id = "tp_plague", text = "The Royal Apothecary Society's business, not mine. I only keep their accounts, and their accounts are alarming." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken keep their accounts in good order, which is more than I could say for the living nobility of Lordaeron. A ledger is a ledger, whoever holds the pen." } },
    lordaeron = { { id = "tp_lordaeron", text = "I kept accounts for a banking house in the capital, back when the capital was above us and full of gold. The vault doors are still down here, and some of them still have the old crests on them." } },
    scourge = { { id = "tp_scourge", text = "The Scourge never paid its debts, and it left a great many accounts unsettled. I've closed most of them, and the rest belong to names I'll never find." } },
    _none = { { id = "tp_none", text = "That isn't in my ledgers. Try Innkeeper Norman; he hears everything that's said in the Trade Quarter." } },
  },
}

-- Anya Maulray: the stable master, whose beasts have to be persuaded the dead won't eat them.
P:NPC {
  key = "maulray", id = TODO_NPC("Anya Maulray"), name = "Anya Maulray", title = "Stable Master",
  bible = "bibles/townsfolk.md", role = "stablemaster", tier = "service",
  communities = { "undercity" }, temper = { "gentle" }, values = { "kind", "patient" },
  notices = { "pet", "lock_steed" },
  impression = {
    first = "She is softer with her beasts than with any of the living.",
    third = "{name} met Anya Maulray, the stable master of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "Quietly, please; the beasts startle easily down here, and they've never cared for the smell of the dead." },
    { id = "g_back", when = { metBefore = true }, text = "Come for your beast? It's been fed, and it has nearly forgiven me for smelling the way I do." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { named = true } },
      text = "{pet} is pressing close to you, look, and not to me. That's what trust looks like on a beast, and it's not easily won down here." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Don't bring that burning horse down into my stables, or I'll have every beast here kicking its stall to pieces. Leave it in the courtyard, if you must keep it at all." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Not fear, exactly. They look at you the way they look at the daylight through the grate, as though it's something good they've learned not to stare at, and I think they're wiser about it than most of the Forsaken." } },
      choices = {
        { text = "Then let them learn it's gentle, as I'm learning.", next = "BACK", reply = "That's a kind way to see it, and I think they'd come round to you in time. The old hound took a month with me, and now he won't leave my side.", fx = { align = { light = 1 } } },
        { text = "They're right to keep their distance. The Light isn't gentle with us.", next = "BACK", reply = "It isn't, I know, and they're wiser than us about it. Keep your distance too, then, and they'll trust you sooner.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They feared me for a long time, because they could smell what I was, and nothing I did would change it. Patience did it, months of it, and long hours of sitting still, which I suspect is more of a prayer than anything Duesten ever taught." } },
      choices = {
        { text = "That patience sounds like faith to me, Anya.", next = "BACK", reply = "Faith? I suppose it might be, though I'd never thought of it that way. Thank you, {class}.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts fear the dead for good reason. Let them.", next = "BACK", reply = "They do, and they'll keep fearing until somebody gives them reason not to. I'd like to be that somebody.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some would, the hounds especially, because they like someone who stands still and doesn't flinch. You'll never be a hunter, {class}, but if you've a kind hand and a little patience, there are one or two in here who'd let you scratch their ears." } },
      choices = {
        { text = "I'd like that, Anya. A kind hand costs nothing.", next = "BACK", reply = "It doesn't, and it buys a great deal. Come and meet the old hound in the corner; he's a soft one.", fx = { align = { light = 1 } } },
        { text = "Beasts are for hunters, Anya. I'll keep to steel.", next = "BACK", reply = "As you like, {class}, though I think you'd be surprised. Steel can't sit with you when it's quiet.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They fear anything that doesn't smell alive, and you smell of frost and old books, which isn't much better. Sit quietly by the cages for a while and they'll learn you, because they're braver than people give them credit for." },
      },
      choices = {
        { text = "I'll sit quietly and let them learn me.", next = "BACK", reply = "Good, and bring your patience. They'll come to you sooner than you think.", fx = { align = { light = 1 } } },
        { text = "They're beasts. They'll do as they're told.", next = "BACK", reply = "They're beasts, aye, and they'll do as they're asked, kindly. Telling them gets you bitten.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Anya Maulray. I keep the stables for the Undercity's hunters, which is harder than it sounds when every animal I care for can smell that I'm dead." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren hunter, so far from the plains. Your beasts are always the calmest ones I get; I think they learn it from you." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in my stables. The beasts always settle a little when one of your sort walks in, and I've never known why." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, how lovely. The beasts are watching you, see, the way they watch each other, and not the way they watch me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The beasts down here don't mind your sort, oddly enough, because you smell of steel and sweat and not of anything worse." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, down here with my animals. Speak softly, if you would, because the beasts don't care what you pray to and they startle at loud voices." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. The beasts don't like the cold you carry, so stand back a little from the cages." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, and one of ours. The beasts went very still when you came in, and I can't tell yet whether it's the Light that calms them or frightens them." },
      },
      again = { { id = "h_again", text = "Anything else? Keep your voice gentle, if you would; the beasts already think I'm something to run from." } },
      choices = {
        { text = "Do the beasts here fear the Forsaken, Anya?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shall I ask the beasts' spirits to trust you, Anya?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "It must hurt, Anya, that the beasts fear you.", next = "druid_q", when = { class = "DRUID" } },
        { text = "I need the stables.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "I'd guess the animals fear you.", next = "fear" },
        { text = "How do the beasts fare underground?", next = "under" },
        { text = "Why tend beasts at all, now?", next = "why" },
        { text = "Your beasts never hear me coming, Anya.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Your beasts will smell my demon, Anya. Will they bolt?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I doubt your beasts would take to a warrior, Anya.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the beasts fear mages, Anya?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do your beasts fear the Light I carry, Anya?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    fear = {
      lines = { { id = "f_default", text = "At first, all of them. A wolf will growl at me for a week before it eats from my hand, and a cat will hiss at me for longer. But they learn that I come back with food every day, and that's all any animal really needs to know." } },
      choices = {
        { text = "That's very patient of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Do you ever give up on one?", next = "fear_give" },
      },
    },
    fear_give = {
      lines = { { id = "fg_default", text = "Never yet. There was a bear from Silverpine that wouldn't come near me for a month, and come autumn it slept against the bars beside my chair. I count that as the best thing I've done since I woke up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    under = {
      lines = { { id = "u_default", text = "Badly, at first. There's no sun and the canals smell of things I'd rather not name. So I take them up the lift to the ruins at night and let them run in the courtyard, where the air is clean, or as clean as Tirisfal gets." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      big = true,
      lines = { { id = "w_default", text = "Because I raised horses before I died, near Brill, and caring for something warm is the one part of being alive I could still do. Some of the others think it's sentimental of me." } },
      choices = {
        { text = "It isn't sentimental. It's what keeps you yourself.", next = "BACK", reply = "Thank you. That's what I've always thought, though I'd never managed to say it so plainly.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The others are right. Sentiment is a weakness.", next = "BACK", reply = "Weakness, perhaps, but it keeps the cages full of trusting things. I'll keep it.", fx = { align = { light = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Would they listen? I've spent every day since I woke teaching wolves and cats that I won't eat them, and it's slow, and some never quite believe me. If the spirits whispered it to them I'd be grateful, but I think I'd rather they learned it from me." } },
      choices = {
        { text = "Then I'll leave them be. Trust that's earned is worth more.", next = "BACK", reply = "That's wise, and I'll keep earning it. Thank you for leaving me the work.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll ask anyway. Your beasts deserve peace sooner.", next = "BACK", reply = "Then ask, and I'll be very grateful if they listen. I'd like them to sleep easier.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Every day, a little, though I've stopped minding it the way I used to. I raised horses near Brill and they'd come to the fence when I called, and now I have to earn each beast over again, so you don't know how lucky you are to smell alive." } },
      choices = {
        { text = "Your patience is a gift. Keep earning them.", next = "BACK", reply = "I'll keep earning them, every one, even the bitey ones. Thank you, druid.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts follow strength, Anya, not kindness.", next = "BACK", reply = "Some do, but the ones that follow kindness follow longer. I'll keep my way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They hear you; they just don't think you're worth growling at, which is a different thing entirely. Rogues come down here to practise creeping and only frighten the bats, so I'd thank you to practise somewhere else." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "They hear you well enough, but a Forsaken who moves quietly smells like nothing at all to them, and that unsettles them more than noise would. Practise your creeping somewhere else, please, for their sake." },
      },
      choices = {
        { text = "I'll leave your beasts in peace, Anya.", next = "BACK", reply = "Thank you. The bats are nervous enough as it is.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Creeping's my trade. Your bats will cope.", next = "BACK", reply = "They will, but they'll keep me up for a week. Practise elsewhere, please.", fx = { align = { order = -1 } } },
        { text = "I'd guess the animals fear you.", next = "fear" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Not for a moment, and I don't blame them, because a beast knows a thing that doesn't belong in the world when it smells one. Leave it at the top of the stair, and I'll not have to calm every animal in the stable afterward." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "You ought to know better, since your people's wolves never cared for the warlocks' pets, or so a grunt told me once. Leave the demon at the top of the stair, please." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Not for a moment, and you can hear them now, every one of them kicking at its stall since your demon came down the stair. Take it back to the top and wait there, and I'll not have to calm every animal in the stable afterward." },
      },
      choices = {
        { text = "I'll leave it at the stair. I'd not have your beasts panic.", next = "BACK", reply = "Thank you. The beasts will settle quicker for it, and so will I.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon goes where I go. Your beasts can learn fear.", next = "BACK", reply = "Then it can wait at the top of the stair with you, warlock. My beasts come first here.", fx = { align = { order = -1 } } },
        { text = "How do the beasts fare underground?", next = "under" },
      },
    },
  },

  topics = {
    forsaken = { { id = "tp_forsaken", text = "The Forsaken keep beasts too, though most animals shy away from us at first. Patience is the whole secret, and the dead have plenty of that." } },
    scourge = { { id = "tp_scourge", text = "The Scourge raises dead beasts as well as dead men, and I can't bear to look at them. A dead wolf ought to be left in peace." } },
    thrall = { { id = "tp_thrall", text = "The orcs ride wolves, and they treat them better than most people treat their children. I like the orcs for that, whatever else they do." } },
    _none = { { id = "tp_none", text = "I'm afraid I only know about beasts. Ask at the inn; the innkeeper knows everyone." } },
  },
}

---------------------------------------------------------------------------
-- War Quarter
---------------------------------------------------------------------------

-- Archibald: the weapon master, a soldier of Lordaeron teaching dead hands to hold a blade again.
P:NPC {
  key = "archibald", id = TODO_NPC("Archibald"), name = "Archibald", title = "Weapon Master",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "stern" }, values = { "disciplined", "proud" },
  notices = { "class", "lock_armor" },
  impression = {
    first = "He expects to be obeyed and is surprised when he is.",
    third = "{name} met Archibald, the weapon master of the Undercity's War Quarter.",
  },

  greetings = {
    { id = "g_hi", text = "Stand up straight. You'd be amazed how many of the dead forget." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more drills? Good; nobody ever practised too much, and the dead can't claim they were tired." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Your grip's wrong. Thumb over, not under, or that blade will twist out of your hand on the first hard parry. Fix it now and thank me later." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That demon hide you're wearing crackles every time you move, and it will turn a blade or two before it burns away. Drill with me anyway, so your arms still know their work when it's gone." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'll drill you harder, because the Alliance will see your Light and call you a traitor to it, and the Scarlets will call you an abomination. Both will come at you first, so you'll need to swing faster than the rest of my students." } },
      choices = {
        { text = "I'll keep to your drills, Archibald, all of them.", next = "BACK", reply = "Good. I'll know if you skip one, because it shows in the shoulders.", fx = { align = { order = 1 } } },
        { text = "Drills are for recruits. I'll learn on the battlefield.", next = "BACK", reply = "Then you'll learn quickly or not at all. The battlefield's a harsh teacher, and it doesn't repeat itself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Every one of you, if you ask me, because the Scourge doesn't wait for you to finish your prayer. A staff or a mace, properly held, and you'll live long enough to say amen, or whatever the Forsaken say now." } },
      choices = {
        { text = "Then teach me, Archibald. I'll not rely on prayer alone.", next = "BACK", reply = "Good. Prayer and a mace, and you'll see the end of the fight.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My prayers will serve me better than your racks.", next = "BACK", reply = "Then I hope the Scourge waits for you to finish. It never waited for me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Whichever one you'll practise with every day, {class}, and a warrior should be able to pick up anything on the rack and use it. Learn the sword and the polearm both, because the battlefield doesn't care what you'd prefer." } },
      choices = {
        { text = "Every weapon on the rack, then. I'll drill them all.", next = "BACK", reply = "There's a proper warrior. Start with the sword and we'll work along the rack.", fx = { align = { order = 1 } } },
        { text = "I'll master one weapon, and let the rest go hang.", next = "BACK", reply = "Then you'd better hope the battlefield always hands you the right one. It never did for me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It's slower to load and heavier to carry, but it punches through a Crusader's breastplate where an arrow skips off. Learn both, {class}, and a polearm besides, because sooner or later something gets close enough that you'll want a long reach." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It's slower to load, but it punches through a Crusader's breastplate, and {pet} can keep them busy while you crank the string. Learn it alongside the bow, and you'll have an answer for most things." },
      },
      choices = {
        { text = "I'll learn it properly, from the stance up.", next = "BACK", reply = "Good. From the stance up is the only way, and you'll thank me when the first Crusader goes down.", fx = { align = { order = 1 } } },
        { text = "I'll pick it up as I go, weapon master.", next = "BACK", reply = "Then you'll pick up a few bruises too. Come back when you've learned the hard way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because one day your demon will fall, and you'll be left with nothing but your own hands. Drill every day, and when the moment comes, your arms will remember what your mind's too busy to think about." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Because one day your demon will fall, and I doubt that one will see you through every fight, whatever it thinks of itself. Drill every day, and when the moment comes, your arms will remember what your mind's too busy to think about." },
      },
      choices = {
        { text = "Then I'll drill, in case my demon ever fails me.", next = "BACK", reply = "Good. Your arms will thank you when your demon's gone.", fx = { align = { order = 1 } } },
        { text = "My demons do my fighting, Archibald. I've no time for drills.", next = "BACK", reply = "Then I'll see you on the slab, warlock. Make time.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Archibald, weapon master of the War Quarter. I teach anyone who can pay how to use a weapon they've never held before, and I teach the dead how to hold one with fingers that don't always do what they're told." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "Your joints creak, I can hear it from here. Mine did too, at first. Practise every day until your arms remember what your mind already knows." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Stand up straight, and keep those totems out of my training yard, because the recruits keep saluting them." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in my yard. You'll want a staff, I expect, since claws can't be bought or sold." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, at last! Most of my recruits want daggers or crossbows these days, so it does me good to see someone who'll take a proper blade seriously." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! I teach the crossbow, which the Deathguard swear by, and you'll find nothing in the Undercity that kills at range more reliably." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at the weapon racks? Your lot usually leave the blades to us, though I've seen a priest swing a mace in my time, and swing it well." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. You'll hold a blade like a spoon, I expect, so let's fix that." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken, with a hammer in a dead man's grip. Your joints will fight you on the swing like everyone's, but I'm told the Light steadies the arm, and I'd like to see that for myself." },
      },
      again = { { id = "h_again", text = "What else? Be quick; I've recruits at the target butts, and one keeps shooting his own foot, which he can't feel." } },
      choices = {
        { text = "Should a priest learn to fight, Archibald?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Will you teach a shaman the mace, weapon master?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is a staff worth learning, when I fight with claws?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me a new weapon.", next = "BUSINESS" },
        { text = "You carry yourself like a soldier.", next = "life" },
        { text = "Is it harder for the dead to fight?", next = "dead" },
        { text = "Which weapon should I learn?", next = "which" },
        { text = "Teach me daggers, Archibald, not swords.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Is a staff worth learning properly, Archibald?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Which weapon suits a warrior best, weapon master?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "A crossbow seems a poor trade for a good bow.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why would a warlock stoop to the blade, Archibald?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I expect you'll drill me like any other soldier, Archibald.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "A sergeant in Lordaeron's army, before the plague, and I trained recruits in the capital's yard right above where we're standing. When Prince Arthas came home, I was on the wall to welcome him." } },
      choices = {
        { text = "What happened that day?", next = "life_day" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life_day = {
      lines = { { id = "ld_default", text = "He walked up the road to the throne room, and everyone cheered him, and then he killed his father. I was dead by nightfall and I don't remember the rest. I'd like to meet him again, though, with a crossbow." } },
      choices = {
        { text = "Then I hope you get your chance.", next = "BACK", reply = "So do I, and I'll keep my crossbow oiled for it. Thank you for that.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Vengeance won't bring Lordaeron back.", next = "BACK", reply = "No, but it'll make me feel a great deal better. I'll take that.", fx = { align = { honor = -1 } } },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Slower in the hands, but we never tire and we don't feel half our wounds, which is an advantage until you notice you've been bleeding for an hour. Learn to check yourself after every fight." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    which = {
      lines = { { id = "w_default", text = "Whatever your trainer and your armour allow, and then the one you'll actually practise. A mediocre warrior with a sword he loves is better than a good one with an axe he resents." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I'll teach anyone who pays and listens, and a shaman with a good mace is worth two who rely on lightning. The Scourge doesn't wait for you to finish calling on anything, so learn to hit things, and learn to hit them first." } },
      choices = {
        { text = "I'll drill until my arm remembers, weapon master.", next = "BACK", reply = "Good. Lightning runs out, but a mace never does.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight my own way. Your drills are for soldiers.", next = "BACK", reply = "Then you'll be the first soldier to die without being one. Suit yourself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Everything's worth learning, because one day you'll be caught on two legs with no time to change. A staff kept me alive on the walls of the capital longer than my sword did, and I'd have you know that before you sneer at it." } },
      choices = {
        { text = "Then teach me. I'll practise every day.", next = "BACK", reply = "Good. A staff and a pair of claws, and you'll outlast any Scourge in Lordaeron.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My claws have never failed me, Archibald.", next = "BACK", reply = "Not yet, druid. When they do, come and see me, if you can still walk.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Daggers I'll teach, though the rogues who come to me usually know more about holding them than I do and less about blocking with them. Learn both, and you'll live through the fight the knife didn't finish." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I drilled the city watch in life, and I spent half my career chasing the sort of person you probably were. Now I'm teaching you to hold a dagger better, and I think the irony suits us both." },
      },
      choices = {
        { text = "I'll learn to block, Archibald. You're right.", next = "BACK", reply = "Good. I've buried rogues who never bothered, and every one of them looked surprised.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The fight's done before they can block.", next = "BACK", reply = "Usually it is, rogue, and then one day it isn't. Learn to block anyway.", fx = { align = { honor = -1 } } },
        { text = "Which weapon should I learn?", next = "which" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "More than worth it, since a mage who can only cast is a mage who dies the moment his mana runs dry. A good staff will crack a ghoul's skull as well as any mace, and it never asks you to say a word." },
        { id = "xmage_troll", when = { race = "Troll" }, text = "A troll mage with a staff is about the most dangerous thing I've seen walk into this quarter, since your people can swing as well as cast. Let's see if you can keep the end of it up." },
      },
      choices = {
        { text = "I'll learn the staff and save my spells.", next = "BACK", reply = "Good. Your spells will last longer if your staff does some of the work.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll stick to spells. That's what I'm for.", next = "BACK", reply = "It is, until the mana runs dry. Come and see me then, if you're still standing.", fx = { align = { order = -1 } } },
        { text = "Is it harder for the dead to fight?", next = "dead" },
      },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "Former comrades, some of them, and fanatics now. They'd kill me again without blinking, so I'll return the favour." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken fight with whatever their bodies will still do, and some days that isn't much. I teach them to make the most of it, and I expect them to listen." } },
    scourge = { { id = "tp_scourge", text = "The Scourge comes at you without fear, so a good soldier must meet it without fear too. Anything less and you'll be marching in its ranks before nightfall." } },
    lordaeron = { { id = "tp_lordaeron", text = "I was a weapons master for the king's guard, and I trained some of the soldiers who now serve the Crusade. They were good boys, and now they're my enemies." } },
    second_war = { { id = "tp_second_war", text = "I drilled the infantry that stood against the orcs at Lordaeron's walls. Now I share a war with them, and I've learned to keep my old opinions behind my teeth." } },
    _none = { { id = "tp_none", text = "Not my field, soldier. I teach steel, so ask a scholar for the rest." } },
  },
}

-- James Van Brunt: the War Quarter's blacksmithing trainer.
P:NPC {
  key = "vanbrunt", id = TODO_NPC("James Van Brunt"), name = "James Van Brunt", title = "Blacksmithing Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "gruff" }, values = { "diligent" },
  notices = { "profession", "wounds", "lock_taint" },
  impression = {
    first = "He has nothing left but the work, and he does it well.",
    third = "{name} met James Van Brunt, the blacksmithing trainer of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "Stand back from the forge. I can't feel the heat any more, but you can." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did the steel hold?" },
  },

  notice = {
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.3 } },
      text = "Your armour's falling off you in pieces. If you're not going to look after it, at least let someone who cares do it for you." },
    { id = "n_smith", cat = "profession", when = { profession = { name = "Blacksmithing", min = 150 } },
      text = "You've good callouses for a smith. Keep them; you'll need them for the heavier work." },
    { id = "n_lock_taint", cat = "lock_taint", when = { taint = { min = 30 } },
      text = "You smell like the fel-touched ore they keep asking me to work. I'll make you honest armour, but don't expect it to sit right on someone who smells like that." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd forge it for anyone who pays and wears it properly. But you'll want it heavy, I think, because I've heard the Light burns your kind from the inside, and good iron is the one thing that won't burn along with you." } },
      choices = {
        { text = "Make it heavy. I mean to stand in front of others.", next = "BACK", reply = "Heavy it is, and you'll stand in front of a great many things wearing it. Good iron for a good purpose.", fx = { align = { honor = 1 } } },
        { text = "Make it light. I'd rather be quick than noble.", next = "BACK", reply = "Light it is, then, though you'll feel every blow. Quick is a fine thing until it isn't.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "If someone asked me to, I suppose I would, though I don't know what I'd fill it with now. The work was the same as any other, and that's the part I miss, not the prayers, though I'll admit the smell of the incense still comes back to me at the forge some nights." } },
      choices = {
        { text = "Forge one, Van Brunt. Someone will be glad of it.", next = "BACK", reply = "I might, at that, and fill it with something useful. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Leave the Church's trinkets in the past.", next = "BACK", reply = "Fair enough, and I'll not miss the work much. Only the incense.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Mail now, and plate when you're strong enough to carry it, and always armour that's been fitted to you rather than pulled off a corpse. I've seen Deathguard clank about in dead men's breastplates, and a breastplate that doesn't fit is just a heavy way to die." } },
      choices = {
        { text = "Fitted armour, then. I'll take the time to do it right.", next = "BACK", reply = "Good. Come back in a week and I'll check the straps for you.", fx = { align = { order = 1 } } },
        { text = "Whatever's on the corpse will do for now.", next = "BACK", reply = "It'll do until it doesn't, and then you'll be back here asking me to fix it. Come sooner.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Lighter, not light, because iron's iron and it won't pretend otherwise. I fit the Deathguard scouts with short hauberks and leather beneath, and they tell me they can still hear the deer over the clinking, most days." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Lighter, not light, and your {pet} will hear the clinking long before the deer do. I fit the Deathguard scouts with short hauberks and leather beneath, and they say it serves." },
      },
      choices = {
        { text = "Iron, then. I'll trust the armour over the stalk.", next = "BACK", reply = "Good. A scout who comes home is worth more than one who didn't hear the arrow.", fx = { align = { order = 1 } } },
        { text = "Leather for me. I'd rather be quiet than safe.", next = "BACK", reply = "Leather it is, and you'll hear every deer for a mile. Mind the arrows, though.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Anyone can, if they learn that you can't hurry iron, and mages are the worst at hurrying everything. Fire from a spell is too hot and too quick, so use the coal like the rest of us and let the metal take its time." },
      },
      choices = {
        { text = "I'll do it your way, Van Brunt.", next = "BACK", reply = "Good. Coal first, then the bellows, and you can ask me why after you've burnt yourself once.", fx = { align = { order = 1 } } },
        { text = "My fire's hotter. I'll find a way.", next = "BACK", reply = "You might, and you might melt my anvil while you're about it. Coal, please.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "James Van Brunt. I teach smithing in the War Quarter, and I make armour for the Deathguard. The work is the same as it ever was; only the smith is different." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "A smith, are you? Then you know you can't hurry iron, and dead or alive, that's the only lesson that matters." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. If you've come to bless my forge, don't; it's been burning since before the Dark Lady took the city, and it doesn't need the help." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'll have no use for my plate, I expect, since it doesn't change shape when you do." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Your armour's taken a beating, {class}, and I can hear the rivets rattling from here." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll be wanting mail one day, {class}, and something quiet enough to stalk in, and I can't promise you both." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. I made censers for the Church once, before the plague, and I've not made one since. I'd half forgotten how they were shaped." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You'll want to heat the forge with a spell, I suppose, and you'll ruin the iron." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. I forged plate for knights of Lordaeron once, when there was a Lordaeron, and I never thought I'd see that kind of steel worn by one of the dead." },
      },
      again = { { id = "h_again", text = "What else? The iron's cooling." } },
      choices = {
        { text = "Would you forge a censer again, Van Brunt?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could the earth spirits help your smithing, Van Brunt?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A smith must tire of the same work, Van Brunt.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me blacksmithing.", next = "BUSINESS" },
        { text = "Is smithing different when you're dead?", next = "dead" },
        { text = "That ore must come from a long way off.", next = "ore" },
        { text = "The Deathguard must keep you busy.", next = "guard" },
        { text = "Can you forge a dagger that doesn't catch the light?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "You must be brought some strange metals, Van Brunt.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What armour should a warrior trust, Van Brunt?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Can you make mail light enough for a hunter, Van Brunt?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Can a mage learn smithing, Van Brunt?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would you forge plate for a Forsaken paladin, Van Brunt?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "I can hold hot iron in my bare hand, which saves time. But I can't feel when the metal's just right through the tongs any more, so I have to watch the colour instead, and I've ruined a few blades learning to." } },
      choices = {
        { text = "That's a hard thing to relearn.", next = "BACK", fx = { affinity = 1 } },
        { text = "Not feeling pain sounds useful.", next = "dead_pain" },
      },
    },
    dead_pain = {
      lines = { { id = "dp_default", text = "Useful, until you put your hand down on an anvil you forgot was hot and smell yourself cooking. I keep a bucket of water by the forge for exactly that reason." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ore = {
      lines = { { id = "o_default", text = "Copper and tin from the hills of Silverpine and Tirisfal, and iron from the Hillsbrad Foothills when the miners there aren't being shot at. Brom Killian teaches mining here, if you'd rather dig your own." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guard = {
      lines = { { id = "g_default", text = "Everything, and quickly. They lose more armour to the Scourge in the north and the Scarlets in the east than I can mend in a week. I've stopped sleeping, which helps, though I never needed to." } },
      choices = {
        { text = "The Deathguard deserves the best steel.", next = "BACK", reply = "They do, and they'll get it from my anvil if I've any say. Thank you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them scavenge armour from the Scarlets.", next = "BACK", reply = "They do, and I mend what they bring back. Scarlet steel's decent, I'll grant.", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The earth gives me ore and the fire gives me heat, and I've never yet had to thank either of them. The orcs say their smiths ask the stone before they cut it, and maybe that's why their axes hold, but the Deathguard need armour faster than I can ask anyone's permission." } },
      choices = {
        { text = "Thank the stone, smith. It costs you nothing.", next = "BACK", reply = "Perhaps I will, and see if the axes hold better. The orcs might be on to something.", fx = { align = { light = 1 } } },
        { text = "The work comes first. The spirits can wait.", next = "BACK", reply = "It does, and the spirits have never once complained to me. I'll keep working.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Tire? I'm dead, so no, and I can't say I'd want to. The work is the same as it ever was, and that's the only thing in this city that is, so I hold on to it with both hands, even the burnt one." } },
      choices = {
        { text = "Keep at it, then. Steady hands are a comfort.", next = "BACK", reply = "I will, both hands, even the burnt one. Thank you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Change would do you good, smith. Try something new.", next = "BACK", reply = "New? I've had enough new for one death. I'll keep my forge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I can blacken the blade, which is old soldiers' work and nothing clever, and the Rogues' Quarter keeps me busy with it. A dull blade in a dark canal is near invisible, though you'll still need the sense to keep it out of the torchlight." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I blackened blades for the king's scouts in life, and now I blacken them for the Dark Lady's deathstalkers, so the work hasn't changed much. You'll still need the sense to keep it out of the torchlight." },
      },
      choices = {
        { text = "A dark blade for dark work. Good.", next = "BACK", reply = "Good. Quiet steel for a quiet hand, and the Scarlets will never see it.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather my enemies see the blade coming.", next = "BACK", reply = "Then you'll want it bright, and I'll polish it for you. Honest steel for honest fighting.", fx = { align = { honor = 1 } } },
        { text = "The Deathguard must keep you busy.", next = "guard" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They ask me to work fel-touched ore now and then, and I tell them no, because metal that whispers isn't metal I'll put my name to. Bring me honest iron and I'll make you honest work." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "I knew a smith in the capital who went over to the Cult before the end and forged for them, and he never made anything clean again. Keep your demons away from my forge, and we'll get on fine." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "They ask me to work fel-touched ore, and I tell them no, and I'll tell your demon the same if it keeps nosing about my anvil. Metal that whispers isn't metal I'll put my name to, so bring me honest iron and I'll make you honest work." },
      },
      choices = {
        { text = "Honest iron, then. I'll keep the whispers from your forge.", next = "BACK", reply = "Thank you. Honest iron makes honest work, and that's my name on it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Whispering or not, metal holds an edge, Van Brunt.", next = "BACK", reply = "It isn't, and I'll not argue the point twice. Find another smith.", fx = { align = { order = -1 } } },
        { text = "Is smithing different when you're dead?", next = "dead" },
      },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They make decent plate, I'll give them that. It comes back here in pieces for melting down." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken need good steel more than anyone, since we can't feel when our armor has failed. I make it so it doesn't fail." } },
    lordaeron = { { id = "tp_lordaeron", text = "I forged blades for the king's army, and the last crate of them was sent to Stratholme with the prince. Not one of them came back, and neither did the men who carried them." } },
    scourge = { { id = "tp_scourge", text = "The Scourge doesn't care what your sword is made of, as long as it's in your hand. Keep it sharp and keep it close, and you'll outlast most." } },
    _none = { { id = "tp_none", text = "If it isn't metal, I don't care to know. Ask someone else." } },
  },
}

-- Brom Killian: the mining trainer, who sees the old city's foundations as one long seam.
P:NPC {
  key = "killian", id = TODO_NPC("Brom Killian"), name = "Brom Killian", title = "Mining Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "dry" }, values = { "practical" },
  notices = { "profession", "lock_shards" },
  impression = {
    first = "Every tunnel under the city strikes him as a missed opportunity.",
    third = "{name} met Brom Killian, the mining trainer of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "Come to learn to dig? We're all good at being underground in this city." },
    { id = "g_back", when = { metBefore = true }, text = "Back with dirt under your nails? Good, that means you're working." },
  },

  notice = {
    { id = "n_miner", cat = "profession", when = { profession = { name = "Mining", min = 125 } },
      text = "Iron dust on your sleeves. You've been working proper veins, then, not just the copper that any child can find." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "Crystals like those don't come out of any vein I've ever dug. Pretty, though, and they hum, which ore never does, so I'll take your word they're not worth mining for." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "None that I've found, but I'd not say no to you lighting the way. The deep tunnels under the old city haven't been walked since the plague came through, and I'd much rather a holy glow found whatever's down there than my lantern did." } },
      choices = {
        { text = "Whatever's down there, the Light should find it first.", next = "BACK", reply = "It should, and I'll follow right behind you. Bring your Light down any time.", fx = { align = { light = 1 } } },
        { text = "Let whatever's down there stay buried. Some things should.", next = "BACK", reply = "Some should, but I'm a miner, and burying is the opposite of my trade. I'll take my chances.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The old kings buried their dead under Lordaeron, and when we dig we find them, nicely laid out and not at all mindless, thank goodness. I put the stones back where I found them and say sorry, which is as near to a prayer as a miner gets." } },
      choices = {
        { text = "Saying sorry is a good prayer, Brom. Keep it up.", next = "BACK", reply = "I'll keep it up, then. It's the least I can do for the old kings.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're dead stones, Brom. Dig through them.", next = "BACK", reply = "They're somebody's dead stones, friend, and I'll not be rude to them. I'll say sorry and dig around.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Plenty, because the ore you dig is the armour you wear, and a warrior who mines never pays a smith for the iron. Besides, swinging a pick all day does wonders for the arm, dead or alive." } },
      choices = {
        { text = "I'll leave digging to miners and pay the smith fairly.", next = "BACK", reply = "Fair enough, and the smiths will thank you. I'll keep the ore coming.", fx = { align = { order = 1 } } },
        { text = "I'll dig my own iron. Nobody else to rely on.", next = "BACK", reply = "Good, then the pick's by the door, and there's copper in the hills north of Brill.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "In the places beasts like to den, oddly enough, the cracks and caves and overhangs where the rock's been split open. Follow the bears into the hills of Silverpine and you'll find copper and tin both, if the bears don't find you first." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "In the places beasts like to den, and {pet} will sniff those out quicker than any prospector. Follow it into the caves of Silverpine and you'll find copper and tin both, if the bears don't find you first." },
      },
      choices = {
        { text = "I'll mine it and leave the beasts in peace.", next = "BACK", reply = "Good. The bears won't mind if you're quick about it.", fx = { align = { honor = 1 } } },
        { text = "I'll clear the dens out and take the ore.", next = "BACK", reply = "You'll get the ore, and you'll earn it. Mind the big ones.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I asked a warlock that once, and he looked at me as if I'd buried him a second time. A pity, because there's a world of ore under the old city, and nobody's dug it since King Terenas was alive." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "I asked a warlock that once and he looked at me as if I'd buried him a second time, though yours is looking down the shaft as if it might actually consider it. A pity it's not the demon who decides, because there's a world of ore under the old city, and nobody's dug it since King Terenas was alive." },
      },
      choices = {
        { text = "I'll dig with my own hands, Killian.", next = "BACK", reply = "Good, and the ore will be all the better for it. Pick's by the door.", fx = { align = { order = 1 } } },
        { text = "If my demon digs, the ore is mine, Killian.", next = "BACK", reply = "Then I'd like to see it dig first. I'll believe it when I see it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brom Killian, and I teach mining. It's a fitting trade for the Forsaken, I always say, since we've already done the hard part of being put in the ground." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You talk to the earth, they say, so ask it where the good veins are and save us both a lot of digging." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Before you ask, no, I don't think the hills mind the mines, and I've been underground long enough to know their moods." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You've got the shoulders for a pick, {class}, and I've always said a good miner and a good soldier are the same animal underneath." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll be up in the hills more than anyone, so keep an eye out for copper in the rocks, because nobody else bothers to look." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! You'll want to say a word over the tunnels, I expect, since half of them were crypts before they were mines." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, in my mines! Your demon could dig, could it? No? Pity." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin down here in the dark! Bring a bit of that Light into the tunnels with you and you'll save me a fortune in candles, though I suppose it stings a little to do it." },
      },
      again = { { id = "h_again", text = "Something else? Ask it, then; the rocks will still be there when we're done." } },
      choices = {
        { text = "Were these tunnels really crypts, Brom?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do miners ever thank the earth, Killian?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What moods do the hills have, Killian?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "Where should I mine near here?", next = "where" },
        { text = "This city looks like miners' work.", next = "city" },
        { text = "Your tunnels must be handy for going unseen, Killian.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can magic find ore faster than a pick, Killian?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Mining can't be much use to a warrior, Killian.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Where do the hills hide their ore, Killian?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "A voidwalker never tires, Killian. It could dig your tunnels.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does a paladin's Light have any use in the mines, Brom?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "There's copper in the hills of Tirisfal, around the mines and the caves, though watch for the Scarlets near the monastery. For tin and silver, try Silverpine and then the Hillsbrad Foothills, where the Syndicate and the Alliance will both want a word with you." } },
      choices = {
        { text = "Do the Scarlets mine too?", next = "where_scarlet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_scarlet = {
      lines = { { id = "ws_default", text = "No, they only burn things. But they patrol the hills, and they'll put an arrow in any Forsaken who stops to dig, so work fast and keep looking over your shoulder." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    city = {
      lines = { { id = "c_default", text = "The catacombs were miners' work, dug long ago by the builders of old Lordaeron, and the Scourge started on the rest and we finished it. Every tunnel down here was dug by somebody's hands, and some of those hands are still working." } },
      choices = {
        { text = "The dead built their own city. I admire that.", next = "BACK", reply = "So do I, and I'm proud to have done my share. A city's a city, whoever digs it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Scourge dug it. That's not much to admire.", next = "BACK", reply = "Perhaps not, but we finished it, and that's something. The Scourge never put a roof on anything.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Thank it? I've been buried in it, friend, so I'd say the earth and I have already been as close as two parties can be. I take my copper and I fill in my holes when I remember, and that's all the thanks it's getting from me." } },
      choices = {
        { text = "Fill your holes, at least. The earth remembers.", next = "BACK", reply = "I'll try, friend, though I don't promise to remember. The earth knows where I live.", fx = { align = { honor = 1 } } },
        { text = "Take what you need. The earth won't miss it.", next = "BACK", reply = "It won't, and it's got plenty. I'll take my copper.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Sullen, mostly, and wet, and they grumble when you dig too near the Scarlet watchtowers. There's a cave north of Brill where the rock feels wrong, I admit, but I put that down to the Scourge, not to the hills having opinions." } },
      choices = {
        { text = "The hills do have opinions. Listen to them.", next = "BACK", reply = "I'll listen, then, though I'll not promise to understand. The hills are a grumbling sort.", fx = { align = { light = 1 } } },
        { text = "Rock is rock. Dig it and sell it.", next = "BACK", reply = "There's a miner after my own heart. Rock is rock, and coin is coin.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Handy enough, though most of them flood or collapse, and the ones that don't belong to the Rogues' Quarter already. I'd not go poking about the old sewers without asking Carolyn Ward first, unless you fancy a knife in a dark place." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "If you came up through the old sewers in life, dodging the city watch, you'll find they've changed a fair bit since the plague. Some go further down than I'd like, and I've a miner's nose for when a tunnel's wrong." },
      },
      choices = {
        { text = "I'll ask Ward first. Her quarter, her rules.", next = "BACK", reply = "Good. Carolyn's a good sort, but she doesn't like surprises.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go where I like below the city.", next = "BACK", reply = "Then mind the floods, friend, and the rogues. Both have very poor manners.", fx = { align = { order = -1 } } },
        { text = "This city looks like miners' work.", next = "city" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Magic can find ore, aye, and then it stands back while someone with a pick does the actual work, which is how it's always been. The Magic Quarter folk come to me for gems now and then, and not one of them has ever lifted a pick to help." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "I knew Dalaran men who came to the capital's mines looking for crystals with their little rods, and they never once dirtied their robes. Take a pick, and let the magic rest." },
      },
      choices = {
        { text = "Then I'll learn the pick properly.", next = "BACK", reply = "Good. A mage with a pick is a rare and useful thing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic's quicker, Killian, and I prefer quick.", next = "BACK", reply = "Quicker at finding, maybe, but slower at digging. You'll be back for a pick.", fx = { align = { order = -1 } } },
        { text = "Where should I mine near here?", next = "where" },
      },
    },
  },

  topics = {
    syndicate = { { id = "tp_syndicate", text = "Thieves in the Alterac foothills. They take the ore you've just dug, so dig quickly." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken dig better than the living, because we don't need air and we never tire. There are tunnels under this city that go deeper than anyone alive has ever been." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron's capital was built over old mines and crypts, and most people never knew it. I knew it, and I'm the happiest dead man in the Undercity for knowing it." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Iron dwarves dig deep, I'll give them that, deeper than anyone. I'd love to see their tunnels, though I'd want to be dead first, and I already am." } },
    _none = { { id = "tp_none", text = "I don't know. I'm only good with rocks; ask someone who still has the eyes for books." } },
  },
}

---------------------------------------------------------------------------
-- Magic Quarter
---------------------------------------------------------------------------

-- Lavinia Crowe: the enchanting trainer, who still thinks of magic as a delicacy.
P:NPC {
  key = "lavinia_crowe", id = TODO_NPC("Lavinia Crowe"), name = "Lavinia Crowe", title = "Enchanting Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "proud" }, values = { "curious", "precise" },
  notices = { "profession", "class", "lock_soulstone" },
  impression = {
    first = "She is particular and proud, and her lessons are better for it.",
    third = "{name} met Lavinia Crowe, the enchanting trainer of the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_hi", text = "Don't touch the rods; they're charged, and I've no wish to explain your death to anyone." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Show me what you've been enchanting, and don't be shy." },
  },

  notice = {
    { id = "n_ench", cat = "profession", when = { profession = { name = "Enchanting", min = 100 } },
      text = "You've a little dust on your fingertips, and it glitters. You've been breaking things down, then, and I approve." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You throw your magic out into the world and let it go, whereas we enchanters keep ours and put it somewhere useful. Both have their place, but mine is tidier." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { carrying = { 5232, 16892, 16893, 16895, 16896 } },
      text = "There's a soul bound in that stone you're carrying, held in an object the way I bind power into a ring. It's a cruder craft than mine, but I'll admit it works." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Contradictory, which is my favourite kind of thing. Holy power and grave dust bound in the same vessel ought to cancel each other out, and if they don't in you, then I'd love to know why, purely for the sake of the craft." } },
      choices = {
        { text = "Faith binds what shouldn't bind. That's the Light's work.", next = "BACK", reply = "Perhaps it is, and if so, the Light is a better enchanter than I am. I'm almost jealous.", fx = { align = { light = 1 } } },
        { text = "My will binds it, not the Light. Credit where it's due.", next = "BACK", reply = "Your will, then, and I'll write it down as such. Contradictory and stubborn, my two favourite properties.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not that I can measure, and I have measured, with every rod I own. The soldiers swear by it all the same, and I've learned that a soldier who believes his sword is blessed fights as though it were, which is an enchantment of a sort." } },
      choices = {
        { text = "Belief is a real power, Lavinia. Don't dismiss it.", next = "BACK", reply = "I don't dismiss it, I simply can't bottle it, which annoys me terribly. I'll keep measuring.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If you can't measure it, it isn't there.", next = "BACK", reply = "A good scientist's answer, and a rather bleak one. I'd like to measure that too, someday.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It could, if you bring me the dust and the essences and have the patience to let it be done properly. A good enchantment on a blade is worth three on a robe, though you'd never hear my mages admit it." } },
      choices = {
        { text = "Then I'll gather the dust and wait for proper work.", next = "BACK", reply = "Good, and I'll make yours sing when the time comes. Rushed enchantments fizzle, and I don't sell fizzles.", fx = { align = { order = 1 } } },
        { text = "I'd rather a sharper edge than a glowing one.", next = "BACK", reply = "Then go to Van Brunt and his whetstone, and leave the glowing to those of us who appreciate it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Agility on your gloves and your boots, and stamina too, which counts for a lot when you're tracking for days. Leave the bow to the engineers and their scopes, because I don't work on anything that smells of gunpowder." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Agility on your gloves and boots, mostly, so you can keep up with {pet} when it bolts. Leave your bow to the engineers and their scopes, because I don't work on anything that smells of gunpowder." },
      },
      choices = {
        { text = "Proper work takes time. I'll leave it to you.", next = "BACK", reply = "Thank you. Proper work deserves proper patience, and I'll make your gloves worth the wait.", fx = { align = { order = 1 } } },
        { text = "I'd rather a sharp eye than a glowing glove.", next = "BACK", reply = "Then keep your sharp eye, hunter, and I'll keep my enchantments for someone who appreciates them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lavinia Crowe. I teach enchanting, the art of breaking magic out of one thing and putting it into another. It's delicate work, so I hope your hands are steadier than most. My last apprentice's fingers kept coming loose, and we lost two of them in the shards." },
        { id = "h_ench", when = { profession = "Enchanting" }, text = "One of mine! Have you been saving your essences, or selling them to the first merchant who asks? I'll know if you've been selling them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You put spirits into your totems, I gather, and I put magic into swords, so we're nearly colleagues, though I do it more tidily." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You change your shape the way I change an item's nature, though you, at least, can change back." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, in the Magic Quarter? Mind your elbows, {class}, because a dropped essence is a week of work gone." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll come across plenty of things worth disenchanting on your travels, so do bring them to someone who knows what to do with them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, in the Magic Quarter. I enchant things, and you bless them, and I've always wondered which of us does more good to a sword." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, in the Magic Quarter. I've never once disenchanted anything the Light had touched and the dead had carried, and I suspect the essence would smell like a burnt hymnbook." },
      },
      again = { { id = "h_again", text = "Something else? Ask, but quietly; the rods hum when people shout." } },
      choices = {
        { text = "Does a blessing do anything to a blade, Lavinia?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is my totem craft so different from your enchanting, Lavinia?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could you enchant something to change as I do, Lavinia?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "How does enchanting work?", next = "how" },
        { text = "You must have learned this in Dalaran.", next = "dalaran" },
        { text = "I'd have thought it hard for the dead to work magic.", next = "dead" },
        { text = "Could your enchantments chain a demon, Lavinia?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Could enchanting make my blades quieter, Lavinia?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Enchanting could make my weapon strike harder, Lavinia.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Can enchanting do anything for a hunter, Lavinia?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What would a paladin's essence look like to an enchanter?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    how = {
      lines = { { id = "hw_default", text = "You take an item that has some magic in it, and you break it down into dust and essences. Then you take that dust and put it into something else, a sword or a cloak, and it holds the magic for you." } },
      choices = {
        { text = "That must destroy the first item.", next = "how_destroy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_destroy = {
      lines = { { id = "hd_default", text = "Utterly, and that's the part people hate. A sword you loved becomes a pinch of dust. But it's the only way the magic moves, so you learn to love the dust instead." } },
      choices = {
        { text = "Nothing is wasted that way.", next = "BACK", reply = "Exactly so, and you've seen it in a sentence where my apprentices take a year. Dust is never wasted.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things shouldn't be broken down.", next = "BACK", reply = "Some things, perhaps, but not many, and I've learned to stop mourning the swords. Bring me one anyway.", fx = { align = { order = -1 } } },
      },
    },
    dalaran = {
      lines = { { id = "d_default", text = "I studied there for two summers, when I was alive and the Kirin Tor still took students from Lordaeron's merchant families. They wouldn't take me now, of course, and I'm not certain I'd go." } },
      choices = {
        { text = "Why wouldn't you go?", next = "dalaran_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_why = {
      lines = { { id = "dw_default", text = "Because their wizards watched the plague spread through Lordaeron and argued about it until it reached their own gates. Bethor Iceshard has more to say about Dalaran than I do, and he says it at length." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dead = {
      lines = { { id = "de_default", text = "The magic doesn't care whether you're breathing, which surprised everyone. What it wants is patience, because the dead have time but not always the steadiness, and enchanting forgives nothing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Very, because I break things down to get my magic, and you ask the spirits to lend theirs. I'd say yours is the more polite art and mine the more reliable, and you may decide which you'd rather have in a fight." } },
      choices = {
        { text = "Polite, I'll take. Borrowed power must be respected.", next = "BACK", reply = "Polite and respected, and terribly slow. I'll keep my dust, but I'll not mock your spirits.", fx = { align = { honor = 1 } } },
        { text = "Reliable is better. I'd rather own my power.", next = "BACK", reply = "There's a sensible shaman. Come and break something with me sometime.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Not without destroying it first, and then it's a pinch of dust and no use to anyone. The only thing I ever enchanted that changed back was a cloak, and it changed back into curtains, which was not the effect I was after." } },
      choices = {
        { text = "Some things should keep their own nature. Leave them be.", next = "BACK", reply = "Wise, and I'll admit I wish I'd listened to that advice before the curtains. They're still curtains.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Break the rules, Lavinia. That's how new arts are made.", next = "BACK", reply = "That's what I said before the curtains incident. Still, you're right, and I'll keep breaking them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "It binds power into objects, and a demon is not an object, however much your trainers would like you to think so. Keep the two crafts apart, because I've seen a warlock's enchanted ring go very wrong, and once was enough." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "We dead mages kept to the arcane and you dead warlocks went down another road entirely, and the Magic Quarter is big enough for us both, mostly. Do keep your imp out of my dust; it eats it." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "It binds power into objects, and a demon is not an object, though yours is standing so still I could almost be fooled. Keep the two crafts apart, because I've seen a warlock's enchanted ring go very wrong, and I'd rather {pet} didn't take an interest in my rods." },
      },
      choices = {
        { text = "I'll keep the crafts apart, as you say.", next = "BACK", reply = "Good, and you'll keep your fingers too. That ring took three of its owner's.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every craft bends if you're willing to break it.", next = "BACK", reply = "Every craft bends, and some of them snap. I've seen the snapping, and I'd not recommend it.", fx = { align = { order = -1 } } },
        { text = "How does enchanting work?", next = "how" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Quieter, no, though I've been asked, and I tell every rogue the same thing: enchantment makes a blade sharper or crueller, never shyer. Keep your own steps quiet and let me look after the edge." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I had a cutpurse ask me that in Lordaeron once, before either of us died, and I gave him the same answer I'll give you. Enchantment makes a blade sharper or crueller, but never shyer." },
      },
      choices = {
        { text = "A sharper edge suits a fair fight too.", next = "BACK", reply = "It does, and I'll make yours as sharp as I can. Fair or not is your affair.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A crueller edge suits me better.", next = "BACK", reply = "Crueller it is, and I'll not ask what you mean to do with it.", fx = { align = { honor = -1 } } },
        { text = "I'd have thought it hard for the dead to work magic.", next = "dead" },
      },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "Dalaran's enchanters were the finest in the world, and they knew it, and they made sure everyone else knew it too. They're rebuilding behind closed gates now, and I don't miss their lectures." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor taught me my trade, and I'll grant them that much. They also taught me that a mage who won't share his secrets is a very lonely mage." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken make fine enchanters, because the arcane doesn't care whether your hands are warm. Precision is what matters, and death has made me very precise." } },
    _none = { { id = "tp_none", text = "I don't know, and I won't guess. Ask in the Magic Quarter; someone there will pretend to." } },
  },
}

---------------------------------------------------------------------------
-- Rogues' Quarter
---------------------------------------------------------------------------

-- Carolyn Ward: a rogue trainer who teaches the Dark Lady's agents to go unseen.
P:NPC {
  key = "cward", id = TODO_NPC("Carolyn Ward"), name = "Carolyn Ward", title = "Rogue Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "sharp" }, values = { "cunning", "loyal" },
  notices = { "class", "stealth", "lock_eyes" },
  impression = {
    first = "Her loyalty to the Dark Lady is plain, and nothing else is.",
    third = "{name} met Carolyn Ward, a rogue trainer of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "You walk loudly. Most people do, but you don't have to." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Back for more lessons? Good, because the Dark Lady has more work than she has rogues." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I can see you, you know. Your shadow is wrong on the left, so drop your shoulder, and you might fool someone who isn't me." },
    { id = "n_lock_eyes", cat = "lock_eyes", when = { aura = { 132, 2970, 11743 } },
      text = "Your eyes see through shadow, which is a rude thing to bring into my quarter. My students are trying to learn how to hide, and you're spoiling the lesson." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I think the Light is a habit, and habits come with old friends attached. If a knight of the Crusade called you by your old name at the Scarlet Monastery, I'd want to know what you'd do, and so would the Dark Lady." } },
      choices = {
        { text = "I'd answer to the Dark Lady first, whatever name they called.", next = "BACK", reply = "A good answer, and the right one to give me. The Dark Lady will hear of it.", fx = { align = { order = 1 } } },
        { text = "I'd answer to my own conscience. Nobody else holds it now.", next = "BACK", reply = "Your conscience is your own, and I respect that. Just make sure it never answers louder than she does.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I trust anyone who serves the Dark Lady and keeps their mouth shut, and a priest hears more secrets than any rogue. If you ever hear something in confession that she ought to know, you'll find me here, and I won't ask how you came by it." } },
      choices = {
        { text = "Confessions stay with me, Carolyn. That's not for sale.", next = "BACK", reply = "Then you're a better priest than most, and a worse informant. I'll respect it, and I'll not ask again.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the Dark Lady needs to know, she'll know.", next = "BACK", reply = "Good. The Dark Lady appreciates priests who understand that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Now and then, when the work calls for a distraction that can survive being noticed. You walk in the front and make all the noise you like, and my people walk out the back with whatever the Dark Lady wanted." } },
      choices = {
        { text = "I'd rather face my enemy than be bait for thieves.", next = "BACK", reply = "Fair enough, warrior. Some people are built for the front door, and I'll not argue with them.", fx = { align = { honor = 1 } } },
        { text = "I'll make the noise, Carolyn. Whatever works.", next = "BACK", reply = "Good. Make it loud enough, and my people will be in and out before you've finished shouting.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "How to be patient in a city instead of a forest, which is harder than it sounds. A crowd hides its tracks as well as any wood, {class}, and I've never yet met a hunter who could follow a mark through the Trade Quarter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "How to be patient in a city, which is harder than it sounds, and you'd have to leave {pet} at the stables. A crowd hides its tracks as well as any wood, and no hunter I've met could follow a mark through the Trade Quarter." },
      },
      choices = {
        { text = "I'd rather track in the open, Carolyn, where it's honest.", next = "BACK", reply = "Honest, perhaps, but the city's where the work is. Come back when the forest gets boring.", fx = { align = { honor = 1 } } },
        { text = "Teach me, then. A mark is a mark.", next = "BACK", reply = "Good. A mark is a mark, and you'll find the city's tracks are subtler than any deer's.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Carolyn Ward. I teach rogues their trade, and in this city a rogue's trade is the Dark Lady's business. If you're not a rogue, I'm not sure why you're in this quarter at all." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "One of mine. Have you learned to move through a crowd without anyone remembering your face? Then you can learn something harder." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Rogues' Quarter. Your totems make more noise than a drunk in a tavern, so don't plant them anywhere I'm working." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in my quarter. You've a cat's step, I'll give you that, and I'd like to know how quietly you move when it's properly dark." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You're loud, {class}, and you'll never be anything else, but loud has its uses when someone needs the guards looking the wrong way." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know how to wait and how to watch, which is more than half my students can manage." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. I've known priests who made fine liars, because people tell them everything, and I wonder which kind you are." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. The last of your order I saw in Lordaeron were burning our dead in the streets, so I'll be watching your hands rather than your face." },
      },
      again = { { id = "h_again", text = "Something else? Make it brief; I'm expected elsewhere, and the people expecting me are not the forgiving sort." } },
      choices = {
        { text = "Do you trust priests, Carolyn?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your rogues ever work with the Horde's shamans, Carolyn?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you take a druid into your trade, Carolyn?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "What does a rogue do for the Dark Lady?", next = "lady" },
        { text = "What's the most important thing a rogue can learn?", next = "lesson" },
        { text = "Not every rogue can be loyal.", next = "disloyal" },
        { text = "Do rogues and mages ever work together, Ward?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Could your rogues use someone who curses from the dark?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do your rogues ever need a warrior, Carolyn?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Could a hunter learn anything from your rogues, Carolyn?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "You seem to think I'm still loyal to the Silver Hand, Carolyn.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    lady = {
      lines = { { id = "l_default", text = "Whatever she needs and can't ask her soldiers to do. We carry messages that can't be read, and we listen at doors in Hillsbrad and Southshore. Sometimes we make sure a Scarlet captain doesn't wake up." } },
      choices = {
        { text = "That's honest work, in its way.", next = "BACK", reply = "It is, and the Dark Lady's grateful for it, even if nobody else is. Welcome to the quarter.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I prefer to fight my enemies face to face.", next = "BACK", reply = "Then you'll find yourself fighting a great many people who never see you coming. Suit yourself.", fx = { align = { honor = 1 } } },
      },
    },
    lesson = {
      lines = { { id = "le_default", text = "Patience. Everyone thinks it's the knife or the poison, but the best rogue I ever knew waited three days in a ditch outside Southshore for the one hour her target walked alone." } },
      choices = {
        { text = "What happened after three days?", next = "lesson_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson_after = {
      lines = { { id = "la_default", text = "She came home, and he didn't, and nobody in Southshore ever knew who'd been in the ditch. That's the whole of the trade in one story." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    disloyal = {
      lines = { { id = "d_default", text = "No, and the worst are the Syndicate in Alterac, who were nobles once and sell their knives to anyone now. A few of ours forgot whose city this is, too, and we don't speak of them, and neither should you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "syndicate" } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Now and then, in Hillsbrad, when a fight we started gets bigger than we meant it to. A shaman who can drop lightning on the Southshore militia while my people slip away is worth having, so long as you understand that the slipping away is the point." } },
      choices = {
        { text = "I'll cover your retreat and ask no questions.", next = "BACK", reply = "Good. A shaman who doesn't ask questions is a rare and useful thing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I fight my own battles, not your rogues' retreats.", next = "BACK", reply = "Fair enough, but the battles will come to you either way. I'll find another storm.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I'd take anyone who can move unseen and keep their mouth shut afterwards, and you've the first part already. The Dark Lady has more work than she has rogues, and a cat in the Southshore stables wouldn't raise anyone's suspicion." } },
      choices = {
        { text = "I'll serve the Dark Lady where no one sees me.", next = "BACK", reply = "Good. She'll be glad of a cat in the right stable.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I prowl for the Horde, not for your quarter.", next = "BACK", reply = "For the Horde, then, so long as it ends with Southshore quieter. The quarter's not proud.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "When the Dark Lady needs it, and only then, because mages are loud and rogues are not. I've used a mage to draw the guards' eyes while my people did the real work, and it served well enough." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran's mages hired cutpurses more often than they'd admit, to fetch what their wards were too proud to reach. Some of your old textbooks probably passed through hands like mine." },
      },
      choices = {
        { text = "I'll draw their eyes if the Dark Lady needs it.", next = "BACK", reply = "Good. She'll find a use for your fire, and so will my people.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll work alone, Ward, not as bait.", next = "BACK", reply = "Alone, then, and I'll respect it. Just don't get in my people's way.", fx = { align = { order = -1 } } },
        { text = "What does a rogue do for the Dark Lady?", next = "lady" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Rarely, because a demon is the least subtle thing in the Undercity, and that includes the abominations. Still, a warlock who can curse a man from across a room has a certain charm, if he learns to stand somewhere dark and keep his imp quiet." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc warlock, in my quarter, and you've the sense to ask instead of barging in. A curse from across a room has a certain quiet charm, if you learn to keep that demon of yours out of the light." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Rarely, because a demon is the least subtle thing in the Undercity, and yours has just made three of my students forget their lessons. Still, a warlock who can curse a man from across a room has a certain charm, if he learns to stand somewhere dark and leave that thing at home." },
      },
      choices = {
        { text = "Then I'll learn to curse quietly, from the shadows.", next = "BACK", reply = "Good. A quiet warlock is a dangerous warlock, and I'd like more of those.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll kill in the open, demon and all.", next = "BACK", reply = "Then you'll never work for me, warlock. Go and make your noise elsewhere.", fx = { align = { honor = 1 } } },
        { text = "Not every rogue can be loyal.", next = "disloyal" },
      },
    },
  },

  topics = {
    syndicate = { { id = "tp_syndicate", text = "Alterac's nobility turned to cutthroats. They're good, I'll grant them, but they'd sell their mothers." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken have enemies on every border, and some of them are already inside our walls. I teach my students to notice which is which before it's too late." } },
    sylvanas = { { id = "tp_sylvanas", text = "I serve the Dark Lady, and that's all you need to know about my loyalties. The rest of my business is my own." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "You've heard that name somewhere, haven't you? Some doors open only for those who already know where they are, and I'm not going to point you to this one." } },
    alterac = { { id = "tp_alterac", text = "Alterac's nobles sold out their own kingdom, and their children run the Syndicate now. A family that's done it once will do it again." } },
    _none = { { id = "tp_none", text = "That's not something the Rogues' Quarter has told me about, and if it had, I'd want to know why you were asking." } },
  },
}

-- Ezekiel Graves: sells poisons in the Rogues' Quarter and likes to talk about their ingredients.
P:NPC {
  key = "graves", id = TODO_NPC("Ezekiel Graves"), name = "Ezekiel Graves", title = "Poison Supplies",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "cheerful" }, values = { "curious" },
  impression = {
    first = "He enjoys his poisons far more than anyone should.",
    third = "{name} met Ezekiel Graves, who sells poisons and their ingredients in the Undercity's Rogues' Quarter.",
  },

  greetings = {
    { id = "g_hi", text = "Welcome, welcome! Everything here is deadly, so please do look but don't lick." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did the last batch do its job? It always does, but I like to hear about it." },
  },

  notice = {
    { id = "n_lock_healthstone", cat = "lock_stones", when = { carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "A healthstone, is it? Pity. Everything I sell is meant to stop a heart, and that stone undoes half my work, so keep it in your pocket while you're browsing." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd say yes and take your coin, but I suspect the Light would sulk. Still, the Scourge doesn't fight fair, and a holy hammer that leaves a little something behind in the wound would be a lovely thing to see." } },
      choices = {
        { text = "The Light needs no poison. I fight cleanly.", next = "BACK", reply = "Cleanly, and so the Scourge goes on standing a little longer. I'll respect it, and keep my vials.", fx = { align = { honor = 1 } } },
        { text = "Against the Scourge, any edge is a fair one.", next = "BACK", reply = "Exactly! I'll show you my stock, and we'll make your hammer sing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Often enough, because a shadow priest's spells and a good poison share a certain philosophy about the body. I'd never sell to one who meant to use it on the Dark Lady's people, of course, and I've a very good memory for faces." } },
      choices = {
        { text = "Poison has no place in a priest's hands.", next = "BACK", reply = "Then I'll sell to the ones who think otherwise. There are more than you'd guess.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Every tool has its use. Show me your stock.", next = "BACK", reply = "Splendid. Mind the green ones; they bite.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Anything green on a Crusader's knife and anything sticky on a spider's fang, and the plague, of course, which is the oldest poison in Lordaeron and still my favourite to study. Keep an antivenom in your pack and you'll outlive most of my customers' targets." } },
      choices = {
        { text = "I'll fight clean. Poison's no weapon for a warrior.", next = "BACK", reply = "Clean it is, and I'll keep an antivenom ready for when the Crusade doesn't return the courtesy.", fx = { align = { honor = 1 } } },
        { text = "If it wins the fight, poison's as good as steel.", next = "BACK", reply = "There's a warrior with sense. Pick a colour, any colour.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I admire it, and I'd tell you exactly what it does, at length, if you'll let me. Spider venom from Silverpine is my particular joy, because it's slow and it's patient, and those are virtues I admire." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I admire it, and I'd keep {pet} well away from any spider that carries some. Spider venom from Silverpine is my particular joy, because it's slow and patient, and those are virtues I admire." },
      },
      choices = {
        { text = "I hunt for meat and hide, Graves, not venom.", next = "BACK", reply = "A pity, but I'll keep a jar ready in case you change your mind. Spiders are very generous.", fx = { align = { honor = 1 } } },
        { text = "A clever hunter uses every part, venom included.", next = "BACK", reply = "Exactly! Bring me what's in the fangs, and we'll do lovely things with it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ezekiel Graves, purveyor of poisons and the things you need to make them. Rogues come to me for powders and vials, and I'm always happy to talk about what goes into them, which is mostly things that crawled up out of the sewers." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "A rogue! You'll want the good things, then: dust of decay, essence of pain, and plenty of empty vials. I keep them all, and in quantity." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! I'm told your totems can wash a poison clean out of the blood, which is very bad for business, so please don't do it in front of my customers." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Your lot can cure a poison with a touch, I'm told, and I've never been so offended by a profession in my life." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You'll not want poisons yourself, I expect, but you'll want to know what's on the blades pointed at you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Now there's a customer who understands venom, since so many of the beasts you hunt carry something interesting in their glands." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! How lovely. You heal, and I sell things that make healing necessary, so I'd say we're natural friends." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin! Oh, you'll not want my stock, I expect, since poison on a holy hammer would be terribly bad manners, but do look around, because I've never had a customer quite like you." },
      },
      again = { { id = "h_again", text = "Something else? Take your time; poisons are patient things." } },
      choices = {
        { text = "Do you ever sell to priests, Ezekiel?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your poisons trouble a shaman's work, Graves?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You should be glad someone can cure them, Graves.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Who buys poison in this city?", next = "who" },
        { text = "Selling poison seems a wicked trade.", next = "wicked" },
        { text = "Some of your wares look very strange indeed.", next = "strange" },
        { text = "What would a mage want from your shelves, Graves?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would your poisons kill a demon, Graves?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What poisons should a warrior watch for, Graves?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do you make of the venom my quarry carries, Graves?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Would a paladin have any use for your poisons, Ezekiel?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Rogues, mostly, and the occasional apothecary who's run short. Hunters buy a little for their traps, and I don't ask questions of anyone, so the whole quarter shops with me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wicked = {
      lines = { { id = "wi_default", text = "Wicked? It's only a sharper edge on a blade, friend, and nobody calls a blacksmith wicked. The Scourge didn't play fair with us, and I see no reason we should play fair with them." } },
      choices = {
        { text = "Fair point, Graves. Survival comes first.", next = "BACK", reply = "It does, and it's lovely to meet someone who sees it. Every vial is a little survival.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Poison is a coward's weapon.", next = "BACK", reply = "A coward's weapon in a coward's war, and the Scourge started it. I'll sleep soundly.", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "There's a powder from the Apothecarium that makes a man forget his own name for an hour. I don't sell it often, and never to anyone who asks about it as eagerly as you just did." } },
      choices = {
        { text = "I can't think who would want that.", next = "strange_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange_who = {
      lines = { { id = "sw_default", text = "People who need a guard to forget who walked past him, I imagine. I sell the powder, and the rest is between them and the Dark Lady." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Oh, I should hope so, because a poison a totem can wash away isn't much of a poison. I've been working on a blend the totems can't seem to touch, and I'd be delighted if you'd stand near it while I test the theory." } },
      choices = {
        { text = "Poison is a coward's tool. I'll cleanse it wherever I find it.", next = "BACK", reply = "Then I'll keep working on one you can't find, shaman. I do love a challenge.", fx = { align = { honor = 1 } } },
        { text = "Show me your blend. A weapon is a weapon.", next = "BACK", reply = "Splendid! Stand there, and don't breathe, and tell me if your totem flickers.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Glad? I suppose I'm glad in the way a smith is glad someone invented shields, which is to say I'm already working on the next thing. Every cure is only a recipe for a better poison, friend, and I do so love a challenge." } },
      choices = {
        { text = "Then I'll keep curing, and you'll keep losing.", next = "BACK", reply = "Then we'll dance forever, you and I, and I'll enjoy every step. Cure away.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Clever. I'd rather have your poisons on my side.", next = "BACK", reply = "A sensible druid at last. I'll put you on my list of preferred customers.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Oh, very little, though a few of your kind come by to admire the colours, which I always appreciate. The Magic Quarter folk prefer to do their killing at a distance, and I think they miss out on the finer details." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "The Kirin Tor never cared for my trade, which I always thought a shame, since half of what they called alchemy was poison with better manners. Do have a look at the colours, at least." },
      },
      choices = {
        { text = "Poison has no place in a fair fight, Graves.", next = "BACK", reply = "Fair? There's no such thing in a war with the Scourge. Buy some anyway.", fx = { align = { honor = 1 } } },
        { text = "Poison's just another tool. I may buy some.", next = "BACK", reply = "Splendid! I'll show you the purple ones; they suit a mage.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Who buys poison in this city?", next = "who" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Some of them do, and the ones that don't are very interesting to watch fail. The Magic Quarter's warlocks buy from me now and then, for when a pet turns on its master, and they never tell me whether it worked." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc asking after poisons for demons, now that's a customer with history. Some of my stock works on them and some only annoys them, and I'm afraid you'll have to find out which by experiment, preferably nowhere near my shelves." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Some of them do, and the ones that don't are very interesting to watch fail, so forgive me for looking at your {pet} with professional curiosity. The Magic Quarter's warlocks buy from me for when a pet turns on its master, and you might keep that in mind the next time it looks at you like that." },
      },
      choices = {
        { text = "Anyone wise keeps a vial ready for their own demon.", next = "BACK", reply = "A wise warlock indeed. I'll sell you the strongest I've got.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon knows better than to turn. Keep your vials.", next = "BACK", reply = "They all say that, and then they come back in a hurry. I'll keep one on the shelf for you.", fx = { align = { order = -1 } } },
        { text = "Some of your wares look very strange indeed.", next = "strange" },
      },
    },
  },

  topics = {
    new_plague = { { id = "tp_plague", text = "Oh, that's the apothecaries' business, and far above my little shop. I hear things, but I don't repeat them." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken appreciate a fine poison more than any other people, because we're the only ones who can taste it without worrying. Try this one, it's divine." } },
    scourge = { { id = "tp_scourge", text = "The Scourge spread its plague without any craft at all, just grain and rot and numbers. A poison should be an art, and theirs was an insult to the trade." } },
    booty_bay = { { id = "tp_booty_bay", text = "I hear Booty Bay has some very interesting customers in my line of work. The pirates there pay well and ask no questions, which is my favorite kind of customer." } },
    _none = { { id = "tp_none", text = "Can't say I know that one! Ask me about anything that kills, and I'll talk all day." } },
  },
}

---------------------------------------------------------------------------
-- The city's other teachers
---------------------------------------------------------------------------

-- Mary Edras: the first aid trainer, who teaches bandages to people who can't feel their wounds.
P:NPC {
  key = "edras", id = TODO_NPC("Mary Edras"), name = "Mary Edras", title = "First Aid Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "brisk" }, values = { "kind", "practical" },
  notices = { "wounds", "lock_pact" },
  impression = {
    first = "Her briskness is plainly how she cares.",
    third = "{name} met Mary Edras, the first aid trainer of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "Let me look at you. No, don't argue; let me look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece, or near enough. Let me see that arm before something falls off it." },
  },

  notice = {
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.3 } },
      text = "You're in a state, and I'm sure you can't feel half of it. Sit down and let me check you before you walk off with a blade still in your back." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "There's heat in your blood, a fever that isn't a fever, and I see it on warlocks and the people who fight beside them. It won't kill you, but it won't stop an arrow either, so buy a bandage." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Foolish, no, but careless, perhaps, if you spend yourself on everyone else and forget you can't feel how badly you're hurt. The dead are terrible patients, {class}, and paladins, living or dead, are worse." } },
      choices = {
        { text = "Others come first. I'll bear the burn for them.", next = "BACK", reply = "Bless you, {class}, but come and see me after. I'll stitch whatever the burn leaves behind.", fx = { align = { honor = 1 } } },
        { text = "I'll mend myself first. A fallen healer helps nobody.", next = "BACK", reply = "Good, and it's the first sensible thing a paladin's said in my presence. Sit down.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Hardly ever, because they think dying once makes them clever about it. A priest's word carries further than a bandage, so if you tell them to come see me, I'd be grateful, and I'll do the stitching." } },
      choices = {
        { text = "I'll send them to you, Mary. We'll mend them together.", next = "BACK", reply = "Thank you, love. Between your word and my needle, we'll keep them walking.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they won't heed a wound, let them bleed until they do.", next = "BACK", reply = "Then they'll bleed, and I'll be stitching them later. I'd rather they came early.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They do, mostly by ignoring the small ones until the small ones fester. A Forsaken warrior can walk around for a week with a crossbow bolt in his back, so check yourself after every fight, and if you can't reach, ask someone." } },
      choices = {
        { text = "I'll check, Mary, and ask when I can't reach.", next = "BACK", reply = "Good. Ask me any time, and I'll check the bits you can't see.", fx = { align = { order = 1 } } },
        { text = "A wound is just a wound. I'll keep fighting.", next = "BACK", reply = "It is, until it festers, and then it's a great deal more. Come back when it does.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Tend whichever bleeds faster, and then the other one, and don't argue with me about it. A beast hides its hurts the way the dead do, so you'll have to learn to look closely at both of you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Tend whichever bleeds faster, and that goes for {pet} as much as for you. A beast hides its hurts the way the dead do, so learn to look closely at both of you." },
      },
      choices = {
        { text = "My beast comes first, Mary. Always.", next = "BACK", reply = "Then you'll have a happy beast and a bleeding hunter, and I'll have more work. Fair enough.", fx = { align = { honor = 1 } } },
        { text = "I come first. A dead hunter can't feed a beast.", next = "BACK", reply = "Good, because I can't stitch a dead hunter back together. Well, not well.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because you're the first one the enemy goes for, since you're soft and you're throwing fire at them, and you'll run out of mana long before they run out of arrows. Learn linen bandages first, then wool, and do it properly, because sloppy work kills." },
      },
      choices = {
        { text = "I'll learn it properly, Mary.", next = "BACK", reply = "Good. Linen first, then wool, and you'll keep your skin on.", fx = { align = { order = 1 } } },
        { text = "I'll learn just enough to get by.", next = "BACK", reply = "Then you'll just about get by, and I'll see you when you don't. Come back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mary Edras. I teach first aid, which most of the dead think they don't need, until they find an arrow in their shoulder that's been there since last week. Cloth, clean hands and patience will save your life, or what passes for it." },
        { id = "h_living", when = { ["not"] = { race = "Scourge" } }, text = "One of the living! You'll feel your wounds, at least, which makes you easier to teach. Let's start with linen, shall we?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? Then you'll heal with spirits, and you'll still need bandages when the spirits are busy, so sit down." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, good. You'll know your herbs, so I won't have to explain why we don't put mud on a wound." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Sit down and let me look at you, because you lot carry more wounds than you know about and boast about the ones you do." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beasts get hurt as often as you do, I imagine, and I hope you're better at noticing their wounds than your own." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because you'll know that a Forsaken who can't feel the wound will bleed out on his feet, and I'd like your help reminding them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. Learn to bandage, because your spells won't help you once you've run dry." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. You'll be one of the few Forsaken who can mend a wound without my linen, though I'd wager the Light hurts going in, so don't be too proud to take a bandage now and again." },
      },
      again = { { id = "h_again", text = "What else? And sit still while you ask." } },
      choices = {
        { text = "Do the Forsaken listen to healers, Mary?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you think my healing makes your bandages useless, Mary?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you ever tend tauren, Mary, or only the Forsaken?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Why would the dead need bandages?", next = "dead" },
        { text = "You have a healer's hands.", next = "life" },
        { text = "Where can I learn more than you teach?", next = "more" },
        { text = "Rogues bleed more than they admit, Edras.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I bleed myself for power, Edras. Can you patch the holes?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Warriors seem to get their wounds all wrong, Mary.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should I tend my beast's wounds before my own, Mary?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why should a mage learn first aid, Mary?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "It may be foolish to heal with the Light when it burns me.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Because our bodies still break and still mend, only slower, and we don't feel the breaking. A bandage holds you together while the mending happens, and that matters more for us than for anyone." } },
      choices = {
        { text = "So the dead can still heal.", next = "dead_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_heal = {
      lines = { { id = "dh_default", text = "After a fashion. The apothecaries argue about why, and I don't. I only know that a wound I've bound closes and a wound I haven't goes green, and that's all the theory I need." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    life = {
      big = true,
      lines = { { id = "l_default", text = "A midwife in the capital. I brought children into the world for twenty years, and then the plague took them out again. Some of them are in this city now, and I'm glad I can still look after them." } },
      choices = {
        { text = "That's a hard thing to bear.", next = "BACK", reply = "It is, love, but I'm bearing it. Some of them still come to me for stitches.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The past is dead. Leave it buried.", next = "BACK", reply = "Perhaps, but they're walking about in this city, and I'll not leave them. Some things you don't bury.", fx = { align = { light = -1 } } },
      },
    },
    more = {
      lines = { { id = "m_default", text = "Doctor Gregory Victor, at Hammerfall in the Arathi Highlands. He tests the best of my students on the wounded soldiers there, and if you pass, you'll know more than I do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Useless? I've seen a shaman run dry halfway through a fight in Hillsbrad, and it was my linen that kept him breathing until his spirits came back. Learn the bandages, love, and save your spirits for the wounds I can't reach." } },
      choices = {
        { text = "Spirit or linen, I'll use whatever keeps people alive.", next = "BACK", reply = "There's the spirit. Come and learn your knots, love.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll learn it for my own sake, nobody else's.", next = "BACK", reply = "For your own sake's a start, love. You'll find others need it soon enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Whoever comes through that door, love, and a tauren takes three times the linen and complains half as much. I bound a kodo rider's leg last winter and he thanked me in a language I didn't know, and it was the nicest thing anyone's said to me since I died." } },
      choices = {
        { text = "Then I'll carry your linen, and bind whoever needs it.", next = "BACK", reply = "Bless you. Bind them tight, and bind them all.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Linen is for my own wounds first, Mary.", next = "BACK", reply = "First, aye, and then everyone else's. That's how it works.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Rogues bleed more than anyone admits, because they're always getting cut in places nobody saw them go. Learn to bind your own wounds in the dark, since you'll seldom have a light to do it by." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "The dead bleed less than the living but heal worse, so a rogue among us needs to be twice as careful with a knife wound. Bind it tight and bind it quickly, and don't wait until you can't feel your arm." },
      },
      choices = {
        { text = "I'll learn to bind wounds in the dark.", next = "BACK", reply = "Good. In the dark is how you'll mostly need it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll heal when the job's done, not before.", next = "BACK", reply = "Then you'll be done before you know it, and I'll be stitching you up. Come back soon.", fx = { align = { order = -1 } } },
        { text = "Why would the dead need bandages?", next = "dead" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Bandages won't put back what you've traded away, but they'll help with what your demon does to you afterward. I've told the Magic Quarter's warlocks the same for years, and they never listen until they faint on my floor." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You're spending blood you can't make again as quickly as the living can, which is a poor bargain for one of us. Bind what you can, rest when you can, and don't faint on my floor." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Bandages won't put back what you've traded away, and your demon standing over you while I wrap them won't help either. I've told the Magic Quarter's warlocks the same for years, so send it to the corner and sit down before you faint on my floor." },
      },
      choices = {
        { text = "I'll listen, Edras, before I faint.", next = "BACK", reply = "Good. Before you faint is much better than after.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Blood is the price of power, Edras. I'll pay it.", next = "BACK", reply = "Then pay it in my chair, warlock, and I'll stitch you up for free.", fx = { align = { order = -1 } } },
        { text = "You have a healer's hands.", next = "life" },
      },
    },
  },

  topics = {
    forsaken = { { id = "tp_forsaken", text = "The Forsaken can't feel how badly we're hurt, so we walk about with half our ribs broken and wonder why we fall over. That's why you need me, whether you like it or not." } },
    scourge = { { id = "tp_scourge", text = "The Scourge never bandaged anything in its existence. When I see one of our soldiers come back in pieces, I think of that, and I stitch faster." } },
    lordaeron = { { id = "tp_lordaeron", text = "I bandaged soldiers in Lordaeron's field hospitals before the plague came. Now I bandage the same sort of soldiers, except they complain less." } },
    _none = { { id = "tp_none", text = "I don't know, love. I only know how to keep people in one piece, and with the dead that's work enough." } },
  },
}

-- Armand Cromwell: teaches fishing to the dead, who make very patient anglers.
P:NPC {
  key = "cromwell", id = TODO_NPC("Armand Cromwell"), name = "Armand Cromwell", title = "Fishing Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "calm" }, values = { "patient" },
  notices = { "profession", "lock_breath" },
  impression = {
    first = "He finds it funny to fish in canals full of green poison.",
    third = "{name} met Armand Cromwell, the fishing trainer of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "Don't fish in the canals, whatever you do. I've lost three good lines to that muck." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Caught anything that wasn't a boot?" },
  },

  notice = {
    { id = "n_angler", cat = "profession", when = { profession = { name = "Fishing", min = 150 } },
      text = "There's lake weed on your boots, and it's fresh. You've been out at Brightwater, then, and a good long while by the look of it." },
    { id = "n_lock_breath", cat = "lock_breath", when = { aura = { 5697 } },
      text = "You can breathe underwater now, can you? Then you'll know how green these canals are from the bottom, and you'll know why I fish elsewhere." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I doubt it, because the apothecaries put that green in on purpose and they'd take it badly if anyone cleaned it out. Besides, a canal is patient, like me, and I'd sooner wait for it to clear itself than watch a paladin burn out trying." } },
      choices = {
        { text = "If it can be cleansed, it should be, whatever the apothecaries say.", next = "BACK", reply = "Whatever they say? You'd be braver than me, friend. I'll keep fishing in the green.", fx = { align = { order = -1 } } },
        { text = "The canals serve the Dark Lady. I'll leave them alone.", next = "BACK", reply = "They do, and so do the fish, poor things. I'll leave the canals as they are.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "It's the nearest thing I've got, sitting still and hoping for something from below that you can't see. My old priest used to say patience is the first gift, and I've had years of practice since he died." } },
      choices = {
        { text = "Patience is a gift, Armand. You've got plenty.", next = "BACK", reply = "I've plenty, and I'm glad of it. Come and sit a while, if you like.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Waiting for gifts is a fool's game. Take what you need.", next = "BACK", reply = "Then fishing's not for you, friend, and that's no shame. The water doesn't reward grabbing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That the thing you want comes when it's ready and not when you swing at it. I've watched warriors take up a rod after a hard campaign, and they're the stillest anglers I know, once they've stopped thrashing the water." } },
      choices = {
        { text = "Patience, then. I'll learn to sit still.", next = "BACK", reply = "Good. You'll find it's harder than any fight.", fx = { align = { order = 1 } } },
        { text = "I'd rather wade in and grab the fish.", next = "BACK", reply = "Then you'll come out wet and empty-handed, friend. I've seen it happen.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only in that you can't see your quarry, so you have to trust the line and the water. A hunter follows what's in front of him, but a fisherman sits and believes, and the Forsaken could stand to believe in something, even a cork float." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Only in that you can't see your quarry, though {pet} will learn to watch the float as keenly as you do, I expect. A fisherman sits and believes, even if it's only in the float." },
      },
      choices = {
        { text = "I'll learn to trust the line, Armand.", next = "BACK", reply = "Good. The line's more honest than most of the Undercity.", fx = { align = { light = 1 } } },
        { text = "Faith in a float? I'll trust what I can see.", next = "BACK", reply = "Then you'll catch only what you can see, which is usually nothing. Try the float.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Anyone can, if they've the patience, and the dead have plenty of that. The canals here are green with the apothecaries' leavings, so practise here and fish somewhere cleaner, and send the demon away first, because the fish can tell." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Anyone can, if they've the patience, and the dead have plenty of that. But fish can tell when a demon's standing on the bank, and they've all gone to the bottom since yours arrived, so send it away and practise somewhere cleaner than these canals." },
      },
      choices = {
        { text = "I'll send it away and sit patiently.", next = "BACK", reply = "Thank you. The fish are nervous enough with the green.", fx = { align = { light = 1 } } },
        { text = "My demon stays. Let the fish learn fear.", next = "BACK", reply = "Then you'll catch nothing, friend, and the demon will eat my bait. Send it away.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Armand Cromwell, and I teach fishing, which the dead are naturally good at. We don't get cold, we don't get bored, and we don't need to go home for supper, so we can sit by the water forever." },
        { id = "h_living", when = { ["not"] = { race = "Scourge" } }, text = "A living angler! You'll actually eat what you catch, which most of my students can't say. Shall I teach you?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You call on the water spirits, I'm told, and I'd be grateful if you'd ask them why nothing in the canals looks like a fish anymore." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, come to fish? I'd wager you could just turn into something with flippers and save yourself the trouble." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, at the canal's edge! Patience isn't your trade, I'd wager, but fishing might teach you a little of it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll know all about waiting for your quarry, so you're halfway to being a fisherman already." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! You won't find much to bless in these canals, I'm afraid, though I've been trying to bless them myself for years with a hook and a lot of patience." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, fishing in the canals! Don't eat what you catch unless you're dead, and even then I'd think twice." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, fishing in a canal of green poison? I've seen everything now, though I'll admit I'm curious whether the Light would clean the water or only make the fish glow." },
      },
      again = { { id = "h_again", text = "Something else? There's no hurry; there never is with fishing, and less still once you're dead." } },
      choices = {
        { text = "Do you pray over the float, Armand?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shall I ask the water spirits about the canals, Armand?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Don't you miss the taste of what you catch, Armand?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "Where's good fishing near here?", next = "where" },
        { text = "It's odd to see the dead fishing when they don't eat.", next = "why" },
        { text = "The canals would hide a body nicely, Cromwell.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I could freeze the canal and fish through the ice.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What can fishing teach a warrior, Armand?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is fishing much different from hunting, Armand?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Even I need a quiet hour, Cromwell. Will you teach me to fish?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "The Light might cleanse these canals, Armand.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Brightwater Lake, north of Brill, is the best in Tirisfal, and the coast to the west is good too, if you can stand the murlocs. Never the canals, though; whatever lives in that sludge isn't a fish any more." } },
      choices = {
        { text = "Something must live in those green canals.", next = "where_canal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_canal = {
      lines = { { id = "wc_default", text = "I don't know, and I've decided not to find out. The apothecaries say the green is just runoff from their work, which is exactly what I'd say if it weren't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      big = true,
      lines = { { id = "y_default", text = "We sell to the living, to the inn and to the apothecaries, who use fish in ways I don't ask about. But mostly I come for the stillness by the water, which is the nearest thing to sleep the dead can have." } },
      choices = {
        { text = "Everyone deserves some peace.", next = "BACK", reply = "They do, friend, and the water gives it freely. Sit a while.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Peace is for those who've won their war.", next = "BACK", reply = "Then nobody would ever have any, friend. I'll take mine early.", fx = { align = { light = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I'd rather you didn't, now that I think on it, because then I'd have to know the answer. The apothecaries say it's only runoff from their work, and I've decided to believe them, because it's easier to fish when you're not worried about what's biting." } },
      choices = {
        { text = "Some answers are better left alone. I'll leave it.", next = "BACK", reply = "Thank you. Easier is all I've got left.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll ask anyway. Someone should know what's in there.", next = "BACK", reply = "Ask, then, and don't tell me. I'll keep fishing in peace.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Every time, friend, but I've made my peace with it, because the stillness is the better half of fishing anyway. You'll eat what you catch, at least, so do it properly and thank the lake." } },
      choices = {
        { text = "I always thank the lake. It's only right.", next = "BACK", reply = "So do I, friend, though the lake never answers. It's only polite.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A fish is a fish. I'll eat it and thank no one.", next = "BACK", reply = "A practical sort, and I'll not argue. The fish don't mind either way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They would, and I'd ask you not to test it, because I've pulled up enough boots and buckles from that green water to know someone already has. The fish don't mind, but I do, a little." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "They would, and I've a feeling you knew the old city's ditches well enough in life to judge. I've pulled up enough boots from that green water to know someone's tried it already, so please don't add to the collection." },
      },
      choices = {
        { text = "I'll keep my business out of your canals.", next = "BACK", reply = "Thank you. There are enough boots in there already.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The canals keep secrets. That's their use.", next = "BACK", reply = "They do, and I'd rather not know them. Fish around them, if you please.", fx = { align = { order = -1 } } },
        { text = "It's odd to see the dead fishing when they don't eat.", next = "why" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, I suppose, and you'd be the first person ever to ice-fish in the Undercity, which is a sort of distinction. Mind you don't freeze the fish along with it, though, if anything in that sludge can still be called a fish." },
        { id = "xmage_troll", when = { race = "Troll" }, text = "A troll who wants to freeze my canal, now there's something to tell the other trainers. You could do it, I suppose, but I'd sooner you learned the line, since frost won't help you on the coast at Echo Isles." },
      },
      choices = {
        { text = "I'll fish the honest way, with a line.", next = "BACK", reply = "Good. The line's the only honest way, and it's quieter.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Ice is quicker. I'll do it my way.", next = "BACK", reply = "Then you'll be the first, and likely the last. Mind the fish.", fx = { align = { honor = -1 } } },
        { text = "Where's good fishing near here?", next = "where" },
      },
    },
  },

  topics = {
    forsaken = { { id = "tp_forsaken", text = "The Forsaken have all the time in the world, and fishing is the perfect use of it. Nothing in these canals is edible, of course, but it passes the hours." } },
    lordaeron = { { id = "tp_lordaeron", text = "I used to fish Lordamere Lake when the king's barges still sailed it. The water was clean then, and the fish were fat, and I didn't know how lucky I was." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is where the real fishermen gather, I'm told, with sharks and sea monsters and goblins betting on all of it. I'd like to try my line there one day." } },
    _none = { { id = "tp_none", text = "Can't help you there. Ask me about fish, and I'll talk until you beg me to stop." } },
  },
}
