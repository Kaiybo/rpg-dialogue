-- Ashenvale's Horde outposts, the folk we had missed. Zoram'gar Outpost: Je'neu Sancrea (Earthen Ring),
-- Marukai and Mitsuwa (Darkspear), Muglash (Vorsha the Lasher). Splintertree Post: Locke Okarr (Warsong
-- Supplies), Innkeeper Kaylisk, Vhulgra (wind riders) and Qeeju (stables). Classic only.
-- Voice: bibles/horde_outposts.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Je'neu Sancrea
---------------------------------------------------------------------------
P:NPC {
  key = "jeneu", id = TODO_NPC("Je'neu Sancrea"), name = "Je'neu Sancrea", title = "The Earthen Ring",
  bible = "bibles/horde_outposts.md", role = "questgiver", tier = "quest",
  communities = { "zoramgar" }, temper = { "calm", "earnest" }, values = { "wise", "devout" },
  notices = { "class", "race" },

  impression = {
    first = "He listens to the sea the way others listen to gossip.",
    third = "{name} met Je'neu Sancrea, a troll shaman of the Earthen Ring at Zoram'gar Outpost who watches Blackfathom Deeps.",
  },

  greetings = {
    { id = "g_hello", text = "Da water be uneasy today, mon. Come, stand by me and listen to it a while." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Da spirits remember you, and so do I." },
    { id = "g_mastok", when = { questDone = TODO_QUEST("Je'neu of the Earthen Ring") },
      text = "Mastok sent you all dis way from Splintertree? He be a hard orc, but he know when a thing need a shaman and not an axe." },
    { id = "g_alli", when = { faction = "Alliance" }, text = "You be far from your own people, stranger, and closer to mine than is wise. Speak, then go." },
  },

  notice = {
    { id = "n_sham", cat = "class", when = { class = "SHAMAN" },
      text = "Da elements walk with you, I can feel dem. Water most of all, I think, or maybe dat be only da sea talking." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of da Earth Mother's children. Your people listen to da land almost as well as da Ring does, and I don't say dat lightly." },
  },

  start = "hello",
  nodes = {
    dd_naga = {
      lines = {
        { id = "ddn_default", text = "Because somet'ing in Blackfathom Deeps be callin' dem, and de water spirits be cryin' about it. De naga be old, older dan de Horde, and dey come from under de sea where no shaman go, so we watch, and we kill dem when dey come too close." },
      },
      choices = {
        { text = "Then we should go into Blackfathom and end it.", next = "BACK", reply = "Brave talk, and maybe one day you do it. Go wit' friends, and listen to de water before you go too deep." },
        { text = "Something else, Je'neu.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_naga", tags = { "news" }, when = { questDone = TODO_QUEST("Naga at the Zoram Strand") }, text = "Marukai say you cut down many naga on de strand for her. De water spirits be quieter tonight, and I be thinkin' dat not a coincidence." },
        { id = "h_default", key = true,
          text = "I be Je'neu Sancrea, of da Earthen Ring. Something stir in Blackfathom Deeps, north along da strand, and da water spirits be crying out about it, so I come here to listen and to answer." },
        { id = "h_ruins", tags = { "news" }, when = { questActive = TODO_QUEST("Amongst the Ruins") },
          text = "Da Twilight's Hammer be in da Moonshrine Ruins, deep in Blackfathom, bending da elements to their will. Find da fathom stone in da water dere and bring me its core, and da Ring may yet undo what dey be doing." },
        { id = "h_aku", tags = { "news" }, when = { questActive = TODO_QUEST("The Essence of Aku'Mai") },
          text = "Da sapphires grow on da cave walls near da entrance of da Deeps, and da naga be cutting dem out. Bring me twenty, before da naga get any more, and we see why dey want dem so bad." },
        { id = "h_sham", when = { class = "SHAMAN" },
          text = "A shaman! Den you already hear what I hear, da water talking too fast and too frightened. Da Ring could use you, if you ever want to walk dat road." },
      },
      again = {
        { id = "h_again", text = "What else? Da sea, she be patient, so I be patient too." },
        { id = "h_again2", text = "Ask, mon. I got time between da waves." },
      },
      choices = {
        { text = "Why do the naga keep coming up the Zoram Strand?", next = "dd_naga", when = { questDone = TODO_QUEST("Naga at the Zoram Strand") } },
        { text = "What is the Earthen Ring?", next = "ring" },
        { text = "What's wrong in Blackfathom Deeps?", next = "deeps" },
        { text = "Who are the Twilight's Hammer?", next = "twilight" },
        { text = "Why do the naga want those sapphires?", next = "sapphires" },
        { text = "Why should the Horde care about elf ruins?", next = "xwhy", when = { faction = "Horde" } },
        { text = "The elves pray to their moon. Does anything answer?", next = "moon" },
        { text = "I'll go.", next = "END" },
      },
    },

    ring = {
      lines = { { id = "ri_default", text = "We be shamans of many peoples, orc and troll and tauren, who keep da balance between da elements and da world. We don't fight for any warchief, only for da earth and sea and sky, and some in Orgrimmar think dat strange." } },
      choices = {
        { text = "Balance matters more than any banner.", next = "BACK", reply = "Ya, mon, you hear it like de Ring hears it. De elements don't know nothin' about banners, and dey never will.", fx = { align = { order = 1 } } },
        { text = "A shaman should serve the Horde first.", next = "BACK", reply = "Da Horde be family, mon, and I'll not say different. But da earth was here before any warchief, and she'll be here after.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    deeps = {
      lines = { { id = "de_default", text = "It be a temple once, to da elf moon goddess, before da sea come in and drown it. Now naga swim in da halls, and cultists light candles in da shrines, and something old and hungry sleep at da bottom, and none of dem be good for da water." } },
      choices = {
        { text = "Something old and hungry?", next = "akumai" },
        { text = "Something else.", next = "BACK" },
      },
    },
    akumai = {
      lines = { { id = "ak_default", text = "Aku'mai, da cultists call it, and dey worship it like a god. I don't know what it be, only dat da water around it feel sick, like a fever in da sea." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    twilight = {
      lines = { { id = "tw_default", text = "Dey be cultists who want da elements to break free and swallow da world, which be da opposite of everything da Ring stand for. Dey find old, forgotten places full of power and dey dig in like ticks." } },
      choices = {
        { text = "Then we burn them out.", next = "tw_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tw_stance = {
      lines = { { id = "tws_default", text = "Burn dem, and da fire get loose too, mon. I want da fathom core first, so we know what dey done to da water, and den we decide." } },
      choices = {
        { text = "Understand first, then act. You're right.", next = "BACK", reply = "Ya, mon, dat be da way. Know what's sick before you start cuttin'.", fx = { align = { light = 1 }, learn = { "twilights_hammer" } } },
        { text = "Every day you wait, they grow stronger.", next = "BACK", reply = "Dey do, mon, and I feel it every morning. But burn blind and we lose da coast with dem.", fx = { align = { light = -1 }, learn = { "twilights_hammer" } } },
      },
    },

    sapphires = {
      lines = { { id = "sa_default", text = "Dey hold elemental power, strong and raw, and in da wrong hands dey make a fine piece of arcane work. Naga don't cut stone for pretty, so somebody want dem for something, and I want to know who." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    moon = {
      lines = {
        { id = "mo_default", text = "Somet'ing answer, mon, I won't lie to you. I feel it on da strand at night when da tide come up silver, and it be no loa I know, but it be no demon either." },
        { id = "mo_troll", when = { race = "Troll" },
          text = "Somet'ing answer, cousin, and you feel it too if you stand on da strand when da tide come up silver. It be no loa our grandmothers named, but it be no demon either, and dat be more dan I say for some of what da elves call holy." },
        { id = "mo_nelf", when = { race = "NightElf" },
          text = "Your goddess answer, elf, I won't pretend she don't. I feel her on da strand when da tide come up silver, and she be no loa I know, but no demon either, which be more dan your Sentinels ever say of my spirits." },
      },
      choices = {
        { text = "Elune is just the elves' name for a loa.", next = "moon_loa" },
        { text = "Then why do the elves treat us as enemies?", next = "moon_enemies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moon_loa = {
      lines = {
        { id = "ml_default", text = "Maybe, and maybe a loa be just a troll's name for somet'ing older. My grandmother would slap me for sayin' it, but da spirits don't argue about names, mon, only people do." },
      },
      choices = {
        { text = "Then we've less to fight over than we think.", next = "BACK", reply = "Less over gods, ya, but still plenty over trees. One fight at a time, mon, and maybe dat one get easier.", fx = { align = { light = 1 }, opinion = { night_elves = "mixed" } } },
        { text = "Their goddess didn't stop their arrows. Names matter.", next = "BACK", reply = "Dey matter to da ones holdin' da bows, I grant you. Keep your shield up, then, and leave da gods to argue by demselves.", fx = { align = { light = -1 }, opinion = { night_elves = "distrust" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moon_enemies = {
      lines = {
        { id = "me_default", fx = { learn = { "elune" } },
          text = "Because dey remember trolls from da old empires and orcs from Grom's axe, and dey forget nothin'. Yet dey left a temple to deir own goddess drowned in Blackfathom for ten thousand years, mon, and still dey call us da ones who don't respect sacred places." },
      },
      choices = {
        { text = "They abandoned their own temple. They've no right to lecture us.", next = "BACK", reply = "Dat be how I feel on a bad night, mon. Da naga and da cultists keep it now, and no Sentinel ever came to take it back.", fx = { align = { honor = -1 }, opinion = { night_elves = "arrogant" } } },
        { text = "The sea took that temple, not the elves. Be fair.", next = "BACK", reply = "Fair, mon, you catch me, because it was da sea dat took it. I still say dey should have come back for it, but I'll say it softer.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhy = {
      lines = { { id = "xw_default", text = "Because da sea don't care whose ruin it be, and when da water go sick, it be sick at Zoram'gar too. Da elves and us, we drink from da same coast, whether we like it or not." } },
      choices = {
        { text = "Then the elves should help clean it.", next = "BACK", reply = "Dey should, mon, and maybe one day dey will. Da water don't care who start da cleanin'.", fx = { align = { honor = 1 } } },
        { text = "Let the elves rot. We fix what's ours.", next = "BACK", reply = "Ours be the whole coast, mon, whether we like it or no. Sick water swim to Zoram'gar too.", fx = { align = { honor = -1 } } },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Marukai
---------------------------------------------------------------------------
P:NPC {
  key = "marukai", id = TODO_NPC("Marukai"), name = "Marukai",
  bible = "bibles/horde_outposts.md", role = "questgiver", tier = "quest",
  communities = { "zoramgar" }, temper = { "gruff", "dry" }, values = { "practical", "loyal" },
  notices = { "class" },

  impression = {
    first = "She glares at the sea as if it owed her money.",
    third = "{name} met Marukai, a Darkspear troll at Zoram'gar Outpost who wants the naga of the Zoram Strand thinned out.",
  },

  greetings = {
    { id = "g_hello", text = "You come to fight, or come to stand around? Plenty of both here, mon." },
    { id = "g_back", when = { metBefore = true }, text = "Back, and still got all your fingers. Da naga be slipping." },
    { id = "g_done", when = { questDone = TODO_QUEST("Naga at the Zoram Strand") },
      text = "Da strand be quieter since you went down dere. Quieter, not quiet, but I take quieter." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Go and talk with Je'neu when you done here, mon, because he been listening to dat water for weeks and he don't like what it say." },
    { id = "n_orc", cat = "class", when = { race = "Orc" },
      text = "An orc, come all dis way to da wet end of da forest. Karang be glad of you, mon, he been short of his own kind since da last boat." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Naga be slippery in da water, so you shoot dem on da sand and save yourself da swim." },
  },

  start = "hello",
  nodes = {
    watch = {
      lines = { { id = "wt_default", text = "Dat be my whole job, mon. I count da heads dat come up at dusk and I count da ones dat go back down at dawn, and when da two numbers don't match I go wake Karang. Last week dey didn't match three nights running." } },
      choices = {
        { text = "Where did the missing ones go?", next = "watch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch2 = {
      lines = { { id = "wt2_default", text = "Up da strand toward da old elf ruins, where dey be digging in da sand for something. Naga don't dig for fun, mon, so whatever be under dere, dey want it more dan dey want us, and dat be da only reason we still got tents." } },
      choices = {
        { text = "Then strike while their backs are turned.", next = "BACK", reply = "Dat be what Karang say too, and why he send for fighters like you. Hit dem while dey be looking down.", fx = { align = { order = -1 } } },
        { text = "Watch longer. Learn what they're digging for.", next = "BACK", reply = "Patient, mon, like a good fisherman. I keep counting heads, den, and you keep your spear dry.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      lines = { { id = "ci_default", text = "You got dat right. Da elves call it Zoram, and when da tide go out you see da tops of da towers standing in da surf like broken teeth. Da old folk on da Isles would say a place like dat keep its dead, and I not be going out dere to find out." } },
      choices = {
        { text = "And the Deeps beyond it?", next = "city2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    city2 = {
      lines = { { id = "ci2_default", text = "Blackfathom, north along da cliff, where da water go down into da dark and don't come back up. Je'neu say something old be sleeping down dere and da naga and da hooded ones both be whispering to it. I say let it sleep, but nobody ask Marukai." } },
      choices = { { text = "I'll ask Je'neu about it. Something else.", next = "BACK", fx = { learn = { "blackfathom" } } } },
    },
    xsham = {
      lines = { { id = "xs_default", text = "Uneasy be a kind word for it, mon. Da water spirits here been turned around by something in da Deeps, and Je'neu Sancrea of da Earthen Ring sit up every night trying to talk dem calm. If you got da gift, he could use another voice." } },
      choices = { { text = "I'll lend him mine. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_dd_vorsha", tags = { "news" }, when = { questDone = TODO_QUEST("Vorsha the Lasher") }, text = "Muglash be tellin' everybody you stood beside him when Vorsha come up out of de water, and dat de hydra be dead now. De naga still crawl up de strand, but at least de sea not be eatin' our boats no more." },
        { id = "h_default", key = true,
          text = "I be Marukai, and I keep watch on da strand, and da strand keep coughing up naga, and I be tired of it. Every night dey crawl up a little closer, like dey testing us." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Naga at the Zoram Strand") },
          text = "Da Wrathtail, dey call demselves, and dey be all along da beach north of here. Kill as many as you can stand, and come back and tell me how it feel." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Darkspear blood, good. You know da sea like I know da sea, and you know when something in it be wrong." },
      },
      again = {
        { id = "h_again3", text = "Go on, mon. Da naga don't come till dark, so I got time to be asked things." },
        { id = "h_again", text = "What else? Talk fast, da tide be turning." },
        { id = "h_again2", text = "Ask, mon. I got nothing better to do but glare." },
      },
      choices = {
        { text = "What do the naga want here?", next = "naga" },
        { text = "How does Zoram'gar hold out?", next = "outpost" },
        { text = "You and Mitsuwa are kin?", next = "mitsuwa" },
        { text = "Do you miss the Echo Isles?", next = "isles", when = { race = "Troll" } },
        { text = "You watch the water more than you watch me.", next = "watch" },
        { text = "That drowned city is no place for the living.", next = "city" },
        { text = "The spirits of this shore are uneasy.", next = "xsham", when = { class = "SHAMAN" } },
        { text = "I'll go down to the strand.", next = "END" },
      },
    },
    naga = {
      lines = { { id = "na_default", text = "Dey want da drowned city out dere, and everything in it, and maybe da Deeps too. Dey come up out of da water like it all belong to dem, and maybe once it did, but it don't now." } },
      choices = {
        { text = "Then we take the strand and hold it.", next = "naga_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_stance = {
      lines = { { id = "ns_default", text = "Hold it against naga in front and elves behind, with a handful of tents and one wind rider? You be brave or you be mad, mon, and out here dat be da same thing." } },
      choices = {
        { text = "The Horde holds what it takes. Always.", next = "BACK", reply = "Ha! Spoken like a true orc, mon, and maybe you be right. Mad and brave both, dat be the Horde.", fx = { align = { honor = 1 } } },
        { text = "Hold what pays. Leave the rest to the naga.", next = "BACK", reply = "Practical, mon, and I like practical. But somebody gotta hold dis beach, or da naga take it all.", fx = { align = { honor = -1 } } },
      },
    },
    outpost = {
      lines = { { id = "ou_default", text = "Stubborn, mostly. Karang, our commander, keep us in line, Je'neu da shaman keep da spirits happy, and da rest of us keep our backs to da cliff and our spears pointed at da water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mitsuwa = {
      lines = { { id = "mi_default", text = "Kin enough. We come over on da same boats, and he lost more family on da road here than I did, so I let him do da grieving and I do da glaring." } },
      choices = {
        { text = "That's a kind thing to do.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles = {
      lines = { { id = "is_default", text = "Every day, mon, every day. Da water here be cold and da trees be too tall and da elves be too quiet, and none of it smell like home." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep da watch on da strand at Zoram'gar, mon. It not be exciting till it be too exciting." } },
    blackfathom = { { id = "tp_bfd", text = "Da Deeps be north along da cliff, and something old be sleeping in dem. Go with friends or don't go, mon." } },
    _none = { { id = "tp_none", text = "Don't know dat one, mon. Ask Karang, or ask da sea, and da sea be more likely to answer." } },
  },
}

---------------------------------------------------------------------------
-- Mitsuwa
---------------------------------------------------------------------------
P:NPC {
  key = "mitsuwa", id = TODO_NPC("Mitsuwa"), name = "Mitsuwa",
  bible = "bibles/horde_outposts.md", role = "questgiver", tier = "quest",
  communities = { "zoramgar" }, temper = { "grim", "calm" }, values = { "family", "devout" },
  notices = { "race" },

  impression = {
    first = "He speaks of his dead kin as if they'd only gone ahead.",
    third = "{name} met Mitsuwa, a Darkspear troll at Zoram'gar Outpost whose kin were killed by the Thistlefur.",
  },

  greetings = {
    { id = "g_hello", text = "You walk soft for a stranger. Dat be good, mon, da dead don't like loud feet." },
    { id = "g_back", when = { metBefore = true }, text = "You come back. Da loa must like you, or dey would have kept you." },
    { id = "g_done", when = { questDone = TODO_QUEST("Troll Charm") },
      text = "Da charms be home now, all of dem. My brothers and sisters smile at me tonight, I think." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "SHAMAN" } },
      text = "You be one who talk to what we can't see. Good, mon, because I got six names to say tonight and I would not mind another voice saying dem." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people know how to speak of da dead without shame, mon, and dat be a rare thing in a war camp." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. Den you know what dese charms be worth, and why I can't leave dem in a furbolg's den." },
  },

  start = "hello",
  nodes = {
    door = {
      lines = { { id = "dr_default", text = "Dat be a knot of sea-grass, mon, one strand for each of dem. It not be a proper charm, only a promise dat da proper ones be coming, so da spirits know where to wait." } },
      choices = {
        { text = "Does the camp let you grieve in peace?", next = "door2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    door2 = {
      lines = { { id = "dr2_default", text = "Better dan I expect. Karang give me da quiet watch and don't say why, Marukai stand between me and anybody who talk too loud, and Je'neu come by at dusk and sit without speaking. Dey be rough folk, but dey know what a death be." } },
      choices = {
        { text = "Take the time you need. The war will keep.", next = "BACK", reply = "It always do, mon, dat be da one thing you can trust about a war. I thank you.", fx = { align = { light = 1 } } },
        { text = "Grief won't hold this beach. Pick up your spear.", next = "BACK", reply = "I never put it down, mon. A troll can mourn and stand watch both, we had plenty of practice.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister = {
      lines = { { id = "si_default", text = "Da old boat songs, da ones we sing rowing out from da Isles before Zalazane take dem from us. She had a voice dat carry over water like a gull's, and da little ones follow her round da village just to hear it. I try to sing dem now and it come out wrong, but I try." } },
      choices = {
        { text = "Sing them anyway. She'd know the tune.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      lines = { { id = "xp_default", text = "Your rites not be ours, mon, but da dead not be proud about such things. Say what you say for your own, and say dem by name, and I think my kin hear it kindly." } },
      choices = { { text = "Tell me their names. Something else after.", next = "BACK", reply = "I tell you at dusk, mon, when da names be said. Come back den.", fx = { affinity = 1 } } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I be Mitsuwa. My kinfolk be traveling here with many sacred troll charms, and da Thistlefur furbolgs fall on dem in da woods and kill dem all, and take da charms back to deir caves." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Troll Charm") },
          text = "Da charms be in chests in Thistlefur Hold, da cave at da end of da furbolg village north of Astranaar. It be deep and full of angry fur, so go careful, and bring dem all back." },
        { id = "h_done", when = { questDone = TODO_QUEST("Troll Charm") },
          text = "I hang one charm over da door for each of dem dat fell. Da others I keep for da young ones who come after, so dey know who walk dis road first." },
      },
      again = {
        { id = "h_again3", text = "Sit, mon, and ask. Marukai do da glaring for both of us, so I got time." },
        { id = "h_again", text = "What else, mon?" },
        { id = "h_again2", text = "Ask. Talking of dem keep dem close." },
      },
      choices = {
        { text = "Tell me about your kin.", next = "kin" },
        { text = "What are the troll charms?", next = "charms" },
        { text = "Why did the furbolgs attack them?", next = "furbolgs" },
        { text = "Do you want revenge?", next = "revenge" },
        { text = "You've hung something over the door already.", next = "door" },
        { text = "Your sister sang. Tell me what she sang.", next = "sister", when = { race = "Troll" } },
        { text = "I can speak the rites for them, if you wish.", next = "xpriest", when = { class = { "PRIEST", "SHAMAN" } } },
        { text = "I'll bring the charms back.", next = "END" },
      },
    },
    kin = {
      lines = { { id = "ki_default", text = "Cousins, mostly, and one sister who sing louder than anybody on da Isles. Dey come from Durotar to join me here, and I tell dem it be safe, which I think about every night." } },
      choices = {
        { text = "You couldn't have known.", next = "kin_known" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kin_known = {
      lines = { { id = "kk_default", text = "Maybe not. But da loa don't ask what you know, mon, only what you do next, so I do next and I try not to think about before." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    charms = {
      lines = { { id = "ch_default", text = "Dey be carved bone and feather and old blood, made by our witch doctors for da spirits' favour. Dey be worth more to us than gold, and to a furbolg dey be shiny things to keep in a box." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    furbolgs = {
      lines = { { id = "fu_default", text = "Da Thistlefur gone mad, everybody say so, elf and orc both. Something in da forest sour dem, and now dey kill anything dat walk too near deir trees." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } } },
    },
    revenge = {
      lines = { { id = "re_default", text = "Some days, mon. Some days I want to go up dat valley with a torch and burn every den I find. Other days I think da furbolgs be sick, not wicked, and burning dem won't bring nobody back." } },
      choices = {
        { text = "Blood for blood. Your kin deserve it.", next = "BACK", reply = "Ya, mon, part of me want dat too. But blood don't bring nobody home, it only make more empty beds.", fx = { align = { light = -1 } } },
        { text = "Bring the charms home. Let the dead rest.", next = "BACK", reply = "Ya, mon, dat be what my heart say on da quiet days. Bring dem home, and da spirits will do da rest.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    darkspear = { { id = "tp_darkspear", text = "We be few, mon, and far from da Isles. Every one we lose be a song nobody sing no more." } },
    background = { { id = "tp_bg", text = "I keep da quiet watch at Zoram'gar, mon, and I wait for my kin's charms to come home." } },
    furbolgs = { { id = "tp_furbolgs", text = "Da Thistlefur be sick in da head, mon, and dey kill what come near. I hate dem and I pity dem, and I don't know which be heavier." } },
    _none = { { id = "tp_none", text = "I don't know, mon. Ask Je'neu, who know many things, or Marukai, who think she do." } },
  },
}

---------------------------------------------------------------------------
-- Muglash
---------------------------------------------------------------------------
P:NPC {
  key = "muglash", id = TODO_NPC("Muglash"), name = "Muglash",
  bible = "bibles/horde_outposts.md", role = "questgiver", tier = "quest",
  communities = { "zoramgar" }, temper = { "fierce", "proud" }, values = { "brave", "vengeful" },
  notices = { "class", "race" },

  impression = {
    first = "He has one ambition left, and it is a hydra.",
    third = "{name} met Muglash at Zoram'gar Outpost, an orc set on killing the hydra Vorsha the Lasher.",
  },

  greetings = {
    { id = "g_hello", text = "You! You look like you can swing a blade. Do you want to see a hydra die?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and Vorsha's still breathing. That bothers me more than you know." },
    { id = "g_done", when = { questDone = TODO_QUEST("Vorsha the Lasher") },
      text = "Vorsha is dead! I've told it to every orc on this beach, and some of them twice." },
  },

  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Good, because the naga will come running when we light the brazier, and I'll need someone to hold them." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "One of the clans! You'll understand a blood debt, then, even if it's owed by a beast." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Muglash. Vorsha the Lasher, the fiendish hydra that roams the seas, has taken too many of ours from these shores, and I mean to call her up and kill her, but I can't do it alone." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Vorsha the Lasher") },
          text = "The naga keep a brazier on the strand, and when it's lit, Vorsha comes. Guard my back while I get to it, then we fight her together, and if I fall, finish her and tell the runner at Zoram'gar." },
        { id = "h_done", when = { questDone = TODO_QUEST("Vorsha the Lasher") },
          text = "I've been dreaming of that fight for years, and it was better than the dream. I don't know what I'll do now, so maybe I'll go find another hydra." },
      },
      again = {
        { id = "h_again", text = "What else? Ask fast, I'm itching to go." },
        { id = "h_again2", text = "Go on. Then we go hunting." },
      },
      choices = {
        { text = "Why do you hate this hydra so much?", next = "why" },
        { text = "How do you call up a hydra?", next = "brazier" },
        { text = "Wouldn't it be smarter to leave her be?", next = "leave" },
        { text = "What is Zoram'gar doing on this beach?", next = "outpost" },
        { text = "What will you do now she's dead?", next = "after", when = { questDone = TODO_QUEST("Vorsha the Lasher") } },
        { text = "A shaman could ask the waters where she sleeps.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'll help you kill her.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "She took a boat from Zoram'gar the first season we were here, and my shield-brother was in it. I heard him shouting all the way down, and I swore on the beach that night that she'd die by my hand." } },
      choices = {
        { text = "A blood oath must be kept. I'll stand with you.", next = "BACK", reply = "Then you're Horde in your blood, and I'm glad of you. We'll find her together, and the sea will give my brother back his name.", fx = { align = { honor = 1 } } },
        { text = "Oaths made in grief are foolish. Still, I'll help.", next = "BACK", reply = "Foolish, maybe, but an oath is an oath, and I'll keep it. Glad of your help all the same.", fx = { align = { honor = -1 } } },
        { text = "Tell me about your shield-brother.", next = "brother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother = {
      lines = { { id = "bo_default", text = "Gorlash. We were in the same pen in the camps, and we broke out the same night, and we crossed the sea on the same ship with Thrall. He couldn't swim, and he laughed about it, and he said the sea would never get the chance to drown an orc as stubborn as him." } },
      choices = {
        { text = "The sea took him anyway.", next = "brother_sea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother_sea = {
      lines = { { id = "bs_default", text = "No. Vorsha took him, and that's different, because you can't kill the sea, but you can kill a hydra. When she's dead, I'll go out on the water in a boat and tell him so, and then maybe I'll learn to swim, just to spite him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    brazier = {
      lines = { { id = "br_default", text = "The naga worship her, or feed her, I'm not sure which, and they light a brazier on the sand when they want her to come. So we light it for them, and kill whatever naga object, and then she rises." } },
      choices = {
        { text = "That's a plan with a lot of fighting in it.", next = "brazier_fight" },
        { text = "Where do these naga come from?", next = "naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brazier_fight = {
      lines = { { id = "bf_default", text = "That's what makes it a good plan! Bring a friend if you have one, because the naga don't come one at a time and neither do Vorsha's heads." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    naga = {
      lines = { { id = "na_default", text = "Out of the sea and up out of Blackfathom, where the old elf temple sank. The Darkspear here say they serve something down in the deep that's worse than any hydra, and I say one monster at a time." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackfathom" } } } },
    },
    leave = {
      lines = { { id = "le_default", text = "Smarter, maybe. But I didn't cross an ocean and fight demons and humans and elves to be smart, I came here to be free, and a free orc chooses his own enemies." } },
      choices = {
        { text = "Then choose her, and I'll follow.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    outpost = {
      lines = { { id = "ou_default", text = "Watching Blackfathom, and the naga, and the elves to the north, and giving the Horde a foothold on the water so the Warsong aren't the only orcs in Ashenvale. Je'neu of the Earthen Ring came to study the deeps, and the Darkspear came to fish, and I came for Vorsha." } },
      choices = {
        { text = "The Earthen Ring are here?", next = "outpost_ring" },
        { text = "Something else.", next = "BACK" },
      },
    },
    outpost_ring = {
      lines = { { id = "or_default", text = "Je'neu Sancrea, a shaman who talks to the water and listens to its answers. He says the sea here is sick with whatever sleeps in Blackfathom, and I believe him, because I've seen what swims up out of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    after = {
      lines = { { id = "af_default", text = "I took a boat out past the strand, the way I said I would, and I told Gorlash it was done. Then I sat there until the sun went down, and I came back to shore, and I still can't swim, so I suppose he wins that one." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Je'neu tried it, and the waters told him she sleeps deep and wakes hungry, which I already knew. The spirits don't like hydras any better than I do, shaman, so if they'll help you aim, let them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Locke Okarr
---------------------------------------------------------------------------
P:NPC {
  key = "locke", id = TODO_NPC("Locke Okarr"), name = "Locke Okarr",
  bible = "bibles/horde_outposts.md", role = "questgiver", tier = "quest",
  communities = { "splintertree" }, temper = { "gruff", "brisk" }, values = { "practical", "dutiful" },
  notices = { "class", "race" },

  impression = {
    first = "He takes every lost saw blade personally.",
    third = "{name} met Locke Okarr at Splintertree Post, an orc who needs the Warsong's lost supplies found.",
  },

  greetings = {
    { id = "g_hello", text = "If you're not carrying a saw blade, you'd better be carrying a good reason to talk to me." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Tell me you found my rope." },
    { id = "g_done", when = { questDone = TODO_QUEST("Warsong Supplies") },
      text = "Blades, rope, oil and axes, all accounted for. The lumber camp can work again, and I can sleep." },
    { id = "g_alli", when = { faction = "Alliance" }, text = "An Alliance face in Splintertree? Either you're lost or you're brave, and I've no time for either." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear. Your kin at Zoram'gar send to me for rope every month and never say what they do with it. Naga, I suppose." },
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "Good arms on you. You could carry a crate of axes without dropping it, which is more than my last runner managed." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people look at our lumber camp like we're cutting off our own fingers, and I've no stomach to argue it today." },
  },

  start = "hello",
  nodes = {
    mastok = {
      lines = { { id = "mk_default", text = "That's the way of it. Mastok Wrilehiss keeps the tally for Orgrimmar and I keep the wagons rolling, and between us we know where every plank in Splintertree came from. Kuray'bin gives the orders, but he asks the two of us first whether there's rope enough to carry them out." } },
      choices = {
        { text = "And the Lumber Camp answers to you as well?", next = "mastok2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mastok2 = {
      lines = { { id = "mk2_default", text = "The camp answers to the Warsong, and the Warsong answer to nobody they can avoid. They want blades yesterday and oil the day before, and when a wagon's lost they send a rider to ask me why, as if I'd hidden it." } },
      choices = {
        { text = "Soldiers should respect the ones who supply them.", next = "BACK", reply = "They should, and one day one of them will. Until then I'll settle for my wagons arriving.", fx = { align = { order = 1 } } },
        { text = "Warriors do the bleeding. Let them shout.", next = "BACK", reply = "They do bleed, I'll give them that. But they'd bleed a deal faster with no axes, and they forget it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps = {
      lines = { { id = "cp_default", text = "Five years behind a human fence, with nothing to do and nothing to count but the days. When Thrall broke the gates I swore I'd never sit idle again, and I haven't. Lists and wagons may not sound like much to a young warrior, but they are mine, and nobody handed them to me through a fence." } },
      choices = {
        { text = "That is as good a reason as any I've heard.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      lines = { { id = "xw_default", text = "Then you're worth three of my runners. The axe crate went off the road near the lake when the kodo bolted, and it's heavy enough that the elves couldn't be bothered to drag it far. Bring it back without dropping it and I'll say your name to Kuray'bin." } },
      choices = { { text = "I'll keep both hands on it. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Locke Okarr, and I keep the supplies coming to the Warsong lumber camps. Or I would, if the night elves didn't keep ambushing my wagons and scattering everything across the forest." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Warsong Supplies") },
          text = "Saw blades, logging rope, a barrel of oil and the axe shipment, all of it lying somewhere between here and the camps. Find it before the elves do, because they'll throw it in the river just to spite us." },
        { id = "h_orc", when = { race = "Orc" },
          text = "One of the clans! Then you know what wood means to us now, walls and fires and a roof that isn't a Lordaeron prison camp. Help me get the supplies back where they belong." },
      },
      again = {
        { id = "h_again3", text = "Ask, and I'll answer while I count. I can do both, which is why they gave me the job." },
        { id = "h_again", text = "What else? Make it quick." },
        { id = "h_again2", text = "Go on. Then go find my supplies." },
      },
      choices = {
        { text = "Why does the Horde need this forest?", next = "need" },
        { text = "How do the elves keep getting at you?", next = "elves" },
        { text = "What happens if the supplies don't arrive?", next = "lost" },
        { text = "The elves were here first. You're stealing their trees.", next = "xstealing" },
        { text = "Mastok counts the wagons, and you fill them?", next = "mastok" },
        { text = "You were in the camps yourself.", next = "camps", when = { race = "Orc" } },
        { text = "I've hauled worse loads than a crate of axes.", next = "xwar", when = { class = { "WARRIOR", "SHAMAN" }, faction = "Horde" } },
        { text = "I'll find your supplies.", next = "END" },
      },
    },
    need = {
      lines = { { id = "ne_default", text = "Durotar is dust and rock, and Orgrimmar needs walls and beams and fuel for every forge. The nearest timber worth cutting is here, and the elves would sooner see it rot than see an orc use it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } } },
    },
    elves = {
      lines = { { id = "el_default", text = "They come out of the trees without a sound and they're gone before the shouting starts. You can't see a Sentinel until she wants you to, and by then you've usually got an arrow in you." } },
      choices = {
        { text = "Then strike back. Make them fear the camps.", next = "elves_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_stance = {
      lines = { { id = "es_default", text = "The Warsong want to burn half the forest to smoke them out, and Mastok, who counts our wagons, says that would bring every Sentinel in Kalimdor down on us. I just want my wagons to arrive." } },
      choices = {
        { text = "Burn them out. Fear keeps the wagons safe.", next = "BACK", reply = "Fear, maybe, and a forest full of angry elves after. I'll pass that along to the Warsong, if they ask.", fx = { align = { light = -1 } } },
        { text = "Mastok is right. Cut what we need, no more.", next = "BACK", reply = "That's my thinking too, and Mastok's. Just get the wagons through and we'll all be happier.", fx = { align = { light = 1 } } },
      },
    },
    lost = {
      lines = { { id = "lo_default", text = "Then the camp stops cutting, and the camp boss shouts at me, and I shout at the runners, and nobody gets their supper. It's not glory, but an army runs on rope and oil as much as on blood." } },
      choices = {
        { text = "Somebody has to keep the lists.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstealing = {
      lines = { { id = "xs_default", text = "And they'll be here long after, the way they tell it, since they live forever. My people were penned up in camps for years, so forgive me if I don't cry over a few trees." } },
      choices = {
        { text = "Their land is theirs. We should have asked.", next = "BACK", reply = "Maybe we should have, and maybe they'd have said no. Either way, the Warchief needs timber.", fx = { align = { honor = 1 } } },
        { text = "Land belongs to those who can hold it.", next = "BACK", reply = "Aye, and that's how the Horde's lived since the camps. I'll not apologise for surviving.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep the supplies moving from Splintertree out to the Warsong camps. If it's on a wagon, it's on my list." } },
    warsong = { { id = "tp_warsong", text = "The Warsong cut the timber and I keep them in saws to do it. They're hard to like and harder to do without." } },
    _none = { { id = "tp_none", text = "That's not on any list of mine. Ask Mastok, or ask Kaylisk at the inn, who hears more than both of us." } },
  },
}

---------------------------------------------------------------------------
-- Innkeeper Kaylisk
---------------------------------------------------------------------------
P:NPC {
  key = "kaylisk", id = TODO_NPC("Innkeeper Kaylisk"), name = "Innkeeper Kaylisk", title = "Innkeeper", gender = "female",
  bible = "bibles/horde_outposts.md", role = "innkeeper", tier = "service",
  communities = { "splintertree" }, temper = { "gruff", "warm" }, values = { "practical", "generous" },
  notices = { "weary", "hunger" },

  impression = {
    first = "She feeds anyone in Horde colours and asks questions afterwards.",
    third = "{name} met Innkeeper Kaylisk, who keeps the inn at Splintertree Post.",
  },

  greetings = {
    { id = "g_hello", text = "In, in, before the elves see the door open. There's stew, and it's hot, and that's the best I can say for it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and walking. Sit, eat, and don't tell me what you killed." },
    { id = "g_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "kaylisk_flirt_no" } }, cooldown = "2d",
      text = "In, before the elves see the door. You look well fed for once, and it suits you, so sit where I can look at it." },
    { id = "g_flirt_yes", when = { flirt = true, npcFlagBefore = "kaylisk_flirt_yes" }, priority = 8, cooldown = "1d",
      text = "There you are. I kept the good bowl back, the one without the chip in it, and I don't do that for grunts." },
    { id = "g_flirt_no", when = { npcFlagBefore = "kaylisk_flirt_no" }, priority = 8, once = true,
      text = "Stew's hot, and that's all you'll get from me today. I don't ask twice and I don't sulk, so sit down and eat." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { resting = true },
      text = "You look like you've been sleeping in trees. There's a proper bed upstairs, or near enough." },
  },

  start = "hello",
  nodes = {
    dd_torek = {
      lines = {
        { id = "ddt_default", text = "Loudly, and with more Sentinels in them every time. The way they tell it, you killed Duriel Moonfire with one hand and carried Torek home with the other. I don't believe half of it, but the half I believe is enough." },
      },
      choices = {
        { text = "We hit the elves where it hurt. Good.", next = "BACK", reply = "Good for the Horde, maybe, but every raid brings a reprisal, and they'll come for these walls next. I'd rather you were here when they do.", fx = { align = { light = -1 } } },
        { text = "I take no joy in killing elves for lumber.", next = "BACK", reply = "Then keep that to yourself in front of the Warsong. They'd not take it kindly, though I don't think you're wrong.", fx = { align = { light = 1 } } },
        { text = "Something else, Kaylisk.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_torek", tags = { "news" }, when = { questDone = TODO_QUEST("Torek's Assault") }, text = "Torek's raiders came back from the Silverwing Outpost drunk on blood and boasting, and every one of them told me you fought beside them. Sit down, before they start the story again from the beginning." },
        { id = "h_dd_outrunners", when = { questDone = TODO_QUEST("Ashenvale Outrunners") }, text = "Kuray'bin says the elf runners don't slip past Splintertree like they used to, and he says it's your doing. Good, because one of them set my storehouse alight last spring." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } }, text = "You've the look of someone the spirit healer knows by name, {class}. This forest kills the careless, so eat something and sleep before you go back out." },
        { id = "h_default", key = true,
          text = "Kaylisk, and this is my inn, for as long as the walls stand. Food, drink and a bed, and I'll keep your hearthstone tied here if you want somewhere to come back to." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Sit down, sit down. You've the Warsong look about you, half asleep and still angry, so eat first and be angry after." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Mind your horns on the beam, friend, everyone does. Kaylisk, and this is my inn, and there's grain in the back for those who'd rather not eat whatever the hunters brought in today." },
        { id = "h_flirt", when = { flirt = true, chance = 0.4, ["not"] = { npcFlag = "kaylisk_flirt_no" } }, cooldown = "3d",
          text = "You've a good scar on you, and you wear it well. Sit down before I say something foolish, because I've been on my feet since dawn." },
        { id = "h_flirt_yes", when = { flirt = true, npcFlagBefore = "kaylisk_flirt_yes" }, priority = 6, cooldown = "1d",
          text = "Alive again, and walking on your own legs. Good, because I'd have had words with the elves if you weren't." },
      },
      again = {
        { id = "h_again", text = "Anything else? The pot won't stir itself." },
        { id = "h_again2", text = "What else can I do for you?" },
      },
      choices = {
        { text = "Torek's raiders are telling stories about me?", next = "dd_torek", when = { questDone = TODO_QUEST("Torek's Assault") } },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "How do you keep an inn in a war?", next = "war" },
        { text = "What's in the stew?", next = "stew" },
        { text = "Who comes through Splintertree?", next = "guests" },
        { text = "Where were you before Splintertree?", next = "past" },
        { text = "I'm a cook myself. Need a hand?", next = "cook", when = { profession = "Cooking" } },
        { text = "Does anyone look after you, Kaylisk?", next = "flirt", when = { flirt = true, ["not"] = { npcFlag = "kaylisk_flirt_no" } } },
        { text = "Thanks, Kaylisk.", next = "END" },
      },
    },
    flirt = {
      lines = {
        { id = "fl_default", text = "Nobody's offered, and I'd have thrown the stew at them if they had. You, though, I might only throw the bowl at, which is as near to sweet as I get in a war." },
        { id = "fl_again", when = { npcFlagBefore = "kaylisk_flirt_yes" }, priority = 5,
          text = "You do, when you come through that door alive, and that's enough looking after for an orc. Don't let it go to your head; I said the same to the stew pot this morning." },
      },
      choices = {
        { text = "Then I'll keep coming back alive, Kaylisk.", next = "flirt_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "kaylisk_flirt_yes" }, clear = { "kaylisk_flirt_no" } } } },
        { text = "Lok'tar, Kaylisk. I'd take your stew over any feast in Orgrimmar.", next = "flirt_yes", when = { race = "Orc" },
          reply = "Hah! An orc with a civil tongue in {g:his|her} head, and a flattering one. Mind it doesn't get you hit.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "kaylisk_flirt_yes" }, clear = { "kaylisk_flirt_no" } } } },
        { text = "My people say a full pot means a warm heart, Kaylisk.", next = "flirt_yes", when = { race = "Tauren" },
          reply = "Then mine must be scalding, because I've never once let this pot go empty.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "kaylisk_flirt_yes" }, clear = { "kaylisk_flirt_no" } } } },
        { text = "You cook like a Darkspear mother, Kaylisk. Dat be high praise.", next = "flirt_yes", when = { race = "Troll" },
          reply = "From a troll, I'll take it, though I've met your mothers and they frighten me.",
          fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "kaylisk_flirt_yes" }, clear = { "kaylisk_flirt_no" } } } },
        { text = "Throw the bowl at someone else, Kaylisk. I'm only here to eat.", next = "BACK",
          reply = "Fair enough. Eat, then, and I'll save my aim for the elves.",
          fx = { trait = { reserved = 1 }, npcFlag = { set = { "kaylisk_flirt_no" }, clear = { "kaylisk_flirt_yes" } } } },
        { text = "Keep your mind on the stew, innkeeper.", next = "BACK",
          reply = "My mind's always on the stew, and it slipped for a moment, but it won't again. Sit and eat.",
          fx = { trait = { stern = 1 }, npcFlag = { set = { "kaylisk_flirt_no" }, clear = { "kaylisk_flirt_yes" } } } },
      },
    },
    flirt_yes = {
      lines = { { id = "fy_default", text = "Good, because I'm sick of burying the ones who don't. Come back alive, eat what I give you, and maybe one night, when the shutters are closed and the elves are quiet, I'll sit down with you." } },
      choices = {
        { text = "I'll hold you to that, Kaylisk.", next = "BACK",
          reply = "Hold me to it, then. Now eat, before it goes cold and you blame my cooking." },
      },
    },
    war = {
      lines = { { id = "wa_default", text = "By keeping the shutters closed and the fire low, and by not asking where the meat came from. We've had arrows through the roof twice this season, and both times I patched it before supper." } },
      choices = {
        { text = "That's the spirit of the Horde.", next = "war_stance" },
        { text = "Who shot the arrows?", next = "war_arrows" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war_stance = {
      lines = { { id = "ws_default", text = "Or the spirit of a stubborn orc who's too tired to move. The grunts here would fight anything, but they won't fight on an empty belly, so I do my part." } },
      choices = {
        { text = "Every grunt here owes you. I'll remember that.", next = "BACK", reply = "Kind of you, and I'll take it, though most of them just grunt. Eat up.", fx = { align = { honor = 1 } } },
        { text = "Feed the fighters, forget the rest. That's war.", next = "BACK", reply = "Spoken like a grunt, and you're not wrong. But I'd feed the elves too, if they'd ever come to the door.", fx = { align = { honor = -1 } } },
      },
    },
    war_arrows = {
      lines = { { id = "wr_default", text = "Sentinels, from the ridge to the west, at night, when the lamps are lit. I don't think they were aiming at me; I think they were aiming at the roof, to tell us they could. I kept one of the arrows over the bar, to tell them we're still here." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    stew = {
      lines = { { id = "st_default", text = "Whatever the hunters bring in, and whatever grows near the post that the shamans say won't kill you. Today it's mostly deer, and maybe some of a furbolg's lunch, so don't look too closely." } },
      choices = {
        { text = "What won't you put in the pot?", next = "stew_never" },
        { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    stew_never = {
      lines = { { id = "sn_default", text = "Anything from the furbolg camps, because the beasts there are sick, and anything a troll brings in smiling. Kuray'bin swears his last offering was boar, and maybe it was, but I've never seen a boar with that many legs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guests = {
      lines = { { id = "gu_default", text = "Lumber crews who've lost a saw, runners from Zoram'gar with sand in everything, the odd tauren from the Barrens looking sad at the stumps, and grunts on their way to the Warsong camps. They all eat the same stew, and they all complain the same way." } },
      choices = {
        { text = "The tauren don't like the logging?", next = "guests_tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guests_tauren = {
      big = true,
      lines = { { id = "gt_default", text = "They don't, and they're polite about it, which is worse. One sat at that table for an hour last week and told me the forest was crying, and I told him the forest could cry all it liked, so long as my roof had beams. Maybe I was hard on him." } },
      choices = {
        { text = "He's right. We take too much from this forest.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Horde needs the wood. Tears won't build walls.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    past = {
      lines = { { id = "pa_default", text = "In the camps, like most of us my age, stirring gruel for the humans' guards and planning how I'd poison them. Thrall got us out before I tried it, and I've cooked for orcs ever since, which is a much better use of a ladle." } },
      choices = {
        { text = "Would you really have poisoned them?", next = "past_poison" },
        { text = "Something else.", next = "BACK", fx = { learn = { "internment" } } },
      },
    },
    past_poison = {
      lines = { { id = "pp_default", text = "I thought about it every night, and I never did it, because they'd have hanged every orc in the kitchen for it. That's the thing you learn in a camp: anger keeps you warm, but patience keeps you alive, and the trick is having both." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "thrall" } } } },
    },
    cook = {
      lines = { { id = "co_default", text = "Not with my pot, you won't, nobody touches my pot. But tell me what the hunters are bringing in further out, because I'm tired of deer, and the grunts are tired of me being tired of deer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Who's eating, who's sleeping, and who's coming back from the lumber camps. Most of the time." } },
    internment = { { id = "tp_intern", text = "I cooked for the humans' guards there. I cook for orcs now. That's all the history I need." } },
    _none = { { id = "tp_none", text = "Don't know, and the stew doesn't either. Ask someone who's been out past the trees." } },
  },
}

---------------------------------------------------------------------------
-- Vhulgra (wind rider master)
---------------------------------------------------------------------------
P:NPC {
  key = "vhulgra", id = TODO_NPC("Vhulgra"), name = "Vhulgra", title = "Wind Rider Master",
  bible = "bibles/horde_outposts.md", role = "flightmaster", tier = "service",
  communities = { "splintertree" }, temper = { "blunt", "steady" }, values = { "practical", "loyal" },
  notices = { "race" },

  impression = {
    first = "She trusts her beasts more than she trusts most people.",
    third = "{name} met Vhulgra, the wind rider master at Splintertree Post.",
  },

  greetings = {
    { id = "g_hello", text = "Need to get out, or need to get somewhere? Either way, my riders are ready." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the ground, I see. Where to this time?" },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. The riders like your people, you know; you're the only ones who don't shout at them on take-off." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dd_fall", when = { deathCause = "falling" }, text = "You've fallen off something high and died for it, I can tell by the way you look at my wind riders. They don't drop riders who hold on, so hold on, and stop jumping off cliffs to save time." },
        { id = "h_default", key = true,
          text = "Vhulgra. I keep the wind riders at Splintertree, and they'll carry you anywhere the Horde has a roost. Mind the beak, though, because they bite strangers." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You're a long way past the treeline for one of the Alliance, and my riders don't carry your kind. Say what you came to say, and keep your hands where the birds can see them." },
      },
      again = {
        { id = "h_again", text = "Anything else before you fly?" },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Is it safe to fly over Ashenvale?", next = "safe" },
        { text = "What are wind riders like to keep?", next = "riders" },
        { text = "You fly the wounded out?", next = "wounded" },
        { text = "Where did the Horde find wind riders?", next = "origin" },
        { text = "I've ridden wolves all my life. Birds are different.", next = "wolves", when = { race = "Orc" } },
        { text = "Thanks.", next = "END" },
      },
    },
    safe = {
      lines = { { id = "sa_default", text = "Safer than walking, most days. The Sentinels' archers can't reach you that high, and the hippogryphs keep to their own side of the sky, though I've seen one or two of them get curious." } },
      choices = {
        { text = "And if they come too close?", next = "close" },
        { text = "Something else.", next = "BACK" },
      },
    },
    close = {
      lines = { { id = "cl_default", text = "My riders are hungrier than their birds, and they know it. I don't pick those fights, but I don't forbid them either." } },
      choices = {
        { text = "Good. The sky is ours to hold as well.", next = "BACK", reply = "Aye, and my riders would agree with you. I'll not hold them back.", fx = { align = { order = -1 } } },
        { text = "Better to keep the peace up there.", next = "BACK", reply = "Maybe, and I'd not argue it. But you try telling a hungry rider that.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    riders = {
      lines = { { id = "ri_default", text = "Proud, hungry and loyal once they've decided you're worth the trouble. They eat more than a grunt and complain less, so I'll take them over most of the post." } },
      choices = {
        { text = "How do they decide you're worth it?", next = "riders_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riders_trust = {
      lines = { { id = "rt_default", text = "You feed them by hand for a month and let them bite you once without hitting back. After that, they'll fly through a storm for you, and you'd better do the same for them, because they remember who left them out in the rain." } },
      choices = {
        { text = "Did one ever bite you badly?", next = "riders_bite" },
        { text = "Something else.", next = "BACK" },
      },
    },
    riders_bite = {
      lines = { { id = "rb_default", text = "The old grey one took two fingers' worth of my hand when I was new to them, and I've still got the scar. I didn't hit him, and he's carried me home from three fights since, so I'd call that a fair trade." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    wounded = {
      lines = { { id = "wo_default", text = "When the lumber camps are hit, the ones who can't walk come here, and I strap them to a rider and send them to Orgrimmar or the Crossroads. Not all of them land breathing, but more do than would on a wagon through Sentinel country." } },
      choices = {
        { text = "That's a heavy job.", next = "wounded_heavy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounded_heavy = {
      lines = { { id = "wh_default", text = "It's the job that needs doing. Kaylisk feeds them, the shamans bind them, and I fly them, and between the three of us Splintertree loses fewer than it should. I don't count the ones we lose; Mastok does that, and he never sleeps." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    origin = {
      lines = { { id = "or_default", text = "The wild ones nest on the high cliffs of Kalimdor, and the tauren knew them long before we came, and they taught us to ask them politely instead of throwing a net. It took the orcs a while to learn the asking part." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cairne" } } } },
    },
    wolves = {
      lines = { { id = "wl_default", text = "They are. A wolf runs with you, but a wind rider carries you, and it can drop you any time it likes. The first time up, every orc grips too hard and shouts, and the bird remembers it for a week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The riders, the roosts, and what the sky over Ashenvale looks like on a bad day." } },
    sentinels = { { id = "tp_sent", text = "Good archers, poor reach. My riders stay above their arrows and below the hippogryphs." } },
    _none = { { id = "tp_none", text = "Don't know. The riders might, but they won't tell you." } },
  },
}

---------------------------------------------------------------------------
-- Qeeju (stable master)
---------------------------------------------------------------------------
P:NPC {
  key = "qeeju", id = TODO_NPC("Qeeju"), name = "Qeeju", title = "Stable Master",
  bible = "bibles/horde_outposts.md", role = "stablemaster", tier = "service",
  communities = { "splintertree" }, temper = { "wry", "calm" }, values = { "practical", "patient" },
  notices = { "pet" },

  impression = {
    first = "The beasts in his pens are the calmest things in the post.",
    third = "{name} met Qeeju, the troll stable master at Splintertree Post.",
  },

  greetings = {
    { id = "g_hello", text = "Easy, mon. Leave da shouting at da gate, da beasts don't like it." },
    { id = "g_back", when = { metBefore = true }, text = "You come back for your beast, or bring me another one?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "Dat {pet} of yours, it look at me like it know me already. Beasts talk to each other, you know, and I got a good name among dem." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Qeeju, and dese be my stables. I keep your beasts fed and quiet while you go do whatever you hunters do in dese trees, and I don't ask too many questions." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Ah, a Darkspear, far from da Echo Isles like me! Qeeju, and dese be my stables, and you be welcome to sit wit' da beasts any time you miss da sound of da sea, because dey breathe slow like da tide." },
      },
      again = {
        { id = "h_again", text = "What else, mon?" },
        { id = "h_again2", text = "Ask. Da beasts don't mind." },
      },
      choices = {
        { text = "I'd like to use the stables.", next = "BUSINESS" },
        { text = "How do you keep them so calm?", next = "calm" },
        { text = "Any beasts here worth taming?", next = "tame" },
        { text = "What do you sing to them?", next = "song" },
        { text = "How did a Darkspear end up in Ashenvale?", next = "home" },
        { text = "My pet's been off its food lately.", next = "pet_sick", when = { class = "HUNTER" } },
        { text = "What does a hunter's beast need in elf country?", next = "hnt_elf", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Thanks.", next = "END" },
      },
    },
    calm = {
      lines = { { id = "ca_default", text = "I talk to dem, and I sing a little, and I never let a grunt kick one. Most beasts only want to know who be in charge, and dat it ain't somebody angry." } },
      choices = {
        { text = "A gentle hand is best with any beast.", next = "BACK", reply = "Ya, mon, you know it. Gentle and sure, and dey follow you anywhere.", fx = { align = { light = 1 } } },
        { text = "Some only learn from the whip.", next = "BACK", reply = "Den dey learn to hate you, mon, and a beast dat hate you bite when you sleep. Not in my stable.", fx = { align = { light = -1 } } },
        { text = "The grunts kick the beasts?", next = "grunts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grunts = {
      lines = { { id = "gr_default", text = "Only once each, mon. Da first time, I explain it nice. Da second time, I let da raptor explain it, and da raptor not so nice as Qeeju, so word get around fast in a post dis small." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    tame = {
      lines = { { id = "ta_default", text = "Da forest got fine wolves and bears, and da elves' nightsabers if you be brave or stupid. Dere be a big black cat dat walk da hills to da north, too, but nobody come back from looking for her with all deir parts." } },
      choices = {
        { text = "Tell me more about this black cat.", next = "cat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cat = {
      lines = { { id = "ct_default", text = "Big as a kodo calf and quiet as a shadow, and she walk da same path every night like she own it. Some hunters say she be a spirit, some say she just a cat, and Qeeju say whatever she be, she don't want a saddle." } },
      choices = {
        { text = "I'll be the one to tame her.", next = "cat_brag" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cat_brag = {
      lines = { { id = "cb_default", text = "Ha! Dat be what da last three said, mon. If you do it, you bring her here first, and Qeeju give her da best corner and a whole deer, and we see who be taming who." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    song = {
      lines = { { id = "sg_default", text = "Old songs from da islands, about da tide and da raptors and da loa who watch da hunt. Da beasts don't understand da words, but dey understand a slow voice, and a slow voice be hard to find in a war camp." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    home = {
      lines = { { id = "ho_default", text = "Same as all of us, mon. Thrall gave da Darkspear a home in Durotar when we had none, and when da Warsong came to cut dese trees, somebody had to mind da wolves. Qeeju be good wit' beasts and bad wit' axes, so here I be." } },
      choices = {
        { text = "Do you miss the islands?", next = "home_miss" },
        { text = "Something else.", next = "BACK", fx = { learn = { "darkspear" } } },
      },
    },
    home_miss = {
      big = true,
      lines = { { id = "hm_default", text = "Every night. Zalazane still sit on da Echo Isles wit' his hexed slaves, and some say Vol'jin should take dem back now, and some say Durotar be home enough. Qeeju just want to hear da sea again before he old." } },
      choices = {
        { text = "Take the islands back. They're your people's home.", next = "BACK", fx = { align = { order = -1 }, learn = { "echo_isles" } } },
        { text = "Durotar's home now. Stand with the Horde there.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet_sick = {
      lines = { { id = "ps_default", text = "Den you let it drink from da wrong stream, maybe, or it eat somet'ing from near da furbolg camps, where da water go bad. Give it clean meat and clean water for three days, and if it still sad, bring it to Qeeju and I sing to it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } } },
    },
    hnt_elf = {
      lines = { { id = "hel_d", text = "Quiet, mon, more than anything. The elves' cats can hear a wolf pant from across the river, so teach yours to lie still in the brush, and feed it before you go out, because a hungry beast be a noisy beast." } },
      choices = { { text = "Fed and quiet. Thanks, Qeeju.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Beasts, mon, and da songs dat calm dem. Not much else worth knowin'." } },
    echo_isles = { { id = "tp_echo", text = "Home, mon, and Zalazane sittin' on it like a vulture. One day we take it back." } },
    _none = { { id = "tp_none", text = "Qeeju don't know dat one, mon. Ask a beast; dey know more dan you t'ink." } },
  },
}
