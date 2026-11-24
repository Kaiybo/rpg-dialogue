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
      text = "You thought Lakeshire's letters were the first? I've been writing the same letters from this ridge, and they all end on the same question: how many more soldiers before Stormwind acts?",
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
      text = "Moonglade has been asking about you, because Remulos frets over every rumour from the south. Go and tell him what you saw, then come back and train, since his fretting won't sharpen your claws.",
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
      text = "Brother Anton sends me the faithful, and I send them home with the truth. He thinks I'm still one of them. I was, until the Monastery.",
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
    unfolding = { first = "Gregor's reports go to Pureheart, and Pureheart's go to Light's Hope, where Lord Tyrosus reads them in the one quiet hour of the day. Each asks after somebody else, and none of them says a word about the writer.",
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

-- Surena Caledon (Alliance warlocks, 5-30). Gakin's best student took his bloodstone choker
-- and ran to the Brackwell farm with Erlan Drudgemoor (Classic: Gakin's Summons, Surena
-- Caledon). The cellar under the Slaughtered Lamb still argues over whose fault it was. The
-- player tells Gakin whether he taught her too little or whether she simply chose.
P:Thread {
  id = "lock_surena",
  theme = "Gakin's best student ran from the Slaughtered Lamb's cellar, and every warlock down there blames someone different.",
  title = "Gakin's student",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Drusilla La Salle says Gakin the Darkbinder in Stormwind once had a student who learned power before patience. Her name was Surena Caledon, and he still won't say it without flinching.",
      third = "{name} heard from Drusilla La Salle of Surena Caledon, a student of Gakin the Darkbinder who learned power before patience." },
    unfolding = { first = "Gakin gave Surena a bloodstone choker the day she bound her first imp, and she ran with it to the Brackwell farm and a Defias thief. Ursula calls him soft for grieving, and Demisette says every cellar loses one in five.",
      third = "{name} heard the Slaughtered Lamb's warlocks argue over Surena Caledon: Gakin grieved, Ursula called it softness, and Demisette called it arithmetic." },
    resolved = { first = "I told Gakin he taught Surena too little, because nobody taught her to refuse the small things. He said that would be the first lesson for every student from now on, mine included.",
      third = "{name} told Gakin that Surena had never been taught to refuse, and he made it the first lesson of the cellar." },
    soured = { first = "I told Gakin that Surena chose, and the choice was hers alone. He thanked me in a voice like a closing door, and he hasn't said her name since.",
      third = "{name} told Gakin that Surena's choice was her own, and he never spoke her name again." },
  },
  npcs = { "drusilla", "gakin", "ursula", "demisette_cloyce" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Gakin he had never taught Surena to refuse the small things, and he made refusal the cellar's first lesson.",
    soured = "The player told Gakin that Surena chose freely, and he shut the door on her memory for good.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "Gakin grieves her, Ursula sneers at the grief, and Demisette counts her as one in five. Nobody in that cellar can agree on what Surena Caledon was.",
    third = "{name} had heard three warlocks under the Slaughtered Lamb speak of Surena Caledon, and none of them agreed on what she had been.",
  },
  beats = {
    {
      id = "b1_drusilla", npc = "drusilla",
      when = { class = "WARLOCK", minLevel = 5, thread = { id = "lock_surena", notBeat = "b1_drusilla" } },
      text = "Patience, prudence, power, and in that order, because I've seen what happens otherwise. Gakin in Stormwind had a student called Surena who learned power first, and if you ever want to watch a proud man flinch, say her name to him.",
      fx = { thread = { id = "lock_surena", beat = "b1_drusilla", state = "stirring" } },
    },
    {
      id = "b2_gakin", npc = "gakin",
      when = { class = "WARLOCK", any = { { thread = { id = "lock_surena", beat = "b1_drusilla" } }, { questDone = TODO_QUEST("Surena Caledon") } },
               ["not"] = { thread = { id = "lock_surena", beat = "b2_gakin" } } },
      text = "Drusilla talks too much, but she isn't wrong. Surena Caledon learned faster than anyone I've taught, and I gave her a bloodstone choker the day she bound her first imp. Then she decided the Void owed her more, and she took the choker to the Brackwell farm with a Defias thief who had good teeth and no talent.",
      fx = { thread = { id = "lock_surena", beat = "b2_gakin", state = "unfolding" } },
    },
    {
      id = "b3_ursula", npc = "ursula",
      when = { class = "WARLOCK", thread = { id = "lock_surena", beat = "b2_gakin" }, ["not"] = { thread = { id = "lock_surena", beat = "b3_ursula" } } },
      text = "He told you about Surena, didn't he? He tells all the promising ones, as though it were a warning, but it's a confession. She was weak and he was soft with her, and the Void found the softness before he did.",
      fx = { thread = { id = "lock_surena", beat = "b3_ursula" } },
    },
    {
      id = "b4_demisette", npc = "demisette_cloyce",
      when = { class = "WARLOCK", thread = { id = "lock_surena", beat = "b2_gakin" }, ["not"] = { thread = { id = "lock_surena", beat = "b4_demisette" } } },
      text = "I've taught in this cellar longer than Gakin has, and I'll tell you what I told him. Every cellar loses one student in five, to the Watch, to the drink or to the thing in the circle. Surena was one in five, and he wants her to be a lesson instead of a number.",
      fx = { thread = { id = "lock_surena", beat = "b4_demisette" } },
    },
  },
}

-- Zelk's road (Horde warlocks, 5-30). Orgnil Soulscar killed his old comrade Zelk, a Cleft
-- warlock who went south to hunt the Burning Blade and came back wearing its sigil (Durotar
-- bible). Nartok learned his first circle from Zelk; Gan'rul taught beside him; Neeru gave
-- him names (dramatic irony only: Neeru is written straight). Orgnil asks the player what
-- makes them different from Zelk, and the answer decides the ending.
P:Thread {
  id = "lock_zelk",
  theme = "A Cleft warlock went to hunt the Burning Blade and joined it, and the Horde's warlocks still live in his shadow.",
  title = "Zelk's road",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "A warlock named Zelk once taught in the Cleft of Shadow. He went south to hunt the Burning Blade, and Orgnil Soulscar of Razor Hill is the reason he never came back.",
      third = "{name} heard of Zelk, a Cleft warlock who went to hunt the Burning Blade, and of Orgnil Soulscar, who was the reason he never came back." },
    unfolding = { first = "Orgnil put Zelk down himself at Skull Rock, wearing the Blade's sigil. In the Cleft, Gan'rul calls him a scholar who studied too closely, and Neeru Fireblade remembers giving him names.",
      third = "{name} heard Zelk's end from Orgnil, who killed him, and from the Cleft, which remembered him as a scholar who studied the Blade too closely." },
    resolved = { first = "Orgnil asked me what makes me different from Zelk. I told him I bind demons and never kneel to them, and he said he'd hold me to it, and took his hand off his axe.",
      third = "{name} told Orgnil Soulscar that a warlock binds demons and never kneels to them, and Orgnil took his hand off his axe." },
    soured = { first = "Orgnil asked me what makes me different from Zelk, and I told him Zelk was a scholar and he'd killed him for it. He said I shouldn't come to Razor Hill after dark.",
      third = "{name} told Orgnil Soulscar he had killed a scholar, and Orgnil warned {name} away from Razor Hill after dark." },
  },
  npcs = { "nartok", "mirket", "orgnil", "ganrul", "neeru" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Orgnil that a warlock binds demons and never kneels to them, and Orgnil said he'd hold them to it.",
    soured = "The player told Orgnil he had killed a scholar in Zelk, and Orgnil warned them away from Razor Hill after dark.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "Nartok learned his first circle from Zelk, Orgnil killed him, and the Cleft still argues over what he was. Every warlock in the Horde walks some part of his road.",
    third = "{name} had followed Zelk's road from the Valley of Trials to Skull Rock and the Cleft, and found every Horde warlock walked some part of it.",
  },
  beats = {
    {
      id = "b1_nartok", npc = "nartok",
      when = { class = "WARLOCK", minLevel = 5, thread = { id = "lock_zelk", notBeat = "b1_nartok" }, ["not"] = { thread = { id = "lock_zelk", beat = "b1_mirket" } } },
      text = "Before you go to Razor Hill, know that Orgnil Soulscar will watch you the whole time you're there, and he has his reasons. The warlock who taught me my first circle was called Zelk, and Orgnil is the reason he never came home.",
      fx = { thread = { id = "lock_zelk", beat = "b1_nartok", state = "stirring" }, learn = { "burning_blade" } },
    },
    {
      id = "b1_mirket", npc = "mirket",
      when = { class = "WARLOCK", minLevel = 10, thread = { id = "lock_zelk", notBeat = "b1_mirket" }, ["not"] = { thread = { id = "lock_zelk", beat = "b1_nartok" } } },
      text = "You'll meet Orgnil Soulscar sooner or later, out in Razor Hill, and he'll look at you like a debt he means to collect. A warlock called Zelk used to teach on this very floor, and Orgnil is the one who ended him.",
      fx = { thread = { id = "lock_zelk", beat = "b1_mirket", state = "stirring" }, learn = { "burning_blade" } },
    },
    {
      id = "b2_orgnil", npc = "orgnil",
      when = { class = "WARLOCK", any = { { thread = { id = "lock_zelk", beat = "b1_nartok" } }, { thread = { id = "lock_zelk", beat = "b1_mirket" } } },
               ["not"] = { thread = { id = "lock_zelk", beat = "b2_orgnil" } } },
      text = "So the Cleft has been telling you about Zelk. He was my brother-in-arms, and he went south to hunt the Blade because he said only a warlock could understand them. He came back to Skull Rock wearing their sigil, and I put him down myself, and I'd do it again tomorrow.",
      fx = { thread = { id = "lock_zelk", beat = "b2_orgnil", state = "unfolding" } },
    },
    {
      id = "b3_ganrul", npc = "ganrul",
      when = { class = "WARLOCK", thread = { id = "lock_zelk", beat = "b2_orgnil" }, ["not"] = { thread = { id = "lock_zelk", beat = "b3_ganrul" } } },
      text = "Zelk taught beside me for six years, and he had the finest mind in this Cleft. He wanted to understand the Blade before he fought it, and I warned him that understanding is the first step of joining. He laughed at me, and Orgnil was the one who stopped laughing for him.",
      fx = { thread = { id = "lock_zelk", beat = "b3_ganrul" } },
    },
    {
      id = "b3_neeru", npc = "neeru",
      when = { class = "WARLOCK", thread = { id = "lock_zelk", beat = "b2_orgnil" }, ["not"] = { thread = { id = "lock_zelk", beat = "b3_neeru" } } },
      text = "Zelk came to me for names, as Orgnil does now, and I gave him what I could, because I know the Blade from the inside. He was brilliant and he was careless, my friend, and the Blade adores that combination. Learn from him, and be only one of the two.",
      fx = { thread = { id = "lock_zelk", beat = "b3_neeru" } },
    },
  },
}

-- The few at the top (warlocks of either faction, 30-60). The further a warlock climbs, the
-- fewer of them are left: Strahad's two eaten students, Impsy the imp who resents his master,
-- Gorzeeki's imp in a jar, and Mor'zul alone on a cursed hill. Mor'zul asks whether this is
-- what the player is climbing toward, and the answer decides the ending.
P:Thread {
  id = "lock_summit",
  theme = "The higher a warlock climbs, the fewer of them are left, and the ones at the top live alone with what they've bound.",
  title = "The few at the top",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Strahad Farsan in Ratchet says he's taught warlocks for twenty years, and fewer of them reach him every year. He tells each one about the two students who were eaten.",
      third = "{name} heard from Strahad Farsan in Ratchet that fewer warlocks reached him every year." },
    unfolding = { first = "Out in the far places I keep meeting what's left at the top of my craft: an imp in Felwood who hates his master, a goblin who keeps a demon in a jar and calls it staff, and Mor'zul alone at the Altar of Storms.",
      third = "{name} met what was left at the top of the warlock's craft: a resentful imp, a goblin with a demon in a jar, and Mor'zul alone at his altar." },
    resolved = { first = "Mor'zul asked whether his hill is what I'm climbing toward. I told him I'll stop where I can still hold what I've bound. He called it a waste, and he looked at me as if I'd taken something from him.",
      third = "{name} told Mor'zul Bloodbringer that {name} would stop where {name} could still hold what was bound, and Mor'zul called it a waste." },
    soured = { first = "Mor'zul asked whether his hill is what I'm climbing toward, and I told him yes. He smiled and said he'd keep a place by the circle warm for me.",
      third = "{name} told Mor'zul Bloodbringer that {name} meant to climb all the way, and he promised to keep a place by the circle warm." },
  },
  npcs = { "strahad", "impsy", "gorzeeki", "morzul" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Mor'zul they would stop where they could still hold what they'd bound, and he called it a waste.",
    soured = "The player told Mor'zul they meant to climb all the way, and he promised to keep a place by the circle warm.",
  },
  pacing = { minConversations = 3, minSeconds = 1500 },
  reflection = {
    first = "Strahad's attic, Impsy's stuffed pet, Gorzeeki's jar, Mor'zul's hill: the higher I go in this craft, the lonelier the people I find there.",
    third = "{name} had climbed far enough in the warlock's craft to see how few were left at the top, and how alone they were.",
  },
  beats = {
    {
      id = "b1_strahad", npc = "strahad",
      when = { class = "WARLOCK", minLevel = 30, thread = { id = "lock_summit", notBeat = "b1_strahad" } },
      text = "I've taught warlocks in this attic for twenty years, and fewer of them reach me every year. The rest stop, or are stopped, or are eaten, and I tell each new student about the two who were eaten so that they'll think about which of those they mean to be.",
      fx = { thread = { id = "lock_summit", beat = "b1_strahad", state = "stirring" } },
    },
    {
      id = "b2_impsy", npc = "impsy",
      when = { class = "WARLOCK", minLevel = 48, thread = { id = "lock_summit", beat = "b1_strahad" }, ["not"] = { thread = { id = "lock_summit", beat = "b2_impsy" } } },
      text = "You've got demons of your own, haven't you? Tell me something, then, warlock to imp: do they talk about you when you're not listening? Because I talk about Niby all day long, and he hasn't noticed once, and I don't think your lot are any different.",
      fx = { thread = { id = "lock_summit", beat = "b2_impsy", state = "unfolding" } },
    },
    {
      id = "b2_gorzeeki", npc = "gorzeeki",
      when = { class = "WARLOCK", minLevel = 50, thread = { id = "lock_summit", beat = "b1_strahad" }, ["not"] = { thread = { id = "lock_summit", beat = "b2_gorzeeki" } } },
      text = "You're climbing, pal, I can smell it on you, and you'll end up talking to the boss sooner or later. Word of advice: nobody else comes up this hill, ever. It's him, me, the imp in the jar and a lot of beetles, and the beetles are the cheerful ones.",
      fx = { thread = { id = "lock_summit", beat = "b2_gorzeeki", state = "unfolding" } },
    },
  },
}

