local P = RPGDialogueAPI:Pack("rpgd.world")

-- Overheard exchanges about the player (0.116.0): townsfolk gossip about you as you pass.

P:Exchange { id = "ex_you_1", a = { role = "guard" }, b = { role = "citizen" }, when = { zone = "Stormwind City", word = "helped" },
  lines = {
    { who = "b", text = "That's the one who brought the Thomas boy home from the Elwynn woods, isn't it?" },
    { who = "a", text = "The very same, and the captain's been singing {g:his|her} praises all week. Shh, {g:he|she}'s coming this way." },
  } }

P:Exchange { id = "ex_you_2", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Stormwind City", word = "intimidated" },
  lines = {
    { who = "b", text = "Is that the {class} who put a fishmonger through his own barrel in the trade district?" },
    { who = "a", text = "I heard it was two barrels, and I'll be keeping my prices very reasonable while {g:he|she}'s in sight." },
  } }

P:Exchange { id = "ex_you_3", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Stormwind City", townStanding = { town = "stormwind", min = 55 } },
  lines = {
    { who = "a", text = "There goes {name}. My mother says Stormwind would be a poorer place without folk like that." },
    { who = "b", text = "Your mother says that about the man who sweeps the cathedral steps, too, though in this case I'd agree with her." },
  } }

P:Exchange { id = "ex_you_4", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Stormwind City", townStanding = { town = "stormwind", max = -20 } },
  lines = {
    { who = "a", text = "Keep an eye on that one. The watch has a list, and {g:his|her} name is written on it in rather large letters." },
    { who = "b", text = "I'll keep both eyes on {g:him|her}. Shh, don't stare, {g:he|she}'ll know we're talking about {g:him|her}." },
  } }

P:Exchange { id = "ex_you_5", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Stormwind City", drunk = true },
  lines = {
    { who = "b", text = "That {race} has had a few, by the way {g:he|she}'s walking down the canal path." },
    { who = "a", text = "As long as {g:he|she} doesn't fall in, it's no business of ours. The last one who fell in took a week to dry out." },
  } }

P:Exchange { id = "ex_you_6", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Stormwind City", nearlyNaked = true },
  lines = {
    { who = "a", text = "Light preserve us, that {race} is walking through the trade district in nothing but {g:his|her} smallclothes." },
    { who = "b", text = "Maybe the Defias robbed {g:him|her} on the road. Or maybe it's the fashion in Ironforge; I never know with adventurers." },
  } }

P:Exchange { id = "ex_you_7", a = { role = "guard" }, b = { role = "citizen" }, when = { zone = "Stormwind City", cleared = "The Stockade" },
  lines = {
    { who = "b", text = "They say that {class} went into the Stockade during the riot and came out with the ringleader's head." },
    { who = "a", text = "Bazil Thredd's head, so the warden says, and the rest of the prison very quiet afterward. Shh, that's {g:him|her}!" },
  } }

P:Exchange { id = "ex_you_8", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Stormwind City", cleared = "The Deadmines" },
  lines = {
    { who = "a", text = "That's one of the lot who went down into the Deadmines after Van Cleef." },
    { who = "b", text = "And came back up again, which is more than most can say. I'd buy {g:him|her} a drink if the captain weren't watching." },
  } }

P:Exchange { id = "ex_you_9", a = { role = "child" }, b = { role = "citizen" }, when = { zone = "Stormwind City", minLevel = 55 },
  lines = {
    { who = "a", text = "Mama, look at the {class}'s armour, it's all glowing and covered in spikes, and I want some just like it." },
    { who = "b", text = "Then you'll have to fight a great many dragons first, and you can't even fight your brother. Don't point, dear." },
  } }

P:Exchange { id = "ex_you_10", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Stormwind City", mounted = true },
  lines = {
    { who = "a", text = "Look at the size of that mount. It must eat more in a day than my whole family does in a week." },
    { who = "b", text = "And it's probably better fed, too, the way prices have gone. Shh, it's looking at us." },
  } }

P:Exchange { id = "ex_you_11", a = { role = "guard" }, b = { role = "citizen" }, when = { zone = "Stormwind City", killed = { name = "Defias", min = 50 } },
  lines = {
    { who = "b", text = "Is that the one who's been clearing the Defias out of Westfall? I heard it was dozens of them." },
    { who = "a", text = "More than fifty, according to Gryan Stoutmantle's reports, and {g:he|she} doesn't look tired yet." },
  } }

P:Exchange { id = "ex_you_12", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Stormwind City", deaths = { min = 30 } },
  lines = {
    { who = "a", text = "I swear that {class} has been carried to the spirit healer more times than I've had hot dinners." },
    { who = "b", text = "Death doesn't seem to discourage {g:him|her} much. I suppose it's a kind of courage, or a kind of stubbornness." },
  } }

