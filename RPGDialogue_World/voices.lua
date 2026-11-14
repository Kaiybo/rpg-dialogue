-- "Someplace nearby" (0.26.0): what anyone in a town says when asked where to go from here.
-- Town voices outrank zone voices; a person's own answer or their trade's outranks both.
-- Places named here are all in LORE_NOTES.md (the zone lore sheets). Stranglethorn's towns
-- have fuller voices in their own pack.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Elwynn Forest
P:Voice {
  id = "northshire", community = "northshire",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Echo Ridge Mine's just up the way, full of kobolds. The vineyards are down in the valley, and the Defias like them more than they ought to." },
    { id = "v_near2", text = "Goldshire, once the marshal's done with you. Bigger town, better beds, and the Lion's Pride." },
  } },
}
P:Voice {
  id = "goldshire", community = "goldshire",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Fargodeep Mine, then Jasperlode. Both full of kobolds, both full of gold the kobolds don't deserve." },
    { id = "v_near2", text = "Hogger's out in the southwest with his gnolls. If you've a mind to collect the bounty, take friends." },
    { id = "v_near3", text = "Stormwind's up the road for anything Goldshire can't sell you, which is most things." },
  } },
}
P:Voice {
  id = "eastvale", community = "eastvale",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Redridge is east over the hills, and the orcs there are worse than our wolves. Stay this side if you can." },
    { id = "v_near2", text = "The murlocs along the water have been bolder lately. Guard Thomas will tell you about it. At length." },
  } },
}
P:Voice {
  id = "elwynn", zone = "Elwynn Forest",
  topics = { someplace_nearby = {
    { id = "v_zone1", text = "Goldshire for a bed, Stormwind for anything else, and the woods for wolves." },
  } },
}

-- Stormwind
P:Voice {
  id = "stormwind_city", community = "stormwind",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "The Cathedral if you need the Light, the Trade District if you need anything else. Old Town if you need a drink and don't mind the company." },
    { id = "v_near2", text = "The canals run right through the city. Lovely in the morning. Don't fall in after dark." },
  } },
}

-- Westfall
P:Voice {
  id = "sentinel_hill", community = "sentinel_hill",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Moonbrook belongs to the Defias now, and the Deadmines open under it. Everything else in Westfall is fields gone wild." },
    { id = "v_near2", text = "Saldean's farm, if you want a hot meal and someone who'll listen. Mind the harvest watchers on the way." },
  } },
}
P:Voice {
  id = "westfall_farms", community = "westfall_farms",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "The fields are full of harvest watchers. Sentinel Hill's the only safe place in Westfall, and that's being kind." },
    { id = "v_near2", text = "The lighthouse on the coast. There's a ghost keeps the flame lit, they say, and murlocs on the shore below." },
  } },
}
P:Voice {
  id = "westfall", zone = "Westfall",
  topics = { someplace_nearby = {
    { id = "v_zone1", text = "Sentinel Hill, if you want walls around you. Anywhere else out here, keep walking." },
  } },
}

-- Redridge
P:Voice {
  id = "lakeshire", community = "lakeshire",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "The Everstill Bridge, half built. Stonewatch Keep, lost to the orcs. Render's Valley, worse. Pick your trouble." },
    { id = "v_near2", text = "Three Corners, where the roads to Elwynn and Duskwood meet. Gnolls like it there. You shouldn't." },
  } },
}

-- Duskwood
P:Voice {
  id = "darkshire", community = "darkshire",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Raven Hill Cemetery, where the dead won't stay put. Roland's Doom, where nobody goes twice. The Rotting Orchard. Duskwood has no nice places left." },
    { id = "v_near2", text = "The Night Watch patrols as far as it can. Past that, you're on your own with the worgen." },
  } },
}
P:Voice {
  id = "raven_hill", community = "raven_hill",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "The cemetery's right there, and it doesn't stay quiet. Darkshire's the nearest town with walls, if you can call them walls." },
  } },
}

