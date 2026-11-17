-- Letters (0.80.0): what people you've met write to you, waiting at the mailbox.
-- P:Letter { id, npc (who writes; they write only once you've spoken with them, unless
-- stranger = true), from (signature, else the NPC's name), subject, body (tokens work),
-- when (sent once this holds, checked every minute) or sent by a dialogue fx = { letter = id },
-- delay (seconds from sending to the mailbox, default 1800), journal, fx (applied on reading) }.
local P = RPGDialogueAPI:Pack("rpgd.world")

---------------------------------------------------------------------------
-- Topper McNabb and Elsie (Stormwind: Topper's "Send them anyway")
---------------------------------------------------------------------------
P:Letter {
  id = "topper_true_letter", npc = "topper", delay = 3600,
  subject = "I sent one",
  body = "{name},\n\nI'm writing this on the back of a bread wrapper because the clerk at the mail office charges for paper, and I wanted you to know before I lost my nerve again. I sent one. Not the six in my coat, which are still in my coat, but a new one that I wrote last night under the lamp by the canal.\n\nI told her the truth. I told her I sleep in the doorway by the Pig and Whistle and that I'm not a farmer yet and that I might not ever be one. I told her I still have the seed potatoes, which is a lie, because I ate them the second winter, but a man can only be so honest in one letter.\n\nIf she doesn't write back, that's an answer too, and I'll thank you all the same for pushing me.\n\nYour friend in the Trade District,\nTopper McNabb",
}

P:Letter {
  id = "elsie_reply", from = "Elsie McNabb", stranger = true, delay = 5400,
  when = { letter = "topper_true_letter" },
  subject = "From Lakeshire",
  body = "To the friend of Topper McNabb,\n\nYou don't know me, but my husband wrote that a stranger in the city told him to stop lying to his wife, and he put your name at the bottom so I could thank you. So I am writing to you as well as to him.\n\nFour years I've had letters saying the city was kind, and I knew every one of them was a story, because Topper only ever tells the truth when he's frightened. This one frightened him, so I believed it.\n\nThere is a plot of land behind my sister's house that nobody wants because the gnolls come up from the river now and then. I have told him it is his if he wants to dig it and doesn't mind a pitchfork by the door. Light keep you, and if he hasn't started walking by the spring, you have my leave to drag him.\n\nElsie McNabb, Lakeshire",
}

---------------------------------------------------------------------------
-- Dungeons, for people who asked you to go
---------------------------------------------------------------------------
P:Letter {
  id = "gryan_deadmines", npc = "gryan", delay = 1800,
  when = { cleared = "The Deadmines", faction = "Alliance" },
  subject = "From Sentinel Hill",
  body = "{name},\n\nA scout came up the road this morning with mud to his knees and a grin I haven't seen on a Westfall face in years. He says Edwin VanCleef is dead in the belly of his own ship, and that it was you who did it.\n\nIt doesn't mend everything. There are still Defias in the fields, and there are still families who will never come back to Moonbrook, and some of those masked men were farmers I knew by name before the hunger turned them. But the head is off the snake, and the hill slept easy last night for the first time since I raised the banner.\n\nThe militia drinks to you tonight, and there is a bunk on Sentinel Hill with your name on it whenever you pass through.\n\nGryan Stoutmantle\nThe People's Militia",
}

P:Letter {
  id = "thrall_ragefire", npc = "thrall", delay = 1800,
  when = { cleared = "Ragefire Chasm", faction = "Horde" },
  subject = "Beneath the city",
  body = "{name},\n\nWord reached Grommash Hold that the Searing Blade cult beneath our streets has been broken, and that Taragaman the Hungerer will trouble no more of our young ones. I am told you went down into the chasm when others were content to complain about the smell of it.\n\nThere are those in my own city who still listen to the Burning Blade and think the old power can be taken back without its price. They are wrong, and you have shown them so with steel rather than speeches, which is the only argument some of them will ever hear.\n\nThe Horde is stronger for what you did in the dark. Do not let anyone tell you that work done out of sight is lesser work.\n\nThrall, Warchief of the Horde",
}

P:Letter {
  id = "cairne_wailing", npc = "cairne", delay = 1800,
  when = { cleared = "Wailing Caverns", faction = "Horde" },
  subject = "The dreamer",
  body = "{name},\n\nThe Earth Mother has whispered to the elders that the land around the Wailing Caverns breathes a little easier, and the disciple who waited at the cave mouth has sent word that the Fanglords no longer walk its tunnels. I give thanks that you went where the Druids of the Fang had lost their way.\n\nThe Barrens were green once, young one. My grandfather remembered them so, and Naralex dreamed of making them green again. Whether his dream comes true is in hands older than ours, but you have given it a chance where there was none.\n\nWalk with the Earth Mother, and come to Thunder Bluff when your road allows. There will be a place for you by my fire.\n\nCairne Bloodhoof, High Chieftain",
}

P:Letter {
  id = "sylvanas_shadowfang", npc = "sylvanas", delay = 2400,
  when = { cleared = "Shadowfang Keep", faction = "Horde" },
  subject = "Arugal",
  body = "{name},\n\nThe Dark Lady has been informed that the archmage Arugal is no longer among the living, nor among the dead who serve themselves. His wolves will hunt in Silverpine without a master now, and the Deathstalkers will see that they do not hunt for long.\n\nShe does not write letters of thanks. She has, however, instructed me to tell you that she remembers who is useful to her, and that this is a better thing to be remembered for than most.\n\nBurn this when you have read it.\n\nBy the hand of Varimathras, for Lady Sylvanas Windrunner",
}

P:Letter {
  id = "dughan_westfall", npc = "dughan", delay = 1800,
  when = { cleared = "The Deadmines", faction = "Alliance" },
  subject = "A word from Goldshire",
  body = "{name},\n\nYou'll forgive the short note; the Brotherhood's leftovers still keep me busy in the vineyards, and the paperwork from the Keep has not grown any lighter. I hear from Sentinel Hill that VanCleef is finished and that it was your doing.\n\nI asked Stormwind for soldiers more times than I care to count, and I was told each time that Elwynn was adequately garrisoned. It seems the Crown was right, though not in the way it meant. I'm grateful, and I'll say so in my next report, whether anyone in the Keep reads it or not.\n\nMarshal Dughan, Goldshire",
}

P:Letter {
  id = "jaina_theramore", npc = "jaina", delay = 3600,
  when = { minLevel = 40, faction = "Alliance" },
  subject = "An open door in Theramore",
  body = "{name},\n\nI hope this finds you well, wherever the road has taken you. My aides keep a list of the people whose names come up in the reports from the marsh and the Barrens, and yours has come up often enough that I wanted to write to you myself.\n\nTheramore is a small place, and we keep the peace with the Horde by being patient with people who would much rather we weren't. I could use more friends who understand that a sword is the last answer and not the first. If you are ever in Dustwallow Marsh, the tower door is open to you, and the tea is better than the reputation of the Isle would suggest.\n\nWith regards,\nJaina Proudmoore, Lady of Theramore",
}
