-- Citizens: the people in the streets with no title and no file of their own (0.35.0).
-- Any friendly person the game gives no other role is a "citizen" (Conv.DetectRole), so
-- right-clicking them opens the box with these lines. Town pools (community = ...) score
-- above the faction ones, which score above the plain one.
-- Citizens are ordinary folk: dock hands, mothers, shop boys, old soldiers, pilgrims and
-- students. They never claim to be a named person. Noticing moments live only in the town
-- pools (CONTENT_GUIDE §3): a plain or faction pool is too broad for them.
-- Lore used here: LORE_NOTES.md ("Capitals and their people") and each town's guard pool.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Anyone, anywhere: the last link before the generic lines.
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_any", role = "citizen",
  greetings = {
    { id = "g1", text = "Hm? Oh, hello. Can I help you with something?" },
    { id = "g2", when = { timesTalked = { min = 1 } }, text = "You again. I don't mind, mind you; it's nice to be asked." },
    { id = "g3", text = "Good day to you, stranger. You look like you've come a long way to stand in front of me." },
    { id = "g4", when = { timeOfDay = "night" }, text = "It's late for a chat, but I'm not sleeping anyway, so go on." },
    { id = "g5", when = { timeOfDay = "dawn" }, text = "You're up early. Either you've work to do or you haven't been to bed, and I won't ask which." },
  },
  lines = {
    { id = "l1", text = "I'm only going about my day, the same as everyone. Nothing much to tell, I'm afraid." },
    { id = "l2", text = "If you're looking for someone important, I'm not them, but I'm happy to point the way." },
    { id = "l3", text = "Folk like me don't make the news; we just hear it last and pay for it first. Still, it's a living." },
    { id = "l4", text = "Everybody's got an opinion about the roads these days, and nobody's got a solution. I keep to the ones I know." },
    { id = "l5", when = { timeOfDay = "dusk" }, text = "I like this hour, when the work's done and the lamps aren't lit yet. It's the only quiet the day gives you." },
  },
  choices = { { text = "Sorry to bother you.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "I'm no scholar, but people talk and I've got ears. Here's what's been going round." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've been decent to me, so I'll tell you all of it, even the parts I'm not sure about." },
    },
    _none = { { id = "t_none", text = "Couldn't tell you, friend. I've enough trouble keeping track of my own business." } },
  },
}

---------------------------------------------------------------------------
-- Faction pools: ordinary folk of the Alliance and of the Horde.
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_alliance", role = "citizen", faction = "Alliance",
  greetings = {
    { id = "g1", text = "Light keep you, friend. Something I can do for you?" },
    { id = "g2", when = { timesTalked = { min = 2 } }, text = "Back again? People will think we're old friends, and I suppose by now we nearly are." },
    { id = "g3", when = { timeOfDay = "night" }, text = "Evening. You'd do well to find a fire soon; the roads aren't kind after dark, these days." },
    { id = "g4", text = "Hello there. You've the look of someone who's seen more of the world than I have, which isn't hard." },
  },
  lines = {
    { id = "l1", text = "Everything costs more since the war. Bread, boots, lamp oil, the lot of it, and nobody's wages have kept up." },
    { id = "l2", text = "My uncle says the Alliance isn't what it was, with Gilneas walled off and Lordaeron gone to the dead. I tell him we've still got the dwarves, and he can't argue with that." },
    { id = "l3", text = "Night elves, now, on our side! Twenty years ago nobody'd heard of them, and now they're selling arrows in the market." },
    { id = "l4", text = "They say the orcs have a city of their own across the sea now. I don't know how I feel about it, except that I'd rather they stayed over there." },
    { id = "l5", text = "Every family I know has someone out in the field: Westfall, Redridge, Ashenvale, somewhere. We light a candle and hope the letters keep coming." },
    { id = "l6", when = { band = { "Greenhorn", "Blooded" } }, text = "You're young for the road. Be careful out there, won't you? My sister's boy went off looking just like you." },
  },
  choices = { { text = "Light keep you too.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Word travels with the caravans, and the caravans stop here. Here's what I've heard from them." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "For you I'll tell all of it, rumors and all, and you can sort out which is which." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common knowledge, and you can keep the rest of your questions." },
    },
    background = {
      { id = "t_bg1", text = "Born, raised, worked and married within sight of the same chimney. I've had worse lives described to me." },
      { id = "t_bg2", text = "My family came south from Lordaeron when the plague started, and we've been starting over ever since." },
    },
    advice = {
      { id = "t_ad1", text = "Write home, if you've a home to write to. Somebody's waiting on it, even if they never say so." },
    },
    _none = { { id = "t_none", text = "That's beyond me, I'm afraid. Ask someone who reads more than I do." } },
  },
}

P:Pool {
  id = "citizen_horde", role = "citizen", faction = "Horde",
  greetings = {
    { id = "g1", text = "Throm-ka. What do you want of me?" },
    { id = "g2", when = { timesTalked = { min = 2 } }, text = "You again. Good; I was starting to think nobody else in the Horde could hold a conversation." },
    { id = "g3", when = { timeOfDay = "night" }, text = "It's late, and the fires are banked. Speak quietly and I'll listen." },
    { id = "g4", text = "Well met. The Horde's a big family, and most of us don't get to talk to the ones who wander." },
  },
  lines = {
    { id = "l1", text = "My father spent ten years in a human camp, and now I sleep under my own roof in a land the Warchief found for us. Some days I can hardly believe it." },
    { id = "l2", text = "The tauren taught us the land, the trolls taught us the coast, and the Forsaken are still teaching us patience. It's a strange family, but it's ours." },
    { id = "l3", text = "Everything here was built in a few short years, out of red rock and stubbornness. It isn't pretty, but it stands, and nobody gave it to us." },
    { id = "l4", text = "The Alliance holds Theramore and Northwatch, and every now and then their ships come sniffing at our coast. Let them sniff." },
    { id = "l5", text = "Thrall says we're done with the old ways of blood and demons. I believe him, mostly because I've seen what the old ways did to my grandfather." },
    { id = "l6", when = { band = { "Greenhorn", "Blooded" } }, text = "You're young yet. Fight smart and come home; the Horde has enough heroes buried already." },
  },
  choices = { { text = "Strength and honor.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Talk comes in with the wolf-riders and the kodo trains, and I listen. Here is what I've heard." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've earned my trust, so I'll tell you everything, even what I'm not supposed to repeat." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what any grunt could, and nothing more, until I know you better." },
    },
    background = {
      { id = "t_bg1", text = "I was born in a camp behind human walls, and I'll die free in a land of our own. That's all the story anybody needs." },
    },
    advice = {
      { id = "t_ad1", text = "Share your fire and your water on the road. One day you'll be the one asking." },
    },
    _none = { { id = "t_none", text = "I don't know that. Ask a shaman; they know things the rest of us don't." } },
  },
}

---------------------------------------------------------------------------
-- Stormwind: the biggest city, and the people the user meets most.
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_stormwind", role = "citizen", community = "stormwind",
  barks = {
    { id = "b_bread", text = "Fresh bread, still warm, if you hurry!" },
    { id = "b_cart", text = "Mind the cart, mind the cart, coming through!" },
    { id = "b_kid", text = "Has anyone seen a little boy in a blue cap? He was here a moment ago!" },
  },
  greetings = {
    { id = "g_day", text = "Good day to you. If you're after the Trade District, follow the canal and you can't miss it." },
    { id = "g_again", when = { timesTalked = { min = 2 } }, text = "Back again? You'll have me thinking I'm good company, which my neighbors will tell you I'm not." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You're out late. The lamplighters have been round already, so mind the dark corners along the water." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "Up with the bakers, are you? The best bread in the city sells before the bells and is gone by the first service." },
    { id = "g_dusk", when = { timeOfDay = "dusk" }, text = "That'll be the bell for evening prayers. My mother never missed one, and I miss most of them, Light forgive me." },
    { id = "g_hero", when = { townStanding = { town = "stormwind", min = 55 } }, text = "I know your face! Half the city's been talking about you, and the other half's been pretending not to listen." },
    { id = "g_distrust", when = { townStanding = { town = "stormwind", max = -20 } }, text = "I'd rather not be seen talking with you, if it's all the same. People have been saying things about you." },
    { id = "g_trade", when = { subzone = "Trade District" }, text = "Keep a hand on your purse here, friend. The cutpurses in the Trade District are quicker than the jugglers." },
    { id = "g_oldtown", when = { subzone = "Old Town" }, text = "You've wandered into Old Town. It's not as rough as they say up by the Cathedral, but it's not much gentler either." },
    { id = "g_cathedral", when = { subzone = "Cathedral Square" }, text = "The Light's blessing on you. Speak softly in the square, would you; there's a service on most hours of the day." },
    { id = "g_canals", when = { subzone = "The Canals" }, text = "Careful on these stones, because they're slick, and the canal's a good deal deeper than it looks." },
    { id = "g_dwarf", when = { subzone = "Dwarven District" }, text = "Hear that hammering? The smiths in this district never stop, and after a while you can't sleep without it." },
    { id = "g_mage", when = { subzone = "Mage Quarter" }, text = "Don't touch anything that glows in the Mage Quarter. I learned that the hard way, and my eyebrows took a month to grow back." },
    { id = "g_park", when = { subzone = "The Park" }, text = "Lovely in the Park today, isn't it? It's the only place in the city where you can hear the birds over the carts." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "Oh, you're one of the Cathedral's! Would you remember my father in your prayers? His cough's been bad since the winter, and I think the Light listens better to you lot than to me." },
    { id = "n_human_priest", cat = "class", when = { race = "Human", class = "PRIEST" }, place = "before",
      text = "A priest from our own streets, by the sound of you. The Cathedral takes in so many from the north these days that it does my heart good to see one of ours in the vestments." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" }, place = "replace",
      text = "Light save us! Oh, you're a priest under all that. Please let the shadow go before you walk past the orphanage, or the little ones won't sleep for a week." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "One of the Silver Hand, here in the street! My father fought in the Second War, and he always said the knights were the only ones who stopped to bury the footmen." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You smell of brimstone, and I don't mean that unkindly. It's only that the last one who smelled like that came up out of the Slaughtered Lamb's cellar with a little red thing following him." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Would you tell my son that magic isn't for showing off? He's set the curtains alight twice, trying to copy the conjurors in the square." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I'll keep my hand on my purse while we talk, and no offense meant. I know that walk, that's all, and it's the walk of someone who knows where purses are kept." },
    { id = "n_hunter", cat = "class", when = { race = "Human", class = "HUNTER" },
      text = "One of our own, with a bow and a beast at heel! My grandfather hunted Elwynn all his life, but he never once had a wolf follow him home on purpose." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Forgive me for staring. A few years ago nobody here had ever seen one of your people, and now I see you at the fountains, looking at our houses as if they're very new." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "One of the Gnomeregan folk! I'm sorry about your city, truly. Two of your tinkers lodge on our street, and they've mended every clock we own, whether the clocks needed it or not." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Come down from Ironforge on the tram, have you? Your cousins in the Dwarven District will tell you our ale is terrible, and you're not to believe them." },
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } },
      text = "Steady, friend, the canal's right behind you! If you're drinking, it's the Pig and Whistle in Old Town, and if you're finished, it's your bed." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "Light above, have you been robbed? Go straight to the Watch, and wrap something round yourself on the way." },
  },
  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Oh! Light preserve me, I nearly dropped the basket." },
    { id = "r_stealth", on = "stealth", text = "Where did they go? Somebody check their pockets!" },
  },
  lines = {
    { id = "l_rebuilt", text = "The orcs burned this city to the ground when my parents were young, and every stone you see was laid again since. Each year it looks a little more like the city they used to tell me about." },
    { id = "l_prices", text = "Bread costs a copper more than it did in spring, and nobody can tell me why, except to blame Westfall. Everything gets blamed on Westfall these days." },
    { id = "l_bolvar", text = "Highlord Bolvar stands at the young king's side every day, teaching him to rule. He's a good man, the Highlord, but a boy of ten shouldn't have to wear a crown." },
    { id = "l_varian", text = "Nobody at court will say where King Varian went. He sailed off to some meeting and never came home, and now they've crowned his little boy and we all hope for the best." },
    { id = "l_prestor", text = "Lady Prestor is at court every day now, advising the young king. My cousin works in the Keep's kitchens, and she says the lady is always gracious to the servants, which is more than most nobles manage." },
    { id = "l_masons", text = "The Stonemasons' Guild rebuilt these walls, and the nobles never paid them for it. Some of the masons went off to Westfall angry, and now folk call them the Defias and lock their doors at night." },
    { id = "l_stockade", text = "My neighbor's boy got himself thrown in the Stockade for brawling. He says it's full to the rafters, and half the prisoners are wearing red bandanas and singing about the day they'll get out." },
    { id = "l_anduin", text = "I saw the young king once, riding out to the Cathedral with the Highlord. He waved at my daughter, and she hasn't stopped talking about it since." },
    { id = "l_trade", when = { subzone = "Trade District" }, text = "If you want a fair price in the Trade District, try the stalls nearest the gate. The ones by the bank charge you extra for the view of the canal." },
    { id = "l_auction", when = { subzone = "Trade District" }, text = "The auction house never closes. I've seen a man bid on a single lump of copper at midnight, and win it, and walk out looking like a king." },
    { id = "l_oldtown", when = { subzone = "Old Town" }, text = "Old Town's where the soldiers drink, and where the king's quiet men keep their offices, if you believe what people say. I believe about half of it, and I still don't walk here after dark." },
    { id = "l_oldtown_night", when = { subzone = "Old Town", timeOfDay = { "dusk", "night" } }, text = "The Pig and Whistle fills up with soldiers back from Redridge and Duskwood, and they tell the worst stories you ever heard. I'd stay for more of them, but my wife expects me home." },
    { id = "l_cathedral", when = { subzone = "Cathedral Square" }, text = "The Cathedral of Light took years to raise, and they say the Archbishop prays in it before dawn every single day. I've never been up early enough to see it, but I believe it." },
    { id = "l_orphans", when = { subzone = "Cathedral Square" }, text = "The orphans come through the square most mornings, holding hands in a long line. The matron counts them twice at every corner, and after the last ten years I don't blame her." },
    { id = "l_canals", when = { subzone = "The Canals" }, text = "The canal boats carry flour, barrels and gossip from one end of the city to the other, and the gossip always gets there first." },
    { id = "l_dwarven", when = { subzone = "Dwarven District" }, text = "Ironforge sent smiths to help rebuild, and plenty of them never went home. This district smells of coal and ale, and you'll get the best repairs in the city here." },
    { id = "l_tram", when = { subzone = "Dwarven District" }, text = "The Deeprun Tram leaves from just down the way. I rode it once, and I spent the whole trip under the sea thinking about the sea, so I've not been back." },
    { id = "l_mage", when = { subzone = "Mage Quarter" }, text = "Respectable magi in the towers up top, and something else entirely in the Slaughtered Lamb's cellar, or so people whisper. I keep to the fountain side of the street and let them sort it out." },
    { id = "l_mage_night", when = { subzone = "Mage Quarter", timeOfDay = "night" }, text = "The towers glow all night, and the magi swear it's perfectly safe. My mother still won't let my little brother play near the fountain after dark." },
    { id = "l_park", when = { subzone = "The Park" }, text = "Old soldiers sit on these benches and argue about the Second War all afternoon. The squirrels listen better than anyone, and they're the only ones who never take sides." },
    { id = "l_night", when = { timeOfDay = "night" }, text = "The Watch doubles its patrols after dark, ever since the Defias business. It makes me feel safer, mostly, except when they knock on doors." },
    { id = "l_dawn", when = { timeOfDay = "dawn" }, text = "The bakers' ovens are lit before the sun's up, and the whole of the Trade District smells of bread for an hour. It's the best hour in Stormwind, and most people sleep through it." },
    { id = "l_priest", when = { class = "PRIEST" }, text = "The Cathedral's been feeding the refugees from Lordaeron all winter. I don't know how you priests stretch the bread so far, but my neighbors wouldn't have eaten without it." },
    { id = "l_winterveil", when = { holiday = "winterveil" }, text = "Winter Veil, and the whole city smells of pine and roasting nuts. The children have been at the windows of the toy sellers since dawn, and I can't say I blame them." },
    { id = "l_hallows", when = { holiday = "hallowsend" }, text = "The children are carving faces into gourds for Hallow's End again. The Forsaken started this feast, people say, and I try not to think about it while I'm handing out sweets." },
  },
  choices = {
    { text = "Good day to you.", next = "END" },
    { text = "Light keep you.", next = "END", when = { class = "PRIEST" } },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "You hear everything in the market if you stand still long enough, and some of it's even true. Here's what people are talking about." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've done right by this city, so I'll tell you the lot, even the gossip from the Keep's kitchens." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common talk, and then I've got errands, if you don't mind." },
    },
    defias = { { id = "t_defias", text = "Angry masons and hungry farmhands, most of them. Folk say they've got a leader now, and that he used to build cathedrals before he started robbing them." } },
    stonemasons = { { id = "t_masons", text = "They built this city twice over, and when they asked for their wages, the nobles laughed at them. I don't hold with robbery, but I can see how they got there." } },
    the_stockade = { { id = "t_stockade", text = "It's down by the canals, and you'll hear it before you see it. My advice is to stay on the right side of its door." } },
    _none = { { id = "t_none", text = "Couldn't tell you. Ask at the Cathedral or the Keep; somebody up there's paid to know things." } },
  },
}