P:Exchange { id = "ex_you_13", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Ironforge", word = "helped" },
  lines = {
    { who = "a", text = "That's the {g:lad|lass} who helped the mountaineers clear the troggs out o' the old quarry, aye?" },
    { who = "b", text = "Aye, and turned down the reward ale, which I find a wee bit suspicious, if I'm honest." },
  } }

P:Exchange { id = "ex_you_14", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Ironforge", drunk = true },
  lines = {
    { who = "b", text = "That one's been at the Thunderbrew all afternoon and still walkin' straight, more or less." },
    { who = "a", text = "More less than more, I'd say. Still, I've seen dwarves fall over after half as much, so I'm impressed." },
  } }

P:Exchange { id = "ex_you_15", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Ironforge", word = "intimidated" },
  lines = {
    { who = "a", text = "Heard that {race} gave old Grumbol such a fright he shaved his own beard off in apology." },
    { who = "b", text = "I'd no' believe a word o' it, but I'll no' be startin' an argument wi' {g:him|her}, either. Shh, {g:he|she}'s near." },
  } }

P:Exchange { id = "ex_you_16", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Ironforge", race = "Gnome", class = "WARLOCK" },
  lines = {
    { who = "a", text = "There goes a gnome warlock, and with a demon at {g:his|her} heels, too, if ye can believe it." },
    { who = "b", text = "Better a gnome wi' a demon than a demon wi' a gnome, I always say, though I cannae tell ye what it means." },
  } }

P:Exchange { id = "ex_you_17", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Ironforge", nearlyNaked = true },
  lines = {
    { who = "b", text = "That {race}'s walkin' about the Commons wi' hardly a stitch on, and it's freezin' in Dun Morogh." },
    { who = "a", text = "Maybe {g:he|she}'s savin' on armour repairs. With the price o' leather these days, I can hardly blame {g:him|her}." },
  } }

P:Exchange { id = "ex_you_18", a = { role = "guard" }, b = { role = "citizen" }, when = { zone = "Ironforge", cleared = "Blackrock Depths" },
  lines = {
    { who = "b", text = "They say that one walked right into the Dark Iron city and came out again wi' Thaurissan's crown." },
    { who = "a", text = "Emperor Dagran's crown, aye, and I'd drink to it. Shh, the {class}'s comin' past now." },
  } }

P:Exchange { id = "ex_you_19", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Ironforge", minLevel = 55 },
  lines = {
    { who = "a", text = "Ye see that {class}'s weapon? I'd swear by the forge it's titan-made, or near enough." },
    { who = "b", text = "Or dragon-made, by the look o' the scales on it. I'd no' want to be on the wrong end o' that." },
  } }

P:Exchange { id = "ex_you_20", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Darnassus", word = "helped" },
  lines = {
    { who = "a", text = "That is the one who cleansed the moonwell near Ban'ethil when the Gnarlpine fouled it." },
    { who = "b", text = "Then Elune has smiled on {g:him|her}, and so shall I. Ishnu-alah, friend, if you can hear us." },
  } }

P:Exchange { id = "ex_you_21", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Darnassus", race = "Dwarf" },
  lines = {
    { who = "a", text = "Another dwarf on the Craftsmen's Terrace. I fear for the bark of our trees." },
    { who = "b", text = "This one carries no axe, at least, which is more courtesy than most of them show. Hush, sister, {g:he|she} hears us." },
  } }

P:Exchange { id = "ex_you_22", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Darnassus", mounted = true },
  lines = {
    { who = "a", text = "Did you see the beast that {class} rides? The frostsabers hardly know what to make of it." },
    { who = "b", text = "They are proud cats and do not care to share the road. Let us hope it does not try to eat one." },
  } }

P:Exchange { id = "ex_you_23", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Darnassus", drunk = true },
  lines = {
    { who = "b", text = "The young {race} has been drinking moonberry wine since twilight, and now {g:he|she} sings to the owls." },
    { who = "a", text = "The owls seem to be enjoying it more than the rest of us. I will fetch {g:him|her} some water." },
  } }

P:Exchange { id = "ex_you_24", a = { role = "guard" }, b = { role = "citizen" }, when = { zone = "Darnassus", minLevel = 55 },
  lines = {
    { who = "b", text = "That traveler has seen much, I think. There are old battles in the way {g:he|she} walks." },
    { who = "a", text = "Not so old as ours, but old enough. Let {g:him|her} pass with honour." },
  } }

P:Exchange { id = "ex_you_25", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Orgrimmar", word = "helped" },
  lines = {
    { who = "a", text = "That's the {class} who drove the Burning Blade from Skull Rock, isn't it? Thrall spoke of {g:him|her} at the gates." },
    { who = "b", text = "Then {g:he|she} has more honour than half the grunts in this city. Lok'tar, {class}." },
  } }

