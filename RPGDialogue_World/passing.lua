local P = RPGDialogueAPI:Pack("rpgd.world")

-- Passing remarks: bark-only pools, spoken to the player as they walk by.

------------------------------------------------------------------ guards
P:Pool { id = "pass_guard_stormwind", role = "guard", community = "stormwind",
  barks = {
    { id = "b_canal", text = "Watch your footing on the canal bridges, {class}; the stones get slick after rain." },
    { id = "b_taxes", text = "If you're headed to the Keep about taxes, you'll join a queue that reaches the Trade District." },
    { id = "b_dwarf", when = { race = "Dwarf" }, text = "Ironforge's finest, welcome. Mind you don't start any arguments in the Pig and Whistle tonight." },
    { id = "b_gnome", when = { race = "Gnome" }, text = "Gnomeregan's lot are always welcome here, friend, but please keep the gadgets from catching fire indoors." },
    { id = "b_elf", when = { race = "NightElf" }, text = "Long way from Darnassus, aren't you? The cathedral bells will be a change from your quiet woods." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "Lanterns are lit, so keep to the main streets after dark; the Old Town alleys aren't kind." },
    { id = "b_rogue", when = { class = "ROGUE" }, text = "I've got my eye on your hands, {class}, so keep them where the Watch can see them." },
    { id = "b_paladin", when = { class = "PALADIN" }, text = "The Light keep you, {g:brother|sister}; it does the men good to see one of the Order walk by." },
    { id = "b_low", when = { maxLevel = 10 }, text = "Fresh out of Northshire, by the look of you. Keep at it and you'll grow into that kit." },
    { id = "b_high", when = { minLevel = 55 }, text = "You've seen worse than Stormwind's streets, I'd wager; Light knows the Watch is glad of folk like you." },
    { id = "b_mount", when = { mounted = true }, text = "Ease that mount down through the gate, {g:sir|ma'am}; we've had three carts upended this week." },
    { id = "b_naked", when = { nearlyNaked = true }, text = "Light above, put some clothes on before the Cathedral sisters see you walking about like that." },
    { id = "b_regular", when = { timesTalked = { min = 5 } }, text = "Back again, {name}? You're getting to be a regular sight on my rounds." },
    { id = "b_helped", when = { word = "helped" }, text = "Word in the barracks is you've done the city some good, so walk tall, {class}." },
  } }

P:Pool { id = "pass_guard_ironforge", role = "guard", community = "ironforge",
  barks = {
    { id = "b_forge", text = "Mind the heat near the Great Forge, {g:lad|lass}; it's singed more beards than any dragon." },
    { id = "b_tram", text = "If ye're takin' the Deeprun Tram, hold on tight, because the gnomes swear it's safe and I don't." },
    { id = "b_human", when = { race = "Human" }, text = "Stormwind's folk are welcome under the mountain, though ye'll want a thicker coat than that for Dun Morogh." },
    { id = "b_elf", when = { race = "NightElf" }, text = "A kaldorei in Ironforge, eh? Ye'll find no trees in here, but the ale's a fair trade." },
    { id = "b_gnome", when = { race = "Gnome" }, text = "Tinker Town's down the way if ye're lookin' for yer kin, wee one. Stay strong; Gnomeregan will be yours again." },
    { id = "b_dwarf", when = { race = "Dwarf" }, text = "Good to see a proper beard come through the gate, {g:lad|lass}. Stone keep ye." },
    { id = "b_drunk", when = { drunk = true }, text = "Had a few at the Stonefire, have ye? Walk it off slow, and stay away from the forge rail." },
    { id = "b_hunter", when = { pet = { type = "Beast" } }, text = "Fine beast ye've got there; keep {pet} off the rams in the stable, mind." },
    { id = "b_warrior", when = { class = "WARRIOR" }, text = "That's a warrior's stride if ever I saw one. The Dark Irons would think twice about ye." },
    { id = "b_low", when = { maxLevel = 12 }, text = "Still green as a mushroom, eh? Kharanos and Coldridge will toughen ye up soon enough." },
    { id = "b_ghostly", when = { resSick = true }, text = "Ye look like death's breath is still on ye, {g:lad|lass}; sit by a fire and let it pass." },
    { id = "b_regular", when = { timesTalked = { min = 5 } }, text = "Ach, {name} again! Ye'll be wantin' yer own stool at the Stonefire soon." },
  } }

P:Pool { id = "pass_guard_darnassus", role = "guard", community = "darnassus",
  barks = {
    { id = "b_moon", text = "Elune's light falls kindly on the Temple tonight. Walk softly beneath the boughs, traveler." },
    { id = "b_portal", text = "The Rut'theran ferry waits at the base of the tree, if your road leads back to the mainland." },
    { id = "b_human", when = { race = "Human" }, text = "Humans walk loudly, I find. Our city is not used to boots, so try to tread gently on the roots." },
    { id = "b_dwarf", when = { race = "Dwarf" }, text = "Please keep your axe stowed, dwarf; we do not cut the living wood of Teldrassil." },
    { id = "b_gnome", when = { race = "Gnome" }, text = "Your little machines are a curiosity here, gnome, but keep the sparks away from the bark." },
    { id = "b_elf", when = { race = "NightElf" }, text = "Ishnu-alah, sister of the moon. May the goddess keep watch over your path." },
    { id = "b_druid", when = { class = "DRUID" }, text = "The Cenarion Enclave will be glad of you, druid; there is much healing yet to do in this world." },
    { id = "b_cat", when = { form = "cat" }, text = "A fine shape, druid, though the owls on the terraces may not be so pleased to see it." },
    { id = "b_hunter", when = { class = "HUNTER" }, text = "Your bond with {pet} is clear to see, hunter, and the Sentinels honor such kinship." },
    { id = "b_mount", when = { mounted = true }, text = "Mounts are welcome, but please keep to the paths; the moss has grown for centuries." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "This is our hour, when the moon is high and the city wakes. Elune-adore, traveler." },
    { id = "b_low", when = { maxLevel = 10 }, text = "You carry the look of Shadowglen still. Mind the lessons of the grove; they will serve you well." },
  } }

P:Pool { id = "pass_guard_orgrimmar", role = "guard", community = "orgrimmar",
  barks = {
    { id = "b_valley", text = "The Valley of Strength is no place for idling, {class}. Do your business and keep moving." },
    { id = "b_thrall", text = "Our Warchief walks these halls freely, so carry yourself with honor in his city." },
    { id = "b_orc", when = { race = "Orc" }, text = "Strength and honor, {g:brother|sister}. The blood of the clans runs strong in you." },
    { id = "b_troll", when = { race = "Troll" }, text = "The Darkspear are welcome here; Thrall owes your people a debt he has not forgotten." },
    { id = "b_tauren", when = { race = "Tauren" }, text = "Mind your horns at the gate, tauren. We built the walls with orcs in mind, not your kind." },
    { id = "b_undead", when = { race = "Scourge" }, text = "The Dark Lady's people are allies by the Warchief's word, so I will mind my tongue, if you mind yours." },
    { id = "b_warrior", when = { class = "WARRIOR" }, text = "Lok'tar, warrior. The Cleft of Shadow is no place for you; the arena pits are." },
    { id = "b_warlock", when = { class = "WARLOCK" }, text = "Keep your demons leashed in the city, warlock. We remember what that fel blood cost us." },
    { id = "b_imp", when = { pet = { family = "Imp" } }, text = "That imp of yours makes my skin crawl. Keep it away from the barracks or I'll squash it." },
    { id = "b_low", when = { maxLevel = 10 }, text = "Fresh from the Valley of Trials, are you? Durotar will teach you plenty, if it doesn't kill you first." },
    { id = "b_high", when = { minLevel = 55 }, text = "I have heard of deeds like yours, {class}. The Horde is stronger for having you in it." },
    { id = "b_pvp", when = { pvpRank = { min = 3 } }, text = "You wear your rank well, soldier. The Alliance must have learned to fear your name by now." },
    { id = "b_ghost", when = { ghost = true }, text = "Even a spirit walks proud in Orgrimmar. Find your body and finish the fight, warrior." },
    { id = "b_tabard", when = { tabard = true }, text = "A tabard of your guild, I see. Make sure they are worthy of the Horde's name." },
  } }

P:Pool { id = "pass_guard_thunder_bluff", role = "guard", community = "thunder_bluff",
  barks = {
    { id = "b_wind", text = "The winds are strong on the high rises today, young one. Walk carefully near the bridges." },
    { id = "b_cairne", text = "High Chieftain Cairne keeps the eternal fire burning on the high rise. Go and see it, if you have time." },
    { id = "b_orc", when = { race = "Orc" }, text = "Our orcish friends are always welcome here. Thrall's people helped us find our home." },
    { id = "b_troll", when = { race = "Troll" }, text = "The Darkspear laugh loudly, but they are good friends to the herd. Welcome, troll." },
    { id = "b_undead", when = { race = "Scourge" }, text = "The Forsaken are welcome under Cairne's word, though I pray the Earth Mother eases your rest one day." },
    { id = "b_tauren", when = { race = "Tauren" }, text = "May the eternal sun shine upon you, child of the plains. Your tribe is proud of you." },
    { id = "b_druid", when = { class = "DRUID" }, text = "The Elder Rise is calling for druids like you. Hamuul Runetotem will be glad of your company." },
    { id = "b_bear", when = { form = "bear" }, text = "A bear on the high rise. I thought I had seen everything, but the Earth Mother still surprises me." },
    { id = "b_shaman", when = { class = "SHAMAN" }, text = "The spirits walk with you, shaman. I can feel the winds lean toward you." },
    { id = "b_low", when = { maxLevel = 10 }, text = "You still carry the smell of Camp Narache. Grow strong, little one; the plains will wait." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "Mu'sha watches over the bluffs tonight. Sleep well, if you find a place to rest." },
    { id = "b_mount", when = { mounted = true }, text = "Your mount does not know the lifts, so take it slow, or it may decide to stay down below." },
  } }

P:Pool { id = "pass_guard_undercity", role = "guard", community = "undercity",
  barks = {
    { id = "b_sewers", text = "Do not drink the green water, living one; it will remind you who built this city." },
    { id = "b_lady", text = "The Dark Lady watches from the Royal Quarter, so I would not linger near her guards." },
    { id = "b_orc", when = { race = "Orc" }, text = "An orc in the sewers of Lordaeron. How the times have changed, and how badly." },
    { id = "b_tauren", when = { race = "Tauren" }, text = "You are very large for our corridors, tauren. Mind the low arches; they were built for kings." },
    { id = "b_troll", when = { race = "Troll" }, text = "The Darkspear may laugh at death, but here, troll, death laughs back." },
    { id = "b_undead", when = { race = "Scourge" }, text = "Another of the freed, I see. Keep your mind your own, and the Lich King will never have it again." },
    { id = "b_priest", when = { class = "PRIEST" }, text = "Shadow suits you better than the Light ever did, priest. Welcome home." },
    { id = "b_mage", when = { class = "MAGE" }, text = "The Magic Quarter is just around the bend, mage. Mind the abominations; they don't bow." },
    { id = "b_paladin", when = { class = "PALADIN" }, text = "A paladin in our halls. We have long memories of men who wore that Light." },
    { id = "b_low", when = { maxLevel = 10 }, text = "Fresh from Deathknell, by the smell of you. The Scarlets will find you soon enough." },
    { id = "b_ghost", when = { ghost = true }, text = "Ah, a ghost. You'll be back in your bones soon, and they'll be all the colder for it." },
    { id = "b_resSick", when = { resSick = true }, text = "That sickness you feel is only the grave letting go of you slowly, as it always does." },
  } }

