-- Origin letters for dwarves: one from home early on, one after a fitting milestone.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Miner's child from the Ironforge deeps
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_ironforge_miner_1", from = "Hilda Coalbrow", stranger = true, delay = 1200,
  when = { origin = "dwarf_ironforge_miner", minLevel = 6 },
  subject = "From the deep shafts",
  body = "My {g:lad|lass},\n\nYour father came up from the twelfth shaft last night with coal in his beard and asked where you'd got to, as if he hadn't stood at the gate and watched you go. He misses you and won't say it, so I'm saying it for him.\n\nThe seam under the Commons has gone thin, and the foreman's got us all on half shifts until the surveyors find a better one. Old Durn lost a toe to a dropped cart, but he's cheerful about it and says he never liked that toe anyway.\n\nMind the sky up there, because it goes on forever and there's nothing to stop a fall but the ground. Eat something hot every day and write to your mother.\n\nWith love from the deeps,\nYour mum, Hilda Coalbrow",
}

P:Letter {
  id = "origin_dwarf_ironforge_miner_2", from = "Torbin Coalbrow", stranger = true, delay = 2400,
  when = { origin = "dwarf_ironforge_miner", minLevel = 30 },
  subject = "A word from your father",
  body = "{name},\n\nYour mother says I'm to write you a proper letter, so here it is, though I've never been one for ink.\n\nThe lads on my shift hear tales of you from travellers at the Stonefire Tavern, and every time they do, they slap my back like I've struck mithril. I tell them you got your nerve from your mother and your stubbornness from me, and nobody argues with either half.\n\nI'll own I wanted you down the shafts beside me, with a pick and a lamp and a decent wage. But a {class} who's seen half of Azeroth is no bad thing to have in the family, and I'm prouder than I let on at the gate.\n\nKeep your head down where the roof's low, and keep it up everywhere else.\n\nYour father, Torbin Coalbrow",
}

---------------------------------------------------------------------------
-- Apprentice of the Explorers' League
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_explorers_league_1", from = "Senior Cataloguer Bramwell Dustbeard", stranger = true, delay = 1200,
  when = { origin = "dwarf_explorers_league", minLevel = 6 },
  subject = "Your desk in the Hall",
  body = "Apprentice {name},\n\nI am writing to inform you that your desk in the Hall of Explorers has been given to a young fellow from Thelsamar who labels his finds correctly the first time. I mention it only so you won't be surprised when you come back and find your inkpot gone.\n\nThe Hall is much as you left it. Someone dropped a troll idol on my foot last week, the mammoth skeleton has lost another rib to a careless broom, and every second visitor still asks whether Brann Bronzebeard is coming home soon. I tell them he writes when he pleases, which is seldom.\n\nKeep a field journal, and mind you date every page. Half the League's troubles come from explorers who trusted their memory.\n\nRegards,\nBramwell Dustbeard, Senior Cataloguer",
}

P:Letter {
  id = "origin_dwarf_explorers_league_2", from = "Senior Cataloguer Bramwell Dustbeard", stranger = true, delay = 2400,
  when = { origin = "dwarf_explorers_league", cleared = "Uldaman" },
  subject = "Regarding Uldaman",
  body = "{name},\n\nThe reports from the Badlands reached the Hall this morning, and I confess I read them twice before I believed them. You went into Uldaman, past the Stonevault troggs and the Dark Irons digging where they had no right to, and you came out again with your wits intact.\n\nI have spent forty years cataloguing things other dwarves found, and I have never once held a pick in a titan vault. I find I am not jealous so much as glad, and a little ashamed of what I said about your labelling.\n\nWhatever you saw in that hall of stone keepers, write it down while it's fresh. The Hall will want every word of it, and so, I admit, do I.\n\nWith genuine respect,\nBramwell Dustbeard",
}

---------------------------------------------------------------------------
-- Mountaineer of Dun Morogh
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_mountaineer_1", from = "Sergeant Kelda Frostfist", stranger = true, delay = 1200,
  when = { origin = "dwarf_mountaineer", minLevel = 6 },
  subject = "The north pass",
  body = "{name},\n\nThe north pass misses you, and so does the rota, because now Gunnar has to take your night watches and he complains about it in his sleep.\n\nWe had a blizzard come down off the peaks three days back that buried the hut to its chimney, and we dug out on rations and cold tea. A pack of Frostmane trolls tried the Shimmer Ridge trail while we were busy shovelling, and Gunnar drove them off with a snowball before he found his axe, which I'll not let him forget.\n\nYou were a fine mountaineer, and I hope the lowlands treat you as well as the ice did. Mind your feet on wet stone, because it's worse than any glacier.\n\nSergeant Kelda Frostfist\nMountaineers of Dun Morogh",
}

