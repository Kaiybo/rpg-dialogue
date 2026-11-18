-- Darnassus, folk we had missed: the two Argent Dawn agents on the Craftsmen's Terrace (Argent Guard
-- Manados, Dawnwatcher Shaedlass), Lotherias (leatherworking orders), Alegorn (cooking), Fylerian
-- Nightwing (druid trainer), Cylania (armorer), Shylenai (owls) and Talaelar (fish). Classic only.
-- Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Argent Guard Manados
---------------------------------------------------------------------------
P:NPC {
  key = "manados", id = TODO_NPC("Argent Guard Manados"), name = "Argent Guard Manados", title = "The Argent Dawn",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "darnassus" }, temper = { "stern", "steady" }, values = { "dutiful", "vigilance" },
  notices = { "class", "race" },

  impression = {
    first = "Argent Guard Manados keeps the Argent Dawn's watch from a quiet corner of the Craftsmen's Terrace and talks about Blackfathom Deeps as if it were a wound he can't stop pressing.",
    third = "{name} met Argent Guard Manados, who gathers fighters for the Argent Dawn against the Twilight's Hammer in Blackfathom Deeps.",
  },

  greetings = {
    { id = "g_hello", text = "The Argent Dawn has need of steady hands, and Darnassus has fewer to spare than it admits. Are yours steady?" },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Good, because the Hammer has not gone anywhere while you were away." },
    { id = "g_active", when = { questActive = TODO_QUEST("Twilight Falls") }, text = "Any pendants yet? Every one you bring me is one less cultist chanting in that drowned temple." },
    { id = "g_done", when = { questDone = TODO_QUEST("Twilight Falls") }, text = "Ashenvale owes you a quieter night, and so do I. Well fought." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin of the Silver Hand's line, here in Darnassus. The Dawn welcomes your Light, friend, whatever the Temple makes of it." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf on the Craftsmen's Terrace is no rare sight now, but a dwarf asking after the Argent Dawn is. Ironforge has given us some fine fighters." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Manados, a guard of the Argent Dawn. We watch for the things that would unmake this world, and lately the thing I watch is Blackfathom Deeps, where the Twilight's Hammer has found friends among the naga." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Twilight Falls") },
          text = "The cultists in Blackfathom wear twilight pendants as a mark of their faith. Bring me three, so the Dawn knows the Hammer is bleeding, and so do they." },
        { id = "h_done", when = { questDone = TODO_QUEST("Twilight Falls") },
          text = "Those pendants are already on their way north to our brothers and sisters, so they can learn what manner of foe this is. You have done the Dawn and Darnassus a service." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Speak plainly; I prefer it." },
        { id = "h_again2", text = "Go on. The Hammer will keep a moment longer." },
      },
      choices = {
        { text = "What is the Twilight's Hammer?", next = "hammer" },
        { text = "What happened to Blackfathom Deeps?", next = "temple" },
        { text = "The Argent Dawn seems a long way from home here.", next = "dawn" },
        { text = "Who is the Dawnwatcher beside you?", next = "shaedlass" },
        { text = "Did the pendants tell you anything?", next = "pendants", when = { questDone = TODO_QUEST("Twilight Falls") } },
        { text = "I'll keep my blade ready.", next = "END" },
      },
    },

    hammer = {
      lines = { { id = "ha_default", text = "A cult that worships the Old Gods, the dark powers that slept beneath the world before any of our peoples walked it. They would wake those powers again, and they care nothing for who drowns when they do." } },
      choices = {
        { text = "Why have they come to Ashenvale?", next = "hammer2" },
        { text = "Cults rise and fall. This one will too.", next = "hammer_doubt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammer2 = {
      lines = { { id = "ha2_default", text = "Because Blackfathom once held a moonwell of great power, and power is what they hunger for. We believe they have bargained with the naga for it, and I would very much like to know what the naga were promised in return." } },
      choices = {
        { text = "Then I'll go and break their bargain.", next = "BACK", reply = "Good. Bring proof of it and the Dawn will remember your name, and so will Darnassus.", fx = { align = { order = 1 } } },
        { text = "Let them squabble over the temple. It's ruins anyway.", next = "BACK", reply = "Ruins can still drown a forest, friend. I'd not leave anything the Old Gods want lying where they can reach it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammer_doubt = {
      lines = { { id = "hd_default", text = "This one has lasted longer than the kingdoms that tried to stamp it out, which is why I don't share your confidence. Still, I'd sooner be proven a worrier than proven right." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },

    temple = {
      lines = {
        { id = "te_default", text = "It was a temple to Elune long ago, on the coast of Ashenvale, before the sea and the Sundering swallowed it. Now its halls are flooded, and the naga have crept into them, and the Hammer chants in the dark where priestesses once sang." },
        { id = "te_nelf", when = { race = "NightElf" }, text = "You'll know the stories better than I'd like to tell them, since it was your people's temple. The priestesses of the Temple here do not speak of it if they can help it, and I understand why." },
      },
      choices = {
        { text = "Where do I find it?", next = "temple2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple2 = {
      lines = { { id = "t2_default", text = "On the western shore of Ashenvale, north of the Zoram Strand, where the water runs black under the old stones. Go with friends, because I have sent people alone before and not all of them came back to tell me what they saw." } },
      choices = {
        { text = "What about the Dawnwatcher's missing scout?", next = "shaedlass" },
        { text = "Something else.", next = "BACK" },
      },
    },

    dawn = {
      lines = { { id = "da_default", text = "The Argent Dawn was born in the north, against the Scourge, and most of our strength stands there still. But evil doesn't keep to one land, so some of us keep watch in places like this, where the Kaldorei would rather we didn't." } },
      choices = {
        { text = "Do the night elves resent you here?", next = "dawn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn2 = {
      lines = { { id = "d2_default", text = "Resent is too strong. The Sentinels have kept their own watch for ten thousand years and see no need of ours, but they let us stand on the Terrace, and they read our reports, and that is enough to work with." } },
      choices = {
        { text = "They should be grateful for the help.", next = "BACK", reply = "Perhaps, though gratitude is a poor thing to demand. I'll earn their trust or go without it.", fx = { align = { honor = 1 } } },
        { text = "Their land, their watch. You're guests.", next = "BACK", reply = "We are, and I try to remember it. A guest who forgets his place is soon shown the door.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shaedlass = {
      lines = { { id = "sh_default", text = "Dawnwatcher Shaedlass gathers word for the Dawn while I gather blades. He sent one of our guards, Thaelrid, into Blackfathom weeks ago and hasn't heard a word since, and he won't say how much it troubles him, so I'll say it for him." } },
      choices = { { text = "I'll speak with him. Something else.", next = "BACK" } },
    },

    pendants = {
      lines = { { id = "pe_default", text = "They tell us the cult is organised, well supplied and in no hurry to leave, which is worse news than I hoped for. But it tells us also that they can be hurt, and that you're the one who hurt them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I stand for the Argent Dawn on the Craftsmen's Terrace and send fighters south to Blackfathom. It's not glorious work, but it is necessary." } },
    argent_dawn = { { id = "tp_argent", text = "We are soldiers, priests and scholars of every race who agreed that the dark doesn't care which flag you fly. I have never found reason to doubt it." } },
    twilights_hammer = { { id = "tp_hammer", text = "Fanatics who serve the Old Gods. They are patient, and they are many, and they are in Blackfathom Deeps." } },
    blackfathom = { { id = "tp_bfd", text = "A drowned temple of Elune on Ashenvale's shore, full of naga and cultists now. Go armed and go together." } },
    _none = { { id = "tp_none", text = "I don't know, and I won't pretend to. Ask me about the Hammer instead, because that I know too well." } },
  },
}

---------------------------------------------------------------------------
-- Dawnwatcher Shaedlass
---------------------------------------------------------------------------
P:NPC {
  key = "shaedlass", id = TODO_NPC("Dawnwatcher Shaedlass"), name = "Dawnwatcher Shaedlass", title = "The Argent Dawn",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "male",
  communities = { "darnassus" }, temper = { "precise", "calm" }, values = { "careful", "knowledge" },
  notices = { "class", "race" },

  impression = {
    first = "Dawnwatcher Shaedlass collects rumours for the Argent Dawn and sorts them like a scholar sorting scrolls, calmly and precisely. Only when he speaks of his missing scout does the calm wear thin.",
    third = "{name} met Dawnwatcher Shaedlass, who gathers word for the Argent Dawn in Darnassus and fears for a scout lost in Blackfathom Deeps.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah. If you've news from Ashenvale, I would hear it, and if you've none, I may have work for you." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I have been reading the same three reports over and over, so any interruption is a kindness." },
    { id = "g_active", when = { questActive = TODO_QUEST("In Search of Thaelrid") }, text = "Have you found Thaelrid? No, you'd have said so at once. Go carefully, and go soon." },
    { id = "g_done", when = { questDone = TODO_QUEST("In Search of Thaelrid") }, text = "You found him. Elune be thanked, and thank you, too." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. The Dawn has many of your calling, and we could always use more who can mend what the darkness breaks." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "You're a long way from Lordaeron, though I suppose your people might say the same of the Dawn. We began in your old kingdom, you know." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Shaedlass, a Dawnwatcher of the Argent Dawn. My task here is to gather what is said about Ashenvale and the coasts, so that we know where help is needed before it is needed too late." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("In Search of Thaelrid") },
          text = "Thaelrid went into Blackfathom Deeps to watch the naga and the Twilight's Hammer, and he has not reported back in weeks. Find him and give him whatever aid he needs, because I can spare no one else." },
        { id = "h_done", when = { questDone = TODO_QUEST("In Search of Thaelrid") },
          text = "Thaelrid lives, and he says there is a wicked plot in that temple, which I had feared. Whatever he has asked of you, trust him; he has never been wrong about danger yet." },
      },
      again = {
        { id = "h_again", text = "What else? I have time, if not much of it." },
        { id = "h_again2", text = "Ask, and I'll answer as truly as my reports allow." },
      },
      choices = {
        { text = "Who is Thaelrid?", next = "thaelrid" },
        { text = "What rumours do you hear?", next = "rumours" },
        { text = "What does a Dawnwatcher do?", next = "watcher" },
        { text = "You look like you haven't slept.", next = "sleep" },
        { text = "What did Thaelrid find down there?", next = "found", when = { questDone = TODO_QUEST("In Search of Thaelrid") } },
        { text = "Farewell, Dawnwatcher.", next = "END" },
      },
    },

    thaelrid = {
      lines = { { id = "th_default", text = "An Argent Guard, and the best scout I have, which is why I sent him into Blackfathom alone. That was my decision, and every day without a report I like it a little less." } },
      choices = {
        { text = "He knew the risks when he went.", next = "thaelrid2" },
        { text = "Why not send a whole company after him?", next = "company" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thaelrid2 = {
      lines = { { id = "t2_default", text = "He did, and so did I, and that doesn't make the waiting any lighter. If you go, look for him in the deeper halls past the first pools, where the naga gather." } },
      choices = {
        { text = "A good commander carries that weight. You did right.", next = "BACK", reply = "Perhaps, though I'd carry it more easily if he were standing here. Thank you for saying so.", fx = { align = { order = 1 } } },
        { text = "Then you shouldn't have sent him alone.", next = "BACK", reply = "No, I shouldn't have, and I'll not make the same mistake twice. You're blunt, but you're not wrong.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    company = {
      lines = { { id = "co_default", text = "Because the Dawn's companies are in the north, fighting the Scourge in the Plaguelands, and my other scouts are on errands I can't call them back from. So it falls to whoever walks through that door, and today that is you." } },
      choices = {
        { text = "Then I'll go.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    rumours = {
      lines = {
        { id = "ru_default", text = "That the naga and the Twilight's Hammer share the old temple now, which troubles me more than either alone. That the Horde cut deeper into Ashenvale every season. And that the furbolgs of the forest are sickening, tribe by tribe, though no one will tell me why." },
      },
      choices = {
        { text = "The furbolgs are being corrupted. I've seen it.", next = "furbolgs" },
        { text = "Which of those worries you most?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    furbolgs = {
      lines = { { id = "fu_default", text = "Then you've seen more than most of my informants, and I'll write it down. A people falling to madness is the sort of thing the Dawn should notice before it becomes the sort of thing it must fight." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    worst = {
      lines = { { id = "wo_default", text = "The temple, because the Horde and the furbolgs are troubles we understand. A cult that serves the Old Gods, allied with the naga, is a trouble no one understands, and that is the kind that grows quietly until it is too large to stop." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    watcher = {
      lines = { { id = "wa_default", text = "I listen, I write, and I send what matters north to the Dawn's commanders. It sounds dull, and mostly it is, but one rumour in a hundred is the first warning of something terrible." } },
      choices = {
        { text = "So you're a spy.", next = "BACK", reply = "A spy listens to his enemies. I listen to everyone, which is a different thing, or so I tell myself.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sleep = {
      lines = { { id = "sl_default", text = "I haven't much, no. A watcher who sleeps soundly while one of his own is missing is not much of a watcher, though Manados tells me I'm no use to anyone exhausted." } },
      choices = { { text = "He's right. Something else.", next = "BACK" } },
    },

    found = {
      lines = { { id = "fo_default", text = "That the Hammer and the naga are working together in earnest, and that their leaders are deeper in the temple than he could reach. The Dawn will hear of it, and I hope you'll be one of those who go back for them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I gather news for the Argent Dawn from my corner of the Craftsmen's Terrace. Most of it is gossip, and some of it is not." } },
    argent_dawn = { { id = "tp_argent", text = "We keep watch against the Scourge and every darkness like it. I keep watch with ink and paper, mostly." } },
    blackfathom = { { id = "tp_bfd", text = "My scout Thaelrid went into Blackfathom Deeps and has not come out, and that tells me most of what I need to know about it." } },
    twilights_hammer = { { id = "tp_hammer", text = "A cult of the Old Gods, working with the naga in Blackfathom. Manados knows more of fighting them than I do." } },
    _none = { { id = "tp_none", text = "I have no report on that, and I'd rather say so than guess. Rumour is my trade, and I try not to add to it." } },
  },
}

---------------------------------------------------------------------------
-- Lotherias
---------------------------------------------------------------------------
P:NPC {
  key = "lotherias", id = TODO_NPC("Lotherias"), name = "Lotherias",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "female",
  communities = { "darnassus" }, temper = { "brisk", "warm" }, values = { "craft", "practical" },
  notices = { "craft", "class" },

  impression = {
    first = "Lotherias runs a leatherworker's bench on the Craftsmen's Terrace with more orders than hands. She judges a person by their stitching, and she says so.",
    third = "{name} met Lotherias, a leatherworker of Darnassus buried in orders for gloves, boots and cloaks.",
  },

  greetings = {
    { id = "g_hello", text = "Mind the hides, they're drying. Are you here to buy, to help or to stand in my light?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? I've three more orders since you left, so I hope you've brought hands." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker, by the calluses. Come here and let me see your stitching." },
    { id = "g_done", when = { questDone = TODO_QUEST("Moonglow Vest") }, text = "There's my vest-maker. Have you sewn one yet, or is the pattern still folded in your pack?" },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Embossed leather, if I'm any judge of the work on your belt. You're nearly ready for something better." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid in my workshop. Don't look at the hides like that; every one of them was taken properly, I promise you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Lotherias, and I make leather goods for those who go out into the wilds, which these days is half of Darnassus. Young adventurers are eager to test themselves, and every one of them needs gloves, boots and a cloak before they go." },
        { id = "h_lw", when = { profession = "Leatherworking" },
          text = "You work leather yourself, so you know how it is. If you can help me fill my orders, embossed gloves, boots and cloaks, I'll teach you a technique worth the trouble." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Moonglow Vest") },
          text = "One pair of embossed gloves, five pairs of boots and five cloaks. Bring them, and the Moonglow Vest is yours to learn." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I cut, if you don't mind." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
      },
      choices = {
        { text = "What's the Moonglow Vest?", next = "vest" },
        { text = "Who buys all this leather?", next = "buyers" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Your bench is a mess.", next = "mess" },
        { text = "I'll leave you to your orders.", next = "END" },
      },
    },

    vest = {
      lines = {
        { id = "ve_default", text = "A light vest, stitched so that it moves the way a body moves, with a pale finish that catches the moonlight. It's the first pattern I teach anyone who proves they can make plain goods well, because there's no use teaching fine work to clumsy hands." },
      },
      choices = {
        { text = "Why make me fill your orders first?", next = "orders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders = {
      lines = { { id = "or_default", text = "Because I need the orders filled, and because eleven pieces will tell me more about your hands than any talk could. If the eleventh is as good as the first, you're ready." } },
      choices = {
        { text = "Fair work for fair teaching. I'll do it.", next = "orders2" },
        { text = "So I do your work for free.", next = "orders2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders2 = {
      lines = { { id = "o2_default", text = "Call it what you like. Every master on this Terrace learned the same way, carrying someone else's orders until they'd earned their own." } },
      choices = {
        { text = "That's how a craft should pass down.", next = "BACK", reply = "It is, and it's how it'll pass to whoever you teach one day. Now, gloves first.", fx = { align = { order = 1 } } },
        { text = "A craft should be shared, not bargained for.", next = "BACK", reply = "A fine thought from someone who isn't behind on eleven orders. Bring the gloves anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    buyers = {
      lines = { { id = "bu_default", text = "Young Sentinels, hunters going down to Darkshore, and lately all manner of humans and dwarves who come up from Rut'theran in boots that wouldn't survive a week in Ashenvale. I don't mind; their coin is good, and their feet are grateful." } },
      choices = {
        { text = "Do the Sentinels buy from you?", next = "sentinels" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels = {
      lines = { { id = "se_default", text = "Their bracers and their boots, when the Warrior's Terrace can't keep up. A Sentinel will tell you exactly what's wrong with a boot in great detail, which is maddening and also very useful." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hides = {
      lines = { { id = "hi_default", text = "The hunters of Teldrassil bring me what they take, nightsaber and strider and the odd bear, and I ask them how it was taken. The druids watch us closely, and a hide taken wastefully is a hide I won't buy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    mess = {
      lines = { { id = "me_default", text = "It's an order, and I know where everything in it is. If you tidy it, I'll spend a week finding my awl, and then I'll come and find you." } },
      choices = { { text = "Noted. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Leather goods for the wild, made on the Craftsmen's Terrace. I've more orders than I can fill and I'm not complaining, much." } },
    advice = { { id = "tp_advice", text = "Buy boots before you need them. Nobody ever does, and I sell a great many boots to limping people." } },
    _none = { { id = "tp_none", text = "I couldn't say. I know hides and stitches, and that's about where my knowledge ends." } },
  },
}

---------------------------------------------------------------------------
-- Alegorn
---------------------------------------------------------------------------
P:NPC {
  key = "alegorn", id = TODO_NPC("Alegorn"), name = "Alegorn", title = "Cooking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "warm", "easygoing" }, values = { "hospitality", "patience" },
  notices = { "craft", "race" },

  impression = {
    first = "Alegorn teaches cooking on the Craftsmen's Terrace and talks about food the way the priestesses talk about the moon: patiently, and as if it were the most natural thing in the world.",
    third = "{name} met Alegorn, the cooking trainer of Darnassus, who believes a good meal settles most arguments.",
  },

  greetings = {
    { id = "g_hello", text = "Hungry, or here to learn? I can help with both, though the second takes longer." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you're back. Did the last recipe go well, or did the smoke give you away?" },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook! Come in, come in, there's always room at this fire for another." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Your people taught me there's no dish that can't be improved with a little more fat, and I've been arguing with that ever since." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You smell of woodsmoke and spice. Someone's been practising." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Alegorn, and I teach cooking to anyone who'll stand still long enough. It's a humble craft beside the swords and the spells, but nobody ever fought well on an empty stomach." },
        { id = "h_human", when = { race = "Human" },
          text = "I am Alegorn, and I teach cooking. Your people brought spices up from Stormwind I'd never tasted in ten thousand years, so I owe you a lesson or two at least." },
      },
      again = {
        { id = "h_again", text = "Anything else? The pot can wait a moment." },
        { id = "h_again2", text = "What else? Mind the fire." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS" },
        { text = "What do night elves cook?", next = "cuisine" },
        { text = "Who do you cook for?", next = "sentinels" },
        { text = "Cooking seems a small thing to teach.", next = "small" },
        { text = "Good day, Alegorn.", next = "END" },
      },
    },

    cuisine = {
      lines = { { id = "cu_default", text = "What the forest gives: moonberries, nightsaber steak if the hunters have been lucky, fish from the lake, and bread baked from the grain that grows by the moonwells. We don't fuss over it the way the humans do, though I'll admit their fussing has its merits." } },
      choices = {
        { text = "Simple food is the best food.", next = "BACK", reply = "Spoken like someone who's eaten in a great many camps. I'd agree, most days.", fx = { align = { order = 1 } } },
        { text = "Food should be an adventure. Try something new.", next = "BACK", reply = "Ha! Bring me something new, then, and we'll see whether it's an adventure or a disaster.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sentinels = {
      lines = { { id = "se_default", text = "The Sentinels on watch, mostly, when their own stores run short, and the students who come to learn, and anyone who looks as if they've forgotten to eat. You'd be surprised how many in this city forget." } },
      choices = {
        { text = "The Sentinels must be grateful.", next = "sentinels2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels2 = {
      lines = { { id = "s2_default", text = "They'd never say so, of course, but the bowls come back empty, which is all the thanks a cook needs. A Sentinel who has eaten well is a Sentinel who doesn't fall asleep on the wall at dawn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    small = {
      lines = { { id = "sm_default", text = "Small, perhaps, but you'll use it every day of your life, which is more than I can say for most of what they teach on the Warrior's Terrace. And a good meal has ended more quarrels than any blade I know of." } },
      choices = { { text = "I'll take your word for it.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I teach cooking on the Craftsmen's Terrace and feed whoever wanders by hungry. It's good work, and it smells better than most." } },
    advice = { { id = "tp_advice", text = "Eat before you go out into the wilds, not after. Wounds close faster on a full stomach, whatever the priestesses say." } },
    _none = { { id = "tp_none", text = "I wouldn't know about that. Ask me how to roast a boar, and then I'm your elf." } },
  },
}

---------------------------------------------------------------------------
-- Fylerian Nightwing
---------------------------------------------------------------------------
P:NPC {
  key = "fylerian", id = TODO_NPC("Fylerian Nightwing"), name = "Fylerian Nightwing", title = "Druid Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "calm", "patient" }, values = { "nature", "balance" },
  notices = { "class", "form" },

  impression = {
    first = "Fylerian Nightwing teaches druids in the Cenarion Enclave, slowly and without raising his voice, as if he had all the time in the world, which as a druid he very nearly does.",
    third = "{name} met Fylerian Nightwing, a druid trainer of the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah. The Enclave is open to all who come in peace, though I teach only those the forest has called." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Welcome, young druid. Come and sit; your training continues today." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. The forest has been patient with you; I'll try to be the same." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You carry yourself a little more like the bear than you did. Good; that's how it should go." },
    { id = "n_form", cat = "form", when = { form = "bear" },
      text = "You may take your own shape to learn, young one, unless you mean to take notes with your paws." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Fylerian Nightwing, one of those who teach the druids of the Cenarion Circle here in the Enclave. We teach the shapes of the wild and the balance between them, and the patience to know which is needed." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "Your studies go well, I hear. Tell me what you'd learn today, and we'll see whether you are ready for it." },
      },
      again = {
        { id = "h_again", text = "What else? There is no hurry in the Enclave." },
        { id = "h_again2", text = "Ask what you like. The trees have heard worse questions." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What does a druid learn here?", next = "learn" },
        { text = "Are you kin to Freja Nightwing in Aldrassil?", next = "freja" },
        { text = "The Enclave is very quiet.", next = "quiet" },
        { text = "Farewell.", next = "END" },
      },
    },

    learn = {
      lines = {
        { id = "le_default", text = "To walk as the bear, to strike as the cat, to heal as the forest heals, and to know when each is right. The shapes are the easy part, though the young never believe me when I say so." },
      },
      choices = {
        { text = "What's the hard part, then?", next = "balance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    balance = {
      lines = { { id = "ba_default", text = "Balance. A druid who loves the bear's strength too much forgets the healer, and one who loves the healing forgets that the forest has teeth. Most of what I teach is how to stay in the middle." } },
      choices = {
        { text = "Then the middle is where I'll stay.", next = "BACK", reply = "Good. Say that again in a hundred years and I'll believe it.", fx = { align = { order = 1 } } },
        { text = "I'd rather be strong than balanced.", next = "BACK", reply = "Many have said so, and the forest humbled most of them. Still, the bear will be glad of you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    freja = {
      lines = { { id = "fr_default", text = "Nightwing is an old name, and there are more of us on Teldrassil than you might think. If Freja sells good leather in Aldrassil, I'll gladly claim her, but you'd have to ask her whether she claims me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    quiet = {
      lines = { { id = "qu_default", text = "It is, and that's no accident. Arch Druid Staghelm's tree stands above us, and those who come here come to listen, to the forest and to one another." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I teach the young druids of the Circle in the Cenarion Enclave. I have done so for longer than most cities have stood." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle keeps the balance of the wild. We are fewer than we were, but the forest is patient, and so are we." } },
    emerald_dream = { { id = "tp_dream", text = "The elder druids walk the Emerald Dream. I do not speak of it to those who haven't been called there." } },
    _none = { { id = "tp_none", text = "That's beyond what the Enclave teaches. Perhaps the forest will tell you, if you listen long enough." } },
  },
}

---------------------------------------------------------------------------
-- Cylania
---------------------------------------------------------------------------
P:NPC {
  key = "cylania", id = TODO_NPC("Cylania"), name = "Cylania", title = "Night Elf Armorer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "brisk", "proud" }, values = { "craft", "duty" },
  notices = { "class", "kit" },

  impression = {
    first = "Cylania sells armor on the Warrior's Terrace and fits it as carefully as if she expected to bury whoever she sold it to. She would rather not, and she says that too.",
    third = "{name} met Cylania, the armorer of Darnassus's Warrior's Terrace.",
  },

  greetings = {
    { id = "g_hello", text = "Armor for the field, fitted properly. Step up and let me look at you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. My work, or your luck?" },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior. Good, you'll know what you need before I tell you, and I'll tell you anyway." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You favour your left side. Has someone been hitting you there, or is the plate too tight?" },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Heavy plate on a paladin, polished like a mirror. The Sentinels think it gleams too much for the forest, but it's well kept, I'll grant you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Cylania, armorer of the Warrior's Terrace. The recruits come to me before they go out to the wilds, and the veterans come back to me afterward, which is how I know my work holds." },
      },
      again = {
        { id = "h_again", text = "What else? I've a recruit to fit after you." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "How should armor fit?", next = "fit" },
        { text = "Who comes to the Warrior's Terrace?", next = "terrace" },
        { text = "Your armor looks light for a battlefield.", next = "light" },
        { text = "Good day.", next = "END" },
      },
    },

    fit = {
      lines = { { id = "fi_default", text = "So that you forget you're wearing it until something tries to come through it. Too loose and it catches, too tight and you tire, and either one gets you killed in Ashenvale." } },
      choices = {
        { text = "So what's wrong with mine?", next = "fit2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fit2 = {
      lines = { { id = "f2_default", text = "Your straps want tightening at the shoulder, and your bracers have been mended by someone in a hurry. None of it will kill you today, but I'd see to it before the furbolgs or the Horde do." } },
      choices = {
        { text = "I'll see to it. Thank you.", next = "BACK", reply = "Good. I'd rather fit you twice than not at all.", fx = { align = { honor = 1 } } },
        { text = "It's held this long. It'll hold.", next = "BACK", reply = "That's what they all say, and then they come back with a hole in them. Suit yourself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    terrace = {
      lines = { { id = "te_default", text = "Recruits for the Sentinels, mostly, and young warriors who've heard tales of Ashenvale and want to see it. Lately more of your sort, too, outlanders who've come up from the boats and don't know which end of a glaive to hold." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    light = {
      lines = { { id = "li_default", text = "It's light because we fight in forests, where you must move quietly and climb when you have to. A dwarf in full plate is a fine wall, but you'll hear him coming from Astranaar." } },
      choices = { { text = "Fair point. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fit armor on the Warrior's Terrace. I've done it long enough to know who'll come back." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels buy from me when they're new, and then they buy from their own stores. I don't mind; I trained half their armorers." } },
    _none = { { id = "tp_none", text = "Not my concern. Ask me about straps and buckles, and I'll talk all day." } },
  },
}

---------------------------------------------------------------------------
-- Shylenai
---------------------------------------------------------------------------
P:NPC {
  key = "shylenai", id = TODO_NPC("Shylenai"), name = "Shylenai", title = "Owl Trainer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "gentle", "quiet" }, values = { "nature", "patience" },
  notices = { "class", "pet" },

  impression = {
    first = "Shylenai keeps owls on the Warrior's Terrace and speaks softly so as not to wake them. She seems more at ease with them than with anyone who comes to buy one.",
    third = "{name} met Shylenai, who raises owls in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Softly, please. They sleep in the day, and they remember who woke them." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. The little grey one asked after you. Well, she looked at the door, which is close enough." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll know how to be still, then, which is the whole of the lesson with owls." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Please keep your {pet} away from the perches. The owls are braver than they look, but not that brave." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Shylenai. I raise owls here on the Terrace, and from time to time someone gentle enough comes along to take one home." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quietly, now." },
        { id = "h_again2", text = "Go on, but keep your voice down." },
      },
      choices = {
        { text = "May I see the owls?", next = "BUSINESS" },
        { text = "Why owls?", next = "why" },
        { text = "How do I care for one?", next = "care" },
        { text = "They look like they're judging me.", next = "judging" },
        { text = "Good day.", next = "END" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "They are Elune's birds, awake when she is high and silent as moonlight on the water. The Sentinels say an owl in the branches means a quiet night, and I've never known it to be wrong." } },
      choices = {
        { text = "A pretty superstition.", next = "BACK", reply = "Perhaps, but I've had a great many quiet nights. I'll keep believing it.", fx = { align = { light = -1 } } },
        { text = "Then I'll take that blessing gladly.", next = "BACK", reply = "Elune-adore. She's kinder to those who are glad of her gifts.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    care = {
      lines = { { id = "ca_default", text = "Let it sleep in the day and hunt at night, and don't keep it in a cage, whatever the humans tell you. Speak to it gently and it will come back to you, which is more than most companions do." } },
      choices = {
        { text = "What do they eat?", next = "eat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eat = {
      lines = { { id = "ea_default", text = "Mice, mostly, and beetles, and whatever else scurries on Teldrassil at night. They're better at finding it than you'll ever be, so you needn't carry anything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    judging = {
      lines = { { id = "ju_default", text = "They are, and they're quite good at it. That one by the window decided she didn't like a human merchant last spring, and she hasn't stopped glaring at the door since." } },
      choices = { { text = "I'll try to pass muster. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I raise owls on the Warrior's Terrace. It's quiet work, and that suits me." } },
    elune = { { id = "tp_elune", text = "The owls wake when the moon rises. I think they know her better than any of us." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Most of what I know has feathers." } },
  },
}

---------------------------------------------------------------------------
-- Talaelar
---------------------------------------------------------------------------
P:NPC {
  key = "talaelar", id = TODO_NPC("Talaelar"), name = "Talaelar", title = "Fish Vendor",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "easygoing", "wry" }, values = { "simplicity", "patience" },
  notices = { "craft", "race" },

  impression = {
    first = "Talaelar sells fish by the lake in the Temple Gardens and seems to spend more time watching the water than minding his stall. He is in no hurry to change that.",
    third = "{name} met Talaelar, who sells fish beside the Temple Gardens in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Fresh from the lake this morning, or from Rut'theran yesterday. I'll tell you which, if you ask." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? The fish haven't changed, and neither have I." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You've a fisher's hands. Have you tried the lake here at dusk? Don't tell the priestesses I sent you." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! The last one of your folk who came by asked if I had anything smoked, and looked very sad when I said no." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Talaelar, and I sell fish here beside the Temple Gardens. The lake gives a little, the boats from Rut'theran bring the rest, and I sit between them and watch the water." },
      },
      again = {
        { id = "h_again", text = "Anything else? The fish aren't going anywhere." },
        { id = "h_again2", text = "Go on, friend." },
      },
      choices = {
        { text = "Let me see your fish.", next = "BUSINESS" },
        { text = "You fish in the Temple's lake?", next = "lake" },
        { text = "Quiet trade, selling fish.", next = "quiet" },
        { text = "Good day.", next = "END" },
      },
    },

    lake = {
      lines = { { id = "la_default", text = "Only a little, and only where the priestesses can't see me from the steps. The Sisters say the lake is for reflection, and I reflect very carefully on where they're standing before I cast." } },
      choices = {
        { text = "Some things should be left sacred.", next = "BACK", reply = "And they are, mostly. I only take what I need, and I thank Elune for every one.", fx = { align = { order = 1 } } },
        { text = "A lake full of fish is meant to be fished.", next = "BACK", reply = "My thinking exactly, though I'd not say it on the Temple steps.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    quiet = {
      lines = { { id = "qu_default", text = "It is, and I chose it for that. I stood watch on the borders of Ashenvale long ago, and after that I decided I'd rather spend my years watching water than trees." } },
      choices = {
        { text = "Did something happen in Ashenvale?", next = "ashenvale" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ashenvale = {
      lines = { { id = "as_default", text = "Nothing that doesn't happen to everyone who stands there long enough. The Horde came, and we pushed them back, and they came again, and one day I found I'd had my fill of it. Buy a fish, friend, and let's leave it there." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell fish in the Temple Gardens. I used to do something louder." } },
    warsong = { { id = "tp_warsong", text = "The orcs who cut the trees in Ashenvale. I've seen enough of them for one lifetime, and ours are long." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask me which fish are fresh, and I'll tell you true." } },
  },
}
