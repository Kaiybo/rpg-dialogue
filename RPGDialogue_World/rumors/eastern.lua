-- Inn talk across the Eastern Kingdoms: the capitals, the dwarven lands, the Forsaken's
-- lands, Stranglethorn and the high-level wilds. Hearsay. Nothing here is later than Year 1.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Rumors {
  id = "stormwind_inns", roles = { "innkeeper" }, zones = { "Stormwind City" },
  lines = {
    { id = "king", text = "Nobody at the Keep will say where the king went, and the more they don't say it, the more people guess. My money's on the Defias, but my money's on everything." },
    { id = "prestor", text = "Lady Prestor was at the Keep again, whispering in Bolvar's ear. Half the lords love her and the other half are too frightened to say they don't." },
    { id = "masons", text = "The stonemasons still haven't been paid for the city they built. Some of them have gone west, and some of them have gone quiet, and I don't like either." },
    { id = "tram", text = "A gnome rode the Deeprun Tram both ways forty times yesterday, taking notes. The guards asked what for, and he gave them a lecture." },
    { id = "orphans", text = "Matron Battlewail's had three more children brought to the orphanage this month. That's what a war leaves behind, long after the songs." },
    { id = "stockade", when = { minLevel = 22, questBefore = TODO_QUEST("The Stockade Riots") },
      text = "The prisoners in the Stockade have taken over the place, and the Watch is pretending it's under control. Listen at the canal grate and you'll hear how controlled it is." },
  },
}

P:Rumors {
  id = "ironforge_inns", roles = { "innkeeper" }, zones = { "Ironforge", "Dun Morogh" },
  lines = {
    { id = "magni", text = "King Magni's been pacing the throne room half the night, they say, over his daughter again. The princess ran off with a Dark Iron, and nobody's sure she went willing." },
    { id = "gnomes", text = "The gnomes in Tinker Town blew the lights out in three streets yesterday. They called it a successful test, and they meant it." },
    { id = "explorers", text = "The Explorers' League dug up another statue nobody can read. Brann wrote to say it was important, from somewhere very far off, as always." },
    { id = "gnomeregan", text = "There's still a smell of something wrong coming down the tunnels from Gnomeregan. The gnomes say it's the radiation, and they say it like that's better." },
    { id = "troggs", when = { minLevel = 8 }, text = "Troggs again, out by the Gol'Bolar quarry. They come up out of the ground like they're running from something, and nobody wants to go and see what." },
    { id = "ale", text = "Thunderbrew's new batch came in, and it's strong enough to strip paint. The paint stayed on the wall, mind; it's the drinkers that came off." },
  },
}

P:Rumors {
  id = "lochmodan_inns", roles = { "innkeeper" }, zones = { "Loch Modan" },
  lines = {
    { id = "dam", text = "The engineers at Stonewrought Dam swear it'll hold another hundred years. They swore it a bit loudly, mind, and they keep going back to look." },
    { id = "darkirons", when = { minLevel = 14 }, text = "There were Dark Iron scouts seen up by the dam last week. Dark Irons don't scout for nothing; they scout for the thing they mean to blow up." },
    { id = "kobolds", text = "Kobolds have dug into the old silver mine again, and the miners want it back. The kobolds seem to think it's theirs, and they've got candles to prove it." },
    { id = "frogs", text = "Old Stoutfist reckons the frogs in the loch are getting bigger every year. He's been reckoning it for thirty years, and they'd be the size of ponies by now." },
  },
}

P:Rumors {
  id = "undercity_inns", roles = { "innkeeper" }, zones = { "Undercity", "Tirisfal Glades" },
  lines = {
    { id = "apothecaries", text = "The apothecaries had a whole wing of the Quarter shut yesterday. Something in a jar got out, or something in a jar was let out; nobody says which." },
    { id = "scarlets", when = { minLevel = 8 }, text = "The Scarlets are building something at the monastery to the north-east, or digging something up. Either way, they mean it for us." },
    { id = "orcs", text = "An orc came down the lift, saw the canal and went straight back up. Our allies have weak stomachs, and we have none at all." },
    { id = "queen", text = "The Dark Lady wants word from every corner of Lordaeron, and the bats bring it. Mind what you say near the rafters." },
    { id = "remember", text = "One of the new risen came in asking for his wife by name. I didn't have the heart to tell him where the old graves are. He'll find them." },
  },
}

