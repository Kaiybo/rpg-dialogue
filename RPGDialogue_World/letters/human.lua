local P = RPGDialogueAPI:Pack("rpgd.world")
-- Origin letters: Human. Two per origin: one from home soon after you set out,
-- and one later when something you did touches the life you left.

---------------------------------------------------------------------------
-- Westfall farmhand
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_westfall_farmhand_1", stranger = true, delay = 1200,
  when = { origin = "human_westfall_farmhand", minLevel = 6 },
  from = "Hester Furlbrow", subject = "From the farm, what's left of it",
  body = "{name},\n\nThe peddler who comes through Goldshire said he'd seen you with a sword on your hip, heading out past the Tower of Azora like you meant something by it. I nearly dropped the bucket. You were the one who wouldn't kill the rooster when he went lame.\n\nThere's nothing much to tell from here except that the Defias have a scarecrow of ours stood up on the old fence with a red bandana on it, which they think is very funny. The harvest golems took the south field again. Old Brannoc went to Sentinel Hill to join the militia and came back a week later because his knees gave out on the climb.\n\nEat when you can and keep your boots dry. I mean that.\n\nHester, who still keeps your stool by the stove",
}

P:Letter {
  id = "origin_human_westfall_farmhand_2", stranger = true, delay = 2400,
  when = { origin = "human_westfall_farmhand", cleared = "The Deadmines" },
  from = "Hester Furlbrow", subject = "The red bandana came down",
  body = "{name},\n\nWord came up the road from Sentinel Hill that VanCleef is dead in his own ship, and the men at the militia fire said your name more than once while they said it. I went out to the fence and took that scarecrow down myself, bandana and all, and put it in the stove.\n\nIt doesn't put the farm back the way it was, and I know some of those masked boys were lads we used to hire at harvest. I keep thinking about that, and I expect you do too.\n\nBut the Hill slept last night, and so did I, and that's the first full night's sleep I've had in three years. Come home and see it when you've a mind to, even if home is mostly weeds just now.\n\nHester",
}

---------------------------------------------------------------------------
-- Younger child of a minor noble house
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_minor_noble_1", stranger = true, delay = 1200,
  when = { origin = "human_minor_noble", minLevel = 6 },
  from = "Aldous Prestor-Vane", subject = "Regarding your absence",
  body = "Dear {name},\n\nMother has asked me to write, since she maintains that she is not speaking to you, and I am instructed to say that she is not speaking to you very firmly. Lady Harrowgate asked after you at the spring luncheon, and Mother told her you were travelling for your health. I would be grateful if you did not contradict this in any public place.\n\nThe house is much as you left it. The roof over the east stair still leaks, the steward still steals the good candles, and I still have the seat on the merchants' council that neither of us wanted me to have.\n\nI will confess, between us, that I envy you a little. Do not tell Mother that either.\n\nYour brother,\nAldous",
}

P:Letter {
  id = "origin_human_minor_noble_2", stranger = true, delay = 2400,
  when = { origin = "human_minor_noble", minLevel = 30 },
  from = "Aldous Prestor-Vane", subject = "Your name at dinner",
  body = "Dear {name},\n\nA curious thing happened at Lord Ashmere's table last week. A captain home from the field mentioned a {race} {class} who had done some useful work for the Alliance, and gave your name, and the whole table turned to look at Mother.\n\nShe said, without a pause, that she had always known you had it in you. I have never been so proud of her lying in my life.\n\nYou should know that she has cleared a drawer for the letters you have never sent her, and she looks into it, empty, most evenings. If you were to write her a short note, and mention the weather and nothing about money, I believe it would be received very well indeed.\n\nYour brother, still on the council,\nAldous",
}