P:Pool { id = "pass_guard_alliance", role = "guard", faction = "Alliance",
  barks = {
    { id = "b_roads", text = "Roads have been busy lately, {class}, so keep your weapon close when you leave town." },
    { id = "b_horde", text = "If you see Horde scouts near the roads, send word to the nearest captain, would you?" },
    { id = "b_human", when = { race = "Human" }, text = "Good to see a Stormwind face, friend. Give the Defias no mercy if you meet them on the road." },
    { id = "b_dwarf", when = { race = "Dwarf" }, text = "Bronzebeard's people always bring a good fight and better ale. Welcome, friend." },
    { id = "b_gnome", when = { race = "Gnome" }, text = "Watch out for the brambles, little friend; they've tripped more than one gnome this week." },
    { id = "b_elf", when = { race = "NightElf" }, text = "Kaldorei are welcome in any Alliance town, though I'll confess you all look taller every time." },
    { id = "b_low", when = { maxLevel = 15 }, text = "Still learning the ropes, I see. Stay off the main roads at night and you'll do fine." },
    { id = "b_high", when = { minLevel = 50 }, text = "You've a veteran's eyes, {class}. I'd wager you've seen more than this whole garrison has." },
    { id = "b_dura", when = { durability = { max = 20 } }, text = "Your gear's falling apart at the seams, friend. The smith's just over yonder if you need a mend." },
    { id = "b_stealth", when = { stealthed = true }, text = "I can hear you sneaking, {class}. Nobody moves that quietly unless they want to be noticed." },
    { id = "b_deaths", when = { deaths = { min = 20 } }, text = "The spirit healers must know you by name, {name}. Do try to be careful out there." },
    { id = "b_horde_player", when = { faction = "Horde" }, text = "Keep your blade sheathed, Horde. I'll be watching you every step through this town." },
    { id = "b_like", when = { disposition = { min = 65 } }, text = "Always a pleasure, {name}; this town could do with more like you." },
    { id = "b_dislike", when = { disposition = { max = 34 } }, text = "Walk on, {class}. I've heard enough about you to keep an eye out." },
  } }

P:Pool { id = "pass_guard_horde", role = "guard", faction = "Horde",
  barks = {
    { id = "b_scouts", text = "Alliance scouts have been seen near the road. Keep your eyes open and your blade ready." },
    { id = "b_watch", text = "We hold this post for the Warchief, {class}. Don't make trouble that wastes our time." },
    { id = "b_orc", when = { race = "Orc" }, text = "Lok'tar, {g:brother|sister}. It is good to see a true orc walking the road with pride." },
    { id = "b_troll", when = { race = "Troll" }, text = "A Darkspear on the road, eh? Keep laughing, troll; it scares the Alliance more than our axes." },
    { id = "b_tauren", when = { race = "Tauren" }, text = "A tauren's step shakes the ground. Good; let the Alliance feel it coming." },
    { id = "b_undead", when = { race = "Scourge" }, text = "Forsaken, you smell of the grave. Stand downwind of the cook fire, would you?" },
    { id = "b_low", when = { maxLevel = 15 }, text = "You're still green, whelp. Don't go wandering into the hills alone yet." },
    { id = "b_high", when = { minLevel = 50 }, text = "A seasoned warrior of the Horde. The young ones should watch you and learn." },
    { id = "b_dura", when = { durability = { max = 20 } }, text = "Your armor is in pieces, {class}. Get it mended before it gets you killed." },
    { id = "b_stealth", when = { stealthed = true }, text = "Sneaking past a Horde guard, {class}? Bold, but the wind still carries your scent." },
    { id = "b_deaths", when = { deaths = { min = 20 } }, text = "The spirit healer knows your face better than your mother does, {name}. Fight smarter." },
    { id = "b_alliance", when = { faction = "Alliance" }, text = "You have nerve walking here, Alliance. Keep moving before my patience runs out." },
    { id = "b_like", when = { disposition = { min = 65 } }, text = "Throm-ka, {name}. Your name carries honor around this camp's fires." },
    { id = "b_dislike", when = { disposition = { max = 34 } }, text = "I know your name, {name}, and not for good reasons. Keep walking." },
  } }

------------------------------------------------------------------ capital citizens
P:Pool { id = "pass_cit_stormwind", role = "citizen", community = "stormwind",
  barks = {
    { id = "b_bread", text = "If you're hungry, try the bakery in the Trade District before the morning loaves sell out." },
    { id = "b_westfall", text = "My cousin farms out in Westfall, and he says the Defias get bolder every week." },
    { id = "b_gnome", when = { race = "Gnome" }, text = "Oh, a gnome! I keep meaning to visit Tinker Town, but the tram frightens me half to death." },
    { id = "b_elf", when = { race = "NightElf" }, text = "Pardon me for staring, but I've never seen a night elf this close before. You're very tall." },
    { id = "b_mage", when = { class = "MAGE" }, text = "Are you off to the Mage Quarter? Mind the purple smoke from the towers; it gets into everything." },
    { id = "b_priest", when = { class = "PRIEST" }, text = "Light bless you, {g:father|sister}. I'll be at the cathedral for evening prayers, same as always." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "Getting late, isn't it? I'd not walk the Old Town alleys alone at this hour if I were you." },
    { id = "b_mount", when = { mounted = true }, text = "Mind that beast near the canal, would you? I've only just had these boots cleaned." },
    { id = "b_naked", when = { nearlyNaked = true }, text = "Goodness, where are your clothes? Has someone at the Pig and Whistle won them at cards?" },
    { id = "b_holiday", when = { holiday = "winterveil" }, text = "Have you seen the great tree by the gates? Greatfather Winter's come to Stormwind again!" },
  } }

P:Pool { id = "pass_cit_ironforge", role = "citizen", community = "ironforge",
  barks = {
    { id = "b_ale", text = "If ye've a thirst, the Stonefire Tavern pours the finest stout under the mountain." },
    { id = "b_magni", text = "King Magni was down at the forge this morning, givin' the smiths a proper earful." },
    { id = "b_human", when = { race = "Human" }, text = "Ye're shiverin', {g:lad|lass}. Humans always do, first time they come through Dun Morogh." },
    { id = "b_gnome", when = { race = "Gnome" }, text = "Any word on Gnomeregan, wee one? We still pray yer folk will take it back one day." },
    { id = "b_elf", when = { race = "NightElf" }, text = "Never thought I'd see a night elf under the stone. Do ye mind the dark, then?" },
    { id = "b_warrior", when = { class = "WARRIOR" }, text = "That's a fine axe arm on ye, {g:lad|lass}. The Dark Irons had best watch their backs." },
    { id = "b_paladin", when = { class = "PALADIN" }, text = "The Light and the stone both stand behind ye, paladin. Go give the Dark Irons a thumpin'." },
    { id = "b_drunk", when = { drunk = true }, text = "Ha! Ye've been at the Thunderbrew, haven't ye? Lean on the wall, {g:lad|lass}, it's sturdier than ye." },
    { id = "b_regular", when = { timesTalked = { min = 5 } }, text = "Ach, {name}, ye're a regular round here now. I'll have to start savin' ye a stool." },
  } }

P:Pool { id = "pass_cit_darnassus", role = "citizen", community = "darnassus",
  barks = {
    { id = "b_temple", text = "The Temple of the Moon is quiet this time of day. It is a good place to sit and think." },
    { id = "b_lake", text = "The lake reflects the moon most perfectly just after dusk. Come back then, if you can." },
    { id = "b_human", when = { race = "Human" }, text = "You humans live such quick lives. I wonder what it is like to rush through it all." },
    { id = "b_dwarf", when = { race = "Dwarf" }, text = "Your folk dig so deep into the earth, dwarf. Do you ever miss the sky?" },
    { id = "b_gnome", when = { race = "Gnome" }, text = "Gnomes are so curious! I saw one try to take apart a wisp yesterday; it did not end well." },
    { id = "b_druid", when = { class = "DRUID" }, text = "The Cenarion Enclave will be glad of you, druid. Malfurion's teachings need hands like yours." },
    { id = "b_travel", when = { form = "travel" }, text = "A swift form, druid. I could never hold the shape of the stag for long." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "The moon is high, and Elune is generous tonight. Breathe deeply, traveler." },
    { id = "b_low", when = { maxLevel = 10 }, text = "Still learning from the grove's teachers, are you? Listen carefully; they know so much." },
    { id = "b_hunter", when = { class = "HUNTER" }, text = "Your companion {pet} looks content. The Sentinels say such bonds are sacred." },
  } }

P:Pool { id = "pass_cit_orgrimmar", role = "citizen", community = "orgrimmar",
  barks = {
    { id = "b_drag", text = "The Drag is crowded today. Keep your coin purse close, or a goblin will lighten it for you." },
    { id = "b_camps", text = "I remember the camps, {class}. Every day I walk free in this city, I give thanks to Thrall." },
    { id = "b_troll", when = { race = "Troll" }, text = "You trolls make the city louder, but I'll admit you make it more cheerful, too." },
    { id = "b_tauren", when = { race = "Tauren" }, text = "A tauren in the Valley of Wisdom. Has the Earth Mother sent you to calm us down?" },
    { id = "b_undead", when = { race = "Scourge" }, text = "The Forsaken stink of the grave, but they hate the Alliance as much as we do. That counts for something." },
    { id = "b_orc", when = { race = "Orc" }, text = "Lok'tar, {g:brother|sister}. It is good to see the young ones walk tall in Orgrimmar." },
    { id = "b_shaman", when = { class = "SHAMAN" }, text = "The spirits walk with you, shaman. Thrall would be proud of you." },
    { id = "b_warlock", when = { class = "WARLOCK" }, text = "Another fel-touched one. The Cleft of Shadow is where you belong, warlock, not in the Drag." },
    { id = "b_naked", when = { nearlyNaked = true }, text = "Have you lost your armor in a bet, {class}? Even a peon dresses better than that." },
    { id = "b_high", when = { minLevel = 55 }, text = "I have heard the grunts speak of you, {name}. Your deeds have honored the Horde." },
  } }

P:Pool { id = "pass_cit_thunder_bluff", role = "citizen", community = "thunder_bluff",
  barks = {
    { id = "b_lifts", text = "The lifts are slow today, young one, but the view of Mulgore is worth the wait." },
    { id = "b_rain", text = "The rain is coming in from the south. The grass will grow tall, and the kodo will be glad." },
    { id = "b_orc", when = { race = "Orc" }, text = "Your people helped us find this home, orc. The herd remembers such kindness." },
    { id = "b_troll", when = { race = "Troll" }, text = "You laugh so easily, troll. I wish my children had half your cheer." },
    { id = "b_undead", when = { race = "Scourge" }, text = "The Earth Mother does not turn anyone away, Forsaken, even those who walk after death." },
    { id = "b_tauren", when = { race = "Tauren" }, text = "Ah, one of the herd. May the eternal sun shine upon you, and may your hunts be plentiful." },
    { id = "b_hunter", when = { class = "HUNTER" }, text = "Your companion {pet} walks proudly, hunter. That is the mark of a good bond." },
    { id = "b_druid", when = { class = "DRUID" }, text = "The Elder Rise sings with your kind today, druid. Go and join the circle." },
    { id = "b_low", when = { maxLevel = 10 }, text = "Still young, I see. The plains of Mulgore will teach you all you need, if you listen." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "Mu'sha keeps watch over the bluffs tonight. Walk gently under her eye." },
  } }