P:Rumors {
  id = "silverpine_inns", roles = { "innkeeper" }, zones = { "Silverpine Forest" },
  lines = {
    { id = "shadowfang", when = { minLevel = 16 }, text = "The keep across the water is full of worgen now, and the gates of Gilneas are shut tight behind their wall. Good riddance to the lot of them, I say." },
    { id = "dalaran", text = "The wizards of Dalaran have their dome up over the city, and a crowd of them camped on the shore beside it, all looking at it like it might fall down." },
    { id = "moonrage", text = "Wolves howled all last night out past the Sepulcher, and some of the howls had words in them. Keep to the road." },
    { id = "deathstalkers", text = "The Deathstalkers lost another scout near Pyrewood. The village looks peaceful in the day, and that's what worries them." },
  },
}

P:Rumors {
  id = "stranglethorn_inns", roles = { "innkeeper" }, zones = { "Stranglethorn Vale" },
  lines = {
    { id = "hemet", text = "Hemet Nesingwary's camp has more trophies than tents now. He's after the king of the raptors, they say, and he's being very polite about it." },
    { id = "pages", text = "Someone's been tearing up that book of Green Hills and scattering the pages all over the jungle. Half the hunters in the vale are reading it now, page by page." },
    { id = "trolls", when = { minLevel = 30 }, text = "The Bloodscalp and the Skullsplitters are killing each other again, which would be good news if they didn't kill everyone in between as well." },
    { id = "gurubashi", when = { minLevel = 30 }, text = "Every few hours, someone shouts in the old arena, and the whole jungle goes quiet to listen. Somebody always walks out rich, and somebody doesn't walk out." },
    { id = "bloodsail", text = "The Bloodsail Buccaneers have three ships sitting off the coast, and they're not fishing. Revilgaz has his cannons pointed and his prices up." },
    { id = "gnoll", text = "There's a gnoll at Booty Bay's dock swearing he's a reformed pirate. Nobody believes him, but everyone buys him a drink to hear him swear it." },
  },
}

P:Rumors {
  id = "arathi_inns", roles = { "innkeeper" }, zones = { "Arathi Highlands" },
  lines = {
    { id = "stromgarde", text = "The ogres hold half of Stromgarde now, and the Syndicate holds the rest. Galen's men keep a corner of it, and keep insisting it's the important corner." },
    { id = "syndicate", text = "The Syndicate are all ruined nobles from Alterac, with fine boots and no money. They rob you very politely, and then they rob you again." },
    { id = "basin", when = { minLevel = 20 }, text = "The League and the Defilers are both after the Arathi Basin and its farms and its mines. Folk who work the land there don't care whose flag is up; they care whose boots are on the wheat." },
    { id = "trolls", when = { faction = "Horde" }, text = "The Witherbark trolls in the hills won't talk to us, Darkspear or no. They throw spears, and then they throw curses." },
    { id = "refuge", when = { faction = "Alliance" }, text = "Refuge Pointe is short of everything but stubbornness. They'll take any sword that walks in, and they'll feed it too, if they can." },
  },
}

P:Rumors {
  id = "badlands_inns", roles = { "innkeeper" }, zones = { "Badlands", "Searing Gorge" },
  lines = {
    { id = "dragons", when = { minLevel = 35 }, text = "The black dragons in the south of the Badlands were seen flying in formation again. Dragons don't fly in formation unless somebody's giving the orders." },
    { id = "uldaman", when = { minLevel = 35 }, text = "The Explorers' League keep digging at Uldaman, and the earth keeps digging back. Last week a whole tunnel came down, and the stone was moving after." },
    { id = "darkiron", when = { minLevel = 40 }, text = "There are slaves in the Searing Gorge working the Dark Irons' pits: dwarves, gnomes, anyone they catch. Some come out, but not many." },
    { id = "kargath", when = { faction = "Horde" }, text = "Kargath has grown to be a proper outpost, and the Badlands still want to kill everyone in it. We like it that way; it keeps the soft ones out." },
  },
}

