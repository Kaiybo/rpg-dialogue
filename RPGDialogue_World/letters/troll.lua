-- Origin letters: Troll. Two per origin (an early word from home, a later one on a milestone).
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Darkspear from the Echo Isles
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_echo_isles_1", from = "Cousin Zekka", stranger = true, delay = 1200,
  when = { origin = "troll_echo_isles", minLevel = 6 },
  subject = "From Sen'jin",
  body = "{name},\n\nSen'jin Village still smells of fish and smoke, and your auntie still says you will come home thin. I tell her you were always thin, and she hits me with a spoon.\n\nZalazane has been busy, mon. We can see his fires on the isles at night, and two more of the young ones went missing from the shore last moon. The elders say they went fishing too far out, but everybody knows where they went, and nobody says it aloud.\n\nVol'jin keeps telling us the isles will be ours again, and I believe him. Until then, you go and get strong out there, so when the day comes you can be in the first canoe. Save me a seat beside you.\n\nZekka, at Sen'jin",
}

P:Letter {
  id = "origin_troll_echo_isles_2", from = "Elder Tazzi", stranger = true, delay = 2400,
  when = { origin = "troll_echo_isles", minLevel = 20 },
  subject = "The isles remember",
  body = "Child of the isles,\n\nI am too old to paddle, so I sit on the beach at Sen'jin and look across the water at the place where I was born. Some days I can see the old huts through the mist, and some days only Zalazane's smoke.\n\nThe young ones tell me your name now, and they say it like a promise. They say there is a Darkspear out in the world who is growing strong enough to bring the isles home. I do not know if that is true, but it is good to hear them say it instead of crying.\n\nEat well, sleep when you can, and do not forget the sound of the waves on the Echo Isles. You will hear it again.\n\nElder Tazzi",
}

---------------------------------------------------------------------------
-- Sailed with Thrall from the south seas
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_sailed_with_thrall_1", from = "Old Rakjin", stranger = true, delay = 1200,
  when = { origin = "troll_sailed_with_thrall", minLevel = 6 },
  subject = "Shipmate",
  body = "Shipmate,\n\nYou remember de storm off de southern isles, when de orc ship nearly went over and you held onto de mast with one hand and me with de other? I still owe you for dat, and I have not forgotten.\n\nI am mending nets at Sen'jin now. My knees are no good on a deck anymore, and de murlocs steal my bait faster than I can cut it. Some nights de young ones ask me to tell about de sea witch and de day the Warchief came, and I make it a little bigger every time.\n\nVol'jin's father swore our debt to the Horde, and we heard him swear it. You go pay it, mon, with your own two hands. I am too old, so pay a little for me as well.\n\nRakjin",
}

P:Letter {
  id = "origin_troll_sailed_with_thrall_2", from = "Old Rakjin", stranger = true, delay = 2400,
  when = { origin = "troll_sailed_with_thrall", minLevel = 30 },
  subject = "De debt",
  body = "Shipmate,\n\nAn orc came to Sen'jin last week, all scars and leather, and he asked if anyone here knew {name}. I told him I did, and he said you saved his whole patrol in the Barrens and he wanted to thank somebody.\n\nI sat on de dock a long time after he left. Sen'jin died so dat de rest of us could live, and de Warchief carried us to dis shore, and now a Darkspear is carrying orcs home alive. Dat is how a debt is paid, mon, back and forth like a tide.\n\nThe murlocs still steal my bait, by the way, so if you ever come home with nothing to do, I have a job for you.\n\nRakjin",
}

---------------------------------------------------------------------------
-- Apprentice to a Darkspear witch doctor
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_witch_doctor_apprentice_1", from = "Witch Doctor Mojabu", stranger = true, delay = 1200,
  when = { origin = "troll_witch_doctor_apprentice", minLevel = 6 },
  subject = "You left de pot boiling",
  body = "Apprentice,\n\nYou left a pot boiling when you went off adventuring, and I did not notice until it had walked halfway across de hut. I put it out with a bucket of sea water, and it has been sulking in de corner ever since.\n\nThe new apprentice is a nervous boy who faints when de frogs croak. He will learn, or he will run away, and either is a lesson. Zalazane sent another of his hexed ones to the shore last week, and I spent three nights burning sage to keep it from finding its way back.\n\nRemember what I taught you. Every loa wants something, and so does everybody else out there. Know what it is before you shake their hand.\n\nMojabu, Sen'jin",
}

