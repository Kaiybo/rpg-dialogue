-- The warrior patch (0.93.0): what people notice about a warrior's shouts, rages, weapons and dents.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Notice-only pools: they stack onto the role pools (pools.lua, pools_roles.lua) and
-- never replace them. Stances are invisible (W.NOT_SHAPES), so these use what people can
-- see and hear. Aura ids: Battle Shout 6673/5242/6192/11549/11550/11551/25289,
-- Bloodrage 2687/29131, Berserker Rage 18499, Enrage 12880/14201-14204, Shield Wall 871,
-- Recklessness 1719, Retaliation 20230, Death Wish 12328, Sweeping Strikes 12292. Items: Whirlwind Axe 6975, Whirlwind Warhammer 6976,
-- Whirlwind Sword 6977, Ravager 7717, Lionheart Helm 12640, Arcanite Reaper 12784,
-- Quel'Serrar 18348, Thunderfury 19019.

local SHOUT = { 6673, 5242, 6192, 11549, 11550, 11551, 25289 }
local ANGRY = { 18499, 2687, 29131, 12880, 14201, 14202, 14203, 14204 }
local SHIELDWALL = { 871 }
local RECKLESS = { 1719, 12328 }
local RETALIATION = { 20230 }
local WHIRLWIND = { 6975, 6976, 6977 }
local REAPER = { 12784 }
local RAVAGER = { 7717 }
local LIONHEART = { 12640 }
local QUELSERRAR = { 18348 }
local THUNDERFURY = { 19019 }
local BATTERED = { max = 0.25 }

---------------------------------------------------------------------------
-- Guards
---------------------------------------------------------------------------
P:Pool {
  id = "war_guard_alliance", role = "guard", faction = "Alliance",
  notice = {
    { id = "n_wr_dwarf_if", cat = "class", when = { class = "WARRIOR", race = "Dwarf", zone = "Ironforge" },
      text = "Another shield for the Military Ward, by the look of ye. Report to the Hall of Arms before ye go wandering off to Loch Modan, {g:lad|lass}; the Dun Algaz watch could use every axe it can get." },
    { id = "n_wr_wildhammer", cat = "origin", when = { class = "WARRIOR", origin = "dwarf_wildhammer_kin" },
      text = "Ye talk like a Wildhammer, and ye carry that axe like ye'd sooner throw it. Keep it in yer hand while ye're in the city, for the Bronzebeards have long memories about the War of the Three Hammers." },
    { id = "n_wr_human", cat = "class", when = { class = "WARRIOR", race = "Human", zone = "Stormwind City" },
      text = "You've the stance of someone who drilled in the Old Town barracks, {g:sir|ma'am}. If you're after Harry Burlguard, he's in the Pig and Whistle as usual, teaching recruits how to lose a fight to a drunk." },
    { id = "n_wr_gnome", cat = "class", when = { class = "WARRIOR", race = "Gnome", zone = "Ironforge" },
      text = "A gnome in mail, with an axe nearly as tall as yerself. I'll not laugh, for I saw yer people hold the rear at Gnomeregan while the rest got out, and that took more nerve than any dwarf I know." },
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "Your armour's hanging off you in strips, {g:sir|ma'am}. The smiths will set it right, and I'd go to them before you go anywhere else, because you'll not survive another fight in that." },
    { id = "n_wr_shout", cat = "aura", when = { aura = SHOUT },
      text = "You've been bellowing a battle cry inside the walls, and half my watch reached for their swords at the sound of it. Save it for the field, if you please; this is a market street." },
    { id = "n_wr_angry", cat = "aura", when = { aura = ANGRY, class = "WARRIOR" },
      text = "Your eyes are wild and you're breathing like a bull at a gate. Whatever's set you off, walk it off before you come any further into town." },
    { id = "n_wr_wall", cat = "aura", when = { aura = SHIELDWALL },
      text = "You've set that shield like you're holding a breach on your own, and there's nothing here to hold against. Ease off, friend; the city's safe enough for now." },
    { id = "n_wr_lionheart", cat = "gear", when = { equipped = LIONHEART },
      text = "That's a Lionheart helm, or I'm a kobold. I saw one on a marshal once, and he'd earned it twice over before he ever put it on his head." },
    { id = "n_wr_rank", cat = "pvp", when = { class = "WARRIOR", pvpRank = { min = 6 } },
      text = "I've heard your name in the barracks from the lads back from the front, {rank}. They say you're always the first one through the gap, so mind you're not the first one carried back." },
    { id = "n_wr_champions", cat = "pvp", when = { class = "WARRIOR", pvpRank = { min = 12 }, zone = "Stormwind City" },
      text = "Your name's on the wall in the Champions' Hall, and I walk past it every morning on my way to the gate. It's an honour to stand watch while you go by, {rank}." },
  },
  react = {
    { id = "r_wr_shout", on = "aura", when = { aura = SHOUT },
      text = "Light's sake, warn a body before you roar like that! I nearly put my spear through the cartwright." },
    { id = "r_wr_angry", on = "aura", when = { aura = { 18499 } },
      text = "Easy there! Whatever just came over you, keep it pointed out the gate and away from my street." },
  },
}