-- Harry's list (Alliance warriors, 3-30). Willem Tarn, an Elwynn recruit (original), learned his
-- stance from Llane or Lyria, took Bartleby's mug off him for Harry Burlguard, and marched west
-- with the army. In Westfall he folded his tabard and walked up Sentinel Hill to Gryan's farmers.
-- Harry keeps a list of the students he sent off and can't decide whether Willem belongs on it;
-- the player tells him whether the lad broke faith or kept it.
P:Thread {
  id = "war_willem",
  theme = "A Stormwind recruit took off his tabard in Westfall and picked up a militia spear, and the old soldiers can't agree whether he deserted or stood his ground.",
  title = "Harry's list",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "A recruit named Willem Tarn learned his stance in Elwynn and marched west with the army, and his old trainers go quiet when they say his name. Harry Burlguard in Old Town taught him last, so he'll know the rest of it.",
      third = "{name} heard of Willem Tarn, an Elwynn recruit who marched west with the army, and whose old trainers went quiet at his name." },
    unfolding = { first = "Harry Burlguard keeps a list of the students he sent off to fight. The army writes that Willem Tarn deserted in Westfall, and Gryan Stoutmantle says he walked up Sentinel Hill with his tabard folded and now drills the farmers every morning.",
      third = "{name} learned that Willem Tarn had left the army in Westfall for Gryan Stoutmantle's militia, and that Harry Burlguard couldn't decide whether his name belonged on his list." },
    resolved = { first = "I told Harry that Willem kept faith with the people his oath was meant to protect. He read the lad's name with the rest of his list that night, in an empty tavern, and poured a second pint for it.",
      third = "{name} told Harry Burlguard that Willem Tarn had kept faith, and Harry read the name with the rest of his list." },
    soured = { first = "I told Harry that a soldier doesn't choose his war, and that Willem broke his oath. He took a pen to his list and crossed the name out, and he didn't look up again while I was there.",
      third = "{name} told Harry Burlguard that Willem Tarn had broken his oath, and Harry struck the name from his list." },
  },
  npcs = { "llane", "lyria", "burlguard", "gryan" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Harry that Willem kept faith with Westfall's people, and Harry read his name with the rest of the list.",
    soured = "The player told Harry that Willem broke his oath, and Harry struck his name from the list.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "Llane taught Willem to stand, Harry taught him to keep the people behind him alive, and Gryan says that's exactly what he's doing. The army calls it desertion all the same.",
    third = "{name} had followed Willem Tarn from Elwynn's training yards to Sentinel Hill, and found that nobody could agree what to call what he'd done.",
  },
  beats = {
    {
      id = "b1_llane", npc = "llane",
      when = { class = "WARRIOR", minLevel = 3, thread = { id = "war_willem", notBeat = "b1_llane" }, ["not"] = { thread = { id = "war_willem", beat = "b1_lyria" } } },
      text = "Feet apart, and hold it there while I tell you something. The best recruit I ever drilled in this yard was a Northshire lad called Willem Tarn, and he marched off to Westfall with the army and never wrote back. Harry Burlguard in Old Town had him last, if you ever want to know the rest of it.",
      fx = { thread = { id = "war_willem", beat = "b1_llane", state = "stirring" } },
    },
    {
      id = "b1_lyria", npc = "lyria",
      when = { class = "WARRIOR", minLevel = 6, thread = { id = "war_willem", notBeat = "b1_lyria" }, ["not"] = { thread = { id = "war_willem", beat = "b1_llane" } } },
      text = "Keep your shield up, because this is a story about a shield. I sent a Goldshire boy named Willem Tarn on to Harry Burlguard, as I'll send you, and he had the finest shield arm I ever trained. The army took him west, and now the barracks have a word for him I won't say in my yard.",
      fx = { thread = { id = "war_willem", beat = "b1_lyria", state = "stirring" } },
    },
    {
      id = "b2_burlguard", npc = "burlguard",
      when = { class = "WARRIOR", any = { { thread = { id = "war_willem", beat = "b1_llane" } }, { thread = { id = "war_willem", beat = "b1_lyria" } } },
               ["not"] = { thread = { id = "war_willem", beat = "b2_burlguard" } } },
      text = "So someone's told you about Willem, who took Bartleby's mug off him in two swings on that stool. The army sent him to guard Westfall's grain roads, and now his sergeant writes that he shed his tabard and joined Stoutmantle's farmers. I keep a list of my lads, and I can't decide whether he belongs on it.",
      fx = { thread = { id = "war_willem", beat = "b2_burlguard", state = "unfolding" } },
    },
    {
      id = "b3_gryan", npc = "gryan",
      when = { class = "WARRIOR", minLevel = 10, thread = { id = "war_willem", beat = "b2_burlguard" }, ["not"] = { thread = { id = "war_willem", beat = "b3_gryan" } } },
      text = "You'll be asking after Willem Tarn, I expect; he said someone from Old Town would come. He watched a Moonbrook family go hungry beside the grain cart he guarded, so he came up here with his tabard under his arm, and now he drills my farmers. If Stormwind wants him back, it can come and ask, and bring the grain.",
      fx = { thread = { id = "war_willem", beat = "b3_gryan" } },
    },
  },
}

-- The fever in the blood (Horde warriors, 4-30). Garvak (original), a camp-born grunt Frang
-- trained in the Den, fights like the old Horde: he failed Uzzek's path of defense three times
-- and won the fourth by charging a Kolkar pack alone, and two grunts who followed him died.
-- Kargal calls it the demon's fever; Grezz calls it the Horde's own rage. Uzzek asks the player
-- whether Garvak should master the rage or let it run.
P:Thread {
  id = "war_garvak",
  theme = "A camp-born grunt fights like the old Horde, and the veterans who remember the demon's blood can't agree whether his rage is the demon's or his own.",
  title = "The fever in the blood",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "A camp-born grunt called Garvak learned to fight in the Den at the Valley of Trials, and when the fever takes him he can't hear anyone shouting. He was sent to old Uzzek at Far Watch to learn to stand still.",
      third = "{name} heard of Garvak, a camp-born grunt who couldn't hear his trainers once the fever of battle took him." },
    unfolding = { first = "Garvak failed Uzzek's path of defense three times, and the fourth time he charged a Kolkar pack alone and won, and two grunts who ran after him didn't come back. Kargal calls it the demon's old fever, and Grezz Ragefist calls it the Horde's own rage.",
      third = "{name} learned how Garvak's charge had cost two grunts their lives, and heard the veterans argue over whether his rage was the demon's or his own." },
    resolved = { first = "I told Uzzek that Garvak must master the rage, because a rage that rules you is only another leash. He said he'd teach the whelp to stand still if it took him five tries more.",
      third = "{name} told Uzzek that Garvak must master his rage, and Uzzek set out to teach him to stand still." },
    soured = { first = "I told Uzzek to let the rage run, because it was ours before any demon came. He sent Garvak back to the Kolkar line, and he said he'd remember who told him to if they carry the whelp in on a shield.",
      third = "{name} told Uzzek to let Garvak's rage run, and Uzzek sent him back to the Kolkar line." },
  },
  npcs = { "frang", "sorek", "uzzek", "kargal", "grezz" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Uzzek that Garvak must master his rage, and Uzzek set out to teach him to stand still.",
    soured = "The player told Uzzek to let Garvak's rage run, and Uzzek sent him back to the Kolkar line.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "Frang couldn't make Garvak hear him, Uzzek couldn't make him stand, and Kargal and Grezz can't agree whose rage it is. Every warrior in the Horde fights with some of the same fire.",
    third = "{name} had heard four veterans speak of Garvak's rage, and found that every warrior in the Horde carried some of the same fire.",
  },
  beats = {
    {
      id = "b1_frang", npc = "frang",
      when = { class = "WARRIOR", minLevel = 4, thread = { id = "war_garvak", notBeat = "b1_frang" }, ["not"] = { thread = { id = "war_garvak", beat = "b1_sorek" } } },
      text = "You swing hard, recruit, and that is good, but I have seen harder. A camp-born whelp called Garvak learned to fight in this Den, and when the fever took him he could not hear me shouting, so I sent him out to old Uzzek at Far Watch to learn to stand still.",
      fx = { thread = { id = "war_garvak", beat = "b1_frang", state = "stirring" } },
    },
    {
      id = "b1_sorek", npc = "sorek",
      when = { class = "WARRIOR", minLevel = 10, thread = { id = "war_garvak", notBeat = "b1_sorek" }, ["not"] = { thread = { id = "war_garvak", beat = "b1_frang" } } },
      text = "You're swinging with your temper, grunt, and I've seen where that leads. Frang sent a camp-born orc called Garvak through this yard on his way to Uzzek at Far Watch, and Grezz loved the way he fought, and I watched him and worried.",
      fx = { thread = { id = "war_garvak", beat = "b1_sorek", state = "stirring" } },
    },
    {
      id = "b2_uzzek", npc = "uzzek",
      when = { class = "WARRIOR", any = { { thread = { id = "war_garvak", beat = "b1_frang" } }, { thread = { id = "war_garvak", beat = "b1_sorek" } } },
               ["not"] = { thread = { id = "war_garvak", beat = "b2_uzzek" } } },
      text = "Three times Garvak took the path of defense, and three times he charged when I told him to stand. The fourth time he took a Kolkar pack alone and won, and two grunts who followed him died. The old ones call it the demon's blood, the young call it an orc being an orc, and I no longer know which.",
      fx = { thread = { id = "war_garvak", beat = "b2_uzzek", state = "unfolding" } },
    },
    {
      id = "b3_kargal", npc = "kargal",
      when = { class = "WARRIOR", thread = { id = "war_garvak", beat = "b2_uzzek" }, ["not"] = { thread = { id = "war_garvak", beat = "b3_kargal" } } },
      text = "Garvak's out on the Kolkar line with my patrols now, and he's the best killer I've got and the worst soldier. I was a grunt when the old Horde still carried the demon's fever, and I know that look in his eyes, though I'll be cursed if I can tell you whether it's the fever's or his own.",
      fx = { thread = { id = "war_garvak", beat = "b3_kargal" } },
    },
    {
      id = "b3_grezz", npc = "grezz",
      when = { class = "WARRIOR", thread = { id = "war_garvak", beat = "b2_uzzek" }, ["not"] = { thread = { id = "war_garvak", beat = "b3_grezz" } } },
      text = "Uzzek's been worrying about Garvak, has he? That old shield-hugger thinks every orc who fights angry is still carrying the demon, but the rage was ours long before Gul'dan ever poured a cup, and it'll be ours long after. Let the whelp charge, I say, and let the Kolkar learn to run.",
      fx = { thread = { id = "war_garvak", beat = "b3_grezz" } },
    },
  },
}

-- The unbeaten (warriors of either faction, 30-60). Harlan Vey (original), an Arathi man, is the
-- only warrior ever to walk off Klannoc's grate unbeaten; asked why he fought, he said he was
-- good at it. His prize purses sit unspent in Fuzruckle's vault, and Bath'rah forged him a
-- whirlwind axe before he went north looking for something worth it. Klannoc asks the player
-- the same question, and the answer decides the ending.
P:Thread {
  id = "war_harlan",
  theme = "Klannoc Macleod asks every warrior why they fight, and the only one who never lost on his grate never had an answer.",
  title = "The unbeaten",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Klannoc Macleod asks every warrior on Fray Island why they fight. The only one who ever walked off his grate unbeaten, an Arathi man called Harlan Vey, said it was because he was good at it, and Klannoc has been sorry ever since.",
      third = "{name} heard from Klannoc Macleod of Harlan Vey, the only warrior to leave Fray Island unbeaten, who fought because he was good at it." },
    unfolding = { first = "Harlan Vey's prize purses sit unspent in a Ratchet vault beside a letter addressed to nobody. Bath'rah forged him a whirlwind axe, and he took it north into the Plaguelands to find something worth cutting.",
      third = "{name} followed Harlan Vey's trail from Fuzruckle's vault to Bath'rah's forge, and learned he had gone north looking for something worth his axe." },
    resolved = { first = "Klannoc asked me why I fight, and I told him it's for the people standing behind me. He said Harlan never had an answer like that, and that his grate is open to me whenever I want it.",
      third = "{name} told Klannoc Macleod that {name} fought for the people behind them, an answer Harlan Vey never had." },
    soured = { first = "Klannoc asked me why I fight, and I told him it's because I'm good at it, the same as Harlan. He said he'd keep an eye on the sea for me, the way he still keeps one on it for him.",
      third = "{name} told Klannoc Macleod that {name} fought because {name} was good at it, and Klannoc said he'd watch the sea for {name} as he did for Harlan." },
  },
  npcs = { "klannoc", "fuzruckle", "dal_bathrah" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Klannoc they fight for the people standing behind them, an answer Harlan Vey never had.",
    soured = "The player told Klannoc they fight because they're good at it, and he said he'd watch the sea for them as he does for Harlan.",
  },
  pacing = { minConversations = 3, minSeconds = 1500 },
  reflection = {
    first = "A grate he never lost on, a vault of purses he never spent, an axe he took north to find a use for: Harlan Vey had everything a warrior wants except a reason.",
    third = "{name} had followed Harlan Vey from Fray Island to Ratchet to Alterac, and found a warrior who had everything except a reason to fight.",
  },
  beats = {
    {
      id = "b1_klannoc", npc = "klannoc",
      when = { class = "WARRIOR", minLevel = 30, thread = { id = "war_harlan", notBeat = "b1_klannoc" } },
      text = "Before you step on my grate, I'll ask you what I ask everyone, which is why you fight. The only warrior who ever walked off this island unbeaten, a big Arathi man called Harlan Vey, told me it was because he was good at it, and I've been sorry ever since that I let him leave with that answer.",
      fx = { thread = { id = "war_harlan", beat = "b1_klannoc", state = "stirring" } },
    },
    {
      id = "b2_fuzruckle", npc = "fuzruckle",
      when = { class = "WARRIOR", minLevel = 30, thread = { id = "war_harlan", beat = "b1_klannoc" }, ["not"] = { thread = { id = "war_harlan", beat = "b2_fuzruckle" } } },
      text = "Harlan Vey? Sure, I know the name, pal, because his vault's been sittin' in the back for years with the rent paid ten years ahead. There's nothin' in it but his prize purses from Fray Island, every one unspent, and a letter addressed to nobody, and that's the saddest account on my books.",
      fx = { thread = { id = "war_harlan", beat = "b2_fuzruckle" } },
    },
    {
      id = "b3_bathrah", npc = "dal_bathrah",
      when = { class = "WARRIOR", minLevel = 30, thread = { id = "war_harlan", beat = "b1_klannoc" }, ["not"] = { thread = { id = "war_harlan", beat = "b3_bathrah" } } },
      text = "Harlan Vey, yes, I remember him, mon. I forged him a whirlwind axe after he brought me de wind lord's heart, and I asked him what he would cut with it, and he said he would find out. He went north into de Plaguelands looking for something worth de axe, and de wind never told me if he found it.",
      fx = { thread = { id = "war_harlan", beat = "b3_bathrah", state = "unfolding" } },
    },
  },
}

