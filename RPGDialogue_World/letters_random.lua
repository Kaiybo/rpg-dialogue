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
}

P:Letter {
  id = "rand_gazlowe", npc = "gazlowe", random = true,
  subject = "Ratchet's harbour, a friendly reminder",
  body = "{name},\n\nThis is a friendly note from the office of the boss of Ratchet, which is me, to say that the harbour is doing great, the boats are running on time, and anybody who tells you the docks are leaking money is a liar and probably works for the Venture Company.\n\nAlso, if you see a crate marked \"NOT EXPLOSIVES\" anywhere between here and the Crossroads, please don't open it, don't kick it, and send word to me personally. There's a finder's thank-you in it, which is a thank-you, so don't get excited.\n\nGazlowe, Ratchet",
}

P:Letter {
  id = "rand_revilgaz", npc = "revilgaz", random = true,
  subject = "From the baron's balcony",
  body = "{name},\n\nThe baron has asked me to write and remind you that Booty Bay is a neutral port, that fighting on the docks is strictly forbidden, and that the bruisers have been given your description. He says this is not a threat, only a courtesy he extends to all his favourite customers.\n\nHe also says the Bloodsail have been seen off the point again, and that if you happen to sink one of their boats, he would not be the one to complain.\n\nBy the hand of the baron's clerk, for Baron Revilgaz",
}

P:Letter {
  id = "rand_topper", npc = "topper", random = true, when = { letter = { id = "topper_true_letter", ["not"] = true } },
  subject = "A small matter",
  body = "Friend,\n\nI hope you're keeping warm. I had a dream last night that I was back on the farm, and the barn was standing, and Elsie was shouting at the hens, and I woke up in the doorway with the gutter running past my boots. I don't know why I'm writing to tell you that, except that you're the only one in the city who'd read it.\n\nIf you're ever by the canal, I've a new story about a gryphon that I'd like to try out on someone.\n\nTopper McNabb",
}

---------------------------------------------------------------------------
-- Letters from strangers (misdelivered, mistaken, or simply odd)
---------------------------------------------------------------------------
P:Letter {
  id = "rand_wrong_address", from = "Agnes Feller", stranger = true, random = true,
  subject = "Dearest Harold",
  body = "Dearest Harold,\n\nI know you said not to write until the harvest was in, but your mother has taken a turn and keeps asking where you've gone. I've told her you're in the city on business, which I suppose is true if you count the card tables at the Pig and Whistle as business.\n\nCome home, Harold. The roof leaks, the goat has escaped again, and I have run out of reasons to give your mother.\n\nYour loving Agnes\n\n(Below, in a different hand: \"Not for {name}. Misdelivered. Sorry. The Mail Office.\")",
}

P:Letter {
  id = "rand_child", from = "Pip", stranger = true, random = true, when = { minLevel = 15 },
  subject = "are you the hero",
  body = "dear hero,\n\nmy brother says you are a hero and I said you are not because heroes have bigger swords, so we made a bet and the loser has to eat a beetle. please write back and tell me how big your sword is. If it is a staff or a bow that does not count.\n\nalso do you know any dragons.\n\nfrom Pip (age 7)",
}

P:Letter {
  id = "rand_secret_admirer", from = "A friend", stranger = true, random = true, when = { minLevel = 20 },
  subject = "Unsigned",
  body = "{name},\n\nYou won't know me, and I'd rather it stayed that way, but I saw you once from across a crowded square and I've thought about it more than is sensible. You were helping someone who couldn't pay you, and you didn't make a show of it.\n\nThat's all. I don't want anything. I only thought someone ought to tell you that it was noticed.\n\nA friend",
}

P:Letter {
  id = "rand_horde_scout", from = "Sergeant Burzag", stranger = true, random = true, when = { faction = "Horde", minLevel = 12 },
  subject = "Report, misfiled",
  body = "To Captain Zukk of the Crossroads,\n\nThe raptors along the Gold Road have eaten two more supply kodos and one supply grunt, who was only mostly eaten and is now very angry. I need more spears, more grunts, and somebody to tell the quartermaster that \"make do\" is not a kind of armour.\n\nSergeant Burzag\n\n(Scrawled underneath: \"Wrong satchel. If you're not Zukk, burn this, and if you are Zukk, I'm still waiting.\")",
}