---------------------------------------------------------------------------
-- Refugee from Lordaeron
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_lordaeron_refugee_1", stranger = true, delay = 1200,
  when = { origin = "human_lordaeron_refugee", minLevel = 6 },
  from = "Maudie Calloway", subject = "From the old crowd in the Cathedral Square",
  body = "{name},\n\nYou always did slip off without saying goodbye, ever since the boats. I found out from the baker's girl, who heard it from someone who saw you leave by the gate with a pack. So this is me saying goodbye properly, a bit late.\n\nThe rest of us from Andorhal and the river towns still meet on the Cathedral steps on Sunday afternoons. Old Pell brings a pipe he can't afford to fill, and someone always starts a song from back home and someone always cries. Last week it was me, and I'm not ashamed of it.\n\nIf you go north, don't go looking for what's gone. Look for what's still there, and write me if you find any of it.\n\nMaudie, who carried you off the gangplank",
}

P:Letter {
  id = "origin_human_lordaeron_refugee_2", stranger = true, delay = 2400,
  when = { origin = "human_lordaeron_refugee", cleared = "Shadowfang Keep" },
  from = "Maudie Calloway", subject = "Silverpine",
  body = "{name},\n\nA dwarf in the Dwarven District told Pell you'd been up into Silverpine and come back out of that keep of Arugal's, and Pell told everyone on the steps, so now you're famous among a dozen old refugees and a pigeon.\n\nI went to Silverpine once, as a girl, before any of it. Mother bought me a ribbon in Pyrewood off a cart, and it was green, and I had it until we got on the boat. I don't know what Pyrewood is now and I don't want you to tell me.\n\nI only wanted to say that someone from home has walked back up there and walked out again, and that matters to us more than I can make it sound in a letter.\n\nMaudie",
}

---------------------------------------------------------------------------
-- Squire of the fallen Silver Hand
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_paladin_squire_1", stranger = true, delay = 1200,
  when = { origin = "human_paladin_squire", minLevel = 6 },
  from = "Godric Ashbourne", subject = "Squire",
  body = "{name},\n\nI am told you have taken up the hammer and gone out on your own. I would have liked to hear it from you, but I suppose a squire whose knight is drinking in a Trade District cellar does not owe him much in the way of courtesy.\n\nI am not well. My hands shake in the mornings now, and the Cathedral has stopped asking me to stand at the Midsummer service. That is my own doing and none of yours.\n\nWhat I want to say is this. The Order is broken, but the oaths were never the Order's to break. You knew that before I did. Keep them, keep your armour oiled, and say the dawn prayer even when you feel a fool doing it.\n\nGodric Ashbourne, once of the Silver Hand",
}

P:Letter {
  id = "origin_human_paladin_squire_2", stranger = true, delay = 2400,
  when = { origin = "human_paladin_squire", cleared = "Scarlet Monastery" },
  from = "Godric Ashbourne", subject = "The men in red",
  body = "{name},\n\nThe news came down from Southshore that the Scarlet Monastery has been broken open, and your name was on it. I sat with that for a long while before I could write.\n\nI knew some of the men who wear red now. I rode beside two of them at Blackrock Spire in the old war, and they were good, brave and kind, and the plague made them into something that would burn a farmhouse for coughing. I do not know what you found inside those walls, and I would rather you did not tell me.\n\nBut you went in with the oaths and came out with them still on you, which is more than they managed. I have not had a drink in a fortnight. I wanted you to know that too.\n\nGodric",
}

---------------------------------------------------------------------------
-- Novice of Northshire Abbey
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_abbey_novice_1", stranger = true, delay = 1200,
  when = { origin = "human_abbey_novice", minLevel = 6 },
  from = "Brother Anselm", subject = "From the Abbey cloister",
  body = "My dear {name},\n\nThe cloister is very quiet without you, chiefly because nobody is singing the evening psalm half a note sharp. I find I miss it, which I did not expect, and I have done penance for laughing about it.\n\nThe kobolds have been at the vineyard fence again, and the new novices are afraid of the wolves in the valley, so I walk them to the stream myself and pretend I am not afraid of the wolves either. Brother Paxton sends his blessing and asks whether you remembered to return his copy of the Litany of the Dawn. I told him you had, which may have been a sin.\n\nPray where you are. The Light does not need a roof.\n\nIn the Light,\nBrother Anselm",
}