P:Pool { id = "pass_cit_undercity", role = "citizen", community = "undercity",
  barks = {
    { id = "b_apothecary", text = "The Royal Apothecaries are cooking something foul again. You can smell it from the Trade Quarter." },
    { id = "b_lordaeron", text = "I used to walk the courtyard above us when it had grass and roses. Now it has only ghosts." },
    { id = "b_orc", when = { race = "Orc" }, text = "An orc in the Undercity. Do mind the stairs, brute; they were made for kings, not bulls." },
    { id = "b_tauren", when = { race = "Tauren" }, text = "The tauren always look at us with pity. I would prefer contempt, honestly; it's more honest." },
    { id = "b_troll", when = { race = "Troll" }, text = "You trolls laugh at the grave, I hear. Do come back when you're dead; we'll see who's laughing." },
    { id = "b_undead", when = { race = "Scourge" }, text = "Another free mind among us. Remember, the Scourge took your life, but you chose this one." },
    { id = "b_mage", when = { class = "MAGE" }, text = "Kirin Tor training, was it? Dalaran's mages taught me too, before the plague made me a better student." },
    { id = "b_priest", when = { class = "PRIEST" }, text = "Shadow priest, I hope? The Light did very little for us when the Scourge came." },
    { id = "b_ghost", when = { ghost = true }, text = "Wandering as a spirit again, are you? We've all been there, and it gets old fast." },
    { id = "b_resSick", when = { resSick = true }, text = "That weariness is the grave's grip, still letting go. You'll grow used to it eventually." },
  } }

------------------------------------------------------------------ town citizens
P:Pool { id = "pass_cit_goldshire", role = "citizen", community = "goldshire",
  barks = {
    { id = "b_inn", text = "The Lion's Pride is packed tonight, so if you want a bed, I'd hurry along." },
    { id = "b_kobolds", text = "Kobolds have been digging in the Fargodeep Mine again. Somebody ought to clear them out." },
    { id = "b_low", when = { maxLevel = 10 }, text = "You must be fresh out of Northshire. The kobolds near the mine are good practice." },
    { id = "b_gnome", when = { race = "Gnome" }, text = "A gnome in Goldshire! Did you get lost on the way to Ironforge, little one?" },
    { id = "b_night", when = { timeOfDay = "night" }, text = "Murlocs come up from the stream at night. Keep to the road, would you?" },
    { id = "b_paladin", when = { class = "PALADIN" }, text = "A paladin, here? The Light must have heard the farmers' prayers about the gnolls." },
  } }

P:Pool { id = "pass_cit_booty_bay", role = "citizen", community = "booty_bay",
  barks = {
    { id = "b_sharks", text = "Don't swim in the bay, pal, unless you want to give the sharks a free lunch." },
    { id = "b_pirates", text = "Bloodsail pirates were sniffin' round the docks last night, so keep your purse buttoned up, friend." },
    { id = "b_horde", when = { faction = "Horde" }, text = "Horde coin spends just like Alliance coin around here, chum, so welcome to the bay." },
    { id = "b_alliance", when = { faction = "Alliance" }, text = "Alliance, Horde, it's all the same to the Cartel, pal, so long as your gold's real." },
    { id = "b_rogue", when = { class = "ROGUE" }, text = "Nice work with those quiet feet, kid. Just keep your fingers out of my pockets." },
    { id = "b_drunk", when = { drunk = true }, text = "Had a few at the Salty Sailor, eh? Careful on the planks, buddy, or you're shark bait." },
  } }

P:Pool { id = "pass_cit_gadgetzan", role = "citizen", community = "gadgetzan",
  barks = {
    { id = "b_water", text = "Water's the real currency in Tanaris, pal, so drink up before you hit the dunes." },
    { id = "b_steamwheedle", text = "The Steamwheedle bruisers keep this place quiet, friend, so don't make 'em earn their wages today." },
    { id = "b_gnome", when = { race = "Gnome" }, text = "Hey, a gnome! You fix rockets? I've got one that keeps blowin' up the wrong way, and that's costin' me." },
    { id = "b_hot", when = { timeOfDay = "day" }, text = "Midday sun'll cook ya, chum, so find some shade before you end up like the last guy." },
    { id = "b_mount", when = { mounted = true }, text = "Nice ride, buddy, but if it spooks near the arena, that's your liability, not mine." },
    { id = "b_low", when = { maxLevel = 40 }, text = "A little green for Tanaris, aren't ya, kid? The sand trolls eat folks like you for breakfast." },
  } }

P:Pool { id = "pass_cit_crossroads", role = "citizen", community = "crossroads",
  barks = {
    { id = "b_quilboar", text = "The quilboar of Razorfen are raiding the roads again. Keep your blade sharp in the Barrens." },
    { id = "b_raptors", text = "Raptors stalk the grass to the south, so don't wander off the road alone." },
    { id = "b_low", when = { maxLevel = 15 }, text = "The Barrens are wide and harsh, young one. Drink when you can and rest when you must." },
    { id = "b_tauren", when = { race = "Tauren" }, text = "A tauren this far from Mulgore. The Barrens grass must remind you of home." },
    { id = "b_orc", when = { race = "Orc" }, text = "Lok'tar, {g:brother|sister}. The Crossroads stands strong because of warriors like you." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "The Barrens are dangerous at night. Keep the torches lit and your axe close." },
  } }

P:Pool { id = "pass_cit_razor_hill", role = "citizen", community = "razor_hill",
  barks = {
    { id = "b_humans", text = "The humans at Tiragarde Keep think they own the coast. Someone should teach them otherwise." },
    { id = "b_scorpids", text = "Scorpids are thick in the hills today, {class}, so watch where you put your feet." },
    { id = "b_troll", when = { race = "Troll" }, text = "Sen'jin village is just down the coast, troll, if you're looking for your own kind." },
    { id = "b_orc", when = { race = "Orc" }, text = "Throm-ka, {g:brother|sister}. It's good to see our people thrive in Durotar." },
    { id = "b_low", when = { maxLevel = 12 }, text = "You're still young, whelp, so stay clear of the Burning Blade in the caverns." },
    { id = "b_hunter", when = { class = "HUNTER" }, text = "Your beast {pet} is well-fed, hunter, which is more than I can say for my own goats." },
  } }

P:Pool { id = "pass_cit_brill", role = "citizen", community = "brill",
  barks = {
    { id = "b_scarlet", text = "The Scarlets prowl the roads again, convinced they're saving the world. How charming." },
    { id = "b_inn", text = "The Gallows' End Tavern has rooms, though I can't promise the sheets are clean." },
    { id = "b_low", when = { maxLevel = 10 }, text = "Still fresh from the grave, I see. Tirisfal will teach you quickly, or bury you twice." },
    { id = "b_orc", when = { race = "Orc" }, text = "An orc in Brill. Did Thrall send you, or did you lose your way to Orgrimmar?" },
    { id = "b_mage", when = { class = "MAGE" }, text = "Magic suits the dead, mage. We have nothing to lose but our sanity." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "The moon is out, and the Scarlets will be sharpening their swords. Stay sharp, living or dead." },
  } }

P:Pool { id = "pass_cit_southshore", role = "citizen", community = "southshore",
  barks = {
    { id = "b_tarren", text = "Tarren Mill's dead ones are only a short ride east, so keep your sword handy." },
    { id = "b_fish", text = "The catch was good this morning. You'll smell it before you see the docks." },
    { id = "b_human", when = { race = "Human" }, text = "A human who's not from Lordaeron? Stormwind folk always look so clean." },
    { id = "b_dwarf", when = { race = "Dwarf" }, text = "Wildhammer or Bronzebeard? Either way, there's ale in the inn if you're thirsty." },
    { id = "b_mount", when = { mounted = true }, text = "Keep that mount out of the fish stalls, would you? The last horse ate half a salmon." },
    { id = "b_paladin", when = { class = "PALADIN" }, text = "Light bless you, paladin. I remember when Lordaeron had hundreds like you." },
  } }

P:Pool { id = "pass_cit_tarren_mill", role = "citizen", community = "tarren_mill",
  barks = {
    { id = "b_southshore", text = "The humans in Southshore send scouts every night. We let them see us, then we let them run." },
    { id = "b_mill", text = "This mill ground grain for living farmers once. Now it grinds bones for the apothecaries." },
    { id = "b_orc", when = { race = "Orc" }, text = "Orcs in the Hillsbrad foothills. Strange days for a Lordaeron town, aren't they?" },
    { id = "b_tauren", when = { race = "Tauren" }, text = "The tauren find the foothills restful, they tell me. I suppose they don't notice the dead." },
    { id = "b_undead", when = { race = "Scourge" }, text = "One of us, good. The living are so very tiresome at this hour." },
    { id = "b_alliance", when = { faction = "Alliance" }, text = "An Alliance spy, walking right in. How very bold of you, and how very foolish." },
  } }

P:Pool { id = "pass_cit_menethil", role = "citizen", community = "menethil",
  barks = {
    { id = "b_wetlands", text = "The Wetlands are dreadful this time of year. You'll need a new pair of boots by noon." },
    { id = "b_ship", text = "The ship from Theramore is late again, so if you're waiting, you'll be waiting a while." },
    { id = "b_dwarf", when = { race = "Dwarf" }, text = "Ironforge's lot keep the harbor safe for us. A drink on your next visit, friend?" },
    { id = "b_low", when = { maxLevel = 20 }, text = "You'll want to watch the crocolisks near the shore, friend. They're bigger than they look." },
    { id = "b_mount", when = { mounted = true }, text = "Mind the mud near the harbor; your mount will sink to its knees." },
    { id = "b_drunk", when = { drunk = true }, text = "The Deepwater Tavern's strongest stuff, I'd guess? Keep away from the edge of the docks." },
  } }

P:Pool { id = "pass_cit_lakeshire", role = "citizen", community = "lakeshire",
  barks = {
    { id = "b_bridge", text = "The bridge is still not fixed. Magistrate Solomon swears it'll be done by spring." },
    { id = "b_orcs", text = "The Blackrock orcs have been raiding the farms again. Lakeshire can't hold out forever." },
    { id = "b_low", when = { maxLevel = 25 }, text = "The Redridge hills are no place for the inexperienced, friend. Stay near the lake." },
    { id = "b_paladin", when = { class = "PALADIN" }, text = "The Light is strong in you, paladin. We could use your help against the gnolls." },
    { id = "b_fish", when = { timeOfDay = "dawn" }, text = "The lake's calm this morning. You'll catch something good, if you've got a line." },
    { id = "b_human", when = { race = "Human" }, text = "A Stormwind face! Tell them in the Keep that Lakeshire still needs soldiers, would you?" },
  } }

P:Pool { id = "pass_cit_darkshire", role = "citizen", community = "darkshire",
  barks = {
    { id = "b_worgen", text = "Worgen howled in the woods last night. I didn't sleep a wink, and neither did the guards." },
    { id = "b_raven", text = "The Night Watch says the dead walk in Raven Hill. I believe them; I've seen the graves open." },
    { id = "b_low", when = { maxLevel = 25 }, text = "Duskwood's no place for a youngster, friend. Stay close to town after dark." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "Lock your doors, friend. The Night Watch can't guard every street in Darkshire." },
    { id = "b_priest", when = { class = "PRIEST" }, text = "A priest! Light bless you; we could use more prayers around here." },
    { id = "b_warlock", when = { class = "WARLOCK" }, text = "You smell of shadow, warlock. Duskwood has enough darkness already." },
  } }

