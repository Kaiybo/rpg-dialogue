-- Arrivals: what the character writes in the diary the first time they reach a zone.
-- One entry per zone (the zone name exactly as the game shows it), plus optional variants
-- with `when` placed before the plain one (the first whose conditions hold is used).
-- Voice: the character's own diary, past or present tense, one short sentence, 14 words
-- or fewer; the third-person form is one plain chronicle sentence of 12 words or fewer
-- ("{name} came down into ...").
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Arrival { zone = "Elwynn Forest",
  first = "Elwynn Forest is quiet enough to make you forget the Defias.",
  third = "{name} walked the green roads of Elwynn Forest.",
}

-- Eastern Kingdoms -----------------------------------------------------------------------

P:Arrival { zone = "Dun Morogh",
  first = "Dun Morogh is bitter cold, and the dwarves are cheerful about it.",
  third = "{name} trudged through the snows of Dun Morogh.",
}

P:Arrival { zone = "Tirisfal Glades", when = { faction = "Alliance" },
  first = "The Forsaken watch me from every ruin in Tirisfal Glades.",
  third = "{name} crossed into Tirisfal Glades, where no stranger is welcome.",
}

P:Arrival { zone = "Tirisfal Glades",
  first = "Tirisfal Glades smells of rot, and the trees are the colour of bruises.",
  third = "{name} walked the grey glades of Tirisfal.",
}

P:Arrival { zone = "Loch Modan",
  first = "The dwarves fish Loch Modan as if nothing could ever go wrong.",
  third = "{name} came down to the shores of Loch Modan.",
}

P:Arrival { zone = "Silverpine Forest",
  first = "Somewhere in Silverpine Forest the howling never stops.",
  third = "{name} passed beneath the dark pines of Silverpine Forest.",
}

P:Arrival { zone = "Westfall",
  first = "Westfall should be good farmland, but the fields have gone to dust.",
  third = "{name} rode into the dusty fields of Westfall.",
}

P:Arrival { zone = "Redridge Mountains",
  first = "Redridge would be lovely if Lakeshire weren't bracing for the next raid.",
  third = "{name} came to Lakeshire in the Redridge Mountains.",
}

P:Arrival { zone = "Duskwood",
  first = "Duskwood is dark even at noon, and the wind smells of graves.",
  third = "{name} entered the endless dusk of Duskwood.",
}

P:Arrival { zone = "Hillsbrad Foothills", when = { faction = "Horde" },
  first = "Hillsbrad is full of farmers who would gladly see me hanged.",
  third = "{name} came to Tarren Mill in the Hillsbrad Foothills.",
}

P:Arrival { zone = "Hillsbrad Foothills", when = { faction = "Alliance" },
  first = "Hillsbrad looks gentle, but Southshore's guards never put down their swords.",
  third = "{name} came to Southshore in the Hillsbrad Foothills.",
}

P:Arrival { zone = "Hillsbrad Foothills",
  first = "Hillsbrad would be peaceful if Southshore and Tarren Mill weren't eyeing each other.",
  third = "{name} walked the green hills of Hillsbrad.",
}

P:Arrival { zone = "Wetlands",
  first = "Menethil Harbor is the only dry place in the Wetlands for miles.",
  third = "{name} slogged through the mud and reeds of the Wetlands.",
}

P:Arrival { zone = "Alterac Mountains",
  first = "A whole kingdom lies ruined in the snow of the Alterac Mountains.",
  third = "{name} climbed into the Alterac Mountains, among a fallen kingdom's ruins.",
}

P:Arrival { zone = "Arathi Highlands",
  first = "Stromgarde's broken towers stand over the Arathi Highlands, and everyone wants the grass below.",
  third = "{name} crossed the windswept Arathi Highlands.",
}

P:Arrival { zone = "Stranglethorn Vale",
  first = "Booty Bay feels like the safest place in Stranglethorn Vale, which says a lot.",
  third = "{name} pushed into the jungles of Stranglethorn Vale.",
}

P:Arrival { zone = "Badlands",
  first = "Dragon bones lie half buried in the red canyons of the Badlands.",
  third = "{name} came into the dry red country of the Badlands.",
}

P:Arrival { zone = "Swamp of Sorrows",
  first = "A sadness hangs over the grey water of the Swamp of Sorrows.",
  third = "{name} waded into the Swamp of Sorrows.",
}

P:Arrival { zone = "The Hinterlands",
  first = "The Wildhammer dwarves fly over the Hinterlands like they own the sky.",
  third = "{name} came into the green wilds of The Hinterlands.",
}

P:Arrival { zone = "Searing Gorge",
  first = "The heat of the Searing Gorge comes up through my boots.",
  third = "{name} descended into the smoke of the Searing Gorge.",
}