-- A Bronzebeard in the Gorge (dwarves, 10-50). Haldin Forgebrow (original), a Thelsamar
-- mountaineer, was taken by Dark Irons on the Wetlands road and sold east to the Searing Gorge.
-- The Thorium Brotherhood cut him free, and now he's asked to swear their oath. Overseer Oilfist
-- asks the dwarf player whether to take it or send him home to Ironforge.
P:Thread {
  id = "dwarf_haldin",
  theme = "An Ironforge mountaineer taken by the Dark Irons is alive among the Thorium Brotherhood, and he isn't sure he wants to come home.",
  title = "A Bronzebeard in the Gorge",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Mountaineer Kadrell says a name is missing from the Thelsamar road. Haldin Forgebrow took a letter north to Menethil and never came back, and he's on no list of the dead.",
      third = "{name} heard from Mountaineer Kadrell of Haldin Forgebrow, who walked the Thelsamar watch until he vanished on the road to Menethil." },
    unfolding = { first = "Captain Stoutfist's mountaineers found Haldin's horn in a Dark Iron camp at Dun Modr, and the Dark Irons sell what they take east to the Searing Gorge. Archesonus says a few Dark Irons up there have remembered they were our kin once.",
      third = "{name} traced Haldin Forgebrow from a Dark Iron camp at Dun Modr toward the Searing Gorge, where a few Dark Irons had remembered their old kinship." },
    resolved = { first = "Haldin is alive at Thorium Point and asked to swear the Brotherhood's oath. I told Oilfist to take it, because kin is whoever broke your chains, and he said he'd write to Haldin's mother himself.",
      third = "{name} told Overseer Oilfist to take Haldin Forgebrow's oath, and Haldin became the first Bronzebeard sworn to the Thorium Brotherhood." },
    soured = { first = "Haldin is alive at Thorium Point and asked to swear the Brotherhood's oath. I told Oilfist to send him home, because his oath belongs to Ironforge, and he put him on the next caravan.",
      third = "{name} told Overseer Oilfist to send Haldin Forgebrow home to Ironforge, and Haldin left Thorium Point on the next caravan." },
  },
  npcs = { "kadrell", "stoutfist", "archesonus", "oilfist" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Oilfist to take Haldin's oath, and Haldin became the first Bronzebeard sworn to the Thorium Brotherhood.",
    soured = "The player told Oilfist to send Haldin home, and Haldin left Thorium Point on the next caravan to Ironforge.",
  },
  pacing = { minConversations = 3, minSeconds = 1500 },
  reflection = {
    first = "A watch post in Loch Modan, a horn at Dun Modr, an old historian's library and a Dark Iron forge: Haldin's road runs through every grudge my people ever kept.",
    third = "{name} had followed Haldin Forgebrow's road from Loch Modan to the Searing Gorge, through every old grudge between the dwarven clans.",
  },
  beats = {
    {
      id = "b1_kadrell", npc = "kadrell",
      when = { race = "Dwarf", minLevel = 10, thread = { id = "dwarf_haldin", notBeat = "b1_kadrell" } },
      text = "Ye've the look o' a Dun Morogh dwarf, so ye'll understand me when I say there's a name missin' from this road. Haldin Forgebrow walked the Thelsamar watch wi' me for six years, until he took a letter north tae Menethil an' never came back, an' he's on no list o' the dead, which is worse than if he were.",
      fx = { thread = { id = "dwarf_haldin", beat = "b1_kadrell", state = "stirring" } },
    },
    {
      id = "b2_stoutfist", npc = "stoutfist",
      when = { race = "Dwarf", minLevel = 20, thread = { id = "dwarf_haldin", beat = "b1_kadrell" }, ["not"] = { thread = { id = "dwarf_haldin", beat = "b2_stoutfist" } } },
      text = "Forgebrow? Aye, my lads found his horn at Dun Modr, in a Dark Iron camp wi' a dozen other things that didnae belong tae them. The Dark Irons sell what they take east tae the Searing Gorge, tae dig for their fire god, an' I'll tell ye straight, nobody comes back from the Gorge.",
      fx = { thread = { id = "dwarf_haldin", beat = "b2_stoutfist", state = "unfolding" } },
    },
    {
      id = "b3_archesonus", npc = "archesonus",
      when = { race = "Dwarf", minLevel = 15, thread = { id = "dwarf_haldin", beat = "b1_kadrell" }, ["not"] = { thread = { id = "dwarf_haldin", beat = "b3_archesonus" } } },
      text = "I heard Haldin Forgebrow's name in your step, for his mother has asked me the same every month these three years. I tell her the Dark Irons were our kin before the War of the Three Hammers, and a few in the Searing Gorge remember it. That Thorium Brotherhood has cut more than one of our folk from Thaurissan's chains.",
      fx = { thread = { id = "dwarf_haldin", beat = "b3_archesonus" } },
    },
    {
      id = "b4_oilfist", npc = "oilfist",
      when = { race = "Dwarf", minLevel = 43, thread = { id = "dwarf_haldin", beat = "b2_stoutfist" }, ["not"] = { thread = { id = "dwarf_haldin", beat = "b4_oilfist" } } },
      text = "Haldin Forgebrow? Aye, he's here at the third forge, an' ye'll have heard him before ye saw him, for he sings at the anvil. We cut him out o' the Cauldron's chains two winters back, an' now he's asked tae swear tae the Brotherhood, which no Bronzebeard has ever done, an' I've no' given him an answer yet.",
      fx = { thread = { id = "dwarf_haldin", beat = "b4_oilfist" } },
    },
  },
}

-- The bear at Auberdine (Alliance hunters, 10-30). Durgan Flintbrow (original), a Kharanos
-- hunter Grif Wildheart trained, crossed to Darnassus to learn how the kaldorei bond with their
-- beasts, tamed a grey Darkshore bear he called Slate, and took him to Auberdine. Slate ate from
-- the Blackwood's tainted stores, and now the bear growls at him more every day. Dorion asks the
-- player what Durgan should do: end it while Slate still knows him, or keep fighting for him.
P:Thread {
  id = "hun_alliance",
  theme = "A dwarf hunter's bear is turning wild with the Blackwood's corruption, and the hunters of two peoples can't agree what he owes the beast.",
  title = "The bear at Auberdine",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "A Kharanos hunter called Durgan Flintbrow crossed the sea to learn how the kaldorei talk to their beasts. He passed through Darnassus with a grey bear at his heel, and he hasn't written home since the autumn.",
      third = "{name} heard of Durgan Flintbrow, a dwarf hunter who went to Darnassus to learn the kaldorei way with beasts and stopped writing home." },
    unfolding = { first = "Durgan tamed his bear Slate in Darkshore under Dorion's eye, and Slate ate from the Blackwood furbolgs' tainted stores. Now Durgan sits on the Auberdine dock with a bear that growls at him a little more each day, and he won't hear a word about it.",
      third = "{name} learned that Durgan Flintbrow's bear had eaten the Blackwood's tainted food, and that Durgan sat on the Auberdine dock watching it turn." },
    resolved = { first = "I told Dorion that Durgan should end it while Slate still knows his voice. Dorion said he'd go to Auberdine himself and stand beside the dwarf when he did it, so that he wouldn't do it alone.",
      third = "{name} told Dorion that Durgan Flintbrow should let his bear go while it still knew him, and Dorion went to stand beside him." },
    soured = { first = "I told Dorion that Durgan should never give up on Slate. Dorion sent word to Auberdine, and a week later the bear broke its chain on the dock, and the Sentinels had to do what Durgan wouldn't.",
      third = "{name} told Dorion that Durgan Flintbrow should keep fighting for his bear, and the Sentinels of Auberdine ended it for him." },
  },
  npcs = { "mf_grif", "jeenra", "dorion", "thundris", "daera" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Dorion that Durgan should let Slate go while the bear still knew him, and Dorion went to Auberdine to stand beside him.",
    soured = "The player told Dorion that Durgan should never give up on Slate, and the Sentinels of Auberdine ended it when the bear broke its chain.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "Grif taught Durgan to feed his beast, Dorion taught him to listen to it, and Thundris says the Blackwood has stopped it listening back. Every hunter keeps a beast knowing this could happen.",
    third = "{name} had followed Durgan Flintbrow from Kharanos to Darnassus to the Auberdine dock, and learned what every hunter risks in a beast.",
  },
  beats = {
    {
      id = "b1_grif", npc = "mf_grif",
      when = { class = "HUNTER", faction = "Alliance", minLevel = 10, thread = { id = "hun_alliance", notBeat = "b1_grif" }, ["not"] = { thread = { id = "hun_alliance", beat = "b1_jeenra" } } },
      text = "Ye'll be tamin' yer first beast soon, so hear about the best student I ever had. Durgan Flintbrow could call a boar off its charge wi' one whistle, an' he sailed tae Darnassus tae learn how the elves talk tae their beasts. I've had no letter since the autumn, so if ye're ever over the water, ask after him.",
      fx = { thread = { id = "hun_alliance", beat = "b1_grif", state = "stirring" } },
    },
    {
      id = "b1_jeenra", npc = "jeenra",
      when = { class = "HUNTER", faction = "Alliance", minLevel = 10, thread = { id = "hun_alliance", notBeat = "b1_jeenra" }, ["not"] = { thread = { id = "hun_alliance", beat = "b1_grif" } } },
      text = "A dwarf came through Rut'theran last spring with a bow too big for him and the gentlest hands I've seen on his kind. Durgan Flintbrow wished to learn how we bond with our beasts, so I sent him to Dorion, and he went on to Darkshore with a grey bear at his heel. I wonder how that ended.",
      fx = { thread = { id = "hun_alliance", beat = "b1_jeenra", state = "stirring" } },
    },
    {
      id = "b2_dorion", npc = "dorion",
      when = { class = "HUNTER", any = { { thread = { id = "hun_alliance", beat = "b1_grif" } }, { thread = { id = "hun_alliance", beat = "b1_jeenra" } } },
               ["not"] = { thread = { id = "hun_alliance", beat = "b2_dorion" } } },
      text = "Durgan Flintbrow, yes, and Shadow liked him, which is rare. I took him to Darkshore and watched him tame a grey thistle bear he called Slate, and within a week they were one animal. His last letter came from Auberdine saying Slate had eaten from the Blackwood's stores, with something in the bear's eyes he didn't recognise.",
      fx = { thread = { id = "hun_alliance", beat = "b2_dorion", state = "unfolding" } },
    },
    {
      id = "b3_thundris", npc = "thundris",
      when = { class = "HUNTER", minLevel = 12, thread = { id = "hun_alliance", beat = "b2_dorion" }, ["not"] = { thread = { id = "hun_alliance", beat = "b3_thundris" } } },
      text = "You have come about the dwarf on the dock, I think, and his bear. Whatever maddened the Blackwood furbolgs was in their stored food, and the bear ate from it before anyone knew. Durgan sits with it every evening and sings to it in his rough tongue, and every evening it growls a little longer before it lies down.",
      fx = { thread = { id = "hun_alliance", beat = "b3_thundris" } },
    },
    {
      id = "b3_daera", npc = "daera",
      when = { class = "HUNTER", race = "Dwarf", thread = { id = "hun_alliance", beat = "b2_dorion" }, ["not"] = { thread = { id = "hun_alliance", beat = "b3_daera" } } },
      text = "Durgan's bear, aye, Grif wrote tae me about it, an' he's been sour as old milk since. The elves say a hunter lets a sick beast go back tae the earth, an' they're no' wrong, but a dwarf doesnae give up on anythin' he loves while it breathes. I'd no' want tae be the one tellin' Durgan which.",
      fx = { thread = { id = "hun_alliance", beat = "b3_daera" } },
    },
  },
}