P:Pool {
  id = "war_guard_horde", role = "guard", faction = "Horde",
  notice = {
    { id = "n_wr_orc", cat = "class", when = { class = "WARRIOR", race = "Orc", zone = "Orgrimmar" },
      text = "Another orc with an axe and a cause. Good; the Valley of Honor has trained warriors since Thrall raised these walls, and they'll make something more of you yet." },
    { id = "n_wr_tauren", cat = "class", when = { class = "WARRIOR", race = "Tauren", zone = { "Thunder Bluff", "Mulgore" } },
      text = "The braves of the bluffs have watched you carry that weapon up the lift, and they nod as you pass. That is no small thing among the Bloodhoof, warrior." },
    { id = "n_wr_forsaken", cat = "class", when = { class = "WARRIOR", race = "Scourge", zone = { "Undercity", "Tirisfal Glades" } },
      text = "You were a soldier of Lordaeron once, I'd wager, and you still hold a blade like one. The Dark Lady has more use for that than for anything else you kept from those days." },
    { id = "n_wr_troll", cat = "class", when = { class = "WARRIOR", race = "Troll" },
      text = "A Darkspear with a big axe and a bigger grin. Sen'jin would've liked you, mon, and Vol'jin can always use your kind out on the Echo Isles." },
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "Your armour has more holes in it than a peon's excuses, warrior. See a smith before you go looking for your next fight, or the next fight will be your last." },
    { id = "n_wr_shout", cat = "aura", when = { aura = SHOUT },
      text = "Lok'tar! A war cry like that stirs the blood of every grunt on this gate. Save some of it for the Alliance, warrior." },
    { id = "n_wr_reckless", cat = "aura", when = { aura = RECKLESS, class = "WARRIOR" },
      text = "You've the look of a warrior who's stopped caring whether you live through the day. I saw that look on Grom's warriors once, and most of them died wearing it." },
    { id = "n_wr_angry", cat = "aura", when = { aura = ANGRY, class = "WARRIOR" },
      text = "Your blood's up, and I can smell it from here. Good; just keep it off my gate, because I've grunts enough with tempers of their own." },
    { id = "n_wr_reaper", cat = "gear", when = { equipped = REAPER },
      text = "That's an arcanite reaper on your back, and it's worth more than this whole watchtower. Keep a hand on it in the crowd; goblins have quick fingers and no shame at all." },
    { id = "n_wr_rank", cat = "pvp", when = { class = "WARRIOR", pvpRank = { min = 6 } },
      text = "The grunts back from the front speak of you, {rank}. They say you charge before the drums have even started, and they say it like it's the best thing they ever saw." },
    { id = "n_wr_legends", cat = "pvp", when = { class = "WARRIOR", pvpRank = { min = 12 }, zone = "Orgrimmar" },
      text = "Your name's carved in the Hall of Legends, and the young grunts stand in front of it and read it aloud. Give them something worth copying, {rank}." },
  },
  react = {
    { id = "r_wr_shout", on = "aura", when = { aura = SHOUT },
      text = "That's a proper war cry! Every grunt on this gate stood up straighter for it, warrior." },
    { id = "r_wr_reckless", on = "aura", when = { aura = RECKLESS },
      text = "Whoa, whatever you just did, it's put murder in your eyes. Point it at the enemy, not at my gate." },
  },
}

