-- Origin letters: Forsaken. Two per origin; the first comes once you've gone out into the world,
-- the second when you've done something that background would care about.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Once a soldier of Lordaeron
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_lordaeron_soldier_1", from = "Sergeant Aldous Crane", stranger = true, delay = 1200,
  when = { origin = "forsaken_lordaeron_soldier", minLevel = 6 },
  subject = "Roll call",
  body = "{name},\n\nI am told you have left the Undercity and gone out walking in the daylight, which I suppose is what the Dark Lady wants of us. I have been standing the same stretch of wall above the sewers for a month, and I can report that the rats are more disciplined than the new recruits.\n\nI found three more of our old company this season. Pell is a guard at the Brill crossroads, Harlow works the lift and does not remember his own name, and young Witt is still with the Scourge in the Plaguelands, so I suppose he counts as missing rather than dead.\n\nIt is a strange thing to keep a roll for a company that has already been wiped out twice. Answer when you can, so I can put a mark by your name.\n\nSergeant Aldous Crane, late of the Lordaeron Guard",
}

P:Letter {
  id = "origin_forsaken_lordaeron_soldier_2", from = "Sergeant Aldous Crane", stranger = true, delay = 2400,
  when = { origin = "forsaken_lordaeron_soldier", minLevel = 40 },
  subject = "The gate",
  body = "{name},\n\nI walked back to the gate where we fell last week. Nobody had told me to, and nobody stopped me, and I stood there for an hour waiting to feel something. The stones are still black where the ghouls broke through, and there is a sparrow's nest in the gatehouse now, which seemed very rude of it.\n\nYour name has reached the Undercity a good many times this year. The guards at the Royal Quarter speak of you as if you were a captain, and I have not corrected them, because it is better than anything the old King ever called either of us.\n\nWe held a gate that didn't matter, and now you hold whatever you choose to. That seems a fair trade for dying.\n\nCrane",
}

---------------------------------------------------------------------------
-- Once a farmer near Brill
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_brill_farmer_1", from = "Mags Thorley", stranger = true, delay = 1200,
  when = { origin = "forsaken_brill_farmer", minLevel = 6 },
  subject = "Your barley field",
  body = "{name},\n\nIt's Mags, from the farm with the blue door that's no longer blue, or for that matter a door. I've taken a room above the Gallows' End Tavern, and Renee lets me sit by the fire, though neither of us feels the warmth and we only do it out of habit.\n\nYour field has gone over to thistle and something purple that the apothecaries say is not a plant at all. The Scarlets ride through now and then and burn whatever looks suspicious, which in Tirisfal is everything, so there's not much left to farm even if either of us still cared to.\n\nI walk past it on my way to the graveyard sometimes. I thought you might like to know somebody still looks at it.\n\nMags Thorley, Brill",
}

P:Letter {
  id = "origin_forsaken_brill_farmer_2", from = "Mags Thorley", stranger = true, delay = 2400,
  when = { origin = "forsaken_brill_farmer", minLevel = 20 },
  subject = "I planted something",
  body = "{name},\n\nYou'll laugh, though I don't know if we still can, but I dug a patch of your old field last week and put down a row of barley. I bought the seed from a goblin who swore it would grow in plagued earth, and so far the only thing it has grown is my suspicion of goblins.\n\nThey're saying in Brill that you've gone off and done things that farmers don't do, and that the Executor knows your name. I told Renee I knew you when you still swore at the crows, and she bought me a drink I couldn't taste, which I suppose is the thought that counts.\n\nIf the barley comes up, I'll keep a stalk for you. If it doesn't, I'll keep a thistle.\n\nMags",
}

