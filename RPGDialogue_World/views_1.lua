-- Speaking your mind (0.82.0): views on Elwynn, Westfall, Redridge, Duskwood, Zephras Isle and the dwarves' and gnomes' troubles. Format: views.lua.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Elwynn Forest ---------------------------------------------------------------

P:Views { topic = "defias", views = {
  { id = "hang", text = "Thieves and murderers, the lot of them. Hang every one we catch.", fx = { opinion = { defias = "hardline" }, align = { order = 2 }, trait = { stern = 1 } }, replies = {
    { id = "a", when = { faction = "Alliance" }, text = "Sentinel Hill has a gibbet built for exactly that. I only wish we caught enough of them to keep it busy.", fx = { affinity = 1 } },
    { id = "b", text = "Hard words, but they've earned them. Ask any farmer in Westfall who lost a barn to their torches." },
    { id = "c", when = { disposition = { max = 34 } }, text = "Easy to say from here. Most of the ones you'd hang are farmhands who were hungry last winter.", fx = { affinity = -1 } },
  } },
  { id = "wronged", text = "The stonemasons built Stormwind and were cheated for it. I can't blame them entirely.", fx = { opinion = { defias = "masons_wronged" }, align = { order = -1 }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Say that softly in Stormwind. You're right about the masons, but the men burning Westfall's farms never laid a stone in their lives." },
    { id = "b", when = { faction = "Alliance" }, text = "The House of Nobles did cheat them, and everyone knows it. That doesn't buy back a single murdered farmer, though.", fx = { affinity = -1 } },
    { id = "c", when = { faction = "Horde" }, text = "A city that won't pay the men who built its walls? That sounds like Stormwind to me.", fx = { affinity = 1 } },
  } },
  { id = "pity", text = "Most of them are just hungry men with nowhere else to go.", fx = { opinion = { defias = "pity" }, align = { light = 1 }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Some of them, aye, and those are the ones who break my heart. The ones giving the orders are another matter entirely." },
    { id = "b", text = "Hunger makes a thief, but it doesn't make a killer. Somebody's teaching them the rest, and that somebody has never gone hungry.", fx = { affinity = 1 } },
  } },
  { id = "profit", text = "Their bounties pay well. I'll thin their numbers for the coin.", fx = { opinion = { defias = "profit" }, align = { honor = -1 }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Coin's as good a reason as any, so long as the right people end up dead. Don't go collecting bandanas off honest farmhands." },
    { id = "b", text = "Mercenary of you, {class}, but Westfall's in no position to be fussy about who helps it." },
  } },
} }