---------------------------------------------------------------------------
-- Townsfolk
---------------------------------------------------------------------------
P:Pool {
  id = "war_citizen_alliance", role = "citizen", faction = "Alliance",
  notice = {
    { id = "n_wr_shout", cat = "aura", when = { aura = SHOUT },
      text = "Was that you shouting just now? My little one dropped her bread in the canal, and my ears are still ringing with it." },
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "You're dented all over like an old pot, and there's blood on the rivets. Is any of it yours, or does it all belong to somebody else?" },
    { id = "n_wr_reaper", cat = "gear", when = { equipped = REAPER },
      text = "That axe is taller than my son and shines like a glass full of moonlight. My brother's a smith, and he says only a handful in the kingdom could hammer arcanite into a thing like that." },
    { id = "n_wr_dwarf", cat = "class", when = { class = "WARRIOR", race = "Dwarf" },
      text = "You're the third dwarf in armour I've seen today, and every one of you clanks like a cart full of kettles. Is it true you sleep in it, or is that just something the children say?" },
    { id = "n_wr_angry", cat = "aura", when = { aura = ANGRY, class = "WARRIOR" },
      text = "You're red in the face and your knuckles are white on that hilt. Has somebody upset you, or do you always look like that before supper?" },
    { id = "n_wr_plate", cat = "class", when = { class = "WARRIOR", minLevel = 40 },
      text = "My grandfather wore a soldier's mail in the Second War, and he complained about the weight of it until the day he died. Yours looks twice as heavy, so I'll not complain about my shopping basket again." },
  },
}

P:Pool {
  id = "war_citizen_horde", role = "citizen", faction = "Horde",
  notice = {
    { id = "n_wr_orc", cat = "class", when = { class = "WARRIOR", race = "Orc", zone = "Orgrimmar" },
      text = "My sons play at being warriors in the dust outside the Valley of Honor, swinging sticks at each other's heads. They'd stop and stare if they saw you, and then they'd swing them harder." },
    { id = "n_wr_tauren", cat = "class", when = { class = "WARRIOR", race = "Tauren", zone = "Thunder Bluff" },
      text = "You walk the bluffs like the braves of the old songs, little one, with a weapon as heavy as a kodo's yoke. The Earth Mother made you strong; see that you use it for the herd." },
    { id = "n_wr_forsaken", cat = "class", when = { class = "WARRIOR", race = "Scourge", zone = "Undercity" },
      text = "You still carry a sword the way the living do, as though you're afraid of being cut. Habits outlast the flesh, I find, and they're far harder to bury." },
    { id = "n_wr_shout", cat = "aura", when = { aura = SHOUT },
      text = "Was that your war cry? The kodo just stopped chewing, and they never do that for anything less than thunder." },
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "Your armour's been chewed like a bone by a hungry wolf, warrior. Is the other fellow worse off, or is that why you look so sour?" },
    { id = "n_wr_whirlwind", cat = "gear", when = { equipped = WHIRLWIND },
      text = "That weapon hums like the wind down a canyon. I've heard of a troll hermit in the cold northern hills who puts storms inside steel, but I took it for a peon's tale." },
  },
}