P:Pool { id = "pass_cit_kharanos", role = "citizen", community = "kharanos",
  barks = {
    { id = "b_ale", text = "The Thunderbrew lads have a new keg on tap, and it'll warm ye better than any fire." },
    { id = "b_troggs", text = "Troggs crawled up from the deeps near Gnomeregan again. Keep yer axe handy, {g:lad|lass}." },
    { id = "b_gnome", when = { race = "Gnome" }, text = "Poor wee gnome, still livin' among us? Gnomeregan'll be yours again, mark my words." },
    { id = "b_cold", when = { nearlyNaked = true }, text = "Ye'll freeze yer bits off like that in Dun Morogh, {g:lad|lass}! Cover up, for the love of stone!" },
    { id = "b_low", when = { maxLevel = 10 }, text = "Fresh from Coldridge, are ye? The wendigos near the pass'll make a proper warrior of ye." },
    { id = "b_drunk", when = { drunk = true }, text = "Ha! Another Thunderbrew victim, eh? Lean on the hitching post till yer legs come back." },
  } }

P:Pool { id = "pass_cit_auberdine", role = "citizen", community = "auberdine",
  barks = {
    { id = "b_sea", text = "The sea is restless tonight. The boat to Menethil will be a rough crossing." },
    { id = "b_furbolgs", text = "The furbolgs of Darkshore have grown hostile. Something sickens them, deep in the woods." },
    { id = "b_low", when = { maxLevel = 15 }, text = "Darkshore will test you, young one. Keep away from the murlocs on the beaches." },
    { id = "b_human", when = { race = "Human" }, text = "A human, off the Menethil boat. Your people have such short lives, but so much hurry." },
    { id = "b_druid", when = { class = "DRUID" }, text = "The forest is ill here, druid. Perhaps your touch can help heal it." },
    { id = "b_aquatic", when = { form = "aquatic" }, text = "You swim like a seal, druid. Mind the threshers out beyond the reef." },
  } }

P:Pool { id = "pass_cit_everlook", role = "citizen", community = "everlook",
  barks = {
    { id = "b_snow", text = "Snow's coming in thick tonight, pal, so if you've got a room at the inn, keep it." },
    { id = "b_yeti", text = "Yetis in the caves up north, friend. Their fur sells good, if you've got the arm for it." },
    { id = "b_horde", when = { faction = "Horde" }, text = "Horde or Alliance, it's all business here, chum. Just don't start nothin' near the bank." },
    { id = "b_alliance", when = { faction = "Alliance" }, text = "Welcome to Everlook, pal, where the snow's free and everything else costs extra." },
    { id = "b_naked", when = { nearlyNaked = true }, text = "Whoa, buddy, you're gonna freeze solid out here, and I'm not payin' to thaw you." },
    { id = "b_high", when = { minLevel = 55 }, text = "You've got that Winterspring look, pal: tough, cold and probably pretty expensive to hire." },
  } }

P:Pool { id = "pass_cit_ratchet", role = "citizen", community = "ratchet",
  barks = {
    { id = "b_boat", text = "The boat to Booty Bay is due any minute, pal, so if you're goin', get your ticket squared." },
    { id = "b_pirates", text = "Southsea pirates are hangin' round the coast again, chum, so keep an eye on your cargo." },
    { id = "b_horde", when = { faction = "Horde" }, text = "Horde coin spends fine here, buddy, so don't let the Alliance tell you different." },
    { id = "b_alliance", when = { faction = "Alliance" }, text = "Alliance, welcome to Ratchet, pal. Keep your blade sheathed and your wallet open." },
    { id = "b_rogue", when = { class = "ROGUE" }, text = "Nice sneaky shoes, kid. Just remember the Cartel bruisers don't like pickpockets." },
    { id = "b_drunk", when = { drunk = true }, text = "Whoa, someone's had a few, eh? Careful near the docks, pal, or you're fish food." },
  } }

------------------------------------------------------------------ roles
P:Pool { id = "pass_vendor", role = "vendor",
  barks = {
    { id = "b_stock", text = "Fresh stock came in this morning, friend, if you'd care to have a look." },
    { id = "b_bags", text = "Bags full again, {class}? Everyone's carrying more than they need these days." },
    { id = "b_naked", when = { nearlyNaked = true }, text = "You look like you need a good deal more than I sell, friend, but come and browse anyway." },
    { id = "b_dura", when = { durability = { max = 20 } }, text = "Those clothes have seen better days, {class}. I'd find a smith before your armor quits on you." },
    { id = "b_regular", when = { timesTalked = { min = 5 } }, text = "Ah, {name}, my best customer! What can I find for you today?" },
    { id = "b_low", when = { maxLevel = 10 }, text = "Just starting out? Everyone needs a few basics, so stop by when you've a moment." },
    { id = "b_ghost", when = { ghost = true }, text = "A ghost at my stall! I'm afraid I don't trade with spirits, friend; come back with your body." },
    { id = "b_high", when = { minLevel = 55 }, text = "Someone of your standing probably has no need of my wares, but you're welcome to look." },
  } }

P:Pool { id = "pass_innkeeper", role = "innkeeper",
  barks = {
    { id = "b_room", text = "Rooms are warm and the fire's lit, friend, if you need a place to rest your feet." },
    { id = "b_hearth", text = "If you want to make this your home, I can set your hearthstone here." },
    { id = "b_drunk", when = { drunk = true }, text = "You've had plenty already, {class}, so sit by the fire and let the room stop spinning." },
    { id = "b_regular", when = { timesTalked = { min = 5 } }, text = "{name}! Back again. Your usual corner's free, if you want it." },
    { id = "b_resSick", when = { resSick = true }, text = "You look like you've just crawled out of a graveyard. Sit by the fire and rest a while." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "Getting late, {class}. A bed would do you good, if you've got the coin for it." },
    { id = "b_ghost", when = { ghost = true }, text = "Spirits don't need beds, friend, so go and fetch your body before you come back." },
    { id = "b_holiday", when = { holiday = "hallowsend" }, text = "Hallow's End, friend! The children have been knocking at the door all evening for treats." },
  } }

P:Pool { id = "pass_trainer_mage", role = "trainer", subtitle = "mage trainer",
  barks = {
    { id = "b_study", text = "Practice your incantations, {class}; a misplaced syllable can turn a fireball into a puff of smoke." },
    { id = "b_mage", when = { class = "MAGE" }, text = "Ah, a fellow scholar of the arcane. Come back when you're ready to learn something new." },
    { id = "b_warrior", when = { class = "WARRIOR" }, text = "A warrior wandering into a mage's study? Mind the books, please; they're older than you." },
  } }

P:Pool { id = "pass_trainer_warrior", role = "trainer", subtitle = "warrior trainer",
  barks = {
    { id = "b_drill", text = "Keep your guard up, {class}, or the next blade will find your ribs." },
    { id = "b_warrior", when = { class = "WARRIOR" }, text = "Your stance is improving, warrior. Come back when you're ready to learn some new techniques." },
    { id = "b_mage", when = { class = "MAGE" }, text = "A mage in the training yard? Try lifting a sword sometime; it builds character." },
  } }

P:Pool { id = "pass_trainer_rogue", role = "trainer", subtitle = "rogue trainer",
  barks = {
    { id = "b_quiet", text = "Footsteps that loud will get you caught, {class}. Soften them, or stay home." },
    { id = "b_rogue", when = { class = "ROGUE" }, text = "Not bad at all, rogue. I almost didn't hear you coming." },
    { id = "b_stealth", when = { stealthed = true }, text = "Sneaking up on your trainer, are you? Cute, but I've been watching you since the door." },
  } }

P:Pool { id = "pass_trainer_priest", role = "trainer", subtitle = "priest trainer",
  barks = {
    { id = "b_light", text = "The Light shines on all who seek it, {class}, even those who come in muddy boots." },
    { id = "b_priest", when = { class = "PRIEST" }, text = "Your prayers grow stronger, priest. Return when the Light calls you to new lessons." },
    { id = "b_warlock", when = { class = "WARLOCK" }, text = "There is shadow on you, warlock. I hope you're here to wash some of it away." },
  } }

P:Pool { id = "pass_trainer_hunter", role = "trainer", subtitle = "hunter trainer",
  barks = {
    { id = "b_aim", text = "Steady your breathing before you loose the arrow, {class}, or the beast will smell your fear." },
    { id = "b_hunter", when = { class = "HUNTER" }, text = "Your companion {pet} looks healthy, hunter. Feed it well and it'll guard your back." },
  } }

P:Pool { id = "pass_trainer_warlock", role = "trainer", subtitle = "warlock trainer",
  barks = {
    { id = "b_power", text = "Power demands a price, {class}. Pay it wisely, or the demons will collect it for you." },
    { id = "b_imp", when = { pet = { family = "Imp" } }, text = "Your imp is mouthy today, warlock. Teach it some manners before it teaches you." },
    { id = "b_paladin", when = { class = "PALADIN" }, text = "A paladin, here? Careful, the Light doesn't care for what we do in this room." },
  } }

P:Pool { id = "pass_trainer_paladin", role = "trainer", subtitle = "paladin trainer",
  barks = {
    { id = "b_duty", text = "The Light asks much of its servants, {class}, but it gives back more than you'd think." },
    { id = "b_paladin", when = { class = "PALADIN" }, text = "Stand tall, {g:brother|sister}. The Silver Hand is stronger for your dedication." },
    { id = "b_rogue", when = { class = "ROGUE" }, text = "A rogue in the chapel? I'll pray for your soul, and keep an eye on the offering plate." },
  } }

P:Pool { id = "pass_trainer_shaman", role = "trainer", subtitle = "shaman trainer",
  barks = {
    { id = "b_spirits", text = "The spirits whisper of your coming, {class}. Listen closely, and they will guide you." },
    { id = "b_shaman", when = { class = "SHAMAN" }, text = "Your totems grow strong, shaman. The elements are pleased with your progress." },
    { id = "b_warlock", when = { class = "WARLOCK" }, text = "The spirits shy from you, warlock. Fel magic stains everything it touches." },
  } }

P:Pool { id = "pass_trainer_druid", role = "trainer", subtitle = "druid trainer",
  barks = {
    { id = "b_balance", text = "Balance in all things, {class}. Nature does not forgive those who take too much." },
    { id = "b_druid", when = { class = "DRUID" }, text = "Your forms grow steadier, druid. The Dream is closer to you than you know." },
    { id = "b_bear", when = { form = "bear" }, text = "Come in, bear, but mind the scrolls; your paws aren't made for parchment." },
  } }

P:Pool { id = "pass_banker", role = "banker",
  barks = {
    { id = "b_vault", text = "Your belongings are safe with us, {class}. No thief has cracked our vaults yet." },
    { id = "b_bags", text = "Bags heavy again? A bank slot costs less than a broken back, friend." },
    { id = "b_regular", when = { timesTalked = { min = 5 } }, text = "Ah, {name}, back for your belongings again? We keep your vault dusted, of course." },
    { id = "b_ghost", when = { ghost = true }, text = "We can't hand your savings to a ghost, I'm afraid. Come back when you've your body." },
    { id = "b_high", when = { minLevel = 55 }, text = "Someone of your experience must have quite a collection by now. Do take care of it." },
  } }

