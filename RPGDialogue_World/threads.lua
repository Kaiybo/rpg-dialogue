-- Throughlines. Beats are keyed by NPC; the thread engine (M4) offers at most one beat per
-- conversation and keeps beats of the same thread apart. Beats can be heard in any order
-- where possible; later beats acknowledge earlier ones.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

P:Thread {
  id = "elwynn_gold",
  theme = "Elwynn's mines pay someone. Not the kobolds, and not the farmers.",
  title = "The gold of Elwynn's mines",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Someone is taking gold out of Elwynn's mines, and it isn't the kobolds and it isn't the farmers. Remy swears he's the only buyer of dust in the forest, and yet the dust keeps disappearing.",
      third = "{name} had begun to wonder who was taking the gold out of Elwynn's mines, since it plainly wasn't the kobolds." },
    unfolding = { first = "Marshal Dughan has a schedule of gold pickups from his own mines, written by a man the papers call the Collector. Whoever he is, he's no kobold, and he's been riding east.",
      third = "{name} learned of the Collector, a man who had been quietly taking gold from Elwynn's mines on a schedule." },
    resolved = { first = "The Collector is dealt with, and the dust is flowing again. Remy is happy, the Marshal is less unhappy, and nobody asked too many questions about where Remy's dust goes.",
      third = "{name} saw the Collector dealt with, and the dust trade in Elwynn flowed again." },
    soured = { first = "I pointed the Marshal at Remy. The dust trade has dried up, and so has Remy's goodwill toward me.",
      third = "{name} pointed the Marshal at Remy, and Remy hasn't forgiven it." },
  },
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
      text = "Nobody in Elwynn buys dust but me, nobody but me! So why do the kobolds have less to sell every week?",
      fx = { thread = { id = "elwynn_gold", beat = "b1_dust", state = "stirring" }, hear = "remy_only_buyer", learn = { "gold_dust" } },
    },
    {
      id = "b2_riders", npc = "farley",
      when = { thread = { id = "elwynn_gold", notBeat = "b2_riders" } },
      text = "Odd custom lately: a rider paid for a room in gold dust, then never slept in it, and rode east toward the pumpkin patch before dawn.",
      fx = { thread = { id = "elwynn_gold", beat = "b2_riders", state = "stirring" }, learn = { "the_collector" } },
    },
    {
      id = "b3_schedule", npc = "dughan",
      when = { questDone = TODO_QUEST("The Collector") },
      text = "A schedule of gold pickups, from my mines, under my nose! Whoever this Collector is, he isn't a kobold.",
      fx = { thread = { id = "elwynn_gold", beat = "b3_schedule", state = "unfolding" } },
    },
    {
      id = "b4_after", npc = "remy",
      when = { questDone = TODO_QUEST("Manhunt"), thread = { id = "elwynn_gold", notBeat = "b4_after" } },
      text = "The dust is flowing again, flowing again! Whatever you did out east, the kobolds have more to sell.",
      fx = { thread = { id = "elwynn_gold", beat = "b4_after", state = "resolved" } },
    },
  },
}

