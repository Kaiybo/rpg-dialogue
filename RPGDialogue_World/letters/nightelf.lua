-- Night elf origin letters: one from home soon after leaving, one later on.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Sentinel scout
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_sentinel_scout_1", from = "Huntress Ilyara Duskwhisper", stranger = true, delay = 1200,
  when = { origin = "nightelf_sentinel_scout", minLevel = 6 },
  subject = "Your post at the Zoram road",
  body = "{name},\n\nYour post on the Zoram road has gone to young Faelis, who jumps at every owl and has twice loosed an arrow at a moonkin that was only minding its own business. I mention this so you will know you were missed, though I would not say so to your face.\n\nThe Warsong orcs have cut another clearing west of Astranaar, and the night we found it the ground was still warm from their fires. We drove them back, but they will return when the snows melt, as they always do.\n\nWatch the strangers you walk among as you once watched the treeline, and remember that a scout who is never seen is a scout who comes home. Elune light your path.\n\nHuntress Ilyara Duskwhisper\nSentinels of Ashenvale",
}

P:Letter {
  id = "origin_nightelf_sentinel_scout_2", from = "Huntress Ilyara Duskwhisper", stranger = true, delay = 2400,
  when = { origin = "nightelf_sentinel_scout", cleared = "Blackfathom Deeps" },
  subject = "Word from Zoram Strand",
  body = "{name},\n\nThe Sentinels at Zoram Strand sent a runner up to Astranaar with news that the Twilight's Hammer in Blackfathom have been thrown into disarray, and they named you among those who went below. I read the report twice to be certain of the name.\n\nThat temple was holy to us before the sea took it, and it has shamed every one of us to see it filled with cultists and naga. You walked into the dark beneath it when wiser elves only watched the water.\n\nThe Faelis I told you of has stopped shooting at moonkin, more or less. I told her the story of what you did, and she has not complained about a night watch since.\n\nHuntress Ilyara Duskwhisper",
}

---------------------------------------------------------------------------
-- Survivor of Hyjal
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_hyjal_survivor_1", from = "Thalanor Starbreeze", stranger = true, delay = 1200,
  when = { origin = "nightelf_hyjal_survivor", minLevel = 6 },
  subject = "From the old shield-line",
  body = "{name},\n\nI heard from a Sentinel in Darnassus that you had taken up the road, and I sat down to write before my hands could talk me out of it. There are not many of us left from the line at the foot of the mountain, and I like to know where the rest of you have gone.\n\nMy knee aches in the rain now, which it never did in nine thousand years. The healers tell me this is only what mortals feel, and I tell them I would rather it were a curse, because a curse might lift.\n\nWe saw the World Tree give up everything it had given us, and we lived. Do not waste the years it bought you sitting still, as I have been doing.\n\nThalanor Starbreeze, Rut'theran Village",
}

P:Letter {
  id = "origin_nightelf_hyjal_survivor_2", from = "Thalanor Starbreeze", stranger = true, delay = 2400,
  when = { origin = "nightelf_hyjal_survivor", minLevel = 40 },
  subject = "Borrowed years",
  body = "{name},\n\nTravelers who come in on the boat from Auberdine sometimes speak of a {race} {class} who has gone into places the rest of us would not, and I have decided that it is you, whether or not it is.\n\nI went back to Hyjal last spring, as far as the Cenarion druids would let me pass. The burned ground is green again near the foot of the mountain, though nothing grows where the demon fell. I stood there for an hour and found I had nothing to say to it.\n\nYou spend your borrowed years better than I spend mine, {name}. Write to an old soldier when you can, and tell me about a place I have never seen.\n\nThalanor Starbreeze",
}

