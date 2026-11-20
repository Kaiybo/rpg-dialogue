-- The mage patch: what people notice about a mage's wards, armours, conjured bread and reagents.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Notice-only pools: they stack onto the role pools (pools.lua, pools_roles.lua) and
-- never replace them. There is no mana condition in the engine, so Evocation stands in
-- for "drained".
-- Aura ids: Arcane Intellect 1459/1460/1461/10156/10157, Arcane Brilliance 23028,
-- Frost Armor 168/7300/7301, Ice Armor 7302/7320/10219/10220, Mage Armor 6117/22782/22783,
-- Mana Shield 1463/8494/8495/10191/10192/10193, Ice Barrier 11426/13031/13032/13033,
-- Slow Fall 130, Evocation 12051, Arcane Power 12042, Presence of Mind 12043,
-- Combustion 11129 (and its stacking buff 28682, unsure), Ice Block 11958,
-- Dampen Magic 604/8450/8451/10173/10174, Amplify Magic 1008/8455/10169/10170,
-- Fire Ward 543/8457/8458/10223/10225, Frost Ward 6143/8461/8462/10177/28609.
-- Items: Conjured Muffin 5349, Bread 1113, Rye 1114, Pumpernickel 1487, Sourdough 8075,
-- Sweet Roll 8076, Cinnamon Roll 22895 (unsure); Conjured Water 5350, Fresh Water 2288,
-- Purified Water 2136, Spring Water 3772, Mineral Water 8077, Sparkling Water 8078,
-- Crystal Water 8079; Mana Agate 5514, Jade 5513, Citrine 8007, Ruby 8008;
-- Arcane Powder 17020, Rune of Teleportation 17031, Rune of Portals 17032, Light Feather 17056.
-- Wands: Lesser/Greater Magic Wand 11287/11288, Lesser/Greater Mystic Wand 11290/11289.
-- Unsure: the Magister's set 16682-16689, the Arcanist set 16795-16802, the Netherwind set
-- 16818/16912-16918, Combustion's buff 28682 and the Cinnamon Roll 22895.

local INTELLECT = { 1459, 1460, 1461, 10156, 10157, 23028 }
local BRILLIANCE = { 23028 }
local FROSTARMOR = { 168, 7300, 7301, 7302, 7320, 10219, 10220 }
local MAGEARMOR = { 6117, 22782, 22783 }
local MANASHIELD = { 1463, 8494, 8495, 10191, 10192, 10193 }
local BARRIER = { 11426, 13031, 13032, 13033 }
local SLOWFALL = { 130 }
local EVOCATION = { 12051 }
local ARCANEPOWER = { 12042 }
local PRESENCE = { 12043 }
local COMBUSTION = { 11129, 28682 }   -- 28682 unsure
local ICEBLOCK = { 11958 }
local DAMPEN = { 604, 8450, 8451, 10173, 10174 }
local AMPLIFY = { 1008, 8455, 10169, 10170 }
local WARDS = { 543, 8457, 8458, 10223, 10225, 6143, 8461, 8462, 10177, 28609 }

local CONJ_FOOD = { 5349, 1113, 1114, 1487, 8075, 8076, 22895 }   -- 22895 unsure
local CONJ_WATER = { 5350, 2288, 2136, 3772, 8077, 8078, 8079 }
local CONJ_ALL = { 5349, 1113, 1114, 1487, 8075, 8076, 22895, 5350, 2288, 2136, 3772, 8077, 8078, 8079 }
local CONJ_PILE = { id = 8079, min = 20 }
local MANAGEMS = { 5514, 5513, 8007, 8008 }
local POWDER = { id = 17020, min = 5 }
local RUNE_TP = { 17031 }
local RUNE_PORTAL = { 17032 }
local FEATHER = { id = 17056, min = 5 }
local WANDS = { 11287, 11288, 11290, 11289 }
local MAGISTER = { 16682, 16683, 16684, 16685, 16686, 16687, 16688, 16689 }      -- unsure
local ARCANIST = { 16795, 16796, 16797, 16798, 16799, 16800, 16801, 16802 }      -- unsure
local NETHERWIND = { 16818, 16912, 16913, 16914, 16915, 16916, 16917, 16918 }    -- unsure

