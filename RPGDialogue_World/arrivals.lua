-- Arrivals: what the character writes in the diary the first time they reach a zone.
-- One entry per zone (the zone name exactly as the game shows it), plus optional variants
-- with `when` placed before the plain one (the first whose conditions hold is used).
-- Voice: the character's own diary, past or present tense, 1-2 whole sentences; the
-- third-person form reads like a chronicle ("{name} came down into ...").
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Arrival { zone = "Elwynn Forest",
  first = "Elwynn Forest, green and gold and quiet enough that you could forget the Defias and the kobolds were ever here. Almost.",
  third = "{name} walked the roads of Elwynn Forest, where the farms are green and the quiet doesn't quite reach the mines.",
}

-- Eastern Kingdoms -----------------------------------------------------------------------

P:Arrival { zone = "Dun Morogh",
  first = "The snow in Dun Morogh squeaks underfoot and the cold gets into your teeth, yet every dwarf I pass is cheerful about it. They grumble more about the troglodytes and the Frostmane trolls than the weather.",
  third = "{name} trudged through the snows of Dun Morogh, where the dwarves laugh at the cold and curse the trolls in the hills.",
}

P:Arrival { zone = "Tirisfal Glades", when = { faction = "Alliance" },
  first = "Tirisfal Glades is grey and rotten, with pumpkins swelling in dead fields and the Forsaken watching me from every ruin. The Scarlet Crusade holds the north, and I am not sure they would welcome me either.",
  third = "{name} crossed into Tirisfal Glades, where the dead keep their own fields and nobody, living or otherwise, looks kindly on a stranger from the south.",
}

P:Arrival { zone = "Tirisfal Glades",
  first = "Tirisfal Glades smells of damp earth and rot, and the trees have gone the colour of old bruises. The Forsaken tend their sickly fields here while the Scarlet Crusade burns anything that moves wrongly to the north.",
  third = "{name} walked the grey glades of Tirisfal, between the Forsaken's fields and the Scarlet Crusade's fires.",
}

P:Arrival { zone = "Loch Modan",
  first = "Loch Modan opens out around a great blue lake held back by the Stonewrought Dam, and the dwarves fish it as if nothing could ever go wrong. Down in the south, they say, the Dark Iron dwarves are digging closer.",
  third = "{name} came down to the shores of Loch Modan, where the great dam holds the water and the dwarves keep a wary eye on the south.",
}

P:Arrival { zone = "Silverpine Forest",
  first = "Silverpine Forest is dark pines and cold sea mist, and somewhere out there the howling never stops. People here speak of worgen and Shadowfang Keep as if both were ordinary weather.",
  third = "{name} passed beneath the dark pines of Silverpine Forest, where the mist rolls in from the sea and the howling carries from Shadowfang Keep.",
}

P:Arrival { zone = "Westfall",
  first = "Westfall should be good farmland, but the fields have gone to dust and the harvest golems walk on their own. Every farmer blames the Defias Brotherhood, and only the People's Militia stands against them.",
  third = "{name} rode into the dusty fields of Westfall, where the Defias rob the farmers blind and the People's Militia does what Stormwind will not.",
}

P:Arrival { zone = "Redridge Mountains",
  first = "Redridge is red rock and quiet water around Lakeshire, and it would be lovely if the town weren't bracing for the next raid. The Blackrock orcs and their gnolls keep coming down from the hills.",
  third = "{name} came to Redridge and the town of Lakeshire, where the bridge is half-built and the Blackrock orcs are never far away.",
}

P:Arrival { zone = "Duskwood",
  first = "Duskwood is dark even at noon, with the trees pressing close and the smell of graves on the wind. Darkshire whispers about worgen and the walking dead, and the Night Watch keeps the lamps lit.",
  third = "{name} entered the endless dusk of Duskwood, where the Night Watch keeps Darkshire's lamps burning against the worgen and the risen dead.",
}

P:Arrival { zone = "Hillsbrad Foothills", when = { faction = "Horde" },
  first = "Hillsbrad is green and rolling and full of farmers who would gladly see me hanged. The Forsaken at Tarren Mill watch Southshore across the hills, and they have plans nobody says aloud.",
  third = "{name} came to Tarren Mill in the Hillsbrad Foothills, where the Forsaken watch Southshore across the hills and wait.",
}

P:Arrival { zone = "Hillsbrad Foothills", when = { faction = "Alliance" },
  first = "Hillsbrad looks like a gentle place of farms and orchards, but Southshore's guards never put down their swords. Tarren Mill belongs to the Forsaken now, and you can feel it watching from the hills.",
  third = "{name} came to Southshore in the Hillsbrad Foothills, where the farms are green and the Forsaken hold Tarren Mill only a short ride away.",
}

