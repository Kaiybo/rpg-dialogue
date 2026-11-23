-- Random letters and junk mail (0.80.0). random = true: never sent by a condition alone;
-- now and then (Letters.RANDOM_GAP, RANDOM_CHANCE) one of these whose `when` holds turns up.
-- junk = true: junk mail, rarer (weight 0.3 unless `weight` says otherwise), no journal line.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Letters from people you've met
---------------------------------------------------------------------------
P:Letter {
  id = "rand_farley", npc = "farley", random = true,
  subject = "Your room at the Lion's Pride",
  body = "{name},\n\nYou left a sock under the bed in the corner room, and I've kept it on a nail behind the bar in case you come back for it, though the cat has been taking an interest. Business is good. The miners from Jasperlode have started drinking here again now that the kobolds have been thinned out, and they sing worse than the kobolds ever did.\n\nIf you're passing through Goldshire, the stew is on and the fire is lit, same as always.\n\nInnkeeper Farley, the Lion's Pride Inn",
  replies = {
    { id = "sock", text = "Keep the sock on the nail, Farley. I'll come back for it.", fx = { affinity = 1, letter = "rand_farley_re_sock" } },
    { id = "cat", text = "Give the sock to the cat. It's clearly earned it." },
    { id = "miners", text = "Tell the miners to sing quieter, or I'll bring the kobolds back." },
  },
}