---------------------------------------------------------------------------
-- Initiate of the Cenarion Circle (Druid)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_druid_initiate_1", from = "Arch Druid Selanthe Moonbough", stranger = true, delay = 1200,
  when = { origin = "nightelf_druid_initiate", minLevel = 6 },
  subject = "On leaving the grove",
  body = "{name},\n\nYou left Shadowglen before the moon turned, and I found your bedroll still rolled beneath the great oak, as neatly as if you meant to come back for it by evening. I have left it there.\n\nThe Gnarlpine furbolgs were sick again this season, and two of the younger initiates wept to see them turn on us. I reminded them that a sickness in the wood is not the wood's fault, and you would do well to remember it yourself out there.\n\nA druid's first lessons are learned in a grove and the rest are learned everywhere else. Learn the shapes of the land you walk through, and do not let the younger races tell you that the world simply is as it is.\n\nArch Druid Selanthe Moonbough, Shadowglen",
}

P:Letter {
  id = "origin_nightelf_druid_initiate_2", from = "Arch Druid Selanthe Moonbough", stranger = true, delay = 2400,
  when = { origin = "nightelf_druid_initiate", cleared = "Wailing Caverns" },
  subject = "The Fang",
  body = "{name},\n\nNews of the Wailing Caverns has reached the Circle, and with it your name. The Druids of the Fang were taught by our own, and when their dream soured we were slow to admit what they had become. That they were put down by a {class} of Shadowglen is a strange comfort, and an uncomfortable one.\n\nDo not take pride in it, and do not take shame in it either. What a druid must do to protect the land is sometimes the very thing that grieves the land most.\n\nWhen you dream tonight, if you dream as we do, think of Naralex kindly. He wanted the Barrens green, and there are worse things to want.\n\nArch Druid Selanthe Moonbough",
}

---------------------------------------------------------------------------
-- Novice of the Temple of the Moon (Priest)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_priestess_1", from = "Sister Aerynth Silvermoon", stranger = true, delay = 1200,
  when = { origin = "nightelf_priestess", minLevel = 6 },
  subject = "From the Temple",
  body = "Dear {name},\n\nThe fountain in the Temple courtyard was cleaned this week for the first time in a season, and the novices found three coins, a hairpin and a very confused frog in it. I thought you would want to know, since you always insisted that the frog was real.\n\nThe High Priestess spoke to us of patience at the last full moon. She said Elune answers in her own season, and that a priestess who demands an answer has stopped listening. I thought of you when she said it, and I hope you will not be cross with me for that.\n\nPray when you are tired and when you are frightened, and also when you are neither, which is the hardest time of all.\n\nYour sister in the Moon,\nAerynth",
}

P:Letter {
  id = "origin_nightelf_priestess_2", from = "Sister Aerynth Silvermoon", stranger = true, delay = 2400,
  when = { origin = "nightelf_priestess", cleared = "Blackfathom Deeps" },
  subject = "The drowned temple",
  body = "Dear {name},\n\nThe priestesses who came back from Zoram Strand say that the drowned temple in Blackfathom is quieter now, and that you were among those who made it so. I lit a candle for you at the moonwell and another for the temple, since I could not decide which of you needed it more.\n\nOur people prayed under that roof when it still stood above the waves, and there is a cracked statue of Elune down there that nobody has seen clearly in ten thousand years. Tell me, if you will, whether her face is still there.\n\nThe frog has returned to the fountain, by the way. The novices have named him Archimonde, which I find very funny and the High Priestess does not.\n\nAerynth",
}

---------------------------------------------------------------------------
-- Watcher on the Auberdine coast (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_auberdine_watch_1", from = "Sentinel Kaelira Nightwind", stranger = true, delay = 1200,
  when = { origin = "nightelf_auberdine_watch", minLevel = 6 },
  subject = "The beach is still there",
  body = "{name},\n\nYou will be pleased to hear that the beach is still there, along with every murloc that ever lived on it. A whole clan of them came up out of the surf near the Bashal'Aran ruins last week and made off with a fisherman's nets, his boots and very nearly the fisherman.\n\nThe watch is one blade short since you went south, and I am the one who has to stand your hours. I have decided to resent you for it only on cold nights, which on this coast is most of them.\n\nKeep your shield high and your mouth shut until you know who you're talking to, and you'll do well among the humans.\n\nKaelira Nightwind, Auberdine",
}