---------------------------------------------------------------------------
-- Guards
---------------------------------------------------------------------------
P:Pool {
  id = "mag_guard_alliance", role = "guard", faction = "Alliance",
  notice = {
    { id = "n_mg_intellect", cat = "aura", when = { aura = INTELLECT, ["not"] = { class = "MAGE" } },
      text = "Some mage has put a glow on your brow, I see. My sergeant says it makes a fellow cleverer for an hour, though I've never noticed it make anyone wiser." },
    { id = "n_mg_frost", cat = "aura", when = { aura = FROSTARMOR },
      text = "There's frost on your shoulders in the middle of the day, {class}. Keep that armour of yours off the horses, if you please; it sets them shying at the gate." },
    { id = "n_mg_slowfall", cat = "aura", when = { aura = SLOWFALL },
      text = "You came down off that wall like a leaf on the wind, and you nearly gave me a heart attack. Use the stairs, mage; that's what the King's masons built them for." },
    { id = "n_mg_combust", cat = "aura", when = { aura = COMBUSTION },
      text = "You're near enough smoking, and this city's still got thatch on half its roofs. Put that fire out before you walk through the Trade District, or I'll be the one fetching the buckets." },
    { id = "n_mg_quarter", cat = "class", when = { class = "MAGE", zone = "Stormwind City" },
      text = "Off to the Mage Quarter, are you? Mind the violet tower and keep your spells inside it, because every time somebody practises in the street, a cart ends up on the canal roof." },
    { id = "n_mg_gnome_if", cat = "class", when = { class = "MAGE", race = "Gnome", zone = { "Ironforge", "Dun Morogh" } },
      text = "A gnome mage, heading for Tinker Town, I'd wager. Your people lost a city and kept their wits, and that's more than I'd have managed in your boots." },
    { id = "n_mg_elf", cat = "class", when = { class = "MAGE", race = "NightElf" },
      text = "A night elf throwing the arcane about, and in the open too. I've heard your Sentinels would sooner see a demon at the gate than one of their own taking up that magic again." },
    { id = "n_mg_skyborne", cat = "class", when = { class = "MAGE", race = "Skyborne" },
      text = "One of the Skyborne, by the look of you, and with a spellbook under your arm. I don't know much about your people, but folk say your ancestors were magisters, and it seems the habit held." },
    { id = "n_mg_runes", cat = "carry", when = { carrying = RUNE_PORTAL },
      text = "You've runes of portals on you, I can feel them humming from here. Open your doorways outside the walls, mage, because the last one that opened in the market brought a draught that took my hat clean off." },
    { id = "n_mg_rank", cat = "pvp", when = { class = "MAGE", pvpRank = { min = 6 } },
      text = "The lads back from the front speak of you, {rank}. They say a whole Horde charge froze to the ground at your word and stayed there while the footmen walked up to it." },
  },
  react = {
    { id = "r_mg_iceblock", on = "aura", when = { aura = ICEBLOCK },
      text = "Light's mercy, you've frozen yourself solid! Are you in there? Knock twice if you're alive." },
    { id = "r_mg_combust", on = "aura", when = { aura = COMBUSTION },
      text = "Easy with the fire, mage! This is a city, not a battlefield." },
  },
}

P:Pool {
  id = "mag_guard_horde", role = "guard", faction = "Horde",
  notice = {
    { id = "n_mg_orc", cat = "class", when = { class = "MAGE", race = "Orc" },
      text = "An orc with a spellbook. The warlocks led our people into the demons' arms, so I'll be watching what you read, but the Warchief says the arcane is no curse in itself, and I'll trust his word." },
    { id = "n_mg_troll", cat = "class", when = { class = "MAGE", race = "Troll" },
      text = "A Darkspear who throws ice instead of hexes, mon, now there's a strange sight. Keep the frost away from my feet, and you and me be getting along fine." },
    { id = "n_mg_forsaken", cat = "class", when = { class = "MAGE", race = "Scourge", zone = { "Undercity", "Tirisfal Glades" } },
      text = "Another of the Magic Quarter's scholars, back from the world above. Some of you studied in Dalaran while you still had blood in you, and you've not stopped reading since." },
    { id = "n_mg_skyborne", cat = "class", when = { class = "MAGE", race = "Skyborne" },
      text = "A Skyborne with a spellbook instead of a windstone. Thunder Bluff vouches for your people, so I'll not ask questions, but I'll admit I'm curious what the spirits make of it." },
    { id = "n_mg_tauren", cat = "class", when = { class = "MAGE", race = "Tauren" },
      text = "A tauren who works the arcane. The elders on the Rise mutter about it, but I've seen a mage's frost stop a centaur charge dead, and I've stopped muttering." },
    { id = "n_mg_intellect", cat = "aura", when = { aura = INTELLECT, ["not"] = { class = "MAGE" } },
      text = "One of the mages has put their glow on you, grunt. It's a good spell, I'm told, though it's never yet helped me win at dice." },
    { id = "n_mg_frost", cat = "aura", when = { aura = FROSTARMOR, zone = { "Orgrimmar", "Durotar" } },
      text = "Frost armour, in Durotar, under this sun! You're the coolest thing in the city, mage, and half my watch is jealous." },
    { id = "n_mg_combust", cat = "aura", when = { aura = COMBUSTION },
      text = "You're burning hot enough to light a forge. Save it for the Alliance, mage, and don't set fire to the goblin stalls." },
    { id = "n_mg_runes", cat = "carry", when = { carrying = RUNE_PORTAL },
      text = "You carry the stones for opening portals, I can hear them singing. Open your doorways outside the gate; the wyverns hate them, and so do I." },
    { id = "n_mg_rank", cat = "pvp", when = { class = "MAGE", pvpRank = { min = 6 } },
      text = "The grunts back from the front speak of you, {rank}. They say you turned a paladin into a sheep and walked away while his friends tried to work out which sheep he was." },
  },
  react = {
    { id = "r_mg_iceblock", on = "aura", when = { aura = ICEBLOCK },
      text = "Ha! Frozen like a fish in a winter pond. Come out of there when you're finished, mage." },
    { id = "r_mg_slowfall", on = "aura", when = { aura = SLOWFALL },
      text = "Floating, are you? Come down to the ground like an honest orc, mage." },
  },
}