P:Letter {
  id = "origin_dwarf_mountaineer_2", from = "Sergeant Kelda Frostfist", stranger = true, delay = 2400,
  when = { origin = "dwarf_mountaineer", cleared = "Gnomeregan" },
  subject = "Under the snow",
  body = "{name},\n\nI've stood watch over Gnomeregan's front door more winters than I care to count, and I've never once been allowed inside it. Now a scout tells me you went down past the troggs and the leaking pipes and came back with a tale that would curl a gnome's hair.\n\nThe whole post drank your health with the last of the good ale. Gunnar wept a little, though he says it was the smoke from the stove.\n\nI'll tell you plainly that I'm glad you left the pass, which is a hard thing for a sergeant to say. There's work out there that needs doing by somebody with a mountaineer's nerve, and you've got it in plenty.\n\nStay warm, {name}.\n\nKelda Frostfist",
}

---------------------------------------------------------------------------
-- Brewer's youngest
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_brewer_1", from = "Morna Barrelhide", stranger = true, delay = 1200,
  when = { origin = "dwarf_brewer", minLevel = 6 },
  subject = "The new batch",
  body = "Little one,\n\nYour father is sulking in the cellar because the dark ale turned sour, and he's blaming the weather, the barley, the barrels and you, in that order. I told him you've been gone a fortnight and couldn't have spoiled a thing from the other side of Khaz Modan, but he says you left a draught.\n\nYour brothers have taken over your share of the bottling and are making a mess of it. Two crates went to the Thunderbrew lads at the wrong price, and we'll be eating the difference until spring.\n\nIf you see where the barrels go, write and tell us, because nobody here has ever bothered to look.\n\nWith love and a strong smell of hops,\nYour mother, Morna Barrelhide",
}

P:Letter {
  id = "origin_dwarf_brewer_2", from = "Old Fenrick Barrelhide", stranger = true, delay = 2400,
  when = { origin = "dwarf_brewer", minLevel = 30 },
  subject = "From your grandfather",
  body = "{name},\n\nYour grandmother's hand has gone shaky, so I'm writing this one myself, and you'll forgive the spelling.\n\nI hear you've been as far as the other side of the sea now, and that travellers in Thelsamar talk about a {race} {class} who never pays for a round. I told them that sounds like my blood, right enough.\n\nYour father finally fixed the dark ale. He added a pinch of something he won't name, and it's the best we've barrelled in twenty years. He calls the batch after you, though he'll deny it if you ask.\n\nI was a wanderer once, before your grandmother caught me. Drink deep where the water's clean and walk away from any inn where the cook won't eat his own stew.\n\nYour grandfather, Fenrick",
}

---------------------------------------------------------------------------
-- Wildhammer cousin from Aerie Peak
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_wildhammer_kin_1", from = "Aunt Brenna Stormcrest", stranger = true, delay = 1200,
  when = { origin = "dwarf_wildhammer_kin", minLevel = 6 },
  subject = "From the Peak",
  body = "Wee {name},\n\nYour Bronzebeard granny writes from Ironforge to ask whether you've finally come to your senses and gone home to the mountain. I wrote back that you've gone neither up nor under, but out, and she hasn't answered since.\n\nThe wind's been wild off the Hinterlands all month and the gryphon roosts are full of squabbling hatchlings. One of them took a dislike to your cousin Dougal and bit clean through his best boot, which the whole Peak found very funny.\n\nYou needn't choose a side of the family to belong to. The sky's big enough for a dwarf to be both, and anybody who tells you otherwise has never flown.\n\nWith love and feathers,\nAunt Brenna",
}

