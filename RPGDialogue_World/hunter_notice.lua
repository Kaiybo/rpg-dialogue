-- The hunter patch (0.94.0): what people notice about a hunter's beast, aspects, bow and quiver.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Notice-only pools: they stack onto the role pools (pools.lua, pools_roles.lua) and
-- never replace them. Aura ids: Aspect of the Hawk 13165/14318-14322/25296, Monkey 13163,
-- Cheetah 5118, Pack 13159, Wild 20043/20190, Beast 13161, Trueshot Aura 19506/20905/20906,
-- Rapid Fire 3045, Feign Death 5384, Eagle Eye 6197.
-- Items: Rhok'delar 18713, Ancient Sinew Wrapped Lamina 18714, Striker's Mark 17069.
-- Unsure: Ashjre'thul 19361, Blastershot Launcher 9492, the Beaststalker set 16674-16681,
-- several quiver and pouch ids below, and whether `carrying` (GetItemCount) sees a quiver
-- worn in a bag slot rather than one sitting inside a bag.

local HAWK = { 13165, 14318, 14319, 14320, 14321, 14322, 25296 }
local MONKEY = { 13163 }
local CHEETAH = { 5118 }
local PACK = { 13159 }
local WILD = { 20043, 20190 }
local BEASTASPECT = { 13161 }
local TRUESHOT = { 19506, 20905, 20906 }
local RAPID = { 3045 }
local FEIGN = { 5384 }
local EAGLE = { 6197 }

local RHOKDELAR = { 18713 }
local LAMINA = { 18714 }
local STRIKER = { 17069 }
local ASHJRETHUL = { 19361 }   -- unsure
local BLASTERSHOT = { 9492 }   -- unsure
-- Beaststalker's Tunic/Boots/Gloves/Cap/Pants/Mantle/Belt/Bindings (unsure of the exact run).
local BEASTSTALKER = { 16674, 16675, 16676, 16677, 16678, 16679, 16680, 16681 }
-- Light Quiver, Small Ammo Pouch, Small Quiver, Small Shot Pouch, Light Leather Quiver,
-- Small Leather Ammo Pouch, Heavy Leather Ammo Pouch, Heavy Quiver, Quickdraw Quiver,
-- Thick Leather Ammo Pouch, Ribbly's Quiver, Ribbly's Bandolier, Medium Quiver,
-- Medium Shot Pouch, the Lamina (several of these ids are unsure).
local QUIVER = { 2101, 2102, 5439, 5441, 7278, 7279, 3604, 3605, 8217, 8218, 2662, 2663, 11362, 11363, 18714 }
-- Rough/Sharp/Razor/Jagged/Thorium Headed/Ice Threaded arrows; Light/Heavy/Solid shot,
-- Accurate Slugs, Thorium Shells.
local AMMO = { 2512, 2515, 3030, 11285, 18042, 19316, 2516, 2519, 3033, 11284, 15997 }

local BEAST = { type = "Beast" }
local CAT = { family = "Cat" }
local WOLF = { family = "Wolf" }
local BOAR = { family = "Boar" }
local BEAR = { family = "Bear" }
local RAPTOR = { family = "Raptor" }
local OWL = { family = "Owl" }
local BAT = { family = "Bat" }
local CRAB = { family = "Crab" }
local CROC = { family = "Crocolisk" }
local GORILLA = { family = "Gorilla" }
local HYENA = { family = "Hyena" }
local SCORPID = { family = "Scorpid" }
local SPIDER = { family = "Spider" }
local STRIDER = { family = "Tallstrider" }
local TURTLE = { family = "Turtle" }
local SERPENT = { family = "Wind Serpent" }
local CARRION = { family = "Carrion Bird" }
local BIRDS = { family = { "Owl", "Carrion Bird", "Bat" } }
local CREEPY = { family = { "Spider", "Scorpid" } }


---------------------------------------------------------------------------
-- Guards
---------------------------------------------------------------------------
P:Pool {
  id = "hun_guard_alliance", role = "guard", faction = "Alliance",
  notice = {
    { id = "n_hn_elf_darn", cat = "class", when = { class = "HUNTER", race = "NightElf", zone = { "Darnassus", "Teldrassil" } },
      text = "Ishnu-alah, hunter. The Sentinels speak well of those who walk the woods with a beast at their side, so long as you remember whose woods they are." },
    { id = "n_hn_dwarf_if", cat = "class", when = { class = "HUNTER", race = "Dwarf", zone = { "Ironforge", "Dun Morogh" } },
      text = "Another mountaineer with a rifle and a beast, by the look of ye. Keep the gun shouldered inside the city, {g:lad|lass}, for the echo in the Commons sets every guard reaching for his axe." },
    { id = "n_hn_pet_city", cat = "pet", when = { pet = BEAST, capital = true },
      text = "Keep {pet} on a short lead while you're inside the walls, if you please. The last hunter who didn't let his beast chase a merchant's cat clean across the trade district." },
    { id = "n_hn_bear", cat = "pet", when = { pet = BEAR },
      text = "That's a bear at your heel, and a grown one at that. I'll take your word it's tame, hunter, but I'll keep my spear handy all the same." },
    { id = "n_hn_spider", cat = "pet", when = { pet = CREEPY },
      text = "I'd thank you to keep that crawling thing away from the gate. Half the watch has nightmares about Duskwood as it is, and it's not helping." },
    { id = "n_hn_nopet", cat = "pet", when = { class = "HUNTER", minLevel = 12, pet = false },
      text = "A hunter without a beast? You've either left it at the stables or lost it in the wilds, and I hope for your sake it's the first." },
    { id = "n_hn_cheetah", cat = "aura", when = { aura = CHEETAH },
      text = "Slow down on the main road, hunter. You came past my post like a hare with a hound on its tail, and the carters are complaining." },
    { id = "n_hn_feign", cat = "aura", when = { aura = FEIGN },
      text = "You're lying on the cobbles like a dead thing, and a woman's just run off to fetch a priest. Get up before she comes back with one." },
    { id = "n_hn_rhok", cat = "gear", when = { equipped = RHOKDELAR },
      text = "That bow's carved from living ancient's wood, or my eyes deceive me. I've heard the kaldorei whisper of it, but I never thought I'd see one carried past my post." },
    { id = "n_hn_rank", cat = "pvp", when = { class = "HUNTER", pvpRank = { min = 6 } },
      text = "The lads back from the front speak of you, {rank}. They say the Horde can't cross open ground without one of your arrows finding them, and your beast finding whatever's left." },
  },
  react = {
    { id = "r_hn_pet", on = "pet", when = { pet = BEAST, capital = true },
      text = "Hold there! Is that beast yours? Then keep it out of the market and off my boots." },
    { id = "r_hn_feign", on = "aura", when = { aura = FEIGN },
      text = "Light's mercy, you've dropped dead! Oh, you're breathing. Don't do that to a guard, hunter." },
  },
}

