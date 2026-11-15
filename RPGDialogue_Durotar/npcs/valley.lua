-- The Valley of Trials: where young orcs (and trolls) become the Horde. Voice: bibles/durotar.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kaltunk", id = TODO_NPC("Kaltunk"), name = "Kaltunk",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "gruff" }, values = { "dutiful" },
  notices = { "greenness" },
  impression = {
    first = "Kaltunk greets every recruit who walks into the Valley of Trials, because someone once greeted him and he remembers who. He is gruff about it, but he has not forgotten what it was to arrive with nothing.",
    third = "{name} met Kaltunk, the gruff orc who greets new blood at the mouth of the Valley of Trials.",
  },

  greetings = {
    { id = "g_road", text = "Fresh off the road, are you? Good. The Horde has room for you, if you earn it." },
    { id = "g_back", when = { metBefore = true }, text = "Still in the valley? Then you've still got work to do, so go on." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 3 },
      text = "You've never swung a weapon at something that swings back, have you? You will, and probably today." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kaltunk, and every recruit who walks into this valley starts with me. I send you to Gornek in the Den, and he sends you to work." },
        { id = "h_place", tags = { "news" }, when = { questActive = TODO_QUEST("Your Place In The World") },
          text = "Gornek's in the Den, the cave just ahead. Tell him Kaltunk sent you, and stand up straight when you do." },
        { id = "h_dust", when = { metBefore = true }, text = "I came off a ship with nothing but my axe and Durotar's dust in my teeth, and that was enough. It's enough for you too." },
      },
      choices = {
        { text = "How did you come to Durotar?", next = "came" },
        { text = "What happens in the valley?", next = "valley" },
        { text = "Do the Darkspear get the same welcome as orcs?", next = "troll", when = { race = "Troll" } },
        { text = "I was born in the camps too.", next = "campborn", when = { origin = "orc_camp_born" } },
        { text = "I'm on my way.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? Ask it quickly; there's more new blood coming up the road behind you." },
        { id = "h_again2", text = "Go on, then. Gornek can wait a moment, though don't tell him I said so." },
      },
    },
    troll = {
      lines = {
        { id = "tr_default", text = "The same welcome, and the same boars, and the same Gornek shouting at you. Your people bled beside us on the crossing, troll, and nobody in this valley gets to forget it." },
        { id = "tr_sailed", when = { origin = "troll_sailed_with_thrall" },
          text = "You were on the ships with us? Then you've earned your welcome twice over, and if any orc in the Den says otherwise, send him to me." },
      },
      choices = {
        { text = "Then the Darkspear will earn it again.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Welcomes are words. I'll trust the orcs who fight beside me.", next = "BACK", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
        { text = "Did you know any Darkspear on the crossing?", next = "troll_crossing" },
      },
    },
    troll_crossing = {
      lines = { { id = "tc_default", text = "One, a tall fellow who could gut a fish faster than I could draw breath. He's at Sen'jin now, I think. Ask Master Gadrin; he knows every troll who came ashore." } },
      choices = { { text = "I'll ask him.", next = "BACK" } },
    },
    campborn = {
      lines = { { id = "cb_default", text = "Then you know the smell of those pens, and you know why I stand at this gate. Nobody greeted us when the humans opened the doors, and I swore that every orc who came after would get a name and a road." } },
      choices = { { text = "Thank you, Kaltunk.", next = "BACK", fx = { affinity = 3 } } },
    },
    valley = {
      lines = { { id = "v_default", text = "Boars, scorpids and cultists in the northern caves. You'll fight all three, and you'll come out the other end Horde, or you won't." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    came = {
      lines = {
        { id = "c_camps", text = "Out of the camps, like most of us, and then across the sea to this red land with the Warchief. I've been greeting new blood ever since, because somebody greeted me once, and I remember who." },
      },
      choices = { { text = "I'll remember you, then.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Gornek; I just point the way." } },
  },
}

P:NPC {
  key = "gornek", id = TODO_NPC("Gornek"), name = "Gornek",
  bible = "bibles/durotar.md", role = "soldier", tier = "major",
  communities = { "valley_of_trials" }, temper = { "hard" }, values = { "stern", "dutiful" },
  notices = { "greenness", "class" },
  impression = {
    first = "Gornek runs the Den and claims he is never asleep when the recruits whisper. The first lesson, to him, is getting back up, and he looks at newcomers as though deciding whether they will learn it.",
    third = "{name} met Gornek, the hard orc who runs the Den in the Valley of Trials and makes Horde out of whoever walks in.",
  },

  greetings = {
    { id = "g_den", text = "Stand up straight, recruit. The valley is watching you, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You're back on your feet, and that's the first lesson. Most never learn it." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "Soft hands, I see. That'll change, along with everything else soft about you, here." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock, in my Den. The Burning Blade wear your colors in the caves north of here. Prove you aren't one of them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Gornek, and I run the Den. The Valley of Trials makes Horde out of whatever walks in, though some days that takes longer than others." },
        { id = "h_weapons", tags = { "news" }, when = { questActive = TODO_QUEST("Wayward Weapons") },
          text = "Recruits keep dropping their training weapons out among the boars. Kzan needs every one. Go and pick up after your betters." },
        { id = "h_sarkoth", when = { questActive = TODO_QUEST("Sarkoth") },
          text = "Sarkoth has been killing in the north for too long. If you've seen his work, you've seen why it ends with you." },
        { id = "h_parchment", when = { any = { { questActive = TODO_QUEST("Glyphic Parchment") }, { questActive = TODO_QUEST("Tainted Tablet") } } },
          text = "Your trainer left word for you. Read it, then go and find them. The Horde has a place for what you can do." },
      },
      choices = {
        { text = "What do I need to prove?", next = "prove" },
        { text = "Teach me to fight, then. That's what I came for.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'm no cultist, Gornek. My power answers to me.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "An orc with a spellbook. Say what you're thinking.", next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = "My people hunted the jungles long before this valley.", next = "headhunter", when = { race = "Troll", class = "HUNTER" } },
        { text = "I'll get to work.", next = "END", fx = { affinity = 1, standing = { valley_of_trials = 1 } } },
      },
      again = {
        { id = "h_again", text = "Something else, recruit? Make it quick, because the boars aren't going to wait for you." },
        { id = "h_again2", text = "Speak. I'd rather hear it now than find out later you were too proud to ask." },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "Then you'll hear it from me before anyone else. A warrior who swings first and thinks second dies in his first real fight, so you'll learn to take a blow on the shield before I let you near anything that bleeds." },
        { id = "wa_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "Razor Hill already has its eye on you, I hear. Good, but Gar'Thok won't want a grunt who falls over, so we start with standing up again." },
      },
      choices = {
        { text = "Why the shield before the blade?", next = "warrior_why" },
        { text = "A good warrior ends the fight before it starts.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll take the hits and stay standing.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
      },
    },
    warrior_why = {
      lines = { { id = "ww_default", text = "Because the first lesson is getting back up. In the camps the guards beat us until we stopped getting up, and the Warchief was the first one I saw who never stopped. Every warrior I train learns that before they learn anything else." } },
      choices = { { text = "Then I'll learn it first.", next = "BACK", fx = { affinity = 2 } } },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "So every cultist in that coven told himself, right up until his power started answering to something else. I watched orcs drink that fire once, and I'm still burying the ones it ruined." },
        { id = "wl_troll", when = { race = "Troll" },
          text = "A troll who whispers to demons, and that's new to me. The Darkspear had their witch doctors, but I never heard of one calling up imps, and I'd like to know who taught you." },
      },
      choices = {
        { text = "I'll use it against the Blade and nothing else.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. The Horde should use what it has.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
        { text = "What did you see it do to them?", next = "warlock_saw" },
      },
    },
    warlock_saw = {
      lines = { { id = "ws_default", text = "Green eyes in faces I'd known all my life, and a hunger that never filled. Zureetha uses the same art you do and hates the Blade more than I do, so go and listen to her before you listen to them." } },
      choices = { { text = "I'll speak with Zureetha.", next = "BACK" } },
    },
    orcmage = {
      lines = {
        { id = "om_default", text = "I'm thinking our people already burned once for reaching after power we didn't understand. You'll get no trouble from me if you work hard, but the grunts will test you, so don't give them a reason." },
        { id = "om_primer", when = { origin = "orc_camp_primer" },
          text = "A human guard's primer, I heard, read by candle stub in the camps. Clever, and the grunts will hate that you learned it from them, so you'd better be good with it." },
      },
      choices = {
        { text = "It's a tool, like an axe. I'll prove it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them test me. I'll do things my own way.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    headhunter = {
      lines = { { id = "hh_default", text = "I've seen your people throw a spear, and I wouldn't want to be the boar. Kill clean out there and show these orc recruits how it's done, and they might stop complaining about trolls in the Den." } },
      choices = { { text = "They'll see.", next = "BACK", fx = { affinity = 2 } } },
    },
    prove = {
      big = true,
      lines = {
        { id = "p_default", text = "That you'll get back up. Strength comes later. Anyone can swing an axe; not everyone stands again after the first one hits them." },
      },
      choices = {
        { text = "I'll stand.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'd rather not get hit in the first place.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Recruits talk in the Den when they think I'm asleep, and I never am. Ask about these, and then listen." },
    },
    burning_blade = { { id = "tp_blade", text = "There are cultists in the coven to the north, calling up imps. Zureetha deals with them, and you'll help her." } },
    _none = { { id = "tp_none", text = "That's not your concern yet, recruit, so finish the valley first." } },
  },
}

P:NPC {
  key = "zureetha", id = TODO_NPC("Zureetha Fargaze"), name = "Zureetha Fargaze",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "watchful" }, values = { "sharp", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Zureetha Fargaze watches the Burning Blade's caves to the north and wants every detail of what anyone saw there. Her contempt for the cultists who want the old fire back is fierce and wholly sincere.",
    third = "{name} met Zureetha Fargaze, who watches the Burning Blade's caves in the Valley of Trials and sends recruits to thin their ranks.",
  },

  greetings = {
    { id = "g_blade", text = "The Burning Blade crawl out of their caves after dark, and I'd rather they didn't. Help me with that." },
    { id = "g_back", when = { metBefore = true }, text = "You've been north? Tell me what you saw, all of it." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. The Blade will try to tempt you; they try with every one of us. Say no, and keep saying it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Zureetha Fargaze. The Burning Blade have taken the caves to the north and they're spilling into the valley, so I watch them, and I send recruits to thin them." },
        { id = "h_familiars", when = { questActive = TODO_QUEST("Vile Familiars") },
          text = "The Blade's pet imps swarm the north end of the valley. Kill them before they set the scrub alight." },
        { id = "h_medallion", tags = { "news" }, when = { questActive = TODO_QUEST("Burning Blade Medallion") },
          text = "Their leader in the coven wears a medallion. Bring it to me. I want to see whose mark is on it." },
        { id = "h_senjin", when = { questActive = TODO_QUEST("Report to Sen'jin Village") },
          text = "Your time in the valley is done. Go south to Sen'jin and find Master Gadrin, and try not to embarrass us." },
      },
      choices = {
        { text = "Who are the Burning Blade?", next = "blade" },
        { text = "You draw on the same power the Blade do, don't you?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The spirits here feel sick near those caves.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'll go north.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, because the imps are thicker after sundown." },
        { id = "h_again2", text = "Ask, then. I'd rather you knew too much about the Blade than too little." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "The same power, yes, and that's exactly why I hate them. They've made every orc who touches the dark a suspect, and I'll spend my life proving a warlock can bind a demon without kneeling to it." },
        { id = "wl_cleft", when = { origin = "orc_cleft_initiate" },
          text = "You've been down to the Cleft of Shadow already? Then you've met the smiling ones there, and you'll know some of them miss the old fire far too much. Learn their spells, but keep your own counsel." },
        { id = "wl_troll", when = { race = "Troll", class = "WARLOCK" },
          text = "A Darkspear warlock, which the old orcs will find stranger than I do. If the voice you listen to isn't a loa, be very sure you know what it is before you answer it." },
      },
      choices = {
        { text = "A demon is a tool. I bind it, it serves.", next = "warlock_bind" },
        { text = "I'll never kneel. You have my word.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Maybe the Blade understand something the rest of us fear.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
    warlock_bind = {
      lines = { { id = "wb_default", text = "That's what the first warlocks said, back in Draenor, and they said it right up until the day they woke up serving. Bind it, yes, but never forget it's waiting for you to slip." } },
      choices = { { text = "I won't forget.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "They would be, with the Blade calling fel things up through the rock. Thrall's shamans are trying to heal this land, and the Blade are tearing holes in it, so every imp you kill is a stitch in the wound." } },
      choices = { { text = "Then I'll stitch it closed.", next = "BACK", fx = { affinity = 2 } } },
    },
    blade = {
      big = true,
      lines = {
        { id = "b_default", text = "Orcs who never let go of the old fire. The Warchief broke the demons' hold on us, and these fools want it back. I won't let them have it." },
      },
      choices = {
        { text = "Neither will I.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, learn = { "burning_blade" } } },
        { text = "The old fire made the Horde strong, whatever it cost.", next = "END", fx = { align = { light = -1 }, learn = { "burning_blade" } } },
      },
    },
  },

  topics = {
    burning_blade = { { id = "tp_blade", text = "They hide in caves because they know what we'd do to them in daylight." } },
    _none = { { id = "tp_none", text = "I don't know, but I know the Blade, so ask me about them." } },
  },
}

P:NPC {
  key = "thazzril", id = TODO_NPC("Foreman Thazz'ril"), name = "Foreman Thazz'ril",
  bible = "bibles/durotar.md", role = "worker", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "exasperated" }, values = { "practical" },
  notices = { "idle" },
  impression = {
    first = "Most of Foreman Thazz'ril's days go to keeping his peons awake, and mostly he fails. He is exasperated by their talent for napping and almost impressed by it, which makes him better company than he would guess.",
    third = "{name} met Foreman Thazz'ril, who struggles to keep the sleepy peons of the Valley of Trials gathering lumber.",
  },

  greetings = {
    { id = "g_peon", text = "You! You're not a peon, are you? Good, because I have plenty of those, and they're all asleep." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the one who can stay awake. A rare sight." },
  },

  notice = {
    { id = "n_peon", cat = "idle", when = { race = "Orc", maxLevel = 3 },
      text = "Hmm. You've got the look of someone who'd nap behind a lumber pile. Prove me wrong." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Foreman Thazz'ril. My peons are meant to be gathering lumber, but mostly they're gathering naps." },
        { id = "h_lazy", tags = { "news" }, when = { questActive = TODO_QUEST("Lazy Peons") },
          text = "Take this blackjack. Find a sleeping peon, give him a tap, and watch him remember he has a job." },
        { id = "h_pick", when = { questActive = TODO_QUEST("Thazz'ril's Pick") },
          text = "I left my pick in the coven while I was surveying, and it's enchanted, so don't let those cultists keep it." },
        { id = "h_peons", when = { metBefore = true }, text = "I found three peons asleep in the mine cart this morning, in the cart, while it was moving. I don't know how they managed it, and I'm almost impressed." },
      },
      choices = {
        { text = "Why not let them rest?", next = "rest" },
        { text = "I know a few things about blackjacks, Foreman.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Want me to shout them awake instead?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'll wake them.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask fast, before another one of them nods off." },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Do you now? Then you'll know the trick is a tap and not a crack, because a peon who can't stand up can't haul lumber either. Show them some of that light touch your sort is famous for." } },
      choices = {
        { text = "A light tap. Understood.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Where's the fun in a light tap?", next = "BACK", fx = { affinity = -1, trait = { cruel = 1 } } },
      },
    },
    warrior = {
      lines = { { id = "wr_default", text = "I've tried shouting, and they sleep through it, and I've tried a war drum, and two of them used it as a pillow. Go and try your battle shout on them if you like, but bring the blackjack anyway." } },
      choices = { { text = "Ha. I'll bring both.", next = "BACK", fx = { affinity = 1 } } },
    },
    rest = {
      lines = { { id = "r_default", text = "Rest? Orgrimmar's walls won't build themselves. Well, they will if the peons build them, and that's the problem." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't ask me; ask a peon, and wake him up first." } },
  },
}

P:NPC {
  key = "galgar", id = TODO_NPC("Galgar"), name = "Galgar",
  bible = "bibles/durotar.md", role = "worker", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "longsuffering" }, values = { "practical", "generous" },
  notices = { "hunger" },
  impression = {
    first = "Nobody thanks the cook, Galgar told me, but everybody notices when the pot is empty. He insists fried scorpid tail grows on you, and I am not yet convinced.",
    third = "{name} met Galgar, the long-suffering cook who feeds the recruits, grunts and peons of the Valley of Trials.",
  },

  greetings = {
    { id = "g_cook", text = "Hungry? Of course you are; everyone in this valley is hungry." },
    { id = "g_back", when = { metBefore = true }, text = "Here for seconds? Help me with thirds and we'll talk." },
  },

  notice = {
    { id = "n_cook", cat = "hunger", when = { profession = "Cooking" },
      text = "A cook! Then you know nobody thanks us, and everybody notices when we stop." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Galgar, and I feed the Den: recruits, grunts and peons alike. Nobody thanks the cook, but everybody notices when the pot's empty." },
        { id = "h_apples", tags = { "news" }, when = { questActive = TODO_QUEST("Galgar's Cactus Apple Surprise") },
          text = "Cactus apples, from the plants around the valley. It's an easy job. I make it easy on purpose; you'll get harder ones soon enough." },
        { id = "h_recipe", when = { metBefore = true }, text = "Scorpid tail, fried, with a pinch of cactus. Don't make that face; you'll be asking for it by next week." },
      },
      choices = {
        { text = "Where did you learn to cook?", next = "cook" },
        { text = "What's the surprise?", next = "surprise" },
        { text = "Have you got anything my pet would eat?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Do tauren even eat scorpid?", next = "tauren", when = { race = "Tauren" } },
        { text = "Thanks, Galgar.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? Talk while I stir; the pot doesn't stop for anybody." },
      },
    },
    pet = {
      lines = { { id = "pe_default", text = "{pet}, is it? Ha, I've got a whole bucket of boar scraps the recruits won't touch, and that one looks like it isn't fussy. Hunters' beasts are the only ones in this valley who've ever thanked me for a meal." } },
      choices = {
        { text = "A beast that's fed well fights well.", next = "BACK", fx = { affinity = 2 } },
        { text = "It hunts for itself. Keep the scraps.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "A tauren this far east! I hear your people eat mostly plains fowl and roots, so you'll find scorpid a bit crunchy. Give it a week, though, and you'll be asking for the tail like everyone else." } },
      choices = { { text = "I'll try one. Just one.", next = "BACK", fx = { affinity = 2 } } },
    },
    surprise = {
      lines = { { id = "s_default", text = "That it tastes good. Nobody expects that from a cactus." } },
      choices = { { text = "...", next = "BACK", fx = { affinity = 1 } } },
    },
    cook = {
      lines = {
        { id = "c_camp", text = "In the camps, where you learn to make something out of nothing or you starve. Out here we've got scorpids, and that's not nothing; that's practically a feast." },
      },
      choices = { { text = "I'll try the scorpid.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm a cook. Ask me about cactus apples." } },
  },
}

P:NPC {
  key = "kzan", id = TODO_NPC("Kzan Thornslash"), name = "Kzan Thornslash",
  bible = "bibles/durotar.md", role = "vendor", tier = "service",
  communities = { "valley_of_trials" }, temper = { "curt" }, values = { "practical" },
  notices = { "kit" },
  impression = {
    first = "Kzan Thornslash keeps the recruits armed while they keep dropping their weapons in the scrub. He is curt and charges for everything, but he knows his trade.",
    third = "{name} met Kzan Thornslash, the curt weaponsmith who keeps the recruits of the Valley of Trials armed.",
  },

  greetings = {
    { id = "g_shop", text = "Weapons or repairs, so pick one, pay, and move along." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of that. Hand it over, and no, I'm not doing it for free." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kzan Thornslash, and I keep the recruits armed while they keep dropping their weapons in the scrub. One of those jobs is harder than the other." },
        { id = "h_weapons", tags = { "news" }, when = { questActive = TODO_QUEST("Wayward Weapons") },
          text = "Gornek sent you about the training weapons? Good. Bring me six and I'll mend them for the next lot of recruits." },
        { id = "h_edge", when = { metBefore = true }, text = "You're back, and the blade's still in one piece? Good. That means you're using the edge and not the flat." },
      },
      choices = {
        { text = "What should a warrior carry out of this valley?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Do you sell anything for a rogue's hand?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll find them.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else, or are you buying?" },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Something heavy that you can keep swinging, and a shield if you've got the sense. Recruits all want a big axe, and then they drop it in the scrub because their arms gave out." } },
      choices = { { text = "Sense, then. I'll take a shield.", next = "BACK", fx = { affinity = 1 } } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Daggers, two of them, and keep them sharp, since you'll be striking where the armor isn't. I don't ask what you use them for, and I'd thank you not to tell me." } },
      choices = { { text = "Two daggers, then.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If it's not a weapon, I don't sell it." } },
  },
}