P:Letter {
  id = "origin_dwarf_wildhammer_kin_2", from = "Granny Ingrid Bronzebeard", stranger = true, delay = 2400,
  when = { origin = "dwarf_wildhammer_kin", minLevel = 40 },
  subject = "Your granny writes",
  body = "{name},\n\nI'm told by people who should know that you've made a name for yourself across the world, and I'll admit it came as a surprise, given you once set my best rug alight trying to teach a gryphon chick to fetch.\n\nI've been hard on your father's people all these years. The Wildhammer are wild, and they're loud, and they eat with their hands, but they raised a {g:grandson|granddaughter} who's done more good than half the fine dwarves I take tea with in the Forlorn Cavern.\n\nYou'll always have a seat at my table under the mountain, and if you must bring a gryphon, I suppose it can sleep in the hall.\n\nYour loving granny,\nIngrid",
}

---------------------------------------------------------------------------
-- Shieldbearer of the Military Ward (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_military_ward_1", from = "Shieldmaster Ulgrim Steelbrow", stranger = true, delay = 1200,
  when = { origin = "dwarf_military_ward", minLevel = 6 },
  subject = "The line holds",
  body = "Shieldbearer {name},\n\nThe line in the Military Ward has held without you, which I'm sure you'll be sorry to hear. We've a new batch of recruits who couldn't block a thrown cabbage, and I'd trade three of them for one of you on a cold morning.\n\nThe armourers raised the price of shield straps again, and the quartermaster swears it's the Dark Irons buying up all the good leather. I suspect it's the quartermaster.\n\nRemember what I drilled into you. Keep your shield up, keep your feet under you, and never be the first to break formation, even when there's nobody beside you but a stranger. A warrior alone still fights like part of a wall.\n\nShieldmaster Ulgrim Steelbrow\nMilitary Ward, Ironforge",
}

P:Letter {
  id = "origin_dwarf_military_ward_2", from = "Shieldmaster Ulgrim Steelbrow", stranger = true, delay = 2400,
  when = { origin = "dwarf_military_ward", minLevel = 30 },
  subject = "The recruits ask after you",
  body = "{name},\n\nYour name comes up at drill more than you'd credit. When a recruit drops a shield, I tell him there's a {g:lad|lass} out in the wide world who never dropped one once, and it shames him into picking it up again.\n\nI've had word of you from Menethil, from the Wetlands road and from a gnome in Tinker Town who wouldn't stop talking. They all say the same thing, that you stand your ground when it'd be easier to run.\n\nThat's all I ever tried to teach, and it's a rare thing to see it take. I'm getting old for the line, but I'll go back to it a little straighter for knowing you're out there.\n\nShieldmaster Ulgrim Steelbrow",
}

---------------------------------------------------------------------------
-- Initiate of the Silver Hand in Ironforge (Paladin)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_silver_hand_1", from = "Brother Hallvard Oathstone", stranger = true, delay = 1200,
  when = { origin = "dwarf_silver_hand", minLevel = 6 },
  subject = "Your oath",
  body = "{g:Brother|Sister} {name},\n\nThe hall has been quiet since you took to the road. We said the evening vows without you on Tuesday, and old Brother Dunstan forgot the third line and made up a new one, which the High Priest pretended not to notice.\n\nThere's grim news from the north, as there so often is. Refugees from Lordaeron still come through the gates with their carts and their coughs, and some of them tell stories of men who wear the Hand's colours and burn villages in the Light's name. Remember that an oath is kept by what you do, and not by the tabard you wear while doing it.\n\nThe Light keep you, and keep your hammer honest.\n\nBrother Hallvard Oathstone",
}

P:Letter {
  id = "origin_dwarf_silver_hand_2", from = "Brother Hallvard Oathstone", stranger = true, delay = 2400,
  when = { origin = "dwarf_silver_hand", cleared = "Scarlet Monastery" },
  subject = "The Scarlet halls",
  body = "{name},\n\nWe heard in the Mystic Ward that you went into the Scarlet Monastery in Tirisfal and walked out of it again, an' there's no' many who knock on those doors who manage that.\n\nI'll not ask what you saw there. I know the kind of men who pray in that place, and I know they once took the same oath we did, before grief and fear twisted it into something cruel. It must be a strange thing for a paladin to raise a hammer against people who call on the same Light.\n\nCome and sit with us when you're home, and we'll say the vows together, all three lines of them. The oath is lighter when it's carried by more than one.\n\nYour brother in the Light,\nHallvard Oathstone",
}