---------------------------------------------------------------------------
-- Townsfolk
---------------------------------------------------------------------------
P:Pool {
  id = "mag_citizen_alliance", role = "citizen", faction = "Alliance",
  notice = {
    { id = "n_mg_frost", cat = "aura", when = { aura = FROSTARMOR },
      text = "Oh, you're cold as a winter well! I brushed your sleeve just now and it frosted my fingers, and I'd like an explanation, if you've one to give." },
    { id = "n_mg_manashield", cat = "aura", when = { aura = MANASHIELD },
      text = "There's a blue shimmer all round you, like the light off a lake. Is that a spell to keep the pickpockets off, because I'd pay good silver to know it myself." },
    { id = "n_mg_barrier", cat = "aura", when = { aura = BARRIER },
      text = "You're walking around inside a shell of ice, and it creaks every time you move. Doesn't it get cold in there, or do mages stop feeling the cold?" },
    { id = "n_mg_human", cat = "class", when = { class = "MAGE", race = "Human" },
      text = "A mage, and one of our own! My uncle wanted to study in Dalaran when he was a boy, and then the Scourge came and there was no Dalaran left to study in, so do learn enough for the both of you." },
    { id = "n_mg_gnome", cat = "class", when = { class = "MAGE", race = "Gnome" },
      text = "One of the gnome mages from Ironforge! My brother says your people blew up their own city, but I said that was their engineers, and mages are a different thing altogether, aren't they?" },
    { id = "n_mg_dwarf", cat = "class", when = { class = "MAGE", race = "Dwarf" },
      text = "I didn't know dwarves could be mages! I thought they all had hammers and beards and opinions about ale, though I suppose you've still got the beard." },
    { id = "n_mg_elf", cat = "class", when = { class = "MAGE", race = "NightElf" },
      text = "I heard the night elves don't hold with magic like yours, not since something terrible happened a very long time ago. Are you in trouble with your people for it?" },
    { id = "n_mg_conjured", cat = "carry", when = { carrying = CONJ_ALL, ["not"] = { class = "MAGE" } },
      text = "Is that magic bread in your pack? My cousin ate some once and said it tasted of nothing at all, but he wasn't hungry for a whole day after, so I'd call that a bargain." },
    { id = "n_mg_dalaran", cat = "class", when = { class = "MAGE", minLevel = 40 },
      text = "You've the look of someone who reads more than they sleep. Is it true they're putting Dalaran back together behind a great violet dome, or is that only a story the traders tell?" },
  },
}