-- Westfall was left to fend for itself. Heard from Elwynn to Sentinel Hill to the Keep.
-- Beats connect existing Year 1 facts (Stormwind's absence; the militia) and invent no events.
P:Thread {
  id = "westfall_left",
  theme = "The kingdom left Westfall to fend for itself, and Westfall noticed.",
  title = "Westfall, left to fend for itself",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Everyone in Elwynn talks about Westfall as though it were a sickroom: sad, a little shameful, and best not visited. The kingdom pulled its soldiers out, and the farmers were left to hold the land themselves.",
      third = "{name} kept hearing how the kingdom had left Westfall to fend for itself." },
    unfolding = { first = "The people of Westfall haven't forgotten who left them. Some are bitter and some just keep working, and the King's regent says the kingdom is stretched thin. Everyone has a reason; nobody has soldiers.",
      third = "{name} heard every side of why Westfall was left alone, and found that everyone had a reason and nobody had soldiers." },
    resolved = { first = "Westfall holds, mostly by its own hands. Gryan Stoutmantle said the valley will remember who came when the Keep didn't, and I think he meant it as a promise.",
      third = "{name} saw Westfall hold by its own hands, and Gryan Stoutmantle promised the valley would remember who came." },
  },
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
      text = "Westfall fed half the kingdom once, and now nobody goes there who doesn't have to. Gryan Stoutmantle holds Sentinel Hill with farmers.",
      fx = { thread = { id = "westfall_left", beat = "b1_dughan", state = "stirring" }, learn = { "westfall" } },
    },
    {
      id = "b2_thomas", npc = "thomas",
      when = { minLevel = 9, thread = { id = "westfall_left", notBeat = "b2_thomas" } },
      text = "The city sends Westfall nothing, not a single sword. Anyone heading west gets my blessing, and my pity.",
      fx = { thread = { id = "westfall_left", beat = "b2_thomas", state = "stirring" } },
    },
    {
      id = "b3_danuvin", npc = "danuvin",
      when = { thread = { id = "westfall_left", notBeat = "b3_danuvin" } },
      text = "You came from Elwynn. Did anyone there say they were sorry? No, they never do.",
      fx = { thread = { id = "westfall_left", beat = "b3_danuvin", state = "unfolding" }, hear = "stormwind_abandoned_westfall" },
    },
    {
      id = "b4_salma", npc = "salma",
      when = { thread = { id = "westfall_left", notBeat = "b4_salma" } },
      text = "The city forgot us, and fine, let it; we'll remember for both of us what this land's for. Here, eat something.",
      fx = { thread = { id = "westfall_left", beat = "b4_salma", state = "unfolding" } },
    },
    {
      id = "b5_bolvar", npc = "bolvar",
      when = { thread = { id = "westfall_left", beat = "b3_danuvin" } },
      text = "Westfall, yes. The kingdom is stretched thinner than any of us would like, and my council urges patience. I mislike it, and I mislike it more than they know.",
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
      text = "You walked the Deadmines and came back, and no order from the Keep ever did that much for us. Westfall will remember who came.",
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
  title = "Solomon's letters",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Magistrate Solomon has written to Stormwind, Westfall and Darkshire asking for soldiers against the Blackrock. If ink were soldiers, he says, Lakeshire would be the best-defended town in the kingdom.",
      third = "{name} learned that Magistrate Solomon had written to half the kingdom begging for soldiers for Lakeshire." },
    unfolding = { first = "Every answer to Solomon's letters comes with a good reason in it. Gryan can't spare men, Darkshire has a Night Watch of bakers, and the Keep wants proof before it moves.",
      third = "{name} followed Solomon's letters across the kingdom and found that every refusal came with a good reason." },
    resolved = { first = "Stormwind's answer to Lakeshire was one deputy. Solomon has decided that's a compliment to the deputy rather than an insult to Lakeshire, and it turned out to be enough, or close.",
      third = "{name} saw Lakeshire's call for help answered with a single deputy, and saw that it was very nearly enough." },
  },
  npcs = { "solomon", "gryan", "bolvar", "katrana", "daniels", "ello", "maxwell" },
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
      text = "Stormwind, Westfall, Darkshire: I've written to them all. If ink were soldiers, Lakeshire would be the best-defended town in the kingdom.",
      fx = { thread = { id = "solomons_letters", beat = "b1_solomon", state = "stirring" }, learn = { "blackrock" } },
    },
    {
      id = "b2_gryan", npc = "gryan",
      when = { questDone = TODO_QUEST("Messenger to Westfall"), thread = { id = "solomons_letters", notBeat = "b2_gryan" } },
      text = "I've read Solomon's letter twice. If I send men to Lakeshire, Westfall falls by spring, and he'll understand. I hope he'll understand.",
      fx = { thread = { id = "solomons_letters", beat = "b2_gryan", state = "unfolding" } },
    },
    {
      id = "b3_katrana", npc = "katrana",
      when = { thread = { id = "solomons_letters", beat = "b1_solomon" } },
      text = "Lakeshire again. The magistrate has a lovely hand, and one almost hates to tell him no. Almost.",
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
      text = "Every rider the magistrate sends comes back through my bar first, thirsty and empty-handed. I could set my calendar by them.",
      fx = { thread = { id = "solomons_letters", beat = "b5_daniels" } },
    },
    {
      id = "b7_ello", npc = "ello",
      when = { questDone = TODO_QUEST("Messenger to Darkshire") },
      text = "Solomon asked me for soldiers, me, and I've got a Night Watch made of bakers. I sent him my sympathy and a list of my own troubles, and it was a long list.",
      fx = { thread = { id = "solomons_letters", beat = "b7_ello", state = "unfolding" } },
    },
    {
      id = "b6_solomon", npc = "solomon",
      when = { questDone = TODO_QUEST("The True Masters") },
      text = "I asked the kingdom for an army and it sent me one deputy. I've decided that's a compliment to the deputy, not an insult to Lakeshire.",
      fx = { thread = { id = "solomons_letters", beat = "b6_solomon", state = "resolved" }, standing = { lakeshire = 5 } },
    },
    {
      id = "b8_maxwell", npc = "maxwell",
      when = { questDone = TODO_QUEST("The True Masters"), thread = { id = "solomons_letters", notBeat = "b8_maxwell" } },
      text = "You thought Lakeshire's letters were the first? I've been writing the same letters from this ridge, and every one of them asks the same thing: how many more soldiers before Stormwind acts?",
      fx = { thread = { id = "solomons_letters", beat = "b8_maxwell" }, standing = { morgans_vigil = 2 } },
    },
  },
}

