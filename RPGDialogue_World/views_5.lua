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
    { id = "c", when = { disposition = { min = 60 } }, text = "He listens to the wrong voices, that much is true. Though from what I hear, the wrong voices are very charming." },
  } },
  { id = "foe", when = { faction = "Horde" }, text = "The Highlord's a worthy enemy. I'd rather face him than some coward.", fx = { opinion = { bolvar = "respect" }, trait = { proud = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "You know what a real fight is, then. The humans have few enough of his kind, and they keep the rest behind desks.", fx = { affinity = 1 } },
    { id = "b", text = "Respect him all you like, but remember he'd see us all back in the camps if his nobles let him." },
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
    { id = "a", text = "Light grant you're right. There are candles burning in windows all over the Trade District, and nobody's quite ready to blow them out.", fx = { affinity = 1 } },
    { id = "b", text = "I'd like to believe it, {class}. But the sea doesn't give back much, and it's been a long while now." },
  } },
  { id = "foul", when = { faction = "Alliance" }, text = "Kings don't just vanish at sea. Someone at court wanted him gone.", fx = { opinion = { varian = "suspicion" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Keep your voice down when you say that. If you've proof, take it to the Highlord, not to a tavern, and if you haven't, keep it to yourself." },
    { id = "b", text = "Others have thought it, but you'll find nobody at the Keep willing to say it. Funny how that works.", fx = { affinity = 1 } },
    { id = "c", when = { disposition = { max = 34 } }, text = "That's dangerous talk from someone who's never set foot in the Keep, and I'll not be seen standing next to it.", fx = { affinity = -1 } },
  } },
  { id = "glad", when = { faction = "Horde" }, text = "One less human king. Their loss buys the Horde time to grow.", fx = { opinion = { varian = "glad" }, trait = { practical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "The Warchief knows it too, because a kingdom run by a boy and a council of squabbling lords won't be sending armies to Durotar any time soon." },
    { id = "b", text = "Cold, {class}, though I can't say you're wrong. Their troubles are our breathing room." },
  } },
  { id = "peace", when = { faction = "Horde" }, text = "They say he was sailing to talk peace, which is a sorry way to end.", fx = { opinion = { varian = "pity" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
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
    { id = "a", text = "Lucky, aye, that's the word everyone at court uses. She's charmed most of the House of Nobles, and the rest are too nervous to say otherwise." },
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
    { id = "c", when = { disposition = { min = 60 } }, text = "That's a sharp memory you've got, {class}, and a good deal sharper than the court's, it seems.", fx = { affinity = 1 } },
  } },
  { id = "bored", text = "Court gossip bores me. Let the nobles play their little games.", fx = { opinion = { prestor = "indifferent" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "That's wise of you. Those games have a way of deciding who gets bread and who gets soldiers, but there's no use worrying about what you can't touch." },
    { id = "b", text = "Suit yourself, though the lady's games aren't little, and I'd not want to be on the board when she moves a piece." },
  } },
} }

