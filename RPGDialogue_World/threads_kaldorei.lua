-- Kaldorei throughlines: Felwood, Winterspring, Teldrassil and Darkshore (0.80.0).
-- Same structure as threads.lua: at most one beat per conversation, beats of one thread kept
-- apart, later beats acknowledge earlier ones. Beats connect existing Year 1 storylines (the
-- Emerald Circle's Jaedenar work, Donova's firewater chain, Gnarlpine Corruption, The Blackwood
-- Corrupted) and invent no events; nothing later is foreshadowed.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

-- Felwood, from both sides. Talonbranch Glade and Bloodvenom Post each watch the sick forest,
-- the Timbermaw lose their Deadwood cousins to it, and the Emerald Circle traces it to the
-- Jadefire satyrs and the Shadow Council in Jaedenar. Resolves when Greta's last blow lands.
P:Thread {
  id = "felwood_rot",
  theme = "Felwood remembers the demons who walked it, and the Emerald Circle means to make it forget.",
  title = "The sickness of Felwood",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Felwood was green before the demons came to Hyjal, and now the river runs the colour of a bruise. Whichever outpost you sleep in, Talonbranch or Bloodvenom, somebody there will tell you the forest is still being poisoned, and not only by what was left behind.",
      third = "{name} came to Felwood and heard, from the outpost that sheltered {name}, that the forest was still being poisoned." },
    unfolding = { first = "The Timbermaw have lost their Deadwood cousins to the corruption, the Jadefire satyrs keep a well of their own in the ruins, and the Shadow Council holds Jaedenar as though it had always been theirs. The Emerald Circle says it is all one sickness with many mouths.",
      third = "{name} traced Felwood's corruption from the Deadwood furbolgs to the Jadefire satyrs and the Shadow Council in Jaedenar." },
    resolved = { first = "The Shadow Council in Jaedenar has taken a blow it will remember, and Greta Mosshoof held the stone she carries from Mulgore a little less tightly when I told her. Felwood is still sick, but for the first time someone at the Sanctuary talked about it getting better.",
      third = "{name} struck at the Shadow Council in Jaedenar for the Emerald Circle, and Felwood, though still sick, had a little room to breathe." },
  },
  npcs = { "golhine", "trull", "grazle", "eridan", "greta" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The Shadow Council in Jaedenar has been struck hard, and Felwood is still sick but no longer only getting worse.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "The demons left Felwood years ago, and the forest still behaves as though they might come back for it.",
    third = "{name} had walked a forest that the demons left years ago and that still had not forgotten them.",
  },
  beats = {
    -- Alliance: Talonbranch Glade.
    {
      id = "b1_golhine", npc = "golhine",
      when = { faction = "Alliance", minLevel = 48, thread = { id = "felwood_rot", notBeat = "b1_golhine" } },
      text = "This well is the only clean water between here and Ashenvale, and I keep it so by watching it every hour I'm awake. The demons left Felwood long ago, but the satyrs and the Shadow Council stayed behind to tend what they planted, and you'll find their work on every road south of here.",
      fx = { thread = { id = "felwood_rot", beat = "b1_golhine", state = "stirring" }, learn = { "satyrs" } },
    },
    -- Horde: Bloodvenom Post.
    {
      id = "b1_trull", npc = "trull",
      when = { faction = "Horde", minLevel = 48, thread = { id = "felwood_rot", notBeat = "b1_trull" } },
      text = "I write Orgrimmar a report every week, and every week the same word sits in the middle of it, which is Jaedenar. Warlocks of the Shadow Council hold it, the same stripe as the Burning Blade we hunt in Durotar, and they're not hiding there; they're working, and I'd like to know at what.",
      fx = { thread = { id = "felwood_rot", beat = "b1_trull", state = "stirring" }, learn = { "burning_legion" } },
    },
    -- Both: the Timbermaw and the Emerald Circle.
    {
      id = "b2_grazle", npc = "grazle",
      when = { any = { { thread = { id = "felwood_rot", beat = "b1_golhine" } }, { thread = { id = "felwood_rot", beat = "b1_trull" } } },
               ["not"] = { thread = { id = "felwood_rot", beat = "b2_grazle" } } },
      text = "You have come from the outpost with the forest's sickness on your boots, and Grazle can smell it. The Deadwood ate from this land and drank from its river until the sickness was in them too, and now they are not cousins to the Timbermaw any more, only the shape of cousins, and that is a hard thing to put an axe to.",
      fx = { thread = { id = "felwood_rot", beat = "b2_grazle", state = "unfolding" }, learn = { "furbolgs" } },
    },
    {
      id = "b3_eridan", npc = "eridan",
      when = { questDone = TODO_QUEST("The Corruption of the Jadefire"), thread = { id = "felwood_rot", notBeat = "b3_eridan" } },
      text = "You've seen the Jadefire satyrs and the well they keep in the ruins, so you know now that Felwood isn't only sick, it's being kept sick. I still plant my seed every morning, and I've stopped pretending it's anything but stubbornness, because the Shadow Council in Jaedenar is stubborn too.",
      fx = { thread = { id = "felwood_rot", beat = "b3_eridan", state = "unfolding" }, learn = { "satyrs" } },
    },
    {
      id = "b4_greta", npc = "greta",
      when = { any = { { questDone = TODO_QUEST("Forces of Jaedenar") }, { thread = { id = "felwood_rot", beat = "b3_eridan" } } },
               ["not"] = { thread = { id = "felwood_rot", beat = "b4_greta" } } },
      text = "Eridan tells everyone the forest is green underneath, and I hope she's right, but I've walked Jaedenar and I know what keeps it from showing. The Shadow Council drinks from the same water the Deadwood drink, and they like what it does to them, so every warlock you put down there is one less hand stirring the pot.",
      fx = { thread = { id = "felwood_rot", beat = "b4_greta", state = "unfolding" } },
    },
    {
      id = "b5_greta", npc = "greta",
      when = { questDone = TODO_QUEST("A Final Blow"), thread = { id = "felwood_rot", beat = "b4_greta" },
               ["not"] = { thread = { id = "felwood_rot", beat = "b5_greta" } } },
      text = "The Shadow Hold has taken a blow it won't soon forget, and the Council will spend a long while deciding who gives the orders now, which is a long while they aren't spending on this forest. I took the stone I carry from Mulgore out of my pocket this morning and left it on the table, and I can't remember the last time I let go of it.",
      fx = { thread = { id = "felwood_rot", beat = "b5_greta", state = "resolved" } },
    },
  },
}

