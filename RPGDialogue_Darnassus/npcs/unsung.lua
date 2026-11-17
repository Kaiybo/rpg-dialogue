-- Darnassus, the people with nothing to say until now (0.39.0): the second banker, the warriors'
-- drillmistress and their weapon seller, the saber handler and her riding trainer, the guild master
-- and her tabard maker, a meat seller, and two of the Craftsmen's Terrace trainers.
-- Voices: bibles/unsung.md. No quests of their own in Classic; everything personal is authored.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC = P.TODO_NPC

-- Garryeth: banker in the Temple Gardens, beside Idriana and Lairn.
P:NPC {
  key = "garryeth", id = TODO_NPC("Garryeth"), name = "Garryeth", title = "Banker",
  bible = "bibles/unsung.md", role = "banker", tier = "service",
  communities = { "darnassus" }, temper = { "dry", "precise" }, values = { "order", "patience" },
  notices = { "class" },
  impression = {
    first = "Garryeth keeps the vaults in the Temple Gardens and counts coin as carefully as a priestess counts prayers. He is dry company, but I would trust him with anything I owned.",
    third = "{name} met Garryeth, a careful banker of Darnassus who keeps his vaults under the Temple's shadow.",
  },

  greetings = {
    { id = "g_default", text = "Elune's light on you. If you are here to deposit something, I can help, and if you are here to admire the gardens, they are free." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Nothing in your box has moved since you last stood here, because nothing in my care ever does." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue, unless I misread the boots. I mean no offense, but I will be keeping both hands on the ledger while we talk." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Both require care. Both are trust held for others. Your spirits might understand that." } },
      choices = {
        { text = "Trust kept carefully is honourable, Garryeth.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Coin is not prayer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Now and then, mostly offerings to be held until the Temple decides how to spend them. They leave everything in perfect order, which is more than I can say for the adventurers coming back from Ashenvale." } },
      choices = {
        { text = "Offerings given in faith should go to the needy.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Offerings are coin like any other, better kept than given away.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Very little, in my experience, because your sort carries what it needs and gives the rest away. It makes for small accounts, but I find I respect the habit." } },
      choices = {
        { text = "Giving away what I don't need is part of the oath.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I keep what I earn, and the oath doesn't ask otherwise.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A shield with a Warsong axe still stuck in it, which its owner wished to keep exactly as it was. I listed it as one shield, kaldorei, with one axe, orcish, attached, and it remains the only item in my vault that unsettles Lairn." } },
      choices = {
        { text = "Keep that shield safe. Such things should be remembered.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A broken shield is scrap. Melt it down.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Once, a crate of webwood spider eggs from Shadowglen, which the owner insisted were dormant. They were not, and I have recorded the event in some detail, should you ever doubt me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is welcome to wait by the door, where it can't be mistaken for a deposit. I say that with every respect for the animal." },
      },
      choices = {
        { text = "Those eggs should have been burned in Shadowglen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd have tried it too. Spider eggs fetch good coin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not the vault, but the bankers, and particularly Lairn, who once spent a night watching a humming wand in a box. Deposit your magical things wrapped and labeled, and I'll return them exactly as they were left." },
      },
      choices = {
        { text = "Wrapped and labeled, then. I'll follow your rules.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it's mine, I'll store it as I please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They'll treat you exactly as they treat everyone, which is to say they'll watch you, but they'll watch you more closely. I'll keep your valuables as faithfully as anyone's, because the ledger doesn't ask what you are." },
      },
      choices = {
        { text = "Then I'll give your Sentinels nothing to watch.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them watch. They'll get bored before I do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because the Enclave keeps its own stores and its own counsel, and most druids think coin is something the forest manages very well without. I count it all the same, because someone has to when the merchants come up from Rut'theran." } },
      choices = {
        { text = "The druids are right, and coin is no business of the forest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Coin keeps the Sentinels fed, so the Circle should respect it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The Temple's people bank with us now and then, and I'll say they're the tidiest depositors we have." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your order's possessions tend to be heavy and very carefully polished, which I appreciate more than I can easily say." },
        { id = "h_default", text = "I am Garryeth, one of the three bankers here in the Temple Gardens, along with Idriana and Lairn. We keep what travelers would rather not carry into Ashenvale, and we give it back exactly as it was left." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You have the look of the shen'dorei, the ones who came down from the sky. I confess I'm curious what your people kept in place of banks up there, though I suspect it was not coin." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Something in your bags is glowing, mage. Please tell me you didn't mean to deposit it, because the vault doesn't care for surprises." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "The Temple's bank is guarded by Sentinels, warlock, and they've been told about your kind. Just so you know before you make a deposit." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want to deposit something before Ashenvale, I expect; they generally do." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. If you mean to deposit anything that's still moving, I'm afraid I must refuse." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You'll have little to deposit, I expect, since your Circle thinks a pouch of seeds is a fortune, but the vault is yours as much as anyone's." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I count coin as carefully as a priestess counts prayers, and your spirits may watch, if they wish." },
      },
      again = {
        { id = "h_again", text = "Anything further? The ledger is open." },
        { id = "h_again2", text = "Go on. I have nowhere to be until the Temple bells." },
      },
      choices = {
        { text = "I'd like to see my box.", next = "BUSINESS" },
        { text = "Why keep a bank beside the Temple?", next = "temple" },
        { text = "I'd guess nothing ever goes missing here.", next = "missing" },
        { text = "Do night elves really trust in coin?", next = "coin" },
        { text = "Does the vault really object to enchanted goods?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What's the strangest thing a warrior has left with you?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Has anyone tried to bank something alive, Garryeth?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Will the Sentinels treat me any differently here?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do priests really bank with you, Garryeth?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do paladins leave much with the bank, Garryeth?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why does the Circle keep so little in your vaults?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is counting coin like counting prayers, Garryeth?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Garryeth.", next = "END" },
      },
    },
    temple = {
      lines = {
        { id = "te_default", text = "Because no thief in Darnassus wants to explain himself to the Sisters of Elune, and the Sentinels on the Temple steps never sleep at the same time. It is the safest ground in the city, and a bank should stand on the safest ground there is." },
      },
      choices = {
        { text = "Sensible. Fear keeps the honest honest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It's trust that should keep a city honest, not fear.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    missing = {
      lines = {
        { id = "mi_default", text = "Once, a long while ago, a box came up short by one silver ring, and Lairn and I spent three nights going through every page. On the fourth morning the owner found it on his own finger, and I have never let him forget it." },
      },
      choices = {
        { text = "Three nights for one ring?", next = "missing2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    missing2 = {
      lines = {
        { id = "mi2_default", text = "Three nights for the promise that nothing goes missing here, and the ring only happened to be what tested it. A bank that shrugs at small losses will soon be shrugging at large ones." },
      },
      choices = {
        { text = "That's the right way to keep a trust.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    coin = {
      lines = {
        { id = "co_default", text = "We trust what lasts, and gold lasts better than most things. Since we joined the Alliance, the human and dwarf traders have brought more of it up through Rut'theran than this city ever needed before, and someone has to keep it straight." },
        { id = "co_dwarf", when = { race = "Dwarf" },
          text = "Your own people taught half of Darnassus to count in gold, I'm told, and the other half is still learning. I'm in the first half, so you may relax." },
      },
      choices = {
        { text = "So the Alliance changed even the bank.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the ledgers in the Temple Gardens with Idriana and Lairn. Nobody ever shouts at a ledger, which suits me." } },
    trade = { { id = "tp_trade", text = "More coin comes up from the boats every season. Most of it leaves again for Auberdine, but some of it stays with me for a while." } },
    _none = { { id = "tp_none", text = "That isn't written in any ledger I keep, so I'm afraid I can't help you with it." } },
  },
}

-- Sildanair: warrior trainer on the Warrior's Terrace.
P:NPC {
  key = "sildanair", id = TODO_NPC("Sildanair"), name = "Sildanair", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "brisk", "blunt" }, values = { "discipline", "courage" },
  notices = { "class", "race" },
  impression = {
    first = "Sildanair trains warriors on the Warrior's Terrace and talks like she is still calling out drills. She has no patience for excuses, but she listened when I answered her straight.",
    third = "{name} met Sildanair, a blunt warrior trainer of Darnassus.",
  },

  greetings = {
    { id = "g_default", text = "Feet apart, shoulders loose. If you came to talk, you can do it standing properly." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Show me you've kept your guard up since last time." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human", class = "WARRIOR" },
      text = "A human warrior. Your people fought the orcs with steel and stubbornness for years, and I'll grant you the stubbornness at least." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid on the Warrior's Terrace? If you came to learn how the bear fights without claws, you're welcome to watch." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I allow none. But I listen when a student answers honestly. Do so, and you will learn." } },
      choices = {
        { text = "I will answer honestly, Sildanair.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Excuses are sometimes reasons.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Stay behind us, keep your eyes open and heal the one who's about to fall, not the one who's shouting loudest. Most new healers get that wrong, and it costs somebody a broken arm." } },
      choices = {
        { text = "I'll heal whoever needs it most, loud or quiet.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll heal whoever's most use to the fight, and no one else.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Gladly, if you can keep up, because your order learns to guard others as well as itself and my students could stand to see it. Shield up, feet planted, and don't start praying until the first blow's been taken." } },
      choices = {
        { text = "Shield up and feet planted, and I'll keep up.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I fight my own way, Sildanair, and it's served me well.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Keeping your shield up when your arm is shaking, because that's when the Warsong hit hardest and it's when most of you drop it. Arias'ta will talk to you about spirit, and I'll make sure your shield is still up while you listen." } },
      choices = {
        { text = "Drill me until the shield stays up.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather hit first than hide behind a shield.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Where to stand when the fight closes in, because the Warsong don't care that you'd rather shoot from forty paces. Every hunter who's come back from Ashenvale with stitches learned that lesson too late, so learn it here." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps lunging at my sparring dummies, and I'll admit it has better footwork than half my students. Keep it close when the fight comes to you." },
      },
      choices = {
        { text = "I'll learn to hold my ground when they close.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I keep my distance. That's the whole point.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not into a fight, perhaps, but carry the idea of one, which is knowing what will protect you when everything goes wrong. Every rogue I've buried thought they would never be caught, and most of them were buried in cheaper leathers than they could afford." },
      },
      choices = {
        { text = "Fair point. I'll plan for being caught.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If I'm caught, a shield wouldn't save me anyway.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Some do, but not me, because a good mage ends a fight before my arm tires. Just remember who's taking the blows, and don't set my students on fire while you're at it." },
      },
      choices = {
        { text = "I'll remember, and I'll aim with care.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If they stand in the fire, that's their concern.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They'd try, and they'd likely lose, and then I'd have a broken student and a smug demon, which is no way to run a morning. Stand at the edge and watch if you like, because you might learn how a front line works before you send something to stand in one." },
      },
      choices = {
        { text = "I'll watch and learn how a line holds.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My servant could teach your students a thing or two.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. My students will be glad to have you behind them, but only if you're still standing, so keep your head down." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Good, because you'll actually listen when I tell you to keep your shield up, which is more than I can say for most." },
        { id = "h_default", text = "I'm Sildanair, and I train warriors here alongside Arias'ta and Darnath Bladesinger. Arias'ta will tell you about the warrior's spirit, but I'll tell you to keep your shield up, and between us you'll survive." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "You've got the shoulders for it, so let's see whether you've got the sense. Most warriors who die young die with their weapon raised and their guard down." },
        { id = "h_nonwarrior", when = { ["not"] = { class = "WARRIOR" } },
          text = "You're not one of mine, but sit and watch a drill if you like. Whatever you fight with, the footwork is the same." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue has no shield, which is the first thing I'd change about you, though Arias'ta would tell me to mind my own students." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Keep your shield up, I always say, and for a mage that means keeping a warrior between you and the trouble." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Shoulders back, shield up, and tell me who trained you before I decide whether to start you over." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter on the Warrior's Terrace. You're welcome to watch, but keep that beast out of the sparring ring." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock on my Terrace! Keep your servant out of the drill lines, because my students will swing at anything that moves, and they've no notion yet of friend or foe." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Stand straight, and make no excuses, because your spirits will not excuse you either, and neither will a Sentinel's drill." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it short; I've a drill starting." },
        { id = "h_again2", text = "Your question, then, and keep your chin up while you ask it." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS" },
        { text = "Who comes here to learn?", next = "students" },
        { text = "What's the first thing you teach?", next = "first" },
        { text = "Aren't the Sentinels mostly women? Where do men train?", next = "men" },
        { text = "Should a rogue ever carry a shield?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do warriors here resent guarding mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What will you drill me on, Sildanair?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What can a hunter learn on the Warrior's Terrace?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What should a priest know about fighting beside warriors?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Will you drill a paladin with your warriors, Sildanair?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would your students really attack my servant?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you allow no excuses at all, Sildanair?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to your drill.", next = "END" },
      },
    },
    students = {
      lines = {
        { id = "st_default", text = "Young kaldorei who are tired of waiting for the Sentinels to take them, mostly, and lately humans and dwarves off the boats. The dwarves are the easiest to teach, because they already expect to get hit." },
      },
      choices = {
        { text = "You haven't mentioned the night elves.", next = "students2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students2 = {
      lines = {
        { id = "st2_default", text = "My own people are quick and patient, and they think quick and patient is enough. I spend the first month teaching them that a troll with an axe doesn't care how graceful you are." },
      },
      choices = {
        { text = "Grace still wins more fights than brute strength.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then teach them to fight dirty, if that's what works.", next = "BACK", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = {
        { id = "fi_default", text = "How to fall down and get back up before the next blow lands, because everyone falls. After that it's the shield, and only then do I let anyone near a sword." },
      },
      choices = {
        { text = "That sounds like a lot of falling.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    men = {
      lines = {
        { id = "me_default", text = "The Sentinels are the Sisterhood's, but the Terrace is anyone's who wants to learn steel. Darnath trains as many men as I do, and when the Warsong come to Ashenvale, nobody asks who's holding the blade." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
  },

  topics = {
    sentinels = { { id = "tp_sent", text = "The Sentinels take the best of us to Ashenvale, and I train the ones they haven't taken yet." } },
    background = { { id = "tp_bg", text = "I've been teaching on this terrace since Darnassus had a terrace. Before that I held a line in Ashenvale, and I'll leave it there." } },
    advice = { { id = "tp_ad", text = "Mend your shield before you sharpen your sword. A blunt sword still keeps you alive, but a cracked shield won't." } },
    _none = { { id = "tp_none", text = "I don't know, and I won't guess. Ask someone who isn't busy shouting at recruits who think a few decades of practice is a lifetime." } },
  },
}

-- Ariyell Skyshadow: weapon merchant on the Warrior's Terrace.
P:NPC {
  key = "ariyell", id = TODO_NPC("Ariyell Skyshadow"), name = "Ariyell Skyshadow", title = "Weapon Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "cheerful", "proud" }, values = { "craft", "honesty" },
  notices = { "class" },
  impression = {
    first = "Ariyell Skyshadow sells blades on the Warrior's Terrace and talks about balance and grip the way others talk about family. She tried to talk me out of a weapon that was wrong for me.",
    third = "{name} met Ariyell Skyshadow, who sells weapons on the Warrior's Terrace and cares where they end up.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah. Come and look, but pick them up properly, because a blade tells you more in the hand than on the rack." },
    { id = "g_back", when = { metBefore = true }, text = "There you are. Did the last one serve you well, or have you come to tell me otherwise?" },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You hold yourself like someone who prefers short blades and dark corners. I keep the daggers on the left, and I'd rather not know why you want them." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Perhaps it is. A shaman needs a weapon that answers like the elements: honest and steady. Let me show you another." } },
      choices = {
        { text = "Show me, Ariyell. I trust your judgement.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I will keep my own weapon.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "A plain staff, light enough to carry all day and long enough to keep a snarling thing at arm's length. You'll be praying more than swinging, so there's no point paying for an edge you'll never use." } },
      choices = {
        { text = "My prayers are my real weapon, so a plain staff will do.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Give me the sharpest one, because I don't trust prayers alone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The mace, for the plain reason that it does its work through plate as well as through hide, and you'll meet plenty of both. A sword looks finer, but I'd rather sell you the weapon that brings you back." } },
      choices = {
        { text = "I'll take the mace, then, for honest advice deserves trust.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll take the sword, because a paladin should look the part.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "One that suits your reach rather than your pride, which usually means something shorter than you came in wanting. The Warsong swing heavy and slow, so a warrior who's light on their feet with a good sword will outlast them every time." } },
      choices = {
        { text = "I'll take the right blade over the grand one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Give me the biggest blade you have.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because sooner or later a nightsaber or a Gnarlpine will close the distance, and you'll want something better than the end of your bow. Every Sentinel carries a blade on her hip for that moment, and so should you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has its own blades, of course, and good ones. Still, it can't always be between you and the claw, so carry a dagger for its sake." },
      },
      choices = {
        { text = "A blade on the hip is wise. I'll carry one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My bow and my companion are all I need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A staff, because you can lean on it after a long walk and it keeps a gnoll an arm's length away. Daggers are for rogues and dreamers, and I'd rather sell you the right thing than the costly one." },
      },
      choices = {
        { text = "A staff, then. Thank you for the honest advice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A dagger's quicker. I'll take my chances.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Once, a human who wanted a dagger he could bind a spirit into, and I sent him packing back to the boats. I sell honest steel for honest work, and I'd like to keep my name as clean as my stock." },
      },
      choices = {
        { text = "I wouldn't ask you for anything but steel.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your loss. Cursed blades sell for a fortune.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Something light, of seasoned Teldrassil wood, because a staff that tires your arm will make you change shape sooner than you should. The dear one with the silver fittings is pretty, but I wouldn't sell it to you." } },
      choices = {
        { text = "Then I'll take the plain staff, and trust your judgement.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather have the silver one, whatever you think of it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I'd sell you a staff or a mace, though between us, you'd do better spending your coin on a good robe." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've a two-handed mace in the back that would suit you nicely, {class}, and it's not even the dear one." },
        { id = "h_default", text = "I'm Ariyell Skyshadow, and I sell weapons to the warriors who train on this terrace and to anyone else with the coin. I'd rather sell you the right blade than the dear one, and you'd be surprised how few merchants say that." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, so you'll want a bow, and for that you want Landria on the Tradesmen's Terrace. I'll sell you something for when the beasts get too close, though." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage buying a blade? You're here for a staff, I'd guess, and I've one or two that won't fall apart the first time you swing them." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I'll sell to a warlock, since coin's coin, but I won't sell you anything that's meant to hold a curse. Keep that in mind when you browse." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Let me see your grip, because I can tell more from that than from any story you'd tell me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I don't sell bows, but I've a few good daggers for when the beast gets inside your reach." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Most of your Circle buy one good staff and keep it for a hundred years, which is wonderful for the staff and terrible for my trade." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Balance and grip have been family to me for longer than I can remember, so let me see how you hold your weapon." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? Ask before you buy, never after." },
        { id = "h_again2", text = "Go on, I've time while the Terrace is quiet." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "How do I choose the right weapon?", next = "choose" },
        { text = "You must have plenty of customers up here.", next = "buyers" },
        { text = "Where do your blades come from?", next = "smiths" },
        { text = "Would you recommend a staff or a dagger for a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What blade would you sell a warrior like me?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why would a hunter need a dagger, Ariyell?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have warlocks asked you for cursed blades before?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What weapon would you honestly sell a priest, Ariyell?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Which weapon would you honestly recommend for a paladin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Which staff would you sell a druid, Ariyell?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is my weapon a poor choice, Ariyell?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    choose = {
      lines = {
        { id = "ch_default", text = "Hold it out at arm's length for as long as you can, and when your wrist starts to shake, that's how long you'd last with it in a real fight. Most people buy the biggest thing they can lift and regret it in the first hour." },
      },
      choices = {
        { text = "And if I want the big one anyway?", next = "choose2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    choose2 = {
      lines = {
        { id = "ch2_default", text = "Then I'll sell it to you, because it's your arm, not mine. But I'll remember your face, and if you come back limping, I'll say I told you so." },
      },
      choices = {
        { text = "A warrior should carry whatever frightens the enemy most.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "You're right. Good sense first, then strength.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "bu_default", text = "Sildanair's recruits, mostly, the week before they think they're ready for Darkshore. And now and then a Sentinel who has lost her glaive in Ashenvale and won't say how." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
    smiths = {
      lines = {
        { id = "sm_default", text = "Some are forged right here in the city, some come across from Auberdine, and a few came all the way from Ironforge in a crate that smelled of dwarven ale. Mathiel down the terrace keeps telling me he'll make me something finer, once he has an anvil worthy of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell weapons on the Warrior's Terrace. I've handled more blades than I could count, and I still like the feel of a good one." } },
    advice = { { id = "tp_ad", text = "Oil your blade after the rain, even if you're tired. Rust doesn't care how tired you are." } },
    _none = { { id = "tp_none", text = "I only know about steel and the people who carry it, as my mother did before me, so ask someone else about that." } },
  },
}

-- Lelanai: saber handler at the Cenarion Enclave; sells nightsabers to kaldorei and to those exalted with Darnassus.
P:NPC {
  key = "lelanai", id = TODO_NPC("Lelanai"), name = "Lelanai", title = "Saber Handler",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "warm", "protective" }, values = { "nature", "loyalty" },
  notices = { "race", "mount" },
  impression = {
    first = "Lelanai raises the city's nightsabers and speaks of them as though each one were her own child. She will sell one only to someone she believes will treat it as a companion.",
    third = "{name} met Lelanai, the saber handler of the Cenarion Enclave, who loves her cats more than her customers.",
  },

  greetings = {
    { id = "g_default", text = "Slowly, please, and let them see your hands. My sabers are gentle, but they don't like surprises." },
    { id = "g_back", when = { metBefore = true }, text = "They remember your scent now. That one in the corner even stopped growling." },
  },

  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "You rode right up to my sabers on that? Climb down before they decide it's dinner, please." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! Your people ride rams, I know, and I've always wondered whether a ram would win a race against a nightsaber. I don't think it would." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Only to one who would treat it as kin. Your spirits might help; I will watch." } },
      choices = {
        { text = "I would treat it as kin, Lelanai. You have my word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A mount is a mount.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "When they come back from patrol with Horde arrows in their flanks, yes, and I've sat up through many nights with them. The priestesses will pray over a saber as readily as over a Sentinel, because both serve, and both bleed." } },
      choices = {
        { text = "Any creature that serves deserves healing, and I'll help.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers are for people, and a saber needs a druid.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd trust one who treats the saber as a companion and not a warhorse, because they are not bred for charging into lines of spears. Whether you're that sort of paladin is something the saber will tell me, not you." } },
      choices = {
        { text = "I'll treat it as a companion, not a warhorse.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A mount is a mount, and I'll ride it as I need to.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They do, though I wish they didn't have to, because a nightsaber runs into the Warsong lines without a thought for herself. Bring yours home whole and look after her afterward, warrior, and I'll know I chose her rider well." } },
      choices = {
        { text = "A mount is a companion. I'd never leave her.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "In battle, a mount is a tool like any other.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The same blood runs in them as in the wild nightsabers of Teldrassil, and the Sentinels' hunters have ridden beside them for as long as there have been Sentinels. Mine are raised to carry riders and yours chose you in the wild, and I honor both." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} and my sabers are eyeing each other, and I think they're deciding who's in charge. Don't worry, they always settle it without us." },
      },
      choices = {
        { text = "A companion chosen in the wild is a sacred bond.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast is a beast, wild or raised.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The best, if you treat her as a companion and not a getaway horse. A nightsaber moves without a sound and remembers every kindness, and she'll forgive a great deal, though never cruelty." },
      },
      choices = {
        { text = "I'd treat her as a friend, nothing less.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If she's quick, I don't care how she looks.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd let a saber choose, and I don't think any would choose you while that thing walks at your side. That isn't a judgment on you, only on the company you keep, and the sabers judge company very fairly." },
      },
      choices = {
        { text = "Then I'll keep my distance and let them settle.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your cats are too skittish to be useful.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Perhaps you don't, though a saber lets you rest your own strength, and it carries you as a friend rather than as a burden. Plenty of the Circle ride my sabers, and none of them think less of themselves for it." } },
      choices = {
        { text = "Then a saber would be a companion, not just a mount.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll run on my own four feet and keep my gold.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "To a kaldorei, or to someone the city honors as exalted, and only if I believe they'll treat it as a companion. A mage who teleports everywhere and leaves a saber pining in a stable is not someone I'd trust with one of mine." },
      },
      choices = {
        { text = "I'd never leave a companion behind.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A mount is a mount, Lelanai.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The sabers are calm around healers, I've noticed, as though they can tell your hands are meant for mending." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. My sabers don't usually carry so much steel, {class}, so be gentle with them, for they feel the weight more than they show." },
        { id = "h_default", text = "I am Lelanai, and I raise and train the nightsabers and frostsabers that have carried our people since the forests of the old world. They are not beasts of burden to us, so a saber goes only to someone who will treat it as a companion." },
        { id = "h_elf_young", when = { race = "NightElf", maxLevel = 39 },
          text = "You're one of ours, so one day one of these will be yours. Come back when you've seen more of the world and you can afford to feed her properly." },
        { id = "h_elf_ready", when = { race = "NightElf", minLevel = 40 },
          text = "You're ready, I think. Look them over and let one of them choose you, because that's how it works best." },
        { id = "h_exalted", when = { ["not"] = { race = "NightElf" }, reputation = { faction = "Darnassus", min = "exalted" } },
          text = "The Temple has sent word that you've done more for Darnassus than most of our own, and that means my sabers are yours to choose from. I don't say that to many outsiders." },
        { id = "h_outsider", when = { ["not"] = { any = { { race = "NightElf" }, { reputation = { faction = "Darnassus", min = "exalted" } } } } },
          text = "I'm afraid my sabers go to our own people, or to those Darnassus counts as one of its own. Earn the Temple's highest regard, and come back to me then." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "My sabers like you, rogue, which says something good about you, because they don't like many people who walk that quietly." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Step back from the pens, please, warlock. The frostsabers are pacing, and they only do that when something's wrong." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The sabers can smell steel on you, and they'll want to know whether you're the sort who leaves a mount behind in battle." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll understand the sabers better than most, since you already share your life with a beast." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. My sabers knew you were coming before you reached the pen, because you smell of cat, and they never quite know what to make of it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. My sabers are twitching their ears at you, because they can feel the arcane on your skin, though they'll settle if you're gentle." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. My nightsabers are my children, and Elune's before they were mine, so tell me, would your spirits treat one as a companion?" },
      },
      again = {
        { id = "h_again", text = "Anything else? Mind the tail on that one." },
        { id = "h_again2", text = "Ask away. They're calm this time of day." },
      },
      choices = {
        { text = "Let me see the sabers.", next = "BUSINESS" },
        { text = "Where do frostsabers come from?", next = "frost" },
        { text = "Training a saber to carry a rider must take years.", next = "train" },
        { text = "Why won't you sell to everyone?", next = "outsiders", when = { ["not"] = { race = "NightElf" } } },
        { text = "Would a saber make a good companion for a rogue?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do your sabers ride into battle with warriors?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Are your nightsabers kin to the hunters' companions?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would you ever let a warlock ride one of your sabers?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your sabers ever need a healer, Lelanai?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you trust a paladin with one of your sabers?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why would a druid need a saber, when I can run as one?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you sell a saber to a mage, Lelanai?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would you sell a nightsaber to a shaman, Lelanai?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Lelanai.", next = "END" },
      },
    },
    frost = {
      lines = {
        { id = "fr_default", text = "From the snows of Winterspring, far in the north beyond Felwood, where their coats grow pale and thick. They're harder to settle than nightsabers and twice as proud, but once one trusts you, it never forgets." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    train = {
      lines = {
        { id = "tr_default", text = "You start before their eyes open, so the first thing they ever smell is the one who'll ride them. After that it's years of patience, and if you ever strike one, you lose it for good." },
      },
      choices = {
        { text = "Then the rider owes the saber as much as it owes them.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Years of work for a mount seems wasteful.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    outsiders = {
      lines = {
        { id = "ou_default", text = "Because a saber is bound to the rider, and the rider is bound to Darnassus. When the Temple says you're one of us in all but blood, I'll believe it, and so will the cats." },
        { id = "ou_human", when = { race = "Human" },
          text = "Your Stormwind sells its horses on the same terms, I'm told, so I don't think you can fault us too much." },
      },
      choices = {
        { text = "Then I'll earn it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've raised sabers since before Teldrassil was planted. I'll raise them until the sabers tell me to stop." } },
    advice = { { id = "tp_ad", text = "Never feed a saber from your hand unless you mean to do it every day after. They keep score." } },
    _none = { { id = "tp_none", text = "I couldn't tell you; my days are cats and more cats. Ask Jartsam, he talks to people more than I do." } },
  },
}

-- Jartsam: riding trainer beside Lelanai at the Cenarion Enclave.
P:NPC {
  key = "jartsam", id = TODO_NPC("Jartsam"), name = "Jartsam", title = "Riding Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "easygoing", "wry" }, values = { "patience", "humor" },
  notices = { "level" },
  impression = {
    first = "Jartsam teaches riders at the Cenarion Enclave and finds every student's first fall far funnier than they do. Underneath the jokes he plainly knows his work.",
    third = "{name} met Jartsam, a good-humored riding trainer who works beside Lelanai's sabers.",
  },

  greetings = {
    { id = "g_default", text = "Here to learn to ride, or here to watch someone else fall off? Both are popular." },
    { id = "g_back", when = { metBefore = true }, text = "Still in one piece, I see. That's a credit to one of us." },
  },

  notice = {
    { id = "n_young", cat = "level", when = { maxLevel = 30 },
      text = "You're a few seasons short of riding yet, friend. Come back when the road has toughened you up a bit, and I'll be here." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They always do, and I laugh every time. But they learn. Your spirits might soften the fall." } },
      choices = {
        { text = "Falling teaches, Jartsam. I will learn.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I will not fall.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every one of them, at least once, because a saber moves like water and doesn't wait for anyone. Most of them get up laughing, and the ones who don't need a kind word more than a prayer." } },
      choices = {
        { text = "Then I'll offer both, the kind word and the prayer.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A fall teaches better than any healing would.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Much harder, because a warhorse charges straight and a saber goes wherever it thinks the danger isn't. You'll have to learn to trust it, which I hear your order does well enough, as long as it's the Light you're trusting." } },
      choices = {
        { text = "I'll learn to trust the saber, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll make it go where I mean to go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Much harder, because a saber moves like water and armor moves like a cooking pot. Sit loose, keep your weight back and don't grip with your knees, or she'll think you're trying to wrestle her, which she will win." } },
      choices = {
        { text = "I'll learn to sit loose. Teach me properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll ride my own way and fall if I must.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It does, because you won't treat her like a chair, which is the mistake most riders make. The trouble is that your companion will want to run alongside, and a saber hates being raced by something smaller than she is." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} will want to keep up when you ride, I can see it already. Let it, but don't let it win, or my sabers will sulk for a week." },
      },
      choices = {
        { text = "I'll let her set the pace and learn it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "She'll learn my pace, not the other way round.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Much harder, because a horse waits for its rider and a saber doesn't wait for anyone. You'd do well with one, since you're light on your feet, but you'll still fall off a dozen times first." },
      },
      choices = {
        { text = "I'll take the falls and learn properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll just hold on tighter. Lessons are for others.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It's worth it if you want to see anything between one city and the next, which is most of the world. Teleport if you like, but the sabers will carry you through Ashenvale, and you'll see the forest you're always so eager to skip." },
      },
      choices = {
        { text = "You're right. I'll learn to ride properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I've seen enough forests. Teleporting suits me fine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They'll let you, though they'll sulk about it, and a sulking saber has a way of finding every low branch on the path. Lelanai won't sell you one unless the city vouches for you, but I'll teach you to stay on whatever you end up riding, fire or fur." },
      },
      choices = {
        { text = "Teach me. I'll learn the saber's way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll have a steed of my own soon enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I see more bruised pride than bruised bones in this job, so you'd be welcome on the riding ground, though mostly for the bones." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin on a saber? Now that I'd like to see, {class}, because a saber doesn't care how holy you are if you sit on it like a sack of grain." },
        { id = "h_default", text = "I am Jartsam. Lelanai raises the sabers, and I teach people how to stay on them, which is harder than it looks, because a saber moves like moonlight on water and doesn't wait for you." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, come to learn riding when you could turn into a cat yourself? I suppose even a druid tires of running on all fours." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Rogues make good riders, I've found, because they're used to balancing on rooftops. Just don't try to ride standing up." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Mages keep asking me if they can just teleport instead of learning to ride. The answer is yes, but you'll still need to get home somehow." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll fall off heavier than most, so I'll warn the ground before your first lesson." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You already know how to talk to cats, which puts you ahead of every warrior I've ever taught." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! I've heard your kind ride horses made of fire eventually, so I'm curious whether you'll fall off a saber as fast as everyone else." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Your first fall will be funny, I promise, so tell me whether your spirits will catch you." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a student due who still can't find the stirrups." },
        { id = "h_again2", text = "Ask on. The sabers are napping." },
      },
      choices = {
        { text = "Teach me to ride.", next = "BUSINESS" },
        { text = "What's the hardest part of riding a saber?", next = "hard" },
        { text = "I take it you work for Lelanai.", next = "lelanai" },
        { text = "Is riding a saber really harder than a horse?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is riding worth learning when I can teleport?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is riding any harder in full armor, Jartsam?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does a hunter's bond help with riding a saber?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your riders fall often, Jartsam?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is a saber harder to ride than a warhorse, Jartsam?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Will your sabers let a warlock ride them?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do your students fall often, Jartsam?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Jartsam.", next = "END" },
      },
    },
    hard = {
      lines = {
        { id = "ha_default", text = "Trusting it. Every new rider grips with the knees and pulls back, and the saber feels it and thinks there's danger. Loosen up, let it run, and you'll find it knows the path better than you do." },
      },
      choices = {
        { text = "I prefer to keep control of my mount.", next = "hard2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard2 = {
      lines = {
        { id = "ha2_default", text = "Everyone does at first. You can steer a saber, and it'll go where you send it, but if you fight it every step, it'll fight you back, and it has more legs." },
      },
      choices = {
        { text = "A rider gives the orders. The mount obeys.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Then I'll let it lead where it knows best.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lelanai = {
      lines = {
        { id = "le_default", text = "With her, not for her, though she'd say otherwise. She chooses who gets a saber, and I make sure they don't embarrass her by falling off in front of the Enclave." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've taught riding for a long time. I've only been thrown twice, and I'll deny one of those." } },
    advice = { { id = "tp_ad", text = "Lean into the turns, not away from them. Your mount will thank you, and so will your back." } },
    _none = { { id = "tp_none", text = "No idea, I'm afraid. Ask me about stirrups and I'm your elf." } },
  },
}

-- Lysheana: guild master on the Craftsmen's Terrace.
P:NPC {
  key = "lysheana", id = TODO_NPC("Lysheana"), name = "Lysheana", title = "Guild Master",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "formal", "thoughtful" }, values = { "fellowship", "order" },
  notices = { "class" },
  impression = {
    first = "Lysheana registers the guilds of Darnassus and asks more questions about their purpose than their names. She seems to think a band of companions is a serious promise.",
    third = "{name} met Lysheana, the guild master of Darnassus, who weighs every charter like an oath.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah. If you mean to found a guild, sit down, because I'll want to hear why." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have you found your companions, or are you still looking?" },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. Your Silver Hand was a guild of a kind, I think, sworn to one purpose, and I wish more charters came to me with half that conviction." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It should have a true one: companions who promise to stand together. Your spirits might help, but your word matters more." } },
      choices = {
        { text = "A true promise, then. I will keep mine.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Purpose comes later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "At its side, always, because a band of adventurers without a healer lasts about as long as its first bad fight. The guilds that endure, though, are held together by something closer to faith, and you'd know more about that than I." } },
      choices = {
        { text = "Faith holds people together better than any charter.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A guild endures on gold and good blades, not faith.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Any purpose that is honest, and that its members will keep when keeping it costs them something. Your Silver Hand was such a band, I'm told, and I wish half my charters held half its conviction." } },
      choices = {
        { text = "A fellowship is only as strong as the oath behind it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Purposes shift with the times, and guilds should shift too.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Good ones, if they founded the guild to stand beside someone, and short-lived ones, if they founded it to be in charge. A guild is a promise to the people beside you, warrior, and I always ask a founder which of those two they mean." } },
      choices = {
        { text = "I'd found one to stand beside my companions.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd found one to lead, and I'd lead well.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The best, once they join, because a hunter knows what it means to keep faith with something that can't sign a charter. I've seen hunters stay with a guild long after its founders left it, out of plain loyalty." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would make a fine member, if I could get it to sign. Some guilds count their companions on the roll, I'm told, and I've stopped arguing with them." },
      },
      choices = {
        { text = "A hunter keeps faith with those beside them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I hunt alone. Guilds only slow me down.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I've refused a charter to a band that admitted it meant to rob the Auberdine boats, and I'd do it again. A guild of rogues that works for coin and keeps the peace is welcome, so tell me which kind yours is." },
      },
      choices = {
        { text = "Ours keeps the peace. You have my word.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "We work for coin. The peace is someone else's job.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "If its purpose were honest and its members answered for themselves, I would, though Tyrande might ask to read the charter. Tell me what you'd do with your band, and I'll judge it by its purpose, not by its strangest member." },
      },
      choices = {
        { text = "Its purpose would be honest. I'd answer for it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Purposes change. I'd not swear to one forever.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Many do, and I don't think the Circle minds as long as you remember which oath came first. A band of companions is a promise too, so be sure you can keep both before you take them on." } },
      choices = {
        { text = "The Circle's oath comes first, and any guild comes after.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My companions will need me more than the Circle ever will.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because the last time mages gathered in numbers on this side of the sea, they called the Burning Legion down on us all, and the kaldorei have long memories. I'm not saying yours would do the same, only that I'll want a purpose I can write down and believe." },
      },
      choices = {
        { text = "A fair question. Our purpose would be honest.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Our studies are our own business, guild master.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Bands that ride into dark places always need a healer, and I advise every charter I write to find one early." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll know better than most what it means to swear yourself to a fellowship, {class}, so I'd value your opinion on the charters I keep." },
        { id = "h_default", text = "I am Lysheana, guild master of Darnassus. I keep the charters of every band of adventurers registered in this city, and I ask what each one is for before I write down its name." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue looking to register a guild? I'll ask you what it's for, as I ask everyone, so have an honest answer ready." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I write down every guild's purpose before I write its name, warlock, and I'll be writing slowly for yours." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. I've written many warriors' guilds into the book, and most of them were founded on someone's oath." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your kind tend to join guilds late and leave them early, since you have company enough already." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The Circle rarely asks me for a charter, because it is a fellowship of its own and older than any I've written down, so I'm curious what brings you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. If you've come to register a guild of scholars, I'll want to know what you mean to study, because the Sentinels will ask me later." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. A guild is a serious promise, and my people keep their promises for centuries, so what purpose would your spirits serve in one?" },
      },
      again = {
        { id = "h_again", text = "Is there more you wish to ask before you sign anything?" },
        { id = "h_again2", text = "Go on. Charters can wait for a good question." },
      },
      choices = {
        { text = "I'd like to see about a charter.", next = "BUSINESS" },
        { text = "Why do you care what a guild is for?", next = "purpose" },
        { text = "Most guilds don't seem to last.", next = "last" },
        { text = "Where do I get a guild tabard?", next = "tabard" },
        { text = "Do you refuse charters to bands of rogues?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do warriors make good guild founders, Lysheana?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters make good guild companions, Lysheana?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would you let a warlock register a guild?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Should every guild have a healer at its heart, Lysheana?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What purpose should a guild serve, Lysheana?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Should a druid join a guild outside the Circle, Lysheana?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why would the Sentinels ask about a mage's guild?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What purpose should a guild have, Lysheana?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    purpose = {
      lines = {
        { id = "pu_default", text = "Because a name without a purpose falls apart the first time the members disagree. The ones that come to me with a reason, to guard a road or to clear a dungeon or to look after their own, are still on my rolls years later." },
      },
      choices = {
        { text = "What reason would you accept?", next = "purpose2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    purpose2 = {
      lines = {
        { id = "pu2_default", text = "Almost any honest one. I've registered guilds of fishermen, of healers and of people who simply like each other's company, and I only turn away those who want a banner to hide behind." },
      },
      choices = {
        { text = "A guild should have rules and ranks, or it's a mob.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Friends shouldn't need a charter to stand together.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    last = {
      lines = {
        { id = "la_default", text = "A leader who listens more than she speaks, and members who show up when it's dull, not only when there's treasure. Every guild that has fallen apart in my book fell apart over loot or over pride." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    tabard = {
      lines = {
        { id = "ta_default", text = "Shalumon, here on the Craftsmen's Terrace, will design one with you once your guild is founded. Be patient with him, because he'll want to discuss every color twice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the guild rolls of Darnassus. Every name in them made me a promise of some kind." } },
    advice = { { id = "tp_ad", text = "Choose your companions slowly and keep them long. Gold is easier to find." } },
    _none = { { id = "tp_none", text = "I can't say. If there's a guild that knows, I'll have its name in my rolls, but not the answer." } },
  },
}

-- Shalumon: tabard vendor on the Craftsmen's Terrace.
P:NPC {
  key = "shalumon", id = TODO_NPC("Shalumon"), name = "Shalumon", title = "Tabard Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "fussy", "enthusiastic" }, values = { "beauty", "craft" },
  notices = { "class" },
  impression = {
    first = "Shalumon designs guild tabards and holds firm opinions on every color and emblem. He clearly loves the work and gets a little hurt when anyone rushes it.",
    third = "{name} met Shalumon, Darnassus' particular and enthusiastic tabard maker.",
  },

  greetings = {
    { id = "g_default", text = "Oh, do come in! Mind the bolts of cloth, they've just been sorted by shade." },
    { id = "g_back", when = { metBefore = true }, text = "You again! I hope you've been wearing the colors with pride, and not under a cloak." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. Please, I beg you, don't ask me for a green flame on a black field; I've done three this month and it isn't original." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I love it very much. Each one is a promise of colour. Your spirits might favour earth tones." } },
      choices = {
        { text = "Take your time, Shalumon. Good work needs it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Colours do not matter.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Something gentle and bright, because a healer's tabard should be the first thing a wounded friend looks for across a battlefield. Silver on blue for the Moon or gold on white for the Light, and never anything that might be mistaken for blood." } },
      choices = {
        { text = "Something bright, then, so the wounded can always find me.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Make it dark, because I'd rather enemies didn't find me first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Something solemn and bright, gold on white perhaps, though I'd want to hear the guild's oath before I chose a single thread. A tabard is a promise you wear, after all, so it should look like one you mean to keep." } },
      choices = {
        { text = "Then make it plain, for the oath matters more than the color.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Make it splendid, so people notice us coming.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Deep colors that hold when the cloth is torn, because a warrior's tabard gets more wear than a priestess's ever will. I put the emblem high on the chest where a friend can see it across a battlefield, and that's not vanity, it's sense." } },
      choices = {
        { text = "Colors that let friends find me. That's sensible.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd wear none. Enemies find you that way too.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I could, though it breaks my heart, because a guild's colors are meant to be seen. Greens and browns, then, with the emblem small, and I'll pretend I made it for a druid so that nobody asks." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would look rather fine in a tabard, though I've never made one a beast would keep on. If you ever manage it, bring it back so I can see." },
      },
      choices = {
        { text = "Proud colors. A hunter shouldn't hide what they stand for.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Forest colors. I'd rather the game never saw me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Something dark and quiet, perhaps a crescent moon on black, so it shows only when the light catches it. A tabard is a promise you wear, so I'd want to know what your promise is before I stitch the colors." },
      },
      choices = {
        { text = "My promise is to my guild. Stitch it true.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Make it black and quiet. Promises are for others.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I'd stitch it and let you enchant it, because I know cloth and nothing about the arcane, and the Temple wouldn't care for me learning. Keep it gentle, though, since a tabard ought to show colors, not lightning." },
      },
      choices = {
        { text = "Gentle, then. The colors should speak for themselves.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A little lightning never hurt a tabard.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because a druid spends half the day as a bear or a cat, I'm told, and a tabard looks ridiculous on a bear. I still think the Enclave would look splendid in proper colors, and I've told them so twice." } },
      choices = {
        { text = "The Circle should wear its colors proudly, like any guild.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A druid needs no colors to show what they serve.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Oh, I'd love to stitch something for a healer, all silver and moonlight blue, or gold if you're one of the Light's own." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your order's colors are already so splendid, {class}, but if you ever found a guild, do come to me first." },
        { id = "h_default", text = "I'm Shalumon, and I make the tabards for the guilds Lysheana registers. A tabard is a promise you wear on your chest, so I like to get the colors exactly right before anyone puts one on." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue in a tabard? I've made a few, though I always tell them that bright colors won't help them hide." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I made a tabard for a gnome once that glowed a little at the seams, and I never found out if he did it or I did." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll want a tabard that shows up against blood and mud, so don't let anyone sell you pale silver." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Hunters are the only ones who ever ask me for tabards that blend into the forest." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Leaf green and moonsilver, I'd say, though your Circle has never once asked me for a tabard, and I've had one sketched for years." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! What colours would your spirits choose for a tabard? Take your time, please, because I never rush a colour." },
      },
      again = {
        { id = "h_again", text = "Something else? I have all afternoon for colors." },
        { id = "h_again2", text = "Go on, ask. I promise to keep it short this time." },
      },
      choices = {
        { text = "I'd like to design a tabard.", next = "BUSINESS" },
        { text = "What makes a good tabard?", next = "good" },
        { text = "You must have made a few ugly ones.", next = "worst" },
        { text = "What would you put on a rogue's tabard?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would you stitch a tabard with an enchantment?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What colors suit a warrior's tabard, Shalumon?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could you make a tabard that won't startle the game?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would you put on a priest's tabard, Shalumon?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What colors suit a paladin's guild, Shalumon?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why doesn't the Circle wear tabards, Shalumon?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you love designing tabards, Shalumon?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Shalumon.", next = "END" },
      },
    },
    good = {
      lines = {
        { id = "go_default", text = "One that can be seen across a battlefield and recognized by friends before enemies. Two colors that disagree with each other, and an emblem simple enough that a tired scout can draw it in the dirt." },
      },
      choices = {
        { text = "Then a tabard should be bold and loud.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "I'd want it plain and dignified.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = {
        { id = "wo_default", text = "I won't name the guild, because they're still customers. But they wanted purple, orange and a green emblem all at once, and I made it, and I have not slept well since." },
      },
      choices = {
        { text = "I hope they at least liked it.", next = "worst2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst2 = {
      lines = {
        { id = "wo2_default", text = "They adored it, which is the worst part. I see them on the Terrace now and then, waving at me, and I wave back like a gracious elf, because what else can I do?" },
      },
      choices = {
        { text = "It made them happy, and they'll talk about it for weeks.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I design tabards on the Craftsmen's Terrace. My aunt wove banners for the Sentinels, and I suppose it runs in the family." } },
    _none = { { id = "tp_none", text = "I don't know anything about that, I'm afraid. Ask me about dyes and I'll talk until dusk." } },
  },
}

-- Jaeana: meat vendor on the Tradesmen's Terrace.
P:NPC {
  key = "jaeana", id = TODO_NPC("Jaeana"), name = "Jaeana", title = "Meat Vendor",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "brisk", "practical" }, values = { "honesty", "hard work" },
  notices = { "class" },
  impression = {
    first = "Jaeana sells meat on the Tradesmen's Terrace and has no patience for people who think night elves live on moonlight and berries. She is brisk, honest and very proud of her venison.",
    third = "{name} met Jaeana, who sells meat on the Tradesmen's Terrace and won't hear a word against it.",
  },

  greetings = {
    { id = "g_default", text = "Fresh venison this morning, and the boar's from Dolanaar. The quail's off, because a nightsaber kit got into the larder, so what'll it be?" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I knew the venison would win you over." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Your companion's been staring at my counter since you walked up. I've some scraps for a good beast, if you'll buy something for yourself." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It is, and mine is the best. Your spirits might appreciate good meat honestly hunted." } },
      choices = {
        { text = "Honest meat honestly sold is good, Jaeana.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Meat is meat.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Quietly, and more than they'd tell the druids, because a long night of healing makes anyone hungry. I give them the best cuts, since they spend all day looking after everybody else." } },
      choices = {
        { text = "Healers should be fed well, for they give everything away.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Everyone should pay full price, priest or not.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The Sentinels do, salted and wrapped for the march, and I'd sell you the same. Feeding the people who guard the rest of us is the most honest work I know, whatever the druids think of it." } },
      choices = {
        { text = "It's honest work, and I'll pay a fair price for it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd haggle you down if I thought it would work.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Salted venison keeps for weeks and travels well, and the Sentinels in Astranaar eat little else when the Warsong are pressing. Moonlight and berries are lovely, warrior, but they won't hold up a shield arm." } },
      choices = {
        { text = "The druids have a point. I'll take only what the forest offers.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Give me venison. A warrior needs meat, not berries.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hunters from Dolanaar and Shadowglen, mostly, who take the stags on Teldrassil's slopes and bring them down cleanly. The druids grumble, but the herds would grow too thick for the young tree without them, and every hunter knows it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has been staring at my counter since you walked in, and I'd swear it's choosing a cut. Keep it on its own side, if you'd be so kind." },
      },
      choices = {
        { text = "I hunt for the forest's balance as much as for meat.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I hunt for the coin. Balance is the druids' worry.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not really, because it tastes of nothing, or so the gnomes tell me, and they'd know. The hunters bring me real venison and boar, and even mages get tired of eating air after a while." },
      },
      choices = {
        { text = "Real food beats conjured. I'll buy from you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Conjured or not, food is food. I'll save my coin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I don't know and I'd rather not find out, though the hunters say the felhounds in Felwood eat everything they find. Buy what you like, but keep it from licking the counter, because I've got to sell to the Sentinels after you." },
      },
      choices = {
        { text = "I'll keep it well away from your counter.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's hungry. Sell me something for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not a clever one, but the clever ones aren't the ones who try, and a haunch still goes missing about once a month. The hunters who bring it to me work hard for every cut, so I'll watch my counter, and you'll understand why." },
      },
      choices = {
        { text = "I'll catch your thief, if I see one.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep a sharper eye, Jaeana. That's your problem.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll eat meat, I hope, whatever the druids say, because you can't heal anyone on an empty stomach." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You've the look of someone who eats like a soldier, so I'd wager you'll find no complaint with my prices." },
        { id = "h_default", text = "I'm Jaeana, and I sell meat here on the Tradesmen's Terrace. The hunters of Teldrassil bring it to me, I salt it and cut it, and the whole city eats better for it, whatever the druids say." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid at my counter, and you haven't frowned at me yet. Your Enclave friends usually walk past with their noses in the air." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "You'll not be needing my meat, mage, since you can conjure your own supper. Or can you? I've always wondered what it tastes like." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Whatever that is, warlock, it's eyeing my meat, and I'd ask you to tell it no." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want meat, not berries, whatever the druids tell you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Half the meat on this counter came in on a hunter's back, so you're among friends here." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. I've had cutpurses on the Terrace before, so you'll forgive me for keeping my eye on the venison while you look." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Whatever the stories say, night elves do not live on moonlight and berries, so buy some venison, and your spirits will thank you." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a queue forming." },
        { id = "h_again2", text = "Ask quickly, before the venison goes." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Do the druids object to your trade?", next = "druids" },
        { text = "Your meat looks fresh off the hunt.", next = "hunters" },
        { text = "Is conjured food any threat to your trade?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Will your meat keep a warrior going in Ashenvale?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Who brings you your venison, Jaeana?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do demons even eat, do you think?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the priestesses buy meat from you, Jaeana?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do soldiers bound for Ashenvale buy from you, Jaeana?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would a rogue really steal your venison?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is venison really so prized here, Jaeana?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Jaeana.", next = "END" },
      },
    },
    druids = {
      lines = {
        { id = "dr_default", text = "Some of them, the ones who'd rather we all ate nuts and moonberries. But the hunters only take what the forest can spare, the Enclave knows it, and nobody's ever come up the Terrace to close my stall." },
      },
      choices = {
        { text = "Is it right to hunt the forest at all?", next = "druids2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    druids2 = {
      lines = {
        { id = "dr2_default", text = "The nightsabers hunt, and the owls hunt, and nobody calls them cruel for it. We're part of the forest too, so we hunt the way it does, a little at a time and never more than it can bear." },
      },
      choices = {
        { text = "Hunting is part of nature. You're right.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "We should take as little life as we can.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunters = {
      lines = {
        { id = "hu_default", text = "Hunters from around Dolanaar, mostly, and a few from Rut'theran who bring boar down from the slopes. Jeen'ra's students sell me their first kills sometimes, and I always pay them a little extra so they'll come back." },
      },
      choices = {
        { text = "That's kind of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell meat on the Tradesmen's Terrace. Somebody in this city has to feed people who don't live on dew." } },
    advice = { { id = "tp_ad", text = "Salt anything you mean to carry past Darkshore. The damp there ruins meat in a day." } },
    _none = { { id = "tp_none", text = "I wouldn't know. Ask me what's fresh today and I'll tell you." } },
  },
}

-- Dannelor: first aid trainer on the Craftsmen's Terrace.
P:NPC {
  key = "dannelor", id = TODO_NPC("Dannelor"), name = "Dannelor", title = "First Aid Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "gentle", "earnest" }, values = { "compassion", "practicality" },
  notices = { "class", "weary" },
  impression = {
    first = "Dannelor teaches bandaging on the Craftsmen's Terrace with the patience of someone who has seen what happens when it's done badly. He seems to think every traveler should know it, warrior or not.",
    third = "{name} met Dannelor, who teaches first aid in Darnassus and believes everyone should learn it.",
  },

  greetings = {
    { id = "g_default", text = "Elune's peace on you. Sit down a moment and let me see your hands, because steady hands make good bandages." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I hope you've needed my lessons less than you feared." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priestess of the Moon, or a priest of the Light, it hardly matters. You'll still want linen when your prayers run thin, usually somewhere muddy in Ashenvale." },
    { id = "n_hurt", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Your armor looks as though it's had a hard road, and I'd guess you've had the same. Sit for a moment before you go back out." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "No, they cannot. Spirits help, but linen saves lives. Learn both." } },
      choices = {
        { text = "I will learn both, Dannelor. Every life matters.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Spirits are enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Better together than either alone, I've always thought, because a bandage holds while the prayer works and a prayer reaches what a bandage can't. The priestesses agree, mostly, though they don't like to hear it from a man with linen in his pockets." } },
      choices = {
        { text = "Prayer reaches deeper, but I'll carry linen as well.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A good bandage is surer than any prayer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every paladin should, because you'll spend your Light on the people behind you and forget yourself until it's too late. Carry linen, and you'll have something left for yourself when the Light's been given away." } },
      choices = {
        { text = "The Light goes to others first, so I'll carry linen.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I keep my Light for myself first, and others can bandage.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To do it between fights rather than during them, because a bandage tied while an orc is swinging at you comes loose by the third blow. Find a quiet moment, bind it tight and let it work, and you'll walk back from Ashenvale on your own legs." } },
      choices = {
        { text = "I'll learn the craft and look after myself.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That's what priests are for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not with my linen, I'm afraid, because a beast pulls at anything it doesn't understand. Mending your companion is your own art and not mine, but I'll teach you to bind yourself, so that you're standing when it needs you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would have my bandage off in a heartbeat, and I can't blame it. Look after yourself, and it'll have someone to come home to." },
      },
      choices = {
        { text = "Then I'll learn, so I'm standing when it needs me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My companion takes the blows. I just shoot.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Warriors have priests behind them, and rogues usually don't, so they come to me with bleeding arms and very quiet stories. I teach them all the same, and I don't ask how they got hurt." },
      },
      choices = {
        { text = "I'll learn it properly. I'd rather not rely on luck.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Don't ask, and I won't tell. That suits us both.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Of course, because a wound bleeds the same whatever made it, and a warlock who can bandage is one fewer warlock calling on darker means to heal. Sit down, and we'll start with linen." },
      },
      choices = {
        { text = "Linen it is. I'd rather heal honestly.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll learn it, though my own means work faster.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because one day you'll be in a bear's skin with your mana gone and a Sentinel bleeding beside you, and changing back won't save her. Linen will, if you've learned to tie it, so sit down and let me show you." } },
      choices = {
        { text = "Bandages and prayers both, then. I'll learn the knots.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nature's healing serves me better than strips of cloth.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because your spells won't close a wound, and the priest is never standing next to you when you need one. A roll of linen weighs less than a spellbook, and it's saved more mages than any spell I know of." },
      },
      choices = {
        { text = "Then teach me. I'll carry linen.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll just make sure nothing reaches me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I'll still teach you, if you'll let me, because I've seen prayers run out in the Barrens while the linen carried on." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your order heals with the Light, I know, but even the Light needs a moment, and a bandage can buy you that moment." },
        { id = "h_default", text = "I'm Dannelor, and I teach first aid: linen, wool, a steady hand and the sense to use them before it's too late. It's the one trade every adventurer should learn, because the healer isn't always beside you." },
        { id = "h_warrior", when = { class = { "WARRIOR", "ROGUE" } },
          text = "You'll bleed more than most, given how you fight. I'd learn this before you learn anything else, if I were you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Rogues are my best students, oddly. You all get cut up in places no healer will reach, so you learn to bandage yourselves very quickly." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I'll teach first aid to anyone, warlock, but I'll not teach your servant. That much I can promise you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll need bandages more than anyone on this Terrace, so let me teach you to tie them before you need them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll have two of you to keep standing, I expect, since your companion can't tie its own bandages." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You can mend a wound with a word, I know, but the word costs mana and the linen doesn't, so I'd still like you to learn bandaging." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. You'll be the first to go down when the Gnarlpine get close, so you'd do well to learn how to bandage yourself before it happens." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Bandaging matters, for I have seen what happens when it is done badly, all the way back to the war against the Legion, and your spirits will not save everyone." },
      },
      again = {
        { id = "h_again", text = "Another question? My bandages can wait on the table a while." },
        { id = "h_again2", text = "Go on. My next student is late, as always." },
      },
      choices = {
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Why should I learn this?", next = "why" },
        { text = "Some wounds must be harder to treat than others.", next = "wound" },
        { text = "Where do I get linen?", next = "linen" },
        { text = "Do rogues really come to you more than warriors?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What's the first thing a warrior should learn about bandaging?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can I bandage my companion the way I'd bandage myself?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Will you still teach me, even though I'm a warlock?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do prayers and bandages work together, Dannelor?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should a paladin carry bandages, Dannelor?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why would a druid need bandages, Dannelor?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why should a mage learn first aid, Dannelor?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you think spirits can replace bandages, Dannelor?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Dannelor.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Because priests run out of strength and druids get separated, and a bandage doesn't. I've seen more lives saved on the road by a strip of wool than by any spell." },
      },
      choices = {
        { text = "Surely the Sisterhood's healing is better.", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = {
        { id = "wh2_default", text = "When it's there, yes, and I'd never say otherwise. But the priestesses can't be on every road in Ashenvale, so the rest of us must learn to keep each other alive until they come." },
      },
      choices = {
        { text = "Everyone should learn to save a life.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "If someone falls, that's their own lookout.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wound = {
      lines = {
        { id = "wo_default", text = "Poison, because a bandage can't touch it. In the Barrens and the swamps you'll want antivenom, and you'll learn to make it here once you've the skill for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    linen = {
      lines = {
        { id = "li_default", text = "From the people who try to kill you, mostly, because bandits and satyrs carry it in their packs. If you've spare cloth, bring it here and I'll show you what to do with it." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "satyrs" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I teach first aid on the Craftsmen's Terrace. I learned it bandaging Sentinels in Ashenvale, which is all I'll say about that." } },
    advice = { { id = "tp_ad", text = "Bandage before the fight is over, not after. Find a moment, even a short one." } },
    _none = { { id = "tp_none", text = "I'm only a healer of small hurts, so I couldn't say. Ask someone wiser, perhaps a priestess of the Temple." } },
  },
}

-- Ainethil: alchemy trainer on the Craftsmen's Terrace.
P:NPC {
  key = "ainethil", id = TODO_NPC("Ainethil"), name = "Ainethil", title = "Alchemy Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "precise", "distracted" }, values = { "knowledge", "care" },
  notices = { "craft", "class" },
  impression = {
    first = "Ainethil teaches alchemy on the Craftsmen's Terrace and talks to her flasks almost as much as to her students. She is exacting about measures and suspicious of anyone who isn't.",
    third = "{name} met Ainethil, the exacting alchemy trainer of Darnassus.",
  },

  greetings = {
    { id = "g_default", text = "Careful, that one's still warm, and it has been brewing since the last new moon. What can I do for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. You still have all your eyebrows, so you must be doing something right." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell of peacebloom and earthroot, and I mean that as a compliment. An herbalist who learns alchemy wastes nothing." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You'll understand measure and proportion better than most, I expect, but please don't try to hurry my flasks with a spell." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I am suspicious of anything unmeasured. Spirits are unpredictable. Prove otherwise." } },
      choices = {
        { text = "I will prove it with care, Ainethil.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Unpredictable is fine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Some do, and they make good students, because they understand that healing takes patience. The impatient ones blow up my cauldrons, but priests usually wait for the brew to settle." } },
      choices = {
        { text = "Then I'll learn to wait, and pray while I do.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Potions are surer than prayer, so I'd like to learn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "If you can wait, which I'm told your order finds difficult when there's a fight to be had. The right herb, the right measure and the patience to let it settle, and you'll find potions ask as much discipline as any vow." } },
      choices = {
        { text = "Discipline I understand, and I'll learn to wait.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner fight than watch a cauldron simmer.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Healing potions first, of course, and then something to steady the hand, though most warriors drink them as if they were water from a moonwell. A potion takes time to work, so drink it before you're desperate, and you'll find it does twice as much." } },
      choices = {
        { text = "I'll drink before I'm desperate. Measure matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I drink when it's needed, not before.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The best ones grow where the beasts walk and the people don't, so yes, hunters bring me peacebloom and silverleaf from places I'd never find. Just mark where you picked them, because the same herb from two groves can brew two different potions." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has been sniffing my earthroot, and I'd prefer it didn't eat any. Earthroot does very strange things to animals." },
      },
      choices = {
        { text = "I'll mark every grove. Your work deserves care.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Herbs are herbs. I won't keep notes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I disapprove of anyone who brews carelessly, and poisons are carelessness by design. Learn the herbs first, though, because a rogue who knows Peacebloom from Earthroot can save a life as easily as end one." },
      },
      choices = {
        { text = "I'll learn the healing herbs too. That's wise.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My poisons are careful. That's the whole point.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because I've heard of warlocks who use rare herbs to feed their pacts, and I won't have my plants in any of those bargains. Learn honest alchemy here if you'd like, but the patience it takes is the cure for your craft, not a fuel for it." },
      },
      choices = {
        { text = "Honest alchemy, then. I'll learn the patient way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Herbs are herbs. What I do with them is mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I pick exactly what I need and not a leaf more, and I measure it, which is more than I can say for the young herbalists who come up from Dolanaar. If the Circle thinks Teldrassil's earthroot is suffering, I'd welcome a druid's word on it." } },
      choices = {
        { text = "The tree needs rest, so pick less than you need.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Careful measure is enough, and the tree can spare that much.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll want healing potions for the days your prayers aren't enough, I suppose, and I'd say that's wise." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll be wanting mana potions, I expect, since your order spends its Light quickly." },
        { id = "h_default", text = "I'm Ainethil, and I teach alchemy here on the Craftsmen's Terrace. It's careful work: the right herb, the right measure and the patience to wait for it, and most of my students have the herbs but not the patience." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue in my shop is usually after poisons, and you'll find I don't teach those. Kaldorei alchemy is about healing, mostly." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I teach alchemy, warlock, not whatever you do. Please keep your hands off the bloodthistle." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll be one of my best customers, I'm sure, though I wish you'd learn to measure before you drink." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll know where the herbs grow, I imagine, which makes you more useful to me than most of my students." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. You'll know the herbs better than my students do, though I suspect you'll also want to argue with me about how much of each one to pick." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Measures matter more than any spell, so your spirits must be exact, or the flask will crack." },
      },
      again = {
        { id = "h_again", text = "Yes? Ask, but quietly, this needs to settle." },
        { id = "h_again2", text = "Ask on, but keep your sleeves clear of the burner." },
      },
      choices = {
        { text = "Train me in alchemy.", next = "BUSINESS" },
        { text = "What should a new alchemist learn first?", next = "first" },
        { text = "Where do the best herbs grow?", next = "herbs" },
        { text = "Alchemy looks a dangerous craft.", next = "danger" },
        { text = "Do you disapprove of rogues brewing poisons?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Which potions does a warrior need most, Ainethil?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters find good herbs along their tracks, Ainethil?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why should a warlock keep away from your herbs?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do priests ever learn alchemy, Ainethil?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would a paladin make a good alchemist, Ainethil?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you pick Teldrassil's herbs too freely, Ainethil?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you trust spirits in alchemy, Ainethil?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    first = {
      lines = {
        { id = "fi_default", text = "A minor healing potion, made correctly a hundred times. Peacebloom, silverleaf and a vial, and if one of the hundred comes out cloudy, you start counting again from one." },
      },
      choices = {
        { text = "A hundred is excessive.", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      lines = {
        { id = "fi2_default", text = "Then don't become an alchemist, because the hundred-and-first will be the one someone drinks with an orc's axe in them. I'd rather you were bored than that they were dead." },
      },
      choices = {
        { text = "Fair. Precision saves lives.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll learn by doing, not by repetition.", next = "BACK", fx = { align = { order = -1 }, trait = { independent = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = {
        { id = "he_default", text = "On Teldrassil you'll find peacebloom and silverleaf in every glade, and earthroot by the paths. For anything stronger you'll have to go to Darkshore and Ashenvale, and the herbalists in the Enclave can teach you to pick it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    danger = {
      lines = {
        { id = "da_default", text = "Only to the careless. The worst I've seen was a student who boiled a flask dry and filled the Terrace with green smoke, and Lysheana didn't speak to me for a week." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I teach alchemy on the Craftsmen's Terrace. I've stained my fingers green for longer than I care to count." } },
    advice = { { id = "tp_ad", text = "Label every vial, every time. You will forget, and you won't like guessing." } },
    _none = { { id = "tp_none", text = "Not my field, I'm afraid. I only know what boils and what doesn't, and I have spent a long life learning even that." } },
  },
}