-- The thinning herds (Horde hunters, 10-30). Garra Steelgaze (original), an orc hunter out of
-- Razor Hill, leads the meat-hunters who feed Orgrimmar from the Barrens herds, and the Crossroads
-- buys every haunch. The tauren of Thunder Bluff say she takes more than the plains can spare.
-- Holt Thunderhorn asks the player whether Garra should learn the old rites or keep the city fed.
P:Thread {
  id = "hun_horde",
  theme = "An orc hunter feeds Orgrimmar from the Barrens herds, and the tauren say she is taking more than the plains can give back.",
  title = "The thinning herds",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "An orc hunter called Garra Steelgaze leads the meat-hunters who feed Orgrimmar from the Barrens. The tauren hunters have started saying her name the way they say drought.",
      third = "{name} heard of Garra Steelgaze, an orc hunter who fed Orgrimmar from the Barrens, and whose name the tauren said like drought." },
    unfolding = { first = "Sergra Darkthorn buys every haunch Garra brings into the Crossroads, and Ormak Grimshot says a city of orcs can't eat the Earth Mother's blessings. Up on Hunter Rise they say the zhevra herds are half what they were when the Horde came.",
      third = "{name} heard the Crossroads, Orgrimmar and Thunder Bluff argue over Garra Steelgaze and the thinning herds of the Barrens." },
    resolved = { first = "I told Holt Thunderhorn that Garra should learn the old rites and take only what the herds can spare. He said he'd teach her himself, if she'd climb the Rise to hear it, and that he thought she would.",
      third = "{name} told Holt Thunderhorn that Garra Steelgaze should learn the tauren's rites, and Holt offered to teach her himself." },
    soured = { first = "I told Holt Thunderhorn that Orgrimmar has to eat and the herds will have to bear it. He nodded slowly and said that the plains would remember who said so, long after the Horde had forgotten.",
      third = "{name} told Holt Thunderhorn that the Horde's hunger came before the herds, and Holt said the plains would remember." },
  },
  npcs = { "thotar", "yaw", "sergra", "ormak", "holt" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Holt Thunderhorn that Garra should learn the old rites, and Holt offered to teach her himself.",
    soured = "The player told Holt Thunderhorn that Orgrimmar must eat, and Holt said the plains would remember who said so.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "Garra feeds a city, Sergra feeds a garrison, and the Thunderhorns count the herds and find them smaller every year. Every hunter in the Horde eats from the same plains.",
    third = "{name} had followed Garra Steelgaze's hunt from Razor Hill to the Crossroads and up to Hunter Rise, and found every Horde hunter ate from the same plains.",
  },
  beats = {
    {
      id = "b1_thotar", npc = "thotar",
      when = { class = "HUNTER", faction = "Horde", minLevel = 10, thread = { id = "hun_horde", notBeat = "b1_thotar" }, ["not"] = { thread = { id = "hun_horde", beat = "b1_yaw" } } },
      text = "You will hunt the Barrens soon, and you will meet Garra Steelgaze there, because everyone does. She trained in this yard, and now she leads the hunters who feed Orgrimmar, forty carcasses to a wagon. The tauren look at her the way they look at a dry sky, and I have not decided whether they are wrong.",
      fx = { thread = { id = "hun_horde", beat = "b1_thotar", state = "stirring" } },
    },
    {
      id = "b1_yaw", npc = "yaw",
      when = { class = "HUNTER", faction = "Horde", minLevel = 10, thread = { id = "hun_horde", notBeat = "b1_yaw" }, ["not"] = { thread = { id = "hun_horde", beat = "b1_thotar" } } },
      text = "When you go down into the Barrens, young hunter, count the zhevra as you pass them, and then ask an elder how many there were before the orcs came. An orc called Garra Steelgaze leads the hunters who feed their city, and she is good at it, which is exactly what worries us.",
      fx = { thread = { id = "hun_horde", beat = "b1_yaw", state = "stirring" } },
    },
    {
      id = "b2_sergra", npc = "sergra",
      when = { class = "HUNTER", minLevel = 12, any = { { thread = { id = "hun_horde", beat = "b1_thotar" } }, { thread = { id = "hun_horde", beat = "b1_yaw" } } },
               ["not"] = { thread = { id = "hun_horde", beat = "b2_sergra" } } },
      text = "Garra? I buy every haunch she drags through that gate, and I'd buy more, because I've a garrison to feed and the Kolkar don't sell. The tauren look at her wagons like she's robbing a grave, and I tell them the same thing every time: my grunts can't stand a wall on prayers.",
      fx = { thread = { id = "hun_horde", beat = "b2_sergra", state = "unfolding" } },
    },
    {
      id = "b3_ormak", npc = "ormak",
      when = { class = "HUNTER", thread = { id = "hun_horde", beat = "b2_sergra" }, ["not"] = { thread = { id = "hun_horde", beat = "b3_ormak" } } },
      text = "Garra feeds this city, and I'll hear no hunter in Orgrimmar say a word against her. The tauren had the plains and the rain to themselves for a thousand years, and we came out of the camps into red dust with a whole people to feed. Let them count the zhevra; I count the orcs.",
      fx = { thread = { id = "hun_horde", beat = "b3_ormak" } },
    },
    {
      id = "b3_holt", npc = "holt",
      when = { class = "HUNTER", thread = { id = "hun_horde", beat = "b2_sergra" }, ["not"] = { thread = { id = "hun_horde", beat = "b3_holt" } } },
      text = "The herds of the Barrens are half what they were when the Horde came; I have counted them myself. Garra Steelgaze is neither cruel nor greedy, but she hunts as if the plains will always be full, as the young do before the Earth Mother teaches them. Better she learn it from me than from an empty plain.",
      fx = { thread = { id = "hun_horde", beat = "b3_holt" } },
    },
  },
}

-- The kindly strangers (hunters of either faction, 55-60). The Ancient Petrified Leaf from the
-- Firelord's hoard leads to the spirits of the Irontree Woods: Vartrus, Stoma and Hastat. Their
-- stave is earned by killing four corrupters who walk among mortals wearing kind faces, among
-- them Artorius the Amiable in Winterspring, whom Everlook adores. Vartrus asks the player what
-- they will tell the people who loved him: the truth, or nothing.
P:Thread {
  id = "hun_rhokdelar",
  theme = "The Ancients of the Irontree Woods will give a hunter a bow of their own wood, but the price is killing demons that everyone else calls kind.",
  title = "The kindly strangers",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The oldest hunters say the spirits of three Ancients of Lore still stand in Felwood's Irontree Woods, Vartrus, Stoma and Hastat, waiting for a hunter worthy of what they can give.",
      third = "{name} heard that the spirits of three Ancients of Lore waited in Felwood's Irontree Woods for a worthy hunter." },
    unfolding = { first = "Vartrus says four corrupters walk among mortals wearing kind faces, and that his stave is the price of their heads. In Everlook they talk about Artorius the Amiable as if he were the best neighbour they ever had, and at the hot springs the snowblossoms die wherever a friendly stranger has stood.",
      third = "{name} learned from Vartrus that four demons walked among mortals wearing kind faces, and found Winterspring fond of one of them." },
    resolved = { first = "Vartrus asked what I would tell the people who loved the kindly strangers. I told him the truth, even if they hate me for it, and he said that a hunter who carries his wood should carry the truth as well.",
      third = "{name} told Vartrus the Ancient that {name} would tell Winterspring the truth about its kindly strangers, whatever it cost." },
    soured = { first = "Vartrus asked what I would tell the people who loved the kindly strangers. I told him I'd let them keep their kind neighbour, and he said that the next demon to smile at them would find them just as trusting.",
      third = "{name} told Vartrus the Ancient that Winterspring could keep its kind memories, and Vartrus said the next demon would find it just as trusting." },
  },
  npcs = { "jocaste", "urek", "vartrus", "harlo_w", "donova" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Vartrus they would tell Winterspring the truth about its kindly strangers, whatever it cost them.",
    soured = "The player told Vartrus they would let Winterspring keep its kind memories, and he warned that the next demon would find it as trusting.",
  },
  pacing = { minConversations = 3, minSeconds = 1500 },
  reflection = {
    first = "An Ancient who died at Hyjal, a gossip who adores a demon, and a dwarf whose flowers die where a friendly man has stood. The hardest prey I've ever hunted smiles back at me.",
    third = "{name} had walked from the Irontree Woods to Winterspring after demons that smiled, and found them harder prey than anything with claws.",
  },
  beats = {
    {
      id = "b1_jocaste", npc = "jocaste",
      when = { class = "HUNTER", faction = "Alliance", minLevel = 55, thread = { id = "hun_rhokdelar", notBeat = "b1_jocaste" }, ["not"] = { thread = { id = "hun_rhokdelar", beat = "b1_urek" } } },
      text = "There is little left I can teach you, hunter, so let me tell you something instead. In Felwood's Irontree Woods, three Ancients of Lore, Vartrus, Stoma and Hastat, still stand where they fell at Hyjal, awaiting a hunter worthy of a bow of their own wood. If you ever carry a leaf turned to stone, take it to them.",
      fx = { thread = { id = "hun_rhokdelar", beat = "b1_jocaste", state = "stirring" } },
    },
    {
      id = "b1_urek", npc = "urek",
      when = { class = "HUNTER", faction = "Horde", minLevel = 55, thread = { id = "hun_rhokdelar", notBeat = "b1_urek" }, ["not"] = { thread = { id = "hun_rhokdelar", beat = "b1_jocaste" } } },
      text = "Sit, and I'll tell you the oldest hunter's story I know, which is also true. In Felwood's Irontree Woods, three Ancients died holding back the Burning Legion, and their spirits still wait for a hunter worthy of a bow cut from their wood. My grandfather looked for them all his life, and you might actually find them.",
      fx = { thread = { id = "hun_rhokdelar", beat = "b1_urek", state = "stirring" } },
    },
    {
      id = "b2_vartrus", npc = "vartrus",
      when = { class = "HUNTER", any = { { thread = { id = "hun_rhokdelar", beat = "b1_jocaste" } }, { thread = { id = "hun_rhokdelar", beat = "b1_urek" } } },
               ["not"] = { thread = { id = "hun_rhokdelar", beat = "b2_vartrus" } } },
      text = "Someone has told you of us, and you came anyway, which is the first test and the easiest. The corrupters poisoning this forest walk among your kind with kind faces: Simone, Franklin, Nelson and Artorius. Their people love them, small one, and when you kill them, those people will see a hunter murder a friend.",
      fx = { thread = { id = "hun_rhokdelar", beat = "b2_vartrus", state = "unfolding" } },
    },
    {
      id = "b3_harlo", npc = "harlo_w",
      when = { class = "HUNTER", thread = { id = "hun_rhokdelar", beat = "b2_vartrus" }, ["not"] = { thread = { id = "hun_rhokdelar", beat = "b3_harlo" } } },
      text = "Artorius? Artorius the Amiable? Oh, pal, he's the nicest fella in all of Winterspring, and you can quote me, because everybody does. He gives travellers directions, he never haggles, and he once walked a lost courier halfway to Starfall in a blizzard, and if I ever hear a bad word about him I'll eat my notebook, cover and all.",
      fx = { thread = { id = "hun_rhokdelar", beat = "b3_harlo" } },
    },
    {
      id = "b3_donova", npc = "donova",
      when = { class = "HUNTER", thread = { id = "hun_rhokdelar", beat = "b2_vartrus" }, ["not"] = { thread = { id = "hun_rhokdelar", beat = "b3_donova" } } },
      text = "Ye've the look o' someone huntin' somethin' in particular, so I'll tell ye a strange thing. There's a pleasant stranger who passes the springs now an' then, all smiles an' good manners, an' everywhere he's stood, the snowblossoms are black by mornin'. I've studied plants for twenty years, an' I've never seen frost do that.",
      fx = { thread = { id = "hun_rhokdelar", beat = "b3_donova" } },
    },
  },
}

-- The long watch (night elves of any class, 8-30). Saelra Duskwind (original), a Sentinel who
-- stood ten thousand years of watches from the War of the Satyr to the orcs in Ashenvale, has not
-- spoken to her brother Thalanir since he woke from the barrow dens. He answered Fandral's call
-- to plant Teldrassil, and she says the druids slept while the Sentinels bled. Tyrande, who has
-- waited out Malfurion's sleep herself, asks the player whether Saelra should go to him.
-- Fandral is written straight.
P:Thread {
  id = "elf_saelra",
  theme = "A Sentinel kept watch for ten thousand years while her brother slept in the Dream, and now that he's awake neither of them will cross the terrace between the Temple and the Enclave.",
  title = "The long watch",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Thalanir Duskwind is a druid who slept in the barrow dens for ten thousand years and woke to plant Teldrassil. His sister Saelra stood the Sentinels' watch the whole time he slept, and she won't speak his name.",
      third = "{name} heard of Thalanir Duskwind, a druid who slept ten thousand years, and of his sister Saelra, a Sentinel who kept watch the whole time and won't speak his name." },
    unfolding = { first = "Mathrengyl says the druids' sleep was a watch of its own, kept in the Dream. Fandral says Thalanir was among the first to answer when Teldrassil was planted, and the High Priestess says she knows what it is to wait on a druid's sleep.",
      third = "{name} heard the Enclave and the Temple speak of the Duskwind siblings, and of the old wound between the druids who slept and the Sentinels who stood watch." },
    resolved = { first = "I told the High Priestess that both of them kept a watch, and that Saelra should go to her brother. She said she would give Saelra leave to come to Darnassus, and that we are mortal now, so ten thousand years of anger is a luxury nobody can afford.",
      third = "{name} told Tyrande Whisperwind that both siblings had kept a watch, and Tyrande gave Saelra Duskwind leave to come home to her brother." },
    soured = { first = "I told the High Priestess that Thalanir slept while his sister bled, and that she owes him nothing. She said Saelra would keep her post and he his grove, and that she would pray they both lived long enough to change their minds.",
      third = "{name} told Tyrande Whisperwind that Saelra Duskwind owed her brother nothing, and the siblings stayed apart." },
  },
  npcs = { "rellian", "glynda", "mathrengyl", "fandral", "tyrande" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Tyrande that both Duskwinds had kept a watch, and Tyrande gave Saelra leave to come to Darnassus and her brother.",
    soured = "The player told Tyrande that Saelra owed her sleeping brother nothing, and the two kept to the Temple's side and the Enclave's.",
  },
  pacing = { minConversations = 2, minSeconds = 1200 },
  reflection = {
    first = "The Sentinels stood the watch for ten thousand years, the druids kept theirs in the Dream, and both sides still count the cost. Every family of my people has a Saelra or a Thalanir in it.",
    third = "{name} had heard the Temple and the Enclave speak of the Duskwinds, and found the old wound between the watchers and the sleepers ran through every kaldorei family.",
  },
  beats = {
    {
      id = "b1_rellian", npc = "rellian",
      when = { race = "NightElf", minLevel = 8, thread = { id = "elf_saelra", notBeat = "b1_rellian" }, ["not"] = { thread = { id = "elf_saelra", beat = "b1_glynda" } } },
      text = "Forgive me if I'm short, friend; the druid Thalanir Duskwind was here this morning, and he hates to hear the word tumor near Teldrassil. He woke from the barrow dens to help plant this tree, and loves it like a child. His sister is a Sentinel in Auberdine, and they say she hasn't spoken his name since.",
      fx = { thread = { id = "elf_saelra", beat = "b1_rellian", state = "stirring" } },
    },
    {
      id = "b1_glynda", npc = "glynda",
      when = { race = "NightElf", minLevel = 12, thread = { id = "elf_saelra", notBeat = "b1_glynda" }, ["not"] = { thread = { id = "elf_saelra", beat = "b1_rellian" } } },
      text = "The oldest bow on my post belongs to Saelra Duskwind, who watched the Ashenvale borders before most of Darnassus was born. She fought satyrs and orcs while her brother slept in the barrow dens. He's an Enclave druid now, and if you say his name on this dock, she'll walk to the end of it and stay until dark.",
      fx = { thread = { id = "elf_saelra", beat = "b1_glynda", state = "stirring" } },
    },
    {
      id = "b2_mathrengyl", npc = "mathrengyl",
      when = { race = "NightElf", any = { { thread = { id = "elf_saelra", beat = "b1_rellian" } }, { thread = { id = "elf_saelra", beat = "b1_glynda" } } },
               ["not"] = { thread = { id = "elf_saelra", beat = "b2_mathrengyl" } } },
      text = "Thalanir slept beside me in the barrow dens, and I'll tell you what I told him, which his sister never wished to hear. We were not idle in the Dream, young one, for tending it was a watch too, though no Sentinel saw us keep it. The trouble is that she bled for hers, and we did not.",
      fx = { thread = { id = "elf_saelra", beat = "b2_mathrengyl", state = "unfolding" } },
    },
    {
      id = "b3_fandral", npc = "fandral",
      when = { race = "NightElf", minLevel = 10, thread = { id = "elf_saelra", beat = "b2_mathrengyl" }, ["not"] = { thread = { id = "elf_saelra", beat = "b3_fandral" } } },
      text = "Thalanir Duskwind was among the first to answer when I called the Circle to plant Teldrassil, and he has given this tree more than most. The Sentinels guarded our borders and the druids the Dream, and both watches were kept, so I will hear no grievance against him. His sister may bring her quarrel to me.",
      fx = { thread = { id = "elf_saelra", beat = "b3_fandral" } },
    },
    {
      id = "b3_tyrande", npc = "tyrande",
      when = { race = "NightElf", minLevel = 10, thread = { id = "elf_saelra", beat = "b2_mathrengyl" }, ["not"] = { thread = { id = "elf_saelra", beat = "b3_tyrande" } } },
      text = "Saelra Duskwind stood beside me against the satyrs when the Sentinels were young, and I remember her bow better than most faces. I too have kept watch while the one I love slept in the Dream, and forgiven Malfurion for it more than once. She has not forgiven her brother, and I wonder whether to ask her to.",
      fx = { thread = { id = "elf_saelra", beat = "b3_tyrande" } },
    },
  },
}