---------------------------------------------------------------------------
-- Acolyte of the Mystic Ward (Priest)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_mystic_acolyte_1", from = "Sister Ragna Hearthstone", stranger = true, delay = 1200,
  when = { origin = "dwarf_mystic_acolyte", minLevel = 6 },
  subject = "Your broom",
  body = "{name},\n\nYou'll be glad to know that your broom is still leaning in the corner by the font, and that nobody has dared to touch it, because the new acolyte thinks it's a relic.\n\nThe Mystic Ward is full of coughing this month. Half of Tinker Town has caught a chill from the drafts in the deep halls, and we've been brewing willowbark tea by the barrel. High Priest Rohan says a priest who can't make a good pot of tea isn't worth his robes, so I suppose you'd have done well.\n\nDon't fret about praying with grace. The Light hears a plain prayer as well as a pretty one, and a {class} out in the world has better things to polish than words.\n\nSister Ragna Hearthstone",
}

P:Letter {
  id = "origin_dwarf_mystic_acolyte_2", from = "Sister Ragna Hearthstone", stranger = true, delay = 2400,
  when = { origin = "dwarf_mystic_acolyte", cleared = "Razorfen Downs" },
  subject = "The barrows",
  body = "{name},\n\nA traveller from the Barrens stopped at the font to wash and told me there's a dwarf priest who went down into the Razorfen barrows and put an end to the thing that ruled the dead there. I didn't need to ask the name.\n\nI've been thinking about that all day. You swept the same floor as I did for two years and grumbled about your knees the whole time, and now you've stood against the Scourge in a land none of us have ever seen.\n\nI've lit a candle by the font for you, beside the broom. The new acolyte asked if you were a saint, and I said no, just someone who kept sweeping until the Light gave {g:him|her} something harder to do.\n\nSister Ragna",
}

---------------------------------------------------------------------------
-- Smuggler on the Loch Modan roads (Rogue)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_loch_smuggler_1", from = "Wick Tallowmane", stranger = true, delay = 1200,
  when = { origin = "dwarf_loch_smuggler", minLevel = 6 },
  subject = "About the last run",
  body = "{name},\n\nYou left in a hurry, and I don't blame you, because the Mountaineers came round the Stoutlager asking after a dwarf of your description the very next morning. I told them you'd drowned in the Loch. One of them believed me.\n\nThe Wetlands road's gone quiet since you left, and so has my purse. The tax man in Thelsamar has a new assistant who counts every barrel twice, and the ale's going up a copper a pint because of it. Folk are blaming the Crown, so at least we've stopped being the villains.\n\nYou still owe me six silver for the cart you lost in the reeds. I'll not hold my breath, but I'll not forget it either.\n\nWick",
}

P:Letter {
  id = "origin_dwarf_loch_smuggler_2", from = "Wick Tallowmane", stranger = true, delay = 2400,
  when = { origin = "dwarf_loch_smuggler", cleared = "The Stockade" },
  subject = "Heard you broke into prison",
  body = "{name},\n\nI've heard some strange things in my day, but never a smuggler breaking into a prison on purpose. The word on the Menethil docks is that you went into the Stormwind Stockade when the prisoners rose up and put the riot down yourself.\n\nI laughed so hard I spilled a good stout on the tax man's boots, and he didn't even notice, which tells you how that day went.\n\nI'll say this much and then never again. You were always too decent for this trade, and you knew it, and that's what made you bad at it. Keep on the right side of the bars, {name}, and forget about the six silver. Consider it a gift from an old crook to a better one.\n\nWick",
}

---------------------------------------------------------------------------
-- Bear-tracker of the Dun Morogh hills (Hunter)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_bear_tracker_1", from = "Grandda Hroth Pinehollow", stranger = true, delay = 1200,
  when = { origin = "dwarf_bear_tracker", minLevel = 6 },
  subject = "Tracks in the snow",
  body = "{name},\n\nThe big sow bear you watched all last winter came down past Kharanos with two cubs at her heels, bold as you please, and ate half the cabbages behind the Thunderbrew Distillery before anyone thought to chase her off. Belm swears he'll put a bounty on her. I swear I'll put a boot on Belm if he tries.\n\nThe snow came early this year and the wolves are hungry, so I've been keeping the shutters barred. My knee tells me there's worse to come.\n\nMind your companion out there, because a beast can tell when its keeper's frightened. Feed it first and yourself second, and it'll follow you into any trouble you can find.\n\nGrandda",
}