P:Letter {
  id = "origin_troll_witch_doctor_apprentice_2", from = "Witch Doctor Mojabu", stranger = true, delay = 2400,
  when = { origin = "troll_witch_doctor_apprentice", cleared = "Wailing Caverns" },
  subject = "De dreaming druid",
  body = "Apprentice,\n\nDe tauren say you went down into de Wailing Caverns, where de night elf druid has been dreaming bad dreams into de roots. I told dem you would come out with your hands full of strange plants, and I hope I was right, because I have been wanting some of dat deviate moss for years.\n\nA dream can poison a whole land, if de dreamer is strong and frightened enough. You saw dat with your own eyes, so now you know why I make you wash your hands after touching de wrong roots.\n\nDe nervous boy has stopped fainting, by de way. He only screams now, which is progress. Come back and teach him something, if you have de time.\n\nMojabu, Sen'jin",
}

---------------------------------------------------------------------------
-- Headhunter of the Darkspear
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_headhunter_1", from = "Gor'jaka", stranger = true, delay = 1200,
  when = { origin = "troll_headhunter", minLevel = 6 },
  subject = "From your father",
  body = "{name},\n\nYour mother says I should write to you, so I am writing. I am not good with letters, so I will say what I have to say and stop.\n\nThe Kolkar came up from the south last week and tried our fence at Sen'jin. I sat in the treeline with my spears and waited, the way my father taught me in Stranglethorn, and they did not try it twice. My shoulder aches when it rains now, but it does not rain much here, so I am not complaining.\n\nYou hunt for the Horde now. Good. Watch the treeline, keep your spears sharp, and never take a head that is not worth carrying home.\n\nYour father, Gor'jaka",
}

P:Letter {
  id = "origin_troll_headhunter_2", from = "Gor'jaka", stranger = true, delay = 2400,
  when = { origin = "troll_headhunter", minLevel = 30 },
  subject = "Worth carrying",
  body = "{name},\n\nYour mother says I should write again, so I am writing again. This time I have more to say, which surprises both of us.\n\nThe traders from Grom'gol say your name is known in Stranglethorn now. My father hunted those same jungles before the Darkspear were driven out, and I think he would have liked to know that his grandchild walks there with the Horde behind {g:him|her}.\n\nI was hard on you when you were young. I told you a hunter does not boast, and you never did, so I will do the boasting for you. I told the whole village about you at the fire last night, and I did not stop until your mother took my cup away.\n\nYour father, Gor'jaka",
}

---------------------------------------------------------------------------
-- Speaker for the loa
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_loa_speaker_1", from = "Mother Shiya", stranger = true, delay = 1200,
  when = { origin = "troll_loa_speaker", minLevel = 6 },
  subject = "What de loa said",
  body = "Little speaker,\n\nThe loa have been chattering since you left Sen'jin, and I am tired of hearing your name in my dreams. I asked them to talk about somebody else, and they laughed, the way they do.\n\nThey told me three things to tell you. The first is that you should eat more fish. The second is that a stranger with a kind face will lie to you before the next moon. The third I will keep, because it made me laugh too, and you would not find it so funny.\n\nThe village is well. Zalazane's fires burn on the isles, the children still sing at dusk, and the old men still argue over who catches the best fish. Listen well out there, and tell only what helps.\n\nMother Shiya",
}

P:Letter {
  id = "origin_troll_loa_speaker_2", from = "Mother Shiya", stranger = true, delay = 2400,
  when = { origin = "troll_loa_speaker", cleared = "Scarlet Monastery" },
  subject = "De loud ones",
  body = "Little speaker,\n\nThe loa tell me you went into the house of the humans who scream at their Light, and that you came out again. I did not know what to make of it, so I asked the Forsaken courier, and he smiled the way they do and said it was very good news for everyone except the screamers.\n\nThose humans believe their god speaks only to them, and that anyone who hears another voice must burn. I think the loa find that very funny. I think they also find it very sad.\n\nYou hear more than one voice, and you choose which ones to repeat. That is a harder thing than shouting, and you do it well. The loa are proud of you, though they would never say so.\n\nMother Shiya",
}