---------------------------------------------------------------------------
-- Remembers serving the Scourge
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_scourge_remembered_1", from = "Brother Osric", stranger = true, delay = 1200,
  when = { origin = "forsaken_scourge_remembered", minLevel = 6 },
  subject = "From the Deathknell crypts",
  body = "{name},\n\nYou won't remember me, though I remember you, because we marched in the same rank for the Lich King when neither of us had a name. You walked to my left, and we burned a mill outside Corin's Crossing together, and I have spent every night since trying to forget the sound the millstone made.\n\nThe Dark Lady says it wasn't us, and on good nights I believe her. On bad nights I sit in the crypts at Deathknell and listen to the newly risen scream themselves awake, and I wonder if they'll remember what they did as well.\n\nI'm writing because you're the only other one I know who carries the same weight. Don't answer if you'd rather not. I only wanted someone to know I'm still here.\n\nOsric",
}

P:Letter {
  id = "origin_forsaken_scourge_remembered_2", from = "Brother Osric", stranger = true, delay = 2400,
  when = { origin = "forsaken_scourge_remembered", cleared = "Razorfen Downs" },
  subject = "The lich in the south",
  body = "{name},\n\nThe deathstalkers say the Scourge's lich in Kalimdor has been put down in the Razorfen Downs, and that you were there when it fell. I wonder whether you heard the old voice in that place, the cold one at the back of the skull, and whether you knew it for what it was.\n\nI have been thinking about why it matters so much to me. I think it's because for once we went to the Scourge, instead of the Scourge coming to us, and we came back out of it with our own names.\n\nI slept through the night after the news came, which I haven't done since I rose. I thought you should know that it was worth something to someone.\n\nOsric",
}

---------------------------------------------------------------------------
-- Once an apprentice of Dalaran (Mage)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_dalaran_apprentice_1", from = "Edwina Quell", stranger = true, delay = 1200,
  when = { origin = "forsaken_dalaran_apprentice", minLevel = 6 },
  subject = "Your notes",
  body = "{name},\n\nI was going through the rubble of the old dormitory on a scavenging trip into Alterac with the Royal Apothecaries, and you won't believe what I found under a fallen beam. It was your treatise on minor conjuration, with the coffee stain on the third page and my rude comment in the margin still perfectly legible.\n\nThe human magi have put a great glowing barrier over the ruins, and they don't take kindly to visitors with grey skin, so I couldn't stay long. Still, I thought you'd like to know that your terrible handwriting has outlived both of us.\n\nThe Magic Quarter in the Undercity is cold, but the books are dry. Come and argue with me about ley lines when you're tired of hitting things.\n\nEdwina Quell, formerly of the Violet Citadel",
}

P:Letter {
  id = "origin_forsaken_dalaran_apprentice_2", from = "Edwina Quell", stranger = true, delay = 2400,
  when = { origin = "forsaken_dalaran_apprentice", cleared = "Shadowfang Keep" },
  subject = "Arugal",
  body = "{name},\n\nSo Arugal is finished. I remember him from the Citadel, you know, a tall man with a sour face who always asked for the restricted section and was usually granted it. He gave a lecture on summoning once that put half our year to sleep, and I would never have guessed he'd end up as a madman howling in a keep full of wolves.\n\nIt makes you wonder how many of our masters had something like that in them, waiting for the right catastrophe. It makes me wonder about myself, if I'm honest, and I'd rather not.\n\nWell done, anyway. I've crossed his name off the list of Dalaran faculty I still mean to write to, which was a short list to begin with.\n\nEdwina",
}

---------------------------------------------------------------------------
-- Once a priest of Lordaeron's chapels (Priest)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_chapel_priest_1", from = "Wendel Harrow", stranger = true, delay = 1200,
  when = { origin = "forsaken_chapel_priest", minLevel = 6 },
  subject = "From your old parish",
  body = "{g:Father|Mother}, or whatever we're to call you now,\n\nI was your sexton at the chapel by Cold Hearth Manor, and I rang the bell for your sermons for eleven years. I rose a few months after you, and I've been sweeping the floor of the Undercity's chapel since, because I don't know how to do anything else.\n\nThe old chapel is a ruin. The Scarlets put a torch to it last spring, saying it was tainted, and I suppose they were right, since the congregation is now buried in the yard and some of them won't stay buried.\n\nI hear the Light still answers you, even if it burns. I'm glad. Somebody ought to keep listening for it, and I was never much good at anything but the bell.\n\nWendel Harrow, sexton",
}

