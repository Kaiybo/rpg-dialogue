-- What the player says for Admire, Joke, Taunt and Intimidate (0.86.0), and how people take
-- a joke (DESIGN.md §3.16).
--
-- P:Persuade { id, role, faction, npc = "Name", <action> = { say = { lines }, success, fail } }
-- A `say` line is picked at random (Engine.PickSay), so the same one rarely comes twice.
-- `when` is about the player. A say line may carry the person's own answer to it:
-- success = "text", fail = "text"; otherwise they answer from the reply sets as before.
-- Player lines are 15 words or fewer.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Everyone
---------------------------------------------------------------------------
P:Persuade { id = "say",
  admire = {
    say = {
      { id = "a1", text = "You carry yourself well. I noticed it from across the road." },
      { id = "a2", text = "I've met a good many people on the road, and few as gracious as you." },
      { id = "a3", text = "Folk speak well of you around here, and I can see why." },
      { id = "a4", text = "You have honest eyes. That is rarer than gold these days." },
      { id = "a5", text = "It's plain you take pride in your work, and it shows." },
      { id = "a6", text = "I feel safer just for standing near you." },
      { id = "a7", text = "Whoever taught you your manners deserves a medal." },
      { id = "a8", text = "You've a fine voice. I could listen to you all day." },
      { id = "a9", text = "This place would be poorer without you, I think." },
      { id = "a10", text = "You look like someone who has seen a great deal and kept your head." },
      { id = "a11", text = "I'd wager you have the sharpest mind for miles." },
      { id = "a12", text = "I admire anyone who stands their ground as steadily as you do." },
      { id = "a13", text = "You remind me there are still decent people in the world." },
      { id = "a14", text = "Forgive me for staring. You have a remarkable presence." },
      { id = "a15", text = "If half the world worked as hard as you, we'd have no troubles." },
      { id = "a16", text = "You wear your years well, and your wisdom better." },
      { id = "a17", text = "I came for business, but the company is the better bargain." },
      { id = "a18", text = "That's a fine outfit. You've a good eye for it." },
      { id = "a19", text = "You strike me as someone people trust at once." },
      { id = "a20", text = "The road is long, and a face like yours makes it shorter." },
      { id = "a21", text = "You've a steady hand and a steadier heart, I'd say." },
      { id = "a22", text = "Honestly, yours is the first friendly face I've seen since dawn." },
      { id = "a23", text = "I can tell you're good at what you do. It shows in everything." },
      { id = "a24", text = "You have the bearing of someone who could lead, if you chose." },
      { id = "a25", text = "I've crossed half the world and never met anyone quite like you." },
      { id = "a26", text = "You've a rare patience. I could learn a thing or two from you." },
      { id = "a27", text = "People like you are the reason I still bother being polite." },
      { id = "a28", text = "I'd heard you were impressive. They undersold you." },
      { id = "a29", when = { race = "Human" }, text = "By the Light, you do this place credit." },
      { id = "a30", when = { race = "Dwarf" }, text = "By my beard, you're the finest company this side of Ironforge." },
      { id = "a31", when = { race = "Gnome" }, text = "By my calculations, you are well above average in every respect." },
      { id = "a32", when = { race = "NightElf" }, text = "Elune's light sits well upon you, if I may say so." },
      { id = "a33", when = { race = "Orc" }, text = "You have strength and honor both. I do not say that lightly." },
      { id = "a34", when = { race = "Troll" }, text = "The spirits are smiling on you today. I can see it plainly." },
      { id = "a35", when = { race = "Tauren" }, text = "The Earth Mother made you with care. Anyone can see it." },
      { id = "a36", when = { race = "Scourge" }, text = "You have a lovely glow. I notice such things, now that I've lost mine." },
      { id = "a37", when = { class = "PALADIN" }, text = "The Light shines on people like you. I can feel it." },
      { id = "a38", when = { class = "ROGUE" }, text = "I notice details for a living, and every detail about you is fine." },
      { id = "a39", when = { class = "MAGE" }, text = "I have studied a great many marvels. You compare favourably." },
      { id = "a40", when = { class = "HUNTER" }, text = "I track rare beasts for a living. Good people are rarer still." },
      { id = "a41", when = { class = "PRIEST" }, text = "You have a kind spirit. Believe me, I have looked into many." },
      { id = "a42", when = { class = "WARRIOR" }, text = "I know strength when I see it, and you have plenty." },
      { id = "a43", when = { class = "DRUID" }, text = "There's a calm about you, like an old tree in a storm." },
      { id = "a44", when = { class = "SHAMAN" }, text = "The spirits around you are at peace. That says a good deal." },
      { id = "a45", when = { class = "WARLOCK" }, text = "I keep far worse company than you, so believe me: you're a delight." },
    },
  },
  joke = {
    say = {
      { id = "j1", text = "A kobold asked the way out. I said 'follow the light.' He took my lantern." },
      { id = "j2", text = "A murloc walks into an inn. Everyone leaves. That's the whole joke, I'm afraid." },
      { id = "j3", text = "I asked a gnome for a short answer. I got one, and a diagram." },
      { id = "j4", text = "How many ogres light a torch? One, but both heads argue about it." },
      { id = "j5", text = "My hearthstone is so worn that it takes me home by the scenic route." },
      { id = "j6", text = "I tried the fishing in Stranglethorn. The fish had better gear than I did." },
      { id = "j7", text = "Never play cards with a goblin. I now owe one a zeppelin." },
      { id = "j8", text = "I told the spirit healer I'd be back. She said everyone says that." },
      { id = "j9", text = "Why don't trolls ever hurry? When you grow it all back, what's the rush?" },
      { id = "j10", text = "I killed forty boars for eight livers. Apparently most boars get by without one." },
      { id = "j11", text = "A dwarf and a gnome walk into a bar. The gnome walks under it." },
      { id = "j12", text = "The innkeeper said to make myself at home, so I complained about the roof." },
      { id = "j13", text = "I've carried the same grey rock for a month. I'm afraid to find out why." },
      { id = "j14", text = "I asked a guard for directions once. I've been walking ever since." },
      { id = "j15", text = "They say gold can't buy happiness, but have you priced a horse lately?" },
      { id = "j16", text = "I'm not lost. I'm exploring, loudly and against my will." },
      { id = "j17", text = "What's the difference between a goblin and a bandit? The goblin gives you a receipt." },
      { id = "j18", text = "I slept in a haunted inn once. The ghost complained about my snoring." },
      { id = "j19", text = "Why are ghouls so bad at cards? They keep losing their hands." },
      { id = "j20", text = "A skeleton refused to fight me yesterday. It hadn't the guts." },
      { id = "j21", text = "My armor has seen so many repairs that the smith calls it family." },
      { id = "j22", text = "I killed ten wolves to find one paw. Someone is breeding very strange wolves." },
      { id = "j23", text = "I've died so often that the spirit healer saves me a seat." },
      { id = "j24", text = "An ogre asked me a riddle. Both heads got it wrong, differently." },
      { id = "j25", text = "A mage conjured me some bread. Three days on, I can still taste it." },
      { id = "j26", text = "A warlock told me his imp was house trained. The house disagreed." },
      { id = "j27", text = "A hunter swore his bear never bites. Then he introduced it as 'Stumpy,' after me." },
      { id = "j28", text = "Never ask a druid what they've eaten lately. Especially not after cat form." },
      { id = "j29", text = "A rogue offered to watch my purse. He's still watching it, somewhere far away." },
      { id = "j30", text = "A priest told me the Light provides. It has yet to provide my repair bill." },
      { id = "j31", text = "Why did the warrior cross the road? He charged. He had no say in it." },
      { id = "j32", text = "I asked a paladin the time. It was noon when the sermon started." },
      { id = "j33", text = "Dwarves never dig too deep. They dig exactly deep enough to find trouble." },
      { id = "j34", text = "Never ask a night elf how long she's lived here, unless you've brought a chair." },
      { id = "j35", text = "Gnomish engineering works twice as well, half of the time." },
      { id = "j36", text = "Goblin engineering always works, once." },
      { id = "j37", text = "A murloc said something very rude to me. I think. Honestly, who can tell?" },
      { id = "j38", text = "I asked a murloc his name. I'm still wiping my face." },
      { id = "j39", text = "I brought a banker a sack of copper. He's still counting; I left last week." },
      { id = "j40", text = "My horse is so slow that the wolves get bored and go home." },
      { id = "j41", text = "I sold forty spider legs to a cook. I no longer eat at that inn." },
      { id = "j42", text = "Eight legs on that spider, and I came away with one. Explain that to me." },
      { id = "j43", text = "I skinned a bear and found no meat. Just more bear, all the way down." },
      { id = "j44", text = "I found a sword inside a wolf once. I've stopped asking how." },
      { id = "j45", text = "A boar was carrying two silver and a pair of trousers. I admire the ambition." },
      { id = "j46", text = "Someone paid me a silver to walk a letter twelve feet. I've found my calling." },
      { id = "j47", text = "I crossed two continents for a quest. The reward was gloves, and a third continent." },
      { id = "j48", text = "I asked why he needed ten bear paws. He said the first nine were practice." },
      { id = "j49", text = "A fire elemental walks into a tavern. Well, there used to be a tavern." },
      { id = "j50", text = "This ale is so watered down that a water elemental asked for its cousin back." },
      { id = "j51", text = "What did the tree say to the druid? Nothing, and he talked for hours anyway." },
      { id = "j52", text = "I've a joke about Blackrock Mountain, but it's dark and it goes on forever." },
      { id = "j53", text = "My cooking is so bad that the Scourge sent it back." },
      { id = "j54", text = "You can't swim in plate. I learned that the short way down." },
      { id = "j55", text = "I'd tell you a kodo joke, but it takes a while to turn around." },
      { id = "j56", text = "The good news: I found the cave. The bad news: so did the bears." },
      { id = "j57", text = "I wasn't running away. I was advancing rapidly toward the town guards." },
      { id = "j58", text = "The map said 'here be dragons.' The map was not exaggerating." },
      { id = "j59", text = "A fisherman told me patience is everything. I didn't wait to hear the rest." },
      { id = "j60", text = "First aid is easy. You just wrap it until it stops complaining." },
      { id = "j61", text = "The alchemist swore the potion was safe. He swore it from behind a table." },
      { id = "j62", text = "I bought a lucky charm from a goblin. It works; he's been very lucky." },
      { id = "j63", text = "An enchanter made my sword glow. Now everything in the dark finds me first." },
      { id = "j64", text = "My tailor says this is slimming. The ogre who hit me agreed." },
      { id = "j65", text = "Skinning is simple enough. The hard part is the animal's opinion." },
      { id = "j66", text = "I had boots made from a crocolisk. They still snap at people." },
      { id = "j67", text = "What's a kobold's favourite holiday? Any one with candles." },
      { id = "j68", text = "'You no take candle,' he said. So I took the whole kobold." },
      { id = "j69", text = "I've been to the Barrens. I have nothing funny to say about it." },
      { id = "j70", text = "I collected a book page by page off dead trolls. Worst library in the world." },
      { id = "j71", text = "I asked for the short road through Duskwood. They buried the last man who did." },
      { id = "j72", text = "Even the scarecrows in Westfall want you dead. The crows just watch." },
      { id = "j73", text = "Tanaris has two seasons: hot, and somebody has stolen your water." },
      { id = "j74", text = "Winterspring is so cold that the goblins keep their hands in their own pockets." },
      { id = "j75", text = "I went to Un'Goro for the scenery. The scenery chased me out again." },
      { id = "j76", text = "The Wetlands smell like a murloc's boot, and I have smelled both." },
      { id = "j77", text = "Lakeshire needs a bridge, Darkshire needs daylight, and I need a drink." },
      { id = "j78", text = "A gnoll tried to rob me. I offered him advice instead; he took that worse." },
      { id = "j79", text = "I had a long talk with an ooze. It went nowhere, but it stuck." },
      { id = "j80", text = "A miner and I reached the same copper vein at once. We're no longer speaking." },
      { id = "j81", text = "I asked the herbalist what's good for a headache. She said a helmet." },
      { id = "j82", text = "My last guide knew a shortcut. I do miss him." },
      { id = "j83", text = "I've a wonderful sense of direction. It's the roads that keep moving." },
      { id = "j84", text = "They said the treasure was guarded. They didn't say by what, or how many." },
      { id = "j85", text = "The Deeprun Tram is so long I grew a beard, and I'd started clean shaven." },
      { id = "j86", text = "I lit a campfire in Felwood. The wood screamed, so I ate cold." },
      { id = "j87", text = "A harpy said I had a lovely voice. That's how I knew she was lying." },
      { id = "j88", text = "A centaur challenged me to a race. I let him win; he had more legs." },
      { id = "j89", text = "A quilboar invited me to supper. I left when I learned what was for supper." },
      { id = "j90", text = "Furbolgs used to be friendly, until they met adventurers. Honestly, I see their point." },
      { id = "j91", text = "I told a murloc my name. He told me his. Now we're both upset." },
      { id = "j92", text = "Murlocs have only one word, and I'm fairly sure it means 'get him.'" },
      { id = "j93", text = "Kobolds mine candles, sell candles and fight over candles. I've never seen one read." },
      { id = "j94", text = "The Defias only rob the wealthy. I've never been so flattered to be robbed." },
      { id = "j95", text = "An ogre told me he'd been thinking. Both heads looked surprised." },
      { id = "j96", text = "Ogres aren't stupid. Each head is perfectly clever; they just take turns." },
      { id = "j97", text = "A harpy's song lures sailors to their deaths. Her speaking voice works faster." },
      { id = "j98", text = "Raptors hunt in threes: one to distract you, two to eat your lunch." },
      { id = "j99", text = "I fought a crocolisk once. It was all mouth, and then a bit more mouth." },
      { id = "j100", text = "The spider was the size of a horse. I haven't ridden a horse since." },
      { id = "j101", text = "Every cave I've ever entered had something living in it. I've started knocking." },
      { id = "j102", text = "I wanted a fast horse. He sold me a slow one and a head start." },
      { id = "j103", text = "Hearthstones are wonderful. Ten seconds of glowing, and you're home, still bleeding." },
      { id = "j104", text = "My horse knows the way home. It's the way out that troubles him." },
      { id = "j105", text = "I tried to sneak past a gnoll camp. My armor had other ideas." },
      { id = "j106", text = "I dropped my map in a river. Now it's a lovely map of a river." },
      { id = "j107", text = "Sailors say the sea gives and the sea takes. Mostly it took my boots." },
      { id = "j108", text = "A zeppelin is a goblin saying 'trust me' from a great height." },
      { id = "j109", text = "The zeppelin goblin offered me the safe seat. I asked which one explodes less." },
      { id = "j110", text = "Goblins invented the receipt, so there'd be proof they robbed you fairly." },
      { id = "j111", text = "Gnomes invented the steam tank. Goblins invented the steam tank that's for sale." },
      { id = "j112", text = "A gnome built a machine to find lost things. Now we're looking for the machine." },
      { id = "j113", text = "Every gnomish invention comes with a warning. Usually the warning is the explosion." },
      { id = "j114", text = "Dwarves dig too deep, wake something terrible, then complain about the neighbours." },
      { id = "j115", text = "A dwarf's idea of a light meal is one with fewer ales in it." },
      { id = "j116", text = "Tauren are so gentle. They'll apologise right after flattening you." },
      { id = "j117", text = "The Forsaken don't need to eat. Having tasted Brill's cooking, I understand." },
      { id = "j118", text = "Trolls warn you to stay away from the voodoo. Then they sell you some." },
      { id = "j119", text = "Night elves don't hold grudges. They just remember everything for ten thousand years." },
      { id = "j120", text = "An orc, a tauren and a troll walked into an inn. It's outdoors now." },
      { id = "j121", text = "Everyone wants to save the world. Nobody wants to fetch the boar livers first." },
      { id = "j122", text = "The Scarlet Crusade thinks everyone's secretly undead. Some mornings, I can't argue." },
      { id = "j123", text = "The Scourge has an army of the dead. Most kingdoms can't pay the living." },
      { id = "j124", text = "Necromancers are just people who can't let go." },
      { id = "j125", text = "A banshee screamed at me for an hour. I've had worse from innkeepers at closing." },
      { id = "j126", text = "Ghouls never win races. They keep stopping to eat the other runners." },
      { id = "j127", text = "An abomination is three people stitched together, and not one of them is happy." },
      { id = "j128", text = "Demons promise power, riches and eternal life. Goblins promise the same, at a discount." },
      { id = "j129", text = "Every demon I meet wants my soul. I'd no idea it was so popular." },
      { id = "j130", text = "Imps are three feet tall and full of fire. Like gnomes, but less dangerous." },
      { id = "j131", text = "An infernal fell out of the sky beside me. It didn't even apologise." },
      { id = "j132", text = "Dragons sleep on their gold. I tried it with my copper. Lumpy." },
      { id = "j133", text = "Whelps are adorable, right up until they breathe fire on you." },
      { id = "j134", text = "I asked a dragon if she'd ever been to Ironforge. She said she'd eaten there." },
      { id = "j135", text = "An earth elemental told me a joke. Rocky start, but a solid ending." },
      { id = "j136", text = "An air elemental told me a joke. It went right over my head." },
      { id = "j137", text = "Treants are lovely company, if you've a fortnight to spare for each sentence." },
      { id = "j138", text = "I tried a quiet drink in Booty Bay. I lost the drink, and the quiet." },
      { id = "j139", text = "Booty Bay has three rules: no fighting, no thieving, and absolutely no refunds." },
      { id = "j140", text = "In Gadgetzan they hang thieves. In Booty Bay they hire them." },
      { id = "j141", text = "A gnome engineer told me nothing could go wrong. He hasn't been seen since." },
      { id = "j142", text = "My mount cost a hundred gold. My purse still walks with a limp." },
      { id = "j143", text = "I saved a year to buy a horse. Now I can't afford the hay." },
      { id = "j144", text = "Everyone says 'stay on the road.' The road says nothing. It's in on it." },
      { id = "j145", text = "I saw a wanted poster with my face on it. They'd drawn me very kindly." },
      { id = "j146", text = "Every inn has a man who once saw a dragon. Every inn's dragon is bigger." },
      { id = "j147", text = "I beat an orc at arm-wrestling once. He was being polite." },
      { id = "j148", text = "Never wrestle a tauren. You'll lose, and he'll feel bad about it for weeks." },
      { id = "j149", text = "Elves call it meditating. When I do it, they call it sleeping on watch." },
      { id = "j150", text = "I asked a priest to bless my sword. She asked who I meant to hit." },
      { id = "j151", text = "A mage put out my campfire with a frostbolt. Also my supper, and my boots." },
      { id = "j152", text = "I tried to bribe a paladin once. The Light wasn't amused, and neither was he." },
      { id = "j153", text = "Ask a warrior how a fight went. You'll hear about every scratch, twice." },
      { id = "j154", text = "Rogues have no friends, only people who haven't noticed yet." },
      { id = "j155", text = "Hunters say their pets are family. I've seen what that wolf does to family." },
      { id = "j156", text = "Shamans talk to the elements. I've never once got a civil word out of fire." },
      { id = "j157", text = "Druids are lovely, but never let one sit on the good furniture. They shed." },
      { id = "j158", text = "Warlocks are delightful dinner guests, until something under the table answers." },
      { id = "j159", text = "My mother always said I'd see the world. She never said it would bite." },
      { id = "j160", text = "I won't say the food here is bad, but the flies eat out." },
      { id = "j161", text = "If I had a copper for every quest I've done, I'd have what they paid." },
      { id = "j162", text = "They called me a hero, then handed me a shovel and pointed at the kobolds." },
      { id = "j163", text = "The Light protects the righteous, I'm told. The rest of us carry shields." },
      { id = "j164", text = "What's green, angry and smells of wolf? Any orc you've just woken up." },
      { id = "j165", text = "What's tall, purple and always late? A night elf who said she'd come 'soon.'" },
      { id = "j166", text = "What's small, loud and on fire? A gnome who just said 'watch this.'" },
      { id = "j167", text = "What's big, furry and terribly polite? A tauren standing on your foot." },
      { id = "j168", text = "What has two heads and no ideas? I'd say an ogre, but I've met nobles." },
      { id = "j169", text = "Why did the gryphon bite the dwarf? It smelled ale and assumed he was sharing." },
      { id = "j170", text = "Why do murlocs live by the water? Nobody inland would put up with them." },
      { id = "j171", text = "Why did the skeleton go drinking alone? He had no body to go with." },
      { id = "j172", text = "Why don't the dead play hide and seek? The smell gives them away every time." },
      { id = "j173", text = "How do you know a dwarf's been at your ale? You don't. It's simply gone." },
      { id = "j174", text = "How do you find a rogue? Check your pockets, then turn around very slowly." },
      { id = "j175", text = "How do you find a hunter? Follow the trail of pet food and apologies." },
      { id = "j176", text = "How do you find a mage? Follow the smell of burnt eyebrows." },
      { id = "j177", text = "How do you spot a warlock? He's the one the cat won't sit near." },
      { id = "j178", text = "How do you spot a priest? She's the one begging you to leave the fire." },
      { id = "j179", text = "How do you spot a warrior? Don't bother. He's already charged you." },
      { id = "j180", text = "How do you spot a druid? Ask the bear in the corner. Politely." },
      { id = "j181", text = "I joined a guild for the company. Now I have forty people to disappoint." },
      { id = "j182", text = "I asked for the bill and the innkeeper laughed. Then she gave me the bill." },
      { id = "j183", text = "The fishing trainer says the fish are biting. Nothing has bitten me except the mosquitoes." },
      { id = "j184", text = "I've been told I have a face for the stage. A stage leaving town, specifically." },
      { id = "j185", text = "I bought a guaranteed cure for the plague. It also cured me of ten silver." },
      { id = "j186", text = "Bards say every hero has a tragic flaw. Mine is that I keep looting skulls." },
      { id = "j187", text = "My bags are so full that I've started wearing the overflow." },
      { id = "j188", text = "Some say the world is round. In Thousand Needles, it's mostly down." },
      { id = "j189", text = "I lost a duel to a level-headed gnome. It's the only level he has." },
      { id = "j190", text = "A troll tried to sell me a shrunken head. The head haggled better." },
      -- About yourself: by race.
      { id = "jr1", when = { race = "Human" }, text = "We humans have built Stormwind twice. Kindly note that we're improving." },
      { id = "jr2", when = { race = "Human" }, text = "My family farmed Elwynn for generations. The kobolds farmed our candles for longer." },
      { id = "jr3", when = { race = "Dwarf" }, text = "A dwarf never gets drunk. We simply get louder and closer to the floor." },
      { id = "jr4", when = { race = "Dwarf" }, text = "I'm not short. I'm built close to the ale." },
      { id = "jr5", when = { race = "Dwarf" }, text = "I'd have been here sooner, but there was a tavern in the way." },
      { id = "jr6", when = { race = "Gnome" }, text = "I'm not small. I'm concentrated." },
      { id = "jr7", when = { race = "Gnome" }, text = "People look down on me all day. I've a fine view of nostrils." },
      { id = "jr8", when = { race = "Gnome" }, text = "I built a machine to tell jokes. It exploded, and that got the laugh." },
      { id = "jr9", when = { race = "NightElf" }, text = "I'm younger than I look. Only four hundred, or thereabouts." },
      { id = "jr10", when = { race = "NightElf" }, text = "I once slept through an entire age. I still woke up tired." },
      { id = "jr11", when = { race = "NightElf" }, text = "We lived in trees for ten thousand years. Stairs are still a novelty." },
      { id = "jr12", when = { race = "Orc" }, text = "An orc's joke is short. Something falls down, and everyone laughs." },
      { id = "jr13", when = { race = "Orc" }, text = "My father told one joke in his life. It was about an axe." },
      { id = "jr14", when = { race = "Orc" }, text = "We settled in Durotar for the weather. That is the joke." },
      { id = "jr15", when = { race = "Troll" }, text = "I lost an arm on a bet once. I grew it back and lost that." },
      { id = "jr16", when = { race = "Troll" }, text = "Trolls don't grow old, you know. We just regrow whatever parts got old." },
      { id = "jr17", when = { race = "Troll" }, text = "My hair isn't a style. It's a warning." },
      { id = "jr18", when = { race = "Tauren" }, text = "No, I don't know your cow. Yes, people do ask." },
      { id = "jr19", when = { race = "Tauren" }, text = "I hit my head on your door, twice. Your door started it." },
      { id = "jr20", when = { race = "Tauren" }, text = "I tried to tiptoe once. Three villages felt it." },
      { id = "jr21", when = { race = "Scourge" }, text = "I'd laugh my head off, but I've only just had it sewn back on." },
      { id = "jr22", when = { race = "Scourge" }, text = "I've a bone to pick with you. Several, in fact; they keep falling off." },
      { id = "jr23", when = { race = "Scourge" }, text = "Dying wasn't so bad. It's the smell that takes getting used to." },
      { id = "jr24", when = { race = "Scourge" }, text = "I'd give my right arm for a good meal. Here, hold it a moment." },
      { id = "jr25", when = { race = "Human" }, text = "We humans built Stormwind's walls twice. We still haven't paid for the first lot." },
      { id = "jr26", when = { race = "Human" }, text = "Humans live short lives. That's why we're always in such a hurry to argue." },
      { id = "jr27", when = { race = "Human" }, text = "Every human village has a militia: one farmer, two pitchforks and a goose." },
      { id = "jr28", when = { race = "Dwarf" }, text = "My beard has held more ale than most taverns. Some of it on purpose." },
      { id = "jr29", when = { race = "Dwarf" }, text = "Dwarves don't get lost underground. We just find new places to be." },
      { id = "jr30", when = { race = "Dwarf" }, text = "My grandfather said never trust anyone taller than you. So, everyone." },
      { id = "jr31", when = { race = "Gnome" }, text = "Our old city is still lovely, I'm told. It glows in the dark now." },
      { id = "jr32", when = { race = "Gnome" }, text = "My hat is the tallest part of me, so I keep my best ideas there." },
      { id = "jr33", when = { race = "Gnome" }, text = "Everything I build explodes eventually. I call that a design feature." },
      { id = "jr34", when = { race = "NightElf" }, text = "I watched this tree grow from a seed. It's still not interesting." },
      { id = "jr35", when = { race = "NightElf" }, text = "Short-lived races call me patient. I call it waiting for you all to finish." },
      { id = "jr36", when = { race = "NightElf" }, text = "I'm told I glow faintly at night. It makes sneaking up on people very awkward." },
      { id = "jr37", when = { race = "Orc" }, text = "I tried to be subtle once. Two villages are still rebuilding." },
      { id = "jr38", when = { race = "Orc" }, text = "Orcs have one rule for a quarrel: whoever is still standing was right." },
      { id = "jr39", when = { race = "Orc" }, text = "Humans say orcs can't count. I count to ten just fine, and the axe agrees." },
      { id = "jr40", when = { race = "Troll" }, text = "I don't need a hearthstone, mon. I just die near home." },
      { id = "jr41", when = { race = "Troll" }, text = "Trolls make terrible patients. Da healer barely starts, and it's already grown back." },
      { id = "jr42", when = { race = "Tauren" }, text = "Your chairs are lovely. I've sat on three of them so far, briefly." },
      { id = "jr43", when = { race = "Tauren" }, text = "People ask if I'm related to the kodos. Only on my mother's side." },
      { id = "jr44", when = { race = "Tauren" }, text = "I bowed to greet an Ironforge banker. We're still fixing the counter." },
      { id = "jr45", when = { race = "Scourge" }, text = "Being dead has its advantages. For one, I'm never late for a funeral." },
      { id = "jr46", when = { race = "Scourge" }, text = "I don't sleep, I don't eat, and I still never get anything done." },
      { id = "jr47", when = { race = "Scourge" }, text = "My jaw falls off when I laugh, so I save it for good jokes." },
      -- About yourself: by class.
      { id = "jc1", when = { class = "MAGE" }, text = "I can conjure water, bread and an awkward silence. Watch." },
      { id = "jc2", when = { class = "MAGE" }, text = "I turned a man into a sheep once. His wife asked me to leave him." },
      { id = "jc3", when = { class = "WARLOCK" }, text = "Something whispers my jokes to me at night. It's a cruel little thing." },
      { id = "jc4", when = { class = "WARLOCK" }, text = "I sold my soul for power. I should have haggled." },
      { id = "jc5", when = { class = "HUNTER" }, text = "My pet gets a better seat at the inn than I do." },
      { id = "jc6", when = { class = "HUNTER" }, text = "I tamed a turtle last year. We've nearly reached the gate." },
      { id = "jc7", when = { class = "ROGUE" }, text = "I'd tell you a rogue joke, but you wouldn't see it coming." },
      { id = "jc8", when = { class = "ROGUE" }, text = "I'm an honest thief. I always tell people afterwards." },
      { id = "jc9", when = { class = "PRIEST" }, text = "I heal for a living. Mostly I heal people who stood in the fire." },
      { id = "jc10", when = { class = "PRIEST" }, text = "I prayed for patience. I got a warrior to look after instead." },
      { id = "jc11", when = { class = "WARRIOR" }, text = "I've been hit on the head so often that my own jokes surprise me." },
      { id = "jc12", when = { class = "WARRIOR" }, text = "My plan is always the same: run in. I never have a second part." },
      { id = "jc13", when = { class = "PALADIN" }, text = "I asked the Light for patience. It sent me squires to train." },
      { id = "jc14", when = { class = "PALADIN" }, text = "Paladins never lose an argument. We raise a bubble and wait for you to leave." },
      { id = "jc15", when = { class = "DRUID" }, text = "I spent a month as a bear. The honey was excellent; the conversation wasn't." },
      { id = "jc16", when = { class = "DRUID" }, text = "I can turn into a cat. I still can't make one come when called." },
      { id = "jc17", when = { class = "SHAMAN" }, text = "My totems never laugh at my jokes. They're a wooden audience." },
      { id = "jc18", when = { class = "SHAMAN" }, text = "I asked the spirits for a sign. It said 'no fishing.'" },
      { id = "jc19", when = { class = "MAGE" }, text = "I can teleport anywhere in the world, and I'm still late for everything." },
      { id = "jc20", when = { class = "MAGE" }, text = "I spent twenty years mastering fire. Now everybody asks me to light their pipes." },
      { id = "jc21", when = { class = "WARLOCK" }, text = "Demons offer perfectly fair contracts. The small print is just written in fire." },
      { id = "jc22", when = { class = "WARLOCK" }, text = "My voidwalker never says a word. Frankly, that makes it my best friend." },
      { id = "jc23", when = { class = "HUNTER" }, text = "My pet and I are inseparable, mostly because it ate the leash." },
      { id = "jc24", when = { class = "HUNTER" }, text = "I named my wolf 'Fluffy.' He took it personally, and so did my arm." },
      { id = "jc25", when = { class = "ROGUE" }, text = "I'm very good at sneaking. I've been standing here an hour, actually." },
      { id = "jc26", when = { class = "ROGUE" }, text = "My purse feels heavier today. I can't think whose it was." },
      { id = "jc27", when = { class = "PRIEST" }, text = "I can raise the dead, but I still can't raise the rent." },
      { id = "jc28", when = { class = "PRIEST" }, text = "Every warrior I heal says 'just one more.' It's never one more." },
      { id = "jc29", when = { class = "WARRIOR" }, text = "My battle plan has three steps: shout, charge, apologise to the healer." },
      { id = "jc30", when = { class = "WARRIOR" }, text = "I've lost only one fight. It was with a door, and the door had help." },
      { id = "jc31", when = { class = "PALADIN" }, text = "I can heal anyone, so people forget I'm also carrying a hammer." },
      { id = "jc32", when = { class = "PALADIN" }, text = "I wear ninety pounds of armor and a smile. Only one of them is holy." },
      { id = "jc33", when = { class = "DRUID" }, text = "I spent a week as a tree. Lovely neighbours, but a bit wooden." },
      { id = "jc34", when = { class = "DRUID" }, text = "I can become a bear, a cat or a seal. Mother prefers the seal." },
      { id = "jc35", when = { class = "SHAMAN" }, text = "The spirits of air, fire, earth and water all agree: I need a bath." },
      { id = "jc36", when = { class = "SHAMAN" }, text = "I carry four totems everywhere. My back has started speaking to the spirits." },
    },
    success = {
      { id = "s1", text = "Ha! Now that's a good one. I'll be telling that at supper and pretending it's my own." },
      { id = "s2", text = "Oh, that's terrible. That's truly terrible, and I'm laughing anyway, so well done." },
      { id = "s3", text = "Heh! I needed that today, {class}. It's been a long while since anyone made me laugh." },
      { id = "s4", text = "Ha ha! Where do you adventurers pick these up? Around the campfire, I suppose." },
      { id = "s5", text = "That's the best thing I've heard all week, and I've had a slow week, so take it kindly." },
      { id = "s6", text = "Hah! All right, you've earned a smile from me. Don't go spending it all in one place." },
      { id = "s7", text = "Oh, stop it, you'll have me in stitches, and I've work to do before dark." },
      { id = "s8", text = "Ha! I shouldn't laugh, but there's no helping it. You've a gift, friend." },
      { id = "s9", when = { race = "Scourge" }, text = "Ha! A dead {g:man|woman} with a sense of humor. I didn't know they left you that, and I'm glad they did." },
      { id = "s10", when = { race = "Gnome" }, text = "Ha! Short and to the point, like the one telling it. No offence meant; that was a good one." },
      { id = "s11", when = { race = "Dwarf" }, text = "Ha! Trust a dwarf to have a joke ready. I'd wager you've a hundred more where that came from." },
      { id = "s12", when = { race = "Tauren" }, text = "Ha! I never expected a joke from one so big and solemn. You tauren are full of surprises." },
    },
    fail = {
      { id = "f1", text = "Was that meant to be funny? I only ask because I couldn't tell." },
      { id = "f2", text = "I've heard that one before, {class}, and it wasn't any better the first time." },
      { id = "f3", text = "Hm. I'm sure that goes over well around a campfire, with plenty of ale to help it." },
      { id = "f4", text = "I don't have time for jokes today. If you've business with me, let's hear that instead." },
      { id = "f5", text = "You'll forgive me if I don't laugh. It's been that sort of a day." },
      { id = "f6", text = "Hm. Don't give up the adventuring for the stage just yet, is my advice." },
      { id = "f7", text = "I think I understood it. I simply didn't enjoy it." },
      { id = "f8", when = { race = "NightElf" }, text = "Ten thousand years of culture among your people, and that's the joke you chose to bring me?" },
      { id = "f9", when = { race = "Orc" }, text = "I'd heard orcs weren't much for jokes. It seems that I heard correctly." },
    },
  },
  taunt = {
    say = {
      { id = "t1", text = "Is that your fighting face, or did you just smell something?" },
      { id = "t2", text = "I've seen scarecrows with more backbone than you." },
      { id = "t3", text = "Do they pay you to stand there, or is it a punishment?" },
      { id = "t4", text = "You talk a great deal for someone who's never left town." },
      { id = "t5", text = "I've fought kobolds with more fire in them than you." },
      { id = "t6", text = "Did your mother dress you, or did you lose a bet?" },
      { id = "t7", text = "I've had tougher talks with my horse, and better answers." },
      { id = "t8", text = "Go on, say something clever. I'll wait. I've got all day." },
      { id = "t9", text = "You look as if you'd lose a fight with a strong breeze." },
      { id = "t10", text = "I scraped more frightening things off my boots this morning." },
      { id = "t11", text = "Are you always this dull, or is today a special effort?" },
      { id = "t12", text = "I'd call you slow, but a kodo would take offence." },
      { id = "t13", text = "Somebody told me you were formidable. Somebody was having a laugh." },
      { id = "t14", text = "You've the wits of a murloc and half the charm." },
      { id = "t15", text = "If brains were gold, you couldn't afford a loaf of bread." },
      { id = "t16", text = "I've met ogres with better conversation, and both heads were asleep." },
      { id = "t17", text = "Careful you don't strain yourself, standing about like that." },
      { id = "t18", text = "I've seen a gnoll hold a spear with more confidence." },
      { id = "t19", text = "Did you earn that scowl, or were you born with it?" },
      { id = "t20", text = "I'd wager you couldn't hit a barn from the inside." },
      { id = "t21", text = "My grandmother has a firmer handshake than you." },
      { id = "t22", text = "I heard you were tough. Then I saw you." },
      { id = "t23", text = "Come on, then. Surely you've more in you than a glare." },
      { id = "t24", text = "I've seen livelier faces on the fish at market." },
      { id = "t25", text = "You've the look of someone who's never been properly punched." },
      { id = "t26", text = "Do you practise that expression, or does stupidity come naturally?" },
      { id = "t27", text = "I could do your job in my sleep. It seems you already are." },
      { id = "t28", text = "Tell me, does anyone here actually listen to you?" },
      { id = "t29", text = "You're all bark. I've yet to see a single tooth." },
      { id = "t30", text = "I expected more. I always do, and people like you always disappoint." },
      { id = "t31", when = { race = "Human" }, text = "I've seen Westfall farmers with more fight in them, and they've lost everything." },
      { id = "t32", when = { race = "Dwarf" }, text = "I've drunk more dangerous things than you before breakfast." },
      { id = "t33", when = { race = "Gnome" }, text = "I may be small, but at least I'm not small-minded." },
      { id = "t34", when = { race = "NightElf" }, text = "In ten thousand years, I've never met anyone so unimpressive." },
      { id = "t35", when = { race = "Orc" }, text = "My grandmother hit harder than you look, and she's long dead." },
      { id = "t36", when = { race = "Troll" }, text = "I've seen scarier faces carved on a coconut." },
      { id = "t37", when = { race = "Tauren" }, text = "I have stepped over tougher things than you without noticing." },
      { id = "t38", when = { race = "Scourge" }, text = "I'm the dead one here, yet you're the one with no spark." },
      { id = "t39", when = { class = "WARRIOR" }, text = "I've broken sturdier things than you with a dull blade." },
      { id = "t40", when = { class = "ROGUE" }, text = "I could have your purse and your boots before you finished blinking." },
      { id = "t41", when = { class = "MAGE" }, text = "I've turned brighter people than you into sheep. It improved them." },
      { id = "t42", when = { class = "HUNTER" }, text = "My pet wants to play with you. It never picks anything dangerous." },
      { id = "t43", when = { class = "WARLOCK" }, text = "Something I keep does a fine impression of you. It's mostly whining." },
      { id = "t44", when = { class = "PALADIN" }, text = "The Light loves everyone. With you, I imagine it takes some effort." },
      { id = "t45", when = { class = "PRIEST" }, text = "I'd pray for you, but I doubt anyone's listening on your account." },
      { id = "t46", when = { class = "DRUID" }, text = "I've met badgers with more sense, and better manners." },
      { id = "t47", when = { class = "SHAMAN" }, text = "Even the wind finds you tedious. It told me so itself." },
    },
  },
  intimidate = {
    say = {
      { id = "i1", text = "I've killed things today that would eat you whole. Choose your words carefully." },
      { id = "i2", text = "You'll want to be helpful. I'm far less pleasant when I'm disappointed." },
      { id = "i3", text = "Look at my weapon, then look at me, and think very hard." },
      { id = "i4", text = "I've had a long day and a short temper. Don't test either." },
      { id = "i5", text = "There's blood on my boots that isn't mine. Shall we talk?" },
      { id = "i6", text = "I'm asking nicely. You won't enjoy it when I stop." },
      { id = "i7", text = "People who cross me tend to regret it, briefly." },
      { id = "i8", text = "I didn't come all this way to be told no." },
      { id = "i9", text = "You've a nice quiet life here. It'd be a shame to complicate it." },
      { id = "i10", text = "I've buried better than you. Now, be sensible." },
      { id = "i11", text = "Don't make me repeat myself. I'm not known for my patience." },
      { id = "i12", text = "You're going to help me, and we both know it." },
      { id = "i13", text = "Take a good look at me. Do I seem like someone to trifle with?" },
      { id = "i14", text = "I've walked out of places nobody walks out of. Remember that." },
      { id = "i15", text = "Think carefully. I remember every face that has wronged me." },
      { id = "i16", text = "One of us is leaving here unhappy. It needn't be you." },
      { id = "i17", text = "I can be a good friend or a very bad afternoon." },
      { id = "i18", text = "The last one who wasted my time is still limping." },
      { id = "i19", text = "Careful. I'm armed, I'm tired, and I'm out of manners." },
      { id = "i20", text = "Stay on my good side. It's the only safe one." },
      { id = "i21", text = "You've no idea what I'm capable of. Shall I show you?" },
      { id = "i22", text = "I'd hate for this to become unpleasant. Wouldn't you?" },
      { id = "i23", text = "Nobody would hear you over the noise of this place. Think on that." },
      { id = "i24", text = "I'm not asking twice, and I'm not asking kindly." },
      { id = "i25", when = { race = "Human" }, text = "I've stood against orcs and the walking dead. You're neither." },
      { id = "i26", when = { race = "Dwarf" }, text = "I've a hammer, a temper, and nothing else planned for today." },
      { id = "i27", when = { race = "Gnome" }, text = "I'm small, yes. So is a stick of dynamite." },
      { id = "i28", when = { race = "NightElf" }, text = "I have hunted in the dark for centuries. You would never hear me." },
      { id = "i29", when = { race = "Orc" }, text = "I am an orc with an axe and no patience. Decide quickly." },
      { id = "i30", when = { race = "Troll" }, text = "My people used to eat those who annoyed us. Some still do." },
      { id = "i31", when = { race = "Tauren" }, text = "I could lift you with one hand. Do not make me prove it." },
      { id = "i32", when = { race = "Scourge" }, text = "I've already died once. Ask yourself what is left to frighten me." },
      { id = "i33", when = { class = "WARLOCK" }, text = "What follows me is hungry, and it isn't particular about what it eats." },
      { id = "i34", when = { class = "ROGUE" }, text = "You would never see the knife. Most people don't." },
      { id = "i35", when = { class = "MAGE" }, text = "I could set your eyebrows alight from here. Shall I?" },
      { id = "i36", when = { class = "WARRIOR" }, text = "I break things for a living. People are only softer things." },
      { id = "i37", when = { class = "HUNTER" }, text = "My beast hasn't eaten today, and it's looking at you." },
      { id = "i38", when = { class = "PRIEST" }, text = "I know the shadow as well as the Light. Don't make me choose." },
      { id = "i39", when = { class = "SHAMAN" }, text = "The elements answer when I call. Lightning is not a gentle answer." },
      { id = "i40", when = { class = "DRUID" }, text = "I can be a bear in a heartbeat. The bear doesn't negotiate." },
      { id = "i41", when = { class = "PALADIN" }, text = "The Light is merciful. I only carry its hammer." },
    },
  },
}