P:Letter {
  id = "origin_human_abbey_novice_2", stranger = true, delay = 2400,
  when = { origin = "human_abbey_novice", minLevel = 20 },
  from = "Brother Anselm", subject = "A question you asked me once",
  body = "My dear {name},\n\nYou asked me once, on the bench under the lime tree, how a priest knows when the Light is pleased with him. I gave you a very poor answer about humility and you were kind enough not to say so.\n\nI have a better one now. A soldier came through the Abbey last week on his way to Redridge, and he said a {class} had dressed his wound in a ditch and stayed with him through the night, and then he told me your name. I had to go and sit in the chapel for some time afterward.\n\nThat is how a priest knows, I think. Somebody else tells him. Keep your letters close and your hands busy, and come and sing badly for us at Harvest.\n\nIn the Light,\nBrother Anselm",
}

---------------------------------------------------------------------------
-- Child of the Stonemasons' Guild
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_stonemason_child_1", stranger = true, delay = 1200,
  when = { origin = "human_stonemason_child", minLevel = 6 },
  from = "Tobias Wren", subject = "You might have said",
  body = "{name},\n\nYour mother had to hear it from the coal man that you'd gone off adventuring, and I had to hear it from your mother, at volume. You might have said.\n\nWork is thin. The city wants walls patched and nobody wants to pay a fair rate for it, which is no news to this family. I did a fortnight on the Cathedral steps for a lord's steward who paid me in promises and one ham, and the ham was off.\n\nYou know what I think of the ones who went west in masks, and you know what I think of the lords who sent them there. I hope you'll find a third road, because I never did. Keep your hands soft enough to hold a sword and hard enough to hold a chisel.\n\nYour father,\nTobias Wren",
}

P:Letter {
  id = "origin_human_stonemason_child_2", stranger = true, delay = 2400,
  when = { origin = "human_stonemason_child", cleared = "The Deadmines" },
  from = "Tobias Wren", subject = "VanCleef",
  body = "{name},\n\nSo it was you. They're saying it in the guild hall and the older masons won't look at me, and the apprentices keep buying me ale.\n\nI worked beside Edwin VanCleef on the Cathedral, before any of it. He was a fine mason and a fair foreman, and he was right about the money, and he was wrong about everything he did once he knew he was right. I don't know how to be glad and sorry in the same breath, so I've been doing both separately, on alternate days.\n\nYour mother says you did what had to be done and I'm to tell you she's proud. I'm proud too, for what it's worth from a man who only ever stood in the middle and shouted.\n\nYour father",
}

---------------------------------------------------------------------------
-- Born in Lakeshire
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_redridge_born_1", stranger = true, delay = 1200,
  when = { origin = "human_redridge_born", minLevel = 6 },
  from = "Nan Halloway", subject = "From the lake",
  body = "{name},\n\nThe ferryman's boy says he saw you go down the road to Elwynn with a pack and a look on your face like your grandfather used to get before a fight. I wanted to box your ears and kiss you in the same moment, so it's as well you were gone.\n\nThe bridge is still half-mended, and the gnolls have taken to stealing the washing off the lines at the north end of town, which has given poor Mrs. Pike a terrible fright and a great many letters to write to Stormwind. Nobody in Stormwind has answered her, as you'll not be surprised to hear.\n\nThe perch are biting well this spring. Come home before they stop, if you can.\n\nYour Nan",
}

P:Letter {
  id = "origin_human_redridge_born_2", stranger = true, delay = 2400,
  when = { origin = "human_redridge_born", minLevel = 20 },
  from = "Nan Halloway", subject = "They know your name in the Inn",
  body = "{name},\n\nA soldier passing through the Lakeshire Inn asked whether this was the town that bred that {class} called {name}, and every head in the room turned round, and old Corley stood up and said it was, and that he'd taught you to bait a hook. He never did, but he's dining out on it now.\n\nI'll tell you what I told him. The kingdom never thought much of Lakeshire, and it's a fine thing that it's learning our names one way or another. You keep teaching it.\n\nThe orcs are still up in the hills, and the bridge is still half-mended. Some things wait for you, it seems.\n\nYour Nan, at the window, as usual",
}