P:Letter {
  id = "origin_forsaken_chapel_priest_2", from = "Wendel Harrow", stranger = true, delay = 2400,
  when = { origin = "forsaken_chapel_priest", cleared = "Scarlet Monastery" },
  subject = "The monastery",
  body = "{name},\n\nThey say you went into the Scarlet Monastery and walked out again, which is more than most of us managed while we were alive. I used to dream of seeing its chapel, you know, back when it was a holy place and the pilgrims came up from Southshore with their candles.\n\nI hope you looked at the windows while you were there. They were the finest glass in Lordaeron, and the men who made them believed every word you used to preach.\n\nThe Crusade will say the Light abandoned you for what you did there. I'd say the Light stood beside you while you did it, since it still answers when you call, and they'll have to explain that to themselves.\n\nWendel",
}

---------------------------------------------------------------------------
-- A Silver Hand knight, risen (Paladin)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_risen_knight_1", from = "Dame Ysolde Marrow", stranger = true, delay = 1200,
  when = { origin = "forsaken_risen_knight", minLevel = 6 },
  subject = "Another one",
  body = "{g:Brother|Sister} of the Hand,\n\nThe apothecaries told me that another of the order had risen and that the Light still answered you. I didn't believe them, because they lie for sport, so I went to the Undercity's chapel to see for myself, and the priest there showed me the burns on the floor where you knelt.\n\nI took my vows at Stratholme in the year of the second war. I died there too, though not, I think, in the way Uther would have wanted to hear about. The Light comes to me as well, and it comes like a hot iron, and every morning I accept it anyway.\n\nThere are not many of us, and the Dark Lady does not trust us. Write to me at the Sepulcher if you ever want to compare scars.\n\nDame Ysolde Marrow",
}

P:Letter {
  id = "origin_forsaken_risen_knight_2", from = "Dame Ysolde Marrow", stranger = true, delay = 2400,
  when = { origin = "forsaken_risen_knight", minLevel = 30 },
  subject = "What the Light wants",
  body = "{name},\n\nI've been told that you've met paladins of the living out in the world, and that some of them drew steel on you the moment they saw the glow in your hands. I've had the same welcome in Hillsbrad. It's an odd feeling, being called an abomination by someone reciting your own oath back at you.\n\nI've decided the Light doesn't care what we are. It cares what we do with it, and it seems to judge both the living and the dead on the same scale, which is more than the living ever manage.\n\nKeep swearing the words, {name}. They meant something once, and they might again, if enough stubborn corpses keep saying them.\n\nYsolde",
}

---------------------------------------------------------------------------
-- Deathstalker recruit (Rogue)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_deathstalker_recruit_1", from = "Deathstalker Vane", stranger = true, delay = 1200,
  when = { origin = "forsaken_deathstalker_recruit", minLevel = 6 },
  subject = "Orders, of a sort",
  body = "Recruit,\n\nYou've left the Undercity, and you didn't tell me first, which is good, because a deathstalker who announces where she's going is one who ends up on a Scarlet pyre. I'll assume it was a test and you passed it.\n\nThe Crusade is pushing toward Brill again from the Scarlet Watch Post, and Executor Zygand has us marking every rider who comes along the north road. Silverpine is worse, where Arugal's worgen are thick around Pyrewood and the Sepulcher loses a scout every fortnight.\n\nI have no orders for you yet. Keep your blade clean and your mouth shut, and listen in every inn you pass. You'll hear from me when the Dark Lady needs you.\n\nVane",
}

P:Letter {
  id = "origin_forsaken_deathstalker_recruit_2", from = "Deathstalker Vane", stranger = true, delay = 2400,
  when = { origin = "forsaken_deathstalker_recruit", cleared = "Shadowfang Keep" },
  subject = "Shadowfang",
  body = "Recruit,\n\nThe Sepulcher sent word that Shadowfang Keep has been opened and Arugal is dead. It also sent your name, which is not how I prefer to learn things about my own recruits, though I can hardly fault you for being discreet.\n\nWe lost two deathstalkers in that keep before you went in, and Belmont's body was never found. If you saw a grey cloak with a silver clasp on any of the corpses in there, I'd like to know, and if you didn't, I'd rather not.\n\nHigh Executor Hadrec has asked about you. I told him you were adequate, which is the highest praise I give, and I'll thank you not to let it go to your head.\n\nVane",
}