P:Letter {
  id = "origin_nightelf_auberdine_watch_2", from = "Sentinel Kaelira Nightwind", stranger = true, delay = 2400,
  when = { origin = "nightelf_auberdine_watch", cleared = "Blackfathom Deeps" },
  subject = "Something you'll want to hear",
  body = "{name},\n\nThe ships from Zoram brought word that you went down into Blackfathom Deeps and came back up again, which is more than can be said for a good many who tried. The old watch had a cup of moonberry wine on your behalf, and Thorvanar got up on the table and told the story wrong three times.\n\nEverything foul in that sea seems to wash up on our shore sooner or later, so I like to think you've saved me a few long nights here as well as down there.\n\nThe murlocs are back, of course. They are always back. I am beginning to think they are the only thing in Darkshore that will outlast the elves.\n\nKaelira",
}

---------------------------------------------------------------------------
-- Nightsaber rider of Teldrassil (Hunter)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_nightsaber_rider_1", from = "Mother Lysara Swiftpaw", stranger = true, delay = 1200,
  when = { origin = "nightelf_nightsaber_rider", minLevel = 6 },
  subject = "From Dolanaar",
  body = "{name},\n\nYour grandmother's old cat came to the door every evening for a week after you left, and sat on the step waiting until the stars were out. I told her you had gone to see the world, and she looked at me as though I were a fool, which in fairness is how she looks at everyone.\n\nThe webwood spiders are thick around the lake this year, and the young hunters of Dolanaar come home with sticky hair and big stories. Your brother killed one twice his size, or so he says, and I have chosen to believe him.\n\nFeed your companion before you feed yourself, as every hunter in our family has done. I know you will, but I am your mother and I am obliged to say it.\n\nYour mother, Lysara",
}

P:Letter {
  id = "origin_nightelf_nightsaber_rider_2", from = "Mother Lysara Swiftpaw", stranger = true, delay = 2400,
  when = { origin = "nightelf_nightsaber_rider", minLevel = 20 },
  subject = "A litter at the den",
  body = "{name},\n\nThere are four new cubs at the old den beneath the hill, and your father has been out there every night pretending he is only checking the snares. One of them has a white mark on its brow just like the cat you found as a child, and I could not help thinking of you.\n\nThe Sentinels who pass through say you are making a name for yourself in the eastern kingdoms, and that you go about with a beast at your side whether the humans like it or not. Good. They ought to see how we do things.\n\nCome home when the road lets you. Your room is just as you left it, except that the old cat sleeps on the bed now and will not hear a word against it.\n\nYour mother",
}

---------------------------------------------------------------------------
-- Trained by the Watchers (Rogue)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_watcher_trained_1", from = "V.", stranger = true, delay = 1200,
  when = { origin = "nightelf_watcher_trained", minLevel = 6 },
  subject = "No subject",
  body = "{name},\n\nYou will not know who left this in your box, and that is as it should be. I am told you passed the barrow roads without being stopped and that the Sentinel at the gate never saw you go, which is the first thing you have done that I approve of.\n\nThere is a reason the Watchers do not speak of their work in Darnassus. Our people like to imagine that every danger is out in the world, and they do not care to be reminded of what we keep locked away beneath it.\n\nKeep your eyes open and your letters short. Burn this one, and do not try to write back, because there is no one at this address.\n\nV.",
}

P:Letter {
  id = "origin_nightelf_watcher_trained_2", from = "V.", stranger = true, delay = 2400,
  when = { origin = "nightelf_watcher_trained", minLevel = 30 },
  subject = "Observed",
  body = "{name},\n\nYou have been watched these past months, as you no doubt suspected, and I am obliged to report that you have been careless only twice, once in a tavern in Menethil and once on a road in the Wetlands when you stopped to help a drunk dwarf out of a ditch. The first was foolish, and the second I will not hold against you.\n\nThe Watchers have long memories and very little patience for those who boast of their training, so I am glad to say you have not. Most who leave us cannot resist telling the first pretty stranger what they once were.\n\nYou may yet be useful. Do not mistake that for praise.\n\nV.",
}