P:Rumors {
  id = "swamp_inns", roles = { "innkeeper" }, zones = { "Swamp of Sorrows", "Blasted Lands", "Deadwind Pass" },
  lines = {
    { id = "temple", when = { minLevel = 45 }, text = "The trolls that went into the sunken temple don't come out. Those that do talk about a god in the water that isn't sleeping as well as it should." },
    { id = "portal", when = { minLevel = 45 }, text = "The soldiers at Nethergarde say the Dark Portal is quiet, but they say it while staring at it, and none of them sleep well." },
    { id = "karazhan", text = "A traveller came through from Deadwind and wouldn't stop talking about the tower: music, dancing, a party nobody's living at. Then he left without his hat." },
    { id = "stonard", when = { faction = "Horde" }, text = "Stonard is the oldest Horde fort this side of the sea, and the walls know it. The old grunts there remember the first war like it was last week." },
  },
}

P:Rumors {
  id = "steppes_inns", roles = { "innkeeper" }, zones = { "Burning Steppes", "Redridge Mountains" },
  lines = {
    { id = "blackrock", when = { minLevel = 45 }, text = "Smoke over Blackrock Mountain every night, and orcs and dwarves both inside it, though not together. The dragons up top are using everyone below." },
    { id = "morgans", when = { minLevel = 45, faction = "Alliance" }, text = "Morgan's Vigil is a handful of soldiers looking down at the Blackrock orcs, and the orcs looking back. It's a staring match, and the orcs have more eyes." },
  },
}

P:Rumors {
  id = "hinterlands_inns", roles = { "innkeeper" }, zones = { "The Hinterlands" },
  lines = {
    { id = "gryphons", when = { faction = "Alliance" }, text = "The Wildhammer at Aerie Peak lost two more gryphons to the trolls. They took it hard; a Wildhammer would sooner lose a brother than a gryphon." },
    { id = "revantusk", when = { faction = "Horde" }, text = "The Revantusk tribe has thrown in with the Horde, and they're glad of the help. The other trolls of the Hinterlands are less glad." },
    { id = "jintha", when = { minLevel = 45 }, text = "The Vilebranch are doing something up at Jintha'Alor, something with blood and old gods. The drums haven't stopped for a week." },
    { id = "tree", text = "There's a great tree deep in the forest where the dragons sleep, they say. Green ones, sleeping, and dreaming bad dreams." },
  },
}

P:Rumors {
  id = "plaguelands_inns", roles = { "innkeeper" }, zones = { "Western Plaguelands", "Eastern Plaguelands", "Alterac Mountains", "Hillsbrad Foothills" },
  lines = {
    { id = "andorhal", when = { minLevel = 45 }, text = "Andorhal is full of the dead and the living both, fighting over a granary. The grain's poisoned, and nobody's told them." },
    { id = "argent", when = { minLevel = 50 }, text = "A new order's at the edge of the Plaguelands, the Argent Dawn, and they'll fight beside anyone who fights the Scourge. Even the Forsaken, they say, though nobody's tested it yet." },
    { id = "stratholme", when = { minLevel = 50 }, text = "Stratholme still burns, after all these years. The Scarlets hold half of it and the Scourge holds the rest, and the fire doesn't care which." },
    { id = "chapel", when = { minLevel = 50 }, text = "There's a chapel in the east where the dead can't walk, they say. The light there is old and stubborn, and the ghouls go round it." },
    { id = "alterac", text = "The ogres of Alterac have taken the old capital and named themselves its lords. The nobles who used to own it are robbing travellers on the road below." },
  },
}