-- The Winterfall's firewater. Donova studies the furbolgs and fears for them, the Timbermaw at
-- both ends of their hold have watched two cousin tribes go mad, and an Everlook goblin prices
-- the madness out loud. Donova asks the player's counsel; the player decides the ending
-- (springs.lua, `winterfall_word`). Never says who brews the firewater.
P:Thread {
  id = "winterfall_firewater",
  theme = "The Winterfall furbolgs are drinking something that turns them, and nobody can say who pours it.",
  title = "The Winterfall's firewater",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Donova Snowden used to trade the Winterfall fish for news, and now they'd sooner take her arm. Somebody is giving the furbolgs firewater, and whatever is in it is turning them.",
      third = "{name} learned from Donova Snowden that the Winterfall furbolgs were drinking firewater that turned them mad." },
    unfolding = { first = "The Timbermaw watched the Deadwood go mad in Felwood, and now they're watching the Winterfall do the same at the other end of their tunnels. Even Everlook's goblins have noticed, mostly because the madness is bad for trade.",
      third = "{name} heard the Timbermaw at both ends of their hold, and an Everlook goblin besides, speak of the Winterfall's madness." },
    resolved = { first = "I told Donova the Winterfall are sick and not wicked, and that a creature isn't its worst week. She went back to her notebook with her jaw set, and I think she means to cure them out of sheer stubbornness.",
      third = "{name} told Donova Snowden the Winterfall were worth saving, and Donova went back to her work determined to cure them." },
    soured = { first = "I told Donova some of the Winterfall can't be brought back and that Everlook should arm. She said I was probably right, and she said it like a dwarf burying a friend.",
      third = "{name} told Donova Snowden the Winterfall were past saving, and Donova agreed, though it plainly grieved her." },
  },
  npcs = { "donova", "salfa", "nafien", "himmik" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Donova the Winterfall were sick and worth saving. Donova kept working toward a cure.",
    soured = "The player told Donova some of the Winterfall couldn't be brought back and Everlook should arm. Donova agreed, grieving.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Two tribes of furbolgs, one at each end of Timbermaw Hold, and both of them gone mad on something somebody else is pouring.",
    third = "{name} had seen two furbolg tribes, one at each end of Timbermaw Hold, gone mad on something poured for them.",
  },
  beats = {
    {
      id = "b1_donova", npc = "donova",
      when = { minLevel = 52, thread = { id = "winterfall_firewater", notBeat = "b1_donova" } },
      text = "I traded the Winterfall fish for news every spring for years, an' they were shy an' gruff an' perfectly decent about it. This year they came at me wi' clubs an' firewater on their breath, an' I'd like tae know who's pourin' for 'em, because furbolgs dinnae brew like that on their own.",
      fx = { thread = { id = "winterfall_firewater", beat = "b1_donova", state = "stirring" }, learn = { "furbolgs" } },
    },
    {
      id = "b2_salfa", npc = "salfa",
      when = { thread = { id = "winterfall_firewater", beat = "b1_donova" },
               ["not"] = { thread = { id = "winterfall_firewater", beat = "b2_salfa" } } },
      text = "The dwarf at the springs has spoken to you of the Winterfall, Salfa thinks, because you look at this tunnel as if it might be sick too. It is not, and the Timbermaw mean to keep it so, but Salfa's brothers at the southern door watched the Deadwood go mad first, and now Salfa watches the same thing happen here.",
      fx = { thread = { id = "winterfall_firewater", beat = "b2_salfa", state = "unfolding" } },
    },
    {
      id = "b3_nafien", npc = "nafien",
      when = { any = { { thread = { id = "winterfall_firewater", beat = "b1_donova" } }, { thread = { id = "winterfall_firewater", beat = "b2_salfa" } } },
               ["not"] = { thread = { id = "winterfall_firewater", beat = "b3_nafien" } } },
      text = "Salfa sends word from the northern door that the Winterfall stagger and fight each other the way the Deadwood did when their sickness began. The Deadwood had Felwood's water to blame, but the Winterfall live in clean snow, so something is being carried to them, and the Timbermaw would very much like to know by whom.",
      fx = { thread = { id = "winterfall_firewater", beat = "b3_nafien", state = "unfolding" } },
    },
    {
      id = "b4_himmik", npc = "himmik",
      when = { thread = { id = "winterfall_firewater", beat = "b1_donova" },
               ["not"] = { thread = { id = "winterfall_firewater", beat = "b4_himmik" } } },
      text = "Listen, chum, I sell drink for a livin', so I know what it costs, and somebody in Winterfall Village is pourin' it by the barrel for furbolgs without two coppers to rub together. Nobody gives firewater away, so whoever's payin' wants somethin' pricier than a party, and meanwhile my carts go the long way round on my dime.",
      fx = { thread = { id = "winterfall_firewater", beat = "b4_himmik", state = "unfolding" }, learn = { "steamwheedle" } },
    },
    {
      id = "b5_donova", npc = "donova",
      when = { all = { { thread = { id = "winterfall_firewater", beat = "b1_donova" } },
                       { any = { { thread = { id = "winterfall_firewater", beat = "b2_salfa" } }, { thread = { id = "winterfall_firewater", beat = "b3_nafien" } }, { thread = { id = "winterfall_firewater", beat = "b4_himmik" } } } } },
               ["not"] = { thread = { id = "winterfall_firewater", beat = "b5_donova" } } },
      text = "The Timbermaw are worried, an' even the goblins in Everlook are countin' what the Winterfall cost 'em, so it isnae just an old dwarf frettin' any more. Everlook's askin' me whether the furbolgs can be brought back or whether they ought tae hire bruisers for the road, an' I'd value yer answer before I give mine.",
      fx = { thread = { id = "winterfall_firewater", beat = "b5_donova", state = "unfolding" } },
    },
  },
}