---------------------------------------------------------------------------
-- Ironforge
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_ironforge", role = "citizen", community = "ironforge",
  barks = {
    { id = "b_ale", text = "Who's buyin' the next round, then? Not me, I bought the last three!" },
    { id = "b_tram", text = "Tram's in! Mind the gap an' mind yer beard!" },
  },
  greetings = {
    { id = "g_day", text = "Good day tae ye! Come warm yer hands; the Great Forge never goes out, an' nor does the welcome." },
    { id = "g_again", when = { timesTalked = { min = 2 } }, text = "Back again, are ye? Ye'll be wantin' yer own stool at the Thunderbrew next." },
    { id = "g_hero", when = { townStanding = { town = "ironforge", min = 55 } }, text = "Well, if it isnae the one they're all talkin' about down the Commons! Shake my hand, then; I want tae tell my grandchildren I did." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Is it night outside? Under the mountain ye can never tell, so we go by the barrels; when they're low, it's late." },
    { id = "g_tinker", when = { subzone = "Tinker Town" }, text = "Mind yer head in Tinker Town. The gnomes build everythin' at their own height, an' then act surprised when we bang into it." },
    { id = "g_explorers", when = { subzone = "Hall of Explorers" }, text = "Shh, keep it down, will ye? The scholars in the Hall get awful twitchy about noise, an' they've got the longest memories in the mountain." },
    { id = "g_forge", when = { subzone = "The Great Forge" }, text = "Stand a bit closer tae the Forge, go on. Ye look like ye came in off the snow, an' there's no shame in it." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, eh? The High Seat keeps a good few o' yer sort, an' the Mystic Ward's where they'll be. Say one for the miners while ye're at it; they need it more than the rest of us." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Come through on the tram from Stormwind? Ye've got that green look about ye. Everybody does, the first time." },
    { id = "n_shaman", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "A dwarf talkin' tae the elements! My old mum would have chased ye out wi' a broom, but times change, an' the stone's no' complainin', so I'll no' complain either." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "An elf under the mountain! Ye'll be wantin' a tree, I suppose, but we've only got stone, so ye'll have tae make do." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Ye're welcome here as long as ye need, little cousin, and I mean that. Gnomeregan will be yours again; the whole mountain says so." },
  },
  lines = {
    { id = "l_magni", text = "King Magni's a Bronzebeard through an' through: loud, generous an' stubborn as granite. We'd follow him intae a dragon's mouth, an' some of us already have." },
    { id = "l_gnomes", text = "The gnomes have been livin' wi' us since Gnomeregan fell, an' they've fixed every lift an' lantern in Tinker Town. They talk faster than I can drink, mind." },
    { id = "l_darkiron", text = "My granddad's granddad fought the Dark Iron in the War of the Three Hammers, an' we're still fightin' 'em now. Some grudges are older than the mountain's beards." },
    { id = "l_ale", text = "Ale's gone up by a copper since the trolls started raidin' the Thunderbrew carts again. A copper! I've had a word wi' my local Mountaineer about it." },
    { id = "l_tram", when = { subzone = "Tinker Town" }, text = "The tram runs under the sea all the way tae Stormwind. The gnomes built it, an' the gnomes swear it's safe, an' I still close my eyes for the deep part." },
    { id = "l_league", when = { subzone = "Hall of Explorers" }, text = "The Explorers' League sends folk tae dig in every corner o' the world, an' half of 'em come back wi' some old stone an' a story. The other half come back wi' a bigger story." },
    { id = "l_commons", when = { subzone = "The Commons" }, text = "Everything ye could want is sold in the Commons, an' some things ye couldnae. Mind the bankers, they bite." },
    { id = "l_military", when = { subzone = "The Military Ward" }, text = "The Military Ward's where the young ones go tae learn the axe an' the shield. Ye can hear 'em shoutin' from the Forge, which means they're doin' it right." },
    { id = "l_winterveil", when = { holiday = "winterveil" }, text = "Greatfather Winter's come tae the Commons again, an' the children are queued half round the mountain. I'll no' tell ye what I asked him for, but it came in a barrel." },
  },
  choices = { { text = "Good day tae ye.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Under the mountain, every word bounces about till somebody catches it, an' I catch a fair few. Here's what's been echoin'." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "Ye're a friend o' the mountain, so pull up a stool an' I'll tell ye the whole of it." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell ye what any dwarf in the Commons could, an' then I've a pint gettin' warm." },
    },
    gnomeregan = { { id = "t_gnomeregan", text = "Somethin' came up from under it, an' then the gnomes flooded the place wi' poison tae stop it, an' half their own folk wi' it. They don't like talkin' about it, so be kind." } },
    dark_iron = { { id = "t_darkiron", text = "Fire-worshippin' cousins of ours, down in the Searing Gorge an' under the Blackrock. They've been rotten since before my granddad's day, an' they show no sign o' gettin' better." } },
    _none = { { id = "t_none", text = "Never heard of it. Ask at the Hall of Explorers; they know everythin' an' they'll tell ye twice." } },
  },
}

---------------------------------------------------------------------------
-- Darnassus
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_darnassus", role = "citizen", community = "darnassus",
  greetings = {
    { id = "g_day", text = "Ishnu-alah. Be welcome among the branches, traveler, and walk softly; the tree hears more than you would think." },
    { id = "g_again", when = { timesTalked = { min = 2 } }, text = "You have returned. Our people count time in centuries, but I confess I noticed that it has been a few days." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Elune's light is on the water tonight. This is the hour my people love best, so forgive me if I am in no hurry." },
    { id = "g_temple", when = { subzone = "Temple of the Moon" }, text = "Hush, please, for the priestesses are at their devotions. The moonwell answers to quiet voices." },
    { id = "g_enclave", when = { subzone = "Cenarion Enclave" }, text = "The druids are arguing again, if you can call it arguing when nobody raises their voice. Did you come to see the Arch Druid?" },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
      text = "A priest who prays to the Light, and not to Elune. I have often wondered whether the two are so very different, and I would like to hear your thoughts on it one day." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human, so far from your stone cities! You must find the quiet strange here. My people found your noise just as strange, when first we met." },
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Gnome" } },
      text = "Welcome, little cousin of the mountains. The branches are wide, so you need not look down." },
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "Walk on two feet in the city, druid. The young ones get nervous when a cat that size wanders through the terrace." },
  },
  lines = {
    { id = "l_tree", text = "Teldrassil is young as trees go, and it was planted without the blessing the old World Tree had. The druids say that will not matter, and I pray they are right." },
    { id = "l_tyrande", text = "The High Priestess Tyrande leads us while Malfurion sleeps in the Dream. She has waited for him for thousands of years before, and she will wait again." },
    { id = "l_ashenvale", text = "My sister serves with the Sentinels in Ashenvale. The orcs keep cutting down the forest, and every tree they fell is one more grave we must mourn." },
    { id = "l_young", text = "We lost our immortality on the slopes of Hyjal, though most of us have not yet felt the loss. The old ones say we must learn to count our days like the humans do." },
    { id = "l_craft", when = { subzone = "Craftsmen's Terrace" }, text = "We work with the wood and never against it. A bow from this terrace will outlast its archer, and the archer usually lives a very long time." },
    { id = "l_warrior", when = { subzone = "Warrior's Terrace" }, text = "The Sentinels train here at dawn and at dusk. If you watch them long enough, you'll see why the orcs speak of Ashenvale with fear." },
  },
  choices = { { text = "Elune keep you.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "News reaches the tree on the boats from Auberdine and on the wings of the hippogryphs. I will tell you what has come to me." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You have been gentle with my people, and so I will speak to you as I would to a sister." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I will answer, for it is courteous, but you must forgive me for answering briefly." },
    },
    teldrassil = { { id = "t_tree", text = "The Arch Druid and his circle raised it, so that our people would have a home once more. Its roots go down into the sea, and some say that's why the creatures in its shade have grown so wild." } },
    _none = { { id = "t_none", text = "That I do not know. Perhaps the Sentinels would; they watch everything." } },
  },
}