P:Letter {
  id = "origin_dwarf_bear_tracker_2", from = "Grandda Hroth Pinehollow", stranger = true, delay = 2400,
  when = { origin = "dwarf_bear_tracker", minLevel = 20 },
  subject = "The cubs are grown",
  body = "{name},\n\nThe sow's cubs are near grown now and out on their own in the hills above Brewnall, and I watched the bigger one take a trout out of the stream yesterday as neat as any fisherman. It made me think of you, for no reason I can explain except that they've both left home.\n\nFolk at the inn say you've been seen far to the south with a beast at your side, and that the pair of you have done well. I never doubted it, though I'd have liked to hear it from you.\n\nI've kept your old snowshoes by the door. You'll not need them where you are, but I'm not ready to give them away.\n\nWrite when your hands are warm,\nGrandda",
}

---------------------------------------------------------------------------
-- Listener to the deep stone (Shaman)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_stone_listener_1", from = "Gretta Deepvein", stranger = true, delay = 1200,
  when = { origin = "dwarf_stone_listener", minLevel = 6 },
  subject = "The stone's been quiet",
  body = "{name},\n\nYour sister here, writing by the lamp because Mother is too cross to hold a quill. She's still telling the neighbours you've gone to study with the priests, and I haven't had the heart to correct her.\n\nThe strangest thing has happened since you left. The old seam under the house has stopped humming at night, the one Grandmother said was singing to us. I lie awake waiting for it and hear nothing but the forge bellows down the street.\n\nMaybe it went with you, and maybe I've just gone deaf to it now that nobody answers it back. If the stone ever tells you something worth knowing, I'd like to hear it, even if Mother wouldn't.\n\nYour sister, Gretta",
}

P:Letter {
  id = "origin_dwarf_stone_listener_2", from = "Gretta Deepvein", stranger = true, delay = 2400,
  when = { origin = "dwarf_stone_listener", minLevel = 30 },
  subject = "It hummed last night",
  body = "{name},\n\nThe seam under the house hummed again last night, and it wasn't my imagination, because Mother heard it too. She sat bolt upright and said your name before she was properly awake.\n\nAt breakfast she asked me, very carefully, whether you'd written lately and whether you were well. I told her you were well, and that people as far as the Wetlands know your name and speak it kindly. She didn't say anything, but she put an extra stone in the hearth for luck, the way Grandmother used to.\n\nI think she's coming round, {name}. It's slower than a glacier, but it's moving.\n\nWith love from under the mountain,\nGretta",
}

---------------------------------------------------------------------------
-- Veteran of the Dun Algaz watch (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_dun_algaz_watch_1", from = "Corporal Brodd Ashenhand", stranger = true, delay = 1200,
  when = { origin = "dwarf_dun_algaz_watch", minLevel = 6 },
  subject = "Still at Algaz",
  body = "{name},\n\nStill at Algaz, still cold, still staring at the same smoke over Grim Batol that you stared at for six years. You'd think the Dark Irons would run out of things to burn, but they never do.\n\nWe lost the cook to a fever and the replacement makes porridge you could mortar a wall with. Hagrim took a Dragonmaw arrow in the shoulder on the Wetlands side last week, but he's mending, and he's already telling the story bigger than it was.\n\nI'll not lie to you, I envied you when you walked off down the road. Sleep well wherever you are, because none of us here ever will.\n\nCorporal Brodd Ashenhand\nDun Algaz watch",
}

P:Letter {
  id = "origin_dwarf_dun_algaz_watch_2", from = "Corporal Brodd Ashenhand", stranger = true, delay = 2400,
  when = { origin = "dwarf_dun_algaz_watch", minLevel = 30 },
  subject = "Word from the Wetlands",
  body = "{name},\n\nThe Menethil couriers have been bringing your name up the road with the mail, and the lads at the watch fight over who gets to read the reports aloud. Hagrim does the voices, badly.\n\nThey say you've been harrying the Dragonmaw in the Wetlands and making a nuisance of yourself to everyone who's ever given us grief. If that's so, then I reckon you never left the watch at all, but just took it on the road with you.\n\nThe smoke's thinner over Grim Batol this month. I don't know whether that's good news or bad, and I've stopped guessing. Keep your back to a wall and your eyes on the ridge, the way we always did.\n\nBrodd",
}

