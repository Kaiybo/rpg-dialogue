-- Stormwind folk who exist only in World of Warcraft: Forever: Abigail Lawson (Cathedral Square,
-- Marshal Ryan's betrothed), Gilbert Gray (a fisher on the harbor piers), Idrieth Mossgrove (the
-- kaldorei pier and the boat to Auberdine), Roy Lewells (a reader in the Park), Aendaril Brookshot
-- (a druid in the Valley of Heroes) and Fyrenz Vishonar (the transmogrifier).
-- Voices: bibles/stormwind_forever.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Abigail Lawson: waits in Cathedral Square for news of Marshal Ryan.
---------------------------------------------------------------------------
P:NPC {
  key = "abigail_lawson", id = TODO_NPC("Abigail Lawson"), name = "Abigail Lawson",
  bible = "bibles/stormwind_forever.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "proud", "loyal" },
  notices = { "soldier", "light", "kin" },
  impression = {
    first = "Abigail Lawson stands in Cathedral Square with the stiff back of someone who has been waiting a long time for bad news. She was to marry a marshal who chose an old war over her, and she has not forgiven either of them.",
    third = "{name} met Abigail Lawson, Marshal Ryan's betrothed, in Cathedral Square.",
  },

  greetings = {
    { id = "g_default", text = "If you're collecting for the orphanage, I've already given this week. If you're not, I can't think what you want with me." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You've a habit of turning up in this square, haven't you?" },
    { id = "g_active", when = { questActive = TODO_QUEST("Delivering Closure") }, text = "You've a look on your face I've seen before, on men at doorsteps. Go on, then, say it." },
    { id = "g_done", when = { questDone = TODO_QUEST("Delivering Closure") }, text = "You came back. I didn't think you would, after the way I took the news." },
  },

  notice = {
    { id = "n_horse", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" }, minLevel = 36 },
      text = "You've the look of someone who's ridden east lately. If you've been to that keep of theirs, don't tell me about it unless I ask." },
    { id = "n_priest", cat = "light", when = { class = "PRIEST" },
      text = "A priest. I pray in there every morning, and I've stopped asking for anything in particular." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Abigail Lawson. I live with my parents off the square and I come out here most days to sit by the Cathedral, because the house is too quiet and my mother asks too many questions." },
        { id = "h_waiting", when = { ["not"] = { questDone = TODO_QUEST("Delivering Closure") } },
          text = "I suppose it's only a matter of time before someone comes asking about Ryan. I've been rehearsing what I'll say when they do, and none of it is kind." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Delivering Closure") },
          text = "That's his crest in your hand, isn't it? I'd know it anywhere. Demar sent you because he hadn't the courage to come himself." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Delivering Closure"), days = 3 } },
          text = "I keep his crest under my pillow, which is foolish, and I talk to it at night, which is worse. I tell it he was an idiot, and then I cry, and then I tell it again." },
        { id = "h_done", when = { questDone = TODO_QUEST("Delivering Closure") },
          text = "My mother has stopped asking questions now, which is a mercy. I still come to the square, but now I light a candle in the Cathedral before I sit." },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere to be." },
        { id = "h_again2", text = "Ask, then. I'll answer if I feel like it." },
      },
      choices = {
        { text = "Who is Ryan?", next = "ryan", when = { ["not"] = { questActive = TODO_QUEST("Delivering Closure") } } },
        { text = "Why didn't you go with him?", next = "argument" },
        { text = "What do you think of Demar Brant?", next = "demar", when = { any = { { questActive = TODO_QUEST("Delivering Closure") }, { questDone = TODO_QUEST("Delivering Closure") } } } },
        { text = "What's it like, living by the Cathedral?", next = "square" },
        { text = "Ryan's last thoughts were of you, Abigail.", next = "last", when = { questActive = TODO_QUEST("Delivering Closure") } },
        { text = "How are you holding up?", next = "after", when = { questDone = TODO_QUEST("Delivering Closure") } },
        { text = "I have something for you.", next = "BUSINESS", when = { questActive = TODO_QUEST("Delivering Closure") } },
        { text = "I'll leave you in peace.", next = "END" },
      },
    },

    ryan = {
      lines = {
        { id = "ry_default", text = "Ryan was my betrothed, a marshal with the Brotherhood of the Horse, out east fighting a war the rest of Stormwind gave up on twenty years ago. We were to marry, once, before he decided the orcs needed him more than I did." },
        { id = "ry_done", when = { questDone = TODO_QUEST("Delivering Closure") }, text = "He was my betrothed, and he died out east in a war Stormwind gave up on long ago. You know the rest; you carried it to me." },
      },
      choices = {
        { text = "Why did he go?", next = "ryan_why" },
        { text = "What's the Brotherhood of the Horse?", next = "brotherhood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ryan_why = {
      lines = {
        { id = "rw_default", text = "When the orcs came in the First War, they killed his family, all of them. Something changed in him after that: it started as duty and it turned into a hatred that ate everything else, me included." },
      },
      choices = {
        { text = "Grief like that is hard to put down.", next = "ryan_grief" },
        { text = "He was right to fight. The orcs owed him blood.", next = "ryan_grief", fx = { align = { light = -1 } } },
        { text = "Hatred like that destroys the one who carries it.", next = "ryan_grief", fx = { align = { light = 1 } } },
      },
    },
    ryan_grief = {
      lines = {
        { id = "rg_default", text = "I asked him to come and live with my parents and me, here, in a city with walls and bread and a Cathedral. He swore he'd stay until he'd purged his home of orcs, and he wouldn't budge an inch. We hadn't spoken since." },
      },
      choices = {
        { text = "Do you regret not going with him?", next = "argument" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brotherhood = {
      lines = {
        { id = "bh_default", text = "An old order of Stormwind's knights, older than the First War, and Lothar himself rode with them once. They hold a keep out east and fight for land the kingdom called lost, and they're very proud of it, and very short of men." },
      },
      choices = {
        { text = "They're fighting for what's theirs. That's honourable.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The crown called the land lost. They should obey.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    argument = {
      lines = {
        { id = "ar_default", text = "Because I'd buried enough people for one life, and I wasn't going to go out to some damp keep at the edge of the world and wait to bury him too. So we argued, and I said things, and he said things, and he went." },
      },
      choices = {
        { text = "You were right to stay.", next = "argument_right", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A promised bride should follow her betrothed.", next = "argument_right", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "What did you say to him?", next = "argument_said" },
      },
    },
    argument_right = {
      lines = {
        { id = "arr_default", text = "Right or wrong, I'm here and he isn't. I tell myself I was right most days, and on the bad days I tell myself I should have gone and dragged him home by the collar." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    argument_said = {
      lines = {
        { id = "as_default", text = "That he loved his grudge more than he loved me. He didn't deny it, which was worse than if he'd shouted. He just looked at me as though I'd told him something he already knew." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    demar = {
      lines = {
        { id = "de_default", text = "Demar Brant is a coward who wouldn't show his face to me, and a hero, which is the same thing in my experience. That's the thing about heroes: they excel at getting other people killed." },
      },
      choices = {
        { text = "He's holding that keep with almost nothing.", next = "demar_defend" },
        { text = "He sent Ryan to die. You're right to hate him.", next = "demar_defend", fx = { align = { order = -1 } } },
        { text = "Ryan chose to stay. Demar only led him.", next = "demar_defend", fx = { align = { order = 1 } } },
      },
    },
    demar_defend = {
      lines = {
        { id = "dd_default", text = "I know what he's holding, and I know what it costs. If you're going to stay out there and help them, take care of yourself, because I've no wish to hear your name at a doorstep too." },
      },
      choices = {
        { text = "I'll be careful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    square = {
      lines = {
        { id = "sq_default", text = "Busy and holy, both at once, and loud with it. The priests come and go, the orphans run about under the Matron's eye, and the widows sit on the steps like I do, which I suppose makes me one already." },
      },
      choices = {
        { text = "You're not a widow yet.", next = "square_widow", when = { ["not"] = { questDone = TODO_QUEST("Delivering Closure") } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    square_widow = {
      lines = {
        { id = "sw_default", text = "No, I'm not anything yet. That's the trouble with waiting for someone; you can't mourn and you can't stop worrying, so you sit in a square and watch the pigeons." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    last = {
      lines = {
        { id = "la_default", text = "Of me? Then he was a bigger fool than I thought, to think of me at the end and not at the start. Did he say anything, or just my name?" },
      },
      choices = {
        { text = "He said he should have come home.", next = "last_home", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "He said he loved you. Only that.", next = "last_love", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    last_home = {
      lines = {
        { id = "lh_default", text = "Should have come home. Twenty years of grudge, and that's what he finds at the bottom of it." },
      },
      choices = {
        { text = "Let me give you his crest.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    last_love = {
      lines = {
        { id = "ll_default", text = "He never said it in his life, not once, so I'll pretend to believe it for your sake. Give me the crest, then, before I change my mind." },
      },
      choices = {
        { text = "Here it is.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },

    after = {
      lines = {
        { id = "af_default", text = "Better than I was. I've stopped rehearsing angry speeches in my head, and started telling him about my day instead, which my mother says is progress and my father says is madness." },
      },
      choices = {
        { text = "Grief takes its own time.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stormwind born, back under my parents' roof, and betrothed to a man who loved a war more than me." } },
    advice = { { id = "tp_ad", text = "If someone you love asks you to come home, go." } },
    _none = { { id = "tp_none", text = "I don't know and I don't much care. Ask one of the priests; they're paid to listen." } },
  },
}

---------------------------------------------------------------------------
-- Gilbert Gray: a fisher on the harbor piers.
---------------------------------------------------------------------------
P:NPC {
  key = "gilbert_gray", id = TODO_NPC("Gilbert Gray"), name = "Gilbert Gray",
  bible = "bibles/stormwind_forever.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "jovial" }, values = { "patient", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Gilbert Gray sits at the end of a harbor pier with a line in the water and no intention of moving. He talks about fish the way some men talk about the weather, endlessly and with total confidence.",
    third = "{name} met Gilbert Gray, an old fisher on the piers of Stormwind Harbor.",
  },

  greetings = {
    { id = "g_default", text = "Shh, don't stamp on the boards. They can hear you through the water, you know." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Pull up a crate. The fish aren't biting, but the company's good." },
    { id = "g_fisher", when = { profession = "Fishing" }, text = "Now there's a fisherman, I can see it in the way you look at the water." },
    { id = "g_active", when = { questActive = TODO_QUEST("Fishin' Time") }, text = "How's it going with that little job of mine? No rush; fish don't hurry, and neither do I." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You've got a fisher's hands, I can tell by the line burns. Where do you cast, when you get the chance?" },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of the tall folk from the far pier. You lot fish with spears, someone told me; is that true, or are they having me on?" },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Gilbert Gray, and this end of the pier's mine, more or less, since nobody else wants it. The harbor's all ships and shouting these days, but the fish don't care about any of that." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Fishin' Time") },
          text = "I've a little job, if you've got the patience for it, and a rod you can spare an hour with. Fishin' time, I call it, and it's the best time there is." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Fishin' Time") },
          text = "You'll get the hang of it. The trick is to stop trying so hard and let the water do the work." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Fishin' Time"), days = 3 } },
          text = "You did well there, better than I did my first summer. We'll make a fisher of you yet." },
        { id = "h_done", when = { questDone = TODO_QUEST("Fishin' Time") },
          text = "There's my fishing partner! Sit down, sit down; I've saved you a crate." },
      },
      again = {
        { id = "h_again", text = "What else? We've all day." },
        { id = "h_again2", text = "Go on, I'm only watching a float." },
      },
      choices = {
        { text = "What's biting in the harbor?", next = "fish" },
        { text = "How long have you fished here?", next = "years" },
        { text = "What do you make of the new harbor?", next = "harbor" },
        { text = "What's this job of yours?", next = "job", when = { ["not"] = { questDone = TODO_QUEST("Fishin' Time") } } },
        { text = "I'll do your job.", next = "BUSINESS", when = { any = { { questBefore = TODO_QUEST("Fishin' Time") }, { questActive = TODO_QUEST("Fishin' Time") } } } },
        { text = "Good fishing, Gilbert.", next = "END" },
      },
    },

    fish = {
      lines = {
        { id = "fi_default", text = "Not much, in this weather, but the odd fat one comes in with the tide. Fish follow the ships, you know, for what gets thrown overboard, and there's plenty thrown overboard round here." },
      },
      choices = {
        { text = "Any secrets to catching them?", next = "fish_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish_secret = {
      lines = {
        { id = "fs_default", text = "Patience, and a bit of bread rolled up tight, and never looking at the float too hard. If you stare at it, it won't move; look away and it'll go under every time." },
        { id = "fs_fisher", when = { profession = "Fishing" }, text = "You know that already, I'd wager. Arnold Leland down by the canals teaches the proper way, but I've never had a lesson in my life, and I've caught more than he has." },
      },
      choices = {
        { text = "Patience. I'll remember.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    years = {
      lines = {
        { id = "ye_default", text = "Since I was a lad, before the orcs came, when there was hardly a harbor at all, just old docks and fishing boats. Then the city burned, and we came back, and they built all this, and I'm still here with the same old rod." },
      },
      choices = {
        { text = "You came back after the city burned?", next = "years_burn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    years_burn = {
      lines = {
        { id = "yb_default", text = "Got out on one of the last boats north with Lothar's lot, and spent the war in Lordaeron gutting fish. When we came back, there was nothing here, so I sat on what was left of the pier and fished until they built a new one around me." },
      },
      choices = {
        { text = "That's a stubborn way to live.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    harbor = {
      lines = {
        { id = "ha_default", text = "Big, and busy, and full of fellows in uniforms telling you where not to stand. The elves have their own pier now, with a boat to Darkshore, and I'll say this for them: they're quiet, which is more than you can say for the sailors." },
      },
      choices = {
        { text = "Do you like having the elves here?", next = "harbor_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harbor_elves = {
      lines = {
        { id = "he_default", text = "Can't complain. They don't scare the fish, and they nod when they pass, which is manners. One of them asked me once what I was catching, and listened to the whole answer, which nobody's done in thirty years." },
      },
      choices = {
        { text = "The Alliance is stronger with them in it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stormwind should look after its own first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    job = {
      lines = {
        { id = "jo_default", text = "Nothing hard, just an hour or two with a rod. I'm not as quick as I was, and there's some catching wants doing that I can't manage by myself anymore." },
      },
      choices = {
        { text = "Why not hire a dockhand?", next = "job_dock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    job_dock = {
      lines = {
        { id = "jd_default", text = "Dockhands want coin, and they talk the whole time, and they don't know a rod from a broom handle. You've got a proper look about you, so I thought I'd ask." },
      },
      choices = {
        { text = "Then I'm your fisher.", next = "BUSINESS", when = { questBefore = TODO_QUEST("Fishin' Time") } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born a fisher, fled a fisher, came back a fisher. I've never wanted to be anything else." } },
    advice = { { id = "tp_ad", text = "Stop staring at the float. It'll go under when it's ready." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask me about fish, I know about fish." } },
  },
}

---------------------------------------------------------------------------
-- Idrieth Mossgrove: keeps the kaldorei pier and the boat to Auberdine.
---------------------------------------------------------------------------
P:NPC {
  key = "idrieth", id = TODO_NPC("Idrieth Mossgrove"), name = "Idrieth Mossgrove",
  bible = "bibles/stormwind_forever.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "calm" }, values = { "patient", "loyal" },
  notices = { "race", "class" },
  impression = {
    first = "Idrieth Mossgrove keeps the kaldorei pier in Stormwind Harbor and tells everyone who asks when the boat leaves for Auberdine. He is unfailingly polite, and seems to be studying the humans as closely as they study him.",
    third = "{name} met Idrieth Mossgrove, the night elf who keeps the pier for the boat to Auberdine.",
  },

  greetings = {
    { id = "g_default", text = "If you seek travel to Auberdine in Darkshore, you have come to the right place." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The boat is due soon, if you mean to travel." },
    { id = "g_nelf", when = { race = "NightElf" }, text = "Ishnu-alah. It is good to see a kaldorei face among so many strangers." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "You will be homesick for the trees soon, if you are not already. The boat goes home whenever you need it." },
    { id = "n_druid", cat = "class", when = { class = "DRUID", ["not"] = { race = "NightElf" } },
      text = "A druid who is not kaldorei? The Cenarion Circle would want to hear of you, I think." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "This dock connects Stormwind to the lands of the kaldorei by way of Auberdine, the port town of Darkshore. Our people welcome any of the Alliance who wish to trade, travel or aid others in our lands." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "You know the way home as well as I do. Auberdine first, then the boat to Rut'theran and the great tree." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask, if there is more." },
      },
      choices = {
        { text = "What's in Auberdine?", next = "auberdine" },
        { text = "What do you make of Stormwind?", next = "city" },
        { text = "Why would humans go to your lands?", next = "why" },
        { text = "When does the boat leave?", next = "boat" },
        { text = "Thank you, Idrieth.", next = "END" },
      },
    },

    auberdine = {
      lines = {
        { id = "au_default", text = "A small town on the coast of Darkshore, with a moonwell and a sentinels' watch and the sea always at its door. From there, a second boat crosses to Teldrassil, if you would see Darnassus." },
      },
      choices = {
        { text = "Is Darkshore safe?", next = "auberdine_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    auberdine_safe = {
      lines = {
        { id = "as_default", text = "Safer than Elwynn's roads, perhaps, but not safe. There are furbolgs gone wild in the hills, and strange things washing up from the sea, and the Sentinels have more work than they can do. Hands willing to help are welcome." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    city = {
      lines = {
        { id = "ci_default", text = "Loud, and stone, and very young. Your people build quickly and forget quickly, I think, but they are brave, and generous to strangers, and that matters more than walls." },
      },
      choices = {
        { text = "Humans can learn much from the kaldorei.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Stormwind's walls have earned their place.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wy_default", text = "To trade, to learn, to help, as the Alliance helps us. Our lands are old and full of troubles, and we have learned that we cannot face them all alone, though some of my people are slow to say so." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    boat = {
      lines = {
        { id = "bo_default", text = "It arrives often, and does not wait long, so stay near the end of the pier. If you miss it, there is always the next one, and the harbor is a pleasant place to wait." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Born in Ashenvale's shadow, sent here to keep this dock, and still learning how humans think." } },
    advice = { { id = "tp_ad", text = "Stand near the end of the pier. The boat waits for no one." } },
    _none = { { id = "tp_none", text = "I cannot say. Ask in the city; humans always have an answer, even when they do not know one." } },
  },
}

---------------------------------------------------------------------------
-- Roy Lewells: a reader in the Park.
---------------------------------------------------------------------------
P:NPC {
  key = "roy_lewells", id = TODO_NPC("Roy Lewells"), name = "Roy Lewells",
  bible = "bibles/stormwind_forever.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "gentle" }, values = { "curious", "kind" },
  notices = { "class", "race" },
  impression = {
    first = "Roy Lewells reads under the trees in the Park and would rather talk about books than anything else. He is soft-spoken and easily distracted, and keeps losing his place on the page while he talks.",
    third = "{name} met Roy Lewells, a reader who spends his days among the trees in Stormwind's Park.",
  },

  greetings = {
    { id = "g_default", text = "Oh! Sorry, I was miles away. Somewhere around chapter twelve, actually." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I've finished that one, and started two more, which my wife says is a sickness." },
    { id = "g_active", when = { questActive = TODO_QUEST("Reading Room") }, text = "Any luck with that errand? No hurry, I've plenty to read while I wait." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! I've always envied your lot your libraries. Is it true the Kirin Tor kept books that read themselves?" },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Your people keep the trees in this Park. I come here to read because it's the only place in the city that smells of anything but smoke." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Roy Lewells. I read, mostly, and the Park's the best place for it: shade, and quiet, and nobody shouting about cheese prices. The night elves look after the trees, and I look after my books." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Reading Room") },
          text = "Actually, you might be just the person. I've a little errand that I can't manage on my own, if you've a moment to hear it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Reading Room") },
          text = "Still at it? Good, good. I'd go myself, but I'm no use away from a bench." },
        { id = "h_shelf", tags = { "news" }, when = { questActive = TODO_QUEST("Shelf Picked") },
          text = "Have you news for me? I've been fretting about it all week, and I've read the same page nine times." },
        { id = "h_done", when = { questDone = TODO_QUEST("Shelf Picked") },
          text = "Thanks to you, things are back where they belong and I can read in peace again. I can't tell you how much that means to a man like me." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've lost my place anyway." },
        { id = "h_again2", text = "Go on. I'm in no hurry to get back to the dull bit." },
      },
      choices = {
        { text = "What are you reading?", next = "reading" },
        { text = "Why read in the Park?", next = "park" },
        { text = "Where do you get your books?", next = "books" },
        { text = "What's this errand?", next = "errand", when = { questBefore = TODO_QUEST("Reading Room") } },
        { text = "About your errand.", next = "BUSINESS", when = { any = { { questBefore = TODO_QUEST("Reading Room") }, { questActive = TODO_QUEST("Shelf Picked") } } } },
        { text = "Enjoy your book, Roy.", next = "END" },
      },
    },

    reading = {
      lines = {
        { id = "rd_default", text = "A history of the Second War, written by a man who was there and clearly hated every minute. He's terribly rude about the dwarves and terribly kind about his horse." },
        { id = "rd_dwarf", when = { race = "Dwarf" }, text = "A history of the Second War, and, I'm sorry to say, the author's very rude about your people. He's lovely about his horse, though, if that's any comfort." },
      },
      choices = {
        { text = "History should be told honestly, even the ugly parts.", next = "reading_hist", fx = { align = { honor = 1 } } },
        { text = "Some things are better left out of books.", next = "reading_hist", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    reading_hist = {
      lines = {
        { id = "rh_default", text = "That's what I keep saying to my wife. Everybody remembers the war differently, and if you only read one book about it, you'll only know one man's war." },
      },
      choices = {
        { text = "What else do you read?", next = "reading_else" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reading_else = {
      lines = {
        { id = "re_default", text = "Anything with words in it! Histories, travels, a dreadful romance about a knight and a dragon. I'll read the labels on the jars at Pestle's shop if I've nothing else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    park = {
      lines = {
        { id = "pk_default", text = "Because it's the only quiet place in the city. The Trade District's all hawkers and the Cathedral's all bells, but here there's only birds, and the elves, who never say anything unless they mean it." },
      },
      choices = {
        { text = "Do you talk with the elves?", next = "park_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    park_elves = {
      lines = {
        { id = "pe_default", text = "Now and then. The druid who teaches here, Sheldras, once told me a story about the trees in his homeland that took him most of an afternoon. I've never been happier." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    books = {
      lines = {
        { id = "bk_default", text = "The bookshops, when I can afford them, and borrowed from friends when I can't. There's the Royal Library in the Keep, of course, but they don't let the likes of me take books home." },
      },
      choices = {
        { text = "Books should be free for everyone.", next = "books_free", fx = { align = { order = -1 } } },
        { text = "A library has to protect its books.", next = "books_free", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    books_free = {
      lines = {
        { id = "bf_default", text = "Well, I suppose there's something to be said for both. Old Milton Sheaf up at the Royal Library would rather die than lend a book, but he'd also die before he let one come to harm." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    errand = {
      lines = {
        { id = "er_default", text = "It's about having somewhere proper to read, you see. I've thought about it for a long time, and I can't do it alone, but you look like someone who gets things done." },
      },
      choices = {
        { text = "I'll help.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stormwind born, a clerk by trade, and a reader by every other hour of the day." } },
    advice = { { id = "tp_ad", text = "Read more than one book about anything that matters." } },
    _none = { { id = "tp_none", text = "I haven't read about that, I'm afraid. Yet." } },
  },
}

---------------------------------------------------------------------------
-- Aendaril Brookshot: a kaldorei druid in the Valley of Heroes.
---------------------------------------------------------------------------
P:NPC {
  key = "aendaril", id = TODO_NPC("Aendaril Brookshot"), name = "Aendaril Brookshot",
  bible = "bibles/stormwind_forever.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "calm" }, values = { "patient", "curious" },
  notices = { "race", "class" },
  impression = {
    first = "Aendaril Brookshot is a kaldorei druid who stands in Stormwind's Valley of Heroes and studies the statues as though they might speak. The city's noise seems to pass around the druid like water around a stone.",
    third = "{name} met Aendaril Brookshot, a night elf druid in the Valley of Heroes.",
  },

  greetings = {
    { id = "g_default", text = "Elune's light on you, stranger. Stand a moment, if you like; the statues are better company than they look." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The statues have not moved, if you were wondering." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A child of the Circle, here among the stones. We are a long way from the moonwells, you and I." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You feel the city too, don't you? All this stone, and the earth still breathing beneath it." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Your people make statues of their heroes. Mine plant trees, and let the trees remember." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Aendaril Brookshot, of the Cenarion Circle, far from home. I came to see how humans remember the people who died for them, and this valley is where they do it." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask, if you wish. I have time." },
      },
      choices = {
        { text = "Who are these statues?", next = "statues" },
        { text = "Why does a druid care about statues?", next = "why" },
        { text = "What do you think of Stormwind?", next = "city" },
        { text = "Farewell, Aendaril.", next = "END" },
      },
    },

    statues = {
      lines = {
        { id = "st_default", text = "Heroes who went through the Dark Portal and never came back: Turalyon, Khadgar, Danath, Kurdran, and Alleria Windrunner, an elf of Quel'Thalas. The plaques call them presumed dead.", fx = { learn = { "cenarion_circle" } } },
      },
      choices = {
        { text = "Do you think they're dead?", next = "statues_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    statues_dead = {
      lines = {
        { id = "sd_default", text = "I do not know. My teachers slept for centuries in the Emerald Dream while the world went on without them, so I have learned not to call anyone dead until I see the grave." },
      },
      choices = {
        { text = "Hope keeps the living going. Keep hoping.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Better to mourn them and move on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because memory is a kind of growth. The kaldorei remember everything, and we are slow to change because of it. Humans forget quickly, and so they build, and I want to understand which of us is wiser." },
      },
      choices = {
        { text = "Remembering everything keeps you trapped.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Memory keeps a people from repeating mistakes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    city = {
      lines = {
        { id = "ci_default", text = "Loud and young and very busy, like a sapling that has not yet learned it will be a tree. There is a Park with trees in it, which is kind, but the earth under the stones is restless." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A druid of the Cenarion Circle, trained in the forests of Ashenvale, and now watching humans for a while." } },
    advice = { { id = "tp_ad", text = "Remember the dead, but do not build your house in their shadow." } },
    _none = { { id = "tp_none", text = "That I do not know. The trees might, but they are slow to tell." } },
  },
}

---------------------------------------------------------------------------
-- Fyrenz Vishonar: weaves glamours that change how a person's gear looks.
---------------------------------------------------------------------------
P:NPC {
  key = "fyrenz", id = TODO_NPC("Fyrenz Vishonar"), name = "Fyrenz Vishonar", title = "Transmogrifier",
  bible = "bibles/stormwind_forever.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "smooth" }, values = { "proud", "curious" },
  notices = { "kit", "class" },
  impression = {
    first = "Fyrenz Vishonar is a kaldorei who weaves glamours over armour, so a warrior can wear one thing and look like another. She studies everyone's clothes the way a jeweller studies stones.",
    third = "{name} met Fyrenz Vishonar, the night elf in Stormwind who changes how armour looks.",
  },

  greetings = {
    { id = "g_default", text = "Greetings, {class}. I can show you how to weave magic about yourself to change the appearance of your equipment, if you so desire." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Has your armour grown dull in your eyes already?" },
  },

  notice = {
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "You come to me wearing almost nothing? There is very little for me to work with, {class}." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue who wants to change their look. I wonder why." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Fyrenz Vishonar. I weave a glamour over your armour so it looks however you wish, while the steel underneath stays exactly what it is. Do you wish to use my services?" },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask, then. I am listening." },
      },
      choices = {
        { text = "How does it work?", next = "how" },
        { text = "Why would anyone want this?", next = "why" },
        { text = "What brings you to Stormwind?", next = "here" },
        { text = "I'd like to change my look.", next = "BUSINESS" },
        { text = "Not today.", next = "END" },
      },
    },

    how = {
      lines = {
        { id = "hw_default", text = "A thread of magic, laid close over the metal and leather, that shows the eye one thing while the body wears another. It changes nothing but the look, so do not ask me to make your plate lighter." },
      },
      choices = {
        { text = "It's a kind of lie, then.", next = "how_lie" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_lie = {
      lines = {
        { id = "hl_default", text = "A kind one, perhaps. The armour still protects you; only the eye is fooled. If that troubles you, wear what you have and be proud of it." },
      },
      choices = {
        { text = "A warrior should look like what they are.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Looking how I like hurts no one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "wy_default", text = "Because adventurers wear whatever they last pulled off a dead ogre, and most of it clashes terribly. Some want to look like a hero they admire, and some just want to stop being laughed at in the tavern." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    here = {
      lines = {
        { id = "hr_default", text = "There are more adventurers in this city than in all of Darnassus, and more of them badly dressed. A weaver goes where the work is." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darnassus first, then here, where the work is." } },
    advice = { { id = "tp_ad", text = "Wear what keeps you alive. Let me worry about how it looks." } },
    _none = { { id = "tp_none", text = "That is not my concern. Ask me about how you look, and I will have plenty to say." } },
  },
}
