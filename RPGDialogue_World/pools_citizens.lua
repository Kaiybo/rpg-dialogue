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
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You've the walk of the soldiers back from Redridge, all shoulders and no hurry. My brother's out there with the army, so if you cross the Lakeshire bridge, keep an eye out for him." },
    { id = "n_druid", cat = "class", when = { race = "NightElf", class = "DRUID" },
      text = "One of the elf druids! The children follow your sort round the Park hoping you'll turn into a bear, so if you've a kind streak, do it near the fountain." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "You'll be one of the elves who came down out of the sky. The heralds read it out in the square, and half of us still think they had the story backwards." },
    { id = "n_dwarf_shaman", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "A dwarf carrying totems! The smiths in the Dwarven District have been arguing about your sort over their ale for weeks, and now I can tell them I've seen one." },
  },
  react = {
    { id = "r_shadow", on = "form", when = { form = "shadow" }, text = "Oh! Light preserve me, I nearly dropped the basket." },
    { id = "r_stealth", on = "stealth", text = "Where did that one get to? Everybody check your pockets, quickly!" },
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
      text = "A priest, eh? Yer sort gather over in the Mystic Ward, past the Forge. Say one for the miners while ye're at it, for they need it more than the rest of us." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Come through on the tram from Stormwind? Ye've got that green look about ye. Everybody does, the first time." },
    { id = "n_shaman", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "A dwarf talkin' tae the elements! My old mum would have chased ye out wi' a broom, but times change, an' the stone's no' complainin', so I'll no' complain either." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "An elf under the mountain! Ye'll be wantin' a tree, I suppose, but we've only got stone, so ye'll have tae make do." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Ye're welcome here as long as ye need, little cousin, and I mean that. Gnomeregan will be yours again; the whole mountain says so." },
    { id = "n_gnome_lock", cat = "class", when = { race = "Gnome", class = "WARLOCK" },
      text = "Ye smell o' sulphur, and it's no' from the forge. Some o' the Tinker Town folk have been keepin' odd books since Gnomeregan, and I'll thank ye not to read yours near my stall." },
    { id = "n_paladin", cat = "class", when = { race = "Dwarf", class = "PALADIN" },
      text = "A dwarf o' the Silver Hand! My uncle fought alongside the knights in the last war, and he came home wi' the Light in him and never raised his voice again." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Another kind of elf, and this one fell out o' the sky? The Explorers' League'll want to measure ye, so run if ye see a dwarf wi' a notebook." },
    { id = "n_hunter", cat = "class", when = { race = "Dwarf", class = "HUNTER" },
      text = "A rifle on yer back and a beast at yer heel; that's a mountaineer's look. Mind yer animal round the Great Forge, for the heat makes them skittish." },
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
    _none = { { id = "t_none", text = "That's beyond me, friend. The scholars at the Hall of Explorers might know, an' they'll be glad tae lecture ye." } },
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
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Arcane, here among the branches? Fold your spells away while you walk our streets, stranger. The Sisters of Elune remember what the Highborne did with that power, and so do the rest of us." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "You have the look of our cousins, only thinner, and with the sky in you. The priestesses say your ancestors left Eldre'Thalas long ago, and they say it carefully, as if the words might break." },
    { id = "n_hunter", cat = "class", when = { race = "NightElf", class = "HUNTER" },
      text = "A hunter of the kaldorei, with a beast that trusts you. Ride out to the edge of Teldrassil at dusk sometime; the owls call to hunters there, if you are quiet enough to hear." },
    { id = "n_warrior", cat = "class", when = { race = "NightElf", class = "WARRIOR" },
      text = "The Sentinels keep the blade for us now, and most of our people leave the fighting to them. You chose to carry steel anyway, and the Sentinels notice such things." },
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
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You've come up out of the Cleft; I can smell it on you. The Warchief lets your kind stay down there, and my mother still spits when she walks past the stair." },
    { id = "n_shaman", cat = "class", when = { race = "Orc", class = "SHAMAN" },
      text = "A shaman of the people! My grandfather saw the spirits turn their backs on us, and he wept the day Thrall brought them home. Walk proudly, and don't ever lose them again." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the sky-elves who camp with the tauren. The Warchief says you're Horde, so you're Horde, but folk on the Drag will stare, and you're best off staring back." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "The Forsaken don't come down to the Drag much, and when they do the butchers hide the good cuts. Don't take it personally; nobody's sure what your people eat." },
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
    { id = "n_hunter", cat = "class", when = { race = "Tauren", class = "HUNTER" },
      text = "A hunter of the plains, with a beast that walks beside you rather than ahead. The Earth Mother gives the hunt to those who thank her for it, so remember to." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "The Forsaken are welcome on the bluffs, by the High Chieftain's word. The elders say even the dead deserve a place to rest, though you seem to rest very little." },
    { id = "n_shaman", cat = "class", when = { race = "Tauren", class = "SHAMAN" },
      text = "Your totems sound when the wind catches them. Go up to Spirit Rise while you're here; the elders will want to know which spirit answered you first." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, are you? The bluffs are a long climb from the sea, and your people always eye our lifts as though they might be a trick." },
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
    { id = "n_mage", cat = "class", when = { race = "Scourge", class = "MAGE" },
      text = "The Magic Quarter still smells of Dalaran, if you're old enough to remember it. Some of us studied there while we still breathed, and some of us never stopped." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Brimstone and grave-dirt; you'll fit right in. The Quarter turns a blind eye to what gets summoned down here, so long as it stays on its leash." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've the step of the Deathstalkers, all heel and no noise. They'd have a use for you, if you can keep a secret and stand the sewers." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, below ground! You must stoop under every arch, and still the bats find you. Your people were kinder to us than we expected, and I don't forget it." },
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
      text = "Fresh from the Abbey, by the look of those robes! Goldshire's glad of a priest; between the kobold bites and the brawls at the inn, there's always someone who needs mending." },
    { id = "n_hogger", cat = "class", when = { class = { "WARRIOR", "PALADIN", "HUNTER" }, maxLevel = 12 },
      text = "You've got a fighter's look about you. If you're thinking of going after that great gnoll in the woods, take friends, and take more of them than you think." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You stand like someone who knows where the purses are kept. If you're going after the Defias in the hills, you'll know better than me how they think." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "A night elf, on the Goldshire road! The children at the inn will want to measure you against the door frame, so be patient with them." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Out from the Mage Quarter for some country air? The last one of your sort through here set the Lion's Pride's chimney alight, and the innkeeper hasn't stopped talking about it." },
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
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR", maxLevel = 15 },
      text = "Another recruit with a sword! Marshal McBride will have you drilling till your arms shake, and you'll thank him for it on your first wolf." },
    { id = "n_mage", cat = "class", when = { class = "MAGE", maxLevel = 15 },
      text = "A young mage in the valley! The brothers keep a careful eye on spellcraft, so practise your fire well away from the vineyards." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "The brothers won't say it to your face, but they'll pray for you after you've gone. I'd wash that smell off before evening service." },
  },
  lines = {
    { id = "l_abbey", text = "The Abbey's the heart of this valley, and it always has been. My grandmother used to say a valley without prayer is only a field, and the brothers like to quote her." },
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
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Magistrate Solomon's been asking Stormwind for soldiers for months. You're one more than they've sent, and folk here won't forget it." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, good. The gnolls in the hills hunt in packs, so keep your beast close and your eyes on the ridgelines." },
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
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin in Darkshire! The dead walk at Raven Hill and nobody here has the stomach to put them back, so you'll be welcome at the Night Watch." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "We've had our fill of dark magic in this wood, thank you. Morbent Fel's sort did that to the cemetery, and I'll not stand close to anyone who smells like him." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Watch your animal in these woods. The worgen take a pet as quick as a person, so keep it close past Brightwood Grove." },
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
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "The People's Militia could use a real soldier. Gryan Stoutmantle's been training farmers with pitchforks, and you'd be the first here who knows which end to hold." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, out here? The Light's felt thin in Westfall since the harvests failed, and folk could use a reminder that it still reaches this far." },
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
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, in the harbor! The Dragonmaw want our road and the murlocs want our docks, and you've come anyway, so you must be braver than you look." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A soldier at last. Half the garrison's gone up to the Thandol Span and the Dragonmaw get bolder every week, so if you've come to fight, there's plenty." },
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
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You'll be from Dalaran, or near it. Have you seen what's become of the city behind its shield? My cousin was a servant in the Violet Citadel, and we've had no word of her since." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "One of the Silver Hand, here! Uther's tomb lies north in the plaguelands, and nobody in Southshore has been brave enough to visit it in years." },
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
    { id = "n_hunter", cat = "class", when = { race = "Dwarf", class = "HUNTER" },
      text = "Ye'll find the bears in this valley are bigger than the ones in Dun Morogh. The Mountaineers have been culling them, and they'll be glad of another rifle on the shore." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Dwarven hands built the Stonewrought Dam, but it's gnomish clockwork keeps the sluices honest. Ye'll want to see it, bein' what ye are." },
    { id = "n_shaman", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "A shaman in Loch Modan! The stone round here's old and grumpy, so go gently when ye speak to it." },
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
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Ye'll get the gossip everybody at the Stoutlager already knows, an' not a drop more till I know ye." },
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
    { id = "n_gnome_mage", cat = "class", when = { race = "Gnome", class = "MAGE" },
      text = "One o' the Gnomeregan mages! The last of your teachers came through here wi' soot on their robes, and I gave them soup. I hope somebody's still givin' them soup." },
    { id = "n_hunter", cat = "class", when = { race = "Dwarf", class = "HUNTER" },
      text = "A young rifleman! The boars in Coldridge will teach ye to aim quick, and the Frostmane in the high passes will teach ye the rest." },
    { id = "n_gnome_warrior", cat = "class", when = { race = "Gnome", class = "WARRIOR" },
      text = "A wee gnome wi' a big shield! Don't let the Ironforge lads laugh; I saw yer people fight for Gnomeregan, and there was no laughin' in that." },
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
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, here in Auberdine? The ruins of Ameth'Aran are full of Highborne spirits who remember your kind of magic, and not fondly." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "You came from the sky, they tell me, and every ship brings more talk of your people. You carry yourself like the old Highborne, and some here won't like that." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another of the Explorers' League? Your cousins have been digging in the ruins up the coast and calling it scholarship, so tell them to put things back when they're done." },
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
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, good. The orcs at Splintertree cut the forest faster than the Circle can mend it, and every pair of hands helps." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "The Sentinels can always use another blade on the Splintertree road. Speak with them at the gate before you head east." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Keep your beast close in these woods. The furbolgs have gone mad with something foul, and they no longer know friend from prey." },
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
    { id = "n_druid", cat = "class", when = { class = "DRUID", maxLevel = 15 },
      text = "Off to Moonglade soon, are you? Every young druid in Dolanaar talks of nothing else, and comes back quieter." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "Sky-touched cousins, here in Teldrassil! Our elders whisper that your ancestors chose a different road ten thousand years ago, and I'd like to hear your side of it someday." },
    { id = "n_hunter", cat = "class", when = { race = "NightElf", class = "HUNTER" },
      text = "A young hunter of Dolanaar! The nightsabers in the Shadowglen will try you, so watch the ones whose tails have gone still." },
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
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "One of Lady Proudmoore's kind! She teaches half the young mages in the tower, and the other half wish she'd teach them too." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Another sword for Theramore. The marsh has more black dragons than it deserves and the Horde sits at Brackenwall, so you'll be welcome on the walls." },
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
    { id = "g_day", text = "A new face! We don't get many out here, so forgive me for staring. What brings anyone to Desolace on purpose?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Keep inside the walls once the sun's gone. The centaur ride by night, and they don't stop to read your tabard." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "You look like the valley's been chewing on you. Was it centaur arrows or just the land itself? Out here it's hard to tell the two apart." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, all the way out here! It gets lonely being the only voice at prayers in a land this dead, so Brother Anton will be glad of you." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Keep away from the Mannoroc Coven, warlock or not. Whatever's buried there doesn't care whose side you're on." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "The kodo graveyard's south of here. Hunters go to look at the bones and come back quiet, and you'll understand why when you see it." },
  },
  lines = {
    { id = "l_centaur", text = "The centaur clans fight one another more than they fight us, thank the Light. The Kolkar, the Gelkis and the Magram all hate each other, and we do our best to keep it that way." },
    { id = "l_supplies", text = "The supply wagons from Stonetalon come once a month, if they come at all. We ration everything out here, even the good stories." },
    { id = "l_land", text = "Nothing grows in Desolace, nothing at all. The old soldiers say there was a terrible battle here long ago, and the ground never forgave anyone for it." },
    { id = "l_home", text = "I came out here to make my fortune hauling ore, and so far I've made a sunburn and a very good friend who's a mule. Stormwind feels further away every week." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes slowly out here, but it does come, usually with the last caravan and a lot of dust. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you what everybody on the Point already knows, and that isn't much." },
    },
    _none = { { id = "t_none", text = "Never heard of it, I'm afraid. The Captain has all the maps, so try him." } },
  },
}