P:Arrival { zone = "Blasted Lands",
  first = "The Dark Portal looms over the Blasted Lands like a wound that won't close.",
  third = "{name} crossed the Blasted Lands to see the Dark Portal.",
}

P:Arrival { zone = "Burning Steppes",
  first = "The ground of the Burning Steppes is warm wherever I put my hand.",
  third = "{name} came onto the ash of the Burning Steppes.",
}

P:Arrival { zone = "Western Plaguelands",
  first = "The Western Plaguelands were rich farmland once, and now the dead walk the roads.",
  third = "{name} entered the Western Plaguelands, where the Scourge holds Andorhal.",
}

P:Arrival { zone = "Eastern Plaguelands",
  first = "The Eastern Plaguelands are the worst place I have ever seen.",
  third = "{name} came into the Eastern Plaguelands, where the Scourge rules.",
}

P:Arrival { zone = "Deadwind Pass",
  first = "Deadwind Pass is so silent that even the wind seems to stop and listen.",
  third = "{name} came through Deadwind Pass to the foot of Karazhan.",
}

-- Eastern Kingdoms capitals ----------------------------------------------------------------

P:Arrival { zone = "Stormwind City", when = { faction = "Horde" },
  first = "Every guard on Stormwind City's walls would gladly put an arrow through me.",
  third = "{name} slipped into Stormwind City, where every guard was an enemy.",
}

P:Arrival { zone = "Stormwind City",
  first = "Stormwind City stands in white stone, rebuilt from the ashes the orcs left.",
  third = "{name} passed through the gates of Stormwind City.",
}

P:Arrival { zone = "Ironforge", when = { faction = "Horde" },
  first = "Every dwarf in Ironforge has a hammer and would gladly use it on me.",
  third = "{name} stole into Ironforge, among dwarves who wanted them dead.",
}

P:Arrival { zone = "Ironforge",
  first = "The Great Forge fills all of Ironforge with heat and hammering.",
  third = "{name} entered Ironforge, the dwarven city inside the mountain.",
}

P:Arrival { zone = "Undercity", when = { faction = "Alliance" },
  first = "The Forsaken of the Undercity would happily add me to their numbers.",
  third = "{name} crept into the Undercity, beneath ruined Lordaeron.",
}

P:Arrival { zone = "Undercity",
  first = "The Undercity is cold and green and smells of the alchemists' work.",
  third = "{name} went down into the Undercity, beneath the ruins of Lordaeron.",
}

-- Kalimdor ---------------------------------------------------------------------------------

P:Arrival { zone = "Durotar", when = { faction = "Alliance" },
  first = "Every orc in Durotar looks at me like something they haven't eaten yet.",
  third = "{name} crossed Durotar, where an Alliance traveler was not welcome.",
}

P:Arrival { zone = "Durotar",
  first = "Durotar is red dust and hard sun, and the orcs have made it theirs.",
  third = "{name} crossed the red dust of Durotar.",
}

P:Arrival { zone = "Mulgore",
  first = "Kodo herds graze the plains of Mulgore under a huge sky.",
  third = "{name} came onto the open plains of Mulgore.",
}

P:Arrival { zone = "Teldrassil",
  first = "Teldrassil is a forest grown on top of a tree, which I thought impossible.",
  third = "{name} walked the forests of Teldrassil, high on the World Tree.",
}

P:Arrival { zone = "Darkshore",
  first = "Old night elf ruins lie broken along the grey coast of Darkshore.",
  third = "{name} walked the misty coast of Darkshore.",
}

P:Arrival { zone = "The Barrens", when = { faction = "Alliance" },
  first = "Every waystation in the Barrens flies the Horde's banners, and I am not welcome.",
  third = "{name} crossed The Barrens, deep in Horde country.",
}

P:Arrival { zone = "The Barrens",
  first = "The Barrens are golden grass and dry wind as far as you can see.",
  third = "{name} crossed the wide plains of The Barrens.",
}

P:Arrival { zone = "Stonetalon Mountains",
  first = "The Venture Company has cut down half the forest in the Stonetalon Mountains.",
  third = "{name} climbed into the Stonetalon Mountains.",
}

P:Arrival { zone = "Ashenvale", when = { faction = "Horde" },
  first = "Ashenvale is beautiful, but the night elves' sentinels watch from every shadow.",
  third = "{name} came into Ashenvale, where the Warsong orcs cut timber.",
}

P:Arrival { zone = "Ashenvale", when = { faction = "Alliance" },
  first = "Ashenvale is beautiful, and the Warsong orcs are cutting it down for timber.",
  third = "{name} came into Ashenvale, where night elves defend the forest.",
}