---------------------------------------------------------------------------
-- Cult of the Damned, before death (Warlock)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_cult_remnant_1", from = "Apothecary Lisbeth Crowe", stranger = true, delay = 1200,
  when = { origin = "forsaken_cult_remnant", minLevel = 6 },
  subject = "Your file",
  body = "{name},\n\nThe Royal Apothecary Society keeps a file on every Forsaken who once wore the Cult's robes, and yours has been passed to me. I am obliged to tell you this, and I am also obliged to tell you that the file is very thick.\n\nWe will want to speak with you about what you remember of the Cult's work in Andorhal and the grain stores. Not today, and not by force, but soon, because the Scourge still uses those methods and we would very much like to use them back.\n\nUntil then, go where you like and kill what you like, so long as it isn't ours. The Dark Lady has given you a second life, and my department has given you a reading list.\n\nApothecary Lisbeth Crowe, Royal Apothecary Society",
}

P:Letter {
  id = "origin_forsaken_cult_remnant_2", from = "Apothecary Lisbeth Crowe", stranger = true, delay = 2400,
  when = { origin = "forsaken_cult_remnant", minLevel = 30 },
  subject = "An amendment to your file",
  body = "{name},\n\nI have added a page to your file. It lists the things you have done for the Forsaken since we last wrote, and it is, I am pleased to say, nearly as thick as the page listing the things you did for the Lich King.\n\nMaster Faranell does not believe in redemption, and neither do I, strictly speaking. We believe in usefulness, which is easier to measure and does not require anyone to forgive anything. By that measure, you are doing well.\n\nNeither of us has to like the other. But I sleep easier knowing that what you learned in the Cult is pointed in the right direction now, and I don't sleep easily about much.\n\nLisbeth Crowe",
}

---------------------------------------------------------------------------
-- Once a soldier of the Scarlet Crusade (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_scarlet_turned_1", from = "Gerrit Vos", stranger = true, delay = 1200,
  when = { origin = "forsaken_scarlet_turned", minLevel = 6 },
  subject = "I was in your company",
  body = "{name},\n\nWe served under the same lieutenant at the Scarlet Watch Post, you and I, and we both burned the same farms near Solliden, though I never knew your name in life. I caught the plague a month after you did. I'm told I screamed for the Light the whole way down, which is a story I'd prefer you didn't repeat.\n\nI'm in Brill now, mending armour for the guards. Some of the plate I mend has the red sunburst scraped off it, and I always wonder whose it was.\n\nThe Crusade still rides past the Agamand Mills, and they still burn what they find. They'd burn us both twice over if they knew who we used to be. Watch your back.\n\nGerrit Vos, Brill",
}

P:Letter {
  id = "origin_forsaken_scarlet_turned_2", from = "Gerrit Vos", stranger = true, delay = 2400,
  when = { origin = "forsaken_scarlet_turned", cleared = "Scarlet Monastery" },
  subject = "Our old masters",
  body = "{name},\n\nSo you've been to the Monastery. I heard it from a deathstalker in the Gallows' End, and I had to sit down, which is a strange thing to need when your legs don't tire.\n\nI used to dream of being posted there. Every young recruit did, polishing the chapel's steps for the Commander and the High Inquisitor and believing that a holy war needed scrubbed floors. Now you've walked those floors with blood on your boots, and the Commander, from what I hear, has had a very poor day.\n\nI don't know if you did it for the Dark Lady or for yourself. I'd like to think it was a bit of both, and a bit for all of us they burned.\n\nGerrit",
}