P:Arrival { zone = "Hillsbrad Foothills",
  first = "Hillsbrad is green hills and apple orchards, and it would be peaceful if Southshore and Tarren Mill weren't eyeing each other across them. Everyone here has a story about the war, and most of them are recent.",
  third = "{name} walked the green hills of Hillsbrad, caught between Southshore's guards and the dead of Tarren Mill.",
}

P:Arrival { zone = "Wetlands",
  first = "The Wetlands are mud and reeds and rain that never decides whether to fall, and Menethil Harbor is the only dry place for miles. The Dragonmaw orcs still hold the eastern roads.",
  third = "{name} slogged through the Wetlands, between the crocolisks in the reeds and the Dragonmaw orcs on the eastern road.",
}

P:Arrival { zone = "Alterac Mountains",
  first = "The Alterac Mountains are cold and steep, and the ruins of a whole kingdom lie in the snow up here. The Syndicate prowls the old estates, and ogres hold the ruined city.",
  third = "{name} climbed into the Alterac Mountains, where a fallen kingdom's ruins are full of Syndicate thieves and ogres.",
}

P:Arrival { zone = "Arathi Highlands",
  first = "The Arathi Highlands are wide and windswept, with Stromgarde's broken towers and Thoradin's Wall standing over grass that used to be farmland. The Syndicate, the ogres and the Forsaken all want a piece of it now.",
  third = "{name} crossed the Arathi Highlands, where the bones of old Stromgarde stand over grassland everyone seems to want.",
}

P:Arrival { zone = "Stranglethorn Vale",
  first = "Stranglethorn Vale is a wall of green heat and noise, with tigers in the brush and trolls in every ruin. Nesingwary's hunters shoot anything with a pelt, and Booty Bay feels safest, which says a lot.",
  third = "{name} pushed into the jungles of Stranglethorn Vale, among the trolls, the tigers, the hunters and the pirates of Booty Bay.",
}

P:Arrival { zone = "Badlands",
  first = "The Badlands are baked red rock and dust that gets into everything, and dragon bones lie half buried in the canyons. The Dark Iron dwarves dig at Uldaman, and the ogres hold the hills.",
  third = "{name} came into the Badlands, a dry red country of dragon bones, ogres and Dark Iron digs.",
}

P:Arrival { zone = "Swamp of Sorrows",
  first = "The Swamp of Sorrows lives up to its name, with heavy air, grey water and a sadness that seems to hang over the place. Somewhere under the water lies the sunken temple of Atal'Hakkar, and the trolls still guard it.",
  third = "{name} waded into the Swamp of Sorrows, where the sunken temple sleeps beneath the black water.",
}

P:Arrival { zone = "The Hinterlands",
  first = "The Hinterlands are wild green hills full of birdsong, and the Wildhammer dwarves fly their gryphons over them like they own the sky. The Witherbark trolls and the forest trolls of the old empire still haunt the ruins.",
  third = "{name} came into the green wilds of The Hinterlands, where Wildhammer gryphons ride the wind over old troll ruins.",
}

P:Arrival { zone = "Searing Gorge",
  first = "The Searing Gorge is a pit of smoke and slag, and the heat comes up through my boots. The Dark Iron dwarves work their slaves at the great cauldron here, and the whole place stinks of sulphur and forge-fire.",
  third = "{name} descended into the Searing Gorge, where the Dark Iron dwarves work their furnaces under a sky of smoke.",
}

P:Arrival { zone = "Blasted Lands",
  first = "The Blasted Lands are red dust and dead earth, and the Dark Portal looms over the south like a wound that will not close. The demons here have never left, and Nethergarde Keep watches them from the hill.",
  third = "{name} crossed the Blasted Lands to see the Dark Portal, cold and silent, while Nethergarde Keep watched the demons that remain.",
}

P:Arrival { zone = "Burning Steppes",
  first = "The Burning Steppes are ash and black rock under a red sky, and the ground is warm wherever I put my hand. Blackrock Mountain smokes to the west, full of orcs and black dragons.",
  third = "{name} came onto the Burning Steppes, where the ash falls like snow and Blackrock Mountain smoulders on the horizon.",
}

P:Arrival { zone = "Western Plaguelands",
  first = "The Western Plaguelands were rich farmland once, and now the grain rots and the dead walk the roads. The Scourge holds Andorhal, and the Argent Dawn and the Scarlet Crusade each claim the answer.",
  third = "{name} entered the Western Plaguelands, where the plague still rots the fields and the Scourge holds Andorhal.",
}