---------------------------------------------------------------------------
-- Quarry foreman from Gol'Bolar (Paladin)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_quarry_foreman_1", from = "Annika Gravelhand", stranger = true, delay = 1200,
  when = { origin = "dwarf_quarry_foreman", minLevel = 6 },
  subject = "From the quarry crew",
  body = "Boss,\n\nThe crew still calls you that, so I'll not change it now. We've gone back to work at the eastern face of Gol'Bolar, though the floor where the troggs came up is boarded over and nobody will stand on it.\n\nWe raised three stones at the top of the quarry road for Ketil, Bram and young Osgar. Ketil's widow comes up on Sundays and talks to hers, and she always asks whether you've written. I tell her you're out doing the Light's work, and she nods like that's a comfort.\n\nThe new foreman's a decent sort, but he isn't you. Carry that hammer well, and come back to see the stones when you can.\n\nAnnika Gravelhand\nfor the crew at Gol'Bolar",
}

P:Letter {
  id = "origin_dwarf_quarry_foreman_2", from = "Annika Gravelhand", stranger = true, delay = 2400,
  when = { origin = "dwarf_quarry_foreman", cleared = "Uldaman" },
  subject = "Where the troggs come from",
  body = "Boss,\n\nAn Explorers' League courier stopped at the quarry for water and told us all about Uldaman, where the troggs crawl up out of the deep places in the Badlands. Then he said your name, and the whole crew put down their picks at once.\n\nI can't say what it means for the ones who come up through our floors. Maybe it means nothing at all, and there are just as many down there as there ever were. But it meant something to Ketil's widow, who cried when I told her and then laughed and said she'd tell his stone on Sunday.\n\nWe're all proud of you up here, {name}. The Light picked a good hammer.\n\nAnnika, for the crew",
}

---------------------------------------------------------------------------
-- Field priest of the Explorers' League (Priest)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_league_chaplain_1", from = "Digmaster Haldor Pickhelm", stranger = true, delay = 1200,
  when = { origin = "dwarf_league_chaplain", minLevel = 6 },
  subject = "The dig misses its priest",
  body = "Padre,\n\nThe lads at the dig site have started saying their own prayers over the dead stone, which is to say they swear at it louder. Nobody's fallen down a shaft since you left, but nobody's been blessed for it either, so it feels like luck is running on credit.\n\nThe Badlands sun cracked two of our water barrels last week and we've been drinking from the canteens and arguing about whose turn it is. The troggs from the Stonevault haven't troubled us lately, though Grundy swears he saw one wearing a League hat.\n\nCome back when you've seen enough of the world, and bring a few prayers that work in the heat.\n\nDigmaster Haldor Pickhelm",
}

P:Letter {
  id = "origin_dwarf_league_chaplain_2", from = "Digmaster Haldor Pickhelm", stranger = true, delay = 2400,
  when = { origin = "dwarf_league_chaplain", cleared = "Uldaman" },
  subject = "You went in",
  body = "Padre,\n\nYou went in. After all those nights at the campfire telling us the old halls had something to teach about the Light, you went in past the Stonevault and the Dark Irons and came back out. Grundy owes me a silver, because he bet you'd stay on the surface and pray at the door.\n\nI've been a digger all my life and never once thought about what the stone was for, only what it was worth. Then you talked about a Light older than the dwarves, and now I can't look at a carved wall without wondering who carved it.\n\nThe lads would like a blessing when you pass through again. I'll see to it that they wash first.\n\nHaldor",
}

---------------------------------------------------------------------------
-- Spy among the Dark Iron thralls (Rogue)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_searing_gorge_spy_1", from = "A friend at Thorium Point", stranger = true, delay = 1200,
  when = { origin = "dwarf_searing_gorge_spy", minLevel = 6 },
  subject = "No names",
  body = "Friend,\n\nYou'll know who this is from by the way it's folded. We agreed on no names, and I've kept to that even now, because the post out of the Gorge passes through more hands than a tavern tankard.\n\nThe overseers on the slag pits have changed their counts since you left, and the new one walks his rounds backwards, which nobody can make sense of. The Brotherhood traders at the Point are quiet and watchful, and the ash gets in everything, the bread most of all.\n\nYou spent three years telling lies for a good cause. Spend a few telling the truth for no cause at all, and see how it fits. I think you'll find it's lighter.\n\nYou know who",
}

