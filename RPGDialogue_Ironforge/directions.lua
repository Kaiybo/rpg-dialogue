-- "Where is...?" directions for Ironforge (Systems/Directions.lua). Classic coordinates.
local P = RPGDialogueAPI:Pack("rpgd.ironforge")

P:Directions {
  town = "ironforge", mapID = 1455,
  entries = {
    -- Everyday places
    { id = "inn", name = "The inn", kind = "inn", text = "The Stonefire Tavern is off the Commons, on the west side of the city. Innkeeper Firebrew will set ye up with a bed and a mug, and not always in that order.", x = 18.2, y = 51.4 },
    { id = "bank", name = "The bank", kind = "bank", text = "The Vault of Ironforge is right on the Commons, the big hall with the gold-trimmed counters. Ye'll not miss it.", x = 35.6, y = 60.4 },
    { id = "auction", name = "Auction house", kind = "auction", text = "The auction house is on the Commons, round the south side between the bank and the Stonefire Tavern. Follow the arguing and ye're there.", x = 24.2, y = 74.6 },
    { id = "flight", name = "Gryphon master", kind = "flight", text = "Gryth Thurden keeps the gryphons right beside the Great Forge, in the middle of the city, on the side toward Tinker Town.", x = 55.6, y = 47.6 },
    { id = "mail", name = "Mailbox", kind = "mail", text = "There's a mailbox out on the Commons, just in front of the Vault, where all the traffic goes by.", x = 33.4, y = 64.2 }, -- coords unsure
    { id = "stable", name = "Stable master", kind = "stable", text = "Ulbrek Firehand keeps the stables in the Military Ward, down by the Hall of Arms where the hunters train.", x = 69.8, y = 83.4 }, -- coords unsure

    -- Class trainers
    { id = "trainer_warrior", name = "Warrior trainer", kind = "class", class = "WARRIOR", text = "Warriors train in the Hall of Arms, in the Military Ward on the east side of the city. Ask for Kelstrum Stonebreaker or Bilban Tosslespanner.", x = 65.6, y = 88.4 },
    { id = "trainer_paladin", name = "Paladin trainer", kind = "class", class = "PALADIN", text = "The paladins train in the Hall of Mysteries, in the Mystic Ward on the west side. Brandur Ironhammer will see ye there.", x = 23.6, y = 6.2 }, -- coords unsure
    { id = "trainer_hunter", name = "Hunter trainer", kind = "class", class = "HUNTER", text = "Hunters train in the Military Ward, near the Hall of Arms. Daera Brightspear and the others are there with their beasts about them.", x = 70.8, y = 83.6 }, -- coords unsure
    { id = "trainer_rogue", name = "Rogue trainer", kind = "class", class = "ROGUE", text = "Down in the Forlorn Cavern, north of the Great Forge, ye'll find Hulfdan Blackbeard. It's a dim, damp place, and the folk there prefer it so.", x = 51.6, y = 15.0 },
    { id = "trainer_priest", name = "Priest trainer", kind = "class", class = "PRIEST", text = "The priests teach in the Hall of Mysteries, in the Mystic Ward. High Priest Rohan is the one to ask for.", x = 24.8, y = 9.4 }, -- coords unsure
    { id = "trainer_mage", name = "Mage trainer", kind = "class", class = "MAGE", text = "Mages are taught in the Hall of Mysteries, out in the Mystic Ward. Bink is the wee gnome lass with more spells than sense, and she'll see to ye.", x = 27.2, y = 8.4 }, -- coords unsure
    { id = "trainer_warlock", name = "Warlock trainer", kind = "class", class = "WARLOCK", text = "Warlocks keep to the Forlorn Cavern, north of the Great Forge, and Alexander Calder teaches there. Mind yer step and yer purse.", x = 50.6, y = 6.0 }, -- coords unsure

    -- Profession trainers
    { id = "trainer_alchemy", name = "Alchemy trainer", kind = "profession", profession = "Alchemy", text = "Tally Berryfizz teaches alchemy in Tinker Town, at her potion shop on the east side. Don't drink anything she hasn't labelled.", x = 66.6, y = 55.0 }, -- coords unsure
    { id = "trainer_blacksmithing", name = "Blacksmithing trainer", kind = "profession", profession = "Blacksmithing", text = "Bengus Deepforge works right at the Great Forge itself, in the heart of the city. Just follow the heat and the hammering.", x = 52.6, y = 41.6 },
    { id = "trainer_enchanting", name = "Enchanting trainer", kind = "profession", profession = "Enchanting", text = "Gimble Thistlefuzz runs the Thistlefuzz Arcanery off the Great Forge, on the east side toward Tinker Town.", x = 60.8, y = 44.2 }, -- coords unsure
    { id = "trainer_engineering", name = "Engineering trainer", kind = "profession", profession = "Engineering", text = "The engineers are all in Tinker Town, east of the Great Forge. Springspindle Fizzlegear teaches there, if ye can hear him over the machines.", x = 68.6, y = 43.2 }, -- coords unsure
    { id = "trainer_leatherworking", name = "Leatherworking trainer", kind = "profession", profession = "Leatherworking", text = "Fimble Finespindle teaches leatherworking on the west side of the Great Forge, by the tanning racks.", x = 39.6, y = 33.0 }, -- coords unsure
    { id = "trainer_mining", name = "Mining trainer", kind = "profession", profession = "Mining", text = "Geofram Bouldertoe keeps the Deep Mountain Mining Guild, just north of the Great Forge. Any dwarf worth his beard knows the way.", x = 50.0, y = 26.4 },
    { id = "trainer_skinning", name = "Skinning trainer", kind = "profession", profession = "Skinning", text = "Balthus Stoneflayer teaches skinning on the west side of the Great Forge, right beside the leatherworkers.", x = 39.8, y = 32.4 }, -- coords unsure
    { id = "trainer_tailoring", name = "Tailoring trainer", kind = "profession", profession = "Tailoring", text = "Jormund Stonebrow does the tailoring on the northwest side of the Great Forge, as far from the soot as he can get.", x = 43.2, y = 29.0 }, -- coords unsure
    { id = "trainer_cooking", name = "Cooking trainer", kind = "profession", profession = "Cooking", text = "Daryl Riknussun teaches cooking on the east side of the Great Forge, and ye'll smell his kitchen before ye see it.", x = 60.2, y = 36.6 },
    { id = "trainer_first_aid", name = "First Aid trainer", kind = "profession", profession = "First Aid", text = "Nissa Firestone teaches bandaging by the Great Forge, on the south side, where the hurt smiths can find her.", x = 55.0, y = 58.4 }, -- coords unsure
    { id = "trainer_fishing", name = "Fishing trainer", kind = "profession", profession = "Fishing", text = "Grimnur Stonebrand teaches fishing in the Forlorn Cavern, north of the Great Forge, beside the still water there.", x = 48.0, y = 6.6 }, -- coords unsure

    -- People
    { id = "npc_magni", name = "King Magni Bronzebeard", kind = "npc", npc = "magni", text = "The king holds court in the High Seat, through the great arch on the north side of the Commons. Ye'll want to mind yer manners in there.", x = 39.2, y = 55.8 },
    { id = "npc_magellas", name = "High Explorer Magellas", kind = "npc", npc = "magellas", text = "Magellas runs the Explorers' League out of the Hall of Explorers, in the northeast of the city, among the old bones and maps.", x = 69.8, y = 18.6 }, -- coords unsure
    { id = "npc_archesonus", name = "Royal Historian Archesonus", kind = "npc", npc = "archesonus", text = "The Royal Historian keeps to the library in the Hall of Explorers, up in the northeast of the city, and he'll talk yer ear off about the Three Hammers if ye let him.", x = 74.6, y = 11.6 }, -- coords unsure
    { id = "npc_stormpike_p", name = "Prospector Stormpike", kind = "npc", npc = "stormpike_p", text = "Prospector Stormpike is in the Hall of Explorers, by the library in the northeast of the city, always with a new find to show.", x = 74.6, y = 12.0 }, -- coords unsure
    { id = "npc_thorius", name = "Curator Thorius", kind = "npc", npc = "thorius", text = "Curator Thorius minds the displays in the Hall of Explorers, in the northeast of the city. Don't touch anything, or he'll know.", x = 71.6, y = 16.4 }, -- coords unsure
    { id = "npc_mekkatorque", name = "High Tinker Mekkatorque", kind = "npc", npc = "mekkatorque", text = "The High Tinker is in Tinker Town, east of the Great Forge, with what's left of Gnomeregan's finest gathered round him.", x = 68.6, y = 48.6 }, -- coords unsure
    { id = "npc_overspark", name = "Tinkmaster Overspark", kind = "npc", npc = "overspark", text = "Tinkmaster Overspark is in Tinker Town, east of the Great Forge, usually standing next to whatever just went bang.", x = 69.8, y = 50.4 }, -- coords unsure
  },
}
