-- "Where is...?" directions for Goldshire (Systems/Directions.lua). Classic coordinates (Elwynn Forest map).
local P = RPGDialogueAPI:Pack("rpgd.elwynn")

P:Directions {
  town = "goldshire", mapID = 1429,
  entries = {
    { id = "inn", name = "The inn", kind = "inn", text = "The Lion's Pride Inn is the big timbered house right in the middle of town, and you'll hear it before you see it. Ask for Innkeeper Farley, and mind he doesn't talk your ear off.", x = 43.8, y = 65.8 },
    { id = "bank", name = "The bank", kind = "bank", text = "There's no bank in Goldshire, I'm afraid, so you'll want Stormwind. Follow the road north over the bridge and through the gates, and the Stormwind Counting House is in the Trade District." },
    { id = "auction", name = "The auction house", kind = "auction", text = "For the auction house you'll have to go up to Stormwind, friend. Take the north road to the city gates and ask for the Trade District." },
    { id = "flight", name = "Gryphon master", kind = "flight", text = "Goldshire has no gryphons of its own, so walk the north road to Stormwind. Dungar Longdrink keeps the gryphons at the edge of the Trade District, not far inside the gates." },
    { id = "mail", name = "Mailbox", kind = "mail", text = "The mailbox stands just out front of the Lion's Pride, by the road, so you can't miss it.", x = 42.6, y = 64.6 }, -- coords unsure
    { id = "stable", name = "Stable master", kind = "stable", text = "Erma keeps the stables beside the Lion's Pride, and she'll look after a hunter's beast better than most folk look after their children.", x = 42.9, y = 65.9 }, -- coords unsure

    { id = "trainer_warrior", name = "Warrior trainer", kind = "class", class = "WARRIOR", text = "Lyria Du Lac drills her warriors in the yard behind Smith Argus's forge, across the road from the inn. Follow the clang of steel and you'll find her.", x = 41.1, y = 65.8 },
    { id = "trainer_paladin", name = "Paladin trainer", kind = "class", class = "PALADIN", text = "Brother Wilhelm stands behind the smithy, right beside Lyria Du Lac. He's the one in the Light's colours with the stern look about him.", x = 41.1, y = 66.0 },
    { id = "trainer_hunter", name = "Hunter trainer", kind = "class", class = "HUNTER", text = "Josephine Carson teaches the hunters out behind the smithy, near Brother Wilhelm and Lyria. Don't expect her to suffer anyone who can't draw a bow.", x = 41.1, y = 66.2 }, -- coords unsure
    { id = "trainer_priest", name = "Priest trainer", kind = "class", class = "PRIEST", text = "Priestess Josetta has a room upstairs at the Lion's Pride, which she shares with Michelle Belle. Go up the stairs and you'll find her there, praying or tending someone.", x = 43.3, y = 65.7 },
    { id = "trainer_mage", name = "Mage trainer", kind = "class", class = "MAGE", text = "Zaldimar Wefhellt keeps a room upstairs at the Lion's Pride, on the left at the top of the stairs. If something smells of smoke up there, that'll be him.", x = 43.3, y = 66.2 },
    { id = "trainer_rogue", name = "Rogue trainer", kind = "class", class = "ROGUE", text = "Keryn Sylvius sits in the quiet room of the Lion's Pride, the one with the books. She'll have noticed you long before you notice her.", x = 43.8, y = 65.9 },
    { id = "trainer_warlock", name = "Warlock trainer", kind = "class", class = "WARLOCK", text = "Your sort keep to the cellar under the Lion's Pride, Remen Marcot and Maximillian Crowe both. Take the stairs down at the back, though I'd sooner you didn't tell me what you want them for.", x = 44.4, y = 66.2 }, -- coords unsure

    { id = "trainer_blacksmithing", name = "Blacksmithing trainer", kind = "profession", profession = "Blacksmithing", text = "Smith Argus works the forge right across the road from the inn, and he's the one who teaches smithing. You'll hear his hammer from the doorstep.", x = 41.7, y = 65.6 },
    { id = "trainer_cooking", name = "Cooking trainer", kind = "profession", profession = "Cooking", text = "Tomas does the cooking at the Lion's Pride and teaches it too, back in the kitchen near Toddrick the butcher. Follow your nose and you'll find him.", x = 44.3, y = 66.0 },
    { id = "trainer_firstaid", name = "First aid trainer", kind = "profession", profession = "First Aid", text = "Michelle Belle teaches bandaging upstairs at the Lion's Pride, in the room she shares with Priestess Josetta.", x = 43.4, y = 65.6 },
    { id = "trainer_fishing", name = "Fishing trainer", kind = "profession", profession = "Fishing", text = "Lee Brown lives at the house down by Crystal Lake, east of town along the road. You'll most likely find him on the pier with a line in the water.", x = 47.5, y = 62.3 },
    { id = "trainer_skinning", name = "Skinning trainer", kind = "profession", profession = "Skinning", text = "Helene Peltskinner teaches skinning at the house by Crystal Lake, just east of town. Take the road toward the water and look for the hides on the racks.", x = 46.3, y = 62.2 },
    { id = "trainer_leatherworking", name = "Leatherworking trainer", kind = "profession", profession = "Leatherworking", text = "Adele Fielder works leather at the house by Crystal Lake, alongside Helene Peltskinner. Head east out of town toward the lake and you'll find them both.", x = 46.6, y = 62.2 }, -- coords unsure

    { id = "npc_dughan", name = "Marshal Dughan", kind = "npc", npc = "dughan", text = "Marshal Dughan stands at the crossroads in the middle of town, just west of the inn, keeping an eye on everyone who comes through. If you've business with the law, he's your man.", x = 42.1, y = 65.9 },
    { id = "npc_farley", name = "Innkeeper Farley", kind = "npc", npc = "farley", text = "Farley's behind the counter at the Lion's Pride, where he always is. Just go in and follow the sound of somebody telling a story.", x = 43.8, y = 65.8 },
    { id = "npc_pestle", name = "William Pestle", kind = "npc", npc = "pestle", text = "William Pestle has a corner inside the Lion's Pride, with his jars and bottles about him. He's the one asking every passer-by about kobold candles.", x = 43.3, y = 65.7 },
    { id = "npc_remy", name = "Remy \"Two Times\"", kind = "npc", npc = "remy", text = "Remy hangs about the road just south of the smithy, near the corner by Marshal Dughan. You'll know him because he says everything twice.", x = 42.1, y = 67.3 },
    { id = "npc_tharynn", name = "Tharynn Bouden", kind = "npc", npc = "tharynn", text = "Tharynn Bouden sells trade goods from his wagon where the south-east road leaves town. He's the one with thread and dye laid out on the boards.", x = 41.9, y = 67.1 }, -- coords unsure
    { id = "npc_brog", name = "Brog Hamfist", kind = "npc", npc = "brog", text = "Brog Hamfist sells general supplies inside the Lion's Pride, so if you need rope or flint or a water skin, go straight in.", x = 44.0, y = 66.0 }, -- coords unsure
    { id = "npc_kira", name = "Kira Songshine", kind = "npc", npc = "kira", text = "Kira Songshine travels the roads between here and Stormwind with her baskets of bread, so she could be anywhere along the way. Walk the road for a while and you'll likely smell her before you see her." },
  },
}