P:Views { topic = "kobolds", views = {
  { id = "pests", text = "Kobolds are vermin with candles. I'll clear them out of every mine.", fx = { opinion = { kobolds = "contempt" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "That's the spirit, though they breed down there like rats in a grain loft. Clear a tunnel today and it's full again within the week." },
    { id = "b", text = "Vermin they may be, but vermin with picks. Mind your head in the low tunnels, {class}." },
  } },
  { id = "funny", text = "I almost feel bad for them, shouting about their candles.", fx = { opinion = { kobolds = "pity" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Don't. A kobold will steal the boots off a sleeping miner and then shout about it, and that's the friendly ones." },
    { id = "b", text = "Ha! It's a strange thing to die over, a candle stub, but they seem to mean every word." },
  } },
  { id = "why", text = "Something's driving them up out of the deep. That worries me more.", fx = { opinion = { kobolds = "doubt" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Now that's a thought most folk don't have. Kobolds don't usually come up to the light unless something below wants their tunnels." },
    { id = "b", text = "Maybe so, or maybe they've just run out of room. Either way, the miners want them gone before supper." },
  } },
} }

P:Views { topic = "echo_ridge", views = {
  { id = "retake", text = "That mine should be in our hands again. I'll see to it.", fx = { opinion = { echo_ridge = "retake" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Marshal McBride will be glad to hear it. The Abbey's been short of good ore since the kobolds dug in.", fx = { affinity = 1 } },
    { id = "b", text = "Take a torch and a friend, then. The tunnels go further back than anyone's mapped." },
  } },
  { id = "leave", text = "Let the kobolds have a hole in a hill. There are other mines.", fx = { opinion = { echo_ridge = "indifferent" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Not this close to the Abbey there aren't. Leave them be and next spring they'll be digging under Northshire itself.", fx = { affinity = -1 } },
    { id = "b", text = "There are, but none we already paid to dig. Somebody's purse will feel that, if yours won't." },
  } },
  { id = "dark", text = "I don't like mines. Too dark, and too many places to get lost.", fx = { opinion = { echo_ridge = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Nobody likes them, except dwarves and kobolds. Mark the turns on the walls with chalk and you'll find your way out." },
    { id = "b", text = "Honest of you. Better a {class} who knows it than one who walks in whistling." },
  } },
} }

P:Views { topic = "hogger", views = {
  { id = "hunt", text = "A gnoll that big needs putting down. I'd like the honor.", fx = { opinion = { hogger = "hunt" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Many have said that, {class}, and most of them are buried near the Forest's Edge. Bring friends, or bring a priest." },
    { id = "b", when = { maxLevel = 10 }, text = "Not yet, you wouldn't. Grow a little first, because Hogger has been eating braver fools than you all season." },
    { id = "c", text = "The Watch would thank you, and so would every farm south of the river.", fx = { affinity = 1 } },
  } },
  { id = "legend", text = "Hogger eating whole patrols? Those stories grow every time they're told.", fx = { opinion = { hogger = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Some of them do. The one where he eats the Watch's patrols is true, though, and I've seen the gear they left behind." },
    { id = "b", text = "Go and check, then. I'll wait here and listen for the screaming.", fx = { affinity = -1 } },
  } },
  { id = "joke", text = "I'm a little impressed. One gnoll has made fools of the whole Watch.", fx = { opinion = { hogger = "admire" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "Don't let a guard hear you. I've had the same thought myself, late at night with a drink in hand." },
    { id = "b", text = "Impressed? Go and say that to the farmers he's robbed. It's only funny until he's at your door.", fx = { affinity = -1 } },
  } },
} }

P:Views { topic = "murlocs_east", views = {
  { id = "real", text = "If folk hear gurgling in the reeds, it's murlocs. Simple as that.", fx = { opinion = { murlocs_east = "believe" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "That's what I keep saying. Nothing else in Elwynn makes a noise like that, and nothing else chews nets." },
    { id = "b", text = "Most likely. They're thick down on the Westfall coast, so why not up the rivers too." },
  } },
  { id = "rumor", text = "Sounds like Remy's gossip to me. I'll believe it when I see one.", fx = { opinion = { murlocs_east = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Remy's wrong a fair bit, but not always. Two soldiers went upriver from the Eastvale bridge, and they haven't come back." },
    { id = "b", text = "Suit yourself. You'll see one soon enough if you keep walking the riverbanks at dusk." },
  } },
  { id = "clear", text = "Then someone should clear the river before they settle in.", fx = { opinion = { murlocs_east = "fight" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Somebody should, and the Watch is stretched thin as it is. Talk to Guard Thomas at the Eastvale bridge.", fx = { affinity = 1 } },
    { id = "b", text = "Before they settle in? I'd say they've had a head start, though a sharp blade still helps." },
  } },
} }

P:Views { topic = "the_collector", views = {
  { id = "catch", text = "Anyone running gold for the Defias deserves a blade, not a whisper.", fx = { opinion = { the_collector = "hunt" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Then you'd best find him before he finds out you're asking. The schedule's the only lead anyone's had." },
    { id = "b", text = "Keep your voice down when you say it, at least. Goldshire has more ears than it lets on." },
  } },
  { id = "careful", text = "I'd rather not end up on the wrong side of whoever he answers to.", fx = { opinion = { the_collector = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Wise. Men who collect gold for thieves answer to worse men, and those men keep lists." },
    { id = "b", text = "Nobody wants that, but somebody has to cut the purse strings, or the Defias will keep paying for torches." },
  } },
  { id = "follow", text = "Follow the gold and you'll find whoever's really behind the Defias.", fx = { opinion = { the_collector = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "That's the clever way to look at it. Bandits don't pay for much, so someone's buying something big with all that dust.", fx = { affinity = 1 } },
    { id = "b", text = "Maybe, but gold goes through a lot of hands. Most of them are smaller than you'd hope." },
  } },
} }

P:Views { topic = "gold_dust", views = {
  { id = "profit", text = "Gold is gold, dust or otherwise. I'd buy it cheap and sell it dear.", fx = { opinion = { gold_dust = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Spoken like Remy himself. Mind where the dust came from, though, because the Watch does." },
    { id = "b", text = "So would everyone else in Goldshire, and the only one who gets rich off it is the man in the middle." },
  } },
  { id = "suspect", text = "Too much loose gold in Elwynn. Somebody's laundering something.", fx = { opinion = { gold_dust = "distrust" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Others have said as much, quietly. Dust doesn't carry a mint mark, and that's the whole charm of it to some people." },
    { id = "b", text = "Could be, or could be miners skimming. Either way, it's not my business until it is." },
  } },
  { id = "remy", text = "Remy talks too much to be running anything crooked.", fx = { opinion = { gold_dust = "trust" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Ha! That's the kindest thing anyone's said about Remy in a year. You're probably right, too." },
    { id = "b", text = "Talkers make the best cover. I'm not saying he's crooked, only that he'd never notice if someone else was." },
  } },
} }

P:Views { topic = "northshire_abbey", views = {
  { id = "home", text = "Northshire feels like the safest place left in the kingdom.", fx = { opinion = { northshire_abbey = "admire" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "It is, and the brothers work hard to keep it so. Every recruit from there walks out a little steadier than they went in.", fx = { affinity = 1 } },
    { id = "b", text = "Safe for now. There are kobolds in the hills behind it and Defias in the vineyards, so don't get too comfortable." },
  } },
  { id = "faith", text = "The Light is strong there. You can feel it in the bells.", fx = { opinion = { northshire_abbey = "pious" }, align = { light = 1 }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "Aye, you can. I've heard grown soldiers go quiet at vespers, and I've gone quiet myself.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Scourge" }, text = "That's an odd thing to hear from you, of all people. I'll take it in the spirit it's meant." },
  } },
  { id = "soft", text = "It's a nursery for recruits. Real fighting happens elsewhere.", fx = { opinion = { northshire_abbey = "doubt" }, align = { light = -1 }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Everyone starts somewhere, {class}, and I'd wager you did too. The Abbey's trained more heroes than you've met.", fx = { affinity = -1 } },
    { id = "b", text = "Maybe so, but somebody has to teach the young ones which end of the sword to hold." },
  } },
} }

P:Views { topic = "lions_pride", views = {
  { id = "cozy", text = "Warm hearth, good stew, and a bed that doesn't move. Best inn around.", fx = { opinion = { lions_pride = "admire" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Farley would be pleased to hear it. He works harder at that hearth than most men work at anything.", fx = { affinity = 1 } },
    { id = "b", text = "It's a fine place, though you'll want to be early for the stew. The adventurers eat like wolves." },
  } },
  { id = "rowdy", text = "Too loud and too crowded. I can't hear myself think in there.", fx = { opinion = { lions_pride = "dislike" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "That's Goldshire for you, with every new recruit in the kingdom passing through. Try the corner by the stairs." },
    { id = "b", text = "Thinking's overrated in an inn. You go there to forget, not to think." },
  } },
  { id = "ears", text = "You hear everything in that common room, if you sit quietly.", fx = { opinion = { lions_pride = "curious" }, trait = { discreet = 1 } }, replies = {
    { id = "a", text = "You do, and not all of it's meant for honest ears. Plenty of the Defias talk in Elwynn starts at that bar." },
    { id = "b", text = "You sound like someone who's done it. Just don't let them catch you listening." },
  } },
} }

P:Views { topic = "maybell_tommy", views = {
  { id = "love", text = "Let them marry. Love shouldn't answer to an old family feud.", fx = { opinion = { maybell_tommy = "support" }, align = { order = -1 }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "That's what I'd say too, if I didn't have to live next to either family. Still, you're right.", fx = { affinity = 1 } },
    { id = "b", text = "You've never had to share a fence with a Stonefield, then, or a Maclure either." },
  } },
  { id = "parents", text = "They should respect their parents' wishes. The feud isn't theirs to break.", fx = { opinion = { maybell_tommy = "disapprove" }, align = { order = 1 }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Old-fashioned of you, but there are those who'd agree. The farms have run on family for generations." },
    { id = "b", text = "And keep the feud going another generation? Somebody has to be the one who stops it.", fx = { affinity = -1 } },
  } },
  { id = "sweet", text = "Secret notes and moonlit meetings. It's like something from a ballad.", fx = { opinion = { maybell_tommy = "admire" }, trait = { witty = 1 } }, replies = {
    { id = "a", text = "It is, and most ballads end badly, which is what worries me. I hope theirs doesn't." },
    { id = "b", text = "Ha! Don't tell Tommy Joe that. He's insufferable enough already." },
  } },
} }

P:Views { topic = "seven_kingdoms", views = {
  { id = "unite", text = "The seven kingdoms only ever stood when they stood together.", fx = { opinion = { seven_kingdoms = "unity" }, align = { order = 1 }, trait = { honest = 1 } }, replies = {
    { id = "a", when = { faction = "Alliance" }, text = "True, and the Alliance was the proof of it. Shame the kings all forgot as soon as the orcs were in camps.", fx = { affinity = 1 } },
    { id = "b", text = "Together, aye, and then quarreling the moment the danger passed. That's history in a nutshell, I'm afraid." },
  } },
  { id = "alterac", text = "Alterac's betrayal shows you can't trust a crown that's only looking out for itself.", fx = { opinion = { seven_kingdoms = "distrust" }, align = { order = -1 }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Perenolde sold his own allies to the Horde, so I'll not argue with you. His nobles still haunt the hills as thieves." },
    { id = "b", text = "One bad king doesn't sour the rest, though plenty of the others have tried their best to." },
  } },
  { id = "history", text = "Dry history, though I'll admit the battles hold my interest.", fx = { opinion = { seven_kingdoms = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Everyone skips to the battles. Read the treaties sometime; that's where the real knives come out." },
    { id = "b", text = "The battles are the easy part. It's the century after that nobody can get right." },
  } },
} }

P:Views { topic = "tome_of_divinity", views = {
  { id = "holy", when = { class = "PALADIN" }, text = "I mean to earn that book's wisdom, and to live up to it.", fx = { opinion = { tome_of_divinity = "devotion" }, align = { light = 2 }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "Then you've got the right of it already. The Tome asks for a life, not a reading.", fx = { affinity = 1 } },
    { id = "b", text = "Many young paladins say so. Brother Wilhelm can tell you which ones meant it, and the list is shorter." },
  } },
  { id = "respect", text = "A book that can steady a paladin's faith is a real treasure.", fx = { opinion = { tome_of_divinity = "respect" }, align = { light = 1 }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "It is, and the Church guards it like one. Not just anyone is allowed a look inside.", fx = { affinity = 1 } },
    { id = "b", text = "Well said. Faith that's never been tested isn't faith yet, and the Tome is mostly about the testing." },
  } },
  { id = "words", text = "It's just words on a page. Deeds are what matter.", fx = { opinion = { tome_of_divinity = "doubt" }, align = { light = -1 }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Deeds matter, but a man needs to know why he's doing them. That's what the words are for.", fx = { affinity = -1 } },
    { id = "b", text = "Funny, that's near enough what the Tome says too. Maybe you'd like it more than you think." },
  } },
} }

P:Views { topic = "lost_footmen", views = {
  { id = "find", text = "Someone should go upriver and bring them home, alive or not.", fx = { opinion = { lost_footmen = "duty" }, align = { honor = 1 }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Guard Thomas would be in your debt, and so would their families. Mind the murlocs in the reeds.", fx = { affinity = 1 } },
    { id = "b", text = "Alive or not, aye. Even a body gives a widow somewhere to put her flowers." },
  } },
  { id = "lost", text = "If they've been gone this long, they're dead. No sense risking more.", fx = { opinion = { lost_footmen = "write_off" }, align = { honor = -1 }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Cold, {class}, but likely true. Don't say it in front of Thomas, though, because he's still hoping.", fx = { affinity = -1 } },
    { id = "b", text = "Soldiers don't leave their own in the mud, dead or not. That's the whole point of being soldiers." },
  } },
  { id = "blame", text = "Two men sent alone up a dangerous river. That was a poor order.", fx = { opinion = { lost_footmen = "blame" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Thomas knows it, and he can barely look anyone in the eye for it. Don't make it heavier for him." },
    { id = "b", text = "It was all the men he had. The Watch has never had enough hands for Elwynn." },
  } },
} }

P:Views { topic = "eastvale", views = {
  { id = "honest", text = "Good honest work, those logging camps. Elwynn runs on that timber.", fx = { opinion = { eastvale = "respect" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "So does Stormwind, though the city never says thank you for it. The loggers will appreciate hearing it.", fx = { affinity = 1 } },
    { id = "b", text = "It does, and the quotas never shrink, even when the wolves and the gnolls grow." },
  } },
  { id = "trees", text = "They'll cut that forest down to stumps if nobody stops them.", fx = { opinion = { eastvale = "disapprove" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "There's a lot of forest, and a lot of houses to rebuild. Still, I take your point." },
    { id = "b", when = { race = "NightElf" }, text = "That sounds like a kaldorei talking, and I'll not argue. Some of those oaks were old when my grandfather was young." },
  } },
  { id = "danger", text = "Lumber camp on the edge of nowhere, with gnolls in the hills. Brave folk.", fx = { opinion = { eastvale = "admire" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Brave or stubborn, it's hard to tell the difference out there. They'd tell you it's both." },
    { id = "b", text = "Brave, and short a few men lately. If you're heading that way, they'd be glad of another blade." },
  } },
} }

-- Redridge, before the Westfall block so the order follows the road ----------

P:Views { topic = "morganth", views = {
  { id = "end", text = "A warlock who sells his skill to the Blackrock needs ending, quickly.", fx = { opinion = { morganth = "hate" }, align = { light = 1 }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Theocritus has said as much every day since Stonewatch fell under that man's sorcery, and he's earned the right.", fx = { affinity = 1 } },
    { id = "b", text = "Quickly, aye, and carefully. Warlocks never fight fair, and they rarely fight alone." },
  } },
  { id = "pity_teacher", text = "I pity his teacher. That's a hard failure to carry.", fx = { opinion = { morganth = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "That's a kind thought. Theocritus doesn't sleep well, and I think you've guessed why." },
    { id = "b", text = "Don't say failure in front of him, though. He already believes it, and that's the trouble." },
  } },
  { id = "power", when = { class = "WARLOCK" }, text = "Power isn't evil. He just chose the wrong masters to serve.", fx = { opinion = { morganth = "understand" }, align = { light = -1 }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "That's a warlock's argument, and I'll thank you not to make it near Lakeshire. Folk there lost their keep to that kind of power.", fx = { affinity = -1 } },
    { id = "b", text = "Maybe so. Just remember that every warlock who went bad said much the same, right up until the end." },
  } },
  { id = "fear", text = "Sorcery like his frightens me more than any orc's axe.", fx = { opinion = { morganth = "fear" }, align = { light = 1 }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "It should. An axe only takes your life, and a warlock can take your soul along with it." },
    { id = "b", text = "Fear's a good start. Bring a priest and something bright, and you'll outlast the ones who swagger in." },
  } },
} }

P:Views { topic = "blackrock", views = {
  { id = "drive", when = { faction = "Alliance" }, text = "The Blackrock should be driven out of Redridge for good.", fx = { opinion = { blackrock = "hate" }, align = { order = 1 }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Every soul in Lakeshire would raise a glass to that. Stonewatch is still flying their banner.", fx = { affinity = 1 } },
    { id = "b", text = "For good is a long time. They've been in those mountains since the war, and they breed faster than we bury them." },
  } },
  { id = "shame", when = { faction = "Horde" }, text = "The Blackrock are what we'd be without Thrall. They shame the Horde.", fx = { opinion = { blackrock = "shame" }, align = { honor = 1 }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Well said. They still drink the old blood and serve the old masters, and they call it strength.", fx = { affinity = 1 } },
    { id = "b", text = "They'd say we went soft. Let them say it from under their mountain, then, while we build a homeland." },
  } },
  { id = "respect", text = "Say what you like, they're disciplined fighters. I'd not underestimate them.", fx = { opinion = { blackrock = "respect" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Nobody in Redridge does, not anymore. The keep fell in one night." },
    { id = "b", when = { faction = "Horde" }, text = "They are, and that's the pity of it. All that strength wasted on a dragon's errands and a dead war." },
  } },
  { id = "talk", text = "Hate breeds hate. Maybe some of them could be reasoned with.", fx = { opinion = { blackrock = "mercy" }, align = { order = -1, light = 1 }, trait = { kind = 1 } }, replies = {
    { id = "a", when = { faction = "Alliance" }, text = "The families in Lakeshire might disagree. The Blackrock don't send envoys; they send raiding parties.", fx = { affinity = -1 } },
    { id = "b", when = { faction = "Horde" }, text = "Thrall offered them a place, and they spat on it. Some doors close from the other side." },
    { id = "c", text = "A generous thought. I hope you're never in a position to test it." },
  } },
} }

P:Views { topic = "everstill_bridge", views = {
  { id = "praise", text = "Rebuilding that bridge with orcs in the hills takes real grit.", fx = { opinion = { everstill_bridge = "admire" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Oslow would never say it himself, so I'll say it for him: thank you. That crew works under bowshot some days.", fx = { affinity = 1 } },
    { id = "b", text = "Grit, aye, and a lot of swearing. You can hear Oslow from the far bank on a calm day." },
  } },
  { id = "waste", text = "I don't see the point in rebuilding it. It'll just get knocked down again.", fx = { opinion = { everstill_bridge = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Because without it, Lakeshire is cut in half and the supply carts can't cross. You don't stop living because the orcs might come back.", fx = { affinity = -1 } },
    { id = "b", text = "Maybe it will. Then they'll build it a fourth time, and that's Redridge for you." },
  } },
  { id = "help", text = "Somebody should guard those workers so they can finish it.", fx = { opinion = { everstill_bridge = "protect" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Somebody should, and the militia's thin as it is. Talk to Marshal Marris if you mean it." },
    { id = "b", text = "Gnolls keep stealing the tools, too, so watch for that. They'll take anything that isn't nailed down, and some things that are." },
  } },
} }

P:Views { topic = "redridge_gnolls", views = {
  { id = "clear", text = "Those gnolls are the Blackrock's dogs. Cut them down and the orcs go hungry.", fx = { opinion = { redridge_gnolls = "hate" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Smart thinking. The Redridge gnolls carry, scout and steal for the orcs, so every one you drop is one less errand run." },
    { id = "b", text = "They're more than dogs, though. Some of the packs have their own chiefs and their own ideas." },
  } },
  { id = "nuisance", text = "Just mangy thieves. I can't take them seriously.", fx = { opinion = { redridge_gnolls = "contempt" }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Mangy, aye, but there's a lot of them, and they hunt in packs. Plenty of serious folk are buried under a gnoll arrow.", fx = { affinity = -1 } },
    { id = "b", text = "That's fine, until twenty of them come over the ridge at once. Then you'll take them very seriously." },
  } },
  { id = "where", text = "Something's driving them out of the hills. I'd like to know what.", fx = { opinion = { redridge_gnolls = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "The orcs, mostly. Blackrock push and gnolls run, and the farms are in the way." },
    { id = "b", text = "Good question. Verner Osgood has a theory about it, and a long one, if you've got time." },
  } },
} }

P:Views { topic = "stonewatch_keep", views = {
  { id = "retake", text = "Stonewatch has to be retaken. A kingdom can't leave its keeps to orcs.", fx = { opinion = { stonewatch_keep = "retake" }, align = { order = 1 }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "That's what Marris says, every morning, to anyone who'll listen. He'd say it to you twice if you let him.", fx = { affinity = 1 } },
    { id = "b", text = "Retaken with what? Stormwind's sent no army, and the militia couldn't take back a henhouse.", fx = { affinity = -1 } },
  } },
  { id = "crown", text = "Stormwind should've sent soldiers. Redridge was left to fend for itself.", fx = { opinion = { stonewatch_keep = "abandoned" }, align = { order = -1 }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Aye, it was, and the court calls it taken, not lost, as if that's a comfort. Lakeshire knows better." },
    { id = "b", when = { faction = "Alliance" }, text = "Careful, {g:lad|lass}. The crown has a hundred fires to put out, and Redridge is only one of them." },
  } },
  { id = "fortress", text = "Whoever built that keep built it well. It'll be hard to take back.", fx = { opinion = { stonewatch_keep = "respect" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "That's the bitter joke of it. We built it to keep orcs out, and now it keeps us out instead." },
    { id = "b", text = "Hard, aye, but not impossible. Every fortress has a weak door, and somebody always knows where it is." },
  } },
} }

P:Views { topic = "keeshan", views = {
  { id = "hero", text = "Escaping the Blackrock on his own makes that man a hero, plain and simple.", fx = { opinion = { keeshan = "admire" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "He'd tell you he was just too stubborn to die, and I've never found much difference between that and courage.", fx = { affinity = 1 } },
    { id = "b", text = "He'd tell you otherwise, and loudly. The 12th Sabre has always been proud of its loud ones." },
  } },
  { id = "soldier", text = "He did what any good soldier would. I'd expect no less.", fx = { opinion = { keeshan = "respect" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "High standards, {class}. Most good soldiers end up dead in that situation, and he didn't." },
    { id = "b", text = "True, and that's the best compliment you could give him. He doesn't care for fuss." },
  } },
  { id = "lucky", text = "Lucky more than brave, I'd say. Most men in his boots died.", fx = { opinion = { keeshan = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Luck's part of it. Don't say so to his face, though, unless you want to hear the whole escape again.", fx = { affinity = -1 } },
    { id = "b", text = "Luck favors the stubborn, and he's the most stubborn man in Redridge." },
  } },
} }

-- Westfall --------------------------------------------------------------------

P:Views { topic = "westfall", views = {
  { id = "abandoned", text = "Stormwind turned its back on Westfall. The farmers were left to starve.", fx = { opinion = { westfall = "abandoned" }, align = { order = -1 }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "They were, and Gryan Stoutmantle's militia is the only answer anyone gave them. The House of Nobles sent letters.", fx = { affinity = 1 } },
    { id = "b", when = { faction = "Alliance" }, text = "Hard words, and not all wrong. Still, the regent has a whole kingdom to feed, not one province." },
  } },
  { id = "patience", text = "The crown will set it right in time. People need patience.", fx = { opinion = { westfall = "patience" }, align = { order = 1 }, trait = { patient = 1 } }, replies = {
    { id = "a", text = "Patience is easy to ask of people who aren't hungry. I hope you're right, though, for their sake." },
    { id = "b", text = "In time, aye, but the Defias won't wait, and neither will the harvest watchers.", fx = { affinity = -1 } },
  } },
  { id = "help", text = "Then the people should help themselves. That's what the militia is for.", fx = { opinion = { westfall = "self_reliance" }, align = { order = -1 }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Gryan Stoutmantle couldn't have put it better. Sentinel Hill is proof that farmers can hold a line when they have to." },
    { id = "b", text = "Helping themselves is how some of them ended up Defias. It cuts both ways." },
  } },
  { id = "dust", text = "Dust, scarecrows and bandits. I don't see what's left worth saving.", fx = { opinion = { westfall = "contempt" }, trait = { cruel = 1 } }, replies = {
    { id = "a", text = "People, {class}. That's what's left worth saving, and there are still plenty of them out there.", fx = { affinity = -1 } },
    { id = "b", text = "It was Stormwind's breadbasket once. Give it a few good harvests and it'll be again." },
  } },
} }

P:Views { topic = "people_militia", views = {
  { id = "admire", text = "Farmers who picked up swords to protect their own. I admire that.", fx = { opinion = { people_militia = "admire" }, align = { honor = 1, order = -1 }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "So do I. Stoutmantle took men who'd never held a spear and made them hold the hill.", fx = { affinity = 1 } },
    { id = "b", text = "They'd rather be holding hoes, though. Nobody joins the militia because they want to." },
  } },
  { id = "vigilante", text = "Armed peasants with no royal charter. That's how rebellions start.", fx = { opinion = { people_militia = "distrust" }, align = { order = 1 }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Some of the nobles say so, oddly enough, about the only people in Westfall actually fighting the Defias.", fx = { affinity = -1 } },
    { id = "b", text = "They've had no help from the crown, so where would the charter come from? Still, I take your point about rebellions." },
  } },
  { id = "help", text = "They're stretched thin. I'll lend Sentinel Hill my blade.", fx = { opinion = { people_militia = "support" }, align = { honor = 1 }, trait = { generous = 1 } }, replies = {
    { id = "a", text = "Then go to Gryan Stoutmantle and tell him so. He never turns down a willing hand.", fx = { affinity = 1 } },
    { id = "b", text = "Good. The hill could use people who know which end of the blade is sharp." },
  } },
} }

P:Views { topic = "harvest_watchers", views = {
  { id = "unnatural", text = "Scarecrows that walk aren't natural. Someone built them for a reason.", fx = { opinion = { harvest_watchers = "distrust" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Someone did, and the Defias have a lot of goblins on the payroll lately. Make of that what you will." },
    { id = "b", text = "That's the question nobody can answer. They just appeared one season and started taking the crops." },
  } },
  { id = "scrap", text = "Machines break. I'll smash them for scrap and call it a day.", fx = { opinion = { harvest_watchers = "contempt" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Farmer Saldean would thank you. Mind the scythes, though; they swing harder than they look." },
    { id = "b", text = "Scrap's good money, too, if you can find someone who'll buy it without asking where it came from." },
  } },
  { id = "creepy", text = "I hate walking past them at dusk. Something's watching through those eyes.", fx = { opinion = { harvest_watchers = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "You're not the only one. The farmers say they move when your back's turned, and I half believe them." },
    { id = "b", text = "Then don't walk past them at dusk. Simplest advice I'll give you today." },
  } },
} }

P:Views { topic = "riverpaw", views = {
  { id = "fight", text = "Those gnolls raid every farm they can reach. They need driving off.", fx = { opinion = { riverpaw = "hate" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Captain Danuvin would agree, and he'd hand you a list of where to start.", fx = { affinity = 1 } },
    { id = "b", text = "Driving them off is the easy part. Keeping them off with so many farms standing empty is another matter." },
  } },
  { id = "opportunist", text = "Just scavengers picking at a dying province. Like the Defias, really.", fx = { opinion = { riverpaw = "contempt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Bleak, but true enough. Every hungry thing in the kingdom smells Westfall's weakness." },
    { id = "b", text = "Don't lump them together in front of a farmer. The Defias were neighbors once; the gnolls never were." },
  } },
  { id = "careful", text = "They hit hard for gnolls. I've seen their brutes up close.", fx = { opinion = { riverpaw = "respect" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Then you've been lucky. Their taskmasters are worse, and they never come alone." },
    { id = "b", text = "They do. Go in pairs, and watch the ridgelines for archers." },
  } },
} }

P:Views { topic = "moonbrook", views = {
  { id = "sad", text = "A whole town gone to the Defias. That breaks my heart.", fx = { opinion = { moonbrook = "pity" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Mine too. It was a good little town once, with a smithy and a town hall and children in the lanes.", fx = { affinity = 1 } },
    { id = "b", text = "The towns that come back are the ones folk refuse to give up on, and Westfall's farmers are a stubborn lot." },
  } },
  { id = "nest", text = "Moonbrook is the Defias nest. Burn it out and the head goes with it.", fx = { opinion = { moonbrook = "hate" }, align = { light = -1 }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Burn it and you'll burn good houses for nothing. Whatever they're hiding, it isn't sitting on the surface.", fx = { affinity = -1 } },
    { id = "b", text = "Hard talk. There's something under that town, though, and the fire wouldn't reach it." },
  } },
  { id = "retake", text = "It should be taken back and rebuilt for the farmers who lost it.", fx = { opinion = { moonbrook = "retake" }, align = { light = 1 }, trait = { generous = 1 } }, replies = {
    { id = "a", text = "Taken back, aye, and the Defias rooted out first. Stoutmantle's been dreaming of it for years.", fx = { affinity = 1 } },
    { id = "b", text = "Rebuilt with whose coin? Still, I'd like to see it, before I'm too old to care." },
  } },
} }

P:Views { topic = "old_blanchy", views = {
  { id = "sweet", text = "Old Blanchy deserves her oats. A faithful horse is a treasure.", fx = { opinion = { old_blanchy = "admire" }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Verna would hug you for saying so. That old mare's carried their whole life on her back.", fx = { affinity = 1 } },
    { id = "b", text = "She is, and she knows it, too. Stubborn as a dwarf about her feed." },
  } },
  { id = "glue", text = "Times are hard. A horse that old should go to the knacker.", fx = { opinion = { old_blanchy = "practical" }, trait = { cruel = 1 } }, replies = {
    { id = "a", text = "Don't you dare say that near Verna Furlbrow. She'd sooner sell the wagon than the horse.", fx = { affinity = -1 } },
    { id = "b", text = "Practical, maybe, but folk who've lost everything else hold on to what's left. You'd do the same." },
  } },
  { id = "symbol", text = "If they can keep that horse fed, Westfall isn't beaten yet.", fx = { opinion = { old_blanchy = "hope" }, trait = { patient = 1 } }, replies = {
    { id = "a", text = "That's a kind way of looking at it. I think Verna sees it just the same.", fx = { affinity = 1 } },
    { id = "b", text = "Not beaten, no, but hungry. Oats cost dear in Westfall since the harvest watchers came." },
  } },
} }

-- Zephras Isle ------------------------------------------------------------------

P:Views { topic = "al_aketh", views = {
  { id = "root_out", text = "Cultists who'd hand a people to Al'Akir must be rooted out.", fx = { opinion = { al_aketh = "hate" }, align = { order = 1 }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Agreed, and quickly. If you ever see grey robes and shaved heads, report them before you do anything else.", fx = { affinity = 1 } },
    { id = "b", text = "Rooted out, aye, though they hide well among ordinary folk. That's what makes cults so dangerous." },
  } },
  { id = "understand", text = "Their patrons abandoned them. I understand why some turned to the Windlord.", fx = { opinion = { al_aketh = "understand" }, align = { order = -1 }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Understanding isn't excusing, I hope. That cult nearly called the Windlord down on all of them.", fx = { affinity = -1 } },
    { id = "b", text = "Frightened people grab the nearest strength. It's an old story, and it never ends well." },
  } },
  { id = "fear", text = "If Al'Akir ever answers their call, we'll all regret it.", fx = { opinion = { al_aketh = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "That's what the High Elder thinks too, though she believes it might take years. I'd not count on years." },
    { id = "b", text = "Then let's make sure he never hears it. The Kirin Tor and the Earthen Ring both stood against the cult once." },
  } },
} }

P:Views { topic = "two_orders", views = {
  { id = "high_order", when = { faction = "Alliance" }, text = "The High Order chose the arcane and the Alliance. I think they chose well.", fx = { opinion = { two_orders = "high_order" }, align = { order = 1 }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Dalaran seems to think so, and they've made the Sky Enclave welcome. Time will tell the rest.", fx = { affinity = 1 } },
    { id = "b", text = "Chose well for themselves, perhaps. I'd not say so too loudly near their cousins." },
  } },
  { id = "windshapers", when = { faction = "Horde" }, text = "The Windshapers honor the spirits. That's a path the Horde understands.", fx = { opinion = { two_orders = "windshapers" }, align = { order = -1 }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "It is. The Earthen Ring brought them to us, and Thunder Bluff vouched for them, and that's enough for me.", fx = { affinity = 1 } },
    { id = "b", text = "We understand the spirits, aye. Whether the spirits understand them is another matter, since their own spirits went quiet." },
  } },
  { id = "mend", text = "One people split in two by a quarrel. They should make peace.", fx = { opinion = { two_orders = "reconcile" }, align = { light = 1 }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Easier said than done, with deaths and sacred sites between them. Family quarrels are the bitterest kind." },
    { id = "b", text = "A kind thought. Most kingdoms on Azeroth haven't managed it either, so they'll be in good company." },
  } },
  { id = "watch", text = "A feud like that will spill into our wars sooner or later.", fx = { opinion = { two_orders = "distrust" }, align = { light = -1 }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "It already has, from what I hear. Keep an eye on both of them, and on your own back." },
    { id = "b", text = "Cynical, but likely right. Neither side will pass up a chance to settle the score." },
  } },
} }

P:Views { topic = "shal_nan", views = {
  { id = "return", text = "A leader who led a people out of ruin. I hope the Shal'nan returns.", fx = { opinion = { shal_nan = "hope" }, trait = { patient = 1 } }, replies = {
    { id = "a", text = "So do many of them, I'm told. They still speak the name softly, like a prayer.", fx = { affinity = 1 } },
    { id = "b", text = "Leaders rarely come back the way they left. Still, it's a fine thing to hope for." },
  } },
  { id = "abandon", text = "Walking away from your people in a crisis is no kind of leadership.", fx = { opinion = { shal_nan = "doubt" }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Some of them grumble that too, though never loudly. Others would say the Shal'nan had reasons we can't see.", fx = { affinity = -1 } },
    { id = "b", text = "Nobody knows if it was walking away or being taken. That's the bitter part." },
  } },
  { id = "mystery", text = "A golden mask and a vanishing. That's a story I'd like to finish.", fx = { opinion = { shal_nan = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "You and every scholar in Dalaran, I imagine. Bring me the ending if you find it." },
    { id = "b", text = "Careful. Some stories don't like being finished by strangers." },
  } },
} }

P:Views { topic = "windstones", views = {
  { id = "useful", text = "Power and coin in one stone. That's clever.", fx = { opinion = { windstones = "admire" }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "Clever until the pylons fail, and then it's a pocket full of pretty rocks. Still, I'd take a few." },
    { id = "b", text = "It is. A goblin would sell his own grandmother for the secret of making them." },
  } },
  { id = "trade", text = "I'd take windstones over gold, if I could find a buyer.", fx = { opinion = { windstones = "profit" }, trait = { greedy = 1 } }, replies = {
    { id = "a", text = "Buyers are easy. Honest buyers are the trick, and men have killed Peacekeepers for less." },
    { id = "b", text = "You'll find one, but keep them out of sight on the road. Shiny things draw knives." },
  } },
  { id = "sacred", text = "Feels wrong to spend something tied to the wind spirits like copper.", fx = { opinion = { windstones = "respect" }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "A thoughtful way to see it, and the Windshapers would thank you for it.", fx = { affinity = 1 } },
    { id = "b", text = "Folk have to eat, though, and a full belly doesn't ask where the coin came from." },
  } },
} }

-- Duskwood ---------------------------------------------------------------------

P:Views { topic = "night_watch", views = {
  { id = "honor", text = "Volunteers holding lamps against the dark. That's the bravest thing I've seen.", fx = { opinion = { night_watch = "admire" }, align = { honor = 1 }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Commander Ebonlocke would be glad to hear it. They don't get thanked often, and they're rarely paid.", fx = { affinity = 1 } },
    { id = "b", text = "Brave, and outnumbered. Most of them have buried someone they patrolled with." },
  } },
  { id = "useless", text = "Waiting behind lamps won't win anything. Somebody has to hunt the evil down.", fx = { opinion = { night_watch = "doubt" }, align = { order = -1 }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "That's what Calor and the Carevins say in Darkshire. Maybe you're right, but someone has to keep the lamps lit while the hunters hunt.", fx = { affinity = -1 } },
    { id = "b", text = "Hunting's fine, if you come back. The Watch is still here every morning, which is more than the hunters can say." },
  } },
  { id = "join", text = "They need more blades. I'll stand a watch with them.", fx = { opinion = { night_watch = "support" }, align = { order = 1 }, trait = { generous = 1 } }, replies = {
    { id = "a", text = "Then go and see Althea Ebonlocke. She takes help from anyone who doesn't flinch at shadows.", fx = { affinity = 1 } },
    { id = "b", text = "Good, though they'll test you. Every new face in Darkshire is suspected of something." },
  } },
} }

P:Views { topic = "worgen", views = {
  { id = "beasts", text = "Monsters, plain and simple. Kill them before they kill us.", fx = { opinion = { worgen = "hate" }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Plain enough, and there's no shame in it. Bring silver if you can, and never walk Brightwood Grove alone." },
    { id = "b", text = "Simple until you meet one. They're smarter than wolves, and crueler." },
  } },
  { id = "source", text = "They didn't come from nowhere. Something in these woods made them.", fx = { opinion = { worgen = "curious" }, trait = { curious = 1 } }, replies = {
    { id = "a", text = "Calor says they come out of thin air, and he's tracked them longer than anyone. Find where they start and you'll find the rot." },
    { id = "b", text = "Careful asking that around Darkshire. Folk who dig into it tend to go missing in the woods." },
  } },
  { id = "fear", text = "I've heard them howling at night. I'd rather not hear it closer.", fx = { opinion = { worgen = "fear" }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "That's wisdom, not cowardice. Stay on the road and keep a fire going, and you'll likely see morning." },
    { id = "b", text = "Nobody would, but the howls are getting closer every month. One day you'll have to face them." },
  } },
} }

P:Views { topic = "stalvan", views = {
  { id = "evil", text = "A man who murders out of obsession earns no pity, alive or dead.", fx = { opinion = { stalvan = "hate" }, align = { light = 1 }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "Tavernkeep Smitts would agree, and he's chased that story half his life. Some evil doesn't stay buried." },
    { id = "b", text = "Hard words, but fair. The dead he left behind would say the same." },
  } },
  { id = "tragedy", text = "A tutor driven mad by love. There's sorrow in it as well as horror.", fx = { opinion = { stalvan = "pity" }, align = { light = -1 }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Sorrow, aye, but don't let it soften you. He chose the axe, and others paid for his sorrow.", fx = { affinity = -1 } },
    { id = "b", text = "A generous view. Madame Eva, the fortune teller, sees it the same, I think, which is why her cards go dark when his name comes up." },
  } },
  { id = "legend", text = "It's an old ghost story. People tell it to frighten children.", fx = { opinion = { stalvan = "doubt" }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Children, and grown men who should know better. Go out to the old manor at night and see if you still call it a story." },
    { id = "b", text = "Some stories are told because they're true. Ask the people who went missing near the Mistmantle house." },
  } },
} }

P:Views { topic = "carevins", views = {
  { id = "hunters", text = "Hunting evil instead of waiting for it. That's the right way.", fx = { opinion = { carevins = "admire" }, align = { order = -1 }, trait = { brave = 1 } }, replies = {
    { id = "a", text = "Jonathan Carevin would shake your hand for that. Calor too, and he doesn't shake hands with just anyone.", fx = { affinity = 1 } },
    { id = "b", text = "Right, or reckless. The Night Watch would tell you hunters leave the town unguarded." },
  } },
  { id = "zealots", text = "They sound more like zealots than heroes. That worries me.", fx = { opinion = { carevins = "distrust" }, align = { order = 1 }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "They'd call it faith. 'Trust none who won't aid our cause' is a hard creed to live next to, though.", fx = { affinity = -1 } },
    { id = "b", text = "Maybe so, but zealots are useful in a place like this. The question is what they do when the monsters run out." },
  } },
  { id = "light", text = "They fight for the Light and feed those who help. That's decent.", fx = { opinion = { carevins = "respect" }, align = { light = 1 }, trait = { pious = 1 } }, replies = {
    { id = "a", text = "It is. Elaine Carevin sends supplies to people the town has forgotten, and that counts for a lot.", fx = { affinity = 1 } },
    { id = "b", when = { race = "Scourge" }, text = "Kind words, {class}, though I'd not let them see you too closely if I were you. Their creed covers the undead." },
  } },
  { id = "secret", text = "A family that keeps its own counsel is hiding something.", fx = { opinion = { carevins = "suspicion" }, align = { light = -1 }, trait = { skeptical = 1 } }, replies = {
    { id = "a", text = "Everyone in Darkshire is hiding something, {class}. It's that sort of town." },
    { id = "b", text = "Maybe, though in Duskwood privacy is how you stay alive. I'd not read too much into it." },
  } },
} }

P:Views { topic = "ladimore", views = {
  { id = "rest", text = "A good knight broken by grief. He deserves to be laid to rest.", fx = { opinion = { ladimore = "pity" }, align = { light = 1 }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "He does, and those who knew him before the war say so too. Sirra Von'Indi, the town's historian, still keeps his story.", fx = { affinity = 1 } },
    { id = "b", text = "Laid to rest, aye. He's killed watchmen since, though, so don't let pity slow your hand." },
  } },
  { id = "murderer", text = "Grief or not, he killed. That makes him a murderer.", fx = { opinion = { ladimore = "condemn" }, align = { light = -1 }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "It does, and the dead stay dead whatever his reasons. Still, it's a sad thing to say of one of Uther's knights." },
    { id = "b", text = "Spoken plainly. Most in Darkshire can't bring themselves to say it so bluntly.", fx = { affinity = -1 } },
  } },
  { id = "warning", text = "That could be any soldier coming home. War breaks people.", fx = { opinion = { ladimore = "warning" }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "It could. That's why folk tell the story, I think, and why they don't tell it lightly." },
    { id = "b", text = "It does, and it'll keep doing it. Mind your own heart when you come back from the woods." },
  } },
} }

-- Gnomes and dwarves ------------------------------------------------------------

P:Views { topic = "gnomeregan", views = {
  { id = "retake", when = { race = "Gnome" }, text = "We'll take Gnomeregan back. I won't die a refugee in Tinker Town.", fx = { opinion = { gnomeregan = "retake" }, align = { order = 1 }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "That's the spirit Mekkatorque is counting on. Every gnome in Ironforge says it, and one day it'll be true.", fx = { affinity = 1 } },
    { id = "b", text = "Brave words. Just remember how many walked out of that city and how many didn't." },
  } },
  { id = "tragedy", text = "A whole city lost in a single night. That's a terrible thing.", fx = { opinion = { gnomeregan = "pity" }, align = { light = 1 }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "Terrible, and still in their eyes, if you look. Tinker Town's full of gnomes who left everything behind.", fx = { affinity = 1 } },
    { id = "b", text = "It was, and the radiation means nobody can even go back for the dead." },
  } },
  { id = "fault", text = "Flooding your own city with radiation. That was a reckless plan.", fx = { opinion = { gnomeregan = "blame" }, align = { light = -1 }, trait = { honest = 1 } }, replies = {
    { id = "a", text = "Reckless, aye, but what else was there? The troggs would have taken the whole city anyway.", fx = { affinity = -1 } },
    { id = "b", text = "Don't say it in Tinker Town. They know it better than you do." },
  } },
  { id = "traitor", text = "Thermaplugg sold out his own people. He should answer for that.", fx = { opinion = { gnomeregan = "hate" }, align = { order = 1 }, trait = { stern = 1 } }, replies = {
    { id = "a", text = "He should, and the gnomes say so every day. Some of them would give their right hand for a shot at him." },
    { id = "b", text = "Answer for it he will, one day. The question is whether there'll be any city left to save by then." },
  } },
} }

P:Views { topic = "dark_iron", views = {
  { id = "dwarf_feud", when = { race = "Dwarf" }, text = "The Dark Irons have been our curse since Thaurissan. I'll see them pay.", fx = { opinion = { dark_iron = "hate" }, align = { order = 1 }, trait = { proud = 1 } }, replies = {
    { id = "a", text = "Aye, every Bronzebeard alive has a grudge with them, and most have two. Magni would raise a mug to that.", fx = { affinity = 1 } },
    { id = "b", text = "They'll pay, aye, but they've paid before and still they come. That's the trouble with a feud this old." },
  } },
  { id = "threat", text = "Fire-worshipping dwarves under the mountain. They're the real danger.", fx = { opinion = { dark_iron = "fear" }, align = { light = 1 }, trait = { cautious = 1 } }, replies = {
    { id = "a", text = "Not many outside Ironforge see it, but you're right. They serve something hot and old down there." },
    { id = "b", text = "They're dangerous, aye, though the Blackrock orcs are the ones with the armies." },
  } },
  { id = "kin", text = "They're dwarves too. Maybe some of them would welcome peace.", fx = { opinion = { dark_iron = "mercy" }, align = { order = -1 }, trait = { kind = 1 } }, replies = {
    { id = "a", text = "That's a generous heart talking. The Dark Irons have answered every handshake with a knife, though.", fx = { affinity = -1 } },
    { id = "b", text = "Maybe, one day, but not this one. They'd laugh you right out of Blackrock Depths, if they didn't burn you first." },
  } },
  { id = "skill", text = "Whatever else they are, Dark Iron smithing is the finest I've seen.", fx = { opinion = { dark_iron = "respect" }, align = { order = -1 }, trait = { practical = 1 } }, replies = {
    { id = "a", text = "It's fine work, though there's blood in every rivet. They learned it at the same forge we did." },
    { id = "b", when = { race = "Dwarf" }, text = "Don't say that so loud in the Commons, {g:lad|lass}. Admiring their craft is next to treason around here.", fx = { affinity = -1 } },
  } },
} }