---------------------------------------------------------------------------
-- Orgrimmar
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_orgrimmar", role = "citizen", community = "orgrimmar",
  barks = {
    { id = "b_meat", text = "Roast boar! Roast boar, still hot from the fire!" },
    { id = "b_zep", text = "The zeppelin's in, so if you're going to Tirisfal, run!" },
  },
  greetings = {
    { id = "g_day", text = "Lok'tar, friend. You walk in the Warchief's city, so walk it proudly." },
    { id = "g_again", when = { timesTalked = { min = 2 } }, text = "You again! Sit, then, if you've a moment; the rock's warm and I've nowhere to be until dusk." },
    { id = "g_hero", when = { townStanding = { town = "orgrimmar", min = 55 } }, text = "I know that face! Your deeds have been told in every tavern from the Drag to the gate, and I've heard most of them twice." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The fires are low, and the city sleeps with one eye open. What brings you through the valleys at this hour?" },
    { id = "g_drag", when = { subzone = "The Drag" }, text = "You came down to the Drag on purpose? Hold on to your coin, then, and to anything else you'd like to keep." },
    { id = "g_spirits", when = { subzone = "Valley of Spirits" }, text = "Welcome to the trolls' corner, mon. The smoke's from the shaman's fires, not the cooking, so don't go tasting it." },
  },
  notice = {
    { id = "n_priest_troll", cat = "class", when = { class = "PRIEST", race = "Troll" },
      text = "A troll priest, walking among orcs, praying to spirits I don't know the names of! The Horde's grown stranger than my father ever dreamed, and I like it better for it." },
    { id = "n_priest_undead", cat = "class", when = { class = "PRIEST", race = "Scourge" },
      text = "A dead priest, here in Orgrimmar. You make the old ones nervous, so walk gently past the Valley of Wisdom." },
    { id = "n_orc_mage", cat = "class", when = { race = "Orc", class = "MAGE" },
      text = "An orc with a staff and no axe? My grandmother would have spat, but she spat at everything. Burn the Alliance with it and I'll call you brother." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Mind your horns on the doorways, friend. We build low in this city, and the tauren keep finding out the hard way." },
  },
  lines = {
    { id = "l_thrall", text = "The Warchief led us out of the camps and across the sea, and he built this city out of red rock and promises. So far, he's kept every one of them." },
    { id = "l_name", text = "This city's named for Orgrim Doomhammer, who died breaking the camps open. When you walk under the gate, you walk under his name." },
    { id = "l_kultiras", text = "The Kul Tirans sit in their fortress down the coast, sulking about their dead admiral. One of these days they'll try us again, and we'll be waiting." },
    { id = "l_chasm", text = "There's a chasm under the city where the fire comes up, and cultists in it who'd see the old ways back. The Warchief sends young warriors down to clear it out, and they come back older." },
    { id = "l_drag", when = { subzone = "The Drag" }, text = "Everything crooked in Orgrimmar ends up on the Drag sooner or later: goblin gadgets, stolen dwarf ale, and the cheapest bad advice in Durotar." },
    { id = "l_cleft", when = { subzone = "Cleft of Shadow" }, text = "The Cleft gives me a chill, and I've lived in Durotar all my life. Warlocks and worse keep their dens down here, and the Warchief allows it as long as they behave." },
    { id = "l_strength", when = { subzone = "Valley of Strength" }, text = "Every caravan from the Barrens comes through the Valley of Strength, and half the city's bread and gossip comes with them." },
    { id = "l_winterveil", when = { holiday = "winterveil" }, text = "Goblins brought this Winter Veil to us, and now there's a tree in the Valley of Strength hung with little shiny things. The grunts pretend to scowl at it and then stand there looking at it for an hour." },
  },
  choices = { { text = "Lok'tar ogar.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "Everything that crosses Durotar passes through these gates in the end, and I sit by the gates. Here's what's come in." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've stood for the Horde, so I'll tell you all of it, even what the grunts whisper." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and you can find out the rest the hard way." },
    },
    burning_blade = { { id = "t_blade", text = "Fools who want the demons back, as if we didn't drink enough of that poison the first time. They hide in the canyons and under the city, and we hunt them wherever they hide." } },
    _none = { { id = "t_none", text = "I don't know it. Ask in the Valley of Wisdom; the shaman there know more than is good for anyone." } },
  },
}

---------------------------------------------------------------------------
-- Thunder Bluff
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_thunderbluff", role = "citizen", community = "thunder_bluff",
  greetings = {
    { id = "g_day", text = "Walk with the Earth Mother, friend. The wind is kind on the bluffs today." },
    { id = "g_again", when = { timesTalked = { min = 2 } }, text = "You return to the bluffs. Good; a thing seen twice is a thing remembered, my grandmother would say." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "The stars are close up here at night, closer than anywhere in Mulgore. Sit with me a while, if you like." },
    { id = "g_elder", when = { subzone = "Elder Rise" }, text = "Speak softly on the Elder Rise, please. The old ones are listening, and they always have something to say about it." },
    { id = "g_spirit", when = { subzone = "Spirit Rise" }, text = "You've come to the Spirit Rise. The Pools of Vision lie below us, and the ancestors are very close here." },
  },
  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the sky-folk from Gev'rek! Our elders say your spirits went quiet, and that the wind still speaks to you anyway. I'd like to hear how that feels, if you ever want to tell it." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "You came up the lift without holding the rail. Most orcs do it the first time with their knuckles white, so I'm impressed." },
    { id = "n_druid", cat = "class", when = { class = "DRUID", race = "Tauren" },
      text = "A druid of our people! The Arch Druid on the Elder Rise will want to see you grow, so be sure to visit him." },
  },
  lines = {
    { id = "l_cairne", text = "High Chieftain Cairne brought the tribes together and led us to these bluffs. Before him, we wandered the plains with the centaur at our backs, and now we have a home." },
    { id = "l_lifts", text = "The lifts are the only way up, and the only way down that doesn't end at the bottom in pieces. My father built the counterweights, so trust them." },
    { id = "l_venture", text = "The goblins of the Venture Company cut our trees and drill our earth, and they call it business. We call it something else, and Cairne has sent braves to tell them so." },
    { id = "l_grimtotem", when = { subzone = "Elder Rise" }, text = "Some of the Grimtotem keep their tents on the Elder Rise. They're polite enough to Cairne's face, but they've never liked the orcs, and they don't hide it well." },
    { id = "l_hunter", when = { subzone = "Hunter Rise" }, text = "On the Hunter Rise they teach the young to track and to wait, and the waiting is harder. I never had the patience myself; I weave baskets instead." },
  },
  choices = { { text = "Earth Mother keep you.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "News climbs the lifts slowly, but it reaches us in the end. Here is what the wind has brought up to the bluffs." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You have walked gently among us, so I'll share all of it, and gladly." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I will tell you a little, but the Earth Mother counsels caution with strangers." },
    },
    venture_company = { { id = "t_venture", text = "Goblins with saws and drills and no shame at all. They tear at the land faster than it can heal, and they call the stumps progress." } },
    _none = { { id = "t_none", text = "The Earth Mother hasn't told me that. Ask the elders; they talk with her more often." } },
  },
}

---------------------------------------------------------------------------
-- Undercity
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_undercity", role = "citizen", community = "undercity",
  greetings = {
    { id = "g_day", text = "Another visitor. Do try not to stare; we were all something else once." },
    { id = "g_again", when = { timesTalked = { min = 2 } }, text = "You've come back to talk to me. I had forgotten what that feels like, and I'm not sure I like remembering." },
    { id = "g_hero", when = { townStanding = { town = "undercity", min = 55 } }, text = "Ah, the one the Deathguard keep mentioning. You've been useful to the Dark Lady, and in this city that's the warmest welcome there is." },
    { id = "g_apoth", when = { subzone = "The Apothecarium" }, text = "Breathe through your mouth in the Apothecarium, if you still breathe. The smell is the least dangerous thing in here." },
    { id = "g_trade", when = { subzone = "The Trade Quarter" }, text = "Buying or selling? Everyone in the Trade Quarter is doing one or the other, even the ones who look like they're standing still." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Scourge" },
      text = "A priest, still. Some of us lost our faith in the grave, and some of us found another one down there. Which are you, I wonder?" },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Skyborne" } },
      text = "Still breathing, and warm, I expect. You'll forgive me if I don't shake your hand; it tends to upset the living." },
    { id = "n_paladin", cat = "class", when = { race = "Scourge", class = "PALADIN" },
      text = "One of us, wearing the Light again. I wasn't sure it would come back to anyone down here, and I'm still not sure whether I'm glad it did." },
  },
  lines = {
    { id = "l_sylvanas", text = "The Dark Lady freed us from the Lich King's voice. I remember the silence after it stopped, and I would do anything she asked to keep it." },
    { id = "l_above", text = "The palace above us was Lordaeron's, and some of us served in it. Now it's rubble, and we live in the old sewers and crypts, which says something about the world, I suppose." },
    { id = "l_plague", text = "The Royal Apothecary Society says they're brewing a new plague to use against the Scourge. I try not to wonder what they test it on." },
    { id = "l_scarlet", text = "The Scarlet Crusade burns any of us they catch, and they call it mercy. I was a farmer's daughter in Tirisfal once, and they'd burn her too, if she were still around to be burned." },
    { id = "l_canals", text = "Don't touch the green in the canals. It doesn't kill us, quite, but it doesn't help either." },
    { id = "l_hallows", when = { holiday = "hallowsend" }, text = "Hallow's End is ours, whatever the living tell you. We burn the Wicker Man for the day we broke free of the Scourge, and the living hand out sweets and pretend it's about pumpkins." },
  },
  choices = { { text = "Farewell.", next = "END" } },
  topics = {
    knows = {
      { id = "t_kn1", text = "The dead have nothing to do but listen, and the walls down here carry every whisper. Here is what has drifted my way." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've been decent to us, which is rare enough that I'll tell you everything." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll answer, but don't mistake the answer for friendship." },
    },
    scarlet_crusade = { { id = "t_scarlet", text = "Living zealots in red, who once prayed with us at the same altars. Now they hunt us through Tirisfal with torches, and they sing while they do it." } },
    _none = { { id = "t_none", text = "I don't know, and I find that I don't care. Ask an Apothecary; they care about everything, unhealthily." } },
  },
}

---------------------------------------------------------------------------
-- Towns of the Eastern Kingdoms (Alliance)
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_goldshire", role = "citizen", community = "goldshire",
  greetings = {
    { id = "g_day", text = "Afternoon! If you're looking for a bed, the Lion's Pride is the yellow one with the noise coming out of it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You're out late. Folk round here lock their doors after dark now, which my father would never have believed." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", maxLevel = 15 },
      text = "Fresh from the Abbey, by the look of the robes! Brother Joshua's sister lives two houses down... no, I'm thinking of someone else. Anyway, welcome to Goldshire." },
    { id = "n_hogger", cat = "class", when = { class = { "WARRIOR", "PALADIN", "HUNTER" }, maxLevel = 12 },
      text = "You've got a fighter's look about you. If you're thinking of going after that great gnoll in the woods, take friends, and take more of them than you think." },
  },
  lines = {
    { id = "l_defias", text = "The Defias have been seen in the hills east of town, bold as you like, in their red bandanas. My mother says they were honest masons once, and she says it like it's worse." },
    { id = "l_kobolds", text = "The miners won't go into Fargodeep any more, not since the kobolds took it over. Candles on their heads, and they shout about not taking them, as if anybody wants their candles." },
    { id = "l_hogger", text = "Hogger's out in the woods southwest of here, and he's bigger every time somebody tells the story. I've only seen him the once, from very far away, and that was plenty." },
    { id = "l_farms", text = "The Maclures and the Stonefields have been feuding since before I was born, over a cow, of all things. Now their children have gone sweet on each other, and nobody knows what to do about it." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Everybody passes through Goldshire on the road to the city, and they all stop at the inn to talk. Here's what I've picked up." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what everyone at the Lion's Pride knows, and no more." },
    },
    hogger = { { id = "t_hogger", text = "A gnoll the size of a cart, with a temper to match. The Marshal's put a bounty on him, and so far the bounty's winning." } },
    _none = { { id = "t_none", text = "I wouldn't know about that. Try the inn; someone there always does." } },
  },
}