-- Bread for the cellars (Alliance mages, 5-45). Wendel Pryce (original), a Lordaeron refugee
-- apprenticed in the Wizard's Sanctum, conjured bread every night for the refugees in the
-- Cathedral's cellars until the bakers petitioned Maginor Dumas, who forbade it. He conjured
-- water for the Gnomeregan refugees in Tinker Town under Bink's eye, then sailed for Theramore.
-- Tervosh must keep him or send him home; the ending follows what the player has said about
-- mages (opinion `mages`, from the views in views_5.lua), which Theramore's gossip carries to him.
P:Thread {
  id = "mage_alliance",
  theme = "A refugee apprentice fed the hungry with conjured bread until his masters stopped him, and the Alliance's magi can't agree whether magic belongs to the people or behind the tower door.",
  title = "Bread for the cellars",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "An apprentice called Wendel Pryce came south with the Lordaeron refugees and studied in the Wizard's Sanctum. He conjured bread every night for the people sleeping in the Cathedral's cellars, until somebody made him stop.",
      third = "{name} heard of Wendel Pryce, a refugee apprentice of the Wizard's Sanctum who conjured bread for the Cathedral's cellars until somebody made him stop." },
    unfolding = { first = "Maginor Dumas forbade Wendel's bread after the bakers of Old Town petitioned him, and Wendel went to Tinker Town and conjured water for the Gnomeregan refugees instead. Now he's in Theramore, feeding whoever washes up on the docks, and Archmage Tervosh has letters from Stormwind asking for him back.",
      third = "{name} followed Wendel Pryce from the Wizard's Sanctum to Tinker Town and on to Theramore, where Archmage Tervosh had to decide whether to send him home." },
    resolved = { first = "Tervosh heard what I'd been saying about what magic owes the people around it, and he wrote to Maginor Dumas that night. Wendel stays in Theramore, and the refugees eat.",
      third = "{name} spoke up for magic that serves ordinary people, and Archmage Tervosh kept Wendel Pryce in Theramore to feed the refugees." },
    soured = { first = "Tervosh heard me say that mages ought to keep to their towers and their rules, and he sent Wendel back to the Sanctum with a letter for Malin. Wendel went quietly, and Tervosh said that was worse than if he'd argued.",
      third = "{name} said that mages belong behind their tower doors, and Archmage Tervosh sent Wendel Pryce back to Stormwind." },
  },
  npcs = { "jennea", "elsharin", "maginor", "bink", "tervosh" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player spoke up for magic that serves ordinary people, and Tervosh kept Wendel Pryce in Theramore to feed the refugees.",
    soured = "The player said mages belong behind their tower doors, and Tervosh sent Wendel Pryce back to the Wizard's Sanctum.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "Jennea counted his gaps, Dumas counted the cold ovens, Bink counted the flasks, and Tervosh counts the refugees. Nobody ever asked Wendel what he counted.",
    third = "{name} had followed Wendel Pryce's bread from the Cathedral's cellars to Theramore's docks, and found that every mage in the Alliance had an opinion of it.",
  },
  beats = {
    {
      id = "b1_jennea", npc = "jennea",
      when = { class = "MAGE", faction = "Alliance", minLevel = 5, thread = { id = "mage_alliance", notBeat = "b1_jennea" }, ["not"] = { thread = { id = "mage_alliance", beat = "b1_elsharin" } } },
      text = "Everyone's fundamentals have gaps, and the widest belonged to the best student I ever had. Wendel Pryce came down from Lordaeron with the refugees, and he could conjure bread before he could hold a frost ward, and he gave away every loaf in the Cathedral's cellars. Master Dumas put a stop to it, and Wendel left the Sanctum that week.",
      fx = { thread = { id = "mage_alliance", beat = "b1_jennea", state = "stirring" } },
    },
    {
      id = "b1_elsharin", npc = "elsharin",
      when = { class = "MAGE", faction = "Alliance", minLevel = 8, thread = { id = "mage_alliance", notBeat = "b1_elsharin" }, ["not"] = { thread = { id = "mage_alliance", beat = "b1_jennea" } } },
      text = "I have taught apprentices in this tower a long while, and only one ever wept over a loaf of bread. Wendel Pryce came south with the Lordaeron refugees and conjured bread for them nightly in the Cathedral's cellars, until the bakers of Old Town went to Master Dumas. Ask Maginor what he told the boy, because nobody asked me.",
      fx = { thread = { id = "mage_alliance", beat = "b1_elsharin", state = "stirring" } },
    },
    {
      id = "b2_maginor", npc = "maginor",
      when = { class = "MAGE", any = { { thread = { id = "mage_alliance", beat = "b1_jennea" } }, { thread = { id = "mage_alliance", beat = "b1_elsharin" } } },
               ["not"] = { thread = { id = "mage_alliance", beat = "b2_maginor" } } },
      text = "You've heard about Pryce, then, and I expect I was the villain of it. The boy was feeding half the cellars for nothing, three Old Town ovens went cold, and when the bakers' guild petitioned me, I told him the art is not a soup kitchen. I still believe that, though I've slept worse since he went to Ironforge.",
      fx = { thread = { id = "mage_alliance", beat = "b2_maginor", state = "unfolding" }, learn = { "mages" } },
    },
    {
      id = "b3_bink", npc = "bink",
      when = { class = "MAGE", minLevel = 15, thread = { id = "mage_alliance", beat = "b2_maginor" }, ["not"] = { thread = { id = "mage_alliance", beat = "b3_bink" } } },
      text = "Wendel Pryce, tall and mournful, smelling faintly of bread? He spent a whole winter in Tinker Town conjuring water for the Gnomeregan refugees, eleven hundred and forty flasks by my count, and never asked who was paying. Then a letter came from Theramore and he sailed from Menethil, and I'm told Lady Jaina's magi don't mind feeding people at all.",
      fx = { thread = { id = "mage_alliance", beat = "b3_bink" }, learn = { "theramore" } },
    },
    {
      id = "b4_tervosh", npc = "tervosh",
      when = { class = "MAGE", minLevel = 30, thread = { id = "mage_alliance", beat = "b3_bink" }, ["not"] = { thread = { id = "mage_alliance", beat = "b4_tervosh" } } },
      text = "Pryce is here, feeding every refugee and deserter who washes up on my docks, and Lady Jaina likes him enormously. Malin and Dumas both want him sent back to his books before he becomes a bread cart in a robe. I haven't decided, and Theramore is small, so whatever you think mages are for, I'll hear it soon.",
      fx = { thread = { id = "mage_alliance", beat = "b4_tervosh" }, learn = { "mages" } },
    },
    {
      id = "b5_tervosh_keep", npc = "tervosh",
      when = { class = "MAGE", thread = { id = "mage_alliance", beat = "b4_tervosh" },
               opinion = { topic = "mages", stance = { "serve", "craft", "free", "admire", "respect", "trust" } },
               ["not"] = { any = { { thread = { id = "mage_alliance", beat = "b5_tervosh_keep" } }, { thread = { id = "mage_alliance", beat = "b5_tervosh_send" } } } } },
      text = "I heard what you've been telling people about mages and what we owe the folk around us, and I wrote to Dumas that same night. Pryce stays in Theramore, and the refugees eat, and if the bakers of Stormwind wish to complain, they may row out here and do it in person.",
      fx = { thread = { id = "mage_alliance", beat = "b5_tervosh_keep", state = "resolved" } },
    },
    {
      id = "b5_tervosh_send", npc = "tervosh",
      when = { class = "MAGE", thread = { id = "mage_alliance", beat = "b4_tervosh" },
               opinion = { topic = "mages", stance = { "leash", "danger", "distrust", "fear", "scorn" } },
               ["not"] = { any = { { thread = { id = "mage_alliance", beat = "b5_tervosh_keep" } }, { thread = { id = "mage_alliance", beat = "b5_tervosh_send" } } } } },
      text = "I hear you've been saying that mages ought to keep to their towers and their rules, and I'll admit Dumas says the same in longer words. I've sent Pryce back to the Sanctum with a letter for Malin, and he went quietly, which was worse than if he'd argued.",
      fx = { thread = { id = "mage_alliance", beat = "b5_tervosh_send", state = "soured" } },
    },
  },
}

-- The orc who chose frost (Horde mages, 5-45). Mogra (original), a camp-born orc girl, asked the
-- Darkbriar Lodge for frost instead of fire; her grandfather, a Second War grunt who remembers
-- what the warlocks did to the orcs, broke her focus over his knee. She went down to the
-- Undercity to study under Anastasia Hartwell, where Kaelystia Hatebringer approves of her spite.
-- Hartwell keeps her or sends her home; the ending follows the player's opinion of `mages`.
P:Thread {
  id = "mage_horde",
  theme = "An orc girl took up the arcane, and her grandfather, who remembers the warlocks, would rather see her dead than a mage.",
  title = "The orc who chose frost",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "A camp-born orc girl called Mogra sat down in the Darkbriar Lodge and asked to learn frost. Her grandfather came the next morning and broke her focus over his knee, and she went down to the Undercity to learn from the dead instead.",
      third = "{name} heard of Mogra, an orc girl who asked the Darkbriar Lodge for frost, and whose grandfather broke her focus over his knee." },
    unfolding = { first = "Mogra's grandfather fought in the Second War and watched the warlocks burn the spirits out of his people, and he calls the arcane their cousin. Mogra studies under Anastasia Hartwell in the Magic Quarter now, and the old orcs have written to the Dark Lady asking for her back.",
      third = "{name} learned why Mogra's grandfather feared the arcane, and found her studying under Anastasia Hartwell in the Undercity while the old orcs demanded her home." },
    resolved = { first = "Hartwell heard me say that magic is a craft like any other, and that it's what you do with it that counts. Mogra stays in the Magic Quarter, and Hartwell wrote to her grandfather that he may come and watch her work.",
      third = "{name} spoke for magic as a craft like any other, and Anastasia Hartwell kept Mogra as her student." },
    soured = { first = "Hartwell heard me say the arcane is the warlocks' road in a cleaner coat, and she sent Mogra home to Orgrimmar with her books. Mogra didn't thank her for it, and Hartwell didn't expect her to.",
      third = "{name} said that the arcane walks the warlocks' road, and Anastasia Hartwell sent Mogra home to Orgrimmar." },
  },
  npcs = { "pephredo", "uthelnay", "deino", "uc_kaelystia", "hartwell" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player spoke for magic as a craft like any other, and Hartwell kept Mogra as her student.",
    soured = "The player said the arcane walks the warlocks' road, and Hartwell sent Mogra home to Orgrimmar.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "The trolls taught Mogra her first spell, the dead taught her the rest, and her grandfather taught her what the old Horde fears. Every mage of the Horde carries a little of that fear around with the spellbook.",
    third = "{name} had followed Mogra from the Darkbriar Lodge to the Undercity's Magic Quarter, and found that every mage of the Horde carried a little of the old fear with them.",
  },
  beats = {
    {
      id = "b1_pephredo", npc = "pephredo",
      when = { class = "MAGE", faction = "Horde", minLevel = 5, thread = { id = "mage_horde", notBeat = "b1_pephredo" }, ["not"] = { thread = { id = "mage_horde", beat = "b1_uthelnay" } } },
      text = "You see dat scorch by de door, mon? Dat be Mogra's, an orc girl born in de camps, de first orc in many a year to sit on dis floor an' ask for frost instead of fire. Her grandfather broke her focus over his knee de next mornin', an' she went to de Undercity to learn from de dead.",
      fx = { thread = { id = "mage_horde", beat = "b1_pephredo", state = "stirring" } },
    },
    {
      id = "b1_uthelnay", npc = "uthelnay",
      when = { class = "MAGE", faction = "Horde", minLevel = 8, thread = { id = "mage_horde", notBeat = "b1_uthelnay" }, ["not"] = { thread = { id = "mage_horde", beat = "b1_pephredo" } } },
      text = "I had a camp-born orc girl in dis lodge once, mon, called Mogra, an' she froze a bucket solid on her second day and laughed like a child. Her grandfather come in an' broke her focus before all my students, an' none of dem has asked for frost since. She be in de Undercity now, learnin' from de dead.",
      fx = { thread = { id = "mage_horde", beat = "b1_uthelnay", state = "stirring" } },
    },
    {
      id = "b2_deino", npc = "deino",
      when = { class = "MAGE", any = { { thread = { id = "mage_horde", beat = "b1_pephredo" } }, { thread = { id = "mage_horde", beat = "b1_uthelnay" } } },
               ["not"] = { thread = { id = "mage_horde", beat = "b2_deino" } } },
      text = "Mogra's grandfather fought in de Second War, an' he watched Gul'dan's warlocks burn his people's spirits. He told me de arcane be de warlocks' cousin, an' I told him it be not, but it be closer dan I would like. De girl went to Anastasia Hartwell in de Undercity, because de dead don't flinch at what she be.",
      fx = { thread = { id = "mage_horde", beat = "b2_deino", state = "unfolding" }, learn = { "mages" } },
    },
    {
      id = "b3_kaelystia", npc = "uc_kaelystia",
      when = { class = "MAGE", minLevel = 12, thread = { id = "mage_horde", beat = "b2_deino" }, ["not"] = { thread = { id = "mage_horde", beat = "b3_kaelystia" } } },
      text = "The orc girl studies harder than any of our dead, out of spite, and I approve of spite. She asked why I hate Dalaran, so I told her about Kel'Thuzad and the Kirin Tor who expelled him then looked away as he walked north. She said her grandfather would have understood, and I can't decide if that was kind.",
      fx = { thread = { id = "mage_horde", beat = "b3_kaelystia" }, learn = { "kelthuzad", "kirin_tor" } },
    },
    {
      id = "b4_hartwell", npc = "hartwell",
      when = { class = "MAGE", minLevel = 20, thread = { id = "mage_horde", beat = "b3_kaelystia" }, ["not"] = { thread = { id = "mage_horde", beat = "b4_hartwell" } } },
      text = "Mogra is my best student since I died. Her grandfather has written to the Dark Lady demanding she be sent home to the shamans, and the Warchief's people ask politely what an orc is doing in a Forsaken quarter. I'll decide once I know what the Horde thinks mages are, and the Undercity always whispers to me.",
      fx = { thread = { id = "mage_horde", beat = "b4_hartwell" }, learn = { "mages" } },
    },
    {
      id = "b5_hartwell_keep", npc = "hartwell",
      when = { class = "MAGE", thread = { id = "mage_horde", beat = "b4_hartwell" },
               opinion = { topic = "mages", stance = { "serve", "craft", "free", "admire", "respect", "trust" } },
               ["not"] = { any = { { thread = { id = "mage_horde", beat = "b5_hartwell_keep" } }, { thread = { id = "mage_horde", beat = "b5_hartwell_send" } } } } },
      text = "I hear you've been telling people that magic is a craft like any other, and I hear it's catching on. Mogra stays, and I've written to her grandfather that she'll be a finer mage than any of Dalaran's living ones, and that he may come down and watch her work if he can stand the smell.",
      fx = { thread = { id = "mage_horde", beat = "b5_hartwell_keep", state = "resolved" } },
    },
    {
      id = "b5_hartwell_send", npc = "hartwell",
      when = { class = "MAGE", thread = { id = "mage_horde", beat = "b4_hartwell" },
               opinion = { topic = "mages", stance = { "leash", "danger", "distrust", "fear", "scorn" } },
               ["not"] = { any = { { thread = { id = "mage_horde", beat = "b5_hartwell_keep" } }, { thread = { id = "mage_horde", beat = "b5_hartwell_send" } } } } },
      text = "I hear you've been saying the arcane is only the warlocks' road in a cleaner coat, and the old orcs nod along whenever it's repeated. I sent Mogra home to Orgrimmar with her books, and she didn't thank me for it, and I didn't expect her to.",
      fx = { thread = { id = "mage_horde", beat = "b5_hartwell_send", state = "soured" } },
    },
  },
}