-- Stalvan Mistmantle. An old murder, two men who couldn't solve it, and the Legend of
-- Stalvan chain that finally does. Beats work in any order and never name the killer before
-- the player has been to his manor.
P:Thread {
  id = "stalvan",
  theme = "An old murder in Elwynn, and the people who never stopped thinking about it.",
  title = "The tutor's murder",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Smitts, the tavernkeep in Darkshire, keeps a box of mud-stained pages under his bar. There's an old murder in them, from Elwynn, and he has never stopped thinking about it.",
      third = "{name} learned that Smitts in Darkshire still kept the papers of an old Elwynn murder." },
    unfolding = { first = "The old case runs from Darkshire to Elwynn and back: Smitts and Marshal Haggard worked it together, Farley remembers the quiet guest, and Madame Eva says the Tutor is waiting for someone.",
      third = "{name} followed the threads of an old murder from Darkshire to Elwynn and back." },
    resolved = { first = "I've been up to the tutor's manor, and the old case has its answer, if not a happy one. Smitts has waited longer than anyone to hear it.",
      third = "{name} went up to the tutor's manor and brought the old case to an end." },
  },
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
      text = "I keep a box of mud-stained pages under the bar. Ask me why sometime, on a quiet night.",
      fx = { thread = { id = "stalvan", beat = "b1_smitts", state = "stirring" }, learn = { "stalvan" } },
    },
    {
      id = "b2_haggard", npc = "haggard",
      when = { thread = { id = "stalvan", beat = "b1_smitts" } },
      text = "Smitts still has those pages? Of course he does. We worked that murder for a season, he and I. The papers in my attic came with this house, the same house, and I've never liked thinking about that.",
      fx = { thread = { id = "stalvan", beat = "b2_haggard", state = "unfolding" } },
    },
    {
      id = "b3_farley", npc = "farley",
      when = { thread = { id = "stalvan", beat = "b1_smitts" } },
      text = "The man from Darkshire who keeps asking about our old guest? That's Smitts, and he writes every year or so. I tell him the same thing every time: quiet fellow, paid in coin, kept to himself.",
      fx = { thread = { id = "stalvan", beat = "b3_farley" } },
    },
    {
      id = "b4_eva", npc = "eva",
      when = { thread = { id = "stalvan", beat = "b2_haggard" } },
      text = "The cards have been turning up the Tutor all week. He's waiting for someone, and it may as well be you.",
      fx = { thread = { id = "stalvan", beat = "b4_eva", state = "unfolding" } },
    },
    {
      id = "b5_althea", npc = "althea",
      when = { visited = "Manor Mistmantle", thread = { id = "stalvan", beat = "b1_smitts" } },
      text = "You've been up to the manor. Don't tell me what you saw; tell Smitts. He's waited longer than anyone.",
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
  title = "The Keeper's request",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Keeper of Moonglade asked after me by name. Dendrite says he doesn't ask after many young druids.",
      third = "{name} learned that Keeper Remulos of Moonglade had asked after {name} by name." },
    unfolding = { first = "Remulos says the land is sickening in many places at once, water gone sour and moss gone wrong, and he asked me to watch for it on my roads. The druids I've met have seen it too.",
      third = "{name} walked the land's sick places at Keeper Remulos's request, and found the other druids had seen them too." },
    resolved = { first = "I told the Keeper what I saw in the sick places. He said the Dream is troubled, and that one day he will ask more of me than watching, but not yet.",
      third = "{name} told Keeper Remulos what the sick places looked like, and he said he would ask more of {name} one day." },
  },
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
      text = "The Keeper asked after you yesterday, by name, and he doesn't ask after many young druids. Go and see him at the shrine when you can.",
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
      text = "The Keeper's druid! He wrote that you might come. Look at this moss, then, and look closely. Tell him what you see, because I've run out of ways to say it.",
      fx = { thread = { id = "the_circle", beat = "b3_terenthis" } },
    },
    {
      id = "b4_hamuul", npc = "hamuul",
      when = { class = "DRUID", any = { { thread = { id = "the_circle", beat = "b3_tonga" } }, { thread = { id = "the_circle", beat = "b3_terenthis" } } } },
      text = "Remulos writes that you've seen the sick places with your own eyes. Good; go and tell him yourself. He listens better to the ones who've walked it.",
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
  title = "Fern Crimsonleaf",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Fern Crimsonleaf never came back from the night that broke the siege of Farholde. Her stone at the keep says 'Presumed dead', and Gray has been presuming otherwise for years.",
      third = "{name} heard of Fern Crimsonleaf, lost the night the siege of Farholde broke, and of Gray, who doesn't believe she's dead." },
    unfolding = { first = "Nobody in Farholde agrees about Fern. Some speak of her fondly and some warily, and the Commander, who commanded that night, carries all of it alone.",
      third = "{name} found that Farholde couldn't agree on what had become of Fern Crimsonleaf." },
    resolved = { first = "I told Gray that a dagger isn't a grave. He went up to the keep, and he and the Commander drank to her, alive or not.",
      third = "{name} told Gray a dagger isn't a grave, and he and the Commander drank to Fern together." },
    soured = { first = "I told Gray to let Fern rest. He stopped talking about her, and started drinking alone.",
      third = "{name} told Gray to let Fern rest, and he took to drinking alone." },
  },
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
      text = "Been up at the keep and read Fern's stone? It says 'Presumed dead', and I've been presuming otherwise for years, and I'm not tired of it yet.",
      fx = { thread = { id = "farholde_lost", beat = "b1_gray", state = "stirring" }, learn = { "fern_crimsonleaf" }, hear = "fern_lives" },
    },
    {
      id = "b2_ashe", npc = "ashe",
      when = { any = { { thread = { id = "farholde_lost", beat = "b1_gray" } }, { bookRead = "Fern Crimsonleaf" } },
               ["not"] = { thread = { id = "farholde_lost", beat = "b2_ashe" } } },
      text = "Fern? My father used to say she could vanish in a lit room, and he said it fondly, though looking back, I think he also said it as a warning.",
      fx = { thread = { id = "farholde_lost", beat = "b2_ashe", state = "unfolding" } },
    },
    {
      id = "b3_cady", npc = "cady",
      when = { thread = { id = "farholde_lost", beat = "b2_ashe" }, ["not"] = { thread = { id = "farholde_lost", beat = "b3_cady" } } },
      text = "You're asking about Fern Crimsonleaf. Don't ask the Commander; he commanded that night, and everything that happened in it is his to carry.",
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

-- The Scarlet Path: the Crusade recruits under the Cathedral of Light. Its road runs from
-- Brother Crowley to Brother Anton in Desolace to Raleigh the Devout in Southshore, who
-- walked off it. The player decides whether Anton hears the truth. (Classic quests:
-- Brother Anton, Down the Scarlet Path (twice), In the Name of the Light.)
P:Thread {
  id = "scarlet_path",
  theme = "The Scarlet Crusade recruits under the Cathedral of Light, and the man at the end of its road has left it.",
  title = "The Scarlet road",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Scarlet Crusade recruits under the Cathedral of Light itself. Crowley says it asks for everything, your doubts and sometimes your neighbours, and gives you a purpose back.",
      third = "{name} heard the Scarlet Crusade's offer under the Cathedral of Light." },
    unfolding = { first = "Brother Anton sends the faithful to Raleigh the Devout in Southshore. Raleigh sends them home with the truth, because he saw something at the Monastery that Anton doesn't know about.",
      third = "{name} followed the Scarlet road from Brother Anton to Raleigh the Devout, who had left the Crusade after the Monastery." },
    resolved = { first = "I told Brother Anton what Raleigh saw at the Monastery. For once he had no answer ready, and he asked me to pray with him.",
      third = "{name} told Brother Anton what Raleigh had seen, and Anton, with no answer ready, asked {name} to pray with him." },
    soured = { first = "I let Brother Anton keep his Crusade, and told him Raleigh sent his blessing. It was kinder, I suppose, or easier.",
      third = "{name} let Brother Anton keep his Crusade, and told him Raleigh sent his blessing." },
  },
  npcs = { "crowley", "anton", "raleigh", "tyrosus" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Brother Anton what Raleigh saw at the Monastery. For once Anton had no answer ready, and asked them to pray with him.",
    soured = "The player let Brother Anton keep his Crusade, and told him Raleigh sent his blessing.",
  },
  pacing = { minConversations = 2, minSeconds = 600 },
  reflection = {
    first = "The Crusade sent me from the Cathedral to Desolace to Southshore, and the man waiting at the end of the road had walked off it.",
    third = "{name} followed the Scarlet Crusade's road from the Cathedral to Southshore, and found the man at its end had left it.",
  },
  beats = {
    {
      id = "b1_crowley", npc = "crowley",
      when = { minLevel = 30, thread = { id = "scarlet_path", notBeat = "b1_crowley" } },
      text = "Understand what you'd be joining. The Crusade asks for everything, your doubts and sometimes your neighbours, and gives you a purpose back. Most call it a fair trade.",
      fx = { thread = { id = "scarlet_path", beat = "b1_crowley", state = "stirring" }, learn = { "scarlet_crusade" } },
    },
    {
      id = "b2_anton", npc = "anton",
      when = { any = { { thread = { id = "scarlet_path", beat = "b1_crowley" } }, { questDone = TODO_QUEST("Brother Anton") } },
               ["not"] = { thread = { id = "scarlet_path", beat = "b2_anton" } } },
      text = "Prove yourself in the valley and I'll send you to Raleigh the Devout, in Southshore, a true son of the Crusade. He writes less often than he used to; busy, I expect.",
      fx = { thread = { id = "scarlet_path", beat = "b2_anton", state = "unfolding" }, learn = { "raleigh" } },
    },
    {
      id = "b3_raleigh", npc = "raleigh",
      when = { any = { { thread = { id = "scarlet_path", beat = "b2_anton" } }, { questActive = TODO_QUEST("Down the Scarlet Path") } },
               ["not"] = { thread = { id = "scarlet_path", beat = "b3_raleigh" } } },
      text = "Anton sends me the faithful, and I send them home with the truth. He thinks I'm still one of them. I was, until the Monastery.",
      fx = { thread = { id = "scarlet_path", beat = "b3_raleigh", state = "unfolding" }, learn = { "scarlet_monastery" } },
    },
    {
      id = "b4_tyrosus", npc = "tyrosus",
      when = { thread = { id = "scarlet_path", beat = "b3_raleigh" }, ["not"] = { thread = { id = "scarlet_path", beat = "b4_tyrosus" } } },
      text = "You found Raleigh. Some of us left the Hand before it became the Crusade, and some, like him, left after. I don't rank them; the Dawn has room for both.",
      fx = { thread = { id = "scarlet_path", beat = "b4_tyrosus" } },
    },
  },
}

