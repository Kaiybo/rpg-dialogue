-- "Where is...?" directions for Thunder Bluff (Systems/Directions.lua). Classic coordinates.
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")

P:Directions {
  town = "thunder_bluff", mapID = 1456,
  entries = {
    -- Everyday places
    { id = "inn", name = "The inn", kind = "inn", text = "Innkeeper Pala keeps the inn on the south side of the central mesa, near where the lifts come up from Mulgore. Rest there, friend, and let the wind sing you to sleep.", x = 45.8, y = 64.6 },
    { id = "bank", name = "The bank", kind = "bank", text = "The bank stands on the southeastern side of the central mesa, a short walk from the inn. Chesmu and the others will keep your wealth as safe as a herd in a sheltered valley.", x = 47.4, y = 58.6 }, -- coords unsure
    { id = "auction", name = "Auction house", kind = "auction", text = "The auction house is on the central mesa, just west of the foot of the wind rider tower. Traders gather there from every tribe, so be patient with them.", x = 40.6, y = 51.2 }, -- coords unsure
    { id = "flight", name = "Wind rider master", kind = "flight", text = "Tal keeps the wind riders at the top of the tall tower in the middle of the central mesa. Climb up, and the winds will carry you wherever you need to go.", x = 46.0, y = 50.0 },
    { id = "mail", name = "Mailbox", kind = "mail", text = "The mailbox stands just outside the bank, on the southeastern side of the central mesa. It is the only one on the bluffs, so everyone's letters pass through it.", x = 46.6, y = 58.0 }, -- coords unsure
    { id = "stable", name = "Stable master", kind = "stable", text = "Bulrug tends the beasts on the central mesa, not far from the inn. He will look after your companion as if it were his own.", x = 45.8, y = 58.6 }, -- coords unsure

    -- Class trainers
    { id = "trainer_warrior", name = "Warrior trainer", kind = "class", class = "WARRIOR", text = "The Ragetotems train warriors on Hunter Rise, across the bridge to the south. Sark is the loud one, and Torm the quiet one, though both hit just as hard.", x = 57.4, y = 87.0 }, -- coords unsure
    { id = "trainer_hunter", name = "Hunter trainer", kind = "class", class = "HUNTER", text = "Urek Thunderhorn and his kin teach the hunt on Hunter Rise, over the bridge to the south of the central mesa.", x = 59.0, y = 86.6 }, -- coords unsure
    { id = "trainer_druid", name = "Druid trainer", kind = "class", class = "DRUID", text = "The druids teach in the Hall of Elders on Elder Rise, across the bridges to the northeast. Turak Runetotem and the others will show you the old ways of the Earth Mother.", x = 76.5, y = 27.3 },
    { id = "trainer_shaman", name = "Shaman trainer", kind = "class", class = "SHAMAN", text = "The Skychasers teach the shaman on Spirit Rise, over the bridges to the west. Tigor is the eldest, and he does not give his praise lightly.", x = 22.6, y = 21.0 }, -- coords unsure
    { id = "trainer_priest", name = "Priest trainer", kind = "class", class = "PRIEST", text = "The Forsaken priests teach in the Pools of Vision, in the caves beneath Spirit Rise. Miles Welsh will see you, though I cannot say I understand what he teaches.", x = 26.0, y = 15.6 }, -- coords unsure
    { id = "trainer_mage", name = "Mage trainer", kind = "class", class = "MAGE", text = "The Forsaken mages keep to the Pools of Vision, down in the caves below Spirit Rise. Archmage Shymm teaches there, and he is not a warm one.", x = 22.6, y = 14.6 }, -- coords unsure

    -- Profession trainers
    { id = "trainer_alchemy", name = "Alchemy trainer", kind = "profession", profession = "Alchemy", text = "Bena Winterhoof brews her remedies on the high rise to the north of the central mesa, near the other Winterhoof shops.", x = 47.0, y = 33.4 }, -- coords unsure
    { id = "trainer_blacksmithing", name = "Blacksmithing trainer", kind = "profession", profession = "Blacksmithing", text = "Karn Stonehoof works his forge on the west side of the central mesa. You will hear the hammer long before you see him.", x = 39.0, y = 55.0 },
    { id = "trainer_enchanting", name = "Enchanting trainer", kind = "profession", profession = "Enchanting", text = "Teg Dawnstrider teaches enchanting on the high rise, across the bridge to the north of the central mesa.", x = 45.0, y = 38.4 }, -- coords unsure
    { id = "trainer_herbalism", name = "Herbalism trainer", kind = "profession", profession = "Herbalism", text = "Komin Winterhoof teaches at Holistic Herbalism on the high rise, north of the central mesa. He knows every root and flower that grows in Mulgore.", x = 50.0, y = 40.5 },
    { id = "trainer_leatherworking", name = "Leatherworking trainer", kind = "profession", profession = "Leatherworking", text = "Una teaches leatherworking on the high rise to the north, and she honours every hide she works.", x = 41.5, y = 42.5 },
    { id = "trainer_mining", name = "Mining trainer", kind = "profession", profession = "Mining", text = "Brek Stonehoof keeps Stonehoof Geology on the west side of the central mesa, a little past his kinsman's forge.", x = 34.0, y = 57.0 },
    { id = "trainer_skinning", name = "Skinning trainer", kind = "profession", profession = "Skinning", text = "Mooranta teaches skinning on the high rise, north of the central mesa, near the leather workers.", x = 44.4, y = 43.6 }, -- coords unsure
    { id = "trainer_tailoring", name = "Tailoring trainer", kind = "profession", profession = "Tailoring", text = "Tepa teaches tailoring on the high rise to the north, close by the leather workers.", x = 44.5, y = 45.4 },
    { id = "trainer_cooking", name = "Cooking trainer", kind = "profession", profession = "Cooking", text = "Aska Mistrunner teaches cooking on the central mesa, east of the wind rider tower. Follow the smell of the cookfire and you will find her.", x = 51.0, y = 53.0 },
    { id = "trainer_firstaid", name = "First Aid trainer", kind = "profession", profession = "First Aid", text = "Pand Stonebinder teaches the binding of wounds on Spirit Rise, across the western bridges.", x = 29.6, y = 21.6 }, -- coords unsure
    { id = "trainer_fishing", name = "Fishing trainer", kind = "profession", profession = "Fishing", text = "Kah Mistrunner teaches fishing on the east side of the central mesa, near his sister Aska. He is a patient teacher, as fishermen must be.", x = 56.0, y = 46.0 },

    -- Notable people
    { id = "npc_cairne", name = "Cairne Bloodhoof", kind = "npc", npc = "cairne", text = "High Chieftain Cairne Bloodhoof sits in the great hall on the east side of the central mesa. Go to him with respect, and he will hear you.", x = 60.0, y = 51.6 },
    { id = "npc_hamuul", name = "Arch Druid Hamuul Runetotem", kind = "npc", npc = "hamuul", text = "Arch Druid Hamuul Runetotem keeps to the Hall of Elders on Elder Rise, across the bridges to the northeast.", x = 78.6, y = 28.6 }, -- coords unsure
    { id = "npc_magatha", name = "Magatha Grimtotem", kind = "npc", npc = "magatha", text = "Magatha Grimtotem dwells on Elder Rise, across the northeastern bridges. Be careful what you promise her, young one.", x = 70.6, y = 30.6 },
    { id = "npc_bashana", name = "Bashana Runetotem", kind = "npc", npc = "bashana", text = "Bashana Runetotem speaks for the Cenarion Circle on Elder Rise, not far from her father's hall.", x = 71.0, y = 34.2 },
    { id = "npc_truthseeker", name = "Sage Truthseeker", kind = "npc", npc = "truthseeker", text = "Sage Truthseeker keeps his scrolls on the central mesa, west of the wind rider tower. He trusts few, but he will speak with you.", x = 34.6, y = 47.2 }, -- coords unsure
    { id = "npc_zamah", name = "Apothecary Zamah", kind = "npc", npc = "zamah", text = "Apothecary Zamah works in the Pools of Vision, in the caves beneath Spirit Rise. The Forsaken keep to themselves down there.", x = 22.4, y = 20.6 }, -- coords unsure
    { id = "npc_xanis", name = "Xanis Flameweaver", kind = "npc", npc = "xanis", text = "Xanis Flameweaver stands on Spirit Rise, across the western bridges, among the shaman who tend the spirits.", x = 25.0, y = 31.6 }, -- coords unsure
  },
}