P:Letter {
  id = "rand_gazlowe", npc = "gazlowe", random = true,
  subject = "Ratchet's harbour, a friendly reminder",
  body = "{name},\n\nThis is a friendly note from the office of the boss of Ratchet, which is me, to say that the harbour is doing great, the boats are running on time, and anybody who tells you the docks are leaking money is a liar and probably works for the Venture Company.\n\nAlso, if you see a crate marked \"NOT EXPLOSIVES\" anywhere between here and the Crossroads, please don't open it, don't kick it, and send word to me personally. There's a finder's thank-you in it, which is a thank-you, so don't get excited.\n\nGazlowe, Ratchet",
  replies = {
    { id = "crate", text = "I'll watch for your crate, Gazlowe. What's actually in it?" },
    { id = "fine", text = "A thank-you is fine, Gazlowe. I'll leave the crate well alone.", fx = { affinity = 1 } },
    { id = "leak", text = "Your docks are leaking money, Gazlowe. Everyone in Ratchet knows it.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "rand_revilgaz", npc = "revilgaz", random = true,
  subject = "From the baron's balcony",
  body = "{name},\n\nThe baron has asked me to write and remind you that Booty Bay is a neutral port, that fighting on the docks is strictly forbidden, and that the bruisers have been given your description. He says this is not a threat, only a courtesy he extends to all his favourite customers.\n\nHe also says the Bloodsail have been seen off the point again, and that if you happen to sink one of their boats, he would not be the one to complain.\n\nBy the hand of the baron's clerk, for Baron Revilgaz",
  replies = {
    { id = "sink", text = "Tell the baron I'll sink a Bloodsail boat with pleasure.", fx = { affinity = 1 } },
    { id = "wrong", text = "I've never fought on his docks. The bruisers have the wrong description." },
    { id = "peace", text = "I'll keep the peace in his port, most days." },
  },
}

P:Letter {
  id = "rand_topper", npc = "topper", random = true, when = { letter = { id = "topper_true_letter", ["not"] = true } },
  subject = "A small matter",
  body = "Friend,\n\nI hope you're keeping warm. I had a dream last night that I was back on the farm, and the barn was standing, and Elsie was shouting at the hens, and I woke up in the doorway with the gutter running past my boots. I don't know why I'm writing to tell you that, except that you're the only one in the city who'd read it.\n\nIf you're ever by the canal, I've a new story about a gryphon that I'd like to try out on someone.\n\nTopper McNabb",
  replies = {
    { id = "gryphon", text = "I'd love to hear the gryphon story, Topper. Save it for me.", fx = { affinity = 1 } },
    { id = "elsie", text = "You should write to Elsie and tell her about that dream.", fx = { affinity = 1, npcFlag = { set = "nudged_elsie" } } },
    { id = "walk", text = "Dreams won't get you back to the farm, Topper. Walking will.", fx = { affinity = -1 } },
  },
}

---------------------------------------------------------------------------
-- Letters from strangers (misdelivered, mistaken, or simply odd)
---------------------------------------------------------------------------
P:Letter {
  id = "rand_wrong_address", from = "Agnes Feller", stranger = true, random = true,
  subject = "Dearest Harold",
  body = "Dearest Harold,\n\nI know you said not to write until the harvest was in, but your mother has taken a turn and keeps asking where you've gone. I've told her you're in the city on business, which I suppose is true if you count the card tables at the Pig and Whistle as business.\n\nCome home, Harold. The roof leaks, the goat has escaped again, and I have run out of reasons to give your mother.\n\nYour loving Agnes\n\n(Below, in a different hand: \"Not for {name}. Misdelivered. Sorry. The Mail Office.\")",
  replies = {
    { id = "harold", text = "I'm not Harold, but I'll look for him at the Pig and Whistle.", fx = { flag = { set = "looking_for_harold" }, letter = "rand_wrong_address_re_harold" } },
    { id = "sorry", text = "I'm sorry, Agnes. I hope Harold comes home before the roof falls in." },
    { id = "goat", text = "Wrong address, I'm afraid. Good luck with the goat." },
  },
}

P:Letter {
  id = "rand_child", from = "Pip", stranger = true, random = true, when = { minLevel = 15 },
  subject = "are you the hero",
  body = "dear hero,\n\nmy brother says you are a hero and I said you are not because heroes have bigger swords, so we made a bet and the loser has to eat a beetle. please write back and tell me how big your sword is. If it is a staff or a bow that does not count.\n\nalso do you know any dragons.\n\nfrom Pip (age 7)",
  replies = {
    { id = "big", text = "My sword is very big, Pip. Your brother eats the beetle.", fx = { letter = "rand_child_re_big" } },
    { id = "dragon", text = "I know one dragon, Pip, but she isn't a nice one.", fx = { letter = "rand_child_re_dragon" } },
    { id = "beetle", text = "Heroes carry all sorts of weapons, Pip. Nobody should eat a beetle." },
  },
}

P:Letter {
  id = "rand_secret_admirer", from = "A friend", stranger = true, random = true, when = { minLevel = 20 },
  subject = "Unsigned",
  body = "{name},\n\nYou won't know me, and it's better that way, but I saw you once from across a crowded square and I've thought about it more than is sensible. You were helping someone who couldn't pay you, and you didn't make a show of it.\n\nThat's all. I don't want anything. I only thought someone ought to tell you that it was noticed.\n\nA friend",
  replies = {
    { id = "noticed", text = "Thank you, friend. I'd have done it whether anyone noticed or not." },
    { id = "meet", text = "Whoever you are, I'd like to meet you someday.", fx = { letter = "rand_secret_admirer_re_meet" } },
    { id = "strange", text = "Watching strangers across squares is a strange habit, friend." },
  },
}

P:Letter {
  id = "rand_horde_scout", from = "Sergeant Burzag", stranger = true, random = true, when = { faction = "Horde", minLevel = 12 },
  subject = "Report, misfiled",
  body = "To Captain Zukk of the Crossroads,\n\nThe raptors along the Gold Road have eaten two more supply kodos and one supply grunt, who was only mostly eaten and is now very angry. I need more spears, more grunts, and somebody to tell the quartermaster that \"make do\" is not a kind of armour.\n\nSergeant Burzag\n\n(Scrawled underneath: \"Wrong satchel. If you're not Zukk, burn this, and if you are Zukk, I'm still waiting.\")",
  replies = {
    { id = "quartermaster", text = "I'm not Zukk, but I'll tell the quartermaster that make do isn't armour." },
    { id = "burned", text = "Burned, as instructed. Good luck with the raptors, Sergeant." },
    { id = "grunt", text = "Tell the mostly eaten grunt I said to get well soon." },
  },
}

P:Letter {
  id = "rand_alliance_clerk", from = "Stormwind Office of Records", stranger = true, random = true, when = { faction = "Alliance", minLevel = 12 },
  subject = "Form 22-b, incomplete",
  body = "To the bearer of this name,\n\nOur records show that you entered the Kingdom of Stormwind at some point and have since left it, entered it again, and left it again, a number of times this office considers excessive. Please complete Form 22-b, Declaration of Comings and Goings, and return it in person to the Office of Records in the Keep.\n\nThe office is open on alternate mornings, except during holidays, inspections, and whenever the clerk is unwell.\n\nRespectfully, the Stormwind Office of Records",
  replies = {
    { id = "form", text = "Enclosed is Form 22-b, completed in full and in triplicate.", fx = { letter = "rand_alliance_clerk_re_form" } },
    { id = "morning", text = "I'll come in person on an alternate morning, if the clerk is well." },
    { id = "crown", text = "My comings and goings are my own business, thank you." },
  },
}

---------------------------------------------------------------------------
-- Junk mail
---------------------------------------------------------------------------
P:Letter {
  id = "junk_venture", from = "Venture Co. Recruitment", stranger = true, random = true, junk = true,
  subject = "YOU could be a Venture Co. associate!",
  body = "Hey there, valued future associate!\n\nAre you tired of risking your neck for gratitude? The Venture Company is growing fast, and we're looking for go-getters like YOU to join our exciting team in logging, mining, and strategic land acquisition across beautiful Kalimdor!\n\nBenefits include a hard hat, a hard hat replacement scheme at very reasonable rates, and the chance to see the Stonetalon Mountains before anyone else gets to them. No experience required, no questions answered.\n\nThe Venture Company. We'll take it from here!",
  replies = {
    { id = "pass", text = "I'll pass. I've seen what your hard hats are worth." },
  },
}

P:Letter {
  id = "junk_lottery", from = "Steamwheedle Grand Raffle", stranger = true, random = true, junk = true,
  subject = "CONGRATULATIONS, WINNER!!",
  body = "CONGRATULATIONS, {name}!\n\nYou have been selected from thousands of adventurers to receive a GRAND PRIZE in the Steamwheedle Grand Raffle! To claim your prize, simply send a small processing fee of fifty gold to Box 12, Gadgetzan, care of a goblin named Fizzy who is definitely real.\n\nPrizes include a mechanical chicken, a slightly used rocket, and a genuine map to the treasure of the Bloodsail, only some of which is drawn on.\n\nAct now! Offer expires when Fizzy leaves town.",
  replies = {
    { id = "fizzy", text = "Fizzy can keep my prize, and the mechanical chicken too." },
  },
}

P:Letter {
  id = "junk_tonic", from = "Doctor Wobblesprocket's Miracle Tonic", stranger = true, random = true, junk = true,
  subject = "Feeling tired? Achy? Slightly dead?",
  body = "Friend!\n\nAre you troubled by aching joints, poor sleep, murloc bites, ogre-related injuries, or a general sense that the world is ending? Then you need DOCTOR WOBBLESPROCKET'S MIRACLE TONIC, made from the finest swamp water in Dustwallow Marsh and only a little bit flammable.\n\nSatisfied customers say: \"I can see colours I didn't know existed!\" and \"Please stop writing to me.\"\n\nAvailable from wherever you happen to find Doctor Wobblesprocket, who moves around a lot for legal reasons.",
  replies = {
    { id = "stop", text = "Please stop writing to me." },
  },
}

P:Letter {
  id = "junk_chain", from = "Unknown", stranger = true, random = true, junk = true,
  subject = "Do not break the chain",
  body = "This letter has been around Azeroth nine times. It was started by a dwarf in Thelsamar who copied it out and sent it to ten friends, and a week later he found a mithril vein in his cellar.\n\nA troll in Grom'gol threw it away and was eaten by a raptor that same afternoon, though in fairness that happens most afternoons in Grom'gol.\n\nCopy this letter ten times and send it to ten friends within three days. Do not break the chain.",
  replies = {
    { id = "broken", text = "I've broken the chain. I'll let you know if a raptor comes." },
  },
}

P:Letter {
  id = "junk_cult", from = "Friends of the Dawn", stranger = true, random = true, junk = true,
  subject = "Have you thought about the end of the world?",
  body = "Greetings, seeker!\n\nThe world is full of sorrow, and the dead walk in the north, and the price of bread is outrageous. But what if there were a better way? The Friends of the Dawn meet every week in a perfectly ordinary cellar, where we talk about hope, change, and a very nice gentleman in a hooded robe.\n\nThere are no dues, no oaths, and no chanting unless you want to. Biscuits will be provided.\n\nYour friends in the Dawn",
  replies = {
    { id = "cellar", text = "No thank you. Hooded gentlemen in cellars never end well." },
  },
}

P:Letter {
  id = "junk_wanted_alliance", from = "Stormwind City Guard", stranger = true, random = true, junk = true, when = { faction = "Alliance" },
  subject = "Have you seen this man?",
  body = "WANTED, for public drunkenness, theft of a pie, and insulting the Cathedral pigeons: one Barnaby \"Two Mugs\" Hollis, last seen leaving the Old Town with a pie that was not his.\n\nHollis is of medium height, has a beard that may or may not be real, and will tell you he is a lord of Gilneas, which he is not.\n\nAny information should be given to the City Guard, who would very much like the pie back.",
}

P:Letter {
  id = "junk_wanted_horde", from = "Orgrimmar Grunts", stranger = true, random = true, junk = true, when = { faction = "Horde" },
  subject = "Lost kodo",
  body = "LOST: one kodo, grey, answers to Big Gorza or to the sound of a cabbage being dropped. Last seen wandering out of the Valley of Honor with a goblin's cart still attached and the goblin still in it, shouting.\n\nIf found, please return Big Gorza to the stables by the gates. The goblin can find his own way back.\n\nA reward of gratitude is offered, which is the only kind the stablemaster can afford.",
}

P:Letter {
  id = "junk_tailor", from = "Gilded Thread Outfitters", stranger = true, random = true, junk = true, when = { minLevel = 20 },
  subject = "An adventurer of your standing",
  body = "Esteemed {class},\n\nWe could not help but notice that an adventurer of your obvious distinction has been seen in public wearing whatever you happened to take off the last thing you killed. Gilded Thread Outfitters would be honoured to correct this.\n\nOur tailors work in silk, velvet, and an exciting new fabric we are not legally permitted to name. Matching boots are available, and so, for an additional fee, is matching dignity.\n\nGilded Thread Outfitters",
}

---------------------------------------------------------------------------
-- More letters from people you've met
---------------------------------------------------------------------------
P:Letter {
  id = "rand_allison", npc = "allison", random = true, when = { faction = "Alliance" },
  subject = "The Gilded Rose misses you",
  body = "{name},\n\nA guardsman came in last week asking whether a {race} {class} had been sleeping upstairs, and I told him I don't keep a list of my guests, which is true, because the list keeps itself in the ledger. He had a face like a wet week and left without buying anything, so I don't think you're in trouble, only that somebody wants to find you.\n\nThe beds are aired, the rooms are warm, and the bards have promised to learn a second song before the month is out. Come and hold them to it.\n\nInnkeeper Allison, the Gilded Rose",
  replies = {
    { id = "guard", text = "Who was the guardsman, Allison? Did he leave a name?" },
    { id = "list", text = "Thank you for not keeping a list, Allison. I'll be by soon.", fx = { affinity = 1 } },
    { id = "bards", text = "Hold the bards to that second song. One isn't much to ask." },
  },
}

P:Letter {
  id = "rand_belm", npc = "belm", random = true, when = { faction = "Alliance" },
  subject = "Snow in Kharanos",
  body = "Well met, {name}!\n\nThe snow's up to the windowsills in Kharanos and the Thunderbrew lads have rolled out a new cask to keep the cold off, which it does, right up until ye try to stand. Old Grimbeard at the fire says he remembers ye, though he says that about everyone who's ever bought him a pint.\n\nIf ye're ever back in Dun Morogh, there's a seat by the hearth with yer name scratched on it. Aye, scratched. One of the miners did it with his knife, and I've not had the heart to sand it off.\n\nBelm, Innkeeper at the Thunderbrew Distillery",
  replies = {
    { id = "seat", text = "Scratched or not, save me that seat by the hearth, Belm.", fx = { affinity = 1 } },
    { id = "grimbeard", text = "Tell Grimbeard I'll buy him a pint, whether he remembers me or not.", fx = { affinity = 1 } },
    { id = "cask", text = "I'll be home for that cask, Belm, and I'll stand if I can.", when = { race = "Dwarf" }, fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "rand_dughan", npc = "dughan", random = true, when = { faction = "Alliance", minLevel = 15 },
  subject = "From the Goldshire garrison",
  body = "{class},\n\nI'm told your name has been heard in taverns well beyond Elwynn, and some of what's said is even flattering. I don't hold with tavern talk, as you know, but I'll admit that I've let the new recruits believe I trained you myself, and I'd thank you not to correct them.\n\nThe kobolds are quieter this season and the Defias have pulled back toward Westfall, though I don't trust quiet. Keep your blade sharp and your wits sharper, and remember that Goldshire still remembers you.\n\nMarshal Dughan",
  replies = {
    { id = "recruits", text = "Tell the recruits whatever you like, Marshal. I won't correct them.", fx = { affinity = 1 } },
    { id = "did", text = "You did train me, Marshal, in your way.", fx = { affinity = 1 } },
    { id = "truth", text = "I'd rather you told the recruits the truth, Marshal.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "rand_renato", npc = "renato", random = true, when = { faction = "Alliance" },
  subject = "A vintage worthy of you!",
  body = "My dear friend {name}!\n\nI write with joyful news: this year's pressing at the Gallina Winery is the finest in living memory, and I say that every year, but this year I mean it more than usual. My grandmother tasted it and cried, though she cries at most things, so you must judge for yourself.\n\nYou have the palate of a noble and the boots of a traveller, which is the very best combination for a wine-lover. Come to the Trade District and let me pour you a cup while I tell you why the Westfall grapes will never be as good as ours.\n\nYour devoted friend, Renato Gallina",
  replies = {
    { id = "cup", text = "Save me a cup, Renato, and the Westfall argument too.", fx = { affinity = 1 } },
    { id = "westfall", text = "I've had Westfall wine, Renato, and honestly, it isn't bad.", fx = { affinity = -1, letter = "rand_renato_re_westfall" } },
    { id = "grandmother", text = "Tell your grandmother I hope the wine lives up to her tears." },
  },
}

P:Letter {
  id = "rand_grosk", npc = "grosk", random = true, when = { faction = "Horde" },
  subject = "From Razor Hill",
  body = "{name},\n\nThe Kul Tiran ships still sit off Tiragarde Keep, and the grunts on the walls grow tired of watching them. I keep the stew hot and the bunks empty so that tired warriors have somewhere to fall down. That is all an innkeeper can do, and I do it well.\n\nYou slept under my roof when you were still small and green in the eyes. I have heard you are less small now. Come back to Razor Hill and show me, and tell me the stories yourself, because the ones the peons tell are mostly about wolves eating someone.\n\nLok'tar,\nGrosk",
  replies = {
    { id = "stories", text = "I'll tell you the stories myself, Grosk, and none of them have wolves.", fx = { affinity = 1 } },
    { id = "stew", text = "Keep the stew hot. The Kul Tirans won't sit out there forever." },
    { id = "green", text = "Lok'tar, Grosk. I'm less small now, but still green in places.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "rand_boorand", npc = "boorand", random = true, when = { faction = "Horde" },
  subject = "The wind at the Crossroads",
  body = "{name},\n\nThe rains have finally come to the Barrens, and the grass outside the Crossroads has turned green for the first time since you passed this way. The kodo herds are fat and slow, and even the raptors seem to have found something better to do than bother the caravans.\n\nTravellers still sit in my inn and speak of the road ahead as if it will never end, and I think of you when I hear them. The road does end, young one, though usually somewhere warm with a bed in it. May the Earth Mother keep your feet steady until you find one.\n\nBoorand Plainswind, the Crossroads",
  replies = {
    { id = "warm", text = "A road that ends somewhere warm sounds wonderful, Boorand.", fx = { affinity = 1 } },
    { id = "grass", text = "I'm glad the grass has come back green at the Crossroads." },
    { id = "inn", text = "May the Earth Mother keep your inn warm until I'm back, Boorand.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "rand_zarlman", npc = "zarlman", random = true, when = { faction = "Horde", minLevel = 10 },
  subject = "Under the two moons",
  body = "Child of the plains,\n\nLast night the White Lady and the Blue Child rose together over Red Rocks, and the elders say that is a sign that a wanderer is being thought of. I do not know if the elders are right, but I was thinking of you, so perhaps they are.\n\nI hope the lands beyond Mulgore have been kind to you. When they are not, remember that the grass here still grows, the wind still speaks, and there is always a fire burning in Bloodhoof Village for those who walk the Earth Mother's path.\n\nMay the eternal sun shine upon you,\nZarlman Two-Moons",
  replies = {
    { id = "moons", text = "I was thinking of Mulgore too, under the same two moons.", fx = { affinity = 1 } },
    { id = "hard", text = "The lands beyond have been hard, but I remember the grass." },
    { id = "elders", text = "Tell the elders their sign was right this time, Zarlman.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "rand_norman", npc = "norman", random = true, when = { faction = "Horde" },
  subject = "A word from beneath the ruins",
  body = "{name},\n\nYou will be pleased to know that your room in the Undercity is exactly as you left it, because nobody here bothers to move anything, and the damp does the cleaning for us. A bat has taken up residence in the rafters above your bed. I have named it Lord Terenas, which some of my guests find tasteless and I find very satisfying.\n\nDo return when the living world grows tiresome, as it always does. We have candles, quiet, and a broth that I am assured tastes of something, though I can no longer say what.\n\nInnkeeper Norman, the Undercity",
  replies = {
    { id = "bat", text = "Lord Terenas the bat is welcome to share my room, Norman.", fx = { affinity = 1 } },
    { id = "broth", text = "I'll try the broth again and tell you what it tastes of." },
    { id = "beneath", text = "Naming a bat after the dead king is beneath you, Norman.", fx = { affinity = -1 } },
  },
}

---------------------------------------------------------------------------
-- More letters from strangers
---------------------------------------------------------------------------
P:Letter {
  id = "rand_bard", from = "Lyrrin Quickquill, bard", stranger = true, random = true, when = { minLevel = 25 },
  subject = "A ballad in need of a hero",
  body = "Most honoured {name},\n\nI am composing an epic ballad of the great deeds of our age, and your name has come to me from several innkeepers, two guards, and a fisherman who would not stop talking. I have nearly finished the verse in which you single-handedly slay a dragon, and I would be grateful to know whether you have, in fact, slain one.\n\nIf you have not, I would be grateful to know what you have slain, so that I can make it sound like a dragon. Very little rhymes with \"kobold\", and I am at my wits' end.\n\nYour admirer, Lyrrin Quickquill",
  replies = {
    { id = "kobolds", text = "I've slain a great many kobolds. Please make them sound fearsome.", fx = { letter = "rand_bard_re_kobolds" } },
    { id = "nodragon", text = "No dragon yet, Lyrrin. Leave that verse until I've earned it." },
    { id = "leave", text = "Please leave me out of the ballad entirely." },
  },
}

P:Letter {
  id = "rand_rival", from = "Brannoc Steelvein", stranger = true, random = true, when = { minLevel = 20 },
  subject = "We're not finished, you and I",
  body = "{name},\n\nYou don't know me, but I know you. I was halfway up the same hill as you last month, after the same beast, and you got there first and took the credit, and the bounty, and the very fine boots it was wearing. I've been training since then, and I mean to beat you to the next one.\n\nThis is fair warning, which is more than you gave me. Look over your shoulder now and then, {class}, and you'll see me coming, probably a little out of breath.\n\nBrannoc Steelvein, adventurer, and better than you",
  replies = {
    { id = "boots", text = "The boots fit beautifully, Brannoc. Come and take them if you can.", fx = { letter = "rand_rival_re_boots" } },
    { id = "sorry", text = "Sorry about the bounty. The next beast is yours, if you're quick." },
    { id = "who", text = "I'm afraid I don't remember you at all." },
  },
}

P:Letter {
  id = "rand_penpal", from = "Hettie Cogsworth", stranger = true, random = true, when = { minLevel = 10 },
  subject = "Hello from a stranger!",
  body = "Dear Adventurer,\n\nMy teacher at the school in Tinker Town says that we each have to write to a real adventurer and ask them a question, and the mailman said your name was the first one he could think of. My question is: what is the most interesting thing you have ever seen, and was it mechanical?\n\nI am nine and three quarters, I have built a wind-up rabbit that only goes backwards, and I am going to be the first gnome to take Gnomeregan back. Please write back soon, because my teacher marks us down if we only get one letter.\n\nYour pen pal (I hope), Hettie Cogsworth",
  replies = {
    { id = "shredder", text = "The most interesting thing I've seen was a goblin shredder, Hettie.", fx = { letter = "rand_penpal_re_shredder" } },
    { id = "dragon", text = "I saw a dragon once, Hettie, and it was not mechanical." },
    { id = "gnomeregan", text = "Good luck with Gnomeregan, Hettie. Build something that goes forwards first." },
  },
}

P:Letter {
  id = "rand_mistaken_dwarf", from = "Thorgen Deepbrow", stranger = true, random = true, when = { race = "Dwarf" },
  subject = "Cousin! Where've ye been?",
  body = "Cousin {name}!\n\nIt's been years, and ye never write, and Grandda's been askin' after ye every night at supper as though ye've only stepped out to fetch the salt. He's got it into his head that ye still owe him three silver from the time ye lost his best pick down the well at Gol'Bolar, and he'll nae let it go.\n\nI've told him ye're off adventurin', which he says is nae excuse. Come home for the harvest at least, or send the three silver, and we'll call it square.\n\nYer loving cousin, Thorgen\n\n(If ye're nae my cousin, then I'm sorry, and ye've a very common name.)",
  replies = {
    { id = "notcousin", text = "I'm not your cousin, Thorgen, but give Grandda my best anyway." },
    { id = "silver", text = "Tell Grandda I'll pay back the three silver when I'm home.", fx = { letter = "rand_mistaken_dwarf_re_silver" } },
    { id = "well", text = "That pick never went down the well, Thorgen, and Grandda knows it." },
  },
}

P:Letter {
  id = "rand_priest_request", from = "Widow Marla Fenwick", stranger = true, random = true, when = { class = "PRIEST", faction = "Alliance" },
  subject = "A request for a blessing",
  body = "Good {class},\n\nI am told that you serve the Light, and so I hope you will forgive an old woman for writing. My husband was buried at Raven Hill before the troubles came to Duskwood, and I have not been able to go there since. I am too old for that road, and too frightened of what walks on it now.\n\nIf ever you pass that way, would you say a prayer over the old cemetery for all who rest there? I cannot pay you, and I will not ask you to promise. I only wanted to ask someone who might understand.\n\nWith hope, Marla Fenwick, of Darkshire",
  replies = {
    { id = "promise", text = "I'll say a prayer at Raven Hill, Mrs. Fenwick. I promise.", fx = { flag = { set = "raven_hill_prayer" }, letter = "rand_priest_request_re_promise" } },
    { id = "anywhere", text = "I can't promise, but I'll pray for him wherever I am." },
    { id = "darkshire", text = "Raven Hill is dangerous now. Pray for him from Darkshire, Mrs. Fenwick." },
  },
}

P:Letter {
  id = "rand_lost_kodo_owner", from = "Tarhok", stranger = true, random = true, when = { faction = "Horde", minLevel = 15 },
  subject = "You are not my brother",
  body = "Brother,\n\nI have heard that you are in the Barrens now, so I am sending this to the Crossroads, where the wind-rider master says every orc passes eventually. Mother wants to know why you have not written since the Horde left the camps, and whether you are still angry about the thing with the axe.\n\nI was told just now by the master that you are not my brother, and that you are, in fact, a {race} I have never met. I am leaving this letter in the satchel anyway, because I paid for it.\n\nTarhok of Durotar",
  replies = {
    { id = "mother", text = "Tell your mother your brother is surely well, Tarhok." },
    { id = "watch", text = "I'm not your brother, but I'll watch for him at the Crossroads." },
    { id = "axe", text = "What exactly was the thing with the axe?" },
  },
}

P:Letter {
  id = "rand_lost_spellbook", from = "Apprentice Delwyn Hartley", stranger = true, random = true, when = { minLevel = 18 },
  subject = "Have you got my spellbook?",
  body = "To whom it may concern,\n\nI believe I may have accidentally posted my spellbook to you instead of to my master in Stormwind, because I wrote two addresses on the same morning, and one of them is not here, and neither is the book. If you open it, please do not read the chapter on conjured fire aloud, or at least not indoors.\n\nI would be very grateful if you could look through your bags. It is bound in blue leather, it smells faintly of singed eyebrows, and my master has not yet noticed it is missing, which is a state of affairs I would like to preserve.\n\nDelwyn Hartley, apprentice (for now)",
  replies = {
    { id = "desk", text = "No spellbook here, Delwyn. Check your master's desk before he does." },
    { id = "fire", text = "I read the fire chapter aloud, indoors. Sorry about my eyebrows." },
    { id = "blue", text = "I'll keep an eye out for blue leather, Delwyn." },
  },
}

---------------------------------------------------------------------------
-- More junk mail
---------------------------------------------------------------------------
P:Letter {
  id = "junk_totems", from = "Ancient Spirit Authentic Totem Emporium", stranger = true, random = true, junk = true,
  subject = "Genuine tauren totems, made by genuine tauren!",
  body = "Greetings, friend of the Earth Mother!\n\nAt the Ancient Spirit Authentic Totem Emporium, every totem is hand-carved by a real, honest-to-goodness tauren named Big Hoof, who is definitely a tauren and not three goblins standing on each other's shoulders in a cloak. Each totem is blessed by the spirits and comes with a certificate of authenticity, also hand-carved by Big Hoof.\n\nThis week only, buy two totems and get a third at a price we are calling \"spiritual\". Shipping from Ratchet, sorry, from Thunder Bluff, is very reasonable.\n\nWalk with the Earth Mother, and your coin purse with us!",
}

P:Letter {
  id = "junk_gnome_catalogue", from = "Sprocketspark Mechanical Marvels", stranger = true, random = true, junk = true,
  subject = "The Autumn Catalogue of Practical Inventions",
  body = "Dear Valued Future Customer,\n\nPlease enjoy this autumn's selection of practical inventions! The Self-Lacing Boot (now ninety-one percent less likely to lace itself to the other boot), the Pocket Thunderstorm (for gardens; do not open indoors), and the Automatic Beard Trimmer, which has been withdrawn from sale in Ironforge for reasons we consider unfair.\n\nAll inventions are tested by our own staff, at least one of whom is expected to recover fully. Orders may be placed at Tinker Town in Ironforge, where we are temporarily based until Gnomeregan is reclaimed, which will be very soon.\n\nSprocketspark Mechanical Marvels: Progress, Mostly!",
}

P:Letter {
  id = "junk_guild_recruit", from = "The Knights of the Eternal Glorious Dawnblade", stranger = true, random = true, junk = true, when = { minLevel = 12 },
  subject = "YOU have been CHOSEN",
  body = "Hail, mighty {class}!\n\nThe Knights of the Eternal Glorious Dawnblade are recruiting brave souls to join our legendary company, which was founded last Tuesday and already has four members, one of whom is a dog. We have a tabard, a motto, and very ambitious plans for Blackrock Mountain.\n\nRequirements: a sword, or a staff, or a bow, or a willingness to hold the dog. Dues are only ten silver a week and go toward the tabard, which we have not finished paying for.\n\nFor glory! Write back soon, as the dog is getting impatient.",
  replies = {
    { id = "dog", text = "I'll hold the dog, but I'm not paying for the tabard." },
  },
}

P:Letter {
  id = "junk_land_deal", from = "Grizzlik Prime Properties", stranger = true, random = true, junk = true, when = { minLevel = 20 },
  subject = "Seaside property, cheap!",
  body = "Hey there, pal!\n\nHave you ever dreamed of owning a beautiful seaside villa? Well, now you can, with Grizzlik Prime Properties! We've got lovely plots in the Shimmering Flats, which used to be a sea and may well be again, so you're basically buying early. Also available: a cosy cottage in Stranglethorn with only a few panthers, and a lakeside retreat in the Swamp of Sorrows that's mostly lake.\n\nThe paperwork's simple, the deposit's non-refundable, and the deed is written in very small letters for your protection. Time is money, friend, and this deal won't last!\n\nGrizzlik, Prime Properties, Gadgetzan (ask for the back room)",
  replies = {
    { id = "wait", text = "I'll wait until the Shimmering Flats is a sea again, thanks." },
  },
}

P:Letter {
  id = "junk_murloc_tours", from = "Captain Kizzle's Coastal Tours", stranger = true, random = true, junk = true,
  subject = "See the murlocs up close!",
  body = "Ahoy, adventurer!\n\nEver wanted to see a murloc in its natural habitat? Captain Kizzle's Coastal Tours offers relaxing boat trips along the coast of Westfall and the Wetlands, with expert commentary, a packed lunch, and a guarantee that you will see at least one murloc, or at most forty.\n\nPassengers are asked to keep their hands inside the boat, their lunch inside their bags, and their screaming to a reasonable volume. Lifejackets are available for hire, and so, at a modest extra charge, is getting back to shore.\n\nCaptain Kizzle: Mrrglglgl Means Welcome!",
  replies = {
    { id = "mrgl", text = "Mrrglglgl to you too, Captain Kizzle." },
  },
}

P:Letter {
  id = "junk_horde_bonds", from = "Orgrimmar Wartime Savings Board", stranger = true, random = true, junk = true, when = { faction = "Horde" },
  subject = "Strength through savings!",
  body = "Warrior of the Horde!\n\nDo you have gold sitting in your pack doing nothing but making a jingling noise? Lend it to the Orgrimmar Wartime Savings Board, and in five short years it will be returned to you with interest, glory, and the gratitude of the Warchief, who has not been told about this scheme but would surely approve.\n\nThe Board is run by an orc named Krug and a goblin named Krug's Accountant, and they meet on the bridge outside the bank, under the second torch. Bring your gold, and do not ask to see the Board's office.\n\nFor the Horde, and for compound interest!",
}

P:Letter {
  id = "junk_alliance_cleaning", from = "Spotless Sallie's Armour Polishing", stranger = true, random = true, junk = true, when = { faction = "Alliance" },
  subject = "Is your armour embarrassing you?",
  body = "Dear Adventurer,\n\nIs your armour dented, rusted, scorched, chewed, or covered in something you would rather not name? Spotless Sallie's of the Dwarven District will polish it to a shine so bright you'll be able to signal ships off the coast of Westfall with it.\n\nPlease note that Sallie cannot be held responsible for armour that has been cursed, possessed, or worn in the Deadmines for more than a week. A small surcharge applies to anything that has been inside an ogre.\n\nSpotless Sallie's: We've Seen Worse, But Not Much!",
}

---------------------------------------------------------------------------
-- Still more letters from people you've met (Alliance)
---------------------------------------------------------------------------
P:Letter {
  id = "rand_gryan", npc = "gryan", random = true, when = { faction = "Alliance", minLevel = 15 },
  subject = "News from Sentinel Hill",
  body = "{name},\n\nThe militia drilled in the rain again this morning, and for the first time not one of them dropped his pitchfork, so I count that a victory. We took in two more families from the Molsen place after the Defias burned their barn, and the tower is fuller than it's ever been. Nobody complains, though the cook has started saying grace over the stew in a tone I don't care for.\n\nThe harvest golems still walk the fields at night, and I'll not pretend I sleep well because of it. But Westfall stands, and the People's Militia stands with it, and some of that is your doing.\n\nWhen you're next on the Gold Coast Road, stop at the hill. There's always a cup of something hot for a friend of Westfall.\n\nGryan Stoutmantle, Sentinel Hill",
  replies = {
    { id = "grace", text = "Tell the cook to say grace however he likes, as long as there's stew.", fx = { affinity = 1 } },
    { id = "golems", text = "The golems worry me too, Gryan. Westfall deserves quiet nights.", fx = { affinity = 1 } },
    { id = "cup", text = "Keep a cup hot for me, Gryan. I'll be by.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "rand_solomon", npc = "solomon", random = true, when = { faction = "Alliance", minLevel = 20 },
  subject = "From the Magistrate of Lakeshire",
  body = "{name},\n\nI write to thank you once again for your service to Redridge, and also, I confess, to complain, because there is nobody left in Lakeshire who will listen. I have sent four letters to Stormwind asking for soldiers, and the fourth came back with a note asking me to stop sending letters.\n\nThe bridge is mended at last, after the masons argued for a month about which side to start from. The Blackrock are still in the hills, and the gnolls still raid the farms along the lake, but the town is holding, and the inn has had its roof done.\n\nIf you ever find yourself with an afternoon and an axe, Lakeshire would be glad of both.\n\nMagistrate Solomon, Lakeshire Town Hall",
  replies = {
    { id = "axe", text = "I've an axe and an afternoon, Magistrate. Lakeshire can count on both.", fx = { affinity = 1 } },
    { id = "fifth", text = "Write a fifth letter, Magistrate. Somebody in the Keep must read them." },
    { id = "manage", text = "Stormwind has other fires, Magistrate. Lakeshire will have to manage.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "rand_hearthstove", npc = "hearthstove", random = true, when = { faction = "Alliance", minLevel = 12 },
  subject = "A word from the Stoutlager",
  body = "Hello there, {name},\n\nI'm writing from behind the bar at the Stoutlager Inn, so forgive the stain on the corner of this page, it's only ale. Thelsamar's been busy since the troggs were driven back from the dam, and every dwarf in Loch Modan seems to think he deserves a drink for it, whether he was there or not.\n\nMy Vidra has been baking her boar pies again and swears she's improved the recipe, though as far as I can tell she's only added more boar. If you come by, I'll save you one, and you can tell her it's lovely. That's an order.\n\nInnkeeper Hearthstove, Thelsamar",
  replies = {
    { id = "pie", text = "Save me a pie, and I'll tell Vidra it's lovely.", fx = { affinity = 1 } },
    { id = "boar", text = "More boar sounds like an improvement to me." },
    { id = "there", text = "I'll drink to the dwarves who were actually there, Hearthstove." },
  },
}

P:Letter {
  id = "rand_verna", npc = "verna", random = true, when = { faction = "Alliance", minLevel = 10 },
  subject = "Old Blanchy says hello",
  body = "Dear {name},\n\nI hope this finds you well and eating properly, which I doubt, given the life you lead. Old Blanchy is still with us, bless her, and still turning her nose up at anything but the best oats, which is why I keep asking travellers to bring me some, as you'll remember.\n\nTheodore sits on the step of the Jansen place most evenings and tells me the Defias will be gone by spring. He's said that for three springs now, but I let him say it, because a man needs something to believe in when he's lost his farm. We've a little patch of pumpkins going behind the wagon, and they're doing better than they've any right to.\n\nTake care of yourself, dear. You've a kind face, and kind faces don't last long out there unless somebody's praying for them.\n\nVerna Furlbrow",
  replies = {
    { id = "oats", text = "I'll bring Old Blanchy the best oats I can find, Verna.", fx = { affinity = 1, letter = "rand_verna_re_oats" } },
    { id = "theodore", text = "Tell Theodore I believe him about the spring.", fx = { affinity = 1 } },
    { id = "eating", text = "I'm eating properly, Verna. Mostly." },
  },
}

P:Letter {
  id = "rand_shaussiy", npc = "shaussiy", random = true, when = { faction = "Alliance", minLevel = 12 },
  subject = "From the inn at Auberdine",
  body = "Ishnu-alah, {name},\n\nThe boats from Menethil came in heavy this week, and the inn is full of dwarves who complain that our beds are too long and our wine too thin. I have told them that the beds are not too long, they are too short, and they have accepted this with less grace than I hoped.\n\nThe sea has been grey and restless, and the sentinels say the furbolgs in the north are not themselves. I do not know what that means, but I have learned to listen when the sentinels are worried.\n\nThere is a room by the window for you, whenever the tide brings you back to Darkshore. The moon is very beautiful from it.\n\nInnkeeper Shaussiy, Auberdine",
  replies = {
    { id = "beds", text = "Tell the dwarves the beds are fine and they should grow." },
    { id = "window", text = "Keep the room by the window. I'd like to see that moon.", fx = { affinity = 1 } },
    { id = "furbolgs", text = "If the sentinels are worried about the furbolgs, so am I." },
  },
}

---------------------------------------------------------------------------
-- Still more letters from people you've met (Horde)
---------------------------------------------------------------------------
P:Letter {
  id = "rand_gornek", npc = "gornek", random = true, when = { faction = "Horde" },
  subject = "From the Den",
  body = "{name},\n\nThe Valley of Trials has a new crop of young ones, and they are as green and foolish as you were. One of them asked me whether a boar can be tamed if you shout at it loudly enough. I told him to try, and he is still in the Den with his arm bound up, learning.\n\nThe Burning Blade still skulk in the caves, and the scorpids still sting, and I still tell every new arrival the same thing I told you: earn your place, and the Horde will remember it.\n\nYou earned yours. Do not let them forget it in Orgrimmar.\n\nGornek, the Den",
  replies = {
    { id = "boar", text = "Did the young one ever manage to tame the boar?" },
    { id = "forget", text = "I haven't let anyone forget it, Gornek.", fx = { affinity = 1 } },
    { id = "same", text = "Earn your place. I tell the new ones the same now.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "rand_thork", npc = "thork", random = true, when = { faction = "Horde", minLevel = 12 },
  subject = "The Crossroads holds",
  body = "{name},\n\nThe Kolkar came at the north wall again three nights past. They broke on the palisade, as they always do, and left their spears behind, which I have had the grunts gather up and sell to a goblin from Ratchet. He did not ask where they came from, and I did not tell him.\n\nThe Barrens are hard ground, and the Crossroads is harder. Supplies come late, the water tastes of iron, and the wind never stops. But the Warchief asked us to hold this place, and we hold it.\n\nIf you pass through, report to me. I will have work for you, and the cook will have something that is probably meat.\n\nThork, the Crossroads",
  replies = {
    { id = "meat", text = "I'll report when I pass, Thork, and I'll risk the meat.", fx = { affinity = 1 } },
    { id = "spears", text = "Selling Kolkar spears to a goblin is a fine use of them." },
    { id = "holds", text = "The Crossroads holds because of grunts like yours, Thork.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "rand_kauth", npc = "kauth", random = true, when = { faction = "Horde" },
  subject = "Bloodhoof Village",
  body = "{name},\n\nThe rains have come to Mulgore, and the grass is high enough to hide a kodo calf, which is exactly what happened yesterday, and half the village spent the afternoon calling for it. It was found asleep behind my lodge, eating the thatch.\n\nThe Venture Company still cut at the trees to the south, and the gnolls of the Palemane still raid the farms, but the elders say the land will remember who tended it and who wounded it. I believe them.\n\nCome and rest when you are weary, {name}. The fire is warm, the bread is fresh, and the thatch, for now, is mostly where it belongs.\n\nInnkeeper Kauth, Bloodhoof Village",
  replies = {
    { id = "calf", text = "I'm glad the calf was found. Tell it to leave the thatch alone.", fx = { affinity = 1 } },
    { id = "weary", text = "I'll come and rest when I'm weary, Kauth. That may be soon." },
  },
}

P:Letter {
  id = "rand_renee", npc = "renee", random = true, when = { faction = "Horde" },
  subject = "From the Gallows' End",
  body = "{name},\n\nThe tavern is as lively as a tavern full of dead men can be. Somebody left a game of dice half finished on the corner table a week ago, and nobody has moved it, because they're all waiting to see if he comes back for it. I suspect he won't, since the last I heard, he went to argue with the Scarlet Crusade.\n\nThe Royal Apothecaries have been buying up every rat in Brill, and I don't ask why. I've learned that not asking is the best thing you can do in the Undercity, and the second best is having a strong drink ready for anyone who did.\n\nThe bed upstairs is still yours, if you want it. It doesn't matter much to us, but the living seem to like them.\n\nInnkeeper Renee, Gallows' End Tavern, Brill",
  replies = {
    { id = "dice", text = "If he never comes back for his dice, tell them I'm next." },
    { id = "bed", text = "I'll take the bed, Renee. The living do like them.", fx = { affinity = 1 } },
    { id = "rats", text = "What do the Apothecaries want with all those rats?" },
  },
}

P:Letter {
  id = "rand_zygand", npc = "zygand", random = true, when = { faction = "Horde", minLevel = 10 },
  subject = "By order of the Executor",
  body = "{name},\n\nThe Dark Lady's will is carried out in Brill, as it is everywhere in her lands, and I write to remind you that you have been noted. Your work against the Scarlet Crusade in Tirisfal was useful, and the Forsaken do not forget a useful ally.\n\nThe Crusade has fortified the monastery and grows bolder on the roads. If your travels take you near the Scarlet watchtowers, I would hear what you see there. Report to me in person, and do not trust the message to anyone else, not even the bats.\n\nExecutor Zygand, Brill",
  replies = {
    { id = "report", text = "I'll report what I see at the watchtowers, Executor, and only to you.", fx = { affinity = 1, npcFlag = { set = "scarlet_watch" } } },
    { id = "ally", text = "I'm an ally, Executor, not one of your informants.", fx = { affinity = -1 } },
  },
}

---------------------------------------------------------------------------
-- Still more letters from people you've met (neutral)
---------------------------------------------------------------------------
P:Letter {
  id = "rand_krazek", npc = "krazek", random = true, when = { minLevel = 30 },
  subject = "A business opportunity, pal",
  body = "Hey there, {name}, old pal!\n\nKrazek here, from the Baron's office, writing on the Baron's paper, which I'll be billing to you later. I've been thinking about you, and I've been thinking about money, and I'm starting to think those two thoughts belong together.\n\nThe Baron needs someone to look into a little matter at the Wild Shore, where a Bloodsail boat put in last week, and I put your name forward because you're reliable, you're tough, and you haven't tried to sell me anything yet. There's coin in it, pal, real coin, minus a finder's fee for me, minus a writing fee for this letter.\n\nCome up to the office when you're in Booty Bay. Bring a weapon. Bring a purse, too, because the chair still costs extra.\n\nKrazek, Secretary to Baron Revilgaz",
  replies = {
    { id = "chair", text = "I'll come up to the office, Krazek, but I'm not paying for the chair.", fx = { affinity = 1 } },
    { id = "fees", text = "Take your finder's fee off my writing fee and call it even." },
    { id = "shore", text = "I'll look into the Wild Shore. Keep the Baron's paper." },
  },
}

P:Letter {
  id = "rand_vizzie", npc = "vizzie", random = true, when = { minLevel = 50 },
  subject = "Snowed in at Everlook",
  body = "{name}!\n\nIt snowed for nine days straight, and Everlook is buried up to the second floor. The Yetis came down from the hills to look at us, and we looked back at them, and everyone agreed it was too cold to fight. I've never seen anything like it.\n\nThe inn's full of Horde and Alliance both, all of them stuck here, all of them sitting on opposite sides of the room glaring at each other over the same pot of soup. The bruisers had to stop a fistfight over who got the bread heel, and now I cut the loaf from the middle.\n\nIf you're coming north, wrap up, bring a spare pair of boots, and don't fall asleep in the snow, because the frostsabers out here aren't shy.\n\nInnkeeper Vizzie, Everlook",
  replies = {
    { id = "loaf", text = "Cutting the loaf from the middle is genius, Vizzie.", fx = { affinity = 1 } },
    { id = "boots", text = "I'll bring spare boots and stay awake in the snow, I promise." },
    { id = "soup", text = "Horde and Alliance sharing a pot of soup? That's worth the trip." },
  },
}

P:Letter {
  id = "rand_betina", npc = "betina", random = true, when = { minLevel = 55 },
  subject = "A note from Light's Hope",
  body = "{name},\n\nI'm writing from the chapel at Light's Hope, where the candles burn day and night and the smell of the plague is never quite gone from the wind. The Argent Dawn has had good news and bad. We pushed the Scourge back from the crossroads east of Tyr's Hand, and we lost three good people doing it.\n\nThe Scourgestones keep coming in, and I keep writing down every one, because each of them is one less of the dead walking out there. It's dreary work, but someone has to do the counting, and I'd rather it was someone who cares.\n\nCome by the chapel when you're in the Plaguelands. I'll make you tea, and you can tell me something cheerful. Anything at all will do.\n\nBetina Bigglezink, the Argent Dawn",
  replies = {
    { id = "counting", text = "Your counting matters, Betina. Every stone is one less of the dead.", fx = { affinity = 1 } },
    { id = "tea", text = "I'll come for tea and bring the most cheerful story I can find.", fx = { affinity = 1 } },
    { id = "sorry", text = "I'm sorry for the three you lost, Betina." },
  },
}

P:Letter {
  id = "rand_rabine", npc = "rabine", random = true, when = { minLevel = 50 },
  subject = "From Nighthaven",
  body = "{name},\n\nThe Keeper asked after you this morning, in that way he has of asking without asking. I told him you were well, which I believe to be true, and that you would come again when it was time, which I know to be true, because I do not believe in chance.\n\nThe Moonglade is quiet. The druids come and go, the lake is still, and the wardens walk the paths as they always have. But the reports from Felwood grow worse, and the Cenarion Circle is troubled by what the Emerald Dream will not show us.\n\nWhen your road turns north, Nighthaven will be ready for you. I will see to it.\n\nRabine Saturna, Majordomo to Keeper Remulos",
  replies = {
    { id = "keeper", text = "Tell the Keeper I'll come when it's time, Rabine.", fx = { affinity = 1 } },
    { id = "dream", text = "What is the Dream refusing to show the Circle?" },
    { id = "chance", text = "I don't believe in chance either, Rabine." },
  },
}

---------------------------------------------------------------------------
-- More letters from strangers
---------------------------------------------------------------------------
P:Letter {
  id = "rand_sparring", from = "Gerta Ironjaw", stranger = true, random = true, when = { class = "WARRIOR", minLevel = 15 },
  subject = "A challenge, properly made",
  body = "{class},\n\nWe've not met, but I've heard you swing a weapon like you mean it, and I've a problem: everyone in my village is either too old to fight me or too scared to, and the ones in between have started hiding in the barn when they see me coming.\n\nSo I am challenging you, honourably, to a bout of your choosing, at a time and place of your choosing, with real weapons or practice ones, though I'll warn you now I don't hold back with either.\n\nIf you win, I'll buy the drinks. If I win, you buy them. Either way, somebody's drinking, and I've been looking forward to that part most of all.\n\nGerta Ironjaw",
  replies = {
    { id = "accept", text = "Challenge accepted, Gerta. Practice weapons, and you're buying." },
    { id = "sport", text = "I don't fight for sport, Gerta, but I'll gladly buy the drinks." },
    { id = "barn", text = "Let your village out of the barn, Gerta. They've suffered enough." },
  },
}

P:Letter {
  id = "rand_gnome_cousin", from = "Bixie Sprocketwhistle", stranger = true, random = true, when = { race = "Gnome" },
  subject = "Are we related?",
  body = "Dear {name},\n\nI am writing to every gnome whose name I can find on a mailbox in Ironforge, because since we left Gnomeregan I have lost track of my second cousin Nibbin, and someone in Tinker Town said a gnome who looks a bit like him has been seen wandering about with a weapon and a very determined expression.\n\nIf you are Nibbin, please write back, because Aunt Wizzle has kept your workbench exactly as you left it, including the thing that hums. If you are not Nibbin, please write back anyway and let me know, so I can cross you off. I have a list, and it is very long.\n\nWith hope and slightly ink-stained fingers,\n\nBixie Sprocketwhistle, Tinker Town",
  replies = {
    { id = "not", text = "I'm not Nibbin, Bixie, but I'll watch for him on my travels." },
    { id = "hum", text = "Tell Aunt Wizzle to keep the humming thing away from open flames." },
  },
}

P:Letter {
  id = "rand_troll_cousin", from = "Ze'mok", stranger = true, random = true, when = { race = "Troll" },
  subject = "From Sen'jin Village",
  body = "{name},\n\nYou don't know me, but my mother know your mother, or maybe it be your aunt, she can't remember and she won't stop talking about it. She say any Darkspear who go out and make a name for demself should get a letter, so here be your letter.\n\nThings be the same as ever in Sen'jin. The Echo Isles still be in Zalazane's hands, and every night we look out across de water and see his fires burning. The young ones want to swim over and fight him. The old ones tell dem to wait. I be somewhere in de middle, and mostly I fish.\n\nIf you come back to Durotar, come to my hut by the shore. My mother will want to look at you, and you should let her, because she won't let you leave until she has.\n\nZe'mok, Sen'jin Village",
  replies = {
    { id = "hut", text = "I'll come to your hut, Ze'mok, and let your mother have a look." },
    { id = "wait", text = "Tell the young ones to wait. Zalazane's day will come.", fx = { opinion = { zalazane = "enemy" } } },
    { id = "fish", text = "Catch me a good fish, Ze'mok. I'll be home eventually." },
  },
}

P:Letter {
  id = "rand_sheep", from = "Dorran Pike", stranger = true, random = true, when = { class = "MAGE", minLevel = 20 },
  subject = "About the sheep",
  body = "To the {class} who passed through our village,\n\nI'm told it was you, because nobody else around here has the sort of training that turns a man into a sheep, and I'd like to know, politely, when he's going to turn back. It's been some days now, and my brother-in-law is still eating the grass by the well and refusing to come inside.\n\nMy wife says he's better company as he is, and I'll not argue with her about that, but he owes me two silver and I'd like it back before he forgets he ever had it.\n\nIf you can't undo it, could you at least write and tell me how long a sheep lives?\n\nDorran Pike",
  replies = {
    { id = "soon", text = "He'll turn back soon, Mr. Pike. The spell never lasts long.", fx = { letter = "rand_sheep_re_soon" } },
    { id = "notme", text = "That wasn't me, Mr. Pike. Plenty of mages pass through." },
    { id = "ten", text = "Sheep live about ten years. Collect your two silver quickly." },
  },
}

P:Letter {
  id = "rand_hunter_pies", from = "Mabel Hargrove", stranger = true, random = true, when = { class = "HUNTER", minLevel = 10 },
  subject = "Regarding your animal",
  body = "To the {class} with the animal,\n\nWhile you were in the village last week buying arrows, your animal came round the back of my cottage and ate four pies from the windowsill, one blackberry and three meat, and then it lay down in my vegetable patch and went to sleep on the cabbages.\n\nI don't blame the animal. Animals will be animals. I blame you, because you were standing right there talking to the fletcher about feathers and didn't once look round.\n\nI'll accept six silver for the pies, and the cabbages can be forgiven, since it was very sweet asleep. Please pass on my regards to the animal, but not to you.\n\nMabel Hargrove",
  replies = {
    { id = "sorry", text = "I'm sorry about the pies, Mrs. Hargrove. My animal is sorry too." },
    { id = "sill", text = "Pies on a windowsill are practically an invitation, Mrs. Hargrove." },
    { id = "more", text = "My animal sends its regards and asks if you'll bake more." },
  },
}

P:Letter {
  id = "rand_forsaken_neighbour", from = "Wilfred Ashby", stranger = true, random = true, when = { race = "Scourge" },
  subject = "Have we met before?",
  body = "{name},\n\nForgive me for writing out of nowhere. I was standing by the canals in the Undercity last week when you passed, and I could swear I knew your face, or what is left of it. I think we may have lived on the same street in Lordaeron, before. I kept a little bookshop with a green door, three houses down from the baker.\n\nI don't remember much from then. None of us do, I suppose. But I remember the green door, and I remember the smell of the bread in the mornings, and I thought, if it was you, you might remember something too.\n\nIf you do, write back. If you don't, I understand. There's very little in this life that can't be forgotten, and that's both the mercy and the curse of it.\n\nWilfred Ashby, the Magic Quarter, Undercity",
  replies = {
    { id = "door", text = "I remember a green door, Wilfred. I think I stood in your shop.", fx = { letter = "rand_forsaken_neighbour_re_door" } },
    { id = "visit", text = "I don't remember, Wilfred, but I'd like to visit your shelf." },
    { id = "forget", text = "I'd rather not remember Lordaeron, Wilfred. Forgive me." },
  },
}

---------------------------------------------------------------------------
-- More junk mail
---------------------------------------------------------------------------
P:Letter {
  id = "junk_apothecary", from = "Royal Apothecary Society Volunteer Office", stranger = true, random = true, junk = true, when = { faction = "Horde", minLevel = 15 },
  subject = "Volunteers wanted, generous terms",
  body = "Greetings, loyal servant of the Dark Lady!\n\nThe Royal Apothecary Society is seeking healthy volunteers to assist in the testing of new tonics, salves, and experimental preparations. Volunteers will receive a meal, a blanket, and the gratitude of science.\n\nPrevious volunteers report symptoms including mild glowing, temporary loss of fingers, and a strong urge to climb things. Most symptoms pass. The Society regrets that it cannot accept volunteers who are already dead, as the results are confusing.\n\nPlease report to the Apothecarium. Do not touch anything green on the way in.",
}

P:Letter {
  id = "junk_tram", from = "Deeprun Tram Authority", stranger = true, random = true, junk = true, when = { faction = "Alliance" },
  subject = "Ride the Deeprun Tram in comfort!",
  body = "Dear traveller,\n\nWhy walk the long way between Stormwind and Ironforge when you can ride the Deeprun Tram, the wonder of gnomish engineering? The journey is swift, safe, and only occasionally underwater, which is perfectly normal and nothing to worry about.\n\nPassengers are reminded not to feed the fish, not to lean against the windows, and not to ask the operator what that dripping sound is. The operator does not know either.\n\nThe Deeprun Tram Authority: Trust Us, It's Fine!",
  replies = {
    { id = "drip", text = "What is that dripping sound, though?" },
  },
}

P:Letter {
  id = "junk_fishing_hat", from = "Lucky Lenny's Bait and Tackle", stranger = true, random = true, junk = true, when = { minLevel = 25 },
  subject = "The hat every angler needs!",
  body = "Hey, friend!\n\nYou fish? Of course you fish, everybody fishes! And every serious angler in Booty Bay knows that the secret to a good catch isn't the rod, it isn't the bait, it's the hat. That's why Lucky Lenny is offering you, and only you, the Genuine Lucky Fishing Hat.\n\nThis hat has caught fish in every sea in Azeroth, mostly because it fell in each of them. It's slightly damp, smells a little, and once had a crab living in it, but that's the luck, friend, that's the luck soaking in.\n\nOnly nine gold! Ask for Lenny on the lower docks, or wherever the smell is strongest.",
}

P:Letter {
  id = "junk_faire", from = "A Friend of the Darkmoon Faire", stranger = true, random = true, junk = true, when = { minLevel = 10 },
  subject = "Step right up!",
  body = "Wonders! Marvels! Games of chance, games of skill, and games where nobody is quite sure of the rules!\n\nThe Darkmoon Faire is coming, and you won't want to miss it. See the strongest gnome in the world! Ride the steam tonk! Win a prize in the shooting gallery, or at least win the right to try again for another copper!\n\nThe Faire will be pitched outside Goldshire or near Mulgore, depending on the season and on where the wagons get stuck. Look for the tents, follow the music, and keep an eye on your purse, which is advice, not a threat.\n\nSilas Darkmoon sends his warmest welcome, and his carnies send their warmest, slightly sticky handshakes.",
}

---------------------------------------------------------------------------
-- Follow-ups: answers to your replies (0.107.0)
---------------------------------------------------------------------------
P:Letter {
  id = "rand_farley_re_sock", npc = "farley", delay = 4800,
  subject = "Regarding the sock",
  body = "{name},\n\nI'm sorry to tell you that the sock is gone. I kept it on the nail as promised, and I told the cat to leave it be, and the cat looked at me the way cats do, and the next morning the nail was bare.\n\nWe found it three days later in the hayloft behind the inn with four kittens asleep in it. The stablehand says they're the handsomest kittens he's ever seen, and I'm inclined to agree, though I'm biased, being the one who feeds their mother. I've named the smallest one after you, since it was your sock.\n\nSo your sock has gone to a good cause. The stew's still on, if you'd like something for your trouble.\n\nFarley",
  replies = {
    { id = "honoured", text = "I'm honoured, Farley. Give the little one a scratch from me.", fx = { affinity = 1 } },
    { id = "keep", text = "Keep the sock. The kittens need it more than I do.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "rand_wrong_address_re_harold", from = "Agnes Feller", stranger = true, delay = 5400,
  subject = "You are not Harold",
  body = "To whoever you are,\n\nThe mail office says my letter went to a stranger, and the stranger wrote back, and I've had a terrible time explaining to Harold's mother why a letter from Stormwind isn't from her son. In the end I read it to her and said it came from a friend of his, which is near enough, since you were kind enough to go looking for him.\n\nWhen you find him at the Pig and Whistle, and you will, because he's never anywhere else, tell him the goat is back, the roof is worse, and his mother has started calling for him by his father's name, which frightens me. Tell him that last part slowly so it goes in.\n\nThank you for your trouble. I'm sorry it was mine to begin with.\n\nAgnes Feller",
  replies = {
    { id = "found", text = "I found Harold, Agnes. He's coming home whether he likes it or not.", fx = { letter = "rand_wrong_address_re_harold_re_found" } },
    { id = "listen", text = "I'll look for him, Agnes, but I can't promise he'll listen." },
  },
}

P:Letter {
  id = "rand_wrong_address_re_harold_re_found", from = "Agnes Feller", stranger = true, delay = 6000,
  subject = "He came home",
  body = "To Harold's friend,\n\nHe came in on the cart from Goldshire on Tuesday with his hat in his hands and his purse empty, which I expected, and a sack of roofing nails, which I did not. He says a {race} with a hard look sat down at his card table and told him what I wrote, slowly, and he's been sober since, though it's only been four days, so I'm not counting my chickens.\n\nHis mother knew him straight away. She called him by his own name and told him he was late for supper, and he sat down and cried, and so did I, and the goat ate the tablecloth while nobody was watching.\n\nThe roof is mended. I thought you would want to know.\n\nAgnes Feller",
  replies = {
    { id = "start", text = "A mended roof is a good start, Agnes. Keep him at it." },
    { id = "mother", text = "Give his mother my best, and keep the goat outside." },
  },
}

P:Letter {
  id = "rand_child_re_big", from = "Pip", stranger = true, delay = 3600,
  subject = "the beetle",
  body = "dear hero,\n\nI showed my brother your letter and he said you were lying because heroes always say their sword is big, and I said heroes do not lie because they are heroes, and then Mum came in and said nobody is eating any beetles in her house.\n\nSo we went outside. My brother ate the beetle. He said it tasted like a walnut but he made a face that said it did not.\n\nnow I want to know how many monsters you have killed and if any of them were bigger than a house. Mum says I am not allowed to ask you to write again but I am asking anyway.\n\nfrom Pip (age 7 and a half now)",
  replies = {
    { id = "house", text = "A few were bigger than a house, Pip. Don't tell your mum.", fx = { letter = "rand_child_re_big_re_house" } },
    { id = "brave", text = "Tell your brother he was very brave about the beetle." },
  },
}

P:Letter {
  id = "rand_child_re_big_re_house", from = "Pip", stranger = true, delay = 4800,
  subject = "I told everyone",
  body = "dear hero,\n\nI did not tell Mum but I told everybody else, and now the whole street knows about the monsters bigger than a house, and the miller's boy says he does not believe it, so I said he can eat a beetle too.\n\nI have started training to be a hero. I have a stick and a pot lid and I practise on the hay bales every morning. Mum says the hay bales have done nothing to deserve it, and I said that is what the monsters always say.\n\nI have to stop writing now because Mum is looking over my shoulder. She says hello and please stop telling me about monsters.\n\nfrom Pip",
  replies = {
    { id = "bales", text = "Keep practising, Pip, but go easy on the hay bales." },
    { id = "mum", text = "Hello to your mum. I'll leave the monsters out from now on." },
  },
}

P:Letter {
  id = "rand_child_re_dragon", from = "Pip", stranger = true, delay = 3600,
  subject = "a real dragon",
  body = "dear hero,\n\nyou know a DRAGON. I read your letter out loud at school and the teacher said I was not to make things up, and I said I was not making it up because it was written down, and things that are written down are true.\n\nIs she very big. Does she breathe fire or the other thing. My brother says some dragons breathe acid and I said that is disgusting and he said yes. If she is not a nice dragon you should not visit her, even if she asks politely.\n\nI am drawing a picture of you fighting her. You have a very big sword in it, because I decided.\n\nfrom Pip (age 7)",
  replies = {
    { id = "picture", text = "She's very big, Pip, and I won't visit her. Thank you for the picture." },
    { id = "acid", text = "I'm afraid your brother is right about the acid, Pip." },
  },
}

P:Letter {
  id = "rand_secret_admirer_re_meet", from = "A friend", stranger = true, delay = 6000,
  subject = "Still unsigned",
  body = "{name},\n\nI didn't think you would write back. I very nearly didn't open it, because I was afraid you'd be cross, or that you'd laugh, and you were neither, which I suppose I should have expected from someone who helps people for nothing.\n\nI don't think we should meet. It isn't that I don't want to. It's that the person you'd meet would be shy and stammering and a little disappointing, and the person who writes these letters is braver than that, and I'd like you to keep that one.\n\nBut I'll watch for you in the square. If you ever see someone look away very quickly, you may wave, if you like.\n\nA friend",
  replies = {
    { id = "wave", text = "I'll wave, friend, and I won't make a fuss about it." },
    { id = "shy", text = "Shy and stammering sounds perfectly fine to me, friend." },
  },
}

P:Letter {
  id = "rand_alliance_clerk_re_form", from = "Stormwind Office of Records", stranger = true, delay = 7200,
  subject = "Form 22-b, received (in error)",
  body = "To the bearer of this name,\n\nThe Office of Records acknowledges receipt of one Form 22-b, Declaration of Comings and Goings, completed in full and in triplicate. The office thanks you for your diligence and regrets to inform you that Form 22-b was withdrawn at the start of the quarter and replaced by Form 22-c, which is identical except for the colour of the paper.\n\nYour Form 22-b has been placed in the cabinet for withdrawn forms, where it will be kept for seven years and then burned. A blank Form 22-c is not enclosed, as the office has run out of paper of the correct colour.\n\nPlease call in person on an alternate morning.\n\nRespectfully, the Stormwind Office of Records",
  replies = {
    { id = "paint", text = "I'll paint the old form the right colour and send it back." },
    { id = "leaving", text = "I'm leaving Stormwind again. Kindly note it in your records." },
  },
}

P:Letter {
  id = "rand_renato_re_westfall", npc = "renato", delay = 4800,
  subject = "A grave misunderstanding",
  body = "My dear, dear {name},\n\nI have read your letter four times, and each time I have had to sit down. You say the Westfall wine is not bad. Not bad! My grandmother overheard me reading it and has not spoken to anyone since, except to ask whether you are eating well, because she believes only a hungry person could say such a thing.\n\nYou have been deceived, my friend, and I do not blame you. The Westfall wine is made by hungry men in a hard season from grapes that have seen nothing but dust and Defias, and of course it tastes of something. It tastes of sorrow. Ours tastes of sunshine.\n\nCome to the Trade District and I will pour them side by side, and then you will write me a very different letter.\n\nYour wounded but devoted friend, Renato Gallina",
  replies = {
    { id = "fair", text = "Pour them side by side, Renato, and I'll judge fairly.", fx = { affinity = 1 } },
    { id = "cheese", text = "Sorrow pairs well with cheese, Renato. I stand by what I said." },
  },
}

P:Letter {
  id = "rand_bard_re_kobolds", from = "Lyrrin Quickquill, bard", stranger = true, delay = 5400,
  subject = "A breakthrough in the matter of kobolds",
  body = "Most honoured {name},\n\nYour letter has saved the ballad. I spent a long night with a candle, a bottle and the word kobold, and at about the third hour it came to me that kobold rhymes, if one is brave about it, with \"a bold\", \"so cold\" and, at a pinch, \"behold\". The verse now runs to forty lines, and in it you face a horde of kobolds in the dark of the mine, each larger than the last, and the last as large as a barn.\n\nI have taken certain liberties. One of the kobolds wears a crown. Another speaks, and what it says is very moving. I hope you will not mind, as the innkeepers have already begun asking for it.\n\nYour devoted chronicler, Lyrrin Quickquill",
  replies = {
    { id = "crown", text = "A kobold with a crown? Perfect. Don't change a word." },
    { id = "talking", text = "Please cut the talking kobold before anyone I know hears it." },
  },
}

P:Letter {
  id = "rand_rival_re_boots", from = "Brannoc Steelvein", stranger = true, delay = 5400,
  subject = "Those were MY boots",
  body = "{name},\n\nYou wrote that the boots fit beautifully. I want you to know that I read that line standing up, that I sat down very hard afterwards, and that my landlady heard it from the kitchen and asked if I'd been stabbed.\n\nI've been training twice as hard since your letter came. I've been running up hills with rocks in my pack, and sparring with a scarecrow, and I'm winning, mostly. I've bought new boots as well, and they're terrible, and every time they rub I think of you.\n\nThe next beast is mine. I've already picked it out, and I'm not telling you where it is.\n\nBrannoc Steelvein, adventurer, and catching up",
  replies = {
    { id = "scarecrow", text = "Good luck with the scarecrow, Brannoc. Don't let it get cocky." },
    { id = "probably", text = "I'll leave the next beast to you, Brannoc. Probably." },
  },
}

P:Letter {
  id = "rand_penpal_re_shredder", from = "Hettie Cogsworth", stranger = true, delay = 4800,
  subject = "A SHREDDER!",
  body = "Dear Adventurer,\n\nA SHREDDER! I read your letter in front of the whole class, and my teacher said a shredder was a crude goblin contraption, and I said yes, but crude things work too, and she gave me a very long look.\n\nI have drawn a shredder from your description, and I have improved it. Mine has two saws instead of one, a cup holder, and a little seat in the back for a passenger, although the passenger would have to be very brave. I am going to build a small one out of my wind-up rabbit, which still only goes backwards, so it will be a backwards shredder, which I think is safer.\n\nMy teacher gave me full marks for getting two letters. Thank you for being my pen pal!\n\nHettie Cogsworth, Tinker Town",
  replies = {
    { id = "safety", text = "A backwards shredder is a brilliant safety feature, Hettie." },
    { id = "rabbit", text = "Please keep the saws well away from the rabbit, Hettie." },
  },
}

P:Letter {
  id = "rand_mistaken_dwarf_re_silver", from = "Thorgen Deepbrow", stranger = true, delay = 5400,
  subject = "Grandda's delighted",
  body = "Cousin!\n\nI read yer letter to Grandda at supper and he banged the table so hard the soup jumped. He says he knew ye'd own up in the end, and he's told the whole tavern that his grandchild is an honest dwarf, and he's put the three silver on the slate before he's even seen it.\n\nNow, Ma read the letter after and says the hand's nothing like yours and ye've spelt pick with the wrong number of letters, and she thinks ye might nae be my cousin after all. I've decided not to tell Grandda. He's happier than he's been since the well.\n\nCome for the harvest anyway. If ye're nae family, ye're near enough now.\n\nYer loving cousin, or whoever ye are, Thorgen",
  replies = {
    { id = "onway", text = "Tell Grandda his silver's on its way, Thorgen." },
    { id = "harvest", text = "Near enough is good enough, cousin. I'll come for the harvest." },
  },
}

P:Letter {
  id = "rand_priest_request_re_promise", from = "Widow Marla Fenwick", stranger = true, delay = 6000,
  subject = "Thank you",
  body = "Good {class},\n\nI had your letter read to me by the girl from the inn, because my eyes are not what they were, and when she reached the part where you promised, I had to ask her to read it again. I have asked a good many people for things since the troubles came, and none of them promised.\n\nHis name was Tomas. He was a cooper, and he sang badly and loudly in chapel, and the priest used to say the Light must have very forgiving ears. He is buried near the east wall, under the yew, if the yew still stands.\n\nYou need not write to tell me when it is done. I think I will know.\n\nWith gratitude, Marla Fenwick",
  replies = {
    { id = "tomas", text = "I'll say Tomas's name beneath the yew, Mrs. Fenwick." },
    { id = "good", text = "Light keep you, Mrs. Fenwick. He sounds like a good man." },
  },
}

P:Letter {
  id = "rand_verna_re_oats", npc = "verna", delay = 4800,
  subject = "Blanchy thanks you",
  body = "Dear {name},\n\nThe moment I read that you'd be bringing oats, I went straight out to the wagon and told Old Blanchy, and I'm sure she understood, because she's been standing at the end of her rope looking down the road ever since. Theodore says I'm a fool to talk to a horse. I told him I'd talk to whoever listens best, and he went quiet.\n\nThe pumpkins are coming along. One of them is near as big as a milking stool, and I've a mind to keep it whole for the harvest festival, if there's a festival this year.\n\nDon't go to any trouble, dear. Any oats will do, so long as they come with you.\n\nVerna Furlbrow",
  replies = {
    { id = "coming", text = "Tell Blanchy the good oats are coming. Don't let her give up.", fx = { affinity = 1 } },
    { id = "pumpkin", text = "Save that pumpkin for the festival, Verna. Westfall deserves one.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "rand_sheep_re_soon", from = "Dorran Pike", stranger = true, delay = 4800,
  subject = "He's back",
  body = "To the {class},\n\nYou were right. He turned back the morning after your letter came, on the green, in front of the whole village and the miller's wife, wearing exactly what he'd had on when he was turned, which was not much, as it had been bath day.\n\nHe's well enough. He still pulls at the grass when he thinks nobody's looking, and he says the well water tastes better than ale now, which my wife says is the first sensible thing he's ever said.\n\nHe has not paid me back the two silver. He claims he doesn't remember owing it. I am beginning to think the sheep had more honour.\n\nDorran Pike",
  replies = {
    { id = "shame", text = "Tell him a sheep always remembers its debts. That should shame him." },
    { id = "price", text = "Two silver is a small price for a quieter brother-in-law." },
  },
}

P:Letter {
  id = "rand_forsaken_neighbour_re_door", from = "Wilfred Ashby", stranger = true, delay = 6000,
  subject = "The green door",
  body = "{name},\n\nYou remembered the door. I cannot tell you what that did to me. I sat at the edge of the canal for most of the night with your letter in my hand, trying to remember your face as it was, and I couldn't, but I remembered a customer who came in on wet afternoons and stood too long by the shelf of travel books without buying anything. I have decided that it was you.\n\nThe Dark Lady tells us we are not who we were, and she is right, mostly. But I think it does no harm to keep a few small things, like a door, or the smell of bread, or a customer who never bought anything.\n\nIf you come to the Magic Quarter, I have a few books again. You may stand by the shelf as long as you like.\n\nWilfred Ashby",
  replies = {
    { id = "shelf", text = "I'll come and stand by your shelf, Wilfred. I might even buy something." },
    { id = "small", text = "Keep the small things, Wilfred. The Dark Lady needn't know." },
  },
}