P:Exchange { id = "ex_you_26", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Orgrimmar", killed = { name = "Burning Blade", min = 20 } },
  lines = {
    { who = "a", text = "That one has killed more cultists than the whole Razor Hill garrison put together." },
    { who = "b", text = "Good. Every one of those dogs dead is one less shame for the Horde to carry." },
  } }

P:Exchange { id = "ex_you_27", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Orgrimmar", word = "intimidated" },
  lines = {
    { who = "b", text = "Is that the one who made Grubbash hand over his wares with only a look?" },
    { who = "a", text = "A look, they say, and a very large axe behind it. I will be keeping my prices honest today." },
  } }

P:Exchange { id = "ex_you_28", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Orgrimmar", drunk = true },
  lines = {
    { who = "b", text = "That {race} has drunk enough grog to fell a kodo, and still {g:he|she} stands." },
    { who = "a", text = "A true warrior, then, or a very foolish one. In the Horde, it is hard to tell the difference." },
  } }

P:Exchange { id = "ex_you_29", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Orgrimmar", pvpRank = 6 },
  lines = {
    { who = "a", text = "Do you see the rank on that one? {g:He|She} has bled the Alliance in Warsong Gulch more times than I can count." },
    { who = "b", text = "Then {g:he|she} has earned {g:his|her} place in the Valley of Honor. Shh, salute, you fool." },
  } }

P:Exchange { id = "ex_you_30", a = { role = "child" }, b = { role = "citizen" }, when = { zone = "Orgrimmar", minLevel = 55 },
  lines = {
    { who = "a", text = "Look at that one's wolf! It's bigger than our hut, and I want one just like it." },
    { who = "b", text = "Then grow up strong and fight well, little grunt. Wolves like that are not given to the lazy." },
  } }

P:Exchange { id = "ex_you_31", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Orgrimmar", deaths = { min = 30 } },
  lines = {
    { who = "a", text = "They say that {class} has died more times than any warrior in Durotar, and still keeps going." },
    { who = "b", text = "The spirit healers must know {g:him|her} by name by now. Stubbornness is a kind of strength, I suppose." },
  } }

P:Exchange { id = "ex_you_32", a = { role = "guard" }, b = { role = "citizen" }, when = { zone = "Thunder Bluff", word = "helped" },
  lines = {
    { who = "b", text = "That is the traveler who helped the Bloodhoof drive the Venture Company from the plains." },
    { who = "a", text = "Then the Earth Mother walks with {g:him|her}, and so do the tauren. May the eternal sun shine upon you, friend." },
  } }

P:Exchange { id = "ex_you_33", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Thunder Bluff", nearlyNaked = true },
  lines = {
    { who = "b", text = "That one walks the bluffs with almost nothing on, and the wind is cold up here." },
    { who = "a", text = "Perhaps {g:he|she} seeks to feel closer to the Earth Mother. Or perhaps the centaur took {g:his|her} clothes." },
  } }

P:Exchange { id = "ex_you_34", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Thunder Bluff", drunk = true },
  lines = {
    { who = "b", text = "The young {race} has been drinking since sunset, and now {g:he|she} tries to wrestle a kodo." },
    { who = "a", text = "The kodo is winning, I think. Let them both be; the herd will sort it out." },
  } }

P:Exchange { id = "ex_you_35", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Thunder Bluff", mounted = true, race = "Tauren" },
  lines = {
    { who = "a", text = "That kodo the traveler rides is a fine beast. The Bloodhoof herds would be proud." },
    { who = "b", text = "Or the Grimtotem stole it, which would explain why it looks so pleased to be away." },
  } }

P:Exchange { id = "ex_you_36", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Thunder Bluff", pvpRank = 6 },
  lines = {
    { who = "a", text = "That warrior has fought the Alliance many times in Alterac Valley, and {g:he|she} carries {g:his|her} rank with pride." },
    { who = "b", text = "Then {g:he|she} has walked a hard road. May the winds guide {g:him|her}." },
  } }

P:Exchange { id = "ex_you_37", a = { role = "guard" }, b = { role = "citizen" }, when = { zone = "Undercity", word = "helped" },
  lines = {
    { who = "b", text = "That {class} did good work for the Royal Apothecary Society, or so the whispers say." },
    { who = "a", text = "Then the Dark Lady will remember it. She remembers everything, especially the useful ones." },
  } }

P:Exchange { id = "ex_you_38", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Undercity", word = "intimidated" },
  lines = {
    { who = "a", text = "That one made the abomination in the Trade Quarter cry, which I did not know was possible." },
    { who = "b", text = "Anything is possible, now that we are dead. Do not let {g:him|her} catch you laughing, though." },
  } }