---------------------------------------------------------------------------
-- Once in the Hillsbrad militia (Warrior)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_hillsbrad_militia_1", from = "Corporal Tobias Fenn", stranger = true, delay = 1200,
  when = { origin = "forsaken_hillsbrad_militia", minLevel = 6 },
  subject = "The watch at Tarren Mill",
  body = "{name},\n\nThe watch has been short a pitchfork since you left, and I've had to take your turn on the north wall as well as mine. The Southshore lot came up the road again last week waving their banners, and we waved ours back, and then everybody went home without anyone being killed, which is practically a festival in these hills.\n\nYou'll remember the Hillsbrad Fields and the old Ashworth orchard. The orchard's gone to rot, but the apples still fall every autumn, and the deathguards use them for target practice.\n\nI keep thinking that we joined the militia to stop the dead from taking Tarren Mill, and now we're the dead and it's ours. Somebody up there has an odd sense of humour.\n\nTobias Fenn, Tarren Mill",
}

P:Letter {
  id = "origin_forsaken_hillsbrad_militia_2", from = "Corporal Tobias Fenn", stranger = true, delay = 2400,
  when = { origin = "forsaken_hillsbrad_militia", minLevel = 30 },
  subject = "A letter from Southshore",
  body = "{name},\n\nA strange thing happened. A letter came over the hills from Southshore, smuggled by a goblin who charged us double for the privilege, and it was from your cousin Bess. She heard from someone in the inn that you'd been seen alive, more or less, and wanted to know if it was true.\n\nI didn't know what to tell her. I wrote back that you were well and serving the Dark Lady, and that you were fiercer than the militia ever made us. I left out the part about the skin.\n\nShe hasn't answered. Perhaps she won't. But I thought you deserved to know someone over there still says your name without spitting.\n\nTobias",
}

---------------------------------------------------------------------------
-- Once a cutpurse in Lordaeron's capital (Rogue)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_capital_cutpurse_1", from = "Nimble Hollis", stranger = true, delay = 1200,
  when = { origin = "forsaken_capital_cutpurse", minLevel = 6 },
  subject = "Business as usual",
  body = "{name},\n\nHollis here, from the old market by the fountain, before the fountain was a mass grave and the market was the Undercity. I've set myself up in the Rogues' Quarter, where everyone is in the same trade and nobody minds very much.\n\nBusiness isn't what it was. The coin purses of the dead have nothing in them but grave dirt and the occasional finger, and the living who come through from Orgrimmar keep their gold on a string round their necks.\n\nStill, a fine set of goblin gears went missing from the Trade Quarter last week, and I couldn't possibly say where they ended up. Write and tell me what the living carry in their pockets out there, so I can plan my retirement.\n\nHollis",
}

P:Letter {
  id = "origin_forsaken_capital_cutpurse_2", from = "Nimble Hollis", stranger = true, delay = 2400,
  when = { origin = "forsaken_capital_cutpurse", minLevel = 20 },
  subject = "A reputation",
  body = "{name},\n\nI'm writing to complain. A deathstalker stopped me in the Canals last week and asked whether I'd known you in life, and when I said that I had, she bought me a drink and asked a great many questions. I spent the whole conversation wondering whether I was being recruited or arrested, and I still don't know.\n\nIt seems you've become someone people talk about. That's terrible for a cutpurse, you understand, since the whole trade depends on nobody looking twice at you, but I suppose you've moved up in the world.\n\nIf you ever need to know who in the Undercity owes whom, I'm still here. I don't sell that sort of thing, of course, but I have been known to trade it.\n\nHollis",
}

---------------------------------------------------------------------------
-- Acolyte of the shadow (Priest)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_shadow_acolyte_1", from = "Sister Ilsa Veyne", stranger = true, delay = 1200,
  when = { origin = "forsaken_shadow_acolyte", minLevel = 6 },
  subject = "From the War Quarter",
  body = "{name},\n\nThe candles in the cellar of the War Quarter have gone out three times since you left, and Brother Merrick insists it is a sign. I told him it is a draught, and that the shadow has better things to do than blow on our candles, and we have not spoken since.\n\nThe new acolytes are a sorry lot. Half of them still pray to the Light under their breath when they think we can't hear, and the other half pray to nothing at all, which is at least honest.\n\nYou were always the quiet one, and the shadow likes the quiet ones. Keep listening to it in the dark places you visit, and remember that it answers, but it does not care for you, and that is precisely why it can be trusted.\n\nSister Ilsa Veyne",
}