-- Wetlands
P:Voice {
  id = "menethil", community = "menethil",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "The Dragonmaw hold the hills, the Dark Iron took Dun Modr, and the bog's full of things with teeth. Welcome to the Wetlands." },
    { id = "v_near2", text = "The Deepwater Tavern, if you want warm ale and a dwarf to pour it. That's the best place in the Wetlands, and I've seen them all." },
  } },
}

-- Dun Morogh
P:Voice {
  id = "coldridge", community = "coldridge",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Anvilmar's right here. Past that, troggs in the pass and Frostmane trolls in the hills. Kharanos when ye're ready for a proper town." },
  } },
}
P:Voice {
  id = "kharanos", community = "kharanos",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Frostmane Hold's out in the snow, and the trolls in it don't like us. Ironforge is up the road, inside the mountain." },
  } },
}
P:Voice {
  id = "dun_morogh", zone = "Dun Morogh",
  topics = { someplace_nearby = {
    { id = "v_zone1", text = "Ironforge in the mountain, Kharanos down the road, and snow everywhere else." },
  } },
}

-- Teldrassil
P:Voice {
  id = "shadowglen", community = "shadowglen",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Shadowthread Cave is close. Go in with a light and a blade. Past the glen, the path runs on to Dolanaar." },
  } },
}
P:Voice {
  id = "dolanaar", community = "dolanaar",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Shadowglen behind you, Darnassus ahead. Dolanaar stands between them, and the Sentinels keep the road." },
  } },
}

-- Durotar
P:Voice {
  id = "valley_of_trials", community = "valley_of_trials",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "The Burning Blade have caves in the north of the valley. Watch them. Beyond the valley, Razor Hill." },
  } },
}
P:Voice {
  id = "razor_hill", community = "razor_hill",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Orgrimmar to the north, Sen'jin Village and the Echo Isles to the south, and Kul Tirans on our coast who should have gone home." },
  } },
}
P:Voice {
  id = "senjin", community = "senjin",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "The Echo Isles, just off the shore. Zalazane holds them now. The Darkspear mean to take them back." },
  } },
}
P:Voice {
  id = "durotar", zone = "Durotar",
  topics = { someplace_nearby = {
    { id = "v_zone1", text = "Orgrimmar on the northern edge, Razor Hill in the middle, scorpids everywhere else." },
  } },
}

-- Mulgore
P:Voice {
  id = "narache", community = "narache",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "The Battleboar Pen's close, and the quilboar don't like company. Past the camp, Bloodhoof Village." },
  } },
}
P:Voice {
  id = "bloodhoof", community = "bloodhoof",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Stonebull Lake is right here. The Venture Company's digging to the east, the Palemane gnolls are in the west, and Thunder Bluff stands to the north." },
  } },
}
P:Voice {
  id = "mulgore", zone = "Mulgore",
  topics = { someplace_nearby = {
    { id = "v_zone1", text = "Thunder Bluff on its mesas, Bloodhoof in the grass, and good plains between." },
  } },
}

-- The Barrens
P:Voice {
  id = "crossroads", community = "crossroads",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "Quilboar, centaur, and the Wailing Caverns somewhere under it all. Ratchet's on the coast if you want the sea." },
  } },
}
P:Voice {
  id = "barrens", zone = "The Barrens",
  topics = { someplace_nearby = {
    { id = "v_zone1", text = "The Crossroads in the middle. Ratchet on the coast. Everything else out here wants to eat you." },
  } },
}

-- Tirisfal Glades
P:Voice {
  id = "deathknell", community = "deathknell",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "The Scourge are in the north. The Scarlet Crusade has a camp to the southeast. Brill's the nearest place that won't try to kill you." },
  } },
}
P:Voice {
  id = "brill", community = "brill",
  topics = { someplace_nearby = {
    { id = "v_near1", text = "The Undercity's close, under the ruins of the old capital. Out in the glades, the Crusade's camps and the Scourge's leftovers." },
  } },
}
P:Voice {
  id = "tirisfal", zone = "Tirisfal Glades",
  topics = { someplace_nearby = {
    { id = "v_zone1", text = "The Undercity under the ruins, Brill on the road, and the Crusade in its camps." },
  } },
}