P:Views { topic = "magni", views = {
  { id = "admire", when = { faction = "Alliance" }, text = "Magni's a king who still swings a hammer. I respect that.", fx = { opinion = { magni = "respect" }, trait = { brave = 1 }, align = { order = 1, honor = 1 } }, replies = {
    { id = "a", text = "Aye, and he's earned it. He took his brother's loss hard, with Muradin gone in the north, but he's never once let it bend his back before his people.", fx = { affinity = 1 } },
    { id = "b", text = "You'll hear no argument from me. A king who drinks at the Stonefire Tavern now and then knows what his people are thinking." },
  } },
  { id = "insular", when = { faction = "Alliance" }, text = "Ironforge looks after Ironforge first, and Magni's no different.", fx = { opinion = { magni = "doubt" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "And who could blame him, with the Dark Irons at his back door and the troggs in his deeps? Stormwind wasn't so quick to help when Gnomeregan fell.", fx = { affinity = -1 } },
    { id = "b", text = "There's truth in that, for the gates of Ironforge stay open to the Alliance, but the vaults stay very firmly shut." },
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
    { id = "b", when = { race = "NightElf" }, text = "Elune-adore, {class}. Your people see in her what few outsiders do, and you say it plainly.", fx = { affinity = 1 } },
  } },
  { id = "cold", when = { faction = "Alliance" }, text = "She's kept her people apart for ten thousand years. Hard to warm to.", fx = { opinion = { tyrande = "doubt" }, trait = { honest = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Ten thousand years of watching every outsider bring fire and ruin will do that. She keeps the borders closed because she remembers why she must." },
    { id = "b", when = { race = "NightElf" }, text = "You speak lightly of your own High Priestess. She opened Darnassus to outsiders, and that cost her more than you know.", fx = { affinity = -1 } },
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
  { id = "proud", when = { faction = "Alliance" }, text = "Theramore proves the Alliance can still build something new.", fx = { align = { order = 1 }, opinion = { theramore = "admire" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "It does. Lady Proudmoore brought refugees across the sea with nothing, and now there's a stone harbour and a tower where there was only swamp.", fx = { affinity = 1 } },
    { id = "b", text = "New, and very far from home. I hope they've enough men on those walls, because the marsh is full of things that aren't fond of stone." },
  } },
  { id = "brave", when = { faction = "Alliance" }, text = "Living beside the Horde by choice. Jaina's braver than I am.", fx = { opinion = { theramore = "doubt" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Braver, or more trusting. She swears by Thrall's word, and so far it's held, though I'd not have wagered on it." },
    { id = "b", text = "She fought beside orcs at Hyjal, {class}. That changes how you look at your neighbours." },
  } },
  { id = "keeps_word", when = { faction = "Horde" }, text = "Jaina keeps her word to the Warchief, and that's rare for a human.", fx = { opinion = { theramore = "respect" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Rare enough that the Warchief guards it closely. Not everyone in Orgrimmar likes the arrangement, but they've kept their axes sheathed.", fx = { affinity = 1 } },
    { id = "b", text = "She keeps it, aye. Her soldiers in the marsh aren't always so careful, so don't go testing it." },
  } },
  { id = "fortress", when = { faction = "Horde" }, text = "A human fortress on our doorstep. I don't care who rules it.", fx = { align = { order = -1 }, opinion = { theramore = "distrust" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "You're not alone. Brackenwall Village keeps a close eye on it, and there are ships in that harbour that could carry soldiers as easily as fish." },
    { id = "b", text = "Thrall cares, and so should you, because a war with Theramore is one we don't need.", fx = { affinity = -1 } },
  } },
  { id = "swamp", text = "Fine city, shame about the swamp around it.", fx = { opinion = { theramore = "wry" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Dustwallow Marsh, the only place in the world where the mosquitoes have mosquitoes. Still, it keeps unwanted guests away.", fx = { affinity = 1 } },
    { id = "b", text = "The swamp has its uses. Nobody marches an army through that mud and arrives in a fit state to fight." },
  } },
} }

P:Views { topic = "booty_bay", views = {
  { id = "profit", text = "Best market in the south seas, as long as you count your change.", fx = { align = { order = -1 }, opinion = { booty_bay = "profit" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Twice, and then once more for luck. The Steamwheedle goblins will sell you anything, and they'll smile while they short you a copper.", fx = { affinity = 1 } },
    { id = "b", text = "That's the spirit. Anything that floats or fights in Stranglethorn ends up on those docks eventually, and somebody's always buying." },
  } },
  { id = "pirates", text = "Booty Bay's just a pirate den with a nicer dock.", fx = { align = { order = 1 }, opinion = { booty_bay = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "The Bloodsail Buccaneers would take that as an insult, since they're the ones who aren't welcome there. Baron Revilgaz keeps his pirates honest, more or less." },
    { id = "b", text = "Nicer than most dens, at least. The bruisers keep the peace, and they don't much care who you are as long as you don't start anything." },
  } },
  { id = "sea", text = "Rum, sea air and sunshine. I could happily live there.", fx = { opinion = { booty_bay = "fond" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Until the sharks, the raptors and the trolls in the jungle remind you where you are. Still, the sunsets are worth a few bites.", fx = { affinity = 1 } },
    { id = "b", text = "Plenty have said that and stayed, and most of them owe the goblins money now. Mind the rum." },
  } },
} }

P:Views { topic = "gadgetzan", views = {
  { id = "law", text = "The bruisers keep better order than most kings manage.", fx = { align = { order = 1 }, opinion = { gadgetzan = "respect" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "They do, because order's good for business. Start a brawl in Gadgetzan and you'll be picking yourself out of the sand outside the wall before you've finished swinging.", fx = { affinity = 1 } },
    { id = "b", text = "Better order, maybe, but not cheaper. Everything in that town has a price, water most of all." },
  } },
  { id = "heat", text = "Gadgetzan's lovely, if you like being slowly baked alive.", fx = { align = { order = -1 }, opinion = { gadgetzan = "wry" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! The goblins say the heat keeps the prices up, since everyone's too thirsty to haggle.", fx = { affinity = 1 } },
    { id = "b", text = "You get used to it, or you dry up and blow away with the Wastewander bandits. There's not much else to choose from in Tanaris." },
  } },
  { id = "gateway", text = "The last friendly roof before the desert is worth something.", fx = { opinion = { gadgetzan = "profit" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Worth plenty. Past those walls it's Zul'Farrak, the Wastewanders and the silithid, and none of them sell water.", fx = { affinity = 1 } },
    { id = "b", text = "Friendly, as long as your coin is. The goblins aren't sentimental about who sleeps under their roofs." },
  } },
} }

P:Views { topic = "ratchet", views = {
  { id = "neutral", text = "A port where Horde and Alliance both dock is a useful thing.", fx = { align = { order = 1 }, opinion = { ratchet = "profit" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Useful, and profitable for Gazlowe. The boat to Booty Bay doesn't care what colour your tabard is, so long as you've paid the fare.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Horde" }, text = "Useful, so long as you remember the human beside you at the bar might be one of Theramore's eyes." },
    { id = "c", when = { faction = "Alliance" }, text = "Useful, so long as you remember the orc beside you at the bar might be reporting to Orgrimmar." },
  } },
  { id = "rough", text = "Ratchet's rough. Half the dock looks like it's for sale.", fx = { align = { order = -1 }, opinion = { ratchet = "distrust" }, trait = { skeptical = 1 } }, replies = {
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
  { id = "profit", text = "Clever goblins, selling warmth in the snow. Somebody's getting rich.", fx = { align = { honor = -1 }, opinion = { everlook = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Somebody always is, where goblins are concerned. Furs, frostsaber hides and whatever the Winterfall dig up all pass through that town.", fx = { affinity = 1 } },
    { id = "b", text = "Rich and frozen, which isn't a trade I'd make. You can't spend gold with numb fingers." },
  } },
  { id = "wild", text = "Beyond the walls, Winterspring's wild and beautiful. Dangerous, though.", fx = { align = { honor = 1 }, opinion = { everlook = "admire" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Beautiful and dangerous, like most things worth seeing. The Winterfall furbolgs have turned savage of late, so watch the tree line.", fx = { affinity = 1 } },
    { id = "b", text = "Dangerous is putting it gently. Frostsabers hunt in pairs out there, and the snow covers your tracks before you can follow them home." },
  } },
} }

P:Views { topic = "dalaran", views = {
  { id = "kelthuzad", when = { race = "Scourge" }, text = "Their own necromancer started all of this. I remember Kel'Thuzad.", fx = { opinion = { dalaran = "hate" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "So do many, and the Kirin Tor would rather they didn't. One of their own founded the Cult of the Damned, and Lordaeron paid for it." },
    { id = "b", text = "Remembering is the one thing the Lich King couldn't take. Keep it, and keep it sharp." },
  } },
  { id = "pity", text = "A city of wonders broken by Archimonde is a heavy loss.", fx = { align = { light = 1 }, opinion = { dalaran = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "It was. Libraries older than any kingdom went up in that fire, and the mages who survived have hidden what's left behind a violet dome in the Alterac hills.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Horde" }, text = "A loss for the humans, maybe, but I don't recall their mages weeping when Draenor tore itself apart." },
  } },
  { id = "arrogant", text = "Mages meddling where they shouldn't. Dalaran had its fall coming.", fx = { align = { light = -1 }, opinion = { dalaran = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "The farmers of Lordaeron would say worse. Pride lived in those towers, and pride burns as well as anything." },
    { id = "b", text = "Say that near any mage and you'll find yourself a sheep for an afternoon. Some of them lost everyone they knew there.", fx = { affinity = -1 } },
  } },
  { id = "dome", text = "I want to see that violet dome for myself someday.", fx = { opinion = { dalaran = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "You'll see it from the hills well enough, but you'll not get through. The Kirin Tor let in only those they choose, and they choose very few.", fx = { affinity = 1 } },
    { id = "b", text = "Mind the road, then. Alterac is full of Syndicate thieves and ogres, and none of them care that you only came to look." },
  } },
} }

P:Views { topic = "kirin_tor", views = {
  { id = "respect", text = "The Kirin Tor kept magic from tearing the world apart, and that counts.", fx = { opinion = { kirin_tor = "respect" }, trait = { cautious = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "It counts for plenty. They've policed spellcraft for longer than Stormwind's had walls, and every mage you meet learned their rules first.", fx = { affinity = 1 } },
    { id = "b", text = "Kept it from tearing the world apart, mostly. Ask the people of Lordaeron how well they kept Kel'Thuzad in hand." },
  } },
  { id = "distrust", text = "Too many secrets behind those doors. I don't trust any of them.", fx = { opinion = { kirin_tor = "distrust" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Secrets are their trade, {class}. They'd tell you it's for your protection, and they might even believe it." },
    { id = "b", when = { class = { "MAGE" } }, text = "Says the one who learned their spells from a Kirin Tor book. Mind whose hand you're biting.", fx = { affinity = -1 } },
    { id = "c", text = "Nor do I, entirely. A council that decides who may learn and who may not answers to nobody but itself." },
  } },
  { id = "study", when = { class = "MAGE" }, text = "I'd give a lot to study in their libraries one day.", fx = { opinion = { kirin_tor = "respect" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Then study hard and keep your nose clean, because they're always watching. Perhaps one day they'll send for you.", fx = { affinity = 1 } },
    { id = "b", text = "Much of what was in them burned with the city. What survived, they guard like dragons guard gold." },
  } },
  { id = "proud", text = "Clever folk, but far too proud for their own good.", fx = { opinion = { kirin_tor = "doubt" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "They'd call it confidence. Then again, they called it confidence right up until the Scourge came through their gates." },
    { id = "b", text = "Proud, aye, and clever enough to back it up most of the time. That's what makes them dangerous." },
  } },
} }

P:Views { topic = "nordrassil", views = {
  { id = "revere", text = "The World Tree held back Archimonde himself. I'd call that holy.", fx = { align = { order = 1 }, opinion = { nordrassil = "admire" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "Many would. The tree gave up the night elves' immortality to break him, and they paid that price without complaint.", fx = { affinity = 1 } },
    { id = "b", when = { race = "NightElf" }, text = "Holy, and wounded. Every night elf is mortal now because of what happened on that mountain, and your people feel it.", fx = { affinity = 1 } },
  } },
  { id = "allies", text = "Orcs, humans and elves fought together at Hyjal once. Remarkable.", fx = { opinion = { nordrassil = "respect" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Remarkable, and short-lived. The moment the demon fell, they all went back to watching each other over their walls." },
    { id = "b", when = { faction = "Horde" }, text = "Thrall's warriors bled on that mountain beside the elves, and now the elves shoot our loggers. Remember that when they talk of gratitude." },
    { id = "c", when = { faction = "Alliance" }, text = "Lady Proudmoore was there with what was left of Lordaeron. She still speaks of it with a kind of wonder.", fx = { affinity = 1 } },
  } },
  { id = "doubt", text = "A tree as big as a mountain. I'll believe it when I see it.", fx = { align = { order = -1 }, opinion = { nordrassil = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Then go and see it, though the druids guard Hyjal closely. Teldrassil gives you some idea, and Teldrassil is the smaller one." },
    { id = "b", text = "Ha! Plenty said that before Hyjal, and plenty of them were standing in its shadow when Archimonde came." },
  } },
} }

P:Views { topic = "aviana", views = {
  { id = "honor", text = "Aviana gave her life against the Legion. She deserves to be remembered.", fx = { opinion = { aviana = "admire" }, trait = { pious = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "She does, and the druids of the Talon keep her shrine on Hyjal so that nobody forgets. Few outsiders even know her name.", fx = { affinity = 1 } },
    { id = "b", when = { race = "NightElf" }, text = "Every night elf child learns how the demons surrounded her and brought her down. It's good to hear an outsider say it too.", fx = { affinity = 1 } },
    { id = "c", when = { class = "DRUID" }, text = "The Talon would welcome you for saying so. Her gift is in every druid who has ever taken wing." },
  } },
  { id = "fury", text = "A goddess who died fighting. I'd rather take her anger than her grave.", fx = { opinion = { aviana = "respect" }, trait = { brave = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "That's the Talon's way of seeing it. The elders call it reckless, but the young druids on Hyjal say the same thing you do." },
    { id = "b", text = "Her anger didn't save her, friend. The demons came in numbers that no fury could answer." },
  } },
  { id = "doubt", text = "I've never heard of her. Are you sure she was real?", fx = { opinion = { aviana = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Ask any night elf, and they'll tell you a seed from her Mother Tree became Nordrassil. Gods leave marks like that behind them." },
    { id = "b", when = { race = "NightElf" }, text = "You're a kaldorei and you ask me that? Some of our eldest watched her fly with their own eyes.", fx = { affinity = -1 } },
  } },
} }

-- Dungeons ---------------------------------------------------------------------------------

P:Views { topic = "zul_gurub", views = {
  { id = "fight", text = "If Hakkar's coming back, I'd rather meet him before he's grown strong.", fx = { align = { honor = 1 }, opinion = { zul_gurub = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Brave talk, and the Zandalari on Yojamba Isle would like to hear more of it. They're gathering anyone with a blade and a stomach for blood gods.", fx = { affinity = 1 } },
    { id = "b", text = "Before he's grown strong, aye, but you'd need an army for it, not a sword. The Gurubashi high priests won't fall to one hero." },
  } },
  { id = "fear", text = "A blood god walking again is the last thing this world needs.", fx = { opinion = { zul_gurub = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "On that, every troll who isn't a fool agrees with you. Hakkar ate the Gurubashi empire alive once, and he'd do it again given half a chance." },
    { id = "b", when = { race = "Troll" }, text = "The Soulflayer remembers every troll who ever fed him, and he's hungry again. Keep your blood where it belongs." },
  } },
  { id = "tall_tale", text = "Troll priests and blood gods. Sounds like a jungle tall tale.", fx = { align = { honor = -1 }, opinion = { zul_gurub = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "The hunters who went into those ruins came back with their eyes gone strange, if they came back at all.", fx = { affinity = -1 } },
    { id = "b", text = "Most tall tales don't send Zandalari priests across the sea to warn about them. Something's stirring in Stranglethorn, whether you believe it or not." },
  } },
} }

P:Views { topic = "zul_farrak", views = {
  { id = "fight", text = "The Sandfury have raided long enough. Someone ought to go in there.", fx = { align = { honor = 1 }, opinion = { zul_farrak = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Gadgetzan would cheer the day someone did. Just know that city's full of trolls, scorpids and worse, and the sand under it remembers every body.", fx = { affinity = 1 } },
    { id = "b", text = "Ought to, aye, but nobody wants to be first through the gate. Bring friends, and bring water." },
  } },
  { id = "loot", text = "A troll city full of old gold, sitting out in the sand.", fx = { align = { honor = -1 }, opinion = { zul_farrak = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Old gold and old curses, usually in the same chest. The goblins pay well for what comes out, though, if you live to sell it." },
    { id = "b", text = "Ha! Every treasure hunter in Tanaris has said the same thing, and the Sandfury have a lovely collection of their skulls." },
  } },
  { id = "heat", text = "I'd sooner fight a hundred trolls than cross that desert again.", fx = { opinion = { zul_farrak = "wry" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Good news, then, because you'll have to do both. The heat in Zul'Farrak is worse than the trolls, or so the survivors tell me.", fx = { affinity = 1 } },
    { id = "b", text = "The desert's killed more would-be heroes than the Sandfury ever did. Carry twice the water you think you need." },
  } },
} }

P:Views { topic = "sunken_temple", views = {
  { id = "fools", text = "Worshipping the god who ate their own empire. The Atal'ai are fools.", fx = { align = { light = 1 }, opinion = { sunken_temple = "scorn" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Fools, and dangerous ones. Their temple sank under the swamp for it, and they're still down there chanting to bring him back." },
    { id = "b", when = { race = "Troll" }, text = "They're worse than fools. The Atal'ai shamed every troll who ever honoured a loa, and Hakkar laughs at them for it." },
  } },
  { id = "dread", text = "A drowned temple full of chanting priests gives me chills.", fx = { opinion = { sunken_temple = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "It should. They say a green dragon sleeps down there too, Eranikus, and that his dreams have gone bad.", fx = { affinity = 1 } },
    { id = "b", text = "Chills are healthy, {class}. The Swamp of Sorrows wasn't named for its cheerful company." },
  } },
  { id = "explore", text = "I'd like to see what's left down there before the swamp takes it.", fx = { align = { light = -1 }, opinion = { sunken_temple = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "The swamp's had it for a long time already. What's left is carvings, snakes and priests who don't want visitors." },
    { id = "b", text = "You'd be in good company with the scholars, then, though some of them would rather it stayed sealed for good." },
  } },
} }

P:Views { topic = "dire_maul", views = {
  { id = "loot", text = "A whole elven city in Feralas, and the ogres don't know what they own.", fx = { align = { light = -1 }, opinion = { dire_maul = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Ha! They know it's theirs, and that's enough for the gordok. Eldre'Thalas has more treasure than any ogre king can count, which isn't saying much.", fx = { affinity = 1 } },
    { id = "b", text = "They know what they own well enough to fight for it. Ogres are slow, not blind." },
  } },
  { id = "highborne", text = "Highborne still hiding in there, clinging to old magic, is unnatural.", fx = { align = { light = 1 }, opinion = { dire_maul = "distrust" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "Unnatural is the word. They've been feeding on whatever they've caged in there for ten thousand years, and they think nobody's noticed." },
    { id = "b", when = { race = "NightElf" }, text = "The Highborne doomed your people once already with their hunger for magic. That some still live there is a stain on the kaldorei name.", fx = { affinity = 1 } },
  } },
  { id = "library", text = "I've heard there's a great library in there. I'd like to see it.", fx = { opinion = { dire_maul = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "So have I, and it's guarded by the very elves who wrote it. Ask nicely, and maybe they'll only curse you a little." },
    { id = "b", text = "Scholars have gone in after it before. The ogres are still using one of them as a doorstop, I'm told." },
  } },
} }

P:Views { topic = "razorfen", views = {
  { id = "thorns", when = { race = "Tauren" }, text = "Agamaggan's blood grew those thorns, and the quilboar desecrate them.", fx = { align = { order = 1 }, opinion = { razorfen = "hate" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "So the elders teach. The great boar died fighting the demons, and his children grew mean and twisted in the shadow of his grave.", fx = { affinity = 1 } },
    { id = "b", text = "Desecrate them, and arm themselves from them. Every barb out there is a spear waiting to happen." },
  } },
  { id = "clear", text = "Those quilboar warrens need clearing out before they spill over.", fx = { align = { order = -1 }, opinion = { razorfen = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "They've spilled over already, ask anyone in Camp Taurajo. Charlga Razorflank stirs them up, and now there's talk of something cold and dead in the Downs.", fx = { affinity = 1 } },
    { id = "b", text = "Clear them out, and they'll breed back by spring. Still, someone has to try, and better you than a farmer." },
  } },
  { id = "scourge", text = "Undead in the Downs working with quilboar should worry everyone.", fx = { opinion = { razorfen = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "It worries me plenty. If the Scourge can make friends in the Barrens, they can make friends anywhere." },
    { id = "b", text = "They call him Amnennar the Coldbringer, whatever he is, and the quilboar treat him like a god. That's never good news." },
  } },
} }

P:Views { topic = "maraudon", views = {
  { id = "sacred", text = "The centaur were born down there, so that place should be left alone.", fx = { opinion = { maraudon = "respect" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Left alone, aye, if Princess Theradras would leave everything else alone. She's poisoning Desolace from below, and the land shows it." },
    { id = "b", text = "Sacred to the centaur, maybe, and the Maraudine guard it like it. Go in, and you go in uninvited." },
  } },
  { id = "cleanse", text = "Whatever's poisoning Desolace lives down there. Someone should cleanse it.", fx = { align = { light = 1 }, opinion = { maraudon = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "The Cenarion druids say the same, and they've lost more than one of their own trying. Bring a druid if you can find one brave enough.", fx = { affinity = 1 } },
    { id = "b", text = "Cleanse it, and maybe Desolace grows grass again in a hundred years. That's a long wait for a reward." },
  } },
  { id = "crystals", text = "I hear the caves glow with crystals. Must be worth a fortune.", fx = { align = { light = -1 }, opinion = { maraudon = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "They glow, and they bite back. The things down there are made of rock and vines, and they don't like losing their pretty stones." },
    { id = "b", text = "Ha! A goblin would say the same. I'd want more than shiny rocks before I walked into a place that made the centaur." },
  } },
} }

P:Views { topic = "blackfathom", views = {
  { id = "cult", text = "Cultists in an old elven temple. Someone ought to drive them out.", fx = { align = { light = 1 }, opinion = { blackfathom = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "The Twilight's Hammer don't drive easily. They've dug in deep, and they've got something in the water down there that they worship.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Alliance" }, text = "The Sentinels would bless you for it. That temple was Elune's once, and it hurts them to see it used so." },
    { id = "c", when = { faction = "Horde" }, text = "Zoram Strand's grunts would thank you. The cultists make the whole coast restless, and we've enough trouble with the elves." },
  } },
  { id = "water", text = "Sunken halls and something in the deep water. No, thank you.", fx = { align = { light = -1 }, opinion = { blackfathom = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Sensible. The naga swim those halls now, and the ones who come out talk about a great beast called Aku'mai with a shudder." },
    { id = "b", text = "There's no shame in that, {class}, because some places the sea took back for a reason." },
  } },
  { id = "ruin", text = "It's a shame about the temple, which must have been beautiful once.", fx = { opinion = { blackfathom = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "It was, by the old carvings. The sundering pulled it under the waves, and nothing that's moved in since has cared for beauty.", fx = { affinity = 1 } },
    { id = "b", text = "Beautiful, and long gone. The moonwells there are dark now, and that's a sad thing whatever you think of the elves." },
  } },
} }

P:Views { topic = "gurubashi_arena", views = {
  { id = "fight", text = "The arena's where a real fighter proves themselves. I'll be there.", fx = { align = { honor = 1 }, opinion = { gurubashi_arena = "admire" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Then sharpen everything you own. When Short John Mithril drops that chest, everyone in Stranglethorn comes at once, and nobody plays fair.", fx = { affinity = 1 } },
    { id = "b", text = "It proves something, I suppose, though mostly it proves who brought the most friends." },
  } },
  { id = "fools", text = "Killing each other over a chest is madness.", fx = { opinion = { gurubashi_arena = "scorn" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Madness with a crowd and good odds for the bookmakers. The goblins make more off the betting than anyone makes off the chest." },
    { id = "b", text = "Madness, perhaps, but it's honest madness, since everyone in that pit knows exactly why they're there and what it'll cost." },
  } },
  { id = "watch", text = "I'll watch from the stands and wager on the winner.", fx = { align = { honor = -1 }, opinion = { gurubashi_arena = "profit" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Smart. The stands are the only seats in the arena that don't need healing afterwards.", fx = { affinity = 1 } },
    { id = "b", text = "Wager carefully, then. The bookmakers are goblins, and the favourites have a funny way of losing." },
  } },
} }

P:Views { topic = "darkmoon_faire", views = {
  { id = "fun", text = "The Faire's the best thing to roll into town all year.", fx = { align = { order = -1 }, opinion = { darkmoon_faire = "fond" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "On that we agree. The music, the games, the fortune teller in her tent, and for once nobody's trying to kill anyone.", fx = { affinity = 1 } },
    { id = "b", text = "Best for the children, anyway. The rest of us just try not to lose our purses on the carnival games." },
  } },
  { id = "swindle", text = "Silas Darkmoon's a charming swindler, and I'd guard my coin.", fx = { align = { order = 1 }, opinion = { darkmoon_faire = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Charming swindlers are the only kind worth visiting. He's never actually robbed anyone, though plenty go home lighter." },
    { id = "b", text = "Guard it all you like; you'll spend it anyway. That's the trick of a good Faire." },
  } },
  { id = "fortune", text = "I'd like the fortune teller to read my future.", fx = { opinion = { darkmoon_faire = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Be careful what you ask her. Some folk come out of that tent laughing, and some come out very quiet indeed.", fx = { affinity = 1 } },
    { id = "b", text = "Your future's simple, {class}. Long roads, bad food and someone always wanting something killed." },
  } },
} }

-- Threats and peoples -----------------------------------------------------------------------

P:Views { topic = "onyxia", views = {
  { id = "slay", text = "A black dragon in her lair, so close to Theramore. Someone should slay her.", fx = { align = { honor = 1 }, opinion = { onyxia = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Someone should, and it would take forty of them. The bones outside her lair belong to those who thought a few would do.", fx = { affinity = 1 } },
    { id = "b", text = "Slay her, and every black whelp in the marsh will come looking for you. Dragons don't forgive and they don't forget." },
  } },
  { id = "fear", text = "A dragon that old and that cunning. I'll keep well clear.", fx = { align = { honor = -1 }, opinion = { onyxia = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Wise. The black dragonflight never does anything for one reason, and nobody knows what she's waiting for down there." },
    { id = "b", text = "Clear is good, though a dragon that old has outlived every army ever sent into Wyrmbog. That's what frightens me." },
  } },
  { id = "doubt", text = "A dragon in Dustwallow. Sounds like marsh gossip to me.", fx = { opinion = { onyxia = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "The patrols that never came back from Wyrmbog would disagree. Gossip doesn't leave scorch marks.", fx = { affinity = -1 } },
    { id = "b", text = "Plenty in Theramore hope you're right. Very few of them would go and check." },
  } },
} }

P:Views { topic = "emerald_dream", views = {
  { id = "wonder", text = "A whole other world of dreaming green. I'd love to walk there.", fx = { align = { light = 1 }, opinion = { emerald_dream = "wonder" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "So would every druid, and only the very wise are allowed. Malfurion himself walks there now, and his people wait for him to wake.", fx = { affinity = 1 } },
    { id = "b", text = "Careful what you wish for. Some druids walked into the Dream and never woke up, and their bodies are still lying in Moonglade." },
  } },
  { id = "wary", text = "Sleepers who don't wake, and dragons gone wrong. Something's sour in there.", fx = { opinion = { emerald_dream = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "The Cenarion Circle won't say it out loud, but they think so too. Ysera's own children have come out of the Dream mad and twisted.", fx = { affinity = 1 } },
    { id = "b", text = "Sour, aye, and nobody can say why, which is the worst part of it." },
  } },
  { id = "doubt", text = "Druids sleeping to save the world. Seems a fine excuse for a nap.", fx = { align = { light = -1 }, opinion = { emerald_dream = "doubt" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Say that in Moonglade and you'll have a bear's paw in your ear. They take their sleeping very seriously." },
    { id = "b", when = { class = "DRUID" }, text = "You of all people should know better, {class}. The Dream isn't rest, and the Circle would tell you so sharply.", fx = { affinity = -1 } },
    { id = "c", text = "That would be a fine excuse if the world had stayed saved, but lately it hasn't." },
  } },
} }

P:Views { topic = "green_dragons", views = {
  { id = "fight", text = "Corrupted or not, those dragons are killing people. They need stopping.", fx = { align = { light = -1 }, opinion = { green_dragons = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Aye, though stopping them is another matter. They appear at the great trees in Duskwood, Ashenvale, the Hinterlands and Feralas, and they sleep their enemies to death.", fx = { affinity = 1 } },
    { id = "b", text = "Bring a lot of friends and something to keep you awake. Those dragons don't fight fair, and they don't fight alone." },
  } },
  { id = "pity", text = "Ysera's own children twisted against their will is a tragedy.", fx = { align = { light = 1 }, opinion = { green_dragons = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "The druids grieve over it, for the greens guarded the Dream for longer than any of us can count, and now something in it has turned on them.", fx = { affinity = 1 } },
    { id = "b", text = "A tragedy that breathes poison gas, {class}. Pity them from a long way off." },
  } },
  { id = "awe", text = "Dragons guarding the world's dreams. I hardly know what to think.", fx = { opinion = { green_dragons = "wonder" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Nobody does, truthfully. Even the oldest druids talk about Ysera the way the rest of us talk about the weather, as something too big to argue with." },
    { id = "b", text = "Think carefully, then. The greens were friends to the world once, and those that aren't mad still might be." },
  } },
} }

P:Views { topic = "centaur", views = {
  { id = "grudge", when = { race = "Tauren" }, text = "The centaur hunted my people across the plains. I won't forget that.", fx = { align = { honor = -1 }, opinion = { centaur = "hate" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "None of the tribes have forgotten. Cairne led your people to Mulgore because the centaur gave them no peace, and Thrall's warriors helped him do it.", fx = { affinity = 1 } },
    { id = "b", text = "Nor should you, though the plains are wide and the grudge is long. Hold it close, but don't let it ride you." },
  } },
  { id = "fight", text = "Raiders, every one. The Kolkar won't stop until they're made to.", fx = { opinion = { centaur = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "You're right about that. They raid the roads of the Barrens and laugh about it, and only a sharp spear changes their minds.", fx = { affinity = 1 } },
    { id = "b", text = "Made to, aye, though the Magram and Gelkis in Desolace are so busy fighting each other they've half done the job for us." },
  } },
  { id = "riders", text = "Centaur are fearsome on the charge, and I respect that.", fx = { align = { honor = 1 }, opinion = { centaur = "respect" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Fearsome, aye, and proud of it. Respect them all you like, but don't stand in front of a charge to do it." },
    { id = "b", text = "They're Zaetar's children and something worse besides, so they'll never be just horsemen. Still, nobody disputes they can ride." },
  } },
} }

P:Views { topic = "quilboar", views = {
  { id = "fight", text = "The Razormane need pushing back before they take the whole Barrens.", fx = { align = { light = -1 }, opinion = { quilboar = "defy" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "The Crossroads would thank you for every one you send running, though they breed faster than we can kill them, and that's the trouble.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Alliance" }, text = "Pushing them back would be a kindness to anyone on the road south, Alliance or not. They don't check your colours before they charge." },
  } },
  { id = "pity", text = "Agamaggan's children, gone savage. I almost feel sorry for them.", fx = { align = { light = 1 }, opinion = { quilboar = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Almost is about right. They were proud once, the tauren say, but now they listen to the worst of their own and to stranger voices besides." },
    { id = "b", text = "Feel sorry for them after one's put a tusk through your leg, and then tell me how much pity you've got left." },
  } },
  { id = "joke", text = "Pigs with spears. Somehow they're still the worst thing in the Barrens.", fx = { opinion = { quilboar = "scorn" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Pigs with spears, thorn magic and a grudge against everyone who isn't a pig. That's a lot of trouble for a smell.", fx = { affinity = 1 } },
    { id = "b", text = "Laugh while you can, {class}. Their geomancers have buried better fighters than you in those brambles." },
  } },
} }

P:Views { topic = "timbermaw", views = {
  { id = "respect", text = "The Timbermaw held out against the corruption when their kin fell, and that's strength.", fx = { align = { order = -1 }, opinion = { timbermaw = "respect" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "It is. Every other furbolg tribe in Felwood went mad from the fel, and the Timbermaw shut their gates and held on.", fx = { affinity = 1 } },
    { id = "b", text = "Strength, aye, and stubbornness. They'll not trust you until you've done them a few favours, but they'll not forget you after." },
  } },
  { id = "wary", text = "Friendly or not, they're still furbolgs. I'd keep my distance.", fx = { align = { order = 1 }, opinion = { timbermaw = "distrust" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "They'd keep theirs from you too, if you came at them that way. Kill a few Deadwood and bring them the beads, and you'll see a different side of them." },
    { id = "b", text = "Keep it, then, but they're the only safe road between Felwood and Winterspring. You'll need their hold sooner or later." },
  } },
  { id = "pity", text = "Their kin in Felwood lost to the fel is a cruel fate.", fx = { opinion = { timbermaw = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Cruel, and slow. The Timbermaw grieve for the Deadwood even while they fight them.", fx = { affinity = 1 } },
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
    { id = "a", text = "I'd agree, if I didn't suspect most of the kings in the world had paid them at one time or another. Honest men keep strange company sometimes." },
    { id = "b", when = { class = { "PALADIN", "WARRIOR" } }, text = "That's easy to say for one who fights where they can be seen. Not everyone has that luxury, though I'll not argue the principle.", fx = { affinity = 1 } },
    { id = "c", text = "Say it as loud as you like here, but not in the Hillsbrad foothills." },
  } },
  { id = "doubt", text = "A secret manor of master assassins is a story for children.", fx = { opinion = { ravenholdt = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Then they're doing their job. A secret manor everyone believed in wouldn't be much of a secret." },
    { id = "b", text = "Children's stories don't usually leave a body behind with the coin still in its purse. Believe what you like." },
  } },
} }

-- Faiths ------------------------------------------------------------------------------------

P:Views { topic = "holy_light", views = {
  { id = "scorn", when = { race = "Scourge" }, text = "The Light didn't save Lordaeron, and it won't save anyone else either.", fx = { opinion = { holy_light = "scorn" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "It didn't save your people, and its priests in the Scarlet Monastery are still trying to burn what's left of them. I'd not ask you to trust it again." },
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
    { id = "a", text = "They did, and called it mercy. Whatever their Light is, it looked away when your people needed it." },
    { id = "b", text = "And Thrall chose not to hate them for it. Hold your anger if you must, but don't let it decide for you." },
  } },
  { id = "respect", when = { faction = "Horde" }, text = "Human faith or not, I've seen their paladins stand firm. I respect that.", fx = { opinion = { holy_light = "respect" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "So have I. A paladin with his back to a wall is a hard thing to break, whatever you think of what he prays to.", fx = { affinity = 1 } },
    { id = "b", text = "Respect it, then, but don't stand in front of it. Their Light burns our kind just as well as it heals theirs." },
  } },
  { id = "practical", text = "Whatever it is, I've seen it close a wound, and that's enough for me.", fx = { opinion = { holy_light = "respect" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "A soldier's faith, and not a bad one. The priests would want more from you, but the wounded won't complain.", fx = { affinity = 1 } },
    { id = "b", text = "That's what most of us know of it, truth be told. Leave the arguments to the people in robes." },
  } },
} }

P:Views { topic = "elune", views = {
  { id = "devout", when = { race = "NightElf" }, text = "Elune watches over me. I feel her light every night.", fx = { opinion = { elune = "faith" }, trait = { pious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Elune-adore, {class}. Her light found your people through ten thousand years of war, and it will find you on whatever road you walk.", fx = { affinity = 1 } },
    { id = "b", text = "Hold to that. Outside the forest, the moon looks smaller, and some of your people forget." },
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
    { id = "c", text = "Eyes are reliable enough, as long as you don't need them in the dark." },
  } },
} }

P:Views { topic = "earth_mother", views = {
  { id = "devout", when = { race = "Tauren" }, text = "The Earth Mother has carried my people since before memory.", fx = { opinion = { earth_mother = "faith" }, trait = { pious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "And she will carry them long after. Walk with the Earth Mother, {class}, and she'll walk with you.", fx = { affinity = 1 } },
    { id = "b", text = "She has. Her eyes are An'she and Mu'sha, the sun and moon, and they've watched over the herds since the first dawn." },
  } },
  { id = "respect", when = { faction = "Horde" }, text = "The tauren faith runs deep. I respect the Earth Mother.", fx = { opinion = { earth_mother = "respect" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "As should we all. The tauren took us in as brothers, and their faith is part of why they did.", fx = { affinity = 1 } },
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
    { id = "a", text = "He did, and your people owe him for it. A Horde that listens to the spirits is a Horde that won't drink demon blood again.", fx = { affinity = 1 } },
    { id = "b", text = "They came back, aye, but they're watching us. One more betrayal and they may not return a second time." },
  } },
  { id = "wary", when = { faction = "Alliance" }, text = "Spirits in every stone and flame. I'd rather trust the Light.", fx = { opinion = { the_elements = "distrust" }, trait = { cautious = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Many would, here. The dwarves of Ironforge dig through stone every day, and I've never heard one apologise to it." },
    { id = "b", text = "Trust what you like, but the earth will shake whether you pray to it or not. The orcs aren't wrong about that." },
  } },
  { id = "respect", text = "Fire, earth, wind and water. Treat them well, or they'll bury you.", fx = { opinion = { the_elements = "respect" }, trait = { cautious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Aye, and plenty who didn't are buried already. Every flood and forest fire is a reminder of who's really in charge.", fx = { affinity = 1 } },
    { id = "b", text = "Wise. The old shamans say a storm is just the wind losing patience, and I've seen enough storms to believe it." },
  } },
  { id = "power", text = "Raw power, there for anyone bold enough to bend it.", fx = { opinion = { the_elements = "covet" }, trait = { proud = 1 }, align = { order = -1, honor = -1 } }, replies = {
    { id = "a", text = "That's how warlocks talk, {class}, and it's how the orcs lost the spirits the first time. The elements don't bend; they break whoever tries.", fx = { affinity = -1 } },
    { id = "b", text = "Bold, and foolish. The Twilight's Hammer think the same thing, and you've seen what they've become." },
  } },
} }

-- Human patch: what the player says back about humans, wherever someone has an opinion of them.
P:Views { topic = "humans", views = {
  { id = "judge", text = "Judge each human by their deeds, not by their kings.", fx = { opinion = { humans = "fair" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Fairly said, {class}, and harder done than said. I've met a few worth the trouble, and I'll grant you that much.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Horde" }, text = "Their deeds built the camps, so I've judged plenty. Still, a human woman died helping Thrall escape, and I'll not forget her either." },
    { id = "c", when = { race = "Human" }, text = "You would say that, being one. Still, you're right, and I've no answer to it that I'm proud of." },
  } },
  { id = "grudge", text = "Humans have earned every grudge held against them.", fx = { opinion = { humans = "distrust" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Every one, and they'd add more if they lived long enough to manage it. I'm glad somebody else says it aloud.", fx = { affinity = 1 } },
    { id = "b", text = "Some of them, maybe. Say it in Stormwind, though, and see how many friends you leave with." },
    { id = "c", when = { race = "Human" }, text = "Strange words from one of their own. Somebody back home must have done you a very bad turn." },
  } },
  { id = "brief", text = "They live short lives and waste none of them. I admire that.", fx = { opinion = { humans = "admire" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Waste none? You've not watched the House of Nobles at work. But they're quick, I'll give them that, and quick counts for something.", fx = { affinity = 1 } },
    { id = "b", text = "Admire them while you can, then. They'll be gone before you've finished deciding." },
  } },
  { id = "proud", when = { race = "Human" }, text = "We've rebuilt everything the world burned. Say what you like.", fx = { opinion = { humans = "proud" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Rebuilt it, and sent the bill to someone else. But aye, the walls are standing, and that's more than some can say." },
    { id = "b", text = "You have, and I'll not pretend otherwise. Stubbornness is the one thing nobody ever accused your people of lacking.", fx = { affinity = 1 } },
  } },
} }

-- Mage patch: what the player says back about mages and the arcane. The mage Stories in
-- threads.lua end on these stances: serve, craft or free on one side, leash or danger on the other.
P:Views { topic = "mages", views = {
  { id = "sundering", when = { race = "NightElf" }, text = "The arcane drowned Zin-Azshari. My people want no part of it.", fx = { opinion = { mages = "danger" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Ten thousand years and you still remember the water coming in. I'd want no part of it either, if I'd seen that.", fx = { affinity = 1 } },
    { id = "b", text = "Your people say that, and then a Highborne's grandchild sells you a frost ward in Darnassus. Memory is a convenient thing." },
    { id = "c", when = { class = "MAGE" }, text = "Strange words from someone wearing a mage's robes. Does the High Priestess know what you study?", fx = { affinity = -1 } },
  } },
  { id = "warlocks", when = { race = "Orc" }, text = "The warlocks taught my people where that road ends.", fx = { opinion = { mages = "danger" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "In chains and fel-green skin, aye. I'd not blame any orc for looking twice at a spellbook after that.", fx = { affinity = 1 } },
    { id = "b", text = "A mage isn't a warlock, though I'll grant you that both of them start by reaching for something they weren't born with." },
  } },
  { id = "kelthuzad", when = { race = "Scourge" }, text = "Dalaran's finest mind made the plague that killed me.", fx = { opinion = { mages = "danger" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Kel'Thuzad sat on their Council of Six, and they let him walk out the gate with his notes. You've every right to the grudge.", fx = { affinity = 1 } },
    { id = "b", text = "And a mage taught you to read, I'd wager, back when you breathed. Most of them were only clerks with candles." },
  } },
  { id = "birthright", when = { race = "Skyborne" }, text = "The arcane is my people's birthright, and we've paid for it already.", fx = { opinion = { mages = "craft" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Paid for it with exile, from what the heralds said. Then you'll know better than any of us what it costs.", fx = { affinity = 1 } },
    { id = "b", text = "Birthright, is it? That's how the night elves say the Highborne talked, just before the sea came in.", fx = { affinity = -1 } },
  } },
  { id = "craft", when = { class = "MAGE" }, text = "It's a craft like any other. What matters is what you do with it.", fx = { opinion = { mages = "craft" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Spoken like someone who's done some good with it, and I'll take you at your word. A smith's hammer kills too, if you swing it wrong.", fx = { affinity = 1 } },
    { id = "b", text = "A craft that turns a man into a sheep isn't like any craft I know, {class}. The cobbler down my street has never once done that." },
    { id = "c", when = { disposition = { max = 34 } }, text = "That's what every mage says, {class}, right up until the curtains catch." },
  } },
  { id = "serve", text = "Magic should feed the hungry and mend things, not gather dust in towers.", fx = { opinion = { mages = "serve" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "If more of them thought like you, I'd think better of them. A conjured loaf never hurt anybody who was starving.", fx = { affinity = 1 } },
    { id = "b", text = "Tell that to the bakers, whose ovens go cold every time a mage starts handing out bread for free." },
  } },
  { id = "leash", text = "Every mage needs watching. Somebody ought to hold the leash.", fx = { opinion = { mages = "leash" }, trait = { stern = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "The Kirin Tor held it for a long while, and it slipped twice that I know of, with Kel'Thuzad and with Arugal. Still, a slipped leash beats none at all.", fx = { affinity = 1 } },
    { id = "b", text = "And who watches the ones holding it? That's the question nobody in Dalaran ever wanted to answer." },
    { id = "c", when = { class = "MAGE" }, text = "That's a hard thing to hear from a mage. You must have met some of the others.", fx = { affinity = 1 } },
  } },
  { id = "free", text = "Nobody should need a council's leave to learn a spell.", fx = { opinion = { mages = "free" }, trait = { brave = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Fine words, and I'd like to believe them. Then again, Kel'Thuzad didn't ask anyone's leave either.", fx = { affinity = -1 } },
    { id = "b", text = "There's something in that. The Kirin Tor decided who may learn for so long that they forgot to ask why." },
  } },
  { id = "danger", text = "Every disaster I've ever heard of started with a mage.", fx = { opinion = { mages = "danger" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "The Sundering, the Dark Portal, the plague and the worgen, and that's only the ones they tell you about. I'd not argue with you.", fx = { affinity = 1 } },
    { id = "b", text = "And a fair few were stopped by one too, so it cuts both ways. Ask anyone who stood at Hyjal with Lady Jaina." },
  } },
} }

-- Druid patch: what the player says back about druids and shapeshifters. The druid Stories in
-- threads.lua end on these stances: balance, kin, admire or guard on one side, savage or wary
-- on the other.
P:Views { topic = "druids", views = {
  { id = "kin", when = { race = "NightElf" }, text = "The druids are our fathers and brothers. They woke to save us all.", fx = { opinion = { druids = "kin" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "Woke from a very long sleep, aye, and just in time for Hyjal. I'll grant them that much and gladly.", fx = { affinity = 1 } },
    { id = "b", text = "And slept through a good few centuries before that, while your Sentinels kept the watch. Your sisters must have had a word or two to say about it." },
    { id = "c", when = { zone = { "Darnassus", "Teldrassil" } }, text = "Elune-adore. Every family in Darnassus has a son in the Dream or a daughter on the walls, and we owe them both.", fx = { affinity = 1 } },
  } },
  { id = "earth", when = { race = "Tauren" }, text = "Hamuul brought the old ways home. Our druids are the Earth Mother's hands.", fx = { opinion = { druids = "kin" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "So the tauren say, and I've seen one of your druids bring a dying kodo to its feet, so I'll not argue.", fx = { affinity = 1 } },
    { id = "b", text = "The night elves taught them, mind. Ask in Moonglade who the Earth Mother's hands belong to, and you'll get a long answer." },
  } },
  { id = "winds", when = { race = "Skyborne" }, text = "Our druids hear the winds first. The Circle's moon is a cousin to them.", fx = { opinion = { druids = "kin" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "A cousin, is it? Then I hope the family gets along better than most families I know.", fx = { affinity = 1 } },
    { id = "b", text = "The Circle might put it differently, though they're too polite to say so in front of you." },
  } },
  { id = "balance", when = { class = "DRUID" }, text = "We keep the balance, because someone has to and nobody else will.", fx = { opinion = { druids = "balance" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Someone has to, true enough, and I'd sooner it were you than the goblins. Keep at it, {class}.", fx = { affinity = 1 } },
    { id = "b", text = "Balance, you call it. The loggers I know call it standing in the way of an honest day's work." },
    { id = "c", when = { disposition = { max = 34 } }, text = "That's what every druid says, right before he turns into something with teeth." },
  } },
  { id = "healers", text = "A druid kept me breathing once. I'll hear nothing said against them.", fx = { opinion = { druids = "admire" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "They're good at that, I'll grant. A priest prays over you, but a druid just gets on with it.", fx = { affinity = 1 } },
    { id = "b", text = "Kept you breathing, and then went off to sleep under a tree for a week. They're strange folk, even the good ones." },
  } },
  { id = "guard", text = "The druids are right to guard the wild, even against kings.", fx = { opinion = { druids = "guard" }, trait = { brave = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Somebody ought to, I suppose. The kings would cut down every tree on Azeroth if there were a tax on stumps.", fx = { affinity = 1 } },
    { id = "b", text = "Even against kings? That's a dangerous thing to say aloud, {class}, and the druids aren't the ones who'll pay for it." },
  } },
  { id = "progress", text = "Forests can't stand in the way of farms and cities forever.", fx = { opinion = { druids = "wary" }, trait = { practical = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Aye, people have to eat, and you can't eat a grove. The druids would do well to remember who feeds them.", fx = { affinity = 1 } },
    { id = "b", text = "The forests were here first, and they'll be here after the farms are dust. The druids are only taking the long view." },
    { id = "c", when = { class = "DRUID" }, text = "That's a hard thing to hear from a druid. Does your Circle know you think that?", fx = { affinity = -1 } },
  } },
  { id = "savage", text = "Folk who turn into beasts forget they were ever folk.", fx = { opinion = { druids = "savage" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "I've thought the same. You look into a bear's eyes and wonder who's in charge in there, the druid or the bear.", fx = { affinity = 1 } },
    { id = "b", text = "Some of them, maybe, like those mad druids in the Barrens caves. Most I've met remember their manners better than I do." },
  } },
  { id = "fang", when = { faction = "Horde" }, text = "The Druids of the Fang were druids too. I remember that.", fx = { opinion = { druids = "wary" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Nobody at the Crossroads has forgotten it. They went into the earth to heal the land and came out as monsters.", fx = { affinity = 1 } },
    { id = "b", text = "And Hamuul's druids are druids too, and they've done the Barrens nothing but good. One cave doesn't damn the lot." },
  } },
  { id = "cenarius", when = { race = "Orc" }, text = "Grom slew their forest god. I'd not expect the druids to love us.", fx = { opinion = { druids = "wary" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Nor would I, and I'd watch my back in Ashenvale. The Circle forgives, they say, but the trees remember.", fx = { affinity = 1 } },
    { id = "b", text = "And yet the tauren druids heal orc wounds in the Barrens every day. Perhaps they're better at forgiving than you think." },
  } },
  { id = "blight", when = { race = "Scourge" }, text = "Nothing grows where my people walk. The druids look at us like blight.", fx = { opinion = { druids = "wary" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "They do, and they're not shy about it, but I'd not take it personally, since they look at goblins the same way.", fx = { affinity = 1 } },
    { id = "b", text = "Perhaps they're only waiting to see whether you'll plant something. You never know with druids." },
  } },
  { id = "sleepers", text = "Slept for centuries while the world burned? Some guardians.", fx = { opinion = { druids = "wary" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "That's what I've always said. The elves call it the Dream, and I call it a very long lie-in.", fx = { affinity = 1 } },
    { id = "b", text = "They woke when it mattered, and they stood at Hyjal. I'd not sneer at anyone who did that." },
  } },
} }

-- The Circle seen from the outside, for anyone who has heard of it (adds to views_2.lua).
P:Views { topic = "cenarion_circle", views = {
  { id = "above", when = { class = "DRUID" }, text = "The Circle stands above banners, and that's the only reason it still works.", fx = { align = { order = -1 }, opinion = { cenarion_circle = "admire" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "So the Keeper says, and Nighthaven's the proof of it. I hope the banners keep letting you.", fx = { affinity = 1 } },
    { id = "b", text = "Above banners, until the war comes to their own glade. Then we'll see who stands where." },
  } },
  { id = "neutral", text = "Somebody has to tend the wild without asking whose flag flies over it.", fx = { opinion = { cenarion_circle = "admire" }, trait = { kind = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "That's the Circle's whole creed, and it's a hard one to keep with the Horde and the Alliance both at the door.", fx = { affinity = 1 } },
    { id = "b", when = { race = { "NightElf", "Tauren" } }, text = "Our people taught each other that much at Moonglade, long before either banner meant anything there.", fx = { affinity = 1 } },
    { id = "c", when = { disposition = { max = 34 } }, text = "Fine words, {class}. I'd like to hear them again the day a druid patches up the one who stabbed you." },
  } },
  { id = "shelter", text = "A Circle that shelters both sides is sheltering my enemies.", fx = { align = { order = 1 }, opinion = { cenarion_circle = "distrust" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "I've heard soldiers say the same, and I can't call them wrong. A druid who heals your foe isn't your friend.", fx = { affinity = 1 } },
    { id = "b", text = "And yours too, if you ever need it. The Circle doesn't ask a wounded man which banner he bled under." },
  } },
} }

-- Writing pass (World): what the player says back about the peoples the kaldorei argue over,
-- and a few more stances on the great names of the world. Ids here carry a w2_ prefix so they
-- never collide with the views above.

P:Views { topic = "kaldorei", views = {
  { id = "w2_wise", text = "Ten thousand years of memory. The rest of us should listen more.", fx = { opinion = { kaldorei = "admire" }, trait = { kind = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "They'd agree with you, which is half the trouble with them. Still, they did fight the Legion before any of our grandfathers' grandfathers were born.", fx = { affinity = 1 } },
    { id = "b", when = { race = "NightElf" }, text = "Kindly said, {class}, though you'll know better than I do that memory is a heavy thing to carry, and the Sentinels carry most of it.", fx = { affinity = 1 } },
    { id = "c", when = { faction = "Horde" }, text = "Listen to them? They put arrows through Warsong peons for cutting a tree, and that's all the listening Ashenvale ever gets." },
  } },
  { id = "w2_aloof", text = "They hid in their forests while the rest of the world bled.", fx = { opinion = { kaldorei = "distrust" }, trait = { stern = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "They'd say the world never knocked on their door, and they're not wrong, but it's a cold answer for a refugee from Lordaeron to hear." },
    { id = "b", when = { race = "NightElf" }, text = "Strange words from a kaldorei. Does the High Priestess know you've grown so tired of the forest?", fx = { affinity = -1 } },
    { id = "c", when = { faction = "Alliance" }, text = "They came out for Hyjal, though, and they've come to Stormwind's table since. Late is not the same as never.", fx = { affinity = -1 } },
  } },
  { id = "w2_haughty", text = "Polite as anything, and they still look at me like a child.", fx = { opinion = { kaldorei = "haughty" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "To them you are a child, {class}, and so is everyone you've ever met, and so is the city you were born in. Best not to take it personally." },
    { id = "b", when = { race = { "Dwarf", "Gnome" } }, text = "Ha! Imagine how they look at a dwarf with an axe in one hand and a pint in the other. I've seen a Sentinel's face do it, and it's a sight." },
  } },
  { id = "w2_kin", when = { race = "NightElf" }, text = "My people remember the Sundering. That memory keeps the whole world safe.", fx = { opinion = { kaldorei = "proud" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "I hope it does, though memory never stopped anyone digging where they shouldn't. The Highborne remembered too, and look where it got them." },
    { id = "b", text = "Then I'm glad somebody's remembering for the rest of us, because we're short-lived and forgetful, and we'd do it all again by the next harvest.", fx = { affinity = 1 } },
  } },
} }

P:Views { topic = "tauren", views = {
  { id = "w2_gentle", text = "The tauren are the kindest folk I've met on any road.", fx = { opinion = { tauren = "admire" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Kind until you threaten the herd, and then you learn what a charging bull of a thousand pounds does to a shield wall. But aye, kind first.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Tauren" }, text = "You honour your people by saying so, and you honour them more by staying that way out here.", fx = { affinity = 1 } },
    { id = "c", when = { faction = "Alliance" }, text = "Kind enough, but they march under the Horde's banner, and the Barrens are full of Alliance graves dug by tauren hands." },
  } },
  { id = "w2_horde_pawn", text = "Cairne sold his people's freedom to an orc for a strip of grass.", fx = { opinion = { tauren = "pity" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "The centaur were killing them by the tribe until Thrall's warriors came, so I'd call it a fair trade, and so would any tauren you asked." },
    { id = "b", when = { race = "Tauren" }, text = "Say that again at the foot of the bluff, {class}, and you'll hear what the Earth Mother's children think of it.", fx = { affinity = -2 } },
    { id = "c", when = { faction = "Alliance" }, text = "You're not the first to say so in Theramore, though it's a crueller way of putting it than most." },
  } },
  { id = "w2_slow", text = "They take a week to say what an orc says in a breath.", fx = { opinion = { tauren = "slow" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "And they're right twice as often, so the week is cheap at the price. I'd sooner wait on a tauren than mend what an orc broke in a hurry." },
    { id = "b", when = { race = "Orc" }, text = "Ha! Say it to Cairne and he'll take three days to answer, and the answer will make you feel a fool." },
  } },
  { id = "w2_herd", when = { race = "Tauren" }, text = "We are a herd. Each tribe walks beside the others, or none survive.", fx = { opinion = { tauren = "proud" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Each tribe but the Grimtotem, from what the canyon roads say. Still, it's a good creed, and better kept than most.", fx = { affinity = 1 } },
    { id = "b", text = "That's a thing the rest of the Horde could stand to learn from you, and some of us are trying." },
  } },
} }

P:Views { topic = "alliance", views = {
  { id = "w2_together", text = "Alone, every kingdom here would have fallen. Together they stand.", fx = { opinion = { alliance = "needed" }, trait = { practical = 1 }, align = { order = 1 } }, replies = {
    { id = "a", when = { faction = "Alliance" }, text = "That's what Lothar said at the founding, and it was true then. It's still true, whatever Gilneas and Stromgarde think of the bill.", fx = { affinity = 1 } },
    { id = "b", when = { race = "NightElf" }, text = "Some of my people would say we stood alone for ten thousand years and did well enough. I'm not sure they're right anymore." },
    { id = "c", when = { faction = "Horde" }, text = "Stand together, aye, against us mostly. Don't expect me to cheer it." },
  } },
  { id = "w2_broken", text = "Gilneas walled itself off and Stromgarde walked out. What Alliance is left?", fx = { opinion = { alliance = "broken" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Enough of one to send rifles from Ironforge and arrows from Darnassus, which is more than the old one managed in its last years.", fx = { affinity = -1 } },
    { id = "b", when = { faction = "Horde" }, text = "Ha! Say it louder, so the scouts at Hammerfall can hear you. They've been saying it for a year." },
    { id = "c", when = { race = "Human" }, text = "It's a hard thing to hear from one of Stormwind's own, but I can't tell you you're wrong." },
  } },
  { id = "w2_newcomers", when = { race = "NightElf" }, text = "We joined an alliance of strangers. I still wonder why.", fx = { opinion = { alliance = "doubt" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Because the Horde was cutting down your trees, I'd imagine, and the humans were the only ones who knew how to fight orcs. It's not a love match, but it holds." },
    { id = "b", text = "Raene Wolfrunner wonders the same thing, from what I hear, and she says it out loud in Astranaar. You're in decent company." },
  } },
} }

P:Views { topic = "quel_dorei", views = {
  { id = "w2_cousins", text = "They're kin to the night elves, whatever old quarrels divide them.", fx = { opinion = { quel_dorei = "kin" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Kin who left in disgrace, and kin who never asked to be forgiven. That's a hard sort of family, {class}, but you're right that it's family." },
    { id = "b", when = { race = "NightElf" }, text = "You'd speak for the Highborne's children? The Sisterhood would call that generous, and the Sentinels would call it foolish.", fx = { affinity = -1 } },
  } },
  { id = "w2_exiles", text = "Their ancestors nearly ended the world. I'd not trust their children.", fx = { opinion = { quel_dorei = "distrust" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", when = { race = "NightElf" }, text = "You speak as the elders do, and they have reasons older than my grandmother's grandmother. Still, the children didn't drink from the Well.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Human" }, text = "They stood with Lordaeron in the Second War, and they died with it in the Third. I'd not call that untrustworthy.", fx = { affinity = -1 } },
    { id = "c", text = "That's an old grudge to carry for people who weren't born when it happened. Then again, elves aren't born very often." },
  } },
  { id = "w2_quelthalas", text = "Quel'Thalas burned when Arthas came. I pity whoever survived it.", fx = { opinion = { quel_dorei = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "So do I. They lost their Sunwell and their king in one season, and we hear next to nothing from beyond the Thalassian Pass these days." },
    { id = "b", when = { faction = "Horde" }, text = "Pity them if you like, but remember the Ranger-General was one of theirs, and look what she rules now." },
  } },
} }

P:Views { topic = "shendralar", views = {
  { id = "w2_scholars", text = "Scholars who outlived their city deserve to be heard, not hunted.", fx = { opinion = { shendralar = "respect" }, trait = { curious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Heard, aye, but heard carefully. What they kept alive in Eldre'Thalas they kept alive with something that's still screaming in the dark under it." },
    { id = "b", when = { class = "MAGE" }, text = "Spoken like a mage. Mind the libraries of Dire Maul don't read you while you're reading them, {class}." },
  } },
  { id = "w2_parasites", text = "They fed a demon to keep their magic. They earned their ruin.", fx = { opinion = { shendralar = "condemn" }, trait = { stern = 1 }, align = { light = -1 } }, replies = {
    { id = "a", when = { race = "NightElf" }, text = "Spoken like a Sentinel. Shandris would agree with every word, and Scholar Runethorn would ask you to read one book before you judge.", fx = { affinity = 1 } },
    { id = "b", text = "Hard words, {class}, but I've heard what Immol'thar did to Feralas, and I'm not sure I can argue with you." },
  } },
  { id = "w2_curious", text = "What do they know that the rest of the world forgot?", fx = { opinion = { shendralar = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "A great deal more than they'll tell, and a great deal they'd rather nobody remembered. Ask at Feathermoon and see how far you get." },
    { id = "b", when = { class = { "MAGE", "WARLOCK", "PRIEST" } }, text = "More than any library in Dalaran, I'd wager, and every page of it bought with blood. That's what makes the question dangerous." },
  } },
} }

P:Views { topic = "thrall", views = {
  { id = "w2_freedom", when = { faction = "Horde" }, text = "He broke the camps open with his own hands. I'll follow him anywhere.", fx = { opinion = { thrall = "loyal" }, trait = { brave = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "So would every orc in Durotar, and half the trolls besides. Just make sure it's him you follow, and not someone shouting his name.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Orc" }, text = "Lok'tar, {class}. Some of us still remember the smell of those pens, and we'll never forget who opened them.", fx = { affinity = 1 } },
    { id = "c", when = { race = "Scourge" }, text = "Anywhere? The Forsaken follow the Dark Lady first, I'd thought. Mind you don't have to choose one day." },
  } },
  { id = "w2_soft", when = { faction = "Horde" }, text = "Making peace with humans while the Alliance arms itself is weakness.", fx = { opinion = { thrall = "soft" }, trait = { stern = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "That's what the young bloods mutter in the Valley of Honor. The Warchief has buried more friends than you've met, so think before you call him weak.", fx = { affinity = -1 } },
    { id = "b", when = { race = "Orc" }, text = "There are grunts in Orgrimmar who'd buy you a drink for saying that, and the Warchief's guards who'd break your jaw for it. Choose your tavern carefully." },
  } },
  { id = "w2_enemy", when = { faction = "Alliance" }, text = "An orc who talks of peace is still an orc with an army.", fx = { opinion = { thrall = "distrust" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "That's what Admiral Proudmoore thought too, and he died at Theramore for it. Still, I keep my sword sharp, and so should you." },
    { id = "b", text = "Fair enough. But he hasn't marched on Stormwind, and the old Horde would have by now." },
  } },
} }

P:Views { topic = "sylvanas", views = {
  { id = "w2_queen", when = { race = "Scourge" }, text = "She tore us out of the Lich King's grip. My loyalty is hers.", fx = { opinion = { sylvanas = "loyal" }, trait = { proud = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Spoken like one of her own, and I'd expect nothing else. The Dark Lady keeps a long memory for the faithful, so I'm told.", fx = { affinity = 1 } },
    { id = "b", text = "And what did she ask for in return? I've never yet met a queen who freed anyone for nothing." },
  } },
  { id = "w2_own_mind", when = { race = "Scourge" }, text = "I broke free of one master. I'll not kneel blindly to another.", fx = { opinion = { sylvanas = "wary" }, trait = { stern = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Keep saying that, {class}, but say it quietly, because the Deathstalkers have very good ears and very few jokes.", fx = { affinity = 1 } },
    { id = "b", text = "That's a dangerous thought to carry through the Undercity. I hope you've a better place to keep it than your mouth." },
  } },
  { id = "w2_ranger", text = "She was a ranger of Quel'Thalas once. I wonder what's left of her.", fx = { opinion = { sylvanas = "pity" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Enough to hate Arthas with everything she has, and that seems to be most of what's left. I'd not ask her about the rest." },
    { id = "b", when = { faction = "Alliance" }, text = "Something cold and clever, by every account out of Southshore. Whatever she was, it died on the road to the Sunwell." },
  } },
} }

P:Views { topic = "gnomeregan", views = {
  { id = "w2_retake", when = { race = "Gnome" }, text = "We'll take it back, gear by gear. Gnomeregan isn't lost, only borrowed.", fx = { opinion = { gnomeregan = "retake" }, trait = { brave = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "That's the spirit Mekkatorque keeps preaching in Tinker Town, and I'd like to see it done. Just mind the radiation while you're borrowing it back.", fx = { affinity = 1 } },
    { id = "b", text = "Borrowed by Thermaplugg and a few thousand troggs, mind. I'd bring more than a wrench to that negotiation." },
  } },
  { id = "w2_let_go", when = { race = "Gnome" }, text = "The city's poisoned. We should build anew instead of mourning old halls.", fx = { opinion = { gnomeregan = "move_on" }, trait = { practical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Practical, and I suspect half of Tinker Town agrees with you in private. Don't say it near the High Tinker, though; it's his city, and his heart's still in it." },
    { id = "b", text = "Easier said than built, {class}. A people needs somewhere to come home to, even if it's a radioactive hole." },
  } },
} }

P:Views { topic = "internment", views = {
  { id = "w2_never", when = { race = "Orc" }, text = "I'll never wear a human collar again. I'd die on the field first.", fx = { opinion = { internment = "defiant" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Spoken like one who remembers the pens, and I'd not expect any orc to say otherwise. Thrall made sure none of us ever have to.", fx = { affinity = 1 } },
    { id = "b", text = "Good, though the Warchief would rather you lived free than died proud. Remember that before you charge alone." },
  } },
  { id = "w2_mercy", when = { faction = "Alliance" }, text = "The camps were a mercy. The alternative was killing every orc we caught.", fx = { opinion = { internment = "necessary" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "That's what the old guards at Durnholde said too, and some of them believed it. The orcs who sat in the mud for ten years might call it something else." },
    { id = "b", when = { race = "Human" }, text = "Maybe so, but a mercy that costs half the Alliance its treasury and ends in a jailbreak isn't one I'd boast of." },
  } },
} }