P:Pool {
  id = "hun_guard_horde", role = "guard", faction = "Horde",
  notice = {
    { id = "n_hn_orc", cat = "class", when = { class = "HUNTER", race = "Orc", zone = { "Orgrimmar", "Durotar" } },
      text = "An orc hunter with a beast at heel, as in the old days before the demon blood. The Valley of Honor keeps your trainers; go and show them what the Durotar wilds have made of you." },
    { id = "n_hn_troll", cat = "class", when = { class = "HUNTER", race = "Troll" },
      text = "A Darkspear hunter, with a beast that grins near as wide as you do. Vol'jin's people never needed a city to hunt in, mon, but you're welcome in this one." },
    { id = "n_hn_tauren", cat = "class", when = { class = "HUNTER", race = "Tauren", zone = { "Thunder Bluff", "Mulgore" } },
      text = "The braves on the lift saw your beast come up beside you and said nothing, which is a tauren's way of saying well done. Hunt well on the plains, hunter." },
    { id = "n_hn_forsaken", cat = "class", when = { class = "HUNTER", race = "Scourge", pet = BEAST },
      text = "A beast that walks beside the dead and doesn't bolt. Most animals won't come near the Undercity, so whatever you did to that one, it was clever." },
    { id = "n_hn_wolf", cat = "pet", when = { pet = WOLF, race = "Orc" },
      text = "An orc with a wolf at his side. My grandfather rode one at Blackrock Spire before the Horde fell, and he'd have liked the look of yours." },
    { id = "n_hn_pet_city", cat = "pet", when = { pet = BEAST, capital = true },
      text = "Keep your beast off the goblin stalls, hunter. The last one that ate a merchant's sausages cost its master a week's wages and a very long argument." },
    { id = "n_hn_nopet", cat = "pet", when = { class = "HUNTER", minLevel = 12, pet = false },
      text = "Where's your beast, hunter? A hunter walking alone looks like a grunt who forgot his axe." },
    { id = "n_hn_feign", cat = "aura", when = { aura = FEIGN },
      text = "You're lying in the dust like a dead peon, and nobody's falling for it, hunter. Get up, before someone loots your boots." },
    { id = "n_hn_hawk", cat = "aura", when = { aura = HAWK, class = "HUNTER" },
      text = "Your eyes have that hawk's look in them, as though you're picking which of us to put an arrow in first. Pick the Alliance, hunter, and leave my gate alone." },
    { id = "n_hn_rank", cat = "pvp", when = { class = "HUNTER", pvpRank = { min = 6 } },
      text = "The grunts back from the front speak of you, {rank}. They say you can drop an Alliance rider from the far side of a valley, and that your beast eats what's left." },
  },
  react = {
    { id = "r_hn_feign", on = "aura", when = { aura = FEIGN },
      text = "Ha! Dead as a stone, and then you blink. Save that trick for the Alliance, hunter." },
    { id = "r_hn_pet", on = "pet", when = { pet = BEAST, capital = true },
      text = "Keep that beast close, hunter. This city's busy enough without your animal deciding who's supper." },
  },
}