---------------------------------------------------------------------------
-- Innkeepers, vendors, blacksmiths, flight and stable
---------------------------------------------------------------------------
P:Pool {
  id = "war_innkeeper", role = "innkeeper",
  notice = {
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "You've come in looking like you were dragged behind a kodo cart. Sit down before you fall down, and mind you don't bleed on the cushions." },
    { id = "n_wr_angry", cat = "aura", when = { aura = ANGRY, class = "WARRIOR" },
      text = "You've the look of a brawler who wants a reason. Find it outside, friend; I've only just mended the last table a warrior broke over somebody's head." },
    { id = "n_wr_deaths", cat = "death", when = { class = "WARRIOR", deaths = { min = 30 } },
      text = "You're the one the healers keep dragging back from the graveyard, aren't you? I've heard your name in three inns, and every time you'd only just come back from the dead." },
    { id = "n_wr_dwarf", cat = "class", when = { class = "WARRIOR", race = "Dwarf", zone = { "Ironforge", "Dun Morogh", "Loch Modan" } },
      text = "Ye'll be wantin' a Thunderbrew stout, I'd wager, for a warrior's thirst is a fearsome thing. Just leave the axe by the door, if ye please, so nobody gets any bright ideas after the third round." },
    { id = "n_wr_plate", cat = "class", when = { class = "WARRIOR", minLevel = 40, resting = true },
      text = "If you're stopping the night, take the plate off before you climb the stairs. The last warrior who slept in it went straight through my floorboards, and I'm still finding splinters." },
  },
  react = {
    { id = "r_wr_shout", on = "aura", when = { aura = SHOUT },
      text = "Not in here! You've just made the minstrel drop his lute and half my regulars spill their drinks." },
  },
}

P:Pool {
  id = "war_vendor", role = "vendor",
  notice = {
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "I don't sell armour, friend, but I'd steer you to a smith before you buy anything else. Your breastplate's hanging on by a single strap." },
    { id = "n_wr_reaper", cat = "gear", when = { equipped = REAPER },
      text = "I'd give a year's takings to sell an axe like that, but nobody ever brings one in. I don't suppose you've a cousin who's grown tired of his?" },
    { id = "n_wr_quelserrar", cat = "gear", when = { equipped = QUELSERRAR },
      text = "That blade's old, older than this town by the look of it, and it shines as if it was tempered in dragonfire. I won't ask where you found it, but I'll wonder about it all evening." },
    { id = "n_wr_thunderfury", cat = "gear", when = { equipped = THUNDERFURY },
      text = "Every hair on my arms just stood up, and the coins are sliding across the counter toward you. Whatever that sword is, keep it in its sheath while you're in my shop." },
  },
}

P:Pool {
  id = "war_blacksmith", role = "blacksmith",
  notice = {
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "Look at the state of that armour! You've been letting things hit you that should've been hitting your shield, and I can tell which arm you favour from the dents alone." },
    { id = "n_wr_wrecked", cat = "gear", when = { class = "WARRIOR", durability = { max = 0.05 } },
      text = "There's barely a whole rivet left on you, {class}. One more fight in that and you'll be walking into it with nothing on, so set it down on my bench before you go anywhere." },
    { id = "n_wr_reaper", cat = "gear", when = { equipped = REAPER },
      text = "An arcanite reaper, as I live and breathe. It takes a master's hand and a fortune in arcanite to forge one of those, so treat it better than you treat your armour." },
    { id = "n_wr_whirlwind", cat = "gear", when = { equipped = WHIRLWIND },
      text = "That's a whirlwind weapon, and there's something bound inside the steel that isn't steel at all. I'll sharpen it any time you like, but don't ask me to open it up." },
    { id = "n_wr_quelserrar", cat = "gear", when = { equipped = QUELSERRAR },
      text = "Quel'Serrar, by my anvil. There's elven smithcraft in that blade older than any forge in this land, and somebody's tempered it in dragon's breath since, I'd swear to it." },
    { id = "n_wr_lionheart", cat = "gear", when = { equipped = LIONHEART },
      text = "That's a Lionheart helm. The best plate-smiths I know argue over who first made one, and every one of them swears it was their own master." },
    { id = "n_wr_ravager", cat = "gear", when = { equipped = RAVAGER },
      text = "That's Herod's own axe you're carrying, taken off him in the Scarlet Monastery. I've seen the notches it leaves in good plate, and I'd rather not see them in mine." },
    { id = "n_wr_plate", cat = "gear", when = { class = "WARRIOR", minLevel = 40, maxLevel = 45 },
      text = "You've the strength for plate now, {class}, and you'll feel every pound of it for the first month. Mind the straps at the shoulder; that's where new plate pinches first." },
  },
}

