-- Speaking your mind (0.82.0): views on factions, threats and places of the wider world (the
-- Explorers' League to the Deadmines, the Riverglades, Duskwood and Stormwind). Format: views.lua.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- The Explorers' League.
P:Views { topic = "explorers_league", views = {
  { id = "admire", text = "Digging up the titans' secrets is worthy work. I admire them for it.", fx = { align = { order = 1 }, opinion = { explorers_league = "admire" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Aye, so do I. Brann Bronzebeard's off somewhere with a map and a lamp right now, and the whole Hall waits on his letters.", fx = { affinity = 1 } },
    { id = "b", text = "Worthy and dangerous both, {class}. Ask anyone who's come back from Uldaman with fewer fingers than they took." },
  } },
  { id = "graverobbers", text = "Grave-robbers with a royal charter, if you ask me.", fx = { align = { order = -1 }, opinion = { explorers_league = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", when = { race = "Dwarf" }, text = "Mind your tongue about the League, {g:lad|lass}. Those 'graves' hold the story of where every dwarf came from.", fx = { affinity = -1 } },
    { id = "b", text = "There's some truth in that, I'll admit, because not every tomb the League has opened ought to have been opened." },
    { id = "c", when = { faction = "Horde" }, text = "That's how the Horde sees them, and the trolls of Stranglethorn too. They dig, and they never ask whose ground it is." , fx = { affinity = 1 } },
  } },
  { id = "join", text = "I'd sign on with them myself, given a good map.", fx = { opinion = { explorers_league = "admire" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "They'd have you, I think. The League's always short of folk who'll go down the hole first." },
    { id = "b", text = "Bring your own rope, then, because the League never has enough. Everyone in Ironforge knows that." },
  } },
} }

-- The Dragonmaw clan.
P:Views { topic = "dragonmaw", views = {
  { id = "shame", when = { faction = "Horde" }, text = "They chose chains and dragons over Thrall's freedom. A shame on every orc.", fx = { opinion = { dragonmaw = "hate" }, trait = { proud = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Strong words, and fair ones. Every Dragonmaw grunt is a reminder of what we were before the camps and the Warchief.", fx = { affinity = 1 } },
    { id = "b", text = "Shame, aye, but they're still orcs. The Warchief would rather see them freed of the old ways than buried." },
  } },
  { id = "drive", when = { faction = "Alliance" }, text = "Drive them out of the Wetlands and free those red dragons.", fx = { opinion = { dragonmaw = "hate" }, trait = { brave = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Easy to say in Menethil, harder at Grim Batol. Still, every Dragonmaw outpost burned is a road made safer.", fx = { affinity = 1 } },
    { id = "b", text = "Free the dragons, you say. I'd want to know what a free red dragon does with its first afternoon before I cheered." },
  } },
  { id = "respect", text = "Anyone who can bridle a dragon has my respect, whatever else they've done.", fx = { opinion = { dragonmaw = "respect" }, trait = { practical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Bridle is a kind word for it. They hold the dragons' young hostage, and that's the whole trick of it.", fx = { affinity = -1 } },
    { id = "b", text = "Respect it from a long way off, {class}. The sky over the Wetlands burns when they take wing." },
  } },
  { id = "fear", text = "I'd sooner not be under one of those dragons when it turns.", fx = { opinion = { dragonmaw = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Nor would I. Dun Algaz has been cut off from the south for months on end because of them." },
    { id = "b", text = "That's wise. The ones who made jokes about it are a lot quieter now, mostly because they're ash." },
  } },
} }

-- The Cenarion Circle.
P:Views { topic = "cenarion_circle", views = {
  { id = "elune", when = { race = "NightElf" }, text = "Malfurion's druids keep the old balance, and the world would be poorer without them.", fx = { opinion = { cenarion_circle = "admire" }, trait = { pious = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Ishnu-alah, and well said. They dream for all of us, even the ones who don't know it.", fx = { affinity = 1 } },
    { id = "b", text = "Poorer, aye, and louder too. Only a druid can sit still for a hundred years and call it work." },
  } },
  { id = "tauren", when = { race = "Tauren" }, text = "Our druids sit in Moonglade beside the kaldorei, and the Earth Mother smiles on it.", fx = { opinion = { cenarion_circle = "admire" }, trait = { kind = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "The Earth Mother does not care who holds the staff, only that the land is kept. Hamuul Runetotem showed the way.", fx = { affinity = 1 } },
    { id = "b", text = "She may smile, but plenty in the Horde scowl about it. Peace in Moonglade has never meant peace in Ashenvale." },
  } },
  { id = "trust", text = "Druids who welcome both Horde and Alliance. I trust that more than banners.", fx = { opinion = { cenarion_circle = "trust" }, trait = { kind = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "So do I, mostly. Nighthaven's the one place I've heard of where an orc and an elf can share a fire.", fx = { affinity = 1 } },
    { id = "b", text = "Trust them, by all means, but remember their first loyalty is to the trees, and trees don't take sides." },
  } },
  { id = "weeds", text = "They'd let a whole town starve to save one glade of weeds.", fx = { opinion = { cenarion_circle = "distrust" }, trait = { practical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "That's harsh, {class}, though the loggers in Ashenvale grumble the very same thing.", fx = { affinity = 1 } },
    { id = "b", text = "Weeds, you call them. Those druids held back the Legion once, so maybe let them keep their glades.", fx = { affinity = -1 } },
  } },
} }

-- The Wailing Caverns.
P:Views { topic = "wailing_caverns", views = {
  { id = "pity", text = "Naralex only wanted to heal the land. I pity him, trapped in that nightmare.", fx = { align = { light = 1 }, opinion = { wailing_caverns = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "So do I, for he had a good heart, and look where it led him and every disciple who followed him down there.", fx = { affinity = 1 } },
    { id = "b", text = "Pity him if you like, but his nightmare's spilling into the Barrens now. The raptors and the oases show it." },
  } },
  { id = "clear", text = "The Druids of the Fang need clearing out, and I'm the one to do it.", fx = { align = { light = -1 }, opinion = { wailing_caverns = "fight" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Go in numbers, then, and take a light. Those caves twist on themselves until you're lost in an hour." },
    { id = "b", when = { maxLevel = 15 }, text = "Keen's not enough, {class}; the Fang have eaten keener than you. Come back with a few more scars first." },
  } },
  { id = "creepy", text = "A cave that moans in its sleep. I'll keep to the open road, thanks.", fx = { opinion = { wailing_caverns = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Hah! Can't say I blame you. Even the kodo won't graze near the mouth of it." },
    { id = "b", text = "That's the wind through the rock, mostly. The other noise is what you ought to worry about." },
  } },
} }

-- The Steamwheedle Cartel.
P:Views { topic = "steamwheedle", views = {
  { id = "useful", text = "Neutral ports and fair dealing. The world needs a few goblins like that.", fx = { align = { honor = 1 }, opinion = { steamwheedle = "trust" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Fair's a big word for a goblin, but neutral they are. Booty Bay sells to both sides and hangs nobody for it.", fx = { affinity = 1 } },
    { id = "b", text = "Needs them, aye, and pays them for the privilege. Never forget who's counting the coin at the end." },
  } },
  { id = "crooks", text = "Polite pirates with ledgers. They'd sell my boots off my feet.", fx = { opinion = { steamwheedle = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "They would, and then sell you the socks to go with them. Still, they keep the bruisers in Gadgetzan honest enough." },
    { id = "b", text = "Polite's the part that matters. The Venture Company would just take the boots and leave you the feet, if you were lucky." },
  } },
  { id = "profit", text = "Wherever there's coin to be had, I'd rather be on their side.", fx = { align = { honor = -1 }, opinion = { steamwheedle = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "You sound like a goblin already, {class}. Gadgetzan's full of folk who thought so and ended up owing the Cartel." },
    { id = "b", text = "Their side's a ledger, and it only has one name at the top. Still, I can't fault the thinking." },
  } },
} }

-- The Bloodsail Buccaneers.
P:Views { topic = "bloodsail", views = {
  { id = "hang", text = "Pirates and murderers. String them up along Booty Bay's docks.", fx = { opinion = { bloodsail = "hate" }, trait = { stern = 1 }, align = { order = 2 } }, replies = {
    { id = "a", text = "Seahorn would buy you a drink for that, and he'd supply the rope as well. They've sunk too many of his ships.", fx = { affinity = 1 } },
    { id = "b", text = "All of them, you say? Plenty are press-ganged deckhands who'd swim off if they could." },
  } },
  { id = "freedom", text = "No king, no cartel, just the open sea. There's freedom in that.", fx = { opinion = { bloodsail = "admire" }, trait = { brave = 1 }, align = { order = -2 } }, replies = {
    { id = "a", text = "Freedom to cut throats, aye. Ask the sailors off the Southsea coast what the Bloodsail freed them of.", fx = { affinity = -1 } },
    { id = "b", text = "There is, until the first storm and the first mutiny. A pirate's freedom lasts about as long as his rum." },
  } },
  { id = "laugh", text = "Their admiral can't even keep his own hat on. I'm not worried.", fx = { opinion = { bloodsail = "scorn" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Maybe so, but a fool with cannons is still a fool with cannons. Mind the Wild Shore when you sail." },
    { id = "b", text = "Laugh all you like, {class}, but they've a whole fleet off Stranglethorn, and they don't miss often." },
  } },
} }

-- Colonel Kurzen's expedition.
P:Views { topic = "kurzen", views = {
  { id = "traitor", when = { faction = "Alliance" }, text = "He was sent to do Stormwind's work and turned on his own. A traitor.", fx = { opinion = { kurzen = "hate" }, trait = { stern = 1 }, align = { order = 2 } }, replies = {
    { id = "a", text = "That's how the rebels at the camp put it, and they earned the right to. He hunted his own men through that jungle.", fx = { affinity = 1 } },
    { id = "b", text = "Traitor, aye, but the jungle did something to him first. Ask Lieutenant Doren, if he'll talk." },
  } },
  { id = "jungle", text = "Something in that jungle broke him. I pity the man more than I hate him.", fx = { opinion = { kurzen = "pity" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "So do some of the men who served under him. They say he was a good officer once, and that's what makes it hard.", fx = { affinity = 1 } },
    { id = "b", text = "Pity's a luxury for folk who weren't strung up in his camp. Mind who you say it to near the Rebel Camp." },
  } },
  { id = "kill", text = "Mad dogs get put down, whoever their master was.", fx = { opinion = { kurzen = "hate" }, trait = { cruel = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Blunt, but there's no other end to it now. His men won't come home and they won't let anyone else alone." },
    { id = "b", text = "Hard words, {class}. Some of those 'dogs' were conscripts who followed orders and couldn't find the way out." },
  } },
} }

-- The Grimtotem clan.
P:Views { topic = "grimtotem", views = {
  { id = "redeemable", when = { race = "Tauren" }, text = "They are still our kin. Some day the herd may call them home.", fx = { opinion = { grimtotem = "redeemable" }, trait = { patient = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Cairne hopes for that, I think, and so I try to. The Earth Mother's patience is longer than ours.", fx = { affinity = 1 } },
    { id = "b", text = "Kin they are, but Magatha's kin, before anything else. Hope if you must, and keep your spear close while you do." },
  } },
  { id = "lost", text = "They hate every race but their own. They're lost, and they chose it.", fx = { opinion = { grimtotem = "lost" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Aye, they chose it, at Thousand Needles and Stonetalon both. Freewind Post sees what they do to travellers.", fx = { affinity = 1 } },
    { id = "b", text = "Lost is a heavy word for a whole clan. Their children didn't choose anything at all." },
  } },
  { id = "watch", text = "Magatha sits too close to Cairne for my liking.", fx = { opinion = { grimtotem = "distrust" }, trait = { cautious = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "You're not the only one who thinks so. Thunder Bluff has long ears, though, so say it softly there." },
    { id = "b", when = { faction = "Alliance" }, text = "Tauren politics are a long way from here, friend, but a schemer at a chieftain's elbow is never good news for anyone." },
  } },
  { id = "fight", text = "They want a fight, so I'll give them one.", fx = { opinion = { grimtotem = "hate" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Go to the Needles, then, and mind the cliffs. They know every ledge, and you don't." },
    { id = "b", text = "Bravely said. Bring friends, because a Grimtotem war party doesn't come in ones." },
  } },
} }

-- The Mirage Raceway.
P:Views { topic = "mirage_raceway", views = {
  { id = "fun", text = "Rockets on a salt flat is the best idea I've heard all week.", fx = { align = { order = -1 }, opinion = { mirage_raceway = "admire" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Ha! Then go and watch a race, and stand well back from the turns. The salt is full of bits of the last ones." },
    { id = "b", text = "Best idea, maybe, but second-worst result. Somebody explodes most weeks, and they call that a good crowd." },
  } },
  { id = "gnomes", text = "My coin's on the gnomes. Goblins build for speed, not for finishing.", fx = { opinion = { mirage_raceway = "gnomes" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Don't say that near Pozzik's crew. They'd race you to the edge of the Flats just to prove a point." },
    { id = "b", text = "The gnomes finish, aye, about an hour after everyone's gone home. Fizzle would say it's a question of tuning." },
  } },
  { id = "waste", text = "All that coin and engineering, burned for a bit of sport.", fx = { align = { order = 1 }, opinion = { mirage_raceway = "doubt" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "A bit of sport that pays better than most mines in Kalimdor. The betting alone keeps the Flats busy." },
    { id = "b", text = "Go and say so to a goblin with a winning ticket in his fist, and see how far you get." },
  } },
} }

-- The Burning Blade.
P:Views { topic = "burning_blade", views = {
  { id = "purge", when = { race = "Orc" }, text = "Demon worship is what chained us. Every cultist in Skull Rock must die.", fx = { opinion = { burning_blade = "hate" }, trait = { stern = 1 }, align = { light = 2 } }, replies = {
    { id = "a", text = "Lok'tar, and well said. We drank that blood once, and we know better than anyone what it costs.", fx = { affinity = 1 } },
    { id = "b", text = "Must, aye, and soon. They hide right under Orgrimmar's walls, as if to laugh at us." },
  } },
  { id = "hate", text = "Cultists with demon masters, right on the Horde's doorstep. Burn them out.", fx = { opinion = { burning_blade = "hate" }, trait = { brave = 1 }, align = { light = 1 } }, replies = {
    { id = "a", when = { faction = "Horde" }, text = "Orgnil Soulscar would agree with every word. The caves at Skull Rock have been a nest of them for too long.", fx = { affinity = 1 } },
    { id = "b", text = "Burn them out, and look under the ash, because they've a knack for crawling off to Ashenvale and Desolace." },
  } },
  { id = "power", text = "Fools, but they've power. You don't sneer at fel magic.", fx = { opinion = { burning_blade = "fear" }, trait = { cautious = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Sneer, no, but don't admire it either. That power owns the ones who reach for it, every time.", fx = { affinity = -1 } },
    { id = "b", when = { class = "WARLOCK" }, text = "Coming from someone with brimstone on their sleeves, I'll take that seriously. Just remember the difference between you and them is who holds the leash." },
  } },
} }

-- The Echo Isles.
P:Views { topic = "echo_isles", views = {
  { id = "home", when = { race = "Troll" }, text = "Those islands be our home, and we be takin' them back from Zalazane.", fx = { align = { honor = 1 }, opinion = { echo_isles = "home" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "That's the spirit. Vol'jin swore it, and the Darkspear don't forget an oath.", fx = { affinity = 1 } },
    { id = "b", text = "Some day, aye. Until then, Sen'jin Village keeps its fires lit where it can see the isles." },
  } },
  { id = "zalazane", text = "A witch doctor making slaves of his own tribe. I'd see Zalazane dead.", fx = { opinion = { echo_isles = "fight" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Many would, and Master Gadrin in Sen'jin Village first of all. Just watch for the hexed ones; they were Darkspear once.", fx = { affinity = 1 } },
    { id = "b", text = "Killing him's the easy part, if any of it's easy. Freeing the minds he's twisted is the long work." },
  } },
  { id = "pity", text = "The Darkspear lost their home twice, and that's hard on anyone.", fx = { align = { honor = -1 }, opinion = { echo_isles = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "They carry it with a laugh, which is more grace than I'd manage in their place, and Thrall's debt to them runs deep for good reason.", fx = { affinity = 1 } },
    { id = "b", text = "Hard, aye, but trolls are tougher than they look. Sen'jin Village is proof of that." },
  } },
} }

-- The Scarlet Crusade.
P:Views { topic = "scarlet_crusade", views = {
  { id = "forsaken", when = { race = "Scourge" }, text = "They burn the living for being ill and the dead for being free. Fanatics.", fx = { opinion = { scarlet_crusade = "hate" }, trait = { stern = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Fanatics, and fond of fire. The Dark Lady will see their Monastery quiet in time, and I mean to watch it happen.", fx = { affinity = 1 } },
    { id = "b", text = "They'd call us fanatics too, and burn us for the cheek of it. Their hatred is the one honest thing about them." },
  } },
  { id = "hate", when = { faction = "Horde" }, text = "They'd kill anyone not wearing red. They're no better than the Scourge.", fx = { opinion = { scarlet_crusade = "hate" }, trait = { brave = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Worse, in some ways, because the Scourge at least doesn't pray first. Tirisfal is full of their gibbets.", fx = { affinity = 1 } },
    { id = "b", text = "No better, and much better armed. Mind that when you go north past Brill." },
  } },
  { id = "understand", when = { faction = "Alliance" }, text = "They saw Lordaeron die. I understand the anger, even if they've gone too far.", fx = { opinion = { scarlet_crusade = "pity" }, trait = { kind = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Too far is putting it gently. Ask Raleigh the Devout what he saw at the Monastery before you understand them too much." },
    { id = "b", text = "Understand it, aye, but don't wear the tabard. They'd call you plagued for a cough, and they'd mean it." },
  } },
  { id = "zeal", text = "At least they never stopped fighting the Scourge, and that counts for something.", fx = { opinion = { scarlet_crusade = "respect" }, trait = { stern = 1 }, align = { order = 2 } }, replies = {
    { id = "a", when = { race = "Scourge" }, text = "It counts for a pyre with my name on it, {name}. Choose your admiration more carefully.", fx = { affinity = -1 } },
    { id = "b", text = "Something, aye, but they fight the innocent as gladly as the Scourge. The Argent Dawn does the job without the torches." },
    { id = "c", text = "It counts, I suppose, the way a fire counts as heating. They burn everything near them." },
  } },
  { id = "doubt", text = "Fanatics never last. They'll tear themselves apart within the year.", fx = { opinion = { scarlet_crusade = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Maybe, but they've held Hearthglen and the Monastery this long, and that's no small thing." },
    { id = "b", text = "From your lips to the Light's ears. I've heard their own officers whisper about Mograine and Whitemane." },
  } },
} }

-- The Scarlet Monastery.
P:Views { topic = "scarlet_monastery", views = {
  { id = "storm", text = "A fortress of zealots in the middle of Tirisfal needs storming.", fx = { align = { honor = 1 }, opinion = { scarlet_monastery = "fight" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Take a strong company, then. Those halls run deep, and every door has a fanatic behind it.", fx = { affinity = 1 } },
    { id = "b", when = { maxLevel = 25 }, text = "Storming, aye, but not by you yet. The Crusade's best wait in the cathedral, and they don't tire." },
  } },
  { id = "pity", text = "The saddest part is that it was a holy place once.", fx = { opinion = { scarlet_monastery = "pity" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "It was once, and it still has the bells and the coloured windows, so you'd almost believe it still, if it weren't for what's in the cellars.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Scourge" }, text = "Holy to whom, {name}? It was a Lordaeronian chapel, and Lordaeron is dead; I don't mourn its furniture." },
  } },
  { id = "loot", text = "Zealots always hoard the best arms. I'll take mine off their corpses.", fx = { align = { honor = -1 }, opinion = { scarlet_monastery = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Plenty have gone in thinking that, and some came back with fine blades. Some didn't come back at all." },
    { id = "b", text = "Ha! Well, they're certainly not spending it. Mind the armory; the guards there take it personally." },
  } },
} }

-- Raleigh the Devout.
P:Views { topic = "raleigh", views = {
  { id = "brave", text = "Walking away from the Crusade took more courage than staying.", fx = { opinion = { raleigh = "respect" }, trait = { honest = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "I think so too. He saw what they did in the cellars, and he couldn't pretend after that.", fx = { affinity = 1 } },
    { id = "b", text = "It did, and it costs him still. Plenty in Southshore call him a deserter behind his back." },
  } },
  { id = "deserter", text = "He swore an oath and broke it, so he's a deserter however he dresses it.", fx = { opinion = { raleigh = "distrust" }, trait = { stern = 1 }, align = { light = -1, order = 1 } }, replies = {
    { id = "a", text = "Some oaths ought to be broken, {class}. Torturing farmers for a cough was never part of his.", fx = { affinity = -1 } },
    { id = "b", text = "That's exactly what Brother Anton of the Crusade says, word for word. Mind whose sermon you're repeating." },
  } },
  { id = "late", text = "He left, but he wore the red for years first. Too late, I'd say.", fx = { opinion = { raleigh = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Late, maybe, but late's better than never. Most of them never leave at all." },
    { id = "b", text = "Too late for some, aye. He'd say so himself, if you caught him after his second drink." },
  } },
} }

-- Uldaman.
P:Views { topic = "uldaman", views = {
  { id = "wonder", text = "A titan vault under the Badlands. I'd give a lot to see inside.", fx = { align = { order = -1 }, opinion = { uldaman = "admire" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "So would Ironforge. Prospector Ryedol lost his whole dig team getting close, so bring friends.", fx = { affinity = 1 } },
    { id = "b", text = "You'd give a lot, and Uldaman would take it. The troggs and the Dark Irons both have their claws in it." },
  } },
  { id = "leave", text = "Some doors are sealed for a reason. Leave the titans' vault shut.", fx = { align = { order = 1 }, opinion = { uldaman = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Sensibly said, {class}. The troggs came out of somewhere, and I'd wager it was from down there." },
    { id = "b", when = { race = "Dwarf" }, text = "Shut? It's our own beginnings in that stone, {g:lad|lass}! No dwarf worth his beard would leave it.", fx = { affinity = -1 } },
  } },
  { id = "darkiron", text = "If the Dark Irons want it, someone had better get there first.", fx = { opinion = { uldaman = "race" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Aye, that's the size of it. Whatever's in Uldaman, a Dark Iron should never be the one holding it." },
    { id = "b", when = { faction = "Horde" }, text = "First, aye, and before the dwarves too. The Badlands aren't theirs, whatever their maps say." },
  } },
} }

-- The Argent Dawn.
P:Views { topic = "argent_dawn", views = {
  { id = "admire", text = "Horde and Alliance fighting the Scourge side by side is how it should be.", fx = { opinion = { argent_dawn = "admire" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Should be, aye, and so rarely is. Light's Hope Chapel may be the only place it is.", fx = { affinity = 1 } },
    { id = "b", text = "Lovely in a sermon, but try sharing a camp with someone whose kin killed yours. They manage it, mostly." },
  } },
  { id = "soft", text = "Too soft. They'd take a Forsaken's coin and call it fellowship.", fx = { opinion = { argent_dawn = "distrust" }, trait = { stern = 1 }, align = { light = -1 }, }, when = { faction = "Alliance" }, replies = {
    { id = "a", text = "Coin spends the same against the Scourge, whoever's purse it came from. That's their whole point." },
    { id = "b", text = "Soft, you say, with Scholomance and Stratholme on their doorstep. Go stand a watch in the Plaguelands and say that." , fx = { affinity = -1 } },
  } },
  { id = "doubt", when = { race = "Scourge" }, text = "They tolerate us for now. I don't expect the tolerance to last.", fx = { opinion = { argent_dawn = "doubt" }, trait = { skeptical = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Keep expecting it, {name}, and keep your hand near your blade. Still, they've kept their word so far." },
    { id = "b", text = "A fair suspicion. Most of them came out of the same Lordaeron that hanged our kind from the walls." },
  } },
  { id = "serve", text = "I'd stand a watch with them. The Scourge is everyone's enemy.", fx = { opinion = { argent_dawn = "trust" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Then go north to the Plaguelands, or see Gregor Greystone in Everlook. They're always short of blades.", fx = { affinity = 1 } },
    { id = "b", text = "Everyone's enemy, aye, and nobody's priority but their own, so good on you for paying them some mind." },
  } },
} }

-- The Venture Company.
P:Views { topic = "venture_company", views = {
  { id = "land", when = { race = "Tauren" }, text = "They tear at Mulgore's skin for oil and timber. The Earth Mother weeps.", fx = { opinion = { venture_company = "hate" }, trait = { pious = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "She does, and her children are angry. Mull Thunderhorn wants every Venture camp in the Barrens gone.", fx = { affinity = 1 } },
    { id = "b", text = "Weeps, aye, and then the braves ride out. The Venture men on the Red Rocks know it by now." },
  } },
  { id = "hate", text = "Goblin butchers who'd strip the world bare for a copper. I hate them.", fx = { opinion = { venture_company = "hate" }, trait = { stern = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "No argument from me. Stonetalon and Stranglethorn both look like a giant took bites out of them, all for Venture timber.", fx = { affinity = 1 } },
    { id = "b", text = "Even the Steamwheedle goblins sneer at them, and that's saying something. They're a different breed." },
  } },
  { id = "efficient", text = "Ruthless, but you have to admire how fast they work.", fx = { opinion = { venture_company = "profit" }, trait = { greedy = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Admire it from Booty Bay, then, and not from a stump in Stonetalon. They'd have you working for nothing.", fx = { affinity = -1 } },
    { id = "b", text = "Fast, aye, and nothing grows back behind them. That's a speed I'd sooner not admire." },
  } },
} }

-- Camping.
P:Views { topic = "camping", views = {
  { id = "love", text = "Give me a fire and stars over a feather bed any night.", fx = { align = { order = -1 }, opinion = { camping = "admire" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "You've never had rain in your boots at midnight, then. Still, a good fire does cure a lot.", fx = { affinity = 1 } },
    { id = "b", text = "Aye, until the wolves find your stars too. Keep the fire high and the sword closer." },
  } },
  { id = "inn", text = "I'll take a bed and a roof, thanks. The inns exist for a reason.", fx = { align = { order = 1 }, opinion = { camping = "doubt" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Can't argue with that. The trouble is that the inns stop where the interesting roads begin." },
    { id = "b", text = "Ha! There's a sensible soul, and innkeepers would like more of you about." },
  } },
  { id = "share", text = "A shared fire makes friends of strangers, and it's the best part of the road.", fx = { opinion = { camping = "admire" }, trait = { generous = 1 } }, replies = {
    { id = "a", text = "You'll hear better stories round that fire than in any tavern in the jungle, and if you bring something for the pot, you're welcome to sit.", fx = { affinity = 1 } },
    { id = "b", text = "Friends, or a knife in the night. Pick your fire carefully, and you'll mostly get the first." },
  } },
} }

-- Yenniku, son of Vol'jin.
P:Views { topic = "yenniku", views = {
  { id = "save", when = { faction = "Horde" }, text = "He's Vol'jin's blood. The Horde owes it to the Darkspear to bring him home.", fx = { opinion = { yenniku = "pity" }, trait = { kind = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "The Horde does owe it, and Nimboya at Grom'gol has taken a good many Gurubashi heads trying to pay that debt.", fx = { affinity = 1 } },
    { id = "b", text = "Owes it, aye, but the Gurubashi hold what they hold, and they don't sell it back cheap." },
  } },
  { id = "lost", text = "Giving a child away by custom is a cruel tradition.", fx = { opinion = { yenniku = "pity" }, trait = { honest = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", when = { race = "Troll" }, text = "It's old, older than both of us. Old and cruel walk together often, and this is no different." },
    { id = "b", text = "Cruel, aye. It was the price of peace with Zul'Gurub once, and now nobody remembers what it bought." },
  } },
  { id = "doubt", text = "After all this time among the Gurubashi, he may not want rescuing.", fx = { opinion = { yenniku = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "That's the fear nobody says out loud at Grom'gol. Don't say it near Kin'weelay, the Darkspear priest there, either." , fx = { affinity = -1 } },
    { id = "b", text = "A father has to look all the same, {class}, and you'd do no different if it were your own blood out there." },
  } },
} }

-- The Brotherhood of the Horse.
P:Views { topic = "brotherhood_horse", views = {
  { id = "admire", when = { faction = "Alliance" }, text = "Twenty years holding the line alone. Those riders are the best of Stormwind.", fx = { opinion = { brotherhood_horse = "admire" }, trait = { proud = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "The best of Stormwind, and the least thanked. Demar Brant would tell you the king forgot them long ago.", fx = { affinity = 1 } },
    { id = "b", text = "Lothar himself rode with them, you know. Not many orders can say that and still be in the saddle." },
  } },
  { id = "fools", when = { faction = "Alliance" }, text = "Stormwind gave that land up. They should come home before they all die.", fx = { opinion = { brotherhood_horse = "pity" }, trait = { practical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Say that at Farholde and you'll be riding out on foot. Sunnyglade was their home, and they mean to have it back.", fx = { affinity = -1 } },
    { id = "b", text = "Practical, maybe, but what home would they come back to? Their dead are buried in the Riverglades." },
  } },
  { id = "foes", when = { faction = "Horde" }, text = "Stubborn humans on horses, and stubborn foes are the ones worth fighting.", fx = { opinion = { brotherhood_horse = "respect" }, trait = { brave = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Worth fighting, aye, but there's sense in leaving them be while they're busy killing cultists for us.", fx = { affinity = 1 } },
    { id = "b", text = "Stubborn is right. They've sat on that island for twenty years and they've not blinked once." },
  } },
  { id = "relic", text = "An old knightly order, clinging to a war everyone else forgot.", fx = { opinion = { brotherhood_horse = "doubt" }, trait = { skeptical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Everyone else forgot it, but the Twilight's Hammer didn't. Someone has to remember." },
    { id = "b", text = "Clinging, aye, by their fingernails and their lances both. Still, you can't fault them for holding on." },
  } },
} }

-- The Siege of Farholde.
P:Views { topic = "siege_of_farholde", views = {
  { id = "honor", text = "Sir Howard's dawn charge saved that keep. The memorials are well earned.", fx = { opinion = { siege_of_farholde = "admire" }, trait = { proud = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "They are. Read Isolde's stone too; she died upright with the banner high, and Demar Brant, who leads the Brotherhood, wrote that one himself.", fx = { affinity = 1 } },
    { id = "b", text = "Earned with blood, and paid in names on stone. Every one of those riders had a family once." },
  } },
  { id = "waste", text = "All those brave dead, for an island nobody in Stormwind cares about.", fx = { opinion = { siege_of_farholde = "pity" }, trait = { honest = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Nobody in Stormwind, maybe. Everybody at Farholde cares, so mind how you say that inside the walls.", fx = { affinity = -1 } },
    { id = "b", text = "You're not wrong, and that's the bitter part. Stormwind judged the land lost long before the siege." },
  } },
  { id = "water", text = "They came by water while everyone watched the gate. Clever enemies, those.", fx = { opinion = { siege_of_farholde = "respect" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Clever, aye, and the ships were sabotaged before anyone knew it. The shore wall's been built twice as thick since." },
    { id = "b", text = "Clever's the worst kind of enemy. You can count brute ogres, but you can't guess what a thinking one will do." },
  } },
} }

-- Sunnyglade.
P:Views { topic = "sunnyglade", views = {
  { id = "retake", text = "It's Stormwind land. Someone should take it back from the cultists.", fx = { align = { order = 1 }, opinion = { sunnyglade = "fight" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Someone's been trying for twenty years, {class}. The Brotherhood would gladly have another sword." , fx = { affinity = 1 } },
    { id = "b", text = "Take it back, aye, and then hold it. That's the part that's beaten everyone so far." },
  } },
  { id = "tower", text = "Whatever's in that mage tower worries me more than any cultist.", fx = { opinion = { sunnyglade = "fear" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "It should. The orcs spared it on purpose in the First War, and now the Hammer's lit it again." },
    { id = "b", text = "Ashe Amberhall feels the same, and she'll tell you why at great length. Bring a chair." },
  } },
  { id = "mourn", text = "A whole town burned and its people marched off as slaves. Poor souls.", fx = { align = { order = -1 }, opinion = { sunnyglade = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Poor souls, aye. Some of their grandchildren still live at Farholde, and they haven't forgotten.", fx = { affinity = 1 } },
    { id = "b", text = "The First War did that to a lot of towns. Sunnyglade's just the one nobody came back for." },
  } },
} }

-- The Twilight's Hammer.
P:Views { topic = "twilights_hammer", views = {
  { id = "burn", text = "Light-forsaken cultists. I don't need to know their creed to know they burn.", fx = { opinion = { twilights_hammer = "hate" }, trait = { stern = 1 }, align = { light = 2 } }, replies = {
    { id = "a", text = "That's Demar Brant's view, near enough word for word. Most at Farholde share it.", fx = { affinity = 1 } },
    { id = "b", text = "Burn them, aye, but learn what they want first. Folk who die not knowing are the Hammer's favourite kind." },
  } },
  { id = "know", text = "What frightens me is not knowing what they're waiting for.", fx = { opinion = { twilights_hammer = "fear" }, trait = { curious = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "So would Ashe Amberhall at Farholde, and she reads their scraps by candlelight. Mind the trinkets, though; some are cursed." },
    { id = "b", text = "Curiosity is how they recruit, {class}. Ask too long and they'll start answering." , fx = { affinity = -1 } },
  } },
  { id = "fools", text = "Robed fools and hired ogres. They'll scatter at the first real charge.", fx = { opinion = { twilights_hammer = "scorn" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "They didn't scatter at Farholde. They nearly took it, and they did it from the water." },
    { id = "b", text = "The ogres might, now their chief Bolder'ok has gone over to the Horde. The robes are a harder sort." },
  } },
} }

-- Krol'dok.
P:Views { topic = "krol_dok", views = {
  { id = "storm", text = "Overlord Mugg and his ogres need putting down in their own caves.", fx = { opinion = { krol_dok = "fight" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Many have said so, and the scouts who went in to prove it mostly didn't come back. Go in force.", fx = { affinity = 1 } },
    { id = "b", text = "Their own caves are where they're strongest, {class}. Bring a key, a plan and four friends." },
  } },
  { id = "slaves", text = "There are prisoners in there, and they matter more than the ogres.", fx = { align = { light = 1 }, opinion = { krol_dok = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Aye, and one of the brutes is called the Slavecrusher, so you can guess what the prisoners are for.", fx = { affinity = 1 } },
    { id = "b", text = "That's exactly why the Brotherhood keeps sending scouts up there, whatever it costs them." },
  } },
  { id = "avoid", text = "Ogres in a fortress under a hill. I'll take my coin elsewhere.", fx = { align = { light = -1 }, opinion = { krol_dok = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "There's no shame in that, because the whole northwest of the Riverglades is ogre country now, and the ogres know it." },
    { id = "b", text = "Sensible, though the ogres won't stay in their hill forever, and they'll come out hungry." },
  } },
} }

-- Fern Crimsonleaf.
P:Views { topic = "fern_crimsonleaf", views = {
  { id = "alive", text = "Presumed dead isn't dead. A rogue that good could still be out there.", fx = { align = { order = -1 }, opinion = { fern_crimsonleaf = "hope" }, trait = { patient = 1 } }, replies = {
    { id = "a", text = "That's what Gray Dawnbright says, every night, into his cup. I'd like to believe him.", fx = { affinity = 1 } },
    { id = "b", text = "Careful, {class}. Hope like that can eat a soldier alive, and Farholde's buried enough already." },
  } },
  { id = "rest", text = "She died for that keep. Let her rest and honor the stone.", fx = { align = { order = 1 }, opinion = { fern_crimsonleaf = "respect" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Honor it, aye, and say her name now and then. That's what the stones are for.", fx = { affinity = 1 } },
    { id = "b", text = "Don't let Gray hear you say it. He'll argue, and then he'll drink, and then he'll argue some more." },
  } },
  { id = "shadow", text = "A knife in the dark for the Brotherhood. I'd have liked to meet her.", fx = { opinion = { fern_crimsonleaf = "admire" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "So would any rogue worth the name, I'd think, since they say she could vanish in a lit room with the door shut." },
    { id = "b", when = { class = "ROGUE" }, text = "You'd have learned a thing or two, I'd wager. The tales make her sound better than any I've seen." },
  } },
} }

-- Powderfuse Port.
P:Views { topic = "powderfuse_port", views = {
  { id = "like", text = "A neutral port, a boat to Tanaris and an inn. What more do I need?", fx = { align = { order = 1 }, opinion = { powderfuse_port = "admire" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "A bit less fish in the air, maybe. Zizplink calls it fresh, and he's being generous.", fx = { affinity = 1 } },
    { id = "b", text = "Not much more, aye. Everyone comes through by boat, and nobody asks too many questions." },
  } },
  { id = "melbin", text = "Melbin says he built the whole place on a vacant lot. I doubt it.", fx = { opinion = { powderfuse_port = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Ha! He tells it to everyone, and it gets bigger each time. Next year he'll have dug the sea as well." },
    { id = "b", text = "Doubt it quietly, then. It's his port, and he's very fond of reminding folk of it." },
  } },
  { id = "arena", text = "Once that arena opens, I'll be first in the ring.", fx = { align = { order = -1 }, opinion = { powderfuse_port = "fight" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "The goblin who runs it will want your name, then, and a fee to go with it. Nothing's free in a goblin town." },
    { id = "b", text = "First in the ring and first out on a stretcher, if the goblins have their way. They love a good crash." },
  } },
} }

-- SI:7.
P:Views { topic = "si7", views = {
  { id = "need", when = { faction = "Alliance" }, text = "Every kingdom needs its knives in the dark. Shaw keeps Stormwind safe.", fx = { opinion = { si7 = "trust" }, trait = { practical = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Safer, at least. The Defias would be in Old Town tonight if SI:7 weren't watching the canals.", fx = { affinity = 1 } },
    { id = "b", text = "Safe is a big word with the king gone missing. Still, I'd rather have them than not." },
  } },
  { id = "spies", when = { faction = "Alliance" }, text = "Spies who answer to nobody. I don't like secret police in my city.", fx = { opinion = { si7 = "distrust" }, trait = { honest = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Say it a little softer, {class}. You never know who's leaning on the wall behind you in Old Town." },
    { id = "b", text = "Nobody likes them until the night they need them. Then everyone's a great friend of SI:7." },
  } },
  { id = "enemy", when = { faction = "Horde" }, text = "Human spies. I'll be watching for them in the Barrens.", fx = { opinion = { si7 = "distrust" }, trait = { cautious = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Watch closely, then. A good one you'll never see, and a bad one has friends who'll come looking." },
    { id = "b", text = "Ratchet's full of strangers, and some of them are listening a little too closely. Keep your voice down there." },
  } },
  { id = "join", text = "I'd make a fine spy. I can keep a secret better than most.", fx = { opinion = { si7 = "admire" }, trait = { discreet = 1 } }, replies = {
    { id = "a", text = "You've just told a stranger you'd make a fine spy, which rather spoils the effect." },
    { id = "b", when = { class = "ROGUE" }, text = "Maybe so. They keep an eye on promising {class}s, and you'd not know until they knocked." },
  } },
} }

-- The Stonemasons' Guild.
P:Views { topic = "stonemasons", views = {
  { id = "wronged", text = "They rebuilt Stormwind and the nobles wouldn't pay them. Of course they rioted.", fx = { opinion = { stonemasons = "pity" }, trait = { honest = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Plenty agree with you, even in the city, though they only say so quietly.", fx = { affinity = 1 } },
    { id = "b", text = "Of course they did, and then a riot became the Defias, and now Westfall burns. Wronged men can do great wrong." },
  } },
  { id = "criminals", text = "Unpaid or not, they turned to murder. They're criminals now.", fx = { opinion = { stonemasons = "hate" }, trait = { stern = 1 }, align = { order = 2 } }, replies = {
    { id = "a", text = "The ones who followed VanCleef, aye. The ones who stayed and took honest work are another matter." },
    { id = "b", text = "That's a Stockade guard's answer. You'd not be wrong, but you'd not be the whole truth either." },
  } },
  { id = "nobles", text = "Blame the nobles who kept the coin, not the men who laid the stones.", fx = { opinion = { stonemasons = "pity" }, trait = { kind = 1 }, align = { order = -2 } }, replies = {
    { id = "a", when = { faction = "Alliance" }, text = "Careful near the keep with that. Some of those nobles still sit in council, and they've long memories.", fx = { affinity = 1 } },
    { id = "b", text = "Both, I'd say. A wrong done to you doesn't let you rob a whole province in return." },
  } },
  { id = "walls", text = "Whatever came after, they built a fine city. I'll give them that.", fx = { opinion = { stonemasons = "respect" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Fine walls, aye, built well and built twice. Baros Alexston, the city architect, still walks the walls checking their work." },
    { id = "b", text = "They built every stone of it, and every stone was a debt that nobody paid, which is why some folk call the city Stormwind's prettiest grudge." },
  } },
} }

-- The Stockade.
P:Views { topic = "the_stockade", views = {
  { id = "order", text = "Criminals belong behind bars. The Stockade does its job.", fx = { opinion = { the_stockade = "trust" }, trait = { stern = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "When the bars hold, aye. The prisoners have taken the place over, so the job's half done at best." },
    { id = "b", text = "It does, mostly, for the poor ones. The rich ones never seem to arrive at all." },
  } },
  { id = "riot", text = "A prison run by its own prisoners. Stormwind should be ashamed.", fx = { opinion = { the_stockade = "scorn" }, trait = { witty = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Warden Thelwater is, I'd guess, though he'd never say it. Bazil Thredd, the Defias ringleader, runs those halls now.", fx = { affinity = 1 } },
    { id = "b", text = "Ashamed, aye, but busy too. With the king gone, nobody's got guards to spare for a riot underground." },
  } },
  { id = "go", text = "If the riot needs ending, I'll go down there myself.", fx = { opinion = { the_stockade = "fight" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "The Warden would be glad of you. Take friends, because the prisoners have taken the guards' swords." },
    { id = "b", when = { maxLevel = 20 }, text = "Not yet, {class}. Those cells hold Defias with nothing left to lose, and they fight like it." },
  } },
} }

-- The Valley of Heroes.
P:Views { topic = "valley_of_heroes", views = {
  { id = "proud", text = "Lothar and the Alliance's heroes in stone at the gate stir the blood.", fx = { align = { order = 1 }, opinion = { valley_of_heroes = "admire" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "It's meant to, and it works. Every recruit straightens up walking past Lothar's statue.", fx = { affinity = 1 } },
    { id = "b", text = "It does, though the heroes themselves would rather we remembered why they fought than how they looked." },
  } },
  { id = "statues", text = "Statues are cheap. I'd rather they'd paid the stonemasons.", fx = { align = { order = -1 }, opinion = { valley_of_heroes = "scorn" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Don't say that in front of General Marcus Jonathan. He takes his statues very seriously." },
    { id = "b", text = "Cheap, you say. I've a feeling the masons who carved them would argue the price." },
  } },
  { id = "foe", when = { faction = "Horde" }, text = "Statues of men who fought orcs. I'd like to see Stormwind's gate myself.", fx = { opinion = { valley_of_heroes = "fight" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Many have said so, and the city guard is very large. Still, Lothar's dead, and dead men don't swing swords." },
    { id = "b", text = "Seeing it is easy enough; leaving again is the hard part. Bring an army, not just a grudge." },
  } },
} }

-- Heroes' Vigil.
P:Views { topic = "heroes_vigil", views = {
  { id = "insult", text = "Rogue mages squatting on a war memorial is an insult to the dead.", fx = { align = { honor = 1 }, opinion = { heroes_vigil = "hate" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Marshal Dughan knows it as well as you do, and the Stone of Remembrance deserves better company than it's been getting.", fx = { affinity = 1 } },
    { id = "b", text = "An insult, aye, and a danger. Their fires burn the wrong colour at night." },
  } },
  { id = "visit", text = "I'd like to stand at that stone and read the names someday.", fx = { opinion = { heroes_vigil = "respect" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "Clear the island first, or you'll be reading them by mage-fire. Then go, and take your time.", fx = { affinity = 1 } },
    { id = "b", text = "Good. Too few in Elwynn remember what the First War cost, and the stone remembers for them." },
  } },
  { id = "past", text = "The First War's long over. A stone in a lake won't help the living.", fx = { align = { honor = -1 }, opinion = { heroes_vigil = "doubt" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "It helps some of them, {class}. Old soldiers still row out there to stand quiet for a bit.", fx = { affinity = -1 } },
    { id = "b", text = "Long over for you, maybe. Elwynn's still full of people who lost everyone in it." },
  } },
} }

-- The Brotherhood of Northshire.
P:Views { topic = "brotherhood_northshire", views = {
  { id = "good", text = "Quiet monks training new recruits. The Abbey does good, honest work.", fx = { align = { light = 1 }, opinion = { brotherhood_northshire = "trust" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Brother Sammuel has turned out more good soldiers than any drill yard in Stormwind, and he's done it with a smile and a sore throat.", fx = { affinity = 1 } },
    { id = "b", text = "Honest and patient, aye. They need to be, with farmhands who've never held a sword before." },
  } },
  { id = "pray", text = "Prayer and porridge won't stop the kobolds or the Defias.", fx = { align = { light = -1 }, opinion = { brotherhood_northshire = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "No, but the folk they train will, and most of the soldiers in Goldshire started at that Abbey." },
    { id = "b", when = { class = { "PALADIN", "PRIEST" } }, text = "That's a strange thing to hear from your sort. The Light is not porridge, {class}.", fx = { affinity = -1 } },
  } },
  { id = "home", text = "That Abbey was the first place that took me in. I won't forget it.", when = { faction = "Alliance" }, fx = { opinion = { brotherhood_northshire = "admire" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "Nor should you. The brothers remember their recruits too, and they pray for the ones who never write.", fx = { affinity = 1 } },
    { id = "b", text = "Plenty say that. It's a good place to start out from, and a good place to come back to." },
  } },
} }

-- Morbent Fel.
P:Views { topic = "morbent_fel", views = {
  { id = "kill", text = "A necromancer buying Darkshire's dead. He needs killing, and soon.", fx = { opinion = { morbent_fel = "hate" }, trait = { brave = 1 }, align = { light = 2 } }, replies = {
    { id = "a", text = "Sven Yorgen would hand you the axe himself. He's watched that house above Raven Hill for months.", fx = { affinity = 1 } },
    { id = "b", text = "Soon, aye, and carefully. Steel doesn't trouble a man like that without a blessing on it." },
  } },
  { id = "curious", text = "Raising the dead is a craft like any other. I'd like to know how.", fx = { opinion = { morbent_fel = "curious" }, trait = { curious = 1 }, align = { light = -2 } }, replies = {
    { id = "a", text = "Keep that thought out of Darkshire, {class}. The Night Watch hangs men for less.", fx = { affinity = -1 } },
    { id = "b", when = { race = "Scourge" }, text = "You of all of us know what it costs the dead, {name}. Morbent doesn't ask them first." },
  } },
  { id = "fear", text = "Anyone who sits on a hill pulling the dead's strings frightens me.", fx = { opinion = { morbent_fel = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Good. Fear keeps you away from Raven Hill at night, which is when he works." },
    { id = "b", text = "He frightens all of Darkshire, and the council's letters to Stormwind haven't helped one bit." },
  } },
} }

-- The Embalmer.
P:Views { topic = "embalmer", views = {
  { id = "pity", text = "He loved his wife too much to let her go, which is sad, not evil.", fx = { opinion = { embalmer = "pity" }, trait = { kind = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Sad, aye, until the thing he stitched together walks into Darkshire. Then it's both.", fx = { affinity = -1 } },
    { id = "b", text = "That's how the nannies tell it, and maybe they're right, because love has never been much good at knowing when to stop." },
  } },
  { id = "abomination", text = "Whatever he made walks the road now, and it has to be destroyed.", fx = { opinion = { embalmer = "hate" }, trait = { stern = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Aye, and the Night Watch will need every hand when it comes. They say it's huge and stinks of the grave.", fx = { affinity = 1 } },
    { id = "b", text = "Destroyed, and then buried deep, so nobody gets ideas. Duskwood's had enough grieving husbands." },
  } },
  { id = "story", text = "It's a nursery tale. I don't believe in nursery tales.", fx = { opinion = { embalmer = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Neither did Lord Ebonlocke, until this month. Walk the Raven Hill road after dark and tell me again." },
    { id = "b", text = "Nor do I, mostly, but Duskwood has a way of making the stories true." },
  } },
} }

-- The Dark Riders.
P:Views { topic = "dark_riders", views = {
  { id = "hunt", text = "Riders who burn farms and vanish into Deadwind. I'd hunt them down.", fx = { align = { order = 1 }, opinion = { dark_riders = "hate" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Many have tried, and Deadwind Pass swallowed them. Go with friends and come back before dark.", fx = { affinity = 1 } },
    { id = "b", text = "Hunting them's one thing, and finding them is another. They ride where the road ends." },
  } },
  { id = "fear", text = "What bothers me is that nobody knows what they really are.", fx = { opinion = { dark_riders = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "It bothers all of Darkshire. Even the fortune-teller's cards go black when she asks about them." },
    { id = "b", text = "Some say they're Morbent's work and some say worse. Nobody's caught one to ask." },
  } },
  { id = "stormwind", text = "Eleven reports and no soldiers. Stormwind has abandoned Duskwood.", fx = { align = { order = -1 }, opinion = { dark_riders = "distrust" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Lord Ebonlocke has copies of every one of those letters, and he'll show you them if you ask.", fx = { affinity = 1 } },
    { id = "b", text = "Abandoned's a strong word, but I can't think of a better one. The Night Watch does what it can." },
  } },
} }

-- Raven Hill.
P:Views { topic = "raven_hill", views = {
  { id = "sad", text = "A whole village turned into a graveyard. Those poor people.", fx = { opinion = { raven_hill = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Poor people, aye, and they don't stay buried. That's the worst part of it.", fx = { affinity = 1 } },
    { id = "b", text = "Duskwood's full of places like it now. Raven Hill's just the one that's hardest to forget." },
  } },
  { id = "clear", text = "The dead there need putting back in the ground. I can do that.", fx = { align = { honor = 1 }, opinion = { raven_hill = "fight" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "The Night Watch would be grateful. Go by day if you can, and stay clear of the crypt." },
    { id = "b", text = "They'll get up again unless Morbent Fel goes down first. Keep that in mind." },
  } },
  { id = "avoid", text = "I'll take the long way round, thanks.", fx = { align = { honor = -1 }, opinion = { raven_hill = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Most do, and most live longer for it. There's no long way round Duskwood, though." },
    { id = "b", text = "Ha! That's wise of you, because even the ravens look nervous on that road after dark." },
  } },
} }

-- The Deadmines.
P:Views { topic = "deadmines", views = {
  { id = "end", text = "VanCleef's down there with a ship and an army. Someone has to end it.", fx = { opinion = { deadmines = "fight" }, trait = { brave = 1 }, align = { order = 2 } }, replies = {
    { id = "a", text = "Someone does, and Gryan Stoutmantle at Sentinel Hill has been waiting for that someone. Go and see him.", fx = { affinity = 1 } },
    { id = "b", when = { maxLevel = 15 }, text = "End it, aye, but grow a little first. The Defias down there are the hard core, not farmhands." },
  } },
  { id = "cause", text = "VanCleef was cheated. I can't blame him for everything that followed.", fx = { opinion = { deadmines = "pity" }, trait = { honest = 1 }, align = { order = -2 } }, replies = {
    { id = "a", text = "Cheated, aye, but Westfall's farmers never cheated him. They're the ones he's robbing now.", fx = { affinity = -1 } },
    { id = "b", text = "Not everything, maybe, but most of it. Ask any farmer near Moonbrook who did the burning." },
  } },
  { id = "loot", text = "A secret shipyard full of stolen gold. I'd like a look at that.", fx = { opinion = { deadmines = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Ha! You and every sell-sword in Westfall. Stolen gold has a way of getting you killed, mind." },
    { id = "b", text = "There's goblin work in there too, by all accounts. Bring a strong stomach and stronger friends." },
  } },
} }