P:Letter {
  id = "origin_forsaken_shadow_acolyte_2", from = "Sister Ilsa Veyne", stranger = true, delay = 2400,
  when = { origin = "forsaken_shadow_acolyte", minLevel = 20 },
  subject = "Merrick and I made up",
  body = "{name},\n\nBrother Merrick and I have made peace, if you want to know, though only because we found something we both dislike more than each other. A Scarlet priest was captured near the Monastery, and the deathstalkers brought him to our cellar, and he spent a whole night telling us the shadow was a lie.\n\nHe was very sure of himself until about dawn. Then the shadow answered one of my prayers in front of him, and he went very quiet and has not spoken since. Merrick laughed so hard he cracked a rib, and I suppose we're friends again.\n\nI'm told your own prayers are being answered out there in the world. Good. Let the living see what they left behind.\n\nIlsa",
}

---------------------------------------------------------------------------
-- Once an archivist in Stratholme (Mage)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_stratholme_archivist_1", from = "Clerk Bertram Ashe", stranger = true, delay = 1200,
  when = { origin = "forsaken_stratholme_archivist", minLevel = 6 },
  subject = "Regarding the archives",
  body = "{name},\n\nYou will recall me as the junior clerk who kept knocking over the ink in the Stratholme records hall, though I suspect you have tried very hard to forget. I have taken a post with the Royal Apothecary Society, cataloguing their reagents, which smells worse but is otherwise much the same work.\n\nA deathstalker who scouted the edge of Stratholme last month told me that the archive tower is still standing, though the Scourge use the lower floor as a kennel. She could not tell me whether the books survived, and I did not have the courage to ask her to look.\n\nI hope you find something worth recording out there. Write it down, and write it clearly, for once in your life.\n\nBertram Ashe",
}

P:Letter {
  id = "origin_forsaken_stratholme_archivist_2", from = "Clerk Bertram Ashe", stranger = true, delay = 2400,
  when = { origin = "forsaken_stratholme_archivist", cleared = "Uldaman" },
  subject = "The oldest archive",
  body = "{name},\n\nThe apothecaries have heard that you went down into Uldaman, past the stone keepers and the troggs, and saw the records the dwarves have been killing each other over. I confess I was jealous enough to break a beaker.\n\nThe dwarves say the vaults hold the story of the world's making, carved in plates that nobody living can read. You and I spent our lives keeping the deeds and tithe rolls of a city that no longer exists. Imagine keeping the records of something that will outlast every city ever built.\n\nIf you copied anything at all, even a single line, bring it to the Undercity. I will catalogue it properly, and I promise not to spill ink on it.\n\nBertram",
}

---------------------------------------------------------------------------
-- Bound demons for vengeance (Warlock)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_vengeful_binder_1", from = "Mordecai Lisle", stranger = true, delay = 1200,
  when = { origin = "forsaken_vengeful_binder", minLevel = 6 },
  subject = "The circle at Deathknell",
  body = "{name},\n\nI was the one who woke beside you in Deathknell, in the grave next to yours, and I was the one who told you that anger would be all you had for a while. I am pleased to hear you've found a use for it.\n\nThe warlocks in the Undercity have been asking after you. They say your imp was the most ill-mannered they'd seen in a decade, which they meant as a compliment. Meanwhile, the Scourge have been creeping back into the fields near Deathknell, and the new risen are coming out of the ground to find ghouls already waiting.\n\nKeep your hate sharp, but keep the demons on a short chain. They mind being dead far less than you do, and they will remind you of it at the worst moment.\n\nMordecai Lisle",
}