P:Pool {
  id = "mag_citizen_horde", role = "citizen", faction = "Horde",
  notice = {
    { id = "n_mg_orc", cat = "class", when = { class = "MAGE", race = "Orc", zone = { "Orgrimmar", "Durotar" } },
      text = "An orc mage, in the Warchief's city. My grandmother saw the warlocks raise the Dark Portal, and she still spits when a spellcaster walks past, so don't take it personally if she spits at you." },
    { id = "n_mg_troll", cat = "class", when = { class = "MAGE", race = "Troll" },
      text = "A troll throwing frost and fire, and no loa in it at all! My old granda would say you be stealing the elves' magic, but he says that about everything he doesn't understand." },
    { id = "n_mg_tauren", cat = "class", when = { class = "MAGE", race = "Tauren", zone = { "Thunder Bluff", "Mulgore" } },
      text = "The mages on Spirit Rise say the arcane is a river that doesn't belong to the land, little one. Walk carefully with it, and remember to come back to the grass now and then." },
    { id = "n_mg_forsaken", cat = "class", when = { class = "MAGE", race = "Scourge" },
      text = "You'll be one of those dead scholars from the Magic Quarter. They say some of you were Kirin Tor before the plague, and you still talk about Dalaran as though you'd only stepped out for a moment." },
    { id = "n_mg_frost", cat = "aura", when = { aura = FROSTARMOR, zone = { "Orgrimmar", "Durotar", "The Barrens" } },
      text = "Stand still a moment, would you? You're the only cold thing for a hundred miles, and I've been sweating since sunrise." },
    { id = "n_mg_conjured", cat = "carry", when = { carrying = CONJ_ALL, ["not"] = { class = "MAGE" } },
      text = "You've got mage's water in your pack, I can see the shine on the flask. The peons say it's the cleanest drink in Kalimdor, and it never leaves sand in your teeth." },
    { id = "n_mg_intellect", cat = "aura", when = { aura = INTELLECT, ["not"] = { class = "MAGE" } },
      text = "There's a glow around your head, friend, as if somebody lit a candle in there. Has a mage been making you clever, or were you born that way?" },
  },
}

---------------------------------------------------------------------------
-- Innkeepers and vendors: conjured bread is bad for business
---------------------------------------------------------------------------
P:Pool {
  id = "mag_innkeeper", role = "innkeeper",
  notice = {
    { id = "n_mg_conjured", cat = "carry", when = { carrying = CONJ_ALL },
      text = "I can see the shine of conjured water on you from across the room. You mages are the ruin of honest innkeepers, you know, because nobody buys a mug of my milk when they can magic their own out of thin air." },
    { id = "n_mg_pile", cat = "carry", when = { carrying = CONJ_PILE },
      text = "You've enough magic water in that pack to float a boat, and I'd guess you hand it out to every adventurer who asks. Leave a little thirst in the world, mage, or I'll be closing my doors by the spring." },
    { id = "n_mg_mage", cat = "class", when = { class = "MAGE", resting = true },
      text = "A mage, taking a room. That's a rare thing, since most of you just conjure your supper and sleep wherever you sit down, so I'll take the custom and say thank you for it." },
    { id = "n_mg_feast", cat = "class", when = { class = "MAGE", minLevel = 20 },
      text = "Sit down and eat something real for once, mage. Conjured bread fills the belly, but it's never baked in an oven, and I swear you can taste the lack." },
    { id = "n_mg_evocation", cat = "aura", when = { aura = EVOCATION },
      text = "You've gone grey and glassy, and you're breathing like a bellows, and I'd say you've emptied yourself to the last drop. Sit by the fire until the colour comes back, and I'll not charge you for the chair." },
    { id = "n_mg_dwarf", cat = "class", when = { class = "MAGE", race = "Dwarf", zone = { "Ironforge", "Dun Morogh", "Loch Modan" } },
      text = "A dwarf mage in my tavern, and I'll wager ye still drink real stout like the rest of us. Thank the stone for that, {g:lad|lass}; there's no spell yet that can conjure a decent ale." },
  },
  react = {
    { id = "r_mg_slowfall", on = "aura", when = { aura = SLOWFALL },
      text = "Oh, mind the lanterns! Come down off the stairs like a guest, if you please." },
  },
}

P:Pool {
  id = "mag_vendor", role = "vendor",
  notice = {
    { id = "n_mg_conjured", cat = "carry", when = { carrying = CONJ_ALL },
      text = "Conjured bread and water in your pack, I see. That's a copper or two out of every shop's pocket, friend, so I hope you'll at least buy something you can't make out of nothing." },
    { id = "n_mg_wand", cat = "gear", when = { equipped = WANDS },
      text = "That's an enchanter's wand on your belt, and a good straight one. Point it the other way while you're looking at my stock, would you, for I've seen what those do to a shelf." },
    { id = "n_mg_amplify", cat = "aura", when = { aura = AMPLIFY },
      text = "There's a spell humming on you that makes every other spell louder, if I've read it right. Please don't let anyone heal you in here, because I'm not sure my windows would stand it." },
    { id = "n_mg_gems", cat = "carry", when = { carrying = MANAGEMS },
      text = "That's a mana gem in your pocket, isn't it? I'd offer you a good price for it, but my jeweller tells me the things fade away to nothing the moment you sell them." },
  },
}