---------------------------------------------------------------------------
-- By side (the player's)
---------------------------------------------------------------------------
P:Persuade { id = "say_alliance", faction = "Alliance",
  joke = { say = {
    { id = "j1", text = "Orcish diplomacy is simple. First they try a big axe, then a bigger one." },
    { id = "j2", text = "Why do the Forsaken make poor spies? You can smell them from Southshore." },
    { id = "j3", text = "The Defias say they want justice. So far it's mostly been my boots." },
    { id = "j4", text = "Stormwind's nobles would end the war tomorrow, if only it were held indoors." },
    { id = "j5", text = "A gnome and a dwarf share a tram. Only one of them can see out." },
  } },
}

P:Persuade { id = "say_horde", faction = "Horde",
  joke = { say = {
    { id = "j1", text = "The Alliance has seven peoples and one plan: the humans talk until we leave." },
    { id = "j2", text = "Stormwind lost its king. Not in a battle, mind you. They simply misplaced him." },
    { id = "j3", text = "Why do dwarves grow beards? So the ale has somewhere to wait." },
    { id = "j4", text = "A peon finished a job early once. Nobody has believed a word of it." },
    { id = "j5", text = "The Crossroads has two kinds of folk: Mankrik's wife hunters, and people hiding from them." },
    { id = "j6", text = "Everyone in the Barrens asked me the same thing: where is Mankrik's wife?" },
  } },
}

---------------------------------------------------------------------------
-- By what they do
---------------------------------------------------------------------------
P:Persuade { id = "say_guard", role = { "guard", "soldier", "militia" },
  admire = { say = {
    { id = "a1", text = "This place sleeps soundly because of soldiers like you." },
    { id = "a2", text = "That's a well-kept blade. You clearly know your trade." },
    { id = "a3", text = "You stand that post like a statue. I couldn't manage an hour." },
    { id = "a4", text = "I've seen armies with less discipline than you show alone." },
  } },
  joke = { say = {
    { id = "j1", text = "Is it true guards know only two directions, 'that way' and 'move along'?" },
    { id = "j2", text = "How many guards does it take to catch a thief? We'll know when it happens." },
    { id = "j3", text = "Do you ever sit down, or does the armor not bend that way?" },
    { id = "j4", text = "I hear the night watch sleeps so soundly that the thieves tuck them in." },
    { id = "j5", text = "If I ask you for directions, will the answer be 'I'm not sure'?" },
  } },
  taunt = { say = {
    { id = "t1", text = "Is that armor polished, or have you simply never been in a fight?" },
    { id = "t2", text = "They'd post a real soldier here if anything here mattered." },
    { id = "t3", text = "I'd wager thieves walk past you every day and wave." },
    { id = "t4", text = "Do you ever use that sword, or is it just for leaning on?" },
  } },
  intimidate = { say = {
    { id = "i1", text = "I've cut through whole camps of things far worse than a guard." },
    { id = "i2", text = "That uniform won't stop what I carry. Think it over." },
    { id = "i3", text = "You've friends close by, I know. I've faced worse odds this week." },
  } },
}

P:Persuade { id = "say_innkeeper", role = "innkeeper",
  admire = { say = {
    { id = "a1", text = "This is the warmest hearth I've found in a month of travel." },
    { id = "a2", text = "Whatever is in that pot smells better than anything I've eaten all year." },
    { id = "a3", text = "You keep a fine house. A traveller knows the difference." },
  } },
  joke = { say = {
    { id = "j1", text = "Is the stew fresh, or has it been adventuring for weeks as well?" },
    { id = "j2", text = "A bed, a meal, and no questions about the smell. That's all I ask." },
    { id = "j3", text = "I'd like a room with a view of anything but more boars." },
    { id = "j4", text = "Do you charge extra for the snoring, or is that only mine?" },
    { id = "j5", text = "I'll take your strongest drink. I've seen what's outside." },
  } },
  taunt = { say = {
    { id = "t1", text = "I've slept in ditches cleaner than your best room." },
    { id = "t2", text = "Your ale tastes like the bucket it was mopped up with." },
    { id = "t3", text = "Is this an inn, or a stable that lost its horses?" },
  } },
  intimidate = { say = {
    { id = "i1", text = "It's a lovely inn. I'd hate for my temper to redecorate it." },
    { id = "i2", text = "Wooden walls, open fires. An accident wouldn't take much, would it?" },
  } },
}

P:Persuade { id = "say_vendor", role = "vendor",
  admire = { say = {
    { id = "a1", text = "You keep the finest stock I've seen in this whole land." },
    { id = "a2", text = "An honest trader! I'd begun to think you were a legend." },
    { id = "a3", text = "You know your goods better than anyone I've bought from." },
  } },
  joke = { say = {
    { id = "j1", text = "Your prices are a joke. No, truly, I'm asking if they're meant to be." },
    { id = "j2", text = "I'll sell you forty wolf fangs. No? Nobody ever wants the fangs." },
    { id = "j3", text = "Do you buy grey junk? Good. I've brought you a bag of disappointments." },
    { id = "j4", text = "What will you give me for a ruined pelt and a broken dream?" },
    { id = "j5", text = "I'd haggle, but I can't afford the argument." },
  } },
  taunt = { say = {
    { id = "t1", text = "I've seen better goods fall off the back of a kodo." },
    { id = "t2", text = "You call these prices fair? Even a goblin would blush." },
    { id = "t3", text = "Did you make these yourself, or find them in a ditch?" },
  } },
  intimidate = { say = {
    { id = "i1", text = "A fine stall, but flimsy. Things break so easily, don't they?" },
    { id = "i2", text = "I'd think again about that price, if I were you." },
  } },
}

P:Persuade { id = "say_banker", role = { "banker", "auctioneer" },
  admire = { say = {
    { id = "a1", text = "I'd trust you with every coin I own, and I'm not a trusting sort." },
    { id = "a2", text = "You've a head for figures that I can only envy." },
  } },
  joke = { say = {
    { id = "j1", text = "I'd like to deposit one copper and all my hopes for the future." },
    { id = "j2", text = "Is my gold safe here? There's so little that it could hide anywhere." },
    { id = "j3", text = "I'd like to bid on some dignity. Mine sold cheaply." },
    { id = "j4", text = "My fortune fits in one hand. Please don't count it aloud." },
  } },
  taunt = { say = {
    { id = "t1", text = "You guard other people's gold. Have you never fancied earning your own?" },
    { id = "t2", text = "You count coins all day. Do you ever get to keep one?" },
  } },
  intimidate = { say = {
    { id = "i1", text = "You count coins. I count the fallen. Let's not compare sums." },
  } },
}

P:Persuade { id = "say_flightmaster", role = "flightmaster",
  admire = { say = {
    { id = "a1", text = "Your beasts are beautifully kept. They plainly adore you." },
    { id = "a2", text = "I've never had a smoother flight than from your roost." },
  } },
  joke = { say = {
    { id = "j1", text = "Does the beast know the way, or do we both just hope?" },
    { id = "j2", text = "My last flight took the scenic route, through a storm, sideways." },
    { id = "j3", text = "Has anyone ever asked the beast what it thinks of the fare?" },
    { id = "j4", text = "The flight costs silver. The screaming on the way is free, I take it?" },
  } },
  taunt = { say = {
    { id = "t1", text = "Your beast looks ready to retire, and so do you." },
    { id = "t2", text = "I've flown faster falling off a cliff." },
  } },
  intimidate = { say = {
    { id = "i1", text = "I'd hate for you to learn how high your own beasts fly." },
  } },
}

P:Persuade { id = "say_trainer", role = "trainer",
  admire = { say = {
    { id = "a1", text = "They say you're the finest teacher there is. I believe it." },
    { id = "a2", text = "Everything I do well, I learned from someone like you." },
  } },
  joke = { say = {
    { id = "j1", text = "You've taught me everything I know. That's why I keep dying." },
    { id = "j2", text = "Every level you charge me more. Is it lessons, or a toll for surviving?" },
    { id = "j3", text = "I practised what you taught me. The target dummy won." },
  } },
  taunt = { say = {
    { id = "t1", text = "Those who can't do it, teach it. Which are you?" },
    { id = "t2", text = "When did you last do this outside a classroom?" },
  } },
  intimidate = { say = {
    { id = "i1", text = "You taught me well. Don't make me show you how well." },
  } },
}

P:Persuade { id = "say_blacksmith", role = "blacksmith",
  admire = { say = {
    { id = "a1", text = "That's masterful work. I've seen far worse sold for far more." },
    { id = "a2", text = "My life has hung on a smith's work many times. Yours I'd trust." },
  } },
  joke = { say = {
    { id = "j1", text = "My armor is more patch than plate. Charge me by the hole, would you?" },
    { id = "j2", text = "Can you fix a dent this size? It's shaped like an ogre's opinion." },
    { id = "j3", text = "I don't need it sharpened. I need it to stop making that noise." },
  } },
  taunt = { say = {
    { id = "t1", text = "Did you forge that with a hammer, or with your forehead?" },
    { id = "t2", text = "I've seen straighter blades on a butter knife." },
  } },
  intimidate = { say = {
    { id = "i1", text = "You make the weapons. I'm the one who uses them." },
  } },
}

P:Persuade { id = "say_stablemaster", role = "stablemaster",
  admire = { say = {
    { id = "a1", text = "Animals know a good heart. Yours all look very content." },
  } },
  joke = { say = {
    { id = "j1", text = "My pet has eaten better than I have for a month. Is that usual?" },
    { id = "j2", text = "Mind him, he bites. No, the other end. Both ends, really." },
  } },
  taunt = { say = {
    { id = "t1", text = "It smells no better on your side of the stalls, I notice." },
  } },
}

P:Persuade { id = "say_peon", role = { "peon", "worker" },
  admire = { say = {
    { id = "a1", text = "You work harder than anyone here, and somebody ought to say so." },
  } },
  joke = { say = {
    { id = "j1", text = "'Work, work'? Friend, that's the only joke you've ever needed." },
    { id = "j2", text = "I'd offer to help you, but I'd hate to ruin your rhythm." },
  } },
  taunt = { say = {
    { id = "t1", text = "Even your fellows say you're lazy, and that takes some doing." },
  } },
  intimidate = { say = {
    { id = "i1", text = "Get to the point, before I find you a heavier load." },
  } },
}

P:Persuade { id = "say_child", role = "child",
  joke = { say = {
    { id = "j1", text = "Why did the chicken cross the road? Adventurers kept clucking at it." },
    { id = "j2", text = "What do you call a murloc with no legs? Anything; it can't chase you." },
    { id = "j3", text = "What's a kobold's favourite game? Hide the candle." },
  } },
}

---------------------------------------------------------------------------
-- For certain people: jokes only they would get, and how each takes it
---------------------------------------------------------------------------
P:Persuade { id = "say_thrall", npc = "Thrall", joke = { say = {
  { id = "j1", text = "Warchief, is it true they built Orgrimmar around your chair?",
    success = "Ha! If they had, {class}, I'd have asked for a softer seat. Nazgrel will be scandalised to learn that I laughed.",
    fail = "I've little time for jests today, {class}. Speak your business." },
  { id = "j2", text = "Warchief, do the peons say 'work, work' to you as well?",
    success = "They say it to everyone, and I wouldn't have it otherwise. An honest grumble is the sound of a free people.",
    fail = "They do, and they have earned the right. I'd thank you not to make sport of them in my hall." },
} } }

P:Persuade { id = "say_bolvar", npc = "Highlord Bolvar Fordragon", joke = { say = {
  { id = "j1", text = "Highlord, how many nobles does it take to pass one decree?",
    success = "More than I've patience for, and each wants it named after their house. You've sat through a session of the court, I take it.",
    fail = "The business of the realm is no laughing matter, {class}, however much I might sometimes wish it were." },
} } }

P:Persuade { id = "say_magni", npc = "King Magni Bronzebeard", joke = { say = {
  { id = "j1", text = "Your Majesty, is the Great Forge only there to warm your ale?",
    success = "Ha! Warm ale? Bite yer tongue! The forge is fer steel, an' the ale stays cold in the deep cellars where it belongs.",
    fail = "That forge armed every dwarf who ever held the gates, {g:lad|lass}. Ye'll not make a jest o' it in my hall." },
  { id = "j2", text = "Your Majesty, which is older, this mountain or your brother's excuses?",
    success = "Ha! Brann's excuses, by a good thousand years! 'Just one more ruin, Magni.' Aye, I've heard that one a few times.",
    fail = "Ye'll leave my brothers out o' yer jokes, {class}. One o' them I've already buried." },
} } }

P:Persuade { id = "say_nat", npc = "Nat Pagle", joke = { say = {
  { id = "j1", text = "Nat, what's the biggest thing you ever caught? A cold doesn't count.",
    success = "Heh. Biggest thing I ever caught was a nap, friend, and I've been tryin' to land another one ever since you walked up.",
    fail = "Shh. You're scarin' the fish, and the fish are the only ones here I was hopin' to talk to." },
  { id = "j2", text = "Is it still called fishing if you never bait the hook?",
    success = "That's the purest kind there is. A fish can't disappoint you if you never ask anythin' of it.",
    fail = "It's called mindin' your own business, and I recommend it highly." },
} } }

P:Persuade { id = "say_hemet", npc = "Hemet Nesingwary", joke = { say = {
  { id = "j1", text = "Master Nesingwary, have the beasts of Stranglethorn lodged a complaint yet?",
    success = "Ha! If they have, they can deliver it in person. I'll be right here wi' a loaded rifle an' a pot o' tea.",
    fail = "The hunt's no' a joke, {g:lad|lass}. Come back when ye've stared down a charging tiger an' we'll see who's laughin'." },
} } }

P:Persuade { id = "say_revilgaz", npc = "Baron Revilgaz", joke = { say = {
  { id = "j1", text = "Baron, is it still piracy if you charge a docking fee first?",
    success = "Friend, once there's a fee, it's called commerce. I worked very hard to learn the difference, and so did my Bruisers.",
    fail = "Careful, friend. The word 'piracy' is bad for business, and things that are bad for business tend to end up in my harbor." },
} } }

P:Persuade { id = "say_cairne", npc = "Cairne Bloodhoof", joke = { say = {
  { id = "j1", text = "High Chieftain, do the kodos ever get used to the lifts?",
    success = "Hm, hm! No more than I have, young one. My son swears he once heard a kodo praying on the way up.",
    fail = "Laughter is welcome on these bluffs, young one, but today my thoughts are heavy. Another time." },
} } }

P:Persuade { id = "say_sylvanas", npc = "Lady Sylvanas Windrunner", joke = { say = {
  { id = "j1", text = "Dark Lady, I'd say you look well, but I value my life.",
    success = "A jest, in my court. How novel. You may keep your tongue, {class}; it amuses me, for the moment.",
    fail = "The living laugh. We have other occupations. Do not waste my time again." },
} } }

P:Persuade { id = "say_tyrande", npc = "Tyrande Whisperwind", joke = { say = {
  { id = "j1", text = "High Priestess, after ten thousand years, do the same jokes come round again?",
    success = "They do, and I confess that I laughed at that one when it was new. It has aged better than most of us.",
    fail = "There is a time for levity, child, and the temple at prayer is not that time." },
} } }

P:Persuade { id = "say_mekkatorque", npc = "High Tinker Mekkatorque", joke = { say = {
  { id = "j1", text = "High Tinker, what do you call a gnomish device that works first time?",
    success = "Unfinished! Ha! If it works the first time, somebody forgot to add the improvements, and I'll want to see their notes.",
    fail = "I'd laugh, {class}, but the last device of ours that worked exactly as designed cost us Gnomeregan." },
} } }

P:Persuade { id = "say_jaina", npc = "Lady Jaina Proudmoore", joke = { say = {
  { id = "j1", text = "Lady Proudmoore, can you conjure a day of rest, or only bread?",
    success = "If I could, I'd have conjured one years ago and hidden inside it. The bread is the best I can offer, I'm afraid, and it goes stale.",
    fail = "I wish I had the leisure to laugh at that. Theramore doesn't leave me much of it." },
} } }

P:Persuade { id = "say_topper", npc = "Topper McNabb", joke = { say = {
  { id = "j1", text = "I'd give you a copper, Topper, but a murloc borrowed my purse.",
    success = "Hah! A murloc with a purse! He's richer than old Topper, then. That's worth more than a copper, friend, though I'd still take the copper.",
    fail = "Very funny. I can't eat funny, friend. A copper, though, I could eat a copper's worth of bread." },
} } }

P:Persuade { id = "say_gazlowe", npc = "Gazlowe", joke = { say = {
  { id = "j1", text = "Gazlowe, what's the difference between a goblin deal and a robbery?",
    success = "Paperwork, pal, and I got plenty of it. You want a job? Anybody who knows that much is already half hired.",
    fail = "The difference is I don't get insulted durin' a robbery, pal. You buyin' somethin' or not?" },
} } }

P:Persuade { id = "say_voljin", npc = "Vol'jin", joke = { say = {
  { id = "j1", text = "Is it true that only trolls tell good jokes about trolls?",
    success = "Dat be true, mon, 'cause nobody else live long enough to finish one. Ha! You be alright.",
    fail = "It be true, and you just proved it. Sit down before you hurt yourself, mon." },
} } }

P:Persuade { id = "say_prestor", npc = "Lady Katrana Prestor", joke = { say = {
  { id = "j1", text = "My lady, is the court always this dull, or is it only the nobles?",
    success = "How refreshing. Someone at last says aloud what everyone here merely thinks. Do come again, {class}; the court could use the diversion.",
    fail = "You forget where you stand. The guards can remind you, if I ask them to." },
} } }

P:Persuade { id = "say_noggenfogger", npc = "Marin Noggenfogger", joke = { say = {
  { id = "j1", text = "Is your elixir safe, or will I only shrink a little?",
    success = "Safe? Pal, it's better than safe, it's surprising! You might shrink, you might float, you might turn all bones, and every one of those is a bargain!",
    fail = "Hey, hey, not so loud, pal! There are paying customers around, and some of them haven't shrunk yet." },
} } }

P:Persuade { id = "say_brohann", npc = "Brohann Caskbelly", joke = { say = {
  { id = "j1", text = "Brohann, do you explore ruins these days, or only the bottom of that mug?",
    success = "Ha! Both, {g:lad|lass}, an' the mug's given up more treasure lately. Pull up a crate an' I'll show ye how the diggin's done.",
    fail = "I was explorin' ruins before ye could walk, {g:lad|lass}. I've earned every drop in this mug." },
} } }

P:Persuade { id = "say_dughan", npc = "Marshal Dughan", joke = { say = {
  { id = "j1", text = "Marshal, are the kobolds winning, or is it merely a draw?",
    success = "Ha! Don't you start. If I had a silver for every candle those vermin have cost me, I could hire an army and be done with it.",
    fail = "I've buried good men this season, {class}. I'll thank you not to keep score for me." },
} } }

P:Persuade { id = "say_chromie", npc = "Chromie", joke = { say = {
  { id = "j1", text = "Chromie, stop me if you've already heard this one.",
    success = "Oh, I have! Twice, actually, and you tell it better next year. Go on anyway; I like the way you do the ending.",
    fail = "I have, and I'm sorry to say that it doesn't get a laugh in any of the timelines I've visited." },
} } }

P:Persuade { id = "say_azuregos", npc = "Azuregos", joke = { say = {
  { id = "j1", text = "Great one, do dragons hoard jokes as well as treasure?",
    success = "Only the bad ones, mortal, for those are the ones that nobody tries to steal. Yours I shall keep; it is very nearly awful enough.",
    fail = "I have heard every jest your kind has devised, and outlived everyone who told them. Yours adds nothing to the collection." },
} } }

P:Persuade { id = "say_mankrik", npc = "Mankrik", joke = { say = {
  { id = "j1", text = "Mankrik, half the Barrens is out looking for your wife, you know.",
    success = "Hrm. Then half the Barrens has more heart than I gave it credit for. It is a bitter thing to smile at, but I will take it.",
    fail = "You think that is a jest? Olgra is dead, and my heart went with her. Speak of her with respect, or do not speak of her." },
} } }

P:Persuade { id = "say_allison", npc = "Innkeeper Allison", joke = { say = {
  { id = "j1", text = "Allison, is it true you water the ale straight from the canals?",
    success = "Bite your tongue! The canal water goes in the stew. The ale gets good rainwater, as you very well know.",
    fail = "I'll have you know this is the finest inn in Stormwind, and you may drink elsewhere if you think otherwise." },
} } }

P:Persuade { id = "say_farley", npc = "Innkeeper Farley", joke = { say = {
  { id = "j1", text = "Farley, does anyone in Goldshire ever actually go to bed?",
    success = "Not so you'd notice! They dance on my tables until dawn and then ask what's for breakfast. I love them, mostly.",
    fail = "You try keeping an inn here for a week, friend, and then tell me how funny you find it." },
} } }

P:Persuade { id = "say_gryshka", npc = "Innkeeper Gryshka", joke = { say = {
  { id = "j1", text = "Gryshka, what's in the stew today? Or is it best that I don't ask?",
    success = "Meat. You ask what meat, you get less of it. Ha! Sit down, and I'll fill a bowl for you.",
    fail = "It is best you don't ask, and better that you don't joke. Eat it or go hungry." },
} } }

P:Persuade { id = "say_emma", npc = "Ol' Emma", joke = { say = {
  { id = "j1", text = "Emma, has anyone ever beaten you to the well?",
    success = "Hah! Forty years I've carried these buckets, deary, and the only thing that's ever beaten me is my own knees.",
    fail = "Laugh all you like. You've never carried water a day in your life, I can tell by your hands." },
} } }

P:Persuade { id = "say_billy", npc = "Billy Maclure", joke = { say = {
  { id = "j1", text = "Billy, do you suppose the pies around here steal themselves?",
    success = "I don't know nothing about nothing! ...But pies do go missing awful easy around here, don't they? Heh.",
    fail = "I didn't take anything, and you can't prove it, and I'm telling my ma you said so!" },
} } }

P:Persuade { id = "say_cork", npc = "Cork Gizelton", joke = { say = {
  { id = "j1", text = "Cork, has this caravan ever arrived anywhere on time?",
    success = "On time? Friend, in Desolace, arriving at all is on time. The kodos set the schedule and the centaur set the detours.",
    fail = "You walk this road twice a week with centaur on both sides, friend, and then you can joke about my schedule." },
} } }

P:Persuade { id = "say_seahorn", npc = "Fleet Master Seahorn", joke = { say = {
  { id = "j1", text = "Fleet Master, how do you tell a pirate from a customer?",
    success = "The customer pays before he's hanged, friend. Ha! No, no, we don't hang the customers. Not the ones who pay.",
    fail = "By the manners, usually, and yours aren't helping your case." },
} } }

P:Persuade { id = "say_overspark", npc = "Tinkmaster Overspark", joke = { say = {
  { id = "j1", text = "Tinkmaster, how many gnomes does it take to tighten one bolt?",
    success = "Three! One to tighten it, one to document it, and one to propose a better bolt. Ha! You've met my apprentices, clearly.",
    fail = "One, if people would stop interrupting that one with riddles. I'm calibrating." },
} } }

P:Persuade { id = "say_narain", npc = "Narain Soothfancy", joke = { say = {
  { id = "j1", text = "Narain, you saw this joke coming, didn't you?",
    success = "I did, and I laughed at it yesterday so that I wouldn't have to interrupt you today. It was very good.",
    fail = "I did. I also saw that I wouldn't laugh, and here we both are." },
} } }

P:Persuade { id = "say_althea", npc = "Commander Althea Ebonlocke", joke = { say = {
  { id = "j1", text = "Commander, does anything in Duskwood ever stay buried?",
    success = "Only my hopes of a quiet night. ...That was very nearly a smile, {class}. Don't tell the Watch.",
    fail = "People in this town have buried their kin twice over. Find something else to laugh about." },
} } }

P:Persuade { id = "say_solomon", npc = "Magistrate Solomon", joke = { say = {
  { id = "j1", text = "Magistrate, has Stormwind answered yet, or shall I check for cobwebs?",
    success = "Cobwebs would at least be a reply. I've written so many letters to the capital that the couriers flinch when they see me coming.",
    fail = "Lakeshire is under siege, {class}. Forgive me if I can't find the humor in Stormwind's silence." },
} } }

P:Persuade { id = "say_payson", npc = "Jeremiah Payson", joke = { say = {
  { id = "j1", text = "Jeremiah, do your roaches do tricks, or do they only outlive everyone?",
    success = "Outliving everyone is the trick, friend. It's the only one I've managed myself, and look how well that's going.",
    fail = "They don't do tricks and neither do I. You want a roach or not?" },
} } }

P:Persuade { id = "say_gryth", npc = "Gryth Thurden", joke = { say = {
  { id = "j1", text = "Gryth, has a gryphon ever refused a dwarf for being too heavy?",
    success = "Refused? They're bred tae carry a dwarf in full plate wi' a keg under each arm. It's the gnomes they lose track of.",
    fail = "My gryphons have carried better than ye through worse than this, an' never a word o' complaint. Mind yer tongue." },
} } }

---------------------------------------------------------------------------
-- More jokes (0.114.0): by side, by trade, by place, and for certain people
---------------------------------------------------------------------------
P:Persuade { id = "say_alliance2", faction = "Alliance", joke = { say = {
  { id = "j1", text = "Stormwind's canals are so filthy that the murlocs moved out in protest." },
  { id = "j2", text = "How many night elves does it take to light a lamp? One, eventually." },
  { id = "j3", text = "Gnomes and dwarves share Ironforge. One builds the machines, the other blames them." },
  { id = "j4", text = "Our army has knights, mages, priests and gnomes. Nobody's sure what the gnomes are for." },
  { id = "j5", text = "Darnassus hides its bank as if it were an ancient secret." },
  { id = "j6", text = "The House of Nobles has debated the Defias for years. The Defias have kept busy." },
  { id = "j7", text = "The Alliance never retreats. We advance toward the inn at great speed." },
} } }

P:Persuade { id = "say_horde2", faction = "Horde", joke = { say = {
  { id = "j1", text = "The Undercity smells awful, but you stop noticing. Then you stop breathing." },
  { id = "j2", text = "The Forsaken joined the Horde for the company. Nobody else would have them." },
  { id = "j3", text = "Tauren are so peaceful that they apologise to the grass for walking on it." },
  { id = "j4", text = "Goblins sell weapons to both sides. That's not treason; that's customer service." },
  { id = "j5", text = "An orc's idea of a quiet evening is one fight, instead of three." },
  { id = "j6", text = "Trolls, orcs, tauren and the dead. Our family dinners are something to see." },
  { id = "j7", text = "The Alliance calls us monsters. Then they eat that bread the dwarves make." },
} } }

P:Persuade { id = "say_guard2", role = { "guard", "soldier", "militia" }, joke = { say = {
  { id = "j1", text = "Is it true you're paid to walk in circles? I do that for free." },
  { id = "j2", text = "I'd report a crime, but I'm afraid you'd only point me somewhere else." },
  { id = "j3", text = "Your captain says you're the best on the watch. Then he laughed for a while." },
  { id = "j4", text = "When you say 'move along,' where exactly would you like me to move?" },
  { id = "j5", text = "Do thieves fear you, or do they just find you very easy to walk around?" },
} } }

P:Persuade { id = "say_innkeeper2", role = "innkeeper", joke = { say = {
  { id = "j1", text = "I'll have whatever the dwarf in the corner had. Not the same mug, please." },
  { id = "j2", text = "Is breakfast included, or only the screaming from upstairs?" },
  { id = "j3", text = "Your hearthstone keeps calling me back. Is that love, or a contract?" },
  { id = "j4", text = "I'll have the special. No, I don't want to know what's special about it." },
  { id = "j5", text = "I'd like a quiet room. One without a bard in it, or under it." },
} } }

P:Persuade { id = "say_vendor2", role = "vendor", joke = { say = {
  { id = "j1", text = "I'll take bread, water, and your most honest guess at my odds." },
  { id = "j2", text = "Ten silver for that? I've died for less." },
  { id = "j3", text = "I'd like to sell this broken sword. Don't ask about the rest of him." },
  { id = "j4", text = "Your shop has everything except a discount for regular customers." },
  { id = "j5", text = "Do you buy wolf pelts? I've accidentally become a wolf pelt merchant." },
} } }

P:Persuade { id = "say_banker2", role = { "banker", "auctioneer" }, joke = { say = {
  { id = "j1", text = "I'd like a box for my valuables. Small, please. Smaller. Smaller than that." },
  { id = "j2", text = "Could you check my balance? Gently, please. It's had a hard year." },
  { id = "j3", text = "If I deposit nothing, do I earn interest on it? Asking hopefully." },
} } }

P:Persuade { id = "say_flightmaster2", role = "flightmaster", joke = { say = {
  { id = "j1", text = "Is there a window seat? Never mind. It's all window." },
  { id = "j2", text = "Last time I flew, the beast landed for a snack. I was nearly the snack." },
  { id = "j3", text = "Does it come with a parachute, or a hopeful expression?" },
} } }

P:Persuade { id = "say_trainer2", role = "trainer", joke = { say = {
  { id = "j1", text = "Every new rank costs more. At this rate I'll need lessons in debt." },
  { id = "j2", text = "Is there a spell for paying you later? Asking for myself." },
  { id = "j3", text = "You taught me everything I know. Some of it on purpose, I hope." },
} } }

P:Persuade { id = "say_blacksmith2", role = "blacksmith", joke = { say = {
  { id = "j1", text = "Can you mend this? It was a sword this morning." },
  { id = "j2", text = "I'd like armor that stops claws, arrows and the innkeeper's bill." },
  { id = "j3", text = "You've repaired my armor so often that it's mostly your armor now." },
} } }

P:Persuade { id = "say_stablemaster2", role = "stablemaster", joke = { say = {
  { id = "j1", text = "Keep an eye on him. Not too close, though. He likes eyes." },
  { id = "j2", text = "He's very well behaved. Ignore the screaming; that's how he says hello." },
} } }

P:Persuade { id = "say_peon2", role = { "peon", "worker" }, joke = { say = {
  { id = "j1", text = "You've moved that same log three times. Is it a very important log?" },
  { id = "j2", text = "If you ever stop working, does someone come and slap you, or just shout?" },
} } }

P:Persuade { id = "say_child2", role = "child", joke = { say = {
  { id = "j1", text = "What's green and goes 'mrglglgl'? A murloc. That's the whole joke, really." },
  { id = "j2", text = "What do you call a gnome on stilts? Still short, but very proud." },
  { id = "j3", text = "What does a ghost eat for breakfast? Boo-berries, mostly." },
  { id = "j4", text = "Why did the kobold bring a candle to school? He heard the lessons were dark." },
} } }

P:Persuade { id = "say_spirithealer", role = "spirithealer", joke = { say = {
  { id = "j1", text = "Back again. Do you do a discount for regulars?" },
  { id = "j2", text = "Last time I ran back so fast, I passed my own body." },
  { id = "j3", text = "Is there a loyalty card? I'd have filled three by now." },
  { id = "j4", text = "I'd like to lodge a complaint about the last thing that killed me." },
} } }

P:Persuade { id = "say_trade1", subtitle = "fishing", joke = { say = {
  { id = "j1", text = "Fishing is easy. The fish simply haven't heard that yet." },
  { id = "j2", text = "I caught a boot, a crate and a cold. No fish, though." },
  { id = "j3", text = "The best fish are always just where I'm not, aren't they?" },
} } }

P:Persuade { id = "say_trade2", subtitle = "cook", joke = { say = {
  { id = "j1", text = "Your stew smells wonderful. What died, and was it happy?" },
  { id = "j2", text = "I burned water once. I'm not proud, but it was impressive." },
} } }

P:Persuade { id = "say_trade3", subtitle = "first aid", joke = { say = {
  { id = "j1", text = "I've worn so many bandages that people mistake me for a Forsaken." },
} } }

P:Persuade { id = "say_trade4", subtitle = "alchemist", joke = { say = {
  { id = "j1", text = "What does this one do? No, wait, let me guess by drinking it." },
} } }

P:Persuade { id = "say_trade5", subtitle = "alchemy", joke = { say = {
  { id = "j1", text = "Which of these potions is the safe one? Don't say 'none,' please." },
} } }

P:Persuade { id = "say_trade6", subtitle = "herbalis", joke = { say = {
  { id = "j1", text = "Peacebloom, silverleaf, and something that just bit me. Is that an herb?" },
} } }

P:Persuade { id = "say_trade7", subtitle = "mining", joke = { say = {
  { id = "j1", text = "Mining is easy. The hard part is the kobold who was there first." },
} } }

P:Persuade { id = "say_trade8", subtitle = "miner", joke = { say = {
  { id = "j1", text = "Mining is easy. The hard part is the kobold who was there first." },
} } }

P:Persuade { id = "say_trade9", subtitle = "skinning", joke = { say = {
  { id = "j1", text = "Skinning is simple. You need a sharp knife and no appetite." },
} } }

P:Persuade { id = "say_trade10", subtitle = "leatherwork", joke = { say = {
  { id = "j1", text = "Is this leather, or a very flat boar? I can never tell." },
} } }

P:Persuade { id = "say_trade11", subtitle = "tailor", joke = { say = {
  { id = "j1", text = "Could you take in these robes? I've lost weight running from things." },
} } }

P:Persuade { id = "say_trade12", subtitle = "enchant", joke = { say = {
  { id = "j1", text = "Could you enchant my boots? They already flee from fights, only slowly." },
} } }

P:Persuade { id = "say_trade13", subtitle = "engineer", joke = { say = {
  { id = "j1", text = "I'd like something that explodes on purpose this time." },
} } }

P:Persuade { id = "say_trade14", subtitle = "warrior trainer", joke = { say = {
  { id = "j1", text = "I've learned to hit things very hard. Is there an advanced course?" },
} } }

P:Persuade { id = "say_trade15", subtitle = "mage trainer", joke = { say = {
  { id = "j1", text = "Could you teach me to conjure gold? I'll split it with you." },
} } }

P:Persuade { id = "say_trade16", subtitle = "priest trainer", joke = { say = {
  { id = "j1", text = "Is there a prayer that makes warriors stop running ahead?" },
} } }

P:Persuade { id = "say_trade17", subtitle = "rogue trainer", joke = { say = {
  { id = "j1", text = "Lesson one is stealth? I've been standing here for an hour." },
} } }

P:Persuade { id = "say_trade18", subtitle = "hunter trainer", joke = { say = {
  { id = "j1", text = "Can you teach my pet to bring back what it kills? Intact, ideally?" },
} } }

P:Persuade { id = "say_trade19", subtitle = "warlock trainer", joke = { say = {
  { id = "j1", text = "Does the course come with a soul, or must I bring my own?" },
} } }

P:Persuade { id = "say_trade20", subtitle = "paladin trainer", joke = { say = {
  { id = "j1", text = "Is there a lesson on talking less? Asking for every paladin I've met." },
} } }

P:Persuade { id = "say_trade21", subtitle = "druid trainer", joke = { say = {
  { id = "j1", text = "Teach me a new form, ideally one that doesn't shed." },
} } }

P:Persuade { id = "say_trade22", subtitle = "shaman trainer", joke = { say = {
  { id = "j1", text = "The spirits keep giving me advice. Can you teach me to ignore them?" },
} } }

P:Persuade { id = "say_place1", zone = "The Barrens", joke = { say = {
  { id = "j1", text = "The Barrens: every hill looks the same, and so does every raptor." },
  { id = "j2", text = "I've been in the Barrens so long that the zhevra recognise me." },
} } }

P:Persuade { id = "say_place2", subzone = "The Crossroads", joke = { say = {
  { id = "j1", text = "At the Crossroads, every road leads to a centaur." },
} } }

P:Persuade { id = "say_place3", subzone = "Ratchet", joke = { say = {
  { id = "j1", text = "Ratchet has a boat, a bank and a great many reasons to take the boat." },
} } }

P:Persuade { id = "say_place4", zone = "Stranglethorn Vale", joke = { say = {
  { id = "j1", text = "Everything in Stranglethorn is either beautiful or eating you. Often both." },
  { id = "j2", text = "I came here to hunt tigers. Some tigers came here to hunt me." },
} } }

P:Persuade { id = "say_place5", subzone = "Booty Bay", joke = { say = {
  { id = "j1", text = "In Booty Bay the pirates are honest. It's the merchants you watch." },
} } }

P:Persuade { id = "say_place6", zone = "Duskwood", joke = { say = {
  { id = "j1", text = "Duskwood's lovely at night. Unfortunately, it's always night." },
  { id = "j2", text = "Darkshire's graveyard is the only business in town that's growing." },
} } }

P:Persuade { id = "say_place7", zone = "Westfall", joke = { say = {
  { id = "j1", text = "The harvest golems work so hard that they harvest the farmers too." },
} } }

P:Persuade { id = "say_place8", zone = "Elwynn Forest", joke = { say = {
  { id = "j1", text = "Elwynn's perfectly safe, apart from wolves, bears, kobolds, gnolls, Defias and Hogger." },
} } }

P:Persuade { id = "say_place9", subzone = "Goldshire", joke = { say = {
  { id = "j1", text = "Goldshire's inn has the best dancing in Elwynn. Nobody knows why." },
} } }

P:Persuade { id = "say_place10", zone = "Redridge Mountains", joke = { say = {
  { id = "j1", text = "Lakeshire has asked for a bridge for years. The gnolls cross anyway." },
} } }

P:Persuade { id = "say_place11", zone = "Wetlands", joke = { say = {
  { id = "j1", text = "The Wetlands are well named. My boots have been wet since the border." },
} } }

P:Persuade { id = "say_place12", zone = "Darkshore", joke = { say = {
  { id = "j1", text = "Darkshore is lovely, if you like crawling things and melancholy elves." },
} } }

P:Persuade { id = "say_place13", zone = "Ashenvale", joke = { say = {
  { id = "j1", text = "In Ashenvale every tree has a guardian, and every guardian has an opinion." },
} } }

P:Persuade { id = "say_place14", zone = "Desolace", joke = { say = {
  { id = "j1", text = "They named it Desolace. Nobody can say they weren't warned." },
} } }

P:Persuade { id = "say_place15", zone = "Thousand Needles", joke = { say = {
  { id = "j1", text = "Thousand Needles. I counted. Someone owes me nine hundred and ninety." },
} } }

P:Persuade { id = "say_place16", zone = "Tanaris", joke = { say = {
  { id = "j1", text = "Tanaris sand gets everywhere. I found some in a letter I hadn't opened." },
} } }

P:Persuade { id = "say_place17", subzone = "Gadgetzan", joke = { say = {
  { id = "j1", text = "Gadgetzan's water costs more than its ale. I've been drinking accordingly." },
} } }

P:Persuade { id = "say_place18", zone = "Silithus", joke = { say = {
  { id = "j1", text = "Silithus has bugs the size of houses, and houses full of bugs." },
} } }

P:Persuade { id = "say_place19", zone = "Swamp of Sorrows", joke = { say = {
  { id = "j1", text = "They called it the Swamp of Sorrows, and somehow undersold it." },
} } }

P:Persuade { id = "say_place20", zone = "Badlands", joke = { say = {
  { id = "j1", text = "The Badlands have one good feature: they make Durotar look lush." },
} } }

P:Persuade { id = "say_place21", zone = "Burning Steppes", joke = { say = {
  { id = "j1", text = "The Burning Steppes are aptly named. I've stepped, and I've burned." },
} } }

P:Persuade { id = "say_place22", zone = "Hillsbrad Foothills", joke = { say = {
  { id = "j1", text = "Hillsbrad has two exports: apples, and arguments over who owns the apples." },
} } }

P:Persuade { id = "say_place23", zone = "Arathi Highlands", joke = { say = {
  { id = "j1", text = "In Arathi, every rock is the ruin of somebody's ancient kingdom." },
} } }

P:Persuade { id = "say_place24", zone = "The Hinterlands", joke = { say = {
  { id = "j1", text = "The Hinterlands are so remote that even the trolls get lost." },
} } }

P:Persuade { id = "say_place25", zone = "Feralas", joke = { say = {
  { id = "j1", text = "It rains so much in Feralas that the ogres have started to rust." },
} } }

P:Persuade { id = "say_place26", zone = "Felwood", joke = { say = {
  { id = "j1", text = "The water's green, the trees are green, and by now, so am I." },
} } }

P:Persuade { id = "say_place27", zone = "Winterspring", joke = { say = {
  { id = "j1", text = "In Winterspring the yeti are the friendliest things, and they've tried to kill me." },
} } }

P:Persuade { id = "say_place28", zone = "Un'Goro Crater", joke = { say = {
  { id = "j1", text = "In Un'Goro, the flowers are only the second most likely thing to eat you." },
} } }

P:Persuade { id = "say_place29", zone = "Durotar", joke = { say = {
  { id = "j1", text = "Durotar: red dirt, red rock, red sky, and a scorpid in your boot." },
} } }

P:Persuade { id = "say_place30", zone = "Mulgore", joke = { say = {
  { id = "j1", text = "Mulgore's so peaceful that the plainstriders are the angriest thing in it." },
} } }

P:Persuade { id = "say_place31", zone = "Tirisfal Glades", joke = { say = {
  { id = "j1", text = "Tirisfal is lovely in spring. The dead come up instead of flowers." },
} } }

P:Persuade { id = "say_place32", zone = "Silverpine Forest", joke = { say = {
  { id = "j1", text = "Silverpine has worgen, Scourge and a mad wizard. Pick your favourite way to die." },
} } }

P:Persuade { id = "say_place33", zone = "Teldrassil", joke = { say = {
  { id = "j1", text = "Teldrassil's so tall that the view from the top is mostly more tree." },
} } }

P:Persuade { id = "say_place34", zone = "Stormwind City", joke = { say = {
  { id = "j1", text = "Stormwind has a beautiful park. Nobody goes; it's too far from the bank." },
} } }

P:Persuade { id = "say_place35", zone = "Ironforge", joke = { say = {
  { id = "j1", text = "Ironforge has one tram, one bank and a thousand opinions about both." },
} } }

P:Persuade { id = "say_place36", zone = "Orgrimmar", joke = { say = {
  { id = "j1", text = "Orgrimmar's streets were laid out by someone who hated maps." },
} } }

P:Persuade { id = "say_place37", zone = "Thunder Bluff", joke = { say = {
  { id = "j1", text = "I fell off Thunder Bluff once. The wind riders still talk about it." },
} } }

P:Persuade { id = "say_place38", zone = "Undercity", joke = { say = {
  { id = "j1", text = "The Undercity lifts are perfectly safe. Ask the skeletons at the bottom." },
} } }

P:Persuade { id = "say_place39", zone = "Darnassus", joke = { say = {
  { id = "j1", text = "Darnassus is so quiet that I can hear the elves judging me." },
} } }

P:Persuade { id = "say_gamon", npc = "Gamon", joke = { say = {
  { id = "j1", text = "Gamon, how many times have the dwarves killed you this week?",
    success = "Hah! Lost count after the third, an' then lost my drink. The drink, I miss.",
    fail = "Gamon drinks in peace. Leave Gamon be." },
} } }

P:Persuade { id = "say_rexxar", npc = "Rexxar", joke = { say = {
  { id = "j1", text = "Rexxar, does Misha ever get a word in edgewise?",
    success = "Misha says more with one growl than most orcs say in a speech. She likes you. I'm less sure.",
    fail = "Misha does not care for jests, and neither do I. Walk on." },
} } }

P:Persuade { id = "say_xylem", npc = "Archmage Xylem", joke = { say = {
  { id = "j1", text = "Archmage, does your tower have stairs, or only a long fall?",
    success = "Stairs are for apprentices who failed their examinations. I recommend levitation, or prayer.",
    fail = "The tower keeps out the unwanted. It appears to be failing today." },
} } }

P:Persuade { id = "say_krazek", npc = "Krazek", joke = { say = {
  { id = "j1", text = "Krazek, is anything in Booty Bay not for sale?",
    success = "Sure, pal: the Baron's good mood. Everything else, we can talk about.",
    fail = "Your sense of humor, pal. Nobody'd pay for it." },
} } }

P:Persuade { id = "say_firebrew", npc = "Innkeeper Firebrew", joke = { say = {
  { id = "j1", text = "Is it true you've never once watered down the ale?",
    success = "Ha! Water's fer washin', {g:lad|lass}, an' I don't do much o' that either.",
    fail = "Ye'll mind yer tongue about my ale in my own tavern." },
} } }

P:Persuade { id = "say_norman", npc = "Innkeeper Norman", joke = { say = {
  { id = "j1", text = "Do your guests ever check out, or do they just fall apart?",
    success = "Mostly they fall apart. We charge by the piece, so it works out.",
    fail = "This is a respectable establishment. Embalmed, but respectable." },
} } }

P:Persuade { id = "say_renee", npc = "Innkeeper Renee", joke = { say = {
  { id = "j1", text = "Renee, what's on the menu tonight? Anything that died recently?",
    success = "Everything here died recently, dear, myself included. Sit down, I'll find you a bowl.",
    fail = "We keep food for the living. You don't want to know where we find it." },
} } }

P:Persuade { id = "say_fizzgrimble", npc = "Innkeeper Fizzgrimble", joke = { say = {
  { id = "j1", text = "How much for a glass of water, Fizzgrimble?",
    success = "More than the ale, pal! Out here the water's the luxury and the ale's the necessity.",
    fail = "More than you can afford, by the sound of it. Next!" },
} } }

P:Persuade { id = "say_skindle", npc = "Innkeeper Skindle", joke = { say = {
  { id = "j1", text = "Is it true your rooms come with a free pirate?",
    success = "Only on weekends, pal, and he tidies up after himself. Mostly.",
    fail = "The rooms come with a bill, pal. Pay it." },
} } }

P:Persuade { id = "say_stoutmantle", npc = "Gryan Stoutmantle", joke = { say = {
  { id = "j1", text = "Gryan, does the militia train with pitchforks or prayer?",
    success = "Both, and some days the prayer's the sharper. Still, they're good folk, and they stand when it counts.",
    fail = "Those farmers have lost everything, and they still stood up. Laugh at somebody else." },
} } }

P:Persuade { id = "say_mcbride", npc = "Marshal McBride", joke = { say = {
  { id = "j1", text = "Marshal, do the kobolds want the mine, or only the candles?",
    success = "If it were only the candles, I'd buy them a crate and be done with it. Alas, it never is.",
    fail = "Those kobolds have hurt good people, {class}. It's no laughing matter." },
} } }

P:Persuade { id = "say_saldean", npc = "Salma Saldean", joke = { say = {
  { id = "j1", text = "Salma, does your stew scare off the Defias as well?",
    success = "Ha! If it did, I'd ladle it out at the gate. Here, have a bowl anyway.",
    fail = "My stew is perfectly good, thank you, and you'll find none better in Westfall." },
} } }

P:Persuade { id = "say_runeweaver", npc = "Archmage Ansirem Runeweaver", joke = { say = {
  { id = "j1", text = "Archmage, does the shield keep enemies out, or the archmagi in?",
    success = "Some days I'm unsure myself. The Council once argued for a week over a doorknob.",
    fail = "The shield guards our city's future. It is not a subject for jest." },
} } }

P:Persuade { id = "say_varimathras", npc = "Varimathras", joke = { say = {
  { id = "j1", text = "Do you ever tire of standing beside the Dark Lady all day?",
    success = "Tire? Never. There is always something worth watching. Your jest amuses me, mortal.",
    fail = "Your humor is as brief as your lifespan, mortal. Run along." },
} } }

P:Persuade { id = "say_grimtotem", npc = "Magatha Grimtotem", joke = { say = {
  { id = "j1", text = "Elder Crone, do the winds ever tell you jokes?",
    success = "The winds tell me many things, child. A few of them are even true. That was amusing.",
    fail = "The winds tell me who is wasting my time." },
} } }

P:Persuade { id = "say_nazgrel", npc = "Nazgrel", joke = { say = {
  { id = "j1", text = "Nazgrel, does the Warchief ever laugh, or is that against regulations?",
    success = "He laughs. I make sure nobody sees it. Bad for discipline.",
    fail = "The Warchief's safety is no subject for jests." },
} } }

P:Persuade { id = "say_stormpike", npc = "Vanndar Stormpike", joke = { say = {
  { id = "j1", text = "General, have the Frostwolves considered simply moving?",
    success = "Ha! I suggested it in writing. They sent the letter back with an axe in it.",
    fail = "That valley is Stormpike land by right, and we'll not jest about it." },
} } }

P:Persuade { id = "say_pozzik", npc = "Pozzik", joke = { say = {
  { id = "j1", text = "Pozzik, has a racer ever finished without exploding?",
    success = "Once! It was very disappointing for the crowd. We don't talk about it.",
    fail = "Explosions are part of the sport, pal. Respect the sport." },
} } }

P:Persuade { id = "say_koalbeard", npc = "Kravel Koalbeard", joke = { say = {
  { id = "j1", text = "Kravel, do gnomes build faster racers, or only louder ones?",
    success = "Faster, louder and more on fire! That's three victories, by my count!",
    fail = "Speed is a science! Go and laugh at the goblins." },
} } }

P:Persuade { id = "say_lard", npc = "Lard", joke = { say = {
  { id = "j1", text = "Lard, did you ever find out who ate your lunch?",
    success = "Lard knows it was you! ...No? Den Lard still lookin'. Ha!",
    fail = "Lard not laughin'. Lard hungry." },
} } }