P:Pool { id = "pass_auctioneer", role = "auctioneer",
  barks = {
    { id = "b_prices", text = "Prices are up again this week, {class}. Everyone wants linen, and nobody wants to make it." },
    { id = "b_bid", text = "Bids close at the top of the hour, friend, so if you're buying, best be quick." },
    { id = "b_regular", when = { timesTalked = { min = 5 } }, text = "{name}, my favorite bidder! Shall we see what's on the block today?" },
    { id = "b_high", when = { minLevel = 55 }, text = "A seasoned adventurer like you must have some fine treasures to sell, I imagine." },
    { id = "b_low", when = { maxLevel = 10 }, text = "Just starting out? Copper ore and linen sell well, if you've got any to spare." },
  } }

P:Pool { id = "pass_blacksmith", role = "blacksmith",
  barks = {
    { id = "b_anvil", text = "Mind the sparks from the anvil, {class}; they'll burn through your sleeve in a heartbeat." },
    { id = "b_steel", text = "Good steel takes patience, friend, and bad steel takes a life on the battlefield." },
    { id = "b_dura", when = { durability = { max = 20 } }, text = "That armor's held together with hope and string, {class}. Let me look at it before it falls apart." },
    { id = "b_naked", when = { nearlyNaked = true }, text = "No armor at all? You'll need more than a smith's help, friend; you'll need a miracle." },
    { id = "b_warrior", when = { class = "WARRIOR" }, text = "A warrior's blade is only as good as its edge. Keep yours sharp, {g:brother|sister}." },
    { id = "b_regular", when = { timesTalked = { min = 5 } }, text = "{name}, back again! What've you broken this time?" },
  } }

P:Pool { id = "pass_flightmaster", role = "flightmaster",
  barks = {
    { id = "b_flight", text = "The winds are fair today, {class}, if you need a ride across the land." },
    { id = "b_mount", when = { mounted = true }, text = "Leave that mount here if you're flying, friend; the gryphons don't care for passengers on passengers." },
    { id = "b_regular", when = { timesTalked = { min = 5 } }, text = "{name}, you're in the air more than my birds. Where to this time?" },
    { id = "b_low", when = { maxLevel = 15 }, text = "First time flying? Hold on tight and don't look down; you'll be fine." },
    { id = "b_drunk", when = { drunk = true }, text = "Had a few, have we? Best not fly like that; the last drunk rider lost his breakfast over Westfall." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "Flying at night's a fine thing; the stars are lovely from up there, if you keep your eyes open." },
  } }

P:Pool { id = "pass_stablemaster", role = "stablemaster",
  barks = {
    { id = "b_beasts", text = "Your beasts will be well tended here, {class}. I've never lost one yet." },
    { id = "b_pet", when = { pet = { type = "Beast" } }, text = "Fine-looking companion, {class}. {pet} looks well fed and well loved." },
    { id = "b_hunter", when = { class = "HUNTER" }, text = "A hunter, good. I've a stall open if you want to rest {pet} for a while." },
    { id = "b_regular", when = { timesTalked = { min = 5 } }, text = "{name}! Your beasts know me better than you do by now." },
    { id = "b_mount", when = { mounted = true }, text = "That mount looks tired, friend. Give it some rest and fresh hay when you can." },
  } }

P:Pool { id = "pass_peon", role = "peon",
  barks = {
    { id = "b_wood", text = "Peon chop wood all day, and nobody say thank you to peon." },
    { id = "b_work", text = "Work, work, always work, but peon not complain, because peon not allowed." },
    { id = "b_orc", when = { race = "Orc" }, text = "Big orc boss! Peon working, peon very busy, see?" },
    { id = "b_troll", when = { race = "Troll" }, text = "Troll laugh too much, peon think. Peon never know what funny." },
    { id = "b_tauren", when = { race = "Tauren" }, text = "Big cow walk by! Peon wonder if cow can carry wood for peon." },
    { id = "b_undead", when = { race = "Scourge" }, text = "Dead one smell bad, but peon not say so, because peon polite." },
    { id = "b_night", when = { timeOfDay = "night" }, text = "Night time, but peon still working, because peon always working." },
    { id = "b_naked", when = { nearlyNaked = true }, text = "You look like peon now, no armor, just loincloth! Zug zug!" },
  } }

P:Pool { id = "pass_child", role = "child",
  barks = {
    { id = "b_play", text = "Want to play tag? I'm really fast, and nobody ever catches me!" },
    { id = "b_hero", text = "When I grow up, I'm going to be a hero just like you, and fight a dragon!" },
    { id = "b_mount", when = { mounted = true }, text = "Wow, look at your mount! Can I ride it, please, just for a minute?" },
    { id = "b_pet", when = { pet = { type = "Beast" } }, text = "Is that your pet? Can I pet {pet}? I promise I'll be gentle!" },
    { id = "b_imp", when = { pet = { family = "Imp" } }, text = "Ew, what is that thing? It's making faces at me, and it smells like burnt toast!" },
    { id = "b_cat", when = { form = "cat" }, text = "A big kitty! Can I pet you, please? You look so soft!" },
    { id = "b_bear", when = { form = "bear" }, text = "A bear! A bear in town! Mama, come quick, there's a bear!" },
    { id = "b_ghost", when = { ghost = true }, text = "Mama says ghosts aren't real, but you look really real to me!" },
    { id = "b_naked", when = { nearlyNaked = true }, text = "Why aren't you wearing any clothes? Did a gnoll steal them?" },
    { id = "b_dwarf", when = { race = "Dwarf" }, text = "Your beard is so long! Can I braid it, please, just once?" },
    { id = "b_gnome", when = { race = "Gnome" }, text = "You're as short as me! Are you a grown-up, though? You talk like one." },
    { id = "b_tauren", when = { race = "Tauren" }, text = "You're so tall! Can you see the whole world from up there?" },
    { id = "b_undead", when = { race = "Scourge" }, text = "Why is your jaw falling off? Does it hurt, or are you used to it?" },
    { id = "b_mage", when = { class = "MAGE" }, text = "Can you make fire come out of your hands? Please, just a tiny one!" },
    { id = "b_warrior", when = { class = "WARRIOR" }, text = "That sword's so big! Have you ever killed an ogre with it?" },
  } }

------------------------------------------------------------------ more variety
P:Pool { id = "pass_guard_stormwind_more", role = "guard", community = "stormwind",
  barks = {
    { id = "b_m_keep", text = "Lord Bolvar holds court in the Keep today, so expect the guard to be thicker near the throne room." },
    { id = "b_m_gate", text = "Sixteen years I've stood at this gate, {class}, and I've never once seen it quiet." },
    { id = "b_m_wall", text = "They finished rebuilding these walls after the Second War, and I'd like them to stay standing." },
    { id = "b_m_stockade", text = "Behave yourself, or you'll be sharing a cell in the Stockade with the Defias riffraff." },
    { id = "b_m_dwarven", text = "If you're after a smith, the Dwarven District rings with hammers from dawn till well past supper." },
    { id = "b_m_harbor", text = "Ships from Auberdine come in at the harbor, if you're headed north to the kaldorei." },
    { id = "b_m_rain", text = "Rain again, of course, and the canal rats are as fat as dogs this season." },
    { id = "b_m_onyxia", text = "Lady Prestor visits the Keep often, and the nobles fall over themselves when she walks by." },
    { id = "b_m_warlock", when = { class = "WARLOCK" }, text = "Keep that demon of yours out of the Cathedral Square, or the priests will have my hide." },
    { id = "b_m_druid", when = { form = "cat" }, text = "Is that a druid or a very large stray? Either way, keep off the market stalls." },
    { id = "b_m_dawn", when = { timeOfDay = "dawn" }, text = "Bakers are up and the Watch is changing, so you've picked a quiet hour to come through." },
    { id = "b_m_drunk", when = { drunk = true }, text = "The Blue Recluse pours them strong, doesn't it? Walk straight, or walk with me to the Stockade." },
    { id = "b_m_hunter", when = { pet = { type = "Beast" } }, text = "Keep {pet} on a short leash near the market, {class}; the butchers are touchy about their stock." },
    { id = "b_m_vet", when = { minLevel = 40, maxLevel = 54 }, text = "You carry yourself like someone who's been to Stranglethorn and back. Welcome home, {class}." },
  } }

P:Pool { id = "pass_guard_ironforge_more", role = "guard", community = "ironforge",
  barks = {
    { id = "b_m_gates", text = "The gates of Ironforge have never fallen, {g:lad|lass}, and they'll not fall on my watch." },
    { id = "b_m_hall", text = "The Hall of Explorers has a new fossil, they say. Brann's lot dig up somethin' odd every week." },
    { id = "b_m_snow", text = "Snow's piled waist-high on the road to Kharanos, so mind yer step if ye're headin' out." },
    { id = "b_m_darkiron", text = "If ye ever see a Dark Iron in this city, shout loud, because they've no business here." },
    { id = "b_m_ram", text = "The rams are restless today, which usually means a storm's comin' down off the peaks." },
    { id = "b_m_bank", text = "The bank's busy as a beehive, so ye might as well grab a pint while ye wait." },
    { id = "b_m_mystic", text = "The Mystic Ward's around the bend if ye've magic business, though I cannae say I trust it." },
    { id = "b_m_thaurissan", text = "My grandda swore the Dark Irons brought that fire on themselves at Blackrock, and I believe him." },
    { id = "b_m_priest", when = { class = "PRIEST" }, text = "Light keep ye, priest. The High Seat could use a few more prayers for the miners." },
    { id = "b_m_hunter", when = { class = "HUNTER" }, text = "Fine shootin' iron on yer back, hunter. Dwarven make, I hope, or I'll be disappointed." },
    { id = "b_m_night", when = { timeOfDay = "night" }, text = "Night or day, it's all the same under the mountain, but the taverns know the difference." },
    { id = "b_m_dura", when = { durability = { max = 20 } }, text = "Yer armor's in a sorry state, {g:lad|lass}. The Great Forge'll mend it, if ye ask nicely." },
    { id = "b_m_mounted", when = { mounted = true }, text = "Rein that beast in, {g:lad|lass}; the forge floor's no place for a gallop." },
    { id = "b_m_high", when = { minLevel = 55 }, text = "Ye've the look of someone who's walked Blackrock Depths and lived. Magni would be proud." },
  } }

P:Pool { id = "pass_guard_darnassus_more", role = "guard", community = "darnassus",
  barks = {
    { id = "b_m_tyrande", text = "High Priestess Tyrande prays within the Temple. Speak softly when you pass its doors." },
    { id = "b_m_owls", text = "The owls on the high branches see everything, so I would not attempt anything foolish." },
    { id = "b_m_warrior", text = "The Warrior's Terrace trains our Sentinels; you may watch, if you keep your distance." },
    { id = "b_m_wisps", text = "The wisps drift where they wish here, traveler; do not try to catch them." },
    { id = "b_m_ten", text = "Ten thousand years we kept the watch over Azeroth, and we keep it still." },
    { id = "b_m_ashen", text = "Our sisters in Ashenvale hold the line against the orcs' axes. Remember them tonight." },
    { id = "b_m_peace", text = "Teldrassil is young, but she is strong. Walk on her with care, as you would a sleeping child." },
    { id = "b_m_fire", text = "No open fires within the city, traveler. The wood forgets nothing." },
    { id = "b_m_priest", when = { class = "PRIEST" }, text = "Elune's light is strong in you, priestess or priest. The Temple welcomes you." },
    { id = "b_m_rogue", when = { stealthed = true }, text = "The shadows under the boughs are ours, rogue, and we see who walks in them." },
    { id = "b_m_dusk", when = { timeOfDay = "dusk" }, text = "The day fades and the moon rises. This is the most beautiful hour in Darnassus." },
    { id = "b_m_mount", when = { mounted = true }, text = "Your mount is welcome among the roots, so long as it does not graze on the sacred moss." },
    { id = "b_m_high", when = { minLevel = 55 }, text = "Your deeds have reached even these branches, {name}. The Sentinels speak of you with respect." },
  } }