---------------------------------------------------------------------------
-- Former recruit of the Stormwind City Guard
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_city_guard_1", stranger = true, delay = 1200,
  when = { origin = "human_city_guard", minLevel = 6 },
  from = "Sergeant Brask Hollins", subject = "Your halberd",
  body = "{name},\n\nYou left your halberd in the Trade District rack, and the quartermaster wants to know whether you're coming back for it or whether he can sell it to the next recruit at the full price. I told him to keep it a month, out of sentiment, which he finds very funny in me.\n\nNothing has changed on the night watch. The canals still smell, the drunks still sing outside the Pig and Whistle, and the new lad still holds his lantern so high he can't see his own feet. He fell in the canal on Tuesday, which cheered everyone.\n\nYou wanted to go where the trouble was. Fine. Just remember the trouble will want to go where you are, as well.\n\nSergeant Hollins, Trade District Watch",
}

P:Letter {
  id = "origin_human_city_guard_2", stranger = true, delay = 2400,
  when = { origin = "human_city_guard", cleared = "The Stockade" },
  from = "Sergeant Brask Hollins", subject = "Below the canals",
  body = "{name},\n\nThe whole barracks is talking about the riot in the Stockade and who went down into it while the warden was still shouting for help at the gate. I had to tell three of the new lads that yes, you were one of ours once, and no, you didn't learn it from them.\n\nWe lost a good man in the first hour of that riot, and it stung a little that it took someone who'd left the Guard to put it right. But I'd rather it was you than nobody.\n\nThe quartermaster sold your halberd, by the way. I made him give the money to the widow of the lad we lost, so you'll consider that your share of the honour.\n\nSergeant Hollins",
}

---------------------------------------------------------------------------
-- Pickpocket from the Stormwind canals
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_canal_pickpocket_1", stranger = true, delay = 1200,
  when = { origin = "human_canal_pickpocket", minLevel = 6 },
  from = "Pip Gallow", subject = "Oi",
  body = "Oi, {name},\n\nThe old crowd from under the Canal Bridge says you've gone respectable, or near enough, and I said I'd believe it when I saw you pay for a pie. Then Nell swore she saw you do it, at the stall by the Cathedral, and I've been off my food ever since.\n\nThings are slow. The Guard put a new man on the Trade District at nights and he's got eyes like a hawk and no sense of humour at all. Sticky Dob lifted a purse off a dwarf last week and it turned out to be full of gunpowder, which was a lesson to all of us, and to Dob's eyebrows in particular.\n\nDon't forget who taught you the drop-and-bump. That's all.\n\nPip",
}

P:Letter {
  id = "origin_human_canal_pickpocket_2", stranger = true, delay = 2400,
  when = { origin = "human_canal_pickpocket", cleared = "The Deadmines" },
  from = "Pip Gallow", subject = "Never thought I'd say it",
  body = "Oi, {name},\n\nYou went and did VanCleef in, and now the whole of Old Town is in a muddle. The fences say you've ruined trade, because the Brotherhood paid good coin for a quiet word in the right ear, and everybody else says good riddance, because the Brotherhood never paid anybody back.\n\nI'm with everybody else, as it goes. They came round to Nell's last winter wanting a cut of a business she doesn't even have, and she's been sleeping with a cleaver since.\n\nSo here's me, writing to say well done to a {class} who used to lift buttons off coats for a dare. Never thought I'd say it. Don't let it go to your head, and keep one hand on your purse.\n\nPip",
}

---------------------------------------------------------------------------
-- Apprentice of the Mage Quarter
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_mage_quarter_1", stranger = true, delay = 1200,
  when = { origin = "human_mage_quarter", minLevel = 6 },
  from = "Magister Corwin Thale", subject = "Your unfinished essay",
  body = "{name},\n\nI have discovered your essay on the stability of conjured water lying half-finished on my desk, which I take as notice of your departure. It is not your worst work, though the third section confuses a ley line with a drainage ditch, and I have corrected it in red so that you will feel it from wherever you are.\n\nThe Quarter is unchanged. Someone set fire to a curtain at the Blue Recluse again, the warlocks in the Slaughtered Lamb's cellar continue to pretend we cannot hear them, and my colleagues continue to mention Dalaran at every possible opportunity.\n\nPractise your frost and do not show off with fire in a forest. I will not repeat the reasons.\n\nMagister Corwin Thale",
}

