-- Throughlines. Beats are keyed by NPC; the thread engine (M4) offers at most one beat per
-- conversation and keeps beats of the same thread apart. Beats can be heard in any order
-- where possible; later beats acknowledge earlier ones.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Thread {
  id = "elwynn_gold",
  theme = "Elwynn's mines pay someone. Not the kobolds, and not the farmers.",
  npcs = { "remy", "farley", "dughan" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The Collector is dealt with and Remy's little trade carries on, none the wiser.",
    soured = "The player pointed the Marshal at Remy. The dust trade dries up, and so does Remy's goodwill.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "That's three people now with something to say about the gold in Elwynn's mines, and none of them saying the same thing.",
    third = "{name} had heard three different stories about the gold of Elwynn's mines by now.",
  },
  beats = {
    {
      id = "b1_dust", npc = "remy",
      when = { thread = { id = "elwynn_gold", notBeat = "b1_dust" } },
      text = "Nobody in Elwynn buys dust but me. Nobody but me! So why do the kobolds have less to sell every week?",
      fx = { thread = { id = "elwynn_gold", beat = "b1_dust", state = "stirring" }, hear = "remy_only_buyer", learn = { "gold_dust" } },
    },
    {
      id = "b2_riders", npc = "farley",
      when = { thread = { id = "elwynn_gold", notBeat = "b2_riders" } },
      text = "Odd custom lately. A rider paid for a room in gold dust, then never slept in it. Rode east toward the pumpkin patch before dawn.",
      fx = { thread = { id = "elwynn_gold", beat = "b2_riders", state = "stirring" }, learn = { "the_collector" } },
    },
    {
      id = "b3_schedule", npc = "dughan",
      when = { questDone = TODO_QUEST("The Collector") },
      text = "A schedule of gold pickups. From my mines, under my nose. Whoever this Collector is, he isn't a kobold.",
      fx = { thread = { id = "elwynn_gold", beat = "b3_schedule", state = "unfolding" } },
    },
    {
      id = "b4_after", npc = "remy",
      when = { questDone = TODO_QUEST("Manhunt"), thread = { id = "elwynn_gold", notBeat = "b4_after" } },
      text = "Dust is flowing again. Flowing again! Whatever you did out east, the kobolds have more to sell.",
      fx = { thread = { id = "elwynn_gold", beat = "b4_after", state = "resolved" } },
    },
  },
}

