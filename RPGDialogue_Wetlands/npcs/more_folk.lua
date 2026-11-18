-- More Wetlands folk: Andrea Halloran, the tanner's wife in Menethil Harbor with two children who won't stay
-- off things, and Comar Villard, who wanders the north road near the Thandol Span looking for his lost wife.
-- Also (added later): the Menethil traders, Fradd Swiftgear and Wenna Silkbeard, and Kixxle.
-- Also (second pass): Naela Trance, Edwina Monzor, Falkan Armonis, Bart Tidewater, Adam Lind, Don Pompa, Hargin Mundar,
-- Junder Brokk, Murphy West, Timothy Clark and Caitlin Grassman.
-- Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Andrea Halloran: James Halloran's wife; mother of Jesse and Regina.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_andrea", id = TODO_NPC("Andrea Halloran"), name = "Andrea Halloran",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "menethil" }, temper = { "harried", "warm" }, values = { "family", "practical" },
  notices = { "race", "class" },
  impression = {
    first = "She says the tannery smell is the least of her worries.",
    third = "{name} met Andrea Halloran, the tanner's wife in Menethil Harbor, who has her hands full with two adventurous children.",
  },
  greetings = {
    { id = "g_night", when = { timeOfDay = "night" }, text = "Hush, please, they're finally asleep. I'd forgotten what the harbor sounds like without them." },
    { id = "g_hi", text = "Oh, hello! Sorry, I'm only half listening; I've lost sight of Jesse again, and that's never a good sign." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Have you seen a small boy halfway up anything tall? If you have, don't tell me which." },
  },
  notice = {
    { id = "n_lw", cat = "class", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You work hides yourself, don't you? I can always tell by the hands. James will talk to you for an hour if you let him." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Jesse's been pestering the dwarves at the keep to teach him to shoot. If he asks you, please say no, and say it loudly." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! You'd not believe how many scraped knees I've bandaged this month. I could use a blessing or two for patience." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Andrea Halloran, and my husband James is the tanner here, which you've probably smelled already. Most days I'm keeping our two from falling off something, and the rest of the time I'm scrubbing hides." },
      },
      again = {
        { id = "h_again3", text = "Yes? Sorry, I heard a splash, but I think it was only a gull. Go on." },
        { id = "h_again", text = "What else? Quickly, before Regina notices I've stopped watching." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
      },
      choices = {
        { text = "Tell me about your children.", next = "kids" },
        { text = "How is life in Menethil?", next = "harbor" },
        { text = "Your husband's work must be hard on the nose.", next = "james" },
        { text = "Who do you rely on in this town?", next = "neighbours" },
        { text = "The harbor is no playground.", next = "docks" },
        { text = "I work leather too. How is the trade?", next = "trade", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "Good day, Andrea.", next = "END" },
      },
    },
    kids = {
      lines = { { id = "ki_default", text = "Jesse's the climber, and Regina's the one who tells on him, and between them I've not had a quiet afternoon in years. They're good children, really, just very fond of high places and loud voices." } },
      choices = {
        { text = "Let him climb. It's how children learn.", next = "kids_climb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kids_climb = {
      big = true,
      lines = { { id = "kc_default", text = "Learn what, how to break a leg? His father says the same as you, mind, and his father isn't the one picking him up after. What would you do, if he were yours?" } },
      choices = {
        { text = "Keep him safe. There's time enough for risks later.", next = "BACK", reply = "Thank you! I'll tell James a stranger agreed with me, and he'll hate that.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let him fall once. He'll learn faster.", next = "BACK", reply = "Spoken like someone who's never had to carry a crying child home. But maybe you're right.", fx = { align = { order = -1 } } },
      },
    },
    harbor = {
      lines = { { id = "ha_default", text = "Busy, damp and noisy, with ships in and out at all hours and the Dragonmaw never far off. We came here for James's trade, and I suppose we've stayed for it too." } },
      choices = {
        { text = "Do you ever think of leaving?", next = "harbor_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harbor_leave = {
      lines = { { id = "hl_default", text = "Every time I hear about the orcs at Grim Batol, yes. But James's leather sells in every port that has a ship to Menethil, and where else would we go? Stormwind's crowded, and the children would hate it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    james = {
      lines = { { id = "ja_default", text = "Hard on everybody's nose, but I stopped smelling it years ago. He's a good man, James, and his crocolisk leather is the finest in the kingdom, or so he tells me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbours = {
      lines = { { id = "nb_default", text = "Innkeeper Helbrek, mostly, who's fed my two more suppers than I can repay when I've been late at the vats. And Captain Stoutfist's guards know Jesse by name now, which I can't decide whether to be glad or ashamed of." } },
      choices = {
        { text = "The guards bring him home?", next = "neighbours_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours_guards = {
      lines = { { id = "ng_default", text = "Twice from the keep wall and once from the roof of the inn. They're very good about it, and one of the dwarves told Jesse he'd make a fine mountaineer some day, which was not the help he thought it was." } },
      choices = { { text = "He may be right, in ten years.", next = "BACK", reply = "In ten years he's welcome to climb whatever he likes. I only need him in one piece until then.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    docks = {
      lines = { { id = "dk_default", text = "No, and I've told them so until I'm hoarse. There are ropes, cranes and sailors who don't look where they're walking, and under all of it the water's cold enough to stop your breath." } },
      choices = {
        { text = "Do the sailors look out for them?", next = "docks_sailors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    docks_sailors = {
      lines = { { id = "ds_default", text = "The regular crews do. First Mate Fitzsimmons sends Regina home with ship's biscuit and tells Jesse horrible stories about murlocs, and I've decided the stories do more good than any scolding of mine." } },
      choices = {
        { text = "A frightening story has its uses.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "td_default", text = "Good, when the hunters can get out to the marsh and back. Crocolisk hide is what the port wants, and James says the young raptors skin cleaner, though you'd better ask him, because I only scrape what I'm handed." } },
      choices = { { text = "I'll talk to James. Thank you.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    james = { { id = "tp_james", text = "My husband, and the best tanner in the Wetlands, if you can stand downwind of him. He's kinder than he smells." } },
    menethil = { { id = "tp_menethil", text = "It's a working port with a keep in the middle of it. Everything arrives damp and everyone leaves in a hurry." } },
    background = { { id = "tp_bg", text = "I'm a tanner's wife and a mother of two. That keeps me busy enough." } },
    _none = { { id = "tp_none", text = "I couldn't say, I'm afraid. Ask me about children, or hides." } },
  },
}

---------------------------------------------------------------------------
-- Comar Villard: wanders the northern Wetlands near the Thandol Span searching for his lost wife.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_comar", id = TODO_NPC("Comar Villard"), name = "Comar Villard",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "wetlands" }, temper = { "mournful", "gentle" }, values = { "love", "faithful" },
  notices = { "class" },
  impression = {
    first = "He doesn't notice how thin he has grown looking for his wife.",
    third = "{name} met Comar Villard, a grieving man who wanders the northern Wetlands searching for his lost wife.",
  },
  greetings = {
    { id = "g_night", when = { timeOfDay = "night" }, text = "Who's there? Forgive me, I thought for a moment... no. Good evening, friend. It is late to be on this road." },
    { id = "g_hi", text = "Excuse me, friend, but have you seen a woman travelling alone on these roads? No, I suppose you haven't, and nobody ever has." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Still no sign of her, I'm afraid, but I keep looking." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You serve the Light, I think. If you have a prayer to spare for a traveller, I would be glad of it, though it's for her and not for me." },
    { id = "n_road", cat = "class", when = { minLevel = 30 },
      text = "You've travelled farther than most who pass me. You would tell me if you had seen her, wouldn't you? Yes, of course you would." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You've a strange shadow about you, friend, but I'll not judge. Everyone who walks these roads has their own burden." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "My name is Comar Villard, and I'm looking for my wife. She came this way, I'm sure of it, and I've been walking these roads ever since." },
      },
      again = {
        { id = "h_again3", text = "Forgive me, I was watching the road. What were you asking?" },
        { id = "h_again", text = "Is there anything else? I should keep looking." },
        { id = "h_again2", text = "Go on, I've time to listen, though not much." },
      },
      choices = {
        { text = "Tell me about your wife.", next = "wife" },
        { text = "How long have you been searching?", next = "searching" },
        { text = "Aren't these roads dangerous?", next = "danger" },
        { text = "Who do you meet on these roads?", next = "roads" },
        { text = "You don't look as though you've eaten.", next = "eaten" },
        { text = "Let me say a prayer for her.", next = "prayer", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Farewell, Comar.", next = "END" },
      },
    },
    wife = {
      lines = { { id = "wi_default", text = "She's kind, and she laughs at everything, and she sings badly but loudly. I lost her somewhere on these roads, and I've never learned where or how." } },
      choices = {
        { text = "Do you think she's still alive?", next = "wife_alive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wife_alive = {
      big = true,
      lines = { { id = "wa_default", text = "I have to think so, for what else would I do with myself? Some say I should stop and grieve and move on. Do you think I should?" } },
      choices = {
        { text = "No. Keep searching. Love like that is rare.", next = "BACK", reply = "Thank you, friend. Not many people say that anymore.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Yes. You deserve to live again.", next = "BACK", reply = "Perhaps you're right, but I can't, not yet. Thank you for your kindness, anyway.", fx = { align = { light = -1 } } },
      },
    },
    searching = {
      lines = { { id = "se_default", text = "Longer than I care to count, if I'm honest. The seasons blur together out here, and I stopped counting after the third winter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "da_default", text = "They are, with the Dark Irons on the Span and the Dragonmaw in the hills, but nobody seems to trouble a man with nothing worth taking. I sleep in the old farmhouses, and the raptors leave me alone, mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    roads = {
      lines = { { id = "rd_default", text = "Not many. The dwarves at Dun Modr know me, and they have stopped asking me to come inside their lines, though one of them still leaves a blanket by the old wall. Now and then a caravan passes for the Thandol Span and I ask the drivers." } },
      choices = {
        { text = "What do the drivers tell you?", next = "roads_drivers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads_drivers = {
      lines = { { id = "rv_default", text = "That they've seen no one, and that I should go south to Menethil where it's safe. They mean it kindly, but she didn't go to Menethil, so there's no sense in my going there either." } },
      choices = {
        { text = "How can you be sure which way she went?", next = "roads_sure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads_sure = {
      lines = { { id = "rs_default", text = "I can't be, and you are the first in a long while to ask it plainly. I only know that this is the road where I last had her beside me, and a man has to stand somewhere." } },
      choices = { { text = "Then I hope she finds this road again.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    eaten = {
      lines = { { id = "ea_default", text = "Haven't I? I forget to, some days. There are berries along the marsh, and the dwarves leave bread where I'll find it and pretend they haven't, so I do well enough." } },
      choices = {
        { text = "Eat when it's offered, Comar. She'd want that.", next = "BACK", reply = "She would, and she'd say it a great deal louder than you. I'll try to remember.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    prayer = {
      lines = { { id = "pr_default", text = "Would you? Thank you. I've not prayed properly in a long time, for I never know whether to ask that she is safe or that she is at peace, and it seems wrong to choose." } },
      choices = { { text = "The Light knows which she needs.", next = "BACK", reply = "Yes. Yes, I suppose it must. That is a kinder answer than I've given myself.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    menethil = { { id = "tp_men", text = "The harbor to the south. They tell me it is safe there, and I am sure it is. She was not going there." } },
    thandol_span = { { id = "tp_span", text = "A great dwarven bridge to the north, with fighting on it now. I keep to this side, for the Dark Irons don't care who is only looking for someone." } },
    dun_modr = { { id = "tp_modr", text = "The dwarves there lost their town and are trying to win it back. They've been kind to me, in the gruff way dwarves are kind." } },
    background = { { id = "tp_bg", text = "There's not much to tell, friend, beyond the woman I've lost and the roads I walk looking for her." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. I've thought of nothing but her for years." } },
  },
}

---------------------------------------------------------------------------
-- Missed folk (added later): the Menethil traders Kersok Prond, Gruham Rumdnul, Dewin Shimmerdawn, Brak Durnad
-- and Jennabink Powerseam; Fradd Swiftgear and Wenna Silkbeard at their camp north of the harbor road; and
-- Kixxle, the goblin potion seller on the marsh road.
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Kersok Prond: tradesman in the Deepwater Tavern.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_kersok", id = TODO_NPC("Kersok Prond"), name = "Kersok Prond", title = "Tradesman",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "shrewd", "genial" }, values = { "practical", "honest" },
  notices = { "craft", "race" },
  impression = {
    first = "Kersok Prond sells thread, flux, vials and spice from a table in the Deepwater Tavern, close enough to the fire to keep his stock dry. He knows what every ship in the harbor carried in and what it means to carry out.",
    third = "{name} met Kersok Prond, the tradesman who works out of the Deepwater Tavern in Menethil Harbor.",
  },
  greetings = {
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf, an' no' yet green wi' the damp. Sit down, {g:lad|lass}, I've Ironforge flux an' Ironforge prices, near enough." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The night boat's due, so I'm still at my table. What are ye short of?" },
    { id = "g_hi", text = "Trade goods, friend, dry an' ready. In this town that's rarer than ye'd think." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. There's a ship in since ye left, so I've spice, an' I've lost my last crate o' vials tae the damp." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Blacksmithing", "Alchemy", "Cooking", "Leatherworking", "Engineering" } },
      text = "Ye've a maker's hands. Good, for I sell the wee things a maker runs out of at the worst moment." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Off the Auberdine boat, are ye? Ye'll find our weather familiar an' our manners rougher, an' ye're welcome all the same." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kersok Prond, tradesman. I keep my table in the Deepwater because it's the one room in Menethil where the floor's dry, an' because every traveller who steps off a ship walks through that door first." },
        { id = "h_cook", when = { profession = "Cooking" }, text = "Kersok Prond, tradesman, an' ye're a cook, by the way ye sniffed at the spice box. It came off a ship from the south three days back, an' it's the freshest ye'll find north o' the Thandol Span." },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere tae be till the next tide." },
        { id = "h_again2", text = "Go on, ask. Talk's free, which is more than I can say for the flux." },
        { id = "h_again3", text = "Aye? I'm listenin', an' watchin' the door, as always." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "What comes in on the ships?", next = "ships" },
        { text = "Why trade from a tavern?", next = "tavern" },
        { text = "How does the damp treat your stock?", next = "damp" },
        { text = "What sells to crafters in a port?", next = "craft", when = { profession = { "Tailoring", "Blacksmithing", "Alchemy", "Leatherworking", "Engineering" } } },
        { text = "What's the best bargain you ever made?", next = "bargain" },
        { text = "Good day, Kersok.", next = "END" },
      },
    },
    ships = {
      lines = { { id = "sh_default", text = "From Auberdine, elven cloth an' herbs I cannae pronounce, an' from Theramore, salt, spice an' whatever the Lady Proudmoore's folk have tae spare. Goin' out it's Ironforge steel an' powder, an' every crate o' that has a dozen buyers before it's off the cart." } },
      choices = {
        { text = "And you take your share at the dock?", next = "ships_share" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships_share = {
      big = true,
      lines = { { id = "ss_default", text = "I buy what the captains will sell me before it's been carted inland, aye. First Mate Fitzsimmons says a dockside buyer is one step up from a wrecker, for I pay less than Ironforge would. I say I'm payin' today, in coin, an' Ironforge is a week's haul through Dragonmaw country." } },
      choices = {
        { text = "A fair price is fair wherever it's paid.", next = "BACK", reply = "Ye sound like Fitzsimmons. Maybe I'll put another silver on the next crate, tae keep the peace.", fx = { align = { honor = 1 } } },
        { text = "You carry the risk. Name your own price.", next = "BACK", reply = "That's the trade as I learned it. The captains are free tae haul it themselves, an' they never do.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tavern = {
      lines = { { id = "ta_default", text = "Innkeeper Helbrek lets me the table for a share an' my custom at the bar, an' it suits us both. A sailor wi' a week's pay buys a drink from him an' a needle an' thread from me, an' goes back tae sea wi' his shirt mended an' his purse empty." } },
      choices = {
        { text = "You must hear every story in the port.", next = "tavern_hear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tavern_hear = {
      lines = { { id = "th_default", text = "Every one, an' most o' them twice. Lately it's the Dragonmaw closin' the road tae Dun Algaz, an' murlocs comin' up the beach bolder than they've any right tae be. Captain Stoutfist has more trouble than soldiers, an' the whole room kens it." } },
      choices = { { text = "I'll see if the captain needs a hand.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    damp = {
      lines = { { id = "da_default", text = "Cruelly. Thread rots, flux cakes, an' I've had a sack o' salt turn tae a single brick overnight. Everythin' I own is in waxed cloth inside a tarred box beside a fire, an' I still lose a tenth o' it." } },
      choices = { { text = "A hard place to keep a shop.", next = "BACK", reply = "It is, an' that's why there's only the one o' me. A hard place keeps the competition away.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    craft = {
      lines = { { id = "cr_default", text = "Thread an' needles tae the sailors, vials tae Dewin Shimmerdawn's customers when he runs short, an' flux tae Brak Durnad, who goes through it like ale. If ye make somethin' that keeps the wet out, ye'll sell it in this town before ye've finished it." } },
      choices = { { text = "Something that keeps the wet out. Noted.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    bargain = {
      lines = { { id = "bg_default", text = "A whole crate o' elven silk thread, bought off a captain who thought it was fishin' line. I told him what it was after I'd paid, an' he laughed so hard he stood me a drink, which is why I still buy from him first." } },
      choices = { { text = "Honest after the fact still counts.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    theramore = { { id = "tp_ther", text = "Lady Proudmoore's city, across the sea in Kalimdor. I've never seen it, but I've sold a great deal o' what it sends." } },
    menethil = { { id = "tp_men", text = "A keep, a dock an' a tavern, wi' a marsh pressin' in on three sides. It's the Alliance's door tae the north, an' doors get knocked on." } },
    dragonmaw = { { id = "tp_dragon", text = "Orcs from the old Horde, still up in the hills by Dun Algaz. They've cost me three carts this year, an' I've stopped sendin' any." } },
    background = { { id = "tp_bg", text = "I'm a tradesman. I buy at the dock an' sell at the fire, an' I've done it since before the last war." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. If it didnae come in on a ship or get said at this bar, it's passed me by." } },
  },
}

---------------------------------------------------------------------------
-- Gruham Rumdnul: general supplies in Menethil Harbor.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_gruham", id = TODO_NPC("Gruham Rumdnul"), name = "Gruham Rumdnul", title = "General Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "weathered", "wry" }, values = { "practical", "community" },
  notices = { "kit", "greenness" },
  impression = {
    first = "Gruham Rumdnul sells rope, rations, torches and oilcloth in Menethil Harbor to people about to walk into the marsh. He has a habit of looking at a traveller's boots and sighing.",
    third = "{name} met Gruham Rumdnul, who sells general supplies in Menethil Harbor.",
  },
  greetings = {
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "General supplies. A dwarf, eh? Then ye'll hate it here as much as I do, an' we'll get on." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Ye're no' thinkin' o' goin' out there in the dark? Buy a lantern, at least, an' let me talk ye out o' the rest." },
    { id = "g_hi", text = "General supplies. Are ye headed intae the marsh? Then let me see yer boots before ye tell me what ye think ye need." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back, an' ye're wet tae the knee. I did say." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "The marsh has been at yer gear already. Brahnmar can mend the metal, but ye'll want oil on everythin' else before it rots through." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 19 },
      text = "Ye're young for the Wetlands, if ye'll forgive me. Keep tae the road, keep clear o' the water's edge, an' ye'll likely see supper." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gruham Rumdnul. I sell what keeps a body alive between here an' the next dry roof, which in the Wetlands is a long way in any direction." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Gruham Rumdnul. A dwarf, an' no' used tae mud up tae the shins, I'd wager. Neither was I when I came down from the mountain, an' I've never grown tae like it." },
      },
      again = {
        { id = "h_again", text = "What else? I've sacks tae shift, but they'll keep." },
        { id = "h_again2", text = "Go on, ask. Better here than out in the reeds." },
        { id = "h_again3", text = "Aye? Speak yer mind." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What does the marsh do to travellers?", next = "marsh" },
        { text = "Who buys from you, mostly?", next = "buyers" },
        { text = "You don't sound fond of the Wetlands.", next = "fond" },
        { text = "What should a newcomer watch for out there?", next = "advice", when = { maxLevel = 29 } },
        { text = "What's the one thing nobody thinks to buy?", next = "nobody" },
        { text = "Good day, Gruham.", next = "END" },
      },
    },
    marsh = {
      lines = { { id = "ma_default", text = "It wets them, then it tires them, an' then somethin' wi' teeth notices. There's crocolisks in every pool, raptors on the high ground an' murlocs along the shore, an' the road's the only part that's nobody's huntin' ground." } },
      choices = {
        { text = "And the road itself?", next = "marsh_road" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh_road = {
      lines = { { id = "mr_default", text = "Safe as far as the gnoll country, an' after that it depends on the day. The Mosshide have been bold, an' east o' them the Dragonmaw hold the hills, so a traveller for Loch Modan had best go in company or go quick." } },
      choices = { { text = "Company or speed. I'll choose one.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "bu_default", text = "The League's diggers bound for Whelgar's site, mostly, an' they buy lamp oil by the cask. Then the hunters after hides for James Halloran, an' any soldier Captain Stoutfist sends past the wall, who gets his rations at cost." } },
      choices = {
        { text = "At cost? That's generous.", next = "buyers_cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_cost = {
      big = true,
      lines = { { id = "bc_default", text = "It's sense, more than generosity. If the wall falls, I've nae shop. But the League's folk grumble that they pay full while the guards pay half, an' they've a point, for they bleed out there the same as any soldier." } },
      choices = {
        { text = "Give the diggers the same price. They face the same marsh.", next = "BACK", reply = "Aye, maybe so. I'd be poorer, but I'd sleep better, an' in this damp that's worth somethin'.", fx = { align = { light = 1 } } },
        { text = "Soldiers defend you. The diggers chose their risk.", next = "BACK", reply = "That's the way I've had it, an' it's kept the books straight. I'll leave it be, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fond = {
      lines = { { id = "fo_default", text = "I'm no', an' I've been here eleven years. I came for one season's trade, an' then there was always another ship due, an' now I've forgotten what dry socks feel like. Still, the folk are good, an' the fish is better than anythin' under the mountain." } },
      choices = { { text = "Good folk and good fish. You could do worse.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "ad_default", text = "Dinnae fill yer waterskin from a still pool, dinnae camp below the tide line, an' if ye see one murloc, ye've been seen by six. An' buy a second torch, for the first always ends up in the bog." } },
      choices = { { text = "Sell me the second torch.", next = "BUSINESS" }, { text = "Thank you, Gruham.", next = "BACK", fx = { affinity = 1 } } },
    },
    nobody = {
      lines = { { id = "nb_default", text = "A spare pair o' laces. Ye'd laugh, but a boot that'll no' stay on in a bog is a boot ye leave behind, an' then ye're walkin' the Wetlands in one sock. I keep a jar o' them on the counter an' nobody looks at it till they've been out once." } },
      choices = { { text = "Sell me the laces.", next = "BUSINESS" }, { text = "I'll take my chances.", next = "BACK", reply = "Aye, they all say that. I'll keep a pair by for ye." } },
    },
  },
  topics = {
    murlocs = { { id = "tp_murloc", text = "Bluegills, all along the shore north o' the wall. They're bolder every month, an' they've taken tae the wrecks in the bay." } },
    menethil = { { id = "tp_men", text = "A harbor wi' a wall round it an' a bog round that. It's no' bonny, but it's held through worse than this." } },
    whelgar = { { id = "tp_whel", text = "The League's dig tae the north-east. They keep findin' old bones, an' the bones keep objectin', from what I hear." } },
    background = { { id = "tp_bg", text = "I'm an Ironforge dwarf who came for a season an' stayed eleven years. I sell supplies." } },
    _none = { { id = "tp_none", text = "I couldnae say. I ken the price o' rope an' the state o' the road, an' little past that." } },
  },
}

---------------------------------------------------------------------------
-- Dewin Shimmerdawn: night elf alchemy supplier in Menethil Harbor.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_dewin", id = TODO_NPC("Dewin Shimmerdawn"), name = "Dewin Shimmerdawn", title = "Alchemy Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "serene", "curious" }, values = { "nature", "knowledge" },
  notices = { "craft", "race" },
  impression = {
    first = "Dewin Shimmerdawn is a night elf who sells vials and herbs in Menethil Harbor and studies the marsh between customers. He seems to find the Wetlands beautiful, which nobody else in town does.",
    third = "{name} met Dewin Shimmerdawn, a night elf who sells alchemy supplies in Menethil Harbor.",
  },
  greetings = {
    { id = "g_alch", when = { profession = "Alchemy" }, text = "Ishnu-alah, brewer. I have clean glass and fresh leaf, and I think you will know the difference." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The moon is up, and the marsh is singing. It is a good hour for a visit; I am glad you came." },
    { id = "g_hi", text = "Ishnu-alah. I have vials, and I have the herbs to fill them, if you know what to do with either." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Has the marsh shown you anything worth gathering since we spoke?" },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "You handle plants with care, I think. There is green on your fingertips and none under the nails, which is how a gatherer's hands should look." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Elune-adore, traveller. It is a comfort to see a face from home among so many beards." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Dewin Shimmerdawn. I crossed from Auberdine to learn what grows on this side of the sea, and I sell alchemists their supplies so that I may stay and go on learning." },
        { id = "h_druid", when = { class = "DRUID" }, text = "I am Dewin Shimmerdawn, and you walk the druid's path, I see. Then you already feel how alive this marsh is beneath its mud, though the dwarves call it only a bog." },
      },
      again = {
        { id = "h_again", text = "Is there something more? I am in no hurry; I seldom am." },
        { id = "h_again2", text = "Ask. A question is a kind of seed." },
        { id = "h_again3", text = "Yes? Speak, and I will listen." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What grows in the Wetlands?", next = "grows" },
        { text = "What brought a night elf to Menethil?", next = "came" },
        { text = "How do you find the dwarves and humans here?", next = "folk" },
        { text = "I gather herbs. Where should I look?", next = "herbs", when = { profession = { "Alchemy", "Herbalism" } } },
        { text = "What do you miss about Kalimdor?", next = "miss" },
        { text = "Farewell, Dewin.", next = "END" },
      },
    },
    grows = {
      lines = { { id = "gr_default", text = "A great deal, if one is willing to wade. Liferoot along the banks, kingsblood on the firmer ground, and stranglekelp where the sea comes in. The marsh gives generously, and it takes a boot now and then in payment." } },
      choices = {
        { text = "Do the townsfolk gather any of it?", next = "grows_town" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows_town = {
      big = true,
      lines = { { id = "gt_default", text = "Telurinon Moonshadow teaches those who ask, but few ask. The harbor would rather drain the pools near the wall to keep the crocolisks back, and I understand why. I have also seen what becomes of a land when its waters are cut to suit its builders." } },
      choices = {
        { text = "Leave the marsh as it is. The town can adapt.", next = "BACK", reply = "That is how my people would have it. I will say so to the captain, gently, when he has fewer orcs to think of.", fx = { align = { order = -1 } } },
        { text = "People first. Drain what threatens the wall.", next = "BACK", reply = "The dwarves say the same, and they are not cruel folk. Perhaps a little may be drained, if it is done with care.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    came = {
      lines = { { id = "ca_default", text = "The ship, at first, and curiosity after it. For ten thousand years my people kept to Kalimdor's forests, and now there is an Alliance and a harbor at the end of a sea road. It seemed to me that someone ought to come and look." } },
      choices = {
        { text = "And what have you seen?", next = "came_seen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    came_seen = {
      lines = { { id = "cs_default", text = "That the young races build quickly and grieve quickly, and get up again sooner than we do. This harbor has been threatened every season I have been here, and each morning the bakers still light their ovens. I find I admire that." } },
      choices = { { text = "It's how we manage, I suppose.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    folk = {
      lines = { { id = "fo_default", text = "Loud, kind and impatient, in that order. Innkeeper Helbrek feeds me though I eat little, and Kersok Prond sends me customers when their vials crack. They ask my age and then wish they had not, and I have learned to say only that I am older than the keep." } },
      choices = { { text = "A tactful answer.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    herbs = {
      lines = { { id = "he_default", text = "Follow the water north of the harbor and look where the banks are undercut, for liferoot likes its feet wet. Take one plant in three and leave the roots of the rest, and the bank will have as much for you next season." } },
      choices = { { text = "One in three. I'll keep to that.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    miss = {
      lines = { { id = "mi_default", text = "The quiet beneath the great trees, where even the rain arrives slowly. Here the sky is very near and everything happens at once. But I have found a stand of old willows north of the wall, and when the wind is in them I can close my eyes and nearly be home." } },
      choices = { { text = "I hope the willows stand a long while.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    wetlands = { { id = "tp_wet", text = "Others see mud. I see a land that drinks the sea and the mountain both and makes green of them. It is not gentle, but it is very much alive." } },
    auberdine = { { id = "tp_aub", text = "The harbor on Darkshore where the ship from here makes land. It is grey and quiet and smells of pine, and I think of it when the taverns are loud." } },
    telurinon = { { id = "tp_tel", text = "Telurinon Moonshadow teaches herbalism here. He has been in Menethil longer than I, and has more patience with being stared at." } },
    background = { { id = "tp_bg", text = "I am a student of growing things who sells glass to pay for his lodging. There is no more to it." } },
    _none = { { id = "tp_none", text = "That I do not know. I have been here only a few years, which among my people is hardly an arrival." } },
  },
}

---------------------------------------------------------------------------
-- Brak Durnad: weaponsmith in Menethil Harbor.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_brak", id = TODO_NPC("Brak Durnad"), name = "Brak Durnad", title = "Weaponsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "gruff", "tireless" }, values = { "craft", "duty" },
  notices = { "kit", "class" },
  impression = {
    first = "Brak Durnad forges and sells weapons in Menethil Harbor, and fights a daily war against rust that he does not expect to win. Half his customers are guards from the wall, and he sharpens their blades whether they ask or not.",
    third = "{name} met Brak Durnad, the weaponsmith of Menethil Harbor.",
  },
  greetings = {
    { id = "g_night", when = { timeOfDay = "night" }, text = "The night watch has just been in for their edges. Ye're next, if ye've somethin' needs seein' tae." },
    { id = "g_hi", text = "Weapons, an' good ones. Let me see what ye're carryin' first, for I'll no' sell ye a second till I ken how ye treat the first." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have ye oiled it since? Hm. Ye have, a wee bit. That's somethin'." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "There's rust in the fuller o' that blade, an' a nick I could hang my hat on. Ye'll have it off the grindstone before ye leave this shop, an' nae arguments." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Ye carry steel like ye've used it, an' that's a welcome sight. The wall could do wi' a few more arms like yours." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Brak Durnad, weaponsmith. I make blades for a town where the air itself wants tae eat them, so everythin' I sell is forged heavy an' oiled twice before it leaves the shop." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "Brak Durnad, weaponsmith, an' ye work a forge yerself. Then ye'll pity me, for I've tae quench in water that's half salt an' store steel in a town that's half fog." },
      },
      again = {
        { id = "h_again", text = "What else? I've an edge on the stone, but I can talk over it." },
        { id = "h_again2", text = "Go on, ask." },
        { id = "h_again3", text = "Aye? Speak up over the wheel." },
      },
      choices = {
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "How do you keep steel from rusting here?", next = "rust" },
        { text = "You arm the harbor guard?", next = "guard" },
        { text = "What have the Dragonmaw been carrying?", next = "orcs" },
        { text = "What would you carry into the marsh?", next = "carry", when = { class = { "WARRIOR", "PALADIN", "ROGUE", "HUNTER" } } },
        { text = "What do you forge when the orders are done?", next = "own" },
        { text = "Good day, Brak.", next = "END" },
      },
    },
    rust = {
      lines = { { id = "ru_default", text = "Ye dinnae, ye only slow it. Oil every night, a dry scabbard, an' never put a blade away wet, which in the Wetlands means never puttin' it away. I tell every customer, an' I can count on one hand the ones who listen." } },
      choices = {
        { text = "Who listens?", next = "rust_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rust_who = {
      lines = { { id = "rw_default", text = "Valstag Ironjaw, who keeps his axe like a newborn, an' Murndan Derth the gunsmith, who's fightin' the same war wi' his barrels. The two of us share a cask o' oil an' a great many complaints." } },
      choices = { { text = "At least you've company in it.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    guard = {
      lines = { { id = "gu_default", text = "As well as I can wi' one forge. Captain Stoutfist's lads break or lose a blade a week between the murlocs an' the orcs, an' Brahnmar's as hard pressed wi' their mail. We've both asked Ironforge for another smith, an' Ironforge has sent its regards." } },
      choices = {
        { text = "So what do you do when the orders pile up?", next = "guard_pile" },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard_pile = {
      big = true,
      lines = { { id = "gp_default", text = "I choose, an' I hate it. A guard's sword goes ahead o' a traveller's, always, an' I've had adventurers bang on that counter an' tell me their coin's as good as the captain's. It is, too. What would ye have me do?" } },
      choices = {
        { text = "The wall comes first. Travellers can wait.", next = "BACK", reply = "That's my rule, an' I'll keep it. I'm glad tae hear it from the far side o' the counter for once.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "First come, first served. Coin is coin.", next = "BACK", reply = "Fair by the ledger, aye. But the ledger'll no' hold the gate when the Dragonmaw come down.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcs = {
      lines = { { id = "or_default", text = "Old Horde iron, mostly, crude an' heavy an' older than some o' the orcs swingin' it. The guards bring me what they take off the dead, an' I melt it down, for I'll no' have it sold on as it is. It's bad steel, but there's a great deal o' it." } },
      choices = { { text = "Good use for it.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    carry = {
      lines = {
        { id = "cy_default", text = "Somethin' short enough tae swing in reeds an' heavy enough tae go through a crocolisk's hide. Ye'll no' get a full swing knee-deep in water, so leave the great two-handers on the rack an' take an axe ye can use one-handed." },
        { id = "cy_hunter", when = { class = "HUNTER" }, text = "For a hunter? Keep yer rifle or bow dry in a wrap, an' carry a good axe besides, for a raptor's on ye before ye can reload. I've a hand-axe that'd sit well on yer belt." },
      },
      choices = { { text = "Show me that rack.", next = "BUSINESS" }, { text = "Sound advice. Something else.", next = "BACK" } },
    },
    own = {
      lines = { { id = "ow_default", text = "Fish hooks, if ye'd believe it. There's nae time for anythin' grand, but a hook takes a moment an' the dock lads are always short. Harold Riggs says mine hold a better point than the ones off the boat, an' I've had worse praise." } },
      choices = { { text = "A weaponsmith's fish hook. I'd buy one.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stoutfist = { { id = "tp_stout", text = "Captain Stoutfist holds this harbor wi' too few an' asks for nothin' he'd no' do himself. I'd forge for him for free, if I could afford the coal." } },
    murndan = { { id = "tp_murn", text = "The gunsmith, an' my partner in misery. If ye want tae hear a dwarf curse fog for an hour, buy him a drink." } },
    menethil = { { id = "tp_men", text = "A hard post an' a wet one. I'd no' leave it while there's a guard on that wall needin' an edge." } },
    brahnmar = { { id = "tp_brahn", text = "The armourer. A good dwarf, an' as tired as I am. Between us we keep the garrison in one piece." } },
    background = { { id = "tp_bg", text = "I learned my trade at the Great Forge an' brought it down tae the sea. Some days I wonder why." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye. I've had my head over a grindstone since first light." } },
  },
}

---------------------------------------------------------------------------
-- Jennabink Powerseam: gnome tailoring supplier with a cart between the inn and the gryphon roost.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_jennabink", id = TODO_NPC("Jennabink Powerseam"), name = "Jennabink Powerseam", title = "Tailoring Supplies & Specialty Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "menethil", "gnomeregan" }, temper = { "bright", "busy" }, values = { "craft", "practical" },
  notices = { "craft", "kit" },
  impression = {
    first = "Jennabink Powerseam sells thread, dye and odd patterns from a cart in Menethil Harbor, parked where everyone leaving town must pass it. She has opinions on waterproofing and shares them freely.",
    third = "{name} met Jennabink Powerseam, a gnome who sells tailoring supplies from a cart in Menethil Harbor.",
  },
  greetings = {
    { id = "g_gnome", when = { race = "Gnome" }, text = "Thread, dye, needles and patterns, and a friendly face at eye level for once! Hello, hello." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "I'm just putting the cover on, but I'll take it off again for a customer. What do you need?" },
    { id = "g_hi", text = "Thread, dye, needles and patterns! And if your cloak is letting the rain in, which it is, I can tell you why." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Did the seam hold? I've been wondering, I do wonder about seams." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Your left cuff is hand-stitched and your right isn't, so you learned partway through that shirt. Good for you, that's how everyone starts." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Oh my. You do know it rains here four days in five? I've linen and a needle, and I'd start sewing immediately, if I were you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jennabink Powerseam! I keep my cart here between the inn and the gryphons because that's where people remember, all at once, that they've a torn sleeve and a long way to go." },
        { id = "h_gnome", when = { race = "Gnome" }, text = "Jennabink Powerseam, and you're a gnome, how lovely! I've a pattern here cut for sensible proportions, which you will not find anywhere else in this town." },
      },
      again = {
        { id = "h_again", text = "What else? I'm only winding bobbins." },
        { id = "h_again2", text = "Go on, ask! I can count stitches and talk, I've tested it." },
        { id = "h_again3", text = "Yes? Mind the wheel, it's chocked but I don't entirely trust the chock." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "How do you keep cloth dry in the Wetlands?", next = "dry" },
        { text = "What are the specialty goods?", next = "special" },
        { text = "Why a cart, and not a shop?", next = "cart" },
        { text = "What should a tailor make for this weather?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "What colours sell in a port?", next = "colours" },
        { text = "Goodbye, Jennabink.", next = "END" },
      },
    },
    dry = {
      lines = { { id = "dr_default", text = "Wax! Beeswax rubbed into the weave and warmed in, twice, with special attention to the shoulder seams. The dwarves use tar, which works and smells dreadful, and the humans use hope, which doesn't work at all." } },
      choices = {
        { text = "And what do the sailors use?", next = "dry_sailors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dry_sailors = {
      lines = { { id = "ds_default", text = "Oiled canvas, and they're right to, it's the best thing for spray. First Mate Fitzsimmons showed me how they treat it, and I've improved the mixture by about fifteen percent, though he says I've only made it smell of lavender." } },
      choices = { { text = "Lavender is an improvement.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    special = {
      lines = { { id = "sp_default", text = "Patterns, mostly, and now and then a recipe or a schematic that came in on a ship with no one to claim it. I buy them from sailors who won't say where they were found, and I've decided the polite thing is not to press." } },
      choices = {
        { text = "Not asking is one way to keep a clean conscience.", next = "special_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    special_ask = {
      big = true,
      lines = { { id = "sa_default", text = "Oh dear, when you put it like that. I suppose some of it might be salvage from a wreck, or worse than salvage. But a pattern isn't a jewel, it's knowledge, and it does no good at the bottom of a sea chest. Should I be asking, do you think?" } },
      choices = {
        { text = "Ask. Goods without a story may be stolen.", next = "BACK", reply = "You're right, I know you're right. I'll ask the next one, and write the answer down, in case anybody comes looking.", fx = { align = { honor = 1 } } },
        { text = "Knowledge should be used. Sell them.", next = "BACK", reply = "That's what I've told myself! It's a relief to hear someone else say it, though I notice it's still me doing the selling.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cart = {
      lines = { { id = "ca_default", text = "A shop costs rent and stays where it is, and a cart costs a wheel now and then and goes wherever the customers are. When a ship comes in I roll down toward the dock, and when it rains hard I roll under the inn's eaves, and Innkeeper Helbrek pretends not to mind." } },
      choices = { { text = "A sensible arrangement.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    tailor = {
      lines = { { id = "tl_default", text = "Cloaks, and line them! Everyone here buys a cloak within a week of arriving and a second within a month, because the first was a single layer. Put a wool lining in and wax the outer, and you can name your price at the dock." } },
      choices = { { text = "Lined and waxed. Thank you.", next = "BACK", fx = { affinity = 1 } }, { text = "Sell me the thread for it.", next = "BUSINESS" } },
    },
    colours = {
      lines = { { id = "cl_default", text = "Blue to the sailors, always, and grey to the dwarves, who say it doesn't show the mud. I brought a lovely orange in the spring and sold exactly none of it, except to one elf, who bought the entire bolt and wouldn't say why." } },
      choices = { { text = "Somewhere there's a very orange elf.", next = "BACK", reply = "I do hope so! I'd like to see it, just once.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    helbrek = { { id = "tp_helb", text = "The innkeeper. He grumbles when I park under his eaves, and then he sends his barmaid out with soup, so I've stopped taking the grumbling seriously." } },
    menethil = { { id = "tp_men", text = "Wet, busy and full of people with torn clothes. Professionally speaking, it's perfect." } },
    gnomeregan = { { id = "tp_gnomer", text = "I was a seamstress there, in a workshop with proper lamps. I do miss the lamps." } },
    background = { { id = "tp_bg", text = "I sew, I sell, and I push a cart. It's a small business, and it's entirely mine." } },
    _none = { { id = "tp_none", text = "I'm afraid I've no idea. If it can't be stitched or dyed, I probably wasn't paying attention." } },
  },
}

---------------------------------------------------------------------------
-- Fradd Swiftgear: gnome engineering supplier camped on the rise north of the harbor road.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_fradd", id = TODO_NPC("Fradd Swiftgear"), name = "Fradd Swiftgear", title = "Engineering Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "wetlands", "gnomeregan" }, temper = { "cheerful", "distracted" }, values = { "craft", "curious" },
  notices = { "craft", "race" },
  impression = {
    first = "Fradd Swiftgear sells engineering parts from a small camp on a rise above the Wetlands road, well away from any town. He says the damp is ideal for testing, and seems not to have noticed how far he is from customers.",
    third = "{name} met Fradd Swiftgear, a gnome who sells engineering supplies from a camp in the Wetlands.",
  },
  greetings = {
    { id = "g_night", when = { timeOfDay = "night" }, text = "Oh! You set off the east bell. No harm done, I'm awake, I'm always awake. What can I get you?" },
    { id = "g_eng", when = { profession = "Engineering" }, text = "An engineer, at my camp! Sit, sit, there's tea, and I've a question about fuse cord I've been saving for someone qualified." },
    { id = "g_hi", text = "A customer! Out here! Wonderful, I was beginning to think the sign had fallen over again." },
    { id = "g_back", when = { metBefore = true }, text = "You found the camp twice! That's very nearly a record. What can I get you?" },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Oh, thank goodness. Tell me, do your fuses sputter in this weather, or is it only mine?" },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, this far into the bog! Mind the third tent peg, it's holding up an experiment." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Fradd Swiftgear, engineering supplies. I set up out here because a part that works in the Wetlands will work anywhere, and so far about half of them do, which is very useful to know." },
        { id = "h_eng", when = { profession = "Engineering" }, text = "Fradd Swiftgear! I've bolts, powder, tubes and a few schematics, and every one of them has survived a month in this air, so you may consider them thoroughly tested." },
      },
      again = {
        { id = "h_again", text = "What else? I've a gauge to read, but it only changes when it rains, so, constantly." },
        { id = "h_again2", text = "Ask away! It's very quiet up here, apart from the raptors." },
        { id = "h_again3", text = "Yes? Go on, I'm only half watching the kettle." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why set up shop in the middle of a marsh?", next = "why" },
        { text = "Who shares this camp with you?", next = "camp" },
        { text = "Aren't you worried, out here alone?", next = "worry" },
        { text = "What fails first in this damp?", next = "fail", when = { profession = "Engineering" } },
        { text = "What's the experiment on the tent peg?", next = "peg" },
        { text = "Goodbye, Fradd.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Testing conditions! Salt air, standing water, fog two mornings in three. Tinker Town is warm and dry, and everything works in Tinker Town, which tells you nothing. Out here a spring that's going to rust does it in a week, and I can cross it off." } },
      choices = {
        { text = "And the customers?", next = "why_customers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_customers = {
      big = true,
      lines = { { id = "wc_default", text = "Ah. Yes. There are fewer than projected. Wenna says I should move down to Menethil and sell from the dock like a sensible person, and that knowing which bolts rust isn't worth much if nobody buys the ones that don't. I say the testing is the point. Is it?" } },
      choices = {
        { text = "Stay. Work done properly is worth the lean years.", next = "BACK", reply = "That's exactly my position! I shall tell Wenna that an independent observer concurred.", fx = { align = { order = -1 } } },
        { text = "Move to the harbor. A shop needs buyers.", next = "BACK", reply = "Oh, bother. That's two against one. I'll run the figures again, though I already know what they say.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "cp_default", text = "Wenna Silkbeard, who deals in special goods and has much better business sense than I have. She chose the spot for the view of the road, and I chose it for the humidity, so we were both pleased, which hardly ever happens." } },
      choices = {
        { text = "An odd partnership, cloth and cogs.", next = "camp_odd" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_odd = {
      lines = { { id = "co_default", text = "Not so odd! She needed someone to mend the cart axle, and I needed someone to remind me to eat. We've shared a fire for two years on those terms, and neither the axle nor I have failed yet." } },
      choices = { { text = "That's a good bargain.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    worry = {
      lines = { { id = "wo_default", text = "A little! The raptors come sniffing round at dusk, and the murlocs are only down the slope. But I've strung a wire with bells on it and buried a few noisemakers, and so far everything that's tripped one has left faster than it arrived." } },
      choices = { { text = "I'll watch where I step, then.", next = "BACK", reply = "Please do! The ones by the path are marked with a little flag. Most of them.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    fail = {
      lines = { { id = "fa_default", text = "Springs, then fuses, then anything with a leather seal. Copper tube goes green but keeps working, and good dwarven steel bolts last longest if you grease the threads. I've a notebook with the full table, and you're the first person who's ever asked to hear any of it." } },
      choices = { { text = "Grease the threads. I'll remember.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    peg = {
      lines = { { id = "pg_default", text = "A rain gauge, a wind vane and a copper strip, all wired to one dial, so I can see how fast the metal tarnishes against how wet it's been. It's been running for seven months. The answer so far is 'quickly', but I'd like a second decimal place." } },
      choices = { { text = "Seven months for a decimal place.", next = "BACK", reply = "That's very reasonable, by research standards! You should see how long the first one took.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    gnomeregan = { { id = "tp_gnomer", text = "I try not to think about it too directly. I think about bolts, and the bolts have never let me down the way the ventilation did." } },
    wenna = { { id = "tp_wenna", text = "Wenna Silkbeard, my neighbour at the fire. She's sharp, she's kind, and she's right about most things, which I try not to hold against her." } },
    menethil = { { id = "tp_men", text = "Down the road to the south-west. I go in once a month for tea and solder, and come back with a headache from the noise." } },
    background = { { id = "tp_bg", text = "I'm an engineer from Gnomeregan who tests parts in bad weather. It's a narrow field, but I'm at the top of it." } },
    _none = { { id = "tp_none", text = "No idea, I'm afraid! News reaches this camp about a month after it's stopped being news." } },
  },
}

---------------------------------------------------------------------------
-- Wenna Silkbeard: special goods dealer sharing Fradd Swiftgear's camp.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_wenna", id = TODO_NPC("Wenna Silkbeard"), name = "Wenna Silkbeard", title = "Special Goods Dealer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "wetlands" }, temper = { "canny", "warm" }, values = { "practical", "loyal" },
  notices = { "craft", "race" },
  impression = {
    first = "Wenna Silkbeard deals in patterns and fine cloth from a camp above the Wetlands road, where she can see every traveller before they see her. She is sharp about money and soft about the gnome she shares a fire with.",
    third = "{name} met Wenna Silkbeard, a dwarf who sells special goods from a camp in the Wetlands.",
  },
  greetings = {
    { id = "g_night", when = { timeOfDay = "night" }, text = "Come intae the firelight where I can see ye. Aye, ye'll do. Sit, an' keep yer voice down, for Fradd's finally asleep." },
    { id = "g_hi", text = "I saw ye comin' up from the road a quarter hour back. Sit down, then, an' I'll show ye what I've got that the harbor hasnae." },
    { id = "g_back", when = { metBefore = true }, text = "Ye again! Good. Fradd's been talkin' tae me about bolts since breakfast, an' I'm glad o' the rescue." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor, by that hem. Ye'll want tae see the patterns, an' I'll warn ye now, the good ones go quick an' I dinnae hold them." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, out in the bog. Ye'll be wonderin' what I'm doin' here, an' the answer is makin' a better livin' than I did under the mountain." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Wenna Silkbeard. I deal in the sort o' goods ye cannae find on a shop shelf, patterns for fine silk work an' the like, an' I keep camp here because every road in the Wetlands can be seen from this rise." },
        { id = "h_tailor", when = { profession = "Tailoring" }, text = "Wenna Silkbeard, an' ye're just the customer I set up here for. I've patterns that the Ironforge shops would mark up threefold, if they could get them at all." },
      },
      again = {
        { id = "h_again", text = "What else? The kettle's on, so ye may as well ask." },
        { id = "h_again2", text = "Go on. I can talk an' keep an eye on the road both." },
        { id = "h_again3", text = "Aye? Ask away." },
      },
      choices = {
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Why trade from a camp, not the harbor?", next = "camp" },
        { text = "Tell me about your neighbour.", next = "fradd" },
        { text = "You watch the road closely.", next = "road" },
        { text = "Where do your patterns come from?", next = "patterns", when = { profession = "Tailoring" } },
        { text = "Good day, Wenna.", next = "END" },
      },
    },
    camp = {
      lines = { { id = "ca_default", text = "Nae rent, nae harbor dues, an' first sight o' every traveller comin' down from Dun Modr or up from the dock. By the time they reach Menethil they've already bought from me, an' the harbor traders have never worked out why their silk patterns dinnae sell." } },
      choices = {
        { text = "That's sharp practice.", next = "camp_sharp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_sharp = {
      big = true,
      lines = { { id = "cs_default", text = "Is it? I pay nae dues because I use nae dock, an' I sell at a fair price tae folk who'd otherwise walk on by. Jennabink Powerseam down in the harbor says I'm skimmin' her custom, an' I say there's nae law that a trader must stand where she's told." } },
      choices = {
        { text = "Jennabink has a point. Pay your share to the town.", next = "BACK", reply = "Hmph. Ye're no' the first tae say it. I'll send the captain a few silver for the wall, an' ye can tell her I did.", fx = { align = { order = 1 } } },
        { text = "A free road is a free market. Well played.", next = "BACK", reply = "Ha! That's the spirit that built Ironforge's fortunes, whatever the senators say now.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fradd = {
      lines = { { id = "fr_default", text = "Fradd Swiftgear's the cleverest soul I ken an' he's nae more business sense than a boiled egg. He set up here for the weather, if ye can credit it, an' I stayed on because somebody had tae see he charged for things." } },
      choices = {
        { text = "You look after him.", next = "fradd_look" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fradd_look = {
      lines = { { id = "fl_default", text = "Somebody must. He lost his home an' half his friends when Gnomeregan fell, an' he copes by countin' rusty bolts. I'll no' have him doin' it alone in a bog, so I count my coins beside him, an' we call it a partnership." } },
      choices = { { text = "He's lucky in his neighbour.", next = "BACK", reply = "Dinnae tell him that. He'll write it in his notebook under 'findings'.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    road = {
      lines = { { id = "ro_default", text = "It's my livin' an' my safety both. I can tell a merchant from a soldier from a refugee by how they walk, an' I can tell when the road's gone empty, which is when I bank the fire an' keep my crossbow tae hand." } },
      choices = {
        { text = "Who's been on it lately?", next = "road_lately" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_lately = {
      lines = { { id = "rl_default", text = "Dwarves headed north tae Dun Modr wi' grim faces, an' fewer comin' back. League carts for Whelgar's dig, an' one thin human who walks up an' down askin' after his wife. I leave bread out for that one, an' I've never once seen him take it while I'm lookin'." } },
      choices = { { text = "That's kind of you, Wenna.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    patterns = {
      lines = { { id = "pa_default", text = "Some from Ironforge tailors who owe me favours, an' some off the Auberdine ship, for the elves cut silk in ways our lot never thought of. I'll no' name my sources, but I'll promise ye every one's been sewn up once tae prove it works." } },
      choices = { { text = "A tested pattern is worth the coin.", next = "BUSINESS" }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    menethil = { { id = "tp_men", text = "Down the road, behind its wall. I go in for flour an' gossip, an' I leave before anybody asks me about harbor dues." } },
    jennabink = { { id = "tp_jenn", text = "The gnome wi' the cart by the inn. She's a fair seamstress an' a fair rival, an' if she'd come up here I'd share the fire wi' her gladly." } },
    fradd = { { id = "tp_fradd", text = "My neighbour, the gnome wi' the bells an' the notebook. He's worth ten o' most folk, an' he'll never ken it." } },
    dun_modr = { { id = "tp_modr", text = "North up the road. The Dark Irons took it, an' our lads are camped outside tryin' tae take it back. I send what cloth I can spare for bandages." } },
    background = { { id = "tp_bg", text = "I was a draper's daughter in Ironforge. I prefer the open air an' the open market." } },
    _none = { { id = "tp_none", text = "I couldnae say. If it hasnae walked past on that road, I've no' seen it." } },
  },
}

---------------------------------------------------------------------------
-- Kixxle: goblin potion and herb seller on the marsh road.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_kixxle", id = TODO_NPC("Kixxle"), name = "Kixxle", title = "Potions & Herbs",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "wetlands" }, temper = { "pushy", "cheerful" }, values = { "profit", "practical" },
  notices = { "kit", "craft" },
  impression = {
    first = "Kixxle is a goblin who sells potions and herbs from the side of the Wetlands road, a long way from anyone who might undercut him. He prices a customer's wounds at a glance and sells to whichever side walks up.",
    third = "{name} met Kixxle, a goblin who sells potions and herbs on the road through the Wetlands.",
  },
  greetings = {
    { id = "g_night", when = { timeOfDay = "night" }, text = "Whoa, hey, don't sneak up on a guy! Night rates apply, pal, that's just the lamp oil talkin'." },
    { id = "g_poor", when = { money = { max = 100 } }, text = "Hey, pal, I can hear your purse from here and it ain't jinglin'. Come back when it does, I'll still be sittin' on this blanket." },
    { id = "g_hi", text = "Hey, hey, pal, over here! You look like somebody who's about to need a potion, and I happen to be the only one sellin' for ten miles." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite repeat customer! You're still alive, so the product works, and that's the best advertisin' I got." },
  },
  notice = {
    { id = "n_hurt", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Whoa, whoa, look at the state of you! That's at least three healin' potions' worth of bad decisions, and lucky for you, I'm fully stocked." },
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "A fellow professional! So you know what this stuff costs to make, and I'll thank you not to mention it in front of the other customers." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Kixxle's the name, potions and herbs, and before you ask, yeah, I sell to Alliance, I sell to Horde, and I'd sell to the crocolisks if they carried coin. Out here a potion's worth double what it is in town, and I only charge a little more than that." },
        { id = "h_horde", when = { faction = "Horde" }, text = "Kixxle's the name, and you're a long way from a friendly inn, pal. Good news is my prices don't care what banner you march under, so step right up." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Talk fast, I'm losin' daylight and daylight's overhead." },
        { id = "h_again2", text = "Go on, ask, but if a customer walks up I'm droppin' you mid-sentence, nothin' personal." },
        { id = "h_again3", text = "Yeah? Make it quick and maybe buy somethin' after." },
      },
      choices = {
        { text = "Show me what you're selling.", next = "BUSINESS" },
        { text = "Why set up on an empty road?", next = "road" },
        { text = "You sell to both sides?", next = "sides" },
        { text = "Where do the herbs come from?", next = "herbs" },
        { text = "I brew my own. What do you pay for stock?", next = "alch", when = { profession = { "Alchemy", "Herbalism" } } },
        { text = "What's your best seller?", next = "seller" },
        { text = "See you around, Kixxle.", next = "END" },
      },
    },
    road = {
      lines = { { id = "ro_default", text = "Empty? Pal, this is prime territory. Everybody who walks this road is halfway between two towns with somethin' chewin' on 'em, and there's no other shop to compare prices with. I call that a captive market, and I mean it in the friendliest way." } },
      choices = {
        { text = "And nothing out here bothers you?", next = "road_bother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_bother = {
      lines = { { id = "rb_default", text = "Sure it does, that's a cost of doin' business. The raptors I handle with a little somethin' in a bottle that smells worse than they do, and the gnolls I pay off in jerky, which goes on the books as security. Still cheaper than rent in Booty Bay." } },
      choices = { { text = "You've costed it all out.", next = "BACK", reply = "Down to the copper, friend. A goblin who don't know his overhead is just a short guy in a bog.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    sides = {
      big = true,
      lines = { { id = "si_default", text = "Listen, listen, a healin' potion don't ask who it's healin'. I had a Dragonmaw scout and a dwarf mountaineer buy off this same blanket inside an hour last month, and both of 'em walked away alive. Some folks say that makes me a war profiteer, and I say it makes me neutral." } },
      choices = {
        { text = "Healing either side prolongs the killing.", next = "BACK", reply = "Or it means fewer widows on both ends, pal. But hey, you got principles, and I respect a thing I can't afford.", fx = { align = { order = 1 } } },
        { text = "A wound is a wound. Sell to whoever bleeds.", next = "BACK", reply = "Now that's a customer who understands the business! You ever want a job haulin' crates, you look me up.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = { { id = "he_default", text = "Half of it grows within a stone's throw, which is the beauty of the location. I got a couple of local kids from Menethil who pick for me by the bundle, and I pay 'em fair, meanin' I pay 'em, which is more than the marsh does." } },
      choices = {
        { text = "Kids, picking herbs among crocolisks?", next = "herbs_kids" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs_kids = {
      lines = { { id = "hk_default", text = "Whoa, hey, on the dry side only, I ain't a monster, and besides, a kid gettin' eaten is terrible for supply. I give 'em a whistle and a stink bottle each, and that comes out of my end. Call it an investment in the workforce." } },
      choices = { { text = "That's almost responsible of you.", next = "BACK", reply = "Keep it down, will ya? I got a reputation.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    alch = {
      lines = { { id = "al_default", text = "For finished potions? About a third of what I sell 'em for, and before you make that face, I'm the one sittin' in a bog all day movin' the product. Bring me healin' or swim speed and I'll take all you got, 'cause those two walk off the blanket." } },
      choices = { { text = "A third. I'll think about it.", next = "BACK", reply = "Think fast, the offer's got a shelf life, same as the potions.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    seller = {
      lines = { { id = "sl_default", text = "Healin' potions, by a mile, and right behind 'em the one that lets you breathe underwater, on account of there's a whole wrecked fleet in the bay and everybody figures they'll be the one to find the gold. Nobody's found it yet, and they all come back for more potions, so everybody wins, mostly me." } },
      choices = { { text = "Show me the water-breathing ones.", next = "BUSINESS" }, { text = "You profit from hope, Kixxle.", next = "BACK", reply = "Hope's a renewable resource, friend. Best kind there is.", fx = { trait = { witty = 1 } } } },
    },
  },
  topics = {
    menethil = { { id = "tp_men", text = "Nice little port, lots of rules. I go in for supplies and get out before somebody mentions a vendor's licence." } },
    steamwheedle = { { id = "tp_steam", text = "The Cartel's got ports and rules and dues. Me, I'm what you'd call an independent, which means I keep all of it and nobody comes lookin' if I go missin'." } },
    dragonmaw = { { id = "tp_dragon", text = "Mean, broke and always bleedin', so they're decent customers. I don't ask about the war and they don't ask about my margins." } },
    background = { { id = "tp_bg", text = "I'm a businessman, friend. I found a spot with no competition, and I've been sittin' on it ever since." } },
    _none = { { id = "tp_none", text = "Couldn't tell ya, pal, and if I could, I'd be chargin' for it." } },
  },
}

---------------------------------------------------------------------------
-- Second pass of missed Menethil Harbor folk: the bowyers, the reagent seller, the dock hands,
-- the captain of the Maiden's Virtue, the tavern regulars and Caitlin Grassman.
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Naela Trance: human bowyer in Menethil Harbor.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_naela", id = TODO_NPC("Naela Trance"), name = "Naela Trance", title = "Bowyer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "steady", "wry" }, values = { "craft", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "Naela Trance makes and sells bows in Menethil Harbor, where the damp ruins a string in a week. She waxes everything twice and has a low opinion of anyone who stores a bow strung.",
    third = "{name} met Naela Trance, a bowyer in Menethil Harbor.",
  },
  greetings = {
    { id = "g_hi", text = "Bows, arrows and dry strings, which in this town is the hard part. Come in out of the wet." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Tell me you unstrung it at night, and I'll believe you if you say it quickly." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter, and headed into the marsh, I expect. You'll want spare strings, and then one more than that." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "You came in on the Auberdine boat. Your people's bows are lovely things, and I've no idea how you keep them alive in sea air." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Your string is fraying at the nock, just there. The marsh does that, and it always goes at the worst moment." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Naela Trance, and I make bows for the guard and for anyone going out past the gate. Edwina Monzor does the same trade across town, so between us nobody in Menethil has an excuse to be unarmed." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "Naela Trance. If it's a gun you're after, Murndan Derth is your man. If you'd like to hunt something without waking the whole marsh, stay and talk to me." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? I'm only waxing, it'll keep." },
        { id = "h_again2", text = "Go on. Rain's coming, so neither of us is going anywhere." },
      },
      choices = {
        { text = "Show me your bows.", next = "BUSINESS" },
        { text = "The damp must be murder on a bowstring.", next = "damp" },
        { text = "Two bowyers in a town this size?", next = "edwina" },
        { text = "What do hunters shoot at out there?", next = "marsh" },
        { text = "Who buys the most from you?", next = "guard" },
        { text = "How do I keep a bow alive in the marsh?", next = "keep" },
        { text = "Farewell, Naela.", next = "END" },
      },
    },
    damp = {
      lines = { { id = "da_default", text = "It is. A string drinks the air here, stretches, and then you're shooting a foot low and wondering why. I wax them with tallow and beeswax and keep them in a tin by the stove, and I tell every customer to do the same." } },
      choices = {
        { text = "Do they listen?", next = "damp_listen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    damp_listen = {
      lines = { { id = "dl_default", text = "The ones who've missed a crocolisk at ten paces do. The rest come back with a snapped string and a story, and I sell them a tin along with the new one." } },
      choices = { { text = "A crocolisk is a firm teacher.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    edwina = {
      lines = { { id = "ed_default", text = "There's work for both. Edwina makes a heavier bow than I do and swears by it, and I think a hunter who's wading to the knee wants something light. We've argued it for years and still share a pot of tea on slow days." } },
      choices = { { text = "Friendly rivals are the best kind.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    marsh = {
      lines = { { id = "ma_default", text = "Crocolisks, raptors and whatever the murlocs are riled about that week. Further out there are gnolls on the road, and the Dragonmaw orcs up toward Dun Algaz, though I'd leave those to Captain Stoutfist's soldiers." } },
      choices = {
        { text = "Which is the worst of them?", next = "marsh_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marsh_worst = {
      big = true,
      lines = { { id = "mw_default", text = "The raptors, because they think. One shows itself and two more come round behind you. I've had hunters tell me they bait them with a wounded one to draw the pack in, and I've never decided what I think of that." } },
      choices = {
        { text = "It's cruel. Kill clean or don't hunt.", next = "BACK", reply = "That's my feeling, when I'm honest. I sell them the arrows either way.", fx = { align = { light = 1 } } },
        { text = "It's clever. They'd do the same to us.", next = "BACK", reply = "They would, and they have. I suppose the marsh doesn't reward manners.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guard = {
      lines = { { id = "gu_default", text = "The harbor guard, by the sheaf. They stand on that wall all night shooting at shapes in the fog, and half the shapes are driftwood. I don't mind, because driftwood pays the same as murlocs." } },
      choices = { { text = "Honest work, either way.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    keep = {
      lines = { { id = "y1_default", text = "Unstring it every night, wax the string every third day, and never lay it on the ground. Hang it from a branch if you've nothing else. A bow that's slept in the mud is firewood by the end of the week." } },
      choices = { { text = "I'll hang it high.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    menethil = { { id = "tp_menethil", text = "It's wet, it smells of fish, and it's the only safe bed between Dun Algaz and the Thandol Span. You learn to like it." } },
    edwina = { { id = "tp_edwina", text = "Edwina Monzor is the other bowyer. She makes a strong bow and a strong pot of tea, and I'd trust her with either." } },
    murndan = { { id = "tp_murndan", text = "Murndan Derth sells guns to the dwarves, and powder that's damp half the year. He'll never admit a bow has the advantage here." } },
    background = { { id = "tp_bg", text = "I learned bowmaking in Stormwind and came north for the work. There's always work where there's a wall and a marsh." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask at the tavern, they know everything and half of it's true." } },
  },
}

---------------------------------------------------------------------------
-- Edwina Monzor: human bowyer in Menethil Harbor.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_edwina", id = TODO_NPC("Edwina Monzor"), name = "Edwina Monzor", title = "Bowyer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "brisk", "proud" }, values = { "craft", "brave" },
  notices = { "class", "kit" },
  impression = {
    first = "Edwina Monzor sells arrows, quivers and heavy bows in Menethil Harbor. She has the forearms of someone who tests every draw herself, and she fletches while she talks.",
    third = "{name} met Edwina Monzor, a bowyer in Menethil Harbor.",
  },
  greetings = {
    { id = "g_hi", text = "Arrows by the sheaf and bows that will stop a raptor. What are you hunting, and how angry is it?" },
    { id = "g_back", when = { metBefore = true }, text = "Back already? Then you found something worth shooting, and I'm glad to hear it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "I'm open late, because the night watch runs short at the worst hours. What do you need?" },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "That quiver's sitting too high on your back. Drop it a hand, and you'll draw faster and curse less." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "The marsh has been at your gear. Oil the metal tonight, or you'll have rust by the week's end." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Edwina Monzor. I make a heavy bow, because the beasts in the Wetlands have thick hides and bad tempers, and I fletch every arrow I sell. Naela Trance will tell you a light bow is better, and Naela is wrong." },
        { id = "h_hunter", when = { class = "HUNTER" }, text = "Edwina Monzor. Good, a hunter. Draw this one for me and hold it, and I'll know in a breath what weight to sell you." },
      },
      again = {
        { id = "h_again", text = "What else? I can fletch and listen." },
        { id = "h_again2", text = "Yes? Ask, I've another forty of these to do before dark." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Why a heavy bow?", next = "heavy" },
        { text = "You fletch every arrow yourself?", next = "fletch" },
        { text = "Has the town ever needed your arrows on the wall?", next = "wall" },
        { text = "Naela says a wading hunter wants something light.", next = "naela" },
        { text = "What arrowhead should I carry out there?", next = "heads" },
        { text = "Farewell, Edwina.", next = "END" },
      },
    },
    heavy = {
      lines = { { id = "he_default", text = "Because you get one shot at a crocolisk before it's on you. A light arrow sticks in the hide and annoys it, and a heavy one goes through. I'd sooner a hunter were tired than eaten." } },
      choices = { { text = "Tired over eaten. That's hard to argue.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    fletch = {
      lines = { { id = "fl_default", text = "Every one. I use goose for the guard's arrows and gull for my own, because gull feathers shed water. The fishermen save them for me, and Stuart Fleming brings a sackful every time his nets come up fouled with birds." } },
      choices = {
        { text = "Gull feathers. I'd not have guessed.", next = "fletch_gull" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fletch_gull = {
      lines = { { id = "fg_default", text = "Nobody does, and the Stormwind fletchers would laugh. But a goose-feathered arrow flies like a wet rag after an hour in this fog, and mine still go straight. You make do with what the place gives you." } },
      choices = { { text = "That's the mark of a real craftsman.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    wall = {
      lines = { { id = "wa_default", text = "More than once. When the murlocs come up the beach at low tide, every archer on the wall is shooting my arrows, and I stand at the bottom of the stair passing up sheaves. I've never had the count come back short." } },
      choices = {
        { text = "Do you charge the guard for those?", next = "wall_charge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wall_charge = {
      big = true,
      lines = { { id = "wc_default", text = "I send Captain Stoutfist a bill afterward, at the full price. Some in town say I ought to give them freely when the wall's under attack, and I say a bowyer who gives her stock away has none for the next attack. What would you do?" } },
      choices = {
        { text = "Give them freely. It's your town too.", next = "BACK", reply = "Hm. I do pass them up before I count them. Perhaps that's nearer your way than I let on.", fx = { align = { light = 1 } } },
        { text = "Charge. A wall needs paying for.", next = "BACK", reply = "Just so, and Stoutfist has never once argued the bill.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    naela = {
      lines = { { id = "na_default", text = "She would say that. Her bows are very pretty and very quick, and they're fine for marsh birds. When you meet something with teeth as long as your hand, come and see me." } },
      choices = { { text = "I'll keep both of you in mind.", next = "BACK", reply = "A diplomat. You'll go far, or at least you'll get tea in both shops.", fx = { trait = { witty = 1 } } } },
    },
    heads = {
      lines = { { id = "y1_default", text = "Broadheads for anything with a hide, and take twice what you think. A plain point will do for marsh birds. Don't bother with barbs against murlocs, because they pull them out and throw them back at you." } },
      choices = { { text = "I'd not have guessed that about murlocs.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    menethil = { { id = "tp_menethil", text = "It's a garrison with a fish market. I like it well enough, and I like the wall around it better." } },
    naela = { { id = "tp_naela", text = "Naela Trance is a fine bowyer with wrong opinions. We take tea together, and I let her think she's winning." } },
    stoutfist = { { id = "tp_stoutfist", text = "Captain Stoutfist pays what he owes and drills his archers twice a week. I've no complaint about the dwarf." } },
    background = { { id = "tp_bg", text = "My father fletched for the king's army. I do the same for a smaller wall, and it's needed more." } },
    _none = { { id = "tp_none", text = "I don't know. If it can be shot, I can tell you with what." } },
  },
}

---------------------------------------------------------------------------
-- Falkan Armonis: human reagent vendor in Menethil Harbor.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_falkan", id = TODO_NPC("Falkan Armonis"), name = "Falkan Armonis", title = "Reagents",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "menethil" }, temper = { "courteous", "fretful" }, values = { "knowledge", "careful" },
  notices = { "class", "race" },
  impression = {
    first = "Falkan Armonis sells spell reagents in Menethil Harbor and spends most of his effort keeping them dry. He is polite, a little anxious, and checks his jars for mould every morning.",
    third = "{name} met Falkan Armonis, who sells reagents in Menethil Harbor.",
  },
  greetings = {
    { id = "g_hi", text = "Good day to you. Reagents for every school, all of them dry, which I promise you is an achievement here." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. I hope the last lot served, and that you kept them stoppered as I asked." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage, and bound for Theramore or Darnassus, I'd guess. Do stock up, for there's nothing between here and the far shore." },
  },
  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "I have what you need, and I keep it in the lower cupboard. I'd be obliged if you didn't mention it to the dwarves." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Your druids buy seeds from me for their travels east. They're gracious customers, though they do look sadly at the jars." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Falkan Armonis, at your service. This is the last place to buy a rune or a candle before the long crossing, so I see every mage and priest who passes through the harbor, usually in a hurry and usually short of something." },
        { id = "h_caster", when = { class = { "PRIEST", "MAGE", "DRUID", "PALADIN" } }, text = "Falkan Armonis. I can see you've a use for my stock, so tell me what you're short of, and I'll tell you honestly whether the damp has got to it." },
      },
      again = {
        { id = "h_again", text = "Is there anything else? I'm only checking stoppers." },
        { id = "h_again2", text = "Yes, do ask. It's a quiet hour between boats." },
      },
      choices = {
        { text = "Let me see your reagents.", next = "BUSINESS" },
        { text = "How do you keep powder dry in a swamp?", next = "dry" },
        { text = "You must see a lot of travellers.", next = "travellers" },
        { text = "Does the town trust a man who sells to mages?", next = "trust" },
        { text = "What do casters forget to buy?", next = "forget" },
        { text = "Farewell, Falkan.", next = "END" },
      },
    },
    dry = {
      lines = { { id = "dr_default", text = "With great difficulty and a good deal of wax. Every jar is sealed, every sealed jar sits in a box of salt, and the boxes sit on a shelf above the stove. I lost a whole season's arcane powder my first year, and I've been frightened of fog ever since." } },
      choices = {
        { text = "What happens to damp arcane powder?", next = "dry_damp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dry_damp = {
      lines = { { id = "dd_default", text = "It clumps, and then it hums, and then you carry it outside very gently and throw it in the harbor. The fish glowed for a week. Stuart Fleming still brings it up whenever I ask after his catch." } },
      choices = { { text = "Glowing fish would sell well in Ironforge.", next = "BACK", reply = "Please don't say that where Kersok Prond can hear. He'd have me doing it on purpose.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    travellers = {
      lines = { { id = "tr_default", text = "All of them, I think. Night elves coming east for the first time, humans going west to Theramore, and dwarves who only want candles. You can tell which boat is in by who comes through my door." } },
      choices = {
        { text = "What do the night elves make of the place?", next = "travellers_elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    travellers_elves = {
      lines = { { id = "te_default", text = "They are very courteous about it. One priestess told me the marsh had a certain honesty, which I've decided was a compliment. They buy little and thank me a great deal." } },
      choices = { { text = "A certain honesty is about right.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    trust = {
      big = true,
      lines = { { id = "tu_default", text = "Mostly. The dwarves think magic is something that happens to other people, and they leave me be. But I do sell to warlocks, quietly, and I've wondered whether I should refuse them. They fight for the Alliance like anyone else." } },
      choices = {
        { text = "Refuse them. Some trades shouldn't be fed.", next = "BACK", reply = "You may be right. I'd sleep easier, though I'd also know they'd simply buy elsewhere.", fx = { align = { light = 1 } } },
        { text = "Sell to them. They're on our side.", next = "BACK", reply = "That's the view I've settled on. I don't have to like the smell of what they buy.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget = {
      lines = { { id = "y1_default", text = "Light feathers, for the mages. They remember their runes and forget the one thing that stops a fall. I ask every mage at the door whether they've a feather, and I've had three come back to thank me." } },
      choices = {
        { text = "Only three?", next = "forget_three" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forget_three = {
      lines = { { id = "y2_default", text = "The others didn't fall, I hope. I prefer to think so. One of the three was a gnome who'd stepped off the Thandol Span to see whether it worked, and it did, and he bought forty more." } },
      choices = { { text = "A satisfied customer, at least.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    menethil = { { id = "tp_menethil", text = "A fine harbor and a dreadful climate. If the Wetlands were dry I'd have nothing to complain about, and I'd miss it." } },
    theramore = { { id = "tp_theramore", text = "Lady Proudmoore's mages come through on their way to Ironforge. They buy the best I have and never haggle, which tells you how Theramore is supplied." } },
    dewin = { { id = "tp_dewin", text = "Dewin Shimmerdawn sells alchemists their supplies, and we share a salt merchant. She is far calmer about the damp than I am." } },
    background = { { id = "tp_bg", text = "I was a clerk to a mage in Stormwind, and I learned what they run short of. It seemed wiser to sell it than to cast it." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. I'd hate to tell you wrong and send you into the marsh for nothing." } },
  },
}

---------------------------------------------------------------------------
-- Bart Tidewater: captain of the Maiden's Virtue, the ship between Menethil Harbor and Theramore.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_tidewater", id = TODO_NPC("Bart Tidewater"), name = "Bart Tidewater", title = "Captain of the Maiden's Virtue",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "menethil" }, temper = { "weathered", "even" }, values = { "duty", "practical" },
  notices = { "race", "greenness" },
  impression = {
    first = "Captain Bart Tidewater commands the Maiden's Virtue, which carries passengers between Menethil Harbor and Theramore Isle. He has made the crossing so often that he watches the passengers more than the sea.",
    third = "{name} met Bart Tidewater, captain of the Maiden's Virtue, the ship that sails between Menethil Harbor and Theramore.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome aboard the Maiden's Virtue. Find a place at the rail, keep clear of the lines, and we'll have you in Theramore soon enough." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You're making this crossing nearly as often as I am, and I'm paid for it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "A night crossing. Mind your footing on the deck, for it's slick, and I don't turn about for hats." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 25 },
      text = "First time across the Great Sea, by the look of you. Watch the horizon and not the waves, and you'll keep your supper." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf at sea. Hold onto something solid, friend, and I'll try to keep her level for you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bart Tidewater, captain of this ship. We run from Menethil Harbor to Theramore Isle and back, carrying soldiers, traders and anyone with business in Kalimdor. It's the longest regular crossing the Alliance keeps." },
        { id = "h_human", when = { race = "Human" }, text = "Bart Tidewater, captain. You'll find Theramore more like home than you expect, for half of it sailed from Lordaeron and brought their habits with them." },
      },
      again = {
        { id = "h_again", text = "What else? I've one eye on the weather, but go on." },
        { id = "h_again2", text = "Aye, ask. There's time enough on a crossing." },
      },
      choices = {
        { text = "What's the crossing like?", next = "crossing" },
        { text = "What will I find in Theramore?", next = "theramore" },
        { text = "You've a fine ship, Captain.", next = "ship" },
        { text = "Any trouble on these waters?", next = "trouble" },
        { text = "What do you make of your passengers?", next = "passengers" },
        { text = "Fair winds, Captain.", next = "END" },
      },
    },
    crossing = {
      lines = { { id = "cr_default", text = "Long and mostly dull, which is how I like it. We keep well south of the Maelstrom, and I've a navigator who has never once let me forget it's there. The first sight of the Dustwallow coast is no beauty, but passengers cheer all the same." } },
      choices = {
        { text = "Have you seen the Maelstrom?", next = "crossing_maelstrom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crossing_maelstrom = {
      lines = { { id = "cm_default", text = "Its weather, once, from a long way off, and that was near enough. The sky goes the colour of a bruise and the compass loses its wits. I turned south and added two days to the passage, and nobody aboard complained." } },
      choices = { { text = "Two days is a fair price.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    theramore = {
      lines = { { id = "th_default", text = "A walled town on an island in a swamp, with good soldiers and a fine tower. Lady Jaina Proudmoore rules it, and she rules it well. Past the causeway it's all marsh and worse, so buy what you need before you leave the gate." } },
      choices = { { text = "A swamp at both ends of the voyage.", next = "BACK", reply = "Ha! Aye, I've wondered what I did to deserve it. At least the far one's warm.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    ship = {
      lines = { { id = "sh_default", text = "She is, and thank you. She was built in Kul Tiras for the fleet, and she has more guns below than a passenger ship has any right to. I keep them oiled, because these aren't waters where a captain should count on being left alone." } },
      choices = {
        { text = "Have you ever fired them?", next = "ship_guns" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ship_guns = {
      big = true,
      lines = { { id = "sg_default", text = "At Bloodsail raiders, twice. The second time they struck their colours, and I had to choose between taking forty pirates aboard a ship full of passengers or leaving them on a sinking hull. I've thought about that choice on a good many night watches." } },
      choices = {
        { text = "You take them aboard. The sea makes that law.", next = "BACK", reply = "So I did, in irons, and handed them to the Theramore guard. I'm glad to hear another say it.", fx = { align = { light = 1 } } },
        { text = "Your passengers come first. Leave them.", next = "BACK", reply = "My first mate said the same. I didn't listen, and I can't say he was wrong to say it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = { { id = "tb_default", text = "Pirates out of the south, now and then, and murlocs wherever there's a shore. In the harbor itself my worry is the Dark Iron dwarves, for a ship at the dock is a fine thing to set fire to. Captain Stoutfist keeps a watch on the pier for us." } },
      choices = { { text = "Then the harbor's in good hands.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    passengers = {
      lines = { { id = "y1_default", text = "They're adventurers, most of them, with new boots and old swords, bound for a continent they've only read about. I've carried a good many west. I make a point of remembering faces, so that I can be glad when I carry one back." } },
      choices = { { text = "I'll try to be one you carry back.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    menethil = { { id = "tp_menethil", text = "A dwarf-run human port with weather like a wet dog. I'm fond of it, mostly because it means the voyage is over." } },
    theramore = { { id = "tp_theramore", text = "The Alliance's foothold in Kalimdor. Without it I'd have nowhere to sail to, so I wish it long life." } },
    kul_tiras = { { id = "tp_kultiras", text = "The finest shipwrights there are. I learned my trade under a Kul Tiran master, and he'd still find fault with my knots." } },
    background = { { id = "tp_bg", text = "I've been at sea since I was a boy, and a captain for twelve years. I've never wanted a house." } },
    _none = { { id = "tp_none", text = "That's a matter for landsmen. Ask me about wind, tide or cargo." } },
  },
}

---------------------------------------------------------------------------
-- Adam Lind: dock hand who gives directions for the Theramore ship.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_adam", id = TODO_NPC("Adam Lind"), name = "Adam Lind",
  bible = "bibles/more_folk.md", role = "worker", tier = "service",
  communities = { "menethil" }, temper = { "easygoing", "talkative" }, values = { "practical", "kind" },
  notices = { "greenness", "race" },
  impression = {
    first = "Adam Lind stands on the Menethil docks and tells travellers which pier the Theramore ship leaves from. He answers the same question a hundred times a day and has not yet tired of it.",
    third = "{name} met Adam Lind, a dock hand in Menethil Harbor who directs travellers to the Theramore ship.",
  },
  greetings = {
    { id = "g_hi", text = "Theramore? This pier, right here. She'll be along shortly, so mind the gap when you board." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Still the same pier, I'm afraid, they haven't moved it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "She sails at night as well, don't worry. Stand under the lamp, where the crew can see you." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 25 },
      text = "You look a little young for Dustwallow, if you don't mind my saying. Stay inside Theramore's walls until you've asked around." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "If you're wanting home, that's the other pier. Don Pompa's the man for the Auberdine boat." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Adam Lind, and I mind this pier. The ship that ties up here is the Maiden's Virtue, and she goes to Theramore Isle in Kalimdor. If it's Auberdine you want, you're on the wrong pier, and you wouldn't be the first today." },
      },
      again = {
        { id = "h_again", text = "Anything else I can tell you while you wait?" },
        { id = "h_again2", text = "Go on, she's not in yet." },
      },
      choices = {
        { text = "How long is the wait, usually?", next = "wait" },
        { text = "Do many people take the wrong ship?", next = "wrong" },
        { text = "You must know everyone who comes through.", next = "faces" },
        { text = "It's a damp place to stand all day.", next = "damp" },
        { text = "What's the strangest thing you've seen board?", next = "strange" },
        { text = "Thanks, Adam.", next = "END" },
      },
    },
    wait = {
      lines = { { id = "wa_default", text = "Not long. She's across and back before you'd finish a meal at the Deepwater, though I couldn't tell you how Captain Tidewater manages it. I've stopped asking sailors questions like that." } },
      choices = { { text = "Some things are better not asked.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    wrong = {
      lines = { { id = "wr_default", text = "Every day. A dwarf bound for Theramore ended up in Darkshore last month and came back three days later with a night elf's blessing and a head cold. Don and I started standing out here after that." } },
      choices = {
        { text = "So nobody pays you to do this?", next = "wrong_paid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrong_paid = {
      big = true,
      lines = { { id = "wp_default", text = "The harbormaster gives us a few coppers, and travellers tip when they remember. Don says we should charge for the directions, a copper a question. I say you don't sell a man the way to his own ship." } },
      choices = {
        { text = "You're right. Some help should be free.", next = "BACK", reply = "That's what I think. I'll tell Don the passengers voted.", fx = { align = { honor = 1 } } },
        { text = "Don's right. Your time is worth a copper.", next = "BACK", reply = "Well, maybe. I'd feel a thief the first time somebody's child asked, though.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    faces = {
      lines = { { id = "fa_default", text = "By sight, near enough. Soldiers going out with clean armour and coming back without the shine, and merchants counting crates. Every so often, somebody goes out and I don't see them come back, and I try not to dwell on those." } },
      choices = {
        { text = "That must weigh on you.", next = "faces_weigh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faces_weigh = {
      lines = { { id = "fw_default", text = "Some days. Then I tell myself they took the gryphon home, or settled in Theramore and opened a shop. It's likely true of most of them, and I'd sooner believe it of all." } },
      choices = { { text = "That's a kind way to think of them.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    damp = {
      lines = { { id = "da_default", text = "It is, and my boots have never once been dry. Innkeeper Helbrek keeps a pot of something hot for the dock hands, and Andrea Halloran's husband sold me a coat that's nearly waterproof. You get by." } },
      choices = { { text = "Good neighbours make a hard post easier.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    strange = {
      lines = { { id = "y1_default", text = "A gnome with a mechanical chicken on a lead, taking it to Theramore to be mended. It clucked at Captain Tidewater the whole way up the plank. He let it aboard, and he told me after that it had better manners than most of his crew." } },
      choices = { { text = "I hope the chicken was mended.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    theramore = { { id = "tp_theramore", text = "I've never been, would you believe. I've sent ten thousand people there and I couldn't tell you what colour the gate is." } },
    menethil = { { id = "tp_menethil", text = "Everybody passes through and nobody stays, except us. It's a town of people waiting for a boat." } },
    don = { { id = "tp_don", text = "Don Pompa works the Auberdine pier. He's a good sort, and tighter with a copper than I am." } },
    background = { { id = "tp_bg", text = "I was born here, and my father loaded cargo on this same dock. I've just got the easier half of the job." } },
    _none = { { id = "tp_none", text = "No idea, sorry. If it isn't about which boat goes where, I'm not your man." } },
  },
}

---------------------------------------------------------------------------
-- Don Pompa: dockworker who gives directions for the Auberdine ship.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_pompa", id = TODO_NPC("Don Pompa"), name = "Don Pompa",
  bible = "bibles/more_folk.md", role = "worker", tier = "service",
  communities = { "menethil" }, temper = { "gruff", "shrewd" }, values = { "practical", "thrifty" },
  notices = { "race", "greenness" },
  impression = {
    first = "Don Pompa is a dockworker on the Menethil piers who points travellers to the ship for Auberdine. He is broad, short of patience and convinced that directions ought to cost a copper.",
    third = "{name} met Don Pompa, a dockworker in Menethil Harbor who directs travellers to the Auberdine ship.",
  },
  greetings = {
    { id = "g_hi", text = "Auberdine boat, this pier. Theramore's the other one. Aye, I'm sure." },
    { id = "g_back", when = { metBefore = true }, text = "You again. It's still this pier, and it'll be this pier tomorrow as well." },
    { id = "g_elf", when = { race = "NightElf" }, text = "Going home, are you? This pier, and she's due any moment. Your lot never need telling twice, I'll say that." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "You elves board without a word and never drop anything in the water. I wish I could say the same of the dwarves." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 15 },
      text = "Darkshore's no worse than the marsh behind you, so you'll manage. Stay on the road out of Auberdine all the same." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Don Pompa. I load cargo when there's cargo, and the rest of the day I stand here telling people this is the ship for Auberdine, on the Darkshore coast. From there the night elves will get you to Darnassus." },
      },
      again = {
        { id = "h_again", text = "What else? I've crates waiting." },
        { id = "h_again2", text = "Go on, then, be quick." },
      },
      choices = {
        { text = "What's Auberdine like?", next = "auberdine" },
        { text = "What comes in on the elven ships?", next = "cargo" },
        { text = "Adam says you'd charge for directions.", next = "charge" },
        { text = "How do you find working alongside night elves?", next = "elves" },
        { text = "What's the heaviest thing you've loaded?", next = "heavy" },
        { text = "Thanks, Don.", next = "END" },
      },
    },
    auberdine = {
      lines = { { id = "au_default", text = "Never set foot in it. The sailors tell me it's a quiet grey town on a grey shore, with elves who talk in low voices, and trees bigger than our keep. It sounds restful, and I'd be bored inside a week." } },
      choices = { { text = "You'd miss the noise of the docks.", next = "BACK", reply = "I would. A man gets used to gulls and swearing.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    cargo = {
      lines = { { id = "ca_default", text = "Not much, and that's the odd part. Herbs, some cloth, and wood they won't let us cut. What goes out is steel and stone from Ironforge, by the ton. The elves want dwarf-made things and send back very little, so I reckon they pay in gold or in favours." } },
      choices = {
        { text = "What sort of favours?", next = "cargo_favours" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cargo_favours = {
      lines = { { id = "cf_default", text = "Their Sentinels on our side when the Horde comes calling, I'd guess. That's worth more than cloth. It isn't a dock hand's business, but you carry enough crates and you start to see what an alliance weighs." } },
      choices = { { text = "You see more than most from that pier.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    charge = {
      big = true,
      lines = { { id = "ch_default", text = "And why not? I answer the same question two hundred times a day, and every answer is a crate I'm not carrying. A copper each would feed my family through winter. Adam thinks that makes me a pirate." } },
      choices = {
        { text = "You've a family to feed. Charge the copper.", next = "BACK", reply = "There, somebody with sense. I'll tell Adam it's two against one.", fx = { align = { honor = -1 } } },
        { text = "Adam's right. A lost traveller isn't a customer.", next = "BACK", reply = "Hmph. You and him both. Fine, it's this pier, and that one was free.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      lines = { { id = "el_default", text = "They're polite and they're strong, and they look at the harbor as if it were built yesterday, which to them I suppose it was. One of their sailors told me she'd been making this sort of crossing since before Lordaeron had a king." } },
      choices = {
        { text = "That must be hard to stand beside.", next = "elves_beside" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves_beside = {
      lines = { { id = "eb_default", text = "It was, until I saw her slip on the same wet plank as everybody else. Ten thousand years and the pier still gets you. I've felt better about them ever since." } },
      choices = { { text = "The pier treats everyone alike.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    heavy = {
      lines = { { id = "y1_default", text = "An Ironforge anvil, for a smith in Darnassus, of all places. Four of us and a ramp. The elves watched as if we were carrying a dead thing aboard. I've wondered ever since what one of them wanted with it." } },
      choices = { { text = "A night elf smith. That is a puzzle.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    menethil = { { id = "tp_menethil", text = "It's work, and the work's steady. I've no more to say for it than that, and no less." } },
    adam = { { id = "tp_adam", text = "Adam Lind's a soft-hearted lad who'd give away his boots. Somebody on this dock has to think about money." } },
    darkshore = { { id = "tp_darkshore", text = "A long grey coast on the far side of the sea. The elves seem to like it, and they're welcome to it." } },
    background = { { id = "tp_bg", text = "Dockworker, and my back says I've been one too long." } },
    _none = { { id = "tp_none", text = "Couldn't say. I know crates and piers, and that's the lot." } },
  },
}

---------------------------------------------------------------------------
-- Hargin Mundar: dwarf who spends his days drinking in the Deepwater Tavern; once built a floodgate in Ironforge.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_hargin", id = TODO_NPC("Hargin Mundar"), name = "Hargin Mundar",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "menethil" }, temper = { "merry", "rambling" }, values = { "drink", "craft" },
  notices = { "drunk", "race" },
  impression = {
    first = "Hargin Mundar sits in the Deepwater Tavern with a mug that is never quite empty. He was an engineer of floodgates in Ironforge once, and the story of how that ended improves a little every evening.",
    third = "{name} met Hargin Mundar, a dwarf who drinks his days away in the Deepwater Tavern in Menethil Harbor.",
  },
  greetings = {
    { id = "g_hi", text = "Sit down, sit down! There's room on the bench, an' I've a story that wants a fresh pair of ears." },
    { id = "g_back", when = { metBefore = true }, text = "Ye came back! Did I tell ye about the floodgate? I did? Well, I've remembered more of it since." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Thank the stone, somebody who'll understand a joke about mortar. Sit, sit." },
  },
  notice = {
    { id = "n_drunk", cat = "drunk", when = { drunk = true },
      text = "Ye're a mug or two along yerself, I see. Good, we'll understand each other perfectly." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Ye'd have spotted the flaw in my drawings in a moment, an' I'd have ignored ye, so it's as well we never met in Ironforge." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Hargin Mundar, formerly o' the Ironforge works, an' presently o' this bench. I came tae Menethil tae look at their sea wall, an' the tavern was on the way, an' somehow I've no' got past it yet." },
        { id = "h_eng", when = { profession = "Engineering" }, text = "Hargin Mundar. An engineer, are ye? Then ye'll appreciate what I'm about tae tell ye, an' ye'll wince in the right places." },
      },
      again = {
        { id = "h_again", text = "What else? My mug's still got a finger in it, so I've time." },
        { id = "h_again2", text = "Aye, go on, I'm no' goin' anywhere. I've proved that." },
      },
      choices = {
        { text = "Tell me about the floodgate.", next = "gate" },
        { text = "You came to look at the sea wall, you said.", next = "wall" },
        { text = "Who else keeps this bench warm?", next = "bench" },
        { text = "You don't seem troubled by any of it.", next = "content" },
        { text = "What's the ale like here?", next = "ale" },
        { text = "Enjoy your ale, Hargin.", next = "END" },
      },
    },
    gate = {
      lines = { { id = "ga_default", text = "It was a beautiful gate! Solid iron, counterweighted, meant tae seal a lower tunnel if the lake ever broke through. I closed it tae test it, an' it sealed so well that I found I'd built it wi' the handle on the far side from me." } },
      choices = {
        { text = "You locked yourself in?", next = "gate_in" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate_in = {
      lines = { { id = "gi_default", text = "For a day an' a half, wi' one lamp an' a sandwich. They had tae tunnel round it tae fetch me, for the gate itself wouldnae budge. I told the foreman that proved how well it was made, an' he didnae see it that way." } },
      choices = {
        { text = "The gate did work, to be fair.", next = "gate_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate_work = {
      big = true,
      lines = { { id = "gw_default", text = "That's what I said! It's still there, an' it's never leaked a drop. But the works let me go for it, an' I've asked myself since whether a thing well made by a fool is still well made." } },
      choices = {
        { text = "It is. The work stands, whoever built it.", next = "BACK", reply = "Ha! I'll drink tae that, an' tae ye. Helbrek, another!", fx = { align = { order = -1 } } },
        { text = "They were right. Care is part of the craft.", next = "BACK", reply = "Aye, that's what the foreman said, near enough. He was right, the miserable sod.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wall = {
      lines = { { id = "wl_default", text = "I did, an' I've looked at it, from the window. It's human work, a bit thin at the foot, an' it'll hold till the sea really wants in. I've drawn Captain Stoutfist a better one on the back of a tavern bill, an' he says he'll consider it when I'm sober." } },
      choices = { { text = "That may be a long wait for the captain.", next = "BACK", reply = "It may, it may. The wall's in nae hurry, an' neither am I.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    bench = {
      lines = { { id = "be_default", text = "Junder Brokk, mostly, who listens better than any dwarf alive, because he's usually thinkin' of somethin' else. Mikhail pours, Helbrek counts, an' Vincent Hyal sits over there waitin' for a courier, lookin' like his dog died." } },
      choices = { { text = "A full house, then.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    content = {
      lines = { { id = "co_default", text = "Why would I be? I've a roof, a fire, an' a tavern that takes my drawings in place o' coin when Helbrek's feelin' kind. Half o' Khaz Modan is fightin' somethin', an' I'm warm. I call that winnin'." } },
      choices = { { text = "There are worse ways to spend a war.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    ale = {
      lines = { { id = "y1_default", text = "Thin, by Ironforge measure, but there's plenty of it, an' Mikhail pours an honest mug. I've a design for a better tap, mind, wi' a float valve. Helbrek says I'm no' tae touch his kegs after what I did tae the last one." } },
      choices = { { text = "I'd leave the kegs alone, too.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    ironforge = { { id = "tp_ironforge", text = "A grand city, an' one tunnel of it is very, very dry, thanks tae me. I dinnae get the credit I should." } },
    deepwater = { { id = "tp_deepwater", text = "The best tavern in the Wetlands, an' I'll grant it's the only one I've tried. I see nae reason tae check the others." } },
    junder = { { id = "tp_junder", text = "Junder Brokk's my drinkin' companion. He's heard the floodgate story more than any dwarf livin', an' he's never once corrected me." } },
    background = { { id = "tp_bg", text = "An engineer o' gates an' sluices, retired sooner than I'd planned." } },
    _none = { { id = "tp_none", text = "I couldnae tell ye, friend. Ask me again after this mug, I may have an opinion by then." } },
  },
}

---------------------------------------------------------------------------
-- Junder Brokk: dwarf regular at the Deepwater Tavern, Hargin's long-suffering companion.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_junder", id = TODO_NPC("Junder Brokk"), name = "Junder Brokk",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "menethil" }, temper = { "dry", "patient" }, values = { "loyal", "practical" },
  notices = { "race", "greenness" },
  impression = {
    first = "Junder Brokk drinks slowly in the Deepwater Tavern and watches the door. He came down from Loch Modan with a cart of stone for the harbor wall and stayed to see the job done right.",
    third = "{name} met Junder Brokk, a dwarf who keeps a seat in the Deepwater Tavern in Menethil Harbor.",
  },
  greetings = {
    { id = "g_hi", text = "Evenin'. If Hargin's already told ye about the floodgate, I'm sorry, an' if he hasnae, run." },
    { id = "g_back", when = { metBefore = true }, text = "Ye're back. Pull up a stool, it's the same ale an' the same stories." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "Well met, {g:lad|lass}. It's good tae hear a voice from home that isnae Hargin's." },
  },
  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 22 },
      text = "Ye're new tae the marsh. Keep tae the road till ye reach the bridge, an' dinnae pet anythin' wi' scales." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Ye've come through Dun Algaz, then. How many o' those tunnels are the Dragonmaw holdin' this week?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Junder Brokk. I haul stone, when there's stone tae haul, an' I mend the harbor wall wi' it. The rest o' the time I sit here an' make sure Hargin gets home, which is the harder job." },
      },
      again = {
        { id = "h_again", text = "What else is on yer mind?" },
        { id = "h_again2", text = "Go on, I'm listenin'. I've had the practice." },
      },
      choices = {
        { text = "You look after Hargin, then.", next = "hargin" },
        { text = "How is the harbor wall holding?", next = "wall" },
        { text = "What's the road from Loch Modan like these days?", next = "road" },
        { text = "You keep one eye on the door.", next = "door" },
        { text = "What's the worst part of the marsh road?", next = "worst" },
        { text = "Good evening, Junder.", next = "END" },
      },
    },
    hargin = {
      lines = { { id = "ha_default", text = "Somebody has tae. He's a fine engineer wi' nae sense at all, an' I've kent him since we were apprentices. I was one o' the lads who dug him out from behind that gate, though he's never worked it out." } },
      choices = {
        { text = "You've never told him?", next = "hargin_told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hargin_told = {
      big = true,
      lines = { { id = "ht_default", text = "No. In his tellin' he was calm as a stone in there, an' when we broke through he was singin' tae keep the dark off. I've let him have his version for twenty years. Is that a kindness, or a lie?" } },
      choices = {
        { text = "A kindness. Let him keep his story.", next = "BACK", reply = "Aye, that's where I've landed. A dwarf's entitled tae one good tale.", fx = { align = { honor = -1 } } },
        { text = "A friend deserves the truth, even late.", next = "BACK", reply = "Maybe so. I'd need a stronger ale than this tae say it, mind.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wall = {
      lines = { { id = "wl_default", text = "Well enough for human work. The sea eats the mortar every winter, an' I put back good Loch Modan granite every spring. Hargin's right that it's thin at the foot, though I'd no' tell him so, for he'd start drawin' again." } },
      choices = { { text = "Quiet work that keeps a town dry.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    road = {
      lines = { { id = "ro_default", text = "Bad. The Dragonmaw orcs hold half the tunnels at Dun Algaz, an' the Dark Irons have been at the Thandol Span. I bring my cart through wi' the mountaineers' patrols now, or no' at all." } },
      choices = {
        { text = "Who should I speak to about the orcs?", next = "road_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_who = {
      lines = { { id = "rw_default", text = "Valstag Ironjaw, here in the harbor, has been wantin' Dragonmaw heads for a long while. For the Span, find Rhag Garmason up at Dun Modr, if he's still holdin' it. They're both shorter o' hands than they'll admit." } },
      choices = { { text = "I'll look for them.", next = "BACK", fx = { trait = { brave = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    door = {
      lines = { { id = "do_default", text = "Habit. There was a Dark Iron walked intae a tavern in Thelsamar once wi' a keg under his arm that wasnae ale. I sit where I can see who comes in, an' I count their hands." } },
      choices = { { text = "A sound habit, in these parts.", next = "BACK", fx = { trait = { cautious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    worst = {
      lines = { { id = "y1_default", text = "The bridges. They're slick, an' the crocolisks lie under them waitin' for a hoof or a wheel. I lost a cart mule at the second bridge two springs back. Walk the middle o' the planks an' dinnae look down." } },
      choices = { { text = "The middle of the planks. Understood.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    hargin = { { id = "tp_hargin", text = "Hargin Mundar's the cleverest fool I ken. I'd no' swap him for a sober friend, an' dinnae tell him that either." } },
    loch_modan = { { id = "tp_loch", text = "Home. Good stone, clean water an' a dam ye could stand an army on. I'll go back when this wall's done, which is tae say never." } },
    deepwater = { { id = "tp_deepwater", text = "Helbrek keeps a fair house. The ale's thin by Thelsamar standards, but the fire's honest." } },
    background = { { id = "tp_bg", text = "A stonehauler from Loch Modan. There's nae more tae it, an' I like it that way." } },
    _none = { { id = "tp_none", text = "I dinnae ken. Ask Hargin, he'll no' ken either, but he'll take an hour tellin' ye." } },
  },
}

---------------------------------------------------------------------------
-- Murphy West: human who keeps to the basement of Menethil Keep.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_murphy", id = TODO_NPC("Murphy West"), name = "Murphy West",
  bible = "bibles/more_folk.md", role = "worker", tier = "service",
  communities = { "menethil" }, temper = { "idle", "sardonic" }, values = { "comfort", "honest" },
  notices = { "class", "greenness" },
  impression = {
    first = "Murphy West is usually found in the basement of Menethil Keep, among the stores, where it is dry and nobody is giving orders. He is supposed to be counting barrels and is seldom caught at it.",
    third = "{name} met Murphy West, who looks after the stores in the basement of Menethil Keep.",
  },
  greetings = {
    { id = "g_hi", text = "Oh. I thought you were the sergeant. Come in, then, and don't lean on the stack, it's not as steady as it looks." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You're the only visitor I get who doesn't want a barrel moved." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "It's the same down here, night or day. That's rather the point of the place." },
  },
  notice = {
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You look like you'd volunteer for things. I admire that, from a distance, and from behind a barrel." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 22 },
      text = "You're keen, I can tell. The marsh will see to that, so enjoy it while it lasts." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Murphy West. I keep the keep's stores, which means flour, salt pork, lamp oil and powder, and I keep them down here because it's the one dry room in the Wetlands. I'd be a fool to leave it." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've nowhere to be, as you can see." },
        { id = "h_again2", text = "Go on. Talking counts as work if anyone asks." },
      },
      choices = {
        { text = "You've found yourself a quiet post.", next = "quiet" },
        { text = "How well supplied is the keep?", next = "stores" },
        { text = "What do the soldiers upstairs think of you?", next = "soldiers" },
        { text = "Does anything ever happen down here?", next = "happen" },
        { text = "What's the oldest thing down here?", next = "oldest" },
        { text = "I'll leave you to it, Murphy.", next = "END" },
      },
    },
    quiet = {
      lines = { { id = "qu_default", text = "I chose it with care. Upstairs it's drills and wall duty and murlocs at low tide. Down here it's me and forty barrels, and none of the barrels has ever shouted at me. Somebody has to count the pork." } },
      choices = {
        { text = "And do you count it?", next = "quiet_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet_count = {
      big = true,
      lines = { { id = "qc_default", text = "Once a week, and I write down a number near enough to last week's. Nothing's ever gone missing, so I can't see the harm. Captain Stoutfist would, I expect, if he ever came down the stairs." } },
      choices = {
        { text = "A garrison lives on true counts. Do it properly.", next = "BACK", reply = "Oh, very well. You sound like the sergeant, only quieter. I'll count the lot tomorrow.", fx = { align = { order = 1 } } },
        { text = "If nothing's missing, nobody's hurt.", next = "BACK", reply = "My thinking exactly. You'd do well down here.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stores = {
      lines = { { id = "st_default", text = "Well enough for a month, if the boats stopped. Flour's short since the Dragonmaw closed Dun Algaz to carts, and powder goes off in the damp, so I turn the kegs. I do know where everything is, whatever the sergeant says." } },
      choices = { { text = "So you do work, when it matters.", next = "BACK", reply = "Don't spread it about. I've a reputation to keep.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    soldiers = {
      lines = { { id = "so_default", text = "That I'm a shirker, and they're not far wrong. But when the murlocs came over the beach last spring, it was me carrying powder up those stairs for six hours. Nobody mentioned shirking that night." } },
      choices = {
        { text = "Six hours on those stairs is no small thing.", next = "soldiers_stairs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldiers_stairs = {
      lines = { { id = "ss_default", text = "My knees agree with you. Young Timothy Clark helped for the last two, and he isn't even enlisted. He wants to be a guard so badly it hurts to watch, and I've told him it's mostly standing in the rain." } },
      choices = { { text = "He sounds like he'd make a good one.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    happen = {
      lines = { { id = "hp_default", text = "A rat, in the autumn. I named him Sergeant and he left after a week, which is more than the real one's ever done. Apart from that, I hear the tide through the wall, and I've come to like it." } },
      choices = { { text = "It sounds almost peaceful.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    oldest = {
      lines = { { id = "y1_default", text = "A cask of Lordaeron wine, sealed before the kingdom fell. It's on the manifest as vinegar, in my own hand. I'm keeping it for the day the captain tells us the marsh is safe, so I expect it'll outlive me." } },
      choices = { { text = "It'll be worth the wait.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    menethil = { { id = "tp_menethil", text = "Wet above and dry below. I know which half I prefer." } },
    stoutfist = { { id = "tp_stoutfist", text = "The captain's a fair dwarf and a busy one. I try to be the sort of problem he never has time to notice." } },
    timothy = { { id = "tp_timothy", text = "Timothy Clark hangs about the keep hoping to be made a guard. He's a good lad, and far too eager for his own comfort." } },
    background = { { id = "tp_bg", text = "I was a clerk's boy in Stormwind and came north for the pay. I stayed for the basement." } },
    _none = { { id = "tp_none", text = "No idea. News takes a long time to get down these stairs." } },
  },
}

---------------------------------------------------------------------------
-- Timothy Clark: young man of Menethil who hopes to join the harbor guard.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_timothy", id = TODO_NPC("Timothy Clark"), name = "Timothy Clark",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "menethil" }, temper = { "eager", "earnest" }, values = { "duty", "brave" },
  notices = { "class", "soldier" },
  impression = {
    first = "Timothy Clark is a young man of Menethil Harbor who wants nothing in the world so much as to join the town guard. He watches every drill from the edge of the yard and knows the watch rota better than the watch does.",
    third = "{name} met Timothy Clark, a young man in Menethil Harbor who hopes to become a guard.",
  },
  greetings = {
    { id = "g_hi", text = "Hello! Are you here to see Captain Stoutfist? I can tell you where he is, I always know where he is." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Did you fight anything? You have to tell me, and don't leave out the bad parts." },
    { id = "g_war", when = { class = { "WARRIOR", "PALADIN" } }, text = "Is that real plate? Sorry, of course it is. I've only ever held the practice shields." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { minLevel = 30 },
      text = "You've seen proper fighting, haven't you? You stand the way the old guards do, with your weight ready." },
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "I've been practising the shield wall with a barrel lid. Would you tell me if I'm holding my arm too high?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Timothy Clark. I'm not a guard yet, but I will be, as soon as the captain says I'm old enough and there's a place on the roll. Until then I carry messages and fetch things, and I watch how it's all done." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know? I know all the watch posts." },
        { id = "h_again2", text = "Yes? I'm not busy, I'm only waiting to be useful." },
      },
      choices = {
        { text = "Why do you want to be a guard?", next = "why" },
        { text = "What's stopping you from joining?", next = "stop" },
        { text = "Guard duty here looks cold and wet.", next = "wet" },
        { text = "Who's the best soldier in the harbor?", next = "best" },
        { text = "What would you do first, as a guard?", next = "firstday" },
        { text = "Good luck, Timothy.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wy_default", text = "Because I was nine when the murlocs came over the sea wall, and I hid under a cart while the guards held them off. I've never forgotten how they looked, standing in a line. I'd like to be one of the people in the line, and not under the cart." } },
      choices = {
        { text = "Hiding at nine was the sensible thing.", next = "why_nine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_nine = {
      lines = { { id = "wn_default", text = "That's what my mother says. I still think about it, though. Glorin Steelbrow told me every guard he knows started out frightened of something, and that the ones who say otherwise are the ones to watch." } },
      choices = { { text = "Glorin gave you good counsel.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    stop = {
      big = true,
      lines = { { id = "sp_default", text = "The captain says to wait another year and grow into the armour. But they're short on the wall right now, and I know the drills. I've thought about telling the sergeant I'm a year older than I am." } },
      choices = {
        { text = "Don't. A guard's word has to be good.", next = "BACK", reply = "You're right. If I lied to get in, I'd know it every time I gave my oath. I'll wait.", fx = { align = { honor = 1 } } },
        { text = "Do it. The wall needs you now.", next = "BACK", reply = "Do you think so? I'll have to practise saying it without going red.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wet = {
      lines = { { id = "we_default", text = "Murphy West says that too, he says it's standing in the rain being bored. But I've stood in the rain being bored my whole life for nothing, and at least a guard is bored for a reason." } },
      choices = { { text = "Bored for a reason. That's well put.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    best = {
      lines = { { id = "be_default", text = "Captain Stoutfist, of course, and he's fought in real wars. After him I'd say Valstag Ironjaw, who's killed more orcs than anybody. Karl Boran drills the recruits, and he once let me hold the line with them when he was a man short." } },
      choices = {
        { text = "How did you do in the line?", next = "best_line" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best_line = {
      lines = { { id = "bl_default", text = "I dropped the shield once and stood on my neighbour's foot. Karl said that was better than most do on their first day, and I've decided to believe him." } },
      choices = { { text = "Believe him. Everyone drops the shield.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    firstday = {
      lines = { { id = "y1_default", text = "Walk the whole wall at night, by myself, all the way round. The guards say it's the worst duty there is. I've wanted to do it since I was small, and see the harbor lamps from up there with everyone asleep and safe underneath." } },
      choices = { { text = "I hope you get your night on the wall.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stoutfist = { { id = "tp_stoutfist", text = "He's the best commander in Khaz Modan. He knows my name, and he's told me twice to stop following him." } },
    menethil = { { id = "tp_menethil", text = "It's my home. People call it a swamp town, but it's got a keep and a harbor and it has never fallen." } },
    murphy = { { id = "tp_murphy", text = "Murphy West minds the stores under the keep. He pretends he doesn't care about anything, but he showed me how to carry powder safely." } },
    background = { { id = "tp_bg", text = "I was born in Menethil. My father fishes, and he says the sea is enough to fight, without looking for more." } },
    _none = { { id = "tp_none", text = "I don't know that one, sorry. I could ask one of the guards for you!" } },
  },
}

---------------------------------------------------------------------------
-- Caitlin Grassman: alchemist of Menethil Harbor; her husband Ardin went to the excavation (Forever quests).
---------------------------------------------------------------------------
P:NPC {
  key = "mf_caitlin", id = TODO_NPC("Caitlin Grassman"), name = "Caitlin Grassman",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "worried", "capable" }, values = { "loving", "craft" },
  notices = { "craft", "class" },
  impression = {
    first = "Caitlin Grassman is an alchemist who lives in the small house by the smithy in Menethil Harbor. Her husband Ardin went off to see some giant grasses at a dig and has not come home, and she is cooking for two anyway.",
    third = "{name} met Caitlin Grassman, an alchemist in Menethil Harbor whose husband went missing at the excavation.",
  },
  greetings = {
    { id = "g_done", when = { questDone = TODO_QUEST("Heartwoven") }, text = "It's you! He's promised he's on his way, and I've put the stew back on. Come in, come in." },
    { id = "g_active", when = { questActive = TODO_QUEST("Lost in the Thicket Things") }, text = "Have you found him? No, I can see you haven't yet. Forgive me, I ask everyone who comes through the door." },
    { id = "g_hi", text = "Oh! I thought you might be Ardin. Never mind me, come in out of the damp." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. I'm sorry about the smell, I've a batch on the boil and nobody here to tell me it's ready." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Alchemy" } },
      text = "You know plants, I can tell from your fingers. Ardin's are stained the same green, and it never washes out." },
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "DRUID", "PALADIN" } },
      text = "You've a healer's way of looking at people. If you do find him hurt, I'd be glad it was you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Caitlin Grassman. I make potions for the guard and for the fishing boats, and my husband Ardin gathers the herbs for them. He went to look at some grasses at a dig, he said for a week, and it has been a good deal longer than a week." },
        { id = "h_active", when = { questActive = TODO_QUEST("Lost in the Thicket Things") }, text = "He'll be somewhere inside that excavation, near the tallest grass he can find, talking to it. Please look for him. He's cleverer than he sounds, but he has no sense of time at all." },
        { id = "h_heart", when = { questActive = TODO_QUEST("Heartwoven") }, text = "He wove this out of reeds? Oh, that foolish, dear man. He does that when he's frightened, he makes things with his hands. Then he's alive, and he's coming home." },
        { id = "h_done", when = { questDone = TODO_QUEST("Heartwoven") }, text = "I've hung the reed heart over the stove, where he'll see it and be embarrassed. Thank you for bringing him back to me, or as near as makes no difference." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? Talking helps, a little." },
        { id = "h_again2", text = "Yes? I'm only stirring, and it stirs itself, mostly." },
        { id = "h_again_done", when = { questDone = TODO_QUEST("Heartwoven") }, text = "Ask me anything you like. I'm in a far better temper than I was." },
      },
      choices = {
        { text = "Tell me about Ardin.", next = "ardin" },
        { text = "What took him to the dig?", next = "dig" },
        { text = "You're still cooking for two.", next = "cooking" },
        { text = "What do you brew for the harbor?", next = "brew" },
        { text = "Which marsh herbs are worth gathering?", next = "herbs", when = { profession = { "Herbalism", "Alchemy" } } },
        { text = "Take heart, Caitlin.", next = "END" },
      },
    },
    ardin = {
      lines = { { id = "ar_default", text = "He has a gift for growing things. He can walk into a marsh and tell you what's flowering half a mile off, and I've never known how. He's also sarcastic when he's nervous, and he's nervous a great deal, so people take him for sour. He isn't." } },
      choices = {
        { text = "How did the two of you meet?", next = "ardin_met" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ardin_met = {
      lines = { { id = "am_default", text = "He sold me a bundle of swiftthistle and told me I was storing it wrong. He was right, which was irritating. I married him partly so that I wouldn't have to pay for the advice." } },
      choices = { { text = "A sound basis for a marriage.", next = "BACK", reply = "It's lasted, so it must be. I'd take the advice now and gladly.", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    dig = {
      lines = {
        { id = "di_default", text = "A crew came through for supplies and talked of grasses taller than a house. Ardin's eyes went round, and I knew then he'd go. I need the plants, that's true, but I'd have managed without, and I should have said so." },
        { id = "di_done", when = { questDone = TODO_QUEST("Heartwoven") }, text = "Grasses taller than a house, the crew said. He tells me they were real, and that they moved with no wind. I've told him he can describe them to me from his own chair." },
      },
      choices = {
        { text = "You couldn't have known. Don't blame yourself.", next = "dig_blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dig_blame = {
      big = true,
      lines = { { id = "db_default", text = "Perhaps not. But I've wondered since whether I ought to have forbidden it. He'd have listened, and he'd have been miserable, and he'd be here. Is it right to keep someone safe against their will?" } },
      choices = {
        { text = "No. He had to choose his own road.", next = "BACK", reply = "I think so too, on my better days. I'll try to have more of those.", fx = { align = { order = -1 } } },
        { text = "Yes, when you love them. Next time, say no.", next = "BACK", reply = "Next time I may. He can sulk in a dry kitchen as well as anywhere.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cooking = {
      lines = { { id = "ck_default", text = "I can't seem to stop. I make the stew, I set two bowls, and I eat one and give the other to Brak Durnad at the smithy next door. He says he's never been so well fed, and he has the grace to look sorry about it." } },
      choices = { { text = "Brak's a lucky neighbour.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    brew = {
      lines = { { id = "bw_default", text = "Healing draughts for the guard, mostly, and something for the fishermen's chests, because every one of them coughs from October to May. Dewin Shimmerdawn sells me vials, and Fremal Doohickey sends me the patients he can't bandage." } },
      choices = { { text = "The harbor would be poorer without you.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    herbs = {
      lines = { { id = "hb_default", text = "Liferoot along the riverbanks, and kingsblood on the drier ground toward the hills. Ardin says to cut liferoot below the waterline or it loses half its strength, and he's never been wrong about a plant." } },
      choices = { { text = "Below the waterline. I'll remember.", next = "BACK", fx = { trait = { curious = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    ardin = { { id = "tp_ardin", text = "My husband. He's gentle and anxious and far too curious, and the house is too quiet without his complaining." } },
    menethil = { { id = "tp_menethil", text = "It's damp and it smells of fish, and everyone knows everyone's business. Half the town has brought me soup since he left." } },
    excavation = { { id = "tp_dig", text = "I know only what the crew said: a dig, something old, and plants that had no business growing so tall. I wish I'd never heard of it." } },
    background = { { id = "tp_bg", text = "I'm an alchemist. I learned from my aunt in Southshore and came here when I married." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. My mind's been on one thing only, lately." } },
  },
}