P:Pool { id = "pass_guard_orgrimmar_more", role = "guard", community = "orgrimmar",
  barks = {
    { id = "b_m_grom", text = "Grom Hellscream died to free us of the demon blood. Remember his name when you walk these streets." },
    { id = "b_m_heat", text = "The sun bakes Durotar hard, but it makes us hard too. Drink water and keep moving." },
    { id = "b_m_zeppelin", text = "The zeppelins leave from the tower outside the gates, if your road leads to Tirisfal or Grom'gol." },
    { id = "b_m_wisdom", text = "The Valley of Wisdom is where the shamans gather. Show them respect, or show yourself out." },
    { id = "b_m_spirit", text = "The Valley of Spirits belongs to the Darkspear. Their witch doctors will happily sell you a curse." },
    { id = "b_m_cleft", text = "The Cleft of Shadow makes my skin crawl, but the Warchief allows it, so I hold my tongue." },
    { id = "b_m_kul", text = "The Alliance would see us back in those camps, {class}. Never forget it." },
    { id = "b_m_drag", text = "The Drag is full of cutpurses and goblins, so keep your hand on your coin." },
    { id = "b_m_rogue", when = { class = "ROGUE" }, text = "Your kind lurk in the Cleft, rogue. Stay out of the light and out of my way." },
    { id = "b_m_hunter", when = { pet = { type = "Beast" } }, text = "A strong beast, {class}. {pet} would do well in the Barrens hunting raptors." },
    { id = "b_m_night", when = { timeOfDay = "night" }, text = "The fires of Orgrimmar burn all night, and so does our vigilance." },
    { id = "b_m_drunk", when = { drunk = true }, text = "Grog makes a fool of every warrior. Sleep it off before you start a fight with the wrong orc." },
    { id = "b_m_dura", when = { durability = { max = 20 } }, text = "Your armor is little better than rags, {class}. Find a smith in the Valley of Honor." },
  } }

P:Pool { id = "pass_guard_thunder_bluff_more", role = "guard", community = "thunder_bluff",
  barks = {
    { id = "b_m_kodo", text = "The great kodo graze peacefully below the bluffs. It is good to see them so content." },
    { id = "b_m_spirit", text = "The Spirit Rise is where we honor our ancestors. Walk there gently, if you go." },
    { id = "b_m_grimtotem", text = "The Grimtotem are restless again. Some tauren forget that the herd is stronger together." },
    { id = "b_m_mulgore", text = "Mulgore's plains stretch far below us, and the Earth Mother smiles on every blade of grass." },
    { id = "b_m_zeppelin", text = "The new zeppelin tower stands below the bluffs, though I still prefer the feel of the ground." },
    { id = "b_m_hunter", text = "The hunter's rise is busy today. Good; our hunters keep the plains in balance." },
    { id = "b_m_peace", text = "There is peace on the bluffs, traveler. Rest your weary feet before you go on." },
    { id = "b_m_cairne", text = "Cairne Bloodhoof united the tribes. Every tauren owes him more than we can say." },
    { id = "b_m_warlock", when = { class = "WARLOCK" }, text = "The spirits shy from fel magic, warlock. Keep your demons quiet on our sacred rises." },
    { id = "b_m_ghost", when = { ghost = true }, text = "Your spirit walks without its body, young one. The ancestors will guide you back." },
    { id = "b_m_dawn", when = { timeOfDay = "dawn" }, text = "An'she rises over Mulgore. It is a good morning to begin a journey." },
    { id = "b_m_dura", when = { durability = { max = 20 } }, text = "Your armor is worn thin, young one. The leatherworkers on the rise can mend it." },
    { id = "b_m_high", when = { minLevel = 55 }, text = "Your deeds are spoken of around the fires, {name}. The herd is proud of you." },
  } }

P:Pool { id = "pass_guard_undercity_more", role = "guard", community = "undercity",
  barks = {
    { id = "b_m_ruins", text = "The ruins of Lordaeron above were a city once. Now they are only a lid on our tomb." },
    { id = "b_m_rats", text = "The rats here grow fat on corpses, so they do not bother the living much." },
    { id = "b_m_scarlet", text = "The Scarlet Crusade would burn us all. Remember that, when they beg for mercy." },
    { id = "b_m_varimathras", text = "The dreadlord stands beside the Dark Lady. I do not trust him, but I am not asked." },
    { id = "b_m_canal", text = "Do not touch the canal water. Even we dead have learned to respect what the apothecaries pour in it." },
    { id = "b_m_bats", text = "The bats will fly you to the Sepulcher, if you can bear the smell of them." },
    { id = "b_m_plague", text = "The plague took my wife, my children and my life. The Lich King will pay for every one." },
    { id = "b_m_freedom", text = "We are free of the Lich King now, {class}, and we will never kneel to him again." },
    { id = "b_m_warlock", when = { class = "WARLOCK" }, text = "A warlock in the Undercity. You will find the Magic Quarter much to your liking." },
    { id = "b_m_rogue", when = { class = "ROGUE" }, text = "The Rogues' Quarter is through the canals, rogue. Try not to stab anyone on the way." },
    { id = "b_m_dura", when = { durability = { max = 20 } }, text = "Your armor rots faster than my flesh, {class}. Visit a smith before it falls away entirely." },
    { id = "b_m_high", when = { minLevel = 55 }, text = "The Dark Lady has heard your name, {name}. That is either a great honor or a grave danger." },
  } }

P:Pool { id = "pass_guard_alliance_more", role = "guard", faction = "Alliance",
  barks = {
    { id = "b_m_patrol", text = "My patrol's been out since dawn, {class}, and my feet are complaining louder than the sergeant." },
    { id = "b_m_wolves", text = "Wolves have been bold this season, so don't camp off the road if you can help it." },
    { id = "b_m_letters", text = "If you're riding to Stormwind, tell my mother I'm well, would you? She worries." },
    { id = "b_m_quiet", text = "Quiet day so far, which usually means something's about to go wrong." },
    { id = "b_m_light", text = "Light keep you on the road, {class}, and keep the Horde off it." },
    { id = "b_m_pay", text = "Pay's late again, but the King's guard doesn't stop just because the coffers do." },
    { id = "b_m_warrior", when = { class = "WARRIOR" }, text = "That's a soldier's walk, {class}. Ever think of joining the guard?" },
    { id = "b_m_mage", when = { class = "MAGE" }, text = "A mage, good. If anything with too many teeth shows up, I'll be standing behind you." },
    { id = "b_m_night", when = { timeOfDay = "night" }, text = "Long night ahead, {class}, so stay near the torches if you're staying at all." },
    { id = "b_m_ghost", when = { ghost = true }, text = "You're looking a bit transparent, friend. The spirit healer can sort you out." },
    { id = "b_m_pvp", when = { pvpRank = { min = 3 } }, text = "I've heard your rank called at the barracks, {name}. The Horde knows to fear you." },
    { id = "b_m_tabard", when = { tabard = true }, text = "Nice tabard, {class}. Your guild must be doing well to dress you so smartly." },
    { id = "b_m_resSick", when = { resSick = true }, text = "You look like death warmed over, {class}. Take a breather before heading back out." },
  } }

P:Pool { id = "pass_guard_horde_more", role = "guard", faction = "Horde",
  barks = {
    { id = "b_m_honor", text = "We fight for honor, {class}, not for gold. Remember that when the Alliance offers bribes." },
    { id = "b_m_fire", text = "The fire is warm and the stew is thin, but the watch never sleeps." },
    { id = "b_m_ash", text = "The night elves cry for their trees, but the Horde needs lumber. That is the way of things." },
    { id = "b_m_wind", text = "The wind carries the smell of the Alliance tonight. Stay sharp, {class}." },
    { id = "b_m_wolf", text = "My wolf grows restless. She smells trouble on the road, and she is rarely wrong." },
    { id = "b_m_battle", text = "A good battle would warm my blood more than this endless watch, but orders are orders." },
    { id = "b_m_shaman", when = { class = "SHAMAN" }, text = "The spirits walk with you, shaman. Ask them if the Alliance will come tonight." },
    { id = "b_m_rogue", when = { class = "ROGUE" }, text = "Rogue, you move like a shadow. Good; use it against the Alliance, not against us." },
    { id = "b_m_night", when = { timeOfDay = "night" }, text = "Night is when the Alliance sneaks, so keep your eyes open and your blade ready." },
    { id = "b_m_ghost", when = { ghost = true }, text = "Your spirit wanders, {class}. Go find your body; the Horde still needs your arm." },
    { id = "b_m_pvp", when = { pvpRank = { min = 3 } }, text = "Your rank speaks for you, {name}. Many Alliance graves bear your mark." },
    { id = "b_m_tabard", when = { tabard = true }, text = "Your guild's colors are bold, {class}. May they never touch the dirt." },
    { id = "b_m_resSick", when = { resSick = true }, text = "The spirit healer drained you, I see. Rest a while before you fight again." },
  } }

P:Pool { id = "pass_cit_stormwind_more", role = "citizen", community = "stormwind",
  barks = {
    { id = "b_m_rent", text = "My landlord raised the rent again, and I'm half tempted to move to Goldshire." },
    { id = "b_m_parade", text = "Did you see the guard parade by the Keep yesterday? Lovely armor, but terribly loud." },
    { id = "b_m_cathedral", text = "The cathedral choir sings at dusk, and on a calm evening you can hear it from the harbor." },
    { id = "b_m_market", text = "Prices at the Trade District are a scandal, but where else would I buy my cheese?" },
    { id = "b_m_rumor", text = "They say the young king hasn't laughed since his father left. Poor lad." },
    { id = "b_m_mason", text = "My uncle was a stonemason before the guild quarrel. Now he won't say a word about it." },
    { id = "b_m_dwarf", when = { race = "Dwarf" }, text = "Dwarven ale's taken over half the taverns in town, and I can't say I mind." },
    { id = "b_m_human", when = { race = "Human" }, text = "Good to see a familiar face. Everyone in the city looks like a stranger these days." },
    { id = "b_m_rogue", when = { class = "ROGUE" }, text = "You walk like the Old Town crowd, friend, so I'll keep a hand on my purse, no offense." },
    { id = "b_m_dawn", when = { timeOfDay = "dawn" }, text = "Early start, is it? The canals are lovely before the fishmongers wake up." },
    { id = "b_m_low", when = { maxLevel = 10 }, text = "First time in the city? Don't let the size scare you; you'll learn your way about soon enough." },
    { id = "b_m_regular", when = { timesTalked = { min = 5 } }, text = "Oh, it's you again, {name}. I'll start thinking you live on my street." },
  } }