P:Pool {
  id = "citizen_feathermoon", role = "citizen", community = "feathermoon",
  greetings = {
    { id = "g_day", text = "Welcome to Feathermoon. You came by boat, I hope, because the swimming is not something I would recommend." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The stars are bright over the sea tonight. The Sentinels call it a good omen, though they say that about most clear nights." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Was it the ogres or the gnolls? Feralas has many teeth, so rest here a while before you go back to the mainland." },
    { id = "n_eastern", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "A friend from the eastern kingdoms, all the way out here! Few of your people reach Feralas, and fewer leave it quite the same." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "The old city in the hills is Eldre'Thalas, and your people sailed from this very coast, if the stories are true. The Sentinels here watch you with more than one kind of curiosity." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "The Circle's druids are thin on the ground this far south. The woods past the Twin Colossals could use your care." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "The Highborne still haunt the old city in the hills, and they'd like your magic a great deal more than we do. Don't go near them alone." },
  },
  lines = {
    { id = "l_eldre", text = "The ruins in the forest were Eldre'Thalas once, a city of the Highborne. Something still lives in them, people say, and it doesn't welcome visitors." },
    { id = "l_ogres", text = "The Gordunni ogres have grown bold lately, raiding along the coast. The Sentinels have their hands full, and the forest is very wide." },
    { id = "l_horde", text = "The tauren keep a camp on the far side of the forest. They keep to their side and we keep to ours, and the ogres keep both of us busy." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Feathermoon is far from everything, but the boats still bring the news across the water. Here is what has come." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You have been good to this outpost, so I'll tell you all of it." },
    },
    highborne = { { id = "t_highborne", text = "Our ancestors who loved magic too much and trusted the wrong queen. Some of them never left those ruins, people whisper, and they still keep the old ways inside." } },
    _none = { { id = "t_none", text = "I do not know. The Sentinels might, if you can persuade one to talk." } },
  },
}

---------------------------------------------------------------------------
-- Alliance outposts and frontier towns
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_refuge_pointe", role = "citizen", community = "refuge_pointe",
  greetings = {
    { id = "g_day", text = "Welcome to Refuge Pointe. It's tents and stubbornness, mostly, but we're still here, and that counts for something." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Keep close to the fires tonight. The Syndicate creep about the hills after dark, and the trolls are worse." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Stormwind, by your accent? Stromgarde's a shadow of what it was, but it was one of the Seven Kingdoms once, and we haven't forgotten it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! We've buried more of our own than we've healed this year. If you've a moment to spare, the wounded are in the big tent." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Stromgarde trained the best soldiers in the north, once. Now ogres sit in its towers, and what's left of the army is camped on this rock with us." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "The Wildhammer used to fly over Arathi on their gryphons, and we'd wave. They come less often now, so it's good to see a dwarf's beard again." },
  },
  lines = {
    { id = "l_stromgarde", text = "My family lived in Stromgarde for six generations. The ogres and the Syndicate hold the city now, and we sit on this hill and look at it like a dog outside a butcher's." },
    { id = "l_syndicate", text = "The Syndicate were lords and ladies of Alterac once, and they still give orders like it. They'd sell their own mothers if the price was right, and some of them have." },
    { id = "l_trolls", text = "Witherbark trolls hold the eastern hills, and they don't take prisoners. My cousin went out after a strayed horse and we found the horse." },
    { id = "l_hammerfall", text = "There's a Horde camp at Hammerfall, where we used to keep the orcs penned up. I suppose I can't blame them for wanting it, but I don't have to like it." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The scouts bring the news in, and most of it's bad, but it's still news. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Since Stromgarde fell, I don't hand out more than I must to people I don't know; here's that much." },
    },
    syndicate = { { id = "t_syndicate", text = "Alterac's old nobility, gone to banditry once their kingdom fell. They hide in the hills and the ruins, and they kill for coin or for spite, whichever's closer." } },
    _none = { { id = "t_none", text = "I don't know that one. The Captain keeps track of what's happening in the highlands; ask her." } },
  },
}

