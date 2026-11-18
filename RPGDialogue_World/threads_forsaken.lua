-- Forsaken throughlines: Tirisfal, the Undercity and Silverpine.
-- Varimathras and the Society are written straight: loyal, proud and busy. Nothing later
-- than Year 1 is foreshadowed; any irony belongs to the reader.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

-- The new plague. The Royal Apothecary Society's work runs from Johaan's fields in Brill
-- through Renferrel's crypt at the Sepulcher to Faranell's bench, and the Dark Lady calls
-- it a fitting answer to the plague that made her people. Thrall took the Forsaken in with
-- his eyes open and asks the player what they saw; the player's answer decides the ending
-- (Thrall's plague_word node, RPGDialogue_Orgrimmar/npcs/orgrimmar.lua).
P:Thread {
  id = "new_plague",
  theme = "The Forsaken are brewing a plague of their own for the Scourge, and the Horde's Warchief watched the last plague empty a kingdom.",
  title = "The new plague",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Apothecary Johaan says the Royal Apothecary Society is making a new plague, a Forsaken one, and every bottle he fills in Brill goes on down the road toward the Undercity. It's meant for the Scourge, he says, and he says it quickly.",
      third = "{name} heard Apothecary Johaan in Brill speak of a new plague, made by Forsaken hands and meant for the Scourge." },
    unfolding = { first = "Johaan's crops from Brill, Renferrel's samples from Silverpine and Lydon's colloid from Tarren Mill all end up on Master Apothecary Faranell's bench, and the Dark Lady calls the result a fitting answer to the plague that made her people. Even Thrall has asked me what they're brewing beneath Lordaeron.",
      third = "{name} followed the Royal Apothecary Society's work from Brill to the Apothecarium, and Thrall himself asked {name} what was being brewed beneath Lordaeron." },
    resolved = { first = "I told Thrall the Society's plague is aimed at the Scourge. He said he'd take that as a warrior's word, and hold the Dark Lady to it until she gave him a reason not to.",
      third = "{name} told Thrall the Forsaken plague was aimed at the Scourge, and the Warchief took it as a warrior's word." },
    soured = { first = "I told Thrall that a plague is a plague, whoever brews it. He thanked me for saying it plainly, and said he'd be listening for news out of Lordaeron more closely than he'd like.",
      third = "{name} told Thrall a plague is a plague, whoever brews it, and the Warchief began listening more closely for news out of Lordaeron." },
  },
  npcs = { "johaan", "renferrel", "faranell", "varimathras", "sylvanas", "thrall" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Thrall the Society's plague was aimed at the Scourge, and he took it as a warrior's word, to hold the Dark Lady to.",
    soured = "The player told Thrall a plague is a plague, whoever brews it, and he began listening more closely for news out of Lordaeron.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Brill, the Sepulcher, the Apothecarium: every apothecary I've met says the new plague is for the Scourge, and every one of them says it a little too quickly.",
    third = "{name} had heard from three apothecaries that the new plague was meant for the Scourge, and had noticed how quickly each of them said it.",
  },
  beats = {
    {
      id = "b1_johaan", npc = "johaan",
      when = { minLevel = 6, thread = { id = "new_plague", notBeat = "b1_johaan" } },
      text = "A new plague, friend, made by Forsaken hands, and every bottle I fill in Brill goes down the road to the Sepulcher and then on to the Master Apothecary. When it's finished, the Scourge will learn what it feels like to be on the wrong end of a recipe.",
      fx = { thread = { id = "new_plague", beat = "b1_johaan", state = "stirring" }, learn = { "new_plague" } },
    },
    {
      id = "b2_renferrel", npc = "renferrel",
      when = { any = { { thread = { id = "new_plague", beat = "b1_johaan" } }, { questActive = TODO_QUEST("Delivery to Silverpine Forest") } },
               ["not"] = { thread = { id = "new_plague", beat = "b2_renferrel" } } },
      text = "Johaan's packages reach me cracked about half the time, which he blames on the road and I blame on Johaan. Whatever survives goes into my work here, and whatever survives my work goes to Faranell, because only the Master Apothecary ever sees the whole recipe.",
      fx = { thread = { id = "new_plague", beat = "b2_renferrel", state = "stirring" }, learn = { "new_plague" } },
    },
    {
      id = "b3_faranell", npc = "faranell",
      when = { any = { { thread = { id = "new_plague", beat = "b2_renferrel" } }, { questActive = TODO_QUEST("A Recipe For Death") } },
               ["not"] = { thread = { id = "new_plague", beat = "b3_faranell" } } },
      text = "Brill sends me its crops, the Sepulcher sends me what grows in Silverpine, and Lydon sends his colloid from Tarren Mill, and all of it ends up here on my bench! Every drop is a little of the Scourge's own plague turned round to face them, and isn't that marvellous?",
      fx = { thread = { id = "new_plague", beat = "b3_faranell", state = "unfolding" }, learn = { "new_plague" } },
    },
    {
      id = "b4_varimathras", npc = "varimathras",
      when = { thread = { id = "new_plague", beat = "b3_faranell" }, ["not"] = { thread = { id = "new_plague", beat = "b4_varimathras" } } },
      text = "You've been down among Faranell's bottles, I can smell it on you. The Dark Lady asks after the Apothecarium every evening, and I carry the Master Apothecary's reports to her myself, faithfully, as I carry her everything.",
      fx = { thread = { id = "new_plague", beat = "b4_varimathras" } },
    },
    {
      id = "b5_sylvanas", npc = "sylvanas",
      when = { any = { { thread = { id = "new_plague", beat = "b3_faranell" } }, { thread = { id = "new_plague", beat = "b4_varimathras" } } },
               ["not"] = { thread = { id = "new_plague", beat = "b5_sylvanas" } } },
      text = "You've walked the whole road of my apothecaries' work, from Johaan's fields to Faranell's bench. The Lich King made us with a plague and we will answer him with one, and if my allies in Orgrimmar flinch at the word, let them flinch; they did not die of the last one.",
      fx = { thread = { id = "new_plague", beat = "b5_sylvanas", state = "unfolding" }, learn = { "new_plague" } },
    },
    {
      id = "b6_thrall", npc = "thrall",
      when = { faction = "Horde",
               any = { { thread = { id = "new_plague", beat = "b3_faranell" } }, { thread = { id = "new_plague", beat = "b5_sylvanas" } } },
               ["not"] = { thread = { id = "new_plague", beat = "b6_thrall" } } },
      text = "You've been beneath Lordaeron, and you carry the Apothecarium's smell into my hall. I took the Forsaken into the Horde with my eyes open, but I watched the last plague empty a kingdom, so when you're ready, tell me honestly what they're brewing down there.",
      fx = { thread = { id = "new_plague", beat = "b6_thrall", state = "unfolding" } },
    },
  },
}

