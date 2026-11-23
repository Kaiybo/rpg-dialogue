-- "Where is...?" directions for the Crossroads (Systems/Directions.lua). Classic coordinates (Barrens map).
local P = RPGDialogueAPI:Pack("rpgd.barrens")

P:Directions {
  town = "crossroads", mapID = 1413,
  entries = {
    { id = "inn", name = "The inn", kind = "inn", text = "The inn is the big hall at the north end of the fort, and Innkeeper Boorand Plainswind keeps it. Go in, rest your feet, and stay out of the grunts' way.", x = 52.0, y = 29.9 },
    { id = "bank", name = "The bank", kind = "bank", text = "There's no bank at the Crossroads, because this is a fort and not a city. Your gold waits in Orgrimmar, in the Valley of Strength." },
    { id = "auction", name = "The auction house", kind = "auction", text = "If you want the auction house, you'll have to go back to Orgrimmar. The wind riders will get you there faster than your feet will." },
    { id = "flight", name = "Wind rider master", kind = "flight", text = "Devrak keeps the wind riders on the tower at the west side of the fort, near the inn. Pay him and his beasts will carry you to Orgrimmar or Thunder Bluff.", x = 51.5, y = 30.3 },
    { id = "mail", name = "Mailbox", kind = "mail", text = "The mailbox stands outside the inn at the north end of the fort. It's the one thing here the centaur haven't tried to burn.", x = 52.4, y = 30.0 }, -- coords unsure
    { id = "stable", name = "Stable master", kind = "stable", text = "Sikwa keeps the stables by the inn, at the north end of the fort. She'll mind your beast as if it were her own.", x = 52.6, y = 29.8 }, -- coords unsure

    { id = "npc_thork", name = "Thork", kind = "npc", npc = "thork", text = "Thork holds the Crossroads for the Warchief, and he stands by the watchtower on the west side of the fort. If it concerns the safety of these roads, it concerns him.", x = 51.5, y = 30.9 },
    { id = "npc_sergra", name = "Sergra Darkthorn", kind = "npc", npc = "sergra", text = "Sergra Darkthorn stands on the south side of the fort, near the gate. She's the one sending new blood out past the walls to prove itself on the plains.", x = 52.2, y = 31.0 },
    { id = "npc_mankrik", name = "Mankrik", kind = "npc", npc = "mankrik", text = "Mankrik keeps watch up on the wall at the south side, staring out at the grass. If you ask him about his wife Olgra, ask gently.", x = 52.0, y = 31.6 }, -- coords unsure
    { id = "npc_tonga", name = "Tonga Runetotem", kind = "npc", npc = "tonga", text = "Tonga Runetotem, the tauren druid, waits at the south edge of the fort, past Sergra. He's the one worried about the oases.", x = 52.3, y = 31.9 },
    { id = "npc_helbrim", name = "Apothecary Helbrim", kind = "npc", npc = "helbrim", text = "Apothecary Helbrim works at his table by the wind rider tower, on the west side. He's Forsaken, so you'll know him by the smell of his bottles.", x = 51.5, y = 30.1 },
    { id = "npc_darsok", name = "Darsok Swiftdagger", kind = "npc", npc = "darsok", text = "Darsok Swiftdagger stands near the inn at the north end of the fort. He'll tell you he's the best blade in the Barrens before you've even asked about the harpies.", x = 51.9, y = 30.3 },
    { id = "npc_gazrog", name = "Gazrog", kind = "npc", npc = "gazrog", text = "Gazrog keeps the guard tower on the west side of the fort, near Thork. Don't mention the guards' silver unless you've come to help him find it.", x = 51.2, y = 30.9 }, -- coords unsure
  },
}
