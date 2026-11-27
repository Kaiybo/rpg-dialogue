-- Letters from Alliance folk you've met (0.107.0): mostly random, a few sent by an event,
-- with their own replies and the follow-ups some replies bring. Follow-ups have no `when`
-- and no `random`: only a reply's fx.letter sends them.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Elwynn Forest
---------------------------------------------------------------------------
P:Letter {
  id = "al_mcbride_recruit", npc = "mcbride", delay = 2400,
  when = { faction = "Alliance", race = "Human", minLevel = 12 },
  subject = "From the Abbey gate",
  body = "{name},\n\nThe gryphon riders tell me you've been seen as far as Lakeshire, and that you've stopped tripping over your own feet when you draw your weapon, which is more than I can say for this season's recruits. I keep a list in my desk drawer of everyone who walked out of Northshire's gate. A good many of the names have a line through them by now, one way or another, so I like to write a few words beside the ones that don't.\n\nThe kobolds are digging in Echo Ridge again, the Blackrock still send scouts down from the hills to see whether we're watching, and Brother Paxton has started calling me \"old man\" when he thinks I can't hear him. Nothing has changed here, in other words, except you.\n\nKeep your guard up and your feet under you, recruit.\n\nMarshal McBride, Northshire Abbey",
  replies = {
    { id = "shield", text = "Tell him I still stand the way he taught me, shield first.", fx = { affinity = 1 } },
    { id = "drawer", text = "Ask him to keep a line off my name a while longer.", fx = { affinity = 1, npcFlag = { set = "al_mcbride_wrote" } } },
    { id = "cold", text = "Remind him I'm no recruit now, and I don't need watching.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_paxton_linen", npc = "paxton", random = true, when = { faction = "Alliance", minLevel = 8 },
  subject = "Rolling linen",
  body = "{name},\n\nBrother Sammuel and I were rolling bandages this morning, and he asked whether I remembered the recruit who came back from the vineyards with a Defias bootprint on {g:his|her} back. I told him I remember all of them, which is true, and which is also the trouble with this work.\n\nThe Abbey is quiet. The novices pray, the recruits bleed, I mend them, and in the evening the bell rings a little late because Brother Neals has been down in the cellar again. I say your name at the evening service along with the others who have gone out into the world. You need not believe it helps you, because I find that it helps me.\n\nWalk in the Light, and if you can't manage that, at least walk carefully.\n\nBrother Paxton, Northshire Abbey",
  replies = {
    { id = "bootprint", text = "Tell him the bootprint washed out, though the bruise took a fortnight.", fx = { affinity = 1 } },
    { id = "priest", text = "Tell him I say the Abbey's name at my own evening prayers.", when = { class = "PRIEST" }, fx = { affinity = 1, npcFlag = { set = "al_paxton_prayers" } } },
    { id = "save", text = "Thank him, but ask him to save his prayers for the new recruits.", fx = {} },
  },
}

P:Letter {
  id = "al_maybell_river", npc = "maybell", random = true, when = { faction = "Alliance", minLevel = 8 },
  subject = "Please don't tell Pa",
  body = "{name},\n\nI'm writing this down by the river with the inkpot balanced on a fence post, so forgive the blots. Pa thinks I'm counting grapes, and I did count them, all of them, twice, and then I sat here a while longer to see if anyone happened to walk by on the far bank. Nobody did. Well, a heron did, but I don't think that counts.\n\nMr. Pestle says I'm not to ask him for anything clever out of his bottles again, and I suppose he's right, though it worked beautifully for an afternoon. I keep thinking that if the Stonefields and the Maclures can't remember what the feud was even about, then surely it can't go on forever. Is that foolish of me? You've been all over the world, so you must know whether things like this ever end.\n\nPlease don't tell Pa I wrote to you. He'd only ask why, and I'm a terrible liar.\n\nMaybell Maclure",
  replies = {
    { id = "warm", text = "Tell her the feud will die before Tommy Joe stops waiting by the river.", fx = { affinity = 1, letter = "al_maybell_hope" } },
    { id = "cold", text = "Tell her a sensible girl would listen to her father.", fx = { affinity = -1, letter = "al_maybell_stiff" } },
    { id = "secret", text = "Promise her I'll say nothing to Pa Maclure about the river.", fx = { npcFlag = { set = "al_maybell_secret" } } },
  },
}

P:Letter {
  id = "al_maybell_hope", npc = "maybell", delay = 3600,
  subject = "The far bank",
  body = "{name},\n\nI read your letter three times and then hid it inside my boot, which is the only place in the house Pa never looks. You're the first person who hasn't told me to be patient, or to be sensible, or to think of the family, and I nearly cried on the grapes.\n\nAnd guess what? Gramma Stonefield came all the way down to the river on her own two feet, with her stick and her shawl, and stood on the far bank and waved at me. She didn't say a word, only waved, and then she went home again. I don't know what it means, but Tommy Joe says that when Gramma decides something, the whole family follows eventually, even if it takes them a year to notice they've moved.\n\nThank you, and I mean it with all my heart.\n\nMaybell",
  replies = {
    { id = "gramma", text = "Tell her Gramma Stonefield is plainly on her side, and scheming.", fx = { affinity = 1 } },
    { id = "careful", text = "Tell her to keep the letters out of her boots.", fx = {} },
  },
}

P:Letter {
  id = "al_maybell_stiff", npc = "maybell", delay = 3600,
  subject = "You were right, I expect",
  body = "{name},\n\nThank you for your letter. I expect you're right, and I expect Pa is right, and Ma, and Joshua, and everyone else who has told me the same thing since I was old enough to look over the fence.\n\nI've finished counting the grapes and I don't go down to the river now, except when the washing needs doing, which is every day, so I suppose I still go down to the river. I just don't look across it.\n\nI won't trouble you again.\n\nMaybell Maclure",
}

P:Letter {
  id = "al_gramma_needles", npc = "gramma", random = true, when = { faction = "Alliance", minLevel = 10 },
  subject = "Needles and nonsense",
  body = "Dear,\n\nI'm knitting, which is what old women are supposed to do, and it keeps my hands still while my mind gets on with the real work. The real work this week has been watching my grandson stand by the river as though he's been planted there, and watching that Maclure girl across the water pretending to count grapes for the third hour running. Light give me strength, the pair of them are about as subtle as a bull in a bakery.\n\nThe Maclures and my lot have been at each other's throats since before my husband died, and if you asked any of them why, you'd get six answers and a fistfight. I'm too old for it, and I've decided I'll not go to my grave with it still going on. That's all I'll say, in case this letter gets read by the wrong eyes.\n\nWrap up warm wherever you are. You never do.\n\nGramma Stonefield",
  replies = {
    { id = "wear", text = "Tell her I'd wear anything she knitted, even in Stranglethorn.", fx = { affinity = 1, letter = "al_gramma_scarf" } },
    { id = "scheme", text = "Ask her plainly what she's scheming, since she's plainly scheming.", fx = { affinity = 1, npcFlag = { set = "al_gramma_asked" } } },
    { id = "none", text = "Tell her the feud is none of my business anymore.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_gramma_scarf", npc = "gramma", delay = 5400,
  subject = "Measure your neck",
  body = "Dear,\n\nStranglethorn, you said, and I had to have Ma find it on the map, and then I had to sit down. You'll wear what I knit, will you? Then I'll hold you to it, and you'll have a scarf whether the jungle likes it or not. I've chosen a sensible brown because it won't show the mud, and it's the colour of good Elwynn soil, so you'll have a bit of home round your neck wherever you go.\n\nI can't send it, of course, so it'll be on the peg by the door, and if you're ever by the farm you can try it on and tell me it's lovely. You needn't mean it.\n\nI've had a word with somebody by the river, by the way. Nobody you'd know.\n\nGramma Stonefield",
}

P:Letter {
  id = "al_pestle_bottles", npc = "pestle", random = true, when = { faction = "Alliance", minLevel = 6 },
  subject = "About the green bottle",
  body = "{name},\n\nGood day to you, good day! I'm writing to every customer of the last season, so don't feel singled out, because a small green bottle with a cork that whistles has gone missing from my back shelf, and I should very much like to know where it went. It isn't poisonous, exactly. It's more that it makes things go somewhere else for a while, and some of those things haven't come back.\n\nOtherwise all is well. The kobolds are still bringing their candles up out of the Jasperlode, the kind folk of Goldshire are still buying them from me to light their windows, and I have stopped asking what the wax is made of, for my own peace.\n\nIf you didn't take the bottle, please disregard this letter, and do come in for a drink, only not the green one.\n\nWilliam Pestle, Goldshire",
  replies = {
    { id = "not_me", text = "Tell him I've never touched his green bottle, on my honour.", fx = { affinity = 1 } },
    { id = "maybell", text = "Hint that a certain young lady by the river might know.", fx = { npcFlag = { set = "al_pestle_hint" } } },
  },
}

---------------------------------------------------------------------------
-- Westfall
---------------------------------------------------------------------------
P:Letter {
  id = "al_heather_grit", npc = "heather", random = true, when = { faction = "Alliance", minLevel = 12 },
  subject = "Your blankets",
  body = "{name},\n\nI shook the grit out of your blankets the morning you left and folded them on the end of the bed, and by supper the dust had blown in under the door and found them again. That's Westfall for you. The militia sleep in their boots, the wind sleeps in everything else, and I've stopped sweeping the steps because the steps prefer it the other way.\n\nThings are as they were. Quartermaster Lewis is counting arrows he doesn't have, Salma sent up a pot of stew that the lads finished before I'd taken my apron off, and a boy came in last week with a red bandana in his pocket and his eyes on the floor. I fed him anyway. I've known his mother twenty years.\n\nCome and dust off by the fire when you're passing. The bed's yours.\n\nHeather, the inn at Sentinel Hill",
  replies = {
    { id = "hard", text = "Tell her the Defias made their choice, and nobody owes them supper.", fx = { affinity = -1, opinion = { defias = "hardline" } } },
    { id = "mercy", text = "Tell her she was right to feed him, bandana or no.", fx = { affinity = 1, opinion = { defias = "mercy" } } },
    { id = "bed", text = "Ask her to keep the bed made, grit and all.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "al_furlbrow_watch", npc = "furlbrow", random = true, when = { faction = "Alliance", minLevel = 10 },
  subject = "Still minding the place",
  body = "{name},\n\nVerna says I'm to write and tell you we're well, so here I am, telling you. We are well, or as well as two old people can be in a farmhouse that isn't theirs, minding it for folk who aren't coming back. I wind the watch every morning, the one you brought home, and Verna laughs at me for it, but she always asks the time afterwards.\n\nOld Blanchy is slower than she was. She still waits by the wagon at dawn as though we'll be hitching her up for the market at any moment, and I haven't the heart to tell her there's nothing left to take. The pumpkins up at our old place will have rotted on the vine by now, unless somebody's eating them, and I've a fair idea who.\n\nGive our regards to anyone kind you meet on the road. There seem to be fewer every year, so you'll not be kept long.\n\nFarmer Furlbrow, and Verna",
  replies = {
    { id = "blanchy", text = "Tell him to give Old Blanchy an apple from me.", fx = { affinity = 1, letter = "al_furlbrow_blanchy" } },
    { id = "watch", text = "Tell him to keep winding the watch, every single morning.", fx = { affinity = 1 } },
    { id = "farm", text = "Tell him I'll look in on the pumpkin farm when I pass.", fx = { npcFlag = { set = "al_furlbrow_farm" } } },
  },
}

P:Letter {
  id = "al_furlbrow_blanchy", npc = "furlbrow", delay = 4500,
  subject = "One apple, delivered",
  body = "{name},\n\nWe hadn't an apple in the house, as it happens, so Verna walked all the way over to the Saldeans and traded Salma two eggs for one, which I'd say makes it the most expensive apple in Westfall. I gave it to Old Blanchy and told her it was from you.\n\nShe ate it, core and all, then stood with her nose in my coat pocket for a good long while in case there was another. Verna says that's the happiest she's seen the old girl since we left the farm, and then Verna went inside rather quickly, and I didn't follow her, because a man knows when to stay out by the wagon.\n\nThank you, friend. It was only an apple, but we don't get many of those.\n\nFarmer Furlbrow",
}

P:Letter {
  id = "al_grimbooze_rhyme", npc = "grimbooze", random = true, when = { faction = "Alliance", minLevel = 14 },
  subject = "A letter in verse (and in lager)",
  body = "My friend {name}, I hope ye're well, and dry, and not too thin, for the dust out here would choke a mule and the wind won't let ye in. I've barrels stacked beside the still as high as Sentinel's tower, and every one's a Thunderbrew, and none of them gone sour.\n\nThe harvest golems clank about and frighten off my trade, and Defias come to borrow kegs they've never once repaid. But still I brew, and still I sing, and still I write ye this, for a letter from a dwarf in verse is not a thing to miss.\n\nSo come ye back to the Dagger Hills when ye've a thirst to slake, and bring a friend, or bring a mug, or bring a bigger lake.\n\nGrimbooze Thunderbrew\n\n(Ye'll forgive the spelling. The ink's been in the lager.)",
  replies = {
    { id = "verse", text = "Write back in rhyme, badly, and ask after the lager.", fx = { affinity = 1, npcFlag = { set = "al_grimbooze_verse" } } },
    { id = "plain", text = "Tell him plainly I couldn't make head nor tail of it.", fx = { affinity = -1 } },
    { id = "dwarf", text = "Tell him a dwarf needs no rhymes, only a full barrel.", when = { race = "Dwarf" }, fx = { affinity = 1 } },
  },
}

---------------------------------------------------------------------------
-- Redridge Mountains
---------------------------------------------------------------------------
P:Letter {
  id = "al_martie_garden", npc = "martie", random = true, when = { faction = "Alliance", minLevel = 16 },
  subject = "The tulips, again",
  body = "Dear,\n\nI'm writing to report that Bellygrub has been in the garden again, and has eaten the beans, the carrots and one corner of the fence, so I've planted mint along the edge because Darcy swears pigs can't abide the smell. We shall see. Darcy also swears she only ever repeats the nice gossip, so I'm keeping my hopes modest.\n\nThe gnolls have been quieter since the lake rose, and the healer has had her sage and her peacebloom from me every week without fail. Two of the tulips came up purple, which I never planted, and I've decided not to ask how.\n\nTell me, what grows where you are? I so rarely get past the bridge, and I like to imagine the flowers in other places, even ones I'll never see.\n\nMartie Jainrose, Lakeshire",
  replies = {
    { id = "flowers", text = "Describe the wildflowers along my road, as best I can remember them.", fx = { affinity = 1, letter = "al_martie_seeds" } },
    { id = "gnolls", text = "Tell her the gnolls were driven down off the mountains, not born wicked.", fx = { opinion = { redridge_gnolls = "driven" } } },
    { id = "fence", text = "Tell her to build Bellygrub a stout fence, mint or no mint.", fx = {} },
  },
}

P:Letter {
  id = "al_martie_seeds", npc = "martie", delay = 4500,
  subject = "Your wildflowers",
  body = "Dear,\n\nI read your letter out loud to Verner over the fence, and he pretended not to listen and then asked me twice to read the part about the yellow ones again. I've no seeds of any of them, of course, but I've made a little bed by the gate and called it your bed, and I've planted it with the nearest thing I could find to what you described. It's mostly marigolds, if I'm honest, but they're very determined marigolds.\n\nBellygrub hasn't touched them yet, and Darcy says it's the mint, but I say it's respect.\n\nWould you tell me about another place, when you've a moment? Somewhere wet, perhaps. The lake is lovely, but I've always wondered what grows in a real rain.\n\nMartie",
  replies = {
    { id = "rain", text = "Tell her about the moss and lilies of a rainy marsh.", fx = { affinity = 1, letter = "al_martie_tulips" } },
    { id = "busy", text = "Tell her the road's kept me too busy to look at flowers.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_martie_tulips", npc = "martie", delay = 5400,
  subject = "A wet corner",
  body = "Dear,\n\nI've done something silly. I dug a hollow at the low end of the garden where the water lies after a storm and lined it with clay from the lake shore, and I've put in rushes and a lily from the edge of Everstill, so now I have a marsh. It's about the size of a washtub. The frogs found it within a day, which I'm taking as a compliment.\n\nYour bed by the gate is blooming, and people stop to ask about it. I tell them it belongs to a friend who travels, and they nod as though that explains everything, which in Lakeshire I suppose it does.\n\nI'll stop writing now before I start asking about deserts. Look after yourself out there.\n\nMartie Jainrose, keeper of a very small marsh",
}

P:Letter {
  id = "al_verner_iron", npc = "verner", random = true, when = { faction = "Alliance", minLevel = 16 },
  subject = "Not a scrap",
  body = "{name},\n\nThe Guard took the last of my iron on Tuesday, every bar of it, along with a bucket of old nails I'd been saving for the stable door, and left me a receipt signed by Marshal Marris that I can neither forge nor shoe a horse with. So I'm writing letters, since there's nothing else to hammer.\n\nI suppose Smith Argus got my note about the shoes eventually. If he grumbled, you can tell me about it, because it'll be the first good news I've had all month. The horses are sleeping through the night since the howling stopped, which means I am too, mostly.\n\nIf you come through Lakeshire with any scrap in your packs, you know where the forge is. It's the cold one.\n\nVerner Osgood, smith, Lakeshire",
  replies = {
    { id = "argus", text = "Tell him Smith Argus grumbled, exactly as he said he would.", fx = { affinity = 1 } },
    { id = "guard", text = "Tell him the Guard needs his iron more than the horses do.", fx = { affinity = -1 } },
    { id = "warrior", text = "Tell him my shield still wears his rivets, and they've held.", when = { class = "WARRIOR" }, fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "al_darcy_nice", npc = "darcy", random = true, when = { faction = "Alliance", minLevel = 16 },
  subject = "Only the nice parts",
  body = "Hello, love,\n\nI promised myself I'd only ever pass on the nice gossip, so this will be a short letter. Here it is: Shawn and little Hilary have made friends again, and they go down to the docks together every evening to look for fish they're never going to catch. The Magistrate has written to Stormwind for more guards so many times that the courier now waves at him from the bridge. And the wobbly table finally has a folded beer mat under its short leg, which I did myself, so that's progress.\n\nThe other gossip I'm keeping to myself, though I will say Brianna has a gentleman caller, and I will say no more than that.\n\nCome and sit anywhere but the wobbly table when you're back, even though it's fixed. Habit.\n\nDarcy, at the Lakeshire Inn",
}

---------------------------------------------------------------------------
-- Duskwood
---------------------------------------------------------------------------
P:Letter {
  id = "al_daltry_ledger", npc = "daltry", random = true, when = { faction = "Alliance", minLevel = 22 },
  subject = "A clerical matter",
  body = "{name},\n\nI'm writing in my official capacity, which in Darkshire means I'm writing by candlelight with a wolf howling somewhere behind the town hall. It has come to my attention, by way of my own register, that I have you entered under \"Visitors\", \"Persons of Assistance to the Watch\" and, in a moment of pessimism last month, \"Missing, Presumed Wolf\". Two of those can't all be true at once, and I'd like your guidance on which to cross out.\n\nThe Night Watch sends its regards, or rather Commander Ebonlocke grunted when I mentioned you, and I've chosen to record it as regards. The Mistmantle file is back on the shelf where it belongs, and I'm told the dust on it is load-bearing.\n\nPlease reply at your convenience, ideally before I run out of columns.\n\nClerk Daltry, Records, Darkshire",
  replies = {
    { id = "cross", text = "Tell him to cross me off the missing list, firmly, in ink.", fx = { affinity = 1, letter = "al_daltry_register" } },
    { id = "count", text = "Ask him how many names he crossed out this month.", fx = { npcFlag = { set = "al_daltry_count" } } },
    { id = "nowhere", text = "Tell him I'd rather not be written down anywhere at all.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_daltry_register", npc = "daltry", delay = 3600,
  subject = "Crossed out, in ink",
  body = "{name},\n\nDone. I've struck through \"Missing, Presumed Wolf\" with a single firm line, in the good ink, the black, which I keep for the deaths, so you'll understand it gave me some pleasure to use it for the opposite. I initialled it, too, so nobody can say it was an accident.\n\nI've also opened a new column for you headed \"Alive, Regrettably Far Away\". You're the only entry so far. I suspect it'll stay that way, since most people who leave Duskwood either come back or end up in the other ledger, and this is the first time I've had to account for anyone doing neither.\n\nDo try to stay in the new column.\n\nClerk Daltry",
}

P:Letter {
  id = "al_sven_fire", npc = "sven", random = true, when = { faction = "Alliance", minLevel = 22 },
  subject = "From the camp",
  body = "{name},\n\nLars has gone out after deer again and come back with three dire wolves behind him again, and I've put another notch in the post by the fire. That's eleven now. He says the wolves are getting bolder, and I say he's getting slower, and we've had that argument every evening since spring.\n\nI went up to the old farm last week. I don't know why. The fence is down and the barn's half burned and the well's full of leaves, but the apple tree my wife planted is still standing, and it had fruit on it, little sour ones nobody's picked in years. I sat under it for a while. Then I came back here, because there wasn't anything else to do.\n\nYou needn't write back. I only wanted somebody to know about the tree.\n\nSven Yorgen",
  replies = {
    { id = "green", text = "Tell him the forest will be green again one day, and the tree knows it.", fx = { affinity = 1 } },
    { id = "remember", text = "Tell him I'm glad he told me about the apple tree.", fx = { affinity = 1, npcFlag = { set = "al_sven_tree" } } },
    { id = "move", text = "Tell him to stop brooding by that fire and move into Darkshire.", fx = { affinity = -1 } },
  },
}

---------------------------------------------------------------------------
-- Stormwind
---------------------------------------------------------------------------
P:Letter {
  id = "al_elling_cheese", npc = "elling", random = true, when = { faction = "Alliance", minLevel = 20 },
  subject = "A new cheese",
  body = "Valued customer,\n\nThe Trias family is pleased to announce the arrival of a new cheese, a hard white from the dairies near Northshire, aged eight months in our own cellar, which is a cellar for cheese, as all cellars are. It is excellent with apples and with Dalaran sharp, and it keeps well on the road.\n\nWe are also pleased to report that business is good, that nothing unusual has happened in the shop this season, and that the gentlemen who come in late in the evening are only very particular about their cheddar. Elaine sends her regards and asks me to say that we sell cheese. We sell cheese.\n\nWith every good wish for your continued health,\n\nElling Trias, Cheesemaker, Trade District",
  replies = {
    { id = "cheddar", text = "Tell him the cheddar was excellent, and leave it at that.", fx = { affinity = 1, npcFlag = { set = "al_elling_discreet" } } },
    { id = "cellar", text = "Ask him plainly what that cellar is really for.", fx = { affinity = -1 } },
    { id = "rogue", text = "Tell him his cellar door needs oiling, colleague.", when = { class = "ROGUE" }, fx = { affinity = 1, npcFlag = { set = "al_elling_colleague" } } },
  },
}

P:Letter {
  id = "al_farthing_priest", npc = "farthing", delay = 3000,
  when = { faction = "Alliance", class = "PRIEST", minLevel = 20 },
  subject = "From the Cathedral",
  body = "{g:Brother|Sister} {name},\n\nThe Cathedral is full of novices this year, more than we've had since the Second War, and I find myself thinking about the ones who have already gone out into the world and what they've found there. Darkshire still writes to me every month, and every month the letters have a few more names in them that I'll have to pray over, and I've begun to wonder what the Light asks of those of us who go where it is dark.\n\nYou've walked a good deal further than most of our own by now. I should like to know how you keep faith out there, and whether you keep it the way we taught you, or whether the road has taught you something we didn't. I won't think less of you for either answer. I only want to know which.\n\nThe pews were built for tired people, and one of them is yours whenever you come home.\n\nBishop Farthing, Cathedral of Light",
  replies = {
    { id = "light", text = "Tell him I keep to the Light alone, as the Cathedral taught me.", fx = { affinity = 1, align = { light = 2 } } },
    { id = "shadow", text = "Tell him I've learned the shadow too, and I use it.", fx = { affinity = -1, align = { light = -2 } } },
    { id = "tired", text = "Tell him I'm tired, and I'll take that pew soon.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "al_osric_orcs", npc = "osric_strang", random = true, when = { faction = "Alliance", minLevel = 18 },
  subject = "Mark my words",
  body = "{name},\n\nYou'll have heard, I expect, that the orcs are loose in Kalimdor with a city of their own and a warchief who reads books. Well, I fought the orcs at Grim Batol and I guarded the camps after, and I'll tell you what I tell everyone who comes into the shop: an orc who reads books is still an orc, and he'll still want what's ours once he's finished reading.\n\nBusiness is slow. Young folk buy their plate from the Lionheart Armory now because it's shinier, and a breastplate that shines is a breastplate that's never been hit. The stand by the door fell over again on Thursday, and I've propped it up with a broken shield from the Second War, which is about the best use anybody's found for that war in years.\n\nKeep your armour honest and your back to a wall.\n\nOsric Strang, Limited Immunity, Old Town",
  replies = {
    { id = "heed", text = "Tell him I'll keep his warnings in mind on the road.", fx = { affinity = 1 } },
    { id = "over", text = "Tell him the war is over, and he should let it rest.", fx = { affinity = -1 } },
  },
}

---------------------------------------------------------------------------
-- Ironforge and Dun Morogh
---------------------------------------------------------------------------
P:Letter {
  id = "al_marblesten_masons", npc = "marblesten", delay = 2400,
  when = { cleared = "The Deadmines", faction = "Alliance" },
  subject = "On the matter o' the Stonemasons",
  body = "{name},\n\nWord's come up through the Deeprun Tram that VanCleef is dead in his own mine, and that it was yerself who did it. I'll no' pretend I'm sorry, for he hanged men an' burned farms an' turned good masons intae cutthroats. But I'll tell ye this, since ye'll hear it nowhere else: I knew some o' those lads before they ever put on a red mask.\n\nThey rebuilt Stormwind stone by stone after the orcs pulled it down, an' they did it well, for I walked those walls myself an' couldnae fault a joint. Then the House o' Nobles decided the bill was too dear, an' that was the end o' the Stonemasons' Guild. I'm carving memorials again this week, an' I find I've a few names in my head that'll never go on any stone.\n\nCome an' see me in the Commons. I'd like tae hear it from ye, the whole of it.\n\nGrand Mason Marblesten",
  replies = {
    { id = "unpaid", text = "Tell him the Guild should have been paid, and the nobles know it.", fx = { affinity = 1, opinion = { defias = "mercy" } } },
    { id = "earned", text = "Tell him VanCleef got what he earned, wages or no wages.", fx = { opinion = { defias = "hardline" } } },
    { id = "visit", text = "Promise to come to the Commons and tell him the whole of it.", fx = { affinity = 1, npcFlag = { set = "al_marblesten_tell" } } },
  },
}

P:Letter {
  id = "al_rudra_yeti", npc = "rudra_amberstill", random = true, when = { faction = "Alliance", minLevel = 8 },
  subject = "Ranch news",
  body = "{name},\n\nThe yeti came down off the ridge again on Tuesday an' took a ewe right out o' the lower pen, bold as ye like, in the middle o' the afternoon. I chased it as far as the frozen stream wi' a pitchfork an' a great deal o' language, which it didnae appreciate, an' I got the ewe back, mostly. She's limpin' but she's eatin', an' she glares at the ridge every mornin' like she's plannin' revenge.\n\nThe old grey ram still butts the gate whenever a stranger walks past, an' he still lets ye by, which I've never understood. The Mountaineers say the trolls in the north have been quieter, an' I say that's when ye should worry.\n\nIf ye're back in Dun Morogh, the kettle's on. Mind the dung.\n\nRudra Amberstill, Amberstill Ranch",
  replies = {
    { id = "ram", text = "Ask her to give the old grey ram my regards.", fx = { affinity = 1 } },
    { id = "yeti", text = "Tell her I'll keep an eye out for that yeti on the ridge.", fx = { affinity = 1, npcFlag = { set = "al_rudra_yeti" } } },
  },
}

P:Letter {
  id = "al_firebrew_guzzler", npc = "firebrew", delay = 2400,
  when = { cleared = "Blackrock Depths", faction = "Alliance" },
  subject = "Is it true?",
  body = "{name},\n\nThe whole Stonefire's talkin' about ye, an' I'll tell ye what they're sayin', an' ye can tell me which bits are true. They say ye went down intae the Dark Irons' own city under the Blackrock, past the forges an' the lava an' the prisons, an' that ye sat down in their tavern, the Grim Guzzler, an' drank their ale under their noses before ye went on tae knock on the Emperor's door.\n\nOld Grumbold swears ye drank six pints, an' young Thorri swears it was a dozen, an' the story's grown by a pint every night since. I've told them all tae wait until ye're back an' tell it yerself, for a story's best from the mouth that lived it, an' because frankly I'd like a stool full o' customers waitin' tae hear it.\n\nCome home soon. Yer mug's on the hook.\n\nInnkeeper Firebrew, the Stonefire Tavern",
  replies = {
    { id = "dwarf", text = "Tell him Dark Iron ale is thin, and the Stonefire's is better.", when = { race = "Dwarf" }, fx = { affinity = 1 } },
    { id = "bigger", text = "Tell him the true story's bigger, and I'll tell it in person.", fx = { affinity = 1, npcFlag = { set = "al_firebrew_story" } } },
    { id = "quiet", text = "Tell him I'd rather not talk about what happened down there.", fx = {} },
  },
}

---------------------------------------------------------------------------
-- Loch Modan
---------------------------------------------------------------------------
P:Letter {
  id = "al_rugelfuss_trenches", npc = "rugelfuss", random = true, when = { faction = "Alliance", minLevel = 14 },
  subject = "From the Valley of Kings",
  body = "{name},\n\nThe troggs came up out of the hill again last night, same hour, same hole, same racket, and we put them back down again, same as always. I lost no one, which I'll take. The trench on the east side is now deep enough that young Gwarth can stand in it without his helmet showing, and he says that's the first time he's felt tall.\n\nI'm told I'm to be relieved come the spring, and I'm told that every spring, so I've stopped packing. The statues of the kings don't seem to mind the noise. I've grown fond of them, standing there with their hands on their hammers, looking south like they're waiting for someone.\n\nWrite if ye've a moment. It's a long watch, an' a letter makes it shorter.\n\nCaptain Rugelfuss, the Valley of Kings",
  replies = {
    { id = "dwarf", text = "Tell him every dwarf owes Ironforge a turn in the trenches.", when = { race = "Dwarf" }, fx = { affinity = 1 } },
    { id = "patience", text = "Tell him the troggs will run out before his patience does.", fx = { affinity = 1 } },
    { id = "toolong", text = "Tell him he's been on that hill far too long.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_brock_safety", npc = "lm_brock", random = true, when = { faction = "Alliance", minLevel = 12 },
  subject = "Ye're in the lecture",
  body = "{name},\n\nI've added ye tae my safety lecture, an' I thought it only fair ye should know. Ye come in at the part about tellin' somebody where ye're goin' before ye go down a shaft, as in, \"there was a {race} {class} came through here once who never told a soul where {g:he|she} was off tae, an' I'd half decided {g:he|she}'d fallen down a hole.\" The students gasp. It's very effective.\n\nThe school's doin' well. I've four new apprentices this season, two of whom can tell copper from tin wi' their eyes shut, an' one who can tell it wi' his tongue, which I've asked him tae stop doin'. The fourth is still lookin' for the pick I gave him.\n\nWrite an' tell me where ye are, so I can take ye out o' the lecture.\n\nBrock Stoneseeker, Brock's School o' Mining an' Surveying, Thelsamar",
}

---------------------------------------------------------------------------
-- Wetlands
---------------------------------------------------------------------------
P:Letter {
  id = "al_helbrek_rain", npc = "helbrek", random = true, when = { faction = "Alliance", minLevel = 22 },
  subject = "Still raining",
  body = "{name},\n\nIt's raining in Menethil, which ye'll no' be surprised tae hear, an' the Deepwater's leakin' over the bar, which is where it's meant tae leak. The Theramore boat came in two days late wi' half the sailors green an' the other half cheerful, which tells ye which half had been at the rum.\n\nValstag Ironjaw's been in every night with his reports about the Dragonmaw, an' he spreads them on the bar an' reads them aloud tae anyone who'll stand still, so I've started standin' very still. The harbour's sinkin' an inch a year, the engineers say. I say it's the town that's sinkin' an' the harbour's stayin' put.\n\nCome in out o' the wet when ye're passin'. There's a stool wi' a dry seat on it, an' I'll fight anyone for it on yer behalf.\n\nInnkeeper Helbrek, the Deepwater Tavern",
}

P:Letter {
  id = "al_flagongut_uldaman", npc = "flagongut", delay = 2400,
  when = { cleared = "Uldaman", faction = "Alliance" },
  subject = "ULDAMAN!",
  body = "{name},\n\nI've only just heard, an' I've spilled ink on three maps already, so forgive the blots! They're sayin' at the League that ye went all the way down intae Uldaman, past the troggs an' the Dark Irons an' the stone things, an' came out again wi' yer head still on. Is it true there's a great hall down there, wi' a keeper made o' stone that woke when ye came in? Is it true about the discs, an' what's written on them, about where we dwarves came from?\n\nI've been stuck in Menethil for longer than I like tae say, starin' at the same maps while the raptors sit on my dig. An' now here's somebody I've actually spoken to, standin' in the very place every one o' us has dreamed about since we were wee.\n\nWrite, an' write everythin'. I'm no' fussy, but I'm very, very eager.\n\nArchaeologist Flagongut, the Explorers' League",
  replies = {
    { id = "describe", text = "Describe the stone halls and the great keeper, as best I can.", fx = { affinity = 1, letter = "al_flagongut_shard" } },
    { id = "elbows", text = "Tell him it's no place for a dwarf who minds his elbows.", fx = {} },
    { id = "shut", text = "Tell him some doors down there were better left shut.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_flagongut_shard", npc = "flagongut", delay = 5400,
  subject = "I read it eleven times",
  body = "{name},\n\nEleven times, an' I counted. I copied out yer description of the hall an' pinned it above my maps, an' then I copied it again for the League in Ironforge, an' then I had tae copy it a third time because I'd spilled my ale on the second. The lads at the Deepwater think I've gone soft in the head, an' they may be right, but they've no' had a letter from Uldaman.\n\nI've drawn the keeper from yer words, though my drawin' looks more like a tall angry wardrobe than anythin' made by the titans. It'll do until I see him for myself. An' I will, one day, raptors or no raptors.\n\nThank ye. Ye've no idea what it means tae an old map-man tae get a letter like that.\n\nFlagongut",
  replies = {
    { id = "wardrobe", text = "Tell him the angry wardrobe is a remarkably good likeness.", fx = { affinity = 1 } },
    { id = "go", text = "Tell him to leave the maps and go see it himself.", fx = {} },
  },
}

---------------------------------------------------------------------------
-- Teldrassil and Darnassus
---------------------------------------------------------------------------
P:Letter {
  id = "al_ilthalaine_light", npc = "ilthalaine", delay = 3000,
  when = { faction = "Alliance", race = "NightElf", minLevel = 10 },
  subject = "The light in the glade",
  body = "{name},\n\nIshnu-alah. The nightsaber cubs you remember are not cubs anymore, and the smallest of them, the one who used to fall over her own paws, has taken to sitting on the root by the moonwell where you used to stand. I am an old elf and I know better than to say she misses you, but I notice that she sits there.\n\nThe light comes through the leaves in the mornings, and every morning it is different, and every morning I think of the young ones who have gone down the ramp and out into the world, and I hope they stop now and then to look at the light where they are. It is a small thing to ask, and I find it is the only thing I want to ask.\n\nElune keep you, and keep your eyes open.\n\nConservator Ilthalaine, Shadowglen",
  replies = {
    { id = "miss", text = "Tell him I miss the mornings in the glade.", fx = { affinity = 1 } },
    { id = "druid", text = "Tell him I still feel the glade's balance when I take the cat's shape.", when = { class = "DRUID" }, fx = { affinity = 1, npcFlag = { set = "al_ilthalaine_druid" } } },
    { id = "busy", text = "Tell him the world outside is too busy for looking at light.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_dirania_iverron", npc = "dirania", random = true, when = { faction = "Alliance", minLevel = 8 },
  subject = "Iverron, again",
  body = "{name},\n\nI am sorry to write to you about Iverron again, but you are the only one I know who has been in that cave and come out unbitten. He went back. He said he had left a knife in there, and I said that a knife is not worth a fever, and he said that this one was, and then he went anyway, as he always does.\n\nHe came back without the knife and with two bites on his arm, and he is sleeping now, and the herbs have done their work, and I sat beside him all night listening to him breathe. In the morning he asked me why I looked so tired. I did not tell him.\n\nI do not know why I am telling you, except that the moonlight always finds the same leaves, and I suppose I hoped it would find you.\n\nDirania Silvershine, Shadowglen",
  replies = {
    { id = "warm", text = "Tell her Iverron is lucky to have such a friend.", fx = { affinity = 1, letter = "al_dirania_glad" } },
    { id = "cold", text = "Tell her Iverron must learn to fight his own battles.", fx = { affinity = -1, letter = "al_dirania_hurt" } },
    { id = "ask", text = "Ask her whether Iverron ever found the knife.", fx = {} },
  },
}

P:Letter {
  id = "al_dirania_glad", npc = "dirania", delay = 3600,
  subject = "He read it",
  body = "{name},\n\nI am afraid I did something I should not have done. I left your letter on the table, and Iverron read it while I was at the moonwell, and when I came back he was sitting very still with it in his hands.\n\nHe did not say anything at first. Then he said he had not known, and that he was sorry, and that he would not go near the cave again without telling me first. That is not the same as not going near it at all, but it is more than he has ever promised before, and I am choosing to be glad of it.\n\nThank you for your kind words. They did more than you meant them to.\n\nDirania",
}

P:Letter {
  id = "al_dirania_hurt", npc = "dirania", delay = 3600,
  subject = "Of course",
  body = "{name},\n\nYou are right, of course. He must learn, and I cannot sit beside him every night for the rest of his life, though I could, if he asked. I should not have troubled you with it.\n\nThe herbs have done their work, and he is well again, and he has already started talking about the cave. I have told him nothing. I find I have less to say than I used to.\n\nElune keep you on your road.\n\nDirania Silvershine",
  replies = {
    { id = "sorry", text = "Write that I was too harsh, and that her care does matter.", fx = { affinity = 1 } },
    { id = "stand", text = "Let it rest, and wish her well.", fx = {} },
  },
}

P:Letter {
  id = "al_keldamyr_tea", npc = "keldamyr", random = true, when = { faction = "Alliance", minLevel = 10 },
  subject = "The kettle in Dolanaar",
  body = "Traveller,\n\nThe kettle is on in Dolanaar, as it always is, and I have kept the low chair by the fire for you, as I always do for the guests I expect to see again. There are not so many of them as there used to be. The young ones come through on their way to Darnassus with their packs too full and their eyes too bright, and they rarely come back the same way.\n\nThe moonwell in the village has been quiet, and Sentinel Starsong says the furbolgs in the north have been restless, but she says that every season and the furbolgs are always restless. The tea this month is moonpetal and a little mint, because a Sentinel brought me mint and I could not think what else to do with it.\n\nRest, when you can. Elune keeps the night watch so that you need not.\n\nInnkeeper Keldamyr, Dolanaar",
}

---------------------------------------------------------------------------
-- Darkshore
---------------------------------------------------------------------------
P:Letter {
  id = "al_gwennyth_tide", npc = "gwennyth", random = true, when = { faction = "Alliance", minLevel = 14 },
  subject = "What the sea brought in",
  body = "{name},\n\nThe tide has brought in another great beast, larger than the last, on the sands north of Auberdine past the old ruins, and I spent all of yesterday sitting beside it with a notebook trying to decide whether it died of age, or illness, or something worse. The gulls have their own opinion and are not shy about it.\n\nThe Sisterhood in Darnassus writes that I am to come home when I have finished my study, and every week the sea gives me a reason that I have not finished. I am beginning to think the sea knows what it is doing. The village children have started bringing me shells, and one brought me a tooth as long as my forearm, which she wanted back.\n\nElune keep you, wherever the tides take you.\n\nGwennyth Bly'Leggonde, Auberdine",
  replies = {
    { id = "stay", text = "Tell her the sea is right, and she should stay and finish.", fx = { affinity = 1 } },
    { id = "worse", text = "Ask her what she means by something worse.", fx = { npcFlag = { set = "al_gwennyth_worse" } } },
  },
}

P:Letter {
  id = "al_gershala_jars", npc = "gershala", random = true, when = { faction = "Alliance", minLevel = 16 },
  subject = "Further to our work",
  body = "{name},\n\nI write to thank you once more for your assistance with my study, and to tell you that the jars have been labelled, catalogued and moved to the high shelf, where the innkeeper's cat cannot reach them. My notes now run to three volumes. The satyr and the naga were both, long ago, kaldorei, and the more I read the more I am convinced that the fall was not so long or so steep as we like to believe.\n\nMy brother Argos writes from Stormwind to ask whether I have taken up a hobby. I have told him I have, and that it is collecting the remains of our ancestors' mistakes, and he has not written since.\n\nIf your road takes you near the coast, I should be glad of company that does not flinch at the jars.\n\nGershala Nightwhisper, Auberdine",
  replies = {
    { id = "warn", text = "Tell him to mind he doesn't follow the satyr down that road.", fx = { affinity = -1 } },
    { id = "argos", text = "Tell him Argos misses him, whatever he says.", fx = { affinity = 1 } },
  },
}

---------------------------------------------------------------------------
-- Ashenvale
---------------------------------------------------------------------------
P:Letter {
  id = "al_liladris_druid", npc = "liladris", random = true, when = { faction = "Alliance", minLevel = 22 },
  subject = "He is asleep",
  body = "{name},\n\nHe is asleep. I am writing this at the table at Maestra's Post with Kerlonian Evershade asleep in the chair opposite me, with his chin on his chest and a leaf stuck to his cheek, and he has been asleep since before the moon rose. He came in, he sat down, he said, \"Liladris, I have so much to tell you,\" and then he told the chair instead.\n\nThe Horde are cutting at the edge of the forest again, and Delgren has been praying at the shrine every morning, and I would like very much to discuss all of it with someone who is conscious. So I am discussing it with you.\n\nIf you happen to have a horn, a very loud one, I should like to borrow it.\n\nLiladris Moonriver",
  replies = {
    { id = "conscience", text = "Tell her a druid who sleeps that soundly must have a clear conscience.", fx = { affinity = 1, letter = "al_liladris_awake" } },
    { id = "horn", text = "Tell her to try a bucket of the river instead.", fx = { affinity = 1 } },
    { id = "deserve", text = "Tell her she deserves someone who stays awake.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_liladris_awake", npc = "liladris", delay = 4500,
  subject = "A clear conscience",
  body = "{name},\n\nI read your letter aloud to him when he woke, which was three days later, and he laughed so hard that he nearly fell asleep again from the effort. He says you are a very wise {race} and that he will tell you so himself when he is next awake at the same time as you.\n\nI did not tell him that I laughed too. He would be insufferable.\n\nHe is awake now, as it happens, and he is making tea, slowly, and asking me what day it is. I am going to put down my pen and tell him.\n\nLiladris",
}

P:Letter {
  id = "al_pelturas_fever", npc = "pelturas", random = true, when = { faction = "Alliance", minLevel = 22 },
  subject = "From Astranaar",
  body = "{name},\n\nI said I would write when there was news, and there is news, though it is the kind that has to be said carefully in case it goes away. Relara slept through the night. All of it, from moonrise to morning, without crying out once. I know because I sat by her bed and did not sleep at all, so that I could tell you.\n\nShe is pale still, and she tires easily, and she has decided that she will be a Sentinel when she is grown, which she announces at every meal. Orendil's draught is bitter and she makes a face at it, but she drinks it, and the nightmares are fewer.\n\nI do not know how to thank you. I think perhaps I will just keep writing.\n\nPelturas Whitemoon, Astranaar",
  replies = {
    { id = "relara", text = "Ask how Relara is sleeping now, and send her my best.", fx = { affinity = 1, letter = "al_pelturas_relara" } },
    { id = "elune", text = "Tell him I pray Elune keeps the nightmares far from her.", when = { race = "NightElf" }, fx = { affinity = 1 } },
    { id = "pass", text = "Tell him fevers pass, and this one will too.", fx = {} },
  },
}

P:Letter {
  id = "al_pelturas_relara", npc = "pelturas", delay = 5400,
  subject = "A letter from Relara",
  body = "{name},\n\nRelara has asked to write this one herself, and I have been told I may only add my name at the end, so here is my daughter.\n\n\"Dear {name}, I sleep every night now and I only dreamed of the dark thing once and I chased it away with a stick. Father says it was a dream stick but it worked. When I am a Sentinel I will patrol the road to Maestra's Post and if I see you I will not shoot you. I have a new owl feather. It is grey. Goodbye. Relara Whitemoon.\"\n\nShe is well. That is all I wanted to say, and she has said it better.\n\nPelturas",
}

---------------------------------------------------------------------------
-- Dustwallow Marsh and Theramore
---------------------------------------------------------------------------
P:Letter {
  id = "al_vimes_marsh", npc = "vimes", delay = 3600,
  when = { cleared = "Onyxia's Lair", faction = "Alliance" },
  subject = "From the Theramore Guard",
  body = "{name},\n\nThe boat from Menethil brought word this week that the black dragon in the Wyrmbog is dead, and that her head hangs over the gates of Stormwind for anyone to look at, and that your name was among the ones the crier read out. I've been a guardsman long enough to distrust any story with a dragon in it, but this one came with three separate witnesses and a very shaken sailor, so I'm prepared to believe it.\n\nThe marsh is no quieter for it, mind. The black dragonkin still sulk in the south, the Grimtotem still lurk in the west, and somebody still burned the Shady Rest, which I mean to prove one day if it takes me the rest of my life. But the men on the south wall stood a little straighter this morning, and I thought you should know that.\n\nCaptain Garran Vimes, Theramore Guard",
  replies = {
    { id = "wall", text = "Tell him the men on the south wall earned their straight backs.", fx = { affinity = 1 } },
    { id = "shadyrest", text = "Ask how his investigation into the Shady Rest is going.", fx = { npcFlag = { set = "al_vimes_asked" } } },
  },
}

P:Letter {
  id = "al_janene_soup", npc = "janene", random = true, when = { faction = "Alliance", minLevel = 30 },
  subject = "The soup's on",
  body = "Love,\n\nThe soup's on, the fire's lit, and there's a stool nearest the hearth that I've been keeping clear by telling the soldiers it's reserved for somebody far better looking than any of them. They've stopped asking who. I think they've decided you're imaginary.\n\nThe marsh has been dreadful this month, all fog and biting flies, and half the garrison came in with the sniffles and the other half came in pretending they didn't have them. Lady Proudmoore stopped by the inn on her way down to the docks and asked after my bread, which I shall be telling people about until the day I die.\n\nDon't let Dustwallow eat you, love. Come and eat something instead.\n\nInnkeeper Janene, Theramore",
  replies = {
    { id = "soup", text = "Tell her the soup was the best thing in all of Dustwallow.", fx = { affinity = 1 } },
    { id = "imaginary", text = "Tell her to let the soldiers go on thinking I'm imaginary.", fx = { affinity = 1 } },
  },
}

---------------------------------------------------------------------------
-- Arathi Highlands and the Hinterlands
---------------------------------------------------------------------------
P:Letter {
  id = "al_amaren_refuge", npc = "ar_commander_amaren", random = true, when = { faction = "Alliance", minLevel = 30 },
  subject = "Refuge Pointe, status",
  body = "{class},\n\nI'll keep this short, since that's the only way I know how to write. Refuge Pointe still stands. The Syndicate still hold Stromgarde's lower city, the ogres still hold the hills, the Forsaken still sit in their farmhouses to the south, and the orcs at Hammerfall still beat their drums at night so we know they're there. We know.\n\nI have fewer soldiers than I had in the spring and more ground to watch, and the old men in the keep still talk as though Stromgarde's banners will be over Arathor again by harvest. Perhaps they will, though I'd settle for the bridge.\n\nYou fought for this hill once. I've not forgotten it.\n\nCommander Amaren, Refuge Pointe",
  replies = {
    { id = "stand", text = "Tell her Stromgarde will stand again, if I've any say in it.", fx = { affinity = 1 } },
    { id = "leave", text = "Tell her to leave the highlands to the ogres and the orcs.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_thulfram_aerie", npc = "thulfram", random = true, when = { faction = "Alliance", minLevel = 40 },
  subject = "Everyone ends up here",
  body = "{name},\n\nYe'll be pleased tae know the Wildhammer still drink like the sky depends on it, an' the gryphons still steal the bread off the tables when the riders aren't lookin', an' I still say everyone ends up at my bar sooner or later. Ye're overdue, by my count.\n\nThe Thane's been in a mood since the Vilebranch came over the ridge again, an' Fraggar's been sittin' up wi' the spirits every night an' comin' down tae breakfast lookin' like they've been arguin' wi' him. The stew's good, the fire's hot enough tae thaw a frozen gryphon, an' we've had one tae test it on.\n\nCome an' sit. There's a bench wi' yer shape in it.\n\nInnkeeper Thulfram, Aerie Peak",
  replies = {
    { id = "bronze", text = "Tell him a Bronzebeard drinks to the Wildhammer, whatever the Thane says.", when = { race = "Dwarf" }, fx = { affinity = 1 } },
    { id = "bench", text = "Tell him to keep the bench warm, and the gryphons off it.", fx = { affinity = 1 } },
    { id = "trolls", text = "Ask what the Vilebranch are doing over the ridge.", fx = {} },
  },
}

---------------------------------------------------------------------------
-- Hillsbrad Foothills and Southshore
---------------------------------------------------------------------------
P:Letter {
  id = "al_bilger_cellar", npc = "bilger", random = true, when = { faction = "Alliance", minLevel = 22 },
  subject = "From the cellar",
  body = "{name},\n\nI'm writin' this in the cellar, which is where I live now, between the casks an' the damp, an' I've had three cups to steady my hand, so if the letters lean, that's why. I wanted to tell you I've started a new batch. Dark, strong an' a bit bitter, like its brewer, an' I've not named it yet.\n\nI was a knight once, you know. Silver Hand. I don't say it to brag. I say it because I was thinkin' tonight about the oaths we took, an' how I kept all of them right up until there was nobody left to keep them for, an' then I found the cellar. The Southshore folk are kind to me. They don't ask, an' I don't tell.\n\nCome down an' taste the new batch when it's ready. Bring nobody sober.\n\nBrewmeister Bilger, Southshore",
  replies = {
    { id = "paladin", text = "Tell him the Silver Hand still means something, and so could he.", when = { class = "PALADIN" }, fx = { affinity = 1, letter = "al_bilger_hand" } },
    { id = "name", text = "Tell him to name the new batch after me, a strong one.", fx = { affinity = 1, letter = "al_bilger_cask" } },
    { id = "bottle", text = "Tell him to put the cup down for a week.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_bilger_cask", npc = "bilger", delay = 5400,
  subject = "It has a name",
  body = "{name},\n\nDone. I've chalked your name on the new cask, big as you like, an' Kelly from the bar came down an' read it an' asked if it was a memorial. I told him no, it's an honour, an' he said that in Southshore those are often the same thing.\n\nIt's the best batch I've made in years, an' I've no idea why, unless it's the name, or the barley, or that I was thinkin' about somebody who's still out there doin' something, instead of about the ones who aren't.\n\nThere's a cup of it waitin' for you, an' I've told everyone it's yours, so it might even last.\n\nBilger",
}

P:Letter {
  id = "al_bilger_hand", npc = "bilger", delay = 5400,
  subject = "Somethin', you said",
  body = "{g:Brother|Sister} {name},\n\nI've not been called that in a long while, an' I've not written it in longer. I read your letter sober, which I'll have you know took some arrangin', an' then I went upstairs an' stood in the rain for a bit.\n\nI don't know that the Hand means what it did. Uther's gone, an' the order's scattered, an' I'm a drunk in a cellar. But you wrote as though you believed it, an' you wear the Light like you mean it, an' I find I'd rather be wrong about the world than wrong about you.\n\nI've not put the cup away. But I've put it further off.\n\nBilger, once of the Silver Hand",
}

P:Letter {
  id = "al_maleb_syndicate", npc = "maleb", random = true, when = { faction = "Alliance", minLevel = 22 },
  subject = "Another report",
  body = "{name},\n\nI'm writing to you because you're one of perhaps four people I've met this year who reads a report to the end, and I've a desk full of them. The Syndicate struck a wagon on the road north of town on Tuesday, and another on Thursday, and on Friday they left a note on the third saying they'd be back for it on Saturday, which they were. Marshal Redpath says they're getting cocky. I say they're getting organised, which is worse.\n\nThe men we catch are mostly hungry Alterac folk with stolen swords and no idea who's giving the orders. The ones giving the orders, we never catch. Some days I think I'd be a much better magistrate if I were a clerk somewhere far away, filing someone else's troubles.\n\nAny thoughts would be welcome. I've run out of my own.\n\nMagistrate Henry Maleb, Southshore",
  replies = {
    { id = "hang", text = "Tell him to hang every Syndicate man he catches, as a lesson.", fx = { align = { order = 2 }, opinion = { syndicate = "hate" } } },
    { id = "bread", text = "Tell him a rope fixes nothing, and hungry men need bread, not courts.", fx = { align = { order = -2 }, opinion = { syndicate = "pity" } } },
    { id = "clerk", text = "Tell him I'd take a clerk's job somewhere safe, too.", fx = { affinity = 1 } },
  },
}

---------------------------------------------------------------------------
-- Writing pass (World): more Alliance folk who write once they know you
---------------------------------------------------------------------------
P:Letter {
  id = "al_w2_cobbleflint", npc = "cobbleflint", random = true, when = { faction = "Alliance", minLevel = 12 },
  subject = "From the south gate",
  body = "{name},\n\nThe south gate's still standin', an' so am I, which is more than the troggs hoped for when they came boilin' up out o' the hills last week. We put down eleven o' them before supper an' four after, an' Stormpike says he counted more, but Stormpike always counts more.\n\nI've a new lad on the gate now, fresh from Ironforge, an' he's so keen he salutes the sheep. I've told him about ye, so if a beardless youngster salutes ye on the road, that'll be him. Be kind; he'll learn.\n\nThe loch's quiet tonight, an' the stars are out over the dam. Come back an' see them sometime, an' bring yer axe in case the troggs want an encore.\n\nMountaineer Cobbleflint, Thelsamar",
  replies = {
    { id = "lad", text = "I'll salute the lad back, Cobbleflint. Every guard deserves that once.", fx = { affinity = 1 } },
    { id = "count", text = "Tell Stormpike I counted fourteen. That'll settle the argument.", fx = { affinity = 1 } },
    { id = "troggs", text = "Fifteen troggs in a day? Ironforge should send you more mountaineers.", fx = { opinion = { troggs = "threat" } } },
  },
}

P:Letter {
  id = "al_w2_bluntnose", npc = "lm_bluntnose", random = true, when = { faction = "Alliance", minLevel = 14 },
  subject = "A copy for your records",
  body = "{name},\n\nEnclosed please find a copy o' my latest letter tae the Senate in Ironforge, in which I ask for six more mountaineers, two barrels o' powder an' a new roof for the town hall, an' in which I mention ye by name as an example o' the sort o' help Loch Modan's been forced tae rely on in the Reserve's absence.\n\nI did not mean it as an insult, an' I'd be obliged if ye didnae take it as one. I meant it as a warnin' tae the Senate that if they won't send soldiers, I'll keep hirin' adventurers, an' adventurers are a great deal more expensive an' a great deal less tidy.\n\nThe roof still leaks. I've put a bucket under it an' a petition on my desk, an' I'm no' sure which will fill first.\n\nMagistrate Bluntnose, Thelsamar",
  replies = {
    { id = "tidy", text = "I'll try to be tidier next time, Magistrate. I promise nothing.", fx = { affinity = 1 } },
    { id = "proud", text = "I'm proud to be named in it, Magistrate. Send another.", fx = { affinity = 1 } },
    { id = "fee", text = "If I'm so expensive, perhaps Thelsamar should pay me better.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_w2_stoutfist", npc = "stoutfist", random = true, when = { faction = "Alliance", minLevel = 22 },
  subject = "Menethil's harbour",
  body = "{name},\n\nThe tide's been eatin' at the harbour wall again, an' half o' Menethil's under a foot o' water at high tide, which the locals say is normal an' the gnome engineers say is very interestin'. I say it's wet, an' I'm sick o' it.\n\nThe Dragonmaw were seen near the Thandol Span last week, more o' them than we've seen since the spring, an' I've doubled the watch on the eastern road. If ye're comin' through the Wetlands, come by the main road an' come in daylight. I'd hate tae lose ye tae a raptor rider in the fog after all yer trouble.\n\nThere's a seat for ye at the Deepwater Tavern whenever ye're in port. Mind the floor; it floats.\n\nCaptain Stoutfist, Menethil Harbor",
  replies = {
    { id = "dragonmaw", text = "If the Dragonmaw come in force, send word. I'll come to Menethil.", fx = { affinity = 1, opinion = { dragonmaw = "fight" } } },
    { id = "floor", text = "I'll mind the floor, Captain. Save me a dry seat.", fx = { affinity = 1 } },
    { id = "gnomes", text = "Let the gnomes fix the wall. It's what they're for." },
  },
}

P:Letter {
  id = "al_w2_thundris", npc = "thundris", random = true, when = { faction = "Alliance", minLevel = 14 },
  subject = "From Auberdine",
  body = "{name},\n\nThe moon rose full over Auberdine three nights ago, and the whole village came down to the shore to watch it lay a silver road across the water to the Veiled Sea. I have seen ten thousand such moons, and yet I stood on the dock until the tide came in over my feet, and did not mind.\n\nThe Blackwood furbolgs grow worse. Something in the forest has soured them, as it soured the Cliffspring, and the druids of Darnassus speak of it in low voices and send us very few answers. I would not ask it of you, but if your road takes you north of the village, keep your bow strung and your eyes on the treeline.\n\nIshnu-alah, and may Elune light your way home.\n\nThundris Windweaver, Auberdine",
  replies = {
    { id = "moon", text = "I'd have liked to see that moon, Thundris. Save me the next one.", fx = { affinity = 1 } },
    { id = "furbolgs", text = "I'll find what's souring the furbolgs, Thundris. They deserve better.", fx = { affinity = 1, opinion = { furbolgs = "pity" } } },
    { id = "druids", text = "Your druids should share what they know. Secrets cost lives.", when = { race = "NightElf" }, fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "al_w2_bingles", npc = "bingles", random = true, when = { faction = "Alliance", minLevel = 14 },
  subject = "Supplies (located!)",
  body = "Dear {name},\n\nGood news! I have recovered all but two of the supplies the troggs carried off, including the blastencapper, the hammer, the spanner and the large shiny thing whose purpose I have temporarily forgotten but which I am quite certain is vital. The two still missing are a pair of my good socks, which I suspect have been adopted by a trogg chieftain as a hat.\n\nI have also recalculated the blasting charges for the excavation and found that I was wrong before by a factor of four, which explains the crater, and also my eyebrows. They are growing back at a rate of approximately one-sixteenth of an inch a week, which I am logging carefully for science.\n\nIf you see a trogg wearing socks, please do not engage. I would like to study it.\n\nYours explosively,\nBingles Blastenheimer",
  replies = {
    { id = "socks", text = "If I see a trogg in your socks, Bingles, I'll take notes.", fx = { affinity = 1 } },
    { id = "eyebrows", text = "A sixteenth of an inch a week? You'll have eyebrows by midwinter.", fx = { affinity = 1 } },
    { id = "careful", text = "Please recalculate those charges a third time, Bingles.", when = { race = "Gnome" }, fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "al_w2_falstad", npc = "falstad", random = true, when = { faction = "Alliance", minLevel = 45 },
  subject = "From the Aerie",
  body = "{name},\n\nThe gryphons have been restless all week, an' when a Wildhammer gryphon's restless, ye listen. The Vilebranch have been drummin' in Jintha'Alor every night since the new moon, an' the Witherbark have come down out o' their hills to raid the low farms, bold as ye like.\n\nMy riders have been out over the Hinterlands from dawn to dusk, an' we've given the trolls somethin' tae think about, but there are more o' them than there are o' us, an' that's a sum I dinnae like the look of.\n\nIf ye've a mind for a fight in good mountain air, come up to the Aerie. The ale's strong, the birds are fierce, an' there's always a troll that needs a hammer between the eyes.\n\nFalstad Wildhammer, Aerie Peak",
  replies = {
    { id = "come", text = "I'll come to the Aerie, Falstad. Keep a gryphon saddled for me.", fx = { affinity = 1 } },
    { id = "trolls", text = "Strike Jintha'Alor before the Vilebranch finish whatever they're drumming up.", fx = { affinity = 1, opinion = { vilebranch = "strike" } } },
    { id = "ironforge", text = "You should ask Ironforge for help. Magni would send it.", when = { race = "Dwarf" }, fx = { affinity = -1 } },
  },
}