---------------------------------------------------------------------------
-- Listener to a voice that isn't a loa
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_other_voice_1", from = "Yenna", stranger = true, delay = 1200,
  when = { origin = "troll_other_voice", minLevel = 6 },
  subject = "From your sister",
  body = "{name},\n\nThe witch doctors still won't say your name, and old Mojabu spits in the fire when anyone does, but I am your sister, and I will say it as often as I like.\n\nI do not know what talks to you at night. I asked you once, and you looked at me as if I had asked something rude, so I won't ask again. But I keep a candle burning in the window of our hut at Sen'jin, and if the voice ever stops being kind to you, you follow that candle home.\n\nThe raptor pens flooded after the storm, and I spent a whole day chasing hatchlings through the surf. You would have laughed at me, and I wish you had been here to do it.\n\nYour sister, Yenna",
}

P:Letter {
  id = "origin_troll_other_voice_2", from = "Yenna", stranger = true, delay = 2400,
  when = { origin = "troll_other_voice", minLevel = 30 },
  subject = "The candle is still lit",
  body = "{name},\n\nThe witch doctors are saying your name again, which they never did before. They say it quietly, and they make a sign over their hearts after, but they say it. A trader told them you have used your dark bargains to keep a whole caravan alive in the Barrens, and Mojabu did not spit in the fire when he heard it.\n\nI am not foolish, and I know the voice you listen to has not changed. But I think you have, a little, and you are deciding what to do with what it gives you.\n\nThe candle is still lit, and I buy the good wax now, because I have a feeling I will need it for a long time.\n\nYour sister, Yenna",
}

---------------------------------------------------------------------------
-- Spear of the Sen'jin watch
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_senjin_spear_1", from = "Watch Captain Jharra", stranger = true, delay = 1200,
  when = { origin = "troll_senjin_spear", minLevel = 6 },
  subject = "De gate holds",
  body = "Spear {name},\n\nYou left de watch, and de gate is still standing, so do not let anybody tell you it fell down without you. It came close, though, when de Kolkar came up de road last week with more riders than we have ever seen.\n\nWe held, mon. Young Zabi took an arrow in his backside and will not sit down for a month, and de rest of us have been very kind to him about it, mostly by laughing.\n\nThe Kul Tirans are still sitting in their keep up de coast, watching us. I watch dem back. Go fight where de Horde needs you, but remember dis gate taught you how to stand.\n\nJharra, Sen'jin watch",
}

P:Letter {
  id = "origin_troll_senjin_spear_2", from = "Watch Captain Jharra", stranger = true, delay = 2400,
  when = { origin = "troll_senjin_spear", minLevel = 20 },
  subject = "Zabi wants your spear",
  body = "Spear {name},\n\nZabi can sit down again, and now he will not stop asking about you. He heard a grunt from Razor Hill say your name and he wants to know if it is true you held a Barrens road alone against a pack of centaur. I said I did not know, but it sounded like you.\n\nThe watch is stronger dis season. We have six new spears, and four of dem joined because they heard a Sen'jin guard had gone out and made a name for {g:himself|herself}. You are good for recruitment, mon, and I did not even have to pay you.\n\nStand tall out there, and come home when you can. De gate misses you.\n\nJharra, Sen'jin watch",
}

---------------------------------------------------------------------------
-- Revantusk warrior from the Hinterlands
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_revantusk_envoy_1", from = "Elder Jintuk", stranger = true, delay = 1200,
  when = { origin = "troll_revantusk_envoy", minLevel = 6 },
  subject = "From Revantusk Village",
  body = "{name},\n\nThe gryphon riders of the dwarves fly over our coast every morning, and every morning I curse them in three languages. Otherwise the village is well. The Witherbark have been quiet since the rains, which means they are planning something, and the Amani in the old ruins still pretend we do not exist.\n\nYou went to see what the Horde is worth, and I am waiting to hear your answer. The young warriors want to know whether Thrall is a chieftain worth following, or only another orc with a big hammer.\n\nWrite back when you know. Until then, fight well and eat whatever the orcs feed you, even if it tastes of dust.\n\nJintuk, Revantusk",
}