---------------------------------------------------------------------------
-- Townsfolk
---------------------------------------------------------------------------
P:Pool {
  id = "hun_citizen_alliance", role = "citizen", faction = "Alliance",
  notice = {
    { id = "n_hn_cat", cat = "pet", when = { pet = CAT },
      text = "What a beautiful cat you've got there, and so big! Does {pet} purr, or would it rather have my hand off? I'll not try to find out." },
    { id = "n_hn_wolf", cat = "pet", when = { pet = WOLF },
      text = "Is that a wolf? A real one, from the forest? My husband lost three sheep to wolves last winter, so forgive me if I don't come any closer." },
    { id = "n_hn_boar", cat = "pet", when = { pet = BOAR },
      text = "You've a boar on a lead in the middle of town. My mother would ask how it's going to taste, but I can see by your face you'd not thank her for it." },
    { id = "n_hn_bear", cat = "pet", when = { pet = BEAR },
      text = "There's a bear following you down the street, and you've not even noticed! Oh, it's yours. That's a relief, I suppose, if a small one." },
    { id = "n_hn_owl", cat = "pet", when = { pet = OWL },
      text = "Your owl keeps turning its head right round to stare at me, and it's very unsettling. Does it ever blink, or does it just watch?" },
    { id = "n_hn_spider", cat = "pet", when = { pet = SPIDER },
      text = "That spider's bigger than my dog! Please tell me it's yours, and please tell me it doesn't like the dark under people's beds." },
    { id = "n_hn_elf", cat = "class", when = { class = "HUNTER", race = "NightElf", ["not"] = { zone = { "Darnassus", "Teldrassil" } } },
      text = "You're one of the night elves, aren't you, with a beast and a bow like the stories say. Is it true your people can talk to animals, or is that just what they tell children?" },
    { id = "n_hn_dwarf", cat = "class", when = { class = "HUNTER", race = "Dwarf" },
      text = "I heard your rifle go off outside the town an hour ago, and the whole bakery jumped. Was that you, or is there another dwarf out there shooting at the pheasants?" },
    { id = "n_hn_cheetah", cat = "aura", when = { aura = CHEETAH },
      text = "You went by so fast my washing blew off the line! Where are you running to in such a hurry, hunter?" },
    { id = "n_hn_noammo", cat = "gear", when = { class = "HUNTER", minLevel = 10, ["not"] = { carrying = AMMO } },
      text = "Your quiver's empty, you know, or your pouch, whichever it is. My cousin's a hunter and he says running out of arrows is how a hunter ends up as supper." },
  },
}

P:Pool {
  id = "hun_citizen_horde", role = "citizen", faction = "Horde",
  notice = {
    { id = "n_hn_wolf", cat = "pet", when = { pet = WOLF },
      text = "A fine wolf, with good teeth and a thick coat. The Frostwolves would say a hunter's wolf is a brother, and I think yours would agree." },
    { id = "n_hn_raptor", cat = "pet", when = { pet = RAPTOR },
      text = "A raptor, and it's watching my children like they're dinner. Keep it close, hunter, because I've seen what they do to a kodo calf in the Barrens." },
    { id = "n_hn_strider", cat = "pet", when = { pet = STRIDER },
      text = "A plainstrider! My little ones chase them across the grass and never catch them. Does yours peck at you when it's hungry?" },
    { id = "n_hn_hyena", cat = "pet", when = { pet = HYENA },
      text = "That hyena's laughing at me, hunter. Hyenas always laugh just before they bite, my father used to say, so tell it I'm not food." },
    { id = "n_hn_serpent", cat = "pet", when = { pet = SERPENT },
      text = "A wind serpent at your side, crackling like a storm. Even the wind riders give those a wide berth up on the cliffs, and here you are walking one through town." },
    { id = "n_hn_tauren", cat = "class", when = { class = "HUNTER", race = "Tauren", zone = "Thunder Bluff" },
      text = "You walk with a beast the way the old hunters of the plains did, little one, side by side and never in front. The Earth Mother sees it, and she's pleased." },
    { id = "n_hn_forsaken", cat = "class", when = { class = "HUNTER", race = "Scourge", zone = { "Undercity", "Tirisfal Glades" } },
      text = "You keep a living beast, among all this rot. I'd have thought it would sicken of the smell, but it seems it's fonder of you than most of the living ever were." },
    { id = "n_hn_cheetah", cat = "aura", when = { aura = CHEETAH },
      text = "You run like a plains cat with its tail on fire, hunter. Is something chasing you, or are you chasing something?" },
  },
}

---------------------------------------------------------------------------
-- Innkeepers, vendors, gunsmiths and bowyers, blacksmiths
---------------------------------------------------------------------------
P:Pool {
  id = "hun_innkeeper", role = "innkeeper",
  notice = {
    { id = "n_hn_pet", cat = "pet", when = { pet = BEAST },
      text = "Your beast can sleep by the fire if it likes, so long as it doesn't shed on the cushions or eat my cat. I've lost one cat to a hunter's wolf already, and I'll not lose another." },
    { id = "n_hn_boar", cat = "pet", when = { pet = BOAR },
      text = "You'll forgive me, but I've a boar on the spit in the kitchen and another one standing in my common room. Keep yours out of the kitchen, or it'll take it personally." },
    { id = "n_hn_bear", cat = "pet", when = { pet = BEAR },
      text = "That bear's sniffing at the honey jars on my shelf. I'll give it a scrape of the comb on a plate if you'll promise it won't help itself to the rest." },
    { id = "n_hn_bat", cat = "pet", when = { pet = BAT },
      text = "A bat? Indoors? It'll be up in my rafters all night, and the guests will think the place has gone to rot. Keep it on your shoulder, if you please." },
    { id = "n_hn_dwarf", cat = "class", when = { class = "HUNTER", race = "Dwarf", zone = { "Ironforge", "Dun Morogh", "Loch Modan" } },
      text = "Ye'll be wanting a stout and a bowl of something for the beast, I'd wager. Leave the rifle unloaded at the table, {g:lad|lass}, for the last mountaineer who didn't put a hole in my ceiling." },
    { id = "n_hn_resting", cat = "pet", when = { class = "HUNTER", resting = true, pet = BEAST },
      text = "If you're stopping the night, feed that beast before you feed yourself. A hungry animal in a room upstairs is the worst alarm a tavern ever had." },
  },
  react = {
    { id = "r_hn_pet", on = "pet", when = { pet = BEAST },
      text = "Oh! And where did that come from? Wipe its paws at the door, if it has paws, and keep it off the tables." },
  },
}