P:Pool {
  id = "mag_vendor_food", role = "vendor", subtitle = { "food", "drink", "baker", "bread", "cook", "wine", "fishmonger", "butcher" },
  notice = {
    { id = "n_mg_class", cat = "class", when = { class = "MAGE" },
      text = "A mage at my counter, of all people. What can I sell you that you can't pull out of the air with a wave of your fingers, I wonder, besides a bit of flavour?" },
    { id = "n_mg_conjured", cat = "carry", when = { carrying = CONJ_FOOD },
      text = "I can see the conjured loaves in your pack, and they're as pale as a ghost's cheek. Real bread has a crust and a smell to it, friend, so buy one loaf of mine and remember what you're missing." },
    { id = "n_mg_water", cat = "carry", when = { carrying = CONJ_WATER },
      text = "You've mage's water, and plenty of it, so I'll not even try to sell you my spring water. I'll only say that mine has never vanished from a man's pack because the mage who made it walked off." },
    { id = "n_mg_pile", cat = "carry", when = { carrying = CONJ_PILE },
      text = "That's twenty flasks of conjured water if it's one, and I sold four bottles this whole week. Every party that goes into the hills takes a mage now, and every mage takes my customers with them." },
    { id = "n_mg_handout", cat = "carry", when = { carrying = CONJ_ALL, ["not"] = { class = "MAGE" } },
      text = "Somebody's given you magic bread and water, I see, and you'll have got it for nothing. That's a fine kindness for you and a poor week for me, so don't expect me to smile about it." },
    { id = "n_mg_human", cat = "class", when = { class = "MAGE", race = "Human", zone = "Stormwind City" },
      text = "One of the Mage Quarter's lot, come all the way down to the market for real food? I'd frame the coin if I could afford to." },
  },
}

P:Pool {
  id = "mag_vendor_reagent", role = "vendor", subtitle = { "reagent" },
  notice = {
    { id = "n_mg_class", cat = "class", when = { class = "MAGE", minLevel = 20 },
      text = "A mage, and I'd guess you've come for runes of teleportation, for they go out of here faster than I can stock them. Every one of you wants to be home for supper." },
    { id = "n_mg_norunes", cat = "carry", when = { class = "MAGE", minLevel = 20, ["not"] = { carrying = RUNE_TP } },
      text = "Not a single rune of teleportation on you, mage? Then you'll be walking home tonight like the rest of us, unless you buy one from me first." },
    { id = "n_mg_portals", cat = "carry", when = { class = "MAGE", minLevel = 40, ["not"] = { carrying = RUNE_PORTAL } },
      text = "You're out of runes of portals, and somewhere a party of adventurers is waiting on you to open their way home. I'd buy a stack before they come looking." },
    { id = "n_mg_powder", cat = "carry", when = { carrying = POWDER },
      text = "Arcane powder, and a good deal of it. I sell that to mages who mean to brighten a whole company of soldiers at once, so somebody out there thinks well of you." },
    { id = "n_mg_feather", cat = "carry", when = { carrying = FEATHER },
      text = "A bundle of light feathers in your pouch. You'll be one for the cliffs, then, stepping off them and floating down like dandelion fluff while the rest of us take the long road." },
    { id = "n_mg_warlock", cat = "class", when = { class = "MAGE", carrying = { id = 6265, min = 1 } },
      text = "A mage carrying a soul shard? I'll not ask where you found it, but you'd best keep it out of your trainer's sight, because they'll ask, and they'll not like the answer." },
  },
}

P:Pool {
  id = "mag_blacksmith", role = "blacksmith",
  notice = {
    { id = "n_mg_robes", cat = "gear", when = { class = "MAGE", durability = { max = 0.25 } },
      text = "Your robes are scorched and torn, mage, and I'm a smith, not a tailor. Find someone with a needle, and next time stand a little further back from whatever did that." },
    { id = "n_mg_frost", cat = "aura", when = { aura = FROSTARMOR },
      text = "Don't stand near my forge with that frost on you, or you'll crack the metal I'm working. Hot and cold together make a fine blade or a ruined one, and I can't tell which until it breaks." },
    { id = "n_mg_dwarf", cat = "class", when = { class = "MAGE", race = "Dwarf" },
      text = "A dwarf who's swapped the hammer for a spellbook. My da would call it a waste of good arms, but I've seen a mage's fire heat a crucible faster than my bellows ever could, so I'll hold my tongue." },
  },
}