P:Pool {
  id = "war_flightmaster_alliance", role = "flightmaster", faction = "Alliance",
  notice = {
    { id = "n_wr_wildhammer", cat = "origin", when = { class = "WARRIOR", origin = "dwarf_wildhammer_kin" },
      text = "Ye'll have flown gryphons at Aerie Peak, I'd wager, and these birds can smell it on ye. They'll fly ye straighter than they'd fly any Bronzebeard, and don't tell my cousins I said so." },
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "You're going up on one of my birds looking like that? If a strap snaps over the mountains, the gryphon won't circle back to pick up the pieces." },
    { id = "n_wr_plate", cat = "class", when = { class = "WARRIOR", minLevel = 40 },
      text = "You're heavier in that plate than any rider the birds have carried this week. I'll find you a strong one, but don't wriggle about once you're up there." },
  },
  react = {
    { id = "r_wr_shout", on = "aura", when = { aura = SHOUT },
      text = "Don't roar near the roost! The gryphons answer a war cry with one of their own, and then I'm an hour settling them." },
  },
}

P:Pool {
  id = "war_flightmaster_horde", role = "flightmaster", faction = "Horde",
  notice = {
    { id = "n_wr_tauren", cat = "class", when = { class = "WARRIOR", race = "Tauren", minLevel = 40 },
      text = "A tauren in full plate is a load even for a wind rider, warrior. I'll give you the biggest beast I have, and you'll forgive it if it groans on the way up." },
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "Your armour's rattling like a bag of bones, and the wind riders don't like the sound of it. Mend it before the next flight, or something will fall off over the Barrens." },
    { id = "n_wr_plate", cat = "class", when = { class = "WARRIOR", minLevel = 40 },
      text = "The wind riders have carried grunts in full armour since the Horde first came to Kalimdor, so climb on. Just don't kick them with those iron boots, or they'll kick back." },
  },
  react = {
    { id = "r_wr_shout", on = "aura", when = { aura = SHOUT },
      text = "Don't bellow at my wind riders! They think it's a challenge, and they'll answer it with their teeth." },
  },
}

P:Pool {
  id = "war_stablemaster", role = "stablemaster",
  notice = {
    { id = "n_wr_plate", cat = "class", when = { class = "WARRIOR", minLevel = 40 },
      text = "You'll want a mount with a strong back if you're riding in that plate. I've seen good animals lamed by a warrior who didn't think about the weight before climbing on." },
    { id = "n_wr_angry", cat = "aura", when = { aura = ANGRY, class = "WARRIOR" },
      text = "The animals can smell your blood's up, and they're stamping in their stalls. Breathe a little before you come any closer, would you?" },
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "You look like you've been trampled by something bigger than anything I stable. If that's what you do to yourself, I'd hate to see what you'd do to a horse." },
  },
  react = {
    { id = "r_wr_shout", on = "aura", when = { aura = SHOUT },
      text = "Easy, easy! You've set every beast in the place rearing, and I'll be a week calming the young ones." },
  },
}