-- The plague cauldrons (45-60, Alliance). Kel'Thuzad's cauldrons are too strong to break, so
-- Chillwind spoils them (The Scourge Cauldrons, the four Targets, Return to Chillwind Camp,
-- Mission Accomplished!). Everyone near them has a view of what that's worth: Valorfist's
-- advantage, MacDonnell's relish, Arbington's day-or-two agent, Mulgris's sick field, and
-- Tirion's four more pots in the east. Connects quest facts and bible opinions only.
P:Thread {
  id = "plague_cauldrons",
  theme = "Chillwind can't break Kel'Thuzad's cauldrons, only spoil them, and everyone near them has an opinion on what that's worth.",
  title = "The plague cauldrons",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Eight cauldrons breathe the plague over Lordaeron, four of them in the west, and Commander Valorfist says they're too strong for Chillwind to break. His second means to spoil them instead, and he's given up asking her how.",
      third = "{name} learned of the eight plague cauldrons of Lordaeron, and of Chillwind Camp's plan to spoil the ones it couldn't break." },
    unfolding = { first = "MacDonnell prays over the bottles and pours, Arbington's counter agent holds a day or two, and the old tauren at the Writhing Haunt says a spoiled brew is still a brew. Nobody near the cauldrons thinks quite the same thing about them.",
      third = "{name} carried samples between the cauldrons and Chillwind Camp, and heard as many opinions of the work as there were people doing it." },
    resolved = { first = "All four cauldrons in the west now cough up something that eats the Scourge, a day or two at a time. Valorfist read me a citation in front of the whole camp, and called it the best bargain Chillwind has made.",
      third = "{name} saw all four western cauldrons turned against the Scourge, and Commander Valorfist named {name} a hero of the Alliance for it." },
  },
  npcs = { "valorfist", "macdonnell", "arbington", "mulgris", "tirion" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "All four western cauldrons are spoiled against the Scourge, a day or two at a time, and Valorfist calls it the best bargain his camp has made.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Valorfist wants an edge, MacDonnell wants the dead to choke, and the dying druid wants the field back. The cauldrons keep breathing all the same.",
    third = "{name} had heard what the cauldrons meant to a commander, a priestess and a dying druid, and no two of them wanted the same thing.",
  },
  beats = {
    {
      id = "b1_valorfist", npc = "valorfist",
      when = { minLevel = 50, thread = { id = "plague_cauldrons", notBeat = "b1_valorfist" } },
      text = "There are eight cauldrons breathing plague over Lordaeron, four of them in the west, and Kel'Thuzad made them too strong for anything I've got to break. So my second means to spoil them instead, and I've stopped asking her what with.",
      fx = { thread = { id = "plague_cauldrons", beat = "b1_valorfist", state = "stirring" }, learn = { "plague_cauldrons" } },
    },
    {
      id = "b2_macdonnell", npc = "macdonnell",
      when = { any = { { thread = { id = "plague_cauldrons", beat = "b1_valorfist" } }, { questActive = TODO_QUEST("The Scourge Cauldrons") } },
               ["not"] = { thread = { id = "plague_cauldrons", beat = "b2_macdonnell" } } },
      text = "The commander tells everyone he's stopped asking what I put in the pots, which is a mercy, because I'd tell him. We can't shut them, so we'll make them breathe something that eats the dead instead, and I'll pray over every bottle before I pour it.",
      fx = { thread = { id = "plague_cauldrons", beat = "b2_macdonnell", state = "unfolding" }, learn = { "plague_cauldrons" } },
    },
    {
      id = "b3_arbington", npc = "arbington",
      when = { questDone = TODO_QUEST("Return to Chillwind Camp"), thread = { id = "plague_cauldrons", notBeat = "b3_arbington" } },
      text = "Your sample is the foulest thing I've ever had in a bottle, and I've had some very foul things in bottles. The counter agent will hold a day or two, and then someone has to carry it out to the cauldron again, which I'm afraid is the entire plan.",
      fx = { thread = { id = "plague_cauldrons", beat = "b3_arbington", state = "unfolding" } },
    },
    {
      id = "b4_mulgris", npc = "mulgris",
      when = { any = { { thread = { id = "plague_cauldrons", beat = "b2_macdonnell" } }, { questActive = TODO_QUEST("Target: Writhing Haunt") } },
               ["not"] = { any = { { thread = { id = "plague_cauldrons", beat = "b4_mulgris" } },
                                   { questActive = TODO_QUEST("Glyphed Oaken Branch") }, { questDone = TODO_QUEST("Glyphed Oaken Branch") } } } },
      text = "The priestess sends you to the cauldron by my house, to turn its poison on the dead. I won't argue with her, little one, but a spoiled brew is still a brew, and the field beneath it will stay sick long after both of us are gone.",
      fx = { thread = { id = "plague_cauldrons", beat = "b4_mulgris" } },
    },
    {
      id = "b5_tirion", npc = "tirion",
      when = { any = { { thread = { id = "plague_cauldrons", beat = "b2_macdonnell" } }, { thread = { id = "plague_cauldrons", beat = "b3_arbington" } } },
               ["not"] = { thread = { id = "plague_cauldrons", beat = "b5_tirion" } } },
      text = "Chillwind is turning the cauldrons' poison back on the Scourge, I hear, and good; let the dead choke on their own brew for once. There are four more of those pots breathing over the Eastweald, though, and I think they're why the fish don't bite, though an old man likes to have something to blame.",
      fx = { thread = { id = "plague_cauldrons", beat = "b5_tirion" } },
    },
    {
      id = "b6_valorfist", npc = "valorfist",
      when = { questDone = TODO_QUEST("Mission Accomplished!"), thread = { id = "plague_cauldrons", notBeat = "b6_valorfist" } },
      text = "We never broke a single one of Kel'Thuzad's cauldrons, and we never will with what I've got. But all four in the west now cough up something that eats the Scourge, a day or two at a time, and I'll take that bargain and say thank you for it.",
      fx = { thread = { id = "plague_cauldrons", beat = "b6_valorfist", state = "resolved" }, standing = { chillwind_camp = 3 } },
    },
  },
}