P:Letter {
  id = "origin_human_mage_quarter_2", stranger = true, delay = 2400,
  when = { origin = "human_mage_quarter", cleared = "Gnomeregan" },
  from = "Magister Corwin Thale", subject = "On gnomish engineering",
  body = "{name},\n\nThe gnomes in Ironforge are telling anyone who stands still long enough that you went into Gnomeregan and left Thermaplugg's machines in pieces. I confess I am impressed, and I find the feeling unfamiliar.\n\nI have always held that engineering is merely magic for people who cannot be bothered to learn the words, and I stand by that, but I would very much like to hear what that place looks like inside. Radiation is not a school of magic I have studied, and I do not intend to begin.\n\nIf you return to Stormwind, call at my rooms. I will make tea, and I will not correct your grammar until the second cup.\n\nCorwin Thale",
}

---------------------------------------------------------------------------
-- Pupil from the Slaughtered Lamb's cellar
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_lamb_cellar_1", stranger = true, delay = 1200,
  when = { origin = "human_lamb_cellar", minLevel = 6 },
  from = "Ysolde Marrick", subject = "A note left under the stair",
  body = "{name},\n\nYou left the cellar without a word, which is correct, and took nothing that was not yours, which is rarer than you would think. I mention it so that you know someone noticed.\n\nThings below the Lamb are as they were. The barkeep upstairs still pretends he cannot smell the brimstone through the floorboards, and a novice from Goldshire burned off one eyebrow summoning his first imp and has decided to grow the other out to match, out of pride.\n\nRemember that the thing at the end of the chain is always listening for the moment your hand tires. Feed it, keep it close, and never once let it think it is your friend.\n\nY. M., below the stair",
}

P:Letter {
  id = "origin_human_lamb_cellar_2", stranger = true, delay = 2400,
  when = { origin = "human_lamb_cellar", cleared = "Blackfathom Deeps" },
  from = "Ysolde Marrick", subject = "Cultists",
  body = "{name},\n\nI hear you went down into Blackfathom Deeps and put an end to the Twilight's Hammer fools who were splashing about down there in robes. Good.\n\nPeople in this city like to say that we in the cellar and those cultists are the same breed, and it irritates me more than I can comfortably write. They kneel to the things they call. We do not. They think power is a gift, and so they will always end up owing it something.\n\nYou have now seen with your own eyes what a summoner looks like once he forgets which end of the chain he is holding. Remember their faces, and come down the stair when you are next in the city. There is a book I think you are ready for.\n\nY. M.",
}

---------------------------------------------------------------------------
-- Woodsman of Eastvale
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_eastvale_woodsman_1", stranger = true, delay = 1200,
  when = { origin = "human_eastvale_woodsman", minLevel = 6 },
  from = "Rufus Kettering", subject = "From the logging camp",
  body = "{name},\n\nThe camp's gone quiet without you whistling at the jays. Big Henrik says it's a mercy, but he still looks up at the trees every morning as if you'll come down out of one.\n\nWe've had trouble with the wolves again on the north run, and a murloc came all the way up the stream and bit Henrik on the boot, which he took very personally. The saw blade cracked in the cold snap and the new one cost us eleven silver in Goldshire, which is robbery but there was nobody else selling.\n\nLook after that animal of yours. A good beast is worth more than a good axe, and you know I don't say that lightly about axes.\n\nRufus, Eastvale Logging Camp",
}

P:Letter {
  id = "origin_human_eastvale_woodsman_2", stranger = true, delay = 2400,
  when = { origin = "human_eastvale_woodsman", minLevel = 20 },
  from = "Rufus Kettering", subject = "Henrik's boot",
  body = "{name},\n\nA ranger came through camp on her way to Redridge, and over supper she told us about a {class} who'd tracked a whole pack of something nasty through country she wouldn't set foot in, and when she said your name Henrik spilled his stew on the dog.\n\nWe've hung your old bow on the wall over the stove, the one with the split in the grip. Nobody's allowed to touch it, and Henrik has given it a name, which I won't write down because it's rude.\n\nThe north run is clear now, mostly. The murloc came back and bit Henrik's other boot, so now he has a matching pair of grievances. Keep your eyes on the treeline, wherever your trees are now.\n\nRufus",
}