-- Behind the violet dome (mages of either faction, 30-60). Magus Aldous Crane (original) of the
-- Kirin Tor studied under Kel'Thuzad before the man was expelled, and later put his name to the
-- council's order that sent Arugal to Silverpine. He has written a confession: the original sits
-- on Ansirem's desk at the barrier, and a copy went to Dalar Dawnweaver, the dead archmage who
-- warned them. The ending follows the player's opinion of the Kirin Tor (views on `kirin_tor`):
-- doubt or distrust, and the confession is read aloud; respect, and it stays sealed.
P:Thread {
  id = "mage_dalaran",
  theme = "A mage of the Kirin Tor has written down Dalaran's two great shames, Kel'Thuzad and Arugal, and someone must decide whether the world should read it.",
  title = "Behind the violet dome",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "A magus of the Kirin Tor called Aldous Crane has come out from behind Dalaran's barrier asking after Kel'Thuzad. He studied under the necromancer before anyone called him one, and he won't meet anyone's eye when he says so.",
      third = "{name} heard of Aldous Crane, a magus of the Kirin Tor who studied under Kel'Thuzad and now asks after him with his eyes on the floor." },
    unfolding = { first = "Aldous Crane also put his name to the order that sent Arugal to Silverpine, and Pyrewood howls for it every night. He has written it all down, Kel'Thuzad and Arugal both, and now somebody has to decide whether the confession is read aloud or locked away.",
      third = "{name} learned that Aldous Crane had signed Arugal's orders as well, and that his written confession of Dalaran's shames was waiting for someone to decide its fate." },
    resolved = { first = "I said that the Kirin Tor have answered to nobody for too long, and Crane's confession was read aloud. The world knows now what Dalaran knew, and the Kirin Tor will have to live with being known.",
      third = "{name} said that the Kirin Tor must answer for their shames, and Aldous Crane's confession was read aloud." },
    soured = { first = "I said that the Kirin Tor have kept the world's magic in hand for longer than any kingdom, and that they've earned their secrets. Crane's confession was sealed, and Crane went back behind the dome to live with it.",
      third = "{name} spoke up for the Kirin Tor, and Aldous Crane's confession was sealed away behind the violet dome." },
  },
  npcs = { "dibbs", "malin", "ansirem", "bethor", "hb_voidglare", "dalar" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player said the Kirin Tor must answer for their shames, and Aldous Crane's confession of Kel'Thuzad and Arugal was read aloud.",
    soured = "The player spoke up for the Kirin Tor's secrets, and Aldous Crane's confession was sealed behind the violet dome.",
  },
  pacing = { minConversations = 3, minSeconds = 1500 },
  reflection = {
    first = "Kel'Thuzad walked out of Dalaran with a plague in his pocket, Arugal walked out with wolves at his heel, and both times a quiet man named Crane was in the room. Every mage alive learned their first spell from somebody the Kirin Tor once trusted.",
    third = "{name} had followed Aldous Crane's confession from the Alterac hills to the barrier and the Sepulcher, and found that every mage learned their craft from someone the Kirin Tor once trusted.",
  },
  beats = {
    {
      id = "b1_dibbs", npc = "dibbs",
      when = { class = "MAGE", faction = "Alliance", minLevel = 30, thread = { id = "mage_dalaran", notBeat = "b1_dibbs" } },
      text = "A Kirin Tor magus came down from the dome last spring and bought every book I had on Kel'Thuzad, even the bad ones. Aldous Crane said he'd been the necromancer's student once, and he paid in old Dalaran silver without meeting my eye. Archmage Malin in Stormwind studied with that crowd, if you want to know more.",
      fx = { thread = { id = "mage_dalaran", beat = "b1_dibbs", state = "stirring" }, learn = { "kelthuzad", "dalaran" } },
    },
    {
      id = "b1_bethor", npc = "bethor",
      when = { class = "MAGE", faction = "Horde", minLevel = 30, thread = { id = "mage_dalaran", notBeat = "b1_bethor" } },
      text = "Our Alterac watchers report that a magus called Aldous Crane has been asking after Kel'Thuzad in every village south of the dome. I knew Crane in Dalaran, when he carried Kel'Thuzad's books and thought him the finest mind in the Violet Citadel. Whatever he seeks now, the Magus in Tarren Mill wants it, and so, I suspect, do I.",
      fx = { thread = { id = "mage_dalaran", beat = "b1_bethor", state = "stirring" }, learn = { "kelthuzad", "dalaran" } },
    },
    {
      id = "b2_malin", npc = "malin",
      when = { class = "MAGE", faction = "Alliance", thread = { id = "mage_dalaran", beat = "b1_dibbs" }, ["not"] = { thread = { id = "mage_dalaran", beat = "b2_malin" } } },
      text = "Aldous Crane, yes; he sat two benches from me in Dalaran and copied Kel'Thuzad's lectures. The Council expelled Kel'Thuzad and we agreed never to speak of it, and years later Crane signed the order sending Arugal to Silverpine, and we agreed the same. If Crane has left the dome, I think he means to speak of both.",
      fx = { thread = { id = "mage_dalaran", beat = "b2_malin", state = "unfolding" }, learn = { "shadowfang", "kirin_tor" } },
    },
    {
      id = "b2_voidglare", npc = "hb_voidglare",
      when = { class = "MAGE", faction = "Horde", thread = { id = "mage_dalaran", beat = "b1_bethor" }, ["not"] = { thread = { id = "mage_dalaran", beat = "b2_voidglare" } } },
      text = "I've had Crane watched for a month, and since it costs me nothing, I'll share what my watchers learned. He signed the order that sent Arugal into Silverpine, so Pyrewood's worgen are his as much as anyone's, and he's written it all down. A copy went to Dalar Dawnweaver at the Sepulcher, and I'd like to read it first.",
      fx = { thread = { id = "mage_dalaran", beat = "b2_voidglare", state = "unfolding" }, learn = { "shadowfang", "kirin_tor" } },
    },
    {
      id = "b3_ansirem", npc = "ansirem",
      when = { class = "MAGE", faction = "Alliance", minLevel = 35, thread = { id = "mage_dalaran", beat = "b2_malin" }, ["not"] = { thread = { id = "mage_dalaran", beat = "b3_ansirem" } } },
      text = "Crane's confession is on my desk, Kel'Thuzad and Arugal both in his own hand, things the Council long ago decided the world need not hear. Crane wants it read aloud in Southshore and Stormwind, and the Council wants it burned. I would know what mages beyond this barrier think of the Kirin Tor before I choose.",
      fx = { thread = { id = "mage_dalaran", beat = "b3_ansirem" }, learn = { "kirin_tor" } },
    },
    {
      id = "b3_dalar", npc = "dalar",
      when = { class = "MAGE", faction = "Horde", minLevel = 35, thread = { id = "mage_dalaran", beat = "b2_voidglare" }, ["not"] = { thread = { id = "mage_dalaran", beat = "b3_dalar" } } },
      text = "Crane sent his confession to me, because I warned them and died for it, and perhaps he thought the dead forgive cheaply. Kel'Thuzad and Arugal are both in it, in his tidy hand. I could have it read across the Undercity by morning or burn it, and I want to know what you think of the Kirin Tor first.",
      fx = { thread = { id = "mage_dalaran", beat = "b3_dalar" }, learn = { "kirin_tor" } },
    },
    {
      id = "b4_ansirem_read", npc = "ansirem",
      when = { class = "MAGE", thread = { id = "mage_dalaran", beat = "b3_ansirem" },
               opinion = { topic = "kirin_tor", stance = { "distrust", "doubt", "blame" } },
               ["not"] = { any = { { thread = { id = "mage_dalaran", beat = "b4_ansirem_read" } }, { thread = { id = "mage_dalaran", beat = "b4_ansirem_seal" } } } } },
      text = "You said the Kirin Tor answer to nobody, and I could find no argument against it that I wasn't ashamed of. Crane's confession will be read in Southshore's square and on the steps of the Wizard's Sanctum, and the Council may expel me for it if they wish, since we have some practice at that.",
      fx = { thread = { id = "mage_dalaran", beat = "b4_ansirem_read", state = "resolved" } },
    },
    {
      id = "b4_ansirem_seal", npc = "ansirem",
      when = { class = "MAGE", thread = { id = "mage_dalaran", beat = "b3_ansirem" },
               opinion = { topic = "kirin_tor", stance = { "respect", "trust" } },
               ["not"] = { any = { { thread = { id = "mage_dalaran", beat = "b4_ansirem_read" } }, { thread = { id = "mage_dalaran", beat = "b4_ansirem_seal" } } } } },
      text = "You said the Kirin Tor have kept magic in hand for longer than any kingdom has stood, and the Council said the same thing in a great many more words. Crane's confession is sealed in the vaults, and Crane has gone back to his rooms behind the barrier, and I hope you are right about us.",
      fx = { thread = { id = "mage_dalaran", beat = "b4_ansirem_seal", state = "soured" } },
    },
    {
      id = "b4_dalar_read", npc = "dalar",
      when = { class = "MAGE", thread = { id = "mage_dalaran", beat = "b3_dalar" },
               opinion = { topic = "kirin_tor", stance = { "distrust", "doubt", "blame" } },
               ["not"] = { any = { { thread = { id = "mage_dalaran", beat = "b4_dalar_read" } }, { thread = { id = "mage_dalaran", beat = "b4_dalar_seal" } } } } },
      text = "You said the Kirin Tor have hidden behind their secrets long enough, so I had Crane's confession read aloud in the Magic Quarter last night. Half the dead who listened were Dalaran's own, and not one of them was surprised, which I think would have hurt Crane more than anything.",
      fx = { thread = { id = "mage_dalaran", beat = "b4_dalar_read", state = "resolved" } },
    },
    {
      id = "b4_dalar_seal", npc = "dalar",
      when = { class = "MAGE", thread = { id = "mage_dalaran", beat = "b3_dalar" },
               opinion = { topic = "kirin_tor", stance = { "respect", "trust" } },
               ["not"] = { any = { { thread = { id = "mage_dalaran", beat = "b4_dalar_read" } }, { thread = { id = "mage_dalaran", beat = "b4_dalar_seal" } } } } },
      text = "You spoke up for the Kirin Tor, which is a strange thing to hear in the Sepulcher, and I burned Crane's confession because of it. I warned them once and they didn't listen, and it seems I'm still loyal enough to keep their secrets for them, which is the most Dalaran thing about me.",
      fx = { thread = { id = "mage_dalaran", beat = "b4_dalar_seal", state = "soured" } },
    },
  },
}

