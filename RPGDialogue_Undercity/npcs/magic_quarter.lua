-- The Magic Quarter: Carendin Halgar and the warlock trainers, the mage trainers beside Anastasia Hartwell,
-- the artisan enchanter, and the reagent seller. Voices: bibles/<key>.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Carendin Halgar: the warlock who teaches the Forsaken to bind their first voidwalker.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_halgar", id = TODO_NPC("Carendin Halgar"), name = "Carendin Halgar",
  bible = "bibles/uc_halgar.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "cold", "sharp" }, values = { "ambitious", "cunning" },
  notices = { "class", "pet" },
  impression = {
    first = "He seemed to enjoy it when I flinched.",
    third = "{name} met Carendin Halgar, who teaches the Forsaken's warlocks to bind their first voidwalker.",
  },

  greetings = {
    { id = "g_default", text = "Mind the chalk on the floor. Some of those lines are holding something in, and I prefer that they go on holding it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece, which puts you ahead of a few of my students." },
    { id = "g_summons", when = { questActive = TODO_QUEST("Halgar's Summons") }, text = "So Ageron managed to find you. Let's waste no time on pleasantries, since there is a great deal you still have to learn and I have no intention of teaching it twice." },
    { id = "g_grimoire", when = { questActive = TODO_QUEST("Creature of the Void") }, text = "No grimoire under your arm, I see. Perrine is still sitting on it in his tower, and every day he keeps it is a day I've wasted on you." },
    { id = "g_binding", when = { questActive = TODO_QUEST("The Binding") }, text = "The circle is waiting, and so is the thing you're going to put in it, and neither of them is patient." },
    { id = "g_hearts", when = { questActive = TODO_QUEST("Hearts of the Pure") }, text = "Godrick tells me you've gone hunting for good men's hearts. Bring them to me still whole, if you'd be so kind; a succubus is particular about her bait." },
  },

  notice = {
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker hovers like a servant who has already guessed the end of the story, and I'd keep it guessing." },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Still dragging the imp about, I see. It's been talking about you behind your back, you know, because they always do." },
    { id = "n_succ", cat = "pet", when = { pet = { family = "Succubus" } },
      text = "Your succubus is looking at Godrick, who cannot look back, and it is annoying her terribly. I find that one of the few pleasures of this quarter." },
  },

  start = "hello",
  nodes = {
    hello = {
      narr = "He does not look up from the circle he is chalking until the line is closed.",
      lines = {
        { id = "h_default", key = true, text = "Carendin Halgar. I teach the Forsaken who have the stomach for it to call things out of the Twisting Nether and make them kneel, and I'm very good at it." },
        { id = "h_binding_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Binding"), days = 3 } },
          text = "You came back with the voidwalker leashed and your mind intact. I've seen students come back with only one of those, and it's usually the wrong one." },
        { id = "h_lock", when = { class = "WARLOCK", race = "Scourge" },
          text = "One of ours. The plague took your heartbeat, so you've already lost the thing most demons want to frighten out of you, and that's a head start I intend to use." },
        { id = "h_lock_living", when = { class = "WARLOCK", race = { "Orc", "Troll" } },
          text = "A warlock of the Horde, in the Dark Lady's quarter. Your people learned this art from worse teachers than me, and paid a good deal more for the lessons." },
        { id = "h_lock_succ", when = { class = "WARLOCK", minLevel = 20, questBefore = TODO_QUEST("Devourer of Souls") },
          text = "You've grown since the voidwalker, and I think you're ready for something that will try to do more than kill you. Sit down and listen, because this one is a different sort of danger." },
        { id = "h_notlock", when = { ["not"] = { class = "WARLOCK" } },
          text = "You're not one of mine, so keep your hands out of the circles. I'll answer a question or two, though, since the curious are often the next to come asking for lessons." },
      },
      again = {
        { id = "h_again", text = "Something more? Be quick, because the candles burn down and the wards with them." },
        { id = "h_again2", text = "Go on. I'm listening, though half my mind is on the circle behind you." },
        { id = "h_again3", when = { class = "WARLOCK" }, text = "What else? You've a voice like a student who's about to ask something useful for once." },
      },
      choices = {
        { text = "What would you have me do?", next = "BUSINESS" },
        { text = "Why did you send for me?", next = "summons", when = { class = "WARLOCK", maxLevel = 19 } },
        { text = "Who was Egalin?", next = "egalin", when = { class = "WARLOCK" } },
        { text = "I'm ready for the binding, Halgar.", next = "binding", when = { class = "WARLOCK", minLevel = 10 } },
        { text = "Tell me about the succubus.", next = "succ", when = { class = "WARLOCK", minLevel = 20 } },
        { text = "And after the succubus?", next = "felhunter", when = { class = "WARLOCK", minLevel = 28 } },
        { text = "What sort of thing do you call out of the Nether?", next = "void" },
        { text = "Why does the Dark Lady allow warlocks?", next = "allow" },
        { text = "You didn't learn all this from books alone.", next = "learned" },
        { text = "I'm ready to break the voidwalker, Halgar.", next = "binding", when = { class = "WARLOCK" } },
        { text = "What would you have me do?", next = "BUSINESS" },
        { text = "I'll leave you to your chalk.", next = "END" },
      },
    },

    summons = {
      lines = {
        { id = "su_default", text = "Because you're ready for a voidwalker, and the others are content to let a student find that out by accident. A creature of the void, summoned and not mastered, will tear you apart, so I'd rather you learn it from the man who knows the method." },
        { id = "su_done", when = { questDone = TODO_QUEST("Creature of the Void") }, text = "To teach you the voidwalker, which you've now learned, or nearly. You've done what I asked so far, and that alone sets you apart from most of the pupils Ageron sends up the road." },
      },
      choices = {
        { text = "What method?", next = "grimoire" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    grimoire = {
      lines = { { id = "gr_default", text = "Egalin's, written in his grimoire, which an agent of the Scarlet Crusade named Perrine stole from us and carried off to a tower to the west. I doubt the fool knows what he has, and I want it back before he finds out." } },
      choices = {
        { text = "Why does the Crusade want a warlock's book?", next = "grimoire2" },
        { text = "I'll bring it back.", next = "BACK", reply = "Do, and don't read it on the road. It isn't written for you yet." },
      },
    },
    grimoire2 = {
      big = true,
      lines = { { id = "gr2_default", text = "To burn it in front of a crowd, most likely, or to prove to their Grand Inquisitor that the Forsaken truck with demons. They're right, of course, and they're welcome to say so from the inside of a voidwalker. Does the killing of them trouble you?" } },
      choices = {
        { text = "Not in the least. They'd burn us first.", next = "BACK", reply = "Good. Perrine certainly would, and he'd sing a hymn while he did it.", fx = { align = { light = -1 } } },
        { text = "I'll do it, though I take no joy in it.", next = "BACK", reply = "Joy is optional. Getting the book back is not.", fx = { align = { light = 1 } } },
        { text = "Back to the matter at hand.", next = "BACK" },
      },
    },

    egalin = {
      narr = "His chalk stops halfway along a line, and he sets it down very carefully.",
      lines = { { id = "eg_default", text = "My teacher, and the first to summon a voidwalker, if you believe his own grimoire. With hardly a glance he could command the thing he'd called, and when my turn came I was so sure of myself that I barely looked at it at all." } },
      choices = {
        { text = "What happened?", next = "egalin2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    egalin2 = {
      lines = { { id = "eg2_default", text = "It knew before I did that I wasn't watching, and it nearly had my arm off at the shoulder before Egalin put it down. Don't trifle with the powers you wield, because they can consume even the vigilant, and I was not even that." } },
      choices = {
        { text = "So that's why you're hard on your students.", next = "BACK", reply = "I'm hard on them because the void is harder. If you'd prefer a gentler teacher, Kerwin is down the hall, and he loses fewer than me only because he sends the difficult ones here.", fx = { affinity = 1 } },
        { text = "I won't make your mistake.", next = "BACK", reply = "You'll make a different one, and I'll be watching for it." },
      },
    },

    binding = {
      lines = {
        { id = "bi_default", text = "Then you know the shape of it: the runes, the circle of summoning below us, and the moment the thing first realises who holds the leash. Don't hesitate at that moment, because it will notice." },
        { id = "bi_active", when = { questActive = TODO_QUEST("The Binding") }, text = "Take the runes to the circle, draw the thing out, and when it rises, beat it down with steel and spell until it understands. When it's subdued it is indentured to you, and I'll show you how to call it again." },
      },
      choices = {
        { text = "I'll be its master, not its partner.", next = "BACK", reply = "Good. It will test you anyway, so start as you mean to go on.", fx = { align = { order = 1 } } },
        { text = "I'd rather earn its loyalty than beat it.", next = "BACK", reply = "A demon's loyalty is a knife pointed at your back, waiting for the arm behind it to tire. I'd beat it first and discuss loyalty never.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    succ = {
      lines = { { id = "sc_default", text = "A devourer of souls, and a destroyer of hearts, and she cannot be dragged into our world without bait. We use her own appetite against her, which means the hearts of good men, and Godrick Farsan in the Temple will tell you whose." } },
      choices = {
        { text = "Whose hearts, Halgar?", next = "succ2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    succ2 = {
      big = true,
      lines = { { id = "sc2_default", text = "Godrick found two: Dalin Forgewright, who shelters the refugees the Greymane Wall turns away, and Comar Villard, who still walks the Wetlands looking for a wife who was taken years ago. Good men, both of them, and fools for it. Can you do it?" } },
      choices = {
        { text = "Good men die every day. I'll do it.", next = "BACK", reply = "Then go to Godrick, and come back heavier. She'll find you very interesting.", fx = { align = { light = -1 } } },
        { text = "I'll do it, and I'll remember their names.", next = "BACK", reply = "Remember them if you like. She will, and she'll use them against you, so it's as well you knew them first.", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    felhunter = {
      lines = { { id = "fh_default", text = "The felhunter, which hunts magic the way a hound hunts blood and eats it the same way. For that you'll need a man named Strahad Farsan, down in Ratchet on the Barrens coast, who is living, insufferable and very good at it." } },
      choices = {
        { text = "Farsan? Like Godrick?", next = "felhunter2" },
        { text = "Back to the matter at hand.", next = "BACK" },
      },
    },
    felhunter2 = {
      lines = { { id = "fh2_default", text = "Kin of his, so Godrick says, though they've not spoken since the plague made one of them inconvenient to write to. Don't carry messages between them unless you're asked, because I've no wish to lose my assistant to a family reunion." } },
      choices = { { text = "I'll keep out of it.", next = "BACK" } },
    },

    void = {
      lines = { { id = "vo_default", text = "A scrap of the Nether that has learned to be hungry and patient at once. It will stand between you and a blade all day long, and every hour of it, it will be thinking about the day you slip." } },
      choices = {
        { text = "And if I do slip?", next = "void_slip" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    void_slip = {
      lines = { { id = "vs_default", text = "Then it stops serving and starts feeding, and someone like me is sent to tidy up what's left. I've tidied up three students so far, and I keep their chalk in a box by the door." } },
      choices = {
        { text = "Keeping something like that on a leash would frighten me.", next = "void_fear" },
        { text = "Back to the matter at hand.", next = "BACK" },
      },
    },
    void_fear = {
      big = true,
      lines = {
        { id = "vf_default", text = "Fear is for things that can still take something from you. The Scourge took most of what I had, so I hold the leash steady and let the demon do the worrying." },
        { id = "vf_living", when = { ["not"] = { race = "Scourge" } }, text = "Fear is for things that can still take something from you, and you, living one, have rather a lot left to take. I'd keep that in mind before you pick up any chalk." },
      },
      choices = {
        { text = "A demon on a leash is a demon used well.", next = "BACK", reply = "Used well, and kept well too. A demon that's well fed is a demon that doesn't look for other food.", fx = { align = { light = -1 } } },
        { text = "Some doors are better left shut, Halgar.", next = "BACK", reply = "Better shut, perhaps, but some of them knock very loudly, and I'd rather be the one holding the key.", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    allow = {
      lines = { { id = "al_default", text = "Because the Scourge doesn't fight fair, and neither does the Scarlet Crusade, and the Dark Lady has no patience for scruples she can't afford. A demon that dies for us is one less Forsaken who has to." } },
      choices = {
        { text = "Do the apothecaries approve of you?", next = "allow_apoth" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    allow_apoth = {
      big = true,
      lines = { { id = "aa_default", text = "They approve of results, which I provide, and they borrow my circles now and then for work they don't explain. We nod to one another across the canal, and that's all the approval anyone in this city expects." } },
      choices = {
        { text = "Whatever wins the war is worth using.", next = "BACK", reply = "That's the Society's view too, and I find I agree with them on very little else. Results, as I said.", fx = { align = { honor = -1 } } },
        { text = "Some weapons cost more than they're worth.", next = "BACK", reply = "Some do, and their owners learn the cost soon enough. I keep my circles clean and my accounts paid.", fx = { align = { honor = 1 } } },
        { text = "Back to the matter at hand.", next = "BACK" },
      },
    },

    learned = {
      lines = {
        { id = "le_default", text = "Egalin taught me the binding, and the rest came from books that were burned in Lordaeron and from a cult that thought it was using me. The Cult of the Damned taught its servants generously, and was careless about whom it taught." },
        { id = "le_cult", when = { origin = "forsaken_cult_remnant" }, text = "From the same people who taught you, I suspect, before the Dark Lady broke their hold on us. The Cult of the Damned was generous with its lessons and careless about whom it taught." },
      },
      choices = {
        { text = "So you were one of the Cult.", next = "learned_cult" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    learned_cult = {
      lines = { { id = "lc_default", text = "I was a fool who wanted power and thought the price would come later, and I was right about the price. It came in a plague cloud over Andorhal, and I've been paying it back to the Scourge ever since, with interest." } },
      choices = {
        { text = "Then we've both got debts to collect.", next = "BACK", reply = "We have, and I mean to collect mine in voidwalkers.", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Back to the matter at hand.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I made one bad bargain in life and a great many good ones since. Ask me about the good ones." } },
    advice = { { id = "tp_ad", text = "Never let a demon hear you hesitate, because they smell doubt the way a hound smells blood." } },
    _none = { { id = "tp_none", text = "That's nothing I've summoned, studied or bound, so it's nothing I care about." } },
  },
}

---------------------------------------------------------------------------
-- Richard Kerwin: warlock trainer, patient and pedantic.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_kerwin", id = TODO_NPC("Richard Kerwin"), name = "Richard Kerwin", title = "Warlock Trainer",
  bible = "bibles/uc_kerwin.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "dry", "calm" }, values = { "precise" },
  notices = { "class" },
  impression = {
    first = "He is oddly reassuring for a man who trades in demons.",
    third = "{name} met Richard Kerwin, a patient warlock trainer in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Sit, sit; I've a new contract on the table, and I'd value a steady pair of eyes on it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Stand, if you're staying. And keep well back from the inkwell; it's been hungry today." },
    { id = "g_default", text = "Sit, if you're staying, and don't touch the inkwell, because it isn't ink." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Let's see whether your last lesson stuck or rotted." },
    { id = "g_woman", when = { gender = "female", class = "WARLOCK" }, text = "Ah, madam, your curses were the neatest in the quarter last time, and I've been waiting to see if you could keep it up." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your sigils are smudged. A smudged sigil is how a curse finds its way home to the person who cast it." },
  },

  start = "hello",
  nodes = {
    hello = {
      narr = "He wipes the nib of his pen on a rag already black with it, and turns the page of a ledger toward you as if you'd come to check your marks.",
      lines = {
        { id = "h_default", key = true, text = "Richard Kerwin. I train the warlocks of the Magic Quarter, which mostly means teaching clever people to be careful, and that's the hardest lesson there is." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "Richard Kerwin, and you're one of mine whether Pickman has claimed you or not. Every spell in this quarter is a sentence spoken to something that wishes you harm, so we'll start with your grammar." },
        { id = "h_lock_high", when = { class = "WARLOCK", minLevel = 40 }, text = "You've come far enough that the lessons I give you now are mostly about what not to call, and when not to call it. That's the part of the trade that keeps old warlocks old." },
        { id = "h_notlock", when = { ["not"] = { class = "WARLOCK" } }, text = "You're no warlock, so I've nothing to teach you, but I'll answer a civil question. Nobody else in this quarter asks me any." },
      },
      again = {
        { id = "h_again", text = "Another question? Good, because questions are cheaper than mistakes." },
        { id = "h_again2", text = "Go on, I'm still here, and I'm always still here." },
      },
      choices = {
        { text = "A pact with a demon should be honoured to the letter.", next = "BACK", reply = "To the letter, yes, and read twice, because they certainly will.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Break any pact with a demon. They're demons, after all.", next = "BACK", reply = "They expect that, and they've written it into the pact. Be careful.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "My imp keeps arguing with its own contract.", next = "imp_trouble", when = { class = "WARLOCK", pet = { family = "Imp" } } },
        { text = "My curses don't take hold the way they should.", next = "curses", when = { class = "WARLOCK" } },
        { text = "What's the infernal ritual everyone whispers about?", next = "infernal", when = { class = "WARLOCK", minLevel = 48 } },
        { text = "Why does careful matter so much?", next = "careful" },
        { text = "You have the manner of a teacher.", next = "before" },
        { text = "Train me. I'm hungry for more.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What do you teach a new warlock first?", next = "imp" },
        { text = "What do you make of Kaal Soulreaper?", next = "kaal" },
        { text = "Where did you learn the dark arts?", next = "learned" },
        { text = "My imp keeps picking at its contract, hunting for a loophole.", next = "imp_trouble", when = { class = "WARLOCK" } },
        { text = "Good day, Kerwin.", next = "END" },
      },
    },

    careful = {
      lines = { { id = "ca_default", text = "Because every spell we cast is a contract, and the other party reads the small print far more closely than we do. I've seen a warlock lose his voice for a year over one misplaced syllable." } },
      choices = {
        { text = "Then the rules are worth keeping exactly.", next = "BACK", reply = "They are, and I'll make a warlock of you yet. Read every syllable twice.", fx = { align = { order = 1 } } },
        { text = "Rules are for those without the will to bend them.", next = "BACK", reply = "Then I'll remember your name when you lose your voice, and I'll write it on my list of cautionary tales.", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    curses = {
      lines = {
        { id = "cu_default", text = "Then you're saying them like threats, and a curse isn't a threat, it's a statement of fact about the future. Say it as calmly as you'd tell a man the time, and the Nether will do the rest." },
        { id = "cu_orc", when = { race = "Orc" }, text = "Then you're shouting them, which is how your people were taught, and the Nether hears a shout as an invitation. Say it as calmly as you'd tell a man the time, and it will take hold without bringing anything else along." },
      },
      choices = {
        { text = "Which curse do you teach first?", next = "curses2" },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },
    curses2 = {
      lines = { { id = "cu2_default", text = "Agony, because it's simple and it's honest, and a student can watch it work and understand why. After that weakness and recklessness, and much later the ones that rot a man's tongue or his courage, which I teach slowly and with the door shut." } },
      choices = {
        { text = "Why with the door shut?", next = "curses3" },
        { text = "I'll start with agony, then.", next = "BACK", reply = "Calmly, please. Agony is the one that most tempts students to enjoy themselves." },
      },
    },
    curses3 = {
      big = true,
      lines = { { id = "cu3_default", text = "Because students listen at doors, and a curse half-learned through a keyhole is worse than none at all. Some of my colleagues think the doors should be open and the students should be braver. What do you think?" } },
      choices = {
        { text = "Keep the door shut. Some things must be earned.", next = "BACK", reply = "Thank you. I'll tell Pickman a student agreed with me, and he'll be unbearable about it.", fx = { align = { order = 1 } } },
        { text = "Open it. Let the brave ones listen.", next = "BACK", reply = "Then you've a little of Kaal in you, and I hope you've his luck as well.", fx = { align = { order = -1 } } },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },

    infernal = {
      lines = { { id = "in_default", text = "Two rituals, and neither is mine to give you lightly. A warlock with an infernal stone and enough nerve can pull an infernal down from the sky like a burning stone, and with a circle of others he can open a door for a doomguard, which will take the life of one of them as its fee." } },
      choices = {
        { text = "One of the circle dies?", next = "infernal2" },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },
    infernal2 = {
      lines = { { id = "in2_default", text = "Unless the ritual is perfect, and none of them are. I've never cast it myself and I hope never to, but I'll teach you the words when you're ready, because I'd sooner you learned them in this room than from a stranger in the Plaguelands." } },
      choices = {
        { text = "I'll be careful with them.", next = "BACK", reply = "You'll be careful, or you'll be someone else's fee. I'd prefer careful." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    before = {
      lines = { { id = "be_default", text = "I was a tutor to a merchant's children in the capital, teaching letters and sums. The work hasn't changed much, except that my current pupils are more likely to set the room on fire." } },
      choices = {
        { text = "Do you miss the children?", next = "before_miss" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    before_miss = {
      narr = "The pen goes still above the page and stays there.",
      lines = { { id = "bm_default", text = "I try not to wonder where they are, because the answer is either the Plaguelands or somewhere I'll never be welcome again. Neither is a thought worth keeping, so I keep chalk instead." } },
      choices = {
        { text = "Remembering them is worth the ache.", next = "BACK", reply = "Perhaps it is, for some. For me it's an ache I can't afford, so I keep the chalk.", fx = { align = { light = 1 } } },
        { text = "Best to bury it, Kerwin.", next = "BACK", reply = "That's what I keep telling myself, and the chalk agrees. Thank you for not making it harder.", fx = { align = { light = -1 } } },
      },
    },

    imp = {
      lines = { { id = "im_default", text = "The imp, because it's small and spiteful and nearly harmless, which makes it an ideal first pupil for my pupils. A warlock who can't keep an imp in line has no business calling anything larger." } },
      choices = {
        { text = "How do you keep an imp in line?", next = "imp_contract" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    imp_contract = {
      lines = { { id = "ic_default", text = "With a contract written in a clear hand, read aloud in full, with no words left for the imp to interpret. They'll argue every comma if you let them, and they are, I'm sorry to say, very good at grammar." } },
      choices = {
        { text = "And after the imp?", next = "imp_void" },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },
    imp_void = {
      lines = { { id = "iv_default", text = "The voidwalker, which says nothing and does what it's told, and is therefore much more dangerous. A servant that never complains is a servant you stop watching, and that's the very first mistake I teach my pupils not to make." } },
      choices = { { text = "Something else, Kerwin.", next = "BACK" } },
    },
    imp_trouble = {
      lines = { { id = "it_default", text = "Then you've left it room, and it's found it. Write the binding again tonight, plainly and with no flourishes, and read it to the imp twice, and it will sulk, which is how you'll know you've won." } },
      choices = {
        { text = "I'll write it again, and leave it no room to breathe.", next = "BACK", fx = { affinity = 1, trait = { careful = 1 } } },
        { text = "Or I could burn it until it stops arguing.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    kaal = {
      lines = { { id = "ka_default", text = "An orc who came to a city of the dead to teach the thing that ruined his people, which tells you most of what you need to know about him. He's a fine teacher under a good deal of thunder, and his students come back alive, so I've never once corrected him." } },
      choices = {
        { text = "You don't mind the thunder?", next = "kaal_theatre" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    kaal_theatre = {
      big = true,
      lines = { { id = "kt_default", text = "I mind it a little, privately, because the Nether doesn't care how grandly you speak, only how exactly. But the young ones remember his lessons better than mine, so perhaps a little fear is good for them." } },
      choices = {
        { text = "Fear teaches faster than kindness.", next = "BACK", reply = "Faster, yes. I've never been convinced it teaches as well.", fx = { align = { light = -1 } } },
        { text = "Your patience teaches better than his fear.", next = "BACK", reply = "That's kind of you, and please don't repeat it where he can hear.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },

    learned = {
      lines = { { id = "le_default", text = "From books, after I woke, which the Deathguard carried out of the ruins of the capital in sacks. Some of them belonged to the necromancers who started all this, and I read those with gloves on, though I can't feel my hands." } },
      choices = {
        { text = "You learned from the Scourge's own books?", next = "learned_scourge" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    learned_scourge = {
      lines = { { id = "ls_default", fx = { learn = { "scourge" } }, text = "From the Cult of the Damned's books, yes, and I took notes in the margins about where they were wrong. It is a peculiar kind of revenge to correct the spelling of the people who killed you, but it's the kind available to a schoolmaster." } },
      choices = { { text = "A fine revenge. Let's talk about something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a tutor to a merchant's children, teaching letters and sums. I still teach letters, though the sums have grown darker." } },
    advice = { { id = "tp_ad", text = "Read every word twice and say it once, because the Nether doesn't take corrections." } },
    _none = { { id = "tp_none", text = "I don't teach that, and I make a point of not guessing about what I don't teach." } },
  },
}

---------------------------------------------------------------------------
-- Kaal Soulreaper: warlock trainer, grim and theatrical.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_soulreaper", id = TODO_NPC("Kaal Soulreaper"), name = "Kaal Soulreaper", title = "Warlock Trainer",
  bible = "bibles/uc_soulreaper.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "grim", "proud" }, values = { "ambitious" },
  notices = { "class", "race" },
  impression = {
    first = "An orc teaching warlockry among the dead, who wants his students to survive and would never admit it.",
    third = "{name} met Kaal Soulreaper, an orc warlock trainer in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You return, and still in one piece. Good. The shadows have not taken you yet, and I'm glad of it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The shadows can have you, for all I care today. Ask what you need and go." },
    { id = "g_default", text = "Another seeker in the dark. Come closer, and let me see what you're made of before the shadows do." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to the dark, as they all do in the end, so sit and tell me what you've burned." },
    { id = "g_orc", when = { race = "Orc" }, text = "One of my own blood, this far from Durotar and down among the dead. Sit, and tell me what brought you to the one city where nobody flinches at my trade." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Troll", "Tauren" } },
      text = "Your heart is loud down here, living one, and every demon in this quarter can hear it. Mine was loud too, the first year, until I stopped noticing." },
    { id = "n_dead", cat = "race", when = { race = "Scourge", class = "WARLOCK" },
      text = "Your demon does not test you the way mine tests me, because it smells no blood in you to bargain for. Your people have that advantage, and I envy it a little." },
  },

  start = "hello",
  nodes = {
    hello = {
      narr = "He stands with his arms folded over a chest marked with old green scars, and the candle beside him burns a shade too pale.",
      lines = {
        { id = "h_default", key = true, text = "I am Kaal Soulreaper, and I teach the darker arts to those of the Horde who would wield them, here under the Dark Lady's roof. Speak, and choose your words as carefully as you'd choose your pacts." },
        { id = "h_lock", when = { class = "WARLOCK" }, text = "A warlock, and not yet devoured. Your soul shards are your currency, seeker, so spend them well, and never on anything that smiles at you." },
        { id = "h_lock_orc", when = { class = "WARLOCK", race = "Orc" }, text = "An orc warlock, and so a fool or a brave one, and I was both at your age. Our people drank this power once and were damned by it, and now we take it back on our own terms, one shard at a time." },
        { id = "h_mount", when = { class = "WARLOCK", minLevel = 40 }, text = "You've reached the point where a warlock stops walking. I'll teach you to call a felsteed, a horse of the Nether that runs on fire, and it will serve you better than any skeletal horse from Brill's stables." },
        { id = "h_mage", when = { class = "MAGE" }, text = "A mage, slumming among the warlocks. Hartwell's students always come to look at us sooner or later, the way children look at a fire." },
      },
      again = {
        { id = "h_again", text = "Speak again, if you must. The dark is patient, and so, tonight, am I." },
        { id = "h_again2", text = "What else is in that head of yours, seeker?" },
      },
      choices = {
        { text = "A warlock binds demons. He doesn't let them bind him.", next = "BACK", reply = "Yes. I have seen what happens when orcs forget that, and so have you.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Give the demons what they want, and take their power gladly.", next = "BACK", reply = "My people did that once. Look at what it cost us before you say it again.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Soulreaper can't have been your name in life.", next = "name" },
        { text = "What are soul shards for, really?", next = "shards" },
        { text = "Teach me what the others won't, Soulreaper.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Tell me about the felsteed.", next = "felsteed", when = { class = "WARLOCK", minLevel = 38 } },
        { text = "Our people drank the demon blood once. Isn't this the same?", next = "blood", when = { race = "Orc" } },
        { text = "An orc, teaching in the Undercity?", next = "why" },
        { text = "What does a warlock owe the Dark Lady?", next = "loyalty" },
        { text = "Should I be afraid of you?", next = "theatre" },
        { text = "Hartwell's mages think you're a joke.", next = "mage", when = { class = "MAGE" } },
        { text = "The spirits wept when the orcs took up the fel.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "Farewell.", next = "END" },
      },
    },

    why = {
      lines = { { id = "wh_default", text = "Because Thrall does not love my trade, and he has reason not to, and the Cleft of Shadow in Orgrimmar is full of whispers I don't care to share a cave with. The Forsaken have looked at worse than demons, so here I can teach without a grunt standing at my back." } },
      choices = {
        { text = "What whispers in the Cleft?", next = "cleft" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    cleft = {
      lines = { { id = "cl_default", text = "The Burning Blade's name, among others, spoken low by those who think the old days were better. I left before I had to choose whose throat to cut, and I've slept well in this city of the dead ever since, which is a strange thing for an orc to say." } },
      choices = {
        { text = "Does the Warchief know?", next = "BACK", reply = "Thrall knows a great deal more than he says. I trust him to deal with it, and I'll trust you to keep your mouth shut." },
        { text = "You ran from a fight?", next = "BACK", reply = "I chose my fight, seeker. Mine is with the Legion, not with my own fools." },
      },
    },

    name = {
      lines = { { id = "na_default", text = "No, I took it in the internment camps, when I understood what the demon blood had done to us and swore the Legion would pay it back. My mother named me Kaal, and the rest I earned on the things I've bound since." } },
      choices = {
        { text = "How do you make them pay?", next = "name_pay" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    name_pay = {
      big = true,
      lines = { { id = "np_default", text = "I chain their servants and spend them against their enemies, and every imp I burn on a Scourge ghoul is one less weapon in their hands. Some say I'm only doing what Gul'dan did with prettier reasons, and I'd like to hear which side you'd take." } },
      choices = {
        { text = "Vengeance is a good enough reason. Burn them all.", next = "BACK", reply = "Lok'tar. Then we understand each other, and I'll teach you to burn them faster.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Gul'dan had reasons too. Watch yourself.", next = "BACK", reply = "I do, every night, and I'd think less of you if you hadn't said it.", fx = { align = { honor = 1 } } },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },

    blood = {
      narr = "He turns his forearm over so you can see the green tracery under the skin, then folds his arms again.",
      lines = { { id = "bl_default", text = "No. Our fathers drank the blood and gave the pit lord their will, and they were slaves who thought they were warriors. I give a demon nothing, I take what I need, and I break it if it reaches for more." } },
      choices = {
        { text = "And if you're wrong?", next = "blood2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    blood2 = {
      big = true,
      lines = { { id = "bl2_default", text = "Then someone like Grom will have to put me down, and I hope they do it quickly. Grom freed us with his own death, young one, and I will not spit on that by kneeling to the Legion a second time. Will you?" } },
      choices = {
        { text = "Never. I command. I don't kneel.", next = "BACK", reply = "Then you'll do. Say it with less pride and more care, and you'll do well.", fx = { align = { order = 1 } } },
        { text = "I'll take what I need and answer to no one.", next = "BACK", reply = "That's how it started last time, young one. I'll be watching you.", fx = { align = { order = -1 } } },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },

    shards = {
      lines = { { id = "sh_default", text = "Fuel and coin and leash, all at once. You tear a sliver from a dying enemy and keep it in a bag, and if that turns your stomach, you're in the wrong quarter of the wrong city." } },
      choices = {
        { text = "Our enemies forfeited their souls. I'll take them.", next = "BACK", reply = "There's a warlock with sense. They gave them up the moment they raised a sword against the Horde.", fx = { align = { honor = -1 } } },
        { text = "I'll use them, but I won't enjoy it.", next = "BACK", reply = "Enjoyment comes later, if you're any good, and it's the part you should watch. For now, keep the bag closed and your stomach steady.", fx = { align = { honor = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    felsteed = {
      lines = { { id = "fs_default", text = "A demon in the shape of a horse, with hooves that burn the ground and a temper worse than any wolf's. You don't saddle it so much as remind it every morning that it's yours, and it will carry you anywhere a horse can go, and a few places it shouldn't." } },
      choices = {
        { text = "And after the felsteed?", next = "felsteed2" },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },
    felsteed2 = {
      lines = { { id = "fs2_default", text = "At fifty I'll teach you the rituals for the infernal and the doomguard, which are heavier work and cost more than shards. Beyond that, Martha Strain knows of an orc in the Burning Steppes who claims there is a greater steed, and I'd hear what she says before you go hunting it." } },
      choices = {
        { text = "I'll ask Martha when I'm ready.", next = "BACK", reply = "Do, and don't tell her I sent you. She charges me for compliments." },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },

    loyalty = {
      lines = { { id = "lo_default", text = "Respect, and obedience while we're under her roof, since she lets an orc teach the fel in her city and asks few questions. Thrall made the pact with her, and I keep it, and I'd give a soul shard to her cause and count it cheap." } },
      choices = {
        { text = "And the dreadlord at her side?", next = "loyalty_dreadlord" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    loyalty_dreadlord = {
      big = true,
      lines = { { id = "ld_default", text = "Varimathras calls himself her servant, and perhaps he is, for now. My people knew his kind before they knew the Legion's name, and a dreadlord who kneels is only resting his knees." } },
      choices = {
        { text = "Then watch him. Never trust a demon.", next = "BACK", reply = "Every night, seeker, and I sleep lightly for it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A leashed demon is a weapon. Use him.", next = "BACK", reply = "That's her wager, and it's a bold one. I hope she wins it.", fx = { align = { light = -1 } } },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },

    theatre = {
      lines = { { id = "th_default", text = "Not of me, seeker, but of what I teach, every hour of every night, because the first warlock who stops being afraid is the next one I bury, and I've buried enough." } },
      choices = {
        { text = "So the grand voice is for the students.", next = "theatre_students" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    theatre_students = {
      lines = { { id = "ts_default", text = "A student remembers a warning spoken from the shadows long after he forgets one spoken plainly. Kerwin teaches them the rules and I teach them to be frightened of breaking them, and between us they mostly live." } },
      choices = {
        { text = "Your secret's safe with me, Soulreaper.", next = "BACK", reply = "It had better be. I've a reputation in this hall.", fx = { affinity = 1 } },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },

    mage = {
      lines = { { id = "ma_default", text = "Hartwell's mages think a great many things, and they think them very loudly in the hall where we can hear. Tell them a joke never bound a demon, and see who laughs when one gets loose in their library." } },
      choices = { { text = "I'll pass that along. Something else.", next = "BACK" } },
    },
    xshaman = {
      big = true,
      lines = { { id = "xs_default", text = "They did, and they turned their backs on us, and Thrall had to beg them to come home. I don't ask the spirits for anything, shaman, and I won't pretend my art is clean, but someone has to know how the Legion's weapons work, and I'd rather it was one of us." } },
      choices = {
        { text = "Then know them, and never love them.", next = "BACK", reply = "That's a fair charge, and I'll carry it.", fx = { align = { light = 1 } } },
        { text = "Fair enough. A weapon is a weapon.", next = "BACK", reply = "Don't let the elements hear you say it, or you'll be walking home.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a boy in the internment camps and a warlock after them, and I took my name from what I meant to do to the Legion. The rest isn't for strangers." } },
    sylvanas = { { id = "tp_sylvanas", next = "loyalty", text = "The Dark Lady lets an orc teach the fel in her city, which is more trust than I'd get at home. I keep faith with her for it." } },
    advice = { { id = "tp_ad", text = "Never name a demon you intend to dismiss, because it makes the parting harder for both of you." } },
    _none = { { id = "tp_none", text = "The shadows whisper many things, but not that." } },
  },
}

---------------------------------------------------------------------------
-- Kaelystia Hatebringer: mage trainer, venomous about the living Kirin Tor.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_kaelystia", id = TODO_NPC("Kaelystia Hatebringer"), name = "Kaelystia Hatebringer", title = "Mage Trainer",
  bible = "bibles/uc_kaelystia.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "cold", "sharp" }, values = { "ambitious" },
  notices = { "class", "race" },
  impression = {
    first = "Her anger is cold, patient and pointed north at Dalaran.",
    third = "{name} met Kaelystia Hatebringer, a mage trainer of the Undercity with a long grudge against Dalaran.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You. Sit by the candle if you like; it's burning down slower when there's someone worth talking to." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The candle is short, and so is my patience, and you're spending both." },
    { id = "g_default", text = "Speak quickly. The candle I'm reading by is the last one I have." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon. Either you're learning fast or forgetting faster." },
    { id = "g_human_tone", when = { gender = "male", class = "MAGE" }, text = "Another young man who thinks a fireball makes him interesting. Prove me wrong, please; I'd enjoy the novelty." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE", race = "Scourge" },
      text = "Frost suits the dead, you know. Our hands are already cold, so it never bites as hard as it does the living." },
  },

  start = "hello",
  nodes = {
    dd_dalaran = {
      lines = { { id = "dd_dalaran_default", text = "Pleased is a small word for it. They shut their gates while the plague took the rest of us, and now they send children in violet robes to poke about in Silverpine as though nothing happened, so every one you drop is a debt Dalaran finally pays." } },
      choices = {
        { text = "Dalaran's mages should answer for what they did to Lordaeron.", next = "BACK", reply = "They will. I've a long list, and I keep it next to my candle.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Let Dalaran rebuild in peace. Revenge only feeds the Scourge.", next = "BACK", reply = "Peace. They'd like that, I'm sure, behind their gates and wards.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "They'll keep paying until their walls come down.", next = "BACK", reply = "Now that is a sentence I'd like engraved somewhere. Go on, then, and bring me back a robe or two.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Most of them were apprentices. They didn't close those gates.", next = "BACK", reply = "They live behind them, and that's close enough for me. You'll lose that tenderness in a year or two, I promise.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kaelystia Hatebringer, trainer of mages, and before you ask, yes, I chose the name myself. I teach the Dark Lady's sorcerers to burn and freeze her enemies, and I'm told I'm thorough about it." },
        { id = "h_dalaran", when = { origin = "forsaken_dalaran_apprentice" }, text = "A Dalaran apprentice, once, by the way you hold your hands. Then you know what they did to us, and you'll understand why I teach with such enthusiasm." },
        { id = "h_dd_dalaran", tags = { "news" }, when = { killed = { name = "Dalaran", min = 30 } },
          text = "You've been cutting down Dalaran's precious apprentices in the forests, I'm told, and doing it with some flair. Come in, sit, and tell me which of them screamed the loudest." },
      },
      again = {
        { id = "h_again", text = "Something else? Be brief; brevity is the soul of spellcraft." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "Why Hatebringer?", next = "hate" },
        { text = "What's the first thing you teach?", next = "first" },
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "What do you make of Bethor Iceshard?", next = "bethor" },
        { text = "Fire or frost, which do you prefer?", next = "schools" },
        { text = "What became of Dalaran, then?", next = "dome" },
        { text = "Darkspear magic comes from the loa, not from books.", next = "troll", when = { race = "Troll" } },
        { text = "Tell me what lies ahead on a mage's road.", next = "m_road", when = { class = "MAGE" } },
        { text = "I'm living. Will you still teach me?", next = "m_living", when = { class = "MAGE", race = { "Orc", "Troll", "Tauren" } } },
        { text = "What use are the rest of us to a mage?", next = "m_others", when = { ["not"] = { class = "MAGE" } } },
        { text = "I'll go.", next = "END" },
        { text = "Dalaran's mages are dying out there, Kaelystia. Pleased?", next = "dd_dalaran", when = { killed = { name = "Dalaran", min = 30 } } },
      },
    },
    m_road = {
      hub = true,
      lines = {
        { id = "mr_default", text = "The road is the same for the living and the dead; only the company changes. Ask about any stretch of it, and I'll tell you what Dalaran would have charged you to learn it." },
        { id = "mr_high", when = { minLevel = 40 }, text = "You've come most of the way already, and you still come back to my candle. Either you're loyal or you've run out of better teachers, and I'll accept either." },
      },
      again = {
        { id = "mr_again", text = "Another stretch of road? Quickly, then." },
        { id = "mr_again2", text = "Go on. The candle's lasting better than I expected." },
      },
      choices = {
        { text = "Polymorph. Is it beneath a Forsaken mage?", next = "m_poly", when = { minLevel = 8 } },
        { text = "Why should the dead conjure bread and water?", next = "m_conjure" },
        { text = "I can step home to the Undercity now.", next = "m_twenty", when = { minLevel = 20 } },
        { text = "I'm sent to a living human, Tabetha, in the marsh.", next = "m_tabetha", when = { minLevel = 26 } },
        { text = "Portals. I'll be ferrying the living about.", next = "m_portals", when = { minLevel = 40 } },
        { text = "I've learned all you teach. What remains?", next = "m_sixty", when = { minLevel = 60 } },
        { text = "Enough of the road.", next = "BACK" },
      },
    },
    m_poly = {
      big = true,
      lines = { { id = "mp_default", text = "Beneath us? It's the most Forsaken spell in the book, if you ask me: you take a creature's shape away and give it back when it suits you. The Kirin Tor teach it as a mercy, and I teach it as a demonstration." } },
      choices = {
        { text = "A mercy still. I'll spare whoever I can.", next = "m_road", reply = "How very Dalaran of you. I'll forgive it this once, since you'll grow out of it.", fx = { align = { light = 1 } } },
        { text = "A demonstration. Let them feel helpless.", next = "m_road", reply = "Now you're learning what the spell is actually for. Helplessness teaches better than pain.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_conjure = {
      lines = { { id = "mc_default", text = "Because our allies are inconveniently alive, and they get thirsty. A Forsaken mage who keeps the orcs fed is one the orcs don't mutter about, and in this alliance that's worth more than any fireball." } },
      choices = {
        { text = "The alliance matters. I'll keep them fed.", next = "m_road", reply = "Sensible. Resent it privately, the way I do, and keep conjuring.", fx = { align = { order = 1 } } },
        { text = "Let the living fend for themselves.", next = "m_road", reply = "They will, and they'll remember who didn't help. Choose your contempt more carefully than that.", fx = { align = { order = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_twenty = {
      lines = { { id = "mt_default", text = "Now you can stand anywhere in the world and come home to the Magic Quarter in a breath, and blink out of a Scarlet's reach besides. Learn Evocation and use it, because the dead don't tire but our mana does, and nothing is more humiliating than an empty mage in a Crusade chapel." } },
      choices = { { text = "Back to the road.", next = "m_road" } },
    },
    m_tabetha = {
      big = true,
      lines = { { id = "mtb_default", text = "Tabetha: a living human mage who left the Kirin Tor's orbit to sit in a swamp, and the trainers of both banners send her students, which tells you how few of us are left who can teach. Take her test and her wand, and notice that she never once asks what you were." } },
      choices = {
        { text = "I'll treat her fairly. She's earned that much.", next = "m_road", reply = "Fairly. Yes, be fair to the one human who was fair to us. I can just about bear it.", fx = { align = { light = 1 } } },
        { text = "She's still one of them. I'll take what I need.", next = "m_road", reply = "That's the spirit, though do take the wand politely. I hear she has a temper.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_portals = {
      lines = { { id = "mpo_default", text = "Now the orcs will queue at your elbow for a door to Orgrimmar, and you'll learn what the Kirin Tor learned long ago, that a portal mage is a servant with a good title. Lexington Mortaim will teach you our door, and he'll be insufferable about it." } },
      choices = {
        { text = "Serving the Horde is no shame.", next = "m_road", reply = "No. It's merely tedious. Serve it well, and let them see a Forsaken mage is worth the trouble.", fx = { align = { honor = 1 } } },
        { text = "I'll charge them for every step.", next = "m_road", reply = "Good. Dalaran charged us for everything and gave us nothing, so at least you'll give them a door.", fx = { align = { honor = -1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_sixty = {
      big = true,
      lines = { { id = "m60_default", text = "Then go to Caer Darrow, where the Cult of the Damned teaches necromancy in the Barovs' old keep, and remember that Kel'Thuzad, who brewed the plague, was a magus of the Kirin Tor first. Dalaran made the man who killed us, and I'd like that never forgotten." } },
      choices = {
        { text = "Then I'll make Dalaran answer for him.", next = "m_road", reply = "Now you sound like one of mine. Bring me back their excuses; I collect them.", fx = { align = { light = -1 } } },
        { text = "One traitor doesn't damn a whole city.", next = "m_road", reply = "Bethor would agree with you, and I'd tell you both you're wrong. Go anyway.", fx = { align = { light = 1 } } },
        { text = "Back to the road.", next = "m_road" },
      },
    },
    m_living = {
      big = true,
      lines = {
        { id = "ml_default", text = "I teach whoever the Dark Lady's alliance sends me, and I don't have to like you to teach you well. That's more than Dalaran ever offered either of us." },
        { id = "ml_orc", when = { race = "Orc" }, text = "An orc in a mage's robe, while your elders still spit at the word warlock. We have that in common: both our peoples were ruined by magic someone else chose, and both of us chose it again anyway." },
        { id = "ml_troll", when = { race = "Troll" }, text = "A troll who studies books instead of bones. Your witch doctors must despair of you, which I find almost endearing." },
        { id = "ml_tauren", when = { race = "Tauren" }, text = "A tauren. Your people lay their dead under an open sky, and mine were refused even a gate to die behind, so forgive me if your gentleness is hard to look at." },
      },
      choices = {
        { text = "Then teach me well, and I'll prove worth it.", next = "BACK", reply = "Prove it, then. I'll be watching, and I don't blink any more.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't need your liking, only your spells.", next = "BACK", reply = "Good. We understand each other perfectly, which is rare in this city.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_others = {
      lines = { { id = "mot_default", text = "A great deal, if you stand in front. A warrior who holds the door lets me finish a spell, and I've told you what I think of mages who don't finish their spells." } },
      choices = {
        { text = "I'll hold the door, then.", next = "BACK", reply = "Then you'll be the only thing between me and the Scarlets that I don't despise.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Hold your own doors, mage.", next = "BACK", reply = "I will, and I'll freeze whoever comes through it, you included if you're slow.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hate = {
      lines = { { id = "ha_default", text = "Because the Kirin Tor sealed their gates while the plague came down the roads, and then walled off their city with us outside it, rotting. They called it caution, and I call it a debt I intend to collect." } },
      choices = {
        { text = "Is revenge enough to live on?", next = "hate_enough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hate_enough = {
      big = true,
      lines = { { id = "he_default", text = "I'm not living on anything, so the question doesn't trouble me. Revenge gets me out of bed in the evening, and I've yet to find anything else in the Undercity that does." } },
      choices = {
        { text = "Then let them pay for what they did.", next = "BACK", reply = "Pay they shall, and I'll be there to see the accounts settled. Dalaran has a long debt to us.", fx = { align = { honor = -1 } } },
        { text = "Dalaran's mages bled too. Spare the innocent ones.", next = "BACK", reply = "Innocent? There's no such thing in Dalaran's halls, only those who were quicker to run. I'll consider your mercy and discard it.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "fi_default", text = "To finish a spell, whatever happens around you. Fire that stops halfway is just a warm draught, and a mage who flinches is a corpse with good intentions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bethor = {
      lines = { { id = "be_default", text = "Bethor was Kirin Tor once, and a good one, which I hold against him less than I'd like. He's patient with questions where I'm not, so send the slow ones to him." } },
      choices = {
        { text = "He was one of them, and you trust him?", next = "bethor_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bethor_trust = {
      lines = { { id = "bt_default", text = "He died outside their walls with the rest of us, which buys a great deal of trust in this city. He'd forgive them, given the chance, and I wouldn't, and we've agreed never to discuss it over the same candle." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    schools = {
      lines = {
        { id = "sc_default", text = "Frost, because it's patient and it holds what it catches. Fire is for those who want to be seen, and I've no wish to be seen until the moment it matters." },
        { id = "sc_mage", when = { class = "MAGE", race = "Scourge" }, text = "Frost, and you'll come to it too, because cold hands don't feel the bite and our patience is longer than any living mage's. Fire is for the young, and we were all young once, briefly." },
      },
      choices = {
        { text = "And the arcane? That's Dalaran's art, surely.", next = "schools_arcane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    schools_arcane = {
      lines = { { id = "sa_default", text = "Arcane belongs to whoever can hold it, not to whoever built the tower. I teach it with particular care, so that one day a Forsaken mage can stand at their gate and use their own art to knock." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dome = {
      lines = { { id = "do_default", fx = { learn = { "dalaran" } }, text = "The demons broke it during the war, and the Kirin Tor who survived raised a violet dome over the ruins on Lordamere Lake and sealed themselves inside. They're rebuilding in there, and the dead are not invited." },
      },
      choices = {
        { text = "Can the dome be broken?", next = "dome_gate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dome_gate = {
      big = true,
      lines = { { id = "dg_default", text = "Everything can be broken, given time, and I have nothing but time. Some here say the Kirin Tor only did what any city would do with a plague at the gate, and I say they locked out their own." } },
      choices = {
        { text = "They kept a plague from their city. That's order.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "They abandoned their own. Tear down their walls.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "So I'm told, and I've watched your shadow hunters work, and I'll concede it's effective, if undisciplined. Books at least can't change their minds about you halfway through a spell, which is more than I'd say for a spirit." } },
      choices = {
        { text = "The loa are more faithful than your Kirin Tor.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I studied under Dalaran's roof, and I died outside its gate. Everything else is detail." } },
    advice = { { id = "tp_ad", text = "Finish your spell. Whatever happens, finish it." } },
    dalaran = { { id = "tp_dal", text = "A violet tower full of cowards. I'll see it again one day, and they won't enjoy the visit." } },
    _none = { { id = "tp_none", text = "Ask Bethor Iceshard, down the hall. He has the patience for questions; I have only the time for answers." } },
  },
}

---------------------------------------------------------------------------
-- Pierce Shackleton: mage trainer, absent-minded and gentle.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_shackleton", id = TODO_NPC("Pierce Shackleton"), name = "Pierce Shackleton", title = "Mage Trainer",
  bible = "bibles/uc_shackleton.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "warm", "dreamy" }, values = { "curious" },
  notices = { "class" },
  impression = {
    first = "He is the gentlest of the dead, and the most easily distracted.",
    third = "{name} met Pierce Shackleton, an absent-minded mage trainer in the Undercity.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you! I'd hoped it would be. I've found the page again, and there's a lovely passage on frost." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. I'd rather keep my place in the book today, if you'll forgive me." },
    { id = "g_default", text = "Oh! A visitor. Forgive me, I was halfway through a sentence in a book, and I've lost my place again." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again, isn't it? I never forget a face, though I sometimes misplace whose it is." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Your robes have scorch marks on the left sleeve. Too much fire from the off hand, I expect; we can fix that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Pierce Shackleton, at your service, and at the service of anyone in the Magic Quarter who wants to learn a spell properly. I taught at a little school by Lordamere Lake, once, and I find I never quite stopped." },
        { id = "h_troll", when = { race = "Troll", class = "MAGE" }, text = "A troll mage! I've read that your people's magic comes from the old spirits, and I'd love to hear how it sits with the arcane, if you've a moment." },
      },
      again = {
        { id = "h_again", text = "Yes? Oh, yes, you were asking something; my memory came back from the grave with a few pages missing. Go on." },
        { id = "h_again2", text = "Another question? Splendid, I'd nearly run out of things to think about." },
      },
      choices = {
        { text = "Knowledge should be shared freely with anyone who seeks it.", next = "BACK", reply = "That's what libraries were for, once. I miss them dreadfully.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Guard your spells closely. A rival will steal anything you share.", next = "BACK", reply = "Oh dear. I suppose that's true, but it's such a lonely way to study.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Your school must have closed long ago.", next = "school" },
        { text = "Do the dead learn magic differently?", next = "dead" },
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "I kept the archives in Stratholme, Pierce, until the Culling.", next = "xorig_archive", when = { origin = "forsaken_stratholme_archivist" } },
        { text = "What are you reading?", next = "book" },
        { text = "Where was your school, exactly?", next = "lake" },
        { text = "Kaelystia doesn't seem as forgiving as you.", next = "kaelystia" },
        { text = "How do I fix my off-hand fire?", next = "offhand", when = { class = "MAGE" } },
        { text = "Troll magic comes from the loa, Pierce.", next = "troll", when = { race = "Troll" } },
        { text = "Will you walk me through the road ahead?", next = "m_road", when = { class = "MAGE" } },
        { text = "I studied at Dalaran too. They shut us out.", next = "m_dalaran", when = { class = "MAGE", race = "Scourge" } },
        { text = "I'm an orc mage. Do you mind teaching me?", next = "m_orc", when = { class = "MAGE", race = "Orc" } },
        { text = "I'm a tauren mage. Is that very odd?", next = "m_tauren", when = { class = "MAGE", race = "Tauren" } },
        { text = "Goodbye, Pierce.", next = "END" },
      },
    },
    m_road = {
      hub = true,
      lines = { { id = "mr_default", text = "Oh, the road! I used to draw it on the slate for my pupils, a long line with little marks along it, and they always wanted to skip to the end. Pick a mark, and I'll tell you what I used to tell them." } },
      again = {
        { id = "mr_again", text = "Another mark on the slate? Splendid, I'd nearly forgotten where we were." },
        { id = "mr_again2", text = "Go on, go on. I'm enjoying this more than the ley lines." },
      },
      choices = {
        { text = "Conjured water. Does it taste of anything?", next = "m_water" },
        { text = "Polymorph. Why a sheep, of all things?", next = "m_poly", when = { minLevel = 8 } },
        { text = "Arcane, fire or frost. Which should I study?", next = "m_schools", when = { minLevel = 10 } },
        { text = "Evocation. Why does it take so long?", next = "m_evoc", when = { minLevel = 20 } },
        { text = "Tabetha in the marsh. Did you know her?", next = "m_tabetha", when = { minLevel = 26 } },
        { text = "Portals. Must I really carry others about?", next = "m_portal", when = { minLevel = 40 } },
        { text = "Enough of the slate, Pierce.", next = "BACK" },
      },
    },
    m_water = {
      lines = { { id = "mw_default", text = "I couldn't tell you, I'm afraid, because the plague took my taste along with everything else and never gave it back. My pupils used to say it tasted of nothing at all, which I always thought was rather the point: it's water that doesn't come from anywhere." } },
      choices = {
        { text = "Do you miss tasting things?", next = "m_water2" },
        { text = "Back to the slate.", next = "m_road" },
      },
    },
    m_water2 = {
      big = true,
      lines = { { id = "mw2_default", text = "Bread, mostly, warm from the oven in the village by the school, and strawberries in summer. I conjure them sometimes for the living ones who pass through the Quarter and watch them eat, and that's very nearly as good." } },
      choices = {
        { text = "Then I'll conjure for the living too, and watch.", next = "m_road", reply = "Oh, do. It's the kindest spell we have, and nobody ever writes treatises about it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The living can feed themselves. We've other work.", next = "m_road", reply = "They can, of course. I only think we lose something when we stop wanting to watch.", fx = { align = { light = -1 } } },
        { text = "Back to the slate.", next = "m_road" },
      },
    },
    m_poly = {
      lines = { { id = "mp_default", text = "Nobody knows, and I've read every theory, and my favourite is that the first mage to write it down grew up on a farm. Sheep are gentle, harmless and very hard to be frightened of, which is the whole point of the spell." } },
      choices = { { text = "Back to the slate.", next = "m_road" } },
    },
    m_schools = {
      big = true,
      lines = { { id = "ms_default", text = "I taught all three, but I loved the arcane best, because it's the only school that explains itself if you're patient. Fire is a good servant, frost is a good guard, and the arcane is a good conversation. Which do you think you'll be?" } },
      choices = {
        { text = "Frost. I'll take the guard.", next = "m_road", reply = "A sensible choice, and Kaelystia will approve, which is rare enough to celebrate.", fx = { align = { order = 1 } } },
        { text = "Fire. I want a servant that bites.", next = "m_road", reply = "Mind it doesn't bite the hand, then. Fire has no loyalty at all, only appetite.", fx = { align = { order = -1 } } },
        { text = "The arcane, I think, like you.", next = "m_road", reply = "Oh, wonderful! Come and argue with me about ley lines whenever you like.", fx = { affinity = 1 } },
      },
    },
    m_evoc = {
      lines = { { id = "me_default", text = "Because you're drawing the mana back out of the world, and the world doesn't like to be hurried. I used to tell pupils to think of sitting very still at a well; you can't pull the water up faster than the rope allows." } },
      choices = { { text = "Back to the slate.", next = "m_road" } },
    },
    m_tabetha = {
      lines = { { id = "mtb_default", text = "Only by her letters, years ago. She wrote to the school asking for a book on marsh mana, and her handwriting was dreadful and her questions were wonderful, and I'm told she teaches Horde mages now. I can't think of anyone I'd rather send you to." } },
      choices = {
        { text = "Shall I give her your regards?", next = "m_road", reply = "Oh, would you? Tell her Pierce from the lake school, and tell her I never did find that book.", fx = { affinity = 1 } },
        { text = "Back to the slate.", next = "m_road" },
      },
    },
    m_portal = {
      lines = { { id = "mpo_default", text = "You must, because someone has to, and otherwise the orcs walk from Orgrimmar to the Undercity, which takes weeks and ruins their tempers. Lexington teaches the doors, and he'll be strict with you, which is quite right." } },
      choices = {
        { text = "Carrying others is an honor, Pierce.", next = "m_road", reply = "It is, and I'm so glad you see it that way. Most of my pupils only saw the coin in it.", fx = { align = { light = 1 } } },
        { text = "I'll carry those who can pay me.", next = "m_road", reply = "Well, a mage must eat, or must buy runes, at least. Do carry the poor ones now and then.", fx = { align = { light = -1 } } },
        { text = "Back to the slate.", next = "m_road" },
      },
    },
    m_dalaran = {
      big = true,
      lines = { { id = "md_default", text = "Did they? Then we were refused at the same gate, you and I, though I was only ever refused by a librarian. I don't hate them for it, which Kaelystia calls a character flaw, but I miss the library terribly, and I think that's a kind of grief." } },
      choices = {
        { text = "I can't hate them either. I miss it too.", next = "BACK", reply = "Then we'll miss it together, and quietly, so as not to upset Kaelystia.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I hate them, Pierce, and they'll answer for it.", next = "BACK", reply = "Then go gently in your hating, and spare the students. They didn't shut the gate.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_orc = {
      lines = { { id = "mo_default", text = "Mind? Goodness, no, I'm delighted. An orc who reads is an orc the warlocks couldn't ruin, and I've always thought teaching was a quiet sort of mending." } },
      choices = {
        { text = "Then I'll be a mended orc, gladly.", next = "BACK", reply = "And I'll be a mended schoolmaster, for having a pupil again. Shall we begin?", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'm not broken, schoolmaster. Just teach.", next = "BACK", reply = "Of course, forgive me; that was the schoolmaster talking. Let's begin.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    m_tauren = {
      lines = { { id = "mta_default", text = "Odd? Wonderful! Your people listen to the wind and the earth, and the arcane is a sort of wind if you hold it right, so you may understand it better than any of us. Do tell me what your elders said." } },
      choices = {
        { text = "They said the Earth Mother would understand.", next = "BACK", reply = "Then your Earth Mother is a better teacher than half the Kirin Tor. I'd like to have met her.", fx = { affinity = 1 } },
        { text = "They said nothing. They just looked sad.", next = "BACK", reply = "Ah. My father looked like that when I went to Dalaran. Write to them, if you can; it helps." },
      },
    },
    xorig_archive = {
      lines = {
        { id = "xar_default", text = "Stratholme's archives! I wrote to your keepers twice for a copy of an old treatise on ley lines, and nobody ever answered. I suppose that wasn't your fault. Did any of it survive, do you think?" },
      },
      choices = {
        { text = "I never learned. One day I'd like to go and look.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "No. Arthas left nothing in that city worth reading.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "I may have lost your letters, Pierce. Sorry.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    school = {
      lines = { { id = "sc_default", text = "The plague reached it in the spring, and the pupils went home and never came back. I locked the door behind them and sat down to wait, and I've no memory of what came after until the Dark Lady woke me." } },
      choices = {
        { text = "I'm sorry, Pierce.", next = "school_sorry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    school_sorry = {
      big = true,
      lines = { { id = "ss_default", text = "That's kind of you, though I'm not sure the dead are owed sorrow. I keep the school key on a string around my neck, and some evenings I can't decide whether that's devotion or just a bad habit." } },
      choices = {
        { text = "Keep the key. Some things should be kept.", next = "BACK", reply = "I think I shall, and I'm glad to have someone else say it. Devotion or habit, it's mine.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Throw it in the canal and teach here instead.", next = "BACK", reply = "I do teach here, and I'll teach better for keeping it. The canal can have something else.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "de_default", text = "Slower to start and harder to stop, I'd say. We don't tire, so a Forsaken student will practise the same frost bolt until morning, which is wonderful until he freezes the canal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    book = {
      lines = { { id = "bo_default", text = "A treatise on ley lines, or rather half of one, because the back half was water-damaged and the front half was written by someone who couldn't spell. I've been reading it for a month, and I'm enjoying it enormously, though I couldn't tell you why." } },
      choices = {
        { text = "What happened to the other half?", next = "book_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book_lost = {
      lines = { { id = "bl_default", text = "The canal, I'm afraid, or rather a student who was reading it on the canal's edge when a frost bolt went astray. I've forgiven him, mostly, and I've asked the Deathguard to look for any other copies when they're out in the ruins." } },
      choices = {
        { text = "I'll keep an eye out for a copy.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lake = {
      lines = { { id = "la_default", text = "On Lordamere Lake, on the Hillsbrad side, a little stone house with a blue door and twelve desks, and a view of the Violet Citadel across the water. The pupils used to wave at the towers, as if the mages could see them." } },
      choices = {
        { text = "What's there now?", next = "lake_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lake_now = {
      lines = { { id = "ln_default", fx = { learn = { "dalaran" } }, text = "I don't know, and I've not been brave enough to go and look. I'm told the citadel's behind a great violet dome now, and I like to imagine the school's still there with its door locked, waiting for the spring term." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kaelystia = {
      lines = { { id = "ka_default", text = "Oh, no, not in the least, and I don't blame her, though I do wish she'd sleep, or whatever we do instead of sleeping. She was turned away at Dalaran's gate with the plague in her lungs, and I was only ever turned away by a librarian." } },
      choices = {
        { text = "Should she let it go?", next = "kaelystia_grudge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kaelystia_grudge = {
      big = true,
      lines = { { id = "kg_default", text = "I've asked myself that very often, and I keep coming back to the idea that a grudge is a kind of lesson nobody can finish. What do you think, if you don't mind my asking?" } },
      choices = {
        { text = "Wrongs should be answered. She's right to want it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "A grudge eats the one who carries it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather not judge her.", next = "BACK" },
      },
    },
    offhand = {
      lines = { { id = "oh_default", text = "Keep your off hand still and let it guide, not push, as if you're pointing at something across a room. The scorch marks come from wanting the fire too much, and the fire always knows when it's wanted." } },
      choices = {
        { text = "Thank you, Pierce, that helps a great deal.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "Does it? Then the loa must be rather like a library that talks back, which is my idea of paradise, honestly. You must tell me how you ask them for a spell, and whether they ever say no." } },
      choices = {
        { text = "They say no often, and they laugh when they do.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A schoolmaster on Lordamere Lake, until the plague closed the school. I still carry the key, which I'm told is sentimental of me." } },
    advice = { { id = "tp_ad", text = "Mark your place in a book before you set it down. I never do, and look at me." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. I may have read it somewhere, but if I did, I've shelved it in the wrong place." } },
  },
}

---------------------------------------------------------------------------
-- Josef Gregorian: artisan enchanter, a snob about dust.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_gregorian", id = TODO_NPC("Josef Gregorian"), name = "Josef Gregorian", title = "Artisan Enchanter",
  bible = "bibles/uc_gregorian.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "proud", "precise" }, values = { "ambitious" },
  notices = { "craft", "class" },
  impression = {
    first = "He handled my gear like a jeweller handling paste.",
    third = "{name} met Josef Gregorian, the Undercity's artisan enchanter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you. Come, lean on the table if you like; the runes have taken a liking to you, and so have I." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Please keep your hands off the table, and your gear too. I've seen what you do with an enchantment." },
    { id = "g_default", text = "Please don't lean on the table. The runes on it are older than this city's new name." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. I hope your rods are cleaner than last time." },
    { id = "g_artisan", when = { profession = { name = "Enchanting", min = 225 } }, text = "Ah, an enchanter of some standing at last. Come in, and do wipe your rod before it touches anything of mine." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "An enchanter. Show me your rod; I can tell more from a rod than from any letter of introduction." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You'll understand, then, that magic poured into steel is a different thing from magic flung across a room, and considerably more refined." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Josef Gregorian, artisan enchanter. Lavinia Crowe teaches the basics very ably, and when you've outgrown them, you come to me, and not a moment before." },
        { id = "h_notench", when = { ["not"] = { profession = "Enchanting" } }, text = "You're no enchanter, I see. Still, you're carrying a good deal of steel that's never had a kind word said over it, and that offends me professionally." },
      },
      again = {
        { id = "h_again", text = "Something further? Speak; the runes can wait, as they've waited for centuries." },
        { id = "h_again2", text = "Yes? Do be concise. Enchanting is the art of saying exactly enough, and I prefer conversation the same way." },
      },
      choices = {
        { text = "An enchanter should tell the buyer exactly what the rune does.", next = "BACK", reply = "Always. An enchantment misunderstood is an enchantment wasted.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Tell them it's a greater enchantment. They'll never know the difference.", next = "BACK", reply = "They'll know when the sword stops glowing in the middle of a fight.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What separates an artisan from the rest?", next = "artisan" },
        { text = "You learned your craft somewhere fine, by the look of it.", next = "learned" },
        { text = "Isn't dust just dust?", next = "dust" },
        { text = "What do you think of Lavinia Crowe's teaching?", next = "crowe" },
        { text = "I disenchant everything I find. It's quicker.", next = "everything", when = { profession = "Enchanting" } },
        { text = "Teach me.", next = "BUSINESS", when = { profession = "Enchanting" } },
        { text = "Good day, Gregorian.", next = "END" },
      },
    },
    artisan = {
      lines = { { id = "ar_default", text = "Patience, mostly, and an eye for which dust is worth keeping. Anyone can break a sword into powder, but it takes years to learn which swords deserve it." } },
      choices = {
        { text = "Every craft needs a master's standards.", next = "BACK", reply = "It does, and I'm pleased to hear it said. Come to my bench when you're ready to learn which swords deserve it.", fx = { align = { order = 1 } } },
        { text = "Results matter more than standards, Gregorian.", next = "BACK", reply = "Results, he says, as though a fine sword ground to dust were a result. Go and break things elsewhere.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned = {
      lines = { { id = "le_default", text = "In the palace above, as a junior to the court enchanter, who put a shine on King Terenas's ceremonial blades. I was polishing one of them on the day Prince Arthas came home, and I've not polished a blade for royalty since." } },
      choices = {
        { text = "So you saw Arthas return.", next = "learned_arthas" },
        { text = "Something else.", next = "BACK" },
      },
    },
    learned_arthas = {
      lines = { { id = "la_default", text = "I saw the bells ring and the petals fall, and I went back to my bench, because the work wasn't finished. I have had years since to think about that unfinished blade." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    dust = {
      lines = { { id = "du_default", text = "Dust is no more just dust than wine is just grapes. Strange dust from a farmhand's boots is thin and sour, but strange dust from a good soldier's blade has body to it, and a little warmth on the finish, and I can tell the two apart blindfolded." } },
      choices = {
        { text = "Blindfolded? How is that even possible?", next = "dust_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dust_how = {
      lines = { { id = "dh_default", text = "By the way it settles in the bowl, and by the faint hum against the rod, which most enchanters are far too hurried to hear. Let me test your eye in return: when you look at a fine sword, what do you see first?" } },
      choices = {
        { text = "The edge, and whether it'll hold.", next = "see_edge", fx = { trait = { practical = 1 } } },
        { text = "The hand that made it.", next = "see_maker", fx = { trait = { curious = 1 }, affinity = 1 } },
        { text = "What it would fetch at auction.", next = "see_price", fx = { trait = { greedy = 1 } } },
      },
    },
    see_edge = {
      lines = { { id = "se_default", text = "A soldier's answer, sensible and a little dull. You'll keep your weapons sharp, and I'll keep the poetry, and we needn't trouble one another." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    see_maker = {
      lines = { { id = "sm_default", text = "Ah, now that is the beginning of taste. Every blade remembers its maker a little, and the best enchantments only coax that memory out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    see_price = {
      lines = { { id = "sp_default", text = "Then you've the soul of a goblin, and I'll thank you to keep it on your side of the table. Some things are worth more than they fetch, though I don't expect you to believe me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    crowe = {
      lines = { { id = "cr_default", text = "Lavinia is thorough, and patient, and I could never do what she does with beginners. I do wish she'd stop letting them handle rods with bare hands, though, because I can taste their fingers in the dust for weeks afterwards." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    everything = {
      lines = { { id = "ev_default", text = "Everything? You break good steel and bad steel alike and call it efficiency? That is the habit of a quarry, not a craftsman, and I'll ask you to say it more quietly near my bench." } },
      choices = {
        { text = "Quick work keeps the Scourge back. That's what counts.", next = "BACK", reply = "Then go and keep it back, and leave my bench in peace. Craft can wait for the end of the war, I suppose.", fx = { align = { order = -1 } } },
        { text = "You're right. I'll learn to choose with care.", next = "BACK", reply = "Splendid, then we'll make an enchanter of you yet. Bring me a sword you think deserves it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's no concern of an enchanter, and therefore none of mine. Bring me something that hums, and we'll talk." } },
  },
}

---------------------------------------------------------------------------
-- Hannah Akeley: reagent vendor, brisk and superstitious.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_akeley", id = TODO_NPC("Hannah Akeley"), name = "Hannah Akeley", title = "Reagent Supplies",
  bible = "bibles/uc_akeley.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "brisk", "warm" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "She has a horseshoe over her table and a superstition for everything.",
    third = "{name} met Hannah Akeley, who sells reagents in the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you, and on a lucky day besides! I've set aside a pinch of the good grave dust for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Step round the horseshoe, not under it; I'll have no more bad luck on your account." },
    { id = "g_default", text = "Powders, candles, chalk and grave dust, the usual things for the unusual folk. What'll it be?" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? I knew you would be; everyone runs out of something, and down here the dead run out of patience first." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Evening, love. Mind you step in with your right foot first; it's a dark night, and I'm not taking chances." },
  },

  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK", "SHAMAN", "DRUID" } },
      text = "You've the look of someone who's just run out of something important. Don't worry, I've got it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Hannah Akeley, reagents and supplies. Mages, priests, warlocks, anyone who needs a pinch of something before the magic works, living or otherwise, they all end up at my table eventually." },
        { id = "h_warrior", when = { class = { "WARRIOR", "ROGUE" } }, text = "You don't look like a spellcaster, love. If you're lost, the War Quarter is that way, but you're welcome to browse." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? I've a queue of warlocks behind you, and they're not patient." },
        { id = "h_again2", text = "Go on, love, ask away. Just don't whistle while you do it; it's bad luck indoors." },
      },
      choices = {
        { text = "Weigh the reagents fairly, even for strangers.", next = "BACK", reply = "My granny weighed fair, and she lived to ninety. Well, until the plague.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A heavy thumb on the scale never hurt anyone.", next = "BACK", reply = "It hurts the one who does it, sooner or later. That's how luck works.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I'd guess the warlocks are your best customers.", next = "customers" },
        { text = "Where do you get it all?", next = "source" },
        { text = "Why is there a horseshoe over your table?", next = "horseshoe" },
        { text = "Do you sell soul shards, or must I harvest my own?", next = "shards", when = { class = "WARLOCK" } },
        { text = "I'll need an ankh or two, Hannah.", next = "ankh", when = { class = "SHAMAN" } },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Goodbye, Hannah.", next = "END" },
      },
    },
    customers = {
      lines = { { id = "cu_default", text = "The warlocks buy the most, because they spend souls like the living spend pennies. The mages complain the most, and the priests say thank you, which I've come to value more than either." } },
      choices = {
        { text = "Manners still matter, even here.", next = "BACK", reply = "They do, and they're rarer than anything I sell. Thank you for remembering.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Coin talks louder than thank you, Hannah.", next = "BACK", reply = "Louder, perhaps, but it's the thank you I remember at night. Spend your coin, dear, and mind your manners.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "so_default", text = "Here and there, and from the apothecaries when they've something left over. I don't ask what was boiled to make the ash, and I'd recommend you don't either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    horseshoe = {
      lines = { { id = "ho_default", text = "For luck, dear, same as it hung over my mother's door in Tirisfal. I know, I know, I died anyway, but I'd have died a good deal sooner without it, I'm sure of that." } },
      choices = {
        { text = "You're superstitious, then?", next = "superstition" },
        { text = "Something else.", next = "BACK" },
      },
    },
    superstition = {
      lines = { { id = "su_default", text = "Dying didn't cure me of it, love, if that's what you're asking. I never sell the last candle in a box, I tap the table three times after a warlock pays, and I keep salt by the till, though I've no idea any longer which shoulder it goes over. What about you, have you got a lucky charm?" } },
      choices = {
        { text = "I do. I never fight without it.", next = "charm_yes", fx = { trait = { cautious = 1 }, affinity = 1 } },
        { text = "Luck is for people without a good blade.", next = "charm_no", fx = { trait = { skeptical = 1 } } },
        { text = "You're my lucky charm now, Hannah.", next = "charm_you", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    charm_yes = {
      lines = { { id = "cy_default", text = "Good, and don't you dare tell me what it is, or it'll stop working. Keep it in the left pocket; that's the side nearer the heart, even if yours has stopped." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    charm_no = {
      lines = { { id = "cn_default", text = "That's what my husband said, love, and he was the first in our street to go. I'm not saying the two are connected, but I'm not saying they aren't, either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    charm_you = {
      lines = { { id = "cx_default", text = "Oh, go on with you! Well, then, you'd better come back regularly, because a charm only works if you keep it close." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shards = {
      lines = { { id = "sh_default", text = "Light, no, dear, you make those yourself, and I'd thank you not to do it near my table. I'll sell you candles and chalk all day long, but whatever goes into those little purple stones, I want no part of." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ankh = {
      lines = { { id = "an_default", text = "Ankhs, yes, I keep a few for the shamans that come through on the zeppelin. Strange things, love, a charm that brings you back from the dead, and I'll admit it's the only one I sell that I'm a little jealous of." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not a thing I sell, dear, and not a thing I know. Knock on wood before you ask anyone else, just in case." } },
  },
}