---------------------------------------------------------------------------
-- Sellsword out of Stromgarde
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_stromgarde_sellsword_1", stranger = true, delay = 1200,
  when = { origin = "human_stromgarde_sellsword", minLevel = 6 },
  from = "Captain Orla Breck", subject = "You still owe me for the boots",
  body = "{name},\n\nYou left the company owing me four silver for a pair of boots I lent you at Refuge Pointe, and I've decided I'll take it out of your hide if I ever see you again, so try to make some money down there.\n\nThe Highlands are as you left them. The Syndicate still holds the north, the ogres still hold the hills, and the Horde holds Hammerfall in the east, so there's plenty of war to go round and still no pay for any of it. Three more of the lads went south after you. One of them took my good kettle.\n\nWhoever's paying you now, make sure they pay before the fight and not after. That's the only lesson I ever taught you that stuck.\n\nCaptain Breck",
}

P:Letter {
  id = "origin_human_stromgarde_sellsword_2", stranger = true, delay = 2400,
  when = { origin = "human_stromgarde_sellsword", minLevel = 30 },
  from = "Captain Orla Breck", subject = "Come north",
  body = "{name},\n\nYour name has come up the road to Refuge Pointe, and not in the way a sellsword's name usually does, with a debt or a grudge attached. They say you're good now, properly good, the sort a captain would pay double for.\n\nSo here's an honest offer from a dishonest woman. The Highlands could use you. The Syndicate's been bold this season, and there are farms east of the Pointe that pay their tithe to men in black who never fought for anything in their lives. It's not glorious and the coin's thin, but it's home, and you'd be fighting next to people who remember your face.\n\nThink it over. And I've written off the boots, by the way, so you can't use that as an excuse.\n\nOrla Breck",
}

---------------------------------------------------------------------------
-- Defender of Darkshire's walls
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_darkshire_watch_1", stranger = true, delay = 1200,
  when = { origin = "human_darkshire_watch", minLevel = 6 },
  from = "Agatha Venn", subject = "From the Night Watch",
  body = "{name},\n\nThe watch roster still has your name on it, because nobody in Darkshire has the heart to cross it out. I put a line under it instead, which means away, and not the other thing.\n\nIt's been a wet season. The lamps on the east road keep going out in the fog, and something has been taking the Calders' sheep two at a time, very tidily, and leaving the fleeces folded by the fence. The children think it's funny. The adults do not.\n\nYou were always the one who could keep a torch lit in the rain. I don't know how, and I never asked. Keep it lit wherever you are, and say a word to the Light for the town when you remember us.\n\nAgatha Venn, Night Watch",
}

P:Letter {
  id = "origin_human_darkshire_watch_2", stranger = true, delay = 2400,
  when = { origin = "human_darkshire_watch", cleared = "Shadowfang Keep" },
  from = "Agatha Venn", subject = "Wolves",
  body = "{name},\n\nWe heard you went into Arugal's keep in Silverpine and came out again, and that the mage who called those wolf-men up is finished. The whole Watch stood in the square and listened to the news read out, and nobody said anything for a while.\n\nYou know what walks in Brightwood and under the hills here. I'll not say that one dead mage puts it all right, because I've learned not to say things like that in Darkshire. But it's a start, and it's yours, and the lamps on the east road burned all night without going out, which they haven't done in a month. I'm choosing to take that as a sign.\n\nCome back and stand a watch with us one night. Bring the Light.\n\nAgatha",
}

