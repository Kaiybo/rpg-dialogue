-- More Wetlands folk: Andrea Halloran, the tanner's wife in Menethil Harbor with two children who won't stay
-- off things, and Comar Villard, who wanders the north road near the Thandol Span looking for his lost wife.
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
    first = "Andrea Halloran keeps one eye on me and the other on her children, Jesse and Regina, who seem determined to climb everything in Menethil. She's married to the tanner, and says the smell is the least of her worries.",
    third = "{name} met Andrea Halloran, the tanner's wife in Menethil Harbor, who has her hands full with two adventurous children.",
  },
  greetings = {
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
    first = "Comar Villard walks the muddy roads near the Thandol Span looking for his wife, who went missing long ago. He's gentle and polite and seems not to notice how thin and worn he's become.",
    third = "{name} met Comar Villard, a grieving man who wanders the northern Wetlands searching for his lost wife.",
  },
  greetings = {
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
  },
  topics = {
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
  },
  topics = {
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
  },
  topics = {
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
  },
  topics = {
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
  },
  topics = {
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
  },
  topics = {
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
  },
  topics = {
    steamwheedle = { { id = "tp_steam", text = "The Cartel's got ports and rules and dues. Me, I'm what you'd call an independent, which means I keep all of it and nobody comes lookin' if I go missin'." } },
    dragonmaw = { { id = "tp_dragon", text = "Mean, broke and always bleedin', so they're decent customers. I don't ask about the war and they don't ask about my margins." } },
    background = { { id = "tp_bg", text = "I'm a businessman, friend. I found a spot with no competition, and I've been sittin' on it ever since." } },
    _none = { { id = "tp_none", text = "Couldn't tell ya, pal, and if I could, I'd be chargin' for it." } },
  },
}
