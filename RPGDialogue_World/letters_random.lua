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
  body = "{name},\n\nYou won't know me, and it's better that way, but I saw you once from across a crowded square and I've thought about it more than is sensible. You were helping someone who couldn't pay you, and you didn't make a show of it.\n\nThat's all. I don't want anything. I only thought someone ought to tell you that it was noticed.\n\nA friend",
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
  body = "This letter has been around Azeroth nine times. It was started by a dwarf in Thelsamar who copied it out and sent it to ten friends, and a week later he found a mithril vein in his cellar.\n\nA troll in Grom'gol threw it away and was eaten by a raptor that same afternoon, though in fairness that happens most afternoons in Grom'gol.\n\nCopy this letter ten times and send it to ten friends within three days. Do not break the chain.",
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

---------------------------------------------------------------------------
-- More letters from people you've met
---------------------------------------------------------------------------
P:Letter {
  id = "rand_allison", npc = "allison", random = true, when = { faction = "Alliance" },
  subject = "The Gilded Rose misses you",
  body = "{name},\n\nA guardsman came in last week asking whether a {race} {class} had been sleeping upstairs, and I told him I don't keep a list of my guests, which is true, because the list keeps itself in the ledger. He had a face like a wet week and left without buying anything, so I don't think you're in trouble, only that somebody wants to find you.\n\nThe beds are aired, the rooms are warm, and the bards have promised to learn a second song before the month is out. Come and hold them to it.\n\nInnkeeper Allison, the Gilded Rose",
}

P:Letter {
  id = "rand_belm", npc = "belm", random = true, when = { faction = "Alliance" },
  subject = "Snow in Kharanos",
  body = "Well met, {name}!\n\nThe snow's up to the windowsills in Kharanos and the Thunderbrew lads have rolled out a new cask to keep the cold off, which it does, right up until ye try to stand. Old Grimbeard at the fire says he remembers ye, though he says that about everyone who's ever bought him a pint.\n\nIf ye're ever back in Dun Morogh, there's a seat by the hearth with yer name scratched on it. Aye, scratched. One of the miners did it with his knife, and I've not had the heart to sand it off.\n\nBelm, Innkeeper at the Thunderbrew Distillery",
}

P:Letter {
  id = "rand_dughan", npc = "dughan", random = true, when = { faction = "Alliance", minLevel = 15 },
  subject = "From the Goldshire garrison",
  body = "{class},\n\nI'm told your name has been heard in taverns well beyond Elwynn, and some of what's said is even flattering. I don't hold with tavern talk, as you know, but I'll admit that I've let the new recruits believe I trained you myself, and I'd thank you not to correct them.\n\nThe kobolds are quieter this season and the Defias have pulled back toward Westfall, though I don't trust quiet. Keep your blade sharp and your wits sharper, and remember that Goldshire still remembers you.\n\nMarshal Dughan",
}

P:Letter {
  id = "rand_renato", npc = "renato", random = true, when = { faction = "Alliance" },
  subject = "A vintage worthy of you!",
  body = "My dear friend {name}!\n\nI write with joyful news: this year's pressing at the Gallina Winery is the finest in living memory, and I say that every year, but this year I mean it more than usual. My grandmother tasted it and cried, though she cries at most things, so you must judge for yourself.\n\nYou have the palate of a noble and the boots of a traveller, which is the very best combination for a wine-lover. Come to the Trade District and let me pour you a cup while I tell you why the Westfall grapes will never be as good as ours.\n\nYour devoted friend, Renato Gallina",
}

P:Letter {
  id = "rand_grosk", npc = "grosk", random = true, when = { faction = "Horde" },
  subject = "From Razor Hill",
  body = "{name},\n\nThe Kul Tiran ships still sit off Tiragarde Keep, and the grunts on the walls grow tired of watching them. I keep the stew hot and the bunks empty so that tired warriors have somewhere to fall down. That is all an innkeeper can do, and I do it well.\n\nYou slept under my roof when you were still small and green in the eyes. I have heard you are less small now. Come back to Razor Hill and show me, and tell me the stories yourself, because the ones the peons tell are mostly about wolves eating someone.\n\nLok'tar,\nGrosk",
}