---------------------------------------------------------------------------
-- Former runner for the Syndicate
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_syndicate_runner_1", stranger = true, delay = 1200,
  when = { origin = "human_syndicate_runner", minLevel = 6 },
  from = "Wilmot Fenn", subject = "Fish prices in Southshore",
  body = "{name},\n\nThis letter is about fish prices, if anyone asks you. Herring is up two copper in Southshore and the eels are thin this year, on account of the cold.\n\nNow that's done with. Some of your old employers came round the inn last month asking after a runner who quit without notice, and I told them you'd drowned off the docks in the spring, which they seemed to like the sound of. One of them had a scar under his ear that I'd know again, so mind it.\n\nDon't write back to the inn. If you need to reach me, leave word with the fishmonger, and ask after eels. I'm too old to be dragged into the hills, and too fond of you to pretend I didn't see you go.\n\nW. F., Southshore",
}

P:Letter {
  id = "origin_human_syndicate_runner_2", stranger = true, delay = 2400,
  when = { origin = "human_syndicate_runner", minLevel = 30 },
  from = "Wilmot Fenn", subject = "More about the eels",
  body = "{name},\n\nThe eels are better this season, thank you for asking.\n\nThe Syndicate have been back to the inn twice, and the second time they weren't asking. They had heard of a {class} making a name in the south and they know very well you didn't drown. The man with the scar sat in the corner and drank one ale for three hours, which is how they tell you they're patient.\n\nI'm not writing to frighten you. You're stronger now than any of them ever expected you to be, and that's precisely why they're nervous. If you ever come up to the hills, come up on your own terms and not theirs, and don't come through Southshore on the main road.\n\nW. F.",
}

---------------------------------------------------------------------------
-- Healer to the People's Militia
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_sentinel_hill_healer_1", stranger = true, delay = 1200,
  when = { origin = "human_sentinel_hill_healer", minLevel = 6 },
  from = "Jory Applewhite", subject = "From the hill",
  body = "Dear {name},\n\nThe lads on the Hill made me write this because I'm the only one with a pencil. They want you to know the bandage roll you left has nearly run out, and we've gone back to using shirts, and Old Sim says his shirts have never been so useful.\n\nWe're short of everything as usual. Bread is three times what it costs in Goldshire, if you can get a cart up the road at all, and the Defias took two wagons at Moonbrook last week. Gryan says we'll manage, which is what he always says.\n\nI still say your prayer over the wounded before I wrap them. I don't know if it works when I say it, but nobody's complained.\n\nJory, for the Militia",
}

P:Letter {
  id = "origin_human_sentinel_hill_healer_2", stranger = true, delay = 2400,
  when = { origin = "human_sentinel_hill_healer", cleared = "The Deadmines" },
  from = "Jory Applewhite", subject = "We're all still here",
  body = "Dear {name},\n\nGryan read the news out on the Hill tonight with his hat in his hand, and he said your name in the middle of it, and the lads cheered so loud that a cow ran off down to the coast. We got her back in the morning, so nobody minded.\n\nI keep thinking about the first winter when you were here, when we lost so many to the fever and the raids, and you sat up with them all and never once said there was no hope. There was hardly any, but you never said so.\n\nWe're all still here, those of us that made it. The Hill is quieter now, and the shirts are going back to being shirts. Light keep you, wherever you're mending folk now.\n\nJory",
}

---------------------------------------------------------------------------
-- Student cast out of Dalaran
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_dalaran_stray_1", stranger = true, delay = 1200,
  when = { origin = "human_dalaran_stray", minLevel = 6 },
  from = "Ferris Ambrel", subject = "The strays' table",
  body = "{name},\n\nThe strays' table at the Blue Recluse is down to four now that you've gone, and Hollis has taken your chair as a matter of principle. He says he'll give it back when you return with a real spellbook rather than the one you copied out of his.\n\nThere's no news from Dalaran, as usual. The Kirin Tor send nothing south but rumours of the rebuilding and the occasional tired courier, and the gates are still shut to the likes of us. Odette swears she saw a violet tower in a dream and has been insufferable about it ever since.\n\nStudy your fundamentals on the road. You were always too quick to skip to the interesting bits, and the interesting bits are where people lose their hands.\n\nFerris",
}