P:Arrival { zone = "Eastern Plaguelands",
  first = "The Eastern Plaguelands are the worst place I have ever seen, with sick green rivers, blighted trees and the Scourge everywhere. Light's Hope Chapel is the only clean ground for miles, and the necropolises hang overhead.",
  third = "{name} came into the Eastern Plaguelands, where the Scourge rules and only Light's Hope Chapel holds out against it.",
}

P:Arrival { zone = "Deadwind Pass",
  first = "Deadwind Pass is cold, grey and silent, and even the wind seems to stop to listen. Karazhan stands at the bottom of the ravine, and everyone says Medivh's old tower is better left alone.",
  third = "{name} came through Deadwind Pass, where Karazhan stands empty at the foot of the ravine.",
}

-- Eastern Kingdoms capitals ----------------------------------------------------------------

P:Arrival { zone = "Stormwind City", when = { faction = "Horde" },
  first = "Stormwind City is white stone and blue banners, and every guard on the walls would gladly put an arrow through me. I should not be here, and the whole city seems to know it.",
  third = "{name} slipped into Stormwind City, the heart of the Alliance, where every guard was an enemy.",
}

P:Arrival { zone = "Stormwind City",
  first = "Stormwind City is white stone and blue banners, rebuilt from the ashes the orcs left it in. The young king sits on the throne while Lady Prestor whispers in the court, and the Stonemasons are still owed their pay.",
  third = "{name} passed through the gates of Stormwind City, rebuilt in white stone after the First War.",
}

P:Arrival { zone = "Ironforge", when = { faction = "Horde" },
  first = "Ironforge is carved into the mountain itself, and the forges roar loud enough to hide a heartbeat. Every dwarf with a hammer here would be glad to use it on me, so I had better keep moving.",
  third = "{name} stole into Ironforge, deep in the mountain, among dwarves who would have gladly seen them dead.",
}

P:Arrival { zone = "Ironforge",
  first = "Ironforge is carved into the mountain itself, and the Great Forge fills the whole hall with heat and hammering. King Magni rules from the high throne, and the gnomes here are still homesick for Gnomeregan.",
  third = "{name} entered Ironforge, the great dwarven city cut into the heart of the mountain.",
}

P:Arrival { zone = "Undercity", when = { faction = "Alliance" },
  first = "The Undercity lies beneath the ruins of Lordaeron, and the air down here is cold and green and full of rot. The Forsaken would happily add me to their numbers, and I don't intend to give them the chance.",
  third = "{name} crept into the Undercity, beneath ruined Lordaeron, where the Forsaken would gladly have kept them forever.",
}

P:Arrival { zone = "Undercity",
  first = "The Undercity lies beneath the ruins of Lordaeron, and the air down here is cold and green and smells of the alchemists' work. The Dark Lady rules, and the Royal Apothecary Society keeps its own secrets.",
  third = "{name} went down into the Undercity, the Forsaken's capital beneath the ruins of Lordaeron.",
}

-- Kalimdor ---------------------------------------------------------------------------------

P:Arrival { zone = "Durotar", when = { faction = "Alliance" },
  first = "Durotar is red dust and hard sun, and every orc I pass looks at me like I am something they have not eaten yet. Warchief Thrall built this country from nothing, and it shows.",
  third = "{name} crossed the red dust of Durotar, land of the orcs, where an Alliance traveler was anything but welcome.",
}

P:Arrival { zone = "Durotar",
  first = "Durotar is red dust and hard sun, a harsh country the orcs have made their own. The Burning Blade lurks in the caves, and the Kul Tiras fleet still sits at Tiragarde Keep down the coast.",
  third = "{name} crossed the red dust of Durotar, the land Thrall carved out for his people.",
}

P:Arrival { zone = "Mulgore",
  first = "Mulgore is gentle grassland under a huge sky, with kodo herds grazing and the wind sweeping the plains. The tauren are peaceful folk, but the Venture Company and the gnolls trouble their quiet.",
  third = "{name} came onto the plains of Mulgore, where the tauren graze their herds under an open sky.",
}

P:Arrival { zone = "Teldrassil",
  first = "Teldrassil is a forest grown on top of a tree, which I didn't think possible until I saw it. The night elves move through the green shadows like they belong to it, and the furbolgs are said to be sickening.",
  third = "{name} walked the forests of Teldrassil, high on the World Tree the night elves had grown.",
}

P:Arrival { zone = "Darkshore",
  first = "Darkshore is grey sea and dark forest, and the ruins of the old night elf cities lie broken along the coast. The furbolgs have turned savage, and something old and corrupt stirs in the woods.",
  third = "{name} walked the misty coast of Darkshore, where the night elves' old ruins stand among the trees.",
}