-- The rot on both shores. Corithras fears for Teldrassil's moonwells, the Gnarlpine are driven
-- mad with Fel Moss, Rellian finds the same rot in the timberlings, Tharnariun's bears sicken
-- across the water, and Thundris learns a satyr feeds it to the Blackwood. Alliance only;
-- resolves on The Blackwood Corrupted. Invents no culprit beyond the quests' own.
P:Thread {
  id = "both_shores",
  theme = "The same rot that turned the Gnarlpine on Teldrassil is turning the Blackwood across the water.",
  title = "The rot on both shores",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Corithras Moonrage tastes Teldrassil's moonwells himself and swears one of them is wrong. The tree is supposed to be the kaldorei's new beginning, and something is already growing in it that shouldn't be.",
      third = "{name} heard Corithras Moonrage fear for the moonwells of Teldrassil." },
    unfolding = { first = "The Gnarlpine went mad on Fel Moss, Rellian found the rot inside his timberlings, and across the water in Darkshore the thistle bears and the Blackwood furbolgs are sickening the same way. It isn't one shore's trouble; it crossed the sea.",
      third = "{name} found the same rot in the Gnarlpine, the timberlings, Darkshore's bears and the Blackwood furbolgs." },
    resolved = { first = "A satyr was feeding the corruption to the Blackwood through their own food, and it showed itself once the moonwell water went in. Thundris Windweaver says it won't be the last, but at least now Auberdine knows the rot has a hand behind it.",
      third = "{name} drew out the satyr feeding corruption to the Blackwood furbolgs, and Auberdine learned the rot had a hand behind it." },
  },
  npcs = { "corithras", "athridas", "rellian", "tharnariun", "thundris" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The satyr behind the Blackwood's corruption has been drawn out, and Auberdine knows the rot on both shores has a hand behind it.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "The Gnarlpine on one shore and the Blackwood on the other, and both of them were friends of the kaldorei once.",
    third = "{name} had seen the furbolgs of both shores turned, the Gnarlpine and the Blackwood, who were friends of the kaldorei once.",
  },
  beats = {
    {
      id = "b1_corithras", npc = "corithras",
      when = { faction = "Alliance", thread = { id = "both_shores", notBeat = "b1_corithras" } },
      text = "I have tasted every moonwell on Teldrassil, and the water should taste of nothing but cold and starlight. One of them tastes faintly of something else, and the Gnarlpine began to change in the same season, and I do not believe in coincidences that old.",
      fx = { thread = { id = "both_shores", beat = "b1_corithras", state = "stirring" }, learn = { "teldrassil" } },
    },
    {
      id = "b2_athridas", npc = "athridas",
      when = { faction = "Alliance", questDone = TODO_QUEST("Gnarlpine Corruption"), thread = { id = "both_shores", notBeat = "b2_athridas" } },
      text = "Ursal, their own chieftain, fed them the Fel Moss, and they ate it because they trusted him, and that is how a gentle people becomes a raiding one in a single season. What I cannot answer is where a furbolg found fel anything on a tree we grew ourselves, and I would rather not be the only one asking.",
      fx = { thread = { id = "both_shores", beat = "b2_athridas", state = "unfolding" }, learn = { "fel_moss" } },
    },
    {
      id = "b3_rellian", npc = "rellian",
      when = { faction = "Alliance", any = { { thread = { id = "both_shores", beat = "b1_corithras" } }, { thread = { id = "both_shores", beat = "b2_athridas" } } },
               ["not"] = { thread = { id = "both_shores", beat = "b3_rellian" } } },
      text = "You've heard about the Gnarlpine, then, and the moss. I cut open a timberling sprout last week and found the same grey threads in it that Athridas pulls out of the furbolgs, so the rot isn't only in the creatures, it's in the soil they stand on.",
      fx = { thread = { id = "both_shores", beat = "b3_rellian", state = "unfolding" }, learn = { "fel_moss" } },
    },
    {
      id = "b4_tharnariun", npc = "tharnariun",
      when = { faction = "Alliance", minLevel = 12, any = { { thread = { id = "both_shores", beat = "b2_athridas" } }, { thread = { id = "both_shores", beat = "b3_rellian" } } },
               ["not"] = { thread = { id = "both_shores", beat = "b4_tharnariun" } } },
      text = "You have come over from Teldrassil with talk of the Gnarlpine, and I wish I could tell you Darkshore was spared. My bears foam and stagger the way you describe the furbolgs, and the Blackwood in their camps are going the same way, so whatever crossed the water did not need a boat.",
      fx = { thread = { id = "both_shores", beat = "b4_tharnariun", state = "unfolding" }, learn = { "furbolgs" } },
    },
    {
      id = "b5_thundris", npc = "thundris",
      when = { faction = "Alliance", questDone = TODO_QUEST("The Blackwood Corrupted"), thread = { id = "both_shores", notBeat = "b5_thundris" } },
      text = "The satyr showed itself as soon as the moonwell water touched the furbolgs' food, which tells me the rot on this shore was carried here by a hand and did not simply grow. I will write to Dolanaar tonight, because if it was carried to the Blackwood, someone ought to ask who carried it to the Gnarlpine.",
      fx = { thread = { id = "both_shores", beat = "b5_thundris", state = "resolved" }, learn = { "satyrs" } },
    },
  },
}
