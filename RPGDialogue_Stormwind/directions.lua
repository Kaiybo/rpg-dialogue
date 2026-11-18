-- "Where is...?" directions for Stormwind (Systems/Directions.lua). Classic coordinates.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")

P:Directions {
  town = "stormwind", mapID = 1453,
  entries = {
    -- Everyday places
    { id = "inn", name = "The inn", kind = "inn", text = "The Gilded Rose is in the Trade District, a few doors down from the bank. Ask for Allison, and mind the stairs if you've been drinking.", x = 52.6, y = 65.7 },
    { id = "bank", name = "The bank", kind = "bank", text = "The Bank of Stormwind stands in the Trade District, and you'll know it by the guards at the door and the Burnsides counting behind the counters.", x = 57.4, y = 72.6 }, -- coords unsure
    { id = "auction", name = "Auction house", kind = "auction", text = "The auction house is in the Trade District, just north of the Gilded Rose, and it's the building with the crowd shouting prices out front.", x = 53.6, y = 59.8 },
    { id = "flight", name = "Gryphon master", kind = "flight", text = "Dungar Longdrink keeps the gryphons up on the east side of the Trade District, near the way through to Old Town. Follow the noise of wings and you can't miss him.", x = 66.3, y = 62.1 },
    { id = "mail", name = "Mailbox", kind = "mail", text = "There's a mailbox in the Trade District, right out in front of the Gilded Rose, and it's emptied every morning without fail.", x = 54.0, y = 64.2 }, -- coords unsure
    { id = "stable", name = "Stable master", kind = "stable", text = "Jenova Stoneshield keeps the stables up in the Dwarven District, at the north end of the city, near where the hunters train.", x = 61.4, y = 17.2 }, -- coords unsure

    -- Class trainers
    { id = "trainer_warrior", name = "Warrior trainer", kind = "class", class = "WARRIOR", text = "Warriors train at the barracks in Old Town, at the far northeast of the city. Wu Shen and his fellows drill recruits there from dawn until dark.", x = 78.6, y = 45.8 },
    { id = "trainer_paladin", name = "Paladin trainer", kind = "class", class = "PALADIN", text = "The Silver Hand trains its paladins in the Cathedral of Light, on Cathedral Square. Arthur the Faithful and Lord Grayson Shadowbreaker are inside, on the left as you enter.", x = 39.8, y = 29.8 }, -- coords unsure
    { id = "trainer_hunter", name = "Hunter trainer", kind = "class", class = "HUNTER", text = "Hunters train in the Dwarven District, at the north end of the city. Look for Ulfir Ironbeard, near the stables where Jenova keeps the beasts.", x = 61.6, y = 15.6 }, -- coords unsure
    { id = "trainer_rogue", name = "Rogue trainer", kind = "class", class = "ROGUE", text = "In Old Town, near the SI:7 offices, you'll find Osborne the Night Man and Lord Tony Romano. I'd keep a hand on your purse while you ask for them.", x = 74.6, y = 52.8 }, -- coords unsure
    { id = "trainer_priest", name = "Priest trainer", kind = "class", class = "PRIEST", text = "Priests are taught in the Cathedral of Light, on Cathedral Square. High Priestess Laurena holds her lessons by the great windows, up toward the altar.", x = 38.6, y = 26.0 },
    { id = "trainer_mage", name = "Mage trainer", kind = "class", class = "MAGE", text = "Mages train at the Wizard's Sanctum in the Mage Quarter, the tower with the violet glow about it. Jennea Cannon teaches there, among others.", x = 38.6, y = 79.4 },
    { id = "trainer_warlock", name = "Warlock trainer", kind = "class", class = "WARLOCK", text = "Go to the Slaughtered Lamb in the Mage Quarter and take the stairs down to the cellar, where Gakin the Darkbinder keeps his company. I'd not linger down there myself.", x = 25.2, y = 78.6 },
    { id = "trainer_druid", name = "Druid trainer", kind = "class", class = "DRUID", text = "Sheldras Moontree teaches druids in the Park, out in the west of the city past the Cathedral. He's the night elf sitting under the trees as if he owned them.", x = 20.8, y = 55.6 }, -- coords unsure

    -- Profession trainers
    { id = "trainer_alchemy", name = "Alchemy trainer", kind = "profession", profession = "Alchemy", text = "Lilyssia Nightbreeze teaches alchemy at Pestle's Apothecary in the Mage Quarter. Follow your nose; the smell will find you before the sign does.", x = 46.4, y = 79.2 }, -- coords unsure
    { id = "trainer_blacksmithing", name = "Blacksmithing trainer", kind = "profession", profession = "Blacksmithing", text = "Therum Deepforge works the anvils in the Dwarven District, at the north end of the city. You'll hear his hammer from the bridge.", x = 57.2, y = 15.2 }, -- coords unsure
    { id = "trainer_enchanting", name = "Enchanting trainer", kind = "profession", profession = "Enchanting", text = "Lucan Cordell has his shop by the canal at the edge of the Mage Quarter, just over the bridge from the Trade District.", x = 43.0, y = 64.4 }, -- coords unsure
    { id = "trainer_engineering", name = "Engineering trainer", kind = "profession", profession = "Engineering", text = "Lilliam Sparkspindle teaches engineering up in the Dwarven District, near the tram to Ironforge. If something explodes nearby, you're close.", x = 55.6, y = 8.0 }, -- coords unsure
    { id = "trainer_herbalism", name = "Herbalism trainer", kind = "profession", profession = "Herbalism", text = "Tannysa teaches herbalism in the Mage Quarter, in the garden shop near the alchemist's. She's a night elf, and kinder than she looks.", x = 45.0, y = 76.7 }, -- coords unsure
    { id = "trainer_leatherworking", name = "Leatherworking trainer", kind = "profession", profession = "Leatherworking", text = "Simon Tanner teaches leatherworking at the Protective Hide in Old Town, just past the bridge from the Trade District.", x = 66.2, y = 48.0 }, -- coords unsure
    { id = "trainer_mining", name = "Mining trainer", kind = "profession", profession = "Mining", text = "Gelman Stonehand runs Stonehand Mining in the Dwarven District, at the north end of the city, a few doors from the Deepforge smithy.", x = 51.5, y = 15.5 }, -- coords unsure
    { id = "trainer_skinning", name = "Skinning trainer", kind = "profession", profession = "Skinning", text = "Maris Granger teaches skinning at the Protective Hide in Old Town, alongside Simon Tanner. Don't waste her time, and she won't waste yours.", x = 66.6, y = 48.6 }, -- coords unsure
    { id = "trainer_tailoring", name = "Tailoring trainer", kind = "profession", profession = "Tailoring", text = "Georgio Bolero teaches tailoring at Duncan's Textiles in the Mage Quarter, and he'll tell you what's wrong with your coat before you've said hello.", x = 43.2, y = 74.0 }, -- coords unsure
    { id = "trainer_cooking", name = "Cooking trainer", kind = "profession", profession = "Cooking", text = "Stephen Ryback does the cooking at the Pig and Whistle Tavern in Old Town, and he'll teach you if you ask him nicely.", x = 73.8, y = 36.8 }, -- coords unsure
    { id = "trainer_first_aid", name = "First Aid trainer", kind = "profession", profession = "First Aid", text = "Shaina Fuller teaches bandaging at the Cathedral of Light, on Cathedral Square. She's busy with the refugees, so be quick about it.", x = 42.0, y = 26.6 }, -- coords unsure
    { id = "trainer_fishing", name = "Fishing trainer", kind = "profession", profession = "Fishing", text = "Arnold Leland teaches fishing down by the canals, between the Trade District and Cathedral Square. He's the one sitting still while everyone else hurries past.", x = 45.8, y = 58.6 }, -- coords unsure

    -- People
    { id = "npc_bolvar", name = "Highlord Bolvar Fordragon", kind = "npc", npc = "bolvar", text = "Highlord Bolvar holds court in the throne room of Stormwind Keep, at the far north end of the city. Cross the great bridge to the Keep and keep walking until the guards stop you.", x = 78.2, y = 17.6 }, -- coords unsure
    { id = "npc_anduin", name = "King Anduin Wrynn", kind = "npc", npc = "anduin", text = "The young king sits in the throne room of Stormwind Keep, at the north end of the city, with Highlord Bolvar never far from his side.", x = 78.2, y = 17.8 }, -- coords unsure
    { id = "npc_katrana", name = "Lady Katrana Prestor", kind = "npc", npc = "katrana", text = "Lady Prestor is always at court in Stormwind Keep, standing near the throne and whispering to the nobles.", x = 78.0, y = 17.6 }, -- coords unsure
    { id = "npc_shaw", name = "Master Mathias Shaw", kind = "npc", npc = "shaw", text = "SI:7 keeps its offices in Old Town, and Master Shaw is somewhere inside. Whether he'll see you is his business, not mine.", x = 75.8, y = 59.8 }, -- coords unsure
    { id = "npc_marcus", name = "General Marcus Jonathan", kind = "npc", npc = "marcus", text = "General Jonathan keeps watch where the Valley of Heroes meets the Trade District, just inside the main gate. He's the old soldier on horseback.", x = 64.4, y = 75.2 }, -- coords unsure
    { id = "npc_benedictus", name = "Archbishop Benedictus", kind = "npc", npc = "benedictus", text = "The Archbishop is in the Cathedral of Light on Cathedral Square, most often up by the altar at prayer.", x = 39.6, y = 27.4 }, -- coords unsure
    { id = "npc_milton", name = "Milton Sheaf", kind = "npc", npc = "milton", text = "Milton Sheaf keeps the Royal Library in Stormwind Keep, on the left as you go in. Speak softly when you get there, or he'll shush you.", x = 74.0, y = 7.6 }, -- coords unsure
    { id = "npc_elling", name = "Elling Trias", kind = "npc", npc = "elling", text = "Trias' Cheese is in the Trade District, near the auction house. Elling's behind the counter, and he sells cheese and only cheese, as he'll tell you himself.", x = 60.0, y = 64.4 }, -- coords unsure
    { id = "npc_thelwater", name = "Warden Thelwater", kind = "npc", npc = "thelwater", text = "Warden Thelwater keeps the Stockade, down by the canals at the edge of the Mage Quarter. Just follow the guards and the shouting.", x = 41.2, y = 58.0 }, -- coords unsure
  },
}