-- Arugal's children. Dalaran sent the archmage Arugal against the Forsaken; he called worgen
-- out of the dark and lost himself to them in Shadowfang Keep. Silverpine counts the cost
-- from every side: Hadrec's missing scouts, Rane Yorick's window on Pyrewood, Faerleia under
-- the town hall, Dalar's grudge, and a blind smith who only hears the howling. Ends when the
-- player clears Shadowfang Keep (beat-driven; Pyrewood's curse stays, as in game).
P:Thread {
  id = "arugal_wolves",
  theme = "A Dalaran mage called wolves out of the dark to fight the Forsaken, and now Silverpine belongs to them.",
  title = "Arugal's children",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "High Executor Hadrec sends deathstalkers south toward Pyrewood, and fewer of them come back every month. The worgen there answer to Arugal in Shadowfang Keep, and Rane Yorick says the whole village goes out on four legs when the sun sets.",
      third = "{name} heard of the worgen of Silverpine, who answered to Arugal in Shadowfang Keep, and of the village of Pyrewood, which went out on four legs at night." },
    unfolding = { first = "Faerleia says Pyrewood's Council knows exactly what it turns into, and still meets every morning to vote on fences. Dalar says Dalaran sent Arugal to deal with the Forsaken, and he reached somewhere no sensible mage reaches and came back with wolves.",
      third = "{name} learned from a deathstalker and a dead archmage how Arugal's wolves came to Silverpine, and how Pyrewood lived with them." },
    resolved = { first = "Arugal is dead in his keep. Pyrewood still goes out on four legs every night, but Rane Yorick says they run in circles now, with nobody left to call them home.",
      third = "{name} saw Arugal dead in Shadowfang Keep, and Rane Yorick watched his worgen run without a master." },
  },
  npcs = { "hadrec", "yorick", "faerleia", "dalar", "wallace" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "Arugal is dead in Shadowfang Keep. Pyrewood's curse remains, but the worgen run without a master, and the Sepulcher's scouts walk the south road again.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "An executor counting scouts, a deathstalker counting wolves and a dead archmage counting Dalaran's mistakes: everyone in Silverpine keeps a tally of Arugal.",
    third = "{name} had found that everyone in Silverpine kept some kind of tally of Arugal and his wolves.",
  },
  beats = {
    {
      id = "b1_hadrec", npc = "hadrec",
      when = { minLevel = 12, thread = { id = "arugal_wolves", notBeat = "b1_hadrec" } },
      text = "I send deathstalkers south along the Pyrewood road, and every month fewer of them come back to report. The worgen there answer to Arugal in his keep, and they hunt like soldiers who've been given orders, not like wolves.",
      fx = { thread = { id = "arugal_wolves", beat = "b1_hadrec", state = "stirring" }, learn = { "worgen" } },
    },
    {
      id = "b2_yorick", npc = "yorick",
      when = { thread = { id = "arugal_wolves", beat = "b1_hadrec" }, ["not"] = { thread = { id = "arugal_wolves", beat = "b2_yorick" } } },
      text = "Hadrec's been telling you about his missing scouts, then; this window is where they were meant to report. Pyrewood bakes its bread and mends its fences by day like any village in Lordaeron, and when the sun goes down, the whole of it goes out on four legs.",
      fx = { thread = { id = "arugal_wolves", beat = "b2_yorick", state = "stirring" }, learn = { "worgen" } },
    },
    {
      id = "b3_faerleia", npc = "faerleia",
      when = { any = { { thread = { id = "arugal_wolves", beat = "b2_yorick" } }, { questActive = TODO_QUEST("Pyrewood Ambush") } },
               ["not"] = { thread = { id = "arugal_wolves", beat = "b3_faerleia" } } },
      text = "Rane watches this village from her window and I watch it from under the town hall stairs, and between us we've learned that the curse isn't the worst of Pyrewood. The worst of it is the Council, who know exactly what they turn into and still sit down every morning to vote on the fences.",
      fx = { thread = { id = "arugal_wolves", beat = "b3_faerleia", state = "unfolding" } },
    },
    {
      id = "b4_dalar", npc = "dalar",
      when = { any = { { thread = { id = "arugal_wolves", beat = "b1_hadrec" } }, { questActive = TODO_QUEST("Arugal's Folly") } },
               ["not"] = { thread = { id = "arugal_wolves", beat = "b4_dalar" } } },
      text = "Dalaran sent Arugal to deal with the Forsaken, and he reached somewhere no sensible mage reaches and came back with wolves. Now he sits in Shadowfang Keep calling them his children, and I'd wager my second death the Kirin Tor have already tidied him out of their records.",
      fx = { thread = { id = "arugal_wolves", beat = "b4_dalar", state = "unfolding" }, learn = { "worgen" } },
    },
    {
      id = "b5_wallace", npc = "wallace",
      when = { any = { { thread = { id = "arugal_wolves", beat = "b1_hadrec" } }, { thread = { id = "arugal_wolves", beat = "b2_yorick" } } },
               ["not"] = { thread = { id = "arugal_wolves", beat = "b5_wallace" } } },
      text = "The howling's changed since spring, friend. It used to be one wolf and then another whenever they pleased, and now they call in turn, one after the other, like soldiers answering a roll call.",
      fx = { thread = { id = "arugal_wolves", beat = "b5_wallace" } },
    },
    {
      id = "b6_yorick", npc = "yorick",
      when = { cleared = "Shadowfang Keep", faction = "Horde", thread = { id = "arugal_wolves", notBeat = "b6_yorick" } },
      text = "Pyrewood still goes out on four legs every night, because killing Arugal didn't lift the curse, but now they run in circles with nobody calling them home. I've even started sleeping a little, which for one of us means sitting very still with my eyes shut.",
      fx = { thread = { id = "arugal_wolves", beat = "b6_yorick", state = "resolved" }, standing = { sepulcher = 3 } },
    },
  },
}
