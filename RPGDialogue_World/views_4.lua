-- Speaking your mind (0.82.0): views on Azshara's coast, Silithus, and the Plague lands and leaders (Forsaken, Thrall, Sylvanas, Arthas, Jaina and the rest). Format: views.lua.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- ===================================================================== Azshara

P:Views { topic = "eldarath", views = {
  { id = "beauty", text = "Even drowned and broken, those ruins are beautiful. The Highborne knew how to build.", fx = { opinion = { eldarath = "admire" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "They did, and they built it on the Well's power, which is why so much of it is under the sea now. Beauty was never what they lacked, {class}.", fx = { affinity = 1 } },
    { id = "b", when = { race = "NightElf" }, text = "Beautiful, yes, and every stone of it remembers Azshara's pride. Your people look at Eldarath and see a warning, not an ornament." },
    { id = "c", text = "Admire it from the cliff, then, because the naga swimming through it don't care how pretty the arches are." },
  } },
  { id = "warning", text = "A whole city drowned for its pride. Let the sea keep it.", fx = { opinion = { eldarath = "wrong" }, trait = { pious = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Wise words, and older ones than you know. Whatever magic sleeps in those ruins put the sea there in the first place.", fx = { affinity = 1 } },
    { id = "b", text = "The sea's not keeping it very well, though, because the Spitelash and every treasure-hunter on the coast are picking it over." },
  } },
  { id = "loot", text = "Highborne ruins mean Highborne treasure, and the naga can't spend it all.", fx = { opinion = { eldarath = "profit" }, trait = { greedy = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Ha! You and every scavenger from Ratchet to Quel'Thalas, and most of them are still down there, {class}.", fx = { affinity = -1 } },
    { id = "b", text = "Magic that drowned a city doesn't come up in a sack quietly. Whatever you dig out of Eldarath, be sure you know what it does first." },
  } },
} }

P:Views { topic = "spitelash", views = {
  { id = "fight", text = "The Spitelash need driving back into the sea, and I'll start the driving.", fx = { opinion = { spitelash = "hate" }, trait = { brave = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Then bring plenty of friends, because they come out of the surf in dozens and their sirens fight dirty.", fx = { affinity = 1 } },
    { id = "b", text = "Good. Every scale you take off the beach is a night somebody on this coast sleeps easier." },
  } },
  { id = "pity", text = "They were elves once. It's a cruel fate, whatever they've done since.", fx = { opinion = { spitelash = "pity" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "Elves who followed Azshara into the deep and came back as that, aye. Pity them by all means, but keep your blade out while you do it." },
    { id = "b", when = { race = "NightElf" }, text = "They were Highborne, the queen's own, and they chose her over your people. Pity runs thin for them in Darnassus.", fx = { affinity = -1 } },
  } },
  { id = "watch", text = "Naga don't raid without a reason. Something down there is directing them.", fx = { opinion = { spitelash = "distrust" }, trait = { cautious = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "You're not the first to say it. They don't take gold, they take relics, and that's an errand, not a raid.", fx = { affinity = 1 } },
    { id = "b", text = "Maybe so, but whatever's giving the orders is a long way below the waves, and the naga are right here on the beach." },
  } },
} }

P:Views { topic = "satyrs", views = {
  { id = "purge", text = "Satyrs are demon-spawn, and the only good one is a dead one.", fx = { opinion = { satyrs = "hate" }, trait = { stern = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "You'll get no argument here. The Haldarr, the Legashi, every satyr tribe sold itself to the Legion and kept the horns to prove it.", fx = { affinity = 1 } },
    { id = "b", when = { race = "NightElf" }, text = "Spoken like a Sentinel. Every satyr was a kaldorei before he bargained his soul away, and that is why your people cannot forgive them.", fx = { affinity = 1 } },
  } },
  { id = "pity", text = "They were elves who traded everything for power. That's sad more than anything.", fx = { opinion = { satyrs = "pity" }, trait = { kind = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Sad, maybe, but a satyr's claws don't know you feel sorry for them. Save the tears for after the camp's burned." },
    { id = "b", text = "There's something to that, I'll grant. Nobody wakes up wanting hooves; they want one more spell and pay for it all at once." },
  } },
  { id = "study", text = "If they still hold demon secrets, someone should take those secrets from them.", fx = { opinion = { satyrs = "profit" }, trait = { curious = 1 }, align = { light = -2 } }, replies = {
    { id = "a", text = "That's exactly the thought that made the first satyrs, {class}. I'd keep it to myself if I were you.", fx = { affinity = -1 } },
    { id = "b", when = { class = "WARLOCK" }, text = "Of course a warlock would say that. Just make sure it's you holding the leash when you're done." },
  } },
} }

P:Views { topic = "xylem", views = {
  { id = "admire", text = "A mage who stands alone on Azshara's coast has my respect.", fx = { opinion = { xylem = "respect" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "He'll like hearing that, though he'd say respect is the least he's owed. He's not wrong about how dangerous that tower is.", fx = { affinity = 1 } },
    { id = "b", text = "Alone with a dozen servants and a teleport stone, aye. Still, it's more nerve than most archmages show." },
  } },
  { id = "arrogant", text = "Brilliant, maybe, but he treats everyone as an errand-runner, me included.", fx = { opinion = { xylem = "distrust" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Everyone notices that inside a minute. The trick is to get paid before he remembers he's above thanking you." },
    { id = "b", text = "He does, and he'll go on doing it. Archmages are like that; it's being right half the time that ruins them." },
  } },
  { id = "danger", text = "A man who meddles that close to Highborne magic will wake something.", fx = { opinion = { xylem = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "That's my worry too. Azshara's coast has drowned better wizards than him, and they all thought they were careful.", fx = { affinity = 1 } },
    { id = "b", text = "Maybe, but he's the one taking the risk, and he's lasted out there longer than anyone expected." },
  } },
} }

P:Views { topic = "morphaz", views = {
  { id = "kill", text = "A drake that swallows apprentices deserves a blade through the belly.", fx = { opinion = { morphaz = "hate" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Ha! Find him first. He sleeps in the drowned temple in the Swamp of Sorrows, among his own green kin.", fx = { affinity = 1 } },
    { id = "b", text = "Plenty have said that, and Xylem would pay well to hear it done. Mind his breath, though; it isn't fire, but it's worse in a closed room." },
  } },
  { id = "shard", text = "Xylem misses the shard more than the boy, I'd guess.", fx = { opinion = { morphaz = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Cruel, {class}, and maybe not wrong. He talks about both, but I've noticed which one comes first." },
    { id = "b", text = "That's a hard thing to say of a man who lost his student. Archmages grieve badly, but they still grieve.", fx = { affinity = -1 } },
  } },
  { id = "wary", text = "A dragon is a dragon. I'll not go poking one for a wizard's grudge.", fx = { opinion = { morphaz = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Sensible. Grudges get people eaten, and the drake isn't the one who'll feel sorry afterward." },
    { id = "b", text = "Fair, though it isn't only Xylem's grudge. Something's wrong with those green dragons lately, and nobody can say what." },
  } },
} }

P:Views { topic = "rimtori", views = {
  { id = "revenge", when = { faction = "Horde" }, text = "Her people spilled Horde blood. They'll pay for it in kind.", fx = { opinion = { rimtori = "hate" }, trait = { stern = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "That's the right answer at Valormok. Valormok's warriors died on that shore, and the elves never even buried them.", fx = { affinity = 1 } },
    { id = "b", text = "Then do it cleanly and come back alive. Blood for blood is honest, but nobody sings for a fool who walks in alone." },
  } },
  { id = "elves", text = "High elves this far from Quel'Thalas aren't here for the scenery.", fx = { opinion = { rimtori = "distrust" }, trait = { skeptical = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "No, they're here for arcane dust and anything else the Highborne left lying about. They'd sell their mothers for a crystal.", fx = { affinity = 1 } },
    { id = "b", text = "Exactly so. Somebody's paying for that expedition, and I'd like to know who sent them before I learn the hard way." },
  } },
  { id = "understand", text = "They're hungry for magic. I can't entirely blame them for that.", fx = { opinion = { rimtori = "pity" }, trait = { honest = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Hungry, aye, and the hungry kill for crumbs. Understand them all you like, but they killed for it all the same.", fx = { affinity = -1 } },
    { id = "b", text = "Neither can I, entirely, but there's a line between hunger and murder, and Rimtori's lot stepped over it." },
  } },
} }

P:Views { topic = "waterlords", views = {
  { id = "ally", text = "Anything that hates Ragnaros that much is a friend worth having.", fx = { opinion = { waterlords = "trust" }, trait = { practical = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Friend's a strong word for a living tide, but the enemy of the Firelord is useful company, and Duke Hydraxis knows it.", fx = { affinity = 1 } },
    { id = "b", text = "They'll use you like a bucket against a fire, mind. The water doesn't love you; it just hates the flame more." },
  } },
  { id = "cold", text = "They watched a ship go down and did nothing. I don't trust them.", fx = { opinion = { waterlords = "distrust" }, trait = { kind = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "No more do I. Elementals don't count lives the way we do, and a drowned sailor is just more water to them." },
    { id = "b", text = "Fair, though you might as well be angry at the rain. They're not people, whatever Hydraxis calls himself." },
  } },
  { id = "awe", text = "A duke made of seawater. The world's stranger than the books admit.", fx = { opinion = { waterlords = "admire" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Much stranger, and older too. The elementals were here before any of us, and they'll be here after." },
    { id = "b", text = "Stand on his island long enough and it stops feeling strange and starts feeling dangerous. Keep your boots dry, {class}." },
  } },
} }

P:Views { topic = "loramus", views = {
  { id = "respect", text = "A man who's spent his life hunting demons deserves some respect.", fx = { opinion = { loramus = "respect" }, trait = { kind = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Some, aye, and more than the Sentinels give him. Whatever he did to himself, he did it to fight the Legion." },
    { id = "b", when = { race = "NightElf" }, text = "Perhaps. The demon hunters gave their eyes and their peace to that war, and your people still do not know how to thank them, or whether they should." },
  } },
  { id = "tainted", text = "Anyone who keeps demons on a leash is half a demon himself.", fx = { opinion = { loramus = "distrust" }, trait = { pious = 1 }, align = { order = -1, light = 1 } }, replies = {
    { id = "a", text = "That's what most folk say, and they keep clear of his island. I can't say they're wrong to.", fx = { affinity = 1 } },
    { id = "b", text = "Maybe more than half, these days. He'd tell you it's the price of the work, and then he'd change the subject." },
  } },
  { id = "learn", text = "I'd like to hear what he knows. The Legion isn't finished with us.", fx = { opinion = { loramus = "trust" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "No, it isn't, and he'd be the one to tell you so. Just don't let him send you after something you can't hold." },
    { id = "b", text = "He'll talk your ear off about Azshara's old bargains if you let him. Bring something to sit on." },
  } },
} }

P:Views { topic = "arkkoroc", views = {
  { id = "useful", text = "God or not, if he fights the naga, I'll work with him.", fx = { opinion = { arkkoroc = "trust" }, trait = { practical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "That's the sensible view. He's big, he's old and he hates the Spitelash, which is three better reasons than most allies have.", fx = { affinity = 1 } },
    { id = "b", text = "Work with him by all means, but keep track of what he asks for. Giants that call themselves gods always present a bill." },
  } },
  { id = "mock", text = "A sea giant calling himself a god. I've met humbler kings.", fx = { opinion = { arkkoroc = "doubt" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! So have I, and I didn't like them either. Don't say it to his face, though; he's tall enough to take offense from a long way off." },
    { id = "b", text = "Humbler, maybe, but not bigger. When you're that size, folk tend to let the title slide." },
  } },
  { id = "false", text = "Bowing to a false god is a fool's bargain, whatever he offers.", fx = { opinion = { arkkoroc = "distrust" }, trait = { pious = 1 }, align = { honor = 1, light = 1 } }, replies = {
    { id = "a", when = { faction = "Alliance" }, text = "The Light would say the same, {class}, and I'd sooner trust it than a temple full of seawater.", fx = { affinity = 1 } },
    { id = "b", text = "Nobody's asking you to bow, only to fetch. Still, I like a {class} who knows where the line is." },
  } },
} }

P:Views { topic = "horizon_scout", views = {
  { id = "sorry", text = "Losing a ship and half a crew on that coast. I'm sorry for them.", fx = { opinion = { horizon_scout = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "So am I. Beltis, their captain, keeps the survivors together, but you can see it costing her, every night.", fx = { affinity = 1 } },
    { id = "b", text = "Kindly said. They don't hear much kindness out in those ruins, only the surf and the naga." },
  } },
  { id = "salvage", text = "A wreck that fresh still has cargo in it. Somebody should go and get it.", fx = { opinion = { horizon_scout = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Somebody will, and it'll likely be the naga. If you beat them to it, at least ask the captain what was hers first.", fx = { affinity = -1 } },
    { id = "b", text = "Spoken like a goblin, {class}. Mind you, a goblin would already be halfway there with a rope and a price list." },
  } },
  { id = "fool", text = "Anyone who sails Azshara's coast at night is asking to drown.", fx = { opinion = { horizon_scout = "doubt" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Maybe so, but the charts didn't say naga, and nobody ever expects the water to climb aboard." },
    { id = "b", text = "That's a hard thing to say about folk who already paid for it. Hindsight's cheap on dry land.", fx = { affinity = -1 } },
  } },
} }

-- ===================================================================== Silithus

P:Views { topic = "ahn_qiraj", views = {
  { id = "hold", text = "The Scarab Wall must hold. Whatever's behind it stays there.", fx = { opinion = { ahn_qiraj = "fear" }, trait = { stern = 1 }, align = { order = 2 } }, replies = {
    { id = "a", text = "Fandral sealed it a thousand years ago, and the elves have watched it every day since. That wall is the only reason Kalimdor isn't crawling.", fx = { affinity = 1 } },
    { id = "b", text = "It will hold, until it doesn't. The hives grow louder every year, and the Cenarion Circle knows it." },
  } },
  { id = "break", text = "Sooner or later someone has to go in and finish what's inside.", fx = { opinion = { ahn_qiraj = "respect" }, trait = { brave = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Brave talk, and maybe true. It'd take both factions and every army they've got, which is why nobody's said it out loud yet." },
    { id = "b", when = { race = "NightElf" }, text = "Your people tried that once, in the War of the Shifting Sands. They won by walling it up, and even that nearly broke them.", fx = { affinity = -1 } },
  } },
  { id = "relics", text = "A city that old must be full of things worth finding.", fx = { opinion = { ahn_qiraj = "profit" }, trait = { curious = 1 } }, replies = {
    { id = "a", when = { race = "Dwarf" }, text = "Aye, that's the Explorers' League in me talking too. Brann would sell his boots for a week inside those walls.", fx = { affinity = 1 } },
    { id = "b", text = "Full of things, aye, and most of them have more legs than you'd like. Ask the dig teams who came back from the hives." },
  } },
} }

P:Views { topic = "silithid_hives", views = {
  { id = "burn", text = "Every hive in Silithus should be burned down to the bedrock.", fx = { opinion = { silithid_hives = "hate" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Bring a lot of oil, {class}. Those tunnels go deeper than anyone's mapped, and the bugs breed faster than we burn." },
    { id = "b", text = "That's the sentiment at Cenarion Hold, more or less. Some of the druids would rather study them first, but they're losing the argument.", fx = { affinity = 1 } },
  } },
  { id = "study", text = "Somebody's guiding those bugs. Learn how the hives work and you'll know who.", fx = { opinion = { silithid_hives = "doubt" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Larksbane at Cenarion Hold says the same, and she's been in Hive'Ashi with a notebook, which is either very brave or very silly.", fx = { affinity = 1 } },
    { id = "b", text = "Maybe, but you'll learn it from inside a tunnel, and the tunnel will be learning about you as well." },
  } },
  { id = "fear", text = "I've seen those tunnels. I'll not be going back in.", fx = { opinion = { silithid_hives = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "No shame in that. More than one dig team went down there in good spirits and didn't come up at all." },
    { id = "b", text = "Fair enough, though someone will have to. The hives don't stop digging because we stop going." },
  } },
} }

P:Views { topic = "abyssal_council", views = {
  { id = "hunt", text = "Elementals who answer to the Twilight's Hammer need cutting down, title or no.", fx = { opinion = { abyssal_council = "hate" }, trait = { brave = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "That's the work, and Aurel at Cenarion Hold has the wind stones to call them out. Just be ready, because they don't come quietly.", fx = { affinity = 1 } },
    { id = "b", text = "Good. Every duke and lord you put down is one less voice whispering to the cultists in those camps." },
  } },
  { id = "used", text = "A cult that bargains with elemental lords is playing with fire it can't hold.", fx = { opinion = { abyssal_council = "fear" }, trait = { cautious = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Fire, wind, stone and water, all of it, and the Twilight's Hammer thinks it can hold the leash. Fools usually think that right up to the end." },
    { id = "b", text = "True, but you'd be surprised how long a fool can hold fire before it burns his hand off, and how much burns meanwhile." },
  } },
  { id = "curious", text = "Templars, dukes, lords. The elementals keep a stranger court than kings do.", fx = { opinion = { abyssal_council = "doubt" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Ha! Stranger, and a good deal more honest about wanting to burn everything. Kings at least pretend." },
    { id = "b", text = "Laugh while you can, {class}. Wait until a duke of winds lifts you thirty feet and drops you." },
  } },
} }

P:Views { topic = "natalia", views = {
  { id = "pity", text = "She wasn't evil. Something got inside her head at that crystal.", fx = { opinion = { natalia = "pity" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "That's what her husband tells himself, and I hope it's true. She was a good woman before Hive'Regal.", fx = { affinity = 1 } },
    { id = "b", text = "Maybe, but the cult that has her now doesn't care whose fault it was, and neither do the people they've killed." },
  } },
  { id = "stop", text = "Whatever she was, she's dangerous now. She has to be stopped.", fx = { opinion = { natalia = "hate" }, trait = { stern = 1 }, align = { light = -1, order = 1 } }, replies = {
    { id = "a", text = "Aye, and that's a hard thing for Commander Mar'alith, her husband, to hear. Say it gently around him, if you say it at all.", fx = { affinity = 1 } },
    { id = "b", text = "Hard words, {class}, but true ones. Just don't expect thanks from the man who married her." },
  } },
  { id = "warning", text = "If one crystal could turn her, I dread what waits in the deeper hives.", fx = { opinion = { natalia = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "That's the question that keeps Cenarion Hold awake. Whatever spoke to her didn't need to raise its voice." },
    { id = "b", text = "Something old, and not friendly. The dig teams stopped going near glyphed crystals after that, and I don't blame them." },
  } },
} }

P:Views { topic = "southwind", views = {
  { id = "mourn", text = "A whole village lost to the hives. I'm sorry for those who lived there.", fx = { opinion = { southwind = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Thank you. The ones who died there have long memories, and some of them still walk its streets.", fx = { affinity = 1 } },
    { id = "b", when = { race = "NightElf" }, text = "Ishnu-alah. It was your people's, and the sands swallowed it, and still they go back to tend it. That is the kaldorei way." },
  } },
  { id = "retake", text = "Someone ought to clear the cult out and give those spirits peace.", fx = { opinion = { southwind = "respect" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Layo Starstrike at Valor's Rest would agree with you. She's tried to free them more than once.", fx = { affinity = 1 } },
    { id = "b", text = "Someone ought to, and maybe you're that someone. The Twilight's Hammer don't care whose bones they camp on." },
  } },
  { id = "doomed", text = "Building a village on the edge of the sands was asking for it.", fx = { opinion = { southwind = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Asking for it? They were guarding the rest of us, {class}, and they paid for it with everything.", fx = { affinity = -1 } },
    { id = "b", text = "Maybe, but somebody has to stand at the edge, or the edge just comes closer." },
  } },
} }

P:Views { topic = "ortell", views = {
  { id = "redeem", text = "He walked away from the cult. That took more nerve than joining it.", fx = { opinion = { ortell = "respect" }, trait = { kind = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "It did, and they'd skin him for it if they found him. That's why he jumps at every footstep.", fx = { affinity = 1 } },
    { id = "b", text = "More nerve, aye, though he left it late. Still, late's better than never, out here." },
  } },
  { id = "suspect", text = "Once a cultist, always a cultist. I'd not turn my back on him.", fx = { opinion = { ortell = "distrust" }, trait = { skeptical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Maybe you're right to be careful, but he's given us more on the Twilight's Hammer than any spy we've sent." },
    { id = "b", text = "That's harsh, and I've thought it myself. Watch him, by all means, but use what he tells you." },
  } },
  { id = "use", text = "A former cultist knows their camps. That's worth more than his feelings.", fx = { opinion = { ortell = "profit" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Cold, but it's how Larksbane treats him too. She brings him supper and asks about the camps between bites." },
    { id = "b", text = "Squeeze him too hard and he'll bolt into the hills. Gently, {class}, if you want any more from him.", fx = { affinity = -1 } },
  } },
} }

P:Views { topic = "bronze_dragonflight", views = {
  { id = "awe", text = "Dragons who guard time itself. I'm not sure I want to know more.", fx = { opinion = { bronze_dragonflight = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Wise. Baristolth of the Shifting Sands speaks as if he's already heard your answer, and that's unsettling enough over a cup of tea." },
    { id = "b", text = "Most folk feel the same. The bronze never say much, and what they say comes out twisted, like riddles at a funeral." },
  } },
  { id = "help", text = "If the bronze dragons know what's coming, they should be helping us.", fx = { opinion = { bronze_dragonflight = "distrust" }, trait = { stern = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "They'd say they are, in their own way. Nozdormu's brood think in thousands of years, and we barely count in that." },
    { id = "b", text = "You're not the first to say it, and I agree with you. Knowing and doing nothing is still a choice." },
  } },
  { id = "trust", text = "They've watched the world longer than anyone. I'll trust their patience.", fx = { opinion = { bronze_dragonflight = "trust" }, trait = { patient = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Patience is the right word for them. They stopped the qiraji once, a thousand years ago, and they've been watching the wall since." },
    { id = "b", when = { race = "NightElf" }, text = "So do I. Nozdormu's children fought beside your people in the War of the Shifting Sands, and they keep their oaths." },
  } },
} }

P:Views { topic = "cthun", views = {
  { id = "fear", text = "Something under the desert that speaks into people's minds. I want no part of it.", fx = { opinion = { cthun = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Nobody does, which is exactly why it's dangerous. It only needs a few to listen." },
    { id = "b", text = "Then keep your mind your own, and stay away from glyphed crystals. That's all anyone at the Hold can tell you." },
  } },
  { id = "fight", text = "Whatever it is, it can be killed. Everything can.", fx = { opinion = { cthun = "hate" }, trait = { brave = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "I hope you're right, {class}. Commander Mar'alith would follow you in himself, if anyone could show him the door.", fx = { affinity = 1 } },
    { id = "b", text = "Brave, and maybe foolish. Some things are older than killing, and the qiraji worship this one as a god." },
  } },
  { id = "listen", text = "If it's that old, it must know things no one else does.", fx = { opinion = { cthun = "doubt" }, trait = { curious = 1 }, align = { light = -2 } }, replies = {
    { id = "a", text = "That's how Natalia started, I'd wager. Curiosity first, then the voice, then the knives.", fx = { affinity = -1 } },
    { id = "b", text = "Don't say that where the cultists can hear, {class}. They'll think you're one of theirs, and they won't be far wrong." },
  } },
} }

-- ===================================================================== War, Plague and leaders

P:Views { topic = "ashenvale", views = {
  { id = "need", when = { faction = "Horde" }, text = "Orgrimmar needs timber, and the elves don't own every tree in Kalimdor.", fx = { opinion = { ashenvale = "necessary" }, trait = { practical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "That's how the Warsong see it, and they've the logging camps to prove it. Grom's blood bought us that forest.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Tauren" }, text = "The Earth Mother gives wood to those who need it, but she does not like to see it taken in anger. Cut what we need, and no more." },
  } },
  { id = "wrong_h", when = { faction = "Horde" }, text = "Grom killed a demigod there. We should leave those woods in peace.", fx = { opinion = { ashenvale = "wrong" }, trait = { cautious = 1 }, align = { light = 1, order = 1 } }, replies = {
    { id = "a", text = "Some in the Horde say that quietly. Cenarius was the elves' god, and the Sentinels will never stop paying us back for him." },
    { id = "b", text = "Leave it, and freeze in Durotar? Peace is a fine word, but it won't build walls for Orgrimmar.", fx = { affinity = -1 } },
  } },
  { id = "defend", when = { faction = "Alliance" }, text = "The Horde has no right to Ashenvale. Every axe there is an invasion.", fx = { opinion = { ashenvale = "wrong" }, trait = { stern = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "The Sentinels would cheer to hear it. They lose sisters every season to those logging camps.", fx = { affinity = 1 } },
    { id = "b", when = { race = "NightElf" }, text = "Every tree they fell was old before the human kingdoms were young, {class}. Your people do not forget, and neither does the forest.", fx = { affinity = 1 } },
  } },
  { id = "share", when = { faction = "Alliance" }, text = "The forest is big enough for both of us, if anyone would talk.", fx = { opinion = { ashenvale = "necessary" }, trait = { kind = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Fine words, and Jaina would say the same. Try telling them to a Sentinel who's buried her sister at Splintertree, though." },
    { id = "b", when = { race = "NightElf" }, text = "Big enough? Your people watched a demigod die in that forest, {class}, and they will not share it lightly.", fx = { affinity = -1 } },
  } },
  { id = "bloody", text = "Ashenvale's going to soak up blood for another hundred years.", fx = { opinion = { ashenvale = "fear" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Longer, I'd say. Both sides have too many graves under those trees to just walk away." },
    { id = "b", text = "Grim, but likely true. Warsong Gulch alone has seen more fighting than some whole wars." },
  } },
} }

P:Views { topic = "scourge", views = {
  { id = "burn", text = "The Scourge must be burned out of Lordaeron, every last bone.", fx = { opinion = { scourge = "hate" }, trait = { stern = 1 }, align = { light = 1, order = 1 } }, replies = {
    { id = "a", text = "Aye, and there are a lot of bones, {class}. The Argent Dawn are at it every day, and it barely shows.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Scourge" }, text = "On that, the Dark Lady and the Light agree. The Lich King took everything from your people, and they mean to take it back with interest.", fx = { affinity = 1 } },
  } },
  { id = "freed", when = { race = "Scourge" }, text = "I was one of them once. I'll see the rest of them free or destroyed.", fx = { opinion = { scourge = "pity" }, trait = { honest = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Free, if they can be, and destroyed if they can't. Most can't, and we tell ourselves that's mercy.", fx = { affinity = 1 } },
    { id = "b", text = "Plenty were. Some woke up and the rest still march for the Lich King, and that's the only difference between the Forsaken and the Scourge." },
  } },
  { id = "victims", text = "Every one of those ghouls was somebody's neighbor once. It's horrible.", fx = { opinion = { scourge = "pity" }, trait = { kind = 1 }, align = { light = 1, order = -1 } }, replies = {
    { id = "a", text = "It is, and that's what breaks the new recruits. Not the fighting, but recognizing the farmer from the next village." },
    { id = "b", text = "Remember that, but strike anyway. Pity won't stop a ghoul, and they'd want you to put them down." },
  } },
  { id = "fear", text = "The Plague is still spreading. The Scourge could take Kalimdor next.", fx = { opinion = { scourge = "fear" }, trait = { cautious = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Not while the Argent Dawn holds Light's Hope, maybe, but the grain carts are still going places they shouldn't." },
    { id = "b", text = "Don't spread that around the docks, {class}. Folk panic, and panic does the Lich King's work for him." },
  } },
} }

P:Views { topic = "forsaken", views = {
  { id = "proud", when = { race = "Scourge" }, text = "We clawed our way free of the Lich King. Nobody gave us anything.", fx = { opinion = { forsaken = "trust" }, trait = { proud = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Nobody, and nobody will. That's why the Undercity is yours and yours alone, whatever the living think of it.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Horde" }, text = "That's the kind of freedom the Horde understands, {class}. We've clawed our own way out of a cage or two." },
  } },
  { id = "ally", when = { faction = "Horde" }, text = "The Forsaken fight the Scourge and the Crusade. That's good enough for me.", fx = { opinion = { forsaken = "trust" }, trait = { practical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "For now it's good enough for Thrall too, and he's no fool. Just don't drink anything their apothecaries offer you." },
    { id = "b", when = { race = "Tauren" }, text = "Cairne speaks for them, and so I try to see the spirit behind the rot. Some days it is easier than others." },
  } },
  { id = "doubt_h", when = { faction = "Horde" }, text = "I don't trust the dead in our Horde. They're keeping secrets in those vaults.", fx = { opinion = { forsaken = "distrust" }, trait = { skeptical = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", when = { race = "Scourge" }, text = "Everyone keeps secrets. Your people simply keep theirs better, and the living find that rude.", fx = { affinity = -1 } },
    { id = "b", text = "You're not the only one, and some of the grunts say it louder. Thrall took them in, though, so we hold our tongues." },
  } },
  { id = "pity", when = { faction = "Alliance" }, text = "They were the people of Lordaeron once. I can't help pitying them.", fx = { opinion = { forsaken = "pity" }, trait = { kind = 1 }, align = { light = 1, order = -1 } }, replies = {
    { id = "a", text = "Pity them from a distance, then. Whatever they were, they've taken the Horde's side and the Undercity's poisons with it." },
    { id = "b", text = "Some of us lost family to the Plague, and maybe some of those walk in Tirisfal now. It's a hard thing to think about." },
  } },
  { id = "hate", when = { faction = "Alliance" }, text = "Walking corpses with free will are still corpses. Put them back in the ground.", fx = { opinion = { forsaken = "hate" }, trait = { stern = 1 }, align = { light = 1, order = 1 } }, replies = {
    { id = "a", text = "The Crusade would cheer that, and that should give you pause, {class}. Still, I can't say I'd weep.", fx = { affinity = 1 } },
    { id = "b", text = "Hard words, and many share them. The dead went with the Horde, and they've made their choice." },
  } },
  { id = "watch", text = "Whatever the Forsaken say, they want something nobody's guessed yet.", fx = { opinion = { forsaken = "distrust" }, trait = { cautious = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Everyone wants something. The Forsaken just don't bother pretending they don't, and that's what frightens folk." },
    { id = "b", text = "Keep that thought, {class}, and keep it quiet. Either you're wrong, or you're right and they're listening." },
  } },
} }

P:Views { topic = "kelthuzad", views = {
  { id = "hate", text = "A man who sold his own country to the dead deserves no rest.", fx = { opinion = { kelthuzad = "hate" }, trait = { stern = 1 }, align = { light = 2 } }, replies = {
    { id = "a", text = "He was a Dalaran archmage once, and he started the Cult of the Damned in his own homeland. He'll get no rest from the Argent Dawn.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Scourge" }, text = "He made your people, more or less, and they mean to unmake him. That's the most personal grudge in the Undercity.", fx = { affinity = 1 } },
  } },
  { id = "fear", text = "Arthas killed him once, and he came back. I don't know how you fight that.", fx = { opinion = { kelthuzad = "fear" }, trait = { cautious = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Carefully, and with the Light. They say he still gives the Scourge its orders from somewhere in the north, and nobody has found where." },
    { id = "b", text = "By killing him better next time. That's all the Argent Dawn's got, and it's more than despair." },
  } },
  { id = "mind", text = "Say what you like, he was clever. Dalaran never saw it coming.", fx = { opinion = { kelthuzad = "respect" }, trait = { skeptical = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Clever's a cold thing to admire in a man who poisoned grain carts, {class}. Mind how you say that.", fx = { affinity = -1 } },
    { id = "b", text = "Clever, and patient, which is worse. Dalaran saw it coming and threw him out, but it was too late by then." },
  } },
} }

P:Views { topic = "arthas", views = {
  { id = "traitor", text = "He murdered his own father and his own people. There's no excuse.", fx = { opinion = { arthas = "hate" }, trait = { stern = 1 }, align = { light = 2, order = 1 } }, replies = {
    { id = "a", text = "None at all. King Terenas died on his throne room floor, and the whole kingdom went after him.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Scourge" }, text = "Your people were there for the end of it, one way or another. They remember him better than his statues do.", fx = { affinity = 1 } },
  } },
  { id = "fallen", when = { faction = "Alliance" }, text = "He was a paladin once, and a good one. That's the real tragedy.", fx = { opinion = { arthas = "pity" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "He was, and Uther trained him. That's what nobody in the Cathedral wants to say out loud." },
    { id = "b", text = "Tragedy, maybe, but a million dead don't care how he began. Mourn the prince if you must, but hate the king.", fx = { affinity = -1 } },
  } },
  { id = "stratholme", text = "The day he burned Stratholme, I'd say he was already lost.", fx = { opinion = { arthas = "distrust" }, trait = { honest = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Many say the same. Uther walked away that day, and Jaina too, and he went to Northrend without them." },
    { id = "b", text = "Some say the city was doomed already and he only finished it. I'm not sure that makes it better." },
  } },
  { id = "fool", when = { faction = "Horde" }, text = "The humans made him, armed him, and crowned him. Lordaeron's ruin is its own.", fx = { opinion = { arthas = "doubt" }, trait = { proud = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Hard to argue. The same kingdom that built our camps raised that prince, and then he devoured it.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Scourge" }, text = "Careful, {class}. Plenty of your own people died in that kingdom, so laugh at its fall gently.", fx = { affinity = -1 } },
  } },
} }

P:Views { topic = "lordaeron", views = {
  { id = "mourn", text = "The greatest kingdom of men, gone in a season. It breaks my heart.", fx = { opinion = { lordaeron = "pity" }, trait = { kind = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "It breaks everyone's who saw it, {class}. The capital, the farms of Andorhal, all of it, and the dead walk there now." },
    { id = "b", when = { race = "Scourge" }, text = "Your heart stopped there, {class}, so I'd guess there's little left of it to break." },
  } },
  { id = "reclaim", when = { faction = "Alliance" }, text = "Lordaeron should be taken back for the living, and the Forsaken thrown out.", fx = { opinion = { lordaeron = "hate" }, trait = { stern = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "One day, maybe. For now the Scourge and the Crusade have half of it, and the dead have the capital." },
    { id = "b", text = "Plenty of refugees in Stormwind would follow you there, {class}. Not many of them have swords, though." },
  } },
  { id = "ours", when = { race = "Scourge" }, text = "Lordaeron belongs to its dead now. The living gave it up.", fx = { opinion = { lordaeron = "trust" }, trait = { proud = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Said like a true child of the Dark Lady. Your people buried the old kingdom, and they sleep beneath it by choice.", fx = { affinity = 1 } },
    { id = "b", text = "The Crusade disagrees, loudly and with fire. Still, they've yet to take one step past the Bulwark." },
  } },
  { id = "rot", text = "It rotted from within long before the Plague. The Plague just finished it.", fx = { opinion = { lordaeron = "doubt" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Cold, but there's something to it. The camps, the taxes, the nobles quarreling over Alterac; it wasn't healthy." },
    { id = "b", text = "Don't say that to anyone who lived there, {class}. They'll remember the harvests, not the politics.", fx = { affinity = -1 } },
  } },
} }

P:Views { topic = "stratholme", views = {
  { id = "cleanse", text = "Stratholme has to be cleansed, for the sake of everyone who died there.", fx = { opinion = { stratholme = "hate" }, trait = { pious = 1 }, align = { light = 2 } }, replies = {
    { id = "a", text = "The Argent Dawn says the same, and so does the Crusade, in its way. The Baron and his dead don't make it easy.", fx = { affinity = 1 } },
    { id = "b", text = "It's been tried, more than once. Even the Scarlets only hold a corner of it, and they're half mad from the effort." },
  } },
  { id = "mercy", text = "He killed a city before the Plague could take it. Maybe that was mercy.", fx = { opinion = { stratholme = "doubt" }, trait = { skeptical = 1 }, align = { light = -1, order = 1 } }, replies = {
    { id = "a", text = "That's what he told himself, I've no doubt. Uther didn't think so, and neither did Jaina.", fx = { affinity = -1 } },
    { id = "b", text = "Maybe, but there were children in that city who hadn't eaten the grain. Mercy has to be careful about who it kills." },
  } },
  { id = "avoid", text = "There's nothing left in Stratholme worth dying for.", fx = { opinion = { stratholme = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Except the people trapped in it, alive or dead. The Dawn still hears whispers of survivors." },
    { id = "b", text = "Smart. More adventurers went in there for treasure than came out, and the gates are always open going in." },
  } },
} }

P:Views { topic = "shadowfang", views = {
  { id = "arugal", text = "Arugal ought to pay for what he unleashed on Silverpine.", fx = { opinion = { shadowfang = "hate" }, trait = { stern = 1 }, align = { light = 1 } }, replies = {
    { id = "a", text = "He will, if anyone can climb that keep. The worgen have the whole forest half afraid to sleep.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Scourge" }, text = "He's made that forest dangerous even for the dead, which takes some doing. The Apothecaries would like his head, I hear." },
  } },
  { id = "mistake", text = "Arugal meant to help Gilneas. He just reached for the wrong power.", fx = { opinion = { shadowfang = "pity" }, trait = { kind = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Meant to, perhaps. Dalaran's full of men who meant well, and look at the trouble they cause." },
    { id = "b", text = "That's a gentler way to describe a man who calls wolves his children. I'd not say it in Pyrewood.", fx = { affinity = -1 } },
  } },
  { id = "treasure", text = "A baron's keep abandoned to beasts. There'll be loot in there.", fx = { opinion = { shadowfang = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Loot, aye, and a great many teeth guarding it, {class}, because the worgen sleep on Arugal's floors now." },
    { id = "b", text = "Plenty have thought the same, and their gear is in there too now. Go in numbers, if you go." },
  } },
} }

P:Views { topic = "internment", views = {
  { id = "never", when = { race = "Orc" }, text = "I remember the camps. I'll never be anyone's prisoner again.", fx = { opinion = { internment = "hate" }, trait = { proud = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Nor should any orc. Thrall broke those walls, and the Horde would die before it let another one go up.", fx = { affinity = 1 } },
    { id = "b", text = "Lok'tar, {class}. Remember them always, but never let the memory make you a slave again." },
  } },
  { id = "cruel", when = { faction = "Horde" }, text = "Locking up a people and calling it peace. That's the Alliance for you.", fx = { opinion = { internment = "hate" }, trait = { stern = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "That's what Thrall saw, and why he burned Durnholde. The humans called it mercy, but it was a cage with rations.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Tauren" }, text = "Even a wild kodo will die in a pen, given time. The humans did not understand what they were doing to the orcs." },
  } },
  { id = "needed", when = { faction = "Alliance" }, text = "After the Second War, the camps were the only sane choice Lordaeron had.", fx = { opinion = { internment = "necessary" }, trait = { practical = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "That's how the old guards saw it. The orcs had burned half the north; nobody wanted them free in the hills.", fx = { affinity = 1 } },
    { id = "b", text = "It cost the crown a fortune and bred a whole army of Thralls. Necessary or not, it didn't work." },
  } },
  { id = "shame", when = { faction = "Alliance" }, text = "The camps were a mistake. We made the Horde we're fighting now.", fx = { opinion = { internment = "wrong" }, trait = { honest = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Some veterans would agree with you, quietly. Others still say they'd do it again, and louder." },
    { id = "b", text = "Careful, {class}. Men who guarded those camps lost sons at Blackrock, and they won't like hearing it." },
  } },
  { id = "past", text = "The camps are gone and both sides have moved on. Let it lie.", fx = { opinion = { internment = "doubt" }, trait = { patient = 1 } }, replies = {
    { id = "a", text = "Easy for some to say. The orcs who were in them haven't moved on, and I don't expect they ever will." },
    { id = "b", text = "Maybe, but nothing lies still in this world for long. Old grudges have a way of finding new swords." },
  } },
} }

P:Views { topic = "second_war", views = {
  { id = "glory", when = { faction = "Alliance" }, text = "The Alliance stood together and saved the world. We should remember that.", fx = { opinion = { second_war = "admire" }, trait = { proud = 1 }, align = { order = 1, honor = 1 } }, replies = {
    { id = "a", text = "Lothar, Turalyon, the knights of the Silver Hand; we'll not see their like again, {class}.", fx = { affinity = 1 } },
    { id = "b", text = "Together, aye, until it was over. Then Gilneas built a wall and Stromgarde walked out, and here we are." },
  } },
  { id = "shame_h", when = { faction = "Horde" }, text = "The Horde fought that war for demons. I won't call it glory.", fx = { opinion = { second_war = "wrong" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Nor should you. Gul'dan and his warlocks led us there, and Thrall will tell you we're still washing it off.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Orc" }, text = "Speak softly, {class}. Some old warriors fought bravely in it, whatever the warlocks did with their courage.", fx = { affinity = -1 } },
  } },
  { id = "proud_h", when = { faction = "Horde" }, text = "We nearly took Lordaeron. The orcs fought like legends in that war.", fx = { opinion = { second_war = "admire" }, trait = { brave = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Like legends, and lost like fools, thanks to Gul'dan's treachery. Never forget both halves of it." },
    { id = "b", text = "Orgrim Doomhammer nearly did it, aye. Thrall carries his hammer now, for good reason." },
  } },
  { id = "waste", text = "A generation of soldiers died, and nobody learned a thing from it.", fx = { opinion = { second_war = "doubt" }, trait = { skeptical = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Some learned, {class}, but the ones who learned most are buried. The young never listen to the old men about it." },
    { id = "b", text = "Hard to argue. Both sides are still at it in Ashenvale and Arathi, as if nothing happened." },
  } },
} }

P:Views { topic = "gilneas", views = {
  { id = "traitors", text = "Greymane built a wall and left the rest of us to die.", fx = { opinion = { gilneas = "hate" }, trait = { stern = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Many in the old Alliance still say that, and with cause. Lordaeron fell with Gilneas sitting snug behind its stones.", fx = { affinity = 1 } },
    { id = "b", text = "Greymane would say he kept his people alive, and maybe he did. That's the trouble with walls; they work, after a fashion." },
  } },
  { id = "wise", text = "Greymane saw the Alliance was a bad bargain and got out early.", fx = { opinion = { gilneas = "respect" }, trait = { practical = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Cold-blooded, but you could call it wise. Nobody knows how Gilneas fared since, though, so it may not have been." },
    { id = "b", text = "Say that to someone who lost family in the Plague, {class}, and see how wise they think it was.", fx = { affinity = -1 } },
  } },
  { id = "wonder", text = "Nobody's heard from Gilneas in years. Something could be very wrong in there.", fx = { opinion = { gilneas = "doubt" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Silverpine folk say the same, and they swear the wall's guards stopped answering hails years ago. I don't know what's true behind it." },
    { id = "b", text = "Wrong or right, they've made it plain they don't want visitors. The wall says it better than any herald." },
  } },
} }

P:Views { topic = "stromgarde", views = {
  { id = "retake", when = { faction = "Alliance" }, text = "Stromgarde should be retaken. It was a proud kingdom, and still can be.", fx = { opinion = { stromgarde = "respect" }, trait = { brave = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "Refuge Pointe would welcome every sword you can bring. The Syndicate and the ogres hold more of it than we do.", fx = { affinity = 1 } },
    { id = "b", text = "Proud, aye, and too proud to stay in the Alliance when it mattered. Retake it, but don't expect thanks." },
  } },
  { id = "foes", when = { faction = "Horde" }, text = "Stromgarde never stopped hating orcs. Let it lie in ruins.", fx = { opinion = { stromgarde = "hate" }, trait = { stern = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "The Defilers would agree. Every inch of Arathi they take back from Stromgarde's men is one more lesson.", fx = { affinity = 1 } },
    { id = "b", text = "Ruins or not, they still field soldiers. Don't count them out because their walls are cracked." },
  } },
  { id = "pity", text = "A kingdom that walked out of the Alliance and fell apart anyway. Sad.", fx = { opinion = { stromgarde = "pity" }, trait = { kind = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Sad, yes, and Thoras Trollbane's death didn't help. His son Galen is a lesser man, and everyone knows it." },
    { id = "b", text = "That's the way of kingdoms that think they don't need anyone else. The ogres taught them otherwise." },
  } },
} }

P:Views { topic = "wildhammer", views = {
  { id = "admire", text = "Dwarves who ride gryphons and live free. There's nothing finer.", fx = { opinion = { wildhammer = "admire" }, trait = { brave = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Ha! They'll love you for that up at Aerie Peak. Bring a strong stomach for their ale, though.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Dwarf" }, text = "Free, aye, and sometimes a little too free, if you ask Ironforge. Still, they're your kin." },
  } },
  { id = "wild", text = "Tattooed, half-feral and drunk most of the time. Hardly reliable allies.", fx = { opinion = { wildhammer = "distrust" }, trait = { stern = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "They've saved more Alliance skins with their gryphons than any wall has. Drunk or not, they show up.", fx = { affinity = -1 } },
    { id = "b", text = "That's how Ironforge's been talking for centuries. Wildhammer don't mind; they've stopped listening." },
  } },
  { id = "kin", text = "Bronzebeard or Wildhammer, a dwarf's a dwarf. They should be one people again.", fx = { opinion = { wildhammer = "trust" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "A fine thought, though the War of the Three Hammers says otherwise. Old wounds heal slow under stone." },
    { id = "b", when = { race = "Dwarf" }, text = "You've a good heart, but Falstad and Magni would have to agree on a drink first, and that'll be a long night." },
  } },
} }

P:Views { topic = "thrall", views = {
  { id = "loyal", when = { faction = "Horde" }, text = "Thrall freed us from the camps. I'd follow him anywhere.", fx = { opinion = { thrall = "trust" }, trait = { proud = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Lok'tar, and so would I. He gave us back our spirits and a land to call our own.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Troll" }, text = "He saved the Darkspear from the sea witch's island, and Vol'jin owes him for it, as do we all.", fx = { affinity = 1 } },
  } },
  { id = "soft", when = { faction = "Horde" }, text = "He was raised by humans. Sometimes I think he's too soft on them.", fx = { opinion = { thrall = "doubt" }, trait = { stern = 1 }, align = { honor = -1, order = -1 } }, replies = {
    { id = "a", text = "Some grunts mutter the same, but never near his door. He fought his way out of Durnholde, and that's not soft.", fx = { affinity = -1 } },
    { id = "b", text = "Maybe. He'd rather talk with Theramore than fight it, and not everyone in Orgrimmar likes that." },
  } },
  { id = "respect_a", when = { faction = "Alliance" }, text = "Thrall's an enemy, but an honorable one. I'll grant him that.", fx = { opinion = { thrall = "respect" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Jaina says the same, and she's dealt with him more than any of us. He kept his word at Hyjal.", fx = { affinity = 1 } },
    { id = "b", text = "Honor's easy to grant from across an ocean. The Sentinels in Ashenvale don't see much of it." },
  } },
  { id = "distrust_a", when = { faction = "Alliance" }, text = "An orc warchief who smiles at us is still an orc warchief.", fx = { opinion = { thrall = "distrust" }, trait = { cautious = 1 }, align = { honor = -1, order = 1 } }, replies = {
    { id = "a", text = "Aye, and the Warsong axes in Ashenvale answer to him, peace treaty or no.", fx = { affinity = 1 } },
    { id = "b", text = "Cautious is wise, but he's done less harm than most kings I could name, {class}." },
  } },
  { id = "shaman", text = "A shaman who talks to the elements and leads an army. Remarkable.", fx = { opinion = { thrall = "admire" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "The orcs had nearly forgotten the old ways until him. Drek'Thar and Thrall brought them back." },
    { id = "b", text = "Remarkable, aye, and dangerous if you're on the wrong side of the storm he can call." },
  } },
} }

P:Views { topic = "sylvanas", views = {
  { id = "loyal", when = { race = "Scourge" }, text = "The Dark Lady gave us back our minds. I serve her gladly.", fx = { opinion = { sylvanas = "loyal" }, trait = { proud = 1 }, align = { order = 1 } }, replies = {
    { id = "a", text = "She broke free first and pulled the rest of your people after her, and she'll not be forgotten for it.", fx = { affinity = 1 } },
    { id = "b", text = "Gladly is good. The Dark Lady has little use for the reluctant." },
  } },
  { id = "own_mind", when = { race = "Scourge" }, text = "I'm grateful to her, but my will is my own now.", fx = { opinion = { sylvanas = "distrust" }, trait = { honest = 1 }, align = { order = -1 } }, replies = {
    { id = "a", text = "Careful how loudly you say that in the Undercity. The Deathstalkers have good ears, and the Dark Lady has better.", fx = { affinity = -1 } },
    { id = "b", text = "Then use it well. That freedom was hard won, and she's the one who won it." },
  } },
  { id = "doubt_h", when = { faction = "Horde" }, text = "The banshee queen joined the Horde for her own reasons, not ours.", fx = { opinion = { sylvanas = "distrust" }, trait = { skeptical = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Thrall knows it. That's why he keeps a sharp eye on the Undercity, and the Dark Lady keeps a sharper one on him." },
    { id = "b", when = { race = "Scourge" }, text = "Of course for her own reasons. Do you think the Horde took the Forsaken in out of charity?", fx = { affinity = -1 } },
  } },
  { id = "hero", when = { faction = "Alliance" }, text = "She defended Quel'Thalas to her last breath. That's worth remembering.", fx = { opinion = { sylvanas = "pity" }, trait = { kind = 1 }, align = { light = 1, order = -1 } }, replies = {
    { id = "a", text = "She was the Ranger-General, and she nearly held Arthas off. What came back isn't her, though." },
    { id = "b", when = { race = "NightElf" }, text = "Her people's pride was the end of her, as yours was once. I pity the elf, but I fear the banshee." },
  } },
  { id = "enemy", when = { faction = "Alliance" }, text = "Whatever she was, she's a queen of the dead now. That's enough.", fx = { opinion = { sylvanas = "distrust" }, trait = { stern = 1 }, align = { light = 1, order = 1 } }, replies = {
    { id = "a", text = "Aye, and her apothecaries are cooking something in those vaults. I'd bet my life on it.", fx = { affinity = 1 } },
    { id = "b", text = "Enough to hate her, maybe. Enough to understand her, no; I don't think anyone alive can." },
  } },
  { id = "fear", text = "She sees everything from that throne under Lordaeron. It unsettles me.", fx = { opinion = { sylvanas = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "It should. A woman who outlived her own death has very little left to be afraid of." },
    { id = "b", text = "She's meant to unsettle. A ruler of the dead can't afford to be comforting." },
  } },
} }

P:Views { topic = "cairne", views = {
  { id = "wise", text = "Cairne's the wisest leader in Kalimdor. Everyone should listen to him.", fx = { opinion = { cairne = "admire" }, trait = { kind = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", when = { race = "Tauren" }, text = "The Earth Mother speaks through him, young one. He has walked the plains longer than most of us have lived.", fx = { affinity = 1 } },
    { id = "b", text = "Thrall listens, which is more than most do. Cairne brought the tauren home to Mulgore when they had nowhere left." },
  } },
  { id = "old", when = { faction = "Horde" }, text = "He's old now. The Horde needs younger blood in its councils.", fx = { opinion = { cairne = "doubt" }, trait = { proud = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "Old, and still able to break your arm across his knee. Mind your tongue around Thunder Bluff.", fx = { affinity = -1 } },
    { id = "b", text = "The Grimtotem say that too, and look at the company they keep. I'd find another way to put it." },
  } },
  { id = "honor", when = { faction = "Alliance" }, text = "For a Horde chieftain, he seems a decent sort.", fx = { opinion = { cairne = "respect" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Decent, and peaceable unless his people are threatened. If the whole Horde was like him, there'd be no war." },
    { id = "b", text = "He's honest in the old way. That doesn't make him our friend, though; he chose the orcs." },
  } },
  { id = "doubt", text = "Gentle words are nice, but a war's not won by them.", fx = { opinion = { cairne = "distrust" }, trait = { stern = 1 }, align = { honor = -1, order = 1 } }, replies = {
    { id = "a", text = "Cairne's no stranger to war, {class}. He fought the centaur across the Barrens before any of us came.", fx = { affinity = -1 } },
    { id = "b", text = "And yet his gentle words made him the Horde's best friend in Kalimdor. Some wars are won quietly." },
  } },
} }

P:Views { topic = "voljin", views = {
  { id = "respect", when = { faction = "Horde" }, text = "Vol'jin's sharp. The Horde's lucky to have him.", fx = { opinion = { voljin = "respect" }, trait = { kind = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", when = { race = "Troll" }, text = "Sharp as a raptor's tooth, and twice as patient. He's led the Darkspear through worse than this.", fx = { affinity = 1 } },
    { id = "b", text = "He is. Thrall trusts him with Sen'jin and the Echo Isles, and he hasn't been wrong yet." },
  } },
  { id = "shadow", text = "A shadow hunter with the loa whispering in his ear. That makes me uneasy.", fx = { opinion = { voljin = "distrust" }, trait = { cautious = 1 }, align = { light = 1, honor = -1 } }, replies = {
    { id = "a", when = { race = "Troll" }, text = "The loa whisper in everyone's ear, but most folk just don't listen, and Vol'jin listens well.", fx = { affinity = -1 } },
    { id = "b", text = "It unsettles many. He's walked with spirits that would turn most minds, and his hasn't turned yet." },
  } },
  { id = "zalazane", text = "Losing the Echo Isles to his own witch doctor. Not his finest hour.", fx = { opinion = { voljin = "doubt" }, trait = { witty = 1 }, align = { light = -1 } }, replies = {
    { id = "a", text = "Zalazane was clever, and the curse was cleverer. Vol'jin got his people out, which counts for something." },
    { id = "b", when = { race = "Troll" }, text = "Watch that tongue, {class}. Zalazane will get what he is owed, and Vol'jin does not forget a slight.", fx = { affinity = -1 } },
  } },
} }

P:Views { topic = "darkspear", views = {
  { id = "kin", when = { faction = "Horde" }, text = "The Darkspear are as much Horde as any orc. They've earned it.", fx = { opinion = { darkspear = "trust" }, trait = { kind = 1 }, align = { honor = 1, order = 1 } }, replies = {
    { id = "a", when = { race = "Troll" }, text = "That's right, because the Darkspear bleed for the Horde and the Horde bleeds for them.", fx = { affinity = 1 } },
    { id = "b", text = "Earned it many times over. They fought beside Thrall when the Horde was a handful of ships and some very sore orcs." },
  } },
  { id = "savage", when = { faction = "Alliance" }, text = "Headhunters and voodoo priests. The Horde keeps strange company.", fx = { opinion = { darkspear = "distrust" }, trait = { stern = 1 }, align = { light = 1, order = 1 } }, replies = {
    { id = "a", text = "Strange, aye, and deadly with a spear at forty paces. I'd not want to be at the wrong end of a Darkspear grudge." },
    { id = "b", text = "They're cleverer than they let on, {class}. Don't mistake the paint for a lack of wits." },
  } },
  { id = "survivors", text = "Driven off their islands, and still standing. I respect that.", fx = { opinion = { darkspear = "respect" }, trait = { honest = 1 }, align = { light = -1, order = -1 } }, replies = {
    { id = "a", text = "Most tribes would have scattered after the sea witch and Zalazane. The Darkspear just found another island." },
    { id = "b", when = { race = "Troll" }, text = "The Darkspear are always left standing, and they laugh the whole time they do it.", fx = { affinity = 1 } },
  } },
} }

P:Views { topic = "jaina", views = {
  { id = "trust_a", when = { faction = "Alliance" }, text = "Lady Jaina's the best hope for peace we've got.", fx = { opinion = { jaina = "trust" }, trait = { kind = 1 }, align = { order = 1, honor = 1 } }, replies = {
    { id = "a", text = "She fought beside orcs at Hyjal and lived to tell it. If anyone can keep a truce, it's her.", fx = { affinity = 1 } },
    { id = "b", text = "Hope, aye, but hope's a thin shield. Theramore's a small city with the whole Barrens on its doorstep." },
  } },
  { id = "soft_a", when = { faction = "Alliance" }, text = "She's too friendly with the Horde. Stormwind won't forget that.", fx = { opinion = { jaina = "distrust" }, trait = { stern = 1 }, align = { order = -1, honor = -1 } }, replies = {
    { id = "a", text = "Plenty at court say so behind their hands. She lost her father to that friendship, and she still keeps it.", fx = { affinity = 1 } },
    { id = "b", text = "Friendly, or wise? She saw the Legion up close at Hyjal, {class}, and you and I did not.", fx = { affinity = -1 } },
  } },
  { id = "trust_h", when = { faction = "Horde" }, text = "Jaina keeps her word to Thrall. That's rare in a human.", fx = { opinion = { jaina = "trust" }, trait = { honest = 1 }, align = { honor = 1 } }, replies = {
    { id = "a", text = "Rare enough that Thrall honors it. She stood by him against her own father at Theramore.", fx = { affinity = 1 } },
    { id = "b", text = "She keeps it for now. Humans live short lives and change their minds faster still." },
  } },
  { id = "danger_h", when = { faction = "Horde" }, text = "A human archmage on our doorstep. I don't care how friendly she is.", fx = { opinion = { jaina = "distrust" }, trait = { cautious = 1 }, align = { honor = -1 } }, replies = {
    { id = "a", text = "A fair worry. Theramore's walls go up a little higher every season, and they're not facing the sea." },
    { id = "b", text = "Thrall trusts her, and that's enough for the Warchief's grunts. Keep the worry, but keep it quiet." },
  } },
  { id = "admire", text = "A sorceress who fought at Hyjal and built a city after. Impressive.", fx = { opinion = { jaina = "admire" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Impressive, and she's younger than you'd think. Antonidas taught her before Dalaran fell." },
    { id = "b", text = "Theramore's her city through and through, and the Kul Tiran sailors there would die for her." },
  } },
} }