P:Exchange { id = "ex_you_39", a = { role = "vendor" }, b = { role = "citizen" }, when = { zone = "Undercity", cleared = "Scarlet Monastery" },
  lines = {
    { who = "b", text = "They say that {class} cut through the Scarlet Monastery like a scythe through wheat." },
    { who = "a", text = "Then {g:he|she} has done the Dark Lady's work, and done it well. Shh, {g:he|she} might hear you." },
  } }

P:Exchange { id = "ex_you_40", a = { role = "innkeeper" }, b = { role = "citizen" }, when = { zone = "Undercity", drunk = true },
  lines = {
    { who = "b", text = "The living {race} has been drinking our ale, which is strange, because most of them think it tastes of embalming fluid." },
    { who = "a", text = "It does taste of embalming fluid. {g:He|She} simply has better manners than most." },
  } }

P:Exchange { id = "ex_you_41", a = { role = "guard" }, b = { role = "guard" }, when = { zone = "Undercity", race = "Scourge", class = "WARLOCK" },
  lines = {
    { who = "a", text = "Another of our kind who walks with demons. The Dark Lady tolerates them, but I do not trust them." },
    { who = "b", text = "Trust is a luxury of the living. As long as {g:he|she} points {g:his|her} demons at the Scourge, I am satisfied." },
  } }

P:Exchange { id = "ex_you_42", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Undercity", ghost = true },
  lines = {
    { who = "a", text = "I felt a chill just now, colder even than the sewers. Did you feel it too?" },
    { who = "b", text = "We are dead, and we still feel the chill of the dead. That should worry you more than it does." },
  } }

P:Exchange { id = "ex_you_43", a = { role = "guard" }, b = { role = "citizen" }, when = { subzone = "Booty Bay", word = "helped" },
  lines = {
    { who = "b", text = "That's the one who helped old Baron Revilgaz with the Bloodsail problem, ain't it?" },
    { who = "a", text = "Sure is, pal, and the baron says {g:he|she}'s a valued customer now. Shh, here {g:he|she} comes." },
  } }

P:Exchange { id = "ex_you_44", a = { role = "vendor" }, b = { role = "citizen" }, when = { subzone = "Gadgetzan", drunk = true },
  lines = {
    { who = "b", text = "That {class} has had so much rum {g:he|she}'s tryin' to buy water with sand." },
    { who = "a", text = "Hey, sand's legal tender if I say it is. Business is business, buddy." },
  } }

P:Exchange { id = "ex_you_45", a = { role = "guard" }, b = { role = "guard" }, when = { subzone = "Ratchet", minLevel = 55 },
  lines = {
    { who = "a", text = "See that big shot walkin' through Ratchet? Looks like {g:he|she}'s seen more fights than the bruisers." },
    { who = "b", text = "Then I ain't charging {g:him|her} the full docking fee. Professional courtesy, ya know?" },
  } }

P:Exchange { id = "ex_you_46", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Elwynn Forest", subzone = "Goldshire", faction = "Alliance", word = "helped" },
  lines = {
    { who = "a", text = "That's the {class} who cleared the kobolds out of the Fargodeep mine, my husband says." },
    { who = "b", text = "Then I'll stop locking my candles away, though I suppose I'll keep them close just in case." },
  } }

P:Exchange { id = "ex_you_47", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Westfall", faction = "Alliance", killed = { name = "Defias", min = 50 } },
  lines = {
    { who = "a", text = "That's the one who's killed half the Defias in Westfall, I swear it." },
    { who = "b", text = "Then {g:he|she}'s done more for us than Stormwind ever did. Shh, {g:he|she}'s passing by." },
  } }

P:Exchange { id = "ex_you_48", a = { role = "guard" }, b = { role = "citizen" }, when = { zone = "Durotar", subzone = "Razor Hill", faction = "Horde", word = "helped" },
  lines = {
    { who = "b", text = "That is the warrior who helped Gar'Thok drive the quilboar from Razormane grounds." },
    { who = "a", text = "Then {g:he|she} has earned a place at our fires. Lok'tar, friend." },
  } }

P:Exchange { id = "ex_you_49", a = { role = "citizen" }, b = { role = "citizen" }, when = { zone = "Tirisfal Glades", subzone = "Brill", faction = "Horde", deaths = { min = 30 } },
  lines = {
    { who = "a", text = "That one has died so many times the spirit healer is starting to send {g:him|her} letters." },
    { who = "b", text = "At least {g:he|she} comes back. Some of us were not so lucky the first time." },
  } }

P:Exchange { id = "ex_you_50", a = { role = "guard" }, b = { role = "guard" }, when = { faction = "Alliance", ghost = true },
  lines = {
    { who = "a", text = "Did you feel that? Like someone walked right through me." },
    { who = "b", text = "Probably just a draft, though I'll admit I've felt it twice now." },
  } }