P:Arrival { zone = "The Barrens", when = { faction = "Alliance" },
  first = "The Barrens are flat and endless and dry, and every waystation flies the Horde's banners. The quilboar and the centaur are bad enough, but the orcs at the Crossroads are worse company for someone like me.",
  third = "{name} crossed the dry plains of The Barrens, deep in Horde country, where the Crossroads watched every road.",
}

P:Arrival { zone = "The Barrens",
  first = "The Barrens are flat and endless, golden grass and dry wind as far as you can see. The Crossroads is the heart of it, with quilboar and centaur raiding from the hills and the Venture Company cutting down the oases.",
  third = "{name} crossed the wide plains of The Barrens, past the Crossroads, the quilboar and the centaur raiders.",
}

P:Arrival { zone = "Stonetalon Mountains",
  first = "The Stonetalon Mountains are high stone and tall trees, though the Venture Company has cut half the forest down. The goblins are clear-cutting everything they can reach, and the land bleeds where they've been.",
  third = "{name} climbed into the Stonetalon Mountains, where the Venture Company tears down the forest for profit.",
}

P:Arrival { zone = "Ashenvale", when = { faction = "Horde" },
  first = "Ashenvale is beautiful, all violet leaves and old trees, but the night elves' sentinels watch from every shadow. The Warsong orcs cut timber here, and the elves have not forgiven them for it.",
  third = "{name} came into Ashenvale, where the Warsong orcs cut timber and the night elf sentinels hunt them through the trees.",
}

P:Arrival { zone = "Ashenvale", when = { faction = "Alliance" },
  first = "Ashenvale is beautiful, all violet leaves and ancient trees, and the night elves love every inch of it. The Warsong orcs cut it down for timber, and the Sentinels hunt them through the woods.",
  third = "{name} came into Ashenvale, where the night elves fight to keep the forest from the Warsong orcs' axes.",
}

P:Arrival { zone = "Ashenvale",
  first = "Ashenvale is an ancient forest of violet leaves and tall trees, and it feels older than anything I've walked through. The night elves and the Warsong orcs fight over every tree.",
  third = "{name} came into the ancient forest of Ashenvale, where the night elves and the Warsong orcs fight over every tree.",
}

P:Arrival { zone = "Thousand Needles",
  first = "Thousand Needles is a maze of tall stone spires, and the tauren and the centaur have been fighting over it longer than anyone remembers. The Shimmering Flats glow white in the south, where the goblins race.",
  third = "{name} came into Thousand Needles, where the stone spires rise high and the goblins race across the salt flats.",
}

P:Arrival { zone = "Desolace",
  first = "Desolace lives up to its name, all grey dust and bones under a pale sky. The centaur clans wage war against each other, and the Burning Legion's demons still lurk in the south.",
  third = "{name} crossed the grey wasteland of Desolace, where the centaur tribes war among the bones.",
}

P:Arrival { zone = "Dustwallow Marsh",
  first = "Dustwallow Marsh is hot and wet and full of biting things, and Theramore's towers stand on the coast like they were dropped there. Lady Jaina Proudmoore's city keeps the peace, and the black dragons nest in the south.",
  third = "{name} waded into Dustwallow Marsh, where Theramore stands on the coast and the black dragons nest in the south.",
}

P:Arrival { zone = "Feralas",
  first = "Feralas is a deep green forest of mist and giant trees, and old elven ruins lie half buried in the vines. Dire Maul sits at its heart, and they say its halls hold things best left sleeping.",
  third = "{name} came into the misty forests of Feralas, where the ruins of Dire Maul stand among the giant trees.",
}

P:Arrival { zone = "Tanaris",
  first = "Tanaris is sand as far as you can see and a sun that tries to cook you, with Gadgetzan alone in the middle of it. The goblins sell water dear, and Zul'Farrak's trolls lie to the north.",
  third = "{name} crossed the desert of Tanaris to the goblin town of Gadgetzan, where water costs dearly.",
}

P:Arrival { zone = "Azshara",
  first = "Azshara is a beautiful ruin of red and gold trees and broken elven stone. The naga haunt the coast, and the satyrs and the Blue Dragonflight both have reasons to be here that nobody will explain.",
  third = "{name} walked among the fallen ruins of Azshara, where the naga haunt the shores of the old elven empire.",
}

P:Arrival { zone = "Felwood",
  first = "Felwood is a dying forest, the trees blackened and twisted and the water green and poisoned. The Burning Legion's taint lingers here, and the furbolgs and satyrs who drink from these waters have gone mad.",
  third = "{name} passed through Felwood, where the Legion's corruption has poisoned the forest and maddened the creatures within.",
}