P:Letter {
  id = "origin_troll_revantusk_envoy_2", from = "Elder Jintuk", stranger = true, delay = 2400,
  when = { origin = "troll_revantusk_envoy", minLevel = 40 },
  subject = "The answer",
  body = "{name},\n\nWe hear of you now, even here at the edge of the world. A Horde runner came up the coast with letters and supplies, and when I asked whether he knew a Revantusk warrior named {name}, he laughed and told me stories until the fire burned down.\n\nI think that is my answer. If the Horde's runners know our warriors by name, then the Horde is worth more than the Amani ever were, and the young ones can stop asking me.\n\nThe Witherbark tested our walls again last month and went home with fewer warriors. Come and see the Hinterlands when you are strong enough to enjoy them. They are a hard country, but they are ours.\n\nJintuk, Revantusk",
}

---------------------------------------------------------------------------
-- Raptor rider of Sen'jin
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_raptor_rider_1", from = "Pen-Keeper Ozzi", stranger = true, delay = 1200,
  when = { origin = "troll_raptor_rider", minLevel = 6 },
  subject = "Your raptor's sisters",
  body = "{name},\n\nThe pens at Sen'jin have three new clutches, and one of the eggs is speckled the same way your raptor's egg was. I am keeping an eye on it, and if the hatchling bites everybody but one troll, I will know whose fault it is.\n\nOld Kezjin fell asleep in the pen again and woke up with a raptor sitting on his chest, staring at him. He says it was a vision from the loa. I say it was a raptor that wanted his breakfast.\n\nYou and your girl go far and run hard. Feed her well, scratch behind the crest where she likes it, and do not let anyone tell you a raptor is only a beast.\n\nOzzi, the Sen'jin pens",
}

P:Letter {
  id = "origin_troll_raptor_rider_2", from = "Pen-Keeper Ozzi", stranger = true, delay = 2400,
  when = { origin = "troll_raptor_rider", minLevel = 20 },
  subject = "The speckled one hatched",
  body = "{name},\n\nThe speckled egg hatched, and the hatchling bit me, and Kezjin, and the pen post, and then sat down very proudly in a puddle. I named her Little {name}, and I hope you do not mind.\n\nThe children of Sen'jin play at being you now. They ride sticks around the village and shout your name, and one of them fell off his stick into the cookpot, though not while it was hot. Everybody laughed, including him.\n\nThe Darkspear have ridden raptors since before anyone can remember, and you are carrying that out into the world. Ride proud, and bring your girl home for a visit when you can. Her sisters miss her.\n\nOzzi, the Sen'jin pens",
}

---------------------------------------------------------------------------
-- Runaway from the Gurubashi
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_gurubashi_runaway_1", from = "Shanzi", stranger = true, delay = 1200,
  when = { origin = "troll_gurubashi_runaway", minLevel = 6 },
  subject = "From Grom'gol",
  body = "{name},\n\nThe zeppelin from Orgrimmar brought me your news, and I am glad you are still running, though now you run toward trouble instead of away from it.\n\nGrom'gol is hot and wet and full of mosquitoes the size of bats. The Gurubashi still stalk the jungle at night, and the priests in Zul'Gurub have been beating their drums louder than ever. I can hear them some nights when the wind is right, and I do not sleep after.\n\nYou got out, and so did I, and we are the lucky ones. Do not come back here unless you have to, and if you have to, bring friends. The Gurubashi do not forget a face.\n\nShanzi, at Grom'gol",
}

P:Letter {
  id = "origin_troll_gurubashi_runaway_2", from = "Shanzi", stranger = true, delay = 2400,
  when = { origin = "troll_gurubashi_runaway", minLevel = 40 },
  subject = "They know your name",
  body = "{name},\n\nA Gurubashi raider was taken alive near the camp last week, and when the grunts asked him questions he said your name before they could ask it. He said the priests know there is a runaway who walks with the Horde and grows stronger every season, and that they do not like it.\n\nI did not like hearing it, but I think it is good news. The Gurubashi only fear what they cannot control, and they cannot control you.\n\nThe drums in Zul'Gurub are still loud. Whatever they are calling, it is not finished waking yet. If you ever come back to these jungles, come with a whole army at your back, and send me word first.\n\nShanzi, at Grom'gol",
}

