-- Ironforge folk the first passes missed (Ginny to Ingrys): Longberry's Reagents, the Winter Veil grumbler,
-- Deepmountain's supplies, the other Steelfury, two apprentices and the armorsmith at the Great Forge, the
-- Stonefire's barmaid, the Physician's herbs, the Fighting Wizard's wands, Timberline's axes, Stoneblade's and Maeva's.
-- Voice: bibles/missed_a.md
local P = RPGDialogueAPI:Pack("rpgd.ironforge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

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
    gk_dwarf = {
      lines = { { id = "gkd_default", text = "Aye, and so did mine, wi' his beard full of snow and a sack of gifts on his back. Hold on to that tale, for it's worth more than every parcel at Smokywood Pastures put together." } },
      choices = { { text = "I'll tell it to my own children someday.", next = "BACK", fx = { affinity = 1 } } },
    },
    gk_gnome = {
      lines = { { id = "gkg_default", text = "Then ye ken how it feels to lose a thing ye loved, for ye lost a whole city. Keep the feast here wi' us, and ye'll find dwarves remember for those who cannae go home." } },
      choices = { { text = "Thank you, Goli. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
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
        { text = "My grandmother told of Greatfather Winter walking the peaks.", next = "gk_dwarf", when = { race = "Dwarf" } },
        { text = "We gnomes lost our own feasts with Gnomeregan.", next = "gk_gnome", when = { race = "Gnome" } },
        { text = "A merry Winter Veil to you.", next = "END" },
      },
    },
    goblins = {
      lines = { { id = "goblins_default", text = "Smokywood Pastures came up from the south with their carts, and overnight the feast was a thing ye buy. They've a fellow in a red suit handin' out their wares as if he were Greatfather Winter himself, and the bairns cannae tell the difference." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hello again, {class}! I've been practisin' my hammer work all week, and I was hopin' ye'd come by and see it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's ye. My da says I'm to be civil to everyone, so I'm bein' civil, but I'd sooner ye talked to him." },
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
        { text = "What do you want to make, one day?", next = "xs_dream" },
        { text = "I'm a smith too. Want a tip?", next = "xs_smith", when = { profession = "Blacksmithing" } },
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
      lines = { { id = "good_default", text = "One of the best at this forge, though I'd never say it where he could hear. I've watched him draw a bar into a blade in a single heat, and I mean to do the same before my beard reaches my belt." } },
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
    xs_dream = {
      lines = {
        { id = "xsd_default", text = "A sword! A proper one, with a fuller down the blade and a guard like the ones in the Hall of Arms. Da says I'll make one when I can make a nail he cannae bend, and I'm close, I swear it." },
      },
      choices = {
        { text = "How close?", next = "xs_close" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xs_close = {
      lines = {
        { id = "xsc_default", text = "He bent three of yesterday's twelve. That's better than last month, when he bent all twelve and laughed. I've been sneakin' a bit of extra heat on them when he's at his lunch." },
      },
      choices = {
        { text = "Does your father know about the extra heat?", next = "xs_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xs_secret = {
      lines = {
        { id = "xss_default", text = "Nae, and I'd sooner he didnae. It's nae cheatin', exactly, it's just... findin' my own way. Ye'll nae tell him, will ye?" },
      },
      choices = {
        { text = "Tell him yourself. He deserves to know.", next = "BACK", reply = "Aye, aye, ye sound like my mam. Fine, I'll tell him, after supper.", fx = { align = { honor = 1 } } },
        { text = "Your secret's safe. Find your own way.", next = "BACK", reply = "Ha! Thank ye. When I make that sword, I'll name it after ye.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xs_smith = {
      lines = {
        { id = "xsm_default", text = "From a real smith? Aye, please! Da only ever tells me what I did wrong, and never what to do instead." },
      },
      choices = {
        { text = "Quench slower. Steel hates surprises.", next = "BACK", reply = "Steel hates surprises. I'll scratch that on the anvil, thank ye!" },
      },
    },
  },
  topics = {
    great_forge = { { id = "tp_forge", text = "It never goes out, nae even at night. I've tried to see the bottom of it and singed my eyebrows off." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite! Sit yerself down by the hearth, {class}, for yer stories are better than the ale." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll pour ye a drink, for I pour for everyone. But ye'll drink it at the far end of the bar, if ye please." },
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
        { text = "What's the worst brawl you've seen here?", next = "xw_brawl" },
        { text = "Got anything from Kharanos on tap?", next = "xw_dwarf", when = { race = "Dwarf" } },
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
    xw_brawl = {
      lines = {
        { id = "xwb_default", text = "Two Wildhammers and a Bronzebeard over whose clan brewed the first ale. It went three rounds and broke four stools, and in the end they all agreed it was the Dark Irons, just to have somethin' to agree on." },
      },
      choices = {
        { text = "Who did brew the first ale?", next = "xw_first" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xw_first = {
      lines = {
        { id = "xwf_default", text = "My granny swore it was a Firebrew, which is likely nonsense, but I'll say it to any customer who asks. A tavern needs its stories more than its truths." },
      },
      choices = {
        { text = "Does a tavern owe its customers the truth?", next = "xw_truth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xw_truth = {
      lines = {
        { id = "xwt_default", text = "About the ale, aye, every drop. About the stories? Folk come here to forget the road, and a good tale does that better than a true one. I've never once watered a mug, mind." },
      },
      choices = {
        { text = "Honest pours and honest tales. Both matter.", next = "BACK", reply = "Och, ye're a hard one. Fine, the Firebrew story's only half true.", fx = { align = { honor = 1 } } },
        { text = "A good story's worth more than a dull fact.", next = "BACK", reply = "That's the spirit! Sit down, I'll tell ye about my granny's bear.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xw_dwarf = {
      lines = {
        { id = "xwd_default", text = "Thunderbrew, fresh up from the distillery this week, and it's a good batch. Ye can taste the snow in it, which a gnome once told me is impossible, and I told him to drink another." },
      },
      choices = {
        { text = "Pour me one. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    wildhammer = { { id = "tp_wild", text = "They drink like they fight, loud and all at once. Good customers, terrible for the furniture." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, ye're back, {class}! Ye handle a wand with proper respect, and I always enjoy showin' ye the new ones." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "The wands are for sale, and ye can look. But I'll be holdin' the dangerous ones myself, thank ye." },
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
        { text = "A wand should be sold for what it truly does, no more.", next = "BACK", reply = "Aye, and I tell every buyer, for a wand that disappoints in a fight is worse than none at all.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Tell them it burns twice as hot. They'll never measure it.", next = "BACK", reply = "Bingus would measure it, and so would every mage in the Ward, so I'll keep to the truth.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "You sell wands but can't use them?", next = "use" },
        { text = "How does one choose a wand?", next = "choose" },
        { text = "Bingus says you're very calm.", next = "bingus" },
        { text = "Has a wand ever gone off in your hand?", next = "xh_off" },
        { text = "I'm a priest. What wand suits me?", next = "xh_priest", when = { class = "PRIEST" } },
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
    xh_off = {
      lines = {
        { id = "xho_default", text = "Aye, three times. The last one was a fire wand some mage brought back for trade, and it took the hair off my left arm. It grew back. I sell that same mage's wands to this day." },
      },
      choices = {
        { text = "Why would you keep trading with him?", next = "xh_off2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xh_off2 = {
      lines = {
        { id = "xho2_default", text = "Because he came back and told me himself it was faulty, and offered to pay for the arm. Most would've hidden it. A dwarf can forgive a bad wand, but nae a bad word." },
      },
      choices = {
        { text = "Should he have paid anyway?", next = "xh_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xh_pay = {
      lines = {
        { id = "xhp_default", text = "I wouldnae take his coin. Ye cannae put a price on a dwarf's arm hair, I told him, and he laughed, and we've done business for nine years. Bingus says I should have taken it." },
      },
      choices = {
        { text = "You were right. Honour is worth more than coin.", next = "BACK", reply = "Aye. That's my view, though it's a poor one for a shopkeeper.", fx = { align = { honor = 1 } } },
        { text = "Bingus is right. Take the coin, a debt is a debt.", next = "BACK", reply = "Hmph. The wee one will be pleased to hear it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xh_priest = {
      lines = {
        { id = "xhpr_default", text = "Shadow or holy, depending on yer leanings. Most priests here buy holy, for they come from the Mystic Ward. A few buy shadow and pretend they didnae, and I pretend I didnae notice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hall_of_mysteries = { { id = "tp_mystery", text = "The priests next door buy the most wands and ask the fewest questions. I like them for it." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's ye again. I remember the face, and this time I'll admit I'm glad to see it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I remember ye, and I wish I didnae. Look at the blades if ye must, and be quick about it." },
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
        { text = "A blade sold in the dark should still be sold honestly.", next = "BACK", reply = "It should, and down here it's the one thing that keeps a shop open longer than a season.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Down here nobody asks questions, so nobody needs the truth.", next = "BACK", reply = "Nobody asks, aye, but everybody remembers, and the Circle remembers longest of all.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Why keep shop in the Forlorn Cavern?", next = "cavern" },
        { text = "Your blades are very plain.", next = "plain" },
        { text = "How do you bear Binny's improvements?", next = "binny" },
        { text = "Who taught you to forge?", next = "xj_taught" },
        { text = "I need a quiet blade. No questions.", next = "xj_rogue", when = { class = "ROGUE" } },
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
    xj_taught = {
      lines = {
        { id = "xjt_default", text = "My uncle, in the Military Ward, before he decided the Ward asked too many questions. He moved his anvil down here and I followed. He's gone now, but the anvil stayed." },
      },
      choices = {
        { text = "What did the Ward ask him?", next = "xj_ward" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xj_ward = {
      lines = {
        { id = "xjw_default", text = "Who his customers were. He said a smith forges steel, nae judgement, and that what a buyer does with a blade is between him and the Light. The Ward disagreed." },
      },
      choices = {
        { text = "Do you agree with your uncle?", next = "xj_agree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xj_agree = {
      lines = {
        { id = "xja_default", text = "Most days. Some nights I wonder about a blade I've sold, and where it went. But a smith who asks questions soon has nae customers, and a smith with nae customers cannae feed his family." },
      },
      choices = {
        { text = "A smith answers for every blade he sells.", next = "BACK", reply = "Aye, maybe so. It's a heavy thought, and I'll carry it.", fx = { align = { order = 1 } } },
        { text = "Your uncle was right. Steel isn't judgement.", next = "BACK", reply = "That's the cavern's creed, and it's kept me in business.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xj_rogue = {
      lines = {
        { id = "xjr_default", text = "Then ye've come to the right cavern. Short blade, dark tang, a grip that doesnae shine. I'll nae ask yer name, and ye'll nae tell me what it's for." },
      },
      choices = {
        { text = "Agreed. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forlorn_cavern = { { id = "tp_cavern", text = "Quiet, dim and honest in its own way. Folk who come here know what they want, and that's more than ye can say for the Commons." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, dear! Ye wear my cloth so well that half the Ward has asked where ye got it, and I've told every one of them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell ye cloth, for nobody should freeze in Dun Morogh. But I'll nae be fussin' over yer elbows today." },
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
        { text = "Cloth should be sold for what it is, wool or silk.", next = "BACK", reply = "Aye, dear, and I'd sooner lose a sale than pass wool off as silk.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Call it silk. A mage won't know the difference until it rains.", next = "BACK", reply = "Every mage knows, dear, the moment they set fire to it, so I'll nae bother tryin'.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Can cloth really be called armour?", next = "armour" },
        { text = "What do casters forget to buy?", next = "forget" },
        { text = "A dwarf selling cloth is unusual.", next = "dwarf" },
        { text = "How did you start working for Maeva?", next = "xi_maeva" },
        { text = "I'm a mage. What am I forgetting?", next = "xi_mage", when = { class = "MAGE" } },
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
    xi_maeva = {
      lines = {
        { id = "xim_default", text = "Maeva took me on when my own mam's shop closed, and she has a stubborn streak as wide as a ram. I liked her at once, and we've been stitchin' together since. She does the fine work, and I do the sensible work." },
      },
      choices = {
        { text = "What does the sensible work involve?", next = "xi_sense" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xi_sense = {
      lines = {
        { id = "xis_default", text = "Linin' every glove with wool, for one. Casters' hands get cold and cold hands fumble the gestures. And double-stitchin' the boot seams, because no mage ever walks as little as they think they will." },
      },
      choices = {
        { text = "Does Maeva agree with that?", next = "xi_agree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xi_agree = {
      lines = {
        { id = "xia_default", text = "Nae always. She says a robe should be beautiful first, because confidence is half of any spell. I say a robe should keep ye warm first, because frostbite is the other half." },
      },
      choices = {
        { text = "Practical first. A cold mage is a dead mage.", next = "BACK", reply = "Thank ye! That's what I tell her, near enough every day.", fx = { align = { order = 1 } } },
        { text = "Maeva's right. Confidence is everything in spellcraft.", next = "BACK", reply = "Hmph. Ye'd get on with her. Fine, I'll add a ribbon.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xi_mage = {
      lines = {
        { id = "ximg_default", text = "Gloves. Every mage forgets gloves until their fingers go blue in Dun Morogh. I've wool-lined ones on the left shelf, and I'll nae let ye out of here without tryin' a pair." },
      },
      choices = {
        { text = "I'll try them. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    hall_of_mysteries = { { id = "tp_mystery", text = "Half my customers walk over from the Hall of Mysteries, and every one of them forgets their gloves." } },
    background = { { id = "tp_bg", text = "I've worked at Maeva's a good many years. I started on the hemmin', and I've had the cloth armour counter since." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, dear. Ask Maeva, or one of the scholars in the Hall of Mysteries." } },
  },
}