P:Pool { id = "pass_cit_ironforge_more", role = "citizen", community = "ironforge",
  barks = {
    { id = "b_m_beard", text = "My beard's finally reached my belt, and my wife says it's time to trim. I say never." },
    { id = "b_m_forge", text = "The Great Forge has burned for a thousand years, {g:lad|lass}, and it'll burn a thousand more." },
    { id = "b_m_brann", text = "Brann Bronzebeard's off digging again. That lad never sits still, I swear." },
    { id = "b_m_wager", text = "I've a wager on the ram races next week. Care to join? I promise nothing but a good laugh." },
    { id = "b_m_mine", text = "My da worked the mines at Gol'Bolar all his life, and he never once complained of the dark." },
    { id = "b_m_tinker", text = "The gnomes in Tinker Town blew up another workshop yesterday. Shook the dust off the ceiling." },
    { id = "b_m_troggs", text = "The troggs came up from the deep and took Gnomeregan. That's the worst of it, if ye ask me." },
    { id = "b_m_dwarf", when = { race = "Dwarf" }, text = "Bronzebeard or Wildhammer, {g:lad|lass}? Either way, ye're welcome at my table." },
    { id = "b_m_mage", when = { class = "MAGE" }, text = "A mage, eh? Keep yer fireballs away from my beard, if ye please." },
    { id = "b_m_rogue", when = { stealthed = true }, text = "I can hear ye creepin', {g:lad|lass}. Dwarven ears are sharper than ye think." },
    { id = "b_m_low", when = { maxLevel = 10 }, text = "Still young and wobbly on yer feet, I see. Dun Morogh'll make ye tough as stone." },
    { id = "b_m_holiday", when = { holiday = "winterveil" }, text = "Winter Veil's here, {g:lad|lass}! Greatfather Winter's set up shop by the forge again." },
  } }

P:Pool { id = "pass_cit_darnassus_more", role = "citizen", community = "darnassus",
  barks = {
    { id = "b_m_trees", text = "I planted a sapling last spring. It may be a tree by the time your grandchildren are born." },
    { id = "b_m_fandral", text = "Arch Druid Staghelm speaks of great plans for Teldrassil. I hope he is right." },
    { id = "b_m_mal", text = "Malfurion still sleeps in the Emerald Dream. Some say he will wake when we most need him." },
    { id = "b_m_war", text = "My mother fought in the War of the Ancients, and she still dreams of the burning." },
    { id = "b_m_high", text = "The Highborne were fools to trust the Legion. We must never repeat their mistakes." },
    { id = "b_m_moonwell", text = "The moonwell's water is cool tonight. It soothes the mind, if you'll let it." },
    { id = "b_m_sentinel", text = "My daughter joined the Sentinels this spring. I am proud, but I worry every night." },
    { id = "b_m_nightelf", when = { race = "NightElf" }, text = "Elune-adore, friend. It is good to see one of us return from the wider world." },
    { id = "b_m_dwarf", when = { race = "Dwarf" }, text = "Dwarves are so loud! Are you always shouting, or only when you're happy?" },
    { id = "b_m_priest", when = { class = "PRIEST" }, text = "The goddess smiles on you, priest. The Temple is glad of your devotion." },
    { id = "b_m_cat", when = { form = "cat" }, text = "Graceful as a nightsaber, druid. The Sentinels might mistake you for one of their own." },
    { id = "b_m_ghost", when = { ghost = true }, text = "Your spirit is lost, traveler. Seek the spirit healer; she will guide you back." },
  } }

P:Pool { id = "pass_cit_orgrimmar_more", role = "citizen", community = "orgrimmar",
  barks = {
    { id = "b_m_wolf", text = "My wolf had pups last week. Five, all strong, and every one bites like a grunt." },
    { id = "b_m_fire", text = "The forge in the Valley of Honor is running hot today. You can feel it from here." },
    { id = "b_m_bread", text = "Bread in Durotar tastes like dust, but it fills the belly, and that is enough." },
    { id = "b_m_ashenvale", text = "My son cuts lumber at Splintertree. The night elves hate him for it, but the Horde needs wood." },
    { id = "b_m_kodo", text = "The kodo caravan from the Crossroads came in late again. The Barrens are getting worse." },
    { id = "b_m_burning", text = "The Burning Blade still hides in Ragefire Chasm. Someone should drag them out by their horns." },
    { id = "b_m_goblin", text = "The goblins sell us steel and the Alliance their secrets. I trust them about as far as I can throw one." },
    { id = "b_m_warrior", when = { class = "WARRIOR" }, text = "That axe has seen battle, warrior. Tell me, how many Alliance has it tasted?" },
    { id = "b_m_hunter", when = { pet = { type = "Beast" } }, text = "Your beast {pet} looks hungry, {class}. The butcher in the Drag sells scraps cheap." },
    { id = "b_m_night", when = { timeOfDay = "night" }, text = "Orgrimmar at night is loud and full of grog. Watch your step, {class}." },
    { id = "b_m_low", when = { maxLevel = 10 }, text = "Still young and green, whelp. Learn from the grunts, and you might live long." },
    { id = "b_m_regular", when = { timesTalked = { min = 5 } }, text = "{name}, you again. You walk these streets more often than the guards." },
  } }

P:Pool { id = "pass_cit_thunder_bluff_more", role = "citizen", community = "thunder_bluff",
  barks = {
    { id = "b_m_drum", text = "The drums on the Spirit Rise are calling the ancestors tonight. Can you hear them?" },
    { id = "b_m_weave", text = "I am weaving a blanket for my granddaughter. It will take many moons, but she is worth it." },
    { id = "b_m_plains", text = "The plains below are green after the rain. The Earth Mother has been kind this season." },
    { id = "b_m_grim", text = "The Grimtotem have forgotten the ways of peace. It saddens my heart to see it." },
    { id = "b_m_hunt", text = "The hunters brought back a great plainstrider today. There will be a feast tonight." },
    { id = "b_m_sky", text = "Sometimes I sit on the edge of the bluff and watch the clouds roll over the plains." },
    { id = "b_m_calf", text = "My calf took her first steps today. It is a joyful thing, to see the young grow." },
    { id = "b_m_shaman", when = { class = "SHAMAN" }, text = "The winds speak to you, shaman. Listen well, for they carry the wisdom of the ancestors." },
    { id = "b_m_warrior", when = { class = "WARRIOR" }, text = "A strong arm, warrior. May you only lift it to protect those who need you." },
    { id = "b_m_dusk", when = { timeOfDay = "dusk" }, text = "An'she sets, and Mu'sha rises. It is a time of quiet and reflection on the bluffs." },
    { id = "b_m_ghost", when = { ghost = true }, text = "You walk as a spirit, child. The Earth Mother has not yet called you home." },
    { id = "b_m_regular", when = { timesTalked = { min = 5 } }, text = "Ah, {name}. Your face is becoming familiar on the bluffs, like the morning wind." },
  } }

P:Pool { id = "pass_cit_undercity_more", role = "citizen", community = "undercity",
  barks = {
    { id = "b_m_memory", text = "I was a baker once, in Lordaeron. I can still smell the bread when I close my eyes." },
    { id = "b_m_lady", text = "The Dark Lady freed us. Whatever she asks, I will give it, and gladly." },
    { id = "b_m_flesh", text = "My left hand fell off yesterday. The apothecaries stitched it back, mostly." },
    { id = "b_m_rain", text = "It rains above, I'm told. I haven't seen the sky in months, and I don't miss it." },
    { id = "b_m_bones", text = "Bones creak when the weather turns. Even death does not spare us that indignity." },
    { id = "b_m_scarlet", text = "The Scarlet Crusade burned my village before the plague even reached it. I remember their faces." },
    { id = "b_m_terenas", text = "King Terenas died in that throne room above. His son killed him, and then killed us all." },
    { id = "b_m_human", when = { race = "Human" }, text = "A human, here? How exquisitely brave of you, or how exquisitely lost." },
    { id = "b_m_warlock", when = { class = "WARLOCK" }, text = "Your demons are welcome here, warlock. We have seen far worse in our time." },
    { id = "b_m_rogue", when = { class = "ROGUE" }, text = "A rogue, sneaking about the canals. How very Lordaeron of you." },
    { id = "b_m_night", when = { timeOfDay = "night" }, text = "Night above, night below. In the Undercity, it is always night." },
    { id = "b_m_regular", when = { timesTalked = { min = 5 } }, text = "{name}, still alive, or at least still moving. I suppose that's something." },
  } }

P:Pool { id = "pass_cit_alliance", role = "citizen", faction = "Alliance",
  barks = {
    { id = "b_m_weather", text = "Fine weather for the road, {class}, if you've somewhere you need to be." },
    { id = "b_m_news", text = "Have you heard any news from Stormwind? We get so little out here, and all of it late." },
    { id = "b_m_horde", text = "My brother says the Horde's grown bolder since the orcs got out of those camps." },
    { id = "b_m_crops", text = "Harvest was thin this year, so bread's dear and tempers are short." },
    { id = "b_m_light", text = "Light keep you, {class}. The roads are dangerous enough without bad luck." },
    { id = "b_m_kids", text = "My children want to be adventurers like you. I keep telling them it's mostly mud and blisters." },
    { id = "b_m_gnome", when = { race = "Gnome" }, text = "Oh, a gnome! My cart has a squeaky wheel, if you ever fancy a tinker." },
    { id = "b_m_elf", when = { race = "NightElf" }, text = "Kaldorei always look so calm. Do you never worry about anything at all?" },
    { id = "b_m_rich", when = { minLevel = 55 }, text = "You look like you've seen the far corners of the world, {class}. I envy you a little." },
    { id = "b_m_dura", when = { durability = { max = 20 } }, text = "Your gear's in a sorry state, friend. Did you lose a fight with a wolf pack?" },
    { id = "b_m_drunk", when = { drunk = true }, text = "Someone's been enjoying the tavern, I see! Sleep it off before you fall in a ditch." },
    { id = "b_m_helped", when = { word = "helped" }, text = "Folk say you've been a help around here, {name}. That's more than most bother with." },
    { id = "b_m_dislike", when = { disposition = { max = 34 } }, text = "Oh, it's you. I'll just be on my way, then." },
  } }

P:Pool { id = "pass_cit_horde", role = "citizen", faction = "Horde",
  barks = {
    { id = "b_m_dust", text = "Dust and wind again today, {class}. The land does not make life easy for us." },
    { id = "b_m_news", text = "Any word from Orgrimmar? The Warchief's messengers come through here so rarely." },
    { id = "b_m_alliance", text = "The Alliance would see us all in chains again. We will not let that happen." },
    { id = "b_m_meat", text = "The hunters brought back fresh meat. There will be full bellies tonight, at least." },
    { id = "b_m_spirits", text = "The spirits have been quiet lately. I don't know if that is good or bad." },
    { id = "b_m_young", text = "The young ones want glory. They do not remember what war truly costs." },
    { id = "b_m_troll", when = { race = "Troll" }, text = "Ah, a troll! Will you tell my fortune? They say your witch doctors see far." },
    { id = "b_m_tauren", when = { race = "Tauren" }, text = "Tauren always seem so calm. I wish I had half your patience, friend." },
    { id = "b_m_rich", when = { minLevel = 55 }, text = "You have seen much of the world, {class}. Your eyes tell the stories." },
    { id = "b_m_dura", when = { durability = { max = 20 } }, text = "Your armor is in pieces, {class}. Did you fight an ogre bare-handed?" },
    { id = "b_m_drunk", when = { drunk = true }, text = "Too much grog, eh? Sit down before you fall down, {class}." },
    { id = "b_m_helped", when = { word = "helped" }, text = "They say you helped us, {name}. The Horde does not forget its friends." },
    { id = "b_m_dislike", when = { disposition = { max = 34 } }, text = "You again. Move along, {class}, I have nothing to say to you." },
  } }