---------------------------------------------------------------------------
-- Night spy on the Echo Isles
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_echo_isles_spy_1", from = "Mazi", stranger = true, delay = 1200,
  when = { origin = "troll_echo_isles_spy", minLevel = 6 },
  subject = "The count",
  body = "{name},\n\nI took your canoe out to the isles last night, since you are not using it, and I count fourteen more hexed ones on the north beach than you counted in the spring. Zalazane is busy, mon, and he does not seem to sleep.\n\nI nearly lost the canoe to a reef I did not know about. You always knew where the reefs were, and I always laughed at you for paying such close attention. I am not laughing now.\n\nKeep your eyes sharp out there and your feet quiet. When the day comes to take the isles back, Vol'jin will want somebody who knows every path, and I would rather it was you than me.\n\nMazi, Sen'jin",
}

P:Letter {
  id = "origin_troll_echo_isles_spy_2", from = "Mazi", stranger = true, delay = 2400,
  when = { origin = "troll_echo_isles_spy", minLevel = 20 },
  subject = "Your canoe is safe",
  body = "{name},\n\nI have been doing your work all season, and I am happy to report that your canoe has survived, though it now has a small hole that I fixed with pitch and a prayer.\n\nThe count on the isles is steady now. Zalazane's slaves stand on the beach and stare at Sen'jin all night, and some of them I recognize, which is the worst part of the job. Vol'jin asks for the numbers every morning, and every morning I tell him, and he nods as if he is adding up something only he can see.\n\nWe hear you are getting strong out there. Good. One day soon we will need everything you have learned, and we will need you in that canoe with me.\n\nMazi, Sen'jin",
}

---------------------------------------------------------------------------
-- Singer for Bwonsamdi
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_bwonsamdi_singer_1", from = "Grandfather Zul'tiki", stranger = true, delay = 1200,
  when = { origin = "troll_bwonsamdi_singer", minLevel = 6 },
  subject = "Somebody has to sing",
  body = "{name},\n\nSince you went away I have been singing the names of the fallen alone, and my voice is not what it was. Last night I forgot two names and had to start again from the beginning, and Bwonsamdi was very patient about it, which worried me.\n\nThe young ones do not want to learn the songs. They say singing for the dead is for old trolls, and that they would rather fight Zalazane than mourn the ones he took. I understand them, but somebody has to do both.\n\nWherever you walk, sing a little for the ones who fall near you. Bwonsamdi likes to know who is coming, and he likes good manners even more.\n\nZul'tiki, Sen'jin",
}

P:Letter {
  id = "origin_troll_bwonsamdi_singer_2", from = "Grandfather Zul'tiki", stranger = true, delay = 2400,
  when = { origin = "troll_bwonsamdi_singer", cleared = "Razorfen Downs" },
  subject = "De cold one",
  body = "{name},\n\nThe tauren tell me that you went down into the Razorfen Downs, where a cold thing was raising the dead to walk again, and that you put an end to it. When I heard it, I sang for an hour without forgetting a single name.\n\nBwonsamdi does not like it when the dead are stolen from him. A dead troll belongs to the loa, and a dead quilboar belongs to whatever quilboar believe in, but none of them belong to a lich. I think the old loa is laughing tonight, and his laugh is not pleasant, but it is grateful.\n\nTwo of the young ones have started learning the songs. They say they want to be like you, and that is a good reason to learn.\n\nZul'tiki, Sen'jin",
}

---------------------------------------------------------------------------
-- Caller of the sea spirits
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_sea_spirit_caller_1", from = "Granny Wenji", stranger = true, delay = 1200,
  when = { origin = "troll_sea_spirit_caller", minLevel = 6 },
  subject = "From de shore",
  body = "{name},\n\nThe tide came in very high last night, higher than it has in years, and I went down to the water and asked it why. It said it was looking for you, and I told it you had gone inland to fight for the orcs. The water was quiet for a while, and then it went back out, sulking.\n\nThe old women still sit on the rocks at Sen'jin every evening and call the spirits. Kesha's knees have given out, so we carry her down in a basket now, and she complains the whole way.\n\nThe sea remembers the Darkspear, little one. Do not let the dust of Durotar make you forget the sea.\n\nGranny Wenji",
}

P:Letter {
  id = "origin_troll_sea_spirit_caller_2", from = "Granny Wenji", stranger = true, delay = 2400,
  when = { origin = "troll_sea_spirit_caller", cleared = "Blackfathom Deeps" },
  subject = "De drowned temple",
  body = "{name},\n\nThe water spirits have been singing all week, and I could not understand why until a trader from Ashenvale told me about you. He said you went down into the drowned temple at Blackfathom, where some foul thing had been poisoning the water, and that you came up again.\n\nThe sea does not like it when its waters go bad. Whatever was down there, the spirits are glad it is gone, and they told me so very loudly, at three in the morning, when I was trying to sleep.\n\nKesha says she is proud of you. She says it from her basket, which is not very dignified, but she means it with her whole heart.\n\nGranny Wenji",
}