P:Pool {
  id = "citizen_aerie_peak", role = "citizen", community = "aerie_peak",
  greetings = {
    { id = "g_day", text = "Welcome tae Aerie Peak, friend! Keep yer fingers away from the gryphons' beaks, for they're no' fussy about whose fingers." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "The stars are out over the Hinterlands, an' the gryphons are settlin' in their roosts. It's the best hour o' the day, if ye ask me." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard, among the Wildhammer! Welcome, cousin, an' don't fret, because up here we judge a dwarf by how he sits a gryphon, no' by his clan." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Ye'll fit in here, then. We Wildhammer know a thing or two about beasts, an' the gryphons will take tae ye quicker than most." },
    { id = "n_shaman", cat = "class", when = { race = "Dwarf", class = "SHAMAN" },
      text = "A dwarf what talks tae the spirits, like the Wildhammer always have! Ironforge called us savages for it, and now look at them, at it too." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome in the Hinterlands! The gryphons'll think ye're a snack, so stand tall, aye, as tall as ye can manage." },
  },
  lines = {
    { id = "l_gryphons", text = "Every Wildhammer bairn grows up wantin' a gryphon of their own. They're loyal an' fierce, an' they'll carry ye anywhere, so long as they've decided they like ye." },
    { id = "l_trolls", text = "The Witherbark an' the Vilebranch are forever creepin' at our borders. We fly over their camps an' drop rocks on their heads, an' they've never once forgiven us for it." },
    { id = "l_feud", text = "We Wildhammer went our own way from Ironforge a long time ago, after a fallin' out over who'd be king. The Bronzebeards are cousins, but they're stubborn cousins, an' they say the same o' us." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The gryphon riders see everythin' from the sky, an' they tell all of it in the tavern after. Here's what's been flyin' about." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "Ye've flown true by the Wildhammer, so I'll hold nothin' back from ye." },
    },
    _none = { { id = "t_none", text = "Never heard tell of it. Ask the Thane, for he'll know, or he'll say it loud enough that it sounds like he does." } },
  },
}

P:Pool {
  id = "citizen_chillwind_camp", role = "citizen", community = "chillwind_camp",
  greetings = {
    { id = "g_day", text = "You've reached Chillwind. Keep your weapon close and your wits closer, because the dead don't rest in these lands." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Get to the fires before full dark. The Scourge walk more boldly at night, and the plague seems worse for it." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, thank the Light! The plague takes more of us than the Scourge do, and there aren't enough hands to tend the sick. If you can spare an hour, they'd bless your name." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, on these fields again! The Silver Hand rode through here before the plague, and I'd stopped hoping I'd ever see one of you back in Lordaeron." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Andorhal fell in a single night, and half the mages who tried to stop the plague fell with it. If you've fire in you, the Scourge burn as well as anything." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Keep your animal on a short leash out here. The plague takes beasts too, and there's no curing a wolf that's started to rot." },
  },
  lines = {
    { id = "l_scourge", text = "The Scourge hold everything from here to the eastern sea. We hold this camp and a few others like it, and we pray every night that it's enough." },
    { id = "l_cauldrons", text = "The Scourge have set great plague cauldrons across the fields, spewing sickness into the air. Breathe carefully near them, and scrub your hands raw after." },
    { id = "l_andorhal", text = "Andorhal was where the poisoned grain went out, people say, and the whole plague started from there. Now it's a ruin full of the dead, and the Forsaken and the Scourge fight over its bones." },
    { id = "l_scarlet", text = "The Scarlet Crusade holds Hearthglen to the north. They fight the Scourge too, but they'd as soon burn you as look at you, if they decided you'd been near the plague." },
    { id = "l_home", text = "I grew up a day's ride from here, in a village that isn't there any more. I came back with the Dawn because somebody ought to remember where everything was." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The scouts bring word in from the plaguelands, and there's never a good word among it. Here's what I've heard." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've fought beside us, so I'll tell you everything, even the parts that keep me awake at night." },
    },
    plague_cauldrons = { { id = "t_cauldrons", text = "Great iron pots bubbling with plague, set up all over the countryside like a farmer sets out scarecrows. The Argent Dawn wants every one of them broken." } },
    _none = { { id = "t_none", text = "I don't know. Ask the commander, or one of the Argent Dawn's people; they'll have heard." } },
  },
}

P:Pool {
  id = "citizen_morgans_vigil", role = "citizen", community = "morgans_vigil",
  greetings = {
    { id = "g_day", text = "You've made it to Morgan's Vigil. Welcome, and keep your head below the wall, because the Blackrock have archers." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "The mountain glows red at night, and the orcs beat their drums until dawn. You get used to it, or you go home." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Was it the Blackrock or the dragonkin? Either way, you're lucky to be standing, so get yourself mended before you go back out." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! The Steppes are as hard on the soul as on the body. If you've a prayer to spare, there are soldiers here who could use one." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You'll know better than any of us what the Dark Iron are like. Folk here are jumpy around beards, so don't take it to heart if they stare." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "The Blackrock orcs in the Steppes are still fighting the Second War, as far as they know. Keep your shield up, because they never stopped." },
  },
  lines = {
    { id = "l_blackrock", text = "The Blackrock orcs hold the Spire, and they've a dragon for a master, people say. Every day they send raiders down the slope, and every day we send fewer of them back." },
    { id = "l_windsor", text = "Marshal Windsor led his people into the mountain and never came out. Some say he's dead, and some say the Dark Irons have him in chains, and nobody here can say for sure." },
    { id = "l_land", text = "My father remembered these hills when they were green. Now there's nothing but ash and cinders as far as you can see, and the wind tastes of burning." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Out here the front line is everywhere, so the news comes from all sides at once. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Ask quickly, if you must; the archers on the Spire don't wait for anyone to finish a sentence." },
    },
    windsor = { { id = "t_windsor", text = "A brave man who went into the mountain to learn what the Dark Irons were planning. He didn't come back, and the soldiers here still raise a cup to him every night." } },
    _none = { { id = "t_none", text = "I don't know. The Marshal knows the Steppes better than any of us, so ask him." } },
  },
}

---------------------------------------------------------------------------
-- Neutral towns: both factions walk their streets.
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_booty_bay", role = "citizen", community = "booty_bay",
  greetings = {
    { id = "g_day", text = "Welcome to Booty Bay, pal! Everything here's for sale and everything's got a price, so I hope you brought your purse." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "The taverns are just getting going, so mind your pockets, and mind the edge of the pier on your way home." },
  },
  notice = {
    { id = "n_horde", cat = "faction", when = { faction = "Horde" },
      text = "Horde, eh? Your coin's as good as anybody's here, so spend it freely. Just don't start anything with the Alliance folk, because the Baron's bruisers don't care who swung first." },
    { id = "n_alliance", cat = "faction", when = { faction = "Alliance" },
      text = "Alliance, eh? Your gold spends the same as an orc's in this town. Keep your blade in its sheath around the green folk, and we'll all get rich together." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Ah, someone in the trade. The Bloodsail have half the pickpockets on these docks in their pay, so watch your own pockets." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll who isn't trying to cut my throat, now that's a pleasant change. The jungle's full of the other kind." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! The goblins here will try to sell you your own inventions, so check the stamp on anything before you pay." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Off to Nesingwary's camp? He's shot every panther in the vale and he's still hungry for tigers." },
  },
  lines = {
    { id = "l_cartel", text = "The Steamwheedle Cartel runs this town, and they run it for profit. As long as you're spending, you're a valued guest; once you stop, you're part of the scenery." },
    { id = "l_bloodsail", text = "The Bloodsail Buccaneers hit another merchant ship last week. Real pirates, with parrots and grudges, and they've no love at all for the Cartel." },
    { id = "l_sharks", text = "Don't go swimming in the bay, whatever the sailors dare you. The sharks are big and always hungry, and they've learned that sailors fall off the pier after a long night." },
    { id = "l_jungle", text = "Most folk who come through here are heading into the jungle after tigers and trolls and treasure. Fewer come back than you'd like, but the ones who do spend well." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Every ship brings rumors, and I buy them cheap and sell them dear. Here's what I've got in stock today." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Rumors cost money, pal, but I'll give you the cheap ones for nothing." },
    },
    bloodsail = { { id = "t_bloodsail", text = "Pirates with a fleet off the coast and a grudge against the Cartel. They don't take prisoners unless they think somebody will pay to get them back." } },
    _none = { { id = "t_none", text = "Never heard of it, and I hear everything in this town, so it can't be worth much." } },
  },
}

P:Pool {
  id = "citizen_gadgetzan", role = "citizen", community = "gadgetzan",
  greetings = {
    { id = "g_day", text = "Welcome to Gadgetzan! It's hot, dry and expensive, but the water's clean and the Cartel keeps the peace." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Gets cold in the desert at night, which nobody believes until they try it. Stay inside the walls, because the bandits like the dark." },
  },
  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, in a goblin town! Don't worry, nobody bites here, though the engineers do shout at each other a fair bit, and it's mostly friendly." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The desert's been chewing on you. Was it bandits or the bugs? There's a smith in town, but bring money, because nothing in Gadgetzan comes free." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren in Gadgetzan! Water in this town costs more than gold, and you look like you drink a barrel a day, so pace yourself." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "The Steamwheedle bruisers in this town hit hard and never ask questions. If you're thinking of lifting anything, think again, and then think somewhere else." },
  },
  lines = {
    { id = "l_water", text = "Water's the most precious thing in Tanaris, and the Cartel sells it by the bucket. Don't waste a drop, and don't ask what it costs unless you want to cry." },
    { id = "l_bandits", text = "The Wastewander bandits raid the caravans and steal the water barrels. The Cartel's put a bounty on them, but there are always more bandits than bounty." },
    { id = "l_trolls", text = "The Sandfury trolls keep a city out in the dunes to the west, called Zul'Farrak. Nobody goes there who wants to come back with all their limbs." },
    { id = "l_racing", text = "The Mirage Raceway's up north on the Shimmering Flats, where the gnomes and goblins race their machines. They bet everything on it, including plenty of things they don't own." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Gadgetzan's the crossroads of the desert, so sooner or later everybody passes my stall. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Information costs money, but I'll give you the basics for nothing, just this once." },
    },
    steamwheedle = { { id = "t_steamwheedle", text = "The goblin trading company that runs the neutral ports, Booty Bay and Ratchet and Everlook and here. If you're spending money anywhere neutral, the Cartel's getting its cut." } },
    _none = { { id = "t_none", text = "Never heard of it. Try the folk at the inn, because somebody there is always talking." } },
  },
}

P:Pool {
  id = "citizen_everlook", role = "citizen", community = "everlook",
  greetings = {
    { id = "g_day", text = "Welcome to Everlook, and I hope you brought a coat! The Cartel built a town in the snow, and we're all still wondering why." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "It's freezing tonight, so get yourself indoors, or you'll be an icicle with boots on by morning." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Was it the furbolgs or the yetis? Winterspring's got plenty of both, and neither of them is friendly about it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! The Argent Dawn keeps a man here, and I think he'd be glad of someone to pray with. He's worried about something in the north, and he won't say what." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "The Timbermaw trust hardly anyone, but they trust druids a little more. You might try them, if you're bold enough to walk into their tunnels." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Mages come up here for the blue dragons at Mazthoril and come back with frostbite and stories. Bring a better coat than they did." },
  },
  lines = {
    { id = "l_cold", text = "It's always cold in Winterspring, even in summer. The goblins wear three coats apiece and complain about every one of them." },
    { id = "l_furbolgs", text = "The Timbermaw furbolgs hold the tunnels to the south. They're not as mad as their cousins in Felwood, but they don't trust outsiders, and I can't say I blame them." },
    { id = "l_frostsabers", text = "Hunters come up here after frostsaber pelts, and some of them go home rich. The cats have their own opinion about it, and they share it with the slow ones." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Travelers bring their news up the mountain with their frostbite, and I hear all of it. Here's what's going around." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you the common talk, and then I'm going back inside where it's warm." },
    },
    argent_dawn = { { id = "t_dawn", text = "Folk sworn to fight the Scourge, from every race and banner. They don't ask whose side you're on, only whether you'll stand against the dead with them." } },
    _none = { { id = "t_none", text = "Never heard of it. Ask at the inn; somebody's always got a story there, true or not." } },
  },
}

P:Pool {
  id = "citizen_light_hope", role = "citizen", community = "light_hope",
  greetings = {
    { id = "g_day", text = "You've come to Light's Hope. Whatever banner you fly, you can leave it at the gate; here the living stand together." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Stay near the chapel tonight, and pray the bell keeps quiet. When it rings after dark, it means the dead are close." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, out here among the dead! The Light burns brightest in the darkest places, they say, and you'll find no darker places than these to test it." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken, here? The Dawn takes anyone who fights the Scourge, and you've more reason than most. Don't take it to heart if people stare a while." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, at the chapel! The Argent Dawn feeds every knight who walks through that door, and asks only that you take the fight toward Stratholme after." },
    { id = "n_forsaken_paladin", cat = "class", when = { race = "Scourge", class = "PALADIN" },
      text = "One of the risen, carrying the Light. The brothers here argue every night about whether it ought to work for you, and it keeps working anyway." },
  },
  lines = {
    { id = "l_dawn", text = "The Argent Dawn holds this chapel against the Scourge, and it takes anyone who'll fight. Human, dwarf, orc, even Forsaken: here we're only the living against the dead." },
    { id = "l_strat", text = "Stratholme lies to the north, the city where the prince burned his own people. The dead hold it now, and on still nights you can hear them in the streets." },
    { id = "l_scarlet", text = "The Scarlet Crusade holds Tyr's Hand to the south. They fight the Scourge as hard as we do, but they'd burn half the people in this chapel for being what they are." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The patrols bring the news back with them, and it's nearly all about the dead. Here's what I've heard." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've fought beside the Dawn, so I'll hold nothing back from you." },
    },
    argent_dawn = { { id = "t_dawn", text = "We stand against the Scourge wherever it walks, and we don't care about Alliance or Horde. If you'll fight the dead, you're one of us." } },
    _none = { { id = "t_none", text = "I don't know. Ask inside the chapel; the commanders hear more than I do." } },
  },
}

P:Pool {
  id = "citizen_thorium_point", role = "citizen", community = "thorium_point",
  greetings = {
    { id = "g_day", text = "Welcome tae Thorium Point. Aye, I'm Dark Iron, but I'm the kind that left, so ye can take yer hand off yer hammer." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "The Gorge glows red at night, an' the smoke never stops risin'. Ye get used tae it, or ye leave, an' most folk leave." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A Bronzebeard, starin' at a Dark Iron like I've two heads! Go on, get it out o' yer system, an' then we can talk like civilized dwarves." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The Gorge has chewed up yer gear. Our smiths are the best in these mountains, but they're no' cheap, mind." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, at the Point! The Brotherhood's smiths will want your opinion on their new bellows, and then they'll argue with it for an hour." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "The Dark Iron in the gorge fight in heavy plate and never seem to tire. Hit the joints, friend, and nothing else." },
  },
  lines = {
    { id = "l_brotherhood", text = "The Brotherhood forged weapons for the Firelord's armies, until enough of us found a way out from under the mountain. Now we sell tae whoever pays, an' I sleep better for it." },
    { id = "l_kin", text = "My own brother's still down in the depths, bowin' tae the fire an' forgin' for Ragnaros. I left an' he didnae, an' I try no' tae think about which of us was right." },
    { id = "l_gorge", text = "The Gorge was hills an' pine forest once, before my kin called up the fire. Now it's slag an' smoke, an' we've built our homes right in the middle of it." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes up from the depths an' down from the Spire, an' I hear most of it at the forge. Here's what's goin' round." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Strangers at the Point get the common gossip an' a long look, so here's the gossip." },
    },
    dark_iron = { { id = "t_darkiron", text = "My kin, aye, but no' my friends any more. They serve the Firelord under the mountain, an' they'd kill the lot of us for leavin', if they could reach us." } },
    _none = { { id = "t_none", text = "Never heard of it. Ask the Overseer, for he knows everythin', or so he tells us." } },
  },
}

P:Pool {
  id = "citizen_marshals_refuge", role = "citizen", community = "marshals_refuge",
  greetings = {
    { id = "g_day", text = "Welcome to the Refuge! We've been stuck down in this crater for months, so any new face is a fine one." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Stay close to the fire tonight. The big lizards hunt after dark, and some of them could step on you without noticing." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The crater's had a go at you, I see. Was it raptors, or something with even bigger teeth? Either way, you're lucky to be walking." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! You'll find plenty to hunt in Un'Goro, if it doesn't hunt you first. The devilsaurs are the size of a house, and they're quieter than you'd think." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid in the crater! The plants here are older than anything else on Kalimdor, and some of them bite, so ask nicely." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "The crystals in the crater hum like something's alive inside them. Mages come and stare at the pylons for days, so try not to be one of them." },
  },
  lines = {
    { id = "l_stranded", text = "We came down here with an expedition, and now we're stuck. The crater walls are too steep to climb, and the passes out are full of things that eat expeditions." },
    { id = "l_crystals", text = "There are glowing crystals all over the crater, and nobody knows what made them. The scholars say they're full of power, but they won't say what kind." },
    { id = "l_silithid", text = "The silithid have a hive in the southeast, and it's been spreading. They're great clicking bugs with mandibles like shears, and they don't like visitors." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "We've been here long enough to learn a few of the crater's secrets. Here's what I can tell you." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you the common talk, and then I've got to get back to watching the trees." },
    },
    silithid = { { id = "t_silithid", text = "Giant insects with a hive in the crater, and more of them every week. They came from somewhere south and west of here, and nobody's sure how to stop them." } },
    _none = { { id = "t_none", text = "Never heard of it. Ask somebody who's been down here longer; that's anybody but me." } },
  },
}

P:Pool {
  id = "citizen_nighthaven", role = "citizen", community = "nighthaven",
  greetings = {
    { id = "g_day", text = "Welcome to Nighthaven. Weapons stay sheathed and voices stay soft here, for the Circle keeps the peace in the glade." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "The moon is on the lake tonight. Walk softly, please; the village sleeps lightly, and the druids sleep more lightly still." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Whatever banner you fly elsewhere, here you're of the Circle, so welcome home, or as near to home as any of us come." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, in Moonglade! Every faith is welcome in the glade, so long as it treads lightly and stays off the herb beds." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the sky-born elves in Moonglade. Your druids keep word with the Circle, they say, though they pray to the wind more than the moon." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Leave whatever you've bound outside the glade, please. The Circle's patience with the fel ran out ten thousand years ago." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren in Nighthaven! Your people and the night elves share this glade without a cross word, which is more than their leaders manage elsewhere." },
  },
  lines = {
    { id = "l_circle", text = "The Cenarion Circle keeps Moonglade for every druid, whatever their people or their banner. Orc and elf, tauren and human, all sit at the same fire here." },
    { id = "l_remulos", text = "Keeper Remulos watches over the glade, and he's a son of Cenarius himself. He's older than the trees around us, and he sees more than he lets on." },
    { id = "l_malfurion", text = "They say Malfurion Stormrage sleeps in the barrow dens below us, walking in the Dream. The druids speak of his waking the way farmers speak of rain." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Druids come to the glade from every corner of the world, and they bring their news with them. Here's what I've heard." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've kept the peace of the glade, so I'll tell you everything." },
    },
    cenarion_circle = { { id = "t_circle", text = "Druids of every people, sworn to keep the balance of the wild. They gather here in the glade, and they don't care about Alliance or Horde one bit." } },
    _none = { { id = "t_none", text = "I don't know. Ask the druids; they know the land better than any of us." } },
  },
}

---------------------------------------------------------------------------
-- Horde towns
---------------------------------------------------------------------------
P:Pool {
  id = "citizen_crossroads", role = "citizen", community = "crossroads",
  greetings = {
    { id = "g_day", text = "Throm-ka, traveler. Drink from the well before you do anything else; the Barrens dries you out before you notice." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Get inside the palisade before full dark. The centaur ride at night, and they shoot at anything that moves." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The Barrens has been gnawing on you. Was it centaur, quilboar or just the heat? Get mended before you go back out there." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, far from the grass of Mulgore! The Barrens is hard country, cousin, but the Crossroads will shelter you as long as you need." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Hunting in the Barrens? The zhevra are quick and the lions quicker, and your beast will want water before you do." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You don't sweat, do you? That's a blessing in the Barrens, and I'm half jealous, though I'd not trade for the rest of it." },
  },
  lines = {
    { id = "l_centaur", text = "The centaur raid the caravans from the west, and the quilboar from the south. Every kodo that gets through here alive is a small victory for the Warchief." },
    { id = "l_wailing", text = "There's a cave in the south where the druids went to heal the land. They came out strange, and now the water tastes wrong for miles around it." },
    { id = "l_northwatch", text = "The Alliance built a fort at Northwatch, down on the coast. They watch us, we watch them, and the traders between us get rich." },
    { id = "l_ratchet", text = "Everything from across the sea comes up from Ratchet on the backs of the kodo. When the goblins raise their prices, the whole Barrens feels it by the next morning." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Every caravan stops at the Crossroads, and every caravan has a story to trade for water. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Any kodo-driver could tell you this much, and that's all you'll get from me today." },
    },
    wailing_caverns = { { id = "t_wailing", text = "The druids went down there to make the Barrens green again. Something went wrong in the dark, and now the druids are mad and the caves are full of things with fangs." } },
    _none = { { id = "t_none", text = "That's past what a water-carrier hears. The officers on the tower might know." } },
  },
}

P:Pool {
  id = "citizen_razor_hill", role = "citizen", community = "razor_hill",
  greetings = {
    { id = "g_day", text = "Throm-ka. You'll be heading for the capital, or away from it; everyone in Razor Hill is doing one or the other." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Inside, quickly, before the light's gone. The cultists in the canyons grow bolder once the sun goes down." },
  },
  notice = {
    { id = "n_new", cat = "class", when = { maxLevel = 10 },
      text = "Fresh out of the Valley of Trials, by the look of you! Durotar will test you harder than the valley did, so keep your water close and your weapon closer." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, eh? Sen'jin is just down the coast road if you're missing home, and the trolls there cook better than we do." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "The Burning Blade hide in Skull Rock and call their demons where they think nobody's watching. Don't let anyone here mistake you for one of them." },
    { id = "n_shaman", cat = "class", when = { race = "Orc", class = "SHAMAN" },
      text = "Durotar's spirits are hard, like the land, but they answered Thrall when nobody else would. They'll answer you too, if you're honest with them." },
  },
  lines = {
    { id = "l_blade", text = "There are orcs in the canyons who still call on demons, the fools. The Warchief told us we're done with all that, and some of them never listened." },
    { id = "l_kultiras", text = "The humans hold a fortress on the coast, Tiragarde Keep, full of angry Kul Tiran sailors. They're still sore about their admiral, and they've long memories for humans." },
    { id = "l_quilboar", text = "The quilboar come out of the west to raid the farms and steal the pigs, which feels personal, if you think about it." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Everything that comes up the road from the Barrens passes through Razor Hill first, and so does the gossip. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Ask, and keep it short, because I've work waiting." },
    },
    burning_blade = { { id = "t_blade", text = "Orcs who'd drink the demons' blood all over again if they could. They hide in the canyons, and the hunters here bring back their robes when they find them." } },
    _none = { { id = "t_none", text = "That's not something I know. Try the barracks, where somebody's paid to know things." } },
  },
}

P:Pool {
  id = "citizen_brill", role = "citizen", community = "brill",
  greetings = {
    { id = "g_day", text = "Welcome to Brill. It was a human town once, and now it's ours, so mind where you step; some of the floorboards remember the old owners." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "It's always gloomy in Tirisfal, but at night the Scarlet patrols creep closer, so keep your eyes on the tree line." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge", maxLevel = 10 },
      text = "Fresh from Deathknell, are you? It takes a while to get used to it all. The rot stops itching after the first year, or perhaps you simply stop caring." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Skyborne" } },
      text = "One of the living, here in Brill! You'll get stares, but most of us are friendly enough, in our way. It's only that we've forgotten how to show it." },
    { id = "n_paladin", cat = "class", when = { race = "Scourge", class = "PALADIN" },
      text = "One of us, still praying to the Light? The Scarlet Crusade would burn you for it twice, once for what you are and once for what you believe." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Brill's had a few of your kind through, studying in the old cellars. Keep your imp out of the graveyard; the dead here are restless enough." },
  },
  lines = {
    { id = "l_scarlet", text = "The Scarlet Crusade keeps a monastery to the northeast and a fortress on the coast. They hunt us like vermin, and they sing hymns while they do it." },
    { id = "l_farms", text = "Most of us were farmers in these fields once. I remember the smell of the barley in summer, though I can't smell anything now, which is probably a mercy around here." },
    { id = "l_tavern", text = "The Gallows' End is the best place in Brill, which isn't saying much. The innkeeper is pleasant enough company, for a corpse, and so am I." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News reaches Brill from the Undercity and the frontier, and the dead never tire of repeating it. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you the common talk, and then you can leave me to my brooding." },
    },
    scarlet_crusade = { { id = "t_scarlet", text = "Zealots in red who think the Light wants them to burn us. Some of them were my neighbors, and they'd burn me twice over now, once for each life." } },
    _none = { { id = "t_none", text = "I don't know. Ask at the tavern; someone there has nothing but time." } },
  },
}

P:Pool {
  id = "citizen_tarren_mill", role = "citizen", community = "tarren_mill",
  greetings = {
    { id = "g_day", text = "Welcome to Tarren Mill. It's quiet here, mostly, except when the humans from Southshore come calling with torches." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Hillsbrad is darker than it looks after sunset, and the Syndicate creep about in it. Stay close to the town." },
  },
  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Skyborne" } },
      text = "One of the living, here in Tarren Mill! The humans in Southshore hate you nearly as much as they hate us, so that makes us friends, I suppose." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Was it the Syndicate or the ogres? Hillsbrad has plenty of both, so get yourself mended before you go back down the hill." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Southshore's just down the road, and they bar their doors against us. A quiet blade could learn a great deal there, if you take my meaning." },
    { id = "n_warrior", cat = "class", when = { race = "Scourge", class = "WARRIOR" },
      text = "You stand like one of the old Lordaeron regulars. Half the Deathguard here marched for King Terenas before the plague, and some still salute out of habit." },
  },
  lines = {
    { id = "l_southshore", text = "I used to sell wool in Southshore, in life. Now the same people I traded with would shoot me on sight, and I can't even say they're wrong to." },
    { id = "l_syndicate", text = "The Syndicate are Alterac's old nobles, gone to thieving. They hide in the hills and rob anyone who passes, living or dead." },
    { id = "l_apothecary", text = "The Apothecaries have business in the hills, testing their brews on things. I don't ask what things, and you'd be wise not to either." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News reaches Tarren Mill from Southshore and from the hills, and none of it is cheerful. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll share what the whole Mill knows, nothing more, until the Deathstalkers tell me you can be trusted." },
    },
    syndicate = { { id = "t_syndicate", text = "Thieves and cutthroats led by the old lords of Alterac, who want their kingdom back. They'll take it a coin at a time, and a throat at a time, if they must." } },
    _none = { { id = "t_none", text = "I don't know. The Deathstalkers might, if you can find one who'll admit to being there." } },
  },
}

P:Pool {
  id = "citizen_bloodhoof", role = "citizen", community = "bloodhoof",
  greetings = {
    { id = "g_day", text = "Be welcome in Bloodhoof Village. The grass is tall and the kodo are fat this season, so the Earth Mother is pleased with us." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Come and sit by the fire, traveler. The plains are peaceful at night, but it's wiser to be peaceful near a fire." },
  },
  notice = {
    { id = "n_new", cat = "race", when = { race = "Tauren", maxLevel = 10 },
      text = "You've come down from Narache! I remember my own first walk across the plains, how wide they seemed. Take your time; the land isn't going anywhere." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "One of the sky-folk from Gev'rek! Thunder Bluff named your people friends, and the word of the bluffs is good in this village. Earth Mother keep you." },
    { id = "n_hunter", cat = "class", when = { race = "Tauren", class = "HUNTER" },
      text = "The plainstriders are fast and the swoops faster, so learn to aim on the young ones first. The Earth Mother sees every arrow." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc in Bloodhoof! Your Warchief helped us drive the centaur off our land, and the old ones here have not forgotten it." },
    { id = "n_druid", cat = "class", when = { race = "Tauren", class = "DRUID" },
      text = "Off to see Hamuul at Thunder Bluff, young druid? He walks between our people and the night elves' Circle, and he'll make you walk it too." },
  },
  lines = {
    { id = "l_venture", text = "The goblins of the Venture Company are cutting our trees and fouling our wells. Our braves drive them off, and like flies they're back the next morning." },
    { id = "l_gnolls", text = "The Palemane gnolls have been stealing from the farms to the west. They're thieves and cowards, but there are a great many of them." },
    { id = "l_kodo", text = "The kodo are the heart of our people. They carry our homes and our children and our goods, and they ask for nothing but grass and a kind word." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News crosses the plains as slowly as a kodo walks, but it arrives in the end. Here's what has reached the village." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've walked these plains as a friend, so I'll tell you everything I know." },
    },
    venture_company = { { id = "t_venture", text = "Goblins with saws and drills, cutting down our trees and fouling our water for money. They call it business, and we call it something less polite." } },
    _none = { { id = "t_none", text = "I don't know that. The elders might; they've had longer to listen than I have." } },
  },
}

P:Pool {
  id = "citizen_freewind", role = "citizen", community = "freewind",
  greetings = {
    { id = "g_day", text = "Welcome to Freewind Post. Mind the edges of the mesa, because the drop is long and the wind is not your friend." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "The stars are very close up here at night. Sit a while if you like; the lift will wait for you." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Was it the centaur in the canyons, or the Grimtotem? Thousand Needles is full of both, so rest a while before you climb down again." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Welcome among the needles, cousin. The Grimtotem walk these canyons, so be careful which tauren you trust out here." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "You glide, they say, and Freewind's the place for it, with all these needles and the wind between them. Still, the fall's a long one, so try it somewhere lower first." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "The Galak centaur below hunt the same beasts you do, and they'll hunt you as well. Keep to the high ground." },
  },
  lines = {
    { id = "l_grimtotem", text = "The Grimtotem have been bold lately, raiding along the mesas. They hate the Horde, and they hate any tauren who follows Cairne even more." },
    { id = "l_centaur", text = "The Galak centaur roam the canyon floors below us. There are fewer of them than in the Barrens, but they're every bit as cruel." },
    { id = "l_flats", text = "The goblins and gnomes race their machines on the Shimmering Flats to the east. They're loud, smelly things, and they crash more often than they finish." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "The wind carries news up to the mesas, and I've learned to listen to it. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Up on the needles we've learned to be sparing with strangers, so I'll give you only a little." },
    },
    grimtotem = { { id = "t_grimtotem", text = "A clan of our own people who hate the orcs and the Horde with them. They keep to the old, hard ways, and they'll kill anyone who stands in their path." } },
    _none = { { id = "t_none", text = "I don't know. Ask the watchers on the cliff; they see everything from up there." } },
  },
}

P:Pool {
  id = "citizen_taurajo", role = "citizen", community = "taurajo",
  greetings = {
    { id = "g_day", text = "Welcome to Camp Taurajo. The quilboar are south of us and the centaur west, so keep your weapon where you can reach it." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Stay near the fires tonight, traveler. The southern Barrens grow dangerous once the light goes." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The quilboar got to you, did they? Their spines are sharp and their tempers sharper, so see to those wounds." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, far from Mulgore! Welcome to the camp, cousin; the southern Barrens are hard, but we hold them." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "The kodo herds pass south of here every season, and our hunters take only the old and the lame. Do the same, and the herd will still be here for your children." },
    { id = "n_druid", cat = "class", when = { race = "Tauren", class = "DRUID" },
      text = "The quilboar of Razorfen pray to a demigod of their own, and their thorns grow wherever they spread. A druid might know what to make of it." },
  },
  lines = {
    { id = "l_quilboar", text = "The Razorfen quilboar keep their great thorny warrens to the south. They worship something down in the brambles, and they hate everyone who isn't quilboar." },
    { id = "l_dwarves", text = "There are dwarves digging in Bael Modan to the east. They're looking for something old, and they don't much care whose land they dig it out of." },
    { id = "l_camp", text = "This camp isn't much to look at, but it's a safe place in the Barrens. Out here, that's worth more than gold." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to the camp from the south and the east, usually with somebody bleeding. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "You are a stranger to this camp, so I will give you only what every hunter here already knows." },
    },
    _none = { { id = "t_none", text = "I don't know. Ask the camp's leader; he knows the southern Barrens better than anyone." } },
  },
}

P:Pool {
  id = "citizen_stonard", role = "citizen", community = "stonard",
  greetings = {
    { id = "g_day", text = "Throm-ka. Watch the mud by the gate, because it's deeper than it looks and it keeps whatever it takes." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "The swamp sings at night: frogs, mostly, and some things that aren't frogs. Stay close to the walls." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "One of the young ones, born free! My grandfather marched through this swamp with the first Horde, and he'd not believe that orcs like you walk the world without a chain." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The swamp's had its teeth in you. See the smith, and dry out before you rust." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Atal'ai trolls are down in the sunken temple, praying to their blood god. You're nothing like them, I hope, but the guards will look twice." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "The swamp's full of things with teeth, and Alliance scouts creep about in the reeds. Bring your shield; Stonard needs every one it can get." },
  },
  lines = {
    { id = "l_old", text = "Stonard was built by the old Horde, back when they first came through the Portal. Some of the stones are older than any orc living, and they remember it better than we do." },
    { id = "l_temple", text = "There's a sunken temple out in the middle of the swamp, full of trolls who pray to something old and hungry. Nobody from here goes near it if they can help it." },
    { id = "l_nethergarde", text = "The humans keep a fortress at Nethergarde, staring at the Dark Portal all day long. They're too busy watching it to bother us, which suits everyone." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News reaches Stonard slowly through the mud, but it does reach us. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "I'll tell you the common talk, and then you can find your own way through the swamp." },
    },
    _none = { { id = "t_none", text = "I don't know. Try the big hall; the officers keep the maps, such as they are." } },
  },
}

P:Pool {
  id = "citizen_kargath", role = "citizen", community = "kargath",
  greetings = {
    { id = "g_day", text = "Throm-ka, and welcome to Kargath. You'll want water, and then shade, and then a good reason to stay." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Stay inside the walls after dark. The Dark Irons come down out of the mountain at night, and they don't come to trade." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Dark Iron hammers, by the dents in you. Get mended before you go out again, because they never stop at one swing." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Look at you, standing straight and free. The Blackrock up north would call you a traitor for it, and that's the best thing anyone's said about you today." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "The Dark Iron dig in the canyons east of here, and they're stubborn to kill. Keep swinging until they've stopped moving, then swing once more." },
    { id = "n_shaman", cat = "class", when = { race = "Orc", class = "SHAMAN" },
      text = "A shaman here reminds us what the clans were before the demons, and some of the grunts in Kargath need reminding." },
  },
  lines = {
    { id = "l_blackrock", text = "The Blackrock in the Spire call themselves the true Horde, and they bow to a dragon. I'd rather live in this dust under Thrall than in their palace under a lizard." },
    { id = "l_darkiron", text = "The Dark Iron dwarves come raiding out of the mountain at night. They're short and angry, and they hit like a falling cliff." },
    { id = "l_uldaman", text = "There's an old ruin in the cliffs called Uldaman, older than the dwarves, they say. The dwarves dig into it, and the troggs come pouring back out." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News blows into Kargath with the dust, from the mountain and from the Badlands. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Dust in my throat and work on my hands, so you get the short version, stranger." },
    },
    uldaman = { { id = "t_uldaman", text = "A great vault in the cliffs, built by somebody long before the dwarves. The dwarves want what's inside, and the troggs that live there want the dwarves." } },
    _none = { { id = "t_none", text = "I don't know. Ask up the tower; the officers know more than a water-carrier." } },
  },
}

P:Pool {
  id = "citizen_splintertree", role = "citizen", community = "splintertree",
  greetings = {
    { id = "g_day", text = "Throm-ka. Keep your eyes on the trees while you're here, because the trees have eyes of their own in Ashenvale." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "The Sentinels hunt at night, and they hunt quietly. Stay close to the fires and don't wander off to relieve yourself." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Those are Sentinel arrow-marks. Their aim is good and their patience is better, so get mended before you show them your back again." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! The spirits of this forest are angry with us, and with good reason, perhaps. If you hear them speak, I'd like to know what they say." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You're a druid, then. The night elves say we're killing their forest, and they answer every tree we fell with arrows, so tell me, druid, which of us is right?" },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "The Sentinels come at night, through the trees, so we sleep in our armor. Join us at the palisade if you've the stomach for it." },
  },
  lines = {
    { id = "l_warsong", text = "The Warsong cut timber here for Orgrimmar's walls and fires. The elves call it murder, and we call it building a home, and neither side will ever see it the other way." },
    { id = "l_sentinels", text = "The Sentinels pick us off one by one from the trees. You never see them, only the arrow and then the silence." },
    { id = "l_demon", text = "There's a canyon to the east where Grom Hellscream killed the demon lord Mannoroth and freed us all from the blood curse. The ground still smokes there, people say." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News reaches Splintertree from Orgrimmar and from the forest, and the forest's news is mostly arrows. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Grunts who talk too freely end up with an elf's arrow in them, so I'll keep my answers small." },
    },
    warsong = { { id = "t_warsong", text = "Hellscream's old clan, cutting the forest for the Horde. The elves hate us for every stump, and they've made us pay for most of them." } },
    _none = { { id = "t_none", text = "I don't know. Try the commander's tent; they get the reports." } },
  },
}

P:Pool {
  id = "citizen_sepulcher", role = "citizen", community = "sepulcher",
  greetings = {
    { id = "g_day", text = "You've found the Sepulcher. We were buried here once, some of us, and now we keep the place tidy." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Keep within the walls once the light fades. The beasts of Silverpine hunt after dark, and they're always hungry." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Those are claw marks, and big ones. You were lucky out there, so get patched up before your luck notices." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Skyborne" } },
      text = "One of the living, out here among the graves! The Dark Lady's allies are welcome, but don't be offended if we forget to offer you a chair." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "The Deathstalkers pass through here on their way to Pyrewood and the keep on the hill. You'd blend in among them; you've the same habit of watching the door." },
    { id = "n_mage", cat = "class", when = { race = "Scourge", class = "MAGE" },
      text = "Archmage Arugal loosed the worgen from that keep on the hill. Every mage who passes the Sepulcher should look at it a while, and think." },
  },
  lines = {
    { id = "l_keep", text = "There's a keep to the south where a mad wizard keeps wolf-men for hounds. On quiet nights you can hear them howling all the way up here." },
    { id = "l_dalaran", text = "Dalaran's mages have set up at Ambermill, doing something with magic and a lot of shouting. The Dark Lady wants to know what, and so do we." },
    { id = "l_pyrewood", text = "Pyrewood village is still full of living humans, which is odd enough out here. Odder still, they're not quite human after dark, and they don't seem to know it." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "Every scout in Silverpine reports to the Sepulcher, and the dead have long ears. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "The dead are patient, but I'm not in the mood to be, so here's only what's common in the graveyard." },
    },
    _none = { { id = "t_none", text = "I don't know. The High Executor reads every report; ask him." } },
  },
}

P:Pool {
  id = "citizen_gromgol", role = "citizen", community = "gromgol",
  greetings = {
    { id = "g_day", text = "Throm-ka. Welcome to Grom'gol, where the zeppelins come and go and the jungle stays exactly where it is, all around us." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "The jungle's loud after dark, with raptors, tigers and trolls all hunting at once. Stay inside the stakes." },
  },
  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear, eh? The jungle trolls here are no kin of yours, mon, whatever they look like, so don't go expecting a welcome from them." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Raptors or trolls, I'd guess from the look of you. Get mended before you go back out, because the jungle smells blood." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Nesingwary's camp is north of here, and the Alliance hunters there shoot at anything that moves, us included. Go and hunt better than they do." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc in the jungle, sweating like the rest of us. The trolls here say the heat is a blessing, and I've stopped arguing with them." },
  },
  lines = {
    { id = "l_trolls", text = "The Bloodscalp and the Skullsplitter fight each other and us, and they collect heads like we collect coin. Keep yours on your shoulders." },
    { id = "l_zeppelin", text = "The zeppelins fly to Orgrimmar and the Undercity, and the goblins swear they're perfectly safe. I've seen one come down in pieces, and I take the long way now." },
    { id = "l_yenniku", text = "The Bloodscalps took Vol'jin's son Yenniku, people say. The Darkspear here want him back, and they'll take any help they can get." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes in with every zeppelin and every scout back from the jungle. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Zeppelin's due any minute and those crates won't load themselves, so here's the quick of it." },
    },
    _none = { { id = "t_none", text = "I don't know. Ask the camp's commander; he knows the jungle." } },
  },
}

P:Pool {
  id = "citizen_mojache", role = "citizen", community = "mojache",
  greetings = {
    { id = "g_day", text = "Be welcome in Camp Mojache. The forest is green and good, but it's full of danger, so walk carefully." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Stay near the fires tonight, traveler. The ogres hunt in the dark, and they're loud about it." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Ogre clubs leave marks like those, and you've a few. Sit by our fire and let the bruises settle before you hunt again." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Welcome to the camp, cousin. The Grimtotem keep a camp in this forest too, so be careful which fires you sit at." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "The ruin in the hills, Dire Maul, was once your people's city, the shamans say. Forgive us if we stare a little when you look at it." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "The Grimtotem prowl the hills south of here, and they hunt their own cousins. Keep your beast between you and them." },
  },
  lines = {
    { id = "l_ogres", text = "The Gordunni ogres hold the ruins to the north. They're big and mean, and they think everything smaller than them is either a servant or a meal." },
    { id = "l_grimtotem", text = "The Grimtotem have a camp in Feralas too. They hate the Horde, and they hate any tauren who follows Cairne, so they hate us twice." },
    { id = "l_ruins", text = "There are old elven ruins in the forest, called Dire Maul by those who've been near them. Something lives there, people say, and it isn't friendly." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Camp Mojache from the forest and from the coast. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "The Grimtotem walk under these trees too, so forgive me if I tell a stranger only what anyone could." },
    },
    grimtotem = { { id = "t_grimtotem", text = "Tauren who turned from Cairne and from the Horde, and follow their own hard ways. They've a camp in Feralas, and they're always watching ours." } },
    _none = { { id = "t_none", text = "I don't know. Ask the elders; they know more than I do." } },
  },
}

P:Pool {
  id = "citizen_hammerfall", role = "citizen", community = "hammerfall",
  greetings = {
    { id = "g_day", text = "Throm-ka. You're standing in Hammerfall, where orcs were caged once and aren't any longer." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Listen, and you'll hear the troll drums in the hills. They drum most nights, and most nights we let them." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "My father spent eight years behind these walls, under human whips. Now his son sells bread inside them, and that's the best revenge I know." },
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "Was it the trolls or the ogres? The highlands have plenty of both, so get yourself mended before you go out again." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "The Witherbark trolls in these hills hate your Darkspear cousins as much as they hate us. Mind your back if you go near their camps." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "The Syndicate hold the old Stromgarde estates, and the ogres hold most of the rest. Keep your weapon loose; this country isn't kind." },
  },
  lines = {
    { id = "l_camp", text = "The humans kept orcs in cages here once, and Thrall and Doomhammer broke them out. Doomhammer died for it, and we named the place for him." },
    { id = "l_trolls", text = "The Witherbark trolls hold the hills to the east. They don't take prisoners, and they don't leave much of anyone behind." },
    { id = "l_humans", text = "The humans of Stromgarde hold a camp at Refuge Pointe, just across the highlands. They hate us, but they hate the Syndicate more, which keeps them busy." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Hammerfall from all across the highlands. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "These walls taught my father not to trust strangers, and he taught me, so you'll get the plain talk only." },
    },
    _none = { { id = "t_none", text = "I don't know. Ask the one who leads here; he hears everything." } },
  },
}

P:Pool {
  id = "citizen_brackenwall", role = "citizen", community = "brackenwall",
  greetings = {
    { id = "g_day", text = "Throm-ka, and welcome to Brackenwall. The marsh is wet and the crocolisks are hungry, so watch where you put your feet." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "The marsh is louder at night than in the day, and none of it is singing for joy. Stay close to the fires." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "The marsh got its teeth into you. Get mended and dry out, before the mold takes what the crocolisks left." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Welcome to the swamp, brother. The humans at Theramore sit close by, so keep your axe sharp and your temper sharper." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "The swamp's full of raptors and crocolisks, and both will take your beast if you let it wander. Keep it close in the reeds." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The spirits here are sour, and they whisper that something black and old sleeps in the south of the marsh. Tell me if they say more to you." },
  },
  lines = {
    { id = "l_theramore", text = "The humans at Theramore are only a day's walk away, but they keep to their side. Their Lady keeps the peace with the Warchief, mostly, and we keep our axes close anyway." },
    { id = "l_dragons", text = "There are black dragons in the south of the marsh, people say. The wyrmkin come out at night, and nobody who goes looking for their lair comes back." },
    { id = "l_ogres", text = "The Stonemaul ogres hold the ruins to the south. They're big and they're mean and they're always hungry, which is a terrible thing in a neighbor." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Brackenwall from the marsh and the coast, wet and late. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "The marsh makes everyone suspicious, and you're no exception, so I'll keep it to what the whole village says." },
    },
    black_dragonflight = { { id = "t_dragons", text = "Black dragons, in the southern marsh. They're big and clever, and they're plotting something, because black dragons always are." } },
    _none = { { id = "t_none", text = "I don't know. The chieftain knows the marsh better than I do." } },
  },
}

P:Pool {
  id = "citizen_bloodvenom_post", role = "citizen", community = "bloodvenom_post",
  greetings = {
    { id = "g_day", text = "Throm-ka. You've found the one Horde camp in Felwood, so stay close to the fire and don't touch anything green." },
    { id = "g_night", when = { timeOfDay = { "dusk", "night" } }, text = "Felwood's worse after dark, when the trees start whispering. Stay by the fires and don't answer them." },
  },
  notice = {
    { id = "n_hurt", cat = "gear", when = { durability = { max = 0.3 } },
      text = "That's tainted muck on your gear, and it'll eat the leather if you leave it. Scrub it off before it gets into you as well." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! The ones at the sanctuary south of here are trying to heal this forest, and they could use every pair of hands that understands it." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Felwood reeks of the fel, and I suppose that suits you. Be careful the forest doesn't decide you belong to it." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "The spirits of this forest are choking, shaman. If you've any way to help them, the Cenarion folk at the Emerald Sanctuary might know where to start." },
  },
  lines = {
    { id = "l_corruption", text = "Demons poisoned this forest in the war, and the poison stayed when they left. Every tree here is twisted, and so is everything that lives under them." },
    { id = "l_jaedenar", text = "There's a camp of warlocks in the south called Jaedenar, worse than any demon. They chose this, which is the part I can't get past." },
    { id = "l_druids", text = "There's a grove to the south where the druids are trying to heal the soil, one patch at a time. I've seen a green shoot there myself, which is more than I expected." },
  },
  topics = {
    knows = {
      { id = "t_kn1", text = "News comes to Bloodvenom from the forest and from the north, and none of it smells good. Here's what I've heard." },
      { id = "t_kn_cold", when = { disposition = { max = 34 } }, text = "Felwood makes a body wary of anything that walks in from the trees, so I'll tell you only the safe parts." },
    },
    furbolgs = { { id = "t_furbolgs", text = "The Deadwood tribes have gone mad from the poison, every one. The Timbermaw to the north are still sane, and they hate what's happened to their cousins." } },
    _none = { { id = "t_none", text = "I don't know. Ask the one who sends people into the trees; he'll know." } },
  },
}
