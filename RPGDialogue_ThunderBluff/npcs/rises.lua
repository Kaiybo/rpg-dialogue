-- Thunder Bluff's rises: the Forsaken apothecary on Spirit Rise and the trainers of Hunter Rise. Voice: bibles/thunderbluff.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zamah", id = TODO_NPC("Apothecary Zamah"), name = "Apothecary Zamah",
  bible = "bibles/thunderbluff.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "dry" }, values = { "curious", "ambitious" },
  notices = { "race", "lock_shards" },
  impression = {
    first = "She wants serpentbloom, and she is politely vague about why.",
    third = "{name} met Apothecary Zamah, the Forsaken apothecary beneath Thunder Bluff's Spirit Rise.",
  },
  greetings = {
    { id = "o_sylv_admire", when = { opinion = { sylvanas = "admire" } }, text = "I'm told you'd die again for the Dark Lady. How refreshing, among all these cattle who only ever stare." },
    { id = "g_hi", text = "Do come in, and don't mind the smell. The tauren tell me it's an acquired tolerance." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still breathing. How refreshing, and how very temporary." },
    { id = "g_rise", when = { origin = "tauren_spirit_rise" }, text = "Ah, the water-carrier! You used to haul jugs past my door for the seers every morning, and now I'm told the elements speak to you. Do tell them the smell from my workshop is entirely deliberate." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and you're still breathing, which puts you well ahead of my samples. Do come in." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "The tauren are whispering that one of them believed a tale of yours, and I find that terribly amusing. They're such trusting creatures, aren't they?" },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear one of your fibs was seen through up on the rises. A pity, really, because a lie should be handled with the same care as any other poison." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren who comes down here willingly? Your elders mostly cross the pools to avoid me." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Ah, a fellow citizen of the Undercity. It's pleasant to talk to someone who doesn't flinch." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "Ah, soul shards, and a good many of them, by the cold coming off your pack. If I had my laboratory instead of a tent on a mesa, I'd be trying very hard to talk you out of a few for study." },
  },
  start = "hello",
  nodes = {
    op_tauren = {
      lines = {
        { id = "opt_q", text = "I'll tell you a secret: I find them fascinating, in the way one finds a very large and very polite cow fascinating. What do you make of our hosts?" },
      },
      choices = {
        { text = "They're the kindest people in the Horde. Mind your manners here.", next = "op_tauren_r1", fx = { affinity = -1, align = { light = 1 }, opinion = { tauren = "admire" } } },
        { text = "They're slow and sentimental. The Forsaken carry the Horde's real work.", next = "op_tauren_r2", fx = { affinity = 2, align = { light = -1 }, opinion = { tauren = "soft" } } },
        { text = "They gave your people a home. You owe them for it.", next = "op_tauren_r3", fx = { opinion = { tauren = "respect" } } },
        { text = "I'm tauren, apothecary, and I'd thank you to stop staring back.", next = "op_tauren_r4", fx = { affinity = 1, trait = { proud = 1 }, opinion = { forsaken = "distrust" } }, when = { race = "Tauren" } },
        { text = "I'll leave the tauren to speak for themselves.", next = "BACK" },
      },
    },
    op_tauren_r1 = {
      lines = {
        { id = "op_tauren_r1", text = "Kind, yes, and kindness is a lovely thing in a host, though a poor defence against anything sharper. I'll mind my manners, since you ask so sweetly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_tauren_r2 = {
      lines = {
        { id = "op_tauren_r2", text = "You'd fit nicely in the Undercity, I think. Do keep that opinion off the lifts, though, because the tauren are very large." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_tauren_r3 = {
      lines = {
        { id = "op_tauren_r3", text = "We owe the Chieftain, yes, and the Society always pays its debts in the end. How it pays them is another matter." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_tauren_r4 = {
      lines = {
        { id = "op_tauren_r4", text = "Oh, spirit! Perhaps there's hope for the herd after all. I'll stare a little less, and you may stare a little more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_wc = {
      big = true,
      lines = { { id = "xcl_wc_default", text = "And you came back with all your limbs, which the deviate creatures down there do not usually allow. The serpentbloom in those caves carries a toxin the Society finds very instructive, and a quieter cavern makes my collectors' work safer. The tauren call the place a wound and I call it a laboratory, and we are both quite sincere." } },
      choices = {
        { text = "The Society should study it, whatever it finds.", next = "BACK", reply = "How refreshing, a druid who understands science. I'll put your name beside the serpentbloom in my notes, which is the closest thing to gratitude the Society keeps.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "That place should be healed, Zamah, not harvested.", next = "BACK", reply = "Healed by whom, the druids who went mad down there? I'll take my samples, and the tauren can sing over whatever's left.", fx = { align = { light = 1 } } },
        { text = "Something has made the creatures there deviate.", next = "xcl_wc2" },
      },
    },
    xcl_wc2 = {
      lines = { { id = "xcl_wc2_default", text = "As far as we can tell, the dream of the sleeping druid Naralex leaked into the water and the water into everything else. The changes are fast and unpredictable, which in a living thing means something powerful at work, and if it could be understood it might be very useful, though I wouldn't say so to Hamuul." } },
      choices = { { text = "I'll keep that between us, Zamah.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because the Silver Hand was Lordaeron's, and Lordaeron hunted us when we woke. Some of its knights still ride the Plaguelands against us. You call on their Light, and the Dark Lady likes to know whose loyalties outlived the grave." } },
      choices = {
        { text = "Mine belong to the Dark Lady. Write that down.", next = "BACK", reply = "Oh, I shall, in my best hand, and the Dark Lady will be pleased to read it. It's always nice to find a paladin who knows which side the grave is on.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My loyalty is to the Light, apothecary. Note that.", next = "BACK", reply = "Noted, and underlined twice. Don't be surprised if someone in Undercity asks you about it one day, paladin, and do try to answer as bravely.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They trust the Earth Mother's healing, and they tolerate ours because Cairne asks them to. A troll's prayer or a Forsaken's shadow both make them twitch, though they'll still bring you a fevered calf when the shaman are out on the plains. I find that rather sweet of them, in a bovine sort of way." } },
      choices = {
        { text = "Healing is healing, whoever does it. They'll learn that.", next = "BACK", reply = "Perhaps they will, though cows learn slowly, I find. Until then I'll heal their calves and smile and let them wonder what I really think.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them twitch. Their fear makes them easier to manage.", next = "BACK", reply = "A charming thought, and not a wrong one, but say it more quietly up here. The tauren have very long memories and very large hooves.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Deviate raptors, deviate crocolisks and a family of druids who have dreamed themselves quite mad. The blooms I need grow among all of them, so a warrior who keeps the beasts busy while someone else does the picking is worth his weight in silverleaf." } },
      choices = {
        { text = "I'll guard the gatherers and keep them alive.", next = "BACK", reply = "Good, the gatherers are expensive to replace, and their screaming carries. Keep them breathing, and the Society will think kindly of you.", fx = { align = { order = 1 } } },
        { text = "I'll go for the loot. The picking's your problem.", next = "BACK", reply = "How refreshingly honest, and how very like a warrior. Just don't loot my gatherers, please, I need them mostly intact.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Something in the dream, if the druids are to be believed, or something in the water, if you ask me. The deviate creatures down there are twisted in ways I've never seen, and I would very much like a fresh sample of one, preferably not attached to the rest of it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Do keep your {pet} out of the caverns' pools, by the way. Whatever twists the beasts down there isn't particular about whose beast it twists." },
      },
      choices = {
        { text = "I'll bring samples to cure the sickness, Zamah.", next = "BACK", reply = "A cure, yes, of course, that is exactly what we are all working toward. Bring them fresh, and keep them sealed, and don't sniff the jar.", fx = { align = { light = 1 } } },
        { text = "Samples are worth coin, apothecary. I'll name my price.", next = "BACK", reply = "Name it, then, and I'll laugh at it, and we'll settle somewhere in between. The Society pays fairly for things that are hard to get.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "It does, and I'd be a poor apothecary if I couldn't name a dozen of them, but the tauren believe I'm making medicine, and so I am, mostly. Bring the blooms up from the Wailing Caverns and keep your guesses to yourself, and we'll both stay welcome on Spirit Rise." },
      },
      choices = {
        { text = "Secrets suit me. Your work is safe with me.", next = "BACK", reply = "Then we'll get along splendidly, you and I. The living make the best collaborators when they're too busy to ask questions.", fx = { align = { order = -1 } } },
        { text = "If it harms the tauren, they should know.", next = "BACK", reply = "Harms them? My dear, I am making medicine. Go and tell them so, if you like, and watch them nod politely and forget it by supper.", fx = { align = { order = 1 } } },
        { text = "What do you really want serpentbloom for?", next = "serpent" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They mind, quietly, the way tauren mind everything, with long looks and longer silences. The Pools of Vision are holy to them, so I'd keep your spells in your pocket down here, whatever you think of their spirits." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "They mind me already, so a second Forsaken in a mage's robe is hardly going to ruin anyone's day. Keep your spells in your pocket down here, though, because the Pools of Vision are holy to them, and Cairne's patience is what keeps us all welcome." },
      },
      choices = {
        { text = "Their pools, their rules. I'll keep my spells still.", next = "BACK", reply = "Very wise, and more courteous than most of your kind manage. The tauren will notice, even if they never say a word about it.", fx = { align = { order = 1 } } },
        { text = "Holy or not, the pools don't own my magic.", next = "BACK", reply = "Then by all means, light up the holy water and see how Cairne's braves feel about it. I'll be somewhere else, taking notes.", fx = { align = { order = -1 } } },
        { text = "How do the tauren treat you here?", next = "tauren" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They look at me the same way, and I didn't bring a pet from the Nether. The tauren know what fel fire does to grass and to people, so you might as well get used to the looks, because they won't stop." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "They look at me the same way, and I didn't even bring a demon, though I see you did, and it's leaning over my table like it wants to sample the merchandise. The tauren know what fel fire does to grass and to people, so get used to the looks, and get it away from my vials." },
      },
      choices = {
        { text = "Their fear is fair. I'll keep it on a short leash.", next = "BACK", reply = "Good, an imp in a cave full of reagents is a recipe for a very short afternoon. The tauren will still stare, but they'll stare less.", fx = { align = { light = 1 } } },
        { text = "Let them stare. Fear keeps people polite.", next = "BACK", reply = "Polite, perhaps, but not friendly, and we live by their good grace down here. Stare back if you like, just don't set anything on fire.", fx = { align = { light = -1 } } },
        { text = "Why are the Forsaken in Thunder Bluff?", next = "why" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I gather serpentbloom from the Wailing Caverns, where druids were lost to a dream gone foul, and your elders can't decide whether I study the plant or the sickness. I study both, of course, which is exactly what they fear." } },
      choices = {
        { text = "Then say plainly what you study, because secrets breed distrust.", next = "BACK", reply = "Plainly? I study the plant and the sickness, and I'd tell any elder who asked. They don't ask, because they don't want to hear the answer.", fx = { align = { honor = 1 } } },
        { text = "Keep your notes close. They needn't know everything.", next = "BACK", reply = "A druid after my own heart, or what's left of mine. They know enough to sleep at night, and that's a kindness, really.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, here among our tauren friends. How curious. The Society keeps notes on Forsaken who cling to the old Light, and I'm afraid you've just become one." },
        { id = "h_default", key = true,
          text = "I am Apothecary Zamah, and I represent the Royal Apothecary Society here among our tauren friends. Cairne lets us study, and in return we share our cures, mostly, like the ones I brew from serpentbloom." },
        { id = "h_serpent", when = { questActive = TODO_QUEST("Serpentbloom") },
          text = "The serpentbloom grows in the Wailing Caverns, among the druids who've gone wrong down there. Bring me what you can, and mind the fumes." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Ah, a shaman. The elements are such fascinating subjects, and so very poor at holding still to be studied." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Splendid; the Wailing Caverns are full of things that bite, and I find warriors far more useful down there than poetry." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know a sick beast from a healthy one, which makes you more useful to the Society than most of the tauren I've asked." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, down here among the Pools of Vision. The tauren will assume you've come to bless the water, so please don't, because blessed water spoils my samples." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, and so another of Hamuul's watchers. His students on Elder Rise are always terribly polite to me, which in my experience is how the living say they don't trust you." },
        { id = "h_cl_wc", tags = { "news" }, when = { cleared = "Wailing Caverns", faction = "Horde" }, text = "You've been to the bottom of the Wailing Caverns, I'm told, and come out unpoisoned, which is remarkable considering what grows down there." },
        { id = "h_dd_fang", tags = { "news" }, when = { questDone = TODO_QUEST("Leaders of the Fang") }, text = "The young druid on Elder Rise, Wildmane, is going about with a smile on her face and telling everyone you killed the Druids of the Fang for her. I suppose that's one way to cure a nightmare, though the Society would have preferred the specimens alive." },
      },
      choices = {
        { text = "Do the tauren trust a priest's healing?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why are the Forsaken in Thunder Bluff?", next = "why" },
        { text = "What do you want serpentbloom for?", next = "serpent" },
        { text = "I'd guess the tauren don't know what to make of you.", next = "tauren" },
        { text = "What does the Society really study?", next = "society", when = { race = "Scourge" } },
        { text = "The spirits of the Pools must trouble you, Zamah.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Serpentbloom has other uses, I'd imagine.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the tauren mind mages walking their sacred pools?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What bites in the Wailing Caverns, Zamah?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What makes the beasts in the Wailing Caverns sick, Zamah?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The tauren look at my little companion as if it were plague.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why do the druids distrust you, Zamah?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Why does the Society keep notes on paladins, Zamah?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I went to the bottom of the Wailing Caverns, Zamah.", next = "xcl_wc", when = { cleared = "Wailing Caverns", faction = "Horde" } },
        { text = "You wanted the Fang druids alive, Zamah?", next = "dd_fang", when = { questDone = TODO_QUEST("Leaders of the Fang") } },
        { text = "Have you studied the night elves' moonwells, Zamah?", next = "ne_zamah" },
        { text = "I'll be going.", next = "END" },
      },
      again = {
        { id = "h_again", text = "More questions? I do like a curious mind, while it lasts." },
        { id = "h_again2", text = "Ask what you will. The pools are patient, and so, I've found, is the grave." },
      },
    },
    ne_zamah = {
      lines = {
        { id = "ne_default", text = "Studied them? I've never been allowed within a bowshot of one, which is precisely what makes them so interesting. Hamuul's students speak of moonwell water as though it were holy, and the Society would very much like to know whether it is holy, or merely very old, or simply very good at frightening the dead." },
      },
      choices = {
        { text = "Frightening the dead?", next = "ne_zamah_dead" },
        { text = "Why would the Society want moonwell water?", next = "ne_zamah_why" },
        { text = "Something else, Zamah.", next = "BACK" },
      },
    },
    ne_zamah_dead = {
      lines = {
        { id = "nd_default", text = "Oh, yes. Those of our people who strayed into Ashenvale and came home say the elves' priestesses called down a silver light that burned worse than the Light, and drew no line between a Forsaken and a Scourge ghoul. I'd give a great deal to know whether the moon or the water does it, purely for science, of course." },
      },
      choices = {
        { text = "To an elf, a Forsaken looks no different from the Scourge.", next = "BACK",
          reply = "A fair point, and an unflattering one. They fought the Scourge at Hyjal while we were still marching in it, so I can't fault their eyesight, only their manners.",
          fx = { align = { light = 1 }, opinion = { night_elves = "mixed" } } },
        { text = "Then the elves are no better than the Scarlet Crusade.", next = "BACK",
          reply = "Kinder words than I'd have chosen, but yes, a torch is a torch whether a zealot lights it or a moon priestess. The Society keeps a list of such people, and the kaldorei are on it, somewhere below the Crusade and above the gnolls.",
          fx = { affinity = 1, align = { light = -1 }, opinion = { night_elves = "hate" } } },
        { text = "Something else, Zamah.", next = "BACK" },
      },
    },
    ne_zamah_why = {
      lines = {
        { id = "nw_default", text = "Because the first of those wells was filled from the Well of Eternity, if the druids' stories are right, and the elves lived ten thousand years beside them without aging a day. The druids insist their great tree kept them young and not the water, but I've never trusted a druid's account of anything I couldn't put in a flask." },
      },
      choices = {
        { text = "Hamuul would never let you near a moonwell.", next = "BACK",
          reply = "Hamuul would never let me near his teapot, my dear, so I don't take it personally. One day the Circle will want something from the Society, and on that day I'll name my price in water." },
        { text = "Something else, Zamah.", next = "BACK" },
      },
    },
    dd_fang = {
      lines = {
        { id = "dd_fang_1", text = "Alive, dead, or in between, which is the state I find most instructive. Druids who drank from a poisoned dream and came back changed are of great interest to the Royal Apothecary Society, because the Dark Lady's people know a thing or two about coming back changed." },
      },
      choices = {
        { text = "Some things are better left dead, Zamah.", next = "BACK", reply = "Spoken like someone with a pulse. I'll note it in my journal, under opinions of the living, which is a very long page.", fx = { align = { light = 1 } } },
        { text = "Next time I'll bring you what's left of them.", next = "BACK", reply = "How refreshingly practical of you. A jar of cavern water and a scrap of robe would do, and please don't tell the druids on Elder Rise.", fx = { align = { light = -1 } } },
        { text = "Something else, Zamah.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because Cairne Bloodhoof, bless his enormous heart, spoke for us when the rest of the Horde would sooner have burned us. The tauren believe we can be healed of our curse, and we are happy to let them believe it." } },
      choices = { { text = "You don't sound like you believe you can be healed.", next = "why_heal" } },
    },
    why_heal = {
      lines = { { id = "wh_default", text = "I believe in study, and the tauren have herbs and spirits we have never examined. Whether that ends in a cure or in something more useful, the Dark Lady will decide." } },
      choices = { { text = "Something more useful?", next = "why_useful" } },
    },
    why_useful = {
      lines = { { id = "wu_default", text = "A cure for the Scourge's plague, of course, for the living as well as the dead. What else could I possibly mean?" } },
      choices = {
        { text = "Cairne trusted you. Don't betray that.", next = "BACK", reply = "Betray him? Never, the Dark Lady values his hospitality far too much. You may rest easy on that account, at least as easy as the living ever rest.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Use what you learn however you must.", next = "BACK", reply = "Exactly my thinking, and the Society's as well. Knowledge is a blade, and it's the hand that decides what it cuts.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    serpent = {
      lines = { { id = "s_default", text = "Its venom has properties the Society finds remarkable, and the druids of the Fang have made it grow strange and strong. I would very much like to know how." } },
      choices = { { text = "I'll gather some.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      lines = { { id = "t_default", text = "With courtesy and a good deal of staring. Magatha Grimtotem is the only one who looks at me as though she understands me, which I find rather more worrying than the staring." } },
      choices = {
        { text = "And what do you make of them?", next = "op_tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    society = {
      lines = { { id = "so_default", text = "Plagues, my dear, and everything that cures them or carries them. One must understand a weapon before one can turn it away, or turn it around." } },
      choices = { { text = "I'll keep that between us.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The tauren say the Pools of Vision show the spirits of their ancestors, and I'll admit some of my samples behave oddly near the water. The dead and the elements are not good neighbors, I find, so your elders watch me closely, and I smile at them." } },
      choices = {
        { text = "The tauren trusted you here, so repay that with honest work.", next = "BACK", reply = "Honest work is all I do, shaman, you have my word on it, for whatever a dead woman's word is worth to you. Do keep watching, though, it amuses me.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever you find down there, keep it from the elders.", next = "BACK", reply = "Well, you're a more interesting shaman than I expected. I won't hide anything I'm not asked about, and the elders never ask the right questions.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I'm afraid that falls outside the Society's research, and therefore outside my interest." } },
    forsaken = {
      { id = "tp_forsaken", text = "The Forsaken are free, and the Society means to keep us so. Our research is for the good of all our people, and I hope the tauren will come to see that." },
      { id = "tp_forsaken2", when = { race = "Scourge" }, text = "A fellow citizen, how nice. Do try not to frighten the tauren, as they frighten so easily, and it makes my work so much harder." },
    },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady is our queen and our saviour, and the Society serves her in all things. I would never question her plans, and I would never let anyone else question them either." } },
    scourge = { { id = "tp_scourge", text = "The Scourge are our enemies, and the Society is learning how to destroy them. We study plague, which is the Scourge's weapon, and so we must understand it better than they do." } },
    cairne = { { id = "tp_cairne", text = "Cairne is a gracious host, and I am grateful for his hospitality. His people are less gracious, but I suppose that is to be expected." } },
  },
}

P:NPC {
  key = "holt", id = TODO_NPC("Holt Thunderhorn"), name = "Holt Thunderhorn",
  bible = "bibles/thunderbluff.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "patient", "wise" },
  prejudice = { class = "WARLOCK", amount = 10, why = "Hunts beside beasts; a demon at the heel sets every animal on the rise, and him, against you." },
  notices = { "class" },
  impression = {
    first = "His family is known across Mulgore for its archers.",
    third = "{name} met Holt Thunderhorn, the hunter trainer on Thunder Bluff's Hunter Rise.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, friend. Come, let's train. You're stronger than you were." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Garra climbed the Rise last moon. I wonder if you'll ever be her match." },
    { id = "g_garra_resolved", when = { class = "HUNTER", thread = { id = "hun_horde", state = "resolved" } }, text = "Garra Steelgaze climbed the Rise last moon, and she listened longer than I expected. Walk with the Earth Mother, friend." },
    { id = "g_garra_soured", when = { class = "HUNTER", thread = { id = "hun_horde", state = "soured" } }, text = "The wagons still roll north out of the Barrens. I count them, as I said I would." },
    { id = "g_hi", text = "Welcome to Hunter Rise. The wind is good for archery today; the Earth Mother is in a generous mood." },
    { id = "g_prejlock1", when = { prejudiced = true }, text = "Every beast on this rise has its hackles up, and so have I. Say your business and then go back down the lift." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "My students keep their beasts on short leads when you come up the ramp, and I told them to. A hunter trusts what his animals tell him." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "The beasts have mostly stopped snarling when you come up the ramp. I haven't stopped watching you, but I'll hear you out." },
  },
  start = "hello",
  nodes = {
    garra_end = {
      big = true,
      narr = "He looks east, toward the Barrens, as though he could count the herds from here.",
      lines = { { id = "garra_end_default", key = true,
        text = "Ormak is not wrong, and that is the trouble, for a hungry city is as real as a thin herd. You have walked between them both, hunter, so tell me: should Garra learn our rites, or should the herds bear the Horde's hunger?" } },
      again = { { id = "garra_end_again", text = "You have answered me, and I remember it." } },
      choices = {
        { text = "Teach her the rites. Take only what the herds can spare.", next = "garra_rites",
          fx = { thread = { id = "hun_horde", state = "resolved" }, align = { order = 1 }, affinity = 1 },
          journal = { first = "I told Holt Thunderhorn that Garra should learn the old rites.", third = "{name} told Holt Thunderhorn that Garra Steelgaze should learn the old rites." } },
        { text = "Orgrimmar has to eat. The herds will have to bear it.", next = "garra_hunger",
          fx = { thread = { id = "hun_horde", state = "soured" }, align = { order = -1 } },
          journal = { first = "I told Holt Thunderhorn that the Horde's hunger comes before the herds.", third = "{name} told Holt Thunderhorn that the Horde's hunger came first." } },
        { text = "I need to think on it, elder.", next = "BACK" },
      },
    },
    garra_rites = {
      lines = { { id = "garra_rites_default",
        text = "Then I will teach her myself, if she will climb the Rise to hear it, and I think she will, for a good hunter always wants to know where her prey will be next year. May the Earth Mother bless the counting." } },
      choices = { { text = "Walk with the Earth Mother, elder.", next = "END" } },
    },
    garra_hunger = {
      lines = { { id = "garra_hunger_default",
        text = "Perhaps it does, and perhaps the plains will forgive it. But the plains will remember who said so, long after the Horde has forgotten." } },
      choices = { { text = "Then let them remember.", next = "END" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'd hunt beside anyone who respects the beast. The tauren never needed the Light, but I'm curious what it does to a hunter's patience. If it makes you steady, it may do you more good than you think." } },
      choices = {
        { text = "It makes me steady. I'll respect the hunt.", next = "BACK", reply = "Then come hunt with me some cold morning, and we'll see what the Light does when a kodo bull turns. I suspect you'll do well.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm no hunter, Holt. I'll take what I need.", next = "BACK", reply = "Then you'll find the plains less generous than you think, paladin. The beasts don't care whether you call yourself a hunter, only how you take them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "More often than their pride would let them say. A plainstrider's kick or a quilboar's spear in the thigh, and they limp up the lift hoping I won't notice. The shaman mend them well enough, but I've seen a troll priest close a wound in a single breath, and it impressed even this old hunter." } },
      choices = {
        { text = "I'll mend any hunter who limps up that lift.", next = "BACK", reply = "Then you'll be the most popular healer on the bluff, and the hunters will pretend they never needed you. Thank you, from an old hunter who limps too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pain teaches them caution. Let them limp a while.", next = "BACK", reply = "There's truth in it, I'll grant, and I've limped for my own lessons. But a hunter with a festering thigh doesn't learn caution, he learns to die quietly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To hunt your enemy as a hunter hunts a kodo, patiently and with respect, and to strike only when the moment is right. The centaur of the Barrens charge without thinking, and the warriors who wait for the charge to break are the ones who win the day." } },
      choices = {
        { text = "I'll wait for the right moment, Holt.", next = "BACK", reply = "Then you'll outlive the ones who don't, and that's the first lesson of every hunt. Lie in the grass until your legs ache, and then a little longer.", fx = { align = { order = 1 } } },
        { text = "Waiting loses battles. I strike first.", next = "BACK", reply = "Some do, and some battles are won that way, I'll not deny it. But the centaur are counting on you to think like that, and they've been right before.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Patience, respect and a steady hand, in that order, because the Thunderhorns have hunted Mulgore since long before the bluffs had bridges. We honour the beast we take and we never take more than the tribe needs, and a hunter who forgets that is no Thunderhorn, whatever his name." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Patience, respect and a steady hand, in that order. {pet} walks proudly beside you, {class}, and that pride comes from you, so I hope you've earned it." },
      },
      choices = {
        { text = "I'll honour every beast I take, Holt.", next = "BACK", reply = "Then you'll hunt as a Thunderhorn hunts, whatever blood you carry. The beasts will know it, and the Earth Mother will too.", fx = { align = { honor = 1 } } },
        { text = "A good kill is its own honour, Holt.", next = "BACK", reply = "It's half of it, maybe, and the half that young hunters understand best. The other half you'll learn on the day you take one that you shouldn't have.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "That's true, and I've watched a troll rogue sit so still in the grass that a plainstrider stepped on him. But a hunter is patient so the beast can be honoured, and I'm not sure a rogue is patient for anything but the purse at the end of it." },
      },
      choices = {
        { text = "Patience for its own sake, then. I'll learn that.", next = "BACK", reply = "Then you'll be a better rogue than most, and maybe a better hunter than some. Come out to the plains with me one dawn, and I'll show you how long a proper stalk can take.", fx = { align = { light = 1 } } },
        { text = "The purse at the end is reason enough.", next = "BACK", reply = "For a rogue, perhaps it is, and I'll not tell you how to live. Just don't bring that purse out hunting with me, or the beasts will hear it jingle.", fx = { align = { light = -1 } } },
        { text = "What does the Earth Mother ask of hunters?", next = "mother" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Perhaps, but then the arrow would be the mage's and not the archer's. The Thunderhorns have shot true for generations with nothing but good wood and good eyes, and I'll keep teaching it that way." },
      },
      choices = {
        { text = "Tradition has its strength. I'll respect it.", next = "BACK", reply = "It does, and it's given my family many good seasons. I'll not ask you to learn a bow, mage, only to let me keep mine.", fx = { align = { order = 1 } } },
        { text = "A truer arrow is a truer arrow, whatever moves it.", next = "BACK", reply = "Maybe so, but it's a different arrow, and the kodo deserves the one I loosed. We'll not agree on this, I think, and that's no harm between us.", fx = { align = { order = -1 } } },
        { text = "Are there other Thunderhorns besides you?", next = "kin" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Hamuul tells no one how to hunt, but his students like to ask, quietly, how many kodo we took this season and whether we spared the calves. I grumble about it and then I count, because they're usually right about what the herds can bear." } },
      choices = {
        { text = "Someone should keep count, or the herds won't last.", next = "BACK", reply = "That's what the druids say too, and I've stopped arguing with them. A herd counted carefully is a herd that's still there for my grandchildren.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A hunter's own judgment should be enough, without anyone counting.", next = "BACK", reply = "It should be, and in a good season it is. But hunters are hungry and proud, and pride is a poor counter of calves.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because they smell what doesn't belong in the world, and something on you doesn't belong in it. The Thunderhorns have hunted Mulgore for generations without needing anything from the Twisting Nether, but the Horde takes all kinds, and so will I." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Because they smell what doesn't belong in the world, and they can smell your demon from here, so look how the hounds have their hackles up. The Thunderhorns never needed anything from the Twisting Nether to hunt Mulgore, but the Horde takes all kinds, and so will I, if you keep it still." },
      },
      choices = {
        { text = "Then I'll walk slowly, out of respect.", next = "BACK", reply = "The beasts will thank you for it, and so will I. A slow step tells them you mean no harm, even with that thing at your heel.", fx = { align = { light = 1 } } },
        { text = "Your beasts will learn their place.", next = "BACK", reply = "They know their place already, and it's far from whatever smells of the Nether. Keep that thing close, before one of them decides otherwise.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. The Thunderhorns have hunted Mulgore for generations, and we've never hunted beside one of you." },
        { id = "h_default", key = true, text = "I am Holt Thunderhorn, and I teach the hunters of Thunder Bluff. The Thunderhorns have hunted Mulgore since long before the bluffs had bridges." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Your bow has seen use since we last met, hunter. Let me see what you have learned." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman on Hunter Rise? You're welcome here, though my students will want to know if you can call the wind to steady an arrow." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior on Hunter Rise. Stay a while, because the Thunderhorns have taught more than hunters to read the plains." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "One of mine comes home. Tell me what you've tracked since we last spoke, and let me see how your companion carries itself." },
        { id = "h_trainbeast", tags = { "news" }, when = { class = "HUNTER", questActive = TODO_QUEST("Training the Beast") }, text = "Yaw Sharpmane sent you up from Bloodhoof, I see. Come stand by the targets, and I'll teach you to train the companion you've chosen." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, up on Hunter Rise? You're far from the healers' fires, friend, but sit if you like, for my students come back bloodied often enough." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. In my grandfather's day nobody walked among us to tell the hunters how many plainstriders were too many, and some of my students still miss those days." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Walk slowly on Hunter Rise, stranger. My students' beasts are bristling already, and I'd like to know why." },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "You keep a demon where a hunter keeps a companion, and I know the difference when I smell it. Be quick, stranger." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "You've never once loosed that thing on Hunter Rise, and I've noticed. Ask what you came to ask." },
        { id = "h_narache", when = { origin = "tauren_narache_hunter" }, text = "Narache blood, by the way you came up the ramp, slow and watching the ground for tracks. Your mother tracked the mesa for the Hawkwind's camp, I think, and the old hunters still argue over whether she or a Thunderhorn took the most plainstriders in a season." },
      },
      choices = {
        { text = "Ormak says he counts orcs, not zhevra.", next = "garra_end",
          when = { class = "HUNTER", thread = { id = "hun_horde", beat = "b2_sergra", state = "unfolding" },
                   any = { { thread = { id = "hun_horde", beat = "b3_ormak" } }, { thread = { id = "hun_horde", beat = "b3_holt" } } } } },
        { text = "Do your hunters ever need a priest's mending, Holt?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Are there other Thunderhorns besides you?", next = "kin" },
        { text = "What does the Earth Mother ask of hunters?", next = "mother" },
        { text = "I've heard a shaman's wind can steady an arrow.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A hunter and a rogue both learn patience, Holt.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Magic could make an arrow fly truer.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What would a Thunderhorn teach a warrior, Holt?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What makes a Thunderhorn hunter, Holt?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Tell me of the hunter's road from Hunter Rise.", next = "t_road", when = { class = "HUNTER" } },
        { text = "I'd guess the druids tell your hunters how to hunt.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Why do the beasts bristle at me, Holt?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would a Thunderhorn hunt beside a paladin, Holt?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good hunting.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? A hunter's patience includes listening, as the plains listen for rain." } },
    },
    t_road = {
      hub = true,
      narr = "He nocks an arrow without looking at it and lets it fly at the far target, then turns back to you as if nothing had happened.",
      lines = {
        { id = "tr_default", text = "The hunter's road leaves this rise in every direction, and every Thunderhorn has walked some part of it. I will tell you the shape of it, though the plains will tell you the rest in their own time." },
        { id = "tr_young", when = { maxLevel = 14 }, text = "Your road is young, and your companion younger. Ask me what you will, and I will answer as my father answered me, slowly and twice if needed." },
        { id = "tr_far", when = { minLevel = 40 }, text = "You've come far since Mulgore, and the dust on you is from lands I've only heard of. Ask anyway, for even a Thunderhorn learns something from the questions." },
      },
      again = {
        { id = "tr_again", text = "What else? The wind's still steady, so we've time." },
        { id = "tr_again2", text = "Ask on. A question costs nothing, and a wasted arrow costs a supper." },
      },
      choices = {
        { text = "Yaw sent me to learn to train my companion.", next = "t_train", when = { minLevel = 10 } },
        { text = "Bow, beast or blade? Which path should I take?", next = "t_paths", when = { minLevel = 10 } },
        { text = "Why must I carry so many arrows?", next = "t_ammo" },
        { text = "Where do the great hunts lead after the Barrens?", next = "t_hunts", when = { minLevel = 25 } },
        { text = "What waits at the very end of the road?", next = "t_end", when = { minLevel = 50 } },
        { text = "Does Cairne still hunt, Holt?", next = "t_cairne", when = { race = "Tauren" } },
        { text = "The orcs ride wolves to war. Do you approve?", next = "t_orc", when = { race = "Orc" } },
        { text = "Enough of the road, Holt.", next = "BACK" },
      },
    },
    t_train = {
      lines = {
        { id = "tt_default", text = "Then stand by me and watch your companion, not me. Every beast you bind leaves a lesson behind in the one you keep, and I will teach you how to draw that lesson out, so that your companion grows with every beast you meet on the plains." },
        { id = "tt_active", when = { questActive = TODO_QUEST("Training the Beast") }, text = "Yaw's word came up the lift before you did, and he says you were gentle with the plainstriders. Good. Stand here, and I'll teach you to train what you tame, and then you'll be a hunter of the Bluff in truth." },
        { id = "tt_done", when = { questDone = TODO_QUEST("Training the Beast") }, text = "You've learned it already, from me, so I'll only remind you: tame widely, keep one, and bring your companion to Hesuwa when it's ready to learn what the wild can't teach." },
      },
      choices = { { text = "Back to the road.", next = "t_road" } },
    },
    t_paths = {
      lines = { { id = "tp_default", text = "Some hunters give themselves to the beast and grow fierce together, some to the bow and learn the aimed shot that goes through a kodo's hide, and some to the wild itself, to traps and blades and surviving where others die. The Thunderhorns are archers, so you can guess which I'd tell you." } },
      choices = {
        { text = "The bow, then, as the Thunderhorns do.", next = "t_road", reply = "Then come to the targets at dawn, and I'll show you how my grandfather held his breath. The family will be pleased.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll find my own path, whatever my teachers did.", next = "t_road", reply = "So did Kary, who chose the trail over the bow, and she's never once let me forget she was right. Find it, then.", fx = { align = { order = -1 } } },
        { text = "Back to the road.", next = "t_road" },
      },
    },
    t_ammo = {
      lines = { { id = "ta_default", text = "Because an arrow that's loosed is an arrow you must make or buy again, and the hunter who runs out on the plains is a hunter with a stick. Carry a full quiver, or a pouch of shot if you favor the dwarves' rifles, and a little more than you think, because the Barrens never end when you expect." } },
      choices = {
        { text = "A rifle is loud. Does the Earth Mother mind?", next = "t_rifle" },
        { text = "Back to the road.", next = "t_road" },
      },
    },
    t_rifle = {
      lines = { { id = "tri_default", text = "She has never said so to me, though the plainstriders certainly mind. My cousin Mull swears by a goblin rifle and I swear by a bow, and we have argued about it at every feast for twenty years, which I think is what the Earth Mother intended." } },
      choices = { { text = "I'll stay out of that argument. Back to the road.", next = "t_road", fx = { trait = { witty = 1 } } } },
    },
    t_hunts = {
      lines = { { id = "th_default", text = "Melor Stonehoof sets the great hunts, and he'll send you far: to the Needles after the hyena Steelsnap, to the swamps of Dustwallow, and up into the cold of Alterac for the yeti Frostmaw. Before that you'll learn at thirty to fall as if dead, and at forty to wear mail, and both will keep you alive on his hunts." } },
      choices = {
        { text = "Why send hunters so far from Mulgore?", next = "t_hunts2" },
        { text = "Back to the road.", next = "t_road" },
      },
    },
    t_hunts2 = {
      big = true,
      lines = { { id = "th2_default", text = "Because a hunter who knows only his own plains thinks the whole world is grass. Melor wants you to learn that the Earth Mother's children are many and strange, and that some of them have gone wrong and must be given back to her." } },
      choices = {
        { text = "Then I'll hunt only the beasts that have gone wrong.", next = "t_road", reply = "That's Melor's teaching exactly, and he'll be glad to hear it. Tell him I said so.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A great hunt is for glory. Let the songs follow.", next = "t_road", reply = "Songs follow the dead more often than the living, hunter. Go for the land, and let glory find you if it wants.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "t_road" },
      },
    },
    t_end = {
      lines = {
        { id = "te_default", text = "Armor, for one thing: the Beaststalker's, scattered in pieces through Stratholme and Scholomance and Blackrock Spire, and every hunter who wears it earned each piece. And a bow I've only heard about in whispers, Rhok'delar, which an ancient in Felwood makes for hunters who face its trials alone." },
        { id = "te_sixty", when = { minLevel = 60 }, text = "You know what waits, I think: the Beaststalker's armor in the dead cities and the Spire, and the whispers of Rhok'delar, the bow an ancient in Felwood grants to hunters who face four demons alone. If you find it, bring it up the lift so I can see it once before I die." },
      },
      choices = {
        { text = "I'll bring it up the lift for you, Holt.", next = "t_road", fx = { affinity = 1 } },
        { text = "Back to the road.", next = "t_road" },
      },
    },
    t_cairne = {
      lines = { { id = "tc_default", text = "Not as often as he'd like, for a chieftain's days are full of the other tribes and their quarrels. But when he does, he takes no bow, only his spear and a few braves, and he walks the plains for days, and the hunters of the Bluff all find excuses to be out on the same trail." } },
      choices = {
        { text = "I'd give anything to walk one of his hunts.", next = "t_cairne2" },
        { text = "Back to the road.", next = "t_road" },
      },
    },
    t_cairne2 = {
      big = true,
      lines = { { id = "tc2_default", text = "Many would, and he knows it, so he walks slowly and lets the young keep up. The Grimtotem say a chieftain should hunt alone to show his strength, and Cairne says a chieftain who hunts alone has forgotten whom he hunts for." } },
      choices = {
        { text = "Cairne is right. The hunt belongs to the herd.", next = "t_road", reply = "It does, and he's never once let us forget it. The Thunderhorns would follow him off the edge of the bluff.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A chieftain alone shows a strength the tribes respect.", next = "t_road", reply = "The Grimtotem would agree with you, and that alone would make me think twice. Watch who you agree with on this rise.", fx = { align = { order = -1 } } },
        { text = "Back to the road.", next = "t_road" },
      },
    },
    t_orc = {
      lines = { { id = "to_default", text = "I approve of any hunter who loves his beast, and the orcs I've met love their wolves more than their own kin. What I don't approve of is a beast sent to die for something it can't understand, but then, I've never had to fight for my people's freedom, so I try not to judge." } },
      choices = {
        { text = "Our wolves understand freedom better than you'd think.", next = "t_road", fx = { affinity = 1 } },
        { text = "Fair enough. Back to the road.", next = "t_road" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Plenty, and my cousin Mull is one, though he prefers Bloodhoof Village to the bluffs. He keeps an eye on the young braves there, and I keep an eye on him." } },
      choices = { { text = "Does he need watching?", next = "kin_watch" } },
    },
    kin_watch = {
      lines = { { id = "kw_default", text = "Every Thunderhorn does, because we all think the next hunt will be the greatest. Mull simply says it louder than the rest of us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mother = {
      lines = { { id = "m_default", text = "That we take only what the herd can spare, and that we waste nothing of what we take. A hunter who forgets this soon finds the plains empty." } },
      choices = {
        { text = "The herd comes before the hunter.", next = "BACK", reply = "Spoken like one raised on the plains, whoever raised you. Hold to that, and the herd will be there long after you and I are gone.", fx = { align = { order = 1 } } },
        { text = "A hunter must feed his family first.", next = "BACK", reply = "He must, and no Thunderhorn would let a child go hungry. But a family fed today from an empty plain goes hungry tomorrow, and the herd remembers.", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My grandfather swore a shaman did it for him once, on a hunt near the Red Rocks, and he never missed again the rest of that day. I think the spirits helped and I think his own patience helped more, and I've never decided which to thank first." } },
      choices = {
        { text = "Thank the spirits first. They gave him the day.", next = "BACK", reply = "Then you're my grandfather's kind of hunter, and he'd have liked you. The spirits gave him the day, and he gave them thanks before he ate.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thank his own eye. The spirits get too much credit.", next = "BACK", reply = "You sound like me on a cold morning after a bad hunt. Still, I'd say thank them both, because it costs nothing and the spirits keep score.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I have not heard of that. The plains keep many secrets, and the Earth Mother shares them slowly." } },
    centaur = { { id = "tp_centaur", text = "The centaur ride well, but they shoot poorly, and an archer can drop them before they close. My family has done it for generations." } },
    quilboar = { { id = "tp_quilboar", text = "The quilboar are poor archers too, and they make easy targets. Aim for the eyes, and the quilboar will not trouble you." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made the bow from the trees, and the arrow from the reeds. A hunter who forgets that has forgotten how to hunt." } },
    cairne = { { id = "tp_cairne", text = "Cairne carries a spear, not a bow, but he is the finest hunter of us all. My family has never told him so, out of pride." } },
  },
}

P:NPC {
  key = "ker", id = TODO_NPC("Ker Ragetotem"), name = "Ker Ragetotem",
  bible = "bibles/thunderbluff.md", role = "trainer", tier = "service",
  communities = { "thunder_bluff" }, temper = { "firm" }, values = { "brave", "honorable" },
  notices = { "class" },
  impression = {
    first = "She reminds every student that strength is for protecting the herd.",
    third = "{name} met Ker Ragetotem, the warrior trainer in Thunder Bluff.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Stand firm, friend. You always do. Come, let's train." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Stand firm, young one. The bluffs are high, and you could fall." },
    { id = "g_hi", text = "Stand firm, young one. The bluffs are high, and the wind is not kind to the unsteady." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, young one, and I hope you kept your stance while you were gone. Show me." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown strong since you first stood in my ring, and you hold yourself steadier on the bluffs now. Remember that strength is for protecting the herd." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "I hear you made someone in the city back down. Strength that frightens our own people protects no one, so be careful with it." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Anything that can protect the herd can hurt it. The orcs remember the Light from the camps, where it guarded their cages. Use it to guard the herd, not to cage anyone, and you'll be welcome among my warriors." } },
      choices = {
        { text = "I'll guard the herd with it, Ker.", next = "BACK", reply = "Then you'll have a place at my fire, and the warriors will learn to trust it. Stand behind the second rank when we drill, and let them see the Light on you when they're tired.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll use it however the fight requires.", next = "BACK", reply = "The fight always requires more than you think, and that is how the camps were built. Watch yourself, paladin, because the orcs are watching too.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Behind it, I would say, close enough to reach the wounded and far enough back that the first charge doesn't fall on you. A warrior who knows a healer stands at his back will hold a little longer, and a little longer is often the whole battle." } },
      choices = {
        { text = "I'll stand behind them and keep them standing.", next = "BACK", reply = "Then my warriors will hold longer, and so will the herd. Stand at the back of the ring tomorrow and watch where they fall, because that's where you'll be needed.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I fight where I choose, not where warriors need me.", next = "BACK", reply = "You may choose, and the battle will choose its dead from those who stood alone. I'd rather you chose to stand where you're needed.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Carefully, as I tell every tauren who comes to me, because a tauren swing can break a centaur's back or a friend's shield. The braves who guard Thunder Bluff learn to measure every blow, so that the strength the Earth Mother gave them is only ever used to protect." } },
      choices = {
        { text = "I'll measure every blow, Ker.", next = "BACK", reply = "Good, you have the patience Cairne asks of us. Measure your blows, and you'll never strike a friend you meant to save.", fx = { align = { order = 1 } } },
        { text = "A blow held back is a blow wasted.", next = "BACK", reply = "Not wasted, only saved for when it's needed, and that is all of a warrior's art. Strike everything at full strength and you'll tire before the centaur do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not as often as they should, though I'd change that if the hunters would come down from their rise. A warrior who knows where the arrows will fall can hold the line longer, and a hunter who knows where the line will hold can shoot more freely." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not as often as they should, though I'd change that if the hunters would come down from their rise. {pet} would make a fine sparring partner for my braves, if you trust me with it." },
      },
      choices = {
        { text = "I'll train beside the warriors, Ker.", next = "BACK", reply = "Then come down off your rise, hunter, and we'll make room for you on the line. My warriors could use someone who knows where to aim.", fx = { align = { order = 1 } } },
        { text = "Warriors can learn my ways, not I theirs.", next = "BACK", reply = "That pride is very like a hunter's, and very like a warrior's too. Still, a line where no one learns from anyone breaks in the first charge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They count, and I'd be a fool to say otherwise, but my warriors are too big to be silent and too proud to be quick. So we stand in front where the enemy can see us, and you can do whatever it is you do behind them." },
      },
      choices = {
        { text = "Standing in front takes courage. I respect that.", next = "BACK", reply = "It does, and my warriors will be glad to hear it from someone who fights from behind. Do your work in the shadows, and we'll keep the enemy looking at us.", fx = { align = { honor = 1 } } },
        { text = "The enemy you can't see is the one who wins.", next = "BACK", reply = "Maybe so, and I'll not pretend I've never been glad of a knife in the dark. But the herd needs someone it can see standing between it and the storm.", fx = { align = { honor = -1 } } },
        { text = "Why must strength be careful?", next = "careful" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They're trained to fight whatever threatens the herd, and anything off its leash would qualify. I'll not hide that some of my warriors smell the sulphur on you and think of the Burning Blade, so be glad the Warchief speaks for your kind." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "They're trained to fight whatever threatens the herd, and three of them have already shifted their feet toward your demon. I'll not hide that my warriors look at that thing and think of the Burning Blade, so keep it close, warlock, and be glad the Warchief speaks for you." },
      },
      choices = {
        { text = "I'm grateful for his word. What I keep stays leashed.", next = "BACK", reply = "Good, then we'll have no trouble between us, and my warriors will learn to stop staring. The Warchief's word is a strong shield, but your own conduct is a stronger one.", fx = { align = { order = 1 } } },
        { text = "I don't need the Warchief's word to defend myself.", next = "BACK", reply = "You'll need something, if that thing slips its leash on Hunter Rise. My warriors will defend the herd first, and ask about your words afterward.", fx = { align = { order = -1 } } },
        { text = "Who do the warriors fight?", next = "fight" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The Grimtotem do, and they have none of their own, because they hold to the old shamans and sneer at what Hamuul learned from the night elves. They'd say a tauren who borrows a stranger's teachings has forgotten the herd, and I'd say a tauren who turns his spear on his own kin has forgotten more." } },
      choices = {
        { text = "Our own old ways should come first, before borrowed ones.", next = "BACK", reply = "The Grimtotem would cheer to hear you say it, and that alone gives me pause. Our old ways are good, but they were never meant to be a wall.", fx = { align = { order = 1 } } },
        { text = "Learning from the night elves made us stronger, not weaker.", next = "BACK", reply = "It did, and Hamuul brought back more than the night elves ever knew they were giving. Half the druids on Elder Rise learned their first forms from him.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "By standing behind the warriors and burning whatever tries to get past them, which is all a warrior ever asks. The centaur raid the edges of Mulgore and they've learned to fear fire, so use it on them and not on the grass." },
      },
      choices = {
        { text = "I'll protect the herd, Ker.", next = "BACK", reply = "Then you'll find a place behind my line, and the braves will be glad of it. Only mind their manes; the last mage I drilled singed three of them.", fx = { align = { honor = 1 } } },
        { text = "I'll protect myself first. The herd can follow.", next = "BACK", reply = "The herd doesn't follow a mage who runs, it scatters. Protect yourself, then, but don't be surprised when no one's left to protect you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. A tauren's strength is great, and so is the Light, I'm told. Both must be used carefully." },
        { id = "h_default", key = true, text = "I am Ker Ragetotem, and I train the warriors who guard Thunder Bluff. A tauren's strength is great, so we must learn to use it carefully." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Come for more training, warrior? Good, because the centaur do not rest, and neither should we." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, then. Your strength comes from outside you, so you must learn to carry it even more carefully than a warrior does." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior comes back to Ragetotem's ring. Good, because strength without care only breaks things, and I've more care to teach." },
        { id = "h_taurwar", when = { race = "Tauren", class = "WARRIOR" }, text = "A tauren warrior of the bluffs, and the herd is safer for every one of you. Stand in my ring, young one, and we'll see whether your strength has learned to listen yet." },
        { id = "h_deadwar", when = { race = "Scourge", class = "WARRIOR" }, text = "A Forsaken warrior on Hunter Rise. I'll not pretend I trust your people, but the Warchief calls you Horde, so I'll train you as I would any guardian of the herd." },
        { id = "h_orcwar", when = { race = "Orc", class = "WARRIOR" }, text = "An orc in Ragetotem's ring. Your people saved ours in the Barrens, so whatever you need from me, you'll have it, and harder than I give it to my own." },
        { id = "h_w40", when = { class = "WARRIOR", minLevel = 40, maxLevel = 59 }, text = "You've taken to plate, I see, and you stand in it as if the bluffs had grown a new ridge. Carry it carefully, because plate makes a warrior bold, and boldness without care is what I warn every student against." },
        { id = "h_w60", when = { class = "WARRIOR", minLevel = 60 }, text = "There's nothing left that I can teach you with an axe, warrior. I hope you'll stand in my ring sometimes anyway, so the young ones can see what all this care comes to." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter in the warriors' ring. Come in, then, because the braves of the bluffs could use a lesson in patience from you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, for my students learn to take a blow before they learn to give one, and someone must patch them up afterward." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll stand as a bear before the herd one day, so you're closer to my warriors than you know, and I'll expect the same restraint of you that I expect of them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. Strength is for protecting the herd, and magic is strength too, of a sort, so I'll expect you to use it that way." },
        { id = "h_grim", when = { origin = "tauren_grimtotem_born" }, text = "You were born Grimtotem, and the whole city knows it, so I'll say plainly that you're welcome in my ring. Your old kin will come for you one day because you left, and I mean you to be standing when they do." },
        { id = "h_walk", when = { origin = "tauren_long_migration" }, text = "You walked out of the Barrens with the rest of us, young one, and you'll remember the centaur better than my students do. Stand firm, then, because you know already what it costs when the herd breaks." },
      },
      choices = {
        { text = "Should a priest stand in the line beside your warriors, Ker?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Who do the warriors fight?", next = "fight" },
        { text = "Why must strength be careful?", next = "careful" },
        { text = "A shaman can't need a warrior's training, Ker.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Strength isn't everything. Speed and silence count too.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "How should a warrior use great strength, Ker?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Train me, Ker.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Where does a warrior of the bluffs go next?", next = "w_road", when = { class = "WARRIOR" } },
        { text = "Do warriors and hunters train together here, Ker?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Are your warriors trained to fight things from beyond this world?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do any tauren still scorn the druid's path, Ker?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "How can a mage protect the herd, Ker?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Must the Light be used carefully, Ker?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Ask what you will. A warrior should understand before he swings, as the bull knows the ground before he charges." },
        { id = "h_again2", text = "Something else, young one? The ring will wait for us." },
      },
    },
    w_road = {
      hub = true,
      lines = {
        { id = "wr_default", text = "Every warrior who leaves this ring walks the same road, though each walks it differently. Tell me where you stand on it, and I'll tell you what waits ahead." },
        { id = "wr_low", when = { maxLevel = 9 }, text = "You're young yet, and your road runs no farther than Mulgore's grass. Learn to charge and to make a wound bleed, and at ten I'll send you east to the Barrens." },
      },
      again = { { id = "wr_again", text = "What else about the road? I've walked most of it myself." } },
      choices = {
        { text = "The shield. Who teaches it?", next = "w_shield", when = { minLevel = 10 } },
        { text = "What waits for a warrior at thirty?", next = "w_thirty", when = { minLevel = 28 } },
        { text = "I wear plate now. Any advice?", next = "w_plate", when = { minLevel = 40 } },
        { text = "I've reached the end of your teaching. What now?", next = "w_sixty", when = { minLevel = 60 } },
        { text = "That's enough of the road, Ker.", next = "BACK" },
      },
    },
    w_shield = {
      lines = {
        { id = "wsh_default", text = "An orc named Uzzek, near Far Watch in the Barrens, and after him my kinsman Ruga at Camp Taurajo, who'll test you against the strange insects in the Field of Giants. Between them you'll learn to stand in front of the herd and stay there." },
        { id = "wsh_done", when = { questDone = TODO_QUEST("Trial at the Field of Giants") }, text = "You've stood before Uzzek and Ruga both, so you know already. Now taunt whatever threatens the herd, sunder its hide, and never let it turn toward the healer behind you." },
      },
      choices = {
        { text = "Guarding the herd is the whole of it.", next = "w_road", reply = "It is, and Cairne would say the same. You'll do.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd rather be the one who ends the fight.", next = "w_road", reply = "Someone must end it, and someone must survive it. Learn both, and choose later.", fx = { align = { light = -1 } } },
        { text = "Back to the road.", next = "w_road" },
      },
    },
    w_thirty = {
      lines = {
        { id = "wt_default", text = "Fray Island, off the coast south of Ratchet, where a human named Klannoc Macleod tests warriors for the berserker's stance. If you win there, he'll send you north to a troll in the Alterac hills who makes weapons from a storm." },
        { id = "wt_done", when = { questDone = TODO_QUEST("Whirlwind Weapon") }, text = "You've been to Fray Island and to the troll's river both, and I can see the storm-weapon on your back. Use it carefully, because a weapon with a wind lord in it does not always care whom it strikes." },
      },
      choices = {
        { text = "Why would a tauren want a berserker's rage?", next = "w_thirty2" },
        { text = "Back to the road.", next = "w_road" },
      },
    },
    w_thirty2 = {
      lines = { { id = "wt2_default", text = "Most don't, and I've never loved it, because it asks you to forget the care I spend years teaching. But some fights are only won by forgetting, and a warrior who never learns the berserker's stance cannot choose when to put it down." } },
      choices = { { text = "Back to the road.", next = "w_road" } },
    },
    w_plate = {
      lines = { { id = "wp_default", text = "Wear it every day for a month before you fight in it, so your body forgets it's there. A tauren in plate is very nearly a mountain, and mountains are slow, so practise turning with it until the turn is quick again." } },
      choices = { { text = "Back to the road.", next = "w_road" } },
    },
    w_sixty = {
      lines = { { id = "ws_default", text = "Now you go where the true dangers are, into the Spire of Blackrock and the poisoned lands of the east, and you come home to guard the bluffs between. And when you're tired of that, you come back here and teach, because that's what the Ragetotem have always done." } },
      choices = {
        { text = "I'll come back and teach the young ones.", next = "w_road", reply = "Then the herd will be safe long after both of us are gone.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I've earned the right to wander. I'll go where I please.", next = "w_road", reply = "You have earned it, and I won't argue. Come home now and then, at least.", fx = { align = { order = -1 } } },
        { text = "Back to the road.", next = "w_road" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "The centaur have hunted our people for generations, and only with the orcs' help did we finally drive them from Mulgore. Now the quilboar and the Venture Company test our borders instead." } },
      choices = { { text = "The centaur may return someday.", next = "fight_return" } },
    },
    fight_return = {
      lines = { { id = "fr_default", text = "They are in the Barrens still, and in Desolace, and they remember us as well as we remember them. One day they will try, and on that day I want my students ready." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    careful = {
      lines = { { id = "c_default", text = "Because a tauren who loses his temper can kill a friend as easily as a foe. Cairne taught us that strength without restraint is only another kind of beast." } },
      choices = {
        { text = "Restraint is a warrior's real strength.", next = "BACK", reply = "It is, and I wish more of the young bulls understood it before their first real fight. You'll make a fine warrior, if you keep hold of that.", fx = { align = { honor = 1 } } },
        { text = "Some foes deserve no restraint at all.", next = "BACK", reply = "Some, perhaps, and you'll know them when you meet them. But the ones who say so first are usually the ones who lose control of the fight.", fx = { align = { honor = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every shaman who guards the herd stands close enough to be struck, so yes, learn to take a blow. The Grimtotem out in Stonetalon have shamans of their own, and they won't hesitate to turn the earth on our braves." } },
      choices = {
        { text = "I'll learn to stand and take a blow for the herd.", next = "BACK", reply = "Then you'll stand with my warriors, and they'll be glad of you. An earth shaman who doesn't flinch is a rare and welcome thing.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A wise shaman shouldn't be close enough to be hit.", next = "BACK", reply = "Wise, perhaps, until the Grimtotem come over the hill and there's nowhere else to stand. Learn to take a blow anyway, shaman, and pray you never need it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I am a warrior, not an elder. Ask on Elder Rise, and walk with the Earth Mother." } },
    cairne = { { id = "tp_cairne", text = "Cairne is the greatest warrior of our people, and he taught us that strength is for protecting the herd. I teach my students the same." } },
    centaur = { { id = "tp_centaur", text = "The centaur have tested the tauren for generations, and we have always stood. My students learn to stand first, and to fight second." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a strong orc, and a wise one. He came to our aid when we needed it, and the tauren will not forget it." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are strange allies, and I do not trust them. But the Warchief says they are Horde, and so I will protect them as I would any of the herd." } },
  },
}