P:Arrival { zone = "Un'Goro Crater",
  first = "Un'Goro Crater is a hot, wet basin of giant ferns and steaming pools, and the dinosaurs here are bigger than houses. The silithid are spreading, and the crystals here hum with old power.",
  third = "{name} descended into Un'Goro Crater, a primeval jungle of devilsaurs, crystals and spreading silithid hives.",
}

P:Arrival { zone = "Moonglade",
  first = "Moonglade is calm and quiet, a sacred valley of soft moonlight and still waters. The druids of the Cenarion Circle keep it peaceful, and no one dares to break that peace.",
  third = "{name} entered the sacred valley of Moonglade, where the Cenarion Circle keeps a peace that no one breaks.",
}

P:Arrival { zone = "Winterspring",
  first = "Winterspring is deep snow and pine trees under a pale sky, and the cold here is beautiful as well as bitter. The goblins of Everlook trade with anyone, and the yeti caves and the Winterfall furbolgs keep travelers wary.",
  third = "{name} came into the snows of Winterspring, where the goblins of Everlook trade with anyone who reaches them.",
}

P:Arrival { zone = "Silithus",
  first = "Silithus is a land of sand and hives, and the silithid have taken it for their own. The Cenarion Circle holds a camp here, and they say something terrible waits beneath Ahn'Qiraj's walls.",
  third = "{name} came into the sandy wastes of Silithus, where the silithid hives spread and the walls of Ahn'Qiraj stand silent.",
}

-- Kalimdor capitals --------------------------------------------------------------------------

P:Arrival { zone = "Orgrimmar", when = { faction = "Alliance" },
  first = "Orgrimmar is red stone and iron spikes and the smell of smoke and meat, and every orc on the walls wants me dead. Thrall's city is not a place for someone like me, and I won't stay long.",
  third = "{name} slipped into Orgrimmar, Thrall's stronghold, where every orc on the walls was an enemy.",
}

P:Arrival { zone = "Orgrimmar",
  first = "Orgrimmar is red stone and iron spikes, built into the canyon walls. Thrall rules from Grommash Hold, and the city hums with orcs, trolls and tauren going about the business of the Horde.",
  third = "{name} came through the gates of Orgrimmar, the stronghold of the Horde, built from the red rock of Durotar.",
}

P:Arrival { zone = "Thunder Bluff", when = { faction = "Alliance" },
  first = "Thunder Bluff is a city on the mesas, with lifts and rope bridges and the wind blowing through. The tauren are not hostile, exactly, but I am a long way from friendly ground.",
  third = "{name} rode the lifts up to Thunder Bluff, a Horde city on the mesas, a long way from Alliance ground.",
}

P:Arrival { zone = "Thunder Bluff",
  first = "Thunder Bluff is a city on the mesas, with lifts and rope bridges and the wind blowing through. Cairne Bloodhoof rules here, and the tauren are calm, proud and patient.",
  third = "{name} rode the lifts up to Thunder Bluff, where the tauren live high on the mesas under an open sky.",
}

P:Arrival { zone = "Darnassus", when = { faction = "Horde" },
  first = "Darnassus is a city of moonlight and silver trees, and the night elves here would put an arrow in me as soon as look at me. I have no business here and I know it.",
  third = "{name} slipped into Darnassus, the night elves' city high in the boughs of Teldrassil, where they had no welcome.",
}

P:Arrival { zone = "Darnassus",
  first = "Darnassus is a city of moonlight and silver trees, quiet and graceful. Tyrande Whisperwind rules from the Temple of the Moon, and the night elves move through the streets as if they had all the time in the world.",
  third = "{name} came to Darnassus, the night elves' city high in the boughs of Teldrassil.",
}

-- Forever zones ------------------------------------------------------------------------------

P:Arrival { zone = "Riverglades",
  first = "The Riverglades are good land gone to war, with burned farms and a keep that has held out for twenty years. The Brotherhood of the Horse holds Farholde, and the Twilight's Hammer is creeping in.",
  third = "{name} came into the Riverglades, where the Brotherhood of the Horse still holds Farholde Keep against the Twilight's Hammer.",
}

P:Arrival { zone = "Zephras Isle",
  first = "Zephras Isle is all wind and open sky, and nobody here seems to notice how hard it blows. This is the Skyborne's home, and their elders speak of failing pylons and islands that drift.",
  third = "{name} reached Zephras Isle, home of the Skyborne, where the wind never stops and the islands drift.",
}
