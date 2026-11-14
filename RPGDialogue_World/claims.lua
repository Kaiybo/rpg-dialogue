-- NPC claims: what people say, and whether it's true. The truth behind a lie is canon
-- or deliberately left open (DESIGN.md / CONTENT_GUIDE.md).
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Claim {
  id = "defias_common_thieves", by = "dughan", truth = "partly",
  text = "The Defias are common thieves and nothing more.",
  truthNote = "They do rob, but they are an organized brotherhood with leadership (canon). Dughan plays it down to keep Goldshire calm.",
  exposedBy = { "mcbride.e_dughan_thieves", "quest:The Collector", "quest:Manhunt" },
}

P:Claim {
  id = "defias_trained", by = "mcbride", truth = "true",
  text = "Someone is training the Defias.",
  truthNote = "The Brotherhood is organized under its leaders (canon). McBride doesn't know who.",
}

P:Claim {
  id = "murlocs_in_elwynn", by = "remy", truth = "true",
  text = "Murlocs are moving up the rivers into eastern Elwynn.",
  truthNote = "Confirmed by the Further Concerns chain (lost guards, Rolf's fate).",
  exposedBy = { "quest:Further Concerns" },
}

P:Claim {
  id = "remy_only_buyer", by = "remy", truth = "false",
  text = "Nobody in Elwynn buys gold dust but Remy.",
  truthNote = "The Collector receives gold shipments from Elwynn's mines (The Collector quest).",
  exposedBy = { "quest:The Collector" },
}

P:Claim {
  id = "hogger_unbeatable", by = "farley", truth = "false",
  text = "Hogger can't be killed; every hunter who tried came back on a cart.",
  truthNote = "Inn talk. Hogger can be killed (the bounty).",
  exposedBy = { "quest:WANTED: \"Hogger\"" },
}

P:Claim {
  id = "stormwind_abandoned_westfall", by = "danuvin", truth = "true",
  text = "Stormwind abandoned Westfall to the Defias.",
  truthNote = "Canon: Westfall's noble house was corrupted and Stormwind gave no military support; Gryan founded the People's Militia because of it. The city's reasons are its own (Bolvar's line gives his view).",
}

P:Claim {
  id = "gnolls_with_defias", by = "danuvin", truth = "true",
  text = "Westfall's gnolls work with the thieves in the mines.",
  truthNote = "Patrolling Westfall (Classic): Danuvin says the gnolls work with the Deadmines thieves.",
}

P:Claim {
  id = "prestor_patience", by = "katrana", truth = "false",
  text = "The crown should wait out the Defias; Westfall can fend for itself.",
  truthNote = "Canon: Lady Prestor is Onyxia and secretly backed VanCleef; her counsel serves her. Never revealed in dialogue before The Great Masquerade.",
  exposedBy = { "quest:The Great Masquerade" },
}

-- Player claims: things the player can say about themselves. trueWhen checks them against
-- real history; NPCs who could know may call the player out (condition lieCaught).
P:Claim {
  id = "player_killed_hogger", by = "player", truth = "unknown",
  text = "The player says they killed Hogger.",
  truthNote = "True only if the player turned in the Hogger bounty.",
  trueWhen = { questDone = TODO_QUEST("WANTED: \"Hogger\"") },
}

P:Claim {
  id = "kalaran_father", by = "kalaran", truth = "false",
  text = "The Dark Iron butchered Kalaran Windblade's father in the Searing Gorge.",
  truthNote = "Kalaran is a black drake in human disguise; the story is his invention to get adventurers to do his work (Kalaran Windblade, warcraft.wiki.gg). Exposed when his quests end and he shows himself.",
  exposedBy = { "quest:Squire Maltrake" },
}

-- The Riverglades (Forever)
P:Claim {
  id = "stormwind_abandoned_riverglades", by = "demar", truth = "partly",
  text = "Stormwind left the Riverglades to the Horde out of cowardice.",
  truthNote = "Stormwind did judge the land lost in the First War and turned to the home front (Ashe Amberhall's gossip, Riverglades page). 'Cowards' is Demar's word (his gossip); Ashe says she agrees with Stormwind's reasoning and fights anyway. Disputed inside Farholde itself.",
  open = true,
}

P:Claim {
  id = "fern_lives", by = "gray", truth = "unknown",
  text = "Fern Crimsonleaf survived the night she killed the Horde's leaders outside Farholde.",
  truthNote = "Her memorial: whereabouts unknown, presumed dead; the book says the same. Deliberately open: nobody in the addon settles it.",
  open = true,
}

P:Claim {
  id = "chogall_in_riverglades", by = "zizplink", truth = "unknown",
  text = "Cho'gall himself came to the Riverglades after Gul'dan fell.",
  truthNote = "A Wartorn Land and The Brotherhood, page 4: reports of it 'were but a whisper'. Left open.",
  open = true,
}

P:Claim {
  id = "melbin_built_port", by = "melbin", truth = "unknown",
  text = "Powderfuse Port was a vacant lot until Melbin Powderfuse built every board of it, and it all belongs to him.",
  truthNote = "His own gossip; nothing confirms or denies it. Other goblins in the port have their doubts. Left open.",
  open = true,
}