P:Arrival { zone = "Ashenvale",
  first = "Ashenvale feels older than anything I have ever walked through.",
  third = "{name} came into the ancient forest of Ashenvale.",
}

P:Arrival { zone = "Thousand Needles",
  first = "Tauren and centaur have fought over Thousand Needles longer than anyone remembers.",
  third = "{name} came among the stone spires of Thousand Needles.",
}

P:Arrival { zone = "Desolace",
  first = "Desolace lives up to its name, all grey dust and bones.",
  third = "{name} crossed the grey wasteland of Desolace.",
}

P:Arrival { zone = "Dustwallow Marsh",
  first = "Theramore's towers stand on the coast of Dustwallow Marsh like they were dropped there.",
  third = "{name} waded into the heat of Dustwallow Marsh.",
}

P:Arrival { zone = "Feralas",
  first = "Old elven ruins lie half buried in the vines of Feralas.",
  third = "{name} came into the misty forests of Feralas.",
}

P:Arrival { zone = "Tanaris",
  first = "The sun in Tanaris tries to cook you, and the goblins sell water dear.",
  third = "{name} crossed the desert of Tanaris to Gadgetzan.",
}

P:Arrival { zone = "Azshara",
  first = "Azshara is a beautiful ruin of red and gold trees and broken elven stone.",
  third = "{name} walked among the fallen ruins of Azshara.",
}

P:Arrival { zone = "Felwood",
  first = "Felwood is a dying forest, and its water runs green with poison.",
  third = "{name} passed through the poisoned forest of Felwood.",
}

P:Arrival { zone = "Un'Goro Crater",
  first = "The dinosaurs of Un'Goro Crater are bigger than houses.",
  third = "{name} descended into the primeval jungle of Un'Goro Crater.",
}

P:Arrival { zone = "Moonglade",
  first = "Moonglade is quiet, and no one dares to break the druids' peace.",
  third = "{name} entered the sacred valley of Moonglade.",
}

P:Arrival { zone = "Winterspring",
  first = "The cold of Winterspring is beautiful as well as bitter.",
  third = "{name} came into the snows of Winterspring.",
}

P:Arrival { zone = "Silithus",
  first = "The silithid have taken Silithus for their own.",
  third = "{name} came into the sandy wastes of Silithus.",
}

-- Kalimdor capitals --------------------------------------------------------------------------

P:Arrival { zone = "Orgrimmar", when = { faction = "Alliance" },
  first = "Every orc on Orgrimmar's walls wants me dead, and I won't stay long.",
  third = "{name} slipped into Orgrimmar, where every orc was an enemy.",
}

P:Arrival { zone = "Orgrimmar",
  first = "Orgrimmar is red stone and iron spikes, humming with the business of the Horde.",
  third = "{name} came through the gates of Orgrimmar.",
}

P:Arrival { zone = "Thunder Bluff", when = { faction = "Alliance" },
  first = "Thunder Bluff's tauren are not hostile, but I am far from friendly ground.",
  third = "{name} rode the lifts up to Thunder Bluff, far from Alliance ground.",
}

P:Arrival { zone = "Thunder Bluff",
  first = "Thunder Bluff sits high on the mesas, and the wind blows straight through it.",
  third = "{name} rode the lifts up to Thunder Bluff.",
}

P:Arrival { zone = "Darnassus", when = { faction = "Horde" },
  first = "The night elves of Darnassus would put an arrow in me on sight.",
  third = "{name} slipped into Darnassus, where they had no welcome.",
}

P:Arrival { zone = "Darnassus",
  first = "Darnassus is a quiet, graceful city of moonlight and silver trees.",
  third = "{name} came to Darnassus, high in the boughs of Teldrassil.",
}

-- Forever zones ------------------------------------------------------------------------------

P:Arrival { zone = "Riverglades",
  first = "The Riverglades are good land gone to war, and the farms are burned.",
  third = "{name} came into the war-torn Riverglades.",
}

P:Arrival { zone = "Zephras Isle",
  first = "Nobody on Zephras Isle seems to notice how hard the wind blows.",
  third = "{name} reached Zephras Isle, home of the Skyborne.",
}

P:Arrival { zone = "Mount Hyjal",
  first = "The World Tree on Mount Hyjal is still blackened from Archimonde's fall.",
  third = "{name} climbed through Darkwhisper Gorge to Mount Hyjal.",
}

P:Arrival { zone = "Shen'dralas",
  first = "Highborne spirits still linger by an old temple in the ruins of Shen'dralas.",
  third = "{name} came through the Valley of Bones into Shen'dralas.",
}

P:Arrival { zone = "Dalaran",
  first = "Dalaran's dome has opened at last, and the city stands half rebuilt.",
  third = "{name} saw Dalaran with its dome opened at last.",
}
