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
    first = "Je'neu Sancrea is a Darkspear shaman of the Earthen Ring who listens to the sea the way other people listen to gossip. Something in Blackfathom Deeps troubles the water, and he means to find out what.",
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
    hello = {
      lines = {
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
        { text = "What is the Earthen Ring?", next = "ring" },
        { text = "What's wrong in Blackfathom Deeps?", next = "deeps" },
        { text = "Who are the Twilight's Hammer?", next = "twilight" },
        { text = "Why do the naga want those sapphires?", next = "sapphires" },
        { text = "Why should the Horde care about elf ruins?", next = "xwhy", when = { faction = "Horde" } },
        { text = "I'll go.", next = "END" },
      },
    },

    ring = {
      lines = { { id = "ri_default", text = "Shamans of many peoples, orc and troll and tauren, who keep da balance between da elements and da world. We don't fight for any warchief, only for da earth and sea and sky, and some in Orgrimmar think dat strange." } },
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
      lines = { { id = "tw_default", text = "Cultists who want da elements to break free and swallow da world, which be da opposite of everything da Ring stand for. Dey find old, forgotten places full of power and dey dig in like ticks." } },
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
    first = "Marukai stands at the edge of Zoram'gar and glares at the sea as if it owed him money. He has had enough of naga crawling up out of the surf and says so to anyone in earshot.",
    third = "{name} met Marukai, a Darkspear troll at Zoram'gar Outpost who wants the naga of the Zoram Strand thinned out.",
  },

  greetings = {
    { id = "g_hello", text = "You come to fight, or come to stand around? Plenty of both here, mon." },
    { id = "g_back", when = { metBefore = true }, text = "Back, and still got all your fingers. Da naga be slipping." },
    { id = "g_done", when = { questDone = TODO_QUEST("Naga at the Zoram Strand") },
      text = "Da strand be quieter since you went down dere. Quieter, not quiet, but I take quieter." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Naga be slippery in da water, so you shoot dem on da sand and save yourself da swim." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Marukai. I keep watch on da strand, and da strand keep coughing up naga, and I be tired of it. Every night dey crawl up a little closer, like dey testing us." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Naga at the Zoram Strand") },
          text = "Da Wrathtail, dey call demselves, and dey be all along da beach north of here. Kill as many as you can stand, and come back and tell me how it feel." },
        { id = "h_troll", when = { race = "Troll" },
          text = "Darkspear blood, good. You know da sea like I know da sea, and you know when something in it be wrong." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, da tide be turning." },
        { id = "h_again2", text = "Ask, mon. I got nothing better to do but glare." },
      },
      choices = {
        { text = "What do the naga want here?", next = "naga" },
        { text = "How does Zoram'gar hold out?", next = "outpost" },
        { text = "You and Mitsuwa are kin?", next = "mitsuwa" },
        { text = "Do you miss the Echo Isles?", next = "isles", when = { race = "Troll" } },
        { text = "I'll go down to the strand.", next = "END" },
      },
    },
    naga = {
      lines = { { id = "na_default", text = "Da drowned city out dere, and everything in it, and maybe da Deeps too. Dey come up out of da water like it all belong to dem, and maybe once it did, but it don't now." } },
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
      lines = { { id = "ou_default", text = "Stubborn, mostly. Karang keep us in line, Je'neu keep da spirits happy, and da rest of us keep our backs to da cliff and our spears pointed at da water." } },
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
    first = "Mitsuwa lost his kinfolk to the Thistlefur furbolgs on the road to Zoram'gar, and the troll charms they carried with them. He talks about the dead as if they had only gone ahead.",
    third = "{name} met Mitsuwa, a Darkspear troll at Zoram'gar Outpost whose kin were killed by the Thistlefur.",
  },

  greetings = {
    { id = "g_hello", text = "You walk soft for a stranger. Dat be good, mon, da dead don't like loud feet." },
    { id = "g_back", when = { metBefore = true }, text = "You come back. Da loa must like you, or dey would have kept you." },
    { id = "g_done", when = { questDone = TODO_QUEST("Troll Charm") },
      text = "Da charms be home now, all of dem. My brothers and sisters smile at me tonight, I think." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. Den you know what dese charms be worth, and why I can't leave dem in a furbolg's den." },
  },

  start = "hello",
  nodes = {
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
        { id = "h_again", text = "What else, mon?" },
        { id = "h_again2", text = "Ask. Talking of dem keep dem close." },
      },
      choices = {
        { text = "Tell me about your kin.", next = "kin" },
        { text = "What are the troll charms?", next = "charms" },
        { text = "Why did the furbolgs attack them?", next = "furbolgs" },
        { text = "Do you want revenge?", next = "revenge" },
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
      lines = { { id = "ch_default", text = "Carved bone and feather and old blood, made by our witch doctors for da spirits' favour. Dey be worth more to us than gold, and to a furbolg dey be shiny things to keep in a box." } },
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
    first = "Muglash is an orc with one ambition left, and it is a hydra. He talks about Vorsha the Lasher the way some orcs talk about the old days, with a kind of terrible longing.",
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
          text = "I've been dreaming of that fight for years, and it was better than the dream. I don't know what I'll do now, honestly, so maybe I'll find another hydra." },
      },
      again = {
        { id = "h_again", text = "What else? Ask fast, I'm itching to go." },
        { id = "h_again2", text = "Go on. Then we go hunting." },
      },
      choices = {
        { text = "Why do you hate this hydra so much?", next = "why" },
        { text = "How do you call up a hydra?", next = "brazier" },
        { text = "Wouldn't it be smarter to leave her be?", next = "leave" },
        { text = "I'll help you kill her.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "She took a boat from Zoram'gar the first season we were here, and my shield-brother was in it. I heard him shouting all the way down, and I swore on the beach that night that she'd die by my hand." } },
      choices = {
        { text = "A blood oath must be kept. I'll stand with you.", next = "BACK", reply = "Then you're Horde in your blood, and I'm glad of you. We'll find her together, and the sea will give my brother back his name.", fx = { align = { honor = 1 } } },
        { text = "Oaths made in grief are foolish. Still, I'll help.", next = "BACK", reply = "Foolish, maybe, but an oath is an oath, and I'll keep it. Glad of your help all the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brazier = {
      lines = { { id = "br_default", text = "The naga worship her, or feed her, I'm not sure which, and they light a brazier on the sand when they want her to come. So we light it for them, and kill whatever naga object, and then she rises." } },
      choices = {
        { text = "That's a plan with a lot of fighting in it.", next = "brazier_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brazier_fight = {
      lines = { { id = "bf_default", text = "That's what makes it a good plan! Bring a friend if you have one, because the naga don't come one at a time and neither do Vorsha's heads." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = { { id = "le_default", text = "Smarter, maybe. But I didn't cross an ocean and fight demons and humans and elves to be smart, I came here to be free, and a free orc chooses his own enemies." } },
      choices = {
        { text = "Then choose her, and I'll follow.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
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
    first = "Locke Okarr keeps Splintertree's supplies moving and takes every lost saw blade personally. He is the sort of orc who keeps lists, and he would rather fight the elves with timber than with grievances.",
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
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "Good arms on you. You could carry a crate of axes without dropping it, which is more than my last runner managed." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your people look at our lumber camp like we're cutting off our own fingers, and I'd rather not argue it today." },
  },

  start = "hello",
  nodes = {
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
        { id = "h_again", text = "What else? Make it quick." },
        { id = "h_again2", text = "Go on. Then go find my supplies." },
      },
      choices = {
        { text = "Why does the Horde need this forest?", next = "need" },
        { text = "How do the elves keep getting at you?", next = "elves" },
        { text = "What happens if the supplies don't arrive?", next = "lost" },
        { text = "The elves were here first. You're stealing their trees.", next = "xstealing" },
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
      lines = { { id = "es_default", text = "The Warsong want to burn half the forest to smoke them out, and Mastok says that would bring every Sentinel in Kalimdor down on us. I just want my wagons to arrive." } },
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
}

---------------------------------------------------------------------------
-- Innkeeper Kaylisk
---------------------------------------------------------------------------
P:NPC {
  key = "kaylisk", id = TODO_NPC("Innkeeper Kaylisk"), name = "Innkeeper Kaylisk", title = "Innkeeper",
  bible = "bibles/horde_outposts.md", role = "innkeeper", tier = "service",
  communities = { "splintertree" }, temper = { "gruff", "warm" }, values = { "practical", "generous" },
  notices = { "weary", "hunger" },

  impression = {
    first = "Innkeeper Kaylisk runs Splintertree's inn like a field kitchen, with a ladle in one hand and an eye on the treeline. She feeds anyone who walks in with the Horde's colours and asks questions afterwards.",
    third = "{name} met Innkeeper Kaylisk, who keeps the inn at Splintertree Post.",
  },

  greetings = {
    { id = "g_hello", text = "In, in, before the elves see the door open. There's stew, and it's hot, and that's the best I can say for it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and walking. Sit, eat, and don't tell me what you killed." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { resting = true },
      text = "You look like you've been sleeping in trees. There's a proper bed upstairs, or near enough." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kaylisk, and this is my inn, for as long as the walls stand. Food, drink and a bed, and I'll keep your hearthstone tied here if you want somewhere to come back to." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Sit down, sit down. You've the Warsong look about you, half asleep and still angry, so eat first and be angry after." },
      },
      again = {
        { id = "h_again", text = "Anything else? The pot won't stir itself." },
        { id = "h_again2", text = "What else can I do for you?" },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "How do you keep an inn in a war?", next = "war" },
        { text = "What's in the stew?", next = "stew" },
        { text = "Thanks, Kaylisk.", next = "END" },
      },
    },
    war = {
      lines = { { id = "wa_default", text = "By keeping the shutters closed and the fire low, and by not asking where the meat came from. We've had arrows through the roof twice this season, and both times I patched it before supper." } },
      choices = {
        { text = "That's the spirit of the Horde.", next = "war_stance" },
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
    stew = {
      lines = { { id = "st_default", text = "Whatever the hunters bring in, and whatever grows near the post that the shamans say won't kill you. Today it's mostly deer, and maybe some of a furbolg's lunch, so don't look too closely." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
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
    first = "Vhulgra keeps Splintertree's wind riders and watches the sky the way a guard watches a road. She flies the wounded out and the messages in, and she trusts the beasts more than most people.",
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
        { id = "h_default", key = true,
          text = "Vhulgra. I keep the wind riders at Splintertree, and they'll carry you anywhere the Horde has a roost. Mind the beak, though, because they bite strangers." },
      },
      again = {
        { id = "h_again", text = "Anything else before you fly?" },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Is it safe to fly over Ashenvale?", next = "safe" },
        { text = "What are wind riders like to keep?", next = "riders" },
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
      choices = { { text = "Something else.", next = "BACK" } },
    },
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
    first = "Qeeju is a troll who keeps Splintertree's stables, unhurried and amused by everything. The beasts in his pens are the calmest things in the whole post.",
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
      },
      again = {
        { id = "h_again", text = "What else, mon?" },
        { id = "h_again2", text = "Ask. Da beasts don't mind." },
      },
      choices = {
        { text = "I'd like to use the stables.", next = "BUSINESS" },
        { text = "How do you keep them so calm?", next = "calm" },
        { text = "Any beasts here worth taming?", next = "tame" },
        { text = "Thanks.", next = "END" },
      },
    },
    calm = {
      lines = { { id = "ca_default", text = "I talk to dem, and I sing a little, and I never let a grunt kick one. Most beasts only want to know who be in charge, and dat it ain't somebody angry." } },
      choices = {
        { text = "A gentle hand is best with any beast.", next = "BACK", reply = "Ya, mon, you know it. Gentle and sure, and dey follow you anywhere.", fx = { align = { light = 1 } } },
        { text = "Some only learn from the whip.", next = "BACK", reply = "Den dey learn to hate you, mon, and a beast dat hate you bite when you sleep. Not in my stable.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tame = {
      lines = { { id = "ta_default", text = "Da forest got fine wolves and bears, and da elves' nightsabers if you be brave or stupid. Dere be a big black cat dat walk da hills to da north, too, but nobody come back from looking for her with all deir parts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
