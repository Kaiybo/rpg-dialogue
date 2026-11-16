-- Dun Morogh: Forever's camping adventurer on the road near Kharanos. Voice: bibles/dunmorogh.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eric", id = TODO_NPC("Eric Brighthammer"), name = "Eric Brighthammer",
  bible = "bibles/dunmorogh.md", role = "questgiver", tier = "quest",
  communities = { "kharanos" }, temper = { "hearty" }, values = { "friendly", "practical" },
  notices = { "craft", "weary" },

  impression = {
    first = "Eric Brighthammer has slept under more stars than roofs and plainly prefers it that way. He waved me to his fire like we'd known each other for years.",
    third = "{name} warmed up at Eric Brighthammer's fire in Dun Morogh, where he teaches anyone who asks how to sleep out in the cold.",
  },

  greetings = {
    { id = "g_fire", text = "Ho there! Come and warm your hands; it's cold enough up here to freeze a greeting halfway out." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the fire! Sit yourself down, because snow's coming, and good company's better than a second blanket." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you can build a proper campfire, and up in these hills that's the difference between a camp and a grave." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look chilled through, and not from the snow. Sit by the fire a while; nothing helps quite like it." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, by a Frostmane scout who took my boots and left his own, which were worse. I've learned to sleep with one eye on the treeline, and I'd guess you never sleep any other way." } },
      choices = {
        { text = "I'd never rob a fellow camper. The road's hard enough.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A camp left unwatched is an invitation, Eric. Lesson learned.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because one day you won't be here, and I'll be up a mountain with damp flint and no idea how to manage. I'll take the spark tonight, gladly, but I'd sooner learn the hard way than lean on magic I can't carry." } },
      choices = {
        { text = "That's wise. A traveller should rely on their own hands.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic is a tool like any other. Use what works.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Eric Brighthammer. I've slept under more stars than roofs, and I'll teach anyone who asks how to do it without freezing." },
        { id = "h_adventurer", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "Somebody sent you my way? Good, because a new face at the fire is the best news in Dun Morogh." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit close to the fire and stay sat, and you'll feel the rest settle into you. Then come and tell me about it." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest at my fire, good! Out here a prayer for strength is worth a blanket, and two blankets after dark." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You move like someone who's slept in a few hedges they weren't invited into. Pull up a rock by the fire, though I'll keep my pack on my side of it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and just in time, because my flint's gone damp and the fire's sulking. I don't suppose you'd mind?" },
      },
      again = {
        { id = "h_again", text = "More questions? Good, because questions keep you warm." },
        { id = "h_again2", text = "Sit a while longer. The fire's going nowhere, and neither am I." },
      },
      choices = {
        { text = "Why camp in the snow?", next = "why" },
        { text = "How do I make a camp?", next = "camp" },
        { text = "Who stops at your fire?", next = "visitors" },
        { text = "Is it safe out here?", next = "safe" },
        { text = "I work leather. What can I add?", next = "tent", when = { profession = "Leatherworking" } },
        { text = "I've tracked bears through worse snow than this.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "Have you ever had your camp robbed out here?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why not let a mage light every fire for you?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Stay warm.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the mountains are too big to see from an inn. And anyone coming down the road can sit at your fire, which is half the fun of it." } },
      choices = {
        { text = "Teach me.", next = "camp", fx = { affinity = 2, learn = { "camping" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "cp_default", text = "A fire comes first, and a cook can teach you that. Then every trade adds something, a tent from a leatherworker or a rack from a fisher, and if you sit by it long enough you'll rise stronger." },
      },
      choices = {
        { text = "And then?", next = "camp_rest" },
        { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
    camp_rest = {
      lines = {
        { id = "cr_default", text = "Then you rest, properly, with your boots off. Most adventurers never learn that part, and they're always tired and always cross." },
      },
      choices = {
        { text = "I'll take my boots off.", next = "BACK", fx = { affinity = 1, learn = { "camping" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    visitors = {
      lines = {
        { id = "vi_default", text = "Mountaineers off patrol, and gnomes on their way to Steelgrill's Depot. There's a hunter out of Kharanos, too, who never gives his name and always eats my beans." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    safe = {
      lines = {
        { id = "sa_default", text = "It's safer than the hills. The Frostmane keep to Shimmer Ridge, mostly, and wolves don't like a good fire, though troggs don't care either way." },
      },
      choices = {
        { text = "Mostly?", next = "safe_mostly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_mostly = {
      lines = {
        { id = "sm_default", text = "Mostly. Kharanos had a troll at the door once, and they still toast the gnome who saw it off; ask Belm at the Thunderbrew." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tent = {
      lines = {
        { id = "te_default", text = "Tents! Then everyone at your fire will sleep better than they deserve. Mind the stakes, though, because the ground here is mostly ice." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "camping" } } } },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "I believe it; you've the look of someone who sleeps with one eye on the treeline. Then you can tell me something, because I've been out here years: why do the bears keep coming down past Kharanos this winter?" },
        { id = "xhu_bear", when = { origin = "dwarf_bear_tracker" },
          text = "You're one of the high-snow trackers, then, and I'll bow to you on that, because I only camp, I don't chase. Tell me, why are the bears coming down past Kharanos this winter?" },
      },
      choices = {
        { text = "The troggs are driving them out of the hills.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Hungry. Leave out no food and they'll leave you be.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I've slept under more stars than roofs, and that's about all there is to tell, though it's a good deal." } },
    advice = { { id = "tp_ad", text = "Pitch your tent upwind of the fire, unless you like your bedding smoked." } },
    camping = { { id = "tp_camping", text = "A fire first, and cooks can make one, then each trade adds its piece. A good camp is a little town for the night.", next = "camp" } },
    frostmane = { { id = "tp_frostmane", text = "They're up on Shimmer Ridge, mostly. Don't camp near the ridge, and don't camp near anyone who does." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask at the Thunderbrew; somebody there knows everything, and the rest is made up." } },
  },
}

-- Coldridge Valley: where young dwarves and gnomes start, below the troll caves.
P:NPC {
  key = "sten", id = TODO_NPC("Sten Stoutarm"), name = "Sten Stoutarm",
  bible = "bibles/dunmorogh.md", role = "questgiver", tier = "quest",
  communities = { "coldridge" }, temper = { "gruff" }, values = { "practical", "friendly" },
  notices = { "greenness", "race" },

  impression = {
    first = "Sten Stoutarm runs Anvilmar's post and complains that all he ever gets is green recruits. He gave me work anyway, and I think that was a compliment.",
    third = "{name} met Sten Stoutarm, who runs the post at Anvilmar and is always short of sturdy help.",
  },

  greetings = {
    { id = "g_post", text = "Ye look sturdy enough, which is good, for I need sturdy, an' all I ever get is green." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, an' I don't suppose ye've any mail fer me? No? Then I've some fer ye." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 2 },
      text = "Fresh as new snow, ye are. Ye'll want gloves, so bring me some wolf meat an' they're yers." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Ye'll be one o' the lucky ones out o' Gnomeregan, then. Welcome to the cold; ye'll get used to it, probably." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not many, for most young mages go straight tae the Hall o' Mysteries in the city. The ones who do come through want tae fight the Frostmane wi' fire, an' I tell them the trolls have their own shamans who'll answer in kind." } },
      choices = {
        { text = "Then I'll fight beside the recruits and keep them safe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The recruits can learn by watching me burn the trolls out.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It's for a gnome warlock who came through last month, an' I'm fairly sure it's no' a letter at all. Most folk in Coldridge have heard tales o' what warlocks did in the war, so ye'll find them slow tae trust ye." } },
      choices = {
        { text = "I'll earn their trust slowly. That's only fair.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them keep their tales. I've work to do.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sten Stoutarm. I run the post fer Anvilmar, such as it is, an' letters come through the pass along wi' the troggs. I prefer the letters." },
        { id = "h_outfit", tags = { "news" }, when = { questActive = TODO_QUEST("Dwarven Outfitters") },
          text = "Wolf meat, from the valley's wolves. Bring me a stack an' I'll see ye properly outfitted, an' that's a fair trade." },
        { id = "h_mail", when = { questActive = TODO_QUEST("Coldridge Valley Mail Delivery") },
          text = "This mail's fer Talin Keeneye, out by the frozen lake. Mind the troggs on the way, for they don't read." },
        { id = "h_rune", when = { class = "PRIEST", maxLevel = 5 },
          text = "This came fer ye while ye were out: a rune, from Branstock Khalder inside Anvilmar. It's priest business, so go an' see him." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at Anvilmar! The recruits will gawp at ye, so if ye could do it somewhere other than the post, I'd be grateful." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "There's a letter in my bag that's been coughin' smoke since ye walked up, an' I'll thank ye tae step back from the post." },
      },
      again = {
        { id = "h_again", text = "What else? There's mail waitin'." },
        { id = "h_again2", text = "Go on, then; the troggs'll keep." },
      },
      choices = {
        { text = "What about the troggs?", next = "troggs" },
        { text = "Where does the mail come from?", next = "mail" },
        { text = "Gloves, for wolf meat?", next = "gloves" },
        { text = "A rune for me?", next = "rune", when = { class = "PRIEST", maxLevel = 6 } },
        { text = "Anything for a dwarf who hears the elements?", next = "archaic", when = { race = "Dwarf", class = "SHAMAN" } },
        { text = "Do many gnomes come through the valley?", next = "k_gnome", when = { race = "Gnome" } },
        { text = "Do the Coldridge recruits not see many mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why would a letter cough smoke near me?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'll get to it.", next = "END" },
      },
    },
    troggs = {
      lines = { { id = "t_default", text = "Ugly, stupid, an' too many of 'em, an' that's all there is to know. Once ye've seen one, ye've seen the lot." } },
      choices = {
        { text = "Where do they come from?", next = "troggs_pass" },
        { text = "Ha.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    troggs_pass = {
      lines = {
        { id = "tp2_default", text = "Through Coldridge Pass, mostly, an' the tunnel's thick wi' 'em. Thalos keeps the near end, an' he won't let the green ones through without a reason." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mail = {
      lines = {
        { id = "ma_default", text = "Through the pass, when the troggs allow it. Most of it's fer Talin by the lake, an' half o' Talin's is fer Grelin, for I'm a postman, no' a miracle worker." },
      },
      choices = {
        { text = "Who's Talin?", next = "mail_talin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mail_talin = {
      lines = {
        { id = "mt_default", text = "He's a hunter who loves boars, an' hates that there's so many he cannae enjoy huntin' 'em any more. A strange man, but a good shot." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gloves = {
      lines = {
        { id = "gl_default", text = "The cold up here takes fingers. Ye bring me wolf meat an' I make sure ye keep yers; it's a fair trade, an' the wolves don't get a vote." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    rune = {
      lines = {
        { id = "ru_default", text = "Aye, it came through wi' the mail, from Branstock, the priest inside Anvilmar. Read it, then go an' see him, an' don't let him tell ye jokes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    archaic = {
      lines = {
        { id = "ar_default", text = "Aye, an old-lookin' rune came in this mornin'. Teo Hammerstorm wants ye in Anvilmar, somethin' about the elements, an' I deliver it, I dinnae read it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    k_gnome = {
      lines = {
        { id = "xgn_default", text = "More every season, since yer city went bad, an' every one o' them shivers worse than the last. Ye'll get used tae the cold or ye'll get used tae complainin' about it, an' either'll see ye through tae Kharanos." },
      },
      choices = {
        { text = "I'll get used to the cold.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'll complain, thank you.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I carry the mail, an' that's the story. It's a short one, an' it's mostly cold." } },
    advice = { { id = "tp_ad", text = "Gloves. I'll say it again, an' I'll keep sayin' it: gloves." } },
    troggs = { { id = "tp_troggs", text = "Once ye've seen one trogg, ye've seen 'em all, an' I've seen 'em all.", next = "troggs" } },
    _none = { { id = "tp_none", text = "Couldnae tell ye. Ask Grelin; he's from the Senate, so he's meant to know things." } },
  },
}

P:NPC {
  key = "grelin", id = TODO_NPC("Grelin Whitebeard"), name = "Grelin Whitebeard",
  bible = "bibles/dunmorogh.md", role = "noble", tier = "quest",
  communities = { "coldridge" }, temper = { "determined" }, values = { "loyal", "dutiful" },
  notices = { "kit" },

  impression = {
    first = "Grelin Whitebeard feels trouble in his beard and blames most of it on his apprentice. Under the grumbling he's a careful envoy, and loyal to the King down to the bone.",
    third = "{name} met Grelin Whitebeard, the Senate's envoy sent to learn what the Frostmane trolls are planning.",
  },

  greetings = {
    { id = "g_camp", text = "The trolls are up to something, friend. I can feel it in my beard." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. Better you than my apprentice, though anyone's better than my apprentice." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Frostmane gave ye a hiding. Sit by the fire an' let the camp mend ye." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Who leads them, how many there are, an' whether they're plannin' tae come down from the caves. A scout who brings me a count is worth ten who bring me ears, though I'll no' say no tae the ears either." } },
      choices = {
        { text = "I'll bring you an honest count, Envoy, and nothing invented.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll bring you whatever the Senate wants to hear.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Dangerous enough that I report them tae the Senate by name, an' that's no' somethin' I do lightly. They've a feel for the cold that I'd swear comes from the mountain itself, an' a mage wi' a good fire might change the odds." } },
      choices = {
        { text = "I'll drive them back, but only as far as I must.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fire will settle the valley's troll problem for good.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grelin Whitebeard, special envoy of the Senate. They sent me to learn what the Frostmane trolls are up to, an' I'll not let the King down." },
        { id = "h_cave", tags = { "news" }, when = { questActive = TODO_QUEST("The Troll Cave") },
          text = "The trolls keep to the caves in the south of the valley. Thin their numbers for me, for I want to know how many there are." },
        { id = "h_journal", when = { questActive = TODO_QUEST("The Stolen Journal") },
          text = "One o' the trolls, a hulking thing with painted skin, walked into my camp while I was away an' took my journal. Get it back, for everything I've learned is in it." },
        { id = "h_senir", when = { questActive = TODO_QUEST("Senir's Observations") },
          text = "Take my notes to my brother Senir in Kharanos. He'll know what to make of them." },
        { id = "h_journal_back", when = { questDone = TODO_QUEST("The Stolen Journal") },
          text = "My journal, back where it belongs, an' the trolls well in hand. I'll finish the report tonight, if my fingers thaw." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "The Senate could use someone who can creep up on a Frostmane camp wi'out the whole valley hearin'. Ye've the look o' one." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage would be handy against the Frostmane, for their shamans throw ice like snowballs an' I'm tired o' ducking." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? Quickly, before the cold gets into my ink." },
        { id = "h_again2", text = "Aye, what is it, then? I'm listenin'." },
      },
      choices = {
        { text = "Who's your apprentice?", next = "apprentice" },
        { text = "What are the trolls up to?", next = "trolls" },
        { text = "Who sent you out here?", next = "sent" },
        { text = "Who's the gnome by your fire?", next = "felix" },
        { text = "I can read the trolls' tracks for you.", next = "k_hunter", when = { class = "HUNTER" } },
        { text = "What would you want a quiet scout to learn?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Are the Frostmane shamans truly dangerous?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'll deal with the trolls.", next = "END", fx = { affinity = 2, standing = { coldridge = 1 } } },
      },
    },
    apprentice = {
      lines = { { id = "a_default", text = "Soren. He's a good lad an' a bumbling lad, mostly the second, an' that's why I need ye." } },
      choices = {
        { text = "What happened to his arm?", next = "soren_arm" },
        { text = "Poor Soren.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    soren_arm = {
      lines = {
        { id = "sa_default", text = "He picked a fight wi' a trogg an' got a cut for it. He'll tell ye he won, so let him; it's good for his spirits an' bad for nobody." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trolls = {
      lines = {
        { id = "tr_default", text = "Frostmane, out o' the southern caves, though not many an' not well placed. I've told the Senate an army won't be needed, for a few strong arms will do." },
      },
      choices = {
        { text = "And if you're wrong?", next = "trolls_wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trolls_wrong = {
      lines = {
        { id = "tw_default", text = "Then I'll have been wrong in writin', with the King's name on the letter, an' my brother would never let me forget it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sent = {
      lines = {
        { id = "se_default", text = "The Senate, officially. But the letter that sent me was signed by the King's own hand, since the Senate has its hands full wi' the troggs." },
      },
      choices = {
        { text = "The King himself?", next = "sent_king" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sent_king = {
      lines = {
        { id = "sk_default", text = "Aye, the King himself. Senir says I use the King's name too freely, but Senir says a lot o' things, an' Senir is no' the one sittin' in the snow." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    felix = {
      lines = {
        { id = "fx_default", text = "That's Felix Whindlebolt, lost on his way to Gnomeregan, an' the trolls helped themselves to his things. If ye find a gnome's belongings in a troll camp, they're his." },
      },
      choices = {
        { text = "He's one of mine. I'll find his things.", next = "BACK", when = { race = "Gnome" }, fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I'll keep an eye out.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Can ye? Then ye're worth three o' Soren, an' don't tell him I said so. They come down from the caves at dusk, I know that much, but I cannae tell ye how many by their prints, an' I need tae know before I write tae the Senate." },
      },
      choices = {
        { text = "I'll count them for you, envoy.", next = "BACK", fx = { affinity = 2, standing = { coldridge = 1 } } },
        { text = "Why does the Senate need numbers?", next = "sent" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've been watchin' the Frostmane from this camp long enough tae know most o' what goes on in these valleys. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I'm the Senate's special envoy, an' brother to Senir, who'll tell ye he's the clever one." } },
    advice = { { id = "tp_ad", text = "Never leave yer camp unattended. Learn from me, for I learned the hard way." } },
    frostmane = { { id = "tp_frostmane", text = "They're up to somethin'. I can feel it in my beard, an' my beard's rarely wrong.", next = "trolls" } },
    _none = { { id = "tp_none", text = "That's no' in my report. Ask Senir, in Kharanos." } },
  },
}

-- Kharanos: the town between Coldridge and Ironforge.
P:NPC {
  key = "senir", id = TODO_NPC("Senir Whitebeard"), name = "Senir Whitebeard",
  bible = "bibles/dunmorogh.md", role = "noble", tier = "quest",
  communities = { "kharanos" }, temper = { "measured" }, values = { "dutiful", "wise" },
  notices = { "race" },

  impression = {
    first = "Senir Whitebeard offered me his sympathy for having met his brother, and he was only half joking. He's the steadier of the two, I think.",
    third = "{name} met Senir Whitebeard in Kharanos, an envoy of the Senate who watches the Frostmane trolls in their hold.",
  },

  greetings = {
    { id = "g_kharanos", text = "Welcome to Kharanos. If ye've come up from Coldridge, ye've likely met my brother, an' ye have my sympathy." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' the clan, eh? The Senate sees the trolls as a nuisance, but I see them as a warning, so watch the hills." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Colder, an' the trolls like it that way, for their witch doctors draw on the cold the way we draw on the forge. I've watched them from the ridge, an' I'll tell ye plainly that a lone mage cornered in there is a dead one." } },
      choices = {
        { text = "Then I'll go in with others and watch their backs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go in alone. Nobody slows me down that way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Both of ye bargain wi' things that ought tae be left alone, an' both of ye think ye've the better o' the bargain. I'll grant ye're on our side, an' I'll judge ye on what ye do in the Hold." } },
      choices = {
        { text = "Judge me on my deeds, Envoy. I'll give you good ones.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I've the better of my bargain. The trolls don't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Senir Whitebeard, envoy of the Senate, same as my brother. He watches the trolls in the valley, an' I watch the ones in their hold." },
        { id = "h_obs", when = { questActive = TODO_QUEST("Senir's Observations") },
          text = "Grelin's notes? Let me read them. Aye, it's worse than he thought, an' he thought it was bad." },
        { id = "h_hold", tags = { "news" }, when = { questActive = TODO_QUEST("Frostmane Hold") },
          text = "Frostmane Hold, up on the ridge. Go in, look about, an' come back an' tell me all ye saw." },
        { id = "h_reports", when = { questActive = TODO_QUEST("The Reports") },
          text = "These reports go to Ironforge, where the Senate will read them, eventually. Make sure they do." },
        { id = "h_brother", when = { metBefore = true }, text = "My brother sent word from the valley, three lines, an' two of them complaints about the cold. The Whitebeards don't waste ink." },
        { id = "h_redstone", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Reports"), days = 5 } },
          text = "Redstone shouted, did he? Good, for the Senate needed a shout. An' ye didn't mention ye'd helped me, I hope?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! If ye're headed toward Frostmane Hold, keep yer fire close, for the caves are cold enough tae freeze a spell before it's cast." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I've seen the troll witch doctors deal wi' spirits, an' I'll tell ye now ye've a touch o' the same smell about ye. That's no compliment, mind." },
      },
      again = {
        { id = "h_again", text = "Somethin' else? I've a report to avoid writin'." },
        { id = "h_again2", text = "Go on; it's warmer talkin'." },
      },
      choices = {
        { text = "Grelin's report, envoy.", next = "brother", when = { questActive = TODO_QUEST("Senir's Observations") } },
        { text = "How do you watch the trolls in their hold?", next = "hold" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "Who reads your reports?", next = "reports" },
        { text = "You look cold, envoy.", next = "cold" },
        { text = "I could slip into the hold unseen.", next = "k_rogue", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "Is Frostmane Hold as cold as they say?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is a warlock really like a troll witch doctor?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'll go to the hold.", next = "END", fx = { affinity = 1, standing = { kharanos = 1 } } },
      },
    },
    hold = {
      lines = {
        { id = "ho_default", text = "From a careful distance. The hold's past Brewnall Village, by Iceflow Lake, an' I found it, counted, an' came back, which is envoy work." },
      },
      choices = {
        { text = "You were afraid to go in.", next = "hold_afraid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hold_afraid = {
      lines = {
        { id = "ha_default", text = "I was sensible enough to stay out. There's a difference, an' it's mostly whether ye come back, so go in yerself, if ye doubt me." },
      },
      choices = {
        { text = "Fair.", next = "BACK", fx = { affinity = 1 } },
        { text = "I will.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    brother = {
      lines = {
        { id = "bo_default", text = "Grelin uses the King's name like salt on everythin'. I told him to be sparin' an' he wasn't, so it'll ruffle feathers in the Senate, though some o' those feathers need ruffling." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    reports = {
      lines = {
        { id = "re_default", text = "Senator Barin Redstone, in the High Seat, an' a sour sort. If he asks, ye didn't help me, for I've been workin' very hard out here." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I won't lie for you.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    cold = {
      lines = {
        { id = "co_default", text = "It's bloody cold. There's little to do here but drink an' count trolls, an' I'm behind on the countin'." },
      },
      choices = {
        { text = "I'll share a drink with you.", next = "drink" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink = {
      lines = {
        { id = "dr_default", text = "Good, then sit. Belm's ale is the best thing about this posting, an' the fire's the second best." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_rogue = {
      lines = {
        { id = "xro_default", text = "Unseen, in a troll hold, wi' torches every ten paces? Well, if ye can, ye'll see more than I ever have through a spyglass, an' I'll want every word o' it written down." },
      },
      choices = {
        { text = "A spy sees more than an army.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'd rather walk in and face them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm an envoy o' the Senate, Grelin's brother, an' the one who got the warm posting, though it's still cold." } },
    advice = { { id = "tp_ad", text = "Follow the directions ye're given, an' ye'll do fine. Mine are excellent." } },
    frostmane = { { id = "tp_frostmane", text = "There's too many in that hold to count from outside, but I counted anyway.", next = "hold" } },
    _none = { { id = "tp_none", text = "That's no' a matter fer an envoy. Try the distillery; they know everythin' after the third pint." } },
  },
}

P:NPC {
  key = "ragnar", id = TODO_NPC("Ragnar Thunderbrew"), name = "Ragnar Thunderbrew",
  bible = "bibles/dunmorogh.md", role = "citizen", tier = "quest",
  communities = { "kharanos" }, temper = { "jovial" }, values = { "proud", "generous" },
  notices = { "drink", "craft" },

  impression = {
    first = "Ragnar Thunderbrew is prepared to fight anyone who doubts his ale, though politely. He's short a meat supplier and very long on opinions about ribs.",
    third = "{name} met Ragnar Thunderbrew, part owner of the Thunderbrew Distillery, who now buys his meat from hunters.",
  },

  greetings = {
    { id = "g_distillery", text = "Welcome to the Thunderbrew! It's the best ale in Dun Morogh, an' I'll fight anyone who says otherwise, politely." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! Ye've found the good stuff. Steady on yer feet, now, for the floor's older than it looks." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Can ye roast a boar? I've a family recipe that needs both hands an' meat." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Three this winter, an' every one o' them was the good stuff. I'd bet my beard it was rogues wi' a buyer in Ironforge, an' if ye know who, I'd pay ye in ribs tae tell me." } },
      choices = {
        { text = "I'll find who took them and drag them back here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good thief deserves a good drink, Ragnar. Let it go.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a brew picks up whatever's near it, an' I'll no' have Thunderbrew tastin' o' brimstone. Ye can drink wi' the rest, an' if ye pay, ye're as welcome as anyone." } },
      choices = {
        { text = "Fair enough. I'll leave the creature outside, Ragnar.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A hint of brimstone might improve it, Ragnar.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ragnar Thunderbrew, part owner o' this fine distillery. My meat supplier ran off to join the King's army, so now I buy from hunters, because the patrons want their ribs." },
        { id = "h_ribs", tags = { "news" }, when = { questActive = TODO_QUEST("Beer Basted Boar Ribs") },
          text = "The family recipe! Boar ribs, basted in our own ale. Fetch the makings an' I'll teach ye, but don't tell the Barleybrews." },
        { id = "h_hurley", when = { any = { { questActive = TODO_QUEST("Ragnar Thunderbrew") }, { questActive = TODO_QUEST("Hurley Blackbreath") } } },
          text = "That business with the Dark Irons an' our recipe, I'll not say more of in a crowded room. Ye know what's to be done." },
        { id = "h_boar", when = { metBefore = true }, text = "A hunter brought in a boar this mornin' so big we named it, an' then we ate it. Don't get attached, I tell the lads, but they never listen." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! Ye're who I buy my ribs from these days. Bring me good ones an' I'll remember yer name, though I'm bad wi' names, mind." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "If ye're here tae lift a cask, ye're too late; the brewers count them twice a day, an' they're meaner than I am." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in the distillery! I'll pour ye an ale, but if yer wee demon touches the vats, I'll pour the ale over it." },
      },
      again = {
        { id = "h_again", text = "What else? Kegs don't tap themselves, though one did once, an' we don't talk about it." },
        { id = "h_again2", text = "Go on, then; I've a minute an' a mug." },
      },
      choices = {
        { text = "What's in the famous ribs?", next = "ribs" },
        { text = "What happened to your supplier?", next = "supplier" },
        { text = "Who founded the distillery?", next = "family" },
        { text = "I hear the Dark Irons stole a recipe.", next = "theft", when = { minLevel = 45 } },
        { text = "I cook. Will you share the recipe?", next = "cookrecipe", when = { profession = "Cooking" } },
        { text = "Your supplier joined the army? So did half my company.", next = "k_warrior", when = { class = "WARRIOR" } },
        { text = "Have casks gone missing from the distillery?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why worry about my demon and your vats?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "A pint, then.", next = "END", fx = { affinity = 2 } },
      },
    },
    ribs = {
      lines = {
        { id = "ri_default", text = "Crag boar, basted in good malt, for the secret's in the Malt: Rhapsody Malt, from Belm at the bar. That's no' a secret, mind; that's a sales pitch." },
      },
      choices = {
        { text = "And the real secret?", next = "ribs_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ribs_secret = {
      lines = {
        { id = "rs_default", text = "If I told ye, ye'd have to come an' work here, an' ye couldnae afford the pay." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    supplier = {
      lines = {
        { id = "su_default", text = "My trapper went an' joined the King's Army, off to the Alliance front. I'm proud o' him an' furious wi' him, both at once, most days." },
      },
      choices = {
        { text = "So who brings your meat now?", next = "supplier_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplier_now = {
      lines = {
        { id = "sn_default", text = "Hunters after spare coin. Some bring ribs, an' some bring a boar's ear an' a long story, an' I pay for the ribs." },
      },
      choices = {
        { text = "I'll bring you ribs.", next = "BACK", when = { class = "HUNTER" }, fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = {
        { id = "fa_default", text = "My pappy, Arkilus Thunderbrew, founded it. My brother Grimbooze ran it after him, till he disappeared in a haze a few harvests back, an' now it's me." },
      },
      choices = {
        { text = "Disappeared?", next = "family_grimbooze" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_grimbooze = {
      lines = {
        { id = "fg_default", text = "He went in a haze, an' that's all anybody knows. Thunderbrews always turn up, usually around closin' time, but I'm still waitin' on this one." },
      },
      choices = {
        { text = "He'll turn up.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    theft = {
      lines = {
        { id = "th_default", text = "Thunderbrew Lager, our own recipe! A Dark Iron called Hurley Blackbreath has it down in Blackrock, brewin' it for his own lot, an' it turns my stomach." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "dark_iron" } } } },
    },
    cookrecipe = {
      lines = {
        { id = "ck_default", text = "Bring me the ribs an' a mug o' Rhapsody Malt, an' I'll write it out for ye. It's a family recipe, so don't tell the family." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    k_warrior = {
      lines = {
        { id = "xwa_default", text = "Then ye'll know how it goes: the King calls, an' the brewers go hungry. I don't begrudge the lad, he's fightin' for all of us, but I do begrudge him leavin' wi'out tellin' me where he kept his traps." },
        { id = "xwa_ward", when = { origin = "dwarf_military_ward" },
          text = "Military Ward, are ye? Then ye might know my lad; went up the mountain wi' a spear an' a grin an' left me his snares. Tell him the ribs are suffering, if ye see him." },
      },
      choices = {
        { text = "The King's call comes before ribs, Ragnar.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "He should've stayed and kept the town fed.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A brewer hears a great deal over a good stout, an' I've poured a great many. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I'm part owner o' the finest distillery in Dun Morogh. The other part's family, an' family's complicated.", next = "family" } },
    advice = { { id = "tp_ad", text = "Never trust a boar that's too easy to catch. It's either sick or it's a trap, an' both ruin ribs." } },
    dark_iron = { { id = "tp_dark_iron", text = "Don't get me started on the Dark Irons. They'd steal the froth off yer ale if ye looked away." } },
    _none = { { id = "tp_none", text = "Couldnae say. Have a drink an' ask again, an' the answer might come to me." } },
  },
}

P:NPC {
  key = "belm", id = TODO_NPC("Innkeeper Belm"), name = "Innkeeper Belm",
  bible = "bibles/dunmorogh.md", role = "innkeeper", tier = "service",
  communities = { "kharanos" }, temper = { "sociable" }, values = { "generous", "friendly" },
  notices = { "weary", "race" },

  impression = {
    first = "Innkeeper Belm put a mug in my hand before I'd asked for one and told me I'd earned it, whatever it was. I'd like more people to work that way.",
    third = "{name} rested at Innkeeper Belm's in Kharanos, where there are beds upstairs and Thunderbrew ale downstairs.",
  },

  greetings = {
    { id = "g_inn", text = "Grab a mug, find a stool, an' put yer feet near the fire. Ye've earned it, whatever it was." },
    { id = "g_home", when = { homeInn = { "Kharanos", "Thunderbrew Distillery" } }, text = "Home again! Yer room's warm an' yer tankard's clean, or mostly clean." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Ye look like ye've been dug up. Sit down, for the ale here's raised worse than you." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! We toast a gnome in this inn every night fer savin' the town, as ye'll see." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Right off, an' they took a month tae grow back, which is a long time tae look surprised. He was a gnome out o' Gnomeregan wi' no home tae go back tae, so I forgave him, but I keep the tinderbox now." } },
      choices = {
        { text = "I'll leave your hearth alone, Belm. It's your inn.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your eyebrows grew back. No harm done, surely.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the miners complain about the smell an' the little ones have nightmares if they see yer creatures on the stair. I've nothin' against ye, but I've a whole inn tae keep content." } },
      choices = {
        { text = "That's fair. I'll keep my creatures out of sight.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your guests' nightmares aren't my concern, Belm.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Belm, at yer service. There's beds upstairs, ale downstairs, an' Rhapsody Malt fer anyone brewin' the Thunderbrew way." },
        { id = "h_bound", when = { questActive = TODO_QUEST("Senir's Observations") },
          text = "Ye've come up from Coldridge, then. Welcome to Kharanos; sit down, for the valley's behind ye now." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Maxan Anvol's upstairs, if it's the Light's lessons ye're after. I've priests, paladins, mages an' a rogue all under my roof, the strangest regulars in Dun Morogh." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Ye'll want a room near the hearth, I expect, though I'd ask ye no' tae light it yerself; the last one singed my eyebrows." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, eh? There's a room for ye, but I'll put ye at the end o' the hall, away from the families an' the brewers." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? I've a tap runnin'." },
        { id = "h_again2", text = "Go on; the fire's listenin' too." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Who's the gnome you toast?", next = "lazlo" },
        { text = "What's Rhapsody Malt?", next = "malt" },
        { text = "Who are all these trainers?", next = "trainers" },
        { text = "Did a mage really singe your eyebrows?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why put a warlock at the end of the hall?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Just a room, thanks.", next = "END" },
      },
    },
    lazlo = {
      lines = { { id = "l_default", text = "Lazlo Grindwidget. When the Frostmane came at Kharanos in force, he saw 'em off. He's a small fellow wi' a big heart, an' the Frostmane never came at us like that again." } },
      choices = {
        { text = "A small fellow beat a troll?", next = "lazlo2" },
        { text = "To Lazlo.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    lazlo2 = {
      lines = {
        { id = "l2_default", text = "Wi' a grenade that didnae work an' a gadget that did, sort of. He says it was luck an' we say it was Lazlo, an' there's a song about it ye'll hear before the night's out." },
      },
      choices = { { text = "To Lazlo.", next = "BACK", fx = { affinity = 2 } } },
    },
    malt = {
      lines = {
        { id = "mt_default", text = "It's the best malt in Kharanos, an' the secret in Ragnar's ribs. I sell it by the mug, an' he sends half the town over fer it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    trainers = {
      lines = {
        { id = "tr_default", text = "Priests upstairs wi' Maxan, paladins an' mages on the landing, an' a rogue in my kitchen I pretend not to see. The hunters train out on the hill." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every traveller through Kharanos stops at my inn, an' every one o' them brings a tale. Ask me about any o' this." },
    },
    background = { { id = "tp_bg", text = "I've poured ale in Kharanos longer than I'd admit. I've seen the Frostmane come down an' go back up again, an' the ale stayed." } },
    advice = { { id = "tp_ad", text = "Sleep here before ye go up the mountain. Ironforge never stops hammerin', not even at night." } },
    frostmane = { { id = "tp_frostmane", text = "They came at us once, an' we've a gnome to thank it didnae go worse.", next = "lazlo" } },
    _none = { { id = "tp_none", text = "I pour, I listen, an' I forget, mostly the third." } },
  },
}
