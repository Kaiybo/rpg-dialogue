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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because a mottled boar will knock you flat if you stand wrong, and that's the first lesson every warrior needs. Gornek will put you to work, and once the boars stop knocking you over, the scorpids and the Burning Blade in the caves will teach you the rest." } },
      choices = {
        { text = "Then I'll start with boars and learn properly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Boars are beneath me. Send me to the caves now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Whatever stands still long enough to let you, honestly, though most start with a boar because a boar forgives mistakes. The scorpids are tougher but meaner, and Thotar in Razor Hill will tell you when you're ready to try either." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it's still learning too. You'll learn together, which is how all the good pairs start." },
      },
      choices = {
        { text = "I'll earn a beast's trust when the time comes.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take the strongest beast I can catch.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "It does, and Thrall himself owes his freedom partly to quiet work done in the dark. Learn your trade with Kaplak in Razor Hill when you're ready, but first do the work Gornek gives you, because every recruit starts there." },
      },
      choices = {
        { text = "I'll start with Gornek's work, like everyone else.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Quiet work is my work. Gornek's chores can wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Some do, and some remember too much of the fel to trust any magic they can't feel in the earth. Show them your fire burns the Blade and not the Horde, and you'll win them over sooner than you think." },
      },
      choices = {
        { text = "I'll show them. My fire's for the Horde.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Their trust doesn't matter. My spells work either way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Quiet, and not the good kind. We had the warlocks and their demons, and then the camps, and then nothing at all, and an orc with nothing to pray to is an orc who drinks. Thrall gave us the spirits back, and I'll not hear a word against him for it." } },
      choices = {
        { text = "The old ways are worth holding to, Kaltunk.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The past is gone. The Horde should find its own way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kaltunk, and every recruit who walks into this valley starts with me. I send you to Gornek in the Den, and he sends you to work." },
        { id = "h_place", tags = { "news" }, when = { questActive = TODO_QUEST("Your Place In The World") },
          text = "Gornek's in the Den, the cave just ahead. Tell him Kaltunk sent you, and stand up straight when you do." },
        { id = "h_dust", when = { metBefore = true }, text = "I came off a ship with nothing but my axe and Durotar's dust in my teeth, and that was enough. It's enough for you too." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, walking into the valley. When I came off the ship there wasn't an orc among us who'd talk to the spirits, and now the Warchief sends your kind to me by the dozen." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue, fresh to the Valley. Don't try your tricks on Gornek, because he catches every one, and he'll make you carry water for it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, fresh to the Valley. You'll want Un'Thuwa in Sen'jin village eventually, but every recruit starts with Gornek." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, fresh in the valley! Every one of you thinks you'll lead a warband by the end of the week, and every one of you starts with boars." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, new to the valley. You'll walk alone for now, but the day will come when a beast walks with you, and you'll wonder how you managed without it." },
      },
      choices = {
        { text = "What was it like when the orcs had no shamans?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How did you come to Durotar?", next = "came" },
        { text = "What happens in the valley?", next = "valley" },
        { text = "Do the Darkspear get the same welcome as orcs?", next = "troll", when = { race = "Troll" } },
        { text = "I was born in the camps too.", next = "campborn", when = { origin = "orc_camp_born" } },
        { text = "Does the Horde truly have a place for rogues?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the orcs here trust the arcane at all?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why do warriors start with boars, Kaltunk?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What should a new hunter tame first, Kaltunk?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Same work, different approach, because the Den doesn't care how you get it done. Kill what needs killing and bring back what I ask for, and nobody in the Valley will ask whether you did it in the open." },
      },
      choices = {
        { text = "Same work, done honestly. I'll not cut corners.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "However it gets done, it gets done. That's all.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "That you can tell the spirits' voice from your own anger. The ones who drank Mannoroth's blood thought the power was theirs, and the whole Horde paid for their pride, so I'll be watching to see that you ask before you take." } },
      choices = {
        { text = "I'll ask the spirits humbly, and never simply take.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power answers whoever is strong enough to grab it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out of my Den. The first lesson still holds for you, because the spirits won't pick you up when you fall, so learn to get up yourself." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "Rogue. Every season I get a few who think the Den's for warriors only, and every season they prove me wrong somewhere in the scrub." },
      },
      choices = {
        { text = "What should a young shaman prove to you, Gornek?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do I need to prove?", next = "prove" },
        { text = "Teach me to fight, then. That's what I came for.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'm no cultist, Gornek. My power answers to me.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "An orc with a spellbook. Say what you're thinking.", next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = "My people hunted the jungles long before this valley.", next = "headhunter", when = { race = "Troll", class = "HUNTER" } },
        { text = "Will you give a rogue the same work as a warrior?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Cultists, imps and Yarrog Baneshadow, if I'm right about who leads them, and I usually am. They chant over their fires and call imps in the dark, so go in with your blade ready, and don't let any of them finish a spell." } },
      choices = {
        { text = "I'll cut them down for the Horde's honour.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take what they've hoarded and leave the rest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Where the imps go at night, mostly, because they slip out of the caves and come back with things in their claws. A tracker could follow them up the ridges and tell me if the Burning Blade have another way in, and that would be worth more to me than a dozen dead cultists." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} quiet up on the ridge. Imps squeal at the smell of a beast, and then the whole cave knows you're there." },
      },
      choices = {
        { text = "I'll follow the imps and report back, nothing more.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Why follow them? I'll kill them where they stand.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Their numbers, and the name of whoever leads them, though I suspect it's Yarrog Baneshadow. Bring me what you learn, and don't start a fight you can't finish, because the imps in there swarm the careless." },
      },
      choices = {
        { text = "Numbers and a name. I'll report back carefully.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll finish Yarrog myself if I get the chance.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It could, because the Blade's imps burn just as well as anything else. I keep my own demons watching them too, though, so don't be surprised if I trust my own hand over yours in the end." },
      },
      choices = {
        { text = "Fair. Together, we'll keep the Valley safe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My hand will be the one that ends it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! Good, because the Burning Blade have sentries in the caves and I need someone who can get past them unseen." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, out here watching the caves with me? Your magic is a cleaner thing than the Blade's, and I'll be glad of it beside me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The Burning Blade in the caves to the north won't fall to watching, so you're exactly what I needed." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, with sharp eyes, I hope. I've watched those caves for days, and I could use someone who notices what I've missed." },
      },
      choices = {
        { text = "Who are the Burning Blade?", next = "blade" },
        { text = "You draw on the same power the Blade do, don't you?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The spirits here feel sick near those caves.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "What do you need from inside the Blade's caves?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could the arcane help you fight the Burning Blade?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What waits in the Burning Blade caves, Zureetha?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What have you missed in the caves, Zureetha?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bother them? The peons sleep through boar charges, which tells you everything. The beasts leave my workers alone because they're too dull to be worth biting, so the only thing that wakes them is me shouting, and even that's wearing off." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} could make itself useful, you know. One good snarl and half my lumber crew would be on their feet." },
      },
      choices = {
        { text = "Treat the peons kindly, Foreman, and they'll work harder.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Set my beast on them, then. That'll teach them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "No, not truly, because peons who are frightened work slower, and then they nap more to recover. Still, if you could conjure a little fresh water for them, it might help them stay awake." },
      },
      choices = {
        { text = "Water, then. No fires for the peons.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A little fire would wake them. They'd thank me later.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Far more, because every peon grew up hearing about the fel and the old curse. If you want them to work, keep your demon out of sight, and let them think about lumber instead of nightmares." },
      },
      choices = {
        { text = "Out of sight, then. I'll let them work.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fear makes them work faster than sleep does.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Probably, but you haven't seen how deep these peons sleep. I've tried shouting and I've tried the blackjack, and if the sky itself can't wake them I'll give up and let them have the lumber camp." } },
      choices = {
        { text = "Let them nap. Working peons to the bone helps no one.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll save some thunder for them. They've earned a fright.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Foreman Thazz'ril. My peons are meant to be gathering lumber, but mostly they're gathering naps." },
        { id = "h_lazy", tags = { "news" }, when = { questActive = TODO_QUEST("Lazy Peons") },
          text = "Take this blackjack. Find a sleeping peon, give him a tap, and watch him remember he has a job." },
        { id = "h_pick", when = { questActive = TODO_QUEST("Thazz'ril's Pick") },
          text = "I left my pick in the coven while I was surveying, and it's enchanted, so don't let those cultists keep it." },
        { id = "h_peons", when = { metBefore = true }, text = "I found three peons asleep in the mine cart this morning, in the cart, while it was moving. I don't know how they managed it, and I'm almost impressed." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you call a little thunder over the lumber pile? The blackjack works, but a bolt out of a clear sky would keep my peons awake for a week." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! Could you wake up my peons with a spell? A small fire, perhaps, or a cold breeze? I'm only half joking." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Warlock! Keep that imp away from my peons; they're frightened enough of me already, and I'd rather they were awake than trembling." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, eh? If your beast could wake a sleeping peon, I'd hire it on the spot." },
      },
      choices = {
        { text = "Shouldn't the spirits be called for better things than peons?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why not let them rest?", next = "rest" },
        { text = "I know a few things about blackjacks, Foreman.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Want me to shout them awake instead?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Would you really want me to frighten your peons?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the beasts here bother your peons, Foreman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the peons fear warlocks more than you?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Scorpid meat, boar ribs and whatever the recruits bring back that isn't too charred to eat. A warrior who fights on an empty belly fights badly, so every one of Gornek's grunts gets a bowl before he goes out, whether he thanks me or not." } },
      choices = {
        { text = "Thank you for the meal, Galgar. It matters.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Cooks don't win battles. I'll eat what I find.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Not a bit, because I've heard conjured bread tastes like nothing at all. Come and eat with the grunts sometime, and you'll learn more about the Horde over one bowl of stew than in a year of spells." },
      },
      choices = {
        { text = "I'll eat with the grunts. It's worth learning.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Conjured bread is fine. I'll eat alone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I feed everyone who walks into this Den, because hunger doesn't care what you are. Just keep your imp out of the kitchen, and I'll fill your bowl like anyone's." },
      },
      choices = {
        { text = "Agreed. The imp stays away from your pot.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My imp can eat where it likes, cook.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "My mother did, every night, until the camps took her pot and her fire both. I've got out of the habit, but now and then I toss a scrap of scorpid in the coals, and the fire's never once burned my stew." } },
      choices = {
        { text = "Keep feeding the fire, Galgar. The old ways were good ones.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The fire burns for whoever cooks on it, not for offerings.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Galgar, and I feed the Den: recruits, grunts and peons alike. Nobody thanks the cook, but everybody notices when the pot's empty." },
        { id = "h_apples", tags = { "news" }, when = { questActive = TODO_QUEST("Galgar's Cactus Apple Surprise") },
          text = "Cactus apples, from the plants around the valley. It's an easy job. I make it easy on purpose; you'll get harder ones soon enough." },
        { id = "h_recipe", when = { metBefore = true }, text = "Scorpid tail, fried, with a pinch of cactus. Don't make that face; you'll be asking for it by next week." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Then you know fire better than I do, so don't tell me how to cook with it, and I won't tell you how to call it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! You can conjure your own bread, I hear, so you won't be wanting my cooking. Your loss, because my scorpid tail is famous." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Warlock, keep that imp away from my pot. The last one spat in my stew, and the grunts haven't forgiven me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You'll eat twice what a hunter does and complain half as much, which makes you my favourite kind of customer." },
      },
      choices = {
        { text = "Do you ever thank the fire spirits for your cookfire?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Where did you learn to cook?", next = "cook" },
        { text = "What's the surprise?", next = "surprise" },
        { text = "Have you got anything my pet would eat?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Do tauren even eat scorpid?", next = "tauren", when = { race = "Tauren" } },
        { text = "Do you mind that mages can conjure their own food?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What do you feed the recruits, Galgar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Would you still feed a warlock, Galgar?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Arrows, a spare bowstring and something sharp for when the boar gets past your beast, which it will. The recruits drop their weapons in the scrub all day long, but hunters lose arrows faster than anyone, so buy more than you think you'll need." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} keeps sniffing my crates. There's nothing to eat in there, I promise, unless it likes leather straps." },
      },
      choices = {
        { text = "I'll gather my arrows back. Waste helps no one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Arrows are cheap. I'll shoot and move on.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "More than the recruits do, which is saying something, because mages don't think about weapons until they need them. Buy a staff, keep it close, and don't leave it in the scrub where the quilboar will chew it." },
      },
      choices = {
        { text = "A staff, kept close. I'll take your advice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Spells are my weapon. A staff is decoration.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I sell to anyone the Den trusts, and Gornek's let you in, so you'll get the same price as anybody. Just keep your demon's claws off my stock, because I've enough trouble with recruits dropping things." },
      },
      choices = {
        { text = "Fair. I'll keep the imp's claws to itself.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My imp does as it pleases, Kzan.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "More than you'd think, because a mace that's been struck by its owner's lightning comes back to me blackened and cracked at the haft. I mend them, and then I tell the shaman to stop hitting things with the sky and the hammer at the same time." } },
      choices = {
        { text = "A good weapon deserves care. I'll be gentler with mine.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Weapons break, Kzan, and that's what smiths are for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kzan Thornslash, and I keep the recruits armed while they keep dropping their weapons in the scrub. One of those jobs is harder than the other." },
        { id = "h_weapons", tags = { "news" }, when = { questActive = TODO_QUEST("Wayward Weapons") },
          text = "Gornek sent you about the training weapons? Good. Bring me six and I'll mend them for the next lot of recruits." },
        { id = "h_edge", when = { metBefore = true }, text = "You're back, and the blade's still in one piece? Good. That means you're using the edge and not the flat." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and you'll want a mace, not one of those training axes the recruits keep losing. I'll sell you one, but you'll pay full price like everyone else." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage in my shop. I'll not sell you an axe, because you'll drop it, so how about a staff?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "Warlock, your imp's eyeing my blades. Tell it I'll sell to you, not to it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Keep your arrows in the quiver and your beast out of my stock, and we'll get along fine." },
      },
      choices = {
        { text = "Do shamans bring you many weapons to mend?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What should a warrior carry out of this valley?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Do you sell anything for a rogue's hand?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Do mages really drop their weapons so often?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What does a hunter need from you, Kzan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do you sell to warlocks as freely as anyone?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I'll find them.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else, recruit, or are you here to spend some coin on a decent edge?" },
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
