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
    first = "He talks of Blackfathom Deeps like a wound he can't stop pressing.",
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
    first = "His calm wears thin only when he speaks of his missing scout.",
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
    first = "She judges a person by their stitching, and she says so.",
    third = "{name} met Lotherias, a leatherworker of Darnassus buried in orders for gloves, boots and cloaks.",
  },

  greetings = {
    { id = "g_hello", text = "Mind the hides, they're drying. Are you here to buy, to help or to stand in my light?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? I've three more orders since you left, so I hope you've brought hands." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker, by the calluses. Come here and let me see your stitching." },
    { id = "g_done", when = { questDone = TODO_QUEST("Moonglow Vest") }, text = "There's my vest-maker. Have you sewn one yet, or is the pattern still folded in your pack?" },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "That's a skinner's knife, and it's been kept sharp. Good, because half the hides I'm offered look as if they were taken off with a spoon." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Embossed leather, if I'm any judge of the work on your belt. You're nearly ready for something better." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid in my workshop. Don't look at the hides like that; every one of them was taken properly, I promise you." },
  },

  start = "hello",
  nodes = {
    rivals = {
      lines = { { id = "rv_default", text = "No, and thank Elune for it, or I'd never sleep. Telonis teaches the craft across the way and sends me his best students when he has more than he can watch. Eladriel teaches skinning beside him, and between the two of them every hide that reaches my bench has been argued over twice already." } },
      choices = {
        { text = "So you three keep each other honest.", next = "rivals2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals2 = {
      lines = { { id = "rv2_default", text = "We keep each other sharp, which isn't quite the same. Telonis thinks I rush my finishing, I think he coddles his apprentices, and Eladriel thinks neither of us could skin a hare without her. We're all three right, and the leather's better for it." } },
      choices = { { text = "A terrace full of critics. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    xskin = {
      lines = { { id = "xk_default", text = "If the cuts are straight and you can tell me where and how the beast was taken, yes. I pay fairly for nightsaber and well for anything whole from Darkshore. Bring me nothing from near the furbolg dens, there or in Ashenvale, because that leather cracks whatever I do to it." } },
      choices = { { text = "Clean hides, honestly taken. Something else.", next = "BACK" } },
    },
    xdone = {
      lines = { { id = "xdn_default", text = "Let me see the side seam. There, you've kept the stitches even right through the curve, which is where most people lose their nerve. I'll not say it's as good as mine, but I'd not be ashamed to see it leave my bench." } },
      choices = { { text = "From you, that's high praise. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhunter = {
      lines = { { id = "xhu_default", text = "They do, and hunters never tell me until the shoulder's worn through. The bowstring saws at the left bracer and the quiver strap at the right shoulder, so I double both for Jocaste's students without being asked. Come back before it frays, not after." } },
      choices = { { text = "Before it frays. I'll try. Something else.", next = "BACK" } },
    },
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
        { id = "h_again3", text = "Ask, and hand me that awl while you're at it. No, the other one." },
        { id = "h_again", text = "What else? Talk while I cut, if you don't mind." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
      },
      choices = {
        { text = "What's the Moonglow Vest?", next = "vest" },
        { text = "Who buys all this leather?", next = "buyers" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Your bench is a mess.", next = "mess" },
        { text = "You're not the only leatherworker on this terrace.", next = "rivals" },
        { text = "I skin my own kills. Would you buy from me?", next = "xskin", when = { profession = "Skinning" } },
        { text = "I've sewn the vest. It wears well.", next = "xdone", when = { questDone = TODO_QUEST("Moonglow Vest") } },
        { text = "A hunter's leathers take harder use than most.", next = "xhunter", when = { class = "HUNTER" } },
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
    sentinels = { { id = "tp_sentinels", text = "A Sentinel will send a boot back three times before she's content. I complain about it, and then I make everyone's boots that way." } },
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
    first = "He talks about food the way priestesses talk about the moon.",
    third = "{name} met Alegorn, the cooking trainer of Darnassus, who believes a good meal settles most arguments.",
  },

  greetings = {
    { id = "g_hello", text = "Hungry, or here to learn? I can help with both, though the second takes longer." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you're back. Did the last recipe go well, or did the smoke give you away?" },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook! Come in, come in, there's always room at this fire for another." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! One of your people showed me a pot that whistles when the water boils. I gave it back, because it frightened the owls on the next terrace, but I think of it often." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Your people taught me there's no dish that can't be improved with a little more fat, and I've been arguing with that ever since." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You smell of woodsmoke and spice. Someone's been practising." },
  },

  start = "hello",
  nodes = {
    terrace = {
      lines = { { id = "tc_default", text = "I do, and they are my most faithful customers. Lotherias forgets to eat when her orders pile up, so I send a bowl to her bench, and Fyldan beside me sells the salt and spices I send my students to buy. Ainethil the alchemist complains that my smoke gets into her vials, and then asks what is in the pot." } },
      choices = {
        { text = "A cook hears the whole terrace's troubles, I'd guess.", next = "terrace2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    terrace2 = {
      lines = { { id = "tc2_default", text = "People say to a cook what they would not say to a priestess, because nobody is ashamed in front of a stew. This season the talk is all of the young ones leaving for Darkshore and Ashenvale, and of how few come back to visit. I send them off with a recipe each, so that they will at least eat properly where they are going." } },
      choices = {
        { text = "They should stay and guard their own tree.", next = "BACK", reply = "Some of the elders say so, and I understand it. But a tree that keeps all its seeds grows no forest.", fx = { align = { order = 1 } } },
        { text = "Let them go. The world needs them out in it.", next = "BACK", reply = "I think so too, though my fire is lonelier for it. Go well, then, and eat before you travel.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spice = {
      lines = { { id = "sp_default", text = "They did, and I am not too old to admit it. There is a hot red powder that the human traders carry, and a sweet brown bark, and I spent a month ruining good venison with both before I learned how little is enough. Now the Sentinels ask for the red stew by name." } },
      choices = {
        { text = "Ten thousand years, and a new taste still surprises you.", next = "spice2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spice2 = {
      lines = { { id = "sp2_default", text = "It is the one craft where that can still happen. A blade is a blade and a robe is a robe, but when the boats came, I found there were whole kitchens I had never heard of. I mean to learn every one of them, and I have the time." } },
      choices = { { text = "That's a fine use for a long life. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xfish = {
      lines = { { id = "xf_default", text = "Wrapped in a broad leaf with a few moonberries and laid in the embers, never over the flame. And if the fish came from the Temple's lake, friend, I did not hear you say so, and neither did Talaelar." } },
      choices = { { text = "It came from somewhere else entirely. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    xdwarf = {
      lines = { { id = "xdw_default", text = "So your kinsman told me, with his beard in my pot. I will grant you the boar and the bear, where fat is half the pleasure, but I will defend a clean lake trout against all the butter in Ironforge." } },
      choices = { { text = "We'll call it a truce over the trout. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Alegorn, and I teach cooking to anyone who'll stand still long enough. It's a humble craft beside the swords and the spells, but nobody ever fought well on an empty stomach." },
        { id = "h_human", when = { race = "Human" },
          text = "I am Alegorn, and I teach cooking. Your people brought spices up from Stormwind I'd never tasted in ten thousand years, so I owe you a lesson or two at least." },
      },
      again = {
        { id = "h_again3", text = "Ask while I stir. A cook who cannot talk over a pot has not been at it long enough." },
        { id = "h_again", text = "Anything else? The pot can wait a moment." },
        { id = "h_again2", text = "What else? Mind the fire." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS" },
        { text = "What do night elves cook?", next = "cuisine" },
        { text = "Who do you cook for?", next = "sentinels" },
        { text = "Cooking seems a small thing to teach.", next = "small" },
        { text = "You share this terrace with a good many crafters.", next = "terrace" },
        { text = "Those Stormwind spices changed your cooking.", next = "spice" },
        { text = "I've caught fish in the lake here. How would you cook it?", next = "xfish", when = { profession = "Fishing" } },
        { text = "More fat does improve a dish, you know.", next = "xdwarf", when = { race = "Dwarf" } },
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
    sentinels = { { id = "tp_sentinels", text = "The Sentinels on the wall eat whatever I have left at dusk, and they are too proud to ask for seconds. I send seconds anyway." } },
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
    first = "He teaches as if he had all the time in the world.",
    third = "{name} met Fylerian Nightwing, a druid trainer of the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah. The Enclave is open to all who come in peace, though I teach only those the forest has called." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Welcome, young druid. Come and sit; your training continues today." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. The forest has been patient with you; I'll try to be the same." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You know the wild from the outside, and that is no small knowledge. We only ask that you take from it as one who means to return." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You carry yourself a little more like the bear than you did. Good; that's how it should go." },
    { id = "n_form", cat = "form", when = { form = "bear" },
      text = "You may take your own shape to learn, young one, unless you mean to take notes with your paws." },
  },

  start = "hello",
  nodes = {
    staghelm = {
      lines = { { id = "st_default", text = "I do. Arch Druid Fandral Staghelm has led the Circle since Shan'do Stormrage returned to the Dream, and he does not suffer idleness in those beneath him. Mathrengyl Bearwalker stands nearest his counsel, and Denatharion and I see to the young ones below." } },
      choices = {
        { text = "You speak of him carefully.", next = "staghelm2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    staghelm2 = {
      lines = { { id = "st2_default", text = "He is my Arch Druid, and I am careful in most things. I will say that he raised this tree when others counselled patience, and that the Enclave has not been of one mind about it since. A teacher's task is to see that the young can think on such matters for themselves." } },
      choices = {
        { text = "The Circle should stand behind its Arch Druid.", next = "BACK", reply = "And it does, in all that matters. I only teach my students to stand with their eyes open.", fx = { align = { order = 1 } } },
        { text = "A leader who ignores counsel should be questioned.", next = "BACK", reply = "Questions are welcome in the Enclave, young one, when they are asked quietly and with respect. Louder ones are heard upstairs.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fewer = {
      lines = { { id = "fw_default", text = "That is so. For ten thousand years the druids slept in the barrow dens and walked the Dream, and many have not yet woken, and some will not. Those I teach now are mostly young, born to a people who have lost their immortality and feel the years pressing." } },
      choices = {
        { text = "Does that haste trouble you?", next = "fewer2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fewer2 = {
      lines = { { id = "fw2_default", text = "It did at first. I was taught over centuries, and my students want the bear by the next moon. Yet they listen harder than we ever did, because they know they have less time to hear it, and I find I am learning a new patience from their impatience." } },
      choices = { { text = "That's a generous way to see them. Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    xmoonglade = {
      lines = { { id = "xm_default", text = "Then you have stood at Nighthaven and felt how the land itself breathes there. Dendrite Starblaze and Loganaar will have told you what I would: that the Glade belongs to no one people, and a druid of the Circle greets a tauren there as kin. Remember it when you return to a city that forgets." } },
      choices = { { text = "I will remember, shan'do. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xtauren = {
      lines = { { id = "xt_default", text = "Less than either of our peoples once believed. You call her the Earth Mother and hear her in the plains, and we follow Cenarius and hear him in the boughs, and in Moonglade the two voices say much the same. You are welcome under this tree, whatever the guards at the gate may think of it." } },
      choices = { { text = "Then we are kin in the Circle. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Fylerian Nightwing, one of those who teach the druids of the Cenarion Circle here in the Enclave. We teach the shapes of the wild and the balance between them, and the patience to know which is needed." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "Your studies go well, I hear. Tell me what you'd learn today, and we'll see whether you are ready for it." },
      },
      again = {
        { id = "h_again3", text = "Ask it slowly, and I shall answer it slowly, and we shall both be the better for that." },
        { id = "h_again", text = "What else? There is no hurry in the Enclave." },
        { id = "h_again2", text = "Ask what you like. The trees have heard worse questions." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What does a druid learn here?", next = "learn" },
        { text = "Are you kin to Freja Nightwing in Aldrassil?", next = "freja" },
        { text = "The Enclave is very quiet.", next = "quiet" },
        { text = "You teach beneath Staghelm's own tree.", next = "staghelm" },
        { text = "Fewer druids are waking than once did.", next = "fewer" },
        { text = "I have been to Moonglade, shan'do.", next = "xmoonglade", when = { class = "DRUID" } },
        { text = "My people hear the Earth Mother. Is it so different?", next = "xtauren", when = { race = "Tauren" } },
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
    advice = { { id = "tp_advice", text = "Learn one shape well before you reach for the next. The forest does not grow an oak by hurrying the acorn." } },
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
    first = "She fits armor as if she expected to bury its buyer.",
    third = "{name} met Cylania, the armorer of Darnassus's Warrior's Terrace.",
  },

  greetings = {
    { id = "g_hello", text = "Armor for the field, fitted properly. Step up and let me look at you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. My work, or your luck?" },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "A warrior. Good, you'll know what you need before I tell you, and I'll tell you anyway." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll want the mail cut short at the bow arm, and you'll not have to ask me twice. Jocaste's students taught me that by complaining." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You favour your left side. Has someone been hitting you there, or is the plate too tight?" },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "Heavy plate on a paladin, polished like a mirror. The Sentinels think it gleams too much for the forest, but it's well kept, I'll grant you." },
  },

  start = "hello",
  nodes = {
    back = {
      lines = { { id = "bk_default", text = "I do, more often than I would like. It shows in how they stand to be measured. The ones who fidget and ask how they look are thinking of the tale they will tell, and the ones who ask where the weak points are have understood where they are going." } },
      choices = {
        { text = "And you tell the fidgeters so?", next = "back2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back2 = {
      lines = { { id = "bk2_default", text = "I tell every one of them where the armor will fail, whether they ask or not, and I make them repeat it. Some think me grim for it. I have noticed that the ones who thought me grim are the ones who come back to thank me." } },
      choices = {
        { text = "Hard truth is a kindness. Keep telling them.", next = "BACK", reply = "I shall. It costs me nothing but their good opinion, and I can spare that.", fx = { align = { honor = 1 } } },
        { text = "Let them keep their courage. Fear kills too.", next = "BACK", reply = "Courage that cannot bear to hear where the gap is was never going to last past Astranaar. But I hear you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers = {
      lines = { { id = "tn_default", text = "Sildanair sends hers before their first posting, and Darnath and Arias'ta Bladesinger send theirs back when a strap has given way in the practice ring. Ilyenia Moonfire, the weapon master, sends me nobody, because she holds that a fighter who is hit has already failed." } },
      choices = {
        { text = "She isn't wrong, in a way.", next = "trainers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers2 = {
      lines = { { id = "tn2_default", text = "She is entirely right, in the ring. In Ashenvale there are six orcs and it is raining, and then even Ilyenia's best students are glad of what I sold them. We have agreed that she teaches them not to be struck, and I see to the times it happens regardless." } },
      choices = { { text = "Between you, they're well served. Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    xnelf = {
      lines = { { id = "xn_default", text = "The Sentinel issue is sound and a hundred years out of date. It was cut for a war against demons, who strike high, and the Warsong strike low, at the thigh, from wolfback. Have your greaves lengthened before you go south, and tell your captain I said so." } },
      choices = { { text = "I'll carry the word to her. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xsmith = {
      lines = { { id = "xsm_default", text = "Because iron sings in the forest, and because we have never had a dwarf's patience for mines. What metal I use is at the joints and the heart, and the rest is hardened leather and ironwood scale, which turns a blade nearly as well and does not rust in the mist." } },
      choices = { { text = "Ironwood scale. I'd like to study that. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Cylania, armorer of the Warrior's Terrace. The recruits come to me before they go out to the wilds, and the veterans come back to me afterward, which is how I know my work holds." },
      },
      again = {
        { id = "h_again3", text = "Ask, then. I measure faster than I talk, so you'll not hold me up." },
        { id = "h_again", text = "What else? I've a recruit to fit after you." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "How should armor fit?", next = "fit" },
        { text = "Who comes to the Warrior's Terrace?", next = "terrace" },
        { text = "Your armor looks light for a battlefield.", next = "light" },
        { text = "You said you know who'll come back.", next = "back" },
        { text = "The trainers here must send you their recruits.", next = "trainers" },
        { text = "I guard the wall myself. What do you make of our issue?", next = "xnelf", when = { race = "NightElf", class = "WARRIOR" } },
        { text = "I smith armor too. Why so little metal?", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "I'll be wearing mail soon, as a hunter.", next = "hunt_mail", when = { class = "HUNTER", minLevel = 35 } },
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
    hunt_mail = {
      lines = {
        { id = "hml_default", text = "Then come to me first and not to the dwarves, who will sell you something built for a mine shaft. I make mail with the links laid flat and the shoulders cut loose, so a hunter can draw a bow at full stretch without the rings biting." },
      },
      choices = {
        { text = "Will it be quiet enough to stalk in?", next = "hunt_mail2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunt_mail2 = {
      lines = {
        { id = "hml2_default", text = "Quieter than you would think, once you learn to walk in it, and never as quiet as leather. Wrap the links at the hips in cloth for the first month, and after that your body will have learned the trick on its own." },
      },
      choices = { { text = "Cloth at the hips. Thank you.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    advice = { { id = "tp_advice", text = "Learn where your own armor is weakest and guard that place without being told. The enemy will find it soon enough if you do not." } },
    warsong = { { id = "tp_warsong", text = "The Warsong ride wolves and cut at the leg. I have lengthened more greaves this year than in the hundred before it." } },
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
    first = "She is more at ease with her owls than with customers.",
    third = "{name} met Shylenai, who raises owls in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Softly, please. They sleep in the day, and they remember who woke them." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. The little grey one asked after you. Well, she looked at the door, which is close enough." },
  },

  notice = {
    { id = "n_gnome", cat = "class", when = { race = "Gnome" },
      text = "Oh, do stand still a moment, please. The barn owl has never seen anyone your size who was not a mouse, and she is deciding." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You'll know how to be still, then, which is the whole of the lesson with owls." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Please keep your {pet} away from the perches. The owls are braver than they look, but not that brave." },
  },

  start = "hello",
  nodes = {
    loud = {
      lines = { { id = "lo_default", text = "It is, in the day, and I asked for somewhere else. But the Sentinels wanted the owls near, for luck, and so I have this corner behind Cylania's racks where the clatter is least. The birds have learned to sleep through Sildanair's recruits, which is more than I have." } },
      choices = {
        { text = "The warriors treat them kindly, at least?", next = "loud2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    loud2 = {
      lines = { { id = "lo2_default", text = "More kindly than you would guess. Darnath Bladesinger makes his students lower their voices when they pass, and I have seen a recruit twice my height carry a fallen owlet back to me in both hands as if it were glass. Fighters understand small fierce things." } },
      choices = {
        { text = "The strong should always shelter the small.", next = "BACK", reply = "That is what the Sentinels are for, when all is said. I think the owls remind them.", fx = { align = { light = 1 } } },
        { text = "Small things should learn to fend for themselves.", next = "BACK", reply = "An owl does, the moment it flies. But it has to live long enough to fly first.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    names = {
      lines = { { id = "na_default", text = "I do, though I would not tell them to a buyer. An owl answers to whatever name is spoken to it gently and often, and it is better that the one it learns is yours. I only keep my names for them until someone else is ready to give a new one." } },
      choices = {
        { text = "It must be hard to let them go.", next = "names2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    names2 = {
      lines = { { id = "na2_default", text = "Every time, and I have never once refused a good home on account of it. Lelanai, who keeps the nightsabers below, says the same of her cubs. We console each other when a favourite leaves, and then we go back and feed the rest." } },
      choices = { { text = "They're lucky in their keeper. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhunter = {
      lines = { { id = "xh_default", text = "It is. A beast you tame by proving you are the stronger, or so Jocaste teaches, and an owl only by proving you are no threat at all. Sit under the perch for a night without speaking or reaching, and by dawn she will have chosen whether you exist." } },
      choices = { { text = "A whole night of stillness. I can do that. Something else.", next = "BACK" } },
    },
    xpriest = {
      lines = { { id = "xp_default", text = "Then you will know the old hymn that calls them her eyes in the dark. The priestesses come sometimes at moonrise to watch them wake, and Astarii Starseeker once told me she learned more of silence here than in the Temple. I have treasured that." } },
      choices = { { text = "I should like to watch them wake. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Shylenai. I raise owls here on the Terrace, and from time to time someone gentle enough comes along to take one home." },
      },
      again = {
        { id = "h_again3", text = "Yes? Softly, though. The white one has only just tucked her head." },
        { id = "h_again", text = "Anything else? Quietly, now." },
        { id = "h_again2", text = "Go on, but keep your voice down." },
      },
      choices = {
        { text = "May I see the owls?", next = "BUSINESS" },
        { text = "Why owls?", next = "why" },
        { text = "How do I care for one?", next = "care" },
        { text = "They look like they're judging me.", next = "judging" },
        { text = "The Warrior's Terrace seems a loud place for owls.", next = "loud" },
        { text = "You know each of them by name.", next = "names" },
        { text = "I've tamed beasts. An owl is another matter, isn't it?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I serve Elune. They are her birds, as you say.", next = "xpriest", when = { class = "PRIEST", race = "NightElf" } },
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
    sentinels = { { id = "tp_sentinels", text = "They like an owl in the branches over a watch post. I lend them the steadier birds, and I always get them back." } },
    teldrassil = { { id = "tp_teldrassil", text = "The owls roost lower on the tree than they did a few years ago. I do not know why, and it has begun to trouble me." } },
    advice = { { id = "tp_advice", text = "If an owl turns her head away from you, do not follow her gaze round. Wait, and she will look back when she is ready." } },
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
    first = "He watches the water more than he minds his stall.",
    third = "{name} met Talaelar, who sells fish beside the Temple Gardens in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Fresh from the lake this morning, or from Rut'theran yesterday. I'll tell you which, if you ask." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? The fish haven't changed, and neither have I." },
  },

  notice = {
    { id = "n_druid", cat = "craft", when = { class = "DRUID" },
      text = "A druid. I've seen your kind swim that lake as seals, or something like them, and come up with a fish I'd been after all week. I don't hold it against you, much." },
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "You've a fisher's hands. Have you tried the lake here at dusk? Don't tell the priestesses I sent you." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! The last one of your folk who came by asked if I had anything smoked, and looked very sad when I said no." },
  },

  start = "hello",
  nodes = {
    gardens = {
      lines = { { id = "gd_default", text = "It is, and I have good neighbours in it. Astaia teaches fishing just along the bank and pretends not to see where I cast, and Voloren sells the line and hooks to her students. The priestesses pass on their way to the Temple and nod, and nobody is in a hurry." } },
      choices = {
        { text = "Do the priestesses buy your fish?", next = "gardens2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gardens2 = {
      lines = { { id = "gd2_default", text = "The novices do, for the Temple kitchen, and they haggle like sailors. Sister Aquinne sends them with a list and exactly enough coin, and I have never once managed to sell one of them a fish she had not written down." } },
      choices = { { text = "A well-ordered Temple. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    rut = {
      lines = { { id = "ru_default", text = "Sea fish, which the lake can't give me: bright ones from the shallows round the roots, and deep ones the boats bring over from Darkshore. Androl Oakhand down in the village sends the best of his students' catch up through the portal each morning, still wet." } },
      choices = {
        { text = "And lately?", next = "rut2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rut2 = {
      lines = { { id = "ru2_default", text = "Lately the Darkshore boats bring less, and the fishers there talk of great dead things on the beaches and nets coming up empty. I buy what they send and I ask no more than that, friend, because I came here to stop hearing bad news from the mainland." } },
      choices = {
        { text = "You can't hide from the world behind a fish stall.", next = "BACK", reply = "I can try, and I have managed some years of it. But I take your meaning, and it isn't an unkind one.", fx = { align = { honor = 1 } } },
        { text = "You've done your share. Keep your quiet.", next = "BACK", reply = "Thank you. Not many say so, and fewer of them mean it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfish = {
      lines = { { id = "xf_default", text = "Small silver ones near the reeds, and now and then a longjaw by the far bank that'll take your whole line if you let it. Cast from the shadow of the bridge, where you can't be seen from the Temple steps, and keep what you say to Astaia vague." } },
      choices = { { text = "The shadow of the bridge. Understood. Something else.", next = "BACK" } },
    },
    xsoldier = {
      lines = { { id = "xso_default", text = "Then I needn't explain myself, and that's a relief. You'll know the sound an axe makes in old wood, and how it carries. When you've had your own fill of it, friend, there's room on this bank, and the lake asks nothing of anyone." } },
      choices = { { text = "Not yet. But I'll remember the bank.", next = "BACK", fx = { affinity = 1 } } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Talaelar, and I sell fish here beside the Temple Gardens. The lake gives a little, the boats from Rut'theran bring the rest, and I sit between them and watch the water." },
      },
      again = {
        { id = "h_again3", text = "Take your time, friend. I've been watching the same ripple since noon and it can spare me." },
        { id = "h_again", text = "Anything else? The fish aren't going anywhere." },
        { id = "h_again2", text = "Go on, friend." },
      },
      choices = {
        { text = "Let me see your fish.", next = "BUSINESS" },
        { text = "You fish in the Temple's lake?", next = "lake" },
        { text = "Quiet trade, selling fish.", next = "quiet" },
        { text = "The Temple Gardens are a peaceful place to keep a stall.", next = "gardens" },
        { text = "What comes up on the boats from Rut'theran?", next = "rut" },
        { text = "I fish too. What's biting at dusk?", next = "xfish", when = { profession = "Fishing" } },
        { text = "I've stood watch in Ashenvale as well.", next = "xsoldier", when = { class = { "WARRIOR", "HUNTER" }, faction = "Alliance" } },
        { text = "Do the fish here remember the Well, do you think?", next = "ne_fish", when = { race = "NightElf" } },
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
    ne_fish = {
      lines = {
        { id = "nfs_default", text = "The old fishers in Auberdine say the deep ones out past the Veiled Sea still glow a little, as if the Well were in their blood. I sell what swims in shallower water, and those only remember the bait, which suits me fine." },
      },
      choices = { { text = "Shallow water it is. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    sentinels = { { id = "tp_sentinels", text = "I was one. They are better people than I am, the ones who stayed, and I catch fish for a few of them." } },
    elune = { { id = "tp_elune", text = "I thank Her for every fish from Her lake, quietly, where the Sisters can't hear and take it for cheek." } },
    ashenvale = { { id = "tp_ashenvale", text = "It's a beautiful forest, friend, and I hope never to see it again. Both of those are true." } },
    advice = { { id = "tp_advice", text = "Buy the lake fish in the morning and the sea fish by noon, and never either one at dusk, whoever is selling." } },
    background = { { id = "tp_bg", text = "I sell fish in the Temple Gardens. I used to do something louder." } },
    warsong = { { id = "tp_warsong", text = "The orcs who cut the trees in Ashenvale. I've seen enough of them for one lifetime, and ours are long." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask me which fish are fresh, and I'll tell you true." } },
  },
}

---------------------------------------------------------------------------
-- Milla Fairancora
---------------------------------------------------------------------------
P:NPC {
  key = "milla", id = TODO_NPC("Milla Fairancora"), name = "Milla Fairancora", title = "Alchemy Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "eager", "careful" }, values = { "learning", "craft" },
  notices = { "craft", "class" },

  impression = {
    first = "Milla Fairancora teaches the first steps of alchemy on the Craftsmen's Terrace and is still, by her own account, an apprentice herself. She is eager and careful, and she measures everything twice.",
    third = "{name} met Milla Fairancora, who teaches beginners' alchemy on the Craftsmen's Terrace.",
  },

  greetings = {
    { id = "g_hello", text = "Oh, hello! Are you here for a lesson? Please say yes, I have everything laid out and nobody has come all morning." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Did it turn the right colour? It should have been green. Tell me it was green." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "You already know some alchemy! Then you will not laugh if I check my notes before I answer you." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You have peacebloom in your satchel, I can smell it. Fresh, too. Firodren says a potion is only as good as the hand that picked for it." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You could simply ask the plant what it is good for, could you not? I have to boil it and see." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Milla Fairancora. Ainethil teaches the advanced work, and she has let me take the beginners, which I think is partly kindness and partly so that she can brew in peace. I can show you the first draughts, and how not to scald yourself making them." },
        { id = "h_alch", when = { profession = "Alchemy" }, text = "You are past the first lessons, I can tell by how you hold the vial. I can still teach you a little, and for the rest you will want Ainethil, just there by the large cauldron." },
      },
      again = {
        { id = "h_again", text = "Yes? Ask me anything. Well, anything from the first three chapters." },
        { id = "h_again2", text = "Go on, please. I like questions I can answer." },
        { id = "h_again3", text = "Something else? Let me just cork this." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "You call yourself an apprentice, and you teach?", next = "apprentice" },
        { text = "Who else works on this terrace?", next = "terrace" },
        { text = "What do beginners get wrong?", next = "wrong" },
        { text = "Do you ever try a recipe that isn't in the book?", next = "xalch", when = { profession = "Alchemy" } },
        { text = "I can bring you herbs. What are you short of?", next = "xherb", when = { profession = "Herbalism" } },
        { text = "Good luck with your lessons, Milla.", next = "END" },
      },
    },
    apprentice = {
      lines = {
        { id = "apprentice_default", text = "I do, and it frightened me badly at first. But Ainethil says the best way to find out what you have not understood is to explain it to someone else. She was right. I discovered in my second lesson that I had been stirring the wrong way for forty years." },
      },
      choices = {
        { text = "Does the direction matter?", next = "apprentice2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apprentice2 = {
      lines = {
        { id = "apprentice2_default", text = "For a healing draught, hardly at all, which is how I got away with it. For anything finer, a great deal. Ainethil watched me do it for four decades and waited for me to notice. That is how she teaches. It is maddening, and it works." },
      },
      choices = {
        { text = "A patient teacher is worth the wait.", next = "BACK", reply = "She is. I mean to be like her, in a few centuries, if I can keep from blurting the answer.", fx = { align = { order = 1 } } },
        { text = "Forty years is too long to let a mistake stand.", next = "BACK", reply = "I thought so too, when I found out! But I have never once forgotten it since.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    terrace = {
      lines = {
        { id = "terrace_default", text = "So many. Ulthir sells the vials and herbs beside us, Firodren Mooncaller teaches the gathering, and Alegorn the cook is forever asking to borrow my small scales. Across the way are the leatherworkers and the tailors, and they complain when the wind carries our smoke." },
      },
      choices = {
        { text = "And you all get on?", next = "terrace2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    terrace2 = {
      lines = {
        { id = "terrace2_default", text = "Mostly! Ainethil and Alegorn have a standing quarrel about whose pot smells worse, which neither intends to win. And Ulthir saves me the cracked vials at half price for practice, which he is not supposed to do. Please do not mention that near Ainethil." },
      },
      choices = {
        { text = "Not a word. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    wrong = {
      lines = {
        { id = "wrong_default", text = "They hurry the heat. Everyone wants it to boil, and a healing draught should never quite boil. And they taste it. Please never taste it until I say. A student last month tried her own swiftness potion early and ran into the lake." },
      },
      choices = {
        { text = "Was she hurt?", next = "wrong2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong2 = {
      lines = {
        { id = "wrong2_default", text = "Only her pride, and Talaelar the fish seller pulled her out. He said it was the most exciting thing to happen in the Temple Gardens for a century. She has the steadiest hands of any of my students now, so perhaps the lake taught her what I could not." },
      },
      choices = {
        { text = "A cold lesson, well learned. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xalch = {
      lines = {
        { id = "xalch_default", text = "Once. I put mageroyal in a troll's blood draught to see what would happen. What happened was purple, and it ate through the table. Ainethil did not say a word. She brought me a new table and a book on why. I read all of it." },
      },
      choices = {
        { text = "Good. That's how recipes are discovered.", next = "BACK", reply = "That is what I told myself! I do it over a stone slab now.", fx = { align = { order = -1 } } },
        { text = "Follow the recipe. It exists for a reason.", next = "BACK", reply = "It does. Usually the reason is somebody's table.", fx = { align = { order = 1 } } },
      },
    },
    xherb = {
      lines = {
        { id = "xherb_default", text = "Briarthorn, always, and bruiseweed. The gatherers bring peacebloom by the armful because it grows by the road, and nobody wants to go into the thorns. If you bring briarthorn, I shall teach your lesson with extra care, though I would anyway." },
      },
      choices = {
        { text = "Briarthorn and bruiseweed. I'll remember.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furbolgs", text = "A student brought me herbs from near Ban'ethil, and the draught came out grey. Ainethil took the vial away and would not say why." } },
    highborne = { { id = "tp_highborne", text = "They brewed things that made them live for ever, or so it is said. I am still trying to get a healing draught the right green." } },
    background = { { id = "tp_background", text = "I teach beginners' alchemy on the Craftsmen's Terrace. I am Ainethil's apprentice still, and glad to be." } },
    advice = { { id = "tp_advice", text = "Never let a healing draught come to a full boil, and never taste before it has cooled. Those two rules cover most accidents." } },
    teldrassil = { { id = "tp_teldrassil", text = "Herbs grow faster on this tree than on the mainland, and a little stronger. I have had to cut my measures by a tenth." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids know every plant by its true nature. I only know what it does in a pot, and I envy them." } },
    _none = { { id = "tp_none", text = "I do not know, I am sorry! It was not in any chapter I have reached. Ainethil might." } },
  },
}

---------------------------------------------------------------------------
-- Taladan
---------------------------------------------------------------------------
P:NPC {
  key = "taladan", id = TODO_NPC("Taladan"), name = "Taladan", title = "Enchanting Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "grave", "deliberate" }, values = { "restraint", "craft" },
  notices = { "craft", "class" },

  impression = {
    first = "Taladan teaches enchanting on the Craftsmen's Terrace under the wary eye of a city that remembers what arcane magic once cost it. He is grave about the craft and exact about its limits.",
    third = "{name} met Taladan, the enchanting trainer of Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah. You have come to the enchanter's bench. Some in this city would say you had come to the wrong place." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I hope you have thought on what we spoke of, as well as practised it." },
    { id = "g_ench", when = { profession = "Enchanting" }, text = "You carry a runed rod. Then you have begun, and I may speak to you as a student and not as a stranger." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "There is dust on your sleeve that was a blade this morning, I think. Did you ask yourself whether the blade was worth more whole? One should, each time." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You will be watched in this city, courteously. Do not take it ill. We have long memories, and the last of our people who drew on the arcane as freely as you do drowned half the world." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Taladan, and I teach the enchanter's art in Darnassus. It is permitted here because it conjures nothing; we only move what magic already rests in made things. I hold my students to that line, and I do not let them forget why it was drawn." },
        { id = "h_ench", when = { profession = "Enchanting" }, text = "You know the first forms. I can teach you more, when you have gathered what the work requires. Vaean, beside me, keeps the rods and vials." },
      },
      again = {
        { id = "h_again", text = "Ask. I shall answer with care." },
        { id = "h_again2", text = "What more would you know?" },
        { id = "h_again3", text = "Speak. There is time." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "Why would some call this the wrong place?", next = "wrong" },
        { text = "What line do you hold your students to?", next = "line" },
        { text = "Who shares the terrace with you?", next = "terrace" },
        { text = "Have you ever been tempted past the line?", next = "xench", when = { profession = "Enchanting" } },
        { text = "My people study the arcane openly. Is that so wrong?", next = "xmage", when = { class = "MAGE" } },
        { text = "The druids distrust your craft, don't they?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Elune guide your hand, Taladan.", next = "END" },
      },
    },
    wrong = {
      lines = {
        { id = "wrong_default", text = "Because Darnassus was raised by druids, on a foundation of grief for what the Highborne did. For ten thousand years the working of arcane magic was forbidden to our people on pain of death. Enchantment was spared, narrowly, and there are still those who think it should not have been." },
      },
      choices = {
        { text = "And yet you teach in the open.", next = "wrong2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong2 = {
      lines = {
        { id = "wrong2_default", text = "I do, by leave of the Temple, and I keep my bench where anyone may watch. I would rather be observed than trusted. Trust is what the Highborne asked for." },
      },
      choices = {
        { text = "That caution does you credit.", next = "BACK", reply = "It is only memory. But I thank you.", fx = { align = { order = 1 } } },
        { text = "Ten thousand years of fear is long enough.", next = "BACK", reply = "Perhaps. I should want to be very sure before I said so aloud here.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "highborne" } } },
      },
    },
    line = {
      lines = {
        { id = "line_default", text = "That we take nothing from beyond the thing itself. An enchanter unmakes an object that holds magic and gathers what it yields: dust, essence, shard. With those, and only those, we wake a property in another object. No well, no ley line, no pact. What goes in is all that may come out." },
      },
      choices = {
        { text = "And if a student reaches further?", next = "line2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    line2 = {
      lines = {
        { id = "line2_default", text = "Then I cease to teach that student, and I tell the Temple why. It has happened once. He was gifted, and impatient, and he thought the rule was for lesser talents. He left the city. I do not know where he went, and I think of him more often than I should like." },
      },
      choices = {
        { text = "That's a heavy thing to carry. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    terrace = {
      lines = {
        { id = "terrace_default", text = "Vaean sells the supplies of my craft, and has a better head for stock than I. The alchemists are our neighbours, and Ainethil and I are of an age and of a mind on most things. The tailor Me'lynn brings her finest cloaks to be enchanted, and stands over me while I do it." },
      },
      choices = {
        { text = "She doesn't trust you with them?", next = "terrace2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    terrace2 = {
      lines = {
        { id = "terrace2_default", text = "She trusts me entirely. She does not trust the process, which requires that I hold a year of her work over a flame of essence. I should stand over me also. I have never yet scorched one, and she has never yet looked away." },
      },
      choices = {
        { text = "A fair arrangement. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xench = {
      lines = {
        { id = "xench_default", text = "Every enchanter is. There is a moment, with a greater essence in your hand, when you feel how much more there is behind it, like a door ajar. I close the door. I have closed it some thousands of times. It does not grow easier, and I should distrust myself if it did." },
      },
      choices = {
        { text = "Then I'll expect the door, and close it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xmage = {
      lines = {
        { id = "xmage_default", text = "For you, I cannot say. Your people did not break the world. Mine did, and our law is written by that. I will tell you only what I tell my students: ask each time what the magic costs, and who pays it. If the answer is ever 'no one', you have not looked hard enough." },
      },
      choices = {
        { text = "What it costs, and who pays. I'll ask. Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "Many do, and I do not resent it. The Arch Druid's people look down on this terrace from the Enclave and see the first step on an old road. It is my task to show them, year upon year, that we do not take the second. So far they have let me go on showing it." },
      },
      choices = {
        { text = "Year upon year. That's patience. Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
  },

  topics = {
    burning_legion = { { id = "tp_burning_legion", text = "The Legion came because our people would not stop drinking from the Well. I keep that before me whenever a student asks for more." } },
    background = { { id = "tp_background", text = "I teach enchanting in Darnassus, in the open, by leave of the Temple. I keep to the limits of the craft and I teach others to." } },
    highborne = { { id = "tp_highborne", text = "They believed there was no cost. Every lesson I give is an argument against them." } },
    queen_azshara = { { id = "tp_queen_azshara", text = "I do not speak that name at my bench. What was done in it is reason enough for every rule I keep." } },
    advice = { { id = "tp_advice", text = "Ask what the magic costs, and who pays. If you cannot answer, do not cast." } },
    _none = { { id = "tp_none", text = "That lies outside my craft, and I do not speak beyond what I know. The Temple may answer you." } },
  },
}

---------------------------------------------------------------------------
-- Me'lynn
---------------------------------------------------------------------------
P:NPC {
  key = "melynn", id = TODO_NPC("Me'lynn"), name = "Me'lynn", title = "Tailoring Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "proud", "generous" }, values = { "craft", "beauty" },
  notices = { "craft", "class" },

  impression = {
    first = "Me'lynn teaches tailoring on the Craftsmen's Terrace and regards a well-cut cloak as an act of devotion. She is proud of her students and says so, which they find more alarming than criticism.",
    third = "{name} met Me'lynn, the tailoring trainer of Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome to my bench. Stand in the light a moment. Yes. Whoever cut that for you meant well." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and you have let the collar fray. Sit. We shall mend it while we talk." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor! Let me see your hands. Needle calluses, good, and in the right places. Whose student are you?" },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You touched the selvage of that bolt before you looked at the colour. Someone taught you properly. Grondal Moonbreeze of Auberdine, perhaps? I know his students by their caution." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. The Temple's robes are cut on this terrace, every one, and I can tell you the Sisters are far harder on a hem than any warrior." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Me'lynn, and I teach the tailor's craft to Darnassus. Cloth is the first thing a child is wrapped in and the last thing any of us wears, and I think that entitles it to be done well. I will teach anyone who agrees." },
        { id = "h_tailor", when = { profession = "Tailoring" }, text = "You have made a start. I can take you further, when you have the cloth. Elynna sells thread and dye just there, and she will tell you honestly which bolt is the better." },
      },
      again = {
        { id = "h_again", text = "Ask, and thread that needle for me while you do." },
        { id = "h_again2", text = "What else? I can talk and cut together; I have had practice." },
        { id = "h_again3", text = "Something more? Good. I like a curious student." },
      },
      choices = {
        { text = "Teach me tailoring.", next = "BUSINESS" },
        { text = "You think of cloth as devotion.", next = "devotion" },
        { text = "Who do you sew for?", next = "sew" },
        { text = "You studied under someone yourself, surely.", next = "teacher" },
        { text = "How do I keep silk from slipping as I cut?", next = "xtailor", when = { profession = "Tailoring" } },
        { text = "Does it trouble you to sew for war?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Elune-adore, Me'lynn.", next = "END" },
      },
    },
    devotion = {
      lines = {
        { id = "devotion_default", text = "I do. The priestess prays with her voice, and the Sentinel with her glaive. I pray with a seam. When I cut a robe for the Temple I think of who will wear it and what she will ask of Elune in it, and I make sure nothing I have done will distract her." },
      },
      choices = {
        { text = "That's a great deal to ask of a robe.", next = "devotion2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    devotion2 = {
      lines = {
        { id = "devotion2_default", text = "It is exactly enough to ask. A sleeve that binds at the elbow has interrupted a prayer. A hem that drags has tripped a healer on her way to the wounded. I have seen both. So I teach that there is no such thing as a small fault." },
      },
      choices = {
        { text = "Care in small things is its own worship.", next = "BACK", reply = "You understand me. I shall make a tailor of you yet.", fx = { align = { light = 1 } } },
        { text = "It's cloth. Don't make a faith of it.", next = "BACK", reply = "Then you may wear a sack, and I shall pray for your elbows.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sew = {
      lines = {
        { id = "sew_default", text = "The Temple, first. Then the Sentinels, for cloaks and tabards. And now half the Alliance, it seems, who arrive in good wool that is far too hot for this island. I have learned to cut for a human's shoulders, and I confess I enjoyed the puzzle." },
      },
      choices = {
        { text = "And for the Enclave?", next = "sew2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sew2 = {
      lines = {
        { id = "sew2_default", text = "The druids wear what the forest gives and call it humility. Arch Druid Staghelm's robes, however, are mine, and he sent the first set back because the antlers on the mantle were not precisely even. I measured them. They were. I altered them all the same." },
      },
      choices = {
        { text = "Wise, with an Arch Druid. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    teacher = {
      lines = {
        { id = "teacher_default", text = "My mother, in a city that is under the sea now. She sewed for the lesser houses of the Highborne, and she taught me on scraps of silk finer than anything made since. I have one of her needles. I do not use it. I only like to know where it is." },
      },
      choices = {
        { text = "What became of her craft?", next = "teacher2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher2 = {
      lines = {
        { id = "teacher2_default", text = "It is here. Every student I teach is stitching her seam without knowing it, and theirs will teach it on. The Sundering took the city and the silk. It did not take the way she turned a corner. I find a great deal of comfort in that." },
      },
      choices = {
        { text = "So should you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xtailor = {
      lines = {
        { id = "xtailor_default", text = "Lay it on a second cloth, plain linen, and cut through both. Weight it; never pin it, for silk remembers every hole. And cut in the morning. Your hands are steadier and the light on this terrace is truer before noon." },
      },
      choices = {
        { text = "Linen beneath, and no pins. Thank you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "It did, until I thought it through. A tabard tells a frightened recruit who stands beside her. A good cloak keeps a scout alive through a wet night in Ashenvale. I am not sewing for the war. I am sewing for the ones we send into it." },
      },
      choices = {
        { text = "For the ones we send. Yes. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    elune = { { id = "tp_elune", text = "I sew Her priestesses' robes, and I say a word over every hem. It keeps my stitches honest." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess wears my work, and has never once asked for it grander. I think the better of her for that." } },
    background = { { id = "tp_background", text = "I teach tailoring on the Craftsmen's Terrace. The Temple's robes and the Sentinels' cloaks begin at my bench." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Sisters are my most exacting patrons. I would not have it otherwise." } },
    highborne = { { id = "tp_highborne", text = "My mother sewed for their lesser houses. I kept her craft and none of their pride, or so I hope." } },
    advice = { { id = "tp_advice", text = "Cut in the morning, and never pin silk. The rest I would have to show you." } },
    _none = { { id = "tp_none", text = "I could not tell you. Ask at the Temple, or ask Alegorn; a cook hears everything." } },
  },
}

---------------------------------------------------------------------------
-- Eladriel
---------------------------------------------------------------------------
P:NPC {
  key = "eladriel", id = TODO_NPC("Eladriel"), name = "Eladriel", title = "Skinning Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "blunt", "respectful" }, values = { "nature", "craft" },
  notices = { "craft", "class" },

  impression = {
    first = "Eladriel teaches skinning on the Craftsmen's Terrace, bluntly, and insists her students thank the animal before the first cut. She has no patience for waste and a good deal for beginners.",
    third = "{name} met Eladriel, the skinning trainer of Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "If you have come to learn the knife, good. If you have come to be squeamish, the Temple Gardens are that way." },
    { id = "g_back", when = { metBefore = true }, text = "Back. Show me your last hide, or tell me honestly why you did not bring it." },
    { id = "g_skin", when = { profession = "Skinning" }, text = "A skinner, by the nick on your thumb. Everyone has that one. Let me see whether you have learned from it." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "Your knife is sharp and your sheath is clean. Half my students manage one or the other." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Then you have already killed it, and the question is only whether you will let the rest go to the crows. I teach people not to." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You are going to tell me the beast's spirit is owed respect. I teach the same. We will get on, once you stop looking at my knife like that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Eladriel, and I teach skinning. When a beast is taken, for food or in defence, its hide is a gift, and to leave it on the ground is an insult to the beast and to the forest. I teach the cut, and I teach the thanks, in that order of difficulty." },
        { id = "h_skin", when = { profession = "Skinning" }, text = "You have the beginnings. I can show you the harder hides when you are ready for them. Telonis will take what you bring, if your cuts are straight." },
      },
      again = {
        { id = "h_again", text = "Ask. I will be plain." },
        { id = "h_again2", text = "What else?" },
        { id = "h_again3", text = "Go on. I am only honing." },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "You make students thank the animal.", next = "thanks" },
        { text = "What makes a good skinner?", next = "good" },
        { text = "Where do your students practise?", next = "practise" },
        { text = "How do I take a hide off without tearing the belly?", next = "xskin", when = { profession = "Skinning" } },
        { text = "Lotherias says you think nobody else can skin a hare.", next = "xloth", when = { heardLine = "lotherias.rv2_default" } },
        { text = "The Circle taught me to take only what's needed.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Sharp knife, Eladriel.", next = "END" },
      },
    },
    thanks = {
      lines = {
        { id = "thanks_default", text = "I do, aloud. They feel foolish the first time, which is the purpose. A student who has said thank you to a dead stag in front of six others does not afterward leave half of it to rot. I have never found a quicker cure for carelessness." },
      },
      choices = {
        { text = "Is it only a trick, then?", next = "thanks2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thanks2 = {
      lines = {
        { id = "thanks2_default", text = "No. It began as how I was taught, and I believe it. The druids say that what dies in the forest returns to it. The hide I take does not return, so something is owed. A word is very little. It is still more than nothing." },
      },
      choices = {
        { text = "A debt acknowledged is half paid.", next = "BACK", reply = "That is how I see it. The other half is using every scrap.", fx = { align = { light = 1 } } },
        { text = "The stag can't hear you. Save your breath.", next = "BACK", reply = "Perhaps not. I can hear me, and so can the student. That is who it is for.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    good = {
      lines = {
        { id = "good_default", text = "A sharp knife, a slow hand, and no pride. The quick ones cut through and ruin the hide. The proud ones will not ask where to start. Give me a slow, humble student with a dull knife, and I can at least sharpen the knife." },
      },
      choices = {
        { text = "And what ruins the most hides?", next = "good2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good2 = {
      lines = {
        { id = "good2_default", text = "Hurry, and fear of the smell. They want it done, so they pull where they should cut. I make every new student skin one strider with me standing behind and saying 'slower' until they want to throw the knife at me. After that they are generally sound." },
      },
      choices = {
        { text = "Slower. I can hear it already. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    practise = {
      lines = {
        { id = "practise_default", text = "On the nightsabers and striders of the slopes below the city, and only on what the hunters have taken for meat. Nothing is killed for my lessons. Jocaste's hunters send word when they have a kill, and my students run. It keeps them fit." },
      },
      choices = {
        { text = "And the creatures near the furbolgs?", next = "practise2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    practise2 = {
      lines = {
        { id = "practise2_default", text = "Those I forbid. The hides from about Ban'ethil come up with a green cast at the roots of the fur, and the leather stinks when it cures. I sent one to the Enclave to be looked at. They kept it, and nobody has told me why, which I take as an answer." },
      },
      choices = {
        { text = "An answer of a kind. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    xskin = {
      lines = {
        { id = "xskin_default", text = "Start at the hind leg, never the belly, and cut with the edge turned up, away from the flesh. Use your fist to part hide from meat wherever you can; the knife is only for where it will not let go. Most tears come from cutting where one should push." },
      },
      choices = {
        { text = "Fist first, knife after. Thank you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xloth = {
      lines = {
        { id = "xloth_default", text = "Did she? Well, she cannot. She takes the ears off. I have told her so for three hundred years. Her finishing is the best on the terrace, I will give her that, and you may tell her I said it, since she will never believe it from me." },
      },
      choices = {
        { text = "I'll tell her about the finishing. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "Then you were taught well, and we do not disagree. I teach the same thing from the other side: when something has been taken, take all of it. Need at one end and no waste at the other. Between the two of us the beast is honoured as well as it can be." },
      },
      choices = {
        { text = "Need and no waste. Agreed. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach skinning on the Craftsmen's Terrace. The cut, and the thanks, and no waste." } },
    furbolgs = { { id = "tp_furbolgs", text = "The hides from near the Gnarlpine have a green cast at the root. I will not have them at my bench." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids and I want the same thing for the forest. We merely stand at different ends of the knife." } },
    advice = { { id = "tp_advice", text = "Slower. Whatever you are doing with a knife, slower." } },
    _none = { { id = "tp_none", text = "I do not know. I know hides. Ask someone who knows whatever that is." } },
  },
}

---------------------------------------------------------------------------
-- Astaia
---------------------------------------------------------------------------
P:NPC {
  key = "astaia", id = TODO_NPC("Astaia"), name = "Astaia", title = "Fishing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "serene", "sly" }, values = { "patience", "peace" },
  notices = { "craft", "race" },

  impression = {
    first = "Astaia teaches fishing on the bank in the Temple Gardens and has a calm that seems to spread to whoever sits near her. She has firm opinions about clams and a soft spot for octopus.",
    third = "{name} met Astaia, who teaches fishing in the Temple Gardens of Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Sit, if you like. The fish do not mind company, so long as it does not fidget." },
    { id = "g_back", when = { metBefore = true }, text = "You are back at the water. It is good for you. I can see it has been a long week." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "You hold yourself like someone who has waited on a line before. Welcome. Cast where you please." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "That pole has seen salt water. Rut'theran, or further? Androl Oakhand ties his knots that way, if I am not mistaken." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Your people fish with great determination and a good deal of noise. The fish here are not used to it. They find it quite interesting." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Astaia, and I teach fishing here beside the Temple. It is the only craft I know that cannot be done in a hurry, and I think that is why the priestesses allow it so near their door. I can show you the cast, and I can show you the waiting." },
        { id = "h_fish", when = { profession = "Fishing" }, text = "You know how to wait. There is a little more I can teach you, and Voloren sells line and lures just along the bank." },
      },
      again = {
        { id = "h_again", text = "Ask. Softly, there is one nosing the lure." },
        { id = "h_again2", text = "What else? We have time. One always has, here." },
        { id = "h_again3", text = "Something more? Watch the float while you ask." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "Fishing beside the Temple seems bold.", next = "temple" },
        { text = "What's worth catching here?", next = "catch" },
        { text = "You seem very much at peace.", next = "peace" },
        { text = "Talaelar fishes this lake too, I hear.", next = "xtal", when = { heardLine = "talaelar.la_default" } },
        { text = "What's the trick to casting under the bridge?", next = "xfish", when = { profession = "Fishing" } },
        { text = "I've never held a pole. Is it too late to learn?", next = "xnew", when = { race = { "Human", "Gnome", "Dwarf" } } },
        { text = "Quiet waters, Astaia.", next = "END" },
      },
    },
    temple = {
      lines = {
        { id = "temple_default", text = "I asked leave, long ago, and the High Priestess said that anyone who could sit so still for so long was welcome to. The Sisters say the lake is for reflection. I reflect, with a line in. Nobody has ever been able to say precisely why that is not allowed." },
      },
      choices = {
        { text = "And Sister Aquinne doesn't object?", next = "temple2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    temple2 = {
      lines = {
        { id = "temple2_default", text = "Aquinne runs the Temple kitchen, and she objects to nothing that arrives fresh. We have an understanding. I send her what I catch, and she sends her novices to me when they are too anxious to pray. An hour on this bank does them more good than a scolding." },
      },
      choices = {
        { text = "That's a kind use of a quiet craft.", next = "BACK", reply = "I think so. Half the Sisterhood has learned patience holding one of my poles.", fx = { align = { light = 1 } } },
        { text = "The novices should be at their prayers.", next = "BACK", reply = "They are. They simply do not know it until the float bobs.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    catch = {
      lines = {
        { id = "catch_default", text = "In the lake, small silver darters and now and then an old longjaw. From Rut'theran, at the roots, the sea fish, and octopus if you are fortunate. I am very fond of octopus. Clams I cannot abide. They are sand with ambitions." },
      },
      choices = {
        { text = "Sand with ambitions?", next = "catch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    catch2 = {
      lines = {
        { id = "catch2_default", text = "You dig for them, which is not fishing. You pry them open, which is not cooking. And then there is a mouthful of grit for your trouble. Aquinne adores them. It is the one thing we have ever quarrelled over, and we have known each other since before this tree." },
      },
      choices = {
        { text = "I'll keep my clams to myself. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    peace = {
      lines = {
        { id = "peace_default", text = "I worked at it. I was a Sentinel, a long while ago, and I was not peaceful then. After Hyjal I found I could not sleep unless I had sat by water first. So I sat by water. After a century or so it seemed foolish not to bring a pole." },
      },
      choices = {
        { text = "You earned your quiet. Keep it.", next = "BACK", reply = "I intend to. But thank you for the permission; some do not give it.", fx = { align = { order = -1 } } },
        { text = "A Sentinel's skills are needed still.", next = "BACK", reply = "They are, and others have them. What I have now, fewer do, and it is needed also.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtal = {
      lines = {
        { id = "xtal_default", text = "He does. He thinks I do not see him, under the bridge, at dusk. I have been not seeing him for sixty years. He was at Ashenvale, and he came home quiet, and if a line in the Temple's lake keeps him so, I can look at the lilies for a quarter hour." },
      },
      choices = {
        { text = "Then I never mentioned it. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    xfish = {
      lines = {
        { id = "xfish_default", text = "Side-arm, low, and let the line run out along the water before it drops. The longjaw lies in the shadow of the third pile. He has taken my lure eleven times. I have stopped trying to catch him. I only like to know he is there." },
      },
      choices = {
        { text = "Third pile. I'll say hello. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnew = {
      lines = {
        { id = "xnew_default", text = "It is never too late for this. It is nearly the only thing of which that is true. Take the short pole. Do not try to catch a fish. Try to hold still until you have forgotten you are holding still. The fish will see to the rest." },
      },
      choices = {
        { text = "Hold still, and forget. I'll try. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    burning_legion = { { id = "tp_burning_legion", text = "I fought them at Hyjal. I do not speak of it by the water, and the water is where I always am." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess gave me leave to fish her lake. She said that stillness was a kind of prayer, and I have tried to deserve it." } },
    background = { { id = "tp_background", text = "I teach fishing in the Temple Gardens. I was something louder once, and I prefer this." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Sisters lend me their lake and their anxious novices. I return the novices calmer." } },
    elune = { { id = "tp_elune", text = "I think She is in still water as much as in the moon. I have never said so on the Temple steps." } },
    advice = { { id = "tp_advice", text = "Do not try to catch the fish. Try to hold still. It comes to the same thing, and it is better for you." } },
    _none = { { id = "tp_none", text = "I do not know. Sit a while. It may come to one of us." } },
  },
}

---------------------------------------------------------------------------
-- Anishar
---------------------------------------------------------------------------
P:NPC {
  key = "anishar", id = TODO_NPC("Anishar"), name = "Anishar", title = "Rogue Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "wry", "watchful" }, values = { "discretion", "loyalty" },
  notices = { "class", "race" },

  impression = {
    first = "Anishar trains rogues in a quiet corner of the Cenarion Enclave, where the druids have agreed not to notice him. He is wry about the arrangement and serious about the work.",
    third = "{name} met Anishar, who trains rogues in the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_hello", text = "You found the door. Most do not. Close it behind you, if you would, and softly." },
    { id = "g_back", when = { metBefore = true }, text = "I heard you on the third stair. Better than last time. Come in." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "One of ours. You took the left-hand path round the pool, which is the one I would have taken. Sit." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You checked the rafters before you checked me. Syurna teaches that. I approve, though I was standing behind the door the whole time." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, down here. Your elders pretend this room is a root cellar. I should take it as a kindness if you went on pretending with them." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "An outlander, in the Enclave's cellar. Someone gave you good directions. I shall want to know who, before you leave." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Anishar. I teach those of our people whose service to Darnassus is done without banners. The Sentinels guard the walls, and the druids the wild. We see to what comes between the walls and the wild, quietly, and then we do not speak of it." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "You have chosen the quiet path, and you have come to learn more of it. Good. Tell me what you can do, and then I shall tell you what you cannot yet." },
      },
      again = {
        { id = "h_again", text = "Ask. Quietly." },
        { id = "h_again2", text = "What else would you know?" },
        { id = "h_again3", text = "Go on. The walls here are thick, and mostly loyal." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Rogues, in the druids' own Enclave?", next = "enclave" },
        { text = "What work do your students do?", next = "work" },
        { text = "Who else teaches here?", next = "others" },
        { text = "What's the first thing you unteach a new student?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Our city never spoke of people like you.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Stormwind has its own shadows. We might compare notes.", next = "xhuman", when = { race = "Human", class = "ROGUE" } },
        { text = "Unseen roads, Anishar.", next = "END" },
      },
    },
    enclave = {
      lines = {
        { id = "enclave_default", text = "It amuses me as well. The druids wanted us where they could watch us, and we wanted to be somewhere nobody would think to look. A hollow under the Arch Druid's own grove satisfied both. He has never once come down the stair. I am told he knows exactly how many of us there are." },
      },
      choices = {
        { text = "You don't sound fond of Staghelm.", next = "enclave2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    enclave2 = {
      lines = {
        { id = "enclave2_default", text = "I am a loyal servant of Darnassus, and he is its Arch Druid. I notice things for a living. I have noticed that he keeps his own counsel, and that the Temple and the Enclave say 'of course' to each other rather more often than people who agree. That is all I shall say in a room he owns." },
      },
      choices = {
        { text = "A watcher's loyalty is to the truth first.", next = "BACK", reply = "To the city first. But the city is poorly served by a comfortable lie, so they come to the same.", fx = { align = { honor = 1 } } },
        { text = "Best keep such thoughts unspoken.", next = "BACK", reply = "I generally do. You have an honest face, which is a hazard in my trade.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "work_default", text = "They listen, chiefly. In Ashenvale, at the edge of the Warsong camps. In Darkshore, where a cult has taken to the old ruins. Now and then in Auberdine and Astranaar, among our own, when something has been going astray. Nine parts in ten of this work is sitting very still near people who are talking." },
      },
      choices = {
        { text = "And the tenth part?", next = "work2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work2 = {
      lines = {
        { id = "work2_default", text = "Is why I teach the blade as well. I do not send a student out until she has satisfied me that she would prefer never to use it. The ones who are eager, I keep here another year and give to Erion Shadewhisper, who is less patient than I am and cures them faster." },
      },
      choices = {
        { text = "A sound test. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    others = {
      lines = {
        { id = "others_default", text = "Syurna, who is better with a lock than anyone living, and Erion Shadewhisper, who has charge of us and of matters I do not ask about. Between the three of us a student learns to enter, to listen, and to leave. In that order, and the third is the one that matters." },
      },
      choices = {
        { text = "To leave?", next = "others2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others2 = {
      lines = {
        { id = "others2_default", text = "Anyone can get into a place. The craft is in being elsewhere afterward, with nobody the wiser. I have had students who could pass a Sentinel at arm's length and then left a footprint in the dew. One footprint. It is always one footprint." },
      },
      choices = {
        { text = "I'll mind the dew. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xrogue = {
      lines = {
        { id = "xrogue_default", text = "Cleverness. Every new student wants to do the difficult thing, the rooftop, the disguise. I make them walk in at the front, carrying a basket, and be so dull that nobody remembers them. When they can be forgotten in daylight, I let them try the dark." },
      },
      choices = {
        { text = "Dull, with a basket. Understood. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "No. You were told of Sentinels and priestesses and druids, and that was meant kindly. But somebody learned the Gnarlpine had turned before they reached Dolanaar. Somebody knows how many axes are at the Warsong Lumber Camp tonight. We are the reason the city can afford to seem so serene." },
      },
      choices = {
        { text = "Then I'm glad of you. Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xhuman_default", text = "SI:7. Yes. We know of one another, as one knows of a neighbour through a wall. I shall not compare notes. But I shall tell you that your Master Shaw once sent a courteous letter to this cellar, which should not have been able to find it, and I have respected him ever since." },
      },
      choices = {
        { text = "That sounds like Shaw. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach in the Cenarion Enclave, in a room the druids call a root cellar. I shall leave it at that." } },
    warsong = { { id = "tp_warsong", text = "I can tell you how many of them there are at the Lumber Camp, to the axe. I cannot yet tell you how to make it fewer." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "A cult in Darkshore's ruins, praying for the end of things. My students listen at their fires. They do not sleep well after." } },
    advice = { { id = "tp_advice", text = "Be forgettable. It is worth more than being quick, or clever, or brave." } },
    _none = { { id = "tp_none", text = "I do not know. And if I did, I should need a reason to say so." } },
  },
}

---------------------------------------------------------------------------
-- Ulthir
---------------------------------------------------------------------------
P:NPC {
  key = "ulthir", id = TODO_NPC("Ulthir"), name = "Ulthir", title = "Alchemy Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "genial", "orderly" }, values = { "order", "generosity" },
  notices = { "craft", "race" },

  impression = {
    first = "Ulthir sells alchemy supplies on the Craftsmen's Terrace and keeps his vials in an order only he fully understands. He is genial, and quietly generous to apprentices.",
    third = "{name} met Ulthir, who sells alchemy supplies in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Good day! Vials, herbs and the odd pestle. Mind the lower shelf; it is arranged." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Empty vials, I expect. They never seem to come home, do they?" },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist! Tell me what you are brewing, and I shall tell you which vial will not crack." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "Your fingertips are three colours. I would guess healing draughts, something for swiftness, and one experiment you would rather not discuss." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! One of your people sold me a vial with a little brass tap on it. I cannot sell it, for nobody here trusts a tap, but I keep it on the top shelf and admire it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ulthir, and I supply the alchemists of this terrace: Ainethil, young Milla and all their students. I do not brew. Someone must stand still and know where everything is, and I find I have a gift for that." },
      },
      again = {
        { id = "h_again", text = "Anything else? I am only counting corks." },
        { id = "h_again2", text = "Ask away." },
        { id = "h_again3", text = "Something more? Let me put this down." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Your shelves are arranged very particularly.", next = "shelves" },
        { text = "You know the alchemists well.", next = "alch" },
        { text = "Where do your herbs come from?", next = "herbs" },
        { text = "Which vial for a potion that fumes?", next = "xalch", when = { profession = "Alchemy" } },
        { text = "I gather herbs. Do you buy?", next = "xherb", when = { profession = "Herbalism" } },
        { text = "Good day, Ulthir.", next = "END" },
      },
    },
    shelves = {
      lines = {
        { id = "shelves_default", text = "They are. By the phase of the moon under which each herb should be gathered, and within that by how badly it reacts with its neighbours. Ainethil says it is impossible to find anything. I say nothing on my shelves has ever caught fire, which is more than she can say of hers." },
      },
      choices = {
        { text = "Has anything of hers?", next = "shelves2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shelves2 = {
      lines = {
        { id = "shelves2_default", text = "Twice, and once memorably. She stored firebloom above fadeleaf, and I had told her. The smoke hid the whole terrace for an hour, and Alegorn served his stew by touch. She has never thanked me for being right, and she has stored them my way since." },
      },
      choices = {
        { text = "Order prevents disasters. Stand by it.", next = "BACK", reply = "I do. Quietly, and with a bucket of sand to hand.", fx = { align = { order = 1 } } },
        { text = "A little chaos is how discoveries happen.", next = "BACK", reply = "So Milla tells me. I sell her the cracked vials for exactly that purpose.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alch = {
      lines = {
        { id = "alch_default", text = "Better than they know themselves. Ainethil buys the same forty things every month and is a marvel with them. Milla buys two of everything, in case. And Firodren, the herbalist, brings me what his students pick, and I pay them a little over, so they will go on picking." },
      },
      choices = {
        { text = "You're soft on the apprentices.", next = "alch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alch2 = {
      lines = {
        { id = "alch2_default", text = "I am. I was a very bad apprentice alchemist myself, eight thousand years ago. My master told me, kindly, that I had a fine head for stock. He was right, and I have been grateful ever since. So I try to be kind to the ones who are still finding out what they are for." },
      },
      choices = {
        { text = "That's well done. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    herbs = {
      lines = {
        { id = "herbs_default", text = "From the slopes of the tree, mostly, and they come up strong here, stronger than the same herb on the mainland. Some from Darkshore and Ashenvale, when the gatherers can get them. Those have been fewer, and I check each bundle from the mainland twice." },
      },
      choices = {
        { text = "Check them for what?", next = "herbs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs2 = {
      lines = {
        { id = "herbs2_default", text = "A grey bloom on the stem, and a sour smell. It has come in on bundles from near Darkshore's furbolg dens and from western Ashenvale. I burn those, and I send a note to the Enclave each time. I have sent eleven notes this year. I sent none the year before." },
      },
      choices = {
        { text = "Eleven is too many. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    xalch = {
      lines = {
        { id = "xalch_default", text = "The leaded crystal, with the ground stopper, never cork. And fill it only to the shoulder. I have swept up a great many imbued vials that someone filled to the neck and then set in the sun." },
      },
      choices = {
        { text = "To the shoulder, ground stopper. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xherb = {
      lines = {
        { id = "xherb_default", text = "Gladly, if it is clean and cut above the root. I pay fairly for the common ones and well for briarthorn and bruiseweed, which nobody wants to pick. Milla will try to buy them from you first, at her own bench. Let her; she needs the practice haggling." },
      },
      choices = {
        { text = "I'll let her haggle. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    highborne = { { id = "tp_highborne", text = "They kept their reagents in crystal that sang, I have read. Mine merely sit where I put them, and I prefer it." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The Enclave reads my notes about spoiled herbs and never answers. I go on writing them; someone should." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels send for healing draughts by the crate before every patrol to Ashenvale. The crates have grown larger." } },
    background = { { id = "tp_background", text = "I sell alchemy supplies on the Craftsmen's Terrace. I know where everything is, which on this terrace makes me unusual." } },
    furbolgs = { { id = "tp_furbolgs", text = "Herbs from near their dens come in with a grey bloom on the stem. I burn them and I write to the Enclave." } },
    teldrassil = { { id = "tp_teldrassil", text = "Everything grows strong on this tree. The alchemists have had to learn to use less." } },
    advice = { { id = "tp_advice", text = "Never fill a vial past the shoulder, and never store firebloom above anything you are fond of." } },
    _none = { { id = "tp_none", text = "That I could not tell you. If it were on a shelf, I should know exactly where." } },
  },
}

---------------------------------------------------------------------------
-- Vaean
---------------------------------------------------------------------------
P:NPC {
  key = "vaean", id = TODO_NPC("Vaean"), name = "Vaean", title = "Enchanting Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "cool", "precise" }, values = { "discretion", "order" },
  notices = { "craft", "class" },

  impression = {
    first = "Vaean sells rods, vials and the plainer makings of enchantment beside Taladan's bench. She is cool and exact, and she watches what her customers buy with a custodian's care.",
    third = "{name} met Vaean, who sells enchanting supplies in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Good day. Rods, vials and thread of silver. Tell me what you mean to make, and I shall tell you what you need." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. I recall what you bought. Did it serve?" },
    { id = "g_ench", when = { profession = "Enchanting" }, text = "An enchanter. Then you will know to hold the rod by the grip, which my last customer did not." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "You have used a copper rod past its time; I can see the pitting. Replace it before it fails in your hand. That is advice, not salesmanship." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "A wielder of the arcane. I shall sell you what is on the table, as I would anyone. What is beneath it is for Taladan's students." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Vaean. I keep the supplies for the enchanters of Darnassus, and I keep a record of who buys them. That is the Temple's condition for our being here at all, and I find it a reasonable one." },
      },
      again = {
        { id = "h_again", text = "Yes? Ask." },
        { id = "h_again2", text = "What else do you require?" },
        { id = "h_again3", text = "Go on. I am listening." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You keep a record of every buyer?", next = "record" },
        { text = "How do you and Taladan work together?", next = "taladan" },
        { text = "What sells most?", next = "sells" },
        { text = "Which rod should I move up to next?", next = "xench", when = { profession = "Enchanting" } },
        { text = "Has anyone ever bought what they shouldn't?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Good day, Vaean.", next = "END" },
      },
    },
    record = {
      lines = {
        { id = "record_default", text = "Every one. Name, purchase and the day. It goes to the Temple at each new moon. Some customers dislike it and say so. I tell them that an enchanter with nothing to hide loses nothing by a line in a ledger, and that the other kind is why the ledger exists." },
      },
      choices = {
        { text = "Fair. Dangerous crafts should be watched.", next = "BACK", reply = "So the Temple judged, and I agree. It has let us keep this bench for a very long time.", fx = { align = { order = 1 } } },
        { text = "That's surveillance, however politely kept.", next = "BACK", reply = "It is. I had rather be watched and working than free and forbidden.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    taladan = {
      lines = {
        { id = "taladan_default", text = "He teaches and I supply, and each of us checks the other. If a student asks me for more essence than their lesson needs, I ask Taladan why. If he sets a lesson that would need it, he tells me first. In all these centuries we have disagreed twice." },
      },
      choices = {
        { text = "What about?", next = "taladan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taladan2 = {
      lines = {
        { id = "taladan2_default", text = "A student, both times. He thought the young man gifted, and I thought him greedy, for he bought as though he were filling a cellar. Taladan taught him two years longer than I would have. I will not say I was pleased to be right." },
      },
      choices = {
        { text = "Nobody would be. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    sells = {
      lines = {
        { id = "sells_default", text = "Copper rods, for the beginners, who break them. Vials, endlessly. And of late a good deal of silver thread to outlanders, who have their weapons enchanted here before they go to Ashenvale. I had not expected to supply half the Alliance's swords. The ledger has grown very long." },
      },
      choices = {
        { text = "Does that trouble the Temple?", next = "sells2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells2 = {
      lines = {
        { id = "sells2_default", text = "It interests the Temple. A dwarf's axe that glows is still a dwarf's axe, and it will be pointed at the Horde, so nobody objects. But I note which enchantments are asked for, and by whom, and whether the same face comes back too often. One learns a little about a war from what its soldiers ask of their blades." },
      },
      choices = {
        { text = "What do they ask for?", next = "sells3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells3 = {
      lines = {
        { id = "sells3_default", text = "At the start of the year, sharpness. Now it is mostly warding, and something to mend the bearer. That tells me the fighting has turned from winning to enduring. I wrote as much in the margin for the Temple. Nobody has told me I was wrong." },
      },
      choices = {
        { text = "A hard thing to read in a ledger. Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    xench = {
      lines = {
        { id = "xench_default", text = "Silver, when your hand is ready, and you will know it is ready when the copper begins to feel slow. Do not buy it before then. I have a drawer of silver rods returned by people who wanted to be further along than they were." },
      },
      choices = {
        { text = "When the copper feels slow. Thank you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "Once, that I caught. A scribe from the Temple itself, buying soul dust in small amounts over many months. Nothing in it was forbidden. But the sum was. I showed the ledger to the High Priestess's attendant. I was not told what followed, and the scribe no longer comes." },
      },
      choices = {
        { text = "The ledger earned its keep. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    warsong = { { id = "tp_warsong", text = "I know the war in Ashenvale by what its fighters ask to have laid on their blades. It has been all warding, of late." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids watch this terrace from above. I keep my ledger so that there is nothing for them to find." } },
    elune = { { id = "tp_elune", text = "The Temple holds my ledger, and so in a sense the Goddess reads over my shoulder. I write neatly." } },
    background = { { id = "tp_background", text = "I sell enchanting supplies in Darnassus, and I keep the Temple's record of who buys them." } },
    highborne = { { id = "tp_highborne", text = "They are the reason for my ledger. I think of them each time I rule a new page." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Temple permits this bench on conditions. I am one of the conditions, and I take that seriously." } },
    advice = { { id = "tp_advice", text = "Replace a pitted rod before it fails. And buy only what tonight's work needs." } },
    _none = { { id = "tp_none", text = "I have no record of that. Taladan may know, or the Temple." } },
  },
}

---------------------------------------------------------------------------
-- Voloren
---------------------------------------------------------------------------
P:NPC {
  key = "voloren", id = TODO_NPC("Voloren"), name = "Voloren", title = "Fishing Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "cheerful", "talkative" }, values = { "community", "leisure" },
  notices = { "craft", "race" },

  impression = {
    first = "Voloren sells line, lures and poles on the bank of the Temple Gardens and would plainly rather be using them. He is cheerful and talkative, and he lowers his voice only for the priestesses.",
    third = "{name} met Voloren, who sells fishing supplies in the Temple Gardens.",
  },

  greetings = {
    { id = "g_hello", text = "Good day! Poles, line, lures and bait. And a spot on the bank, which is free, if you can bear my talking." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more line? Something took the last lot, did it? Tell me it was big." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "A fisher! Sit, sit. What have you been catching, and where, and on what? In that order." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "That float's been chewed. Longjaw, by the tooth marks. You have been under the bridge, and I never saw you there." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human! Your people use a little wheel on the pole for the line. One of you showed me, and I have been trying to whittle one ever since. It keeps coming out square." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Voloren. Astaia teaches the fishing, just along the bank, and I sell what her students lose in the reeds. It is steady trade, for they lose a great deal, and it leaves me most of the day to watch the water." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up, the Sisters are indoors." },
        { id = "h_again2", text = "Ask away, I have nothing on but a float." },
        { id = "h_again3", text = "Something more? Good, I was running out of things to tell the ducks." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You'd sooner be fishing than selling.", next = "sooner" },
        { text = "Who fishes this bank?", next = "bank" },
        { text = "Is there much to catch from a tree?", next = "tree" },
        { text = "That reel. Let me show you how the pawl sits.", next = "xhuman", when = { race = { "Human", "Dwarf", "Gnome" }, profession = "Fishing" } },
        { text = "What bait for the old longjaw?", next = "xfish", when = { profession = "Fishing" } },
        { text = "Do the priestesses truly mind the noise?", next = "xnelf", when = { race = "NightElf" } },
        { text = "Tight lines, Voloren.", next = "END" },
      },
    },
    sooner = {
      lines = {
        { id = "sooner_default", text = "Wouldn't anyone? But a stall on the bank is the next best thing, and I can keep a line in while I mind it. Astaia says a float beside the counter is unprofessional. I say it is a display of the goods in use." },
      },
      choices = {
        { text = "Work and pleasure together. That's a life well arranged.", next = "BACK", reply = "I have always thought so! Tell Astaia, she listens to strangers.", fx = { align = { order = -1 } } },
        { text = "A shopkeeper should mind his shop.", next = "BACK", reply = "I am minding it. It is right there, behind the float.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bank = {
      lines = {
        { id = "bank_default", text = "Astaia's students, all elbows. Talaelar, the fish seller, at dusk, under the bridge, where he thinks nobody knows. Off-duty Sentinels, who cast as if they were throwing a glaive. And novices from the Temple, sent down to learn patience, poor things." },
      },
      choices = {
        { text = "Do the novices learn it?", next = "bank2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bank2 = {
      lines = {
        { id = "bank2_default", text = "Most do, in an afternoon. There was one who caught a darter on her first cast and shrieked so that Priestess Alathea came out to see who had been murdered. She is a full Sister now. She still comes down on feast days, and she still shrieks." },
      },
      choices = {
        { text = "Some things patience can't cure. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    tree = {
      lines = {
        { id = "tree_default", text = "More than you would think. The lake fills from the tree's own springs, and it was stocked when Darnassus was built. For salt water there is Rut'theran, at the roots, through the portal. Androl Oakhand teaches there, and he and I send each other customers and insults." },
      },
      choices = {
        { text = "Has the fishing changed at all?", next = "tree2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tree2 = {
      lines = {
        { id = "tree2_default", text = "The lake has not. But Androl says the catch at Rut'theran is thinner, and the boats from Darkshore talk of great dead things on the beaches. I sell more heavy line for the sea than I used to. People want to feel they have a little more between them and whatever is down there." },
      },
      choices = {
        { text = "I can't blame them. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    xhuman = {
      lines = {
        { id = "xhuman_default", text = "A pawl! So that is what stops it running back. I have been using a peg. Wait, let me fetch the last one I carved. If this works I shall name the first one after you, and sell it for a scandalous price." },
      },
      choices = {
        { text = "I'll want one at cost. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xfish = {
      lines = {
        { id = "xfish_default", text = "He has had every lure I sell, so I can tell you what does not work. Astaia has stopped trying. My own belief is that he wants something from the sea, an oily bit of Rut'theran mackerel. Take some, on the house, and come and tell me, so that I may say I knew." },
      },
      choices = {
        { text = "If he bites, you'll hear of it. Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "Less than they pretend. Priestess Alathea frowns from the steps, but I have seen her smile when a child lands a first fish. They mind shouting, and so I shout only when it is a very large one, and they forgive that as an act of nature." },
      },
      choices = {
        { text = "An act of nature. Fair enough. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    elune = { { id = "tp_elune", text = "The Sisters say the lake reflects Her. I say it also holds fish, and I see no quarrel between the two." } },
    sentinels = { { id = "tp_sentinels", text = "A Sentinel casts as though the float had insulted her. I sell them the heavy line and stand well back." } },
    explorers_league = { { id = "tp_explorers_league", text = "A dwarf of the League asked me for a net fine enough to sieve mud. I sold him three, and I did not ask." } },
    background = { { id = "tp_background", text = "I sell fishing supplies in the Temple Gardens. I also fish, while I am at it, as a display of the goods." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Sisters frown at me from the steps and send their novices down to my bank. I count that as approval." } },
    advice = { { id = "tp_advice", text = "Buy twice the line you think you need. The reeds here have taken more of it than the fish ever did." } },
    teldrassil = { { id = "tp_teldrassil", text = "The lake is as it always was. It is the sea at the roots that people have started to talk about." } },
    _none = { { id = "tp_none", text = "No idea! Ask Astaia; she knows a good deal and says about a tenth of it." } },
  },
}

-- Second sweep, Craftsmen's Terrace: the suppliers and the trainers who work beside the masters.

---------------------------------------------------------------------------
-- Fyldan
---------------------------------------------------------------------------
P:NPC {
  key = "fyldan", id = TODO_NPC("Fyldan"), name = "Fyldan", title = "Cooking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "placid", "droll" }, values = { "plenty", "patience" },
  notices = { "craft", "race" },

  impression = {
    first = "Fyldan sells salt, spice and flour beside Alegorn's fire on the Craftsmen's Terrace. He is placid and droll, and he has plainly heard every one of Alegorn's lessons a thousand times.",
    third = "{name} met Fyldan, who sells cooking supplies in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Good day. Salt, spice, flour and sweet oil. Alegorn will tell you what to do with them, at some length." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back, and so the last dish was either very good or very bad. I can sell you the cure for either." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook. Then I need not explain what the mild spices are for, and that saves us both a morning." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You have a burn on your wrist in the shape of a pan's rim. Every student of Alegorn's has one, and he calls it the first diploma." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Your people ask me for more salt than all of Darnassus together, and I have begun ordering with you in mind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Fyldan. Alegorn teaches the cooking, three paces to my left, and I sell what he tells his students to buy. It is a fine arrangement, for he does all of the talking and I do all of the sitting." },
      },
      again = {
        { id = "h_again", text = "What else may I weigh out for you?" },
        { id = "h_again2", text = "Ask. The spice will keep." },
        { id = "h_again3", text = "Yes? I am in no hurry, as you see." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You've heard all his lessons, I take it.", next = "lessons" },
        { text = "Where do spices come from, up a tree?", next = "spice" },
        { text = "Who else do you supply on this terrace?", next = "terrace" },
        { text = "What do you make of dwarven cooking?", next = "xdwarf", when = { race = { "Dwarf", "Human", "Gnome" } } },
        { text = "What does Alegorn get wrong?", next = "xcook", when = { profession = "Cooking" } },
        { text = "Good day, Fyldan.", next = "END" },
      },
    },
    lessons = {
      lines = {
        { id = "lessons_default", text = "Every one, and I could give them myself, in half the time. He begins each new student on spice bread, and each of them burns it, and he says the same kind thing to each. I have counted the words, and there are forty-one." },
      },
      choices = {
        { text = "You sound fond of him, all the same.", next = "lessons2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lessons2 = {
      lines = {
        { id = "lessons2_default", text = "I am. He has never once blamed my flour for a student's failure, and a lesser cook would have. When the bread burns he says the fire was eager, and when it rises he says the student has the gift. I think that is why they come back." },
      },
      choices = {
        { text = "Kindness makes better cooks than scolding does.", next = "BACK", reply = "So he holds, and the terrace eats well on it.", fx = { align = { order = -1 } } },
        { text = "A burnt loaf should be called a burnt loaf.", next = "BACK", reply = "Eladriel, across the way, would agree with you. Her students are quicker, and they cry more.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spice = {
      lines = {
        { id = "spice_default", text = "Up the same way as everything else, through the portal from Rut'theran. The mild spices are grown in Darkshore and Ashenvale, and the hot ones come by ship from the human lands. I had never sold a hot spice before the Alliance, and I am still not sure I approve of them." },
      },
      choices = {
        { text = "Has the war touched your supply?", next = "spice2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spice2 = {
      lines = {
        { id = "spice2_default", text = "The Ashenvale herbs come slower, and dearer, and sometimes not at all. The growers near the Warsong camps have left their gardens, and I do not blame them. I make up the lack with Darkshore leaf, and Alegorn pretends he cannot taste the difference." },
      },
      choices = {
        { text = "A small courtesy in a hard year. Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    terrace = {
      lines = {
        { id = "terrace_default", text = "Ainethil buys my salt for her alembics and will not say why. Lotherias buys sweet oil for her leather, which pains me, for it is good oil. And the priestesses send down for honey before every festival, by the crock." },
      },
      choices = {
        { text = "And Ainethil's salt? You've no guess?", next = "terrace2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    terrace2 = {
      lines = {
        { id = "terrace2_default", text = "I have a guess, and I shall keep it. An alchemist's secrets are her trade, as a cook's are his. But I notice that she buys the coarse salt and never the fine, and that Milla comes for it at dusk, when the terrace is empty. Make of that what you like." },
      },
      choices = {
        { text = "I'll make nothing of it, and say less.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    xdwarf = {
      lines = {
        { id = "xdwarf_default", text = "I think it honest and heavy, and I think it has taught Alegorn a great deal about beer. A dwarf stood here for an afternoon showing him how to braise in ale. The terrace smelled like a tavern for a week, and nobody complained." },
      },
      choices = {
        { text = "You'll be brewing your own before long. Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    xcook = {
      lines = {
        { id = "xcook_default", text = "He salts at the end, and I have told him for centuries that he should salt at the start. He says it is a matter of taste, and I say it is a matter of chemistry. Try both, and tell him which you preferred, but do not tell him that I asked." },
      },
      choices = {
        { text = "Salt first. I'll put it to the test. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell cooking supplies on the Craftsmen's Terrace. I sit beside Alegorn, and I have done so for a very long time." } },
    warsong = { { id = "tp_warsong", text = "The Ashenvale herb gardens near the orc camps stand empty. I feel that war first in my spice jars." } },
    elune = { { id = "tp_elune", text = "The Temple sends for honey before every festival. I like to think the Goddess has a sweet tooth." } },
    advice = { { id = "tp_advice", text = "Salt at the start, whatever Alegorn tells you. And buy more flour than the recipe says, for the first loaf never counts." } },
    _none = { { id = "tp_none", text = "I know flour and salt. For anything else, ask Alegorn, and bring a chair." } },
  },
}

---------------------------------------------------------------------------
-- Elynna
---------------------------------------------------------------------------
P:NPC {
  key = "elynna", id = TODO_NPC("Elynna"), name = "Elynna", title = "Tailoring Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "candid", "lively" }, values = { "honesty", "craft" },
  notices = { "craft", "class" },

  impression = {
    first = "Elynna sells thread, dye and bolts beside Me'lynn's loom and gives her honest opinion of each, asked or not. She would rather lose a sale than let a bad colour leave her stall.",
    third = "{name} met Elynna, who sells tailoring supplies in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Good day! Thread, dye and cloth. Tell me what you are making and I shall tell you which of these you should not buy." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Did the blue hold, or did it run? Be truthful, for I shall know by your cuffs." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor. Good. Show me your last seam before you choose a thread, and do not be shy about it." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Your needle hand is callused at the second finger, where the thimble should sit. You sew without one, and you sew a great deal." },
    { id = "n_caster", cat = "class", when = { class = { "PRIEST", "MAGE", "WARLOCK" } },
      text = "That robe was dyed in two lots, and the left sleeve came from the second. Nobody else will ever see it. I am sorry that I have." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Elynna. Me'lynn teaches the tailors of Darnassus, and I keep them in thread, and between lessons I tell them the truth about their colour sense. Somebody must, and she is too gracious to do it." },
      },
      again = {
        { id = "h_again", text = "What else? I have opinions to spare." },
        { id = "h_again2", text = "Ask me, and I shall be honest, as always." },
        { id = "h_again3", text = "Yes? Go on." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Which dye should nobody buy?", next = "dye" },
        { text = "You and Me'lynn make an odd pair.", next = "pair" },
        { text = "Where does your cloth come from?", next = "cloth" },
        { text = "Does the Temple buy its white from you?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "What's the hardest colour to hold?", next = "xtailor", when = { profession = "Tailoring" } },
        { text = "Farewell, Elynna.", next = "END" },
      },
    },
    dye = {
      lines = {
        { id = "dye_default", text = "The red, unless you have the mordant to go with it and the patience to use it. Without both it will be pink in a month and grey in a season. I say so to every buyer. Half of them buy it anyway, and they come back in a month to tell me I was right." },
      },
      choices = {
        { text = "Why stock it at all?", next = "dye2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dye2 = {
      lines = {
        { id = "dye2_default", text = "Because when it is done properly there is nothing like it, and the Sentinels' officers will have no other colour for their sashes. I would rather sell it with a warning than leave the terrace without a true red. Do you think I am wrong to?" },
      },
      choices = {
        { text = "No. Warn them, then let them choose.", next = "BACK", reply = "That is my view exactly. They are grown elves, most of them.", fx = { align = { order = -1 } } },
        { text = "Yes. Sell it only to those who can use it.", next = "BACK", reply = "Me'lynn says the same, and perhaps you are both right. I have not the heart to refuse them.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pair = {
      lines = {
        { id = "pair_default", text = "We do, and it works. She believes sewing is a devotion and speaks of it as a priestess would. I believe it is thread and cloth, and that a crooked hem is crooked however devoutly it was sewn. Her students need both of us, though they like her better." },
      },
      choices = {
        { text = "Does she mind your bluntness?", next = "pair2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pair2 = {
      lines = {
        { id = "pair2_default", text = "She asked for it. Long ago she told me that she could not bring herself to say a hard word to a child with a needle, and would I do it for her? I have been doing it ever since. She comforts them afterward, and so we are both of us useful." },
      },
      choices = {
        { text = "A fair division of labour. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    cloth = {
      lines = {
        { id = "cloth_default", text = "The linen is woven in Dolanaar and the wool comes from Darkshore. Silk I buy from Raedon Duskstriker's surplus, when the quartermaster has any to spare, which of late he has not. Every bolt in Darnassus seems to be going south to the war." },
      },
      choices = {
        { text = "What does a war want with silk?", next = "cloth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth2 = {
      lines = {
        { id = "cloth2_default", text = "Bandages, for the fine weaves, and banners, and linings for mail so that it does not chafe. Raedon collects it from every city in the Alliance. I gave him forty bolts of my own in the spring, and I should do it again, though my shelves have looked poor ever since." },
      },
      choices = {
        { text = "That was well done. Something else.", next = "BACK", fx = { trait = { generous = 1 } } },
      },
    },
    xpriest = {
      lines = {
        { id = "xpriest_default", text = "They buy the cloth and bleach it themselves, by moonlight, in the Temple Gardens. I offered once to do it for them and was told very sweetly that it is a rite and not a chore. I sell them the silver thread for the hems, and I am content with that." },
      },
      choices = {
        { text = "A rite and not a chore. That sounds like them.", next = "BACK", fx = { trait = { pious = 1 } } },
      },
    },
    xtailor = {
      lines = {
        { id = "xtailor_default", text = "Black, strange as that may sound. A true black wants three dippings and an iron mordant, and it will go green at the seams if you rush any of them. Trianna rushes them. Tell her I said so, for she has stopped listening to me." },
      },
      choices = {
        { text = "Three dippings. I'll be patient. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell tailoring supplies beside Me'lynn's loom. I also tell her students the truth, which she is too kind to do." } },
    warsong = { { id = "tp_warsong", text = "The war has taken my silk. Raedon gathers every bolt in the Alliance for bandages and banners." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Sisters bleach their own white by moonlight and call it a rite. I sell them the silver thread." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels' officers wear my red on their sashes. It is the one colour I never apologise for." } },
    advice = { { id = "tp_advice", text = "Hold the dye to daylight and to moonlight before you buy. A colour that is true in only one of them is a lie." } },
    _none = { { id = "tp_none", text = "I cannot tell you, and I shall not pretend to. Ask Me'lynn, who will be kinder about not knowing." } },
  },
}

---------------------------------------------------------------------------
-- Saenorion
---------------------------------------------------------------------------
P:NPC {
  key = "saenorion", id = TODO_NPC("Saenorion"), name = "Saenorion", title = "Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "meticulous", "mild" }, values = { "order", "craft" },
  notices = { "craft", "class" },

  impression = {
    first = "Saenorion sells thread, salt and dyes to the leatherworkers of Darnassus and keeps his stall in an order that is almost painful to look at. He apologised when I moved a spool.",
    third = "{name} met Saenorion, who sells leatherworking supplies in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome. Thread, salt, dye and wax, each in its place. Please ask before you lift anything, and I shall gladly fetch it for you." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it is you. I have put the coarse thread back where it was, since your last visit. Do not concern yourself." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker. You will want the heavy thread, third row, second from the left. I shall get it for you." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You have dye under three of your nails and each is a different colour. I mean no criticism at all. I only wonder how you bear it." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. If you skin what you shoot, salt the hide before the day is out. I sell the salt, and Eladriel will tell you the rest." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Saenorion. Telonis and Faldron teach the leatherworkers, Eladriel teaches the skinners, and Lotherias takes the orders. I supply all four of them, and I keep the only tidy bench on this side of the terrace." },
      },
      again = {
        { id = "h_again", text = "What else may I fetch for you?" },
        { id = "h_again2", text = "Please, ask. It is no trouble." },
        { id = "h_again3", text = "Yes? I am listening." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Yours is the only tidy bench here.", next = "tidy" },
        { text = "What do the leatherworkers use most?", next = "most" },
        { text = "How do you get on with your neighbours?", next = "neigh" },
        { text = "Which thread for nightsaber hide?", next = "xlw", when = { profession = "Leatherworking" } },
        { text = "Does Darianna buy from you?", next = "darianna" },
        { text = "Good day, Saenorion.", next = "END" },
      },
    },
    tidy = {
      lines = {
        { id = "tidy_default", text = "It is kind of you to notice. Leatherwork is a messy art, all scrapings and grease, and I find I cannot think in the midst of it. So I keep this one bench as it should be, and the others come to me when they cannot find their own awls." },
      },
      choices = {
        { text = "Do they find them?", next = "tidy2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tidy2 = {
      lines = {
        { id = "tidy2_default", text = "They find mine, which they borrow, and which come home a week later with somebody else's wax on the handle. I have marked each of them with a small notch, and I count them every evening. Telonis says I should have been a banker. Do you think it a fault, to care so much for order?" },
      },
      choices = {
        { text = "No. Order is what lets good work happen.", next = "BACK", reply = "Thank you. I shall tell Telonis that I have an ally.", fx = { align = { order = 1 } } },
        { text = "A little mess never hurt a craftsman.", next = "BACK", reply = "Lotherias says exactly that, usually while looking for her shears.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    most = {
      lines = {
        { id = "most_default", text = "Salt, by the sack, for curing. Then the heavy thread, and the black dye, because every young leatherworker wishes to make something black and dangerous to look at. After a year or two they discover brown, and their work improves a great deal." },
      },
      choices = {
        { text = "What's wrong with black?", next = "most2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    most2 = {
      lines = {
        { id = "most2_default", text = "Nothing, when it is earned. But black hides every flaw in the cutting, and a student who cannot see their mistakes will not mend them. Faldron makes his pupils work in undyed hide for a full year. They grumble, and I sell less dye, and he is entirely right." },
      },
      choices = {
        { text = "A hard rule, and a good one. Something else.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    neigh = {
      lines = {
        { id = "neigh_default", text = "Very well, on the whole. Telonis is grave and Faldron is gentle, and Eladriel is neither of those things. She once told me that my bench looked as though nobody had ever worked at it, and she meant it as an insult. I chose to take it as praise." },
      },
      choices = {
        { text = "And Lotherias?", next = "neigh2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neigh2 = {
      lines = {
        { id = "neigh2_default", text = "Lotherias works harder than any three of us and forgets to eat while she does it. Alegorn sends her a bowl, and I see that she has thread before she knows she is short of it. She has never thanked either of us, because she has never noticed, and we would both be embarrassed if she did." },
      },
      choices = {
        { text = "That's the best sort of kindness. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    xlw = {
      lines = {
        { id = "xlw_default", text = "The waxed sinew, doubled, and a curved needle. Nightsaber hide closes on a straight needle and will snap it. I learned that from Telonis, who learned it from breaking a great many needles, and it has saved my customers a fortune in steel." },
      },
      choices = {
        { text = "Doubled sinew and a curved needle. Thank you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    darianna = {
      lines = {
        { id = "darianna_default", text = "Daily, and in great haste, and she always knocks something over. She puts it back in the wrong place with the best will in the world. I have not the heart to correct her, and so I move it when she has gone. She will be a fine leatherworker, if the terrace survives her." },
      },
      choices = {
        { text = "Faldron says the same of her. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell leatherworking supplies on the Craftsmen's Terrace. Mine is the tidy bench." } },
    warsong = { { id = "tp_warsong", text = "The Sentinels order more harness than they ever did, and so I sell more thread. I should prefer a quieter trade." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids ask that no hide be wasted, and I agree with them. Waste is only disorder by another name." } },
    advice = { { id = "tp_advice", text = "Salt a hide the same day it is taken. And put your awl back where you found it." } },
    _none = { { id = "tp_none", text = "I am afraid that is outside my shelves. Telonis may know, for he has been here longer than I have." } },
  },
}

---------------------------------------------------------------------------
-- Telonis
---------------------------------------------------------------------------
P:NPC {
  key = "telonis", id = TODO_NPC("Telonis"), name = "Telonis", title = "Leatherworking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "grave", "exacting" }, values = { "craft", "respect" },
  notices = { "craft", "class" },

  impression = {
    first = "Telonis teaches leatherworking in Darnassus with a gravity that makes his apprentices stand straighter. He speaks of each hide as a debt owed to the beast that wore it.",
    third = "{name} met Telonis, who teaches leatherworking in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah. I teach the working of leather to those who will take the time to learn it properly. Have you the time?" },
    { id = "g_back", when = { metBefore = true }, text = "You return. Show me what you have made since we last spoke, and do not hide the seams from me." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "You have begun the craft already. Let me see your hands, and then your work, in that order." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Your stitches are even, but you pull them too tight, and the leather puckers at each one. You are afraid it will come apart, and it will not." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You wear plate over leather that was cut by somebody in a hurry. The metal has been forgiving it for you, and the metal will tire of that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Telonis. I have taught leatherworking on this terrace since Darnassus was grown, and in Ashenvale before it. Faldron takes the beginners now, and I take those who have stopped being proud of their first jerkin." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak. I am listening." },
        { id = "h_again3", text = "Go on." },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS" },
        { text = "Why only when the pride has gone?", next = "pride" },
        { text = "You taught in Ashenvale, before.", next = "ashen" },
        { text = "They say you think hurried leather cracks.", next = "hurry" },
        { text = "How do I stop pulling my stitches tight?", next = "xlw", when = { profession = "Leatherworking" } },
        { text = "What do you ask of the skinners?", next = "xskin", when = { profession = "Skinning" } },
        { text = "Elune be with you, Telonis.", next = "END" },
      },
    },
    pride = {
      lines = {
        { id = "pride_default", text = "Because a student who is pleased with their work has stopped looking at it. I wait for the day they bring me a piece and say that it is wrong and they cannot tell why. That is the first day I can teach them anything." },
      },
      choices = {
        { text = "And if that day never comes?", next = "pride2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pride2 = {
      lines = {
        { id = "pride2_default", text = "Then they stay with Faldron, who is gentler than I am, and they make serviceable boots for the rest of their lives. There is no dishonour in it, for the city needs boots. But I shall not spend my hours on a pupil who wants praise more than they want the craft." },
      },
      choices = {
        { text = "Right. A master's time is for the serious.", next = "BACK", reply = "So I have always held, and the work that leaves this terrace bears it out.", fx = { align = { order = 1 } } },
        { text = "A little praise might bring them further.", next = "BACK", reply = "Faldron says so, and he may be right, for his way keeps more of them at the bench.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ashen = {
      lines = {
        { id = "ashen_default", text = "At Astranaar, for a long age. The hides there were thicker and the beasts were older, and a leatherworker had all the time in the world. I came to Teldrassil with the first of us, because the new city needed its crafts, and I have not been back." },
      },
      choices = {
        { text = "Do you miss it?", next = "ashen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ashen2 = {
      lines = {
        { id = "ashen2_default", text = "I miss the stag hides. Nothing on this tree has grown slowly enough to make leather of that kind. I am told the orcs are felling the forest where I used to walk, and that they take the hides as well and tan them with fire. I try not to think about how." },
      },
      choices = {
        { text = "They'll answer for it. Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    hurry = {
      lines = {
        { id = "hurry_default", text = "It does. A hide wants a season to cure, and a seam wants a night to settle before it is waxed. The outlanders ask for armor by tomorrow, since they march tomorrow, and Lotherias obliges them. Her work is very good. It would be better if she had a month." },
      },
      choices = {
        { text = "The war won't give anyone a month.", next = "hurry2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurry2 = {
      lines = {
        { id = "hurry2_default", text = "No, and I know it. I am ten thousand years old and I am being asked to hurry by people who will live for sixty, and they are not wrong to ask. So I have begun teaching a quick seam as well as a true one. I tell my students which is which, and I do not let them confuse the two." },
      },
      choices = {
        { text = "That's wisdom, and no surrender. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xlw = {
      lines = {
        { id = "xlw_default", text = "Sew a practice strip each morning with thread that is too weak to pull. It will break every time your hand is heavy, and within a month your hand will have learned. I did it myself for a year, and I have not puckered a seam since the Sundering." },
      },
      choices = {
        { text = "Weak thread, every morning. I will. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xskin = {
      lines = {
        { id = "xskin_default", text = "I ask for straight cuts, and for a word of thanks to the animal, as Eladriel teaches. A hide taken in anger or in haste is easy to tell on the bench, because the knife wandered. Bring me the other kind and I shall pay you fairly for it." },
      },
      choices = {
        { text = "Straight cuts and thanks. Understood. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach leatherworking in Darnassus, and I taught it at Astranaar before the city was grown." } },
    warsong = { { id = "tp_warsong", text = "The orcs fell the forest where I once walked and tan its hides with fire. I do not speak of them calmly." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids and I agree that nothing taken from a beast should be wasted. We disagree only about how much may be taken." } },
    ashenvale = { { id = "tp_ashenvale", text = "I left the best stag hides in the world behind in Ashenvale. I think of them more often than a sensible elf should." } },
    advice = { { id = "tp_advice", text = "Let a seam rest a night before you wax it. Nothing made in a hurry was ever made twice as well." } },
    _none = { { id = "tp_none", text = "I do not know, and I shall not guess. Ask at the Temple, or ask the Arch Druid's people." } },
  },
}

---------------------------------------------------------------------------
-- Faldron
---------------------------------------------------------------------------
P:NPC {
  key = "faldron", id = TODO_NPC("Faldron"), name = "Faldron", title = "Leatherworking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "gentle", "encouraging" }, values = { "patience", "teaching" },
  notices = { "craft", "level" },

  impression = {
    first = "Faldron teaches the beginners of Darnassus to work leather and has a kind word for every crooked seam. His apprentice Darianna adores him, and he is quietly proud of her.",
    third = "{name} met Faldron, who teaches leatherworking to beginners in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome, welcome. Come and sit at the bench. Have you ever held an awl before, or shall we begin with which end is which?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you have come back to us! Good. Most of the craft is only coming back." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "You know the work a little, I can see. Then let us find the next thing you cannot yet do, and do it badly together." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You hold your awl like a dagger. There is no harm in that at all, since everybody begins so, but turn your wrist a little and it will stop fighting you." },
    { id = "n_young", cat = "level", when = { maxLevel = 12 },
      text = "You are new to the road, I think. It is a good time to learn a craft, while your hands are still willing to be told things." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Faldron, and I teach the first steps of leatherworking. Telonis takes my students when they are ready for a harder master. Until then they have me, and a bench, and as many scraps as they care to ruin." },
      },
      again = {
        { id = "h_again", text = "What else can I help you with?" },
        { id = "h_again2", text = "Ask anything. No question is too small at this bench." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS" },
        { text = "You let them ruin as much as they like?", next = "ruin" },
        { text = "Tell me about Darianna.", next = "darianna" },
        { text = "How do you and Telonis divide the teaching?", next = "divide" },
        { text = "What should a beginner make first?", next = "first" },
        { text = "Why undyed hide for the first year?", next = "xlw", when = { profession = "Leatherworking" } },
        { text = "Thank you, Faldron. Farewell.", next = "END" },
      },
    },
    ruin = {
      lines = {
        { id = "ruin_default", text = "I do, and gladly. Leather forgives nothing once it is cut, and so a student must cut wrongly a hundred times before they dare to cut rightly. Saenorion saves me the offcuts. I think he is only pleased to have them off his shelves." },
      },
      choices = {
        { text = "Doesn't Telonis object to the waste?", next = "ruin2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruin2 = {
      lines = {
        { id = "ruin2_default", text = "He did, once. I showed him that we use every scrap in the end, the smallest for lacing and the worst for glue, and he was satisfied. He and I want the same thing for our students. He simply wants it sooner and with fewer smiles." },
      },
      choices = {
        { text = "You're the better teacher for beginners.", next = "BACK", reply = "You are kind to say so. I think they need us both, at different hours.", fx = { align = { order = -1 } } },
        { text = "His rigor is what makes masters.", next = "BACK", reply = "It is, and I send them to him for exactly that. I only warm them first.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darianna = {
      lines = {
        { id = "darianna_default", text = "She is the quickest pupil I have had in an age, and the least patient. She will knock over a dye pot reaching for the next lesson before she has finished the last. But she looks, truly looks, at every piece that crosses the terrace, and that cannot be taught." },
      },
      choices = {
        { text = "She thinks you're never wrong.", next = "darianna2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darianna2 = {
      lines = {
        { id = "darianna2_default", text = "Then I have deceived the poor child, for I am wrong most mornings. I let her think it a little longer, because she works harder for a teacher she believes in. One day she will catch me in a mistake, and I shall congratulate her, and that will be the best lesson I ever give." },
      },
      choices = {
        { text = "A good teacher plans for that day. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    divide = {
      lines = {
        { id = "divide_default", text = "I take those who have never cut a hide, and he takes those who believe they have nothing left to learn. Mine are frightened of the knife and his are too fond of it. Sometimes I think we ought to trade for a week, and see what comes of it." },
      },
      choices = {
        { text = "What would come of it?", next = "divide2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    divide2 = {
      lines = {
        { id = "divide2_default", text = "My beginners would be in tears by midday, and his journeymen would have had a pleasant week and learned nothing. So we stay as we are. A teacher should know which pupils he is good for, and I am good for the frightened ones." },
      },
      choices = {
        { text = "That's worth knowing about oneself. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    first = {
      lines = {
        { id = "first_default", text = "A strap. It is only a strap, with two holes and a buckle, and it does not sound like much. But it must be straight, and even, and strong, and when you can make one that Telonis will not frown at, you can make half of everything else there is." },
      },
      choices = {
        { text = "A strap, then. I'll start there. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xlw = {
      lines = {
        { id = "xlw_default", text = "So that you can see what your knife has done. Dye is a kindness to the eye and a thief to the hand, for it hides the very faults you most need to find. Work plain for a year and you will never again cut a line you cannot account for." },
      },
      choices = {
        { text = "Plain hide for a year. I'll try it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach leatherworking to beginners on the Craftsmen's Terrace. Telonis has them after me." } },
    advice = { { id = "tp_advice", text = "Begin with a strap and make it well. Everything else in the craft is a strap that has grown ambitious." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels' harness is made on this terrace, some of it by my students. I check every buckle of theirs twice." } },
    elune = { { id = "tp_elune", text = "I am no priest. But I think the Goddess must be patient, to have made a people who take so long to learn." } },
    _none = { { id = "tp_none", text = "I am sorry, I do not know. Telonis might, and he will tell you more briefly than I should." } },
  },
}

---------------------------------------------------------------------------
-- Trianna
---------------------------------------------------------------------------
P:NPC {
  key = "trianna", id = TODO_NPC("Trianna"), name = "Trianna", title = "Tailoring Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "quick", "ambitious" }, values = { "skill", "novelty" },
  notices = { "craft", "race" },

  impression = {
    first = "Trianna teaches tailoring to Darnassus's beginners and sews faster than she talks, which is saying a good deal. She is fascinated by every outlander fashion that climbs the tree.",
    third = "{name} met Trianna, who teaches tailoring to beginners in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Good day! You have come to learn tailoring? Sit here, take this needle, and tell me about yourself while you thread it." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, good, it is you. Come and look at what I have made since you left, and tell me truly what you think." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "You sew! Then let me see what you are wearing. No, turn around, for I want the back seam." },
    { id = "g_camp", when = { questActive = TODO_QUEST("Camping 101: Tailoring") }, text = "You have the look of someone who has been sleeping on bare roots. Did they send you to me to learn how to furnish a camp?" },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "That collar is a Stormwind cut. I have been trying to copy it from memory for a month. Would you stand still for a little while so that I can see how it is set?" },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You finish your seams on the inside, where nobody will ever see. Me'lynn will love you for it. I think it a waste of thread, but she is the master here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Trianna. Me'lynn is the master tailor here, and I teach the ones who are just beginning, which leaves me time for my own work. And my own work, since the Alliance came, is finding out how everybody else in the world makes a sleeve." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, my needle is cooling." },
        { id = "h_again2", text = "Yes? Go on, I can sew and listen." },
        { id = "h_again3", text = "Something more? Good." },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS" },
        { text = "How does everybody else make a sleeve?", next = "sleeve" },
        { text = "You and Me'lynn sew very differently.", next = "melynn" },
        { text = "Elynna says you rush your black.", next = "black" },
        { text = "You can study this collar, if you like.", next = "xhuman", when = { race = { "Human", "Gnome", "Dwarf" } } },
        { text = "Do our own old patterns bore you?", next = "xnelf", when = { race = "NightElf" } },
        { text = "I was told you teach camp craft.", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Tailoring") } },
        { text = "Farewell, Trianna.", next = "END" },
      },
    },
    sleeve = {
      lines = {
        { id = "sleeve_default", text = "Badly, most of them, but so interestingly! The humans set theirs into the shoulder with a curved seam, which wastes cloth and looks very fine. The gnomes sew pockets into everything. And a dwarf told me he had never thought about sleeves in his life, and I believed him." },
      },
      choices = {
        { text = "Have you put any of it to use?", next = "sleeve2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sleeve2 = {
      lines = {
        { id = "sleeve2_default", text = "I made a robe with a human shoulder and a kaldorei drape, and I wore it to the Temple. Two priestesses asked me who had made it and one of the old matrons asked me whether I was unwell. I count that a success, on balance." },
      },
      choices = {
        { text = "New ideas keep a craft alive. Sew on.", next = "BACK", reply = "I intend to! Come back in a year, and half the terrace will be wearing curved seams.", fx = { align = { order = -1 } } },
        { text = "Some traditions shouldn't be cut about.", next = "BACK", reply = "The matron said so too. I have left her robes exactly as they were.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    melynn = {
      lines = {
        { id = "melynn_default", text = "We do. She sews as if each stitch were a prayer, slowly, and it is perfect. I sew as if somebody were waiting, and it is very nearly perfect, in a third of the time. She has never once told me to slow down. She only looks at my hems, and that is worse." },
      },
      choices = {
        { text = "Does she disapprove of the new cuts?", next = "melynn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    melynn2 = {
      lines = {
        { id = "melynn2_default", text = "She says that she has seen fashions come and go for some thousands of years and that this one will go as well. Then she asked me, very quietly, to show her the curved seam. She has not used it yet, but I caught her practising it on a scrap." },
      },
      choices = {
        { text = "I'll keep her secret. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    black = {
      lines = {
        { id = "black_default", text = "Elynna says a great many things, and that one is true. Three dippings take three days, and I had a robe promised in two. It went a little green at the seam, and the buyer did not notice, and Elynna did, from across the terrace." },
      },
      choices = {
        { text = "Did you tell the buyer?", next = "black2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    black2 = {
      lines = {
        { id = "black2_default", text = "I did, in the end. I went after her to the bank and offered to dye it again properly, and she said that she rather liked the green. So I learned two things, that I should not rush a black, and that Elynna does not know everything about what people like." },
      },
      choices = {
        { text = "Owning to it was the right thing.", next = "BACK", reply = "It kept me awake, otherwise. I am not made for secrets.", fx = { align = { honor = 1 } } },
        { text = "She was happy. You needn't have said anything.", next = "BACK", reply = "Perhaps not. But Elynna knew, and Elynna would have said it for me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xhuman_default", text = "May I? Hold your arm out. I see, it is cut in two pieces, and the under one is narrower! That is how it turns without pulling. I should never have guessed it. Thank you, truly, for you have saved me a month of ruined linen." },
      },
      choices = {
        { text = "Glad to be of use. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "They do not bore me. I love them, and I can sew every one of them in my sleep, which is the difficulty. I have been making the same robe since before the Sundering. Would you not want to try something else, after ten thousand years?" },
      },
      choices = {
        { text = "Perhaps I would, at that. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "I do, and gladly! A cook can give you a fire, but somebody must still sew the bedroll you lie on and the cloth that keeps the rain off your face, so start with a plain bolt of linen and you will be furnishing a camp of your own before long.", fx = { learn = { "camping" } } } },
      choices = { { text = "A bolt of linen first. Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach tailoring to beginners in Darnassus. In my own hours I study how the rest of the world cuts cloth." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "I wore a human-shouldered robe to the Temple, and the priestesses asked who made it. The matrons asked whether I was ill." } },
    explorers_league = { { id = "tp_explorers_league", text = "The dwarves of the League wear the same coat until it falls off them. I have offered to help, and they looked frightened." } },
    advice = { { id = "tp_advice", text = "Learn the old patterns until they bore you, and only then change them. I changed mine a little early." } },
    _none = { { id = "tp_none", text = "I have no idea! Ask Me'lynn, who has had a great deal longer than I have to find things out." } },
  },
}

---------------------------------------------------------------------------
-- Sylvanna Forestmoon
---------------------------------------------------------------------------
P:NPC {
  key = "sylvanna", id = TODO_NPC("Sylvanna Forestmoon"), name = "Sylvanna Forestmoon", title = "Alchemy Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "precise", "dry" }, values = { "knowledge", "caution" },
  notices = { "craft", "class" },

  impression = {
    first = "Sylvanna Forestmoon teaches alchemy at Ainethil's side and is drily exact about measures. She trusts a recipe more than a person, and she said as much.",
    third = "{name} met Sylvanna Forestmoon, who teaches alchemy in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Good day. If you have come to learn alchemy, I shall ask you first to put down anything you are carrying that might be flammable." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and you have both your eyebrows. That is better than most of my pupils manage in their first season." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist. Then you will not mind my asking what you last brewed and how far it went wrong." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "There is a stain on your sleeve that was a healing draught and is now something else. You let it boil. They always smell of pears when they have been boiled." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Your order gathers the herbs that I render down, and it has opinions about how many. I am always careful to count aloud when one of you is watching." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sylvanna Forestmoon. Ainethil is the master of this bench and Milla Fairancora teaches the very newest, and I have those who can be trusted near a flame but not yet alone with one. It is the longest stage, and some never leave it." },
      },
      again = {
        { id = "h_again", text = "What else do you wish to know?" },
        { id = "h_again2", text = "Ask, precisely, if you can." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS" },
        { text = "Why do some never leave that stage?", next = "stage" },
        { text = "What goes wrong most often?", next = "wrong" },
        { text = "What is it like, working under Ainethil?", next = "ainethil" },
        { text = "What does a boiled draught turn into?", next = "xalch", when = { profession = "Alchemy" } },
        { text = "Does the Enclave watch how much you gather?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Good day, Sylvanna.", next = "END" },
      },
    },
    stage = {
      lines = {
        { id = "stage_default", text = "Because they will not measure. They learn that a pinch more silverleaf does no harm in a weak draught, and they carry that habit up into the strong ones, where a pinch more will take the bench with it. I can teach anyone a recipe. I cannot teach respect for a scale." },
      },
      choices = {
        { text = "How do you deal with them?", next = "stage2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stage2 = {
      lines = {
        { id = "stage2_default", text = "I give them the same draught to make every day, until ten of them in a row are identical. Some manage it in a fortnight and one has been at it for three years. She is a pleasant girl, and she will never brew anything stronger than a tonic while I am here." },
      },
      choices = {
        { text = "Good. That caution saves lives.", next = "BACK", reply = "It has saved this terrace twice, to my certain knowledge.", fx = { align = { order = 1 } } },
        { text = "Three years is cruel. Let her try and learn.", next = "BACK", reply = "She may try it, on some other terrace, a long way downwind of this one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = {
        { id = "wrong_default", text = "Heat, nearly always. Our students think of fire as an enemy, as they have been taught, and so they either starve the flame or lose their heads when it flares. The humans who come to study are better at it. They have burned things all their lives and have no fear of it." },
      },
      choices = {
        { text = "Do you teach many outlanders?", next = "wrong2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong2 = {
      lines = {
        { id = "wrong2_default", text = "More each year. A gnome came for a season and rebuilt my alembic while I was at the Temple, without asking. It runs a third faster now, and I have not forgiven her. I use it every day." },
      },
      choices = {
        { text = "Sounds like a fair trade to me. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    ainethil = {
      lines = {
        { id = "ainethil_default", text = "It is instructive. She has forgotten more alchemy than I shall ever learn, and she is not being modest when she says so. She watches my hands rather than my results, and when she is displeased she says nothing at all and moves my salt a finger to the left." },
      },
      choices = {
        { text = "What is the coarse salt for?", next = "ainethil2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ainethil2 = {
      lines = {
        { id = "ainethil2_default", text = "Has Fyldan been wondering aloud again? It is no great mystery. She uses it to draw the water from moonwell clippings, for a work she does at the Temple's asking. I do not know what the work is. I have learned that when Ainethil wishes me to know a thing, she tells me." },
      },
      choices = {
        { text = "Then I'll not pry further. Something else.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    xalch = {
      lines = {
        { id = "xalch_default", text = "It becomes a mild purgative, and a very quick one. I do not recommend finding that out as my last pupil did, an hour before the Festival procession. Keep your draught below a simmer and it will stay what you meant it to be." },
      },
      choices = {
        { text = "Below a simmer. Noted, with feeling. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "It does, through Firodren Mooncaller, who teaches the herbalists and reports what is taken. I welcome it. A bench that could have all the herbs it wanted would brew a great deal that should never be brewed, and I had rather be kept short than be trusted too far." },
      },
      choices = {
        { text = "The Circle would be glad to hear it. Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach alchemy in Darnassus, under Ainethil. Mine are the students who are no longer new and not yet safe." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids count what we gather, and I count it with them. Nobody should be given all the herbs they want." } },
    highborne = { { id = "tp_highborne", text = "They also began with small measures taken carelessly. I think of them whenever a pupil says a pinch more cannot hurt." } },
    advice = { { id = "tp_advice", text = "Measure twice, and keep your draught below a simmer. Most of what goes wrong in alchemy is impatience with a flame." } },
    _none = { { id = "tp_none", text = "I have no recipe for that. Ask Ainethil, if she is in a mood to be asked." } },
  },
}

---------------------------------------------------------------------------
-- Lalina Summermoon
---------------------------------------------------------------------------
P:NPC {
  key = "lalina", id = TODO_NPC("Lalina Summermoon"), name = "Lalina Summermoon", title = "Enchanting Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "darnassus" }, temper = { "earnest", "careful" }, values = { "restraint", "learning" },
  notices = { "craft", "class" },

  impression = {
    first = "Lalina Summermoon teaches the middle steps of enchanting under Taladan and treats every lesson as a trust. She is earnest about it, and a little anxious, and I liked her for both.",
    third = "{name} met Lalina Summermoon, who teaches enchanting in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Elune-adore. You wish to learn enchanting? Then I must ask you something first, and I hope that you will not be offended by it." },
    { id = "g_back", when = { metBefore = true }, text = "You have returned. I am glad. Did the last working hold, and did you feel well after it?" },
    { id = "g_ench", when = { profession = "Enchanting" }, text = "You have the craft in your hands already, for I can feel the dust on you. Then you know what I am going to say about care." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "There is essence on your fingers that you have not washed away. Please do so before you touch anything of mine. It lingers, and it grows fond of whatever it touches." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "You work the arcane openly, as your people do. I shall teach you what Taladan permits, and I ask you to understand why he permits no more." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Lalina Summermoon. Taladan is the master enchanter here, and he has given the journeymen into my keeping. I teach them to draw the magic out of a made thing and lay it on another, and I teach them when to stop, which is the harder half." },
      },
      again = {
        { id = "h_again", text = "What else would you ask of me?" },
        { id = "h_again2", text = "Please, go on." },
        { id = "h_again3", text = "Yes? I am listening carefully." },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS" },
        { text = "What were you going to ask me?", next = "ask" },
        { text = "Why is enchanting so guarded here?", next = "guarded" },
        { text = "How is Taladan as a master?", next = "taladan" },
        { text = "How do I know when to stop?", next = "xench", when = { profession = "Enchanting" } },
        { text = "Would you have taught a Highborne?", next = "xmage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "Elune keep you, Lalina.", next = "END" },
      },
    },
    ask = {
      lines = {
        { id = "ask_default", text = "I ask every student why they want it. I have no wrong answer in mind. But I listen to how they say it. Those who want to mend and strengthen what they already have, I teach gladly. Those who speak only of power, I send to Taladan, and he decides." },
      },
      choices = {
        { text = "I want to make my gear serve me better.", next = "ask2", reply = "That is the answer I hope for, and the one I most often hear. Thank you.", fx = { align = { order = 1 } } },
        { text = "I want power. I won't pretend otherwise.", next = "ask2", reply = "You are honest, at least, and honesty is something. Taladan will want a word with you.", fx = { align = { order = -1 } } },
        { text = "I'd rather not say.", next = "ask2" },
      },
    },
    ask2 = {
      lines = {
        { id = "ask2_default", text = "Whatever your reason, the lessons are the same. You will take apart a great many small things before you are allowed to make a large one, and Vaean will write down everything you buy. We are watched here, and I am content to be." },
      },
      choices = {
        { text = "I understand. Something else.", next = "BACK" },
      },
    },
    guarded = {
      lines = {
        { id = "guarded_default", text = "Because of what we were. Our people once drew on the arcane without limit, and it called the Legion down on the world and broke it. Enchanting is a small art and a tame one, but it drinks from the same well. The Temple lets us practise it on conditions, and I think the conditions wise." },
      },
      choices = {
        { text = "Do you ever resent them?", next = "guarded2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guarded2 = {
      lines = {
        { id = "guarded2_default", text = "When I was younger, a little. I had a gift, and I was made to go slowly while clumsier students went at the same pace beside me. Then I watched one of Taladan's pupils go fast, and I saw what it did to his sleep and his temper. I have not resented going slowly since." },
      },
      choices = {
        { text = "A hard thing to witness. Something else.", next = "BACK", fx = { learn = { "highborne" } } },
      },
    },
    taladan = {
      lines = {
        { id = "taladan_default", text = "He is grave, and he is fair, and he has never raised his voice in all the years I have known him. He asks of every working what it costs and who pays. I used to think it a tiresome question. I now ask it of my own students, in his very words." },
      },
      choices = {
        { text = "What does a working cost?", next = "taladan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taladan2 = {
      lines = {
        { id = "taladan2_default", text = "It costs the thing that you unmake, first, since that is gone for good. Then it costs a little of the enchanter, each time, in weariness. And if it is done carelessly, it costs whoever must stand near. A sound working pays all of its own costs, and that is his whole teaching." },
      },
      choices = {
        { text = "A good rule for more than enchanting. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xench = {
      lines = {
        { id = "xench_default", text = "You stop when the work begins to feel easy. I know that sounds backward. But a difficult working keeps your attention, and an easy one invites you to try a little more. When your hands grow light and quick, put the rod down and walk about the terrace once." },
      },
      choices = {
        { text = "When it feels easy, stop. I'll remember.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xmage = {
      lines = {
        { id = "xmage_default", text = "No. I should not have been asked to, for they did not think they needed teaching. That was the whole of their fault, as I understand it. You have come and asked, and you have sat through my questions, and so you are already something they were not." },
      },
      choices = {
        { text = "I'll try to stay that way. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach enchanting in Darnassus, under Taladan. The journeymen are mine." } },
    highborne = { { id = "tp_highborne", text = "We practise a small tame art that drinks from their well. I teach my students to remember whose well it is." } },
    sisterhood_of_elune = { { id = "tp_sisterhood_of_elune", text = "The Temple permits us on conditions, and Vaean keeps the ledger. I have never found the conditions unjust." } },
    elune = { { id = "tp_elune", text = "I ask Her pardon before each large working. I have been told it is unnecessary, and I do it all the same." } },
    advice = { { id = "tp_advice", text = "Ask of every working what it costs and who pays. And when the work feels easy, put the rod down." } },
    _none = { { id = "tp_none", text = "I do not know, and I should not like to mislead you. Taladan may, if you ask him plainly." } },
  },
}

---------------------------------------------------------------------------
-- Mythrin'dir
---------------------------------------------------------------------------
P:NPC {
  key = "mythrindir", id = TODO_NPC("Mythrin'dir"), name = "Mythrin'dir", title = "General Trade Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "shrewd", "genial" }, values = { "commerce", "fairness" },
  notices = { "craft", "race" },

  impression = {
    first = "Mythrin'dir sells tools and trade goods to every craft on the terrace and knows what each of his neighbours will run out of before they do. He is shrewd and genial with it.",
    third = "{name} met Mythrin'dir, who sells general trade supplies in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Good day to you! Hammers, picks, knives, vials, thread and dye. If a craft needs it and has forgotten it, I am very likely holding it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let me guess, a mining pick? No? I was sure this time." },
    { id = "g_craft", when = { profession = { "Blacksmithing", "Mining", "Engineering" } }, text = "Ah, a worker of metal, here in Darnassus. You will find I am the only one on this terrace who stocks a hammer, and I am proud of it." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Mining" } },
      text = "You have forge-scale on your boots. There is no forge in Darnassus, as you may have found, so you have walked a long way with that hammer." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome. One of your people asked me for a spanner and I had to have it drawn for me. I stock six now, and they are gone within the week." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Mythrin'dir. Every other seller on this terrace keeps to one craft, and I keep the things that fall between them. I am the one they come to when a student has broken the only skinning knife or dropped a mortar off the edge of the terrace." },
      },
      again = {
        { id = "h_again", text = "What else can I find for you?" },
        { id = "h_again2", text = "Ask away, I have a little of everything." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Why is there no forge in Darnassus?", next = "forge" },
        { text = "You know what everyone will run short of.", next = "short" },
        { text = "What do outlanders ask for that you lack?", next = "lack" },
        { text = "Where does a smith work, on this tree?", next = "xsmith", when = { profession = { "Blacksmithing", "Mining", "Engineering" } } },
        { text = "Has the Alliance been good for trade?", next = "trade" },
        { text = "Good day, Mythrin'dir.", next = "END" },
      },
    },
    forge = {
      lines = {
        { id = "forge_default", text = "Because we live in a tree, friend, and the druids who grew it are not fond of furnaces. There is no vein to mine up here either. A night elf who wants to work metal goes down to Auberdine, or across the sea, and comes home smelling of smoke." },
      },
      choices = {
        { text = "And yet you sell hammers.", next = "forge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge2 = {
      lines = {
        { id = "forge2_default", text = "I do, to the dwarves and humans who arrive expecting an anvil and find a moonwell. They look so lost that I had not the heart to stock none. A hammer cannot harm the tree by lying on my table, as I explained to the druid who came to ask about it." },
      },
      choices = {
        { text = "Right. A tool on a table harms nobody.", next = "BACK", reply = "So I told him, and he went away thoughtful, which with a druid is nearly agreement.", fx = { align = { order = -1 } } },
        { text = "The druids' wishes ought to be honoured here.", next = "BACK", reply = "They are. I sell the hammer, and I point the buyer firmly toward the boat.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    short = {
      lines = {
        { id = "short_default", text = "It is no great art. Ainethil's students break vials on the first warm day, because they open the shutters and the draught takes them. Eladriel's lose their knives when the striders are calving. And Me'lynn's run out of needles a week before every festival." },
      },
      choices = {
        { text = "So you order ahead.", next = "short2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    short2 = {
      lines = {
        { id = "short2_default", text = "I do, and then I say nothing. If I told them I had seen it coming, they would feel watched. So I am simply delighted, each time, to find that I happen to have exactly what they need. Vaean knows what I am doing, because she does the same." },
      },
      choices = {
        { text = "Kindly done, and good for business. Something else.", next = "BACK", fx = { trait = { practical = 1 } } },
      },
    },
    lack = {
      lines = {
        { id = "lack_default", text = "Blasting powder, which I refused outright. Coal, which I cannot get. And a human once asked me for a fishing reel, and I sent him to Voloren, who has been trying to carve one ever since. That poor man has not had a moment's peace over it." },
      },
      choices = {
        { text = "What do they ask for that you now stock?", next = "lack2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lack2 = {
      lines = {
        { id = "lack2_default", text = "Spanners, as I said. Flint and tinder, in quantities that worry the Enclave. And little iron rings for lacing human boots, which I thought absurd until Lotherias saw them and bought the lot. We have learned something from you after all." },
      },
      choices = {
        { text = "We've a few good ideas between us. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xsmith = {
      lines = {
        { id = "xsmith_default", text = "At Auberdine there is a forge, of a kind, and beyond that you must go to Ironforge or Stormwind. I can sell you the hammer and the flux, and I can tell you the boat times. For a night elf smith it has always been a craft practised away from home." },
      },
      choices = {
        { text = "A long road to an anvil. Thank you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    trade = {
      lines = {
        { id = "trade_default", text = "Very good, and very strange. I sell three times what I did. But I used to know every customer by name, and now half of them are gone to Ashenvale before I have learned it. I keep a list of those who said they would come back. It has grown longer than I like." },
      },
      choices = {
        { text = "I'll come back. Put me on the short list.", next = "BACK", reply = "I shall hold you to it, friend.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell general trade supplies on the Craftsmen's Terrace. I keep whatever falls between the other crafts." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "A druid came to ask about my hammers. I told him a tool on a table harms no tree, and he went away thinking." } },
    explorers_league = { { id = "tp_explorers_league", text = "The dwarves of the League buy every pick I have and ask where the rock is. I point down, and they sigh." } },
    warsong = { { id = "tp_warsong", text = "I keep a list of customers who went to Ashenvale and said they would return. Too many names are still on it." } },
    advice = { { id = "tp_advice", text = "Buy the spare before you need it. I have built a whole trade on people who did not." } },
    _none = { { id = "tp_none", text = "I stock a little of everything except that. Try the bank, where Garryeth hears most of what passes." } },
  },
}

---------------------------------------------------------------------------
-- Chardryn
---------------------------------------------------------------------------
P:NPC {
  key = "chardryn", id = TODO_NPC("Chardryn"), name = "Chardryn", title = "Herbalism Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "darnassus" }, temper = { "soft-spoken", "intent" }, values = { "growth", "care" },
  notices = { "craft", "class" },

  impression = {
    first = "Chardryn sells herbalists' pouches and tools near the Temple of the Moon and speaks of plants as if they could overhear. He is soft-spoken and very intent on his pots.",
    third = "{name} met Chardryn, who sells herbalism supplies in Darnassus.",
  },

  greetings = {
    { id = "g_hello", text = "Quietly, please, and welcome. I have pouches, sickles and seedling pots. The mageroyal behind me is flowering, and it dislikes a loud voice." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back. The peacebloom you admired has opened since, so come and see it." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "An herbalist. Then you will forgive me if I ask how you cut, before I sell you anything to cut with." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "There is sap on your sickle that has dried black. That is from briarthorn, pulled when you should have cut. It will grow again, but slowly, and it will remember." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You need no telling, then, that these pots are listening. Most of my customers think it a figure of speech." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Chardryn. Firodren Mooncaller teaches the herbalists of Darnassus, over in the Cenarion Enclave, and I supply them from here. I also grow a few things in pots, for no reason except that a stall without anything living on it seems to me a sad affair." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Softly, please, but do go on." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Do the plants truly mind noise?", next = "noise" },
        { text = "What grows well on Teldrassil?", next = "grows" },
        { text = "How do you and Firodren work together?", next = "firodren" },
        { text = "How should briarthorn be cut?", next = "xherb", when = { profession = "Herbalism" } },
        { text = "What are the pots telling you, of late?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Go gently, Chardryn.", next = "END" },
      },
    },
    noise = {
      lines = {
        { id = "noise_default", text = "I believe so, and Firodren believes it too, though Ulthir the alchemists' supplier laughs at us both. The mageroyal closes when the Sentinels drill on the Warrior's Terrace and opens again when they have done. Ulthir says it is the shaking of the ground. I say that is only another way of being loud." },
      },
      choices = {
        { text = "I think you're right. Plants feel more than we credit.", next = "BACK", reply = "Thank you. I shall tell the mageroyal that it has a friend.", fx = { align = { light = 1 } } },
        { text = "It's the ground shaking. A flower has no ears.", next = "BACK", reply = "So Ulthir says. The flower and I have agreed to let him think so.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows = {
      lines = {
        { id = "grows_default", text = "Everything grows quickly here, and that is what troubles me. A peacebloom that would take a season in Ashenvale is up in a fortnight on this tree. It is tall and bright, and it has half the virtue. I think it is being hurried by something." },
      },
      choices = {
        { text = "Hurried by what?", next = "grows2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows2 = {
      lines = {
        { id = "grows2_default", text = "I cannot say, and I am only a seller of pouches. But Denalan, at the lake, has written to Firodren about plants that walk, and about roots gone soft and dark. I have begun keeping Ashenvale seed apart from Teldrassil seed. My pots of the one are thriving and my pots of the other are only large." },
      },
      choices = {
        { text = "Has the Enclave been told?", next = "grows3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows3 = {
      lines = {
        { id = "grows3_default", text = "Firodren has told them, and he is of the Circle himself. I gather that the Arch Druid does not care to hear the tree spoken of so. I shall go on keeping my two sets of pots, and when somebody wishes to look at them, they are here." },
      },
      choices = {
        { text = "Keep them safe. Something else.", next = "BACK", fx = { learn = { "teldrassil" } } },
      },
    },
    firodren = {
      lines = {
        { id = "firodren_default", text = "He teaches where to find a herb and how to know it, and I teach, without being asked, how to leave it alive. He has the gentler hands of the two of us, but he also has students to get through. I have all day, and so I do the nagging." },
      },
      choices = {
        { text = "Do his students listen to you?", next = "firodren2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    firodren2 = {
      lines = {
        { id = "firodren2_default", text = "The good ones do. I sell every beginner a sickle, and I will not hand it over until they have shown me the cut on a stem of my own. Some have gone away without one. Firodren has never once overruled me, though it costs him pupils." },
      },
      choices = {
        { text = "A fair test. Something else.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    xherb = {
      lines = {
        { id = "xherb_default", text = "Cut it a hand above the root, on a slant, and take one stem in three. Never pull it. The root holds the whole thicket together, and a pulled briarthorn takes its neighbours with it by the next spring. You will find more there next year if you are sparing this year." },
      },
      choices = {
        { text = "One stem in three, on a slant. I will.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "That they are thirsty when the soil is wet, which ought not to be. I have told Firodren, and he looked at me for a long moment and asked me not to say it on the Enclave's side of the bridge. So I am saying it on this side, to you." },
      },
      choices = {
        { text = "I'll carry it carefully. Thank you.", next = "BACK", fx = { trait = { discreet = 1 }, learn = { "teldrassil" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell herbalism supplies near the Temple of the Moon, and I supply Firodren Mooncaller's students. I keep a few pots for company." } },
    teldrassil = { { id = "tp_teldrassil", text = "Everything grows too fast on this tree and comes up with half its virtue. I keep Ashenvale seed apart, and it does better." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "Firodren is of the Circle and listens to me. I am told the Arch Druid listens less." } },
    elune = { { id = "tp_elune", text = "I set the pots where the moonlight from the Temple reaches them. The peacebloom leans toward it, whatever Ulthir says." } },
    advice = { { id = "tp_advice", text = "Cut, never pull, and take one stem in three. A patch you spare will feed you for years." } },
    _none = { { id = "tp_none", text = "I know only what grows in a pot. Ask Firodren in the Enclave, quietly, for he knows the rest." } },
  },
}