---------------------------------------------------------------------------
-- Children
---------------------------------------------------------------------------
P:Pool {
  id = "war_child", role = "child",
  notice = {
    { id = "n_wr_shout", cat = "aura", when = { aura = SHOUT },
      text = "You shouted so loud my teeth buzzed! Can you teach me how? I want to shout at my brother like that when he takes my things." },
    { id = "n_wr_wall", cat = "aura", when = { aura = SHIELDWALL },
      text = "Why are you hiding behind your shield? There's nothing here but me and the pigeons, and the pigeons don't bite." },
    { id = "n_wr_reaper", cat = "gear", when = { equipped = REAPER },
      text = "Your axe is bigger than me! Can I touch it? I won't lick it, I promise, not even a little bit." },
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "You've got dents all over you, like Mum's old soup pot. Did a dragon step on you, or was it a giant?" },
    { id = "n_wr_thunderfury", cat = "gear", when = { equipped = THUNDERFURY },
      text = "Your sword is crackling like a storm! Look, my hair's standing up all on its own, and I didn't even touch it." },
    { id = "n_wr_dwarf", cat = "class", when = { class = "WARRIOR", race = "Dwarf" },
      text = "Is your beard armour too? My friend says dwarves braid iron into them so nobody can grab them in a fight, but I think he made it up." },
    { id = "n_wr_gnome", cat = "class", when = { class = "WARRIOR", race = "Gnome" },
      text = "You're hardly bigger than me, and you've got a real sword and real armour! If you can be a warrior, then I can be one too, can't I?" },
  },
  react = {
    { id = "r_wr_shout", on = "aura", when = { aura = SHOUT },
      text = "Whoa! Do it again, louder this time, so everybody on the street can hear!" },
    { id = "r_wr_angry", on = "aura", when = { aura = { 18499 } },
      text = "Your face went all red and scary! You're not cross with me, are you? I didn't do anything, I promise." },
    { id = "r_wr_wall", on = "aura", when = { aura = SHIELDWALL },
      text = "You went all hard and shiny behind your shield like a turtle! Can I knock on it?" },
  },
}

---------------------------------------------------------------------------
-- The spirit healer
---------------------------------------------------------------------------
P:Pool {
  id = "war_spirithealer", role = "spirithealer",
  notice = {
    { id = "n_wr_first", cat = "death", place = "before", when = { class = "WARRIOR", deaths = { max = 1 } },
      text = "Warriors always arrive with the same surprise on their faces, as though the blow they did not block belonged to somebody else. It was yours, I am afraid, but you may still have it back." },
    { id = "n_wr_many", cat = "death", place = "after", when = { class = "WARRIOR", deaths = { min = 50 } },
      text = "You meet death the way you meet everything, head first and without stopping to ask whether it is wise. Your file has a great many pages that begin with the word charge." },
    { id = "n_wr_battered", cat = "death", place = "after", when = { class = "WARRIOR", durability = { max = 0.15 } },
      text = "The armour on your body below is broken almost to nothing. Mend it before you charge again, or you will be standing here with me before the next sunrise." },
    { id = "n_wr_sixty", cat = "death", place = "after", when = { class = "WARRIOR", minLevel = 60 },
      text = "You have stood at the front of more battles than I could count, and the ones behind you came here far less often because of it. Go back, then, and hold the line a while longer." },
  },
}

