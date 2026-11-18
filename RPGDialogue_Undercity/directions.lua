-- "Where is...?" directions for the Undercity (Systems/Directions.lua). Classic coordinates.
local P = RPGDialogueAPI:Pack("rpgd.undercity")

P:Directions {
  town = "undercity", mapID = 1458,
  entries = {
    -- Everyday places
    { id = "inn", name = "The inn", kind = "inn", text = "Innkeeper Norman keeps the inn on the north side of the Trade Quarter's upper rim. The beds are cold, but then, so are most of his guests.", x = 67.7, y = 37.9 },
    { id = "bank", name = "The bank", kind = "bank", text = "The bank is in the very heart of the city, in the middle of the Trade Quarter. The Montagues counted Lordaeron's coin when it was alive, and they count ours now.", x = 66.0, y = 44.0 }, -- coords unsure
    { id = "auction", name = "Auction house", kind = "auction", text = "The auctioneers stand in the ring that leads out of the Trade Quarter toward the rest of the city. Bring coin, and leave your sentiment upstairs.", x = 64.4, y = 50.2 }, -- coords unsure
    { id = "flight", name = "Bat handler", kind = "flight", text = "Michael Garrett keeps the bats on the western side of the Trade Quarter. They are vile creatures, but they fly true, which is more than I can say for most of the living.", x = 63.3, y = 48.6 },
    { id = "mail", name = "Mailbox", kind = "mail", text = "The mailbox is on the north side of the Trade Quarter's upper rim, close to the inn. Your letters will find their way, even if their writer has long since stopped breathing.", x = 66.4, y = 37.6 }, -- coords unsure
    { id = "stable", name = "Stable master", kind = "stable", text = "Anya Maulray keeps the stables on the eastern side of the Trade Quarter. Her beasts have still not decided whether we mean to eat them.", x = 69.4, y = 44.2 }, -- coords unsure

    -- Class trainers
    { id = "trainer_warrior", name = "Warrior trainer", kind = "class", class = "WARRIOR", text = "The warriors drill in the War Quarter, northwest of the Trade Quarter along the canals. Angela Curthas will teach you to hold a blade in dead hands.", x = 46.8, y = 15.6 }, -- coords unsure
    { id = "trainer_paladin", name = "Paladin trainer", kind = "class", class = "PALADIN", text = "Garen Largo teaches what remains of the paladin's art in the War Quarter. He will break you of whatever the Church once taught you before he teaches you anything new.", x = 47.4, y = 14.9 },
    { id = "trainer_rogue", name = "Rogue trainer", kind = "class", class = "ROGUE", text = "The Rogues' Quarter lies to the southeast, past the canals. Carolyn Ward teaches there, if you can find her before she finds you.", x = 83.6, y = 72.0 }, -- coords unsure
    { id = "trainer_priest", name = "Priest trainer", kind = "class", class = "PRIEST", text = "The priests teach in the War Quarter, in the northwest of the city. Father Lazarus and Father Lankester will show you that the Light still answers, after a fashion.", x = 48.6, y = 18.8 },
    { id = "trainer_mage", name = "Mage trainer", kind = "class", class = "MAGE", text = "The mages keep to the Magic Quarter, in the northeast of the city past the canals. Anastasia Hartwell and her colleagues teach there.", x = 85.5, y = 14.5 },
    { id = "trainer_warlock", name = "Warlock trainer", kind = "class", class = "WARLOCK", text = "The warlocks teach in the Magic Quarter, northeast of the Trade Quarter. Richard Kerwin will instruct you, and Carendin Halgar will see to your first demon.", x = 88.4, y = 15.8 }, -- coords unsure

    -- Profession trainers
    { id = "trainer_alchemy", name = "Alchemy trainer", kind = "profession", profession = "Alchemy", text = "Doctor Martin Felben teaches alchemy in the Apothecarium, in the southwest of the city. Touch nothing on the tables that you did not bring yourself.", x = 47.2, y = 73.4 },
    { id = "trainer_blacksmithing", name = "Blacksmithing trainer", kind = "profession", profession = "Blacksmithing", text = "James Van Brunt works the forge in the War Quarter, just off the canals northwest of the Trade Quarter.", x = 61.6, y = 30.2 },
    { id = "trainer_enchanting", name = "Enchanting trainer", kind = "profession", profession = "Enchanting", text = "Lavinia Crowe teaches enchanting at the edge of the Apothecarium. She does not get many visitors, so try to look as though you mean it.", x = 62.0, y = 61.6 }, -- coords unsure
    { id = "trainer_engineering", name = "Engineering trainer", kind = "profession", profession = "Engineering", text = "Graham Van Talen teaches engineering in the Rogues' Quarter, to the southeast. Stand well back from his workbench.", x = 75.8, y = 73.6 }, -- coords unsure
    { id = "trainer_herbalism", name = "Herbalism trainer", kind = "profession", profession = "Herbalism", text = "Martha Alliestar teaches herb lore in the Apothecarium. She still talks to her plants, which is more than they deserve.", x = 55.6, y = 51.0 }, -- coords unsure
    { id = "trainer_leatherworking", name = "Leatherworking trainer", kind = "profession", profession = "Leatherworking", text = "Arthur Moore works his hides in the Rogues' Quarter, to the southeast of the Trade Quarter. Without a sense of smell, he never minds the stink.", x = 70.0, y = 57.6 }, -- coords unsure
    { id = "trainer_mining", name = "Mining trainer", kind = "profession", profession = "Mining", text = "Brom Killian teaches mining in the War Quarter, on the canal side nearest the Trade Quarter.", x = 56.0, y = 37.0 },
    { id = "trainer_skinning", name = "Skinning trainer", kind = "profession", profession = "Skinning", text = "Killian Hagey teaches skinning in the Rogues' Quarter, close beside the leatherworkers.", x = 70.6, y = 58.6 }, -- coords unsure
    { id = "trainer_tailoring", name = "Tailoring trainer", kind = "profession", profession = "Tailoring", text = "Bowen Brisboise teaches tailoring in the Magic Quarter, just past the canals from the Trade Quarter. He was a court tailor once, and he will remind you of it.", x = 70.0, y = 30.0 }, -- coords unsure
    { id = "trainer_firstaid", name = "First Aid trainer", kind = "profession", profession = "First Aid", text = "Mary Edras teaches bandaging in the Rogues' Quarter. It seems an odd skill for people who feel nothing, but rot spreads quickly in an open wound.", x = 73.2, y = 55.6 }, -- coords unsure
    { id = "trainer_fishing", name = "Fishing trainer", kind = "profession", profession = "Fishing", text = "Armand Cromwell teaches fishing by the canals in the Magic Quarter. The dead make very patient anglers, I'm told.", x = 80.6, y = 31.4 }, -- coords unsure

    -- Notable people
    { id = "npc_sylvanas", name = "Lady Sylvanas Windrunner", kind = "npc", npc = "sylvanas", text = "The Dark Lady holds court in the Royal Quarter, at the end of the long hall in the south of the city. Mind your tongue in her presence, and mind the guards.", x = 57.8, y = 91.6 },
    { id = "npc_varimathras", name = "Varimathras", kind = "npc", npc = "varimathras", text = "Varimathras stands at the Dark Lady's side in the Royal Quarter. He is a demon, and our queen's servant, and I would not care to say which comes first.", x = 56.0, y = 92.0 }, -- coords unsure
    { id = "npc_sharlindra", name = "Sharlindra", kind = "npc", npc = "uc_sharlindra", text = "Sharlindra counsels the Dark Lady in the Royal Quarter, in the south of the city.", x = 57.0, y = 90.6 }, -- coords unsure
    { id = "npc_faranell", name = "Master Apothecary Faranell", kind = "npc", npc = "faranell", text = "Master Apothecary Faranell oversees the Royal Apothecary Society in the Apothecarium, in the southwest of the city. Do not interrupt his work unless it is worth his while.", x = 48.8, y = 69.4 }, -- coords unsure
    { id = "npc_zinge", name = "Apothecary Zinge", kind = "npc", npc = "zinge", text = "Apothecary Zinge works in the Apothecarium, beside the Master Apothecary's tables.", x = 50.0, y = 68.0 },
    { id = "npc_bethor", name = "Bethor Iceshard", kind = "npc", npc = "bethor", text = "Bethor Iceshard keeps to the Magic Quarter, in the northeast of the city. He has a long memory and a short temper.", x = 84.1, y = 17.4 },
    { id = "npc_mennet", name = "Mennet Carkad", kind = "npc", npc = "mennet", text = "Mennet Carkad recruits for the Deathstalkers in the Rogues' Quarter, to the southeast. He will likely know you are coming before you arrive.", x = 84.0, y = 69.0 },
    { id = "npc_beldugur", name = "Keeper Bel'dugur", kind = "npc", npc = "beldugur", text = "Keeper Bel'dugur works at the Apothecarium's edge, nearest the Trade Quarter.", x = 53.7, y = 54.4 },
    { id = "npc_bauhaus", name = "Royal Overseer Bauhaus", kind = "npc", npc = "bauhaus", text = "Royal Overseer Bauhaus keeps the census in the Trade Quarter. Ask him nothing about your old friends, if you value your evening.", x = 64.6, y = 41.2 }, -- coords unsure
  },
}
