-- Speaking your mind (0.82.0): views on Khaz Modan, Lordaeron, Kalimdor's forests, the Burning Steppes and the Blasted Lands. Format: views.lua.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Wetlands and Khaz Modan ------------------------------------------------------------------

P:Views { topic = "grim_batol", views = {
  { id = "cursed", text = "Some places are cursed for good reason. I'd leave it shut.", fx = { opinion = { grim_batol = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Wise of you. The Wildhammer walked away from it, and they're not a people who run from much.", fx = { affinity = 1 } },
    { id = "b", text = "Shut is right, though the Dragonmaw didn't care about curses when they moved in. Whatever's in those halls suits them." },
  } },
  { id = "retake", text = "Stone doesn't stay cursed forever. The dwarves should take it back.", fx = { opinion = { grim_batol = "reclaim" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Plenty have said so over an ale, {class}, and none of them have gone. A witch's dying curse isn't something you dig out with a pick." },
    { id = "b", when = { race = "Dwarf" }, text = "Aye, and one day maybe we will. But it'll take more than one stout heart, and the Wildhammer would want their say first.", fx = { affinity = 1 } },
  } },
  { id = "dragons", text = "If the Dragonmaw still chain dragons in there, someone ought to free them.", fx = { opinion = { grim_batol = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "A red dragon in chains is still a red dragon, friend, and I'd not want to be the one who unlocks it. Still, it's a kind thought.", fx = { affinity = 1 } },
    { id = "b", text = "That's a bigger job than one {class} can carry. The orcs broke those beasts for years in the Second War, and they're not finished yet." },
  } },
} }

P:Views { topic = "third_fleet", views = {
  { id = "old_horde", when = { faction = "Horde" }, text = "The Horde that burned those ships isn't Thrall's Horde.", fx = { opinion = { third_fleet = "past" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "No, it isn't, and the Warchief would say so himself. The Dragonmaw that did it still answer to no one but their own cruelty.", fx = { affinity = 1 } },
    { id = "b", text = "True enough, but the dead in that bay don't know the difference, and they're not inclined to ask." },
  } },
  { id = "pity", text = "Poor sailors. Drowned far from home, and cursed after that.", fx = { opinion = { third_fleet = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Aye, and most of them were Kul Tiran lads who'd never seen a dragon before that day. Fitzsimmons is about the only one left who still says their names.", fx = { affinity = 1 } },
    { id = "b", text = "The curse is the worst of it. They keep their watch out there as if the war never ended, and I suppose for them it didn't." },
  } },
  { id = "salvage", text = "Sunken ships mean sunken cargo. Someone ought to go diving.", fx = { opinion = { third_fleet = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Someone has, {class}, and the crew didn't care for it. Those sailors guard their holds as well dead as they ever did alive." },
    { id = "b", text = "That's a grave you're talking about robbing. I'll not stop you, but I'll not drink with you after, either.", fx = { affinity = -1 } },
  } },
  { id = "doubt", text = "Ghost ships sound like a tale told for free drinks.", fx = { opinion = { third_fleet = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Then go and stand on the shore at night, and tell me what you see in the fog. I'll buy you the drink after, if you're still laughing." },
    { id = "b", text = "Fitzsimmons does tell it for drinks, I'll grant you that. But he tells it the same way every time, and drunks don't usually manage that." },
  } },
} }

P:Views { topic = "thandol_span", views = {
  { id = "rebuild", text = "Somebody ought to rebuild it. Khaz Modan and Arathi need that road.", fx = { opinion = { thandol_span = "rebuild" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Aye, and somebody will, once the Dark Irons stop setting charges on anyone who tries. Till then it's gryphons, and gryphons are dear.", fx = { affinity = 1 } },
    { id = "b", text = "Ironforge has the masons for it, but not the soldiers to guard them while they work. That's the trouble with every good idea out here." },
  } },
  { id = "hate", text = "The Dark Irons blew it apart, and they'll answer for it.", fx = { opinion = { thandol_span = "hate" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "They will, if there's any justice under the mountains. They're still crawling over what's left of it, so you'll not have far to look." },
    { id = "b", when = { race = "Dwarf" }, text = "Every Bronzebeard alive says the same, {g:lad|lass}. Add it to the long list of things the Dark Irons owe us.", fx = { affinity = 1 } },
  } },
  { id = "awe", text = "It must have been something to see, back when it stood whole.", fx = { opinion = { thandol_span = "admire" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "It was. You could drive a cart across with the sea far below you, and you'd swear the dwarves had built it to show off." },
    { id = "b", text = "Look at the stonework on the broken ends sometime. Even in ruins it's finer than most castles in the south." },
  } },
} }

-- Hillsbrad and Alterac -------------------------------------------------------------------

P:Views { topic = "syndicate", views = {
  { id = "amateurs", when = { class = "ROGUE" }, text = "Amateurs with family crests. A real thief doesn't need a title.", fx = { opinion = { syndicate = "scorn" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Ha! I'd keep that sort of talk away from Ravenholdt, though, because they've opinions on who's an amateur too." },
    { id = "b", text = "Amateurs with a good many knives, {class}. Southshore's buried enough folk who thought the same as you." },
  } },
  { id = "hang", text = "Thieves dressed in silk. I'd hang every last one of them.", fx = { opinion = { syndicate = "hate" }, trait = { stern = 1 }, align = { order = 1, honor = 1 } }, replies = {
    { id = "a", text = "So would the magistrate, if he could catch them. They know these hills, and every farmer up there is too frightened to talk.", fx = { affinity = 1 } },
    { id = "b", text = "Hang them, aye, but hang the ones who pay them too. Somebody's buying all that stolen silver." },
  } },
  { id = "clever", text = "Clever lot, though. Running a whole kingdom's crime from the hills.", fx = { opinion = { syndicate = "admire" }, trait = { witty = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Clever's one word for it. Ask the families they've robbed on the Hillsbrad road which word they'd use.", fx = { affinity = -1 } },
    { id = "b", text = "Clever enough, but they're nobles at heart, and nobles never last long once the money runs thin." },
  } },
  { id = "pity", text = "They lost a kingdom to their king's shame. No wonder some turned bad.", fx = { opinion = { syndicate = "pity" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Plenty lost everything in that war, {class}, and most of them didn't take up cutting throats. I'll keep my pity for them." },
    { id = "b", text = "There's some truth in it. Perenolde's shame fell on every name in Alterac, but that's no excuse for what they do now." },
  } },
} }

P:Views { topic = "alterac", views = {
  { id = "horde", when = { faction = "Horde" }, text = "A human king who sold out his own. That says plenty about humans.", fx = { opinion = { alterac = "scorn" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "It says plenty about Perenolde, at least. The Horde has had its own traitors, and the Warchief remembers every one of them." },
    { id = "b", when = { race = "Scourge" }, text = "Most of us were human once, and I recall what we thought of Perenolde. Your contempt is nothing beside ours." },
  } },
  { id = "earned", text = "Perenolde betrayed the Alliance. Alterac earned its ruin.", fx = { opinion = { alterac = "condemn" }, trait = { stern = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "The king earned it, and Lordaeron's armies saw to it. The rest of the place just went down with him.", fx = { affinity = 1 } },
    { id = "b", text = "Hard words, though I've heard harder ones in Southshore. Folk there remember the Horde coming through those passes." },
  } },
  { id = "pity", text = "The farmers there never chose Perenolde, but they paid for him anyway.", fx = { opinion = { alterac = "pity" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "They did, and then the ogres came down into what was left. It's a hard thing, to be punished for your king.", fx = { affinity = 1 } },
    { id = "b", text = "That's the way of kingdoms, I'm afraid. The crown makes the choice and the commoners carry the bill." },
  } },
  { id = "loot", text = "Ruined castles keep old treasure, and nobody's left to mind it.", fx = { opinion = { alterac = "profit" }, trait = { greedy = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Nobody but the Crushridge ogres and the Syndicate, and they both mind it very much. Go if you like, but go armed." },
    { id = "b", text = "That's a grave-robber's way of thinking, {class}. Still, the Perenoldes stole it fair from everyone else first." },
  } },
} }

P:Views { topic = "silver_hand", views = {
  { id = "forsaken", when = { race = "Scourge" }, text = "Some of them rose beside me. Their Light didn't save them either.", fx = { opinion = { silver_hand = "scorn" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "No, it didn't, and those that rose hate it worse than any of us. The Light is a promise, and promises break." },
    { id = "b", text = "A cold thing to say, though you've earned the right to say it. I'd keep it from the Crusade's ears, all the same." },
  } },
  { id = "horde", when = { faction = "Horde" }, text = "Their hammers broke plenty of orc skulls. I won't mourn their order.", fx = { opinion = { silver_hand = "hate" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Nor will I, though they were fair foes in the Second War, and fair foes are rarer than friends." },
    { id = "b", text = "Their prince did them more harm than the Horde ever managed. The ones that are left wear red now, and they're worse." },
  } },
  { id = "restore", when = { class = "PALADIN" }, text = "I'd see the order rise again, and carry its hammer gladly.", fx = { opinion = { silver_hand = "restore" }, trait = { pious = 1 }, align = { light = 2, order = 1 } }, replies = {
    { id = "a", text = "Then carry it well, {class}, because you're what's left of Uther's dream. The Argent Dawn could use a few more like you.", fx = { affinity = 1 } },
    { id = "b", text = "Gladly is a fine word. Just remember the last man to carry it highest was Arthas, and keep your eyes on your own heart." },
  } },
  { id = "admire", text = "Uther's knights were the best Lordaeron ever had. We'll not see their like again.", fx = { opinion = { silver_hand = "admire" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "No, I don't think we will. Uther lies in the Plaguelands now, and there's no one living fit to take his place.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Horde" }, text = "They fought well, I'll give them that. Even an enemy can respect a foe who stood his ground." },
  } },
  { id = "doubt", text = "They couldn't even stop one of their own. That says enough.", fx = { opinion = { silver_hand = "doubt" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "A sharp question, and an unfair one. Nobody saw Arthas coming, not his father nor his teacher, and they paid for it first.", fx = { affinity = -1 } },
    { id = "b", text = "Fair enough, maybe. An order is only as good as the worst knight it lets take the oath." },
  } },
} }

P:Views { topic = "new_plague", views = {
  { id = "proud", when = { race = "Scourge" }, text = "The Apothecaries know their work. Let the Scourge choke on it.", fx = { opinion = { new_plague = "support" }, trait = { proud = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "So the Dark Lady promises, and Faranell's people are nothing if not thorough. I only hope the wind agrees with them." },
    { id = "b", text = "Spoken like one of Undercity's own. Mind you keep that pride away from Southshore; they won't share it." },
  } },
  { id = "wary", when = { race = { "Orc", "Troll", "Tauren" } }, text = "I trust the Dark Lady, but I'd keep those crates far from Orgrimmar.", fx = { opinion = { new_plague = "dangerous" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "You're not the only one thinking it. The Warchief keeps his own counsel, but he's no fool where the Forsaken are concerned.", fx = { affinity = 1 } },
    { id = "b", text = "The Forsaken are our allies, and they've earned their place. Still, a plague doesn't read the treaty." },
  } },
  { id = "southshore", when = { faction = "Alliance" }, text = "Mark me, that plague is meant for Southshore, not the Scourge.", fx = { opinion = { new_plague = "distrust" }, trait = { skeptical = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Half of Southshore says the same, and the other half sleeps with the windows shut. Tarren Mill isn't a long ride.", fx = { affinity = 1 } },
    { id = "b", text = "Maybe, maybe not. The Forsaken hate the Scourge more than they hate us, but I'd not bet my village on it." },
  } },
  { id = "dangerous", text = "A plague is a plague, whoever brews it. It'll find the living.", fx = { opinion = { new_plague = "dangerous" }, trait = { cautious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "That's what frightens me. The last plague came in grain carts, and nobody thought to be careful until it was too late.", fx = { affinity = 1 } },
    { id = "b", text = "It will, sooner or later. Things that are bred to kill don't stop at the line somebody drew on a map." },
  } },
  { id = "necessary", text = "Fight a plague with a plague. Sometimes ugly is what works.", fx = { opinion = { new_plague = "necessary" }, trait = { practical = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Ugly is a mild word for it, {class}. Still, the Scourge doesn't fear swords, so maybe you've the right of it." },
    { id = "b", when = { faction = "Alliance" }, text = "Easy to say from here. Say it in Southshore, where they'll be the first to find out if it works.", fx = { affinity = -1 } },
  } },
} }

P:Views { topic = "troggs", views = {
  { id = "burn", text = "Vermin from the deep. Collapse the tunnels and be done with them.", fx = { opinion = { troggs = "hate" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "The miners tried that, and the troggs dug straight through. They come up faster than we can bury them." },
    { id = "b", text = "Aye, and take a few of them with the rock while you're at it. The Mountaineers would buy you a round for that." },
  } },
  { id = "curious", text = "So many, all at once. Something down there must have stirred them up.", fx = { opinion = { troggs = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "The Explorers' League thinks so too. They say the troggs come out of Uldaman, and that something under it was never meant to wake." },
    { id = "b", text = "Something did, or someone did. The digging in the Badlands is louder every year, and the troggs don't like noise." },
  } },
  { id = "joke", text = "Ugly enough to frighten a kobold. I'd almost pity them.", fx = { opinion = { troggs = "pity" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Save your pity till one's had a go at your shins. They're stronger than they look, and they look plenty strong." },
    { id = "b", text = "Don't pity them too much. They ate a whole mining crew out by the Silver Stream, boots and all." },
  } },
} }

P:Views { topic = "frostmane", views = {
  { id = "darkspear", when = { race = "Troll" }, text = "The Frostmane are no kin to the Darkspear. Let the dwarves have them.", fx = { opinion = { frostmane = "scorn" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Snow trolls and island trolls, aye, there's a world between them. The Darkspear chose the Horde, and the Frostmane chose to sulk in the cold." },
    { id = "b", text = "Spoken like Sen'jin's people. Still, a troll is a troll to most folk in Kharanos, so don't wander up there wearing a smile." },
  } },
  { id = "drive", text = "Dun Morogh belongs to the dwarves now. Drive them into the mountains.", fx = { opinion = { frostmane = "hate" }, trait = { stern = 1 }, align = { order = 1, light = -1 } }, replies = {
    { id = "a", text = "That's the plan, more or less, though the mountains are where they came from. Every winter they creep back down to Coldridge." },
    { id = "b", when = { race = { "Dwarf", "Gnome" } }, text = "Aye, and the sooner the better. They've been raiding our herds since before my grandfather's grandfather.", fx = { affinity = 1 } },
  } },
  { id = "pity", text = "They lived up there long before the dwarves. It's their snow too.", fx = { opinion = { frostmane = "pity" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Maybe so, but they'd have your head on a pole for your trouble. Pity's a fine thing until it's your herd they're stealing.", fx = { affinity = -1 } },
    { id = "b", text = "A kind thought, {class}, and not entirely wrong. But they've had a long time to make peace, and they never cared to try." },
  } },
  { id = "respect", text = "Hardy folk, to live up there. I'd rather not fight them in snow.", fx = { opinion = { frostmane = "respect" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Nobody wants to. They move through drifts like they're walking a road, and their shamans can make the cold bite twice as hard." },
    { id = "b", text = "Hardy's the word. They don't feel the cold the way we do, so wait for them on dry ground and you'll have the better of it." },
  } },
} }

P:Views { topic = "stonewrought_dam", views = {
  { id = "admire", text = "Dwarven work at its finest. That dam will stand a thousand years.", fx = { opinion = { stonewrought_dam = "admire" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "It will, if we keep the Dark Irons off it. The engineers polish every stone as if Magni himself were coming to inspect it.", fx = { affinity = 1 } },
    { id = "b", text = "Seven generations of Hinderweirs say so, and they ought to know. They've never once let it crack." },
  } },
  { id = "fear", text = "If the Dark Irons ever crack that dam, Thelsamar drowns.", fx = { opinion = { stonewrought_dam = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Aye, and half of Loch Modan with it. That's why there are guards on the walls day and night, and why they don't laugh much." },
    { id = "b", text = "It's what keeps the engineers up at night. The Dark Irons have tried before, and they don't give up easily." },
  } },
  { id = "joke", text = "All that stone just to hold a lake still. Dwarves do love a project.", fx = { opinion = { stonewrought_dam = "amuse" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! They do, and they'll tell you every detail of it if you stand still long enough. Don't stand still." },
    { id = "b", when = { race = "Dwarf" }, text = "A lake's no use running wild, {g:lad|lass}. Put stone round it and you've a loch, and a loch is a fine thing to have." },
  } },
} }

-- Kalimdor's forests ----------------------------------------------------------------------

P:Views { topic = "teldrassil", views = {
  { id = "home", when = { race = "NightElf" }, text = "Teldrassil is home now, though it was never blessed like Nordrassil.", fx = { opinion = { teldrassil = "home" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Many of us feel it and few will say it aloud. The Archdruid is sure of his work, and I pray that he is right.", fx = { affinity = 1 } },
    { id = "b", text = "Home is where our people are, and they are there. The rest is in Elune's keeping." },
  } },
  { id = "scorn", when = { faction = "Horde" }, text = "Elves up a tree while their forest burns below. Fitting, somehow.", fx = { opinion = { teldrassil = "scorn" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Don't let a Sentinel hear you say it, though. They shoot straighter when they're angry." },
    { id = "b", text = "There's truth in that. The elves are spread thin across Ashenvale, and the Warsong know it well." },
  } },
  { id = "awe", text = "A whole city in a tree taller than mountains. I've seen nothing like it.", fx = { opinion = { teldrassil = "admire" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Nor has anyone. The druids grew it in a handful of years, and they say the roots reach clear down to the sea floor.", fx = { affinity = 1 } },
    { id = "b", text = "Most who see it say the same. Just mind the edges of Darnassus, because it's a long way down to Darkshore." },
  } },
  { id = "doubt", text = "A tree planted without the dragons' blessing. That worries me.", fx = { opinion = { teldrassil = "doubt" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "You've heard the whispers, then. There's fel moss in the glades and the furbolgs have gone mad, and nobody can quite say why." },
    { id = "b", text = "It worries wiser heads than yours or mine. Fandral says the tree is strong, and I hope he's right, but hope isn't proof." },
  } },
} }

P:Views { topic = "malfurion", views = {
  { id = "dream", when = { class = "DRUID" }, text = "The Dream calls to every druid. He walks it so we needn't.", fx = { opinion = { malfurion = "revere" }, trait = { pious = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Spoken like one of the Cenarion Circle. Keep that faith, {class}, because the Dream is not a gentle place to walk alone.", fx = { affinity = 1 } },
    { id = "b", text = "So the druids of Moonglade say. I only hope the Dream gives him back when the world needs him." },
  } },
  { id = "horde", when = { faction = "Horde" }, text = "He stood with Thrall at Hyjal. I'll grant the elf that much.", fx = { opinion = { malfurion = "respect" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "He did, and the Warchief speaks of it with respect. Pity his people forgot that alliance so quickly.", fx = { affinity = 1 } },
    { id = "b", text = "Fair words, and rare ones. The elves in Ashenvale won't return them, though, so don't wait for thanks." },
  } },
  { id = "admire", text = "He's turned back the Legion twice. That deserves to be remembered.", fx = { opinion = { malfurion = "admire" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "It does, and the kaldorei remember it in every song. Without him there'd be no world left to argue over.", fx = { affinity = 1 } },
    { id = "b", text = "Twice in ten thousand years, and he slept through most of the rest. Still, twice is more than any of us will manage." },
  } },
  { id = "absent", text = "A leader who sleeps for years isn't leading anyone.", fx = { opinion = { malfurion = "doubt" }, trait = { skeptical = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Tyrande leads in his stead, and she does it well. I'd not say that to a Sentinel's face, all the same.", fx = { affinity = -1 } },
    { id = "b", text = "There's some truth in it, though the druids say the Dream needs him more than we do. I hope they're right." },
  } },
  { id = "pity", text = "Tyrande still waits for him. I pity her more than him.", fx = { opinion = { malfurion = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "She waits as only the kaldorei can, which is to say longer than any of us will live. It's a sad thing, and a faithful one.", fx = { affinity = 1 } },
    { id = "b", text = "Don't pity the High Priestess. She's held her people together without him, and she'd not thank you for the sentiment." },
  } },
} }

P:Views { topic = "sisterhood_of_elune", views = {
  { id = "priest", when = { class = "PRIEST" }, text = "The Light and the Moon may be closer kin than we think.", fx = { opinion = { sisterhood_of_elune = "kinship" }, trait = { curious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "The priestesses would smile at that, I think. Healing is healing, whatever name is on the prayer.", fx = { affinity = 1 } },
    { id = "b", text = "Say it softly in Darnassus. Some of the Sisters would hear it as a compliment, and some as an insult." },
  } },
  { id = "honor", text = "The Moon's light heals as well as any. I honor the Sisterhood.", fx = { opinion = { sisterhood_of_elune = "respect" }, trait = { pious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Then you honor the oldest faith on Kalimdor. They kept Elune's temple long before the first human prayed to anything.", fx = { affinity = 1 } },
    { id = "b", text = "Well said. Spend a night in the Temple of the Moon sometime, and you'll understand why they're so calm." },
  } },
  { id = "doubt", text = "Prayers to the moon won't stop a blade.", fx = { opinion = { sisterhood_of_elune = "doubt" }, trait = { skeptical = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "The priestesses carry glaives too, {class}, and they've stopped plenty of blades with them. They don't only pray.", fx = { affinity = -1 } },
    { id = "b", text = "Maybe not, but they'll mend the hole the blade leaves, and you'll be glad of it then." },
  } },
  { id = "fight", text = "Healers who can also fight. That's a sisterhood worth having close.", fx = { opinion = { sisterhood_of_elune = "admire" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "It is. Tyrande rode into the War of the Ancients at the head of them, and they've never forgotten how." },
    { id = "b", text = "Aye, there's few you'd rather have behind you in a fight. Just don't mistake their quiet for softness." },
  } },
} }

P:Views { topic = "sentinels", views = {
  { id = "murder", when = { faction = "Horde" }, text = "They kill peons cutting wood and call it justice. I call it murder.", fx = { opinion = { sentinels = "hate" }, trait = { stern = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "So does every grunt at Splintertree. The elves never once asked us to talk before the arrows started.", fx = { affinity = 1 } },
    { id = "b", text = "They'd say the trees are their kin and we're the murderers. It's that kind of war, and it won't end soon." },
  } },
  { id = "admire", text = "They've guarded that forest for ten thousand years. I admire that.", fx = { opinion = { sentinels = "admire" }, trait = { kind = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "As do I. The Sentinels held the line when there was no one else to hold it, and they still do it without complaint.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Horde" }, text = "Admire them from a distance, then. They'll not admire you back." },
  } },
  { id = "cunning", text = "Strike from cover and vanish. A smart way to hold a forest.", fx = { opinion = { sentinels = "respect" }, trait = { practical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "It is, and they've had a long time to practise. You'll never see the one who shoots you, only the owl she sends after." },
    { id = "b", text = "Smart, aye, though it's won them few friends. People don't like enemies they can't see." },
  } },
  { id = "distrust", text = "They shoot first and never ask. That's not my idea of allies.", fx = { opinion = { sentinels = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "They've had ten thousand years of strangers to be wary of, {class}. Give them a reason and they'll lower the bow." },
    { id = "b", when = { faction = "Alliance" }, text = "They're careful, not cruel. Walk into Ashenvale with an axe and you'd be shot too, and rightly.", fx = { affinity = -1 } },
  } },
} }

P:Views { topic = "warsong", views = {
  { id = "necessary", when = { faction = "Horde" }, text = "The Horde needs timber, and the Warsong get it. That's necessary.", fx = { opinion = { warsong = "necessary" }, trait = { practical = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "It is, and Orgrimmar wasn't built from cactus. Every beam in the Warchief's hall came out of that forest.", fx = { affinity = 1 } },
    { id = "b", text = "Necessary, aye, but it's buying us a war with the elves that has no end. Someday we'll pay for every stump." },
  } },
  { id = "restrain", when = { faction = "Horde" }, text = "The Warsong should cut with care. Endless enemies serve no one.", fx = { opinion = { warsong = "restrain" }, trait = { cautious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "There are elders in Thunder Bluff who'd say the same. The Earth Mother doesn't care whose axe it is.", fx = { affinity = 1 } },
    { id = "b", text = "Tell that to the grunts at Splintertree, who've lost friends to the Sentinels. They're past careful." },
  } },
  { id = "proud", when = { faction = "Horde" }, text = "Grom's clan slew Mannoroth. They fight for the Horde still.", fx = { opinion = { warsong = "admire" }, trait = { proud = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "They do, and they carry Grom's name like a banner. Hellscream gave his life to free us all, and the Warsong never let anyone forget it.", fx = { affinity = 1 } },
    { id = "b", text = "Grom also drank demon blood a second time, and in that same forest. The Warsong remember both halves, and so should you." },
  } },
  { id = "hate", when = { faction = "Alliance" }, text = "They're butchering an ancient forest for firewood. They deserve every arrow.", fx = { opinion = { warsong = "hate" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "The Sentinels would agree, and they've more arrows than the orcs have axes. Ashenvale has been bleeding for years.", fx = { affinity = 1 } },
    { id = "b", text = "Every arrow is a hard thing to wish on anyone. Still, I'll not weep for them while they're cutting." },
  } },
  { id = "pity", when = { faction = "Alliance" }, text = "Most of them are only peons with axes. They're not to blame.", fx = { opinion = { warsong = "pity" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "A kind way to see it, {class}, and a rare one. The ones who give the orders never swing an axe themselves." },
    { id = "b", text = "Try telling that to the dryads. The trees don't much care who's holding the axe.", fx = { affinity = -1 } },
  } },
  { id = "respect", when = { faction = "Alliance" }, text = "Grom's clan fought demons once. I'll respect them as soldiers.", fx = { opinion = { warsong = "respect" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Fair words. They're hard foes, and they fight like they've nothing left to lose, which may well be true." },
    { id = "b", text = "Soldiers, maybe, but in a war they started. Respect them if you like, just never turn your back on one." },
  } },
} }

P:Views { topic = "silithid", views = {
  { id = "fear", text = "Insects that swarm by the thousand. They frighten me more than dragons.", fx = { opinion = { silithid = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "They should. A dragon is one beast with one mind, and the silithid are a whole desert that thinks together." },
    { id = "b", text = "You're wise to fear them. The hives in Tanaris and Feralas grow bigger every season, and nobody has learned to stop them." },
  } },
  { id = "burn", text = "Burn the hives before they spread any further.", fx = { opinion = { silithid = "hate" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Easier said than done, {class}. The hives run deep under the sand, and burning the top only makes the rest angry." },
    { id = "b", text = "Somebody will have to, someday. Better you than me, though, because I've seen what they leave of a caravan." },
  } },
  { id = "curious", text = "Bugs don't plan like that. Something must be driving them.", fx = { opinion = { silithid = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "That's what the scholars in Darnassus fear as well. Gracina has been asking for samples from every hive anyone can reach." },
    { id = "b", text = "A sharp thought, and an uncomfortable one. Bring back a few samples and let wiser heads puzzle it out." },
  } },
} }

P:Views { topic = "fel_moss", views = {
  { id = "fear", text = "Fel taint on Teldrassil itself. That's a bad sign for the tree.", fx = { opinion = { fel_moss = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "It is, and the druids know it, though they'd rather you didn't say so in Dolanaar. They're working hard to keep it small.", fx = { affinity = 1 } },
    { id = "b", text = "A bad sign, aye, but only a sign so far. Root it out quickly and the tree may yet be well." },
  } },
  { id = "purge", text = "Tear it out by the roots and burn every scrap.", fx = { opinion = { fel_moss = "hate" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "That's the plan, more or less. Bring the moss you find to the druids and they'll see it destroyed properly." },
    { id = "b", text = "Careful with the burning, {class}. Fire in a forest of this size is its own sort of corruption." },
  } },
  { id = "pity", text = "The Gnarlpine never asked for it. Cure them if anyone can.", fx = { opinion = { fel_moss = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Kindly said. The Gnarlpine were friends to the kaldorei once, and the druids grieve every one we lose.", fx = { affinity = 1 } },
    { id = "b", text = "If there's a cure, the druids will find it. Until then, the corrupted ones must be stopped, friend or no." },
  } },
} }

P:Views { topic = "furbolgs", views = {
  { id = "pity", text = "They were friends to the elves once. The corruption isn't their fault.", fx = { opinion = { furbolgs = "pity" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "No, it isn't, and that's what makes it so cruel. The Timbermaw up north still keep their wits, and they grieve for their cousins.", fx = { affinity = 1 } },
    { id = "b", text = "It isn't, but they'll kill you all the same. Pity them, by all means, after you've got your back to a wall." },
  } },
  { id = "kill", text = "Corrupted or not, they're killing people. I'll put them down.", fx = { opinion = { furbolgs = "hate" }, trait = { practical = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Somebody has to, I suppose. Just don't go hunting the Timbermaw by mistake; they're sane, and they remember a grudge." },
    { id = "b", text = "A hard answer to a hard thing. I'd not argue, though I'd not take any pleasure in it either.", fx = { affinity = 1 } },
  } },
  { id = "cure", text = "If there's a cure, it's worth finding before they're all gone.", fx = { opinion = { furbolgs = "hope" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "The druids are trying, and some say the corruption comes from one source. Find that, and maybe you've found the cure." },
    { id = "b", when = { class = "DRUID" }, text = "That's a druid's thought, {class}, and a good one. The Circle would welcome any help in it.", fx = { affinity = 1 } },
  } },
} }

P:Views { topic = "dark_strand", views = {
  { id = "warlock", when = { class = "WARLOCK" }, text = "Fools. They bargain with demons without knowing how to hold the leash.", fx = { opinion = { dark_strand = "scorn" }, trait = { proud = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "And you know how to hold it, I suppose. Pray you're right, {class}, because the Tower of Althalaxx is full of people who thought the same." },
    { id = "b", text = "That's a warlock's answer, and not a comforting one. I'll take your word that there's a difference." },
  } },
  { id = "hate", text = "Anyone who calls on demons should be put down. No exceptions.", fx = { opinion = { dark_strand = "hate" }, trait = { stern = 1 }, align = { light = 1, order = 1 } }, replies = {
    { id = "a", text = "Delgren would agree with every word. The Legion burned the world once already, and these fools want to let it back in.", fx = { affinity = 1 } },
    { id = "b", text = "No exceptions is a big promise. Still, I'll not argue for the Dark Strand; they'd sell us all for a scrap of power." },
  } },
  { id = "curious", text = "I'd like to know what they found in that tower first.", fx = { opinion = { dark_strand = "curious" }, trait = { curious = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "That's the sort of curiosity that made the Dark Strand in the first place. Read their books and you'll want to read the next ones too.", fx = { affinity = -1 } },
    { id = "b", text = "Knowing your enemy is no sin. Just bring whatever you find to someone who knows how to burn it safely." },
  } },
} }

-- Lordaeron's plagued lands ----------------------------------------------------------------

P:Views { topic = "plague_cauldrons", views = {
  { id = "scorn", when = { race = "Scourge" }, text = "Crude Scourge work. Our apothecaries could brew better asleep.", fx = { opinion = { plague_cauldrons = "scorn" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "No doubt, and they'll tell you so at length. Crude or not, those cauldrons poison the whole country." },
    { id = "b", text = "Better is a word I'd use carefully about plague. Still, I'll not argue with an expert." },
  } },
  { id = "smash", text = "Every cauldron I find, I'll smash, and every cultist with it.", fx = { opinion = { plague_cauldrons = "hate" }, trait = { brave = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Then you'll have your work cut out, because the Cult of the Damned keeps building more. Start with the ones near Felstone Field.", fx = { affinity = 1 } },
    { id = "b", text = "Good. Watch the guardians, though; the Scourge don't leave their brews unattended, and they don't take it kindly." },
  } },
  { id = "fear", text = "Poisoning the very air of a country. That's the Scourge in one thought.", fx = { opinion = { plague_cauldrons = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "It is, and it works. Breathe too long near one and you'll understand why nothing grows in the Plaguelands." },
    { id = "b", text = "Aye, they don't fight like an army, they fight like a sickness. That's why swords alone won't end it." },
  } },
  { id = "study", text = "Take a sample first. Know your poison before you fight it.", fx = { opinion = { plague_cauldrons = "study" }, trait = { practical = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "That's the apothecaries' way and the Argent Dawn's both, though they'd hate to hear they agree on anything." },
    { id = "b", text = "Carefully, {class}, and in a sealed vial. Plenty of clever people have studied the plague up close and joined it." },
  } },
} }

P:Views { topic = "andorhal", views = {
  { id = "forsaken", when = { race = "Scourge" }, text = "Andorhal belongs to the Dark Lady now, if we can hold it.", fx = { opinion = { andorhal = "claim" }, trait = { proud = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "If is the word. The Scourge hold the streets, the Alliance holds the road, and the Bulwark is a long way back." },
    { id = "b", text = "Some of us lived there, once. I'd like it back too, though I'm not sure what I'd do with it now." },
  } },
  { id = "reclaim", when = { faction = "Alliance" }, text = "Lordaeron will take it back, street by street.", fx = { opinion = { andorhal = "reclaim" }, trait = { brave = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Chillwind Camp says the same every morning. It's a fine thing to say and a hard thing to do, but somebody has to start.", fx = { affinity = 1 } },
    { id = "b", text = "Street by street is how it'll go, aye, and every street costs. Count the dead before you count the streets." },
  } },
  { id = "pity", text = "A city of farmers, poisoned through their own bread. It's a horror.", fx = { opinion = { andorhal = "pity" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "It was, and the worst of it is how quiet it was. Kel'Thuzad's cult only had to wait for supper.", fx = { affinity = 1 } },
    { id = "b", text = "The grain went out from Andorhal to half of Lordaeron, and the plague went with it. That's how a kingdom dies." },
  } },
  { id = "burn", text = "Burn it to the ground. There's nothing left there worth saving.", fx = { opinion = { andorhal = "hate" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Some days I'd agree with you. But the Scourge would only build on the ashes, and fire never killed a plague yet." },
    { id = "b", when = { faction = "Alliance" }, text = "There were families there, {class}, and some of their kin still hope. Say it gentler near the camp.", fx = { affinity = -1 } },
  } },
} }

P:Views { topic = "scholomance", views = {
  { id = "burn", text = "A school for necromancers. I'd burn every book in it.", fx = { opinion = { scholomance = "hate" }, trait = { stern = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Many would help you strike the match. Caer Darrow was a lovely place once, and now even the lake looks wrong.", fx = { affinity = 1 } },
    { id = "b", text = "Burn them, aye, but read a few first if you can stomach it. You can't fight what you don't understand." },
  } },
  { id = "study", text = "I'd like a look at those books, if only to know the enemy.", fx = { opinion = { scholomance = "curious" }, trait = { curious = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "That's exactly what every student there said on their first day. Be careful what you learn, {class}.", fx = { affinity = -1 } },
    { id = "b", text = "There's sense in it, though the Barovs thought themselves sensible too, and look where it got them." },
  } },
  { id = "barov", text = "The Barovs sold their own island to Kel'Thuzad. Nobles never change.", fx = { opinion = { scholomance = "condemn" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "They sold it and then they died in it, which is about the only justice in the whole sorry tale." },
    { id = "b", text = "Not all nobles, maybe, but the Barovs certainly. Their heirs are still squabbling over what's left of the family name." },
  } },
} }

-- Burning Steppes and Blackrock ------------------------------------------------------------

P:Views { topic = "black_dragonflight", views = {
  { id = "fear", text = "Deathwing's children. I'd sooner face an army than one of them.", fx = { opinion = { black_dragonflight = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "So would most armies. The Burning Steppes are still smoking from the last time they took an interest in the place." },
    { id = "b", text = "Wise. They're cleverer than any general, and older than most kingdoms. Fear is the right answer." },
  } },
  { id = "hunt", text = "Every dragon bleeds. Someday I'll prove it on a black one.", fx = { opinion = { black_dragonflight = "hate" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Plenty have sworn the same at the bottom of Blackrock Mountain. Very few of them came back down to tell us how it went." },
    { id = "b", text = "That's a bold vow, {class}. Grow into it, and maybe the bards will have something to sing about one day." },
  } },
  { id = "hoard", text = "A dragon's hoard is a dragon's hoard. I'd be rich for life.", fx = { opinion = { black_dragonflight = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Rich for a very short life, maybe. The gold is the easy part; it's the dragon sitting on it that's the trouble." },
    { id = "b", text = "Ha! You and every sellsword in the Steppes. Not one of them has spent a coin of it yet." },
  } },
} }

P:Views { topic = "blackrock_spire", views = {
  { id = "rend", when = { faction = "Horde" }, text = "Rend Blackhand betrayed Thrall. His Dark Horde will answer for it.", fx = { opinion = { blackrock_spire = "hate" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "They will. The Warchief hasn't forgotten, and neither has any orc who remembers what honour means.", fx = { affinity = 1 } },
    { id = "b", text = "Rend sits on his father's throne and calls himself Warchief. One day someone will climb up there and correct him." },
  } },
  { id = "glory", text = "A fortress full of orcs and dragons. That's where the glory is.", fx = { opinion = { blackrock_spire = "glory" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Glory, and a long fall, and a great deal of fire. Bring friends, {class}, and plenty of them." },
    { id = "b", text = "Ha! That's the spirit, though spirit won't help you much against what lives at the top." },
  } },
  { id = "fear", text = "Whole armies went up that mountain and never came down.", fx = { opinion = { blackrock_spire = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "They did. Windsor's company is the latest of them, and there'll be more before the mountain's emptied." },
    { id = "b", text = "That's why the camps in the Steppes watch it from a distance. Somebody has to, and somebody has to stay alive to report." },
  } },
} }

P:Views { topic = "blackrock_depths", views = {
  { id = "dwarf", when = { race = "Dwarf" }, text = "The Dark Irons will pay for every Bronzebeard they've killed.", fx = { opinion = { blackrock_depths = "hate" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Aye, and there's a long tally to pay. Every Bronzebeard alive has a name to add to it.", fx = { affinity = 1 } },
    { id = "b", text = "They will, someday. Just don't go down there alone to collect, {g:lad|lass}; that city swallows the brave and the stupid alike." },
  } },
  { id = "wonder", text = "A whole city in the roots of the mountain. I'd like to see it.", fx = { opinion = { blackrock_depths = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "So would I, from a safe distance. They say the Dark Irons built it as grand as Ironforge, and twice as hot." },
    { id = "b", text = "Seeing it's easy. Seeing it and walking back out is the trick, and not many have managed it." },
  } },
  { id = "fear", text = "Dark Irons, fire, and worse beneath them. I'll keep my distance.", fx = { opinion = { blackrock_depths = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Worse is right. Whatever Thaurissan called up is still down there, and the Dark Irons serve it now." },
    { id = "b", text = "No shame in that. The mountain's been hungry since the day it was made, and it doesn't mind who it eats." },
  } },
  { id = "steel", text = "Dark Iron forges make the finest steel. I'd like some of it.", fx = { opinion = { blackrock_depths = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Everyone would. The Dark Irons know their forges, I'll give them that, and they'll not share the secrets for love nor gold." },
    { id = "b", text = "Then bring a Dark Iron's hammer back with you, {class}. That's the only way anyone's ever bought it." },
  } },
} }

P:Views { topic = "windsor", views = {
  { id = "horde", when = { faction = "Horde" }, text = "A human marshal in Dark Iron chains. That's not my problem.", fx = { opinion = { windsor = "indifferent" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Maybe not, but the Dark Irons who took him are everybody's problem. They'd chain you just as gladly." },
    { id = "b", text = "Fair enough. Still, a man who rides into the Steppes with so few is someone worth hearing about, whatever his colours." },
  } },
  { id = "admire", text = "A marshal who rode into the Steppes himself. That takes courage.", fx = { opinion = { windsor = "admire" }, trait = { brave = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "It does. He didn't send men where he wouldn't go himself, and that's rarer than it should be among marshals.", fx = { affinity = 1 } },
    { id = "b", text = "Courage, aye, and maybe a little too much of it. The Dark Irons were waiting for him all the same." },
  } },
  { id = "rescue", text = "If he's still alive, somebody should go and fetch him back.", fx = { opinion = { windsor = "rescue" }, trait = { kind = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", when = { faction = "Alliance" }, text = "Somebody should, and Maxwell would give his eyeteeth to be that somebody. He just hasn't the soldiers to spare.", fx = { affinity = 1 } },
    { id = "b", text = "Somebody should. The Dark Irons don't keep prisoners out of kindness, so whatever they want from him, time is short." },
    { id = "c", when = { faction = "Alliance" }, text = "That's the hope we cling to at Morgan's Vigil. Go deep enough into the mountain and you might find out." },
  } },
  { id = "write_off", text = "A man that deep in Dark Iron hands is gone. Mourn and move on.", fx = { opinion = { windsor = "doubt" }, trait = { practical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "You'd not say that if you'd served under him. Some men are worth one more try, {class}.", fx = { affinity = -1 } },
    { id = "b", text = "Maybe you're right, and maybe I'm a fool for hoping. I'll keep hoping all the same." },
  } },
} }

P:Views { topic = "thaurissan", views = {
  { id = "condemn", text = "He called up a fire god to win a feud. That's madness.", fx = { opinion = { thaurissan = "condemn" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Madness that's still burning. Every scorched stone you see in the Steppes is a piece of that one bad idea." },
    { id = "b", text = "It was, and he died for it in the same breath. The trouble is, everyone else kept on paying." },
  } },
  { id = "pity", text = "The Dark Irons have paid for his folly for centuries. I almost pity them.", fx = { opinion = { thaurissan = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Almost is the right word. They serve the thing that ruined them, and they seem to like it well enough." },
    { id = "b", when = { race = "Dwarf" }, text = "Pity a Dark Iron, would ye? Keep that well away from Ironforge, {g:lad|lass}, or ye'll be drinking alone.", fx = { affinity = -1 } },
  } },
  { id = "awe", text = "To call up Ragnaros himself. Whatever else he was, he had power.", fx = { opinion = { thaurissan = "awe" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Power enough to burn a kingdom, and not enough to send it home again. That's the kind worth avoiding." },
    { id = "b", text = "He had power, and look what it bought him. The ruins of his city are still warm to the touch." },
  } },
} }

P:Views { topic = "firegut", views = {
  { id = "hate", text = "Ogres are big and stupid, and these are in my way.", fx = { opinion = { firegut = "hate" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Big, aye, but not as stupid as you'd like. The Fireguts set ambushes along the roads, and they set them well." },
    { id = "b", text = "Then clear the way, {class}, and every camp in the Steppes will thank you for it. They've been a thorn in our side for years." },
  } },
  { id = "fear", text = "Someone's teaching ogres fire magic. That worries me more than the ogres.", fx = { opinion = { firegut = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "You're not wrong. They took to the fires of the mountain like they were born for it, and now they guard the passes for whoever pays." },
    { id = "b", text = "Sharp of you. Ogre mages were trouble enough in the Second War, and these are no better." },
  } },
  { id = "hire", text = "They sell their axes to anyone. Maybe someone should outbid the Dark Irons.", fx = { opinion = { firegut = "profit" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Ha! You'd need a lot of gold, and a lot of patience for bad manners. Ogres don't stay bought for long." },
    { id = "b", text = "Somebody tried that once. The ogres took his gold and then took his head, so I'd keep your purse closed." },
  } },
} }

-- Blasted Lands ---------------------------------------------------------------------------

P:Views { topic = "dark_portal", views = {
  { id = "orc", when = { race = "Orc" }, text = "My people came through that gate. I won't pretend it means nothing.", fx = { opinion = { dark_portal = "remember" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Nor should you. It's where your people's story here begins, for good and ill, and it's honest to say so." },
    { id = "b", text = "A lot of people would sooner forget it, and a lot of people never will. Stand there long enough and you'll feel both." },
  } },
  { id = "smash", text = "That gate let the Horde into this world. I'd see it smashed.", fx = { opinion = { dark_portal = "hate" }, trait = { stern = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "It's already broken, mostly. The mages at Nethergarde keep watch on it all the same, because broken isn't the same as gone.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Horde" }, text = "Smashing it now changes nothing, {class}. The Horde is here, and here is where we'll make our home." },
  } },
  { id = "honor", text = "Brave soldiers went through it and never came back. I honor them.", fx = { opinion = { dark_portal = "honor" }, trait = { kind = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "As do we all. Khadgar and Turalyon led them through to finish the war, and they sealed it behind them so we'd be safe.", fx = { affinity = 1 } },
    { id = "b", text = "They're remembered at Nethergarde every night. The soldiers raise a cup to the ones on the other side." },
  } },
  { id = "curious", text = "I'd like to know what's on the other side now.", fx = { opinion = { dark_portal = "curious" }, trait = { curious = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "So would every mage in Nethergarde, and not one of them would go and find out. Some doors are better studied than opened.", fx = { affinity = -1 } },
    { id = "b", text = "The orcs' old world, and nobody knows what's left of it. I'd not go looking, myself, but you've a different sort of spirit." },
  } },
} }

P:Views { topic = "burning_legion", views = {
  { id = "blood", when = { race = "Orc" }, text = "They poisoned my people's blood. I'll never forgive them that.", fx = { opinion = { burning_legion = "hate" }, trait = { stern = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "No orc should. Grom spilled Mannoroth's blood to break that curse, and the Horde has kept faith with his sacrifice.", fx = { affinity = 1 } },
    { id = "b", text = "Then keep your hate sharp and your eyes open. The Legion doesn't forget a people it's owned." },
  } },
  { id = "remember", when = { race = "NightElf" }, text = "We fought them before the world was broken. We remember.", fx = { opinion = { burning_legion = "remember" }, trait = { proud = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Your people remember it better than anyone living, and Hyjal proved you'd learned the lesson.", fx = { affinity = 1 } },
    { id = "b", text = "Ten thousand years is a long time to carry a war. I hope it's lighter for having the rest of us now." },
  } },
  { id = "hate", text = "The Legion is the enemy of everything that lives. No mercy.", fx = { opinion = { burning_legion = "hate" }, trait = { brave = 1 }, align = { light = 2 } }, replies = {
    { id = "a", text = "No mercy, and none expected. Archimonde fell at Hyjal, but his kind are still out there somewhere, and still hungry.", fx = { affinity = 1 } },
    { id = "b", text = "That's the one thing Horde and Alliance agree on, and we only agreed on it when the world was burning." },
  } },
  { id = "fear", text = "They were beaten at Hyjal. I pray they stay beaten.", fx = { opinion = { burning_legion = "fear" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "So do we all. Still, there's a demon lord loose in the Tainted Scar right now, so they're not entirely gone." },
    { id = "b", text = "Pray if it helps, but keep your blade sharp as well. Prayer and steel both held the line at Hyjal." },
  } },
  { id = "power", text = "Their power's real. A clever mind could learn from it.", fx = { opinion = { burning_legion = "covet" }, trait = { curious = 1 }, align = { light = -2 } }, replies = {
    { id = "a", text = "Every fool who ever opened a door to them said the same. Keep talking like that and someone with a sharper blade will hear of it.", fx = { affinity = -1 } },
    { id = "b", when = { class = "WARLOCK" }, text = "A warlock's way of looking at it, {class}. Just remember who's learning from whom." },
  } },
} }

P:Views { topic = "nethergarde", views = {
  { id = "respect", text = "Holding a keep at the edge of the world's worst wound. They earn their pay.", fx = { opinion = { nethergarde = "respect" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Every coin of it, and then some. The supplies come late, the ogres come early, and the soldiers still stand their watch.", fx = { affinity = 1 } },
    { id = "b", text = "They do. Lungertz will tell you so himself, and then he'll tell you what they're short of this week." },
  } },
  { id = "pity", text = "Stuck in a wasteland, watching a dead gate. I'd go mad.", fx = { opinion = { nethergarde = "pity" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Some of them have, a little. The Blasted Lands do that to you, and the red dust gets in everything." },
    { id = "b", text = "It's dull work until it isn't, {class}, and the day it isn't, you'll be glad somebody was watching." },
  } },
  { id = "waste", text = "Mages in a fortress, guarding a shut door. Seems a waste of gold.", fx = { opinion = { nethergarde = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Say that to the demons in the Tainted Scar. The door's shut, aye, but things still crawl out of the ground round here.", fx = { affinity = -1 } },
    { id = "b", text = "Gold spent watching is cheaper than gold spent rebuilding Stormwind. The Kirin Tor learned that the hard way." },
  } },
} }

P:Views { topic = "dreadmaul", views = {
  { id = "thin", text = "Ogres raiding Nethergarde's supply lines. Somebody needs to thin them out.", fx = { opinion = { dreadmaul = "hate" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Somebody does, and Lungertz has been asking for weeks. Every wagon they take is a week of short rations at the keep.", fx = { affinity = 1 } },
    { id = "b", text = "Take a few friends if you mean it. The Dreadmaul hunt in packs out there, and they've no fear of a lone sword." },
  } },
  { id = "mock", text = "Ogres picking fights with a fortress. They're not the brightest sort.", fx = { opinion = { dreadmaul = "mock" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Not bright, but there's a lot of them, and they hit hard enough that the brightness hardly matters." },
    { id = "b", text = "Laugh while you can. The last soldier who laughed at them walked back to Nethergarde holding his own arm." },
  } },
  { id = "careful", text = "Big enough to flatten a horse. I'll pick my fights carefully out there.", fx = { opinion = { dreadmaul = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Wise of you. They hold the rock round Dreadmaul Hold and they know every cliff in it." },
    { id = "b", text = "Good, because they won't. Ogres pick fights the way other folk pick their teeth, without thinking about it." },
  } },
} }

P:Views { topic = "tainted_scar", views = {
  { id = "kill", text = "A demon lord loose in Azeroth. He has to be put down.", fx = { opinion = { tainted_scar = "hate" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Kazzak, aye, and he'll not go easy. It'll take an army, and a better one than Nethergarde can spare.", fx = { affinity = 1 } },
    { id = "b", text = "He has, and someday someone will. Just don't let it be you on your own, {class}; he eats heroes for breakfast." },
  } },
  { id = "fear", text = "Demons still walking our world. That chills me to the bone.", fx = { opinion = { tainted_scar = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "It should. The Scar is only a short walk from the keep, and some nights you can see the fel-fire glow from the walls." },
    { id = "b", text = "We all feel it out here. The Legion was beaten, but it left things behind, and they haven't forgotten us." },
  } },
  { id = "glory", text = "Whoever kills Kazzak will have a name forever. I'd like that name.", fx = { opinion = { tainted_scar = "glory" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "So would a great many dead heroes. Build your name a little first, and then we'll talk about Kazzak." },
    { id = "b", text = "Ha! I like your nerve, if not your odds. Come back with an army of friends and I'll believe it." },
  } },
} }

P:Views { topic = "draenethyst", views = {
  { id = "profit", text = "If the collector pays, I'll fetch his crystals all day long.", fx = { opinion = { draenethyst = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "He pays, in his way, but mind the scorpids while you're picking them up. They like the shiny ones too." },
    { id = "b", text = "That's honest, at least. Kum'isha doesn't care why you bring them, only that you do." },
  } },
  { id = "curious", text = "Crystals from no land I know. I wonder what they're really for.", fx = { opinion = { draenethyst = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "So does everyone who's met him. He's never said, and I've never heard anyone brave enough to press him on it." },
    { id = "b", text = "The mages at Nethergarde would love to know too, but he won't let them near a single one." },
  } },
  { id = "gentle", text = "Whatever they are, they matter to him. I'll handle them gently.", fx = { opinion = { draenethyst = "respect" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "That's a decent thought, {class}. He treats each one like it's a relic, so I'd guess you're right.", fx = { affinity = 1 } },
    { id = "b", text = "A kind thought for a strange old soul. He'd never say thank you, but I think he'd notice." },
  } },
} }

P:Views { topic = "khadgar", views = {
  { id = "horde", when = { faction = "Horde" }, text = "He fought my people in the Second War. I can respect a strong enemy.", fx = { opinion = { khadgar = "respect" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "He was a strong one, by every account. The old Horde had few foes it feared more than that young archmage." },
    { id = "b", text = "Respect is fair, and more than most would give. He's beyond the Portal now, and beyond anyone's grudges." },
  } },
  { id = "admire", text = "Medivh's apprentice helped end the Second War. That's a hero to me.", fx = { opinion = { khadgar = "admire" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "To plenty of us too. The Kirin Tor built Nethergarde to watch the gate he went through, and the soldiers there still speak his name with respect.", fx = { affinity = 1 } },
    { id = "b", text = "A hero, aye, and a young one when he did it. He stood beside Lothar when everyone else was afraid to." },
  } },
  { id = "hope", text = "I hope he's alive out there, wherever there happens to be.", fx = { opinion = { khadgar = "hope" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "So do we all. Some nights the old soldiers raise a cup to him, just in case he's still out there to drink it.", fx = { affinity = 1 } },
    { id = "b", text = "Hope is cheap in the Blasted Lands, {class}, but it's the only thing we have plenty of. I'll share mine with you." },
  } },
  { id = "distrust", text = "His master was Medivh, and we know how that ended.", fx = { opinion = { khadgar = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Khadgar was the one who stopped Medivh, {class}, so I'd mind how you say that around here.", fx = { affinity = -1 } },
    { id = "b", text = "A suspicious way to think, though not a foolish one. Even so, he gave up everything to close that door behind him." },
  } },
} }

-- Ancient Kalimdor -----------------------------------------------------------------------

P:Views { topic = "highborne", views = {
  { id = "condemn", text = "Their pride brought the Legion down on the world. Never again.", fx = { opinion = { highborne = "condemn" }, trait = { stern = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Never again, aye. The kaldorei banned their magic for that very reason, and the druids still watch for it.", fx = { affinity = 1 } },
    { id = "b", text = "It was, though their children crossed the sea and built Quel'Thalas. Pride doesn't always end in ruin, only usually." },
  } },
  { id = "pity", text = "Not every Highborne followed Azshara. Some paid for others' crimes.", fx = { opinion = { highborne = "pity" }, trait = { kind = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Fairly said. Some stood with Malfurion at the end, and were exiled all the same when the war was done.", fx = { affinity = 1 } },
    { id = "b", text = "That's a generous view of a very old grudge. The night elves don't share it, so keep it gentle in Darnassus." },
  } },
  { id = "wonder", text = "Whatever their sins, their magic must have been a wonder.", fx = { opinion = { highborne = "admire" }, trait = { curious = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "A wonder that nearly ended the world, {class}. That's exactly what the Highborne said about it too.", fx = { affinity = -1 } },
    { id = "b", text = "It was, by every account, and you can still see traces of it in the ruins of Azshara. Look, but leave it be." },
  } },
} }

P:Views { topic = "queen_azshara", views = {
  { id = "condemn", text = "A queen who opened her world to demons. There's no worse betrayal.", fx = { opinion = { queen_azshara = "hate" }, trait = { stern = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "No, there isn't, and the kaldorei have never once spoken her name kindly since. She sold her people for a god's attention.", fx = { affinity = 1 } },
    { id = "b", text = "Betrayal is the word the night elves use, and they'd know. They lived through it." },
  } },
  { id = "fear", text = "A whole people worshipped her. That sort of power frightens me.", fx = { opinion = { queen_azshara = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "It should. She never needed an army, because her people would have done anything she asked, and did." },
    { id = "b", text = "Wise. Beauty and adoration are a crown no one can knock off your head, and she used it to the end." },
  } },
  { id = "doubt", text = "Ten thousand years beneath the sea. She's only a story now.", fx = { opinion = { queen_azshara = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Maybe. But the naga came up from the deep from somewhere, and they speak of their queen like she's still listening." },
    { id = "b", text = "Stories have long arms, {class}. The ruins along that coast bear her name, and something there still guards them." },
  } },
  { id = "cunning", text = "She nearly won with charm alone. I can respect that.", fx = { opinion = { queen_azshara = "admire" }, trait = { witty = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "That's a dangerous thing to admire. Charm alone also drowned a continent, if you'll remember.", fx = { affinity = -1 } },
    { id = "b", text = "Respect it, then, but from a very long way off. She had a way of making people want terrible things." },
  } },
} }