P:Letter {
  id = "origin_human_dalaran_stray_2", stranger = true, delay = 2400,
  when = { origin = "human_dalaran_stray", cleared = "Shadowfang Keep" },
  from = "Ferris Ambrel", subject = "Arugal",
  body = "{name},\n\nI heard about Shadowfang Keep. All of us at the strays' table have, because the Mage Quarter has talked of nothing else for a week.\n\nArugal was a Kirin Tor archmage, {name}. He taught some of the very masters who put us out of the city, and he thought he could answer the Scourge by calling up something wilder in their place. Everyone here is saying it's a lesson about wolves, but it's a lesson about pride, and about clever men who think the rules are for students.\n\nI'm glad it was one of us who put an end to it. Hollis says you can have your chair back, and he means it, which is the nearest he has ever come to a compliment.\n\nFerris",
}

---------------------------------------------------------------------------
-- Gravedigger of Raven Hill
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_raven_hill_gravedigger_1", stranger = true, delay = 1200,
  when = { origin = "human_raven_hill_gravedigger", minLevel = 6 },
  from = "Old Mother Crane", subject = "The spade",
  body = "{name},\n\nYour spade is still leaning on the crypt wall where you left it, and nobody in Raven Hill will touch it, because they say it hums at night. It doesn't. It's the wind in the yews, as it's always been, but I'll not tell them so, as it keeps the grave robbers off.\n\nWe buried the cooper last week, and two of his cousins, and one of them got back up again on the Tuesday. The Night Watch came and dealt with it, very politely, and the widow sent them all a pie.\n\nI know where you go and what you talk to when you go there. I'm not telling you to stop. I'm telling you to count your fingers every evening, and to come home if ever the count is wrong.\n\nMother Crane",
}

P:Letter {
  id = "origin_human_raven_hill_gravedigger_2", stranger = true, delay = 2400,
  when = { origin = "human_raven_hill_gravedigger", cleared = "Razorfen Downs" },
  from = "Old Mother Crane", subject = "What you dug up in the south",
  body = "{name},\n\nA tinker from the south says you went down into the Razorfen Downs, where the quilboar have been making friends with the Scourge, and you put down the lich that was doing the courting. I always said you had the stomach for the dead.\n\nThere is a difference, and I want you to remember it now you're grown and strong. We tend the dead in Raven Hill and we bargain with what whispers, and that's between us and the dark. That lich wanted the dead to stand up and walk for him, and that's not bargaining, that's theft.\n\nYou keep your side of things as you always did. The yews are loud this week, and your spade is still where you left it.\n\nMother Crane",
}

---------------------------------------------------------------------------
-- Beater on the nobles' hunts in Elwynn
---------------------------------------------------------------------------
P:Letter {
  id = "origin_human_elwynn_beater_1", stranger = true, delay = 1200,
  when = { origin = "human_elwynn_beater", minLevel = 6 },
  from = "Dennet Smallbrook", subject = "The boar",
  body = "{name},\n\nLord Gravesend's huntsman is still raging about that boar you kept, and it's been a whole season. He says it was the finest tusker in Elwynn and that you'll hang for it if you ever show your face at the lodge. I told him boars wander, which is true, and he threw a boot at me, which was uncalled for.\n\nThe hunts carry on without you. We beat the brush near Crystal Lake last week and flushed nothing but a family of kobolds with candles, and a viscount fell off his horse into the lake. Nobody laughed until he'd gone, and then nobody stopped.\n\nGood luck out there. Whatever you catch now is yours to keep, and that's worth more than the wages ever were.\n\nDennet",
}

P:Letter {
  id = "origin_human_elwynn_beater_2", stranger = true, delay = 2400,
  when = { origin = "human_elwynn_beater", minLevel = 20 },
  from = "Dennet Smallbrook", subject = "The huntsman's changed his tune",
  body = "{name},\n\nYou'll never credit it. Lord Gravesend's huntsman came back from Stormwind last week, sat down at the lodge fire, and told the whole table that a {class} he once knew as a beater had been doing great things in the wild country, and that he'd always said you had the eye.\n\nHe never said any such thing. He threw a boot at me for less than that. But now he tells the story of the boar as though he'd let you have it out of the goodness of his heart.\n\nThe lords still shoot from the saddle and still miss. Whatever you're tracking out there, I hope it's bigger than a boar and more deserving of a good shot.\n\nDennet",
}
