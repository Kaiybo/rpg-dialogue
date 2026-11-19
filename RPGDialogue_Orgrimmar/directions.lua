-- "Where is...?" directions for Orgrimmar (Systems/Directions.lua). Classic coordinates.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")

P:Directions {
  town = "orgrimmar", mapID = 1454,
  entries = {
    -- Everyday places
    { id = "inn", name = "The inn", kind = "inn", text = "The Broken Tusk is in the Valley of Strength, just inside the main gate on your left. Gryshka keeps the fire going and the meat coming, so you can't miss it by the smell alone.", x = 54.1, y = 68.4 },
    { id = "bank", name = "The bank", kind = "bank", text = "The bank is in the Valley of Strength, a few strides west of the inn. Karus and the others will guard your gold better than you would.", x = 49.6, y = 69.0 }, -- coords unsure
    { id = "auction", name = "Auction house", kind = "auction", text = "Walk north through the Valley of Strength and you'll find the auction house before the road climbs toward the Drag. Read the slips before you bid, or Thathung will tell you about it.", x = 55.6, y = 62.4 }, -- coords unsure
    { id = "flight", name = "Wind rider master", kind = "flight", text = "Doras keeps the wind riders on the tall tower on the west side of the Valley of Strength. Climb the ramp to the top and tell him where you're going.", x = 45.2, y = 63.8 },
    { id = "mail", name = "Mailbox", kind = "mail", text = "There's a mailbox in the Valley of Strength, right outside the Broken Tusk. Every grunt in the city sends his letters home from there.", x = 52.8, y = 67.6 }, -- coords unsure
    { id = "stable", name = "Stable master", kind = "stable", text = "Xon'cha keeps the stables up in the Valley of Honor, by the hunters' lodge on the north side. Follow the road east past the Drag and keep climbing.", x = 69.4, y = 12.6 }, -- coords unsure

    -- Class trainers
    { id = "trainer_warrior", name = "Warrior trainer", kind = "class", class = "WARRIOR", text = "Grezz Ragefist trains warriors in the Hall of the Brave, in the Valley of Honor on the east side of the city. Go there ready to bleed, because he doesn't teach any other way.", x = 80.4, y = 32.4 },
    { id = "trainer_hunter", name = "Hunter trainer", kind = "class", class = "HUNTER", text = "Ormak Grimshot runs the Hunter's Hall at the north end of the Valley of Honor. You'll hear the beasts before you see the lodge.", x = 66.1, y = 18.5 },
    { id = "trainer_rogue", name = "Rogue trainer", kind = "class", class = "ROGUE", text = "Shenthul teaches in the Cleft of Shadow, down the dark passage north of the Valley of Strength. Keep a hand on your purse while you look for him.", x = 43.0, y = 53.6 },
    { id = "trainer_warlock", name = "Warlock trainer", kind = "class", class = "WARLOCK", text = "Your sort keeps to the Cleft of Shadow, at Darkfire Enclave where Mirket and Zevrost teach. Some of us would rather you kept further away still.", x = 48.3, y = 45.6 }, -- coords unsure
    { id = "trainer_shaman", name = "Shaman trainer", kind = "class", class = "SHAMAN", text = "Kardris Dreamseeker teaches the spirits' ways in the Valley of Wisdom, west of Grommash Hold. The elder shaman in the Warchief's hall will teach you as well.", x = 38.6, y = 36.0 }, -- coords unsure
    { id = "trainer_priest", name = "Priest trainer", kind = "class", class = "PRIEST", text = "Ur'kyo teaches the priests in the Valley of Spirits, where the Darkspear keep their huts in the southwest of the city. Follow the tunnel west from the Valley of Strength.", x = 35.6, y = 87.8 },
    { id = "trainer_mage", name = "Mage trainer", kind = "class", class = "MAGE", text = "Uthel'nay teaches magic at the Darkbriar Lodge in the Valley of Spirits, down among the trolls. Mind the fire when you go in.", x = 38.8, y = 85.6 },

    -- Profession trainers
    { id = "trainer_alchemy", name = "Alchemy trainer", kind = "profession", profession = "Alchemy", text = "Yelmak runs Yelmak's Alchemy and Potions in the Drag, on the way up toward the Valley of Wisdom. The shop smells of something that ought to be outside.", x = 56.6, y = 33.0 },
    { id = "trainer_blacksmithing", name = "Blacksmithing trainer", kind = "profession", profession = "Blacksmithing", text = "Saru Steelfury works the forges in the Valley of Honor. Follow the sound of hammers and you can't go wrong.", x = 80.0, y = 23.6 }, -- coords unsure
    { id = "trainer_enchanting", name = "Enchanting trainer", kind = "profession", profession = "Enchanting", text = "Jhag teaches enchanting in a shop in the Drag. Ask along the street if you lose your way, because the Drag winds like a snake.", x = 53.6, y = 38.4 }, -- coords unsure
    { id = "trainer_engineering", name = "Engineering trainer", kind = "profession", profession = "Engineering", text = "Nogg the goblin keeps his machine shop in the Valley of Honor. If something explodes, you've found it.", x = 75.8, y = 25.2 },
    { id = "trainer_herbalism", name = "Herbalism trainer", kind = "profession", profession = "Herbalism", text = "Jandi teaches herb lore in the Valley of Spirits, among the Darkspear huts in the southwest of the city.", x = 38.4, y = 81.6 }, -- coords unsure
    { id = "trainer_leatherworking", name = "Leatherworking trainer", kind = "profession", profession = "Leatherworking", text = "Karolek teaches leatherworking at the Kodohide Leatherworkers, on the east side of the Drag.", x = 63.0, y = 44.0 },
    { id = "trainer_mining", name = "Mining trainer", kind = "profession", profession = "Mining", text = "Makaru teaches mining in the Valley of Honor, near the forges. He'll tell you more about Durotar's rock than you asked to know.", x = 73.0, y = 26.0 },
    { id = "trainer_skinning", name = "Skinning trainer", kind = "profession", profession = "Skinning", text = "Thuwd works beside the Kodohide Leatherworkers in the Drag, and he's usually halfway through a carcass. Don't stand too close.", x = 63.0, y = 45.0 },
    { id = "trainer_tailoring", name = "Tailoring trainer", kind = "profession", profession = "Tailoring", text = "Magar teaches tailoring at Magar's Cloth Goods, in the lower Drag on the east side.", x = 63.0, y = 50.0 },
    { id = "trainer_cooking", name = "Cooking trainer", kind = "profession", profession = "Cooking", text = "Zamja teaches cooking in the Drag, not far from where the street leaves the Valley of Strength. Follow your nose and your stomach.", x = 57.4, y = 53.6 }, -- coords unsure
    { id = "trainer_firstaid", name = "First Aid trainer", kind = "profession", profession = "First Aid", text = "Arnok teaches bandaging in the Valley of Spirits. A warrior who can bind his own wounds fights another day, so don't be too proud to learn.", x = 34.2, y = 84.6 }, -- coords unsure
    { id = "trainer_fishing", name = "Fishing trainer", kind = "profession", profession = "Fishing", text = "Lumak teaches fishing in the Valley of Honor, by the water near the hunters' lodge.", x = 69.8, y = 29.4 }, -- coords unsure

    -- Notable people
    { id = "npc_thrall", name = "Thrall", kind = "npc", npc = "thrall", text = "The Warchief holds court in Grommash Hold, in the Valley of Wisdom at the top of the Drag. Go in with respect, and keep your business short.", x = 31.8, y = 37.8 },
    { id = "npc_voljin", name = "Vol'jin", kind = "npc", npc = "voljin", text = "Vol'jin stands at the Warchief's side in Grommash Hold, in the Valley of Wisdom. The Darkspear chief doesn't stray far from Thrall.", x = 34.6, y = 37.2 }, -- coords unsure
    { id = "npc_eitrigg", name = "Eitrigg", kind = "npc", npc = "eitrigg", text = "Old Eitrigg keeps to Grommash Hold, close to the Warchief. He's earned his place there, whatever the young grunts mutter.", x = 34.0, y = 36.0 }, -- coords unsure
    { id = "npc_neeru", name = "Neeru Fireblade", kind = "npc", npc = "neeru", text = "Neeru Fireblade keeps to the Cleft of Shadow, near the deep chasm in the middle of it. Most honest orcs give that place a wide berth.", x = 49.4, y = 50.6 }, -- coords unsure
    { id = "npc_belgrom", name = "Belgrom Rockmaul", kind = "npc", npc = "belgrom", text = "Belgrom Rockmaul stands outside the Hall of the Brave in the Valley of Honor. He'll tell you he speaks for the Warchief, so let him.", x = 75.8, y = 34.2 }, -- coords unsure
    { id = "npc_runthak", name = "Overlord Runthak", kind = "npc", npc = "runthak", text = "Overlord Runthak walks the Valley of Strength, keeping an eye on the gate. Stand still a moment and he'll come past you.", x = 51.0, y = 74.0 }, -- coords unsure
    { id = "npc_zilzibin", name = "Zilzibin Drumlore", kind = "npc", npc = "zilzibin", text = "Zilzibin Drumlore is in the Mighty Pen, on the Drag. Bring patience, because the troll has a great deal to say about creatures nobody else cares about.", x = 56.2, y = 46.6 }, -- coords unsure
    { id = "npc_urtrun", name = "Urtrun Clanbringer", kind = "npc", npc = "urtrun", text = "Urtrun Clanbringer registers the warbands in the Valley of Strength, near the bank. Go to him if you mean to raise your own banner.", x = 50.0, y = 67.0 }, -- coords unsure
  },
}
