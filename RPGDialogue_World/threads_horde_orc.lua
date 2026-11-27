-- Throughlines for the orc and troll Horde: Durotar, Orgrimmar and the Barrens.
-- Same structure as threads.lua. Beats connect existing Year 1 storylines and invent no
-- major events; small authored details are noted beside the beats that carry them.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

-- The Burning Blade, followed from the Valley of Trials to Skull Rock to the Cleft of Shadow.
-- Canon: the Blade's caves in the Valley, Skull Rock, the Searing Blade under Orgrimmar and
-- Thrall's Hidden Enemies. Neeru's secret never slips from his own mouth (see orgrimmar.lua).
-- Authored: the cultists' new daggers, the peon's uneaten cactus apples, the orders written
-- in a careful hand.
P:Thread {
  id = "burning_blade",
  theme = "The Burning Blade in Durotar's caves are fed and ordered from somewhere better than a cave.",
  title = "The Burning Blade's long reach",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Burning Blade's cultists in the Valley of Trials have new daggers and full bellies, and nobody in the valley sold them either. Zureetha thinks someone beyond the valley keeps them supplied.",
      third = "{name} heard that the Burning Blade in the Valley of Trials were armed and fed by someone beyond the valley." },
    unfolding = { first = "The cultists at Skull Rock carry orders written in a careful hand, and Orgnil Soulscar thinks the hand belongs to someone sleeping warm inside Orgrimmar. Down in the Cleft of Shadow, Neeru Fireblade smiled and said he was watching too.",
      third = "{name} followed the Burning Blade's orders from Skull Rock toward Orgrimmar, where Neeru Fireblade said he was watching too." },
    resolved = { first = "Thrall has heard the whole road, from the valley caves to the door of the Cleft. The rot isn't gone, and he says it never is entirely, but it's weaker since Ragefire Chasm, and it knows the Warchief is watching.",
      third = "{name} brought the Burning Blade's long road to Thrall, who said the rot was weaker now, and knew he was watching." },
  },
  npcs = { "zureetha", "galgar", "orgnil", "neeru", "thrall" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The player followed the Burning Blade from the Valley of Trials to the Cleft of Shadow, and Thrall, having heard it all, keeps watching.",
  },
  pacing = { minConversations = 2, minSeconds = 600 },
  reflection = {
    first = "Everyone from the Valley of Trials to Orgrimmar says the Burning Blade hides in caves, and then they all glance toward the city.",
    third = "{name} noticed that everyone who spoke of the Burning Blade looked toward Orgrimmar while they did it.",
  },
  beats = {
    {
      id = "b1_zureetha", npc = "zureetha",
      when = { thread = { id = "burning_blade", notBeat = "b1_zureetha" } },
      text = "The Burning Blade cultists in the valley's caves carry new daggers, and nobody in this valley forged them or sold them. Somebody beyond these hills keeps the Blade armed, and I mean to learn who.",
      fx = { thread = { id = "burning_blade", beat = "b1_zureetha", state = "stirring" }, learn = { "burning_blade" } },
    },
    {
      id = "b1_zureetha_orc", npc = "zureetha",
      when = { race = "Orc", thread = { id = "burning_blade", notBeat = "b1_zureetha" } },
      text = "The Burning Blade wear our faces, {class}, and they carry the demon's mark we spent years in the camps washing out of our blood. Their new daggers weren't forged in this valley, so somebody beyond these hills is arming them, and I mean to learn who.",
      fx = { thread = { id = "burning_blade", beat = "b1_zureetha", state = "stirring" }, learn = { "burning_blade" } },
    },
    {
      id = "b2_galgar", npc = "galgar",
      when = { thread = { id = "burning_blade", beat = "b1_zureetha" }, ["not"] = { thread = { id = "burning_blade", beat = "b2_galgar" } } },
      text = "Zureetha's been asking about the peon the Blade killed. He was carrying my cactus apples, and I found the sack in the scrub the next morning, not one apple eaten. Folk who kill over food and then don't eat it aren't hungry; they just wanted the valley frightened.",
      fx = { thread = { id = "burning_blade", beat = "b2_galgar", state = "stirring" } },
    },
    {
      id = "b3_orgnil", npc = "orgnil",
      when = { minLevel = 7, thread = { id = "burning_blade", notBeat = "b3_orgnil" } },
      text = "The cultists I drag out of Skull Rock carry orders written in a careful hand, and no cave-dweller writes like that. Somebody who reads is feeding the Blade, and I'd wager they sleep somewhere warm inside Orgrimmar's walls.",
      fx = { thread = { id = "burning_blade", beat = "b3_orgnil", state = "unfolding" }, learn = { "burning_blade" } },
    },
    {
      id = "b4_neeru", npc = "neeru",
      when = { minLevel = 12, thread = { id = "burning_blade", beat = "b3_orgnil" }, ["not"] = { thread = { id = "burning_blade", beat = "b4_neeru" } } },
      text = "Orgnil Soulscar thinks the Blade take their orders from someone in the city, does he? He's such an earnest soul. Do tell him I watch the Cleft very closely indeed, and that very little happens down here without my knowing.",
      fx = { thread = { id = "burning_blade", beat = "b4_neeru", state = "unfolding" } },
    },
    {
      id = "b5_thrall", npc = "thrall",
      when = { questDone = TODO_QUEST("Hidden Enemies"),
               any = { { thread = { id = "burning_blade", beat = "b3_orgnil" } }, { thread = { id = "burning_blade", beat = "b4_neeru" } } },
               ["not"] = { thread = { id = "burning_blade", beat = "b5_thrall" } } },
      text = "You've followed the Blade from the caves of the Valley of Trials to the door of the Cleft, which is further than most of my people care to look. The rot is weaker since you went down into Ragefire Chasm, and it knows I'm watching, so let it smile while it can.",
      fx = { thread = { id = "burning_blade", beat = "b5_thrall", state = "resolved" } },
    },
  },
}