P:Letter {
  id = "rand_boorand", npc = "boorand", random = true, when = { faction = "Horde" },
  subject = "The wind at the Crossroads",
  body = "{name},\n\nThe rains have finally come to the Barrens, and the grass outside the Crossroads has turned green for the first time since you passed this way. The kodo herds are fat and slow, and even the raptors seem to have found something better to do than bother the caravans.\n\nTravellers still sit in my inn and speak of the road ahead as if it will never end, and I think of you when I hear them. The road does end, young one, though usually somewhere warm with a bed in it. May the Earth Mother keep your feet steady until you find one.\n\nBoorand Plainswind, the Crossroads",
}

P:Letter {
  id = "rand_zarlman", npc = "zarlman", random = true, when = { faction = "Horde", minLevel = 10 },
  subject = "Under the two moons",
  body = "Child of the plains,\n\nLast night the White Lady and the Blue Child rose together over Red Rocks, and the elders say that is a sign that a wanderer is being thought of. I do not know if the elders are right, but I was thinking of you, so perhaps they are.\n\nI hope the lands beyond Mulgore have been kind to you. When they are not, remember that the grass here still grows, the wind still speaks, and there is always a fire burning in Bloodhoof Village for those who walk the Earth Mother's path.\n\nMay the eternal sun shine upon you,\nZarlman Two-Moons",
}

P:Letter {
  id = "rand_norman", npc = "norman", random = true, when = { faction = "Horde" },
  subject = "A word from beneath the ruins",
  body = "{name},\n\nYou will be pleased to know that your room in the Undercity is exactly as you left it, because nobody here bothers to move anything, and the damp does the cleaning for us. A bat has taken up residence in the rafters above your bed. I have named it Lord Terenas, which some of my guests find tasteless and I find very satisfying.\n\nDo return when the living world grows tiresome, as it always does. We have candles, quiet, and a broth that I am assured tastes of something, though I can no longer say what.\n\nInnkeeper Norman, the Undercity",
}

---------------------------------------------------------------------------
-- More letters from strangers
---------------------------------------------------------------------------
P:Letter {
  id = "rand_bard", from = "Lyrrin Quickquill, bard", stranger = true, random = true, when = { minLevel = 25 },
  subject = "A ballad in need of a hero",
  body = "Most honoured {name},\n\nI am composing an epic ballad of the great deeds of our age, and your name has come to me from several innkeepers, two guards, and a fisherman who would not stop talking. I have nearly finished the verse in which you single-handedly slay a dragon, and I would be grateful to know whether you have, in fact, slain one.\n\nIf you have not, I would be grateful to know what you have slain, so that I can make it sound like a dragon. Very little rhymes with \"kobold\", and I am at my wits' end.\n\nYour admirer, Lyrrin Quickquill",
}

P:Letter {
  id = "rand_rival", from = "Brannoc Steelvein", stranger = true, random = true, when = { minLevel = 20 },
  subject = "We're not finished, you and I",
  body = "{name},\n\nYou don't know me, but I know you. I was halfway up the same hill as you last month, after the same beast, and you got there first and took the credit, and the bounty, and the very fine boots it was wearing. I've been training since then, and I mean to beat you to the next one.\n\nThis is fair warning, which is more than you gave me. Look over your shoulder now and then, {class}, and you'll see me coming, probably a little out of breath.\n\nBrannoc Steelvein, adventurer, and better than you",
}

P:Letter {
  id = "rand_penpal", from = "Hettie Cogsworth", stranger = true, random = true, when = { minLevel = 10 },
  subject = "Hello from a stranger!",
  body = "Dear Adventurer,\n\nMy teacher at the school in Tinker Town says that we each have to write to a real adventurer and ask them a question, and the mailman said your name was the first one he could think of. My question is: what is the most interesting thing you have ever seen, and was it mechanical?\n\nI am nine and three quarters, I have built a wind-up rabbit that only goes backwards, and I am going to be the first gnome to take Gnomeregan back. Please write back soon, because my teacher marks us down if we only get one letter.\n\nYour pen pal (I hope), Hettie Cogsworth",
}

