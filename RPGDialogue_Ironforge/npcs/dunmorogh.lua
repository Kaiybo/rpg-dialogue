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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Belm, at yer service. There's beds upstairs, ale downstairs, an' Rhapsody Malt fer anyone brewin' the Thunderbrew way." },
        { id = "h_bound", when = { questActive = TODO_QUEST("Senir's Observations") },
          text = "Ye've come up from Coldridge, then. Welcome to Kharanos; sit down, for the valley's behind ye now." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Maxan Anvol's upstairs, if it's the Light's lessons ye're after. I've priests, paladins, mages an' a rogue all under my roof, the strangest regulars in Dun Morogh." },
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