---------------------------------------------------------------------------
-- Raised at Feathermoon Stronghold
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_feathermoon_raised_1", from = "Celwen Brightleaf", stranger = true, delay = 1200,
  when = { origin = "nightelf_feathermoon_raised", minLevel = 6 },
  subject = "The boat came",
  body = "{name},\n\nThe supply boat came in on the new moon as it always does, and I stood on the dock out of habit looking for you before I remembered you were the one who had gone off on it. The rowers asked after you, and old Pelial made a joke I won't repeat because your mother may read this.\n\nThe Gordunni have been quiet on the mainland, which worries the Sentinels more than when they are loud. They have doubled the night watch on the shore, so I am up half the night and very cross in the mornings.\n\nWrite and tell me what a city looks like. I have only ever seen the stronghold and the sea, and I am beginning to think the rest of the world is a story the sailors made up.\n\nCelwen",
}

P:Letter {
  id = "origin_nightelf_feathermoon_raised_2", from = "Celwen Brightleaf", stranger = true, delay = 2400,
  when = { origin = "nightelf_feathermoon_raised", minLevel = 40 },
  subject = "Come and see the isle",
  body = "{name},\n\nThe Sentinels say you are strong enough now to walk Feralas on your own, and that you might pass this way if anyone thought to ask you. So I am asking you, in my own hand, before Captain Shandris thinks of it and makes it an order.\n\nThe ogres burned one of the camps on the mainland in the autumn, and a hippogryph came home without its rider. We have been sad here this season, and a familiar face on the dock would do more for the isle than any supply boat.\n\nThe great trees on the coast are as tall as you remember them, and the sea is as cold. I have not changed at all, except that I now know how to sail, so you have no excuse not to come.\n\nCelwen, Sardor Isle",
}

---------------------------------------------------------------------------
-- Kin of a sleeping druid
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_dreamer_kin_1", from = "Aunt Mirelle Thornbranch", stranger = true, delay = 1200,
  when = { origin = "nightelf_dreamer_kin", minLevel = 6 },
  subject = "I swept the house",
  body = "{name},\n\nI have been sweeping your father's house in the Craftsmen's Terrace as you asked, and telling him the news as you used to. I am not as good at it as you were, because I do not know what he cares to hear. Yesterday I told him the price of moonberries had gone up, and I felt very foolish.\n\nThe druids say that sleepers in the Dream sometimes stir when someone they love is far away. They also say they do not know, which I find more honest.\n\nGo carefully out there, and come back to tell him your stories yourself. You will tell them better than I can, and I would like to stop talking to an empty room.\n\nYour aunt, Mirelle",
}

P:Letter {
  id = "origin_nightelf_dreamer_kin_2", from = "Aunt Mirelle Thornbranch", stranger = true, delay = 2400,
  when = { origin = "nightelf_dreamer_kin", cleared = "Wailing Caverns" },
  subject = "About the dreamer in the Barrens",
  body = "{name},\n\nThe druids came by the house to tell me you had been to the Wailing Caverns and woken the dreamer there, the one called Naralex. I sat down on your father's step and did not get up for some time.\n\nI know it is not the same, and that the Barrow Dens are not that cave, and that your father went to sleep for good reasons and not bad ones. Still, I could not help thinking that if one dreamer can be called home, then perhaps another can too.\n\nI told him about it as well, naturally. I think he would have liked to hear it, and I think he would be proud, so I have decided to be proud for him until he can do it himself.\n\nMirelle",
}

---------------------------------------------------------------------------
-- Grove-tender of Moonglade (Druid)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_moonglade_keeper_1", from = "Fennor Oakwhistle", stranger = true, delay = 1200,
  when = { origin = "nightelf_moonglade_keeper", minLevel = 6 },
  subject = "The lake is as calm as ever",
  body = "{name},\n\nThe lake at Nighthaven is as calm as you left it, though the same cannot be said for the furbolgs on the Timbermaw path. They grumble at the druids who come through from Felwood and say we carry the rot in on our boots, and I am not sure they are wrong.\n\nI tend your stretch of the path now as well as mine, and I have discovered that you were hiding a whole patch of moonleaf behind the barrow. I have picked it all, and I am not sorry.\n\nWhen you reach Felwood, watch the water before you drink it and do not trust anything that smiles. Remulos asked after you, which is more than he ever does for me.\n\nFennor, Nighthaven",
}