-- Westfall was left to fend for itself. Heard from Elwynn to Sentinel Hill to the Keep.
-- Beats connect existing Year 1 facts (Stormwind's absence; the militia) and invent no events.
P:Thread {
  id = "westfall_left",
  theme = "The kingdom left Westfall to fend for itself, and Westfall noticed.",
  npcs = { "dughan", "thomas", "danuvin", "salma", "gryan", "bolvar", "ello" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "Westfall holds, mostly by its own hands, and the player has heard every side of why.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Everyone between Goldshire and the coast says the same thing about Westfall: nobody came.",
    third = "{name} had heard it from Goldshire to Sentinel Hill: nobody came for Westfall.",
  },
  beats = {
    {
      id = "b1_dughan", npc = "dughan",
      when = { minLevel = 9, thread = { id = "westfall_left", notBeat = "b1_dughan" } },
      text = "Westfall fed half the kingdom once. Now nobody goes there who doesn't have to. Gryan Stoutmantle holds Sentinel Hill with farmers.",
      fx = { thread = { id = "westfall_left", beat = "b1_dughan", state = "stirring" }, learn = { "westfall" } },
    },
    {
      id = "b2_thomas", npc = "thomas",
      when = { minLevel = 9, thread = { id = "westfall_left", notBeat = "b2_thomas" } },
      text = "The city sends Westfall nothing. Not a sword. Anyone heading west gets my blessing, and my pity.",
      fx = { thread = { id = "westfall_left", beat = "b2_thomas", state = "stirring" } },
    },
    {
      id = "b3_danuvin", npc = "danuvin",
      when = { thread = { id = "westfall_left", notBeat = "b3_danuvin" } },
      text = "You came from Elwynn. Did anyone there say they were sorry? No. They never do.",
      fx = { thread = { id = "westfall_left", beat = "b3_danuvin", state = "unfolding" }, hear = "stormwind_abandoned_westfall" },
    },
    {
      id = "b4_salma", npc = "salma",
      when = { thread = { id = "westfall_left", notBeat = "b4_salma" } },
      text = "The city forgot us. Fine. We'll remember for both of us what this land's for. Here. Eat.",
      fx = { thread = { id = "westfall_left", beat = "b4_salma", state = "unfolding" } },
    },
    {
      id = "b5_bolvar", npc = "bolvar",
      when = { thread = { id = "westfall_left", beat = "b3_danuvin" } },
      text = "Westfall. Yes. The kingdom is stretched thinner than any of us would like, and my council urges patience. I mislike it. I mislike it more than they know.",
      fx = { thread = { id = "westfall_left", beat = "b5_bolvar" } },
    },
    {
      id = "b7_ello", npc = "ello",
      when = { thread = { id = "westfall_left", beat = "b3_danuvin" }, ["not"] = { thread = { id = "westfall_left", beat = "b7_ello" } } },
      text = "Westfall feels forgotten? Stormwind pulled its soldiers out of Duskwood when the king vanished. We've been in the dark so long we've stopped noticing.",
      fx = { thread = { id = "westfall_left", beat = "b7_ello" } },
    },
    {
      id = "b6_gryan", npc = "gryan",
      when = { deed = "dungeon:The Deadmines", thread = { id = "westfall_left", notBeat = "b6_gryan" } },
      text = "You walked the Deadmines and came back. No order from the Keep ever did that much for us. Westfall will remember who came.",
      fx = { thread = { id = "westfall_left", beat = "b6_gryan", state = "resolved" }, standing = { sentinel_hill = 5 } },
    },
  },
}

-- Solomon's letters. Lakeshire writes to everyone; everyone has a reason. Every beat rests
-- on canon: Solomon's pleas (Messenger quests), Gryan's refusal, Bolvar's need for proof,
-- Prestor's advice against aiding Solomon, and the deputy he sent instead (The True Masters).
P:Thread {
  id = "solomons_letters",
  theme = "Lakeshire asks the whole kingdom for help, and every answer has a reason in it.",
  npcs = { "solomon", "gryan", "bolvar", "katrana", "daniels", "ello" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "Stormwind's answer to Lakeshire was one deputy. It turned out to be enough, or close.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Solomon's letters went everywhere. Everyone I've asked had a reason not to answer them.",
    third = "{name} had heard every reason the kingdom gave for not answering Lakeshire.",
  },
  beats = {
    {
      id = "b1_solomon", npc = "solomon",
      when = { minLevel = 15, thread = { id = "solomons_letters", notBeat = "b1_solomon" } },
      text = "Stormwind. Westfall. Darkshire. If ink were soldiers, Lakeshire would be the best-defended town in the kingdom.",
      fx = { thread = { id = "solomons_letters", beat = "b1_solomon", state = "stirring" }, learn = { "blackrock" } },
    },
    {
      id = "b2_gryan", npc = "gryan",
      when = { questDone = TODO_QUEST("Messenger to Westfall"), thread = { id = "solomons_letters", notBeat = "b2_gryan" } },
      text = "Solomon's letter. I read it twice. If I send men to Lakeshire, Westfall falls by spring. He'll understand. I hope he'll understand.",
      fx = { thread = { id = "solomons_letters", beat = "b2_gryan", state = "unfolding" } },
    },
    {
      id = "b3_katrana", npc = "katrana",
      when = { thread = { id = "solomons_letters", beat = "b1_solomon" } },
      text = "Lakeshire again. The magistrate has a lovely hand. One almost hates to tell him no. Almost.",
      fx = { thread = { id = "solomons_letters", beat = "b3_katrana" }, hear = "prestor_patience" },
    },
    {
      id = "b4_bolvar", npc = "bolvar",
      when = { thread = { id = "solomons_letters", beat = "b1_solomon" }, ["not"] = { questDone = TODO_QUEST("The True Masters") } },
      text = "Solomon writes every week. I won't empty the garrison for orcs I'm told are being directed by someone no one has seen. Bring me proof, and I'll move.",
      fx = { thread = { id = "solomons_letters", beat = "b4_bolvar", state = "unfolding" } },
    },
    {
      id = "b5_daniels", npc = "daniels",
      when = { thread = { id = "solomons_letters", beat = "b1_solomon" } },
      text = "Every rider the magistrate sends comes back through my bar first. Thirsty, and empty-handed. I could set my calendar by them.",
      fx = { thread = { id = "solomons_letters", beat = "b5_daniels" } },
    },
    {
      id = "b7_ello", npc = "ello",
      when = { questDone = TODO_QUEST("Messenger to Darkshire") },
      text = "Solomon asked me for soldiers. Me. I've got a Night Watch made of bakers. I sent him my sympathy and a list of my own troubles. It was a long list.",
      fx = { thread = { id = "solomons_letters", beat = "b7_ello", state = "unfolding" } },
    },
    {
      id = "b6_solomon", npc = "solomon",
      when = { questDone = TODO_QUEST("The True Masters") },
      text = "I asked the kingdom for an army and it sent me one deputy. I've decided that's a compliment to the deputy, not an insult to Lakeshire.",
      fx = { thread = { id = "solomons_letters", beat = "b6_solomon", state = "resolved" }, standing = { lakeshire = 5 } },
    },
  },
}

-- Stalvan Mistmantle. An old murder, two men who couldn't solve it, and the Legend of
-- Stalvan chain that finally does. Beats work in any order and never name the killer before
-- the player has been to his manor.
P:Thread {
  id = "stalvan",
  theme = "An old murder in Elwynn, and the people who never stopped thinking about it.",
  npcs = { "smitts", "haggard", "farley", "eva", "althea" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The tutor's manor has been visited, and the old case has an answer, if not a happy one.",
  },
  pacing = { minConversations = 3, minSeconds = 1500 },
  reflection = {
    first = "Smitts, Haggard, Farley: three people, years apart, all still turning over the same murder.",
    third = "{name} had heard the same old murder from three people who'd never quite let it go.",
  },
  beats = {
    {
      id = "b1_smitts", npc = "smitts",
      when = { minLevel = 22, thread = { id = "stalvan", notBeat = "b1_smitts" } },
      text = "I keep a box of mud-stained pages under the bar. Ask me why sometime. Ask me on a quiet night.",
      fx = { thread = { id = "stalvan", beat = "b1_smitts", state = "stirring" }, learn = { "stalvan" } },
    },
    {
      id = "b2_haggard", npc = "haggard",
      when = { thread = { id = "stalvan", beat = "b1_smitts" } },
      text = "Smitts still has those pages? Of course he does. We worked that murder for a season, he and I. The papers in my attic came with this house. The same house. I've never liked thinking about that.",
      fx = { thread = { id = "stalvan", beat = "b2_haggard", state = "unfolding" } },
    },
    {
      id = "b3_farley", npc = "farley",
      when = { thread = { id = "stalvan", beat = "b1_smitts" } },
      text = "The man from Darkshire who keeps asking about our old guest? Smitts. He writes every year or so. I tell him the same thing every time. Quiet fellow, paid in coin, kept to himself.",
      fx = { thread = { id = "stalvan", beat = "b3_farley" } },
    },
    {
      id = "b4_eva", npc = "eva",
      when = { thread = { id = "stalvan", beat = "b2_haggard" } },
      text = "The cards have been turning up the Tutor all week. He's waiting for someone. It may as well be you.",
      fx = { thread = { id = "stalvan", beat = "b4_eva", state = "unfolding" } },
    },
    {
      id = "b5_althea", npc = "althea",
      when = { visited = "Manor Mistmantle", thread = { id = "stalvan", beat = "b1_smitts" } },
      text = "You've been up to the manor. Don't tell me what you saw. Tell Smitts. He's waited longer than anyone.",
      fx = { thread = { id = "stalvan", beat = "b5_althea", state = "resolved" }, standing = { darkshire = 3 } },
    },
  },
}


-- The Circle takes notice. For druids of either faction: Moonglade hears of a young druid,
-- the Keeper asks them to watch for the land's sickness, and the sick places (the Barrens'
-- oases, Darkshore's moss) confirm it. Year 1 only: unease about the Dream, never what
-- causes it.
P:Thread {
  id = "the_circle",
  theme = "The Cenarion Circle notices a young druid, and asks them to watch the land.",
  npcs = { "dendrite", "remulos", "tonga", "terenthis", "hamuul", "mathrengyl" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The Keeper of Moonglade has heard what the young druid saw in the sick places, and has said he'll ask more of them one day.",
  },
  pacing = { minConversations = 3, minSeconds = 1500 },
  reflection = {
    first = "Dendrite, the Keeper, then the sick places themselves: the Circle had been watching, and now so was I.",
    third = "{name} had been noticed by the Cenarion Circle, and asked to watch for a sickness in the land.",
  },
  beats = {
    {
      id = "b1_dendrite", npc = "dendrite",
      when = { class = "DRUID", thread = { id = "the_circle", notBeat = "b1_dendrite" } },
      text = "The Keeper asked after you yesterday. By name. He doesn't ask after many young druids. Go and see him at the shrine when you can.",
      fx = { thread = { id = "the_circle", beat = "b1_dendrite", state = "stirring" }, learn = { "cenarion_circle" } },
    },
    {
      id = "b2_remulos", npc = "remulos",
      when = { class = "DRUID", thread = { id = "the_circle", beat = "b1_dendrite" } },
      text = "Dendrite says you listen. Then hear this: the land is sickening in many places at once, water gone sour and moss gone wrong. Watch for it on your roads, and tell me what you find.",
      fx = { thread = { id = "the_circle", beat = "b2_remulos", state = "unfolding" } },
    },
    {
      id = "b3_tonga", npc = "tonga",
      when = { class = "DRUID", thread = { id = "the_circle", beat = "b2_remulos" } },
      text = "Moonglade sent word to watch for a young druid with questions. You, I think. Taste the oasis water and tell me it isn't the same sickness the Keeper fears.",
      fx = { thread = { id = "the_circle", beat = "b3_tonga" }, learn = { "wailing_caverns" } },
    },
    {
      id = "b3_terenthis", npc = "terenthis",
      when = { class = "DRUID", thread = { id = "the_circle", beat = "b2_remulos" } },
      text = "The Keeper's druid! He wrote that you might come. Look at this moss, then. Look closely. Tell him what you see, because I've run out of ways to say it.",
      fx = { thread = { id = "the_circle", beat = "b3_terenthis" } },
    },
    {
      id = "b4_hamuul", npc = "hamuul",
      when = { class = "DRUID", any = { { thread = { id = "the_circle", beat = "b3_tonga" } }, { thread = { id = "the_circle", beat = "b3_terenthis" } } } },
      text = "Remulos writes that you've seen the sick places with your own eyes. Good. Go and tell him yourself. He listens better to the ones who've walked it.",
      fx = { thread = { id = "the_circle", beat = "b4_hamuul" } },
    },
    {
      id = "b4_mathrengyl", npc = "mathrengyl",
      when = { class = "DRUID", any = { { thread = { id = "the_circle", beat = "b3_tonga" } }, { thread = { id = "the_circle", beat = "b3_terenthis" } } } },
      text = "Moonglade has been asking about you; Remulos worries a great deal. Go and tell him what you saw, then come back and train. Worry is no substitute for skill.",
      fx = { thread = { id = "the_circle", beat = "b4_mathrengyl" } },
    },
    {
      id = "b5_remulos", npc = "remulos",
      when = { class = "DRUID", any = { { thread = { id = "the_circle", beat = "b3_tonga" } }, { thread = { id = "the_circle", beat = "b3_terenthis" } } } },
      text = "You've walked the sick places and come back whole; that's what a druid is for. The Dream is troubled, little one. One day I'll ask more of you than watching, but not yet.",
      fx = { thread = { id = "the_circle", beat = "b5_remulos", state = "resolved" }, standing = { nighthaven = 3 } },
    },
  },
}

-- The Riverglades (Forever): Fern Crimsonleaf went into the Horde camp the night before the
-- charge and never came back. Her memorial says "presumed dead". Farholde has argued about
-- it ever since. The truth stays open (claim fern_lives); the player only chooses what to
-- carry between Gray, who won't let her go, and Demar, who won't let himself hope.
P:Thread {
  id = "farholde_lost",
  theme = "Fern Crimsonleaf never came back from the night that broke the siege, and Farholde can't agree on what that means.",
  npcs = { "gray", "ashe", "cady", "demar" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Gray that a dagger isn't a grave. He went up to the keep, and he and Demar drank to her, alive or not.",
    soured = "The player told Gray to let Fern rest. He stopped talking about her, and started drinking alone.",
  },
  pacing = { minConversations = 2, minSeconds = 600 },
  reflection = {
    first = "Three people in Farholde have told me about Fern Crimsonleaf now, and no two of them buried the same woman.",
    third = "{name} had heard of Fern Crimsonleaf from three people in Farholde, and none of them agreed on whether she was dead.",
  },
  beats = {
    {
      id = "b1_gray", npc = "gray",
      when = { minLevel = 35, thread = { id = "farholde_lost", notBeat = "b1_gray" } },
      text = "Been up at the keep? Read Fern's stone? 'Presumed dead.' Presumed. I've been presuming otherwise for years, and I'm not tired yet.",
      fx = { thread = { id = "farholde_lost", beat = "b1_gray", state = "stirring" }, learn = { "fern_crimsonleaf" }, hear = "fern_lives" },
    },
    {
      id = "b2_ashe", npc = "ashe",
      when = { any = { { thread = { id = "farholde_lost", beat = "b1_gray" } }, { bookRead = "Fern Crimsonleaf" } },
               ["not"] = { thread = { id = "farholde_lost", beat = "b2_ashe" } } },
      text = "Fern? My father used to say she could vanish in a lit room. He said it fondly. Looking back, I think he also said it as a warning.",
      fx = { thread = { id = "farholde_lost", beat = "b2_ashe", state = "unfolding" } },
    },
    {
      id = "b3_cady", npc = "cady",
      when = { thread = { id = "farholde_lost", beat = "b2_ashe" }, ["not"] = { thread = { id = "farholde_lost", beat = "b3_cady" } } },
      text = "You're asking about Fern Crimsonleaf. Don't ask the Commander. He commanded that night, and everything that happened in it is his to carry.",
      fx = { thread = { id = "farholde_lost", beat = "b3_cady" } },
    },
    {
      id = "b4_demar", npc = "demar",
      when = { any = { { thread = { id = "farholde_lost", beat = "b2_ashe" } }, { thread = { id = "farholde_lost", beat = "b3_cady" } } },
               ["not"] = { thread = { id = "farholde_lost", beat = "b4_demar" } } },
      text = "Gray's been at you about Fern. Once, then: we found her dagger among their dead captains, and nothing else. I won't dig up that hope for a tavern story.",
      fx = { thread = { id = "farholde_lost", beat = "b4_demar" } },
    },
  },
}
