-- Feralas: Feathermoon Stronghold on Sardor Isle (Alliance) and Camp Mojache (Horde). Voice: bibles/feralas.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "shandris", id = TODO_NPC("Shandris Feathermoon"), name = "Shandris Feathermoon",
  bible = "bibles/feralas.md", role = "soldier", tier = "major",
  communities = { "feathermoon" }, temper = { "intent" }, values = { "loyal", "dutiful", "brave" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_isle", text = "Welcome to Sardor Isle. Keep your bow strung and your eyes on the water; that's all I ask of anyone here." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back across the water, good. Now report." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "WARRIOR" } },
      text = "You carry yourself like someone who's held a line. Feralas will test that, and so will I." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "Sister, or brother, of the kaldorei: the Sentinels can always use another. Think on it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shandris Feathermoon, General of the Sentinels. This stronghold watches over Feralas for the High Priestess. The naga stir along the coast, and the ogres in the hills; we watch them both." },
        { id = "h_tyrande", when = { heardLine = "tyrande.h_default" },
          text = "You've stood before the High Priestess, so you know why I serve as I do. She found me when I had no one, and I've never left her side since." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Elune's light on the water. The naga hate it, and that's reason enough for me to love it." },
      },
      again = { { id = "h_again", text = "Report, or ask; either is useful." }, { id = "h_again2", text = "What else?" } },
      choices = {
        { text = "What troubles Feralas?", next = "troubles" },
        { text = "The stronghold carries your name.", next = "name" },
        { text = "How did you come to serve the High Priestess?", next = "tyrande" },
        { text = "Who keeps the watch when you sleep?", next = "watch" },
        { text = "Test my aim, General.", next = "archery", when = { class = { "HUNTER", "WARRIOR" } } },
        { text = "I'd stand with the Sentinels.", next = "sentinels", when = { race = "NightElf" } },
        { text = "A human paladin sells leather here. Odd company for Sentinels.", next = "pratt", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Elune and the Light. Are they so different?", next = "priest_elune", when = { class = "PRIEST" } },
        { text = "Elune guide your arrows.", next = "END", fx = { affinity = 1, standing = { feathermoon = 1 } } },
      },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", text = "Hatecrest naga in the ruins of Solarsal, more of them each month. A hive of insects that has no business being in Feralas; I've sent word to Gracina Spiritmight in Darnassus. And ogres, always ogres." },
      },
      choices = {
        { text = "The naga first.", next = "troubles_naga" },
        { text = "Tell me about the hive.", next = "troubles_hive" },
        { text = "Send me where I'm needed.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, standing = { feathermoon = 1 } } },
      },
    },
    troubles_naga = {
      lines = { { id = "tn_default", text = "They crawl out of the sea into the old ruins and call them theirs. Solarsal was ours long before the water rose. I don't intend to let them keep it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troubles_hive = {
      lines = { { id = "th_default", text = "Insects the size of sabercats, building where nothing like them has built before. Gracina will know what they are. I'd rather she didn't have to." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    name = {
      lines = { { id = "n_default", text = "The sisters named it. I didn't argue; it's hard to argue with an entire island's worth of Sentinels. I'd have called it something less vain." } },
      choices = {
        { text = "Like what?", next = "name_like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_like = {
      lines = { { id = "nl_default", text = "The Watch, or the Rock, or anything that sounds like it does its job and doesn't need thanking." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tyrande = {
      big = true,
      lines = { { id = "ty_default", text = "She found me alone, a child with no one left, and she took me in. Everything I am, she began. Everything I do, I do so she never has to regret it." } },
      choices = {
        { text = "She must be proud of you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "That's a heavy debt to carry.", next = "tyrande_debt" },
      },
    },
    tyrande_debt = {
      lines = { { id = "td_default", text = "It isn't a debt, because debts get paid off. This is a vow, and vows don't end." } },
      choices = {
        { text = "A vow like that deserves respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Even vows can be broken when they stop making sense.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Latronicus Moonspear, my second. He sleeps less than I do and complains about it more. The island has never once been unwatched." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    archery = {
      lines = { { id = "a_default", text = "That post, past the dock, and the knot in the middle of it. One arrow, and don't hurry; I can tell when someone hurries." } },
      choices = {
        { text = "I take my time and loose.", next = "archery_hit", fx = { trait = { cautious = 1 } } },
        { text = "I loose at once.", next = "archery_miss", fx = { trait = { brave = 1 } } },
      },
    },
    archery_hit = {
      lines = { { id = "ah_default", text = "Good. Not perfect, but good. You'd be welcome on the night watch, if you ever tire of wandering." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { feathermoon = 1 } } } },
    },
    archery_miss = {
      lines = { { id = "am_default", text = "Fast and wide, and Feralas forgives neither. Try again next time you're here, and slower." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sentinels = {
      lines = { { id = "s_default", text = "Then come back when you're ready to stand a watch and not just a fight. They're different things, and most learn that late." } },
      choices = {
        { text = "I'll be ready.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Standing watch isn't for me, so I'll stick to the fighting.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    pratt = {
      lines = { { id = "p_default", text = "He mends our leather better than any of us can, and he's never once asked to be thanked. On this island, that makes him kaldorei enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest_elune = {
      lines = { { id = "pe_default", text = "My priestesses would say yes, and argue for a week. I've seen both close the same wound on the same Sentinel. I don't argue with what works." } },
      choices = {
        { text = "Nor do I.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Prayer doesn't close wounds; skill does.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "The High Priestess raised me and the Sentinels taught me, and Feralas is where I keep the promise I made to both.", next = "tyrande" } },
    advice = { { id = "tp_ad", text = "Keep the water at your back only if you can see what's in it. Here, you can't." } },
    cenarion_circle = { { id = "tp_circle", text = "The druids heal the land, and we keep it whole long enough for them to finish. It's a fair arrangement." } },
    _none = { { id = "tp_none", text = "That's not a matter for the Sentinels. Ask in Darnassus." } },
  },
}

P:NPC {
  key = "pratt", id = TODO_NPC("Pratt McGrubben"), name = "Pratt McGrubben",
  bible = "bibles/feralas.md", role = "vendor", tier = "quest",
  communities = { "feathermoon" }, temper = { "genial" }, values = { "kind", "practical" },
  notices = { "craft", "class" },

  greetings = {
    { id = "g_shop", text = "Well met! Leather, repairs, or a kind word: which can I do for you?" },
  },

  notice = {
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker! Then I've a pattern or two you'll want to earn. Bring me proof of good work and we'll see." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, out here! I swung a hammer for the Light longer than I care to count, and now I swing a needle. The Light doesn't seem to mind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Pratt McGrubben, mostly retired from paladin work and fully employed in leather. I patch whatever the Sentinels bring back torn." },
        { id = "h_quality", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Mark of Quality") }, { questActive = TODO_QUEST("Improved Quality") } } },
          text = "Show me the hides, and I'll show you how to make something a Sentinel would be proud to wear. Quality takes patience, and I've got plenty of that now." },
      },
      again = { { id = "h_again", text = "Anything else, friend? I'll keep stitching while you think." } },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Why did you retire?", next = "retire" },
        { text = "A human, among the Sentinels?", next = "human" },
        { text = "Teach me something about leather.", next = "leather", when = { profession = "Leatherworking" } },
        { text = "Does the Light answer a leatherworker?", next = "light", when = { class = "PALADIN" } },
        { text = "Just browsing.", next = "END" },
      },
    },
    retire = {
      lines = { { id = "r_default", text = "Mostly. The Light still answers when I call; I just call less often. Don't let the needle fool you." } },
      choices = {
        { text = "What made you stop?", next = "retire_why" },
        { text = "Ha. Noted.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    retire_why = {
      lines = { { id = "rw_default", text = "Knees, mostly, and a feeling that there were enough young paladins and not enough people who could fix their boots." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    human = {
      lines = { { id = "h2_default", text = "They tolerated me, then they trusted me, and now they argue with me about stitching. That's as close to family as the kaldorei get with a human." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leather = {
      lines = { { id = "l_default", text = "Stretch it wet, cut it dry, and never rush the edge. Everything that tears, tears at the edge first." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
    light = {
      lines = { { id = "li_default", text = "Every morning. It doesn't care what you're holding, hammer or needle; it cares what you do with it." } },
      choices = {
        { text = "Then I'll try to do right with mine.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I've no use for the Light, morning or night.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Paladin, then leatherworker, then the only human on an island full of Sentinels. Each step was a smaller hammer.", next = "human" } },
    advice = { { id = "tp_ad", text = "Oil your straps. A buckle that snaps in a fight has killed more of us than any ogre." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask the General; she knows everything on this island." } },
  },
}

P:NPC {
  key = "shyria", id = TODO_NPC("Innkeeper Shyria"), name = "Innkeeper Shyria",
  bible = "bibles/feralas.md", role = "innkeeper", tier = "service",
  communities = { "feathermoon" }, temper = { "gentle" }, values = { "kind", "generous" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Come in from the rain. Feralas is always wet; at least here it's warm and wet." },
    { id = "g_home", when = { homeInn = { "Feathermoon Stronghold" } }, text = "You've returned to the island. Your bed is ready, and the tea is fresh." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've come back from somewhere grey and far away. Sit; the Sentinels can spare you for an evening." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Shyria. The Sentinels sleep in shifts, and every shift passes through my door. You're welcome among them." },
        { id = "h_jonespyre", when = { questActive = TODO_QUEST("Jonespyre's Request") },
          text = "Quantas Jonespyre has a request, so go and hear him out; he'll explain." },
        { id = "h_shift", when = { metBefore = true }, text = "The night shift came in soaked and laughing, because some ogre fell in the sea chasing them. Elune forgive me, I laughed too." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The Sentinels change watch at this hour. Listen: no words, only the bows being passed, because they've done it so long they don't need words." },
      },
      again = { { id = "h_again", text = "Anything else? The kettle's on." } },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "What do the Sentinels talk about here?", next = "talk" },
        { text = "Is the rain ever going to stop?", next = "rain" },
        { text = "Thank you.", next = "END" },
      },
    },
    talk = {
      lines = { { id = "t_default", text = "Naga, ogres, and whose turn it is to sweep. The last one causes the most arguments." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rain = {
      lines = { { id = "r_default", text = "Once, for an afternoon, long ago, and the whole island came out to look at the sky. Then it started again, and we all felt better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've kept this inn as long as the Sentinels have kept this island. Neither of us has thought of leaving." } },
    advice = { { id = "tp_ad", text = "Dry your bowstring before you sleep. The damp here warps everything but a Sentinel's patience." } },
    _none = { { id = "tp_none", text = "I keep the inn, and the General keeps the rest." } },
  },
}

-- Camp Mojache: the tauren camp in eastern Feralas.
P:NPC {
  key = "rokorhan", id = TODO_NPC("Rok Orhan"), name = "Rok Orhan",
  bible = "bibles/feralas.md", role = "soldier", tier = "major",
  communities = { "mojache" }, temper = { "fierce" }, values = { "loyal", "stern" },
  notices = { "class", "kit" },

  greetings = {
    { id = "g_camp", text = "You want to help the Horde in Feralas? Good, then kill ogres; that's how." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, good. The Gordunni are big and stupid, so hit them where it hurts, and that's everywhere if you hit hard enough." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ogre clubs do that. Get mended and go back; they don't stop, so we don't either." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rok Orhan. Belgrom Rockmaul sent me to break the Gordunni ogres of Feralas, and they're many, and foul, and nearly broken." },
        { id = "h_threat", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("A Threat in Feralas") }, { questActive = TODO_QUEST("The Ogres of Feralas") } } },
          text = "The Gordunni hold the hills north of camp, so thin them. Every ogre you drop is one fewer club at our gate." },
        { id = "h_belgrom", when = { questActive = TODO_QUEST("A Threat in Feralas") },
          text = "So Belgrom sent you, and that means your nerve is already proven. Let me tell you how things stand, and then you can decide if you're up to it." },
        { id = "h_ceremony", when = { questActive = TODO_QUEST("Dark Ceremony") },
          text = "Their shamans are at some ritual, dark work. Stop it before it finishes." },
        { id = "h_scroll", when = { any = { { questActive = TODO_QUEST("The Gordunni Scroll") }, { questActive = TODO_QUEST("The Gordunni Orb") } } },
          text = "The ogres are carrying scrolls and orbs, so bring them here. I want to know what an ogre's doing with writing." },
        { id = "h_proven", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Ogres of Feralas"), days = 3 } },
          text = "You came back, and the Gordunni outpost is quieter for it. In time the land will heal, as long as we don't give up on it." },
      },
      again = {
        { id = "h_again", text = "What else? Ogres don't wait for talk." },
        { id = "h_again2", text = "Ask it, then go hit something." },
      },
      choices = {
        { text = "Who are the Gordunni?", next = "gordunni" },
        { text = "Why did Belgrom send you?", next = "belgrom" },
        { text = "What's this dark ceremony?", next = "ceremony" },
        { text = "An orc in a tauren camp?", next = "camp" },
        { text = "Warrior to warrior: how do you fight an ogre?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "This is my people's camp.", next = "tauren", when = { race = "Tauren" } },
        { text = "I could read that orb for you.", next = "mage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "My people once lived in these hills.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "I'll fight.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { mojache = 1 } } },
      },
    },

    gordunni = {
      lines = {
        { id = "go_default", text = "The strongest fighting force in Feralas, and they grow every season. Their outpost sits up the river to the north, and they'll push past it into everything we hold if we let them." },
      },
      choices = {
        { text = "They're just ogres.", next = "gordunni_mages", fx = { trait = { brave = 1 } } },
        { text = "What have they done to the land?", next = "gordunni_scar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gordunni_mages = {
      lines = {
        { id = "gm_default", text = "So I thought, until I met their ogre-magi, and their shamans, and their warlocks. Ogres with spells are ogres with ideas, and I don't like ogres with ideas." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gordunni_scar = {
      lines = {
        { id = "gs_default", text = "Look around and you'll see it; their very presence scars this place. In the High Wilderness to the southwest they camp in old night elf ruins, among withered trees and fouled ground, and nothing grows where they've been." },
      },
      choices = {
        { text = "Can it heal?", next = "gordunni_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gordunni_heal = {
      lines = {
        { id = "gh_default", text = "In time, if we push them back and keep them back. I'm a warrior, not a druid, but I know that a wound closes once you stop opening it." },
      },
      choices = {
        { text = "Then I'll help keep that wound closed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to burn the Gordunni out than wait for anything to heal.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    belgrom = {
      lines = {
        { id = "b_default", text = "Because I don't stop. Belgrom Rockmaul in Orgrimmar knows I'll still be hitting ogres when the rest have gone home, so he sends me the bold ones to help." },
      },
      choices = {
        { text = "Do you ever stop?", next = "belgrom_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    belgrom_rest = {
      lines = {
        { id = "br_default", text = "When the Gordunni do. Until then I sleep with my axe and eat standing up, and Greul scolds me for both." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ceremony = {
      lines = {
        { id = "c_default", text = "Somebody found a filthy scroll at their outpost, plans for a meeting or a rite of some kind, run by their mage-lords. Whatever they're calling up, I want it stopped before it comes." },
      },
      choices = {
        { text = "And the orbs they carry?", next = "ceremony_orb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ceremony_orb = {
      lines = {
        { id = "co_default", text = "A mage-lord's orb holds a great deal of power, and I know my enemy well, but I can't tell you what it does. There's a mage in Orgrimmar, Uthel'nay, in the Darkbriar Lodge, who can." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    camp = {
      lines = {
        { id = "ca_default", text = "The tauren of Mojache are the reason the ogres haven't taken all of Feralas already. Their braves guard travelers on the roads, and I guard the braves from whatever's too big for them." },
      },
      choices = {
        { text = "Do they mind an orc giving orders?", next = "camp_orders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_orders = {
      lines = {
        { id = "cor_default", text = "I don't give them orders; I give ogres orders, mostly to fall down. The tauren decide their own business, and they've been kind to a loud orc who forgets to wipe her boots." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    warrior = {
      lines = {
        { id = "wa_default", text = "Low and fast. An ogre swings high and slow, so get under the club and take its knees, and it can't reach you once it's down." },
      },
      choices = { { text = "Knees first. Got it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    tauren = {
      lines = {
        { id = "t_default", text = "It is, and I'm a guest in it, so don't think I forget. Your people have held this ground against the Gordunni longer than I've been here, and I fight beside them because they've earned it." },
      },
      choices = { { text = "Then fight on, guest.", next = "BACK", fx = { affinity = 2, standing = { mojache = 1 } } } },
    },
    mage = {
      lines = {
        { id = "m_default", text = "Maybe you could, but it's dangerous, and I'd rather a master looked at it far from my camp. Bring the orbs to me and let Uthel'nay take the risk; that's what Orgrimmar feeds him for." },
      },
      choices = { { text = "Fair enough.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    skyborne = {
      lines = {
        { id = "sk_default", text = "Then you've come back to find ogres squatting in every ruin from here to the coast. I can't give you your hills back today, but I can give you something to hit while you wait." },
      },
      choices = { { text = "That'll do.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "Tauren trouble. The tauren here watch for them, and I watch for ogres." } },
    background = { { id = "tp_ba", text = "A warrior of the Horde, sent from Orgrimmar to break ogres. There's no more to it, and I like it that way.", next = "belgrom" } },
    advice = { { id = "tp_ad", text = "Never fight a Gordunni on a slope where it's above you. Ogres fall downhill, and they don't care who's underneath." } },
    _none = { { id = "tp_none", text = "I don't know, but if it's an ogre, I'll learn." } },
  },
}

P:NPC {
  key = "orwin", id = TODO_NPC("Orwin Gizzmick"), name = "Orwin Gizzmick",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  communities = { "mojache" }, temper = { "eager" }, values = { "curious", "ambitious" },
  notices = { "craft" },

  greetings = {
    { id = "g_ore", text = "You look like someone who can carry rocks: valuable rocks, mysterious rocks!" },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = { "Mining", "Engineering" } },
      text = "A miner! Have you ever seen Gordunni cobalt? Nobody has, well, except the ogres, and that's the problem." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Orwin Gizzmick, here on Orgrimmar's business and a bit of my own. The ogres guard an ore up north nobody understands, and I'd like to understand it. Then sell it." },
        { id = "h_cobalt", tags = { "news" }, when = { questActive = TODO_QUEST("Gordunni Cobalt") },
          text = "Gordunni cobalt, from their compound. They guard it jealously, which is how you know it's worth something." },
        { id = "h_cobalt_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gordunni Cobalt"), days = 3 } },
          text = "Twelve samples, all glowing, all mine! Somewhere out there is a buyer who'll pay a pretty penny for these, and I mean to find them before the glow wears off." },
        { id = "h_rocks", when = { metBefore = true }, text = "I've got a sack of rocks under my bed that might be worth a fortune, or might be rocks. Science is mostly waiting to find out." },
      },
      again = {
        { id = "h_again", text = "More questions? Ask fast, my friend; time is money, and so is cobalt." },
      },
      choices = {
        { text = "What is Gordunni cobalt?", next = "cobalt" },
        { text = "Who are you going to sell it to?", next = "sell" },
        { text = "Why come all the way to Feralas?", next = "why" },
        { text = "I mine. What should I know about it?", next = "miner", when = { profession = "Mining" } },
        { text = "This is tauren land, goblin.", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll get you some.", next = "END", fx = { affinity = 1 } },
      },
    },

    cobalt = {
      lines = {
        { id = "c_default", text = "Some kind of mineral the Gordunni dig up near their outpost, and it glows blue, which is never nothing. The trouble is they don't leave it lying around; they bury it again." },
      },
      choices = {
        { text = "Why would ogres bury it?", next = "cobalt_bury" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cobalt_bury = {
      lines = {
        { id = "cb_default", text = "To keep it away from folks like me, obviously, which only proves it's valuable. I'll lend you my shovel; look for the blue glow at the outpost north of here and start digging." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    sell = {
      lines = {
        { id = "s_default", text = "Whoever pays, my friend, whoever pays! I'll take it along on my travels, and somewhere between here and the sea there's always someone with more gold than sense." },
      },
      choices = {
        { text = "And if it's worthless?", next = "sell_worthless" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sell_worthless = {
      lines = {
        { id = "sw_default", text = "Then it's worthless blue rocks that glow, which is still a very good story to sell with them. A goblin never carries anything he can't sell one way or another." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    why = {
      lines = {
        { id = "w_default", text = "I just got here, and I heard the ogres have interesting minerals in their hills, so here I am. Feralas is wet, and loud, and everything wants to bite me, but nobody else is digging, and that's my favorite kind of market." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    miner = {
      lines = {
        { id = "mi_default", text = "That a rock that glows and a rock that's buried are two different kinds of valuable, and one that does both is a treasure. Bring me cobalt, and keep a piece for yourself; I won't count too carefully." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    tauren = {
      lines = {
        { id = "t_default", text = "And very fine land it is, with very generous hosts, and I'm only digging in the ogres' corner of it! Nobody here's going to miss a few rocks from the Gordunni." },
      },
      choices = { { text = "See that nobody does.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A goblin with a shovel, a sack and a nose for things that glow. That's the whole of the story, and the rest is profit." } },
    advice = { { id = "tp_ad", text = "Always dig where somebody else has been guarding. Nobody guards dirt." } },
    _none = { { id = "tp_none", text = "If it's not a rock, it's not my business." } },
  },
}

P:NPC {
  key = "greul", id = TODO_NPC("Innkeeper Greul"), name = "Innkeeper Greul",
  bible = "bibles/feralas.md", role = "innkeeper", tier = "service",
  communities = { "mojache" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Come in, come in! Feralas is wide and wet and full of teeth, but in here, it's just warm." },
    { id = "g_home", when = { homeInn = { "Camp Mojache" } }, text = "Welcome home to Mojache. The hides are dry and the kettle's on." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look worn thin as old hide. Sit; nothing in Feralas can reach you for an hour." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Greul. Braves, hunters, traders, all of them pass my fire, and while Mojache keeps travelers safe, I keep them fed." },
        { id = "h_rain", when = { metBefore = true }, text = "Rain again; it always rains in Feralas. The ogres hate it, and that's the only thing I like about it." },
      },
      again = { { id = "h_again", text = "Something more? Sit a while longer; the rain isn't going anywhere." } },
      choices = {
        { text = "Tell me about Mojache.", next = "camp" },
        { text = "Who's the loud orc by the gate?", next = "rok" },
        { text = "Do you miss Mulgore?", next = "mulgore", when = { race = "Tauren" } },
        { text = "Just a rest, thank you.", next = "END" },
      },
    },
    camp = {
      lines = {
        { id = "c_default", text = "We sit above Wildwind Lake, where the stream runs through the middle of camp, and our hides are the thickest you'll find in Kalimdor. Our braves walk the roads so travelers reach us in one piece." },
      },
      choices = {
        { text = "Who do the braves guard against?", next = "camp_braves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_braves = {
      lines = {
        { id = "cb_default", text = "Ogres from the north, gnolls from the west, and whatever's hungry in between. Feralas has more teeth than it has trees, and it has a great many trees." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rok = {
      lines = {
        { id = "r_default", text = "Rok Orhan, and she's loud because the ogres are loud, I think. She eats standing up and sleeps with her axe, and she won't take a seat at my fire no matter how often I offer." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mulgore = {
      lines = {
        { id = "m_default", text = "The open grass, yes, and the sky with nothing in it. But the Earth Mother is under this wet ground too, so I put my hand on it in the morning, and she's still there." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep the fire at Mojache. Every tauren camp needs one, and this one is mine." } },
    advice = { { id = "tp_ad", text = "Rub your hides with fat before you go into the rain. The braves laugh at it, and then they borrow my pot." } },
    _none = { { id = "tp_none", text = "I keep the fire, and Rok Orhan keeps the ogres away, so ask her." } },
  },
}