-- The druid who stayed a bear (Alliance druids, 10-45). Aelthas Leafwhisper (original), Mardant's
-- best student in Shadowglen, went into the bear to drive the maddened Gnarlpine back from
-- Dolanaar and never quite came out of it. Mathrengyl sent him to Moonglade; the Great Bear
-- Spirit let him go; Tharnariun has seen him among the sick bears of Darkshore, and the dryad
-- Shael'dryn says he guards Ashenvale's groves from the loggers. Dendrite Starblaze must decide
-- whether the Circle fetches him home or lets him find his own way back; the ending follows
-- the player's opinion of druids (views on `druids` in views_5.lua).
P:Thread {
  id = "dru_alliance",
  theme = "A young night elf druid went into the bear to save his village and has not come back out, and the Circle must decide whether to fetch him home or let the wild keep him.",
  title = "The one who stayed a bear",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Mardant's best student, Aelthas Leafwhisper, took the bear's shape to drive the maddened Gnarlpine away from Dolanaar. That was two winters ago, and nobody has seen him on two feet since.",
      third = "{name} heard of Aelthas Leafwhisper, a young druid of Shadowglen who took the bear's shape to save Dolanaar and never took it off." },
    unfolding = { first = "Aelthas has gone from Teldrassil to Moonglade to Darkshore's sick bears and on into Ashenvale, and he guards the groves there now, as a bear, from anyone with an axe. Dendrite Starblaze in Moonglade has to decide whether the Circle should go and bring him home.",
      third = "{name} followed Aelthas Leafwhisper's tracks from Teldrassil to Ashenvale, where he guards the groves as a bear, and learned that Dendrite Starblaze must decide whether to fetch him home." },
    resolved = { first = "Dendrite heard what I'd said of druids, that we keep a balance and can be trusted to find it, and she sent Aelthas an invitation instead of a hunting party. He walked into Moonglade on two feet a week later, and he hasn't said much, but he's sleeping indoors.",
      third = "{name} spoke up for the druids' balance, and Dendrite Starblaze let Aelthas Leafwhisper find his own way back to Moonglade, which he did, on two feet." },
    soured = { first = "Dendrite heard me say that druids who live as beasts forget they were ever people, and she sent the Circle to fetch Aelthas home in roots. He's back in Darnassus, and he speaks when spoken to, and he looks out of the window at the trees all day.",
      third = "{name} said that shapeshifters forget themselves, and Dendrite Starblaze had Aelthas Leafwhisper brought home from Ashenvale by force." },
  },
  npcs = { "mardant", "kal", "mathrengyl", "great_bear", "tharnariun", "shaeldryn", "dendrite" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player spoke for the druids' balance, and Dendrite let Aelthas Leafwhisper find his own way out of the bear and home to Moonglade.",
    soured = "The player said shapeshifters forget themselves, and Dendrite had Aelthas Leafwhisper brought home from Ashenvale by force.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "Mardant taught him the bear, the Spirit let him keep it, and the sick bears of Darkshore and the groves of Ashenvale gave him reasons to stay in it. Every druid I've met keeps one ear on the way back.",
    third = "{name} had followed Aelthas Leafwhisper's tracks from Shadowglen to Ashenvale, and found that every druid keeps one ear on the way back to their own shape.",
  },
  beats = {
    {
      id = "b1_mardant", npc = "mardant",
      when = { class = "DRUID", faction = "Alliance", minLevel = 8, thread = { id = "dru_alliance", notBeat = "b1_mardant" }, ["not"] = { thread = { id = "dru_alliance", beat = "b1_kal" } } },
      text = "Every young druid who comes through Aldrassil reminds me of Aelthas Leafwhisper, and you more than most. When the Gnarlpine went mad and fell on Dolanaar, he took the bear's shape before he'd ever seen Moonglade and drove them back alone. He never came back out of it, and when the Enclave sent for him, he went on four feet.",
      fx = { thread = { id = "dru_alliance", beat = "b1_mardant", state = "stirring" }, learn = { "furbolgs" } },
    },
    {
      id = "b1_kal", npc = "kal",
      when = { class = "DRUID", faction = "Alliance", minLevel = 8, thread = { id = "dru_alliance", notBeat = "b1_kal" }, ["not"] = { thread = { id = "dru_alliance", beat = "b1_mardant" } } },
      text = "Do you see the claw marks on the moonwell's rim? A young druid called Aelthas made those, the night the Gnarlpine came down the hill at Dolanaar. He held them back as a bear until dawn, and when the sun came up he was still a bear, and he has been one ever since.",
      fx = { thread = { id = "dru_alliance", beat = "b1_kal", state = "stirring" }, learn = { "furbolgs" } },
    },
    {
      id = "b2_mathrengyl", npc = "mathrengyl",
      when = { class = "DRUID", any = { { thread = { id = "dru_alliance", beat = "b1_mardant" } }, { thread = { id = "dru_alliance", beat = "b1_kal" } } },
               ["not"] = { thread = { id = "dru_alliance", beat = "b2_mathrengyl" } } },
      text = "Aelthas, yes. He came into the Enclave on four feet and lay down before my bench, and I spoke to him for an hour, and he listened without being able to answer. I sent him to Moonglade, to the Great Bear Spirit, because if anything can talk a druid back out of the bear, it will be the bear itself.",
      fx = { thread = { id = "dru_alliance", beat = "b2_mathrengyl", state = "unfolding" }, learn = { "cenarion_circle" } },
    },
    {
      id = "b3_great_bear", npc = "great_bear",
      when = { class = "DRUID", minLevel = 10, thread = { id = "dru_alliance", beat = "b2_mathrengyl" }, ["not"] = { thread = { id = "dru_alliance", beat = "b3_great_bear" } } },
      text = "The young one from the tree came to me, and he was more bear than most bears I have known. I did not drive him from the shape, because a shape is not a prison unless the one inside calls it one. He went south across the water to where the bears are sick, and I let him go.",
      fx = { thread = { id = "dru_alliance", beat = "b3_great_bear" } },
    },
    {
      id = "b4_tharnariun", npc = "tharnariun",
      when = { class = "DRUID", minLevel = 14, thread = { id = "dru_alliance", beat = "b3_great_bear" }, ["not"] = { thread = { id = "dru_alliance", beat = "b4_tharnariun" } } },
      text = "A bear comes to my pens at night and lies beside the sick ones, letting me work, which no wild bear of Darkshore has done in a year. It wears a druid's mark under the fur, and when I called it Aelthas, it looked at me a long moment and went back into the trees. It went south, towards Ashenvale.",
      fx = { thread = { id = "dru_alliance", beat = "b4_tharnariun" } },
    },
    {
      id = "b5_shaeldryn", npc = "shaeldryn",
      when = { class = "DRUID", minLevel = 20, thread = { id = "dru_alliance", beat = "b4_tharnariun" }, ["not"] = { thread = { id = "dru_alliance", beat = "b5_shaeldryn" } } },
      text = "The bear with the druid's eyes? He guards the groves east of here, and orcs who bring axes near them come home without them. I am a daughter of Cenarius and I am glad of him, but he no longer answers to his name. Dendrite Starblaze in Moonglade asks after him, and I think she means to decide something.",
      fx = { thread = { id = "dru_alliance", beat = "b5_shaeldryn" }, learn = { "ashenvale", "warsong" } },
    },
    {
      id = "b6_dendrite", npc = "dendrite",
      when = { class = "DRUID", minLevel = 20, thread = { id = "dru_alliance", beat = "b5_shaeldryn" }, ["not"] = { thread = { id = "dru_alliance", beat = "b6_dendrite" } } },
      text = "Aelthas has been in the bear two winters, and Shael'dryn says he guards Ashenvale better than a company of Sentinels. Half the Circle wants him fetched home before he forgets his name, and half says balance found in a bear's shape is balance all the same. Moonglade is small, so whatever you think of druids, I'll hear it.",
      fx = { thread = { id = "dru_alliance", beat = "b6_dendrite" }, learn = { "druids" } },
    },
    {
      id = "b7_dendrite_trust", npc = "dendrite",
      when = { class = "DRUID", thread = { id = "dru_alliance", beat = "b6_dendrite" },
               opinion = { topic = "druids", stance = { "balance", "kin", "admire", "guard" } },
               ["not"] = { any = { { thread = { id = "dru_alliance", beat = "b7_dendrite_trust" } }, { thread = { id = "dru_alliance", beat = "b7_dendrite_fetch" } } } } },
      text = "I heard what you've been saying of druids, that we keep the balance and can be trusted to find it, and I sent Aelthas an invitation instead of a hunting party. He walked into the glade on two feet a week later, thin and quiet, and asked for a blanket. He hasn't said much since, but he's sleeping indoors.",
      fx = { thread = { id = "dru_alliance", beat = "b7_dendrite_trust", state = "resolved" }, standing = { nighthaven = 3 } },
    },
    {
      id = "b7_dendrite_fetch", npc = "dendrite",
      when = { class = "DRUID", thread = { id = "dru_alliance", beat = "b6_dendrite" },
               opinion = { topic = "druids", stance = { "savage", "wary" } },
               ["not"] = { any = { { thread = { id = "dru_alliance", beat = "b7_dendrite_trust" } }, { thread = { id = "dru_alliance", beat = "b7_dendrite_fetch" } } } } },
      text = "I hear you've been saying that a druid who lives as a beast forgets he was ever a person, and the elders who wanted him fetched took heart. They brought Aelthas home in roots, back in his own shape. He answers when spoken to, and the rest of the time he looks out of the window at the trees.",
      fx = { thread = { id = "dru_alliance", beat = "b7_dendrite_fetch", state = "soured" } },
    },
  },
}

-- The druid and the Fang (Horde druids, 10-45). Mahka Dawnhoof (original), a young tauren
-- druid from Camp Narache, heard in Moonglade what became of Naralex's disciples, the Druids of
-- the Fang, and went to the Barrens to see for herself. The Crossroads' orcs have distrusted
-- druids ever since the Fang, and Mahka now plants saplings in the Venture Company's stump
-- fields at Sun Rock. Hamuul must decide whether to send her to sit at the Circle's fire in
-- Moonglade or keep her on the Elder Rise where the Horde can see her; the ending follows the
-- player's opinion of druids (views on `druids`).
P:Thread {
  id = "dru_horde",
  theme = "A young tauren druid went looking for what turned the Druids of the Fang, and the Horde, who remember the Fang, must decide whether to trust her.",
  title = "The druid and the Fang",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "A young druid of Camp Narache called Mahka Dawnhoof came back from Moonglade with a question nobody would answer: how Naralex's disciples, druids like her, became the Druids of the Fang. She went down to the Barrens to find out.",
      third = "{name} heard of Mahka Dawnhoof, a young tauren druid who went to the Barrens to learn how the Druids of the Fang went wrong." },
    unfolding = { first = "Mahka sat by the poisoned oases with Naralex's last disciple, and the orcs at the Crossroads watched her as if she might grow fangs herself. Now she plants saplings in the goblins' stump fields in Stonetalon, and Hamuul Runetotem has to decide where she belongs.",
      third = "{name} followed Mahka Dawnhoof from the Barrens' oases to Stonetalon's stump fields, and learned that Hamuul Runetotem must decide where she belongs." },
    resolved = { first = "Hamuul heard what I'd been saying of druids, that we are kin to the land and keep its balance, and he sent Mahka to Moonglade to sit at the Circle's fire for our people. The orcs at the Crossroads grumbled, and then they asked her to look at their well.",
      third = "{name} spoke for druids as keepers of the balance, and Hamuul Runetotem sent Mahka Dawnhoof to sit at the Circle's fire in Moonglade." },
    soured = { first = "Hamuul heard me say that druids who walk as beasts are only a step from the Fang, and he called Mahka home to the Elder Rise, where the Horde can see her. She plants nothing now, and she studies, and she does not argue.",
      third = "{name} said druids walk too close to the Fang's road, and Hamuul Runetotem called Mahka Dawnhoof home to the Elder Rise." },
  },
  npcs = { "gart", "gennia", "turak", "great_bear", "tonga", "tsunaman", "hamuul" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player spoke for druids as keepers of the balance, and Hamuul sent Mahka Dawnhoof to sit at the Circle's fire in Moonglade.",
    soured = "The player said druids walk too close to the Fang's road, and Hamuul called Mahka Dawnhoof home to the Elder Rise.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "Gart taught her the bear, Turak sent her north, Tonga let her taste the poisoned water, and the stumps at Sun Rock showed her what a druid is for. The Horde will be a long time forgiving the Fang, and every druid of the plains carries a little of that debt.",
    third = "{name} had followed Mahka Dawnhoof from Camp Narache to Sun Rock, and found that every Horde druid carries a little of the Fang's debt.",
  },
  beats = {
    {
      id = "b1_gart", npc = "gart",
      when = { class = "DRUID", faction = "Horde", minLevel = 6, thread = { id = "dru_horde", notBeat = "b1_gart" }, ["not"] = { thread = { id = "dru_horde", beat = "b1_gennia" } } },
      text = "The last young druid I sent down from Narache was Mahka Dawnhoof, and she listened to the plains better than I do. She went to Thunder Bluff and then Moonglade, and came back with a question I could not answer, about the druids who went into the caves of the Barrens and came out as something else.",
      fx = { thread = { id = "dru_horde", beat = "b1_gart", state = "stirring" }, learn = { "wailing_caverns" } },
    },
    {
      id = "b1_gennia", npc = "gennia",
      when = { class = "DRUID", faction = "Horde", minLevel = 6, thread = { id = "dru_horde", notBeat = "b1_gennia" }, ["not"] = { thread = { id = "dru_horde", beat = "b1_gart" } } },
      text = "Mahka Dawnhoof trained here, under this very roof, and she was the quickest to the bear's shape I have seen in many seasons. When she came home from Moonglade she asked me how a druid becomes one of the Fang, and I told her I did not know, and she went to the Barrens to find someone who did.",
      fx = { thread = { id = "dru_horde", beat = "b1_gennia", state = "stirring" }, learn = { "wailing_caverns" } },
    },
    {
      id = "b2_turak", npc = "turak",
      when = { class = "DRUID", any = { { thread = { id = "dru_horde", beat = "b1_gart" } }, { thread = { id = "dru_horde", beat = "b1_gennia" } } },
               ["not"] = { thread = { id = "dru_horde", beat = "b2_turak" } } },
      text = "I sent Mahka to Moonglade, as I sent you, and there she heard of Naralex, who went into the earth to heal the Barrens and came out mad. She asked if that could happen to her, and I said no, though I am not sure. The Earth Mother gives us these shapes, little one, but not always ourselves in them.",
      fx = { thread = { id = "dru_horde", beat = "b2_turak", state = "unfolding" }, learn = { "cenarion_circle" } },
    },
    {
      id = "b3_great_bear", npc = "great_bear",
      when = { class = "DRUID", faction = "Horde", minLevel = 10, thread = { id = "dru_horde", beat = "b2_turak" }, ["not"] = { thread = { id = "dru_horde", beat = "b3_great_bear" } } },
      text = "The young one of the plains asked me whether the bear could go mad, as the ones of the Fang went mad. I told her the bear is never mad; the dreamer loses the way when the dream itself is sick. She thanked me and went south to see the sick dream herself, which was brave or foolish or both.",
      fx = { thread = { id = "dru_horde", beat = "b3_great_bear" }, learn = { "emerald_dream" } },
    },
    {
      id = "b4_tonga", npc = "tonga",
      when = { class = "DRUID", minLevel = 14, thread = { id = "dru_horde", beat = "b3_great_bear" }, ["not"] = { thread = { id = "dru_horde", beat = "b4_tonga" } } },
      text = "Mahka sat by the poisoned oases with Naralex's last disciple for a month, tasting the water and noting what the plants did. The grunts at the Crossroads watched her as though she might grow fangs, because they remember what came out of those caves. She left for Stonetalon, saying a druid should mend something before studying what's broken.",
      fx = { thread = { id = "dru_horde", beat = "b4_tonga" } },
    },
    {
      id = "b5_tsunaman", npc = "tsunaman",
      when = { class = "DRUID", minLevel = 20, thread = { id = "dru_horde", beat = "b4_tonga" }, ["not"] = { thread = { id = "dru_horde", beat = "b5_tsunaman" } } },
      text = "The young druid from Mulgore? She plants saplings in the stumps the goblins leave, one at a time, and sings to them, and some have taken. A few passing orcs call it witchery and spit when she isn't looking. Hamuul has written asking after her, and I think the Arch Druid means to decide what's to be done with her.",
      fx = { thread = { id = "dru_horde", beat = "b5_tsunaman" }, learn = { "venture_company" } },
    },
    {
      id = "b6_hamuul", npc = "hamuul",
      when = { class = "DRUID", minLevel = 20, thread = { id = "dru_horde", beat = "b5_tsunaman" }, ["not"] = { thread = { id = "dru_horde", beat = "b6_hamuul" } } },
      text = "Mahka has done more good at Sun Rock in a season than some elders in a lifetime, and the Keeper asks me to send her to the Circle's fire in Moonglade. But the Warchief's people remember the Fang, and would keep a beast-walking tauren where the Horde can see her. Whatever you think of druids, the wind will tell me.",
      fx = { thread = { id = "dru_horde", beat = "b6_hamuul" }, learn = { "druids" } },
    },
    {
      id = "b7_hamuul_send", npc = "hamuul",
      when = { class = "DRUID", thread = { id = "dru_horde", beat = "b6_hamuul" },
               opinion = { topic = "druids", stance = { "balance", "kin", "admire", "guard" } },
               ["not"] = { any = { { thread = { id = "dru_horde", beat = "b7_hamuul_send" } }, { thread = { id = "dru_horde", beat = "b7_hamuul_keep" } } } } },
      text = "The wind brought me what you've been saying of druids, that we are kin to the land and keepers of its balance, and I agreed with every word. Mahka sits at the Circle's fire in Moonglade now, for our people, and the orcs at the Crossroads grumbled for a week and then asked her to look at their well.",
      fx = { thread = { id = "dru_horde", beat = "b7_hamuul_send", state = "resolved" }, standing = { thunder_bluff = 3 } },
    },
    {
      id = "b7_hamuul_keep", npc = "hamuul",
      when = { class = "DRUID", thread = { id = "dru_horde", beat = "b6_hamuul" },
               opinion = { topic = "druids", stance = { "savage", "wary" } },
               ["not"] = { any = { { thread = { id = "dru_horde", beat = "b7_hamuul_send" } }, { thread = { id = "dru_horde", beat = "b7_hamuul_keep" } } } } },
      text = "I hear you say that druids who walk as beasts are a step from the Fang, and the Warchief's people repeat it to me as wisdom. So I have called Mahka home to the Elder Rise, where she studies without arguing. The saplings at Sun Rock are dying without her, and I try not to think of it.",
      fx = { thread = { id = "dru_horde", beat = "b7_hamuul_keep", state = "soured" } },
    },
  },
}