---------------------------------------------------------------------------
-- Taught by the Warchief's shamans
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_orgrimmar_shaman_1", from = "Grandmother Juzzi", stranger = true, delay = 1200,
  when = { origin = "troll_orgrimmar_shaman", minLevel = 6 },
  subject = "Your grandmother writes",
  body = "{name},\n\nI am told you have left Orgrimmar and gone out with your orc totems to see the world. I hope the earth and fire are kind to you, and I hope you have not forgotten to leave an offering for the loa now and then, because they notice.\n\nThe village is the same. The fish are fewer and the murlocs are bolder, and your cousin Zekka is courting a girl who does not like him, which keeps us all entertained.\n\nI know you think the spirits and the loa can share one troll. Maybe they can. But the loa were here first, so remember to say hello to them when you say hello to the fire.\n\nYour grandmother, Juzzi",
}

P:Letter {
  id = "origin_troll_orgrimmar_shaman_2", from = "Grandmother Juzzi", stranger = true, delay = 2400,
  when = { origin = "troll_orgrimmar_shaman", minLevel = 30 },
  subject = "Maybe you were right",
  body = "{name},\n\nAn orc shaman came through Sen'jin last month on her way to Razor Hill. She sat with me by the fire and told me that a young troll trained in Orgrimmar had called up the earth in the Barrens to save a whole caravan. When I asked the name, she said yours.\n\nThen she asked me about the loa. She wanted to know how a troll speaks to them, and whether they and the elements ever talk to each other. We talked until the fire went out, and she left an offering on my doorstep in the morning.\n\nI think you might be right that there is room in one troll for both. Do not tell anyone I said so.\n\nYour grandmother, Juzzi",
}

---------------------------------------------------------------------------
-- Reader of Zandalari scrolls
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_zandalari_scrolls_1", from = "Uncle Rokhan-Zo", stranger = true, delay = 1200,
  when = { origin = "troll_zandalari_scrolls", minLevel = 6 },
  subject = "Your uncle writes",
  body = "{name},\n\nI am back from Stranglethorn, with a sunburn and a bag of trinkets the Zandalari did not want. One of them may be a very old charm, or it may be a very old spoon, and I have not decided which.\n\nThe Zandalari traders were in a strange mood this season. They asked many questions about the Gurubashi and very few about the price of fish, and when the tall ones are quiet like that, it is best to be quiet too.\n\nKeep reading, little scholar. The scrolls I brought you were older than the Horde, and they taught you to make fire from words. There are older ones out there, and some of them should stay closed.\n\nYour uncle, Rokhan-Zo",
}

P:Letter {
  id = "origin_troll_zandalari_scrolls_2", from = "Uncle Rokhan-Zo", stranger = true, delay = 2400,
  when = { origin = "troll_zandalari_scrolls", cleared = "Uldaman" },
  subject = "Old stone, old words",
  body = "{name},\n\nA goblin trader out of Kargath, very rude, told me you had been poking around in Uldaman, where the old stone people sleep under the Badlands. I told him that my {g:nephew|niece} reads scrolls the Zandalari themselves cannot read, and he spat, which I am taking as respect.\n\nI hope you found something worth the trip. Old places keep old words, and you were always better with old words than with new ones. If you found a scroll down there, read it twice before you read it aloud.\n\nI have a new spoon, by the way. It is definitely a spoon this time.\n\nYour uncle, Rokhan-Zo",
}

---------------------------------------------------------------------------
-- Student in the Valley of Spirits
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_valley_of_spirits_mage_1", from = "Kin'zuri", stranger = true, delay = 1200,
  when = { origin = "troll_valley_of_spirits_mage", minLevel = 6 },
  subject = "From de Valley",
  body = "{name},\n\nYou left the Valley of Spirits, and now I have nobody to argue with about whether mojo and arcane are the same thing. I argued with the orc who sweeps the floor instead, but he only nods and keeps sweeping, so I think I won.\n\nOne of the new students turned a bowl of water into a bowl of very angry steam, and the master has banned all bowls from the study hall. We now drink from our hands like the old days, which the elders seem to find funny.\n\nGo and prove your theory out there, mon. And when you do, write it down, so I can tell everyone you were right and I helped.\n\nKin'zuri, Valley of Spirits",
}

