-- Tarren Mill's arcane corner: Magus Wordeen Voidglare, the Forsaken scholar with his eye on Dalaran,
-- and Keeper Bel'varil, his assistant. Voices: bibles/voidglare.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Magus Wordeen Voidglare: Forsaken magus researching Dalaran's magic from Tarren Mill.
P:NPC {
  key = "hb_voidglare", id = TODO_NPC("Magus Wordeen Voidglare"), name = "Magus Wordeen Voidglare",
  bible = "bibles/voidglare.md", role = "scholar", tier = "quest",
  communities = { "tarren_mill" }, temper = { "proud", "sharp" }, values = { "ambitious", "curious", "cunning" },
  notices = { "arcane", "class" },

  impression = {
    first = "He resents the Kirin Tor for being better at his own work.",
    third = "{name} met Magus Wordeen Voidglare, the Forsaken scholar in Tarren Mill who wants Dalaran's secrets for the Dark Lady and for himself.",
  },

  greetings = {
    { id = "g_default", text = "Yes? Be brief, for I am in the middle of something considerably more interesting than you." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good; I have errands, and you have legs." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, and Dalaran has not crumbled in your absence, much to my disappointment. What have you brought me?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have become rather more capable. I suppose I should take some credit for that." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Mill speaks well of you, which is unusual for the Mill. Don't let it go to your head; heads are hard to replace here." },
    { id = "g_patrols", when = { questActive = TODO_QUEST("Dalaran Patrols") }, text = "Dalaran's summoners and their elemental slaves still patrol the ruins. Thin them, and the ruins are mine to search." },
    { id = "g_key", when = { questActive = TODO_QUEST("Key to the City") }, text = "I need something that opens one of Dalaran's doors unnoticed, and the internment camp is full of careless wizards, so search them." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE", faction = "Horde" },
      text = "A mage. You'll understand, then, what it is to know there's a library behind a wall and not be allowed to read it." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK", faction = "Horde" },
      text = "A warlock. The Kirin Tor would have burned you once, and now they've had a demon flatten their city. Irony is wasted on wizards." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Magus Wordeen Voidglare, of the Undercity. I came to Tarren Mill to research, and instead I spend my days resolving crises and peering at a dome that someone else built, when I'm not chasing thieves who fled behind it." },
        { id = "h_prison", when = { questActive = TODO_QUEST("Prison Break In") },
          text = "Four Forsaken fled the Undercity with artifacts stolen from the Dark Lady's own vault, and the wizards locked them in the Lordamere Internment Camp. Find the thieves, and more importantly, find what they stole." },
        { id = "h_prison_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Prison Break In"), days = 3 } },
          text = "The artifacts are back, and Kegan and the other betrayers have found their justice. The Dark Lady will be pleased, and so, I confess, am I." },
        { id = "h_key_done", tags = { "news" }, when = { questDone = TODO_QUEST("Key to the City"), questBefore = TODO_QUEST("Blood in the Streets") },
          text = "A sewer key, of all things. Thankfully I am not the one who will be using it, but we have work to do before it's safe to try." },
        { id = "h_blood", when = { questActive = TODO_QUEST("Blood in the Streets") },
          text = "Whatever brought Dalaran's barrier down has left the city in turmoil, and there's no better time to slip inside. Take the key to the sewers on the northern side, and pray the wizards didn't ward anything so undignified." },
        { id = "h_inside", tags = { "news" }, when = { questDone = TODO_QUEST("Heart of Disruption") },
          text = "You've walked the streets of Dalaran and come back with the mote. I've waited years to say that sentence, and it was worth the wait." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "An Alliance face in Tarren Mill. I'll assume you are lost, and I'll assume you will shortly be gone." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick; I have notes to write." },
        { id = "h_again2", text = "Go on. I can spare a moment, though not two." },
      },
      choices = {
        { text = "Why do you want Dalaran so badly?", next = "dalaran" },
        { text = "Who were the thieves?", next = "thieves" },
        { text = "Your notes look like serious research, Magus.", next = "research" },
        { text = "What will you do with the arcane mote?", next = "mote", when = { questDone = TODO_QUEST("Heart of Disruption") } },
        { text = "I studied in Dalaran, once.", next = "apprentice", when = { origin = "forsaken_dalaran_apprentice" } },
        { text = "Tell me how the Kirin Tor bind their elementals.", next = "m_binding", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'm a Forsaken mage too. Dalaran owes us both.", next = "m_kin", when = { class = "MAGE", race = "Scourge" } },
        { text = "A living Horde mage. Do I meet your standards?", next = "m_living", when = { class = "MAGE", race = { "Orc", "Troll", "Tauren" } } },
        { text = "Good day, Magus.", next = "END" },
      },
    },
    m_binding = {
      big = true,
      lines = { { id = "mb_default", text = "Not how, for I'm still learning that myself, and I don't hand out half a theory. But here is what I've found: they don't command the elemental at all, they persuade it that the bracer is its own body, and it obeys the bracer as you obey your own hand. Elegant and monstrous, and I'd give a great deal to have thought of it first." } },
      choices = {
        { text = "Monstrous. Some secrets should stay with them.", next = "BACK", reply = "Spoken like a priest. I'll take your squeamishness under advisement and ignore it entirely.", fx = { align = { light = 1 } } },
        { text = "Elegant. I want to learn it too.", next = "BACK", reply = "Then fetch me more bracers, and we'll learn it together, though I'll be taking the credit.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Magus.", next = "BACK" },
      },
    },
    m_kin = {
      big = true,
      lines = { { id = "mk_default", text = "Owes us? Dalaran owes us everything and will pay nothing unless we take it. You'll find the Undercity's mages split three ways on the matter: those who want revenge, those who want the library, and a few soft ones in Thunder Bluff who want to be forgiven, so which are you?" } },
      choices = {
        { text = "Revenge. They shut the gates on us.", next = "BACK", reply = "Satisfying and short-lived. You'll want the library afterwards, believe me.", fx = { align = { light = -1 } } },
        { text = "Forgiveness. Hate wastes a second life.", next = "BACK", reply = "How very Thunder Bluff of you. I'll pretend I didn't hear it.", fx = { align = { light = 1 } } },
        { text = "The library, of course.", next = "BACK", reply = "Correct. The only sensible answer, and the rarest one.", fx = { affinity = 1 } },
      },
    },
    m_living = {
      lines = {
        { id = "ml_default", text = "You meet my standards by being here instead of somewhere more comfortable, which is all I ask. The Kirin Tor would never have let you past their front steps, and I find that a very good reason to teach you anything they wouldn't." },
        { id = "ml_orc", when = { race = "Orc" }, text = "An orc studying the arcane properly, with no demon whispering the answers. The Kirin Tor swore it couldn't be done, which makes you my favourite argument." },
      },
      choices = {
        { text = "I'll prove them wrong, then.", next = "BACK", reply = "Do. Loudly, and preferably where they can hear it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't need your standards, Magus.", next = "BACK", reply = "No one needs them. That's why they're standards and not rules.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dalaran = {
      lines = {
        { id = "da_default", text = "Because there's no other place on Azeroth with such knowledge of the arcane, and the wizards have kept it behind a dome for years. Archimonde flattened their city like a child's toy, and still they rebuilt it on the Dark Lady's very doorstep." },
      },
      choices = {
        { text = "Why did they build the dome?", next = "dalaran_dome" },
        { text = "Something else, Magus.", next = "BACK" },
      },
    },
    dalaran_dome = {
      lines = {
        { id = "dd_default", text = "Some say for protection from the violence of these times, and others say for solitude, to study and plot. I don't much care which, for a closed door interests me more than the reason it's closed." },
      },
      choices = {
        { text = "And now the dome is down.", next = "dalaran_down" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_down = {
      big = true,
      lines = {
        { id = "dn_default", text = "Something went wrong in their Violet Citadel, and the wards are failing, and the proud Kirin Tor are too busy holding their city together to guard the gate. If Dalaran falls, it takes everything with it, but if it stands, it ought to stand open." },
      },
      choices = {
        { text = "Then help them hold it. A catastrophe helps no one.", next = "BACK", reply = "Help the Kirin Tor? They locked their doors on half of Lordaeron and called it prudence, so forgive me if I find your charity a little naive.", fx = { align = { order = 1 } } },
        { text = "Their trouble is our opportunity. Take what we can.", next = "BACK", reply = "Now you sound like someone worth talking to. A wounded city guards its pantry and forgets its library, and I intend to be standing at the library door.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thieves = {
      lines = {
        { id = "th_default", text = "Four Forsaken, Kegan among them, who turned their backs on their brethren and broke into a secure vault for artifacts our apothecaries required. They fled to Dalaran, perhaps hoping for sanctuary, and the wizards caged them like any other trespasser." },
      },
      choices = {
        { text = "Stealing from Sylvanas seems a foolish thing to do.", next = "thieves_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thieves_why = {
      big = true,
      lines = {
        { id = "tw_default", text = "Fear, I imagine, of what the apothecaries meant to do with them, or greed, or some misplaced longing for the living. Whatever their reasons, they betrayed the Dark Lady, and that admits no defence." },
      },
      choices = {
        { text = "Betrayal is betrayal. They earned their end.", next = "BACK", reply = "Quite so, and the Dark Lady does not forgive, which is precisely why the rest of us are still standing in her good graces.", fx = { align = { light = -1 } } },
        { text = "Fear of the apothecaries sounds reasonable to me.", next = "BACK", reply = "Reasonable, perhaps, but reason is not loyalty, and I would keep that thought behind your teeth if I were you; the Mill has ears.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    research = {
      lines = {
        { id = "re_default", text = "The binding of elementals, chiefly, which the wizards of Dalaran do better than anyone. Keeper Bel'varil collects their stone tokens and bracers for me, and I take them apart to see how the binding's stitched together." },
      },
      choices = {
        { text = "Is your work as good as theirs?", next = "research_good" },
        { text = "Something else.", next = "BACK" },
      },
    },
    research_good = {
      lines = {
        { id = "rg_default", text = "My work is brilliant, I'll have you know. It merely pales beside centuries of hoarded Kirin Tor wisdom, which is an unfair comparison, and one I intend to correct." },
        { id = "rg_warm", when = { disposition = { min = 65 } },
          text = "No, and it galls me. I was a fair student in life and I'm a better one in death, but they have libraries I could study for a hundred years and never finish, and I have a mill." },
      },
      choices = { { text = "Something else, Magus.", next = "BACK" } },
    },

    mote = {
      lines = {
        { id = "mo_default", text = "Bargain with it, of course. They'll surely give anything to get it back, and what I want is a seat at their table, or at least a key to their library." },
      },
      choices = {
        { text = "Hold the mote hostage? That's beneath us.", next = "BACK", reply = "Beneath us? We are dead, my friend, and the dead have very little left beneath them, so spare me the scruples and fetch me results.", fx = { align = { honor = 1 } } },
        { text = "Squeeze them hard. They owe us.", next = "BACK", reply = "At last, someone who understands negotiation. Every lesson the Kirin Tor never taught me, they will now pay for in books.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    apprentice = {
      lines = {
        { id = "ap_default", text = "Did you, now? Then you know the halls I'm trying to get into, and you know how they look at the likes of us now. Tell me everything you remember, slowly, and leave nothing out." },
      },
      choices = {
        { text = "I remember the libraries, and the locks on them.", next = "BACK", fx = { affinity = 2 } },
        { text = "Some memories I'd rather keep, Magus.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a library's worth about magic and somewhat less about people, which suits me, so ask." } },
    background = { { id = "tp_bg", text = "I'm a magus of the Undercity, sent to Tarren Mill to study, and I study, among other things." } },
    advice = { { id = "tp_ad", text = "Never trust a wizard's door that's left unlocked. It's either a trap or a joke, and both are at your expense." } },
    alterac = { { id = "tp_alterac", text = "There are ogres in the ruins, Syndicate in the hills and wizards in the crater, and Alterac has always been a crowded place to die." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran shut its gates on me, and I'll find a way in, and when I do, I'll show them what a real mage can do. I'm brilliant, and they know it, and that's why they fear me." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are better than me, I'll admit that, but only because they've had longer to practice. Give me a century and I'll outshine them all." } },
    forsaken = { { id = "tp_forsaken", text = "The Dark Lady lets her Forsaken study in peace, which is more than the Kirin Tor ever allowed me while I breathed. I'm grateful, in my way, and my way is a brilliant one." } },
    _none = { { id = "tp_none", text = "That's beneath my notice, I'm afraid, but Bel'varil may know, for he notices everything I don't." } },
  },
}

-- Keeper Bel'varil: Voidglare's Forsaken assistant, collector of elemental bindings.
P:NPC {
  key = "hb_belvaril", id = TODO_NPC("Keeper Bel'varil"), name = "Keeper Bel'varil",
  bible = "bibles/voidglare.md", role = "scholar", tier = "quest",
  communities = { "tarren_mill" }, temper = { "dry", "steady" }, values = { "loyal", "careful", "curious" },
  notices = { "arcane", "kit" },

  impression = {
    first = "He says death robbed him of his comic timing, and it shows.",
    third = "{name} met Keeper Bel'varil, Magus Voidglare's assistant in Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "Hello, {name}. The Magus is busy, which means I'm busy, which means you're probably about to be busy." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I'd say I missed you, but I've been told I've lost the knack for sincerity." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. The Magus asked after you twice, which for him is practically a love letter." },
    { id = "g_tokens", when = { questActive = TODO_QUEST("Stone Tokens") }, text = "I need ten worn stone tokens from Dalaran's wizards west of here, and the internment camp is safer hunting than the city." },
    { id = "g_bracers", when = { questActive = TODO_QUEST("Bracers of Binding") }, text = "I need the bracers of earth binding worn by the elementals in the ruins. They're tough quarry, but I know you're up to it." },
  },

  notice = {
    { id = "n_arcane", cat = "arcane", when = { class = "MAGE", faction = "Horde" },
      text = "A mage. If you've ever bound an elemental yourself, I have a great many questions and the Magus has even more." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The elementals had their way with you, I see. Earth hits hard, and it doesn't apologise." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Keeper Bel'varil, assistant to Magus Voidglare. The wizards of Dalaran control elementals with tokens and bracers, and the Magus would like to know how, so I fetch them and he frowns at them." },
        { id = "h_tokens_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Stone Tokens"), days = 3 } },
          text = "Those tokens will do nicely. Their magic's faded, but it's best the Magus's first experiments are on inert specimens, for reasons I'd rather not explain to the Deathguard again." },
        { id = "h_bracers_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Bracers of Binding"), days = 3 } },
          text = "You found them. I trust the elementals you took these bracers from were amenable? That was a joke, I think; death has quite robbed me of my timing." },
        { id = "h_mage", when = { class = "MAGE", faction = "Horde" },
          text = "A mage! Don't mind me if I treat you as a reference book. The Magus certainly will." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance, in the Mill? I'd keep moving, if I were you, and I'd keep moving quickly." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've bracers to sort." },
        { id = "h_again2", text = "Ask away. I've time, if not much else, since the Magus pays in promises and the odd stale biscuit." },
      },
      choices = {
        { text = "How do the wizards bind elementals?", next = "binding" },
        { text = "Working for Voidglare can't be easy.", next = "magus" },
        { text = "What was that about your timing?", next = "timing", when = { heardLine = "hb_belvaril.h_bracers_done" } },
        { text = "I've bound a creature or two myself.", next = "lock", when = { class = "WARLOCK" } },
        { text = "Good day, Keeper.", next = "END" },
      },
    },

    binding = {
      lines = {
        { id = "bi_default", text = "Stone tokens hold the command, and bracers set round the elemental's wrists hold the creature. Together they make a servant of a thing that would otherwise tear its summoner into gravel." },
      },
      choices = {
        { text = "Binding them like that seems cruel.", next = "binding_cruel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    binding_cruel = {
      big = true,
      lines = {
        { id = "bc_default", text = "I've wondered, though the Magus says elementals don't feel as we do. Then again, people said the same about us, once, and they were wrong." },
      },
      choices = {
        { text = "Then free them when you've learned the trick.", next = "BACK", reply = "Free them? Perhaps, once I understand what I'm freeing, though I doubt the Magus would thank me for emptying his workshop.", fx = { align = { light = 1 } } },
        { text = "A servant's a servant. Bind away.", next = "BACK", reply = "You sound like the Magus, which I suppose is meant as a compliment. Still, I'll keep wondering, quietly, when he isn't listening.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    magus = {
      lines = {
        { id = "ma_default", text = "It's educational, and very quiet, for he talks mostly to his notes. He's brilliant, and he'd tell you so, and he'd be about half right, which is better than most." },
      },
      choices = {
        { text = "What does he really want?", next = "magus_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    magus_want = {
      lines = {
        { id = "mw_default", text = "He wants into Dalaran, and not as a thief, though he'll be one if he must. He wants them to look at him as one of their own, and I don't think he knows that's what he wants." },
      },
      choices = { { text = "Something else, Keeper.", next = "BACK" } },
    },

    timing = {
      lines = {
        { id = "ti_default", text = "In life I was considered rather funny, or so I'm told by people who are now dead. In death the jokes arrive late, like a messenger who stopped for a drink on the way." },
      },
      choices = {
        { text = "That one landed, Keeper.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lock = {
      lines = {
        { id = "lo_default", text = "Then you'll know the binding's the easy part and the keeping is the hard one. Do your demons resent you, I wonder, or are they past caring?" },
      },
      choices = {
        { text = "They resent me. It keeps them honest.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know elementals, Dalaran's habits and the Magus's moods, roughly in that order. Ask." } },
    background = { { id = "tp_bg", text = "I keep things for the Magus: his specimens, his notes and, occasionally, his temper." } },
    advice = { { id = "tp_ad", text = "Hunt at the internment camp, not in Dalaran itself. It's safer, and the wizards there are careless." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's bracers and tokens are for the Magus, and I gather them as best I can. Have you heard the one about the mage who walked into a ward? It came as quite a shock to him, and to the ward." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken got their minds back from the Lich King, and I got everything back except my comic timing. I keep hoping it'll turn up in a crypt somewhere, slightly late." } },
    scourge = { { id = "tp_scourge", text = "I've tried my best jokes on the Scourge, and they just keep shambling at me, which is a harsher review than I ever had from the living." } },
    _none = { { id = "tp_none", text = "No idea, I'm afraid. I'd ask the Magus, but he'd only say it's beneath his notice." } },
  },
}
