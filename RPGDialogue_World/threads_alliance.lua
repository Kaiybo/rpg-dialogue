-- Throughlines across the Alliance's roads and the southern desert (0.78.0).
-- missing_diplomat: the Classic chain from the Keep to Old Town, Menethil and Theramore.
-- dwarves_and_dark_iron: the broken Thandol Span, Dun Modr and Ironforge's thin Reserve;
--   the player decides what Rhag Garmason tells his dwarves (RPGDialogue_Wetlands/npcs/dunmodr.lua).
-- silithus_stirring: the silithid on the move from Tanaris to the Scarab Wall (neutral, 50-60).
-- Beats connect quest facts and bible opinions; they invent no major events.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

-- The Missing Diplomat (Alliance, ~25-30). Bishop DeLavey, Dashel Stonefist, Mikhail,
-- Archmage Tervosh, Jaina. The chain's outcome stands: the trail ends at Sentry Point,
-- inside Theramore's own colours, and the man Stormwind sent is still missing.
P:Thread {
  id = "missing_diplomat",
  theme = "A man the court sent to Theramore never arrived, and the people who know why would all rather talk about something else.",
  title = "The missing diplomat",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "A man the court sent to Theramore never got there, and the court has found other things to talk about. Bishop DeLavey hasn't, and an Old Town brawler admits he took coin for a part in it.",
      third = "{name} learned that a diplomat bound for Theramore had vanished, and that the court would rather not discuss it." },
    unfolding = { first = "The trail runs from a Stormwind tavern to a quiet bar in Menethil and over the sea to Dustwallow, and Archmage Tervosh says it ends somewhere inside Theramore's own colours.",
      third = "{name} followed the missing diplomat's trail from Stormwind to Menethil and across the sea to Theramore." },
    resolved = { first = "The trail ended at Sentry Point, with one of Lady Proudmoore's own soldiers. Stormwind's man is still missing, and whoever paid for it is still out there, but Jaina knows who sold her, and she knows I'm the one who brought it to her door.",
      third = "{name} followed the missing diplomat's trail to Sentry Point, where it ended inside Theramore's own colours." },
  },
  npcs = { "delavey", "dashel", "mikhail", "tervosh", "jaina" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The trail ended at Sentry Point inside Theramore's own colours. The diplomat is still missing, but Jaina knows who sold her.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "A bishop, a brawler, a barman and an archmage have each told me a piece of this, and all four lowered their voices to do it.",
    third = "{name} had heard of the missing diplomat from a bishop, a brawler, a barman and an archmage, and each of them had lowered their voice.",
  },
  beats = {
    {
      id = "b1_delavey", npc = "delavey",
      when = { minLevel = 24, thread = { id = "missing_diplomat", notBeat = "b1_delavey" } },
      text = "A man this court sent to Theramore never arrived, and the court has found other things to talk about. Lady Prestor tells us rumour does more harm than any Defias blade, and perhaps she's right, but I mislike a silence that suits so many people.",
      fx = { thread = { id = "missing_diplomat", beat = "b1_delavey", state = "stirring" }, learn = { "defias" } },
    },
    {
      id = "b2_dashel", npc = "dashel",
      when = { any = { { thread = { id = "missing_diplomat", beat = "b1_delavey" } }, { questActive = TODO_QUEST("The Missing Diplomat") } },
               ["not"] = { thread = { id = "missing_diplomat", beat = "b2_dashel" } } },
      text = "Aye, I took coin for a part in that diplomat business, an' I'll no' say I'm proud of it. The fella payin' had soft hands an' kept lookin' at the door like a Defias does, an' when my part went sour, they sent for Slim in Menethil instead.",
      fx = { thread = { id = "missing_diplomat", beat = "b2_dashel", state = "stirring" } },
    },
    {
      id = "b3_mikhail", npc = "mikhail",
      when = { any = { { thread = { id = "missing_diplomat", beat = "b2_dashel" } }, { questActive = TODO_QUEST("The Missing Diplomat") } },
               ["not"] = { thread = { id = "missing_diplomat", beat = "b3_mikhail" } } },
      text = "Slim Jahn drank in here for a month on coin he never earned, and he talked about the Theramore boat the way a man talks about a debt. Whatever went from Menethil to Dustwallow, it went quietly, and nothing goes quietly through a harbour by accident.",
      fx = { thread = { id = "missing_diplomat", beat = "b3_mikhail", state = "unfolding" } },
    },
    {
      id = "b4_tervosh", npc = "tervosh",
      when = { thread = { id = "missing_diplomat", beat = "b3_mikhail" }, ["not"] = { thread = { id = "missing_diplomat", beat = "b4_tervosh" } } },
      text = "Mikhail sent you on to us, I expect, since nobody else in Menethil ever sends us anything but fish. The trail you're following runs into Theramore's own colours, I'm afraid, and the Lady is taking that harder than she lets anyone see.",
      fx = { thread = { id = "missing_diplomat", beat = "b4_tervosh", state = "unfolding" } },
    },
    {
      id = "b5_jaina", npc = "jaina",
      when = { questDone = TODO_QUEST("The Missing Diplomat"), thread = { id = "missing_diplomat", beat = "b4_tervosh" },
               ["not"] = { thread = { id = "missing_diplomat", beat = "b5_jaina" } } },
      text = "The trail ended at Sentry Point, inside my own colours, and I'll carry that longer than you might think. Stormwind's man is still missing and whoever paid for it is still out there, but you brought the truth to my door, and I won't forget it.",
      fx = { thread = { id = "missing_diplomat", beat = "b5_jaina", state = "resolved" } },
    },
  },
}

