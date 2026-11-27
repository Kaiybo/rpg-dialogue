-- The Tower of Azora's upper floors: Dawn Brightstar's arcane goods and Kitta Firewind,
-- who teaches enchanting. Voice: bibles/azora.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC = P.TODO_NPC

-- Dawn Brightstar: arcane goods on the tower's top floor.
P:NPC {
  key = "dawn", id = TODO_NPC("Dawn Brightstar"), name = "Dawn Brightstar", title = "Arcane Goods",
  bible = "bibles/azora.md", role = "vendor", tier = "service",
  communities = {}, temper = { "brisk" }, values = { "order", "curious" },
  notices = { "class", "lock_stones" },
  impression = {
    first = "She speaks of Theocritus with equal respect and exasperation.",
    third = "{name} met Dawn Brightstar, who sells arcane goods at the top of the Tower of Azora.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you, and worth the climb as always. I've kept the steadier reagents on the near shelf, where you can reach them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since it's my trade, but keep your hands off anything that hums. I've heard how you treat other people's things." },
    { id = "g_default", text = "Vials and scrolls, every one of them labelled, so please don't touch anything that's humming." },
    { id = "g_back", when = { metBefore = true }, text = "Back up all those stairs again? You must want something rather badly." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! You'll forgive me for watching your hands, since the last student who visited set a scroll alight just by reading it too eagerly." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Hm, there's a smell of brimstone about you. Master Theocritus has strong feelings about that sort of magic, so I'd keep it quiet on this floor." },
    { id = "n_lock_firestone", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "Is that a firestone in your pack? It's warming the counter right through the canvas, and my master would want to know who taught you to make one, so perhaps don't set it down where he can see." },
  },
  start = "hello",
  nodes = {
    da_rune = {
      lines = { { id = "dar_default", text = "A few, for the Master's own use, and I'm afraid he counts them every evening. If you're stuck out here without one, the reagent sellers in the Mage Quarter keep a good stock, and it's a pleasant walk through Elwynn if you don't mind the gnolls." } },
      choices = { { text = "Something else, Dawn.", next = "BACK" } },
    },
    da_teach = {
      big = true,
      lines = { { id = "dat_default", text = "Not on purpose, though he's taught me more than he knows by shouting at me about it. If you want to learn from him, ask him something he doesn't know the answer to, and then stand very still while he works it out aloud." } },
      choices = {
        { text = "A reagent seller should label every vial truthfully.", next = "BACK", reply = "Every vial, every scroll, every time. A mislabelled reagent can take a novice's hand off.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell the cloudy vials to novices; they won't know the difference.", next = "BACK", reply = "They'd learn the difference rather violently. Not from my shelves, they won't.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "A proper teacher would be patient with his students.", next = "BACK", reply = "He would, and he isn't, and I've made my peace with it. The gnomes haven't, quite.", fx = { align = { order = 1 } } },
        { text = "I'll provoke him into teaching me, then.", next = "BACK", reply = "Then bring a cushion for the stairs, because you'll be thrown down them at least once before it works.", fx = { align = { order = -1 } } },
        { text = "Something else, Dawn.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Theocritus would call it superstition with lightning attached, I expect. I keep my opinion on the shelf with the scrolls, tidy and out of reach." } },
      choices = {
        { text = "Keep your shelves tidy, Dawn. Order serves everyone here.", next = "BACK", reply = "Thank you, I try, though Master Theocritus moves things about to test me. Order is the one spell I'm truly good at.", fx = { align = { order = 1 } } },
        { text = "Let the mages scoff. My lightning answers when theirs fizzles.", next = "BACK", reply = "I'll not argue, and I'll not tell him you said so either. Some things are best left on the shelf.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More than I'd like, though most of it's the apprentices borrowing and forgetting. Theocritus is certain it's thieves from Jerod's Landing, and I haven't the heart to tell him his own students are the culprits." } },
      choices = {
        { text = "Tell him the truth, Dawn. He ought to know.", next = "BACK", reply = "I know he ought to, and one day I'll find the nerve. Until then I'll just count the scrolls twice.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let him blame strangers. It keeps the peace.", next = "BACK", reply = "That's what I've been doing, and it seems to work, mostly. The apprentices owe me more than they know.", fx = { align = { honor = -1 } } },
        { text = "Something else, Dawn.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Silverleaf and peacebloom, mostly, which the gnomes gather by the lake and bring up in sacks. Master Theocritus says plants are only magic that hasn't learned to sit still, and I've never had the courage to tell him how that sounds." } },
      choices = {
        { text = "Gathered with care and sorted well, they serve everyone who climbs here.", next = "BACK", reply = "That's kindly put, and I'll tell the gnomes you said so. They'll be very pleased with themselves.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Plants needn't sit still for anyone. They grow as they will.", next = "BACK", reply = "They do, don't they, and I rather like that about them. Don't tell Master Theocritus I said so.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Scrolls, mostly: a little strength or stamina, written into the page and spent in one breath. They're for the moment a gnoll has you pinned, not for showing off at the inn." } },
      choices = {
        { text = "I'll keep one for the hard moment and fight fair until then.", next = "BACK", reply = "That's the wise way, and the scrolls will last longer for it. Mind the gnolls on the road.", fx = { align = { order = 1 } } },
        { text = "I'll read every one I can afford before a fight.", next = "BACK", reply = "Then you'll be very strong for a very short time, and very poor after. I'll sell them to you all the same.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Scrolls of agility, mostly, and the odd flask for a long night in the hills. Hunters who come up here usually want something for the eye and the hand, and they never stay long enough to sit." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Scrolls of agility, mostly, and the odd flask for a long night in the hills. Your {pet} is sniffing at the reagent shelf, though, and some of those powders make a nose very unhappy." },
      },
      choices = {
        { text = "A steady hand matters more than any scroll, I think.", next = "BACK", reply = "It does, and you'd be surprised how few hunters know it. Still, the scroll's here if you want it.", fx = { align = { honor = 1 } } },
        { text = "Any edge in a hunt is worth buying, scroll or not.", next = "BACK", reply = "Then I'll sell you one of each, and gladly. Just don't tell my master I'm encouraging you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because Morganth was a sorcerer of your sort once, and he's camped across the river in Redridge wanting this tower for his own. My master looks at anyone who smells of brimstone and sees Morganth, which isn't fair to you, though I can't say it's unwise of him." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because Morganth was a sorcerer of your sort once, and he's camped across the river in Redridge wanting this tower for his own. If my master came down and saw that thing watching me from your heel, he'd not stop to ask whether you were any different, so perhaps keep it away from the windows." },
      },
      choices = {
        { text = "He's right to be careful. I'd never bargain the way Morganth did.", next = "BACK", reply = "I'm glad to hear it, and I'll tell him you said so. He'll not believe me, but I'll tell him.", fx = { align = { light = 1 } } },
        { text = "Morganth's only crime was losing. Power goes to those who take it.", next = "BACK", reply = "That's exactly what Morganth would say, I'm afraid. I think you'd best go before my master comes down.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not where Master Theocritus can hear, though I keep a little shelf of prayer books he pretends not to see. The gnomes say a word over their soup some nights, and I've caught myself listening, which surprised me more than it would you." } },
      choices = {
        { text = "Faith and learning belong under the same roof, Dawn.", next = "BACK", reply = "They do, I think, though I'd not say it too loud in this tower. Thank you for saying it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer won't keep a tower standing. Wards will.", next = "BACK", reply = "Wards do the heavy work, but I think the prayers keep the gnomes from going mad. That's worth something too.", fx = { align = { light = -1 } } },
        { text = "Something else, Dawn.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More than Master Theocritus would ever admit, because Morganth's gnolls have been creeping about Redridge, and books don't stop spears. He calls your order 'the hammer school', but he says it the way you'd speak of weather you can't argue with." } },
      choices = {
        { text = "I'll stand between his books and those gnolls gladly.", next = "BACK", reply = "That's kind of you, and he'd be grateful, though he'd never say so. Mind the stairs.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "His wards can stand without me. I'm nobody's doorman.", next = "BACK", reply = "Fair enough, and I'll not press you. He'd say the same about himself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, up all those stairs in plate! Sit down a moment, because Theocritus won't offer you a chair, and I won't tell him I did." },
        { id = "h_default", text = "I'm Dawn Brightstar, and I keep the tower's stores and sell what we can spare to whoever climbs this far, which is mostly alchemists after empty vials and travellers after a scroll to see them home." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "Oh, a gnome who isn't carrying a tray! Forgive me; the tower's servants are your people, and I forget there are gnomes who aren't sweeping our stairs." },
        { id = "h_priest", when = { class = "PRIEST" }, text = "A priest, up here among the scrolls? We don't get many of the Cathedral's people, though Master Theocritus would say the Light and the arcane are cousins who don't speak." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've the smell of a cellar about you, and I don't mean the inn's ale. Theocritus won't want you near his books, so let's keep our business to the counter." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, all the way up our stairs in all that steel! Sit a moment, because Theocritus keeps the windows shut and the climb is warmer than it looks." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter in the tower! Mind the gnomes on the stairs, please, because they startle, and your beast startles them." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A kaldorei, all the way up the tower stairs! Mind the shelves, because Master Theocritus counts the vials and he gets very cross when he has to count them twice." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue, all the way up the tower stairs. Do mind the shelves, because Theocritus counts the vials and blames me for every one that goes missing." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, up all these stairs? Mind the shelves, please, and keep your spirits from rearranging anything. Theocritus notices everything except the dust on his own desk." },
      },
      again = {
        { id = "h_again", text = "What else can I help you with? I've a delivery list to finish." },
        { id = "h_again2", text = "Ask, please, because it's very quiet up here most days." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Working for Theocritus must be quiet.", next = "theo" },
        { text = "Who are the gnomes in the tower?", next = "gnomes" },
        { text = "What sells best?", next = "sales" },
        { text = "I'm a mage. What would you recommend?", next = "mage", when = { class = "MAGE" } },
        { text = "Why does Theocritus watch me like I'm a threat to his tower?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I doubt a mage's tower holds much for a warrior.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do hunters buy from a tower like this?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Nobody in this tower seems the praying sort, Dawn.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does a mage's tower want with a paladin, Dawn?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does anything on your shelves come from the forest below?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'd wager things go missing from the tower stores, Dawn.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the mages here think shamans are real spellcasters, Dawn?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Do you keep runes of teleportation up here?", next = "da_rune", when = { class = "MAGE", minLevel = 20 } },
        { text = "Does Theocritus ever teach anyone, Dawn?", next = "da_teach", when = { class = "MAGE" } },
        { text = "Good day, Dawn.", next = "END" },
      },
    },
    theo = {
      lines = { { id = "t_default", text = "Quiet, until it isn't. He spends whole days at the top of the tower without speaking, and then he wants six things fetched from Stormwind by supper because he's thought of a new way to watch Morganth." } },
      choices = {
        { text = "Who is Morganth?", next = "theo_morganth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theo_morganth = {
      big = true,
      lines = { { id = "tm_default", fx = { learn = { "morganth" } }, text = "A mage who studied in Stormwind and was cast out for meddling with shadow. He sits in a tower in Redridge now, commanding gnolls, and Master Theocritus has made watching him his life's work." } },
      choices = {
        { text = "Watching isn't enough. Someone should end him.", next = "BACK", reply = "Master Theocritus would like that, though he'd never say it aloud. Morganth's tower is across the river in Redridge.", fx = { align = { order = -1 } } },
        { text = "Patience is wiser than charging into a mage's tower.", next = "BACK", reply = "That's what my master says, and he's been patient a long while. I sometimes wonder if he's waiting for someone else to do it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes = {
      lines = { { id = "gn_default", text = "The Servants of Azora, he calls them. They came to him after Gnomeregan fell, and they cook, clean and carry in exchange for a roof and a quiet place to tinker, and I'd be lost without them." } },
      choices = {
        { text = "They seem content enough here.", next = "gnomes_happy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomes_happy = {
      lines = { { id = "gh_default", text = "Most days, though they grumble about the stairs in their own tongue when they think I don't understand. I've learned enough of it to know they're not wrong." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },
    sales = {
      lines = { { id = "s_default", text = "Empty vials, by far. Every alchemist between here and Goldshire runs out of glass sooner than herbs, and Alchemist Mallory by the city gates sends for a crate nearly every month." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "m_default", text = "Buy scrolls you understand before scrolls you admire, and carry a spare vial for water you can trust. Kitta Firewind, who teaches enchanting downstairs, will tell you the same, though she'll take longer about it." } },
      choices = {
        { text = "Practical advice. Thank you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept accounts for a scribe in the Mage Quarter until Master Theocritus needed someone who could count and climb stairs." } },
    advice = { { id = "tp_ad", text = "Label everything, friend. An unlabelled vial is how apprentices end up with purple hair." } },
    morganth = { { id = "tp_morganth", text = "I've never seen him and I hope I never shall. Master Theocritus speaks of him the way sailors speak of storms.", next = "theo_morganth" } },
    _none = { { id = "tp_none", text = "That isn't in any of my ledgers, I'm afraid, so I couldn't tell you." } },
    dalaran = { { id = "tp_dalaran", text = "Master Theocritus says Dalaran is rebuilding behind its walls and opens its gates to almost nobody, so I've stopped asking if I may visit. I'd settle for a look at their library's catalogue." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "I kept accounts for a scribe who copied scrolls for the Kirin Tor, and they ordered everything in triplicate, signed in violet ink, and paid late. That tells a clerk most of what she needs to know about them." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Silas Darkmoon's people bought half my glowing vials the last time the Faire came through, and I still don't want to know what for. They paid in full, which is more than some mages manage." } },
    scourge = { { id = "tp_scourge", text = "I've sold vials to mages heading north, and fewer of them come back to buy more. Master Theocritus won't discuss it, which I've learned means it's worse than anyone says." } },
  },
}

-- Kitta Firewind: enchanting trainer on the tower's upper floor.
P:NPC {
  key = "kitta", id = TODO_NPC("Kitta Firewind"), name = "Kitta Firewind", title = "Enchanting Trainer",
  bible = "bibles/azora.md", role = "trainer", tier = "service",
  communities = {}, temper = { "eager" }, values = { "craft", "curious" },
  notices = { "class", "lock_shards" },
  impression = {
    first = "Whatever the city's mages think of her craft, she plainly loves it.",
    third = "{name} met Kitta Firewind, who teaches enchanting in the Tower of Azora.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back! Come and show me your rods; I want to see whether the runes have settled." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Speak your business. I'll teach you, but I've no wish to share my workbench with you today." },
    { id = "g_default", text = "Oh, a visitor! What brings you all the way up the tower?" },
    { id = "g_back", when = { metBefore = true }, text = "You came back, and I can tell you've been practising, haven't you?" },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You're a mage, so you already feel the magic in things, don't you? Enchanting is only teaching it to stay where you put it, which is harder than it sounds." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "Those shards in your bag are humming at the same pitch as my rods, and it's setting my teeth on edge. A soul makes a dreadful reagent, I'm told, though nobody in Dalaran would ever tell me how they knew." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Maybe, maybe not, I'd need to test it a hundred times! The mages say enchanting's a lesser craft, and they'd say the same of yours, so we'd be good company." } },
      choices = {
        { text = "An enchantment's worth comes from patient study, not shortcuts.", next = "BACK", reply = "Yes, exactly! A hundred tests, then a hundred more, and only then do you trust it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Why study runes when you can copy someone else's work?", next = "BACK", reply = "Because a copied rune fails the moment you need it most, and usually loudly.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Test it properly, Kitta. Careful work outlasts guesses.", next = "BACK", reply = "Ha, you sound like Theocritus! I'll test it, I promise, at least fifty times.", fx = { align = { order = 1 } } },
        { text = "Forget the tests. Try it and see what happens.", next = "BACK", reply = "That's how I learned most of what I know, and how I lost an eyebrow. I like you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It would, and I'd rather teach you to put one there yourself, because a rogue who knows how an enchantment's made can spot a fake one. Most of the enchanted daggers sold in Stormwind's back alleys are plain steel with a bit of glitter, and the buyers never know until it matters." } },
      choices = {
        { text = "Then I'll learn the craft properly.", next = "BACK", reply = "Wonderful, because the world needs fewer glitter daggers. Come back with some dust and we'll start.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Glitter daggers sound like a fine business to me.", next = "BACK", reply = "It is, and that's exactly why I'll not teach you to make one. Learn the real thing first.", fx = { align = { order = -1 } } },
        { text = "Something else, Kitta.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because a blade holds an enchantment for years, and I've always wondered how long a living oak might hold one. Theocritus says the tree would have something to say about it, and I suppose you'd know better than either of us whether it would mind." } },
      choices = {
        { text = "It would mind. Living things aren't yours to inscribe, Kitta.", next = "BACK", reply = "You're probably right, and I'd not want to hurt it. I'll stick to blades.", fx = { align = { honor = 1 } } },
        { text = "If the tree takes no harm, I see no reason not to try.", next = "BACK", reply = "That's just what I hoped you'd say! I'll try it on a little sapling first, gently.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It can, with the right dust and a steady hand! Though I'll tell you what I tell every warrior: an enchantment can't swing the blade for you, and the gnolls won't wait while you admire the glow." } },
      choices = {
        { text = "Then I'll train the arm first and enchant the blade after.", next = "BACK", reply = "That's the right order, and you'll be glad of it. Come back when your arm's ready.", fx = { align = { order = 1 } } },
        { text = "I'll take every glow I can buy, and let the arm catch up.", next = "BACK", reply = "Your arm will thank you less than your purse, I'm afraid. I'll sell you the dust all the same.", fx = { align = { order = -1 } } },
        { text = "Something else, Kitta.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh, all sorts, a sharper eye or a steadier string, though Theocritus says I'm too eager to try things on other people's weapons. Bring me one someday and we'll find out together." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, all sorts, a sharper eye or a steadier string, so bring me a bow someday and we'll find out together. And your {pet}! I wonder whether a collar could take an enchantment, though I suspect it would rather you didn't try." },
      },
      choices = {
        { text = "I'll trust my own aim before any enchantment.", next = "BACK", reply = "Then you're a better hunter than most who come up here. Come back if you change your mind.", fx = { align = { order = 1 } } },
        { text = "If it makes the shot surer, enchant whatever you like.", next = "BACK", reply = "Wonderful, I've been dying to try one on a bow! Bring it up whenever you like.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Every mage should at least try, because a spell lasts a moment but an enchantment lasts as long as the blade does. Theocritus says it's a craft for people who can't hold their concentration, which I think is exactly why he's never managed it." } },
      choices = {
        { text = "A disciplined mage should master the patient crafts too.", next = "BACK", reply = "That's what I've always said, and it's lovely to hear a mage agree. You'll make a fine enchanter.", fx = { align = { order = 1 } } },
        { text = "Spells are for living in the moment. Leave the runes to crafters.", next = "BACK", reply = "That's what Theocritus says too, and he's wrong as well. Come back when you're bored of moments.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It doesn't ruin the craft, but it changes it, and what it changes it into isn't anything the Kirin Tor would put their name to. I've seen a sword enchanted with something from your side of the line, and it hummed at night like it was hungry." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It doesn't ruin the craft, but it changes it, and what it changes it into isn't anything the Kirin Tor would put their name to. Your {pet} has been staring at my rods since you walked in, and I'd swear the runes on them have gone a shade dimmer." },
      },
      choices = {
        { text = "Then I'll keep what I carry well away from your bench.", next = "BACK", reply = "Thank you, I'd be grateful, and so would the dust. It sulks for days after.", fx = { align = { light = 1 } } },
        { text = "A hungry blade sounds like a better blade to me.", next = "BACK", reply = "It's better at eating its owner, I'd wager. I'll not be enchanting it for you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I've tried, again and again, and the dust goes dull every time, as though it knows it's being asked for something it can't give. Whatever you pray to, the Light or Elune, it seems to want to be asked by a person and not a rune, which I find rather lovely when I'm not finding it maddening." } },
      choices = {
        { text = "Some things should only come from the heart, not the dust.", next = "BACK", reply = "That's lovely, and I think you're right, though I'll keep trying anyway. It's the not knowing that maddens me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then nobody understands blessings yet. Keep trying, Kitta.", next = "BACK", reply = "Thank you, and I will, if only because it annoys Theocritus. One day I'll crack it.", fx = { align = { light = -1 } } },
        { text = "Something else, Kitta.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "In a heartbeat, though I'd want you to tell me what it's for first, because a rune for smiting and a rune for showing off look very much alike to the dust. A noble's son once asked me for a glowing sword to wear to a wedding, and I said no, which is the proudest thing I've done all year." } },
      choices = {
        { text = "It would be for the wicked only. You have my word.", next = "BACK", reply = "Then I'll make you the finest rune I can manage. Come back when you've the dust.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A glowing hammer cows a crowd. That's worth something too.", next = "BACK", reply = "It might, but that's what the noble's son said too. I'll not make one for show.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Have you ever wondered whether a blessing and an enchantment are really so different? I have, constantly, and nobody up here will discuss it with me." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I'd give a week's dust to enchant a hammer like yours, though I suspect it's already got something in it that I couldn't improve." },
        { id = "h_default", text = "I'm Kitta Firewind, and I teach enchanting, which is the finest craft there is, whatever the blacksmiths say. If you've come to learn, you've climbed to exactly the right floor." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "A night elf! Your people never did care for our sort of magic, did they? I'd love to know what you think of it, even if you think it's dreadful." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "A warrior! You'll want your sword to cut a little deeper, I expect, and that's where an enchanter comes in, so you'll be glad you climbed the stairs." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and a young one! Enchanting comes easiest to your sort, because you already know what a rune wants before you've drawn it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I'd ask that you keep whatever's in that satchel away from my dust, because a spark in the wrong pouch costs me a week of work." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I've always wanted to try enchanting a bow, and nobody ever brings me one, so you're very welcome." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Oh, a druid! Do you know nobody in this tower has ever let me enchant anything that grows? I've asked, and I've been told no very firmly." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! You'd be surprised how many of your sort climb up here to ask about enchanting, and how few of them want to learn it properly." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Oh, a shaman! Can your spirits feel enchantments? I've always wondered whether a rune hums to anyone but the person who wrote it." },
      },
      again = {
        { id = "h_again", text = "What else? I could talk about this all afternoon, and I usually do." },
        { id = "h_again2", text = "Go on, ask me anything. Well, anything about enchanting." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "How does enchanting actually work?", next = "how" },
        { text = "Why teach in this tower?", next = "tower" },
        { text = "Where do I get the materials?", next = "dust" },
        { text = "The arcane seems a dangerous thing to toy with.", next = "danger" },
        { text = "Should every mage learn enchanting, Kitta?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does a darker sort of power ruin an enchantment, Azora?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Could an enchantment really make my sword cut deeper?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What would an enchanter do to a hunter's bow?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Could an enchanter's rune ever hold a blessing, Kitta?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "You'd enjoy enchanting a paladin's hammer, I'd wager.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why would you want to enchant a living thing?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "An enchantment would help a rogue's blades, I'd think.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think spirits could help with enchanting, Kitta?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll come back another time.", next = "END" },
      },
    },
    how = {
      lines = { { id = "h2_default", text = "You take something that already holds a little magic, like a charmed ring or a staff, and you unmake it into dust. Then you bind that dust to something else with a runed rod, and if you've done it right, the magic stays." } },
      choices = {
        { text = "So you destroy one thing to improve another.", next = "how_destroy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_destroy = {
      lines = { { id = "hd_default", text = "I prefer to say we free the magic from something nobody wanted. That ugly green ring you pulled off a kobold has a far better life as an enchantment on your boots." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    tower = {
      lines = { { id = "t_default", text = "Because Master Theocritus lets me, and because it's quiet, and because the city's mages look down their noses at a craft that makes boots better. Up here nobody laughs at me for it." } },
      choices = {
        { text = "Do the city's mages really look down on it?", next = "tower_city" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tower_city = {
      lines = { { id = "tc_default", text = "Some of them do, the ones who think magic should only be for great works. I think a farmer's knife that never dulls is a great work, if you're the farmer." } },
      choices = {
        { text = "Magic should serve ordinary people.", next = "BACK", reply = "It should, and I'm glad someone else thinks so. The farmers deserve it most.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Some magic should stay with the trained few.", next = "BACK", reply = "Theocritus would agree with you, and I'll not argue it here. But I'll keep enchanting knives.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dust = {
      lines = { { id = "d_default", text = "From anything with a green or blue shimmer to it that you don't mean to keep. Bring me a few and I'll show you how to unmake them, and Dawn Brightstar upstairs sells the vials and odds and ends you'll want later." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "da_default", text = "Only when people are careless or greedy, and enchanters can't afford to be either. The ones who reach too far end up like that Morganth in Redridge, and Master Theocritus spends his days watching him for that very reason." } },
      choices = {
        { text = "What did Morganth do?", next = "danger_morganth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_morganth = {
      lines = { { id = "dm_default", fx = { learn = { "morganth" } }, text = "He studied shadow magic he'd been told to leave alone, and Stormwind cast him out for it. Now he's in an old tower in Redridge with gnolls doing his bidding, which is what happens when a mage stops listening to anyone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was apprenticed in Stormwind, but I spent more time unmaking my master's spare rings than learning his spells, so we agreed I'd be happier here." } },
    advice = { { id = "tp_ad", text = "Never unmake anything you might want back. I learned that one with my grandmother's brooch." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask me about runes instead!" } },
    dalaran = { { id = "tp_dalaran", text = "Every enchanter dreams of Dalaran's violet towers, and I'd give my best rod for one afternoon in their workshops. Still, they say it's half a ruin now and the mages rebuilding it don't want visitors." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor know runes I've only read about in footnotes. If you ever meet one, ask how they bind frost into a ring, and then come and tell me everything!" } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire sells a dozen trinkets that glow, and I spent my wages taking them apart to see why. Most of them were coloured glass and a very small spell, but one of them bit me." } },
  },
}