-- Two at the same fire (druids of either faction, 30-60). Ilaren Shadebough (original, kaldorei)
-- and Tavi Plainsong (original, tauren) cleansed Felwood's soil together at the Emerald
-- Sanctuary, then went to Cenarion Hold when the Circle called for druids in Silithus. Now
-- Darnassus wants Ilaren home for the Ashenvale war and Thunder Bluff wants Tavi beside the
-- Horde, and Keeper Remulos must decide whether the Circle claims them both or lets the banners
-- take them back. The ending follows the player's opinion of the Cenarion Circle (views on
-- `cenarion_circle` in views_2.lua and views_5.lua).
P:Thread {
  id = "dru_circle",
  theme = "A kaldorei druid and a tauren druid have mended the Circle's worst places side by side, and their peoples want them back on opposite sides of a war.",
  title = "Two at the same fire",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Two druids of the Circle, Ilaren Shadebough of the kaldorei and Tavi Plainsong of the tauren, have worked side by side for three years, wherever the land is sickest. Moonglade speaks of them the way it speaks of weather it approves of.",
      third = "{name} heard of Ilaren Shadebough and Tavi Plainsong, a kaldorei and a tauren druid who mend the land's worst places side by side." },
    unfolding = { first = "Ilaren and Tavi cleansed Felwood's soil at the Emerald Sanctuary and then went to Cenarion Hold in Silithus, where the Sentinels and the Horde's soldiers barely speak. Now Darnassus wants Ilaren home for the Ashenvale war and Thunder Bluff wants Tavi beside the Horde, and Keeper Remulos has to choose.",
      third = "{name} followed Ilaren Shadebough and Tavi Plainsong from Felwood to Silithus, and learned that Keeper Remulos must decide whether the Circle or the banners keep them." },
    resolved = { first = "Remulos heard what I'd been saying of the Circle, that it stands above banners, and he wrote to Darnassus and Thunder Bluff both that Ilaren and Tavi belong to the wild. They are back at Cenarion Hold, arguing about soil, and neither banner has come to fetch them.",
      third = "{name} spoke up for the Cenarion Circle, and Keeper Remulos kept Ilaren Shadebough and Tavi Plainsong together at Cenarion Hold." },
    soured = { first = "Remulos heard me say the Circle cares more for weeds than for people, and he said that if the world's druids think so, he cannot hold two of them against their peoples. Ilaren went home to Ashenvale and Tavi to the Barrens, and they write to each other, I'm told, across the front.",
      third = "{name} said the Circle cares more for groves than for people, and Keeper Remulos let Ilaren Shadebough and Tavi Plainsong go back to their banners." },
  },
  npcs = { "rabine", "loganaar", "arathandris", "greta", "bor_wildmane", "proudhorn", "remulos" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player spoke for the Circle above banners, and Remulos kept Ilaren Shadebough and Tavi Plainsong together at Cenarion Hold.",
    soured = "The player said the Circle cares more for groves than people, and Remulos let Ilaren and Tavi go back to their banners.",
  },
  pacing = { minConversations = 3, minSeconds = 1500 },
  reflection = {
    first = "Felwood's soil, Silithus's sand and the Keeper's glade: wherever the land was sickest, an elf and a tauren were kneeling in it together. The banners never once asked what the land wanted.",
    third = "{name} had followed two druids of the Circle from Felwood to Silithus, and found that the banners never asked what the land wanted.",
  },
  beats = {
    {
      id = "b1_rabine", npc = "rabine",
      when = { class = "DRUID", minLevel = 30, thread = { id = "dru_circle", notBeat = "b1_rabine" }, ["not"] = { thread = { id = "dru_circle", beat = "b1_loganaar" } } },
      text = "If you mean to serve the Circle, you could do worse than to follow Ilaren Shadebough and Tavi Plainsong, though you'll struggle to keep up. A kaldorei and a tauren, they've worked side by side for three years wherever the land is sickest. Last I heard they were at the Emerald Sanctuary in Felwood, elbow-deep in poisoned soil.",
      fx = { thread = { id = "dru_circle", beat = "b1_rabine", state = "stirring" }, learn = { "cenarion_circle" } },
    },
    {
      id = "b1_loganaar", npc = "loganaar",
      when = { class = "DRUID", minLevel = 30, thread = { id = "dru_circle", notBeat = "b1_loganaar" }, ["not"] = { thread = { id = "dru_circle", beat = "b1_rabine" } } },
      text = "You've heard of Ilaren and Tavi? An elf and a tauren who came through this glade together three years ago and haven't parted since, which some elders find touching and some suspicious. They went to Felwood, to the Emerald Sanctuary, and Moonglade has had good news from that forest for the first time in a long while.",
      fx = { thread = { id = "dru_circle", beat = "b1_loganaar", state = "stirring" }, learn = { "cenarion_circle" } },
    },
    {
      id = "b2_arathandris", npc = "arathandris",
      when = { class = "DRUID", minLevel = 45, any = { { thread = { id = "dru_circle", beat = "b1_rabine" } }, { thread = { id = "dru_circle", beat = "b1_loganaar" } } },
               ["not"] = { any = { { thread = { id = "dru_circle", beat = "b2_arathandris" } }, { thread = { id = "dru_circle", beat = "b2_greta" } } } } },
      text = "Ilaren and Tavi cleansed the ground behind the sanctuary, a patch no bigger than a cottage, and it took them a whole season. The tauren sang to it and the elf argued with it, and something green came up. Then the Circle sent word that the Hold in Silithus needed every druid, and they went that week.",
      fx = { thread = { id = "dru_circle", beat = "b2_arathandris", state = "unfolding" }, learn = { "fel_moss" } },
    },
    {
      id = "b2_greta", npc = "greta",
      when = { class = "DRUID", minLevel = 45, any = { { thread = { id = "dru_circle", beat = "b1_rabine" } }, { thread = { id = "dru_circle", beat = "b1_loganaar" } } },
               ["not"] = { any = { { thread = { id = "dru_circle", beat = "b2_arathandris" } }, { thread = { id = "dru_circle", beat = "b2_greta" } } } } },
      text = "Tavi Plainsong was here, yes, with her kaldorei friend, and they planted the first living seedlings this sanctuary has seen. The Sentinels at Talonbranch frowned at her and the orcs at Bloodvenom frowned at him, and the two of them frowned at nobody, because they were busy. They've gone to Silithus now, where I hear the frowning is worse.",
      fx = { thread = { id = "dru_circle", beat = "b2_greta", state = "unfolding" }, learn = { "fel_moss" } },
    },
    {
      id = "b3_bor", npc = "bor_wildmane",
      when = { class = "DRUID", minLevel = 52, any = { { thread = { id = "dru_circle", beat = "b2_arathandris" } }, { thread = { id = "dru_circle", beat = "b2_greta" } } },
               ["not"] = { any = { { thread = { id = "dru_circle", beat = "b3_bor" } }, { thread = { id = "dru_circle", beat = "b3_proudhorn" } } } } },
      text = "Ilaren and Tavi are my best two druids at the Hold, and they are about to be taken from me. Darnassus has called Ilaren home to fight in Ashenvale, and Thunder Bluff asks why Tavi keeps company with night elves while the Horde bleeds. Only the Keeper can say whether the Circle keeps them, and he has not said.",
      fx = { thread = { id = "dru_circle", beat = "b3_bor" }, learn = { "silithid" } },
    },
    {
      id = "b3_proudhorn", npc = "proudhorn",
      when = { class = "DRUID", minLevel = 52, any = { { thread = { id = "dru_circle", beat = "b2_arathandris" } }, { thread = { id = "dru_circle", beat = "b2_greta" } } },
               ["not"] = { any = { { thread = { id = "dru_circle", beat = "b3_bor" } }, { thread = { id = "dru_circle", beat = "b3_proudhorn" } } } } },
      text = "The wind brings me two letters for each I send, all about Tavi Plainsong and her elf. The kaldorei want theirs back for the war in Ashenvale, and the Horde wants ours for the same war from the other side. I have sent both letters to the Keeper, because I will not be the one who parts them.",
      fx = { thread = { id = "dru_circle", beat = "b3_proudhorn" }, learn = { "silithid" } },
    },
    {
      id = "b4_remulos", npc = "remulos",
      when = { class = "DRUID", minLevel = 55, any = { { thread = { id = "dru_circle", beat = "b3_bor" } }, { thread = { id = "dru_circle", beat = "b3_proudhorn" } } },
               ["not"] = { thread = { id = "dru_circle", beat = "b4_remulos" } } },
      text = "Darnassus and Thunder Bluff both write asking for the same two druids back. The Circle has always stood above banners, or said it did, but I cannot hold a druid against their people's will if the world's druids no longer think it worth it. Tell the glade what you think of us, druid; the wind will bring it to me.",
      fx = { thread = { id = "dru_circle", beat = "b4_remulos" }, learn = { "emerald_dream" } },
    },
    {
      id = "b5_remulos_keep", npc = "remulos",
      when = { class = "DRUID", thread = { id = "dru_circle", beat = "b4_remulos" },
               opinion = { topic = "cenarion_circle", stance = { "admire", "trust" } },
               ["not"] = { any = { { thread = { id = "dru_circle", beat = "b5_remulos_keep" } }, { thread = { id = "dru_circle", beat = "b5_remulos_release" } } } } },
      text = "The wind carried your words to me, that the Circle is worth more than a banner, so I wrote to Darnassus and Thunder Bluff that Ilaren and Tavi belong to the wild. Neither answered, which I take for consent. The two of them are back at the Hold, arguing about soil, and I have rarely been gladder of an argument.",
      fx = { thread = { id = "dru_circle", beat = "b5_remulos_keep", state = "resolved" }, standing = { nighthaven = 3 } },
    },
    {
      id = "b5_remulos_release", npc = "remulos",
      when = { class = "DRUID", thread = { id = "dru_circle", beat = "b4_remulos" },
               opinion = { topic = "cenarion_circle", stance = { "distrust" } },
               ["not"] = { any = { { thread = { id = "dru_circle", beat = "b5_remulos_keep" } }, { thread = { id = "dru_circle", beat = "b5_remulos_release" } } } } },
      text = "You think the Circle cares more for groves than people, and if the world's own druids say so, I cannot hold two of them against their peoples. Ilaren has gone home to Ashenvale and Tavi to the Barrens. They write to each other across the front, I am told, and I have asked the wind to carry the letters gently.",
      fx = { thread = { id = "dru_circle", beat = "b5_remulos_release", state = "soured" } },
    },
  },
}