P:Pool {
  id = "citizen_northshire", role = "citizen", community = "northshire",
  greetings = {
    { id = "g_day", text = "Light's blessing, friend. You'll be one of the new recruits, then? Everyone is, this time of year." },
    { id = "g_dawn", when = { timeOfDay = "dawn" }, text = "Good morning! The brothers have been at their prayers for an hour already, and the bells will start any moment now." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "One of the Abbey's own! The brothers have been teaching young priests in these halls for longer than Stormwind's had walls, and they'll be proud of you, whether they say it or not." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", maxLevel = 15 },
      text = "A young paladin, in Northshire! The Silver Hand's first knights prayed in that Abbey, or so the brothers tell everyone who'll hold still long enough." },
  },
  lines = {
    { id = "l_abbey", text = "The Abbey's the oldest thing in the valley, and it was the first thing rebuilt after the war. The brothers said a valley without prayer was just a field." },
    { id = "l_vineyard", text = "Thieves in the vineyards, wolves in the woods and kobolds in Echo Ridge. Northshire was meant to be the quiet corner of Elwynn, and nobody told the kobolds." },
    { id = "l_recruits", text = "Every season a new crop of recruits comes up the road, all elbows and new boots. By the end of it they're walking straight and fighting wolves, and the Marshal sends them on their way." },
    { id = "l_wolves", text = "The wolves have been bolder this year. I lost two chickens last week, and the hens that are left won't lay for fright." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News reaches the valley late, but the brothers read every letter aloud at supper. Here's what I've heard from the table." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've done the valley a kindness, so I'll tell you all of it." },
    },
    kobolds = { { id = "t_kobolds", text = "Little rat-faced things with candles on their heads. They dig where they like and steal what they can carry, and they're braver in the dark than any of us." } },
    _none = { { id = "t_none", text = "I couldn't say. Ask one of the brothers; they've read more books than I've seen." } },
  },
}

P:Pool {
  id = "citizen_lakeshire", role = "citizen", community = "lakeshire",
  greetings = {
    { id = "g_day", text = "Welcome to Lakeshire, friend. Mind the bridge; it's been half built for longer than my youngest has been walking." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be out. If you hear drums up in the hills, don't stand about listening to them; get inside." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "You've been up in the hills, by the state of you. The orcs, was it, or the gnolls? Either way, you're lucky you came back walking." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! We've had more funerals than weddings this year, and our own chapel's been without a voice since spring. It's good to see you here." },
  },
  lines = {
    { id = "l_blackrock", text = "The Blackrock came down out of the mountains and took Stonewatch, and now they burn our farms whenever it suits them. We've asked Stormwind for soldiers, and Stormwind's asked us to be patient." },
    { id = "l_bridge", text = "The bridge was meant to be done last summer, and then the summer before. Foreman Oslow says it'll be ready by the rains, and he's said it every rainy season I can remember." },
    { id = "l_gnolls", text = "Gnolls in the hills, murlocs in the lake, orcs over the ridge. My husband jokes that Redridge is the only place where the fish fight back." },
    { id = "l_fishing", when = { timeOfDay = "dawn" }, text = "The fishermen go out at first light, while the murlocs are still asleep. You'll know when one of them doesn't, because you'll hear the shouting." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Everybody in Lakeshire knows everybody's business, and the rest comes in on the Stormwind road. Here's the talk." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've helped this town more than Stormwind has, so ask away, and I'll tell you true." },
    },
    blackrock = { { id = "t_blackrock", text = "Orcs who never gave up the old war, and they're led by something worse than an orc, people say. They come down from the mountains to burn and take, and then go back up again." } },
    _none = { { id = "t_none", text = "Can't help you there. Ask at the inn or the town hall; somebody will know." } },
  },
}

P:Pool {
  id = "citizen_darkshire", role = "citizen", community = "darkshire",
  greetings = {
    { id = "g_day", text = "A living face! Come into the lamplight where I can see you properly, and forgive me for asking." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Get off the road, friend, and quickly. The howling starts at this hour, and it's not far off tonight." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, in Darkshire! Would you walk by the cemetery on your way out and say something over it? The dead around here don't seem to stay where we put them." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" }, place = "replace",
      text = "Stay back! Oh, Light, it's only a priest. Don't come into town like that again, please; somebody will put a pike through you before they think to ask." },
  },
  lines = {
    { id = "l_worgen", text = "There's something in the woods that walks like a man and howls like a wolf. The Night Watch calls them worgen, and I call them the reason I don't sleep." },
    { id = "l_watch", text = "The Night Watch is mostly farmers and shopkeepers with lanterns and pikes, my brother among them. They're brave, but they're tired, and you can only be brave on so little sleep." },
    { id = "l_ravenhill", text = "Raven Hill was a decent village once, until the dead got up out of its graveyard. Nobody goes there now unless they're paid, or mad, or both." },
    { id = "l_lamps", text = "We keep every lamp in Darkshire lit through the night, and we count them at dawn. If one's gone out, somebody goes to see why, and nobody wants it to be them." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "In Darkshire, news is mostly about who didn't come back. Here's what I've heard, and I'm sorry for most of it." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what everybody knows, and then you'll want to get indoors." },
    },
    worgen = { { id = "t_worgen", text = "Big as a bear and clever as a man, and they hunt in the trees after dark. Don't chase the howling, whatever you do, because that's what it wants." } },
    night_watch = { { id = "t_watch", text = "Volunteers, every one of them, standing between this town and the dark. If you've a spare hour, they'd take your help before they'd take your sympathy." } },
    _none = { { id = "t_none", text = "I don't know about that. Ask the Watch; they hear more at night than I'd care to." } },
  },
}

P:Pool {
  id = "citizen_sentinel_hill", role = "citizen", community = "sentinel_hill",
  greetings = {
    { id = "g_day", text = "Welcome to Sentinel Hill. It's not much, but it's what Westfall's got left that isn't Defias." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Keep to the hill tonight. The scarecrows walk the fields after dark, and I'm not joking, though I wish I were." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest out here? Stormwind's forgotten us, but maybe the Light hasn't. There's folk on this hill who haven't had a proper blessing since the farms went." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've got a quiet step, and out here quiet steps make people nervous. No offense, but I'll keep an eye on you till the Militia vouches for you." },
  },
  lines = {
    { id = "l_farms", text = "My family farmed out by the Jansen Stead for three generations. Then the Defias came, and the scarecrows, and now we sleep in tents and watch somebody else's crops rot." },
    { id = "l_stormwind", text = "We sent letter after letter to Stormwind asking for soldiers, and they sent back letters asking for taxes. That's why the Militia exists, and why nobody here bows when the city's name is spoken." },
    { id = "l_moonbrook", text = "Moonbrook was a town once, a good one, with a church and a market. The Defias own it now, and you can see their fires from the hill at night." },
    { id = "l_gnolls", text = "The Riverpaw gnolls have started working for the Defias, or with them, which is worse. Gnolls that take orders are gnolls that can plan." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Everybody on this hill has lost something to Westfall, and we talk about it over the fires. Here's what's being said." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've stood with the Militia, so I'll tell you everything, even the parts that frighten me." },
    },
    people_militia = { { id = "t_militia", text = "Farmers with pitchforks and a few old soldiers who remember how to hold a line. Stormwind wouldn't help us, so we helped ourselves." } },
    _none = { { id = "t_none", text = "No idea. Ask one of the Militia; they hear more than I do." } },
  },
}

P:Pool {
  id = "citizen_menethil", role = "citizen", community = "menethil",
  greetings = {
    { id = "g_day", text = "Mind the planks, friend; half this harbor is under the bay and the other half is thinking about it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The last ship's in, and the docks are quiet. Well, quiet apart from the murlocs, and you stop hearing them after a while." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Come over from the Loch, have you? Then you came the long way round the Thandol Span, I hope, because nobody's crossing that bridge these days." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Off the boat from Auberdine, are you? Welcome to the wet side of the world. You'll find it smells of fish and tar, but the people are friendly enough." },
  },
  lines = {
    { id = "l_dragonmaw", text = "The Dragonmaw orcs have come out of the hills again, raiding the farms east of here. They used to keep dragons, people say, so I suppose we should be glad it's only orcs." },
    { id = "l_span", text = "The Thandol Span's the only bridge to Ironforge, and the Dark Irons have taken one end of it. So now everything for the dwarves goes round by sea, and the prices show it." },
    { id = "l_ships", text = "Ships to Theramore and Auberdine leave from the docks, if the weather's right and the captain's sober. One of the two is usually true." },
    { id = "l_keep", text = "Half the keep's still underwater from when the harbor flooded. The soldiers say you can see the old cellar doors at low tide, and nobody's had the nerve to open them." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Every ship brings a story, and every sailor tells it worse. Here's what's washed up lately." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's said on the docks, and then I've got rope to coil." },
    },
    dragonmaw = { { id = "t_dragonmaw", text = "Old Horde orcs who never laid down their axes. They hold Grim Batol, or what's left of it, and they don't care for the new Warchief any more than they care for us." } },
    _none = { { id = "t_none", text = "Not a thing. Ask a sailor; they'll make something up for you." } },
  },
}

