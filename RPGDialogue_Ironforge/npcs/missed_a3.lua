-- Ironforge folk the first passes missed (Ginny to Ingrys): Longberry's Reagents, the Winter Veil grumbler,
-- Deepmountain's supplies, the other Steelfury, two apprentices and the armorsmith at the Great Forge, the
-- Stonefire's barmaid, the Physician's herbs, the Fighting Wizard's wands, Timberline's axes, Stoneblade's and Maeva's.
-- Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Ginny Longberry: reagent vendor at Longberry's Reagents, Mystic Ward.
P:NPC {
  key = "if_ginny", id = TODO_NPC("Ginny Longberry"), name = "Ginny Longberry", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "ironforge", "gnomeregan" }, temper = { "bright", "tidy" }, values = { "precise", "helpful" },
  notices = { "class" },
  impression = {
    first = "Ginny Longberry weighs out arcane powder on a scale so fine it trembles when she breathes. She knows which spell every jar is for, and she likes to guess a customer's school before they speak.",
    third = "{name} met Ginny Longberry, who keeps Longberry's Reagents in the Mystic Ward of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to Longberry's Reagents! Don't tell me what you need just yet, because I like to guess, and I'm right roughly seven times in ten." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I've put a little aside in case you came back, since you looked like someone who'd underestimated." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Mage! It's the fingertips, they always have that faint frost-nip. You'll want arcane powder and rune stones, and I've both measured out already." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, unless I'm much mistaken, because you looked at the candles first. They're the good ones, blessed across the way in the Hall of Mysteries." },
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "HUNTER" } },
      text = "Oh, I'll guess you're not a spellcaster at all, are you? You're very welcome anyway, though I'm not sure I sell a single thing you can use." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Ginny Longberry, and I keep the reagents for the whole Mystic Ward. The Hall of Mysteries is just across the water, so I have priests on one side of the counter and mages on the other, and I try to keep both in stock and out of arguments." },
      },
      again = {
        { id = "h_again", text = "What else can I help with?" },
        { id = "h_again2", text = "Yes? I've just finished a weighing, so I'm all yours." },
      },
      choices = {
        { text = "How do you guess a customer's school?", next = "guess" },
        { text = "Do mages and priests argue here?", next = "argue" },
        { text = "There's a reagent seller in the Commons too.", next = "barim" },
        { text = "Just the reagents, please.", next = "END" },
      },
    },
    guess = {
      lines = { { id = "g_default", text = "By what they look at first when they come in! Mages look at the powders, priests at the candles, and warlocks look at the door behind them. Paladins are the easy ones, because you can hear them coming." } },
      choices = {
        { text = "And the three in ten you get wrong?", next = "wrong" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong = {
      lines = { { id = "w_default", text = "Nearly all druids, which is hardly fair, since we see so few of them under a mountain. One came in last season and looked at my potted fern for a full minute, and I've added ferns to the chart." } },
      choices = { { text = "A thorough method. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    argue = {
      lines = { { id = "a_default", text = "Only about theory, and only politely. A mage will say the Light is simply energy nobody has measured yet, a priest will say some things oughtn't to be measured, and then they both buy candles, so I stay out of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    barim = {
      lines = { { id = "b_default", text = "Mr. Jurgenstaad, yes! He's a dear, though he thinks magic is a sort of expensive nonsense. He sends me the customers with complicated questions, and I send him the ones who just want a great deal of flash powder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I supplied the arcane workshops in Gnomeregan, and when we came to Ironforge I opened my own shop by the Hall of Mysteries." } },
    _none = { { id = "tp_none", text = "I don't know, I'm sorry! If it came in a jar I could tell you everything about it." } },
  },
}

-- Goli Krumn: a dwarf in the Commons at Winter Veil who dislikes what Smokywood Pastures has made of it.
P:NPC {
  key = "if_goli", id = TODO_NPC("Goli Krumn"), name = "Goli Krumn", gender = "male",
  bible = "bibles/missed_a.md", role = "citizen", tier = "quest",
  communities = { "ironforge" }, temper = { "grumbling", "earnest" }, values = { "traditional", "proud" },
  notices = { "race" },
  impression = {
    first = "Goli Krumn stands in the Commons at Winter Veil glaring at the goblin stalls as though they had personally insulted his grandmother. Under the grumbling he loves the old feast dearly, which is exactly why he is so cross.",
    third = "{name} met Goli Krumn, who wishes Ironforge remembered what Winter Veil is for.",
  },
  greetings = {
    { id = "g_default", text = "Bah! Look at them, {class}, sellin' wrappin' paper by the yard as if that were the feast. Tell me ye've nae come to buy a goblin's festive candy." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, and ye're nae carryin' an armful of Smokywood parcels, so there's hope for ye yet." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ye're a dwarf, so ye were raised on the old tales same as I was. Tell me yer own grandmother never spoke of Greatfather Winter walkin' the peaks, and I'll call ye a liar to yer beard." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, and welcome. Yer folk keep the feast with us these days, and ye deserve to hear what it meant before the goblins put a price on it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Goli Krumn. I've kept the Feast of Winter Veil under this mountain all my life, and I never thought I'd see the day a goblin company told dwarves how to do it." },
      },
      again = {
        { id = "h_again", text = "What else? I've plenty more to say on it." },
        { id = "h_again2", text = "Aye, go on, it keeps me from shoutin' at the stalls." },
      },
      choices = {
        { text = "What have the goblins done wrong?", next = "goblins" },
        { text = "What is the feast truly about?", next = "reason" },
        { text = "Presents and sweets seem harmless enough.", next = "harmless" },
        { text = "A merry Winter Veil to you.", next = "END" },
      },
    },
    goblins = {
      lines = { { id = "g_default", text = "Smokywood Pastures came up from the south with their carts, and overnight the feast was a thing ye buy. They've a fellow in a red suit handin' out their wares as if he were Greatfather Winter himself, and the bairns cannae tell the difference." } },
      choices = {
        { text = "Who is Greatfather Winter?", next = "reason" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reason = {
      lines = { { id = "r_default", text = "There's the question I've been waitin' for! I could tell ye, but I'm a grumbler and nae a scholar, and it ought to come from someone who has the old tales right. Go and ask Historian Karnik in the Hall of Explorers.", fx = { learn = { "winter_veil" } } } },
      choices = {
        { text = "Give me the short of it, at least.", next = "short" },
        { text = "I'll find Karnik. Something else.", next = "BACK" },
      },
    },
    short = {
      lines = { { id = "s_default", text = "The short of it is that winter is nae the land dyin' but the land restin', and the old tales say Greatfather Winter lays the snow over it like a blanket so it wakes the stronger. We feast to welcome that rest, and the gifts were only ever a small part." } },
      choices = {
        { text = "That's a gentler tale than I expected.", next = "gentle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gentle = {
      lines = { { id = "ge_default", text = "Aye, well, dwarves are gentler than we let on, though I'll thank ye nae to spread it about. Karnik has the whole of it in a proper book and he tells it better than I do, with fewer oaths." } },
      choices = { { text = "Your secret is safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    harmless = {
      big = true,
      lines = { { id = "ha_default", text = "The presents are fine, and I've wrapped a few in my time. It's forgettin' why we give them that I cannae stomach, for a feast with nae meaning is just a market day with holly on it." } },
      choices = {
        { text = "Old ways are worth keeping, Goli.", next = "BACK", reply = "There, now, that's all I wanted to hear from one living soul today. Go and see Karnik, and learn it properly.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Let folk enjoy the feast however they like.", next = "BACK", reply = "Bah, ye sound like the goblin in the red suit. Enjoy it, then, but dinnae come to me when ye cannae say what it's for.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm an Ironforge dwarf, born and bred, and my family has kept the feast the old way for as long as there's been a hearth to keep it by." } },
    winter_veil = { { id = "tp_wv", text = "Ask Historian Karnik about Winter Veil. He has the old tale written down, and none of it mentions Smokywood Pastures." } },
    _none = { { id = "tp_none", text = "I've nae a notion, and I'm too cross to guess. Ask me about the feast instead." } },
  },
}

-- Gretta Finespindle: apprentice leatherworker in Finespindle's Leather Goods. (Forever: Camping 101: Leatherworking.)
P:NPC {
  key = "if_gretta", id = TODO_NPC("Gretta Finespindle"), name = "Gretta Finespindle", gender = "female",
  bible = "bibles/missed_a.md", role = "apprentice", tier = "quest",
  communities = { "ironforge", "gnomeregan" }, temper = { "eager", "earnest" }, values = { "diligent", "curious" },
  notices = { "craft" },
  impression = {
    first = "Gretta Finespindle is the family's apprentice, with a thimble on every other finger and a pile of practice pieces beside her taller than she is. She is desperate to be good at this, and she very nearly is.",
    third = "{name} met Gretta Finespindle, the apprentice leatherworker at Finespindle's Leather Goods.",
  },
  greetings = {
    { id = "g_default", text = "Oh, hello! I'm only the apprentice, so if it's training you want, that's Fimble, but if you want to see forty-one practice pouches, I'm your gnome." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I'm up to fifty-three pouches now, and the last six have all had straight seams." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You're a leatherworker too! May I look at your stitching, please, because Fimble says I should study everyone's, and yours looks very even." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Gretta Finespindle, apprentice leatherworker. Fimble teaches me, Bombus keeps me in thread, and Balthus lets me have the scrap hides to practise on, so I'm really very lucky." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Leatherworking") },
          text = "Somebody sent you to me about leatherworking for a camp? Me, and not Fimble? Oh, I've been making kit pieces for exactly that, so do sit down and I'll show you all of them." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I don't mind, I can stitch while we talk." },
        { id = "h_again2", text = "Yes? Ask me anything, and I'll ask Fimble if I don't know." },
      },
      choices = {
        { text = "I'm told you can help with a camp.", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Leatherworking") } },
        { text = "How is the apprenticeship going?", next = "apprentice" },
        { text = "What is Fimble like as a master?", next = "fimble" },
        { text = "You have a great many pouches.", next = "pouches" },
        { text = "Keep at it, Gretta.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "I can! A camp wants a waterskin that doesn't leak, a groundsheet, and straps that won't snap when they're wet, and all three are leather. I've worked out a kit that rolls up to the size of a loaf, and nearly all of it is simple stitching.", fx = { learn = { "camping" } } } },
      choices = {
        { text = "What's the hardest piece to make?", next = "hardest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = { { id = "h2_default", text = "The waterskin, by a long way, because the seam has to be waxed and double-stitched or it weeps all down your pack. Mine leaked four times before it held, and Fimble made me carry each one about for a day so I'd remember." } },
      choices = {
        { text = "Did carrying them teach you?", next = "taught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taught = {
      lines = { { id = "t_default", text = "It taught me that a wet boot is a wonderful teacher! The fifth one has held water for two whole weeks now, and I check it every morning before I do anything else." } },
      choices = { { text = "That's a craftsman's pride. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    apprentice = {
      lines = { { id = "a_default", text = "Slowly, but in the right direction, I think. I'm allowed to cut real hide now and not only scraps, which Fimble says he didn't permit his last apprentice until the second year." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fimble = {
      lines = { { id = "f_default", text = "Very exact, and very quiet when something's wrong, which is worse than shouting. He counts my stitches to the inch without seeming to glance up, and I've never once got a crooked seam past him." } },
      choices = {
        { text = "He thinks well of you, I'd wager.", next = "wager" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wager = {
      lines = { { id = "wa_default", text = "Do you think so? He's never said, but he did give me his old awl last month, the one with the worn handle, and Bombus told me he'd carried it out of Gnomeregan himself." } },
      choices = { { text = "That says enough. Something else.", next = "BACK" } },
    },
    pouches = {
      lines = { { id = "p_default", text = "Fimble says nobody may make a boot until they've made a hundred pouches, because a pouch has every kind of seam in it. I'm past halfway, and Balthus has started calling me the Pouch Queen of Ironforge." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm a Finespindle, so it was always going to be leather. I was small when we left Gnomeregan, and I've learned the whole craft here by the Great Forge." } },
    camping = { { id = "tp_camp", text = "A waterskin, a groundsheet and good straps: that's a leatherworker's share of a camp, and the waterskin is the tricky one." } },
    _none = { { id = "tp_none", text = "I don't know that, I'm sorry! I'm still only an apprentice, but Fimble might." } },
  },
}

-- Groum Stonebeard: apprentice blacksmith at the Great Forge; son of Rotgath Stonebeard.
P:NPC {
  key = "if_groum", id = TODO_NPC("Groum Stonebeard"), name = "Groum Stonebeard", gender = "male",
  bible = "bibles/missed_a.md", role = "apprentice", tier = "service",
  communities = { "ironforge" }, temper = { "eager", "sheepish" }, values = { "diligent", "proud" },
  notices = { "craft" },
  impression = {
    first = "Groum Stonebeard is a young dwarf with burn marks up both forearms and a beard he is still waiting on. He works the bellows beside his father and badly wants to be trusted with something harder.",
    third = "{name} met Groum Stonebeard, an apprentice blacksmith at the Great Forge of Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Mind the sparks, {class}! I'm Groum, and I'm only the apprentice, so if it's proper work ye need, ye'll want my da or Master Bengus." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! I've nae burned myself since ye were last here, and that's a personal best." },
  },
  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Ye're a smith! Ye've the hammer arm for it, one shoulder bigger than the other. How long was it before they let ye make anythin' but nails?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Groum Stonebeard, apprentice blacksmith. My father Rotgath works the anvil just there, and I pump the bellows, fetch the coal and make nails, and one day I'll make somethin' with an edge on it." },
      },
      again = {
        { id = "h_again", text = "Anythin' else? Da's nae lookin' this way yet." },
        { id = "h_again2", text = "Go on, I can pump and talk." },
      },
      choices = {
        { text = "What's it like, learning from your father?", next = "father" },
        { text = "How many nails have you made?", next = "nails" },
        { text = "It's hot work by the Great Forge.", next = "forge" },
        { text = "Back to the bellows with you.", next = "END" },
      },
    },
    father = {
      lines = { { id = "f_default", text = "Hard, for he cannae send me home at the end of the day and forget about me. Every other apprentice gets shouted at in the forge, and I get it again over supper, with my mother noddin' along." } },
      choices = {
        { text = "Is he a good smith?", next = "good" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good = {
      lines = { { id = "g_default", text = "One of the best at this forge, though I'd never say it where he could hear. I've watched him draw a bar into a blade in a single heat, and I mean to do the same before my beard reaches my belt." } },
      choices = { { text = "You'll get there, Groum. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    nails = {
      lines = { { id = "n_default", text = "Thousands, and that's nae boastin', that's despair. Da says a smith who cannae make a perfect nail has nae business near a sword, and I've started seein' the cursed things in my sleep." } },
      choices = { { text = "A perfect nail is a start. Something else.", next = "BACK" } },
    },
    forge = {
      lines = {
        { id = "fo_default", text = "Aye, but ye stop noticin' after the first year. That's the mountain's own fire down there, and they say a blade quenched beside it holds its temper better than any other, which is why smiths come from Stormwind to work here." },
        { id = "fo_gnome", when = { race = "Gnome" }, text = "Aye, and it must be worse down at yer height, nearer the grates. That's the mountain's own fire below us, and they say a blade quenched beside it holds its temper better than any other." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm Rotgath Stonebeard's son, and I've been at the Great Forge since I could carry a coal scuttle." } },
    _none = { { id = "tp_none", text = "I'm sorry, but I dinnae know, for I mostly know nails an' the hammers that drive them." } },
  },
}

-- Gwenna Firebrew: barmaid at the Stonefire Tavern, the Commons; kin to Innkeeper Firebrew.
P:NPC {
  key = "if_gwenna", id = TODO_NPC("Gwenna Firebrew"), name = "Gwenna Firebrew", gender = "female",
  bible = "bibles/missed_a.md", role = "barmaid", tier = "service",
  communities = { "ironforge" }, temper = { "warm", "quick" }, values = { "hospitable", "practical" },
  notices = { "drink", "weary" },
  impression = {
    first = "Gwenna Firebrew pours at the Stonefire Tavern with a laugh for every customer and a sharp eye on every tab. Travellers from every corner of the Alliance end up at her bar, and she collects their stories like tips.",
    third = "{name} met Gwenna Firebrew, who pours the drinks at the Stonefire Tavern in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Welcome to the Stonefire, {class}! Get yerself near the hearth and tell me what ye're drinkin', for ye look as though ye've earned one." },
    { id = "g_back", when = { metBefore = true }, text = "There ye are again! Sit down and tell me where ye've been, and I'll pour while ye talk." },
  },
  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Ye've a fine glow on ye already! I'll pour ye a small one, and then there are beds upstairs if the floor starts movin'." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "A night elf, all the way from Kalimdor! We've a wine put by that yer folk seem to tolerate, though I warn ye it's nae what ye're used to." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Up from Stormwind on the tram, are ye? Ye'll find our ale a good deal stronger than what they pour down there, so start with a half." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gwenna Firebrew! The innkeeper's my kin and sees to the beds, and I see to the barrels, so if ye've a thirst, I'm the Firebrew ye want." },
      },
      again = {
        { id = "h_again", text = "What else can I get ye, or tell ye?" },
        { id = "h_again2", text = "Go on, I'm listenin', I'm only wipin' mugs." },
      },
      choices = {
        { text = "What's the best thing on tap?", next = "tap" },
        { text = "You must hear a lot of travellers' tales.", next = "tales" },
        { text = "Is there another tavern in the city?", next = "bruuk" },
        { text = "Just a drink by the fire.", next = "END" },
      },
    },
    tap = {
      lines = { { id = "t_default", text = "Thunderbrew Lager, brought up from Kharanos, and there's nae a better pint in Khaz Modan whatever the Barleybrews claim. If ye want somethin' with more bite, I've a dwarven stout that's ended a few evenin's early." } },
      choices = {
        { text = "The Barleybrews disagree, I take it.", next = "rivals" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rivals = {
      lines = { { id = "r_default", text = "Loudly, and every year. The brewers of Kharanos have been feudin' since before I was born, and I stay friendly with both, because a barmaid who takes sides in that war goes thirsty." } },
      choices = { { text = "A wise neutrality. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tales = {
      lines = { { id = "ta_default", text = "More than I can hold! The tram brings Stormwind folk, the gryphons bring them from Menethil, and they all want a pint and an ear. Lately it's all troggs in Loch Modan and trouble at the Thandol Span, and nae much of it cheerful." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bruuk = {
      lines = { { id = "b_default", text = "Bruuk's Corner, in the Military Ward, where the soldiers drink. Bruuk Barleybeard's a decent old badger and we send each other custom, for his lot want noise and my lot want a bed after." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Firebrews have kept the Stonefire a long while. I grew up carryin' mugs across this floor, and I never found a reason to leave." } },
    _none = { { id = "tp_none", text = "That's nae one I've heard across the bar, and I hear most things. Try me again after the evenin' crowd's been in." } },
  },
}

-- Harick Boulderdrum: wands merchant in the Fighting Wizard, Mystic Ward, beside Bingus.
P:NPC {
  key = "if_harick", id = TODO_NPC("Harick Boulderdrum"), name = "Harick Boulderdrum", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "placid", "dry" }, values = { "patient", "honest" },
  notices = { "class" },
  impression = {
    first = "Harick Boulderdrum sells wands with the calm of a dwarf who has had several go off in his hand and found it did him no lasting harm. He speaks slowly and lets silences sit, which unsettles hurried customers.",
    third = "{name} met Harick Boulderdrum, who sells wands at the Fighting Wizard in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Wands, {class}, if ye've the knack for them. Take yer time lookin', for I'm in nae hurry and the wands certainly aren't." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. The last one's still workin', I hope, and still pointed away from ye." },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "Ye've the hands for a wand, and the schoolin' too, I'd say. Try a few and see which one sits quiet in yer grip, for the right one always does." },
    { id = "n_other", cat = "class", when = { class = { "WARRIOR", "ROGUE", "HUNTER", "PALADIN" } },
      text = "I'll be straight with ye, friend: these would be nae more than fancy sticks in yer hands. It's nae insult, for I cannae use them either." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Harick Boulderdrum. I sell the wands and wee Bingus sells the staves and daggers, and he does most of the talkin', which leaves me free to do most of the thinkin'." },
      },
      again = {
        { id = "h_again", text = "Aye? Take yer time." },
        { id = "h_again2", text = "Go on, when ye're ready." },
      },
      choices = {
        { text = "You sell wands but can't use them?", next = "use" },
        { text = "How does one choose a wand?", next = "choose" },
        { text = "Bingus says you're very calm.", next = "bingus" },
        { text = "I'll look them over.", next = "END" },
      },
    },
    use = {
      lines = { { id = "u_default", text = "Nae a spark, and it's the best thing a wand seller could ask for. A mage behind this counter would be forever tryin' the stock, and I'd have nae shop left by midsummer." } },
      choices = {
        { text = "Has one ever gone off anyway?", next = "off" },
        { text = "Something else.", next = "BACK" },
      },
    },
    off = {
      lines = { { id = "o_default", text = "Three times, when customers were careless, and once it took the front of my beard clean away. It grew back a shade redder, and I've kept the wands in a rack that points at the wall ever since." } },
      choices = { { text = "A sensible rack. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    choose = {
      lines = { { id = "c_default", text = "Ye hold it loose and wait. A wand that suits ye goes still in the hand, and one that doesnae will itch or hum, and folk who buy the hummin' one because it's prettier are back within the week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bingus = {
      lines = { { id = "b_default", text = "Next to a gnome, a landslide is calm. He's a good wee fellow, mind, and he keeps the accounts to the copper, so I let him measure things and he lets me alone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a lamp shop before this, and wands are much the same trade. Folk want a wee bit of light or fire at the end of a stick." } },
    _none = { { id = "tp_none", text = "I dinnae know, and I'll nae pretend to. Ask in the Hall of Mysteries, for they like bein' asked." } },
  },
}

-- Hjoldir Stoneblade: blade merchant at Stoneblade's, Forlorn Cavern; Binny Springblade keeps him company.
P:NPC {
  key = "if_hjoldir", id = TODO_NPC("Hjoldir Stoneblade"), name = "Hjoldir Stoneblade", gender = "male",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "quiet", "watchful" }, values = { "discreet", "proud" },
  notices = { "class" },
  impression = {
    first = "Hjoldir Stoneblade keeps a blade shop in the Forlorn Cavern, where customers prefer not to be asked their names, and he has never asked one. He sells plain, excellent steel and says little about where it goes.",
    third = "{name} met Hjoldir Stoneblade, who sells blades at Stoneblade's in the Forlorn Cavern.",
  },
  greetings = {
    { id = "g_default", text = "Stoneblade's. Look as long as ye like, {class}, and I'll nae ask what it's for." },
    { id = "g_back", when = { metBefore = true }, text = "Ye've been here before. I remember the face, and I've forgotten everythin' else, as is my custom." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of Hulfdan's, or near enough. The short blades are on the left, blackened so they'll nae catch the lamplight, and ye'll find the balance to yer likin'." },
    { id = "n_pala", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, down here? Ye'll find nothin' unlawful on my wall, friend, only good steel, and what folk do with it after is nae a shopkeeper's sin." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hjoldir Stoneblade. I forge blades and I sell them, and the gnome with the springs is Binny, who thinks every knife I make is a first draft." },
      },
      again = {
        { id = "h_again", text = "Somethin' else?" },
        { id = "h_again2", text = "Aye, I'm listenin'." },
      },
      choices = {
        { text = "Why keep shop in the Forlorn Cavern?", next = "cavern" },
        { text = "Your blades are very plain.", next = "plain" },
        { text = "How do you bear Binny's improvements?", next = "binny" },
        { text = "I'll browse and ask nothing.", next = "END" },
      },
    },
    cavern = {
      lines = { { id = "c_default", text = "Because my customers like it here. The Commons is all noise and neighbours, and a body who buys a blade for quiet work would sooner nae be seen buyin' it." } },
      choices = {
        { text = "Does that never trouble you?", next = "trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      big = true,
      lines = { { id = "t_default", text = "I've turned it over, on slow days. I know most of who buys from me, and I know they serve Ironforge in ways the heralds dinnae cry, so I sleep sound enough." } },
      choices = {
        { text = "A smith answers for what his steel does.", next = "BACK", reply = "Maybe so, and if I ever sell to the wrong hand, I'll answer for it. I've been careful nae to, so far.", fx = { align = { honor = 1 } } },
        { text = "Steel is steel. The buyer's business is his own.", next = "BACK", reply = "That's the cavern's creed, right enough, and it keeps the shop open. I'd nae lean on it too hard, all the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plain = {
      lines = { { id = "p_default", text = "Aye, and on purpose. Gilt and gems are for blades that hang on walls, and mine get used, so every hour I'd spend on the look of a thing I spend on the edge instead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    binny = {
      lines = { { id = "b_default", text = "With patience, and a thick apron. Half her notions are daft, and the other half I've quietly started buildin' into the hilts, though I'd be obliged if ye didnae tell her which half." } },
      choices = { { text = "Not a word. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned bladework at the Great Forge and brought it down here, where it's cooler and nobody watches over my shoulder." } },
    _none = { { id = "tp_none", text = "I dinnae know, and I've made a habit of nae knowin'. It's served me well." } },
  },
}

-- Ingrys Stonebrow: cloth armor merchant at Maeva's Mystical Apparel, Mystic Ward.
P:NPC {
  key = "if_ingrys", id = TODO_NPC("Ingrys Stonebrow"), name = "Ingrys Stonebrow", gender = "female",
  bible = "bibles/missed_a.md", role = "vendor", tier = "service",
  communities = { "ironforge" }, temper = { "frank", "motherly" }, values = { "practical", "kind" },
  notices = { "class", "kit" },
  impression = {
    first = "Ingrys Stonebrow fits cloth armour to spellcasters and has firm views on mages who go out underdressed. She tugs at a customer's sleeve to test the seam before she has asked their name.",
    third = "{name} met Ingrys Stonebrow, who sells cloth armour at Maeva's Mystical Apparel in Ironforge.",
  },
  greetings = {
    { id = "g_default", text = "Come in, come in, {class}. Stand in the light and let me see what ye're wearin', for I can tell already it's nae warm enough for Dun Morogh." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, dear? Turn round and let me see how the last lot's wearin' at the elbows." },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
      text = "A spellcaster, and thin as a wand, like the rest of them. Ye'll want padded cloth under those robes, for a robe alone stops nothin' but a draught, and nae even that up here." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Oh, look at the state of ye, all rips and scorch marks! Get that mended before ye catch yer death, and then come and let me sell ye somethin' sturdier." },
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye're wearin' more iron than my whole shop weighs, dear. I've nothin' for ye but a good padded cap to go under that helm, and ye'd thank me for it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ingrys Stonebrow. It's Maeva's shop and she sees to the robes, and I see to the rest of the cloth: the gloves, the boots, the belts and the mantles that keep a caster's body and soul together." },
      },
      again = {
        { id = "h_again", text = "What else, dear?" },
        { id = "h_again2", text = "Go on, I can talk and fold." },
      },
      choices = {
        { text = "Can cloth really be called armour?", next = "armour" },
        { text = "What do casters forget to buy?", next = "forget" },
        { text = "A dwarf selling cloth is unusual.", next = "dwarf" },
        { text = "I'll see what you have.", next = "END" },
      },
    },
    armour = {
      lines = { { id = "a_default", text = "Good cloth can, aye. Quilted layers will turn a glancin' blow, and the better pieces have a wee enchantment stitched into the weave, so it's nae plate, but it's a long way better than a nightshirt." } },
      choices = {
        { text = "Who does the enchanted stitching?", next = "stitch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stitch = {
      lines = { { id = "s_default", text = "The tailors do the weavin', and for anythin' cleverer folk go to Gimble Thistlefuzz at the Arcanery by the Great Forge. He's a nervous wee soul, but his enchantments hold, and that's what matters when somethin's swingin' at ye." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forget = {
      lines = { { id = "f_default", text = "Boots, every one of them. They'll spend a month's coin on a robe with stars on it and then walk into the snow in slippers, and I've had more than one mage back here with toes as blue as his spells." } },
      choices = { { text = "I'll buy the boots first. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dwarf = {
      lines = { { id = "d_default", text = "So folk tell me, and usually while they're buyin' somethin'. We've mages and priests in Ironforge like any city, and now half of Gnomeregan besides, and somebody has to dress them who knows what a mountain winter is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I've worked at Maeva's a good many years. I started on the hemmin', and I've had the cloth armour counter since." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, dear. Ask Maeva, or one of the scholars in the Hall of Mysteries." } },
  },
}