-- The Dawn's letters (50-60). The Argent Dawn is a few people spread across the north, held
-- together by reports: Gregor in Everlook writes to Pureheart at Chillwind (The Everlook
-- Report), and Light's Hope reads what reaches it. Each worries about the next and says
-- nothing of themselves. Built on the bibles' canon and authored habits (Gregor forgets to
-- eat, Pureheart asks after Tyrosus, Tyrosus's quiet dawn hour); no new events.
P:Thread {
  id = "dawn_letters",
  theme = "The Argent Dawn is held together by letters, and everyone in it asks after everyone else and never mentions themselves.",
  title = "The Dawn's letters",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Gregor Greystone writes to Chillwind Camp every month from Everlook, whatever the goblins charge to carry it. He says the Argent Dawn is a few good people spread very thin, and letters are most of what holds it together.",
      third = "{name} heard Gregor Greystone in Everlook say that letters were most of what held the Argent Dawn together." },
    unfolding = { first = "Gregor's reports go to Pureheart, and Pureheart's go to Light's Hope, where Lord Tyrosus reads them in the one quiet hour of the day. Every one of them asks after somebody else, and none of them says a word about the writer.",
      third = "{name} followed the Argent Dawn's letters from Everlook to Chillwind to Light's Hope, and found that each writer asked after the next and never spoke of themselves." },
    resolved = { first = "I've been to Light's Hope and back, and Gregor wanted to know if Lord Tyrosus looked well. I told him what I could, and he wrote it down as carefully as any report.",
      third = "{name} brought word of Lord Tyrosus back to Gregor Greystone, who wrote it down as carefully as any report." },
  },
  npcs = { "gregor", "pureheart", "tyrosus" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The player carried word along the whole of the Dawn's road, and brought Gregor news of Lord Tyrosus that no letter would have told him.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "Everlook, Chillwind, Light's Hope: the Dawn writes to itself across the whole north, and every letter worries about somebody else.",
    third = "{name} had carried the Argent Dawn's worries from Everlook to Light's Hope, and none of them were the writer's own.",
  },
  beats = {
    {
      id = "b1_gregor", npc = "gregor",
      when = { minLevel = 50, thread = { id = "dawn_letters", notBeat = "b1_gregor" } },
      text = "I write to Chillwind Camp every month, whatever the Cartel charges to carry it. The Dawn is a few good people spread very thin across the north, friend, and letters are most of what holds us together.",
      fx = { thread = { id = "dawn_letters", beat = "b1_gregor", state = "stirring" }, learn = { "argent_dawn" } },
    },
    {
      id = "b2_pureheart", npc = "pureheart",
      when = { any = { { thread = { id = "dawn_letters", beat = "b1_gregor" } }, { questActive = TODO_QUEST("The Everlook Report") }, { questDone = TODO_QUEST("The Everlook Report") } },
               ["not"] = { thread = { id = "dawn_letters", beat = "b2_pureheart" } } },
      text = "Gregor's reports run to pages on the Steamwheedle traders and one line about himself, and that line always says 'well enough'. I've taken to reading it twice, because from Gregor, 'well enough' could mean anything short of a funeral.",
      fx = { thread = { id = "dawn_letters", beat = "b2_pureheart", state = "unfolding" } },
    },
    {
      id = "b3_tyrosus", npc = "tyrosus",
      when = { any = { { thread = { id = "dawn_letters", beat = "b2_pureheart" } }, { questActive = TODO_QUEST("Lord Maxwell Tyrosus") } },
               ["not"] = { thread = { id = "dawn_letters", beat = "b3_tyrosus" } } },
      text = "Pureheart sends me every report that crosses that table at Chillwind, Gregor's among them, and I read them at dawn in the one quiet hour. I see so little of the Dawn from inside this chapel that the letters are how I know it's still out there.",
      fx = { thread = { id = "dawn_letters", beat = "b3_tyrosus", state = "unfolding" }, learn = { "argent_dawn" } },
    },
    {
      id = "b4_gregor", npc = "gregor",
      when = { any = { { thread = { id = "dawn_letters", beat = "b3_tyrosus" } }, { questDone = TODO_QUEST("Duke Nicholas Zverenhoff") } },
               ["not"] = { thread = { id = "dawn_letters", beat = "b4_gregor" } } },
      text = "You've been inside Light's Hope, which is more than I've managed in a year. Did Lord Tyrosus look well? He'd never write it if he weren't, and Pureheart says the same of me, which is unfair, and also true.",
      fx = { thread = { id = "dawn_letters", beat = "b4_gregor", state = "resolved" }, standing = { everlook = 2 } },
    },
  },
}