P:Letter {
  id = "rand_alliance_clerk", from = "Stormwind Office of Records", stranger = true, random = true, when = { faction = "Alliance", minLevel = 12 },
  subject = "Form 22-b, incomplete",
  body = "To the bearer of this name,\n\nOur records show that you entered the Kingdom of Stormwind at some point and have since left it, entered it again, and left it again, a number of times this office considers excessive. Please complete Form 22-b, Declaration of Comings and Goings, and return it in person to the Office of Records in the Keep.\n\nThe office is open on alternate mornings, except during holidays, inspections, and whenever the clerk is unwell.\n\nRespectfully, the Stormwind Office of Records",
}

---------------------------------------------------------------------------
-- Junk mail
---------------------------------------------------------------------------
P:Letter {
  id = "junk_venture", from = "Venture Co. Recruitment", stranger = true, random = true, junk = true,
  subject = "YOU could be a Venture Co. associate!",
  body = "Hey there, valued future associate!\n\nAre you tired of risking your neck for gratitude? The Venture Company is growing fast, and we're looking for go-getters like YOU to join our exciting team in logging, mining, and strategic land acquisition across beautiful Kalimdor!\n\nBenefits include a hard hat, a hard hat replacement scheme at very reasonable rates, and the chance to see the Stonetalon Mountains before anyone else gets to them. No experience required, no questions answered.\n\nThe Venture Company. We'll take it from here!",
}

P:Letter {
  id = "junk_lottery", from = "Steamwheedle Grand Raffle", stranger = true, random = true, junk = true,
  subject = "CONGRATULATIONS, WINNER!!",
  body = "CONGRATULATIONS, {name}!\n\nYou have been selected from thousands of adventurers to receive a GRAND PRIZE in the Steamwheedle Grand Raffle! To claim your prize, simply send a small processing fee of fifty gold to Box 12, Gadgetzan, care of a goblin named Fizzy who is definitely real.\n\nPrizes include a mechanical chicken, a slightly used rocket, and a genuine map to the treasure of the Bloodsail, only some of which is drawn on.\n\nAct now! Offer expires when Fizzy leaves town.",
}

P:Letter {
  id = "junk_tonic", from = "Doctor Wobblesprocket's Miracle Tonic", stranger = true, random = true, junk = true,
  subject = "Feeling tired? Achy? Slightly dead?",
  body = "Friend!\n\nAre you troubled by aching joints, poor sleep, murloc bites, ogre-related injuries, or a general sense that the world is ending? Then you need DOCTOR WOBBLESPROCKET'S MIRACLE TONIC, made from the finest swamp water in Dustwallow Marsh and only a little bit flammable.\n\nSatisfied customers say: \"I can see colours I didn't know existed!\" and \"Please stop writing to me.\"\n\nAvailable from wherever you happen to find Doctor Wobblesprocket, who moves around a lot for legal reasons.",
}

P:Letter {
  id = "junk_chain", from = "Unknown", stranger = true, random = true, junk = true,
  subject = "Do not break the chain",
  body = "This letter has been around Azeroth nine times. It was started by a dwarf in Thelsamar who copied it out and sent it to ten friends, and a week later he found a mithril vein in his cellar.\n\nA troll in Grom'gol threw it away and was eaten by a raptor that same afternoon, though in fairness that happens a great deal in Grom'gol.\n\nCopy this letter ten times and send it to ten friends within three days. Do not break the chain.",
}

P:Letter {
  id = "junk_cult", from = "Friends of the Dawn", stranger = true, random = true, junk = true,
  subject = "Have you thought about the end of the world?",
  body = "Greetings, seeker!\n\nThe world is full of sorrow, and the dead walk in the north, and the price of bread is outrageous. But what if there were a better way? The Friends of the Dawn meet every week in a perfectly ordinary cellar, where we talk about hope, change, and a very nice gentleman in a hooded robe.\n\nThere are no dues, no oaths, and no chanting unless you want to. Biscuits will be provided.\n\nYour friends in the Dawn",
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
