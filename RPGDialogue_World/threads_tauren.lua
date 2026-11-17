-- Tauren throughlines: Mulgore, Thunder Bluff, Stonetalon, Thousand Needles and the Barrens.
-- Beats connect existing Year 1 storylines (Kaya's Alive, Grimtotem Spying, Free at Last;
-- Poison Water, Goblin Invaders, the Sludge Fen) and invent no events. Magatha's rivalry is
-- said out loud and nothing more; nothing later is foreshadowed.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

-- The Grimtotem's quiet defiance. Magatha speaks for her kin on Elder Rise and answers for
-- none of them; Sun Rock and Freewind live with what the ones in the hills do.
P:Thread {
  id = "grimtotem",
  theme = "The Grimtotem live inside the tauren nation and answer to none of it, and Magatha says so to Cairne's face.",
  title = "The Grimtotem in the hills",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Magatha Grimtotem lives on Elder Rise, a bridge away from Cairne, and her kin keep the high places of Stonetalon and the Needles. She told me most of what I'd hear about them on the roads would be true, and she didn't sound sorry.",
      third = "{name} heard Magatha Grimtotem speak for her kin in the high places, and heard that she was not sorry for them." },
    unfolding = { first = "The Grimtotem fell on Camp Aparaje and carried off Tammra's niece, and strangers come and go from Darkcloud Pinnacle while Longhorn reads their notes by lamplight. Cairne says the trouble is that the Grimtotem answer to no one, and Magatha says that's no fault at all.",
      third = "{name} followed the Grimtotem's shadow from Camp Aparaje to Darkcloud Pinnacle, and heard Cairne and Magatha disagree about what it meant." },
    resolved = { first = "Lakota Windsong is home at Freewind, and Thalia has untied the knot she kept for her. The Grimtotem still hold their pinnacle and still keep their silence, and that silence is the thing Thalia says she can't forgive.",
      third = "{name} brought Lakota Windsong home to Freewind, though the Grimtotem kept their pinnacle and their silence." },
  },
  npcs = { "magatha", "tammra", "longhorn", "cairne", "thalia" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "Lakota Windsong is home, and the Grimtotem keep their pinnacle and their silence.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Everyone from Sun Rock to Freewind has a word for the Grimtotem, and none of them is 'stranger'. That's what makes it hard.",
    third = "{name} had heard the Grimtotem spoken of from Sun Rock to Freewind, always as kin and never kindly.",
  },
  beats = {
    {
      id = "b1_magatha", npc = "magatha",
      when = { minLevel = 15, thread = { id = "grimtotem", notBeat = "b1_magatha" } },
      text = "You'll hear things about my kin on the roads through Stonetalon and the Needles, child, and some of them will even be true. Cairne would like me to answer for every spear thrown in the high places, and I tell him the Grimtotem kept those peaks long before he came to worry about them.",
      fx = { thread = { id = "grimtotem", beat = "b1_magatha", state = "stirring" }, learn = { "grimtotem" } },
    },
    {
      id = "b2_tammra", npc = "tammra",
      when = { questDone = TODO_QUEST("Kaya's Alive"), thread = { id = "grimtotem", notBeat = "b2_tammra" } },
      text = "Kaya sleeps in her father's tent again, and I'm grateful for every hour of it. But the ones who took her were tauren, {class}, tauren who sing to the Earth Mother just as I do, and I keep wondering whether anyone in Thunder Bluff has asked them why.",
      fx = { thread = { id = "grimtotem", beat = "b2_tammra", state = "unfolding" }, learn = { "grimtotem" } },
    },
    {
      id = "b3_longhorn", npc = "longhorn",
      when = { questDone = TODO_QUEST("Grimtotem Spying"), thread = { id = "grimtotem", notBeat = "b3_longhorn" } },
      text = "I read those notes from the pinnacle more nights than I should. Strangers come and go from Darkcloud, and the Grimtotem still nod to my braves on the canyon roads as though we were kin, which troubles me more than an open fight would.",
      fx = { thread = { id = "grimtotem", beat = "b3_longhorn", state = "unfolding" } },
    },
    {
      id = "b4_cairne", npc = "cairne",
      when = { any = { { thread = { id = "grimtotem", beat = "b2_tammra" } }, { thread = { id = "grimtotem", beat = "b3_longhorn" } } },
               ["not"] = { thread = { id = "grimtotem", beat = "b4_cairne" } } },
      text = "You've walked the high places, and you've come back with the Grimtotem written on your face. Magatha tells me her kin in the hills answer to no one, and I tell her that is exactly what troubles me, and then we both go to our beds unsatisfied.",
      fx = { thread = { id = "grimtotem", beat = "b4_cairne", state = "unfolding" } },
    },
    {
      id = "b5_magatha", npc = "magatha",
      when = { thread = { id = "grimtotem", beat = "b4_cairne" }, ["not"] = { thread = { id = "grimtotem", beat = "b5_magatha" } } },
      text = "So the old bull told you my kin answer to no one. He says it as though it were a fault, child, and in all these years I've never once heard him explain why it should be.",
      fx = { thread = { id = "grimtotem", beat = "b5_magatha" } },
    },
    {
      id = "b6_thalia", npc = "thalia",
      when = { questDone = TODO_QUEST("Free at Last"), thread = { id = "grimtotem", notBeat = "b6_thalia" } },
      text = "Lakota is home, and I've untied the knot at last. The Grimtotem on that pinnacle let Arnak do what he did and never said one word against him, and I find it's the silence I can't forgive, more than the spears.",
      fx = { thread = { id = "grimtotem", beat = "b6_thalia", state = "resolved" }, standing = { freewind = 3 } },
    },
  },
}