-- The Light in the Plaguelands (priests and paladins, 50-60). The Light answers differently
-- in Lordaeron, and everyone who serves it there has had to decide what it's for: MacDonnell
-- (it burns when asked), Leonid (it answers a dead man), Tirion (stripped of it, still
-- listening), and Benedictus at home, whose faith Lordaeron's fall shook. Ending: beat-driven
-- for now (resolved); a choice on Benedictus could give it a soured ending (see story.soured).
P:Thread {
  id = "plague_light",
  theme = "The Light answers differently in the Plaguelands, and everyone who serves it there has had to decide what it's for.",
  title = "The Light in the Plaguelands",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "High Priestess MacDonnell teaches the priests at Chillwind to hold the dead in mind when they call on the Light. Some come back steadier for it and some come back frightened of their own hands, and she says she never knows which beforehand.",
      third = "{name} heard High Priestess MacDonnell speak of what calling the Light against the dead does to the priests who learn it." },
    unfolding = { first = "Leonid Barthalomew is dead, and the Light answers him anyway. Tirion Fordring was stripped of it, and still listens for it by his river. Nobody up here serves the Light the way they were taught to.",
      third = "{name} met a dead priest the Light still answered and an exiled paladin who still listened for it, and began to wonder what the Light was for in Lordaeron." },
    resolved = { first = "Archbishop Benedictus asked the Light every night for a year whether it had left Lordaeron. He said he was glad to see someone come home from there still asking.",
      third = "{name} came home to the Cathedral from Lordaeron, and Archbishop Benedictus was glad to see {name} still asking the Light questions." },
    soured = { first = "I told Archbishop Benedictus that in the Plaguelands the Light is a weapon and nothing more. He didn't argue; he only asked me to come and see him if my hands ever start to feel cold.",
      third = "{name} told Archbishop Benedictus the Light was only a weapon in the Plaguelands, and he asked {name} to come back if {name}'s hands ever felt cold." },
  },
  npcs = { "macdonnell", "leonid", "tirion", "benedictus" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player came home from Lordaeron still asking the Light questions, and Benedictus, who asked them for a year, was glad of it.",
    soured = "The player told Benedictus that in the Plaguelands the Light is a weapon and nothing more, and he asked them to come back if their hands felt cold.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "A priestess who teaches the Light to burn, a dead man it still answers, a paladin it was taken from: nobody in the Plaguelands serves the Light the way the Cathedral taught it.",
    third = "{name} had met three servants of the Light in the Plaguelands, and none of them served it the way the Cathedral taught.",
  },
  beats = {
    {
      id = "b1_macdonnell", npc = "macdonnell",
      when = { class = { "PRIEST", "PALADIN" }, thread = { id = "plague_light", notBeat = "b1_macdonnell" } },
      text = "I teach every priest who comes through that gate to hold the dead in mind when they call on the Light, and I've watched what it does to them. Some come back to the fire steadier and some come back frightened of their own hands, and I've never once guessed which beforehand.",
      fx = { thread = { id = "plague_light", beat = "b1_macdonnell", state = "stirring" } },
    },
    {
      id = "b2_leonid", npc = "leonid",
      when = { class = { "PRIEST", "PALADIN" }, thread = { id = "plague_light", beat = "b1_macdonnell" },
               ["not"] = { thread = { id = "plague_light", beat = "b2_leonid" } } },
      text = "Priests who come east look at me as though I were a question they'd rather not answer. The Light answers me, dead as I am, and I've stopped asking it why and started asking it for strength.",
      fx = { thread = { id = "plague_light", beat = "b2_leonid", state = "unfolding" } },
    },
    {
      id = "b3_tirion", npc = "tirion",
      when = { class = { "PRIEST", "PALADIN" }, thread = { id = "plague_light", beat = "b1_macdonnell" },
               ["not"] = { thread = { id = "plague_light", beat = "b3_tirion" } } },
      text = "You've been praying hard in the Plaguelands; I can see it in your shoulders. I swung the Light like a hammer up here for years, and it's only by this river, with nothing left to swing, that I've begun to hear the rest of what it says.",
      fx = { thread = { id = "plague_light", beat = "b3_tirion", state = "unfolding" } },
    },
    {
      id = "b4_benedictus", npc = "benedictus",
      when = { class = { "PRIEST", "PALADIN" }, any = { { thread = { id = "plague_light", beat = "b2_leonid" } }, { thread = { id = "plague_light", beat = "b3_tirion" } } },
               ["not"] = { thread = { id = "plague_light", beat = "b4_benedictus" } } },
      text = "You've been praying in Lordaeron, child; I can see it in how you kneel. When it fell I asked the Light every night for a year whether it had left those people, and I'm glad to see someone come home from there still asking.",
      fx = { thread = { id = "plague_light", beat = "b4_benedictus", state = "unfolding" } },
    },
  },
}