P:Letter {
  id = "origin_troll_valley_of_spirits_mage_2", from = "Kin'zuri", stranger = true, delay = 2400,
  when = { origin = "troll_valley_of_spirits_mage", cleared = "Shadowfang Keep" },
  subject = "De human wizard",
  body = "{name},\n\nThe Forsaken have been telling everyone in Orgrimmar that you went into Shadowfang Keep and stopped that mad human wizard, the one who turned his own people into wolves. The whole Valley has been talking about nothing else for a week.\n\nThe master says this proves that arcane in the wrong hands is a curse. I said it also proves that arcane in the right hands is the cure, and that the right hands belonged to a troll. He did not answer, which I am counting as another win.\n\nThe bowls are allowed back, by the way. The angry steam student apologized very nicely.\n\nKin'zuri, Valley of Spirits",
}

---------------------------------------------------------------------------
-- Learned dark magic to fight Zalazane
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_hex_breaker_1", from = "Zabba", stranger = true, delay = 1200,
  when = { origin = "troll_hex_breaker", minLevel = 6 },
  subject = "A worried friend",
  body = "{name},\n\nI am writing from Sen'jin, where nobody talks about you, which means everybody does. The witch doctors look at the ground when your name comes up, and the old women make signs, and the children ask whether it is true you have a demon in a bottle.\n\nI tell them it is a very small demon and a very large bottle. They seem to like that answer.\n\nI know why you went down into the Cleft of Shadow, and I know what you mean to do with it. Zalazane took my brother on the isles, so I understand. Just be careful that what you are learning does not learn you back.\n\nZabba",
}

P:Letter {
  id = "origin_troll_hex_breaker_2", from = "Zabba", stranger = true, delay = 2400,
  when = { origin = "troll_hex_breaker", minLevel = 30 },
  subject = "My brother",
  body = "{name},\n\nI paddled out with the night spies last week to look at the isles. I saw my brother on the beach, standing with the other hexed ones and staring at nothing. He did not know me, and I did not call to him, because I knew it would only hurt.\n\nWhen I came back I went to the witch doctors and asked whether a hex like that can be broken. They said only by someone who knows it from the inside. Then they looked at each other and said your name very quietly.\n\nI do not know if you can do it. But I think you are the only Darkspear who might, and I wanted you to know that I am waiting.\n\nZabba",
}

---------------------------------------------------------------------------
-- Fisher of the Durotar coast
---------------------------------------------------------------------------
P:Letter {
  id = "origin_troll_coast_fisher_1", from = "Big Jorra", stranger = true, delay = 1200,
  when = { origin = "troll_coast_fisher", minLevel = 6 },
  subject = "De nets",
  body = "{name},\n\nThe nets are full this season, mon, and you are not here to haul them, which my back is very unhappy about. I have taken on your cousin's boy instead, and he is strong, but he is afraid of crabs, which is a problem in our line of work.\n\nA Kul Tiran ship came close to shore last week, and we all sat very still in our boats until it went away. I do not think they wanted us, but nobody wanted to find out.\n\nThe murlocs stole half a day's catch from the drying racks again. I have started leaving them the small fish as a bribe, and it is working, which tells you something about murlocs.\n\nBig Jorra, Sen'jin",
}

P:Letter {
  id = "origin_troll_coast_fisher_2", from = "Big Jorra", stranger = true, delay = 2400,
  when = { origin = "troll_coast_fisher", minLevel = 20 },
  subject = "Biggest fish in de sea",
  body = "{name},\n\nThey talk about you at the fish market in Orgrimmar now. I went up to sell a load of mackerel, and the orc behind the counter said, a Sen'jin fisher, you must know {name}, and I said I taught you everything you know. That is mostly a lie, but he gave me a better price for it.\n\nThe cousin's boy is not afraid of crabs anymore. A crab took hold of his nose and would not let go, and after that he decided he had nothing left to fear. He hauls the nets like you did, almost.\n\nThe sea is always here when you want it back. Until then, go and catch bigger things than fish.\n\nBig Jorra, Sen'jin",
}
