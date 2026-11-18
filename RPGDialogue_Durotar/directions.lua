-- "Where is...?" directions for Razor Hill (Systems/Directions.lua). Classic coordinates (Durotar map).
local P = RPGDialogueAPI:Pack("rpgd.durotar")

P:Directions {
  town = "razor_hill", mapID = 1411,
  entries = {
    { id = "inn", name = "The inn", kind = "inn", text = "The inn is the big hut on the north side of the road, with smoke always rising from it. Innkeeper Grosk will find you a bed and something hot.", x = 51.5, y = 41.6 },
    { id = "bank", name = "The bank", kind = "bank", text = "Razor Hill keeps no bank. Take the road north to Orgrimmar, and the goblins who hold your gold are in the Valley of Strength." },
    { id = "auction", name = "The auction house", kind = "auction", text = "There's no auction house here, so you'll have to go to Orgrimmar. Walk north up the road to the gates, and the auctioneers are in the Valley of Strength." },
    { id = "flight", name = "Wind rider master", kind = "flight", text = "Razor Hill has no wind riders of its own. Go north to Orgrimmar and climb the tower in the Valley of Strength, and Doras will put you on a beast." },
    { id = "mail", name = "Mailbox", kind = "mail", text = "The mailbox stands outside the inn, by the road. You'd have to try hard to miss it.", x = 51.9, y = 41.9 }, -- coords unsure
    { id = "stable", name = "Stable master", kind = "stable", text = "Shoja'my keeps the stables just past the inn. Bring your beast to her and she'll treat it better than she treats most orcs.", x = 52.6, y = 41.6 }, -- coords unsure

    { id = "trainer_warrior", name = "Warrior trainer", kind = "class", class = "WARRIOR", text = "Tarshaw Jaggedscar trains warriors in the barracks on the east side of the hill. Go in ready to bleed, because he won't go easy on you.", x = 54.2, y = 42.2 }, -- coords unsure
    { id = "trainer_shaman", name = "Shaman trainer", kind = "class", class = "SHAMAN", text = "Swart teaches the shaman in the barracks on the east side of town. Find him there and show the spirits some respect.", x = 54.4, y = 42.6 }, -- coords unsure
    { id = "trainer_priest", name = "Priest trainer", kind = "class", class = "PRIEST", text = "Tai'jin keeps to the barracks on the east side, where the wounded come back from the road. Look for the troll tending the bandaged ones.", x = 54.4, y = 42.4 }, -- coords unsure
    { id = "trainer_hunter", name = "Hunter trainer", kind = "class", class = "HUNTER", text = "Thotar stands outside the bunker at the south end of town, with his wolf at his heel. He has no patience for hunters who forget their beasts.", x = 51.8, y = 43.5 },
    { id = "trainer_rogue", name = "Rogue trainer", kind = "class", class = "ROGUE", text = "Kaplak keeps to the lower floor of the bunker at the south end of town. You won't see him until he wants you to, so just go down and wait.", x = 52.0, y = 43.7 }, -- coords unsure
    { id = "trainer_warlock", name = "Warlock trainer", kind = "class", class = "WARLOCK", text = "Dhugru Gorelust keeps a hut at the north-east edge of town, past the barracks. Go if you must, but I wouldn't linger there.", x = 54.4, y = 41.2 }, -- coords unsure

    { id = "trainer_mining", name = "Mining trainer", kind = "profession", profession = "Mining", text = "Krunn teaches mining by the forge, just north of the road near the inn. Follow the ring of the anvil.", x = 52.0, y = 40.6 }, -- coords unsure
    { id = "trainer_blacksmithing", name = "Blacksmithing trainer", kind = "profession", profession = "Blacksmithing", text = "Dwukk works the forge north of the road, near the inn. If you can hear a hammer, you're close.", x = 52.0, y = 40.7 }, -- coords unsure
    { id = "trainer_engineering", name = "Engineering trainer", kind = "profession", profession = "Engineering", text = "Mukdrak teaches engineering by the forge, north of the inn. He'll be the one with the singed hands and the tools scattered about him.", x = 52.4, y = 40.8 }, -- coords unsure
    { id = "trainer_firstaid", name = "First aid trainer", kind = "profession", profession = "First Aid", text = "Rawrk teaches bandaging in the barracks on the east side of town. Plenty of grunts come back bleeding, so he gets plenty of practice.", x = 54.2, y = 42.0 }, -- coords unsure

    { id = "npc_garthok", name = "Gar'Thok", kind = "npc", npc = "garthok", text = "Gar'Thok commands this town from the bunker at the south end, under the watchtower. Go to him if you want work, and don't waste his time.", x = 51.9, y = 43.5 },
    { id = "npc_orgnil", name = "Orgnil Soulscar", kind = "npc", npc = "orgnil", text = "Orgnil Soulscar stands near the bunker at the south end of town, close to Gar'Thok. He's the one watching for the Burning Blade.", x = 52.2, y = 43.1 },
    { id = "npc_grosk", name = "Innkeeper Grosk", kind = "npc", npc = "grosk", text = "Grosk runs the inn on the north side of the road, so go inside and he'll be at the fire.", x = 51.5, y = 41.6 },
    { id = "npc_torka", name = "Cook Torka", kind = "npc", npc = "torka", text = "Cook Torka feeds the garrison from his cookfire on the west side of town. Follow the smell of roasting boar, and don't stand in his way.", x = 51.1, y = 42.6 }, -- coords unsure
    { id = "npc_takrin", name = "Takrin Pathseeker", kind = "npc", npc = "takrin", text = "Takrin Pathseeker waits by the huts at the west edge of town. He's a scout, and if you look strong enough he'll send you west to the Barrens.", x = 50.9, y = 43.6 }, -- coords unsure
    { id = "npc_uhgar", name = "Uhgar", kind = "npc", npc = "uhgar", text = "Uhgar sells weapons near the forge, just north of the road by the inn. Tell him what you fight with and he'll tell you what's wrong with it.", x = 52.0, y = 41.0 }, -- coords unsure
  },
}