P:Pool {
  id = "hun_vendor", role = "vendor",
  notice = {
    { id = "n_hn_pet", cat = "pet", when = { pet = BEAST },
      text = "Your beast's eyeing my dried meat like it's already paid for it. I'll sell you a bag for it, if you like, and you'll both be happier." },
    { id = "n_hn_noammo", cat = "gear", when = { class = "HUNTER", minLevel = 10, ["not"] = { carrying = AMMO } },
      text = "You've not a single arrow or shot on you, hunter, and that's a dangerous way to leave town. If I don't sell them, the next shop along will." },
    { id = "n_hn_rhok", cat = "gear", when = { equipped = RHOKDELAR },
      text = "That bow's never come off any merchant's shelf, and I'd not know what to charge if it did. Keep it close in the crowds, friend." },
    { id = "n_hn_monkey", cat = "aura", when = { aura = MONKEY, class = "HUNTER" },
      text = "You keep ducking and twitching like someone's about to throw something at you. Nobody's going to rob you in my shop, hunter, so you can stand still." },
  },
}

P:Pool {
  id = "hun_vendor_ranged", role = "vendor", subtitle = { "gunsmith", "bowyer", "bow merchant", "guns", "bows", "fletcher" },
  notice = {
    { id = "n_hn_class", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! You'll be my best customer this week, I can tell, because your sort go through arrows like a dwarf goes through ale." },
    { id = "n_hn_noammo", cat = "gear", when = { class = "HUNTER", minLevel = 10, ["not"] = { carrying = AMMO } },
      text = "Out of ammunition entirely? Then you've come to the right counter, and none too soon, because a hunter with an empty quiver is just someone holding a stick." },
    { id = "n_hn_dwarf", cat = "class", when = { class = "HUNTER", race = "Dwarf" },
      text = "Ah, a dwarf with a rifle on {g:his|her} back, and I'd guess {g:he|she}'s come to tell me my barrels are too short. Go on, then, everyone else does." },
    { id = "n_hn_elf", cat = "class", when = { class = "HUNTER", race = "NightElf" },
      text = "A kaldorei hunter in a gun shop, or a bow shop, which is it today? Your people string a better bow than anyone, so I'll not pretend I can teach you about the wood." },
    { id = "n_hn_striker", cat = "gear", when = { equipped = STRIKER },
      text = "That's a raider's bow from deep under Blackrock, and the string's still warm from the fires down there. I'd not sell it if I had it, and I'd not ask what you fought to get it." },
    { id = "n_hn_ashjre", cat = "gear", when = { equipped = ASHJRETHUL },
      text = "That crossbow's been in a dragon's lair, by the soot on the stock and the shine on the bolts. I've built crossbows my whole life, and I've never built one like that." },
    { id = "n_hn_blaster", cat = "gear", when = { equipped = BLASTERSHOT },
      text = "Is that a gnomish launcher? It's held together with more hope than rivets, and I'd stand well back if you're thinking of firing it in here." },
    { id = "n_hn_rhok", cat = "gear", when = { equipped = RHOKDELAR },
      text = "That bow is grown, not made, and there's no fletcher alive who could copy it. I'll string arrows for you all day if you'll let me look at it for a minute." },
    { id = "n_hn_lamina", cat = "gear", when = { carrying = LAMINA },
      text = "That quiver's wrapped in dragon sinew, unless I've lost my eye. The arrows fly out of a thing like that faster than you can think to reach for them." },
  },
}

P:Pool {
  id = "hun_blacksmith", role = "blacksmith",
  notice = {
    { id = "n_hn_mail", cat = "gear", when = { class = "HUNTER", minLevel = 40, maxLevel = 45 },
      text = "You've taken to mail at last, hunter, and you're walking like a tinker's cart. It'll stop bothering you in a week, and then the first arrow that bounces off you will make it worth the weight." },
    { id = "n_hn_beaststalker", cat = "gear", when = { equipped = BEASTSTALKER },
      text = "That's Beaststalker mail you're wearing, or part of it, and it's been out in some ugly places. Leave it with me and I'll get the scorch marks out of the links, at least." },
    { id = "n_hn_rifle", cat = "class", when = { class = "HUNTER", race = { "Dwarf", "Gnome" } },
      text = "Bring that rifle by when you've a minute and I'll look at the barrel. A mountaineer's gun wants cleaning more often than its owner thinks, and I can smell the fouling from here." },
    { id = "n_hn_pet", cat = "pet", when = { pet = BEAST },
      text = "Keep your beast away from the quench trough; the last one drank half of it and spent the afternoon sneezing soot. And keep its tail off the coals, while you're at it." },
  },
}

---------------------------------------------------------------------------
-- Flight masters
---------------------------------------------------------------------------
P:Pool {
  id = "hun_flightmaster_alliance", role = "flightmaster", faction = "Alliance",
  notice = {
    { id = "n_hn_pet", cat = "pet", when = { pet = BEAST },
      text = "Your beast can't come up on the gryphon with you, hunter, so dismiss it before you climb on. The birds take a fox in their talons for less, and they'd take yours too." },
    { id = "n_hn_owl", cat = "pet", when = { pet = BIRDS },
      text = "Keep that bird well clear of my gryphons, if you please. They see anything with feathers as either a rival or a meal, and they've not decided which yours is." },
    { id = "n_hn_elf", cat = "class", when = { class = "HUNTER", race = "NightElf" },
      text = "The hippogryphs settle when a kaldorei hunter walks up to them, did you know that? They know a gentle hand when they smell one." },
  },
  react = {
    { id = "r_hn_pet", on = "pet", when = { pet = BEAST },
      text = "No, no, put that away! The birds are all looking at it, and I'll be an hour calming the roost." },
  },
}

P:Pool {
  id = "hun_flightmaster_horde", role = "flightmaster", faction = "Horde",
  notice = {
    { id = "n_hn_pet", cat = "pet", when = { pet = BEAST },
      text = "Your beast stays on the ground, hunter, because wind riders don't share their backs. Send it home before you climb up, or it'll be running after you across the Barrens." },
    { id = "n_hn_serpent", cat = "pet", when = { pet = SERPENT },
      text = "A wind serpent, and the wind riders hate them, so keep it away from the perches. They fight over the same sky, those two, and neither one ever forgets it." },
    { id = "n_hn_carrion", cat = "pet", when = { pet = CARRION },
      text = "Keep that vulture of yours away from my beasts, because they think it's waiting for one of them to die. To be fair to them, it probably is." },
  },
  react = {
    { id = "r_hn_pet", on = "pet", when = { pet = BEAST },
      text = "Easy! The wind riders have caught the smell of your beast, and now they're all snapping at the air." },
  },
}

---------------------------------------------------------------------------
-- Stable masters: they know beasts
---------------------------------------------------------------------------
P:Pool {
  id = "hun_stablemaster", role = "stablemaster",
  notice = {
    { id = "n_hn_nopet", cat = "pet", when = { class = "HUNTER", minLevel = 10, pet = false },
      text = "No beast with you today, hunter? If you've stabled one with me, it's been fed and brushed and it's sulking, the way they do when you go off without them." },
    { id = "n_hn_cat", cat = "pet", when = { pet = CAT },
      text = "That's a good cat, with clean paws and a quick eye. Cats sulk if you stable them too long and forgive you the moment you come back with fish, so bring fish." },
    { id = "n_hn_wolf", cat = "pet", when = { pet = WOLF },
      text = "A wolf wants to run with someone, hunter, and when you stable it, it howls for you half the night. I don't mind, but the other beasts complain." },
    { id = "n_hn_boar", cat = "pet", when = { pet = BOAR },
      text = "A boar will eat anything you put in front of it and half of what you don't, so it's an easy beast to keep. Mind it on the stairs, though, because it'll charge straight down them." },
    { id = "n_hn_bear", cat = "pet", when = { pet = BEAR },
      text = "Bears are the gentlest guests I have, so long as they're fed, and they'll eat fish, bread, fruit, anything. Your bear will outlast every other beast in a fight, and it'll sleep through every night in my stable." },
    { id = "n_hn_raptor", cat = "pet", when = { pet = RAPTOR },
      text = "Raptors are clever, too clever, and yours has been watching me open the stall latches. I'll need to tie a knot in it next time you leave it here." },
    { id = "n_hn_owl", cat = "pet", when = { pet = OWL },
      text = "An owl's a fine choice for a hunter who likes to hit things from far off, because its screech takes the fight out of anything nearby. Feed it raw meat, never bread, and it'll keep watch while you sleep." },
    { id = "n_hn_bat", cat = "pet", when = { pet = BAT },
      text = "A bat eats fruit and mushrooms, would you believe it, though it looks like it ought to drink blood. Yours looks underfed to me, so try a few apples." },
    { id = "n_hn_crab", cat = "pet", when = { pet = CRAB },
      text = "A crab! You're a patient one, hunter, because crabs are slow and stubborn and very, very hard to kill. It'll hold the line long after a cat would've run." },
    { id = "n_hn_croc", cat = "pet", when = { pet = CROC },
      text = "A crocolisk in my stable will empty the water troughs and stare at the other beasts all night. Yours has a fine thick hide, though, and it'll take a beating for you." },
    { id = "n_hn_gorilla", cat = "pet", when = { pet = GORILLA },
      text = "A gorilla! That came out of Stranglethorn, I'll wager, and it beats its chest every time the gate creaks. Feed it bananas and fungus and it'll stamp the ground hard enough to knock a raptor flat." },
    { id = "n_hn_hyena", cat = "pet", when = { pet = HYENA },
      text = "Hyenas will eat fruit as happily as meat, which surprises most people. Yours laughed at me the moment I opened the gate, so I'll take that as a compliment." },
    { id = "n_hn_scorpid", cat = "pet", when = { pet = SCORPID },
      text = "A scorpid has a tail full of poison and no friends in my stable, so I keep it in the stone pen at the back. It'll take blows that would split a lesser beast, and it never complains." },
    { id = "n_hn_spider", cat = "pet", when = { pet = SPIDER },
      text = "Spiders are quiet guests and they keep the flies down, but the stable boy won't go near it. You'll have to feed it yourself, I'm afraid." },
    { id = "n_hn_strider", cat = "pet", when = { pet = STRIDER },
      text = "A tallstrider will eat cheese and fruit and nothing else, and it'll peck your ear if you get the meal wrong. Yours looks well fed, so you've learned that already." },
    { id = "n_hn_turtle", cat = "pet", when = { pet = TURTLE },
      text = "A turtle, of all things! It'll pull itself into its shell and let a whole war go past it, and you'll be the only one in the fight still smiling." },
    { id = "n_hn_serpent", cat = "pet", when = { pet = SERPENT },
      text = "A wind serpent will spit lightning when it's cross, and it's cross whenever I stable it. Feed it bread and cheese and fish, and it might stop sparking at the hay." },
    { id = "n_hn_carrion", cat = "pet", when = { pet = CARRION },
      text = "A carrion bird eats whatever's been dead longest, and yours has opinions about my scraps. It's a loyal thing under the ugly, though, I'll grant it that." },
    { id = "n_hn_forsaken", cat = "pet", when = { class = "HUNTER", race = "Scourge", pet = BEAST },
      text = "Your beast doesn't mind the smell of the grave on you, which is more than I can say for my horses. You've earned that one's trust the hard way, hunter." },
    { id = "n_hn_elf", cat = "class", when = { class = "HUNTER", race = "NightElf", pet = CAT },
      text = "A kaldorei with a great cat at heel, as natural as the moon rising. The Sentinels' sabers are bred from cubs, but yours came to you wild, and that's the better bond." },
    { id = "n_hn_level60", cat = "pet", when = { class = "HUNTER", minLevel = 60, pet = BEAST },
      text = "{pet} carries scars from places I've only heard of in songs, and still comes when you call. That's loyalty, hunter, the real kind, and not every beast learns it." },
  },
  react = {
    { id = "r_hn_pet", on = "pet", when = { pet = BEAST },
      text = "There's {pet}! Come here and let me look at your teeth. Good, good, and your coat's shining." },
    { id = "r_hn_feign", on = "aura", when = { aura = FEIGN },
      text = "Up you get, hunter. Your beast's not fooled and neither am I, so stop scaring the foals." },
  },
}

P:Pool {
  id = "hun_pet_trainer", role = "trainer", subtitle = "pet trainer",
  notice = {
    { id = "n_hn_nopet", cat = "pet", when = { class = "HUNTER", pet = false },
      text = "You've come to a pet trainer without a pet, hunter. Call your beast in, and then we'll see what I can teach it." },
    { id = "n_hn_wolf", cat = "pet", when = { pet = WOLF },
      text = "A wolf takes to Growl the way a dwarf takes to ale. I can teach yours to stand its ground, and it'll thank you for it." },
    { id = "n_hn_boar", cat = "pet", when = { pet = BOAR },
      text = "A boar needs very little teaching to stand in front of you, because it's been doing it since the day it was born. I'll teach it to shrug off a little fire, at least." },
  },
}

---------------------------------------------------------------------------
-- Children: they love the pet
---------------------------------------------------------------------------
P:Pool {
  id = "hun_child", role = "child",
  notice = {
    { id = "n_hn_pet", cat = "pet", when = { pet = BEAST },
      text = "Is that your animal? Does it have a name? Can I pet it? I'll be ever so gentle, I promise, and I'll not pull its tail." },
    { id = "n_hn_cat", cat = "pet", when = { pet = CAT },
      text = "Your kitty's enormous, the biggest one I've ever seen! Does {pet} sleep on your bed? Mine sleeps on mine, but mine's only little and it doesn't bite much." },
    { id = "n_hn_wolf", cat = "pet", when = { pet = WOLF },
      text = "A wolf! My mum says wolves eat children, but yours is wagging its tail at me, so I think she was just trying to make me come home on time." },
    { id = "n_hn_bear", cat = "pet", when = { pet = BEAR },
      text = "A real bear! Can I ride on him? Just round the fountain once, I'll hold on tight, I promise." },
    { id = "n_hn_boar", cat = "pet", when = { pet = BOAR },
      text = "Your piggy's got tusks! Does it like mud? I like mud too, but I'm not supposed to get it on my good clothes." },
    { id = "n_hn_owl", cat = "pet", when = { pet = OWL },
      text = "Your owl turned its head all the way round! Can it do it the other way? Make it do it again, please!" },
    { id = "n_hn_spider", cat = "pet", when = { pet = SPIDER },
      text = "Ewww, a spider! A big one! Does it make webs, and can I see? My sister would scream so loud if I put it in her room." },
    { id = "n_hn_turtle", cat = "pet", when = { pet = TURTLE },
      text = "A turtle! Is it very old? My grandpa says turtles live for a hundred years, but he says that about lots of things." },
    { id = "n_hn_raptor", cat = "pet", when = { pet = RAPTOR },
      text = "Your lizard's got so many teeth! Does it eat people? Just bad people, I hope, and not children." },
    { id = "n_hn_nopet", cat = "pet", when = { class = "HUNTER", minLevel = 10, pet = false },
      text = "Where's your animal? Hunters always have an animal. Did you lose it? I can help you look, I'm good at finding things." },
    { id = "n_hn_cheetah", cat = "aura", when = { aura = CHEETAH },
      text = "You were running so fast I couldn't even see your feet! Can you teach me? I want to beat my brother to the well every single day." },
  },
  react = {
    { id = "r_hn_pet", on = "pet", when = { pet = BEAST },
      text = "It came out of nowhere! Is it yours? Can I keep it? No? Can I just hold it, then?" },
    { id = "r_hn_feign", on = "aura", when = { aura = FEIGN },
      text = "You fell over and died! No you didn't, you're peeking, I saw you! Do it again!" },
    { id = "r_hn_cheetah", on = "aura", when = { aura = CHEETAH },
      text = "Your feet went all fast! Race me to the fountain, and no cheating with your magic!" },
  },
}

---------------------------------------------------------------------------
-- The spirit healer
---------------------------------------------------------------------------
P:Pool {
  id = "hun_spirithealer", role = "spirithealer",
  notice = {
    { id = "n_hn_waited", cat = "death", place = "before", when = { class = "HUNTER", minLevel = 10 },
      text = "Your companion lay down beside your body and would not leave it, even when the others came. Beasts do not know this place, hunter, but they know when one of their own has gone somewhere they cannot follow." },
    { id = "n_hn_feign", cat = "death", place = "after", when = { class = "HUNTER", minLevel = 30, deaths = { min = 10 } },
      text = "You have pretended to die so often that I half expected you to sit up and walk away from me as well. This time it was not pretence, I am afraid, though you may still take it back." },
    { id = "n_hn_many", cat = "death", place = "after", when = { class = "HUNTER", deaths = { min = 40 } },
      text = "You come here often enough that your beast has learned the road to your body better than you have. It is waiting there now, as it always does." },
    { id = "n_hn_forsaken", cat = "death", place = "after", when = { class = "HUNTER", race = "Scourge" },
      text = "Your beast never minded that you were already dead, and it does not mind that you are dead again. Few of the living would be so forgiving." },
    { id = "n_hn_elf", cat = "death", place = "after", when = { class = "HUNTER", race = "NightElf" },
      text = "You are kaldorei, and you will find your way back faster than most, for the wisp form remembers the forest. Your companion is waiting where you fell." },
  },
}

---------------------------------------------------------------------------
-- Trainers of other classes, looking at a hunter
---------------------------------------------------------------------------
P:Pool {
  id = "hun_trainer_druid", role = "trainer", subtitle = "druid trainer",
  notice = {
    { id = "n_hn_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You walk beside the beast, and I walk inside it. Both of us honour the wild in our way, hunter, though I've always wondered whether your companion would rather be free." },
    { id = "n_hn_elf", cat = "class", when = { class = "HUNTER", race = "NightElf" },
      text = "Shan'do Stormrage taught that every creature has its place in the balance, and you've chosen to share yours with one. Treat it as an equal, and Cenarius will smile on you both." },
    { id = "n_hn_tauren", cat = "class", when = { class = "HUNTER", race = "Tauren" },
      text = "You chose the bow over the claw, young one, and the Earth Mother needs both. Still, ask your beast one day what it would say to a hunter who could become a bear." },
    { id = "n_hn_cat", cat = "pet", when = { pet = CAT },
      text = "Your cat looks at me oddly, as if it can smell the form I wear when I hunt. It knows I'm half its kind, and it doesn't quite approve." },
    { id = "n_hn_bear", cat = "pet", when = { pet = BEAR },
      text = "A bear at your side, and one sitting in front of you, if you count me on a bad morning. Feed it well, hunter; bears forgive almost anything but an empty belly." },
  },
  react = {
    { id = "r_hn_pet", on = "pet", when = { pet = BEAST },
      text = "Ah, there it is. Come here, little one, and let me hear what you think of your hunter." },
  },
}

P:Pool {
  id = "hun_trainer_priest", role = "trainer", subtitle = "priest trainer",
  notice = {
    { id = "n_hn_hunter", cat = "class", when = { class = "HUNTER" },
      text = "I can mend your wounds, hunter, but please don't bring your beast to me for healing. You have Mend Pet for that, and my acolytes are still finding fur in the vestry." },
    { id = "n_hn_feign", cat = "aura", when = { aura = FEIGN },
      text = "You're lying in the chapel as still as the dead, and one of my acolytes has already begun the rites. Do get up, for his sake." },
  },
}

P:Pool {
  id = "hun_trainer_paladin", role = "trainer", subtitle = "paladin trainer", faction = "Alliance",
  notice = {
    { id = "n_hn_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter in the Light's hall, with a beast that's leaving prints on the floor. You're welcome here, but the beast stays by the door." },
    { id = "n_hn_dwarf", cat = "class", when = { class = "HUNTER", race = "Dwarf" },
      text = "A dwarf with a rifle instead of a hammer and the Light. I'll not lecture ye, {g:lad|lass}, for the mountaineers held Dun Morogh when the rest of us were fighting elsewhere." },
  },
}

P:Pool {
  id = "hun_trainer_warrior", role = "trainer", subtitle = "warrior trainer",
  notice = {
    { id = "n_hn_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You stand at the back and let your beast take the blows meant for you. It's clever, I'll grant you, but one day the beast won't be there, and you'll have to learn to hold a line yourself." },
    { id = "n_hn_bear", cat = "pet", when = { pet = { family = { "Bear", "Boar", "Turtle" } } },
      text = "That beast of yours can hold something's eye better than half the recruits I've trained this year. I'd give a lot for a squad with its nerve." },
  },
}

P:Pool {
  id = "hun_trainer_rogue", role = "trainer", subtitle = "rogue trainer",
  notice = {
    { id = "n_hn_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Your beast just sniffed me out from behind the curtain, hunter, which is more than most guards manage. I'd thank you to keep it out of my lessons." },
    { id = "n_hn_feign", cat = "aura", when = { aura = FEIGN },
      text = "Playing dead, are we? Not bad, but you're breathing too loud. Come back when you can do it while someone's going through your pockets." },
  },
}

P:Pool {
  id = "hun_trainer_mage", role = "trainer", subtitle = "mage trainer",
  notice = {
    { id = "n_hn_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, and your beast is sniffing at my reagent shelves. I've polymorphed better-behaved animals than that, so do keep it close." },
    { id = "n_hn_owl", cat = "pet", when = { pet = OWL },
      text = "An owl? Ah, the old wizards of Dalaran kept them, you know, though I think theirs were better read. Yours seems to be judging me." },
  },
}

P:Pool {
  id = "hun_trainer_shaman", role = "trainer", subtitle = "shaman trainer", faction = "Horde",
  notice = {
    { id = "n_hn_hunter", cat = "class", when = { class = "HUNTER" },
      text = "The spirits of the wild walk with you, hunter, in the shape of that beast. Listen to it as I listen to the elements, and you'll never be lost." },
    { id = "n_hn_serpent", cat = "pet", when = { pet = SERPENT },
      text = "Your serpent carries a spark of the air spirits inside it; I can feel it pulling at my totems. Treat it with respect, and it'll treat the storm the same way." },
  },
}

P:Pool {
  id = "hun_trainer_warlock", role = "trainer", subtitle = "warlock trainer",
  notice = {
    { id = "n_hn_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You keep a beast and feed it and call that a bond. I keep a demon and call it what it is, and I sleep better than you'd think." },
  },
}

---------------------------------------------------------------------------
-- Hunter trainers: aspects, auras, gear and the beast
---------------------------------------------------------------------------
P:Pool {
  id = "hun_trainer_hunter", role = "trainer", subtitle = "hunter trainer",
  notice = {
    { id = "n_hn_hawk", cat = "aura", when = { class = "HUNTER", aura = HAWK },
      text = "You're wearing the Aspect of the Hawk even here, where there's nothing to shoot. Good habit; the hunter who has to remember it never has it up when it counts." },
    { id = "n_hn_monkey", cat = "aura", when = { class = "HUNTER", aura = MONKEY },
      text = "Monkey's aspect, is it? You'll dodge a blow or two with it, but if something's close enough to hit you, you've already made a mistake." },
    { id = "n_hn_cheetah", cat = "aura", when = { class = "HUNTER", aura = CHEETAH },
      text = "Drop the Cheetah's aspect before you go into a fight, hunter. The first blow will daze you, and then you'll be crawling while your beast does all the work." },
    { id = "n_hn_pack", cat = "aura", when = { class = "HUNTER", aura = PACK },
      text = "You've the whole pack running with the Cheetah's speed, and it'll get you all killed if something leaps out of the grass. Use it on the road, never near the fight." },
    { id = "n_hn_wild", cat = "aura", when = { class = "HUNTER", aura = WILD },
      text = "The Aspect of the Wild, and I can feel the green of it from here. You'll want that in the places where the land itself fights back." },
    { id = "n_hn_beast", cat = "aura", when = { class = "HUNTER", aura = BEASTASPECT },
      text = "You've the Aspect of the Beast on you, so the wild things can't see you coming. Mind you don't let it make you lazy about the wind." },
    { id = "n_hn_trueshot", cat = "aura", when = { class = "HUNTER", aura = TRUESHOT },
      text = "Trueshot Aura, and everybody standing near you is holding their weapons a little steadier for it. That's the mark of a marksman who's learned to share." },
    { id = "n_hn_eagle", cat = "aura", when = { aura = EAGLE },
      text = "You've gone glassy-eyed, so I'll guess you're looking at something a mile off. Come back to us, hunter; I'm right here." },
    { id = "n_hn_rapid", cat = "aura", when = { aura = RAPID },
      text = "Rapid Fire in my training yard? Put the bow down before you put an arrow through my best dummy, hunter." },
    { id = "n_hn_rhok", cat = "gear", when = { equipped = RHOKDELAR },
      text = "Rhok'delar. Hastat gave you that, and you passed his trials alone with only your beast beside you. I'm not too proud to say I'm envious." },
    { id = "n_hn_beaststalker", cat = "gear", when = { equipped = BEASTSTALKER },
      text = "Beaststalker mail. You've been down into the Spire and through the Scholomance for that, and it shows in the way you carry yourself." },
    { id = "n_hn_noammo", cat = "gear", when = { class = "HUNTER", minLevel = 10, ["not"] = { carrying = AMMO } },
      text = "You're carrying a bow with nothing to put in it, hunter. Go and buy arrows before you go anywhere else, because I'll not have it said I trained someone who forgot them." },
    { id = "n_hn_quiver", cat = "gear", when = { class = "HUNTER", minLevel = 10, ["not"] = { carrying = QUIVER } },
      text = "No quiver on you, or any pouch for shot either. You'll shoot faster with one, and you'll stop losing arrows in the bottom of your pack." },
    { id = "n_hn_lamina", cat = "gear", when = { carrying = LAMINA },
      text = "That's the Lamina, wrapped in the sinew of a great blue dragon. I'd wondered who would be mad enough to bring Azuregos down for it." },
  },
  react = {
    { id = "r_hn_hawk", on = "aura", when = { aura = HAWK },
      text = "There's the hawk in your eye. Now hold that look when there's something real at the end of your arrow." },
    { id = "r_hn_feign", on = "aura", when = { aura = FEIGN },
      text = "Too slow, hunter! You dropped like a sack of flour, and anything with a brain would have seen you coming down." },
    { id = "r_hn_pet", on = "pet", when = { pet = BEAST },
      text = "Ah, here's {pet}. Let me look at you both together; that's how I can tell how well you're working." },
  },
}