P:Letter {
  id = "rand_mistaken_dwarf", from = "Thorgen Deepbrow", stranger = true, random = true, when = { race = "Dwarf" },
  subject = "Cousin! Where've ye been?",
  body = "Cousin {name}!\n\nIt's been years, and ye never write, and Grandda's been askin' after ye every night at supper as though ye've only stepped out to fetch the salt. He's got it into his head that ye still owe him three silver from the time ye lost his best pick down the well at Gol'Bolar, and he'll nae let it go.\n\nI've told him ye're off adventurin', which he says is nae excuse. Come home for the harvest at least, or send the three silver, and we'll call it square.\n\nYer loving cousin, Thorgen\n\n(If ye're nae my cousin, then I'm sorry, and ye've a very common name.)",
}

P:Letter {
  id = "rand_priest_request", from = "Widow Marla Fenwick", stranger = true, random = true, when = { class = "PRIEST", faction = "Alliance" },
  subject = "A request for a blessing",
  body = "Good {class},\n\nI am told that you serve the Light, and so I hope you will forgive an old woman for writing. My husband was buried at Raven Hill before the troubles came to Duskwood, and I have not been able to go there since. I am too old for that road, and too frightened of what walks on it now.\n\nIf ever you pass that way, would you say a prayer over the old cemetery for all who rest there? I cannot pay you, and I will not ask you to promise. I only wanted to ask someone who might understand.\n\nWith hope, Marla Fenwick, of Darkshire",
}

P:Letter {
  id = "rand_lost_kodo_owner", from = "Tarhok", stranger = true, random = true, when = { faction = "Horde", minLevel = 15 },
  subject = "You are not my brother",
  body = "Brother,\n\nI have heard that you are in the Barrens now, so I am sending this to the Crossroads, where the wind-rider master says every orc passes eventually. Mother wants to know why you have not written since the Horde left the camps, and whether you are still angry about the thing with the axe.\n\nI was told just now by the master that you are not my brother, and that you are, in fact, a {race} I have never met. I am leaving this letter in the satchel anyway, because I paid for it.\n\nTarhok of Durotar",
}

P:Letter {
  id = "rand_lost_spellbook", from = "Apprentice Delwyn Hartley", stranger = true, random = true, when = { minLevel = 18 },
  subject = "Have you got my spellbook?",
  body = "To whom it may concern,\n\nI believe I may have accidentally posted my spellbook to you instead of to my master in Stormwind, because I wrote two addresses on the same morning, and one of them is not here, and neither is the book. If you open it, please do not read the chapter on conjured fire aloud, or at least not indoors.\n\nI would be very grateful if you could look through your bags. It is bound in blue leather, it smells faintly of singed eyebrows, and my master has not yet noticed it is missing, which is a state of affairs I would like to preserve.\n\nDelwyn Hartley, apprentice (for now)",
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
}

P:Letter {
  id = "junk_land_deal", from = "Grizzlik Prime Properties", stranger = true, random = true, junk = true, when = { minLevel = 20 },
  subject = "Seaside property, cheap!",
  body = "Hey there, pal!\n\nHave you ever dreamed of owning a beautiful seaside villa? Well, now you can, with Grizzlik Prime Properties! We've got lovely plots in the Shimmering Flats, which used to be a sea and may well be again, so you're basically buying early. Also available: a cosy cottage in Stranglethorn with only a few panthers, and a lakeside retreat in the Swamp of Sorrows that's mostly lake.\n\nThe paperwork's simple, the deposit's non-refundable, and the deed is written in very small letters for your protection. Time is money, friend, and this deal won't last!\n\nGrizzlik, Prime Properties, Gadgetzan (ask for the back room)",
}

P:Letter {
  id = "junk_murloc_tours", from = "Captain Kizzle's Coastal Tours", stranger = true, random = true, junk = true,
  subject = "See the murlocs up close!",
  body = "Ahoy, adventurer!\n\nEver wanted to see a murloc in its natural habitat? Captain Kizzle's Coastal Tours offers relaxing boat trips along the coast of Westfall and the Wetlands, with expert commentary, a packed lunch, and a guarantee that you will see at least one murloc, or at most forty.\n\nPassengers are asked to keep their hands inside the boat, their lunch inside their bags, and their screaming to a reasonable volume. Lifejackets are available for hire, and so, at a modest extra charge, is getting back to shore.\n\nCaptain Kizzle: Mrrglglgl Means Welcome!",
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