---------------------------------------------------------------------------
-- Flight masters
---------------------------------------------------------------------------
P:Pool {
  id = "mag_flightmaster_alliance", role = "flightmaster", faction = "Alliance",
  notice = {
    { id = "n_mg_teleport", cat = "class", when = { class = "MAGE", minLevel = 20 },
      text = "A mage at my gryphon roost? I thought your sort just blinked home and left the rest of us to pay for feed. You must be going somewhere your spells can't reach." },
    { id = "n_mg_slowfall", cat = "aura", when = { aura = SLOWFALL },
      text = "You'll not need a gryphon at all if you go floating off the edge like that. Don't try it from up here, though, because the wind off the mountain doesn't care how clever your spell is." },
    { id = "n_mg_portal", cat = "class", when = { class = "MAGE", minLevel = 40 },
      text = "Opening portals now, are you? That's three of my riders a week you've put out of work, mage, so I hope you're happy with yourself." },
  },
}

P:Pool {
  id = "mag_flightmaster_horde", role = "flightmaster", faction = "Horde",
  notice = {
    { id = "n_mg_teleport", cat = "class", when = { class = "MAGE", minLevel = 20 },
      text = "A mage wanting a wind rider? Your teleport spells must not go where you need them today. Climb on, then, and don't freeze the saddle." },
    { id = "n_mg_slowfall", cat = "aura", when = { aura = SLOWFALL },
      text = "Floating like a feather, are you? The wind riders don't like it, because they think you're something to catch, so keep your feet on the ground near the roost." },
    { id = "n_mg_forsaken", cat = "class", when = { class = "MAGE", race = "Scourge", zone = { "Undercity", "Tirisfal Glades" } },
      text = "The bats don't mind the dead, but they hate the arcane, and you're humming with it. Settle yourself before you climb on, or you'll be walking to the Sepulcher." },
  },
}

---------------------------------------------------------------------------
-- Children
---------------------------------------------------------------------------
P:Pool {
  id = "mag_child", role = "child",
  notice = {
    { id = "n_mg_class", cat = "class", when = { class = "MAGE" },
      text = "You're a real mage! Can you turn my sister into a sheep? Only for a little while, I promise, just until she stops telling Mum on me." },
    { id = "n_mg_frost", cat = "aura", when = { aura = FROSTARMOR },
      text = "You're all frosty, like a window in winter! Can I draw a picture on your arm with my finger, or will it freeze off?" },
    { id = "n_mg_barrier", cat = "aura", when = { aura = BARRIER },
      text = "You're inside a big ball of ice! Does it melt if I breathe on it? I'm going to breathe on it really hard." },
    { id = "n_mg_conjured", cat = "carry", when = { carrying = CONJ_FOOD },
      text = "Is that magic bread? Can I have some? My friend says magic bread makes your hair go blue, and I've always wanted blue hair." },
    { id = "n_mg_gnome", cat = "class", when = { class = "MAGE", race = "Gnome" },
      text = "You're nearly my size, and you can do magic! When I grow up I want to be a gnome mage, even though Mum says that's not how growing up works." },
    { id = "n_mg_tauren", cat = "class", when = { class = "MAGE", race = "Tauren" },
      text = "A great big cow mage! Can you make fire come out of your horns? Please, just a tiny bit of fire?" },
    { id = "n_mg_intellect", cat = "aura", when = { aura = INTELLECT },
      text = "Your head's glowing! Is that because you're thinking really hard? I tried thinking really hard once, and I just got a headache." },
  },
  react = {
    { id = "r_mg_iceblock", on = "aura", when = { aura = ICEBLOCK },
      text = "You turned into an ice cube! Can I lick you? I won't, but I could!" },
    { id = "r_mg_slowfall", on = "aura", when = { aura = SLOWFALL },
      text = "You're floating! Do it again, and take me with you this time!" },
    { id = "r_mg_presence", on = "aura", when = { aura = PRESENCE },
      text = "Your hands went all sparkly and quick! Are you about to do something amazing? Wait, let me get my friends first!" },
  },
}

---------------------------------------------------------------------------
-- The spirit healer
---------------------------------------------------------------------------
P:Pool {
  id = "mag_spirithealer", role = "spirithealer",
  notice = {
    { id = "n_mg_first", cat = "death", place = "before", when = { class = "MAGE", deaths = { max = 1 } },
      text = "Mages arrive here looking puzzled, as though the sum came out wrong. It did not; you simply stood closer than your books advised, and the arithmetic of a blade is very simple." },
    { id = "n_mg_many", cat = "death", place = "after", when = { class = "MAGE", deaths = { min = 50 } },
      text = "You come here often for one so learned. Your file is thick with fires that spread too far and enemies who came on faster than your frost could hold them." },
    { id = "n_mg_iceblock", cat = "death", place = "after", when = { class = "MAGE", minLevel = 30 },
      text = "You had ice that might have held you safe a moment longer, if you had reached for it. Remember it the next time the blades close in, mage." },
    { id = "n_mg_sixty", cat = "death", place = "after", when = { class = "MAGE", minLevel = 60 },
      text = "You have studied the world's currents for a long time, and still you could not see the edge of this one. Go back, then, and leave the rest of the reading for later." },
  },
}

