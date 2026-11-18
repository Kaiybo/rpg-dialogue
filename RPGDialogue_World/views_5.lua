-- Speaking your mind (0.82.0): views on leaders, faiths, far towns, dungeons and the peoples of the wild. Format: views.lua.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Leaders --------------------------------------------------------------------------------

P:Views { topic = "bolvar", views = {
  { id = "trust", when = { faction = "Alliance" }, text = "Bolvar's holding Stormwind together. I'd follow him into any fight.", fx = { opinion = { bolvar = "trust" }, trait = { brave = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "So would most of the Guard, {class}. He fought in the Second War, and he's never asked a soldier to do a thing he wouldn't do first.", fx = { affinity = 1 } },
    { id = "b", text = "Good. Say it loudly, because there are lords in the Keep who'd rather he didn't hear it from anyone.", fx = { affinity = 1 } },
    { id = "c", when = { disposition = { max = 34 } }, text = "Following's easy. Let's see you hold a wall in Westfall with half the men you were promised." },
  } },
  { id = "weak", when = { faction = "Alliance" }, text = "He's a fine soldier, but the nobles run rings round him at court.", fx = { opinion = { bolvar = "doubt" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "There's truth in that, and it shames me to say it. Lakeshire begs for men and Westfall burns, and the House of Nobles argues about the price of stone." },
    { id = "b", text = "Careful, {class}. He's carrying a crown that isn't his and a boy king besides, and I'd like to see you do it better.", fx = { affinity = -1 } },
    { id = "c", when = { disposition = { min = 60 } }, text = "He listens to the wrong voices, I'll grant you. Though from what I hear, the wrong voices are very charming." },
  } },
  { id = "foe", when = { faction = "Horde" }, text = "The Highlord's a worthy enemy. I'd rather face him than some coward.", fx = { opinion = { bolvar = "respect" }, trait = { proud = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Spoken like one who knows what a real fight is. The humans have few enough of his kind, and they keep the rest behind desks.", fx = { affinity = 1 } },
    { id = "b", text = "Respect him all you like, but remember he'd see every one of us back in the camps if his nobles let him." },
  } },
  { id = "hate", when = { faction = "Horde" }, text = "One more human lord on a stolen throne. He'll fall like the rest.", fx = { opinion = { bolvar = "hate" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Maybe, but not this season. Stormwind's walls are thick, and the Warchief has no wish to throw us against them for nothing." },
    { id = "b", text = "That's the old Horde talking, {class}. We've had our fill of falling kingdoms, and the new one has enough to do keeping Durotar fed.", fx = { affinity = -1 } },
    { id = "c", when = { disposition = { min = 60 } }, text = "Ha! I'll drink to it, though I'd not hold my breath while I did." },
  } },
  { id = "pity", text = "He never asked for a crown. I wouldn't trade places with him.", fx = { opinion = { bolvar = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Nor would I. Every petition in the kingdom crosses his desk, and he still takes the time to see young Anduin at supper, or so they say.", fx = { affinity = 1 } },
    { id = "b", text = "Nobody sane would. That's why it fell to an honest man, I suppose, since the others were all too busy scheming for it." },
  } },
} }

P:Views { topic = "varian", views = {
  { id = "hope", when = { faction = "Alliance" }, text = "The king's alive somewhere, and someday Stormwind will bring him home.", fx = { opinion = { varian = "hope" }, trait = { patient = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Light grant you're right. There are candles in half the windows of the Trade District, and nobody's quite ready to blow them out.", fx = { affinity = 1 } },
    { id = "b", text = "I'd like to believe it, {class}. But the sea doesn't give back much, and it's been a long while now." },
  } },
  { id = "foul", when = { faction = "Alliance" }, text = "Kings don't just vanish at sea. Someone at court wanted him gone.", fx = { opinion = { varian = "suspicion" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Keep your voice down when you say that. If you've proof, take it to the Highlord, not to a tavern, and if you haven't, keep it to yourself." },
    { id = "b", text = "You're not the first to think it, but you'll find nobody at the Keep willing to say it. Funny how that works.", fx = { affinity = 1 } },
    { id = "c", when = { disposition = { max = 34 } }, text = "That's dangerous talk from someone who's never set foot in the Keep, and I'll not be seen standing next to it.", fx = { affinity = -1 } },
  } },
  { id = "glad", when = { faction = "Horde" }, text = "One less human king. Their loss buys the Horde time to grow.", fx = { opinion = { varian = "glad" }, trait = { practical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "It does, and the Warchief knows it. A kingdom run by a boy and a council of squabbling lords won't be sending armies to Durotar any time soon." },
    { id = "b", text = "Cold, {class}, though I can't say you're wrong. Their troubles are our breathing room." },
  } },
  { id = "peace", when = { faction = "Horde" }, text = "He was sailing to talk peace, they say. That's a sorry way to end.", fx = { opinion = { varian = "pity" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "So the story goes. A king who'd sit at a table with Thrall's friends is rarer than gold, and now there's one fewer.", fx = { affinity = 1 } },
    { id = "b", text = "Peace with humans is a pretty thought. I'll believe in it when I see one of their kings arrive." },
  } },
  { id = "boy", text = "That boy on the throne deserves to have his father back.", fx = { opinion = { varian = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Every child does. Young Anduin sits up straight for the nobles and asks after his father every week, and nobody has an answer for him.", fx = { affinity = 1 } },
    { id = "b", text = "Deserving's got little to do with it, {class}. Kings and fathers get lost the same as anyone." },
  } },
} }

P:Views { topic = "prestor", views = {
  { id = "admire", when = { faction = "Alliance" }, text = "Lady Prestor's a gracious woman. Stormwind's lucky to have her at court.", fx = { opinion = { prestor = "admire" }, trait = { kind = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Lucky, aye, that's the word everyone at court uses. She's charmed half the House of Nobles, and the other half are too nervous to say otherwise." },
    { id = "b", text = "The Highlord certainly seems to think so. He hardly makes a decision these days without asking her first.", fx = { affinity = 1 } },
    { id = "c", when = { disposition = { max = 34 } }, text = "You've met her, have you? Strange, how everyone who meets her says exactly the same thing." },
  } },
  { id = "distrust", when = { faction = "Alliance" }, text = "Nobody rises that fast at court without something to hide.", fx = { opinion = { prestor = "distrust" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Hush, now. The last man I heard say that in the Keep found himself posted to the Burning Steppes the following week." },
    { id = "b", text = "You're not alone in thinking it. Her family's lands in Alterac are beyond question, so they say, though I've never met anyone who's seen them.", fx = { affinity = 1 } },
    { id = "c", when = { disposition = { min = 60 } }, text = "Between us, I've wondered the same. Every petition from Lakeshire seems to stall on her desk, and nobody can say why." },
  } },
  { id = "scorn", when = { faction = "Horde" }, text = "Some painted noblewoman giving the humans orders. Their problem, not mine.", fx = { opinion = { prestor = "scorn" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Let them squabble behind their walls. A court that listens to perfumed nobles is a court that isn't marching on Durotar." },
    { id = "b", text = "True enough, though I've heard their regent can't sneeze without her leave. Strange creatures, humans." },
  } },
  { id = "alterac", text = "She's Alterac nobility, and Alterac sold out the Alliance once already.", fx = { opinion = { prestor = "distrust" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Perenolde did, and his line paid for it. Lady Katrana swears her house had no part in his treachery, and the regent believes every word." },
    { id = "b", when = { faction = "Horde" }, text = "Aye, Perenolde handed the humans to Orgrim's Horde, and they've never forgiven Alterac since. Odd that they've forgiven her." },
    { id = "c", when = { disposition = { min = 60 } }, text = "A sharp memory you've got, {class}. Sharper than the court's, it seems.", fx = { affinity = 1 } },
  } },
  { id = "bored", text = "Court gossip bores me. Let the nobles play their little games.", fx = { opinion = { prestor = "indifferent" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Wise of you. Those games have a way of deciding who gets bread and who gets soldiers, but there's no use worrying about what you can't touch." },
    { id = "b", text = "Fair enough. The lady's games aren't little, though, and I'd not want to be on the board when she moves a piece." },
  } },
} }

P:Views { topic = "magni", views = {
  { id = "admire", when = { faction = "Alliance" }, text = "Magni's a king who still swings a hammer. I respect that.", fx = { opinion = { magni = "respect" }, trait = { brave = 1 }, align = { order = 1, honor = 1 } }, replies = {
    { id = "a", text = "Aye, and he's earned it. He took his brother's loss hard, with Muradin gone in the north, but he's never once let it bend his back before his people.", fx = { affinity = 1 } },
    { id = "b", text = "You'll hear no argument from me. A king who drinks at the Stonefire Tavern now and then knows what his people are thinking." },
  } },
  { id = "insular", when = { faction = "Alliance" }, text = "Ironforge looks after Ironforge first, and Magni's no different.", fx = { opinion = { magni = "doubt" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "And who could blame him, with the Dark Irons at his back door and the troggs in his deeps? Stormwind wasn't so quick to help when Gnomeregan fell.", fx = { affinity = -1 } },
    { id = "b", text = "There's truth in that. The gates stay open to the Alliance, mind you, but the vaults stay shut." },
  } },
  { id = "foe", when = { faction = "Horde" }, text = "The Bronzebeards fought the Horde hard. They'll do it again someday.", fx = { opinion = { magni = "respect" }, trait = { cautious = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "They will, and they'll do it well, because dwarves don't forget a grudge or a wall. Better to meet them as foes we respect than ones we underestimate." },
    { id = "b", text = "Let them come. Thrall's Horde isn't the one they broke at Grim Batol." },
  } },
  { id = "plunder", when = { faction = "Horde" }, text = "A dwarf king sitting on a mountain of gold. Ripe for the taking.", fx = { opinion = { magni = "hate" }, trait = { greedy = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Ripe, maybe, but the mountain's the problem. Better armies than ours have broken their teeth on Ironforge's gate." },
    { id = "b", text = "Talk like that is how we ended up in the camps last time, {class}. Mind it.", fx = { affinity = -1 } },
  } },
  { id = "stout", text = "Any king whose city brews that stout can't be all bad.", fx = { opinion = { magni = "fond" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Now that's a fair measure of a king. Thunderbrew's finest has kept the peace better than many a treaty.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Horde" }, text = "You've had dwarven stout? Then you've been somewhere you shouldn't, and I'd like to hear about it." },
  } },
} }

P:Views { topic = "tyrande", views = {
  { id = "revere", when = { faction = "Alliance" }, text = "Tyrande carries Elune's own grace. I'd stand beside her Sentinels.", fx = { opinion = { tyrande = "admire" }, trait = { pious = 1 }, align = { light = 1, order = 1 } }, replies = {
    { id = "a", text = "Then you'd stand with the best. She has led them since the War of the Ancients, and the Sentinels would die for her without a moment's thought.", fx = { affinity = 1 } },
    { id = "b", when = { race = "NightElf" }, text = "Elune-adore, {class}. Few outsiders see what we see in her, and fewer say it so plainly.", fx = { affinity = 1 } },
  } },
  { id = "cold", when = { faction = "Alliance" }, text = "She's kept her people apart for ten thousand years. Hard to warm to.", fx = { opinion = { tyrande = "doubt" }, trait = { honest = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Ten thousand years of watching every outsider bring fire and ruin will do that. She keeps the borders closed because she remembers why she must." },
    { id = "b", when = { race = "NightElf" }, text = "You speak of what you do not understand. She opened Darnassus to your kind, and that cost her more than you know.", fx = { affinity = -1 } },
  } },
  { id = "foe", when = { faction = "Horde" }, text = "Her Sentinels kill our loggers in Ashenvale. She'll answer for that.", fx = { opinion = { tyrande = "hate" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "She'll answer when Warsong Camp has the strength to make her, and not before. Ashenvale is her ground, and her archers know every tree of it." },
    { id = "b", text = "Blood for blood, then, and so it goes on. The Warchief needs that wood, but he doesn't need another endless war." },
  } },
  { id = "respect", when = { faction = "Horde" }, text = "A priestess who leads her warriors from the front. I can respect that.", fx = { opinion = { tyrande = "respect" }, trait = { honest = 1 }, align = { honor = 1, light = 1 } }, replies = {
    { id = "a", text = "So can I. Our warriors fought beside her people at Hyjal, and those who lived say she fights like a storm with a bow.", fx = { affinity = 1 } },
    { id = "b", text = "Respect her from a distance, then. Her arrows don't care how much you admire her." },
  } },
  { id = "moon", text = "I've seen the moon over the forest. I understand her faith a little better.", fx = { opinion = { tyrande = "admire" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Strange, isn't it, how the moon looks different once you know someone's praying to it? Her priestesses say it's watching back.", fx = { affinity = 1 } },
    { id = "b", text = "A little, maybe. Ten thousand years of faith takes longer than one night to understand." },
  } },
} }

-- Goblin towns and far places ---------------------------------------------------------------

P:Views { topic = "theramore", views = {
  { id = "proud", when = { faction = "Alliance" }, text = "Theramore proves the Alliance can still build something new.", fx = { opinion = { theramore = "admire" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "It does. Lady Proudmoore brought refugees across the sea with nothing, and now there's a stone harbour and a tower where there was only swamp.", fx = { affinity = 1 } },
    { id = "b", text = "New, and very far from home. I hope they've enough men on those walls, because the marsh is full of things that aren't fond of stone." },
  } },
  { id = "brave", when = { faction = "Alliance" }, text = "Living beside the Horde by choice. Jaina's braver than I am.", fx = { opinion = { theramore = "doubt" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Braver, or more trusting. She swears by Thrall's word, and so far it's held, which is more than I'd have wagered." },
    { id = "b", text = "She fought beside orcs at Hyjal, {class}. That changes how you look at your neighbours." },
  } },
  { id = "keeps_word", when = { faction = "Horde" }, text = "Jaina keeps her word to Thrall. That's rare for a human.", fx = { opinion = { theramore = "respect" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Rare enough that the Warchief guards it closely. Not everyone in Orgrimmar likes the arrangement, but they've kept their axes sheathed.", fx = { affinity = 1 } },
    { id = "b", text = "She keeps it, aye. Her soldiers in the marsh aren't always so careful, so don't go testing it." },
  } },
  { id = "fortress", when = { faction = "Horde" }, text = "A human fortress on our doorstep. I don't care who rules it.", fx = { opinion = { theramore = "distrust" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "You're not alone. Brackenwall Village keeps a close eye on it, and there are ships in that harbour that could carry soldiers as easily as fish." },
    { id = "b", text = "Thrall cares, and so should you, because a war with Theramore is one we don't need.", fx = { affinity = -1 } },
  } },
  { id = "swamp", text = "Fine city, shame about the swamp around it.", fx = { opinion = { theramore = "wry" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Dustwallow Marsh, the only place in the world where the mosquitoes have mosquitoes. Still, it keeps unwanted guests away.", fx = { affinity = 1 } },
    { id = "b", text = "The swamp has its uses. Nobody marches an army through that mud and arrives in a fit state to fight." },
  } },
} }

P:Views { topic = "booty_bay", views = {
  { id = "profit", text = "Best market in the south seas, as long as you count your change.", fx = { opinion = { booty_bay = "profit" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Twice, and then once more for luck. The Steamwheedle goblins will sell you anything, and they'll smile while they short you a copper.", fx = { affinity = 1 } },
    { id = "b", text = "That's the spirit. Anything that floats or fights in Stranglethorn ends up on those docks eventually, and somebody's always buying." },
  } },
  { id = "pirates", text = "Booty Bay's just a pirate den with a nicer dock.", fx = { opinion = { booty_bay = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "The Bloodsail Buccaneers would take that as an insult, since they're the ones who aren't welcome there. Baron Revilgaz keeps his pirates honest, more or less." },
    { id = "b", text = "Nicer than most dens, at least. The bruisers keep the peace, and they don't much care who you are as long as you don't start anything." },
  } },
  { id = "sea", text = "Rum, sea air and sunshine. I could happily live there.", fx = { opinion = { booty_bay = "fond" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Until the sharks, the raptors and the trolls in the jungle remind you where you are. Still, the sunsets are worth a few bites.", fx = { affinity = 1 } },
    { id = "b", text = "Plenty have said that and stayed, and most of them owe the goblins money now. Mind the rum." },
  } },
} }

P:Views { topic = "gadgetzan", views = {
  { id = "law", text = "The bruisers keep better order than most kings manage.", fx = { opinion = { gadgetzan = "respect" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "They do, because order's good for business. Start a brawl in Gadgetzan and you'll be picking yourself out of the sand outside the wall before you've finished swinging.", fx = { affinity = 1 } },
    { id = "b", text = "Better order, maybe, but not cheaper. Everything in that town has a price, water most of all." },
  } },
  { id = "heat", text = "Gadgetzan's lovely, if you like being slowly baked alive.", fx = { opinion = { gadgetzan = "wry" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! The goblins say the heat keeps the prices up, since everyone's too thirsty to haggle.", fx = { affinity = 1 } },
    { id = "b", text = "You get used to it, or you dry up and blow away with the Wastewander bandits. There's not much else to choose from in Tanaris." },
  } },
  { id = "gateway", text = "It's the last friendly roof before the desert. That's worth something.", fx = { opinion = { gadgetzan = "profit" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Worth plenty. Past those walls it's Zul'Farrak, the Wastewanders and the silithid, and none of them sell water.", fx = { affinity = 1 } },
    { id = "b", text = "Friendly, as long as your coin is. The goblins aren't sentimental about who sleeps under their roofs." },
  } },
} }

P:Views { topic = "ratchet", views = {
  { id = "neutral", text = "A port where Horde and Alliance both dock. That's useful.", fx = { opinion = { ratchet = "profit" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Useful, and profitable for Gazlowe. The boat to Booty Bay doesn't care what colour your tabard is, so long as you've paid the fare.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Horde" }, text = "Useful, so long as you remember the human beside you at the bar might be one of Theramore's eyes." },
    { id = "c", when = { faction = "Alliance" }, text = "Useful, so long as you remember the orc beside you at the bar might be reporting to Orgrimmar." },
  } },
  { id = "rough", text = "Ratchet's rough. Half the dock looks like it's for sale.", fx = { opinion = { ratchet = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Half of it is, and the other half's already been sold twice. The Southsea pirates down the coast don't help its reputation either." },
    { id = "b", text = "Rough, aye, but honest in its own way. Nobody in Ratchet pretends they're doing you a favour." },
  } },
  { id = "air", text = "The sea breeze is the best thing in the whole Barrens.", fx = { opinion = { ratchet = "fond" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Can't argue with that. After weeks of dust and zhevra, a bit of salt in the air feels like a holiday.", fx = { affinity = 1 } },
    { id = "b", text = "That's not saying much, {class}, though I'll take it. The Barrens could use more breezes and fewer centaur." },
  } },
} }

P:Views { topic = "everlook", views = {
  { id = "cold", text = "Everlook's the coldest place I've ever been paid to visit.", fx = { opinion = { everlook = "wry" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! The goblins charge extra for a seat by the fire, and from what I hear, people pay it.", fx = { affinity = 1 } },
    { id = "b", text = "Cold enough to freeze the words in your mouth, and the yetis don't seem to mind at all. Wrap up warm if you go back." },
  } },
  { id = "profit", text = "Clever goblins, selling warmth in the snow. Somebody's getting rich.", fx = { opinion = { everlook = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Somebody always is, where goblins are concerned. Furs, frostsaber hides and whatever the Winterfall dig up all pass through that town.", fx = { affinity = 1 } },
    { id = "b", text = "Rich and frozen, which isn't a trade I'd make. You can't spend gold with numb fingers." },
  } },
  { id = "wild", text = "Beyond the walls, Winterspring's wild and beautiful. Dangerous, though.", fx = { opinion = { everlook = "admire" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Beautiful and dangerous, like most things worth seeing. The Winterfall furbolgs have turned savage of late, so watch the tree line.", fx = { affinity = 1 } },
    { id = "b", text = "Dangerous is putting it gently. Frostsabers hunt in pairs out there, and the snow covers your tracks before you can follow them home." },
  } },
} }

P:Views { topic = "dalaran", views = {
  { id = "kelthuzad", when = { race = "Scourge" }, text = "Their own necromancer started all of this. I remember Kel'Thuzad.", fx = { opinion = { dalaran = "hate" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "So do many of us, and the Kirin Tor would rather we didn't. One of their own taught the cult of the damned, and the rest of us paid for it." },
    { id = "b", text = "Remembering is the one thing the Lich King couldn't take. Keep it, and keep it sharp." },
  } },
  { id = "pity", text = "A city of wonders, broken by Archimonde. That's a heavy loss.", fx = { opinion = { dalaran = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "It was. Libraries older than any kingdom went up in that fire, and the mages who survived have hidden what's left behind a violet dome in the Alterac hills.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Horde" }, text = "A loss for the humans, maybe. Their mages didn't weep for Draenor." },
  } },
  { id = "arrogant", text = "Mages meddling where they shouldn't. Dalaran had its fall coming.", fx = { opinion = { dalaran = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Hard words, though I've heard harder from the farmers of Lordaeron. Pride lived in those towers, and pride burns as well as anything." },
    { id = "b", text = "Say that near any mage and you'll find yourself a sheep for an afternoon. Some of them lost everyone they knew there.", fx = { affinity = -1 } },
  } },
  { id = "dome", text = "I want to see that violet dome for myself someday.", fx = { opinion = { dalaran = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "You'll see it from the hills well enough, but you'll not get through. The Kirin Tor let in only those they choose, and they choose very few.", fx = { affinity = 1 } },
    { id = "b", text = "Mind the road, then. Alterac is full of Syndicate thieves and ogres, and none of them care that you only came to look." },
  } },
} }

P:Views { topic = "kirin_tor", views = {
  { id = "respect", text = "The Kirin Tor kept magic from tearing the world apart. That counts.", fx = { opinion = { kirin_tor = "respect" }, trait = { cautious = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "It counts for a great deal. They've policed spellcraft for longer than Stormwind's had walls, and every mage you meet learned their rules first.", fx = { affinity = 1 } },
    { id = "b", text = "Kept it from tearing the world apart, mostly. Ask the people of Lordaeron how well they kept Kel'Thuzad in hand." },
  } },
  { id = "distrust", text = "Too many secrets behind those doors. I don't trust any of them.", fx = { opinion = { kirin_tor = "distrust" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Secrets are their trade, {class}. They'd tell you it's for your protection, and they might even believe it." },
    { id = "b", when = { class = { "MAGE" } }, text = "Says the one who learned their spells from a Kirin Tor book. Mind whose hand you're biting.", fx = { affinity = -1 } },
    { id = "c", text = "Nor do I, entirely. A council that decides who may learn and who may not has a great deal of power and very little to check it." },
  } },
  { id = "study", when = { class = "MAGE" }, text = "I'd give a lot to study in their libraries one day.", fx = { opinion = { kirin_tor = "respect" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Then study hard and keep your nose clean, because they watch more closely than you'd think. Perhaps one day they'll send for you.", fx = { affinity = 1 } },
    { id = "b", text = "Much of what was in them burned with the city. What survived, they guard like dragons guard gold." },
  } },
  { id = "proud", text = "Clever folk, but far too proud for their own good.", fx = { opinion = { kirin_tor = "doubt" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "They'd call it confidence. Then again, they called it confidence right up until the Scourge came through their gates." },
    { id = "b", text = "Proud, aye, and clever enough to back it up most of the time. That's what makes them dangerous." },
  } },
} }

P:Views { topic = "nordrassil", views = {
  { id = "revere", text = "The World Tree held back Archimonde himself. I'd call that holy.", fx = { opinion = { nordrassil = "admire" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "Many would. The tree gave up the night elves' immortality to break him, and they paid that price without complaint.", fx = { affinity = 1 } },
    { id = "b", when = { race = "NightElf" }, text = "Holy, and wounded. Every night elf you meet is mortal now because of what happened on that mountain, and we feel it.", fx = { affinity = 1 } },
  } },
  { id = "allies", text = "Orcs, humans and elves fought together at Hyjal once. Remarkable.", fx = { opinion = { nordrassil = "respect" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Remarkable, and short-lived. The moment the demon fell, they all went back to watching each other over their walls." },
    { id = "b", when = { faction = "Horde" }, text = "Thrall's warriors bled on that mountain beside the elves, and now the elves shoot our loggers. Remember that when they talk of gratitude." },
    { id = "c", when = { faction = "Alliance" }, text = "Lady Proudmoore was there with what was left of Lordaeron. She still speaks of it with a kind of wonder.", fx = { affinity = 1 } },
  } },
  { id = "doubt", text = "A tree as big as a mountain. I'll believe it when I see it.", fx = { opinion = { nordrassil = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Then go and see it, though the druids guard Hyjal closely. Teldrassil gives you some idea, and Teldrassil is the smaller one." },
    { id = "b", text = "Ha! Plenty said that before Hyjal, and plenty of them were standing in its shadow when Archimonde came." },
  } },
} }

-- Dungeons ---------------------------------------------------------------------------------

P:Views { topic = "zul_gurub", views = {
  { id = "fight", text = "If Hakkar's coming back, I'd rather meet him before he's grown strong.", fx = { opinion = { zul_gurub = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Brave talk, and the Zandalari on Yojamba Isle would like to hear more of it. They're gathering anyone with a blade and a stomach for blood gods.", fx = { affinity = 1 } },
    { id = "b", text = "Before he's grown strong, aye, but you'd need an army for it, not a sword. The Gurubashi high priests won't fall to one hero." },
  } },
  { id = "fear", text = "A blood god walking again is the last thing this world needs.", fx = { opinion = { zul_gurub = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "On that, every troll who isn't a fool agrees with you. Hakkar ate the Gurubashi empire alive once, and he'd do it again given half a chance." },
    { id = "b", when = { race = "Troll" }, text = "De Soulflayer remembers every troll who ever fed him, mon, and he be hungry again. Keep your blood where it belongs." },
  } },
  { id = "tall_tale", text = "Troll priests and blood gods. Sounds like a jungle tall tale.", fx = { opinion = { zul_gurub = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Tell that to the hunters who went into those ruins and came back with their eyes gone strange, if they came back at all.", fx = { affinity = -1 } },
    { id = "b", text = "Most tall tales don't send Zandalari priests across the sea to warn about them. Something's stirring in Stranglethorn, whether you believe it or not." },
  } },
} }

P:Views { topic = "zul_farrak", views = {
  { id = "fight", text = "The Sandfury have raided long enough. Someone ought to go in there.", fx = { opinion = { zul_farrak = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Gadgetzan would cheer the day someone did. Just know that city's full of trolls, scorpids and worse, and the sand under it remembers every body.", fx = { affinity = 1 } },
    { id = "b", text = "Ought to, aye, but nobody wants to be first through the gate. Bring friends, and bring water." },
  } },
  { id = "loot", text = "A troll city full of old gold, sitting out in the sand.", fx = { opinion = { zul_farrak = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Old gold and old curses, usually in the same chest. The goblins pay well for what comes out, though, if you live to sell it." },
    { id = "b", text = "Ha! Every treasure hunter in Tanaris has said the same thing, and the Sandfury have a lovely collection of their skulls." },
  } },
  { id = "heat", text = "I'd sooner fight a hundred trolls than cross that desert again.", fx = { opinion = { zul_farrak = "wry" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Good news, then, because you'll have to do both. The heat in Zul'Farrak is worse than the trolls, or so the survivors tell me.", fx = { affinity = 1 } },
    { id = "b", text = "The desert's killed more would-be heroes than the Sandfury ever did. Carry twice the water you think you need." },
  } },
} }

P:Views { topic = "sunken_temple", views = {
  { id = "fools", text = "Worshipping the god who ate their own empire. The Atal'ai are fools.", fx = { opinion = { sunken_temple = "scorn" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Fools, and dangerous ones. Their temple sank under the swamp for it, and they're still down there chanting to bring him back." },
    { id = "b", when = { race = "Troll" }, text = "Dey be worse than fools, mon. De Atal'ai shamed every troll who ever honoured a loa, and Hakkar laughs at them for it." },
  } },
  { id = "dread", text = "A drowned temple full of chanting priests. That gives me chills.", fx = { opinion = { sunken_temple = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "It should. They say a green dragon sleeps down there too, Eranikus, and that his dreams have gone bad.", fx = { affinity = 1 } },
    { id = "b", text = "Chills are healthy, {class}. The Swamp of Sorrows wasn't named for its cheerful company." },
  } },
  { id = "explore", text = "I'd like to see what's left down there before the swamp takes it.", fx = { opinion = { sunken_temple = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "The swamp's had it for a long time already. What's left is carvings, snakes and priests who don't want visitors." },
    { id = "b", text = "You'd be in good company with the scholars, then. Half of them want to study it, and the other half want it sealed for good." },
  } },
} }

P:Views { topic = "dire_maul", views = {
  { id = "loot", text = "A whole elven city in Feralas, and the ogres don't know what they own.", fx = { opinion = { dire_maul = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Ha! They know it's theirs, and that's enough for the gordok. Eldre'Thalas has more treasure than any ogre king can count, which isn't saying much.", fx = { affinity = 1 } },
    { id = "b", text = "They know what they own well enough to fight for it. Ogres are slow, not blind." },
  } },
  { id = "highborne", text = "The Highborne still hide in there, clinging to old magic. That's unnatural.", fx = { opinion = { dire_maul = "distrust" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "Unnatural is the word. They've been feeding on whatever they've caged in there for ten thousand years, and they think nobody's noticed." },
    { id = "b", when = { race = "NightElf" }, text = "The Highborne doomed us once already with their hunger for magic. That some still live there is a stain on our people.", fx = { affinity = 1 } },
  } },
  { id = "library", text = "I've heard there's a great library in there. I'd like to see it.", fx = { opinion = { dire_maul = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "So have I, and it's guarded by the very elves who wrote half of it. Ask nicely, and maybe they'll only curse you a little." },
    { id = "b", text = "Scholars have gone in after it before. The ogres are still using one of them as a doorstop, I'm told." },
  } },
} }

P:Views { topic = "razorfen", views = {
  { id = "thorns", when = { race = "Tauren" }, text = "Agamaggan's blood grew those thorns, and the quilboar desecrate them.", fx = { opinion = { razorfen = "hate" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "So the elders teach. The great boar died fighting the demons, and his children grew mean and twisted in the shadow of his grave.", fx = { affinity = 1 } },
    { id = "b", text = "Desecrate them, and arm themselves from them. Every barb out there is a spear waiting to happen." },
  } },
  { id = "clear", text = "Those quilboar warrens need clearing out before they spill over.", fx = { opinion = { razorfen = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "They've spilled over already, ask anyone in Camp Taurajo. Charlga Razorflank stirs them up, and now there's talk of something cold and dead in the Downs.", fx = { affinity = 1 } },
    { id = "b", text = "Clear them out, and they'll breed back by spring. Still, someone has to try, and better you than a farmer." },
  } },
  { id = "scourge", text = "Undead in the Downs, working with quilboar. That should worry everyone.", fx = { opinion = { razorfen = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "It worries me plenty. If the Scourge can make friends in the Barrens, they can make friends anywhere." },
    { id = "b", text = "They call him Amnennar the Coldbringer, whatever he is, and the quilboar treat him like a god. That's never good news." },
  } },
} }

P:Views { topic = "maraudon", views = {
  { id = "sacred", text = "The centaur were born down there. That place should be left alone.", fx = { opinion = { maraudon = "respect" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Left alone, aye, if Princess Theradras would leave everything else alone. She's poisoning Desolace from below, and the land shows it." },
    { id = "b", text = "Sacred to the centaur, maybe, and the Maraudine guard it like it. Go in, and you go in uninvited." },
  } },
  { id = "cleanse", text = "Whatever's poisoning Desolace lives down there. Someone should cleanse it.", fx = { opinion = { maraudon = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "The Cenarion druids say the same, and they've lost more than one of their own trying. Bring a druid if you can find one brave enough.", fx = { affinity = 1 } },
    { id = "b", text = "Cleanse it, and maybe Desolace grows grass again in a hundred years. That's a long wait for a reward." },
  } },
  { id = "crystals", text = "I hear the caves glow with crystals. Must be worth a fortune.", fx = { opinion = { maraudon = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "They glow, and they bite back. Half the things down there are made of rock and vines, and they don't like losing their pretty stones." },
    { id = "b", text = "Ha! A goblin would say the same. I'd want more than shiny rocks before I walked into a place that made the centaur." },
  } },
} }

P:Views { topic = "blackfathom", views = {
  { id = "cult", text = "Cultists in an old elven temple. Someone ought to drive them out.", fx = { opinion = { blackfathom = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "The Twilight's Hammer don't drive easily. They've dug in deep, and they've got something in the water down there that they worship.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Alliance" }, text = "The Sentinels would bless you for it. That temple was Elune's once, and it hurts them to see it used so." },
    { id = "c", when = { faction = "Horde" }, text = "Zoram Strand's grunts would thank you. The cultists make the whole coast restless, and we've enough trouble with the elves." },
  } },
  { id = "water", text = "Sunken halls and something in the deep water. No, thank you.", fx = { opinion = { blackfathom = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Sensible. The naga swim those halls now, and the ones who come out talk about a great beast called Aku'mai with a shudder." },
    { id = "b", text = "No shame in that. Some places the sea took back for a reason, {class}." },
  } },
  { id = "ruin", text = "Shame about the temple. It must have been beautiful once.", fx = { opinion = { blackfathom = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "It was, by the old carvings. The sundering pulled it under the waves, and nothing that's moved in since has cared for beauty.", fx = { affinity = 1 } },
    { id = "b", text = "Beautiful, and long gone. The moonwells there are dark now, and that's a sad thing whatever you think of the elves." },
  } },
} }

P:Views { topic = "gurubashi_arena", views = {
  { id = "fight", text = "The arena's where a real fighter proves themselves. I'll be there.", fx = { opinion = { gurubashi_arena = "admire" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Then sharpen everything you own. When Short John Mithril drops that chest, everyone in Stranglethorn comes at once, and nobody plays fair.", fx = { affinity = 1 } },
    { id = "b", text = "Proves something, anyway. Mostly it proves who brought the most friends." },
  } },
  { id = "fools", text = "Killing each other over a chest. That's madness.", fx = { opinion = { gurubashi_arena = "scorn" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Madness with a crowd and good odds for the bookmakers. The goblins make more off the betting than anyone makes off the chest." },
    { id = "b", text = "Maybe so, but it's honest madness. Everyone in the pit knows exactly why they're there." },
  } },
  { id = "watch", text = "I'll watch from the stands and wager on the winner.", fx = { opinion = { gurubashi_arena = "profit" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Smart. The stands are the only seats in the arena that don't need healing afterwards.", fx = { affinity = 1 } },
    { id = "b", text = "Wager carefully, then. The bookmakers are goblins, and the favourites have a funny way of losing." },
  } },
} }

P:Views { topic = "darkmoon_faire", views = {
  { id = "fun", text = "The Faire's the best thing to roll into town all year.", fx = { opinion = { darkmoon_faire = "fond" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "On that we agree. The music, the games, the fortune teller in her tent, and for once nobody's trying to kill anyone.", fx = { affinity = 1 } },
    { id = "b", text = "Best for the children, anyway. The rest of us just try not to lose our purses on the carnival games." },
  } },
  { id = "swindle", text = "Silas Darkmoon's a charming swindler, and I'd guard my coin.", fx = { opinion = { darkmoon_faire = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Charming swindlers are the only kind worth visiting. He's never actually robbed anyone, mind you, though he's sent a great many home lighter." },
    { id = "b", text = "Guard it all you like; you'll spend it anyway. That's the trick of a good Faire." },
  } },
  { id = "fortune", text = "I'd like the fortune teller to read my future.", fx = { opinion = { darkmoon_faire = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Be careful what you ask her. Some folk come out of that tent laughing, and some come out very quiet indeed.", fx = { affinity = 1 } },
    { id = "b", text = "Your future's simple, {class}. Long roads, bad food and someone always wanting something killed." },
  } },
} }

-- Threats and peoples -----------------------------------------------------------------------

P:Views { topic = "onyxia", views = {
  { id = "slay", text = "A black dragon in her lair, so close to Theramore. Someone should slay her.", fx = { opinion = { onyxia = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Someone should, and it would take forty of them. The bones outside her lair belong to those who thought a few would do.", fx = { affinity = 1 } },
    { id = "b", text = "Slay her, and every black whelp in the marsh will come looking for you. Dragons don't forgive and they don't forget." },
  } },
  { id = "fear", text = "A dragon that old and that cunning. I'll keep well clear.", fx = { opinion = { onyxia = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Wise. The black dragonflight never does anything for one reason, and nobody knows what she's waiting for down there." },
    { id = "b", text = "Clear is good, though a dragon that old has outlived every army ever sent into Wyrmbog. That's what frightens me." },
  } },
  { id = "doubt", text = "A dragon in Dustwallow. Sounds like marsh gossip to me.", fx = { opinion = { onyxia = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Tell that to the patrols that never came back from Wyrmbog. Gossip doesn't leave scorch marks.", fx = { affinity = -1 } },
    { id = "b", text = "Plenty in Theramore hope you're right. Very few of them would go and check." },
  } },
} }

P:Views { topic = "emerald_dream", views = {
  { id = "wonder", text = "A whole other world of dreaming green. I'd love to walk there.", fx = { opinion = { emerald_dream = "wonder" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "So would every druid, and only the very wise are allowed. Malfurion himself walks there now, and his people wait for him to wake.", fx = { affinity = 1 } },
    { id = "b", text = "Careful what you wish for. Some druids walked into the Dream and never woke up, and their bodies are still lying in Moonglade." },
  } },
  { id = "wary", text = "Sleepers who don't wake, and dragons gone wrong. Something's sour in there.", fx = { opinion = { emerald_dream = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "The Cenarion Circle won't say it out loud, but they think so too. Ysera's own children have come out of the Dream mad and twisted.", fx = { affinity = 1 } },
    { id = "b", text = "Sour, aye, and nobody knows why. That's the worst part of it." },
  } },
  { id = "doubt", text = "Druids sleeping to save the world. Seems a fine excuse for a nap.", fx = { opinion = { emerald_dream = "doubt" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Say that in Moonglade and you'll have a bear's paw in your ear. They take their sleeping very seriously." },
    { id = "b", when = { class = "DRUID" }, text = "You of all people should know better, {class}. The Dream isn't rest, and the Circle would tell you so sharply.", fx = { affinity = -1 } },
    { id = "c", text = "A fine excuse, if the world stayed saved. Lately it hasn't been." },
  } },
} }

P:Views { topic = "green_dragons", views = {
  { id = "fight", text = "Corrupted or not, those dragons are killing people. They need stopping.", fx = { opinion = { green_dragons = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Aye, though stopping them is another matter. They appear at the great trees in Duskwood, Ashenvale, the Hinterlands and Feralas, and they sleep their enemies to death.", fx = { affinity = 1 } },
    { id = "b", text = "Bring a lot of friends and something to keep you awake. Those dragons don't fight fair, and they don't fight alone." },
  } },
  { id = "pity", text = "Ysera's own children, twisted against their will. That's a tragedy.", fx = { opinion = { green_dragons = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "It is, and the druids grieve over it. The greens guarded the Dream for longer than any of us can count, and now something in it has turned on them.", fx = { affinity = 1 } },
    { id = "b", text = "A tragedy that breathes poison gas, {class}. Pity them from a long way off." },
  } },
  { id = "awe", text = "Dragons guarding the world's dreams. I hardly know what to think.", fx = { opinion = { green_dragons = "wonder" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Nobody does, truthfully. Even the oldest druids talk about Ysera the way the rest of us talk about the weather, as something too big to argue with." },
    { id = "b", text = "Think carefully, then. The greens were friends to the world once, and those that aren't mad still might be." },
  } },
} }

P:Views { topic = "centaur", views = {
  { id = "grudge", when = { race = "Tauren" }, text = "The centaur hunted my people across the plains. I won't forget that.", fx = { opinion = { centaur = "hate" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "None of the tribes have forgotten. Cairne led your people to Mulgore because the centaur gave them no peace, and Thrall's warriors helped him do it.", fx = { affinity = 1 } },
    { id = "b", text = "Nor should you, though the plains are wide and the grudge is long. Hold it close, but don't let it ride you." },
  } },
  { id = "fight", text = "Raiders, every one. The Kolkar won't stop until they're made to.", fx = { opinion = { centaur = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "You're right about that. They raid the roads of the Barrens and laugh about it, and only a sharp spear changes their minds.", fx = { affinity = 1 } },
    { id = "b", text = "Made to, aye, though the Magram and Gelkis in Desolace are so busy fighting each other they've half done the job for us." },
  } },
  { id = "riders", text = "Say what you like, they're fearsome on the charge. I respect that.", fx = { opinion = { centaur = "respect" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Fearsome, aye, and proud of it. Respect them all you like, but don't stand in front of a charge to do it." },
    { id = "b", text = "They're Zaetar's children and something worse besides, so they'll never be just horsemen. Still, I'll grant you they can ride." },
  } },
} }

P:Views { topic = "quilboar", views = {
  { id = "fight", text = "The Razormane need pushing back before they take the whole Barrens.", fx = { opinion = { quilboar = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "They do, and the Crossroads would thank you for every one you send running. They breed faster than we can kill them, though.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Alliance" }, text = "Pushing them back would be a kindness to anyone on the road south, Alliance or not. They don't check your colours before they charge." },
  } },
  { id = "pity", text = "Agamaggan's children, gone savage. I almost feel sorry for them.", fx = { opinion = { quilboar = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Almost is about right. They were proud once, the tauren say, but now they listen to the worst of their own and to stranger voices besides." },
    { id = "b", text = "Feel sorry for them after one's put a tusk through your leg, and then tell me how much pity you've got left." },
  } },
  { id = "joke", text = "Pigs with spears. Somehow they're still the worst thing in the Barrens.", fx = { opinion = { quilboar = "scorn" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Pigs with spears, thorn magic and a grudge against everyone who isn't a pig. That's a lot of trouble for a smell.", fx = { affinity = 1 } },
    { id = "b", text = "Laugh while you can, {class}. Their geomancers have buried better fighters than you in those brambles." },
  } },
} }

P:Views { topic = "timbermaw", views = {
  { id = "respect", text = "The Timbermaw held out against the corruption when their kin fell. That's strength.", fx = { opinion = { timbermaw = "respect" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "It is. Every other furbolg tribe in Felwood went mad from the fel, and the Timbermaw shut their gates and held on.", fx = { affinity = 1 } },
    { id = "b", text = "Strength, aye, and stubbornness. They'll not trust you until you've done them a few favours, but they'll not forget you after." },
  } },
  { id = "wary", text = "Friendly or not, they're still furbolgs. I'd keep my distance.", fx = { opinion = { timbermaw = "distrust" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "They'd keep theirs from you too, if you came at them that way. Kill a few Deadwood and bring them the beads, and you'll see a different side of them." },
    { id = "b", text = "Fair enough, but they're the only safe road between Felwood and Winterspring. You'll need their hold sooner or later." },
  } },
  { id = "pity", text = "Their kin in Felwood are lost to the fel. That's a cruel fate.", fx = { opinion = { timbermaw = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Cruel, and slow. The Timbermaw grieve for the Deadwood even while they fight them, and that's a hard thing to do.", fx = { affinity = 1 } },
    { id = "b", text = "A cruel fate, and one that's still spreading. Felwood eats everything it touches, so watch what you drink there." },
  } },
} }

P:Views { topic = "ravenholdt", views = {
  { id = "invite", when = { class = "ROGUE" }, text = "I'd like an invitation to that manor someday.", fx = { opinion = { ravenholdt = "admire" }, trait = { discreet = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Then don't go looking for it. From what I hear, Ravenholdt finds you, and only once you've made a name nobody says aloud.", fx = { affinity = 1 } },
    { id = "b", text = "Careful what you wish for. The Syndicate wants that manor's head, and anyone with an invitation is on their list." },
  } },
  { id = "admire", text = "Assassins with rules are better than assassins without. I respect that.", fx = { opinion = { ravenholdt = "respect" }, trait = { practical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "That's a kind way to put it. They hate the Syndicate's thugs more than anyone, which counts for something in Alterac." },
    { id = "b", text = "Respect them quietly, then. People who talk about Ravenholdt too much tend to stop talking." },
  } },
  { id = "condemn", text = "Killers for hire, whatever their manners. Nothing to admire there.", fx = { opinion = { ravenholdt = "distrust" }, trait = { stern = 1 }, align = { honor = 2 } }, replies = {
    { id = "a", text = "I'd agree, if I didn't suspect half the kings in the world had paid them at one time or another. Honest men keep strange company sometimes." },
    { id = "b", when = { class = { "PALADIN", "WARRIOR" } }, text = "Spoken like someone who fights where they can be seen. Not everyone has that luxury, though I'll not argue the principle.", fx = { affinity = 1 } },
    { id = "c", text = "Say it as loud as you like here, but not in the Hillsbrad foothills." },
  } },
  { id = "doubt", text = "A secret manor of master assassins. That's a story for children.", fx = { opinion = { ravenholdt = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Then they're doing their job. A secret manor everyone believed in wouldn't be much of a secret." },
    { id = "b", text = "Children's stories don't usually leave a body behind with the coin still in its purse. Believe what you like." },
  } },
} }

-- Faiths ------------------------------------------------------------------------------------

P:Views { topic = "holy_light", views = {
  { id = "scorn", when = { race = "Scourge" }, text = "The Light didn't save Lordaeron. It won't save anyone else either.", fx = { opinion = { holy_light = "scorn" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "It didn't save us, and its priests in the Scarlet Monastery are still trying to burn what's left of us. I've no more faith to lose." },
    { id = "b", text = "Hard words, but the Undercity is full of people who prayed to the Light until their last breath. Some of them still do, out of habit." },
  } },
  { id = "faith", when = { faction = "Alliance" }, text = "The Light guides my hand. I trust in it completely.", fx = { opinion = { holy_light = "faith" }, trait = { pious = 1 }, align = { light = 2 } }, replies = {
    { id = "a", text = "Light bless you for it. There's no shortage of doubters these days, and the Cathedral needs folk who still believe without asking for proof.", fx = { affinity = 1 } },
    { id = "b", when = { class = { "PALADIN", "PRIEST" } }, text = "As it should, {class}. Uther used to say the Light doesn't ask for perfection, only that you keep walking toward it.", fx = { affinity = 1 } },
    { id = "c", text = "Completely is a big word. The Light doesn't lie, but those who speak for it sometimes do." },
  } },
  { id = "church", when = { faction = "Alliance" }, text = "I believe in the Light. I'm less sure about the Church.", fx = { opinion = { holy_light = "doubt" }, trait = { honest = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "You're not alone in that. The Archbishop means well, but the Church grew rich while Westfall starved, and the stonemasons never got paid." },
    { id = "b", text = "Careful, {class}. The Church held this kingdom together when the crown couldn't, and it deserves better than that.", fx = { affinity = -1 } },
  } },
  { id = "camps", when = { race = "Orc" }, text = "The humans prayed to their Light while they built our camps.", fx = { opinion = { holy_light = "distrust" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "They did, and called it mercy. Whatever their Light is, it looked away when we needed it." },
    { id = "b", text = "And Thrall chose not to hate them for it. Hold your anger if you must, but don't let it decide for you." },
  } },
  { id = "respect", when = { faction = "Horde" }, text = "Human faith or not, I've seen their paladins stand firm. I respect that.", fx = { opinion = { holy_light = "respect" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "So have I. A paladin with his back to a wall is a hard thing to break, whatever you think of what he prays to.", fx = { affinity = 1 } },
    { id = "b", text = "Respect it, then, but don't stand in front of it. Their Light burns our kind just as well as it heals theirs." },
  } },
  { id = "practical", text = "Whatever it is, I've seen it close a wound. That's enough for me.", fx = { opinion = { holy_light = "respect" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "A soldier's faith, and not a bad one. The priests would want more from you, but the wounded won't complain.", fx = { affinity = 1 } },
    { id = "b", text = "That's what most of us know of it, truth be told. Leave the arguments to the people in robes." },
  } },
} }

P:Views { topic = "elune", views = {
  { id = "devout", when = { race = "NightElf" }, text = "Elune watches over me. I feel her light every night.", fx = { opinion = { elune = "faith" }, trait = { pious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Elune-adore, {class}. Her light found us through ten thousand years of war, and it will find you on whatever road you walk.", fx = { affinity = 1 } },
    { id = "b", text = "Hold to that. Outside the forest, the moon looks smaller, and some of our people forget." },
  } },
  { id = "admire", when = { faction = "Alliance" }, text = "The Moon Goddess has a gentle face. There's peace in that.", fx = { opinion = { elune = "admire" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Gentle, and fierce when she must be. Ask the Sentinels; they pray to her before every patrol and fight like she's watching.", fx = { affinity = 1 } },
    { id = "b", text = "There is, though the priestesses would tell you the moon has two faces, and one of them is turned away." },
  } },
  { id = "foe", when = { faction = "Horde" }, text = "The Sentinels pray to Elune, then put arrows in our loggers.", fx = { opinion = { elune = "distrust" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Gods don't choose who uses their names, {class}. Still, I've noticed the elves never have trouble finding a prayer before a fight." },
    { id = "b", text = "And we put axes in their trees. Ashenvale's a war, and both sides pray before it." },
  } },
  { id = "wonder", text = "I've seen priestesses heal by moonlight. Something answers them.", fx = { opinion = { elune = "respect" }, trait = { curious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Something does, and it's answered them since before Stormwind was a village. That alone is worth some respect.", fx = { affinity = 1 } },
    { id = "b", text = "Many things answer, if you call them loudly enough. The trick is knowing what's on the other end." },
  } },
  { id = "doubt", text = "A goddess in the moon is a pretty story. I trust my own eyes.", fx = { opinion = { elune = "doubt" }, trait = { skeptical = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Your eyes would see the moon, and nothing else. The night elves see their whole history in it, and they're not wrong to." },
    { id = "b", when = { race = "NightElf" }, text = "Then your eyes have not seen enough, {class}. Look again on a clear night in Darnassus, and tell me she isn't there.", fx = { affinity = -1 } },
    { id = "c", text = "Fair enough. Eyes are reliable, as long as you don't need them in the dark." },
  } },
} }

P:Views { topic = "earth_mother", views = {
  { id = "devout", when = { race = "Tauren" }, text = "The Earth Mother has carried my people since before memory.", fx = { opinion = { earth_mother = "faith" }, trait = { pious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "And she will carry them long after. Walk with the Earth Mother, {class}, and she'll walk with you.", fx = { affinity = 1 } },
    { id = "b", text = "She has. Her eyes are An'she and Mu'sha, the sun and moon, and they've watched over the herds since the first dawn." },
  } },
  { id = "respect", when = { faction = "Horde" }, text = "The tauren faith runs deep. I respect the Earth Mother.", fx = { opinion = { earth_mother = "respect" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "As should every one of us. The tauren took us in as brothers, and their faith is part of why they did.", fx = { affinity = 1 } },
    { id = "b", text = "Respect it in deeds, then. Leave the land as you found it, and the tauren will take note." },
  } },
  { id = "simple", when = { faction = "Alliance" }, text = "A goddess of grass and sky. Simpler than a cathedral, and maybe better.", fx = { opinion = { earth_mother = "curious" }, trait = { curious = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Simpler, maybe, but not small. The tauren pray under the open sky, and it's hard to argue they've chosen the wrong roof." },
    { id = "b", text = "Don't let the Archbishop hear you say so. Still, I've met a tauren or two, and they're calmer folk than most priests I know." },
  } },
  { id = "doubt", text = "Earth and sky are just earth and sky. I don't see a goddess.", fx = { opinion = { earth_mother = "doubt" }, trait = { skeptical = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Then you're not looking the way the tauren look. They see her in every herd that comes back in spring, and they've been right more often than not." },
    { id = "b", when = { race = "Tauren" }, text = "The grass doesn't need you to see her, {class}. It grows all the same.", fx = { affinity = -1 } },
  } },
  { id = "land", text = "Whatever you call her, the land deserves better care than it gets.", fx = { opinion = { earth_mother = "respect" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "True words. Look at Desolace, or what the Venture Company is doing to Stonetalon, and tell me the land isn't paying for our greed.", fx = { affinity = 1 } },
    { id = "b", text = "It does, though care costs time and coin, and both are short. Still, it's good someone thinks it." },
  } },
} }

P:Views { topic = "the_elements", views = {
  { id = "ask", when = { class = "SHAMAN" }, text = "The spirits answer because I ask, never because I command.", fx = { opinion = { the_elements = "respect" }, trait = { pious = 1 }, align = { honor = 1, order = 1 } }, replies = {
    { id = "a", text = "Then you've learned the first lesson, and many never do. The warlocks commanded, and look what it cost the Horde.", fx = { affinity = 1 } },
    { id = "b", text = "Good. The elements remember a polite voice, {class}, and they remember a rude one longer." },
  } },
  { id = "return", when = { race = "Orc" }, text = "The spirits turned from us once. Thrall brought them back.", fx = { opinion = { the_elements = "respect" }, trait = { proud = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "He did, and our people owe him for it. A Horde that listens to the spirits is a Horde that won't drink demon blood again.", fx = { affinity = 1 } },
    { id = "b", text = "They came back, aye, but they're watching us. One more betrayal and they may not return a second time." },
  } },
  { id = "wary", when = { faction = "Alliance" }, text = "Spirits in every stone and flame. I'd rather trust the Light.", fx = { opinion = { the_elements = "distrust" }, trait = { cautious = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Many would, here. The dwarves of Ironforge dig through stone every day, and I've never heard one apologise to it." },
    { id = "b", text = "Trust what you like, but the earth will shake whether you pray to it or not. The orcs aren't wrong about that." },
  } },
  { id = "respect", text = "Fire, earth, wind and water. Treat them well, or they'll bury you.", fx = { opinion = { the_elements = "respect" }, trait = { cautious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Truer words were never spoken. Every flood and every forest fire is a reminder of who's really in charge.", fx = { affinity = 1 } },
    { id = "b", text = "Wise. The old shamans say a storm is just the wind losing patience, and I've seen enough storms to believe it." },
  } },
  { id = "power", text = "Raw power, there for anyone bold enough to bend it.", fx = { opinion = { the_elements = "covet" }, trait = { proud = 1 }, align = { order = -1, honor = -1 } }, replies = {
    { id = "a", text = "That's how warlocks talk, {class}, and it's how the orcs lost the spirits the first time. The elements don't bend; they break whoever tries.", fx = { affinity = -1 } },
    { id = "b", text = "Bold, and foolish. The Twilight's Hammer think the same thing, and you've seen what they've become." },
  } },
} }