P:Letter {
  id = "origin_nightelf_moonglade_keeper_2", from = "Fennor Oakwhistle", stranger = true, delay = 2400,
  when = { origin = "nightelf_moonglade_keeper", minLevel = 30 },
  subject = "A report you did not ask for",
  body = "{name},\n\nThe Circle tells me your reports from the road are good, and I have been asked to stop sulking about it. So, in the spirit of fellowship, here is a report of my own.\n\nThe moonleaf has come back behind the barrow, and I have left it alone for you. A young furbolg walked into Nighthaven on his own last week to trade, which has not happened since before the corruption came south. Keeper Remulos watched him the whole time and said nothing, which I take to mean he was pleased.\n\nThe sickness in Felwood has not spread any closer, but it has not gone back either. When you are ready to face it, the glade will still be here to come home to afterward.\n\nFennor",
}

---------------------------------------------------------------------------
-- Moonwell keeper of Astranaar (Priest)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_astranaar_moonwell_1", from = "Priestess Yaela Shademoon", stranger = true, delay = 1200,
  when = { origin = "nightelf_astranaar_moonwell", minLevel = 6 },
  subject = "The wells of Astranaar",
  body = "{name},\n\nThe moonwell by the inn has kept its light since you left, though the one on the western road dimmed for three nights after a skirmish with the Warsong. I sat with it until it brightened, and I thought of how you used to sing to them when you believed nobody was listening.\n\nWe took in an orc boy with an arrow in his side last week. The Sentinels were furious, and so was he, but he drank the water and lived, and in the morning he was gone. I do not know if I did right.\n\nYou always said that Elune does not choose sides. I hope the world beyond the forest has been kinder to that idea than Ashenvale has.\n\nYaela, Astranaar",
}

P:Letter {
  id = "origin_nightelf_astranaar_moonwell_2", from = "Priestess Yaela Shademoon", stranger = true, delay = 2400,
  when = { origin = "nightelf_astranaar_moonwell", cleared = "Blackfathom Deeps" },
  subject = "Light in the deep",
  body = "{name},\n\nThe Sentinels say that you went down into Blackfathom and that the cultists there are scattered, and that the old moonwell at the bottom of the temple has been seen to shine again by those who came back up. I have no way of knowing if that last part is true, but I chose to believe it the moment I heard it.\n\nThose wells were tended by priestesses long before Astranaar was built. I like to think one of them, ten thousand years gone, would be glad to know a keeper went down to visit.\n\nThe orc boy has not come back. I still pray for him, and for you, and for the wells, in no particular order.\n\nYaela",
}

---------------------------------------------------------------------------
-- Satyr hunter of Felwood (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_satyr_hunter_1", from = "Sentinel Daelis Grimwatch", stranger = true, delay = 1200,
  when = { origin = "nightelf_satyr_hunter", minLevel = 6 },
  subject = "Still hunting",
  body = "{name},\n\nWe tracked a band of satyrs out of the Jadefire glens last month and lost two Sentinels before the ground was clean. One of them carried a dagger with a Highborne crest worn smooth on its hilt, which I have kept and which I will not show to anyone.\n\nThe patrol has had to go on without you, and it has. I tell you this so you will not feel needed, because a warrior who feels needed in two places does poorly in both.\n\nThe debt you spoke of will still be waiting when you come back to settle it. Make sure you are alive to do so.\n\nDaelis, Talonbranch Glade",
}