P:Pool {
  id = "citizen_southshore", role = "citizen", community = "southshore",
  greetings = {
    { id = "g_day", text = "Welcome to Southshore, friend. It's a quiet town, or it would be, if not for the neighbors." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be wandering. Folk here keep their shutters closed at night, on account of what lives up the road in Tarren Mill." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest of the Light, and not one of those Scarlet zealots! You'll forgive me for checking. Some of them come through here on the way north, and they don't so much bless a town as inspect it." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Your accent's southern, from Stormwind way. Most of us here came down from the north when the plague came, and we don't hear that voice often." },
  },
  lines = {
    { id = "l_tarren", text = "The dead have taken Tarren Mill, not three hours' walk from here. They call themselves the Forsaken and say they're different from the Scourge, but I knew some of them when they were alive, and they never were very friendly." },
    { id = "l_syndicate", text = "The Syndicate runs the hills north of here, Alterac's old nobles turned thieves. My grandfather paid taxes to those families once, and now they rob his grandsons on the road." },
    { id = "l_durnholde", text = "That ruined fortress up the hill is Durnholde. They kept orcs there, years ago, and the one who escaped is the Warchief of the Horde now, if you'll credit it." },
    { id = "l_murlocs", text = "The murlocs on the shore get bolder every summer. I've stopped hanging washing on the line, because the last time they took my good shirt." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "We hear a great deal in Southshore, being between the Forsaken and the hills. Here's what's being said." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've done right by this town, so I'll tell you everything, even what we only whisper." },
    },
    syndicate = { { id = "t_syndicate", text = "The old nobles of Alterac and the cutthroats who work for them. They want their kingdom back, and they'll steal it a coin at a time if they have to." } },
    _none = { { id = "t_none", text = "No idea, I'm afraid. Ask at the inn; somebody there will have heard something." } },
  },
}

P:Pool {
  id = "citizen_thelsamar", role = "citizen", community = "thelsamar",
  greetings = {
    { id = "g_day", text = "Welcome tae Thelsamar! Good beer, good fishin', an' troggs in every hill, so ye'll never be bored." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late, is it? The Stoutlager's still open, an' that's where any sensible dwarf would be on a night like this." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "One o' ours, home from the mountain! Ye'll find the loch hasn't changed, an' neither have the troggs, worse luck." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, eh? Say a word for the dam, would ye? Every family down here prays it holds, an' it couldnae hurt tae have a professional ask." },
  },
  lines = {
    { id = "l_troggs", text = "Troggs came up out o' the ground after the war, an' they've been crawlin' out o' every hole in the hills since. Big, ugly, an' they smell like a wet cellar." },
    { id = "l_dam", text = "The Stonewrought Dam holds the whole loch back, an' there's a village under its shadow, so we keep an eye on it. Lately we keep both eyes on it." },
    { id = "l_league", text = "The Explorers' League has diggers all over the loch, an' every one o' them thinks they've found somethin' important. Ironband's lot are the loudest, an' the dustiest." },
    { id = "l_fish", text = "Best trout in Khaz Modan comes out o' this loch, an' ye can quote me. The fishermen at the docks will tell ye it's the cold water; I say it's the beer." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The roads between the mountain an' the loch carry plenty o' gossip, an' I catch most of it. Here's the lot." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell ye what's common, an' then ye can be on yer way." },
    },
    troggs = { { id = "t_troggs", text = "Stone-eatin' brutes from under the earth, an' there's no end tae them. Somebody dug too deep somewhere, an' we're all payin' for it." } },
    _none = { { id = "t_none", text = "Never heard tell of it. Try the Stoutlager; somebody'll make somethin' up." } },
  },
}

P:Pool {
  id = "citizen_kharanos", role = "citizen", community = "kharanos",
  greetings = {
    { id = "g_day", text = "Come in out o' the snow, will ye? Ye're lettin' the cold in just standin' there." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Cold enough tae freeze yer beard tae yer chin tonight. Get yerself intae the Thunderbrew afore ye turn intae a statue." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "One o' the Gnomeregan folk! Plenty o' yer people came through Kharanos after the fall, cold an' frightened. I hope ye're findin' yer feet." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Dwarf" },
      text = "A dwarf priest, fresh from the trainin'! The Light keeps ye warm, they say, which is a fine thing in Dun Morogh, so ye've chosen well." },
  },
  lines = {
    { id = "l_brew", text = "The Thunderbrew Distillery's the pride o' Kharanos, an' half o' Dun Morogh comes here tae drink. The other half comes here tae complain about the price, an' then drinks anyway." },
    { id = "l_frostmane", text = "The Frostmane trolls have been raidin' the farms again, up from their caves in the west. Ice trolls, mean as a blizzard, an' twice as cold." },
    { id = "l_gnomeregan", text = "Ye can see the smoke from Gnomeregan on a clear day. Somethin' terrible happened under there, an' the gnomes who got out don't like tae talk about it." },
    { id = "l_wendigo", text = "Wendigos in the caves north o' the road, big hairy brutes. My cousin went in after a lost goat an' came out without the goat, an' wi' fewer fingers." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Everybody stops in Kharanos on the way up the mountain, an' everybody talks. Here's what's goin' round." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "Ye're good folk, so I'll tell ye the lot an' buy ye a pint after." },
    },
    frostmane = { { id = "t_frostmane", text = "Ice trolls from the western caves, wi' blue skin an' bad tempers. They've hated dwarves since before there were dwarves tae hate, near enough." } },
    _none = { { id = "t_none", text = "Couldnae tell ye. Ask at the inn, where there's always somebody who thinks they know." } },
  },
}

---------------------------------------------------------------------------
-- Towns of Kalimdor (Alliance)
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_auberdine", role = "citizen", community = "auberdine",
  greetings = {
    { id = "g_day", text = "Ishnu-alah. The boats are at the piers, and the sea is calm today, which is more than can be said for the land." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay near the lamps after dark. The furbolgs come closer than they used to, and they are not the gentle folk they were." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! The land here is sick, and we have too few healers who can hear it. Please, speak with the druids at the edge of town before you leave." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Off the ship from Menethil? Welcome to Darkshore. You'll find it quieter than your cities, and a good deal sadder." },
  },
  lines = {
    { id = "l_moonkin", text = "The moonkin on the eastern ridge were gentle creatures once, and now they attack anyone who comes near. Something is poisoning this coast, and nobody can tell me what." },
    { id = "l_furbolgs", text = "The Blackwood furbolgs traded with us for years, honey for arrows. Now they've gone mad, every one of them, and they won't even look at us without snarling." },
    { id = "l_ships", text = "The boat to Rut'theran leaves every hour, and the ship to Menethil when the captain feels like it. I've waited three days for that ship, and I'll wait three more." },
    { id = "l_ruins", text = "There are ruins all along this coast, older than anyone alive. My grandmother remembered when some of them were still houses, and she was not a young woman." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Every boat brings word from the tree or from the east, and I hear it on the pier. Here is what has come." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I will tell you a little, but I must be home before dark." },
    },
    furbolgs = { { id = "t_furbolgs", text = "Bear-folk, gentle and wise once, and friends to the druids. Something has driven most of them mad, and those who are left are hiding." } },
    _none = { { id = "t_none", text = "I do not know. Ask the druids; they listen to things the rest of us cannot hear." } },
  },
}

P:Pool {
  id = "citizen_astranaar", role = "citizen", community = "astranaar",
  greetings = {
    { id = "g_day", text = "Welcome to Astranaar, traveler. We are an island in the lake and an island in the war, and you'll find both are true." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay on the island tonight. The satyrs walk the shore after dark, and they laugh while they hunt." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Orc axes or satyr claws? It doesn't matter much which, out here; they both leave the same marks. See the smith before you go out again." },
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Gnome", "Human" } },
      text = "A friend from across the sea, here in Ashenvale! We are grateful for every blade that comes, and I'm sorry this forest has so little peace to offer you." },
  },
  lines = {
    { id = "l_warsong", text = "The Warsong orcs are cutting down the forest to the east, tree by tree. Every one they fell is older than their whole race's history on this world." },
    { id = "l_sentinels", text = "The Sentinels hold the roads, but there are too few of them and too many enemies. My daughter serves with them, and I count every day she comes home." },
    { id = "l_satyrs", text = "The satyrs were elves once, did you know that? Highborne, corrupted by demons, and now they creep through our forests and mock us with our own faces." },
    { id = "l_furbolgs", text = "The Thistlefur furbolgs have gone mad, like their kin to the north. They used to leave gifts on the lake shore, and now they leave bodies." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Astranaar from every corner of the forest, and very little of it is good. Here is what I can tell you." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've fought for this forest, and so I will hold nothing back." },
    },
    warsong = { { id = "t_warsong", text = "Orcs from the north, with saws and axes and no reverence for anything older than themselves. The Sentinels fight them every day, and the forest bleeds every day regardless." } },
    _none = { { id = "t_none", text = "I don't know. The Sentinels might; ask at the gate." } },
  },
}