---------------------------------------------------------------------------
-- Trainers of other classes, looking at a warrior
---------------------------------------------------------------------------
P:Pool {
  id = "war_trainer_paladin", role = "trainer", subtitle = "paladin trainer", faction = "Alliance",
  notice = {
    { id = "n_wr_soldier", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior in the Light's hall. The Silver Hand rode beside soldiers like you in the Second War, and we'd have lost it without them, so you're welcome here." },
    { id = "n_wr_dwarf", cat = "class", when = { class = "WARRIOR", race = "Dwarf" },
      text = "Ye've the build of a paladin, {g:lad|lass}, and the stubbornness besides. If ye ever tire of fighting without the Light at yer back, the Hall of Mysteries is only down the way." },
    { id = "n_wr_reckless", cat = "aura", when = { class = "WARRIOR", aura = RECKLESS },
      text = "You've thrown your guard away entirely; I can feel it like a door left open in a storm. The Light protects those who protect themselves, warrior." },
  },
  react = {
    { id = "r_wr_shout", on = "aura", when = { aura = SHOUT },
      text = "A war cry in a house of prayer? Lower your voice, and we'll pretend the Light didn't hear it." },
  },
}

P:Pool {
  id = "war_trainer_priest", role = "trainer", subtitle = "priest trainer",
  notice = {
    { id = "n_wr_deaths", cat = "death", when = { class = "WARRIOR", deaths = { min = 20 } },
      text = "Half the healers in this city know your name, warrior, and not because you bring them flowers. Try coming home with a little of yourself unbroken for once." },
    { id = "n_wr_battered", cat = "gear", when = { class = "WARRIOR", durability = BATTERED },
      text = "You're bleeding through your gambeson and you haven't said a word about it. Warriors always wait until they fall over, and then it's my acolytes who have to carry them." },
    { id = "n_wr_forsaken", cat = "class", when = { class = "WARRIOR", race = "Scourge" },
      text = "You'll not feel the wounds the way you did in life, so you'll take more of them than you should. Come to us before your arm stops answering, not after." },
  },
}

P:Pool {
  id = "war_trainer_mage", role = "trainer", subtitle = "mage trainer",
  notice = {
    { id = "n_wr_soldier", cat = "class", when = { class = "WARRIOR" },
      text = "Ah, a warrior. If you've come for conjured bread, I'm not a baker, and if you've come to ask why mages stand behind warriors, look at your armour and then look at my robe." },
    { id = "n_wr_gnome", cat = "class", when = { class = "WARRIOR", race = "Gnome" },
      text = "A gnome who chose the axe over the arcane? My colleagues in Tinker Town will think you've had a knock on the head, but I've seen what a gnome with a grudge can do with a sharp edge." },
  },
}

P:Pool {
  id = "war_trainer_rogue", role = "trainer", subtitle = "rogue trainer",
  notice = {
    { id = "n_wr_clank", cat = "class", when = { class = "WARRIOR" },
      text = "You clank. I heard you coming from the end of the street, and so did everyone else, so I've nothing to teach you that would survive the noise." },
    { id = "n_wr_plate", cat = "class", when = { class = "WARRIOR", minLevel = 40 },
      text = "That's a lot of plate to hide behind. You'd be surprised how many gaps there are in it, mind, and I could show you every one of them with a knife." },
  },
}

P:Pool {
  id = "war_trainer_hunter", role = "trainer", subtitle = "hunter trainer",
  notice = {
    { id = "n_wr_soldier", cat = "class", when = { class = "WARRIOR" },
      text = "You charge in like a boar at a fence, warrior. My beasts thank you for it, because it means the quarry looks at you and not at them." },
  },
}

P:Pool {
  id = "war_trainer_druid", role = "trainer", subtitle = "druid trainer",
  notice = {
    { id = "n_wr_soldier", cat = "class", when = { class = "WARRIOR" },
      text = "You carry a great deal of iron into a grove, warrior. The trees don't mind it so much, but I'd ask you not to swing it at anything that's still growing." },
    { id = "n_wr_tauren", cat = "class", when = { class = "WARRIOR", race = "Tauren" },
      text = "You chose the axe over the claw, young one, and the Earth Mother needs those who stand and fight as much as those who change their shape. Still, the bear would have suited you." },
  },
}

P:Pool {
  id = "war_trainer_shaman", role = "trainer", subtitle = "shaman trainer", faction = "Horde",
  notice = {
    { id = "n_wr_angry", cat = "aura", when = { class = "WARRIOR", aura = ANGRY },
      text = "Your rage burns like a grass fire, warrior, and the spirits of fire stir in their totems to watch it. Fire needs a hearth or it burns the whole house down." },
    { id = "n_wr_orc", cat = "class", when = { class = "WARRIOR", race = "Orc" },
      text = "Before the warlocks came, our warriors fought beside the shamans and listened to the elements. Thrall has brought that back, and I would have you remember it when your blood is up." },
  },
}

P:Pool {
  id = "war_trainer_warlock", role = "trainer", subtitle = "warlock trainer",
  notice = {
    { id = "n_wr_soldier", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. You'll be the one standing in front of my voidwalker, I suppose, taking the blows it was summoned to take. I'd tell you to let it, but your sort never does." },
  },
}