P:Letter {
  id = "origin_dwarf_searing_gorge_spy_2", from = "A friend at Thorium Point", stranger = true, delay = 2400,
  when = { origin = "dwarf_searing_gorge_spy", minLevel = 40 },
  subject = "Ash and old debts",
  body = "Friend,\n\nI hear you're strong enough now to walk back into the Gorge in your own colours, with your own face and your own name. I hope you won't, but if you do, the Point will see you coming a mile off, and nobody there will remember you as a thrall.\n\nOne of the lads you counted for, the young one who carried slag on the night shift, slipped his chain last month and made it as far as the Badlands. He said you used to share your bread, and that he never knew why a Dark Iron thrall would bother. I told him you weren't a Dark Iron, and he said he'd guessed as much.\n\nBurn this, as usual.\n\nYou know who",
}

---------------------------------------------------------------------------
-- Rifleman of the Stonewrought Dam (Hunter)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_dam_rifleman_1", from = "Uncle Barrik Flintsight", stranger = true, delay = 1200,
  when = { origin = "dwarf_dam_rifleman", minLevel = 6 },
  subject = "From the dam",
  body = "{name},\n\nThe dam's still standing, which is more than the engineers expected, and the Loch's as high as I've ever seen it after the autumn rains. There's a crack the size of my thumb on the north face that everyone pretends not to notice.\n\nThe troggs in Stonesplinter Valley have been bold this month, and I've used more powder than the quartermaster likes. I had to buy my own shot from the smith in Thelsamar at a copper a ball, which is robbery in broad daylight.\n\nKeep your barrel clean and your powder dry, and don't trust a scope that's been dropped. Give that hound of yours a good scratch from me.\n\nUncle Barrik",
}

P:Letter {
  id = "origin_dwarf_dam_rifleman_2", from = "Uncle Barrik Flintsight", stranger = true, delay = 2400,
  when = { origin = "dwarf_dam_rifleman", minLevel = 20 },
  subject = "A better shot than me",
  body = "{name},\n\nA traveller came over the Algaz road and told us there's a dwarf hunter down south who can put a bullet through a gnoll's ear at two hundred paces. I asked him whether the hunter had a hound with a notch in its left ear, and he said aye.\n\nI'm prouder than I've any right to be, since all I did was let you blast at troggs from the top of a dam until you stopped missing. You did the rest yourself.\n\nThe crack in the north face is bigger now, but the engineers say it'll hold. They said that about the last one, too. I'll keep watching it for both of us.\n\nUncle Barrik, Stonewrought Dam",
}

---------------------------------------------------------------------------
-- Pupil of the Wildhammer shamans (Shaman)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_dwarf_wildhammer_shaman_1", from = "Old Mother Kerra Windcaller", stranger = true, delay = 1200,
  when = { origin = "dwarf_wildhammer_shaman", minLevel = 6 },
  subject = "The winds told me",
  body = "Little stone-dweller,\n\nThe winds over the Hinterlands told me you'd left the Peak, but I'd have known anyway, because the trolls in the valley have gone back to singing at night now that nobody's throwing pinecones at them.\n\nThe gryphons are moulting and the whole roost is ankle deep in feathers. I've been brewing a tea from them that tastes terrible and helps nothing, but the young ones believe in it, and belief is half of any cure.\n\nRemember that the elements don't care whether you were born under a mountain or above it. Listen first and ask second, and never call on the fire when you're angry, because it will always answer.\n\nMother Kerra",
}

P:Letter {
  id = "origin_dwarf_wildhammer_shaman_2", from = "Old Mother Kerra Windcaller", stranger = true, delay = 2400,
  when = { origin = "dwarf_wildhammer_shaman", minLevel = 40 },
  subject = "You'd be welcome back",
  body = "{name},\n\nYou're strong enough now that the Hinterlands wouldn't frighten you, and I'd dearly like to see you on the Peak again before my old bones decide to sit down for good.\n\nThe Witherbark trolls have been restless in the forests and the gryphon riders come home tired and scratched. Falstad's people do their best, but the land itself is uneasy, and it needs a shaman who can hear it as well as you can.\n\nI'll not ask you to come, because the winds go where they please and so do you. But your old sleeping fur is still in the corner of my hut, and the trolls have started singing a song I think is about you.\n\nMother Kerra, Aerie Peak",
}
