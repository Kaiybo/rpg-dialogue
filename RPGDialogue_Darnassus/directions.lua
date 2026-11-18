-- "Where is...?" directions for Darnassus (Systems/Directions.lua). Classic coordinates.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")

P:Directions {
  town = "darnassus", mapID = 1457,
  entries = {
    -- Everyday places
    { id = "inn", name = "The inn", kind = "inn", text = "Innkeeper Saelienne keeps the inn on the Craftsmen's Terrace, in the north of the city. Climb the ramp into the great tree and you will find her there.", x = 67.4, y = 15.6 },
    { id = "bank", name = "The bank", kind = "bank", text = "The bank stands at the edge of the Temple Gardens, on the western side of the lake. Lairn and Garryeth keep the vaults there.", x = 40.6, y = 42.0 }, -- coords unsure
    { id = "auction", name = "Auction house", kind = "auction", text = "The auction house is on the Tradesmen's Terrace, east of the lake, where the merchants gather beneath the lanterns.", x = 56.2, y = 53.4 }, -- coords unsure
    { id = "flight", name = "Hippogryph master", kind = "flight", text = "Our hippogryphs fly from Rut'theran Village, at the foot of Teldrassil. Step through the portal at the western edge of the city and Vesprystus will be waiting below.", x = 30.0, y = 41.4 }, -- coords unsure
    { id = "mail", name = "Mailbox", kind = "mail", text = "There is a mailbox beside the bank, at the edge of the Temple Gardens, where most travellers pass on their way through the city.", x = 41.0, y = 46.0 }, -- coords unsure
    { id = "stable", name = "Stable master", kind = "stable", text = "Alassin keeps the stables near the Cenarion Enclave, in the northwest of the city, close by the hunters' lodge.", x = 39.6, y = 10.6 }, -- coords unsure

    -- Class trainers
    { id = "trainer_warrior", name = "Warrior trainer", kind = "class", class = "WARRIOR", text = "Warriors train on the Warrior's Terrace, east of the lake, where the Sentinels drill. Arias'ta Bladesinger and Darnath Bladesinger teach there.", x = 57.6, y = 34.6 }, -- coords unsure
    { id = "trainer_hunter", name = "Hunter trainer", kind = "class", class = "HUNTER", text = "Hunters are taught in the Cenarion Enclave, in the northwest of the city. Seek out Jeen'ra Nightrunner in the lodge there, among the great cats.", x = 40.4, y = 8.6 }, -- coords unsure
    { id = "trainer_rogue", name = "Rogue trainer", kind = "class", class = "ROGUE", text = "Those who walk in shadow train in the Cenarion Enclave, inside the lower hollow of the great tree. Erion Shadewhisper will find you before you find him.", x = 37.0, y = 21.8 }, -- coords unsure
    { id = "trainer_priest", name = "Priest trainer", kind = "class", class = "PRIEST", text = "The priestesses of Elune teach in the Temple of the Moon, at the southwestern end of the city. Jandria and Lariia will receive you there.", x = 37.8, y = 82.6 }, -- coords unsure
    { id = "trainer_druid", name = "Druid trainer", kind = "class", class = "DRUID", text = "The druids gather in the Cenarion Enclave, in the northwest of the city. Mathrengyl Bearwalker teaches at the top of the tallest tree, beside the Arch Druid.", x = 35.4, y = 8.4 }, -- coords unsure

    -- Profession trainers
    { id = "trainer_alchemy", name = "Alchemy trainer", kind = "profession", profession = "Alchemy", text = "Ainethil teaches alchemy on the Craftsmen's Terrace, in the north of the city, among the crafters' trees.", x = 55.0, y = 24.2 }, -- coords unsure
    { id = "trainer_enchanting", name = "Enchanting trainer", kind = "profession", profession = "Enchanting", text = "Taladan teaches enchanting on the Craftsmen's Terrace, in the north of the city, inside one of the tall tree-halls there.", x = 60.0, y = 12.6 }, -- coords unsure
    { id = "trainer_herbalism", name = "Herbalism trainer", kind = "profession", profession = "Herbalism", text = "Firodren Mooncaller teaches herbalism on the Craftsmen's Terrace, close by the alchemists, as is only sensible.", x = 48.0, y = 21.4 }, -- coords unsure
    { id = "trainer_leatherworking", name = "Leatherworking trainer", kind = "profession", profession = "Leatherworking", text = "Darianna teaches leatherworking on the Craftsmen's Terrace, in the north of the city, in the hall she shares with the skinners.", x = 64.2, y = 21.4 }, -- coords unsure
    { id = "trainer_skinning", name = "Skinning trainer", kind = "profession", profession = "Skinning", text = "Eladriel teaches skinning on the Craftsmen's Terrace, beside the leatherworkers, and she wastes nothing of the hunt.", x = 64.4, y = 20.6 }, -- coords unsure
    { id = "trainer_tailoring", name = "Tailoring trainer", kind = "profession", profession = "Tailoring", text = "Me'lynn teaches tailoring on the Craftsmen's Terrace, in the north of the city, where the looms catch the moonlight.", x = 64.0, y = 22.0 }, -- coords unsure
    { id = "trainer_cooking", name = "Cooking trainer", kind = "profession", profession = "Cooking", text = "Alegorn teaches cooking on the Craftsmen's Terrace, in the north of the city, not far from the inn.", x = 49.2, y = 21.4 }, -- coords unsure
    { id = "trainer_first_aid", name = "First Aid trainer", kind = "profession", profession = "First Aid", text = "Dannelor teaches the binding of wounds on the Craftsmen's Terrace, in the north of the city.", x = 51.6, y = 12.4 }, -- coords unsure
    { id = "trainer_fishing", name = "Fishing trainer", kind = "profession", profession = "Fishing", text = "Astaia teaches fishing beside the great lake at the heart of the city, on the Tradesmen's Terrace side.", x = 47.8, y = 56.8 }, -- coords unsure

    -- People
    { id = "npc_tyrande", name = "Tyrande Whisperwind", kind = "npc", npc = "tyrande", text = "The High Priestess is in the Temple of the Moon, at the southwestern end of the city. Climb to the upper terrace, and walk softly when you come before her.", x = 38.6, y = 81.4 }, -- coords unsure
    { id = "npc_fandral", name = "Arch Druid Fandral Staghelm", kind = "npc", npc = "fandral", text = "Arch Druid Staghelm keeps to the top of the great tree in the Cenarion Enclave, in the northwest of the city. The ramp winds a long way up.", x = 34.8, y = 9.0 }, -- coords unsure
    { id = "npc_gracina", name = "Gracina Spiritmight", kind = "npc", npc = "gracina", text = "Gracina Spiritmight serves in the Temple of the Moon, at the southwestern end of the city, near the moonwell beneath the statue of Haidene.", x = 41.8, y = 85.6 }, -- coords unsure
    { id = "npc_greywhisker", name = "Chief Archaeologist Greywhisker", kind = "npc", npc = "greywhisker", text = "Greywhisker is a dwarf of the Explorers' League, and he keeps to the Temple of the Moon, on the western side, puzzling over old carvings.", x = 31.0, y = 85.0 },
    { id = "npc_manados", name = "Argent Guard Manados", kind = "npc", npc = "manados", text = "The Argent Dawn has a pair of agents on the Craftsmen's Terrace, in the north of the city. Manados is the one in armour, watching the road.", x = 64.0, y = 25.0 }, -- coords unsure
    { id = "npc_mydrannul", name = "Mydrannul", kind = "npc", npc = "mydrannul", text = "Mydrannul keeps his stall on the Warrior's Terrace, east of the lake, among the Sentinels' quarters.", x = 59.6, y = 31.0 }, -- coords unsure
  },
}