-- The Kolkar and the water. Canon: Thork's caravan raids, Tonga's sickening oases, Regthar's
-- Kolkar Leaders and Counterattack!, the tauren's long walk with the centaur at their flank.
-- The player decides, at Regthar's burrow, what becomes of Krom'zar's fleeing warband.
-- Authored: the stragglers running west, and Lanti'gah wanting them let go.
P:Thread {
  id = "kolkar_war",
  theme = "The Kolkar fight harder for every oasis that sickens, and the Horde's road runs between them and the water.",
  title = "The Kolkar and the water",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Kolkar never strike the Crossroads' wall; they strike the wagons on the road and run for the oases. Tonga says the oases are sickening from below, so the centaur fight harder for every one that's left.",
      third = "{name} learned that the Kolkar raided the Barrens' road and fought harder for every oasis that sickened." },
    unfolding = { first = "Regthar Deathgate says the Kolkar once fought each other for water, until new leaders turned them on the Horde instead. Jorn Skyseer says the tauren were fighting the centaur long before any orc ship landed, and haven't forgotten whose axes stood at their flank.",
      third = "{name} heard Regthar Deathgate and Jorn Skyseer on the Kolkar, and found the war over the water was older than the Horde in Kalimdor." },
    resolved = { first = "Krom'zar is dead, and I told Regthar to let his stragglers run home to Desolace and tell the tale. He grumbled and let them go, and the road has been quiet since.",
      third = "{name} told Regthar Deathgate to let Krom'zar's stragglers run home, and the road went quiet." },
    soured = { first = "Krom'zar is dead, and I told Regthar to ride his stragglers down before they reached the hills. He did, and the Kolkar in Desolace will be counting their dead for a long while.",
      third = "{name} told Regthar Deathgate to ride Krom'zar's stragglers down, and none of them reached Desolace." },
  },
  npcs = { "thork", "tonga", "regthar", "jorn" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Regthar to let Krom'zar's stragglers run west with the tale. He let them go, and the road went quiet.",
    soured = "The player told Regthar to ride the stragglers down. None reached Desolace, and the Kolkar there will remember it.",
  },
  pacing = { minConversations = 2, minSeconds = 600 },
  reflection = {
    first = "Everyone in the northern Barrens talks about the Kolkar, and sooner or later the talk always turns to water.",
    third = "{name} noticed that every talk of the Kolkar in the Barrens came round, sooner or later, to water.",
  },
  beats = {
    {
      id = "b1_thork", npc = "thork",
      when = { minLevel = 12, thread = { id = "kolkar_war", notBeat = "b1_thork" } },
      text = "The Kolkar never come at my wall; they hit the wagons strung out on the road and then run for the oases. Lately they ride in bigger bands, and Regthar Deathgate west of here can tell you why, if he's in a talking mood.",
      fx = { thread = { id = "kolkar_war", beat = "b1_thork", state = "stirring" } },
    },
    {
      id = "b2_tonga", npc = "tonga",
      when = { minLevel = 12, thread = { id = "kolkar_war", notBeat = "b2_tonga" } },
      text = "Always start with the water, friend. The oases are sickening from below, and every one that fouls leaves the Kolkar fewer places to drink, so they fight harder for the ones that remain, and the road runs right between them.",
      fx = { thread = { id = "kolkar_war", beat = "b2_tonga", state = "stirring" } },
    },
    {
      id = "b3_regthar", npc = "regthar",
      when = { any = { { thread = { id = "kolkar_war", beat = "b1_thork" } }, { thread = { id = "kolkar_war", beat = "b2_tonga" } } },
               ["not"] = { thread = { id = "kolkar_war", beat = "b3_regthar" } } },
      text = "Thork sent you, or Tonga did; they both send me their worries. The Kolkar used to fight each other over water, and now their new warlords, Barak, Verog and Hezrul, have them fighting us for it instead, which is worse for the caravans and keeps my axe busy.",
      fx = { thread = { id = "kolkar_war", beat = "b3_regthar", state = "unfolding" } },
    },
    {
      id = "b4_jorn", npc = "jorn",
      when = { thread = { id = "kolkar_war", beat = "b3_regthar" }, ["not"] = { thread = { id = "kolkar_war", beat = "b4_jorn" } } },
      text = "Regthar speaks of the Kolkar as though the war began when the orcs landed. My people fought the centaur across this grass for longer than anyone remembers, and on the long walk to Mulgore it was orc axes at our flank, which is a debt Taurajo hasn't forgotten.",
      fx = { thread = { id = "kolkar_war", beat = "b4_jorn", state = "unfolding" } },
    },
    {
      id = "b4_jorn_tauren", npc = "jorn",
      when = { race = "Tauren", thread = { id = "kolkar_war", beat = "b3_regthar" }, ["not"] = { thread = { id = "kolkar_war", beat = "b4_jorn" } } },
      text = "Regthar speaks of the Kolkar as though the war began when the orcs landed, but you and I know better. Our grandfathers fought the centaur across this grass long before Thrall came, and it was orc axes at our flank on the walk to Mulgore, a debt Taurajo still honours.",
      fx = { thread = { id = "kolkar_war", beat = "b4_jorn", state = "unfolding" } },
    },
    {
      id = "b5_regthar", npc = "regthar",
      when = { questDone = TODO_QUEST("Counterattack!"), thread = { id = "kolkar_war", notBeat = "b5_regthar" } },
      text = "Krom'zar's stragglers are running west for Desolace with their tails between their legs. Lanti'gah here says let them run and tell the tale, and I say ride them down before they reach the hills, and you've earned a say in it.",
      fx = { thread = { id = "kolkar_war", beat = "b5_regthar", state = "unfolding" } },
    },
  },
}