---------------------------------------------------------------------------
-- Trainers, looking at a mage
---------------------------------------------------------------------------
P:Pool {
  id = "mag_trainer_mage", role = "trainer", subtitle = "mage trainer",
  notice = {
    { id = "n_mg_armor", cat = "aura", when = { class = "MAGE", minLevel = 34, aura = { 168, 7300, 7301 } },
      text = "You're still wearing plain Frost Armor at your age? Ice Armor is in my book for a reason, and so is Mage Armor, so let's put away the training cloak." },
    { id = "n_mg_noarmor", cat = "aura", when = { class = "MAGE", minLevel = 10, ["not"] = { aura = { 168, 7300, 7301, 7302, 7320, 10219, 10220, 6117, 22782, 22783 } } },
      text = "No armour of any kind on you, I see, not frost and not the arcane. One stray arrow is all it takes, so put something between yourself and the world before you leave this room." },
    { id = "n_mg_evocation", cat = "aura", when = { aura = EVOCATION },
      text = "You're evocating in my study, and drinking the air dry while you do it. Sit and finish, then; I'll not interrupt a mage taking back what the day spent." },
    { id = "n_mg_arcanepower", cat = "aura", when = { aura = ARCANEPOWER },
      text = "Arcane Power, here, among the bookshelves! The motes are coming off you like sparks off a whetstone, so let it fade before you touch anything I value." },
    { id = "n_mg_dampen", cat = "aura", when = { aura = DAMPEN },
      text = "You've dampened the magic on yourself, which is clever in a fight and rude in a lecture, since nothing I demonstrate will land properly. Take it off, please." },
    { id = "n_mg_wards", cat = "aura", when = { aura = WARDS },
      text = "A ward up, inside the city, against nothing in particular. I'd call it nerves, but I'd rather call it practice, so I will." },
    { id = "n_mg_magister", cat = "gear", when = { equipped = MAGISTER },
      text = "Magister's regalia, or a good part of it. Someone has been walking the halls of Scholomance or the Spire, and come out with the robes of a better-dressed scholar than most of my colleagues." },
    { id = "n_mg_arcanist", cat = "gear", when = { equipped = ARCANIST },
      text = "Those robes have been somewhere very deep and very hot; I can smell the brimstone in the weave, and the wards on them are stronger than mine. I've heard rumours of fire burning under the Blackrock, and I'd sooner not ask more." },
    { id = "n_mg_netherwind", cat = "gear", when = { equipped = NETHERWIND },
      text = "There's a dragon's shadow in that cloth, and the threads twist when I look at them too long. Whoever wore those before you, it wasn't a mage of any school I trained in." },
    { id = "n_mg_powder", cat = "carry", when = { class = "MAGE", minLevel = 56, ["not"] = { carrying = { 17020 } } },
      text = "No arcane powder on you? Then you're brightening your friends one by one like a novice, which is slow, and they'll notice." },
  },
}

P:Pool {
  id = "mag_trainer_priest", role = "trainer", subtitle = "priest trainer",
  notice = {
    { id = "n_mg_class", cat = "class", when = { class = "MAGE" },
      text = "A mage in the Light's hall. We are both of us scholars, I suppose, though you read the world's currents and I read the hearts of those who walk in it." },
    { id = "n_mg_manashield", cat = "aura", when = { aura = MANASHIELD },
      text = "Your shield drinks your own strength to keep a blow off you. Ours asks the Light for it instead, and the Light, in my experience, is a kinder creditor." },
    { id = "n_mg_dampen", cat = "aura", when = { aura = DAMPEN },
      text = "You've dampened the magic around you, mage, and my healing will barely touch you while it lasts. Remember that before you call for help in a fight." },
  },
}