P:Pool { id = "pass_vendor_more", role = "vendor",
  barks = {
    { id = "b_m_coin", text = "Coin's tight for everyone these days, {class}, so I won't keep you long." },
    { id = "b_m_road", text = "Took me three days to haul this stock in, and the bandits only got one crate." },
    { id = "b_m_rain", text = "Rain ruins half my wares, so I'm glad to see a customer on a dry day." },
    { id = "b_m_thread", text = "Thread and flasks are running low, so if you need them, now's the time." },
    { id = "b_m_mage", when = { class = "MAGE" }, text = "Mages always buy water from me, though I'm told you can make your own." },
    { id = "b_m_rogue", when = { class = "ROGUE" }, text = "Flash powder and thieves' tools, {class}? No, of course not, you're just looking." },
    { id = "b_m_hunter", when = { class = "HUNTER" }, text = "Arrows, ammunition and feed for {pet}? I've a bit of everything, hunter." },
    { id = "b_m_night", when = { timeOfDay = "night" }, text = "I'm closing soon, {class}, so if you want something, you'd best make up your mind." },
  } }

P:Pool { id = "pass_innkeeper_more", role = "innkeeper",
  barks = {
    { id = "b_m_stew", text = "There's stew on the fire, {class}, and it smells better than it tastes, I'll warn you." },
    { id = "b_m_noise", text = "If you hear singing upstairs, that's the dwarves. They'll stop when the keg's empty." },
    { id = "b_m_mud", text = "Wipe your boots, friend; I've only just swept the floor." },
    { id = "b_m_rumor", text = "If you're after rumors, sit at the bar and listen; travelers talk more after a pint." },
    { id = "b_m_rain", when = { timeOfDay = "dusk" }, text = "Evening's settling in, {class}. Best find a warm seat before the crowd comes in." },
    { id = "b_m_dura", when = { durability = { max = 20 } }, text = "You look like you've been dragged through a briar patch, {class}. Sit and rest." },
    { id = "b_m_deaths", when = { deaths = { min = 20 } }, text = "You've died more often than my last cook, {name}. Do try to stay alive a bit longer." },
    { id = "b_m_like", when = { disposition = { min = 65 } }, text = "Always good to have you under my roof, {name}. You're one of the decent ones." },
  } }

P:Pool { id = "pass_trainer_more", role = "trainer",
  barks = {
    { id = "b_m_lesson", text = "Lessons don't learn themselves, {class}. Come back when you're ready to listen." },
    { id = "b_m_students", text = "I've had three students this week, and only one of them didn't set something on fire." },
    { id = "b_m_patience", text = "Patience is the first lesson and the last, {class}. Everything else is in between." },
    { id = "b_m_low", when = { maxLevel = 10 }, text = "You're just starting out, I see. Everyone was green once, even me." },
    { id = "b_m_high", when = { minLevel = 55 }, text = "You've surpassed most of my students, {name}. I'm almost out of things to teach you." },
    { id = "b_m_regular", when = { timesTalked = { min = 5 } }, text = "Back again, {name}? Your dedication is admirable, if a little exhausting." },
  } }

P:Pool { id = "pass_banker_more", role = "banker",
  barks = {
    { id = "b_m_ledger", text = "Every coin is counted twice here, {class}. We take our ledgers very seriously." },
    { id = "b_m_quiet", text = "Quiet day at the bank. That usually means everyone's out spending their gold." },
    { id = "b_m_gold", text = "Gold is safer in our vaults than in your boot, {class}, I promise you that." },
    { id = "b_m_dura", when = { durability = { max = 20 } }, text = "If your armor's that worn, perhaps a withdrawal for repairs is in order?" },
    { id = "b_m_rogue", when = { class = "ROGUE" }, text = "Rogues always look at our vault doors so fondly. Please don't." },
  } }

P:Pool { id = "pass_auctioneer_more", role = "auctioneer",
  barks = {
    { id = "b_m_copper", text = "Copper bars are flying off the block today, {class}. Everyone's making swords." },
    { id = "b_m_rare", text = "Someone listed a rare blade this morning. It'll go for a pretty penny, mark my words." },
    { id = "b_m_fees", text = "Listing fees are fixed, {class}, so don't blame me for the price; blame the House." },
    { id = "b_m_herbs", text = "Herbs are cheap this week. The herbalists must have had a good season in the hills." },
    { id = "b_m_drunk", when = { drunk = true }, text = "Bidding while drunk is a bad idea, {class}. Trust me, I've seen it go wrong." },
  } }

P:Pool { id = "pass_blacksmith_more", role = "blacksmith",
  barks = {
    { id = "b_m_ore", text = "Iron's scarce this month, {class}, so every sword I make costs me sweat." },
    { id = "b_m_hammer", text = "Hammer, heat, quench, repeat. That's the whole secret, though nobody believes me." },
    { id = "b_m_burn", text = "Burned my arm on the forge again this morning. Comes with the trade, I suppose." },
    { id = "b_m_mage", when = { class = "MAGE" }, text = "Mages never need much armor, but you could use a decent dagger, {class}." },
    { id = "b_m_paladin", when = { class = "PALADIN" }, text = "Paladin plate takes a beating, {g:brother|sister}. Bring it in when it starts to rattle." },
    { id = "b_m_high", when = { minLevel = 55 }, text = "That armor's finer than anything I could make, {class}. Mind if I take a closer look?" },
  } }

P:Pool { id = "pass_flightmaster_more", role = "flightmaster",
  barks = {
    { id = "b_m_birds", text = "My birds are rested and fed, {class}, so they'll fly fast and true today." },
    { id = "b_m_storm", text = "There's a storm brewing over the hills, so if you're flying, go soon." },
    { id = "b_m_feathers", text = "Molting season's here, so if you see feathers on your cloak, don't blame me." },
    { id = "b_m_hunter", when = { pet = { type = "Beast" } }, text = "Your {pet} can't ride with you, {class}, but it'll find you, I'm sure." },
    { id = "b_m_ghost", when = { ghost = true }, text = "I can't fly spirits, friend. Go and find your body first." },
    { id = "b_m_high", when = { minLevel = 55 }, text = "You've flown every route on the map by now, {name}, I'd wager." },
  } }

P:Pool { id = "pass_stablemaster_more", role = "stablemaster",
  barks = {
    { id = "b_m_hay", text = "Fresh hay came in today, {class}, so the beasts are in fine spirits." },
    { id = "b_m_mud", text = "Mind the mud near the stalls; it's deeper than it looks." },
    { id = "b_m_bite", text = "One of the beasts bit me this morning. It's usually the quiet ones, I find." },
    { id = "b_m_imp", when = { pet = { family = "Imp" } }, text = "I don't stable demons, warlock. Keep that imp away from my beasts, please." },
    { id = "b_m_low", when = { maxLevel = 15 }, text = "Still young for a beast-tamer, I see. Treat your companion well, and it'll serve you well." },
  } }

P:Pool { id = "pass_peon_more", role = "peon",
  barks = {
    { id = "b_m_tired", text = "Peon tired, but peon keep working, because grunt watching." },
    { id = "b_m_rain", text = "Rain make wood wet, and wet wood very heavy. Peon not like rain." },
    { id = "b_m_zug", text = "Zug zug! Peon ready for more work, even if peon not want it." },
    { id = "b_m_lazy", text = "Peon not lazy! Peon just resting eyes for little bit." },
    { id = "b_m_mage", when = { class = "MAGE" }, text = "Magic one! Can you make wood chop itself? Peon would like that very much." },
    { id = "b_m_warrior", when = { class = "WARRIOR" }, text = "Big warrior with big axe! Peon think you chop wood faster than peon." },
    { id = "b_m_mount", when = { mounted = true }, text = "Peon wish peon had wolf to ride, but peon only have feet." },
    { id = "b_m_drunk", when = { drunk = true }, text = "You smell like grog! Peon jealous, because peon never get grog." },
  } }

P:Pool { id = "pass_child_more", role = "child",
  barks = {
    { id = "b_m_secret", text = "I know a secret, but I'm not telling you, because you're a grown-up!" },
    { id = "b_m_dare", text = "My friend dared me to talk to you, so now I did, and I'm going to run away!" },
    { id = "b_m_tooth", text = "I lost a tooth today! Mama says the tooth fairy will bring me a copper." },
    { id = "b_m_bored", text = "I'm so bored, and Mama won't let me go past the fence. It's not fair!" },
    { id = "b_m_monster", text = "There's a monster under my bed, I know it, and you have to come and kill it!" },
    { id = "b_m_elf", when = { race = "NightElf" }, text = "Your ears are so long! Can you hear what I'm thinking right now?" },
    { id = "b_m_orc", when = { race = "Orc" }, text = "Your tusks are so big! Did you have to grow them, or were you born with them?" },
    { id = "b_m_troll", when = { race = "Troll" }, text = "Your hair is so tall! Do you have to sleep standing up?" },
    { id = "b_m_human", when = { race = "Human" }, text = "You look just like my uncle, except he's not a hero, and you probably are." },
    { id = "b_m_rogue", when = { stealthed = true }, text = "I can see you, sneaky! You're not invisible to me, you know." },
    { id = "b_m_priest", when = { class = "PRIEST" }, text = "Are you a priest? Can you make my scraped knee better? It really hurts!" },
    { id = "b_m_hunter", when = { class = "HUNTER" }, text = "Can you teach me to shoot a bow? I'll practice really hard, I promise!" },
    { id = "b_m_travel", when = { form = "travel" }, text = "You turned into a deer! Can you turn me into a deer, too? Please?" },
    { id = "b_m_drunk", when = { drunk = true }, text = "Why are you walking funny? Did you eat too much candy, like me?" },
    { id = "b_m_night", when = { timeOfDay = "night" }, text = "I'm supposed to be in bed, so don't tell Mama you saw me out here!" },
    { id = "b_m_regular", when = { timesTalked = { min = 5 } }, text = "It's you again! You're my favorite hero, and I tell everyone." },
  } }

-- Greetings for someone you just overheard (Systems/Overheard.lua, condition `overheard`).
P:Pool { id = "pass_overheard_guard", role = "guard",
  greetings = {
    { id = "g_oh_guard1", when = { overheard = true }, text = "You heard all that, didn't you? Forget it, {class}; a guard grumbles, but a guard still does the job." },
    { id = "g_oh_guard2", when = { overheard = true }, text = "Ears like a hunting cat, you have. Well, now you know what the watch really talks about." },
  },
}
P:Pool { id = "pass_overheard_citizen", role = "citizen",
  greetings = {
    { id = "g_oh_cit1", when = { overheard = true }, text = "Oh! You were standing right there, weren't you? I hope we didn't say anything too foolish." },
    { id = "g_oh_cit2", when = { overheard = true }, text = "I suppose you caught all of that. Folk talk, you know, and half of it is only talk." },
    { id = "g_oh_cit3", when = { overheard = true }, text = "Don't repeat what you just heard, please. My neighbour has a long memory and a short temper." },
  },
}
P:Pool { id = "pass_overheard_vendor", role = "vendor",
  greetings = {
    { id = "g_oh_ven1", when = { overheard = true }, text = "Never mind what you heard about my prices; for you they're the honest ones, more or less." },
    { id = "g_oh_ven2", when = { overheard = true }, text = "Gossip is free, friend, but the goods are not. Was there something you wanted?" },
  },
}
P:Pool { id = "pass_overheard_innkeeper", role = "innkeeper",
  greetings = {
    { id = "g_oh_inn1", when = { overheard = true }, text = "Heard us chattering, did you? An innkeeper hears everything, and now and then repeats a little." },
    { id = "g_oh_inn2", when = { overheard = true }, text = "Pull up a stool if you want the rest of that story, though I'll warn you it gets worse." },
  },
}