P:Letter {
  id = "origin_forsaken_vengeful_binder_2", from = "Mordecai Lisle", stranger = true, delay = 2400,
  when = { origin = "forsaken_vengeful_binder", minLevel = 40 },
  subject = "Whether it's enough",
  body = "{name},\n\nI have kept a tally of the Scourge you've destroyed, built from the reports that reach the Undercity, and the number has grown large enough that I've had to start a second page. I wonder if it feels like enough yet.\n\nIt doesn't for me. I've bound more demons than I can count and broken more ghouls than I can remember, and the Lich King still sits on his frozen throne in the north and does not know my name. That is the bitterest part, I think, that he will never know what he made.\n\nPerhaps it isn't meant to feel like enough. Perhaps the hate is only there to keep us walking. Either way, walk well, and keep counting.\n\nMordecai",
}

---------------------------------------------------------------------------
-- A squire who never took the oath (Paladin)
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_unsworn_squire_1", from = "Hob Tallow", stranger = true, delay = 1200,
  when = { origin = "forsaken_unsworn_squire", minLevel = 6 },
  subject = "From Andorhal",
  body = "{name},\n\nIt's Hob, the stable boy from the knight's yard in Andorhal. I rose last winter and found my way to the Undercity, though I won't say I enjoyed the walk, since the Scourge still hold most of the town and the grain stores still stink of the plague.\n\nYour master's horse is still in the yard, or what's left of it is. It walks round and round in the dark, and nobody's had the heart to put it down a third time.\n\nThey tell me you swear the oath every morning and the Light burns you every time. I remember you practising it in the hayloft, getting the words wrong and starting again. I'm glad you finally got to say it, even if it hurts.\n\nHob Tallow",
}

P:Letter {
  id = "origin_forsaken_unsworn_squire_2", from = "Hob Tallow", stranger = true, delay = 2400,
  when = { origin = "forsaken_unsworn_squire", minLevel = 30 },
  subject = "Your master",
  body = "{name},\n\nI've been asking around the Undercity, and I finally found someone who knew what became of your master. He rode out from Andorhal to warn the villages about the grain and never came back. They found his shield in Felstone Field with the Hand's sigil still on it.\n\nI don't know if that's good news. I suppose it means he died trying to do the right thing, which is more than most of us can say, and it means he never had to see what we turned into.\n\nI think he'd have knighted you, if he'd lived to see what you've done since. I'm only a stable boy, so it doesn't count from me, but I'm saying it anyway.\n\nHob",
}

---------------------------------------------------------------------------
-- Once a Silverpine woodsman
---------------------------------------------------------------------------
P:Letter {
  id = "origin_forsaken_silverpine_woodsman_1", from = "Jory Ashgrove", stranger = true, delay = 1200,
  when = { origin = "forsaken_silverpine_woodsman", minLevel = 6 },
  subject = "From the Sepulcher",
  body = "{name},\n\nThe woods are as quiet as they ever were, apart from the howling, and the howling is worse. Arugal's worgen have taken the mill at Pyrewood for their own, and old Pyrewood itself is full of folk who seem human enough by day and are anything but by night.\n\nI took a crosscut saw out of the Sepulcher's stores last week and felled a pine on the north ridge, just to see whether I still could. I could, but it didn't feel like anything, and I left the timber where it fell for the moss to have.\n\nThe Dalaran wizards still hide behind their wall at Ambermill, and the deathstalkers grumble about them. Come home sometime. The trees still look the same.\n\nJory Ashgrove, the Sepulcher",
}

P:Letter {
  id = "origin_forsaken_silverpine_woodsman_2", from = "Jory Ashgrove", stranger = true, delay = 2400,
  when = { origin = "forsaken_silverpine_woodsman", cleared = "Shadowfang Keep" },
  subject = "The howling stopped",
  body = "{name},\n\nThe night after the news reached the Sepulcher, I sat up on the north ridge waiting for the wolves. They howled, but it was ragged and scattered, like a pack that's lost its lead, and by midnight they'd gone quiet entirely.\n\nArugal's dead, they tell me, and you were the one in the keep when it happened. I knew half the folk who turned into those beasts. I drank with them in Pyrewood, and I cut timber beside them, and I'd like to think some part of them is grateful to have the madman off their necks.\n\nThe worgen are still out there, but they're only wolves now, and wolves can be dealt with. Thank you for that.\n\nJory",
}
