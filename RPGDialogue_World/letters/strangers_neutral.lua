-- Random letters from the neutral world (people you've met in the cartel ports, Everlook,
-- Moonglade, Cenarion Hold, Light's Hope and the like), from strangers, and junk mail.
-- Most carry their own replies; some replies send a follow-up letter (no `when`, no `random`).
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Neutral folk you've met
---------------------------------------------------------------------------
P:Letter {
  id = "nt_nesingwary", npc = "nesingwary", random = true, when = { minLevel = 35 },
  subject = "From the camp in the jungle",
  body = "{name},\n\nThe camp is much as you left it. Ajeck sleeps all day and sets snares all night, Sir S. J. Erlgadin has written to his solicitor again, and Barnil has invented a stew that I am told contains panther, though I suspect it contains mostly boot.\n\nI am still missing two pages of The Green Hills of Stranglethorn. Some fool of a reader tore my book apart and scattered it from Grom'gol to the Savage Coast, and I will not rest easy while a single page is papering a troll's hut. If you come across a loose leaf with my name on it, you know where to bring it.\n\nKing Bangalash is dead, but there is always another cat in that jungle that thinks itself a king. Come back and we'll see about it.\n\nHemet Nesingwary",
  replies = {
    { id = "pages", text = "I'll keep an eye out for any loose pages of your book.", fx = { affinity = 1, npcFlag = "nt_pages_promised" } },
    { id = "cats", text = "Shooting cats for a book never sat right with me, Hemet.", fx = { affinity = -1, opinion = { big_game_hunting = "distaste" } } },
    { id = "stew", text = "Tell Barnil I'll try the stew if he swears there's no boot.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "nt_sprinkle", npc = "sprinkle", random = true, when = { minLevel = 40 },
  subject = "Sand in everything, as usual",
  body = "Hiya, {name}!\n\nA sandstorm blew through Gadgetzan last week and I'm still finding sand in places I didn't know I had, sweetheart, and the bruisers spent two days digging out the auction house with shovels, which was the most work anybody's seen 'em do since the Wastewander last tried their luck. Nobody got hurt, so that's a good week, as weeks go out here.\n\nI've been working on a new recipe, too, and it's a good one, but it's missing somethin' and I can't put my finger on what. If you're the cooking kind, write and tell me, and I'll send you what I've got so far. No charge between friends, and I don't say that to everybody.\n\nYour pal in the desert,\nSprinkle",
  replies = {
    { id = "recipe", text = "Send me the recipe, and I'll tell you what it's missing.", fx = { affinity = 1, letter = "nt_sprinkle_2" } },
    { id = "glad", text = "Glad nobody got hurt, Sprinkle. Keep your head down in those storms.", fx = { affinity = 1 } },
    { id = "busy", text = "I don't have time for recipes right now, sorry.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "nt_sprinkle_2", npc = "sprinkle", delay = 5400,
  subject = "The recipe, as promised",
  body = "{name}!\n\nHere it is, and don't you go showing it to Fizzgrimble, because he'll put it on the inn's board and charge three silver a bowl. Take one basilisk tail, which you can get from the Thousand Needles side if you don't mind the walk, and you skin it, slice it thin, and fry it in a little Tanaris cactus oil until it stops twitching, which takes longer than you'd think.\n\nThen you add salt, pepper, a pinch of dried scorpid and a splash of whatever the boys at Steamwheedle Port are drinking that week. It's good, but it's missing somethin', and I think it might be love, or possibly onions. Water costs more than onions out here, so you can guess which I'm trying first.\n\nWrite back if you work it out.\nSprinkle",
  replies = {
    { id = "onions", text = "It's onions, Sprinkle. It's always onions.", fx = { affinity = 1 } },
    { id = "love", text = "Love, definitely. Fry it with a bit more patience.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "nt_marin", npc = "marin", random = true, when = { minLevel = 40 },
  subject = "A limited offer for valued customers",
  body = "{name}, my friend and valued customer!\n\nThe Noggenfogger Elixir is selling faster than I can bottle it, and I'm writing to a few select adventurers, which is you and about four hundred others, to let you know that the new batch is the best yet. Side effects are down to almost nothin', pal. You might float a little, you might shrink a little, and in a very small number of cases you might turn into a skeleton for a few minutes, but that's a feature, and the ladies at the inn think it's charming.\n\nI can have a crate sent anywhere a goblin can find, which is everywhere, for a modest delivery fee and a slightly less modest handling fee. Write back and say the word.\n\nMarin Noggenfogger, Mayor of Gadgetzan and purveyor of fine elixirs",
  replies = {
    { id = "crate", text = "Send me a crate, Marin. I'll pay when it arrives.", fx = { affinity = 1, letter = "nt_marin_2" } },
    { id = "skeleton", text = "Last time I turned into a skeleton at the bank. Never again.", fx = { opinion = { noggenfogger = "never_again" } } },
    { id = "mayor", text = "Shouldn't the mayor be busy keeping the town supplied with water?", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "nt_marin_2", npc = "marin", delay = 3600,
  subject = "INVOICE",
  body = "{name},\n\nGreat news, pal! Your crate of Noggenfogger Elixir left Gadgetzan on the back of a very reliable kodo, and I'm sure it'll reach you any day now, unless the kodo went to Thousand Needles again, in which case it's probably racing. Enclosed is your invoice.\n\nOne crate of elixir, twenty bottles. One delivery fee. One handling fee. One fee for the kodo, one fee for the kodo's lunch, and one small fee for the paperwork, which is this letter. I've rounded down out of friendship, so you're welcome.\n\nPay at your convenience, but sooner is more convenient for me.\nMarin Noggenfogger",
  replies = {
    { id = "pay", text = "I'll pay for the elixir when the kodo actually turns up.", fx = { affinity = 1 } },
    { id = "lunch", text = "I'm not paying for a kodo's lunch, Marin.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "nt_nat_pagle", npc = "nat_pagle", random = true, when = { minLevel = 35 },
  subject = "Fish are biting",
  body = "{name},\n\nThought you'd like to know the fish are biting off my little island, now that the weather's turned. Caught a mud snapper the length of my arm yesterday, and a Theramore lieutenant rowed out in the afternoon to ask me whether I'd seen any orcs, and I told him the only thing I'd seen all day was fish. He didn't like that much, but it was true.\n\nAn orc came by from Brackenwall the week before and asked me whether I'd seen any humans. I told him the same thing, and he liked it even less. I don't take sides, and I don't bait my hooks with politics. Sit long enough on a dock and you see everybody's boats sink eventually.\n\nIf you want a quiet afternoon, there's a spare rod by the shack. Bring your own lunch.\n\nNat Pagle",
  replies = {
    { id = "rod", text = "Save me that spare rod, Nat. I could use a quiet afternoon.", fx = { affinity = 1, npcFlag = "nt_rod_saved" } },
    { id = "sides", text = "Everyone takes a side eventually, Nat, even out on a dock.", fx = { affinity = -1, opinion = { neutrality = "impossible" } } },
    { id = "agree", text = "No politics on a fishing line. That's a rule I can follow.", fx = { affinity = 1, opinion = { neutrality = "admire" } } },
  },
}

P:Letter {
  id = "nt_remulos", npc = "remulos", random = true, when = { minLevel = 55 },
  subject = "From the glade",
  body = "{name},\n\nThe moonwell at Nighthaven has been still these past nights, and the druids sleep easier for it. I write because you have walked the glade and seen it as few outsiders do, and because a keeper of a place grows tired, at times, of speaking only to the trees and to those who already agree with him.\n\nThe Timbermaw guard the road south through Felwood as fiercely as ever, and I am glad of them, though the corruption in that forest grows a little each season, and it does not grow alone. Every furbolg tribe that falls to it was once as proud as the Timbermaw are now. Remember that, if you pass the Deadwood camps with your blade drawn.\n\nThe glade is open to you, whatever banner you march under. My father's peace does not ask whom you serve.\n\nKeeper Remulos, Moonglade",
  replies = {
    { id = "mercy", text = "I'll remember the Deadwood were proud once, Keeper.", fx = { affinity = 1, opinion = { deadwood = "pity" } } },
    { id = "cull", text = "What's corrupted has to be cut out, whatever it used to be.", fx = { opinion = { deadwood = "cull" } } },
    { id = "thanks", text = "Thank you for keeping the glade open to me.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "nt_calandrath", npc = "calandrath", random = true, when = { minLevel = 55 },
  subject = "From the Oasis Inn",
  body = "{name},\n\nYou poor thing, I still remember the state you came in the first time, covered head to foot in sand and too tired to take your boots off. I hope wherever you are now has grass. I dream of grass here, and of the gulls over Auberdine, and of a breeze off the sea that doesn't bring half the desert in with it.\n\nThe Hold is busy. The Wildmane brothers argue in the evenings about the Twilight's Hammer and their secret letters, and Geologist Larksbane keeps bringing back rocks that hum, which nobody likes. I have learned to cook the cultists' smoked dumplings, and I won't say where I learned it, except that they are surprisingly good and I feel a little guilty every time.\n\nCome back whenever you need a bed and a meal that isn't sandworm. Elune keep you.\n\nCalandrath, the Oasis Inn, Cenarion Hold",
  replies = {
    { id = "recipe", text = "I'd love to try those dumplings. Will you send the recipe?", fx = { affinity = 1, letter = "nt_calandrath_2" } },
    { id = "grass", text = "There's grass where I am. I'll think of you when I sit in it.", fx = { affinity = 1 } },
    { id = "cultists", text = "Cooking the Twilight's Hammer's food seems a bit too friendly.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "nt_calandrath_2", npc = "calandrath", delay = 4800,
  subject = "Smoked desert dumplings",
  body = "{name},\n\nHere is the recipe, and if anyone asks, you had it from a traveller and you don't remember who. Take a sandworm's leanest meat, which is hardly lean at all, and mince it fine with Silithus scorpid, wild desert herbs, and a little pepper from the Hold's stores. Wrap each spoonful in flat dough and smoke them over a slow fire of whatever won't burn too hot, which out here is very little.\n\nThe cultists use something else in the smoke, I'm sure of it, but I've not found out what, and I'm not about to walk up to Twilight Base Camp and ask. Mine are nearly as good, and nobody has turned to the shadow from eating them yet.\n\nCalandrath",
}

P:Letter {
  id = "nt_tirion", npc = "tirion", random = true, when = { minLevel = 52 },
  subject = "From a cabin by the water",
  body = "{name},\n\nI do not write many letters these days. A man who was stripped of his title and sent away from his own lands learns to keep his thoughts to himself, and the lake outside my door has heard most of mine already. But you came to my door with an open hand, and I have thought of that more than once since.\n\nI was cast out of the Silver Hand for sparing an orc who had saved my life, and I would do it again. I have been told I broke faith with my order, and I have been told I kept faith with the Light, and I have had a long time to wonder which of those matters more. Some nights I am sure. Some nights I only watch the water.\n\nIf your road brings you back past the river, there is a chair by the fire and a pot on it. I ask nothing else.\n\nTirion Fordring",
  replies = {
    { id = "light", text = "You kept faith with the Light. An order that forgot it isn't owed yours.", fx = { affinity = 1, align = { order = -1 } } },
    { id = "order", text = "An oath to your order should have come before one orc.", fx = { affinity = -1, align = { order = 1 } } },
    { id = "chair", text = "Keep that chair by the fire for me, Tirion.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "nt_smokey", npc = "smokey", random = true, when = { minLevel = 55 },
  subject = "Stop by Light's Hope, ye lazy sod",
  body = "{name},\n\nI'm writin' this because Betina says I should be nicer to the folk who help us, and because I've a crate of Scourge bits under my bench that's startin' to smell, and I'd rather ye came and took a look at it than I had tae carry it out myself. The compound's comin' along. Don't ask what's in it, because I'll tell ye, and then ye'll not sleep.\n\nThe Dawn's thin on the ground out here, and the dead aren't. Every week some green recruit from Ironforge or Orgrimmar turns up full o' fire and goes out past Corin's Crossing, and every week I'm told to count fewer of them when they come back. So if ye've got a free arm, bring it. If ye've not, bring a cask, at least.\n\nSmokey LaRue, Light's Hope Chapel",
  replies = {
    { id = "coming", text = "I'll bring a free arm and a cask, Smokey.", fx = { affinity = 1 } },
    { id = "recruits", text = "Stop sending the green recruits past Corin's Crossing, then.", fx = { affinity = -1 } },
    { id = "contents", text = "Fine, I'm asking. What's in the compound?", fx = { npcFlag = "nt_asked_compound" } },
  },
}

P:Letter {
  id = "nt_grazle", npc = "grazle", random = true, when = { minLevel = 48 },
  subject = "Grazle sends words",
  body = "{name},\n\nGrazle does not write. Grazle has asked the shaman Kernda to make the marks for him, because Grazle's paws are better for holding the road than for holding a quill. Kernda says this is a strange thing to do, writing to an outsider, and Grazle says Kernda is right, but you have killed Deadwood, and you did not lie to the Timbermaw, so Grazle will do the strange thing this once.\n\nThe Deadwood came close to the tunnel again under the last moon, and the forest groaned all night. Grazle stood at the mouth with spear and torch until the sun came up, and the tunnel is still Timbermaw. Grazle wanted you to know this, because you helped make it so.\n\nGrazle, at the road to Timbermaw Hold\n(and Kernda, who made the marks)",
  replies = {
    { id = "honour", text = "Tell Grazle I'm honoured he wrote, and thank Kernda for me.", fx = { affinity = 1, npcFlag = "nt_grazle_honoured" } },
    { id = "hold", text = "Hold the tunnel, Grazle. I'll come back when the Deadwood stir again.", fx = { affinity = 1 } },
    { id = "trust", text = "Furbolgs are furbolgs. I'll keep my distance, thanks.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "nt_umi", npc = "umi", random = true, when = { minLevel = 55 },
  subject = "BIG plans in Everlook",
  body = "{name}!!\n\nRemember the yeti? The mechanical one? Of course you do, you helped build it, and I've been tinkering with it ever since, and now it walks faster, roars louder, and only catches fire when you go downhill, which in Winterspring is about half the time, but still! Legacki screamed so hard last time that she dropped a whole tray of tea, and Quixxil down in Un'Goro still jumps at every shadow, and it's been the best winter of my life.\n\nNow I want to get Legacki again, but properly, and I need a partner with a steady hand and no conscience about it. Are you in? Write back and tell me yes, and I'll tell you the plan.\n\nUmi Rumplesnicker, Everlook (do NOT show this letter to Legacki)",
  replies = {
    { id = "in", text = "I'm in, Umi. What's the plan?", fx = { affinity = 1, letter = "nt_umi_2" } },
    { id = "poor", text = "Leave poor Legacki alone. She's dropped enough tea for one winter.", fx = { affinity = -1 } },
    { id = "fire", text = "Fix the catching fire first, then we'll talk.", fx = { npcFlag = "nt_umi_fire" } },
  },
}

P:Letter {
  id = "nt_umi_2", npc = "umi", delay = 4200,
  subject = "It went PERFECTLY (mostly)",
  body = "{name},\n\nYou won't believe it, you'd have loved it, I wish you'd been here! I parked the yeti behind the inn last night with a blanket over it, and I put a note on Legacki's door saying Innkeeper Vizzie had left a present for her round the back, and out she came with a lantern, and I pulled the cord, and it ROARED.\n\nShe screamed, she threw the lantern, the lantern hit the yeti, the yeti caught fire, which I'll admit was not part of the plan, and then it rolled down the hill into the trough. The fire's out, the yeti's in pieces, and Legacki has stopped speaking to me, but she laughed about it to Vizzie this morning when she thought I wasn't listening, so it counts.\n\nI'm building a bigger one. Your pal,\nUmi",
  replies = {
    { id = "bigger", text = "Bigger is better, Umi. Let me know when it's ready.", fx = { affinity = 1 } },
    { id = "apologise", text = "Go and apologise to Legacki, Umi. Properly, this time.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "nt_donova", npc = "donova", random = true, when = { minLevel = 53 },
  subject = "Warm water and cold news",
  body = "{name},\n\nThe springs are as warm as ever, and I've been sittin' in 'em up to my beard most evenings, which is the only sensible way to spend a winter in Winterspring. I wanted tae write because ye did right by me with the Winterfall, and because I've a worry, and a worry's better shared with somebody who's seen the same things.\n\nThe firewater's still gettin' to them. The furbolgs come down the slope red-eyed and angry, and every one o' them was a decent sort once, and someone is still brewin' that poison and still sellin' it. I don't know who, and I'll not guess on paper. But keep yer ears open, {g:lad|lass}, and if ye hear a name, I'd like to know it.\n\nDonova Snowden, by the hot springs",
  replies = {
    { id = "ears", text = "I'll keep my ears open, Donova, and write if I hear a name.", fx = { affinity = 1, npcFlag = "nt_donova_listening" } },
    { id = "springs", text = "Save me a warm spot in those springs.", fx = { affinity = 1 } },
    { id = "lost", text = "The Winterfall are past saving. I'd stop worrying about them.", fx = { affinity = -1, opinion = { winterfall = "past_saving" } } },
  },
}

P:Letter {
  id = "nt_whiskeyslim", npc = "whiskeyslim", random = true, when = { minLevel = 38 },
  subject = "A toast, in writing",
  body = "{name}!\n\nI'm raisin' a glass to you as I write this, so here's a toast! To good friends, good grog, and long life to everyone at this table, and a short, wet death to the Bloodsail scum who'd take any of it away! There. It's a better toast when you can hear me shout the last part.\n\nI'm writing because I still think about my lost Pupellyverbos Port, and I find myself grateful all over again whenever I pour a glass of what came back to me. Gnomes are supposed to like gears, but I like good drink and better company, and Booty Bay gives me plenty of both, so long as the Baron keeps the Bloodsail off the docks.\n\nAnother toast! To you, my friend, and woe to anyone who says a word against you while I'm in earshot.\n\nWhiskey Slim, the Salty Sailor Tavern",
  replies = {
    { id = "toast", text = "To good grog, and woe to the Bloodsail!", fx = { affinity = 1 } },
    { id = "careful", text = "Go easy on the port, Slim, or there'll be none left.", fx = { affinity = -1 } },
    { id = "gears", text = "I've always liked a gnome who prefers a glass to a gear.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "nt_riggle", npc = "riggle_bassbait", random = true, when = { minLevel = 35 },
  subject = "THE EXTRAVAGANZA RETURNS",
  body = "{name}, friend of fishing!\n\nRiggle Bassbait here, Fishmaster, and I'm writin' to every angler worth the name to remind 'em that the Stranglethorn Fishing Extravaganza is on again this Sunday, and every Sunday after that, until the fish run out or I do! Forty Speckled Tastyfish, first one to my table, and you go home a legend.\n\nNow, I'll be honest with you, because honesty's good for business, there's a fellow from Ratchet who says he's gonna win it with a bait made of fermented murloc fins and something he won't name, and I've told him that's legal, because it is, but between you and me I'd love to see somebody beat him with a plain old worm. You've got the hands for it. I can tell from the way you hold a coin.\n\nRiggle Bassbait, Fishmaster, Booty Bay",
  replies = {
    { id = "enter", text = "Put my name down, Riggle. I'll beat him with a plain worm.", fx = { affinity = 1, npcFlag = "nt_extravaganza" } },
    { id = "fish", text = "I'll leave the fishing to people with more patience than me.", fx = { affinity = -1 } },
    { id = "bait", text = "What's the other thing in his bait? Now I'm curious.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "nt_sputtervalve", npc = "sputtervalve", random = true, when = { minLevel = 18 },
  subject = "About the samophlange (again)",
  body = "{name}!\n\nIt's me, Sputtervalve, from Ratchet, the one with the samophlange, you remember, and I just wanted to say thank you again, pal, because it's back on the bench and it's working, mostly, and I've had it apart twice already to see what the Venture Co. did to it, which was nothin' good, I'll tell you that for free.\n\nOnly now I've a new problem, which is that it makes this noise at night, a sort of a whine, like a kettle that's thinking about something sad, and I can't sleep, and Gazlowe says if I bring it into the office once more he'll throw it in the harbour. Do you know anything about samophlanges? Anything at all, even a rumour, would help.\n\nSputtervalve, Ratchet",
  replies = {
    { id = "hit", text = "Have you tried hitting it? That fixes most things I own.", fx = { affinity = 1, letter = "nt_sputtervalve_2" } },
    { id = "nothing", text = "I don't know a thing about samophlanges, sorry.", fx = {} },
    { id = "harbour", text = "Honestly, Gazlowe has a point about the harbour.", fx = { affinity = -1 } },
  },
}

P:Letter {
  id = "nt_sputtervalve_2", npc = "sputtervalve", delay = 3600,
  subject = "IT WORKED",
  body = "{name}!\n\nI hit it! I hit it with the big wrench, the one with the dent, right on the top where the casing's a bit loose, and it stopped whining, and then it started humming instead, which is a much happier noise, and I slept nine hours straight for the first time since the Venture Co. got their grubby mitts on it.\n\nI've written \"HIT HERE\" on it in chalk so I don't forget, and Gazlowe walked past and laughed at me, but he laughed in a friendly way, I think. I owe you one, pal. Not a big one, because you didn't do much, but a solid medium.\n\nSputtervalve",
}

P:Letter {
  id = "nt_lokhtos", npc = "dg_lokhtos", random = true, when = { minLevel = 52 },
  subject = "Business, between us",
  body = "{name},\n\nYe'll know who this is from, and ye'll know not tae say it aloud in the Grim Guzzler. The Brotherhood keeps its word, and I keep the Brotherhood's accounts, and the accounts say ye've been useful. That's as warm as I get, so take it.\n\nThere's work in the Searing Gorge for them as can carry ore and keep their mouths shut. The Emperor's men watch the roads, and the Dark Irons still loyal to him would see every one of us hanging from the Gorge's chains if they knew what we were makin' down there. So when ye come, come quiet, and bring proof, not promises. Proof is all I deal in.\n\nL.",
  replies = {
    { id = "quiet", text = "I'll come quiet, and I'll bring proof.", fx = { affinity = 1, npcFlag = "nt_lokhtos_work" } },
    { id = "danger", text = "Writing this down seems a risk for someone who hates risk.", fx = { affinity = -1 } },
    { id = "ore", text = "What sort of ore are we talking about?", fx = {} },
  },
}

P:Letter {
  id = "nt_linken", npc = "linken", random = true, when = { minLevel = 50 },
  subject = "I remembered something",
  body = "Friend {name},\n\nI remembered something last night, and I wanted to tell someone who would not laugh, so I am telling you. I was sitting at the fire in the Refuge, polishing my sword the way J.D. Collie showed me, and all at once I remembered a green hat. I do not know whose it was. I think it might have been mine.\n\nThere was a voice, too, a small one, and it said something to me before I set out, something about it being dangerous to go alone. I cannot remember the rest. Williden says the blow to my head may give back more in time, and I hope he is right, because a man should know where he came from, even if he does not much care for gadgets.\n\nYour friend,\nLinken, Marshal's Refuge",
  replies = {
    { id = "hat", text = "A green hat suits a hero, Linken. I hope you remember more.", fx = { affinity = 1, letter = "nt_linken_2" } },
    { id = "dangerous", text = "Whoever said it was right. Take someone with you next time.", fx = { affinity = 1 } },
    { id = "doctor", text = "Have someone properly look at that head, Linken.", fx = {} },
  },
}

P:Letter {
  id = "nt_linken_2", npc = "linken", delay = 6000,
  subject = "Another piece",
  body = "Friend {name},\n\nYour letter came, and I read it twice. Then something else came back to me, which I think your letter shook loose. I remember a sword in a stone, or near one, and a fairy, or something small and bright that flew about my head and talked far too much. J.D. says that sounds like a dream, and maybe it is.\n\nBut I am certain of one thing now, which is that I did not come across the sea to fight the fire elemental for glory. I came because someone asked me to, and I said yes. I do not know who it was, but I am glad I said yes. I think it is the sort of person I am.\n\nLinken",
}

---------------------------------------------------------------------------
-- Strangers
---------------------------------------------------------------------------
P:Letter {
  id = "st_widow", from = "Margery Holt", stranger = true, random = true, when = { faction = "Alliance", minLevel = 30 },
  subject = "My husband, Corporal Holt",
  body = "To the adventurer {name},\n\nForgive me for writing to someone I don't know. A courier in Southshore told me you had been through the Highlands, and I've no one else to ask. My husband, Corporal Edwin Holt, was posted to Refuge Pointe last spring, and in the summer I had a letter from his captain to say he'd fallen near Stromgarde. They buried him there, the captain said, but he didn't say where.\n\nI can't make the journey. I have two boys and a mill, and the road through the Highlands isn't safe for a woman with a cart. But I would like to know that there's a stone, and that someone has stood by it. If you're ever at Refuge Pointe, would you ask?\n\nMargery Holt, the mill at Southshore",
  replies = {
    { id = "ask", text = "I'll ask at Refuge Pointe, and stand by his stone for you.", fx = { flag = { set = "st_widow_promised" }, letter = "st_widow_2" } },
    { id = "sorry", text = "I'm sorry for your loss. I can't promise to go there.", fx = {} },
  },
}

P:Letter {
  id = "st_widow_2", from = "Margery Holt", stranger = true, delay = 7200,
  subject = "Thank you",
  body = "Dear {name},\n\nYour letter came this morning, and I sat down by the mill wheel and read it four times. I don't know whether you've reached Refuge Pointe yet, or whether you ever will, but you said you would, and that's more than anybody else has said to me since the summer.\n\nThe boys asked who was writing, and I told them it was a friend of their father's. That isn't quite true, but I don't think Edwin would mind. He always said the best people he'd met were the ones who stopped when they didn't have to.\n\nWith my thanks,\nMargery Holt",
}

P:Letter {
  id = "st_sample", from = "Thessaly Brindlecombe", stranger = true, random = true, when = { minLevel = 20 },
  subject = "Sample enclosed, DO NOT DRINK",
  body = "Master Ollin,\n\nEnclosed is the sample you asked for, taken from the third vat. It is the greenish one. The bluish one is in the second vat and is not enclosed, because it ate through the bottle. I must stress again that the sample is NOT for drinking. Its effects on the drinker are uncertain, but my cat has not been the same.\n\nPlease send your notes on it by return, and do mind the stopper, which is cork and seems to be dissolving.\n\nYour colleague,\nThessaly Brindlecombe, Alchemist\n\n(On the back, in another hand: \"Misdelivered. Ollin Bracewell, Ironforge, Hall of Explorers. Sorry. The Mail Office.\")",
  replies = {
    { id = "forward", text = "I'll forward the sample to Master Ollin, carefully.", fx = { letter = "st_sample_ollin" } },
    { id = "drank", text = "I'm afraid I drank it before I read the label.", fx = { flag = { set = "st_drank_sample" }, letter = "st_sample_drank" } },
    { id = "bin", text = "I've thrown it in the river. Sorry about the fish.", fx = {} },
  },
}

P:Letter {
  id = "st_sample_ollin", from = "Ollin Bracewell", stranger = true, delay = 5400,
  subject = "Re: the sample",
  body = "Dear {name},\n\nThe sample arrived at the Hall of Explorers this morning, with the cork nearly gone and a smell that cleared the reading room. I am obliged to you. Most people who find a stranger's bottle in their post simply drink it, which tells you a great deal about most people.\n\nThessaly is a fine alchemist, though she has the handwriting of a startled chicken and the Mail Office has never once read her addresses correctly. I will tell her it reached me by the kindness of a stranger. If you are ever in Ironforge, come by the Hall and ask for me, and I'll show you what it does to a mushroom.\n\nOllin Bracewell, Hall of Explorers",
  replies = {
    { id = "mushroom", text = "I'd like to see what it does to a mushroom.", fx = { flag = { set = "st_ollin_friend" } } },
    { id = "welcome", text = "Glad it reached you, Master Ollin. Good luck with it.", fx = {} },
  },
}

P:Letter {
  id = "st_sample_drank", from = "Thessaly Brindlecombe", stranger = true, delay = 3600,
  subject = "YOU DRANK IT?",
  body = "{name},\n\nThe Mail Office forwarded your letter, and I have read it three times hoping I had misunderstood. You drank it. You drank an unlabelled sample from a stranger's mail. I am writing this as quickly as I can, so please forgive the blots.\n\nIf your hair has turned green, that is expected and it will pass. If your tongue has turned green, that is less expected but probably also passes. If you can hear colours, please sit down and do not operate a gryphon. If you have begun to smell faintly of my cat, I would very much like to hear about it, purely for science.\n\nWrite back at once and tell me how you are.\nThessaly Brindlecombe",
  replies = {
    { id = "fine", text = "I'm fine, apart from my hair. It's very green.", fx = { flag = { set = "st_green_hair" } } },
    { id = "colours", text = "I can hear colours. Purple is very loud.", fx = {} },
    { id = "cat", text = "I do smell faintly of cat. What does that mean?", fx = {} },
  },
}

P:Letter {
  id = "st_child", from = "Wren Tolliver", stranger = true, random = true, when = { faction = "Alliance", minLevel = 15 },
  subject = "For my lessons",
  body = "Dear adventurer,\n\nMy name is Wren and I am nine and I live in Lakeshire, and Mistress Agatha who teaches us in the back of the town hall says we must each write to somebody who does a job we want to do when we are big. Everybody else wrote to the blacksmith or the fisherman but I wanted to write to a real adventurer, so I asked the man who brings the post and he said you would do.\n\nPlease can you tell me what the job is like and whether you have fought a gnoll, because there are gnolls across the lake and my papa says not to look at them, but I look at them anyway.\n\nyours truly,\nWren Tolliver",
  replies = {
    { id = "gnoll", text = "I've fought plenty of gnolls, Wren. Here's the story of one.", fx = { letter = "st_child_2a" } },
    { id = "walking", text = "Mostly it's walking and being rained on. Listen to your papa.", fx = { letter = "st_child_2b" } },
    { id = "busy", text = "Tell Mistress Agatha you wrote, and that's a good start.", fx = {} },
  },
}

P:Letter {
  id = "st_child_2a", from = "Wren Tolliver", stranger = true, delay = 4800,
  subject = "EVERYBODY LISTENED",
  body = "Dear {name},\n\nI read your letter out loud in front of everybody and when I got to the part about the gnoll even Tommy Haddon stopped picking his nose. Mistress Agatha said it was very exciting and also that I should not try it, and I said I would not, but I did go and look at the gnolls across the lake again, from the bridge, and one of them looked back.\n\nI have decided I am going to be a {class} like you when I grow up. Papa says we will see. Mama wants to write to you too, she says, but I said you are very busy and only write to me.\n\nyour friend,\nWren",
  replies = {
    { id = "mama", text = "Of course your mama can write to me, Wren.", fx = { letter = "st_child_3" } },
    { id = "bridge", text = "Stay off that bridge, Wren. Gnolls throw things.", fx = {} },
  },
}

P:Letter {
  id = "st_child_2b", from = "Wren Tolliver", stranger = true, delay = 4800,
  subject = "That's not fair",
  body = "Dear {name},\n\nYou are the only adventurer in the whole world who has written back to say adventuring is mostly walking and being rained on, and Tommy Haddon laughed at me because his blacksmith wrote back about swords. I think you were telling the truth, though, because your letter had a mud stain on it.\n\nI asked papa and he said that's what the soldiers at the Watch say too, so I suppose it's true, and I am going to be a fisherman after all, because at least you sit down. But I am still going to look at the gnolls.\n\nfrom Wren",
}

P:Letter {
  id = "st_child_3", from = "Hanna Tolliver", stranger = true, delay = 5400,
  subject = "From Wren's mother",
  body = "Dear {name},\n\nI hope you'll forgive a stranger writing, and forgive my daughter too. She's taken your letters to bed with her every night this week, and she's told the whole of Lakeshire about the gnoll, including the gnolls, I fear, since she shouted some of it across the lake from the bridge.\n\nI wanted to thank you for being kind to her. Her father worries she'll run off to be a hero the moment she's old enough, and I suppose she might, but I'd rather she grew up thinking heroes write back than thinking they don't. If you ever come through Redridge, there's a meal at our table, though I warn you there will be questions.\n\nWith thanks,\nHanna Tolliver, Lakeshire",
}

P:Letter {
  id = "st_warrior", from = "Brenna Oakes", stranger = true, random = true, when = { class = "WARRIOR", faction = "Alliance", minLevel = 20 },
  subject = "About my son",
  body = "To {name},\n\nMy son Garreth is seventeen and has decided he'll enlist the day he turns eighteen, because he saw a warrior like you ride through Goldshire with a great scar across one cheek, and he says that's the life for him. I've tried everything. His father was a soldier, and his father came home from the Second War without his left hand, and still Garreth won't hear a word against it.\n\nHe'd listen to you, I think. He won't listen to me. Would you write to him and tell him the truth of it, whatever the truth is? I only ask that you don't lie to him either way.\n\nBrenna Oakes, near Goldshire",
  replies = {
    { id = "truth", text = "I'll tell him the truth: it's hard, and not everyone comes home.", fx = { opinion = { soldiering = "honest" } } },
    { id = "proud", text = "He should enlist. Stormwind needs every sword it can get.", fx = { opinion = { soldiering = "duty" } } },
    { id = "wait", text = "I'll tell him to wait a year and learn a trade first.", fx = { opinion = { soldiering = "caution" } } },
  },
}

P:Letter {
  id = "st_paladin", from = "Old Tobias Wren", stranger = true, random = true, when = { class = "PALADIN", minLevel = 25 },
  subject = "I saw Uther once",
  body = "Sir or madam,\n\nI'm an old man now and I've not got long, and I wanted to write to one of the Light's knights before I go. I saw Uther the Lightbringer once, when I was a young man in Lordaeron, riding through the market at Andorhal with his hammer across his saddle. He stopped and bought apples from my father's cart and paid twice what they were worth, and said the extra was for the next fellow who couldn't pay.\n\nThey tell me now that some of those who wore his colours burn villages in the north and call it purity. I'd like to know, before I die, which kind you are. I'm not asking to be rude. I'm asking because I'd like to die thinking the Light chose well.\n\nTobias Wren, once of Andorhal, now of Stormwind",
  replies = {
    { id = "apples", text = "I'd pay twice for the apples too, Tobias. That's my kind.", fx = { align = { light = 1 } } },
    { id = "purge", text = "Sometimes the Light demands hard things, even burning.", fx = { align = { light = -1 } } },
    { id = "unsure", text = "I'm still finding out which kind I am, to be honest.", fx = {} },
  },
}

P:Letter {
  id = "st_rogue", from = "Ludo Copperlock", stranger = true, random = true, when = { class = "ROGUE", minLevel = 20 },
  subject = "My display case",
  body = "To whom it may concern,\n\nSomebody opened the display case in my locksmith's shop three nights ago without a key, without a mark on the lock, and without taking a single thing. They left it tidier than they found it, and on the top shelf they left one copper piece, polished, and a note that said \"Nice lock. Not that nice.\"\n\nI have written to every rogue my cousin in the Mail Office could put a name to, so please don't take this as an accusation. I only want to know how it was done. I've made locks for forty years and I've never been so insulted or so curious in my life.\n\nLudo Copperlock, Locksmith",
  replies = {
    { id = "confess", text = "A hairpin and patience. Your third tumbler sticks.", fx = { flag = { set = "st_locksmith_confession" } } },
    { id = "deny", text = "It wasn't me, but whoever did it was right about the lock.", fx = {} },
    { id = "trade", text = "Secrets of the trade, Master Copperlock. Buy a better lock.", fx = {} },
  },
}

P:Letter {
  id = "st_shaman", from = "Tikwa", stranger = true, random = true, when = { class = "SHAMAN", minLevel = 15 },
  subject = "The spirits will not leave me be",
  body = "Honoured shaman,\n\nI am a young troll of the Darkspear, and for three moons now the fire in my cookpot talks to me, and the water at the shore pulls at my feet when I walk past, and last night the wind took my hat and put it on a goat. My mother says it is the spirits calling and that I should be proud, but I am not proud, mon, I am scared, and the goat will not give my hat back.\n\nThe elders at Sen'jin say I should ask a shaman who has already walked the path. I do not know any, so I asked the post, and the post brought me your name. What did you do, when they first spoke to you?\n\nTikwa, Sen'jin Village",
  replies = {
    { id = "listen", text = "Listen to them, Tikwa. They're frightening before they're friends.", fx = { opinion = { elements = "respect" } } },
    { id = "command", text = "Speak back firmly. The spirits respect those who don't flinch.", fx = { opinion = { elements = "power" } } },
    { id = "goat", text = "Start with the goat. Ask the wind nicely for your hat.", fx = {} },
  },
}

P:Letter {
  id = "st_warlock", from = "Harold Pennywhistle", stranger = true, random = true, when = { class = "WARLOCK", minLevel = 15 },
  subject = "Your small red friend",
  body = "Dear {name},\n\nI keep a chandler's shop and I want to raise, as politely as I can, the matter of your small red friend, who visited my shop on the evening you stopped in for lamp oil. While you were at the counter, he ate eleven candles, set fire to a twelfth, and told my wife a thing about her mother that she has not stopped crying about.\n\nI don't wish to make trouble. I know what your sort can do, and I've a family. But if you could keep him on a lead, or in a jar, or wherever it is you keep him, I'd be very much obliged. The candles I'll forgive. The thing about her mother, I am less sure of.\n\nHarold Pennywhistle, Chandler",
  replies = {
    { id = "sorry", text = "I'm sorry. I'll keep the imp on a shorter leash.", fx = {} },
    { id = "true", text = "In fairness, imps rarely lie about mothers.", fx = {} },
    { id = "threat", text = "Mind your words about my servant, chandler.", fx = { flag = { set = "st_chandler_threatened" } } },
  },
}

P:Letter {
  id = "st_druid", from = "Farmer Hask Redmane", stranger = true, random = true, when = { class = "DRUID", minLevel = 15 },
  subject = "Was that you?",
  body = "Stranger,\n\nA big bear came through my honey hives last week, ate three combs, sat in my water trough for most of the afternoon, and then walked off on its hind legs looking very pleased with itself. My neighbour says that was no bear, it was one of those druids, and that you were seen on the road that same day.\n\nI'm not angry. I just want to know whether I should be setting traps or setting a place at supper, because it's hard to know the manners for this sort of thing. If it was you, the honey was clover and the trough's been cleaned since.\n\nHask Redmane",
  replies = {
    { id = "me", text = "It was me. The clover honey was wonderful. Forgive the trough.", fx = { letter = "st_druid_2" } },
    { id = "notme", text = "That wasn't me. Real bears don't walk off on two legs, though.", fx = {} },
  },
}

P:Letter {
  id = "st_druid_2", from = "Farmer Hask Redmane", stranger = true, delay = 3600,
  subject = "Supper, then",
  body = "{name},\n\nWell, that settles it, and I've told the neighbour he owes me a jar of pickles, because I said it was a druid and he said it was a bear, and in a manner of speaking we were both right, but I'm counting it.\n\nThere's a place at the table any evening you're passing. Come as you like, two legs or four, but if it's four, I'd ask you to wipe your paws.\n\nHask",
}

P:Letter {
  id = "st_mage", from = "Innkeeper Brumley", stranger = true, random = true, when = { class = "MAGE", minLevel = 20 },
  subject = "The bread",
  body = "{name},\n\nYou'll remember stopping at my inn last month and kindly leaving a basket of conjured bread for the kitchen, to save me the baking. I was grateful and I said so. I put the loaves out for the supper crowd, and an hour into the meal every one of them vanished, mid-bite, right out of my guests' hands.\n\nA dwarf choked on nothing. A priest declared the inn haunted. Two travellers swore off drink and one of them has since taken holy orders. I've had people asking for ghost rooms ever since, and I'm not sure whether to thank you or bill you.\n\nInnkeeper Brumley",
  replies = {
    { id = "sorry", text = "I forgot to mention it doesn't last. My apologies to the dwarf.", fx = {} },
    { id = "bill", text = "Charge extra for the ghost rooms. You can thank me later.", fx = {} },
  },
}

P:Letter {
  id = "st_priest", from = "Aldous Penrose", stranger = true, random = true, when = { class = "PRIEST", faction = "Alliance", minLevel = 30 },
  subject = "A prayer for my brother",
  body = "Father, Mother, or whatever I ought to call you,\n\nMy brother Jory went north to the Plaguelands six months ago with a band of volunteers who meant to join the Argent Dawn. I've had one letter, from Chillwind Camp, and nothing since. The camp says they've no record of him past the river.\n\nI'm not a praying man, and I never was. But I'd be grateful if someone who is would say one for him, wherever he is, and for me, too, because I've started dreaming of him walking toward me in the dark, and I don't like the way he walks.\n\nAldous Penrose, Darkshire",
  replies = {
    { id = "pray", text = "I'll pray for Jory, and for you. You aren't alone in this.", fx = { align = { light = 1 } } },
    { id = "truth", text = "Prepare yourself, Aldous. Few come back from past the river.", fx = { align = { light = -1 } } },
    { id = "camp", text = "I'll ask at Chillwind Camp if I pass through.", fx = { flag = { set = "st_asked_about_jory" } } },
  },
}

P:Letter {
  id = "st_tauren", from = "Weaver Nahoka", stranger = true, random = true, when = { race = "Tauren", minLevel = 12 },
  subject = "For the great blanket",
  body = "Young one,\n\nI am an old weaver of the Bloodhoof, and for many summers now I have been weaving a blanket that holds the mark of every family who walked with Cairne out of the Barrens and onto the high plains of Mulgore. It is long now, longer than a kodo, and the children use it for hiding under when the thunder comes.\n\nYour family's mark is not on it yet. Will you send it to me, or tell me of it, so I may weave it in? It need not be grand. Some families are marked by a hoof, some by a feather, and one by a burnt pot, because that is how they are remembered.\n\nMay the Earth Mother keep your hooves steady,\nWeaver Nahoka, Bloodhoof Village",
  replies = {
    { id = "mark", text = "My family's mark is the running kodo. Weave it in, grandmother.", fx = { flag = { set = "st_blanket_mark" } } },
    { id = "pot", text = "Ours might be the burnt pot, if I'm honest.", fx = {} },
    { id = "none", text = "I don't know my family's mark, grandmother.", fx = {} },
  },
}

P:Letter {
  id = "st_nightelf", from = "Ilyssa Moonwhisper", stranger = true, random = true, when = { race = "NightElf", minLevel = 20 },
  subject = "Do you remember me?",
  body = "Ishnu-alah, {name},\n\nI saw you on the road through Astranaar, and I knew your face at once, though it took me three nights to place it. You have the eyes of Shalaria Moonwhisper, who held the line beside me at the Well of Eternity when the Highborne opened the way, and who I last saw on the shore when the waters came in. I thought her lost for ten thousand years.\n\nPerhaps you are her daughter's daughter, many times over, and perhaps I am an old woman who sees ghosts in every face. The Sentinels tell me I do. Even so, I would like to know whether the name means anything to you.\n\nIlyssa Moonwhisper, near Astranaar",
  replies = {
    { id = "maybe", text = "My grandmothers' names are lost to me. It could be.", fx = { flag = { set = "st_moonwhisper_maybe" } } },
    { id = "no", text = "I'm sorry, Ilyssa. I'm no kin of Shalaria's.", fx = {} },
    { id = "tell", text = "Tell me about her. I'd like to know, either way.", fx = { flag = { set = "st_moonwhisper_maybe" } } },
  },
}

P:Letter {
  id = "st_orc", from = "Edric Plum", stranger = true, random = true, when = { race = "Orc", minLevel = 20 },
  subject = "I was a guard at the camps",
  body = "To {name},\n\nI've written this letter many times and burned all of them, and I've decided to send this one before I lose my nerve. I was a guard at one of the internment camps in Lordaeron for six years. I stood on the walls, I counted heads, and I watched your people go grey and quiet, and I told myself it was only a job.\n\nI don't know you. I asked a goblin courier to take this to an orc, any orc, who had made a name for themselves, and he named you. I'm not asking for forgiveness, because I don't think I've earned it. I only wanted one of you to know that one of us remembers, and is sorry.\n\nEdric Plum, a farmer now, near Southshore",
  replies = {
    { id = "accept", text = "The camps are behind us. Your apology is heard.", fx = { opinion = { camps = "forgive" }, letter = "st_orc_2" } },
    { id = "refuse", text = "Sorry won't give back those years. Live with that.", fx = { opinion = { camps = "unforgiven" } } },
    { id = "thrall", text = "Thrall freed us. Your sorrow is yours to carry, not mine.", fx = { opinion = { camps = "indifferent" } } },
  },
}

P:Letter {
  id = "st_orc_2", from = "Edric Plum", stranger = true, delay = 7200,
  subject = "Heard",
  body = "{name},\n\nI didn't think you'd answer, and I didn't think, if you did, it would be with anything but a curse, which I'd have deserved. I read your letter at the kitchen table and had to go out and stand in the field for a while.\n\nI'll not trouble you again. I only wanted to say that I've started setting a little aside each harvest, and when there's enough, I mean to send it to the Horde's people in the Barrens, for the orphans of the war, if a goblin can be trusted to carry it. It's not much, and it's not enough. But it's something, and I'd not have started without your letter.\n\nEdric Plum",
}

P:Letter {
  id = "st_scourge", from = "Annie Brook", stranger = true, random = true, when = { race = "Scourge", minLevel = 15 },
  subject = "To my brother Tomas",
  body = "Tomas,\n\nThey say in Southshore that some of the dead have woken and kept their minds, and that they live under the old capital now and wear what's left of their own faces. I don't know if it's true, and I don't know if you're one of them. But you were buried in Brill, and the graves in Brill are empty now, so I'm writing to anyone the couriers say came out of that ground.\n\nIf you're not Tomas, I'm sorry to trouble you. If you are, I don't need you to come home. I only want to know whether you still remember the orchard, and the summer the cart went into the pond.\n\nYour sister, Annie\n\n(The courier's note: \"Sent on to whoever'd take it. No refunds.\")",
  replies = {
    { id = "honest", text = "I'm not Tomas, Annie. Few of us remember orchards.", fx = { letter = "st_scourge_2" } },
    { id = "pretend", text = "I remember the orchard, Annie, and the cart in the pond.", fx = { flag = { set = "st_annie_lied" } } },
    { id = "cold", text = "Your brother is dead. Stop writing to the ground.", fx = {} },
  },
}

P:Letter {
  id = "st_scourge_2", from = "Annie Brook", stranger = true, delay = 6000,
  subject = "Thank you for answering",
  body = "Whoever you are,\n\nThank you for telling me the truth. I don't think most would have, from either side of the grave. I cried when I read it, but I think it was the good kind, the kind that lets you set something down after you've carried it a long while.\n\nI won't write to Brill again. If you ever do remember an orchard, though, any orchard, I hope it's a pleasant one, and I hope you find it doesn't hurt.\n\nAnnie Brook, Southshore",
}

---------------------------------------------------------------------------
-- Junk mail
---------------------------------------------------------------------------
P:Letter {
  id = "junk_ogre_courier", from = "Mug'thol's Reliable Ogre Couriers", stranger = true, random = true, junk = true,
  subject = "WE BRING YOUR LETTER. MOSTLY.",
  body = "HELLO SMALL FRIEND!\n\nMug'thol's Reliable Ogre Couriers bring your letter anywhere, fast, because ogre legs very long. We go over mountain, through swamp, and around angry dwarf. Last month we bring nine letters out of ten, and the tenth letter was very tasty, so customer did not mind much.\n\nPrices fair! Two letters for one silver, or one letter for one sheep. Packages also, if package not move.\n\nMUG'THOL. (Mug'thol's brother write this. Mug'thol cannot write. Mug'thol's brother can, a little.)",
  replies = {
    { id = "tasty", text = "Please confirm which of my letters was the tasty one.", fx = {} },
  },
}

P:Letter {
  id = "junk_bloodsail", from = "The Bloodsail Buccaneers", stranger = true, random = true, junk = true, when = { minLevel = 30 },
  subject = "A life on the waves awaits ye!",
  body = "Ahoy, landlubber!\n\nTired of takin' orders from barons and kings and fat goblins in silk? Join the Bloodsail Buccaneers, the freest crew on the South Seas, where every hand gets a share, a cutlass, and a parrot, while parrots last!\n\nNo experience required. Must not be loyal to Booty Bay, Baron Revilgaz, or anybody what works for him, and must not have previously sunk any of our ships, which we will be checkin'.\n\nFleet Master Firallon sends his regards, and also a reminder that desertion is punished by keel.",
  replies = {
    { id = "sunk", text = "Return to sender. I've sunk several of your ships.", fx = {} },
  },
}

P:Letter {
  id = "junk_fortune", from = "Madame Zelphine, Fortunes by Post", stranger = true, random = true, junk = true, when = { minLevel = 12 },
  subject = "Your future, revealed (first page free)",
  body = "Dearest {name},\n\nThe cards have spoken, and they spoke your name! I see a long road ahead of you, a great many monsters, and a sum of gold that rises and falls, and rises, and falls again, mostly at the auction house. I see a tall stranger and a short stranger, and I see a stranger of medium height who owes you money.\n\nFor the second page of your fortune, which contains the important part, simply send three silver to Madame Zelphine, care of the Darkmoon Faire, wherever it happens to be this month.\n\nThe spirits await your payment!",
}

P:Letter {
  id = "junk_beard", from = "Thick-as-Stone Beard Restorer", stranger = true, random = true, junk = true,
  subject = "Is yer beard lettin' ye down?",
  body = "Attention, friend!\n\nIs yer beard thin, patchy, or singed from too many evenings at the forge? Are the lads in the Stonefire Tavern laughin' behind their mugs? Then ye need THICK-AS-STONE BEARD RESTORER, brewed in Dun Morogh from a secret family recipe and only a wee bit of troll sweat.\n\nResults in three days or yer money back, provided ye can find us. Not for use on eyebrows, horses, or night elves, who have complained.\n\nRub in twice daily, an' do not drink it. Do not let a gnome drink it, either, for we're still payin' for the last one.",
  replies = {
    { id = "gnome", text = "What happened to the gnome? I need to know.", fx = {} },
  },
}

P:Letter {
  id = "junk_survey", from = "Steamwheedle Cartel Customer Relations", stranger = true, random = true, junk = true, when = { minLevel = 20 },
  subject = "How did we do?",
  body = "Valued customer,\n\nYou recently used a Steamwheedle Cartel service, such as a zeppelin, a boat, a bank, a bruiser, or a vendor who may or may not have been licensed. We'd love to hear how it went! Please rate your experience from one to five sprockets.\n\nWas your goblin friendly? Was your explosion expected? Were any limbs lost, and if so, did you get them back? Would you recommend Steamwheedle to a friend, or to an enemy you'd like to see overcharged?\n\nPlease return this survey with a one-copper processing fee. Your opinion is valuable, and so is your copper.",
  replies = {
    { id = "five", text = "Five sprockets. The explosion was entirely expected.", fx = {} },
    { id = "one", text = "One sprocket, and I'd like my eyebrows back.", fx = {} },
  },
}

P:Letter {
  id = "junk_kobold_candles", from = "Kobold Kandle Kompany", stranger = true, random = true, junk = true,
  subject = "YOU BUY CANDLE",
  body = "YOU BUY CANDLE!\n\nKobold Kandle Kompany make finest candles in all of the deep dark mines. Candle make light. Light good. Dark bad. Candle burn on head, so hands free for digging and for poking!\n\nSpecial deal: buy one candle, get one candle. Buy two candle, get two candle. You NO take candle without buying. We know where you live, because we dig under it.\n\nKobold Kandle Kompany. Is not stolen wax.",
  replies = {
    { id = "take", text = "I took a candle. I'm not sorry.", fx = {} },
  },
}

---------------------------------------------------------------------------
-- Writing pass (World): more of Nesingwary's camp
---------------------------------------------------------------------------
P:Letter {
  id = "nt_w2_erlgadin", npc = "erlgadin", random = true, when = { minLevel = 35 },
  subject = "A letter I did not send",
  body = "{class},\n\nMy solicitor in Stormwind has written again to inform me that my cousin has taken my seat in the House of Nobles, my house on the Canal, and my second-best hunting dog, and that if I wish to contest any of these I should return at once. I have written back to say that he may keep the seat and the house, and that I would like the dog sent south on the next ship out of the harbour.\n\nI find, to my own surprise, that I do not miss any of it. The panthers here are cruel and hungry and they do not pretend otherwise, and after twenty years among the nobility, that is very restful company.\n\nIf you see my cousin, do not give him my regards.\n\nSir S. J. Erlgadin, formerly of Stormwind",
  replies = {
    { id = "dog", text = "I hope the dog makes it south, Sir Erlgadin. It sounds loyal.", fx = { affinity = 1 } },
    { id = "seat", text = "You should go back and fight for your seat, Sir Erlgadin.", fx = { affinity = -1 } },
    { id = "cousin", text = "If I meet your cousin, I'll pass on nothing at all.", fx = { affinity = 1 } },
  },
}

P:Letter {
  id = "nt_w2_ajeck", npc = "ajeck", random = true, when = { minLevel = 35 },
  subject = "Tracks by the river",
  body = "{class},\n\nI found her tracks by the river this morning, Sin'Dall's, deeper than any tiger's I have ever seen, and so fresh the water was still running into them. I followed them for half a day before they vanished into the rocks above Kurzen's old camp, and I came back to the fire empty-handed and happier than I have been in a month.\n\nMy father used to say that the hunt is mostly waiting, and that a hunter who hates waiting should take up farming. I am learning to love the waiting, I think. It is the only time I feel he is still beside me.\n\nIf you come this way again, I will show you the tracks. I have marked them with a stone.\n\nAjeck Rouack",
  replies = {
    { id = "tracks", text = "Keep the stone in place, Ajeck. I'd like to see those tracks.", fx = { affinity = 1 } },
    { id = "father", text = "Your father would be proud of how you hunt her, Ajeck.", fx = { affinity = 1 } },
    { id = "leave", text = "Maybe Sin'Dall deserves to be left alone, Ajeck.", fx = { affinity = -1, opinion = { big_game_hunting = "distaste" } } },
  },
}