-- The dwarves' road (Alliance, ~20-30). The Dark Irons broke the Thandol Span and took Dun
-- Modr; the Dragonmaw hold Grim Batol; Ironforge's Reserve is spread across the Loch, the
-- Span and the Alliance's wars, and Refuge Pointe has none to spare (Plea To The Alliance).
-- Rhag Garmason asks the player what to tell his dwarves: that ending lives in his file.
P:Thread {
  id = "dwarves_and_dark_iron",
  theme = "The Dark Irons broke the Thandol Span, and every dwarf between Menethil and Ironforge is waiting on soldiers who are needed everywhere else.",
  title = "The broken Span",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Dark Irons blew the Thandol Span and took Dun Modr, and the Dragonmaw sit over Grim Batol. With Dun Algaz watched and the Span broken, Menethil's harbour is about all that joins Khaz Modan to the rest of the Alliance.",
      third = "{name} learned how the Dark Irons broke the Thandol Span and left Menethil's harbour holding Khaz Modan to the Alliance." },
    unfolding = { first = "Longbraid writes to Ironforge every week and asks Refuge Pointe for shields besides. King Magni reads every letter, and has no Reserve left to send; Captain Nials has Stromgarde to win back. Rhag Garmason holds the wall at Dun Modr and waits.",
      third = "{name} carried the dwarves' troubles from Dun Modr to Ironforge and Refuge Pointe, and found everyone sorry and no one with soldiers to spare." },
    resolved = { first = "I told Rhag that the King hasn't forgotten Dun Modr. It isn't an army, but his dwarves stand a little straighter on the wall for it.",
      third = "{name} told Rhag Garmason that Ironforge hadn't forgotten Dun Modr, and his dwarves stood straighter for it." },
    soured = { first = "I told Rhag to stop waiting on Ironforge. He's stopped asking travellers about reinforcements, and Dun Modr holds because it's there.",
      third = "{name} told Rhag Garmason to stop waiting on Ironforge, and he stopped asking about reinforcements." },
  },
  npcs = { "stoutfist", "longbraid", "wl_rhag", "magni", "nials", "hinderweir" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Rhag Garmason that Ironforge hadn't forgotten Dun Modr, and his dwarves stood straighter on the wall for it.",
    soured = "The player told Rhag Garmason to stop waiting on Ironforge. He stopped asking travellers about reinforcements.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Menethil, Dun Modr, Ironforge and Refuge Pointe all say the Span matters, and not one of them has soldiers to spare for it.",
    third = "{name} had heard from Menethil to Ironforge that the Thandol Span mattered, and that someone else ought to send the soldiers.",
  },
  beats = {
    {
      id = "b1_stoutfist", npc = "stoutfist",
      when = { minLevel = 20, thread = { id = "dwarves_and_dark_iron", notBeat = "b1_stoutfist" } },
      text = "Shut Dun Algaz an' the Thandol Span both, an' this harbour's all that joins Khaz Modan tae the rest o' the Alliance. The Dark Irons know it an' the Dragonmaw know it, an' I'd sleep better if Ironforge remembered it.",
      fx = { thread = { id = "dwarves_and_dark_iron", beat = "b1_stoutfist", state = "stirring" }, learn = { "thandol_span", "dragonmaw" } },
    },
    {
      id = "b2_longbraid", npc = "longbraid",
      when = { minLevel = 20, thread = { id = "dwarves_and_dark_iron", notBeat = "b2_longbraid" } },
      text = "I lost the better part o' my company at Grim Batol tae the Dragonmaw an' their red dragons, an' the Dark Irons broke the Span while we were still countin' the dead. Dun Modr fell between the one enemy an' the other, an' I'll forgive neither.",
      fx = { thread = { id = "dwarves_and_dark_iron", beat = "b2_longbraid", state = "stirring" }, learn = { "dark_iron", "grim_batol" } },
    },
    {
      id = "b3_rhag", npc = "wl_rhag",
      when = { any = { { thread = { id = "dwarves_and_dark_iron", beat = "b1_stoutfist" } }, { thread = { id = "dwarves_and_dark_iron", beat = "b2_longbraid" } },
                       { questActive = TODO_QUEST("The Thandol Span") } },
               ["not"] = { thread = { id = "dwarves_and_dark_iron", beat = "b3_rhag" } } },
      text = "Longbraid writes tae Ironforge every week, an' every week the answer's the same: the reserves are comin'. I've stopped tellin' the lads when a letter arrives, because they've started countin' them.",
      fx = { thread = { id = "dwarves_and_dark_iron", beat = "b3_rhag", state = "unfolding" } },
    },
    {
      id = "b4_magni", npc = "magni",
      when = { thread = { id = "dwarves_and_dark_iron", beat = "b3_rhag" }, ["not"] = { thread = { id = "dwarves_and_dark_iron", beat = "b4_magni" } } },
      text = "Ye've come from Dun Modr, I can see it in yer boots. I read every letter Longbraid sends, an' I answer every one the same, because the best o' the Reserve's gone south tae the Alliance's wars an' what's left is holdin' the loch. I've one mountain an' too many walls, an' I hate it.",
      fx = { thread = { id = "dwarves_and_dark_iron", beat = "b4_magni", state = "unfolding" } },
    },
    {
      id = "b5_nials", npc = "nials",
      when = { any = { { thread = { id = "dwarves_and_dark_iron", beat = "b3_rhag" } }, { questDone = TODO_QUEST("Plea To The Alliance") } },
               ["not"] = { thread = { id = "dwarves_and_dark_iron", beat = "b5_nials" } } },
      text = "Longbraid's dwarves want soldiers, and I understand that better than they think, because Stromgarde wants them too. If the Alliance needs the Span held, let the Alliance send the shields, because every one I have is already standing in the rain.",
      fx = { thread = { id = "dwarves_and_dark_iron", beat = "b5_nials", state = "unfolding" } },
    },
    {
      id = "b6_hinderweir", npc = "hinderweir",
      when = { thread = { id = "dwarves_and_dark_iron", beat = "b4_magni" }, ["not"] = { thread = { id = "dwarves_and_dark_iron", beat = "b6_hinderweir" } } },
      text = "You've been to the King, then, and he'll have told you the Reserve is holding the loch. That's my dam they're holding it for, and I'm grateful, but the Span was guarded too, and I've seen what's left of the Span.",
      fx = { thread = { id = "dwarves_and_dark_iron", beat = "b6_hinderweir" } },
    },
  },
}

