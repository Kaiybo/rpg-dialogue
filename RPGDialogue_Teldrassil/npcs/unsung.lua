-- Teldrassil's tradespeople (0.39.0): Dolanaar's bowyer, warrior trainer, alchemist and herbalist,
-- the Maneweavers in their house up the road, and Rut'theran's fishmonger and fishing trainer.
-- Voices: bibles/unsung.md. Forever: the Camping 101 lessons end with Malorne, Nadyia and Radnaal.
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Jeena Featherbow: bowyer in Dolanaar.
P:NPC {
  key = "jeena", id = TODO_NPC("Jeena Featherbow"), name = "Jeena Featherbow", title = "Bowyer",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "dolanaar" }, temper = { "lively", "frank" }, values = { "craft", "self-reliance" },
  notices = { "class" },
  impression = {
    first = "Jeena Featherbow sells bows and arrows in Dolanaar and will happily tell you everything wrong with the way you hold yours. She is friendly about it, and usually right.",
    third = "{name} met Jeena Featherbow, Dolanaar's frank and cheerful bowyer.",
  },

  greetings = {
    { id = "g_default", text = "Arrows, bows, quivers, whatever you need for the road, and advice for free if you stand still long enough. Every Sentinel on Teldrassil has heard it, so you may as well too." },
    { id = "g_back", when = { metBefore = true }, text = "Back already? You must be using those arrows, which is the whole idea. Elune guide the next ones straighter." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and your quiver's half empty. Gnarlpine hide is tough, so you'll want the sharper heads before you go near Ban'ethil." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior wanting a bow? Good. Pulling a harpy down to you is a lot safer than climbing up after her." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "You're gripping it wrong, but that can be fixed. Your spirits may guide your aim, but your grip is mine to correct." } },
      choices = {
        { text = "Correct it, Jeena. I want to learn properly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My grip works well enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Most of them, and not for luck, either, because they ask Elune to guide the arrow to a clean kill so that nothing suffers. I'd say a hunter's prayer and a healer's prayer aren't so very different, really." } },
      choices = {
        { text = "A clean kill is a mercy, and I'd pray for that too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "An arrow flies straight or it doesn't, whatever anyone prays.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That's what I'm asking you! The Sentinels would call it brave or mad depending on the day, but I suppose if your order means to stand between the weak and whatever's coming, a bow won't do it." } },
      choices = {
        { text = "I stand in front so that others don't have to.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Only fools fight fair, and I'd take a bow if I could.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior should carry something that reaches farther than an arm, because the Gnarlpine like to throw from the trees before they close. Pull a few into the open with a bow, and then they can meet your blade on your terms." } },
      choices = {
        { text = "I'll carry one and draw them to me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If they won't close, I'll go to them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "You're gripping too tight, like everyone does, and the arrow pulls left because of it. Hold it the way you'd hold a nightsaber cub, firm enough that it can't get away and gentle enough that it doesn't want to, and you'll hit what you aim at." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "You're gripping too tight, like everyone does, and the arrow pulls left because of it. Your {pet} sat still the whole time you drew, though, which tells me you've trained it well." },
      },
      choices = {
        { text = "I'll take the advice. A bow should be held right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My grip has served me well enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "I sell bows and arrows and little else, so you'd want the weaponsmiths in Darnassus for good throwing knives. I'll say this, though: a bow is a fine friend to a rogue, if you've the patience to learn it." },
      },
      choices = {
        { text = "I'll learn the bow and fight in the open.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A knife in the back beats any arrow.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What should I practise on?", next = "targets" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Then I hope you never run out of it in the Webwood with a spider on your back. Magic is a strange thing to lean on, friend, and my people paid for that lesson with a whole sunken city." },
      },
      choices = {
        { text = "Fair. A bow might save my life.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My fire hasn't failed me yet.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Do the Sentinels shoot too?", next = "sentinels" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some of the older druids sigh at me, because every arrow I sell finds something in the forest sooner or later. I tell them a hunter who shoots straight kills cleanly, and I'd rather that than a beast left wounded." } },
      choices = {
        { text = "The elders are right, and fewer arrows would serve the forest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A clean kill is a fair one, and I agree with you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Run, mostly, or let your servant take the blows while you catch your breath, which is what I've seen your kind do on the road to Darnassus. My hunters can't count on that, so they practise until their arms ache, and I'd say the same to you with a wand." },
      },
      choices = {
        { text = "Fair. I'll practise with my wand.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My servant takes the blows. That's what it's for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_night_elves_distrust", tags = { "news" }, when = { gossip = { topic = "night_elves", stance = "distrust" } },
          text = "Kyra Windblade tells me you think we keep secrets better than friends. Here's one for nothing, then: my bows are better than the ones in Darnassus." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You won't need a bow, I suppose, but come and look anyway, because half the Sentinels I sell to say a prayer before they loose their first arrow of the day." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, with a hammer instead of a bow, I'll wager! I won't try to sell you anything, {class}, but I'm curious how you fight without ever loosing from a distance." },
        { id = "h_default", text = "I'm Jeena Featherbow, and I sell bows and arrows here in Dolanaar. Every young hunter on Teldrassil buys their first quiver from me, and most of them come back to tell me what they shot with it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior buying from me? Most of your lot think a bow is a stick for poking people from a distance." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and with a bow I didn't sell you, by the look of it. Let me see how you hold it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You won't need my bows, I know, but half the young druids who pass through still buy a quiver for a friend, so I'm always glad to see you." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! You can't draw a bow, I know, but I'd love to know what you'll do when the Gnarlpine get close and your spells run dry." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Spirits or no, I'd wager you hold a bow wrong, as everyone does at first, so let me show you how the Sentinels hold one." },
      },
      again = {
        { id = "h_again", text = "What else? I've arrows to fletch, but I can talk while I do it." },
        { id = "h_again2", text = "Go on, I'm listening. Fletching is slow work, and my people have never minded slow work." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "What makes a good bow?", next = "bow" },
        { text = "What should I be shooting around here?", next = "targets" },
        { text = "I'd guess the Sentinels buy from you too.", next = "sentinels" },
        { text = "Have you anything for throwing? Knives, perhaps?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I've never needed a bow. I have fire.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Should a warrior carry a bow, Jeena?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's wrong with how I hold my bow, Jeena?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Sentinels really pray before they shoot?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why should a paladin fight up close, Jeena?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Circle mind that you sell bows to hunters, Jeena?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What should a warlock do when the spells run dry?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What am I doing wrong with my bow, Jeena?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Jeena.", next = "END" },
      },
    },
    bow = {
      lines = {
        { id = "bo_default", text = "Wood that bends without arguing and a string that doesn't fray in the damp. The best bows on Teldrassil are cut from fallen branches, never living ones, and anyone who tells you otherwise has never met a druid." },
      },
      choices = {
        { text = "Why only fallen wood?", next = "bow2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bow2 = {
      lines = {
        { id = "bo2_default", text = "Because the tree is alive, and we live in it. It's slower to wait for the wind to bring the wood down, but I'd rather wait than explain myself to the Arch Druid." },
      },
      choices = {
        { text = "That's right. Teldrassil deserves that respect.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A tree this size can spare a branch.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    targets = {
      lines = {
        { id = "ta_default", text = "Nightsabers and strigid owls in the woods around the village, and the Gnarlpine furbolgs to the west if Athridas has asked you to deal with them. Keep your distance from the furbolgs and let the arrows do the work." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    sentinels = {
      lines = {
        { id = "se_default", text = "The ones posted in Dolanaar do, when their own fletchers run short. They're fussier customers than any hunter, and I like them better for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furb", text = "The Gnarlpine used to be peaceful, but now they snarl at anyone who goes near Ban'ethil. Shoot first if they come running." } },
    background = { { id = "tp_bg", text = "I make and sell bows in Dolanaar. My hands have more splinters than skin." } },
    advice = { { id = "tp_ad", text = "Carry twice the arrows you think you need. You'll lose half of them in the undergrowth." } },
    centaur = { { id = "tp_centaur", text = "Centaur use short horn bows, I've heard, very strong and very stubborn to draw. I'd like to get my hands on one and see what I could learn." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw make bows of their own, rough-cut but true. I traded one off a Sentinel once, and I still use it to teach." } },
    everlook = { { id = "tp_everlook", text = "Winterspring yew is the best there is, but the goblins of Everlook sell it at prices that make my splinters ache. I buy a little anyway." } },
    _none = { { id = "tp_none", text = "I don't know about that. Ask Keldamyr at the inn; everyone talks to her, and she remembers all of it." } },
  },
}

-- Kyra Windblade: warrior trainer in Dolanaar; sends warriors on to Elanaria in Darnassus.
P:NPC {
  key = "kyra", id = TODO_NPC("Kyra Windblade"), name = "Kyra Windblade", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "dolanaar" }, temper = { "steady", "encouraging" }, values = { "courage", "duty" },
  notices = { "class", "greenness" },
  impression = {
    first = "Kyra Windblade trains Dolanaar's young warriors with steady encouragement, and she seems to measure a student by how they get up rather than how they fall.",
    third = "{name} met Kyra Windblade, the steady warrior trainer of Dolanaar.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, and welcome to Dolanaar. If you've come to learn the blade, you've found the right elf, though I warn you that the Sentinels trained me hard." },
    { id = "g_back", when = { metBefore = true }, text = "There you are. You're standing better than last time, so something's sinking in." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { class = "WARRIOR", maxLevel = 6 },
      text = "You're fresh down from Shadowglen, I can tell by the way you hold your shoulders. Relax them before a grell teaches you to." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk like someone who'd rather strike from behind. It works, but one day you'll have to face someone, and I'd like you to be ready." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_kin", when = { race = "NightElf" }, text = "You were born under these branches, so tell me straight: are we as strong as we like to think we are?" },
        { id = "op_ask_default", text = "Most outsiders think the kaldorei are all moonlight and soft words until a Sentinel puts an arrow past their ear. What do you make of my people, now that you've seen us up close?" },
      },
      choices = {
        { text = "Proud and strong. The Sentinels are the finest soldiers I've met.", next = "op_r1", fx = { affinity = 1, align = { honor = 1 }, opinion = { night_elves = "admire" } } },
        { text = "Too proud. You still think it's ten thousand years ago.", next = "op_r2", fx = { align = { honor = -1 }, trait = { skeptical = 1 }, opinion = { night_elves = "arrogant" } } },
        { text = "Your people keep secrets better than they keep friends.", next = "op_r3", fx = { trait = { cautious = 1 }, opinion = { night_elves = "distrust" } } },
        { text = "I'm still making up my mind.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Then you haven't met many soldiers, but I'll take it gladly. Tell the dwarves, because they never believe us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "You're not the first to say so, and the ones who did were usually right, which is far more irritating than being wrong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "We had ten thousand years to practise keeping secrets and only a few to practise keeping friends. Give us time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It does, if you rise again, and your spirits won't catch you every time, so learn to stand on your own." } },
      choices = {
        { text = "I will stand again every time, Kyra.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I will not fall.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Lean on one, yes, but never hide behind one, because a priest can't heal what a warrior was too careless to block. I'd be glad if you came down to watch them train, and gladder still if you told the reckless ones exactly that." } },
      choices = {
        { text = "I'll heal them, careless or not, because that's my calling.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they're careless, let them carry the bruises a while.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That a shield is for the person beside you as much as for yourself, which my students forget the moment a furbolg charges them. You fight for others first, from what I've heard, and they need to see it done before they'll believe it." } },
      choices = {
        { text = "The person beside me comes first, always.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A fighter should guard their own life first, and others can manage.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "How to get up, mostly, because Arias'ta and Elanaria in Darnassus will knock you down more times than you'll want to count. If you can rise without anger and swing again without fear, you'll have learned the best thing Dolanaar can give you." } },
      choices = {
        { text = "I'll rise without anger, every time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll rise angrier, and hit back harder.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "You should, because a Gnarlpine with a club doesn't care how far you'd prefer to be from him. Learn to step back and sideways in one movement, and you'll have room to draw again before he swings." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "You should, because a Gnarlpine with a club doesn't care how far you'd prefer to be from him. Your {pet} already knows the footwork, so watch how it circles a boar and do what it does." },
      },
      choices = {
        { text = "I'll learn the footwork. It could save my life.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My companion keeps them off me, mostly by sitting on them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That being knocked down isn't failing, and that a druid who panics and changes shape at the wrong moment loses more than one who stands and takes the hit. Stay in the shape you chose until the fight is done." } },
      choices = {
        { text = "I'll stand and take the hit, as you say.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A druid's strength is changing shape whenever it's needed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "How to get up again, which matters more than how you fall, and nobody falls harder than a mage caught without a shield. Stand behind someone who can take a blow, and if there's nobody to stand behind, learn to step back before you cast." },
      },
      choices = {
        { text = "Good advice. I'll keep a warrior in front of me.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll freeze them before they ever reach me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Not wrong, only risky, because the day your servant falls you'll have to stand up by yourself. I measure a student by how they get up, and I'd like to know you can do it without help." },
      },
      choices = {
        { text = "I'll learn to stand on my own.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "That's what the servant is for, trainer.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! My students could use you, because half of them learn to swing before they learn to duck, and I can't heal the bruises." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I teach warriors, not knights, but I'd still like to see what your order teaches about holding a line." },
        { id = "h_default", text = "I'm Kyra Windblade, and I train the warriors who come down from Shadowglen. I teach them the basics here in Dolanaar before Darnassus gets them, so that Arias'ta and the other trainers there don't have to start from nothing." },
        { id = "h_elanaria", tags = { "news" }, when = { questActive = TODO_QUEST("Elanaria") },
          text = "Elanaria in Darnassus is expecting you. Go up to the Warrior's Terrace, and when she asks what I taught you, tell her I said to keep your feet planted." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior from Shadowglen! Get up off the ground as often as you fall, and I'll make something of you yet." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll still want to know how to fight when something reaches you, so don't think my lessons aren't for you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You won't train with me, but I've watched young druids take a beating from the Gnarlpine and get back up in bear shape, and that's half of what I teach." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, in Dolanaar? You're a long way from any tower, and I'd guess you've noticed by now how far a Gnarlpine can run while you're still casting." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I train warriors to stand their ground, and I see you've brought something to stand it for you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I measure students by how they get up, not by how they fall, and I suspect your spirits have helped you up more than once." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, I don't bite." },
        { id = "h_again2", text = "Go on. The next student can wait." },
      },
      choices = {
        { text = "What do outsiders get wrong about the kaldorei?", next = "op_ask" },
        { text = "Train me.", next = "BUSINESS" },
        { text = "A warrior must outgrow Dolanaar soon enough.", next = "after" },
        { text = "You must see young warriors make the same mistakes.", next = "mistake" },
        { text = "Why do so few kaldorei become warriors?", next = "few" },
        { text = "Should your students learn to lean on a healer, Kyra?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you have your students learn from a paladin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could a mage learn anything from a warrior, Kyra?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is it wrong to let my servant take the blows?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you think falling teaches more than winning, Kyra?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Kyra.", next = "END" },
        { text = "What will you teach me before Darnassus, Kyra?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Should a hunter learn a warrior's footwork too?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would you teach a druid about getting back up, Kyra?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
      },
    },
    after = {
      lines = {
        { id = "af_default", text = "Darnassus, and the trainers on the Warrior's Terrace, then across the sea to Darkshore. Once you're ready, I'll send you to Elanaria, and she'll decide whether you're as good as I've told her." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mistake = {
      lines = {
        { id = "mi_default", text = "Charging in alone. Young warriors see a nightsaber and think they'll prove themselves, and then there are three nightsabers, and the priestesses have to carry them back to the moonwell." },
      },
      choices = {
        { text = "Courage means charging in anyway.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Patience wins more fights than courage.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    few = {
      lines = {
        { id = "fe_default", text = "Many of our daughters join the Sentinels, and many of our sons go to the druids, and the blade is left for those of us who fit neither. That suits me, because the ones who choose it really mean to be here." },
      },
      choices = {
        { text = "Did you choose it yourself?", next = "few2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    few2 = {
      lines = {
        { id = "fe2_default", text = "I did. I liked the Sentinels' watch well enough, but not the waiting, nor the wet moss down my collar, and a blade doesn't ask you to wait." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
  },

  topics = {
    sentinels = { { id = "tp_sent", text = "The Sentinels guard our forests and our roads, and every warrior I train might one day stand beside them." } },
    background = { { id = "tp_bg", text = "I teach the first lessons of the blade in Dolanaar. Someone has to, and I like seeing them improve." } },
    advice = { { id = "tp_ad", text = "Fight one enemy at a time when you can. Pull them apart and you can beat them all." } },
    centaur = { { id = "tp_centaur", text = "I teach the young ones to fight what's in front of them, but some will meet centaur down south one day. Tell them from me to plant their feet and keep their shields up." } },
    warsong = { { id = "tp_warsong", text = "The Warsong are the reason so many of my students go to Ashenvale. I train them hard because the orcs won't be gentle." } },
    blackfathom = { { id = "tp_blackfathom", text = "When my students are ready, Blackfathom Deeps is where they go to find out. The ones who come back walk a little taller." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. My world is drills and bruises, and has been for longer than you'd believe." } },
  },
}

-- Cyndra Kindwhisper: alchemy trainer in Dolanaar.
P:NPC {
  key = "cyndra", id = TODO_NPC("Cyndra Kindwhisper"), name = "Cyndra Kindwhisper", title = "Alchemy Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "dolanaar" }, temper = { "soft-spoken", "curious" }, values = { "knowledge", "healing" },
  notices = { "craft" },
  impression = {
    first = "Cyndra Kindwhisper teaches alchemy in Dolanaar and speaks so softly that I leaned in to hear her. She treats every herb as if it had something to tell her.",
    third = "{name} met Cyndra Kindwhisper, the quiet alchemy trainer of Dolanaar.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah. Please keep your voice low, for the tincture is settling, and it is as easily startled as a fawn." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Have you found any interesting herbs since we last spoke?" },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You've been picking silverleaf, I can smell it on your gloves. Malorne Bladeleaf, our herbalist, must be teaching you well." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "In their way, yes, as softly as spirits do. Your earth spirits must hear them too." } },
      choices = {
        { text = "Then we listen alike, Cyndra.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Herbs are herbs.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not in the same way, but toward the same end, I think, because both ask something of the healer before they give anything back. My potions need the right herbs and your prayers need faith, and I've seen each work where the other failed." } },
      choices = {
        { text = "I'll trust in prayer first, and potions after.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A good potion is surer than any prayer, to my mind.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A mana potion when your prayers run dry, and a healing draught for when you're too busy guarding someone else to heal yourself. I suspect a paladin forgets that second one more than anyone, so I'd keep two in your pack." } },
      choices = {
        { text = "Those I guard come first, so the draughts are for them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I look after myself first, so the potions are for me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A healing potion will close a cut, but it can't give you back the breath you've spent, so please don't drink it as if it were courage. I'd much rather you came back to tell me it helped than drank three and charged into the Gnarlpine camps." } },
      choices = {
        { text = "I'll drink with care and come back to tell you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it keeps me swinging, I'll drink all three.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Always, though I'd ask you to be gentle with the plants, as Malorne would. Pick from the edge of a patch and leave the heart of it, and it will still be there next season for the next hunter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Always, though I'd ask you to pick from the edge of a patch and leave the heart of it. And your {pet} has been sniffing the silverleaf, which gives a beast a dreadful stomach, so I'd rather it didn't eat any." },
      },
      choices = {
        { text = "I'll leave the heart of each patch.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take what I find. It all grows back.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "No, and I would ask you not to brew them in my garden. Earthroot and peacebloom are for healing here, and what you do with your own vials is between you and whatever you answer to." },
      },
      choices = {
        { text = "Healing only, in your garden. I'll mind it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A poison is only a potion with a purpose.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What grows best on Teldrassil?", next = "herbs" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Some of my students say so, but alchemy asks the plant and magic tells it, and I know which I prefer. You'll find the work slow, but it doesn't bite back the way the arcane does." },
      },
      choices = {
        { text = "There's wisdom in that. I'll learn it slowly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Telling works faster than asking.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Which herbs should I start with?", next = "herbs" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It grows paler there each season, and the potions I make from it don't heal quite as well as they should. I don't know whether the land is sick or the furbolgs are, but I think they're sick from the same thing." } },
      choices = {
        { text = "Leave the pale peacebloom be until the land heals.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Pick it anyway, because weak potions still help someone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Earthroot and peacebloom are gentle things, and mine always seem to wilt near anything that came out of the Twisting Nether. Perhaps it's only my fancy, but I'd rather not lose a morning's harvest finding out." },
      },
      choices = {
        { text = "I'll leave it outside. Your herbs come first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fancy, then. It stays with me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I think we're in the same trade, you and I, though you heal with prayer and I heal with peacebloom and patience." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You heal and fight both, I've heard, which makes me wonder whether you'd have any use for my potions at all." },
        { id = "h_default", text = "I'm Cyndra Kindwhisper, and I teach alchemy here in Dolanaar. I show students how to turn what grows on Teldrassil into potions that heal, and I ask them to be gentle with both the plants and the people who drink the result." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Please be gentle with my shelves, because potions don't like being jostled, and neither do I." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You walk where the herbs grow, so tell me, have you seen any peacebloom near the lake?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'm glad, because you'll hear what the herbs are saying better than I can, and I've been worried about the peacebloom near the Gnarlpine camps." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I'll teach you alchemy if you'd like, the same as anyone, though I'll ask you to leave your servant outside, because the herbs don't like it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Lean in, please, for I speak softly. Every herb on Teldrassil has something to tell me, and perhaps your spirits do too." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? Ask gently, as you would ask the forest." },
        { id = "h_again2", text = "Go on, quietly, as if Elune herself were listening." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "What can I make from Teldrassil's herbs?", next = "herbs" },
        { text = "Who do you make potions for?", next = "for" },
        { text = "Do you teach poisons as well as potions?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Alchemy is just magic for the patient.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can your potions help a warrior through a long fight?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you need herbs gathered from the wilds, Cyndra?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do potions and prayers heal in the same way, Cyndra?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would your potions serve a paladin in a long fight?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What's wrong with the peacebloom by the Gnarlpine camps, Cyndra?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why would the herbs mind my servant, Cyndra?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do herbs really speak to you, Cyndra?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Cyndra.", next = "END" },
      },
    },
    herbs = {
      lines = {
        { id = "he_default", text = "Peacebloom and silverleaf make a healing potion, which is the first thing every alchemist learns. Earthroot will come later, once you've learned to coax a little more out of what you gather." },
      },
      choices = {
        { text = "Where do I find them?", next = "herbs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs2 = {
      lines = {
        { id = "he2_default", text = "In almost every glade between here and Lake Al'Ameth, if you look down while you walk. Malorne Bladeleaf, here in the village, can teach you to gather them without tearing up the roots." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ["for"] = {
      lines = {
        { id = "fo_default", text = "For the Sentinels, mostly, and for anyone who comes back from Ban'ethil bleeding. Lately I've been sending more down to the moonwell than I'd like, because the furbolgs are not as gentle as they used to be." },
      },
      choices = {
        { text = "Perhaps the furbolgs can still be cured.", next = "for2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    for2 = {
      lines = {
        { id = "fo2_default", text = "Athridas believes they can be cured, and I'd like to believe it too, because I knew them when they were kind. But a cure does nothing for the scout who comes back with claw marks across her arm." },
      },
      choices = {
        { text = "They were friends once. They deserve a cure.", next = "BACK", fx = { align = { light = 1 }, learn = { "furbolgs" } } },
        { text = "Protect our own first. Drive them out.", next = "BACK", fx = { align = { light = -1 }, learn = { "furbolgs" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furb", text = "The Gnarlpine have gone wild, and I treat the wounds they leave. I pray Athridas finds a cure." } },
    background = { { id = "tp_bg", text = "I teach alchemy in Dolanaar, mostly to students who taste things they shouldn't." } },
    advice = { { id = "tp_ad", text = "Keep a healing potion on your belt, not in your pack. You won't have time to dig." } },
    fel_moss = { { id = "tp_fel_moss", text = "Fel moss is where my students learn not to taste things. The ones who don't learn it are why I keep a bucket by the door." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids say the Dream's herbs are perfect, and I'd love to brew with them. I'd love even more not to fall asleep doing it." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay sells potions that will kill you or cure you, and the goblins won't say which until you've paid. My students learn better than that." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry. Perhaps someone at the inn could tell you, or a druid of the Enclave." } },
  },
}

-- Malorne Bladeleaf: herbalism trainer in Dolanaar. (Forever: ends Camping 101: Herbalism.)
P:NPC {
  key = "malorne", id = TODO_NPC("Malorne Bladeleaf"), name = "Malorne Bladeleaf", title = "Herbalism Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "dolanaar" }, temper = { "patient", "reverent" }, values = { "nature", "balance" },
  notices = { "craft", "form" },
  impression = {
    first = "Malorne Bladeleaf teaches herbalism in Dolanaar and treats every root as something borrowed from the forest. He spoke more kindly to the plants than to most people, and he was kind enough to me.",
    third = "{name} met Malorne Bladeleaf, the patient herbalism trainer of Dolanaar.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah. Mind where you step; there's earthroot under that bench." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I hope you've been leaving the roots in the ground." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = { "bear", "cat" } },
      text = "Please don't trample the seedlings with those great paws. They took me a whole season to coax up." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "We should always ask, because the forest gives freely but remembers who takes rudely. Your spirits must know that better than I do." } },
      choices = {
        { text = "Then I will always ask, Malorne.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The forest is ours to use.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Peacebloom for calming fevers and silverleaf for poultices, though they'd rather pray than brew when they can. I gather only what grows back, because a healer who strips the forest bare has only moved the wound somewhere else." } },
      choices = {
        { text = "Healing should never wound anything else, so I'll gather gently.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The forest is vast, and a few herbs won't be missed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Restraint, I think, because every herb you leave in the ground is one that will be there next season for someone else. I'm told your order speaks of serving others before yourself, so perhaps you know the lesson better than my students do." } },
      choices = {
        { text = "Taking only what I need is a discipline I already keep.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I take what the fight demands, and I don't count it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Earthroot settles the stomach before a battle, and a healer can do a great deal with a pocket of peacebloom. I'd teach you to find them yourself, but you'll have to learn to watch your feet first, because the forest doesn't grow back under boots." } },
      choices = {
        { text = "I'll watch my feet and learn the herbs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I've no time for flowers. I'll buy potions.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Peacebloom in the open glades, silverleaf in the shade, and earthroot wherever the ground's been turned, which is often where boars have been rooting. Follow a boar's trail and you'll find earthroot, and then you can thank the boar." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Peacebloom in the open glades, silverleaf in the shade, and earthroot wherever boars have been rooting. Your {pet} has a good nose, so let it find the herbs, but teach it not to dig them up roots and all." },
      },
      choices = {
        { text = "I'll take only what grows back.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If I find it, it's mine. The forest won't miss it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "It will notice, and so will I, for I walk these paths every morning. Take one leaf in three and leave the root, and Teldrassil will give to you again next season." },
      },
      choices = {
        { text = "One in three, then. I'll leave the root.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The forest is big enough to spare a little more.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What grows here?", next = "grows" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "There's no herb on Teldrassil that grew for darkness, and if you are looking for one, you will not find it here. Keep your questions for your trainers in Stormwind, and keep whatever you carry away from my beds." },
      },
      choices = {
        { text = "Only curiosity. I'll leave your beds alone.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Every herb has a dark use, if you look.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "How do you gather properly?", next = "gather" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Slowly, and from where there are plenty, never the last flower in a glade, because that's how a field lasts a hundred years instead of one. Mages are always in a hurry, I've found, and an herb pulled in a hurry is half the herb it should be." },
      },
      choices = {
        { text = "I'll take my time. The forest deserves that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I've no time for patience. I'll take what I need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Many of the herbs I gather were once used by the priestesses for healing, and some still are, so you'll find yourself in good company here." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I've never taught one of your order, and I wonder what you'll make of a craft that asks you to take only what you need." },
        { id = "h_default", text = "I am Malorne Bladeleaf, and I teach herbalism to those who'll listen. Anyone can pull a flower out of the ground, but I teach people to take what the forest offers so that it grows back next season." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Herbalism") },
          text = "Lyreena sent you, did she? Then you've learned that a camp needs a fire, and I'll show you what an herbalist adds beside it." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid will already know half of what I teach, so you're here for the other half. The Enclave teaches you to feel the forest, and I'll teach you which leaves to pick." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll trample half my peacebloom walking in, so please step where I step." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll have walked over more herbs than you know, chasing whatever you were chasing." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. You'll want to know which herbs your potions need, I expect, and I'll teach you, so long as you take them the way the forest offers them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Every root I gather is borrowed from the forest and repaid in time, so tell me, do your spirits borrow too?" },
      },
      again = {
        { id = "h_again", text = "What else would you know? Speak softly; the seedlings are listening." },
        { id = "h_again2", text = "Ask what you will. The forest has waited this long for its answers, and so can I." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "How do I gather without harming the plant?", next = "gather" },
        { text = "Teldrassil's glades must be thick with herbs.", next = "grows" },
        { text = "What does an herbalist bring to a camp?", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Herbalism") } },
        { text = "I'll take what I need from the forest. It won't notice.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Is there any use for herbs in a warrior's kit?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Which herbs grow along a hunter's trails, Malorne?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do any of these herbs have darker uses?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Which herbs do the priestesses still use for healing?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What can herbalism teach someone sworn to the Light?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How does the forest offer its herbs, Malorne?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Should we always ask before taking from the forest, Malorne?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Malorne.", next = "END" },
      },
    },
    gather = {
      lines = {
        { id = "ga_default", text = "Take the leaves and the bloom, but leave the root and a little of the stem. Most herbs will grow back for the next traveler if you do, and if you take everything, the glade is bare for years." },
      },
      choices = {
        { text = "Does it really matter that much?", next = "gather2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gather2 = {
      lines = {
        { id = "ga2_default", text = "It does on Teldrassil. This tree is young, and the soil on its branches is thin, so what we take carelessly may not come back at all." },
      },
      choices = {
        { text = "Then we should take only what we need.", next = "BACK", fx = { align = { light = 1 }, affinity = 1, learn = { "teldrassil" } } },
        { text = "Herbs are meant to be gathered. That's their purpose.", next = "BACK", fx = { align = { light = -1 }, learn = { "teldrassil" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows = {
      lines = {
        { id = "gr_default", text = "Peacebloom and silverleaf in every glade, and earthroot along the paths if you look closely. For mageroyal and briarthorn you'll have to cross to Darkshore, and the rarer herbs grow further south in Ashenvale." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "ca_default", text = "Herbs to keep the fire sweet and a few leaves to steep, so whoever rests there wakes up clearer. Lyreena knows how a camp should feel, and I only add the smell of the forest to it." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
  },

  topics = {
    teldrassil = { { id = "tp_teld", text = "The tree is young and its soil is thin. It gives freely, but it can't give forever." } },
    camping = { { id = "tp_camp", text = "Lyreena teaches the fire, and I teach the herbs that go beside it. Ask her first." } },
    background = { { id = "tp_bg", text = "I teach herbalism in Dolanaar. I've walked every glade on this tree with my eyes on the ground." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "Every herb grows true in the Dream, the druids say, with no blight and no rot. I'd like to see it, though I'd probably spend the whole visit on my knees." } },
    fel_moss = { { id = "tp_fel_moss", text = "Fel moss creeps in the wrong places on this tree, and I pull it up wherever I find it. Wear gloves when you do, and don't breathe it in." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw know every herb in Felwood, including the ones that grow clean in all that rot. I'd give a lot to walk their tunnels with one." } },
    nordrassil = { { id = "tp_nordrassil", text = "The herbs on Hyjal's slopes grow under Nordrassil's shade, and they're stronger for it. I keep a few seeds I'm afraid to plant here." } },
    _none = { { id = "tp_none", text = "That is beyond my knowledge, and the forest has not seen fit to tell me." } },
  },
}

-- Nadyia Maneweaver: leatherworking trainer in her house up the road from Dolanaar. (Forever: ends Camping 101: Leatherworking.)
P:NPC {
  key = "nadyia", id = TODO_NPC("Nadyia Maneweaver"), name = "Nadyia Maneweaver", title = "Leatherworking Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "dolanaar" }, temper = { "hospitable", "particular" }, values = { "home", "craft" },
  notices = { "craft" },
  impression = {
    first = "Nadyia Maneweaver teaches leatherworking from the house she shares with Radnaal, and she welcomes students as guests. She is very particular about small, neat stitches.",
    third = "{name} met Nadyia Maneweaver, who teaches leatherworking from her home west of Dolanaar.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, come in, you're welcome here. We haven't much beneath this roof, but what we have is yours to share." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to our home. Let me see your stitches; I hope they've gotten smaller." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Let me see that seam on your sleeve. Hmm, it's better than most, though I'd tighten it before it gives way." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because small things make great work, and one stitch out of place can ruin a whole cloak. I imagine your spirits would agree." } },
      choices = {
        { text = "Small things matter, Nadyia. I agree.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Small mistakes do not matter.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Only when the work is done carelessly, because a beast that gave its life deserves a hide worked with care. Radnaal thanks every one he skins, in his own quiet way, and I like to think I finish the thanks with my stitching." } },
      choices = {
        { text = "Giving thanks for every life taken is right.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hide is a hide, and thanks won't make it softer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Of course, because plate rubs and pinches without something good beneath it, and nobody fights well when they're chafed raw. Your armorers in the east think only of the steel, but it's the leather that keeps you in it all day." } },
      choices = {
        { text = "Then I'll take proper care of my gear, every piece of it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I wear what I'm given and don't fuss over it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Good leather, stitched small and tight, will outlast cheap mail, and it won't ring like a bell when you move. Radnaal skins the hides and I stitch them, so if you want armor that bends without breaking, bring me something worth working." } },
      choices = {
        { text = "Small stitches, then. I'll wait for it done right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I need it quick, not neat.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "You work it soft before you cut it and you stitch it small, so that nothing catches and nothing creaks. Every hunter I've made armor for says they forgot they were wearing it, and that's the best praise there is." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "You work it soft before you cut it and you stitch it small, so that nothing catches and nothing creaks. Your {pet} has a fine coat, by the way, and I'm only admiring it, I promise." },
      },
      choices = {
        { text = "Quality takes time. I'll wait for yours.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll stitch my own. Close enough is fine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "It's the only armour that breathes, too, and you'll be glad of it when you're crouched in a hedge for an hour. I can teach you to stitch it so the seams don't creak, which matters more to your sort than to most." },
      },
      choices = {
        { text = "Teach me. I'll do it right.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll learn the trick and do it my own way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why do your stitches have to be so small?", next = "stitch" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "A few, though most of them want cloth and complain about the smell of the hides. I'll teach anyone who'll put up with it, mage or not." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "A gnome came through once and spent an hour admiring my awls, so I suppose your people like the tools, at least. I'll teach anyone who'll put up with the smell, mage or not." },
      },
      choices = {
        { text = "A craft learned by hand is worth the smell.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner enchant my robes than stitch hides.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why live outside the village?", next = "house" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Harder than for a hunter, because the armor has to forgive every change of shape, so I stitch small and leave a little give at every seam. Radnaal swears the hides come only from beasts that were hunted honestly, and I make sure the Circle knows it." } },
      choices = {
        { text = "Honest hides and honest stitching are all I could ask.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Leather is leather, and I don't need to know its story.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A few, and they're usually better at it than they expect, because the work wants patience and a steady hand. The trouble is the servant, which sits in the corner and stares at Radnaal until he can't skin straight." },
      },
      choices = {
        { text = "I'll leave it outside while I learn.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Radnaal will have to get used to it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Come in, and mind the hides by the door, because Radnaal leaves them everywhere and I've given up asking him not to." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in our little house? I make leather, not plate, {class}, though I could make you a fine padded jerkin to go beneath it." },
        { id = "h_default", text = "I'm Nadyia Maneweaver, and I teach leatherworking here in our house, just up the road from Dolanaar. Radnaal skins the hides and teaches skinning, and I turn the hides into something a traveler can wear." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Leatherworking") },
          text = "Lyreena sent you to learn what a leatherworker brings to a camp. It's the tent, of course, and I'll show you how to stitch one that won't let in the rain." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Your leather's been stitched in a hurry, and I'd love to take it apart and do it properly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll be wanting leather that moves quietly through the brush, and that I can do." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, in our house! Come in, and mind the hides by the door, because Radnaal says the Circle always looks at them as though they were old friends." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. Come in all the same, but mind that your servant doesn't scorch my hides, because a scorch mark ruins a whole day's stitching." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and welcome as a guest! I am particular about small things, the way my mother's mother was, and I imagine your spirits must be particular too." },
      },
      again = {
        { id = "h_again", text = "What else, dear? Sit down by the fire, if you like." },
        { id = "h_again2", text = "Ask away. Radnaal won't be back for a while yet." },
      },
      choices = {
        { text = "Teach me leatherworking.", next = "BUSINESS" },
        { text = "Why make your stitches so small?", next = "stitch" },
        { text = "Why live outside the village?", next = "house" },
        { text = "What does a leatherworker bring to a camp?", next = "camp" },
        { text = "Leather's the only armour that doesn't clink.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do mages ever take up leatherworking?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can leather really stand up to a warrior's work?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How do you make leather that won't rustle in the brush?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the hides ever trouble you, Nadyia?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you really make a jerkin to go under plate?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is it hard to make leather for a druid, Nadyia?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do warlocks ever take up leatherworking?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why are you so particular, Nadyia?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Nadyia.", next = "END" },
      },
    },
    stitch = {
      lines = {
        { id = "st_default", text = "Because a big stitch lets things slip out, and it lets the cold in, and it makes a tunic look lumpy. A small stitch takes longer, but a jerkin sewn properly lasts until you outgrow it." },
      },
      choices = {
        { text = "Faster work is sometimes better work.", next = "stitch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stitch2 = {
      lines = {
        { id = "st2_default", text = "Faster work comes back to me in pieces, usually from the young ones who fought a nightsaber in it. I'd rather have them leave my house a day later and come home whole." },
      },
      choices = {
        { text = "Do it right, then. Shortcuts cost more later.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Sometimes good enough is good enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    house = {
      lines = {
        { id = "ho_default", text = "Because tanning hides doesn't smell pleasant, and Dolanaar's neighbors are kinder for not living beside it. Besides, the hunters pass this way on their way back from the west, and they bring their hides straight to Radnaal." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "ca_default", text = "A tent, so the people who rest by the fire have somewhere dry to sleep. Lyreena prefers the stars, but even she's grateful for canvas when it rains." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
  },

  topics = {
    camping = { { id = "tp_camp", text = "A leatherworker brings the tent. Without one, a camp is just a fire and wet blankets." } },
    background = { { id = "tp_bg", text = "Radnaal and I keep a house up the road from Dolanaar, and I teach leatherworking from it." } },
    advice = { { id = "tp_ad", text = "Mend your armor before it tears. A small stitch today saves a big patch tomorrow." } },
    centaur = { { id = "tp_centaur", text = "I've seen centaur hide on a Sentinel's quiver, and it's tougher than anything we tan here. I didn't ask where she'd got it." } },
    everlook = { { id = "tp_everlook", text = "Everlook's goblins pay very well for winter furs, and Radnaal sends them some each year. I write the letters, because he won't." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw tan their hides with something I've never managed to copy. Radnaal thinks it's bark, and I think it's spite." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, dear. Ask in Dolanaar; they hear more news than we do out here." } },
  },
}

-- Radnaal Maneweaver: skinning trainer, Nadyia's housemate. (Forever: ends Camping 101: Skinning.)
P:NPC {
  key = "radnaal", id = TODO_NPC("Radnaal Maneweaver"), name = "Radnaal Maneweaver", title = "Skinning Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "dolanaar" }, temper = { "quiet", "gruff" }, values = { "respect", "craft" },
  notices = { "pet" },
  impression = {
    first = "Radnaal Maneweaver teaches skinning and says little that isn't about the work. When he does speak, it is with real respect for the animals he skins.",
    third = "{name} met Radnaal Maneweaver, the taciturn skinning trainer who shares a house with Nadyia.",
  },

  greetings = {
    { id = "g_default", text = "Hm, a visitor. If you're here to learn skinning, come and stand by the rack, and thank the beast before you touch the knife." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and your knife looks sharper than last time." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { family = "Cat" } },
      text = "You're traveling with a cat, so I'll keep the nightsaber pelts out of its sight. It doesn't seem right to make it watch." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I always do. They give their lives and I give my care, and I'd guess your spirits understand that." } },
      choices = {
        { text = "Respect for the beast is honour, Radnaal.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Animals are resources.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Quietly, before the first cut, the way my father taught me, and I won't tell you the words because they're not mine to share. Whatever you pray to, {class}, I'd guess it hears that sort of thing as well as anything said in a temple." } },
      choices = {
        { text = "Any honest prayer is heard, and yours is too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thanks or none, the beast is still dead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "If you'll do it properly, and with respect for the beast, which is the only rule I hold anyone to. Nadyia says I'm too strict about it, but I've seen hides hacked off by careless folk and I won't have it on my bench." } },
      choices = {
        { text = "I'll do it with respect, or not at all.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A dead beast won't mind how it's skinned.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "If you've killed it, yes, because a beast that died for nothing is a waste the forest doesn't forgive. Bring me a hide and I'll show you how to take it cleanly, and you'll think twice before you kill the next one for sport." } },
      choices = {
        { text = "Then nothing I kill will go to waste.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I kill what attacks me. The rest isn't my concern.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I thank them quietly and I waste nothing, so the hide goes to Nadyia and the meat goes to Dolanaar. It isn't a grand ritual, but the old kaldorei hunters did the same, and I'd sooner keep their ways than lose them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I thank them quietly and I waste nothing, so the hide goes to Nadyia and the meat goes to Dolanaar. Your {pet} is watching my knife, and I can't blame it, so tell it I only skin what the forest has already given up." },
      },
      choices = {
        { text = "I'll thank them and waste nothing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A hide's a hide. Thanks won't change that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "It is knifework, but the beast is already dead, which means you have time to do it well. Your sort tends to rush, and a rushed cut spoils the hide." },
      },
      choices = {
        { text = "Then I'll take my time with it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Fast and clean is the only way I know.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Do you mind the work?", next = "mind" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "Keep it away from my hides, and from Nadyia's, and from me. The kaldorei have seen what the Legion's servants do to living things, and a dead nightsaber deserves better than to be singed by one." },
      },
      choices = {
        { text = "Understood. It stays well away.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's a tool, like your knife.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What's the best hide here?", next = "best" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The same way the wild does, by wasting nothing and thanking what fed you. A wolf doesn't apologize to the deer, but it doesn't leave half of it to rot either, and I hold myself to that much." } },
      choices = {
        { text = "I can accept the work, done the way you do it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll never be at peace with it, however it's done.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "If you kill a beast, you owe it the use of its hide, mage or not. I've seen mages leave a whole stag to rot after a fireball, and that's a waste I won't teach anyone to make." },
      },
      choices = {
        { text = "You're right. I'll use what I kill.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A dead stag is no concern of mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You'll not like watching me work, I expect, but I give thanks for every beast, so we may not be so different." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll want nothing from my trade, I suppose, unless you mean to learn it, and I've never yet taught one of your order." },
        { id = "h_default", text = "I'm Radnaal Maneweaver, and I teach skinning. Nadyia does the fine work with the leather, and I do the part that comes first, which nobody enjoys but somebody must." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Skinning") },
          text = "Lyreena's lesson, is it? A skinner brings hides to the camp to sit on, so nobody has to sit in the mud." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Your kind leave a lot of carcasses behind, and most of them go to waste." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll know already that a clean kill makes a clean hide." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I'll understand if you'd rather not watch me work, though I'd sooner you did, because I skin nothing that wasn't hunted with respect." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. You'll want to learn skinning, I suppose, or you've come to see Nadyia. Either way, the hides are out back." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I skin nothing without thanking it and the forest that fed it, so tell me, do your spirits respect the beasts as well?" },
      },
      again = {
        { id = "h_again", text = "What else? Ask plainly; Elune gave me hands for skinning, not a tongue for speeches." },
        { id = "h_again2", text = "Ask, if you need to. The hides will wait, and so will I." },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "Do you mind the work?", next = "mind" },
        { text = "The nightsabers here have fine pelts.", next = "best" },
        { text = "Skinning's just knifework. I've plenty of that.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Should I skin what I kill, Radnaal?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How do you honor the beasts you skin, Radnaal?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "My servant could help you, if you like.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How do you give thanks for every beast you skin?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you teach skinning to a paladin, Radnaal?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How can a druid make peace with skinning, Radnaal?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Should a mage learn to skin, Radnaal?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you respect the animals you skin, Radnaal?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    mind = {
      lines = {
        { id = "mi_default", text = "I mind waste. If a beast is killed and the hide left to rot, it died for nothing, so I'd rather it kept someone warm through a Darkshore winter." },
      },
      choices = {
        { text = "So using everything honors the animal.", next = "mind2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mind2 = {
      lines = {
        { id = "mi2_default", text = "That's how I see it, though some of the druids think I'm only making excuses. They're welcome to come and say so, but they never do." },
      },
      choices = {
        { text = "Using what you take shows respect for it.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A hide is a hide. No need to dress it up.", next = "BACK", fx = { align = { light = -1 }, trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = {
        { id = "be_default", text = "Nightsabers give the softest pelts, and the young hunters bring them in by the armful. Bring me a ruined one and I'll show you where you cut wrong." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    camping = { { id = "tp_camp", text = "A skinner brings hides to sit on. Ask Lyreena about the rest." } },
    background = { { id = "tp_bg", text = "I skin, and I teach skinning. Nadyia does the talking for both of us." } },
    timbermaw = { { id = "tp_timbermaw", text = "Timbermaw skin a beast in half the cuts I use. I watched one do it once, and I still think about it." } },
    everlook = { { id = "tp_everlook", text = "Winterspring pelts, and Everlook buys them. That's all I need to know about the place." } },
    centaur = { { id = "tp_centaur", text = "Centaur skin what they kill and wear it. Good work, ugly people." } },
    _none = { { id = "tp_none", text = "Don't know, so ask Nadyia. She has a longer memory for gossip than I have for anything." } },
  },
}

-- Nessa Shadowsong: fishing supplies in Rut'theran Village; sends the Bounty of Teldrassil to Auberdine.
P:NPC {
  key = "nessa", id = TODO_NPC("Nessa Shadowsong"), name = "Nessa Shadowsong", title = "Fishing Supplies",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "rutheran" }, temper = { "cheerful", "chatty" }, values = { "friendship", "trade" },
  notices = { "craft" },
  impression = {
    first = "Nessa Shadowsong sells fishing gear in Rut'theran Village and seems to know every boat and every fisherman on the water. She talks about Auberdine as if it were next door.",
    third = "{name} met Nessa Shadowsong, the cheerful fishmonger of Rut'theran Village.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, and welcome to Rut'theran! Lines, hooks and bait, and the best gossip on the shore of Teldrassil for nothing." },
    { id = "g_back", when = { metBefore = true }, text = "There you are again! Did the fish bite, or did you only feed them?" },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You've got the smell of a proper angler about you, and I mean that kindly. Androl Oakhand, who teaches fishing down by the water, will be pleased to see you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They mostly do, though the sea grows restless. Your water spirits might calm it." } },
      choices = {
        { text = "Then keep them running safely, Nessa.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The sea is wild. Let it be.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, everything, to hear them tell it: the furbolgs, the strange beasts along the shore and the old ruins nobody likes to talk about. A priest would cheer them up, I think, or at least give them something to talk about besides the weather." } },
      choices = {
        { text = "Then I'll go and see them when I cross the water.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They'll cheer up on their own, and I've my own road.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only the young ones off the boat, who stand about looking lost and lose their purses to the first smooth talker. If you'd keep an eye on them while you're here, I'd count it a kindness, and so would Vesprystus, our flight master." } },
      choices = {
        { text = "I'll keep an eye on them while I'm here.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll learn to guard their purses soon enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Darkshore murlocs come down the coast now and then, and the threshers in deep water would take a hand off without trying. Auberdine has it worse, Laird the fishmonger tells me, so if you're crossing, keep your blade dry and your feet off the edge." } },
      choices = {
        { text = "If the murlocs come, I'll stand on this dock.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Murlocs are Auberdine's problem, not mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Half the cats in the village wait on my dock every evening, and the hunters' companions are the worst of all. I don't mind, because a fed cat is a quiet cat, and I need quiet to hear whether anything's biting." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Half the cats in the village wait on my dock every evening, and I don't mind, because a fed cat is a quiet cat. Your {pet} is already looking at my bucket, I see, but I've seen worse thieves, and most of them were Laird." },
      },
      choices = {
        { text = "My companion doesn't steal. I'll make sure of it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it's quick enough to take a fish, it's earned it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then they'd be disappointed, for the only things that cross from here to Auberdine are fish and the occasional seasick dwarf. The Sentinels watch Rut'theran closely, and so do I." },
      },
      choices = {
        { text = "Good. I'll keep my eyes open for you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Closely isn't the same as closely enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's the village like?", next = "village" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "There is, and the archdruids put it there, not anyone of your calling. My people don't care for mages speaking of power, so you'll forgive me if I turn the talk to fish." },
      },
      choices = {
        { text = "Of course. Fish it is.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Power doesn't care who planted it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where's the best fishing?", next = "fishing" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not that I've noticed, though the fishermen do, because a seal that swims too near the nets scares the catch off for an hour. The druids of Auberdine have learned to swim wide of the boats, and I'd thank you to do the same." } },
      choices = {
        { text = "I'll swim wide of the nets, as the others do.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The sea belongs to everyone, and the fish to no one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd guess they can feel it, the way they feel a storm coming before the sky turns, so they dive deep and stay there. Laird in Auberdine swears it's the same over there, and he and I don't agree about anything, so it must be true." },
      },
      choices = {
        { text = "Then it'll wait on the dock, and the fish can sulk in peace.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The fish will have to get over it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Oh, a priest! My friends in Auberdine could use a few of you, because things across the water have been sad and strange lately, and I'm always telling them so." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, at Rut'theran! Did you come over on the boat from Auberdine? Tell me the crossing didn't turn your stomach in all that armor." },
        { id = "h_default", text = "I'm Nessa Shadowsong, and I sell fishing supplies here at the foot of Teldrassil. Most of what I catch goes up to Darnassus, and the best of it goes across the water to my friends in Auberdine." },
        { id = "h_mydrannul", tags = { "news" }, when = { questActive = TODO_QUEST("Nessa Shadowsong") },
          text = "Mydrannul sent you down from the Craftsmen's Terrace, didn't he? Bless him, he always finds me someone. I've a parcel of Teldrassil's best that needs to reach Auberdine." },
        { id = "h_back", when = { questDone = TODO_QUEST("Return to Nessa") },
          text = "You got my bounty all the way to Laird, and he sent back word that it arrived fresh. I owe you for that, and I won't forget it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior on the docks! Mind your armor near the edge, because nobody wants to fish you out." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll appreciate a good catch more than most, since you know what it took to land it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! I've seen your sort slip into the water as a seal and come up halfway to Auberdine, and you don't know how much I envy you on a cold morning." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock at Rut'theran! The fish won't bite with your servant leaning over the water, I promise you, so let it wait on the dock." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! I know every boat and every fisherman on this shore, and Auberdine across the water is like a second home to me." },
      },
      again = {
        { id = "h_again", text = "Anything else? The boats won't be in for a while yet." },
        { id = "h_again2", text = "Ask on, I've nothing but time and fish." },
      },
      choices = {
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "What do you send to Auberdine?", next = "bounty" },
        { text = "There must be good fishing off these docks.", next = "fishing" },
        { text = "What's Rut'theran like?", next = "village" },
        { text = "Smugglers would love a dock like this.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "There's a great power in this tree. I can feel it.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is there anything dangerous in the water off Rut'theran?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the village cats come begging at your dock?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What's troubling your friends in Auberdine, Nessa?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does anyone on the docks need help, Nessa?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the fish mind a druid swimming among them, Nessa?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why won't the fish bite near my servant?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the boats to Auberdine run safely, Nessa?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Nessa.", next = "END" },
      },
    },
    bounty = {
      lines = {
        { id = "bo_default", text = "Fish from Teldrassil's waters, packed to keep cold, and Vesprystus flies them over for me. Laird sells them in the inn at Auberdine, and the folk there swear they taste of home." },
      },
      choices = {
        { text = "Who is Laird?", next = "bounty2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bounty2 = {
      lines = {
        { id = "bo2_default", text = "A fishmonger in Auberdine, and an old friend. We've traded across the water since Auberdine was little more than a dock, and we argue about whose catch is better every season." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fishing = {
      lines = {
        { id = "fi_default", text = "Right off the docks here, for a start, and the lake in the middle of Teldrassil when you're better at it. Androl Oakhand trains anglers just down the shore, and he'll tell you the same, only more slowly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    village = {
      lines = {
        { id = "vi_default", text = "It's the door to Teldrassil. Everyone arriving by boat from Auberdine comes through here, humans and dwarves and gnomes who've never seen a tree this big, and I love watching their faces." },
        { id = "vi_human", when = { race = { "Human", "Dwarf", "Gnome" } },
          text = "You must have made that same face when you first stepped off the boat. Everyone does, and I'm never tired of it." },
      },
      choices = {
        { text = "So many outsiders. Does that worry anyone?", next = "village2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village2 = {
      lines = {
        { id = "vi2_default", text = "Some of the older folk up in Darnassus grumble about it, but not down here. Down here, newcomers buy bait and tell stories, and I'd rather have a busy dock than a quiet one." },
      },
      choices = {
        { text = "The Alliance makes us stronger. Welcome them.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Our people should be careful who they let in.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    teldrassil = { { id = "tp_teld", text = "From down here at the roots you can't even see the top. I've never minded; the sea is more interesting." } },
    background = { { id = "tp_bg", text = "I sell fishing supplies in Rut'theran. I've traded with Auberdine for longer than I can remember." } },
    advice = { { id = "tp_ad", text = "Bring bait you're willing to lose. The fish here are smarter than they look." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is a goblin port on the far side of the world where every fishing boat is a pirate ship on its days off. I'd love to fish there once, and I'd keep my coin in my boot." } },
    theramore = { { id = "tp_theramore", text = "Theramore's fishermen come up the coast now and then, and they swear their marsh fish are the best in Kalimdor. I've tasted them, and they're wrong, but I let them talk." } },
    blackfathom = { { id = "tp_blackfathom", text = "Blackfathom's waters were lovely fishing once, before the temple and the cultists. Now nothing I'd want to eat comes out of there." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's a goblin port on the Barrens coast, and its fishing contests are rowdy and very well paid. Laird went once and came home with a sunburn and no prize." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask me about fish, though, and I'll talk until the boat leaves." } },
  },
}

-- Androl Oakhand: fishing trainer in Rut'theran Village.
P:NPC {
  key = "androl", id = TODO_NPC("Androl Oakhand"), name = "Androl Oakhand", title = "Fishing Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "rutheran" }, temper = { "slow", "content" }, values = { "patience", "simplicity" },
  notices = { "craft" },
  impression = {
    first = "Androl Oakhand teaches fishing on the shore at Rut'theran and does everything slowly, talking included. It is oddly restful to stand beside him.",
    third = "{name} met Androl Oakhand, the slow and patient fishing trainer of Rut'theran Village.",
  },

  greetings = {
    { id = "g_default", text = "Sit down if you like. The fish aren't in any hurry, so neither am I." },
    { id = "g_back", when = { metBefore = true }, text = "Back by the water again, I see. Good, the water missed you." },
  },

  notice = {
    { id = "n_skill", cat = "craft", when = { profession = { name = "Fishing", min = 150 } },
      text = "You've learned all I have to teach already, I think. There's an old fisherman in Booty Bay with a book that goes further, if you've the patience to sail that far." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It is the secret of everything, because the fish come to the patient. Your spirits must know that already." } },
      choices = {
        { text = "Patience is wisdom, Androl.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Patience wastes time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Near enough, I think, because both are mostly waiting and trusting that something will answer. The priestesses might call that blasphemy, but I've seen one or two of them down here with a line in the water all the same." } },
      choices = {
        { text = "Faith and patience are close cousins, I think.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer and fishing are both just waiting for luck.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That you can't force everything, I suppose, because the fish come when they come and no oath will hurry them. A paladin who learns to wait might find it useful the next time a fight can be won without fighting." } },
      choices = {
        { text = "Waiting is a discipline too, and I'll learn it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather act than wait for the world to move.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That the fight comes when it comes and not before, however hard you stare at the water. Warriors who learn to wait here tend to wait better on the field, and they don't go charging at shadows." } },
      choices = {
        { text = "I'll learn to wait. Patience wins fights.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather make the fight come to me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Much the same, except that the fish can't see you coming and you can't see them either, so you're both guessing. It's the guessing I like, because it gives a fellow time to think." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Much the same, except that the fish can't see you coming and you can't see them, so you're both guessing. Your {pet} knows about waiting too, I see, because it hasn't taken its eyes off the water." },
      },
      choices = {
        { text = "Patience is the heart of any hunt.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather chase my quarry than wait for it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then you'll take to fishing well, for the other half of mine is knowing when to strike, and I'd guess that's the other half of yours. The difference is that my quarry doesn't bleed on the dock." },
      },
      choices = {
        { text = "Teach me the patient way, then.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather get it over with quickly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "There must be some secret to it.", next = "secret" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "You could, and every fish in it would die, and you would have nothing to eat next spring. That is the kind of thinking my people paid for once, and we don't care to pay for it again." },
      },
      choices = {
        { text = "A fair point. I'll use a rod.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "There are plenty of fish. The lake would recover.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why fish, rather than hunt?", next = "why" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Very much, though you wait on the forest and I wait on the fish, and the fish are less likely to bite back. Sit by me a while and you'll find the tide teaches the same thing the trees do, only slower." } },
      choices = {
        { text = "Patience is the only way the wild ever answers.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sometimes waiting is just a fine name for doing nothing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I couldn't say, and I wouldn't guess, because a man who fishes long enough learns not to guess what's under the water. I'll only say that patience serves you better here than any pact, so set the line and wait." },
      },
      choices = {
        { text = "Patience it is. I'll learn your way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A pact is quicker than patience, Androl.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Sit down if you like, because fishing's the nearest thing to prayer I know, and nobody has to say a word." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You've the look of someone who doesn't sit still often, so I'll warn you now that my lessons go slowly." },
        { id = "h_default", text = "I'm Androl Oakhand, and I teach fishing here at the foot of Teldrassil. It's the most patient trade there is, and I've had a few centuries to practice it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Sit down, put the sword aside and hold this pole, and see whether you can stand to wait." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll know about waiting already, I expect, so we'll get along." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Patience is the heart of fishing, and I'm told the Circle can sleep for years, so you may be the only students who find my lessons too short." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. You'll have to be patient to learn fishing, and I've found your kind usually are, if only because you're waiting for something." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I do everything slowly, fishing and talking alike, as my people always have, and your spirits might enjoy the pace." },
      },
      again = {
        { id = "h_again", text = "Another question? The fish are patient, and so am I." },
        { id = "h_again2", text = "Ask on. The line's still slack." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "What's the secret of fishing?", next = "secret" },
        { text = "Why fish, when you could hunt?", next = "why" },
        { text = "Patience is half my trade too.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could just freeze the lake and pick them out.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What can fishing teach a warrior, Androl?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is fishing much like the hunt, Androl?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is fishing really so much like prayer, Androl?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What could fishing teach a paladin, Androl?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is fishing much like a druid's patience, Androl?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do you think warlocks are waiting for, Androl?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Is slowness the secret of fishing, Androl?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Androl.", next = "END" },
      },
    },
    secret = {
      lines = {
        { id = "se_default", text = "Waiting, and not minding that you're waiting. Most people stare at the float until their eyes hurt, but if you watch the water instead, you'll know before the float does." },
      },
      choices = {
        { text = "That sounds like a lot of doing nothing.", next = "secret2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret2 = {
      lines = {
        { id = "se2_default", text = "It is, and that's the best part. Our people waited ten thousand years in these forests, and a few minutes on a dock won't hurt you." },
      },
      choices = {
        { text = "Patience is a virtue. I'll learn it.", next = "BACK", fx = { align = { order = 1 }, trait = { patient = 1 } } },
        { text = "Life's too short to sit and wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Because the fish don't mind as much, or at least they don't complain. And Nessa buys everything I catch, which is more than the hunters can say for their kills." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I teach fishing at Rut'theran. I've sat on this dock since the first boats came over from Auberdine." } },
    advice = { { id = "tp_ad", text = "Fish in the morning, when the water's still. And don't talk; the fish can hear you." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay has a fishing contest that the whole world comes to, I hear, and the goblins take a cut of every catch. I'll sit on my quiet dock and keep my fish." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's goblins pay for good fish, and they pay quickly. That's more than I can say for anyone in Auberdine." } },
    blackfathom = { { id = "tp_blackfathom", text = "The deep water off Ashenvale had the best fishing on the coast once. Now the naga fish there, and they don't share." } },
    _none = { { id = "tp_none", text = "I don't know about that. I know a fair bit about fish, though, if that helps." } },
  },
}