-- Hammerfall (Horde, ~30-40). The camp in Arathi built where the humans once kept orcs in
-- chains, a short ride from the rotting walls of Stromgarde. Drum Fel, Tor'gan, Innkeeper
-- Adegwa and Korin Fel; the Witherbark, the Syndicate and the Stromgarde remnant are the
-- canon neighbours; Call to Arms (the Witherbark) is the resolving quest. The beats invent no events and say nothing of what comes later.
P:Thread {
  id = "hammerfall_chains",
  theme = "Hammerfall stands where the humans kept orcs in chains, and everyone in it remembers a different part of that.",
  title = "The ground at Hammerfall",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Drum Fel told me Hammerfall is built where the humans once kept his people in chains, and that the Horde means to prosper on the same ground. Tor'gan says the spirits there still remember the fence.",
      third = "{name} learned that Hammerfall was built on the ground where humans once kept orcs in chains." },
    unfolding = { first = "Korin Fel will not let a warlock near her husband, because Gul'dan's kind sold her people to the demons once and the camps came after. Adegwa keeps the fire warm for everyone who walks in, and says the plains taught her that grief needs a hearth more than a wall.",
      third = "{name} heard how the people of Hammerfall carried the memory of the camps, each in their own way." },
    resolved = { first = "The Witherbark have been driven back from the hills around Hammerfall, and Drum Fel says the camp will have its harvest. He didn't smile when he said it, but he stood a little straighter, and so did the grunts on the wall.",
      third = "{name} answered Drum Fel's call to arms against the Witherbark, and Drum Fel stood a little straighter for it." },
  },
  npcs = { "drumfel", "torgan", "korinfel", "adegwa" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "Hammerfall holds its hills, and the people who once sat behind a human fence on that ground mean to prosper there.",
  },
  pacing = { minConversations = 2, minSeconds = 900 },
  reflection = {
    first = "Everyone at Hammerfall remembers the camps, and not one of them remembers it the same way twice.",
    third = "{name} had heard the camps remembered four different ways in Hammerfall.",
  },
  beats = {
    {
      id = "b1_drumfel", npc = "drumfel",
      when = { faction = "Horde", minLevel = 28, thread = { id = "hammerfall_chains", notBeat = "b1_drumfel" } },
      text = "The humans built a pen on this ground once, {class}, and they filled it with orcs who'd forgotten how to stand. We tore the fence down and built a wall in its place, and every grunt on that wall knows exactly what it's keeping out.",
      fx = { thread = { id = "hammerfall_chains", beat = "b1_drumfel", state = "stirring" }, learn = { "internment" } },
    },
    {
      id = "b2_torgan", npc = "torgan",
      when = { faction = "Horde", thread = { id = "hammerfall_chains", notBeat = "b2_torgan" } },
      text = "De ground here be heavy, mon, and de spirits under it don't sleep easy. They remember de fence and de lethargy and de long years in de mud, and I sing to them every night so they know de orcs walkin' over them now be free.",
      fx = { thread = { id = "hammerfall_chains", beat = "b2_torgan", state = "stirring" } },
    },
    {
      id = "b3_korinfel", npc = "korinfel",
      when = { any = { { thread = { id = "hammerfall_chains", beat = "b1_drumfel" } }, { thread = { id = "hammerfall_chains", beat = "b2_torgan" } } },
               ["not"] = { thread = { id = "hammerfall_chains", beat = "b3_korinfel" } } },
      text = "My husband was in the camp that stood here, and some nights he still wakes reaching for a chain that isn't there. Drum Fel builds walls and Tor'gan sings, and I keep the warlocks away from his door, because it was their kind who led us to the fence in the first place.",
      fx = { thread = { id = "hammerfall_chains", beat = "b3_korinfel", state = "unfolding" } },
    },
    {
      id = "b4_adegwa", npc = "adegwa",
      when = { any = { { thread = { id = "hammerfall_chains", beat = "b3_korinfel" } }, { thread = { id = "hammerfall_chains", beat = "b2_torgan" } } },
               ["not"] = { thread = { id = "hammerfall_chains", beat = "b4_adegwa" } } },
      text = "My people never knew the camps, friend, but we knew the centaur, and the long running from one dry plain to the next. I keep this fire warm for the orcs who remember the fence, because I have learned that grief needs a hearth more than it needs a wall.",
      fx = { thread = { id = "hammerfall_chains", beat = "b4_adegwa", state = "unfolding" } },
    },
    {
      id = "b5_drumfel", npc = "drumfel",
      when = { questDone = TODO_QUEST("Call to Arms"), thread = { id = "hammerfall_chains", notBeat = "b5_drumfel" } },
      text = "The Witherbark have pulled back into their hills, and the fields around Hammerfall are ours to farm. Half my grunts sat behind a fence on this ground once, {class}, and now they'll bring in a harvest from it, and I can think of no better answer to give the humans.",
      fx = { thread = { id = "hammerfall_chains", beat = "b5_drumfel", state = "resolved" } },
    },
  },
}