P:Letter {
  id = "origin_nightelf_satyr_hunter_2", from = "Sentinel Daelis Grimwatch", stranger = true, delay = 2400,
  when = { origin = "nightelf_satyr_hunter", minLevel = 30 },
  subject = "The Jadefire glens",
  body = "{name},\n\nWord comes to Talonbranch that you have grown dangerous out there, which is the right word for a warrior and the wrong word for a guest. I hope you are only the first kind.\n\nThe Jadefire satyrs have pushed north toward Irontree Woods, and the trees there are dying faster than we can count them. Some of the young Sentinels have begun to say that the satyrs cannot be reasoned with because they were never really elves at all. I set them right, as you would have, and I made them run the glade twice for it.\n\nWhen you are ready to come back to this work, Felwood will still need you, and I will still not tell you so in person.\n\nDaelis",
}

---------------------------------------------------------------------------
-- Tracker of the Feralas wilds (Hunter)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_feralas_tracker_1", from = "Orvash Greenmantle", stranger = true, delay = 1200,
  when = { origin = "nightelf_feralas_tracker", minLevel = 6 },
  subject = "Tracks in the mud",
  body = "{name},\n\nThe yetis came down from the hills early this year, and I followed a pair of them halfway to the Twin Colossals before I realized I had no one to bet with over which way they would turn. You owe me nothing for it, but I thought you should know I lost a wager with myself.\n\nThe Sentinels at Feathermoon have given your old trails to a youngster from Darnassus who walks through the ferns like a kodo in a pottery shop. She will learn, or the forest will teach her.\n\nCount the trees you see out there, as you always meant to. I have a feeling none of them will be as old as ours, but I would like to hear about them all the same.\n\nOrvash, Feathermoon",
}

P:Letter {
  id = "origin_nightelf_feralas_tracker_2", from = "Orvash Greenmantle", stranger = true, delay = 2400,
  when = { origin = "nightelf_feralas_tracker", minLevel = 40 },
  subject = "The wild hippogryphs",
  body = "{name},\n\nThe wild hippogryphs nested on the bluffs again this season, more of them than I have seen in a century. I climbed up to count the eggs and one of the mothers nearly took my ear off, which you would have found very amusing.\n\nI hear you are ready for the deep forests now. If you come back to Feralas, mind the ogres on the old road and the ruins in the west, which I will not go near, and which I advise you not to go near unless you have friends at your back.\n\nThe youngster from Darnassus has stopped walking like a kodo. She now walks like a slightly smaller kodo, which I am counting as progress.\n\nOrvash",
}

---------------------------------------------------------------------------
-- Smuggler out of Auberdine (Rogue)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_nightelf_auberdine_smuggler_1", from = "Tavrin Saltmoon", stranger = true, delay = 1200,
  when = { origin = "nightelf_auberdine_smuggler", minLevel = 6 },
  subject = "About the cargo",
  body = "{name},\n\nYou left in such a hurry that you forgot to tell me which crate of silks was meant for Menethil and which was meant for that dwarf with the one eyebrow. I guessed, and I guessed wrong, and the dwarf now believes I am a thief, which is unfair since I was only being a smuggler.\n\nThe harbor guards in Menethil have a new sergeant who reads the manifests, which is a dreadful habit in a sergeant. I have taken up honest fishing for a while until things settle, and I hate it.\n\nWherever you are, keep your purse close and your friends closer, because the second sort is more likely to empty the first.\n\nYour former partner,\nTavrin",
}

P:Letter {
  id = "origin_nightelf_auberdine_smuggler_2", from = "Tavrin Saltmoon", stranger = true, delay = 2400,
  when = { origin = "nightelf_auberdine_smuggler", cleared = "The Deadmines" },
  subject = "Competition",
  body = "{name},\n\nA sailor in Menethil tells me that the Defias are finished in Westfall and that the big ship in the mine went down with its captain on it. He also tells me it was you who sank it. I laughed until I fell off my stool, because I remember the day you told me you would never set foot on a boat that was not paid for.\n\nThe Brotherhood was bad for honest smugglers anyway. They frightened the merchants, and frightened merchants count their crates twice.\n\nI am still fishing, if you can believe it. I have caught a great many fish and no money, and I have begun to understand why our people look down on the trade.\n\nTavrin",
}