P:Pool {
  id = "mag_trainer_paladin", role = "trainer", subtitle = "paladin trainer", faction = "Alliance",
  notice = {
    { id = "n_mg_class", cat = "class", when = { class = "MAGE" },
      text = "One of the Kirin Tor's heirs, in the Silver Hand's hall. Uther and Antonidas were friends once, and if they could stand together, then so can we." },
    { id = "n_mg_amplify", cat = "aura", when = { aura = AMPLIFY },
      text = "Amplify Magic is on you, so every blessing I give you will land the heavier. That's a fine thing in a friend, mage, and a cruel thing to have on you when a warlock comes calling." },
  },
}

P:Pool {
  id = "mag_trainer_warrior", role = "trainer", subtitle = "warrior trainer",
  notice = {
    { id = "n_mg_class", cat = "class", when = { class = "MAGE" },
      text = "A mage in my yard. Stand behind my warriors in a fight and keep the beasts off their backs with your frost, and we'll get along fine." },
    { id = "n_mg_robes", cat = "class", when = { class = "MAGE", minLevel = 20 },
      text = "You're wearing cloth into a fight, which takes more nerve than most of my recruits have. Learn to stand back, mage, because cloth won't stop anything that gets close." },
  },
}

P:Pool {
  id = "mag_trainer_rogue", role = "trainer", subtitle = "rogue trainer",
  notice = {
    { id = "n_mg_class", cat = "class", when = { class = "MAGE" },
      text = "A mage, and you're looking at the shadows like you're trying to work out what's in them. We are, friend, and you'll not see us until it's too late, so don't bother." },
    { id = "n_mg_presence", cat = "aura", when = { aura = PRESENCE },
      text = "Your fingers have that quick look about them, as if you've got a spell ready and nothing to throw it at. Put it away, mage; I've seen sheep come out of fights faster than you'd credit." },
  },
}

P:Pool {
  id = "mag_trainer_hunter", role = "trainer", subtitle = "hunter trainer",
  notice = {
    { id = "n_mg_class", cat = "class", when = { class = "MAGE" },
      text = "A mage. The beasts don't like the smell of the arcane on you, so stand downwind of the cages, if you'd be so kind." },
    { id = "n_mg_conjured", cat = "carry", when = { carrying = CONJ_FOOD },
      text = "Conjured bread, is it? Don't feed it to my beasts; I tried it once, and the wolf looked at me as though I'd betrayed it." },
  },
}

P:Pool {
  id = "mag_trainer_druid", role = "trainer", subtitle = "druid trainer",
  notice = {
    { id = "n_mg_class_h", cat = "class", when = { class = "MAGE", faction = "Horde" },
      text = "You carry the arcane into a place of the Earth Mother, young one, and the air feels thinner for it. The Highborne's magic tore the world once, the night elves say, so walk gently here." },
    { id = "n_mg_class", cat = "class", when = { class = "MAGE", faction = "Alliance" },
      text = "The arcane, here in the grove. The last time my people let it run wild, the Well of Eternity tore the world in half, so you'll forgive me if I watch your hands." },
    { id = "n_mg_elf", cat = "class", when = { class = "MAGE", race = "NightElf" },
      text = "A kaldorei who has taken up the Highborne's magic. Shan'do Stormrage would grieve to see it, and the Sentinels would do worse than grieve, so think hard about what you are doing, child." },
    { id = "n_mg_tauren", cat = "class", when = { class = "MAGE", race = "Tauren" },
      text = "A tauren with the arcane in your hands, where the Earth Mother's gifts should be. I'll not turn you away, but I'll pray she guides you back to the grass one day." },
  },
}

P:Pool {
  id = "mag_trainer_shaman", role = "trainer", subtitle = "shaman trainer", faction = "Horde",
  notice = {
    { id = "n_mg_class", cat = "class", when = { class = "MAGE" },
      text = "The elements don't speak to you, mage, because you never ask them anything; you only take. Still, your fire burns as hot as mine, I'll grant you that." },
    { id = "n_mg_orc", cat = "class", when = { class = "MAGE", race = "Orc" },
      text = "An orc who left the spirits for books. The Warchief brought our people back to the elements, and you've wandered off into the arcane, but I'll not call you a warlock while you stay a scholar." },
  },
}

P:Pool {
  id = "mag_trainer_warlock", role = "trainer", subtitle = "warlock trainer",
  notice = {
    { id = "n_mg_class", cat = "class", when = { class = "MAGE" },
      text = "A mage, slumming among warlocks. Dalaran threw out our sort for asking the questions yours are too timid to ask, and look where Dalaran is now." },
    { id = "n_mg_intellect", cat = "aura", when = { aura = BRILLIANCE },
      text = "Arcane Brilliance, spread across a whole company. Generous of you, mage; when you tire of giving your power away, come and see how much more you could take." },
  },
}