-- Something under Silithus (neutral, 50-60). The silithid march out of Un'Goro into Tanaris
-- (March of the Silithid), the Gorishi grow restless, Larksbane's crystals hum louder, Natalia
-- names what lies beneath Hive'Regal (Into The Maw of Madness), and the bronze Watcher says
-- only that his Brood still watches. Nothing past the Scarab Wall; the gates stay shut.
P:Thread {
  id = "silithus_stirring",
  theme = "From Gadgetzan to the Scarab Wall, the silithid are on the move, and the few who have listened closely think something is calling them.",
  title = "Something under Silithus",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The silithid aren't wandering. Gadgetzan's alchemist says they march, and in Un'Goro the Gorishi have started tunnelling south toward Silithus, as if something there had called them home.",
      third = "{name} heard from Tanaris and Un'Goro that the silithid were on the move, and moving south." },
    unfolding = { first = "At Cenarion Hold the crystals hum louder every week and the hives grow fuller. Commander Mar'alith's wife went into Hive'Regal to learn what the hum was saying, and came out speaking a name for it.",
      third = "{name} learned at Cenarion Hold that the crystals hummed louder every week, and that Natalia Mar'alith had found a name beneath Hive'Regal." },
    resolved = { first = "Baristolth of the Shifting Sands says his Brood has watched the Scarab Wall for a thousand years and is watching still. Whatever lies under Silithus is old and awake, and it is not yet time.",
      third = "{name} heard from the bronze Watcher that whatever lay under Silithus was old and awake, and that his Brood was still watching." },
  },
  npcs = { "pestlezugg", "williden", "larksbane", "maralith", "baristolth" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The bronze Watcher told the player his Brood still watches the Scarab Wall. Whatever lies under Silithus is awake, and it is not yet time.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "A goblin, an explorer, a geologist and a grieving commander, hundreds of miles apart, and all of them are listening to the same sound coming out of the sand.",
    third = "{name} had heard the same unease from Gadgetzan to Cenarion Hold: something under Silithus was calling the silithid.",
  },
  beats = {
    {
      id = "b1_pestlezugg", npc = "pestlezugg",
      when = { minLevel = 48, thread = { id = "silithus_stirring", notBeat = "b1_pestlezugg" } },
      text = "I've cut open more silithid than anybody in Gadgetzan, pal, and here's a bit of analysis for free, which I never give: these bugs aren't wandering, they're marching. Bugs that march have somebody giving orders, and that's terrible for business.",
      fx = { thread = { id = "silithus_stirring", beat = "b1_pestlezugg", state = "stirring" }, learn = { "silithid" } },
    },
    {
      id = "b2_williden", npc = "williden",
      when = { minLevel = 50, thread = { id = "silithus_stirring", notBeat = "b2_williden" } },
      text = "The Gorishi always kept to their hive in the Slithering Scar, but this season they've been tunnelling south, toward the pass into Silithus, as if something down there had called them home. I'd like to think it's only the weather.",
      fx = { thread = { id = "silithus_stirring", beat = "b2_williden", state = "stirring" }, learn = { "silithid" } },
    },
    {
      id = "b3_larksbane", npc = "larksbane",
      when = { minLevel = 55, any = { { thread = { id = "silithus_stirring", beat = "b1_pestlezugg" } }, { thread = { id = "silithus_stirring", beat = "b2_williden" } } },
               ["not"] = { thread = { id = "silithus_stirring", beat = "b3_larksbane" } } },
      text = "The bugs are on the move in Tanaris an' Un'Goro as well, ye say? That fits, for the crystals hum loudest near the hives an' the hives grow fuller every week. I don't think the bugs are the ones doin' the callin'.",
      fx = { thread = { id = "silithus_stirring", beat = "b3_larksbane", state = "unfolding" }, learn = { "silithid_hives" } },
    },
    {
      id = "b4_maralith", npc = "maralith",
      when = { questDone = TODO_QUEST("Into The Maw of Madness"), thread = { id = "silithus_stirring", notBeat = "b4_maralith" } },
      text = "Natalia went into Hive'Regal to learn what the crystals were saying, and she came out speaking a name for it. I have written to Nighthaven, and the Circle answers me with patience, which is a fine thing to send a man who is out of it.",
      fx = { thread = { id = "silithus_stirring", beat = "b4_maralith", state = "unfolding" }, learn = { "cthun" } },
    },
    {
      id = "b5_baristolth", npc = "baristolth",
      when = { any = { { thread = { id = "silithus_stirring", beat = "b3_larksbane" } }, { thread = { id = "silithus_stirring", beat = "b4_maralith" } } },
               ["not"] = { thread = { id = "silithus_stirring", beat = "b5_baristolth" } } },
      text = "The dwarf counts the hum and the commander has heard the name, mortal, and so your kind learns in a season what my Brood has known for a thousand years. The wall holds, and those who watch it are watching still, and for now that must be enough.",
      fx = { thread = { id = "silithus_stirring", beat = "b5_baristolth", state = "resolved" }, learn = { "bronze_dragonflight" } },
    },
  },
}