-- The Venture Company's long reach: the wells of Mulgore, the mill at Windshear Crag, the
-- Sludge Fen in the Barrens. Tauren grieve it, goblins of the Cartel resent it, and Baine
-- asks the player's counsel before his father asks his. The player decides the ending.
P:Thread {
  id = "venture_mulgore",
  theme = "The Venture Company was told no in Mulgore, and it went on digging everywhere else.",
  title = "The Venture Company's reach",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Venture Company asked to dig in Mulgore and was refused, and the sacred wells have tasted of oil ever since. Now the same company has a mill at Windshear Crag, and Seereth Stonebreak says the spirits of Stonetalon are half blind with the pain of it.",
      third = "{name} learned that the Venture Company had fouled Mulgore's wells and gone on to cut the forests of Stonetalon." },
    unfolding = { first = "Even the goblins of Ratchet curse the Venture Company. Gazlowe says it costs him goodwill with every tauren in Kalimdor, and Sputtervalve says it's pumping the Barrens dry at the Sludge Fen. It's one company, reaching further every season.",
      third = "{name} heard the goblins of Ratchet curse the Venture Company as loudly as any tauren did." },
    resolved = { first = "I told Baine to warn the Venture Company once, as he warned the dwarves at Bael'dun, and then to stop asking. He said his father would hear the same counsel from his son by nightfall.",
      third = "{name} counselled Baine Bloodhoof to warn the Venture Company once and then stop asking, and Baine took the counsel to his father." },
    soured = { first = "I told Baine the Venture Company has more coin than he has braves. He thanked me in a voice that didn't thank me at all, and he hasn't asked my counsel since.",
      third = "{name} told Baine Bloodhoof the Venture Company couldn't be beaten, and Baine stopped asking {name}'s counsel." },
  },
  npcs = { "mull", "seereth", "gazlowe", "sputtervalve", "baine" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Baine to warn the Venture Company once and then stop asking. Baine took that counsel to his father.",
    soured = "The player told Baine the Venture Company had more coin than he had braves. Baine stopped asking the player's counsel.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "The wells in Mulgore, the mill at Windshear Crag, the oil at the Sludge Fen: wherever I go, the Venture Company got there first.",
    third = "{name} had found the Venture Company's work from Mulgore's wells to Stonetalon's mills and the Barrens' oil.",
  },
  beats = {
    {
      id = "b1_mull", npc = "mull",
      when = { thread = { id = "venture_mulgore", notBeat = "b1_mull" } },
      text = "Braves come home from Stonetalon telling of goblin saws at Windshear Crag, and I think of our wells. We told the Venture Company no in Mulgore, {class}, and all it seems to have done is send them looking for land that can't say it back.",
      fx = { thread = { id = "venture_mulgore", beat = "b1_mull", state = "stirring" }, learn = { "venture_company" } },
    },
    {
      id = "b2_seereth", npc = "seereth",
      when = { thread = { id = "venture_mulgore", notBeat = "b2_seereth" } },
      text = "The mill at Windshear Crag works day and night, and every night I hear the trees go quiet one by one. The goblins who poisoned the tauren wells are the same company, {class}, so whatever we do here, Mulgore will feel it too.",
      fx = { thread = { id = "venture_mulgore", beat = "b2_seereth", state = "stirring" }, learn = { "venture_company" } },
    },
    {
      id = "b3_gazlowe", npc = "gazlowe",
      when = { minLevel = 15, thread = { id = "venture_mulgore", notBeat = "b3_gazlowe" } },
      text = "Listen, pal, the Venture boys have a mill up at Windshear Crag chewin' through Stonetalon like a shredder through a picnic, and every tauren who comes down off those hills looks at me like I signed the invoice. I didn't, but I'm the one payin' for it in goodwill, and goodwill's the hardest coin there is to mint.",
      fx = { thread = { id = "venture_mulgore", beat = "b3_gazlowe", state = "unfolding" }, learn = { "venture_company" } },
    },
    {
      id = "b4_sputtervalve", npc = "sputtervalve",
      when = { any = { { thread = { id = "venture_mulgore", beat = "b1_mull" } }, { thread = { id = "venture_mulgore", beat = "b2_seereth" } }, { thread = { id = "venture_mulgore", beat = "b3_gazlowe" } } },
               ["not"] = { thread = { id = "venture_mulgore", beat = "b4_sputtervalve" } } },
      text = "Oh, you've heard about the wells and the forest too, have you? It's the same Venture boys pumping oil out at the Sludge Fen, pal, the very same, and they'll drink the Barrens dry and send the tauren a bill for the holes, which is bad for business, everybody's business, and especially mine.",
      fx = { thread = { id = "venture_mulgore", beat = "b4_sputtervalve", state = "unfolding" } },
    },
    {
      id = "b5_baine", npc = "baine",
      when = { all = { { thread = { id = "venture_mulgore", beat = "b1_mull" } },
                       { any = { { thread = { id = "venture_mulgore", beat = "b2_seereth" } }, { thread = { id = "venture_mulgore", beat = "b3_gazlowe" } }, { thread = { id = "venture_mulgore", beat = "b4_sputtervalve" } } } } },
               ["not"] = { thread = { id = "venture_mulgore", beat = "b5_baine" } } },
      text = "Mull tells me of the wells every morning, and travellers tell me of Windshear Crag and the Sludge Fen, and it is all the same company reaching a little further each season. My father will ask soon what his son would do about them, and I'd value a friend's counsel before he does.",
      fx = { thread = { id = "venture_mulgore", beat = "b5_baine", state = "unfolding" } },
    },
  },
}