P:Pool {
  id = "citizen_dolanaar", role = "citizen", community = "dolanaar",
  greetings = {
    { id = "g_day", text = "Ishnu-alah, young one. Dolanaar is peaceful, mostly, and the moonwell is just there if you need to rest." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Elune's light on you. The forest is quiet tonight, and I hope it stays that way." },
  },
  notice = {
    { id = "n_new", cat = "class", when = { race = "NightElf", maxLevel = 10 },
      text = "You've come down from Shadowglen, haven't you? I remember my own first walk to Dolanaar, though that was a very long time ago." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human on Teldrassil! You've come a long way, and the tree is a long way up. Are you finding the air agrees with you?" },
  },
  lines = {
    { id = "l_gnarlpine", text = "The Gnarlpine furbolgs were our friends, and now they rage through the forest like beasts. The druids say something in the tree is corrupting them, and they don't say what." },
    { id = "l_tree", text = "Teldrassil is still young, and some of its creatures are wilder than they should be. The druids watch it carefully, and so do the rest of us." },
    { id = "l_moonwell", text = "The moonwell here is small, but it's pure. Drink from it if you're tired; Elune doesn't ask for anything in return." },
    { id = "l_sentinels", text = "The Sentinels pass through Dolanaar on their way to the coast. They're quieter than they used to be, and I think the war in Ashenvale weighs on them." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Dolanaar is small, but news finds its way here like water finds the roots. Here is what has reached me." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I will tell you, but you must forgive me if I am brief with a stranger." },
    },
    furbolgs = { { id = "t_furbolgs", text = "They were wise and gentle, and they shared our forest gladly. Now they don't recognize anyone, even the druids who taught them." } },
    _none = { { id = "t_none", text = "I don't know. Perhaps the druids at the Enclave in Darnassus could tell you." } },
  },
}

P:Pool {
  id = "citizen_theramore", role = "citizen", community = "theramore",
  greetings = {
    { id = "g_day", text = "Welcome to Theramore! Watch your step on the docks; they're always wet, and the fog comes in fast." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be out. The marsh is louder at night, and most of what's making the noise has teeth." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, in Theramore! We've plenty of mages here, thanks to the Lady, but not enough people who can mend a broken heart. You'll find plenty of them in this city." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "From Stormwind, are you? Most of us came from Lordaeron, on the ships with the Lady. It's good to hear a southern voice." },
  },
  lines = {
    { id = "l_jaina", text = "Lady Proudmoore brought us here across the sea when Lordaeron fell. She built this city out of a swamp, and she keeps the peace with the orcs, which some folk don't forgive her for." },
    { id = "l_kultiras", text = "Half the sailors here are Kul Tiran, and they don't talk about the Admiral. If you want to keep your teeth, you won't either." },
    { id = "l_varian", text = "The King of Stormwind was coming here to talk peace when he vanished. Nobody knows what happened, and the Lady won't say, if she even knows." },
    { id = "l_marsh", text = "Crocolisks in the water, ogres in the hills, and dragons in the south, people say. Dustwallow's no place to raise children, but it's where we are." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Every ship brings news from Stormwind or Menethil, and the marsh brings the rest. Here's what I've heard." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've been a friend to Theramore, so I'll tell you everything." },
    },
    _none = { { id = "t_none", text = "I don't know about that. Ask in the citadel; the Lady's people know everything." } },
  },
}

P:Pool {
  id = "citizen_nijels_point", role = "citizen", community = "nijels_point",
  greetings = {
    { id = "g_day", text = "A new face! We don't get many out here, so forgive me for staring. What brings you to Desolace?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay inside the walls after dark. The centaur ride at night, and they don't care which banner you fly." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "You look like the valley's been chewing on you. Centaur arrows, or just the land itself? Both are bad, out here." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, all the way out here! Brother Anton could use the company, I think; it gets lonely being the only one praying in a land this dead." },
  },
  lines = {
    { id = "l_centaur", text = "The centaur clans fight each other more than they fight us, thank the Light. The Kolkar, the Gelkis, the Magram: they all hate each other, and we try to keep it that way." },
    { id = "l_supplies", text = "The supply wagons come once a month, if they come at all. We ration everything out here, even the stories." },
    { id = "l_land", text = "Nothing grows in Desolace, nothing at all. The old folk say there was a great battle here once, and the land never forgot it." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes slowly out here, but it comes. Here's what I've heard from the last caravan." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what everybody here knows, and that's not much." },
    },
    _none = { { id = "t_none", text = "Never heard of it. Ask the Captain; he's got all the maps." } },
  },
}

P:Pool {
  id = "citizen_feathermoon", role = "citizen", community = "feathermoon",
  greetings = {
    { id = "g_day", text = "Welcome to Feathermoon. You came by boat, I hope, because the swimming is not recommended." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The stars are bright over the sea tonight. The Sentinels say it's a good omen, though they say that about most things." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The ogres got to you, or the gnolls? Feralas has many teeth. Rest here a while before you go back to the mainland." },
    { id = "n_human", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "A friend from the eastern kingdoms, all the way out here! Few of your people make it to Feralas, and fewer leave it the same." },
  },
  lines = {
    { id = "l_eldre", text = "The ruins in the forest were Eldre'Thalas once, a city of the Highborne. Something still lives in them, people say, and it doesn't welcome visitors." },
    { id = "l_ogres", text = "The Gordunni ogres have been bold lately, raiding the coast. The Sentinels have their hands full, and the forest is wide." },
    { id = "l_horde", text = "The tauren have a camp on the other side of the forest. They keep to their side, and we keep to ours, and the ogres keep everyone busy." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Feathermoon is far from everything, but the boats bring news. Here is what has come across the water." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've been good to this outpost, so I'll tell you all of it." },
    },
    highborne = { { id = "t_highborne", text = "Our ancestors who loved magic too much and trusted the wrong queen. Some of them are still in those ruins, people whisper, and they never left." } },
    _none = { { id = "t_none", text = "I do not know. The Sentinels might, if you can get them to talk." } },
  },
}

---------------------------------------------------------------------------
-- Alliance outposts and frontier towns
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_refuge_pointe", role = "citizen", community = "refuge_pointe",
  greetings = {
    { id = "g_day", text = "Welcome to Refuge Pointe. It's tents and hope, mostly, but we're still here." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Keep close to the fires tonight. The Syndicate creeps about these hills in the dark, and so do the trolls." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Stormwind, by your accent? Stromgarde's not what it was, but it was one of the Seven Kingdoms once. We haven't forgotten." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! We've buried more of our own than we've healed this year. If you've a moment, the wounded are in the big tent." },
  },
  lines = {
    { id = "l_stromgarde", text = "Stromgarde Keep is just over the ridge, and on a clear day you can see it from here. The ogres and the Syndicate hold it now, but one day it'll be ours again." },
    { id = "l_syndicate", text = "The Syndicate are thieves and murderers, but they used to be lords, and they still act like it. They'd sell their own mothers if the price was right." },
    { id = "l_trolls", text = "Witherbark trolls in the hills to the east. They don't take prisoners, and they don't leave much behind." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News reaches the camp with the scouts, and most of it's bad. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what everyone knows, and then I've work to do." },
    },
    syndicate = { { id = "t_syndicate", text = "Alterac's old nobility, turned to banditry. They hide in the hills and the ruins, and they kill for coin or for spite." } },
    _none = { { id = "t_none", text = "I don't know. Ask the Captain; she knows what's happening in the highlands." } },
  },
}

P:Pool {
  id = "citizen_aerie_peak", role = "citizen", community = "aerie_peak",
  greetings = {
    { id = "g_day", text = "Welcome tae Aerie Peak! Mind the gryphons; they bite, an' they're no' particular about who." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stars are out over the Hinterlands, an' the gryphons are settlin' down. Best hour o' the day, if ye ask me." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "An Ironforge dwarf, here among the Wildhammer! Welcome, cousin. Up here we judge a dwarf by how he sits a gryphon, no' by his clan." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Ye'll fit in here, then. We Wildhammer know a thing or two about beasts, an' the gryphons will like ye better than most." },
  },
  lines = {
    { id = "l_gryphons", text = "Every Wildhammer has a gryphon, or wants one. They're loyal, an' fierce, an' they'll carry ye anywhere, if they like ye." },
    { id = "l_trolls", text = "The Witherbark an' the Vilebranch trolls are always raidin' our borders. We fly over 'em an' drop things on their heads, an' they hate us for it." },
    { id = "l_feud", text = "We Wildhammer left Ironforge a long time ago, after a falling out. The Bronzebeards are cousins, but they're stubborn cousins, an' they think the same o' us." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The gryphon riders see everythin' from the sky, an' they tell it all in the tavern. Here's what's goin' round." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "Ye're a friend o' the Wildhammer, so I'll tell ye the lot." },
    },
    _none = { { id = "t_none", text = "Never heard of it. Ask the Thane; he'll know, or he'll pretend tae." } },
  },
}

P:Pool {
  id = "citizen_chillwind_camp", role = "citizen", community = "chillwind_camp",
  greetings = {
    { id = "g_day", text = "You've come to Chillwind. Keep your weapon close and your wits closer; the dead don't rest out here." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Get to the fires. The Scourge walks at night, and the plague's worse in the dark." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, thank the Light! The plague takes more of us than the Scourge does, and we've only the one healer in camp. If you can spare the time, they'd be grateful." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin! The Silver Hand stood on these fields once, before the plague. It's good to see the Light come back to Lordaeron, even if it's only one of you." },
  },
  lines = {
    { id = "l_scourge", text = "The Scourge holds everything from here to the eastern sea. We hold this camp, and a few others, and we pray that's enough." },
    { id = "l_cauldrons", text = "The Scourge have set up great cauldrons across the land, spewing plague into the air. Breathe carefully near them, and wash your hands after." },
    { id = "l_andorhal", text = "Andorhal was the heart of the plague, people say, where the grain was poisoned. Now it's a ruin full of the dead, and the Forsaken and the Scourge fight over its bones." },
    { id = "l_scarlet", text = "The Scarlet Crusade holds Hearthglen to the north. They fight the Scourge too, but they'd as soon burn you as look at you, if they decided you were tainted." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The scouts bring word from the plaguelands, and none of it is good. Here's what I've heard." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've fought beside us, so I'll tell you everything, even the parts that keep me awake." },
    },
    plague_cauldrons = { { id = "t_cauldrons", text = "Great iron pots, bubbling with plague, set up all over the countryside. The Scourge spreads its sickness from them, and the Argent Dawn wants every one destroyed." } },
    _none = { { id = "t_none", text = "I don't know. Ask the commander, or the Argent Dawn's people; they'll know." } },
  },
}

P:Pool {
  id = "citizen_morgans_vigil", role = "citizen", community = "morgans_vigil",
  greetings = {
    { id = "g_day", text = "You've made it to Morgan's Vigil. Welcome, and keep your head down; the Blackrock have archers." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The mountain glows at night, and the orcs beat their drums. You get used to it, or you go home." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The Blackrock, or the dragonkin? Either way, you're lucky to be standing. Get yourself mended before you go back out." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! The Steppes are hard on the soul as well as the body. If you've a prayer to spare, there are men here who could use it." },
  },
  lines = {
    { id = "l_blackrock", text = "The Blackrock orcs hold the Spire, and they've a dragon for a master, people say. Every day they send raiders down, and every day we send them back." },
    { id = "l_windsor", text = "Marshal Windsor led an expedition into the mountain and never came back. Some say he's dead, and some say he's a prisoner of the Dark Irons, and nobody knows for sure." },
    { id = "l_land", text = "The Steppes were green once, before the orcs came and the dragons burned it. Now there's nothing but ash and fire, as far as you can see." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes from the front lines, and the front lines are everywhere out here. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've a watch to stand." },
    },
    windsor = { { id = "t_windsor", text = "A brave man who went into the mountain to find out what the Dark Irons were planning. He didn't come back, and the Marshal here hasn't stopped looking." } },
    _none = { { id = "t_none", text = "I don't know. Ask the Marshal; he knows the Steppes better than anyone." } },
  },
}

---------------------------------------------------------------------------
-- Neutral towns: both factions walk their streets.
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_booty_bay", role = "citizen", community = "booty_bay",
  greetings = {
    { id = "g_day", text = "Welcome to Booty Bay, pal! Everything's for sale, and everything's got a price, so bring your purse." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night in the Bay, and the taverns are just getting started. Mind your pockets and mind the pier edges." },
  },
  notice = {
    { id = "n_horde", cat = "faction", when = { faction = "Horde" },
      text = "Horde, eh? Your coin's as good as anybody's here, so spend it freely. Just don't start anything with the Alliance folk; the Baron's bruisers don't care who started it." },
    { id = "n_alliance", cat = "faction", when = { faction = "Alliance" },
      text = "Alliance, eh? Your gold's welcome here, same as anybody's. Just keep your blade sheathed around the orcs; the Baron likes his town peaceful." },
  },
  lines = {
    { id = "l_cartel", text = "The Steamwheedle Cartel runs this town, and they run it for profit. As long as you're spending, you're welcome; once you stop, you're scenery." },
    { id = "l_bloodsail", text = "The Bloodsail Buccaneers have been raiding the ships again. They're pirates, real pirates, and they've got no love for the Cartel or anybody who trades with it." },
    { id = "l_sharks", text = "Don't go swimming in the bay. The sharks are big, and they're always hungry, and they've learned that people fall off the pier on Fridays." },
    { id = "l_jungle", text = "The jungle's full of trolls, tigers and worse. Most folk who come through here are heading out into it, and fewer come back than you'd like." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Every ship brings rumors, and I buy 'em cheap and sell 'em dear. Here's what I've got in stock." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Rumors cost money, pal, but I'll give you the cheap ones for free." },
    },
    bloodsail = { { id = "t_bloodsail", text = "Pirates with a grudge against the Cartel. They've got a fleet off the coast, and they don't take prisoners unless they think they can ransom 'em." } },
    _none = { { id = "t_none", text = "Never heard of it, and I hear everything. Must not be worth much." } },
  },
}

P:Pool {
  id = "citizen_gadgetzan", role = "citizen", community = "gadgetzan",
  greetings = {
    { id = "g_day", text = "Welcome to Gadgetzan! Hot, dry and expensive, but the water's clean and the Cartel keeps the peace." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Gets cold at night in the desert. Who'd have thought it? Stay inside the walls; the bandits like the dark." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, in a goblin town! Don't worry, we don't bite. Much. Well, the engineers argue a bit, but it's all in good fun." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The desert's been chewing on you. Bandits, or the bugs? There's a smith in town, but bring money; nothing's free in Gadgetzan." },
  },
  lines = {
    { id = "l_water", text = "Water's the most precious thing in Tanaris, and the Cartel sells it by the bucket. Don't waste it, and don't ask how much it costs if you don't want to cry." },
    { id = "l_bandits", text = "The Wastewander bandits raid the caravans and steal the water. The Cartel's put a bounty on them, but there's always more bandits than bounty." },
    { id = "l_trolls", text = "The Sandfury trolls hold a city in the desert to the north. Zul'Farrak, they call it, and nobody goes there who wants to come back." },
    { id = "l_racing", text = "The Mirage Raceway's up north on the Shimmering Flats. The gnomes and the goblins race their machines, and they bet everything on it, including things they don't own." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Gadgetzan's the crossroads of the desert, and everybody passes through. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Information costs money, but I'll give you the basics for free." },
    },
    steamwheedle = { { id = "t_steamwheedle", text = "The goblin trading company that runs the neutral towns. Booty Bay, Ratchet, Everlook and here: if you're spending money, the Cartel's getting a cut." } },
    _none = { { id = "t_none", text = "Never heard of it. Ask at the Road Warrior; somebody there's always talking." } },
  },
}

P:Pool {
  id = "citizen_everlook", role = "citizen", community = "everlook",
  greetings = {
    { id = "g_day", text = "Welcome to Everlook! Cold, isn't it? The Cartel built a town in the snow, and we're still wondering why." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Freezing tonight. Get inside, or you'll be an icicle by morning." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The furbolgs, or the yetis? Winterspring's got plenty of both. There's a smith in town, but bring money." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! The Argent Dawn has a man here, and he'd be glad of the company, I think. The Scourge are stirring in the north, and he worries." },
  },
  lines = {
    { id = "l_cold", text = "It's always cold in Winterspring, even in summer. The goblins wear three coats and complain about all of them." },
    { id = "l_furbolgs", text = "The Timbermaw furbolgs hold the pass to the south. They're not as mad as their cousins, but they don't trust outsiders." },
    { id = "l_dawn", text = "The Argent Dawn has a man in Everlook, watching the north. They say the Scourge are stirring in the mountains, and he wants to be ready." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Travelers bring news to Everlook, and I hear it all. Here's what's going around." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you the common stuff, and then I'm going back inside." },
    },
    argent_dawn = { { id = "t_dawn", text = "A brotherhood of folk sworn to fight the Scourge, from every race and faction. They don't ask which side you're on, only whether you'll stand against the dead." } },
    _none = { { id = "t_none", text = "Never heard of it. Ask at the inn; somebody's always got a story." } },
  },
}

P:Pool {
  id = "citizen_light_hope", role = "citizen", community = "light_hope",
  greetings = {
    { id = "g_day", text = "You've come to Light's Hope. Whatever banner you fly, leave it at the gate; here we fight the dead together." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The bell rings at night when the dead come close. Stay near the chapel, and pray it stays quiet." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, here among the dead! The Light burns brightest in the darkest places, they say. You'll find plenty of darkness out there to test it on." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken, here? The Dawn takes anyone who fights the Scourge, and you've more reason than most. Just don't take it personally if people stare." },
  },
  lines = {
    { id = "l_dawn", text = "The Argent Dawn holds this chapel against the Scourge. Humans, dwarves, orcs, even Forsaken: here, we're all just the living against the dead." },
    { id = "l_scourge", text = "The Scourge hold Stratholme to the north, and the dead walk everywhere else. We hold this chapel, and the chapel holds us." },
    { id = "l_scarlet", text = "The Scarlet Crusade holds Tyr's Hand to the south. They fight the Scourge too, but they'd burn half of us here for being what we are." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to the chapel with the patrols, and it's mostly about the dead. Here's what I've heard." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've fought beside the Dawn, so I'll tell you everything." },
    },
    argent_dawn = { { id = "t_dawn", text = "We're the ones who stand against the Scourge, wherever it walks. We don't care about Alliance or Horde, only whether you'll fight the dead." } },
    _none = { { id = "t_none", text = "I don't know. Ask inside the chapel; the commanders know more than I do." } },
  },
}

P:Pool {
  id = "citizen_thorium_point", role = "citizen", community = "thorium_point",
  greetings = {
    { id = "g_day", text = "Welcome tae Thorium Point. Aye, we're Dark Iron, but no' the bad kind, so keep yer hammer on yer belt." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The Gorge glows red at night, an' the smoke never stops. Ye get used tae it, or ye leave." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard, starin' at a Dark Iron! Get it out o' yer system, an' then we can talk like civilized dwarves." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The Gorge chewed yer gear. Our smiths are the best in the mountains, but they're no' cheap, mind." },
  },
  lines = {
    { id = "l_brotherhood", text = "The Thorium Brotherhood forged weapons for the Firelord's armies, until we found a way out. Now we forge for whoever pays, which is a better bargain." },
    { id = "l_kin", text = "Our kin are still under the mountain, bowin' tae fire an' forgin' for Ragnaros. We left, an' they didnae, so don't lump us together." },
    { id = "l_gorge", text = "The Searing Gorge was green once, before the Dark Irons called up the fire. Now it's nothin' but slag an' smoke, an' we live in the middle of it." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes up from the mountain an' down from the Spire, an' I hear most of it. Here's what's goin' round." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell ye the common stuff, an' then ye can go." },
    },
    dark_iron = { { id = "t_darkiron", text = "Our kin, aye, but no' our friends. They serve the Firelord under the mountain, an' they'd kill us for leavin' if they could." } },
    _none = { { id = "t_none", text = "Never heard of it. Ask the Overseer; he knows everything, or says he does." } },
  },
}

P:Pool {
  id = "citizen_marshals_refuge", role = "citizen", community = "marshals_refuge",
  greetings = {
    { id = "g_day", text = "Welcome to Marshal's Refuge! We've been stuck in this crater for months, so any new face is a good one." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay close to the fire tonight. The devilsaurs hunt at night, and they're big enough to step on you." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The crater's had a go at you, I see. Raptors, or something bigger? Either way, you're lucky." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! You'll find plenty to hunt in Un'Goro, if it doesn't hunt you first. The devilsaurs are the size of a house." },
  },
  lines = {
    { id = "l_stranded", text = "We came here on an expedition, and now we're stuck. The crater's walls are too steep to climb, and the only way out is the way the dinosaurs came in." },
    { id = "l_crystals", text = "There are glowing crystals all over the crater, and nobody knows what they're for. The scholars say they're full of power, but they won't say what kind." },
    { id = "l_silithid", text = "The silithid have a hive in the southeast, and they're spreading. Big bugs, with big mandibles, and they don't like visitors." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "We've been here long enough to know the crater's secrets, or some of them. Here's what I've learned." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got to get back to watching for devilsaurs." },
    },
    silithid = { { id = "t_silithid", text = "Big insects from the south, with a hive in the crater. They're spreading, and nobody knows how to stop them." } },
    _none = { { id = "t_none", text = "Never heard of it. Ask the Marshal; he's the one who got us stuck here." } },
  },
}

P:Pool {
  id = "citizen_nighthaven", role = "citizen", community = "nighthaven",
  greetings = {
    { id = "g_day", text = "Welcome to Nighthaven. Weapons stay sheathed here, and voices stay soft; the Circle keeps the peace." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The moon's on the lake tonight. Walk softly; the village sleeps light, and the druids sleep lighter." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Whatever banner you fly elsewhere, here you're of the Circle. Welcome home, or as close as any of us get." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, in Moonglade! The Light's welcome here, as long as it doesn't trample the herb beds." },
  },
  lines = {
    { id = "l_circle", text = "The Cenarion Circle keeps Moonglade for all druids, whatever their race or banner. Orc and elf, tauren and human, all equal under the moon." },
    { id = "l_remulos", text = "Keeper Remulos watches over the glade, son of Cenarius himself. He's old, older than the trees, and he sees everything." },
    { id = "l_malfurion", text = "Malfurion Stormrage sleeps in the barrow dens beneath us, dreaming. The druids say he walks in the Dream, and that one day he'll wake." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Druids come to Moonglade from every corner of the world, and they bring news. Here's what I've heard." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've kept the peace of the glade, so I'll tell you everything." },
    },
    cenarion_circle = { { id = "t_circle", text = "The druids of every race, sworn to keep the balance of nature. They meet here, in the glade, and they don't care about Alliance or Horde." } },
    _none = { { id = "t_none", text = "I don't know. Ask the druids; they know the land better than anyone." } },
  },
}

---------------------------------------------------------------------------
-- Horde towns
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_crossroads", role = "citizen", community = "crossroads",
  greetings = {
    { id = "g_day", text = "Lok'tar, and welcome to the Crossroads. The water's at the well, and the trouble's everywhere else." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay inside the walls tonight. The centaur ride at night, and they don't stop to ask whose side you're on." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The Barrens has been chewing on you. Centaur, quilboar, or the heat? Get mended before you go back out." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, far from the grass of Mulgore! The Barrens is hard country, cousin, but the Crossroads will shelter you." },
  },
  lines = {
    { id = "l_centaur", text = "The centaur raid the caravans from the west, and the quilboar from the south. The Crossroads sits in the middle, and holds." },
    { id = "l_wailing", text = "There's a cave in the south where the druids went to heal the land. They came out strange, and the water tastes wrong near there." },
    { id = "l_northwatch", text = "The Alliance have a fort at Northwatch, on the coast. They watch us, and we watch them, and everyone waits." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Every caravan stops at the Crossroads, and every caravan has a story. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got work." },
    },
    wailing_caverns = { { id = "t_wailing", text = "A cave in the south, where the druids went to heal the Barrens. Something went wrong, and now the druids are mad and the cave is full of monsters." } },
    _none = { { id = "t_none", text = "I don't know. Ask Thork; he's on the tower, glaring at the horizon as usual." } },
  },
}

P:Pool {
  id = "citizen_razor_hill", role = "citizen", community = "razor_hill",
  greetings = {
    { id = "g_day", text = "Welcome to Razor Hill. The roads to Orgrimmar, Sen'jin and the Barrens all meet here, and so does trouble." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Get inside the walls. The cultists like the dark, and they've been bold lately." },
  },
  notice = {
    { id = "n_new", cat = "class", when = { maxLevel = 10 },
      text = "Fresh out of the Valley of Trials, are you? Keep your weapon loose and your eyes open, because Durotar bites." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, eh? Sen'jin's just down the road, if you're homesick. The trolls there will feed you better than we can." },
  },
  lines = {
    { id = "l_blade", text = "The Burning Blade cultists hide in the canyons, worshipping demons. The Warchief says we're done with that, but some orcs never learn." },
    { id = "l_kultiras", text = "The Kul Tirans have a fortress on the coast, Tiragarde Keep. They're still angry about their admiral, and they send ships to watch us." },
    { id = "l_quilboar", text = "The quilboar come from the west, raiding the farms. They're ugly and they smell, but they fight like demons." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Everything that comes up the road passes Razor Hill first. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Ask, and keep it short; I've work to do." },
    },
    burning_blade = { { id = "t_blade", text = "Demon-worshippers who want the old ways back. They hide in the canyons, and Orgnil hunts them; don't get in his way." } },
    _none = { { id = "t_none", text = "I don't know. Ask Gar'Thok, in the barracks; he doesn't like questions, but he answers them." } },
  },
}

P:Pool {
  id = "citizen_brill", role = "citizen", community = "brill",
  greetings = {
    { id = "g_day", text = "Welcome to Brill. It was a human town once, and now it's ours. The smell doesn't bother us, but you might want to breathe through your mouth." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night in Tirisfal. It's always gloomy here, but at night the Scarlet patrols come closer, so keep your eyes open." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge", maxLevel = 10 },
      text = "Fresh from Deathknell, are you? It takes a while to get used to it all. Don't worry; the rot stops itching after the first year." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Skyborne" } },
      text = "One of the living, here in Brill? You'll get stares, but most of us are friendly enough, in our way." },
  },
  lines = {
    { id = "l_scarlet", text = "The Scarlet Crusade has a monastery to the northeast. They hunt us like animals, and they call it holy work." },
    { id = "l_farms", text = "The farms around Brill are all rotting now. Some of us were farmers once, and we remember what the fields looked like when they were green." },
    { id = "l_tavern", text = "The Gallows' End Tavern is the best place in Brill, which isn't saying much. The innkeeper is pleasant enough, for a corpse." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Brill from the Undercity and the frontier. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then you can leave me be." },
    },
    scarlet_crusade = { { id = "t_scarlet", text = "Zealots in red who think the Light wants them to burn us. They've got a monastery to the northeast, and they never stop hunting." } },
    _none = { { id = "t_none", text = "I don't know. Ask at the tavern; someone there might." } },
  },
}

P:Pool {
  id = "citizen_tarren_mill", role = "citizen", community = "tarren_mill",
  greetings = {
    { id = "g_day", text = "Welcome to Tarren Mill. It's quiet here, mostly, except when the humans from Southshore come calling." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The night's dark in Hillsbrad, and the Syndicate creep about. Stay close to the town." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Skyborne" } },
      text = "One of the living, here in Tarren Mill! The humans in Southshore hate us, but they'd hate you just as much, so we're all friends here." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The Syndicate, or the ogres? Hillsbrad's full of both. Get yourself mended before you go back out." },
  },
  lines = {
    { id = "l_southshore", text = "The humans in Southshore were our neighbors once, in life. Now they hate us, and we... well, we don't love them either." },
    { id = "l_syndicate", text = "The Syndicate are Alterac's old nobles, turned to thieving. They hide in the hills and rob anyone who passes." },
    { id = "l_apothecary", text = "The Apothecaries have business in the hills, testing their brews. I don't ask what they're testing, and you shouldn't either." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Tarren Mill from Southshore and the hills. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got work." },
    },
    syndicate = { { id = "t_syndicate", text = "Thieves and cutthroats, led by the old nobles of Alterac. They want their kingdom back, and they'll kill anyone in their way." } },
    _none = { { id = "t_none", text = "I don't know. Ask the High Executor; he knows everything that happens in Hillsbrad." } },
  },
}

P:Pool {
  id = "citizen_bloodhoof", role = "citizen", community = "bloodhoof",
  greetings = {
    { id = "g_day", text = "Welcome to Bloodhoof Village. The grass is high this year, and the kodo are fat." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Mulgore is quiet at night, but sometimes too quiet. Stay near the fires." },
  },
  notice = {
    { id = "n_new", cat = "race", when = { race = "Tauren", maxLevel = 10 },
      text = "First time out of Narache? The plains are wide, and there's no shame in walking them slowly." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the sky-folk from Gev'rek! Thunder Bluff called you friends, so you're friends here. Earth Mother keep you." },
  },
  lines = {
    { id = "l_venture", text = "The goblins of the Venture Company are cutting our trees and poisoning our wells. Baine has sent braves to stop them, but they keep coming back." },
    { id = "l_gnolls", text = "The Palemane gnolls have been raiding the farms to the west. They're thieves and cowards, but there are a lot of them." },
    { id = "l_kodo", text = "The kodo are the heart of our people. They carry our homes, our goods and our children, and they ask for nothing but grass." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News crosses the plains slowly, but it does arrive. Here's what has reached us." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've walked the plains as a friend, so I'll tell you everything." },
    },
    venture_company = { { id = "t_venture", text = "Goblins with saws and drills, cutting down our trees and poisoning our water. They call it business; we call it theft." } },
    _none = { { id = "t_none", text = "I don't know. Ask Baine, in the big tent; he listens to everyone." } },
  },
}

P:Pool {
  id = "citizen_freewind", role = "citizen", community = "freewind",
  greetings = {
    { id = "g_day", text = "Welcome to Freewind Post. Mind the edges; the mesas are high, and the wind is strong." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The stars are close up here at night. Sit a while, if you like; the lifts will wait." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The centaur, or the Grimtotem? Thousand Needles is full of both. Rest here a while." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, here among the needles! Welcome, cousin. The Grimtotem are about, so watch who you trust." },
  },
  lines = {
    { id = "l_grimtotem", text = "The Grimtotem have been bold lately, raiding the mesas. They hate the Horde, and they hate any tauren who follows Cairne." },
    { id = "l_centaur", text = "The Galak centaur roam the canyons below. They're not as many as in the Barrens, but they're just as mean." },
    { id = "l_flats", text = "The goblins and gnomes race their machines on the Shimmering Flats to the east. Loud, smelly things, and they crash more often than they finish." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The wind carries news to the mesas, and I listen. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you a little, but I'm wary of strangers." },
    },
    grimtotem = { { id = "t_grimtotem", text = "A clan of tauren who hate the orcs and the Horde. They keep to the old ways, and they'll kill anyone who stands in their way." } },
    _none = { { id = "t_none", text = "I don't know. Ask the Cliffwatcher; he sees everything from up there." } },
  },
}

P:Pool {
  id = "citizen_taurajo", role = "citizen", community = "taurajo",
  greetings = {
    { id = "g_day", text = "Welcome to Camp Taurajo. The quilboar are to the south, and the centaur to the west, so keep your weapon close." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay near the fires tonight. The Barrens are dangerous after dark." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The quilboar got to you? Their spines are sharp, and their tempers are worse. Get mended." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, far from Mulgore! Welcome to the camp, cousin. The Barrens are hard, but we hold." },
  },
  lines = {
    { id = "l_quilboar", text = "The Razorfen quilboar have their warrens to the south. They're dangerous, and they hate everyone who isn't quilboar." },
    { id = "l_dwarves", text = "There are dwarves digging in Bael Modan to the east. They're looking for something old, and they don't care whose land it's on." },
    { id = "l_camp", text = "This camp's not much, but it's a safe place in the Barrens. That's worth more than gold, out here." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to the camp from the south and the east. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got work." },
    },
    _none = { { id = "t_none", text = "I don't know. Ask the Chief; he knows the Barrens better than anyone." } },
  },
}

P:Pool {
  id = "citizen_stonard", role = "citizen", community = "stonard",
  greetings = {
    { id = "g_day", text = "Welcome to Stonard. Mind the mud, and mind the crocs; they're both hungry." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The swamp's loud at night. Most of it's frogs, but not all of it." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar! You're standing where the old Horde first planted its banners on this world. Remember it was us who came back." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The swamp's had a go at you. Get mended, and don't drip on the smith." },
  },
  lines = {
    { id = "l_swamp", text = "The Swamp of Sorrows wasn't always a swamp. My grandfather's father camped here when it was dry land, before the old Horde's magic twisted it." },
    { id = "l_temple", text = "There's a sunken temple in the middle of the swamp, full of trolls who worship something old. Nobody goes there who wants to come back." },
    { id = "l_humans", text = "The humans have a fortress at Nethergarde, watching the Dark Portal. They're too busy watching the Portal to bother us, mostly." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Stonard slowly, but it does come. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got work." },
    },
    _none = { { id = "t_none", text = "I don't know. Ask the Commander, in the big hall." } },
  },
}

P:Pool {
  id = "citizen_kargath", role = "citizen", community = "kargath",
  greetings = {
    { id = "g_day", text = "Welcome to Kargath, the last Horde wall before the Blackrock. Keep your weapon close." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The Dark Irons come out of the mountain at night. Stay inside the walls." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The Dark Irons got a piece of you. Get mended before they get the rest." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar! The Blackrock up the road wear our faces and serve dragons. Remember which of us is which." },
  },
  lines = {
    { id = "l_blackrock", text = "The Blackrock call themselves the true Horde, up there in the Spire. They bow to a dragon, and they call us traitors." },
    { id = "l_darkiron", text = "The Dark Iron dwarves come out of the mountain at night. Short, angry, and they hit hard." },
    { id = "l_uldaman", text = "There's an old ruin in the mountains called Uldaman. The dwarves dig there, looking for something, and the troggs come out of it." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Kargath from the mountains and the Badlands. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got a wall to watch." },
    },
    uldaman = { { id = "t_uldaman", text = "An old ruin in the mountains, older than the dwarves. They dig there, looking for something, and the troggs come pouring out." } },
    _none = { { id = "t_none", text = "I don't know. Ask the Warlord, up the tower." } },
  },
}

P:Pool {
  id = "citizen_splintertree", role = "citizen", community = "splintertree",
  greetings = {
    { id = "g_day", text = "Welcome to Splintertree Post. The night elves are everywhere, so keep your eyes open." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The Sentinels hunt at night. Stay close to the fires." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The Sentinels got to you? Their arrows are sharp, and their aim is good. Get mended." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar! The Warsong hold the forest for the Horde. The elves hate us, but we need the wood." },
  },
  lines = {
    { id = "l_warsong", text = "The Warsong are cutting the forest for the Horde's lumber. The elves hate it, but Orgrimmar needs the wood." },
    { id = "l_sentinels", text = "The Sentinels hunt us through the trees. They're quiet, and they're deadly, and they never stop." },
    { id = "l_demon", text = "There's a canyon to the east where Grom Hellscream killed the demon lord Mannoroth. The ground still burns there, people say." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Splintertree from Orgrimmar and the forest. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got work." },
    },
    warsong = { { id = "t_warsong", text = "Grom Hellscream's clan, cutting the forest for the Horde. The elves hate us for it, but we need the wood." } },
    _none = { { id = "t_none", text = "I don't know. Ask the commander; he knows the forest better than anyone." } },
  },
}

P:Pool {
  id = "citizen_sepulcher", role = "citizen", community = "sepulcher",
  greetings = {
    { id = "g_day", text = "Welcome to the Sepulcher. It was a graveyard once, and it still is, but now the dead keep it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay inside the walls after dark. The forest has teeth, and the worgen are hungry." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Worgen, by the look of those marks. You were lucky. Get patched up." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Skyborne" } },
      text = "One of the living, here in Silverpine? You'll get stares, but the Dark Lady's allies are welcome." },
  },
  lines = {
    { id = "l_worgen", text = "The worgen roam the southern forest, hunting anything that moves. They came from the keep to the south, people say, where the mad wizard lives." },
    { id = "l_dalaran", text = "Dalaran's mages have a camp at Ambermill, doing something with magic. The Dark Lady wants to know what, and so do we." },
    { id = "l_pyrewood", text = "Pyrewood village is human, but they change at night. Into worgen, people say, though they don't know it themselves." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The Sepulcher gets reports from every corner of Silverpine. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got a watch to stand." },
    },
    _none = { { id = "t_none", text = "I don't know. Ask the High Executor; he reads every report." } },
  },
}

P:Pool {
  id = "citizen_gromgol", role = "citizen", community = "gromgol",
  greetings = {
    { id = "g_day", text = "Welcome to Grom'gol. The zeppelins come and go, and the jungle's full of trouble." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The jungle's loud at night. Raptors, tigers and trolls, all hunting." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! Welcome, mon. The jungle trolls here are no friends of ours, so watch yourself." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The jungle's had a go at you. Raptors, or trolls? Get mended before you go back out." },
  },
  lines = {
    { id = "l_trolls", text = "The Bloodscalp and Skullsplitter trolls fight each other and us. They're savage, and they don't take prisoners." },
    { id = "l_zeppelin", text = "The zeppelins fly to Orgrimmar and the Undercity. The goblins swear they're safe, but I've seen one crash." },
    { id = "l_yenniku", text = "Vol'jin's son, Yenniku, was taken by the Bloodscalps. The Darkspear want him back, and they're asking for help." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Grom'gol from the zeppelins and the jungle. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got work." },
    },
    yenniku = { { id = "t_yenniku", text = "Vol'jin's son, taken by the Bloodscalps. The Darkspear want him back, and they'll pay well for help." } },
    _none = { { id = "t_none", text = "I don't know. Ask the commander; he knows the jungle." } },
  },
}

P:Pool {
  id = "citizen_mojache", role = "citizen", community = "mojache",
  greetings = {
    { id = "g_day", text = "Welcome to Camp Mojache. The forest is green, but it's full of danger." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Stay near the fires tonight. The ogres hunt in the dark." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The ogres, or the gnolls? Feralas is full of both. Rest here a while." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, far from Mulgore! Welcome to the camp, cousin. The Grimtotem are about, so be careful." },
  },
  lines = {
    { id = "l_ogres", text = "The Gordunni ogres hold the ruins to the north. They're big, and they're mean, and they don't like visitors." },
    { id = "l_grimtotem", text = "The Grimtotem have a camp in Feralas too. They hate the Horde, and they hate any tauren who follows Cairne." },
    { id = "l_ruins", text = "There are old elven ruins in the forest, called Dire Maul. Something lives there, people say, and it's not friendly." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Camp Mojache from the forest and the coast. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you a little, but I'm wary of strangers." },
    },
    grimtotem = { { id = "t_grimtotem", text = "Tauren who hate the Horde, and who follow their own ways. They've a camp in Feralas, and they're always watching." } },
    _none = { { id = "t_none", text = "I don't know. Ask the elders; they know more than I do." } },
  },
}

P:Pool {
  id = "citizen_hammerfall", role = "citizen", community = "hammerfall",
  greetings = {
    { id = "g_day", text = "Welcome to Hammerfall, named for Doomhammer. Stand up straight in it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The Witherbark drums are loud tonight. Stay inside the walls." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar! Your grandfathers might have stood behind these walls in chains. Remember who broke them." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The trolls, or the ogres? Arathi's full of both. Get mended." },
  },
  lines = {
    { id = "l_camp", text = "The humans kept orcs in cages here once. Thrall and Doomhammer broke them out, and now it's ours." },
    { id = "l_trolls", text = "The Witherbark trolls are in the hills to the east. They don't take prisoners, and they don't leave much behind." },
    { id = "l_humans", text = "The humans of Stromgarde have a camp at Refuge Pointe. They hate us, but they hate the Syndicate more." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Hammerfall from the highlands. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got work." },
    },
    _none = { { id = "t_none", text = "I don't know. Ask Drum Fel; he leads here." } },
  },
}

P:Pool {
  id = "citizen_brackenwall", role = "citizen", community = "brackenwall",
  greetings = {
    { id = "g_day", text = "Welcome to Brackenwall. The marsh is wet, and the crocs are hungry." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The marsh is louder at night. Stay close to the fires." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The marsh got its teeth into you. Get mended before you go back out." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar! Welcome to the swamp. The humans at Theramore are close, so keep your axe sharp." },
  },
  lines = {
    { id = "l_theramore", text = "The humans at Theramore are close, but they keep to their side. The Lady keeps the peace, mostly." },
    { id = "l_dragons", text = "There are black dragons in the south of the marsh, people say. Big ones, and they don't like visitors." },
    { id = "l_ogres", text = "The Stonemaul ogres hold the ruins to the south. They're big, and they're mean, and they're always hungry." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Brackenwall from the marsh and the coast. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got work." },
    },
    black_dragonflight = { { id = "t_dragons", text = "Black dragons, in the south of the marsh. Big, mean and clever, and they're up to something." } },
    _none = { { id = "t_none", text = "I don't know. Ask the chieftain; he knows the marsh." } },
  },
}

P:Pool {
  id = "citizen_bloodvenom_post", role = "citizen", community = "bloodvenom_post",
  greetings = {
    { id = "g_day", text = "Welcome to Bloodvenom Post, the only Horde fire in Felwood. Keep close to it." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Felwood's darker at night, and the corruption's worse. Stay close to the fires." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The forest chewed on you. Get mended, and wash your hands; everything here is tainted." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A long way from Mulgore's grass, cousin. Here even the grass would bite you." },
  },
  lines = {
    { id = "l_corruption", text = "Demons poisoned this forest in the war, and the poison stayed when they left. Everything here is twisted." },
    { id = "l_river", text = "Don't drink from the river, don't wash in it, and don't look at it too long." },
    { id = "l_druids", text = "The druids at the sanctuary think they can heal this place. I hope they're right." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Bloodvenom from the forest and the north. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what's common, and then I've got work." },
    },
    _none = { { id = "t_none", text = "I don't know. Ask Trull; he's the one who sends people into the trees." } },
  },
}
