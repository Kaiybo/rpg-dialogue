-- Southern Kalimdor throughlines: Tanaris, Desolace and Feralas.
-- Beats connect existing Year 1 storylines (Wastewander Justice, Water Pouch Bounty, Gadgetzan
-- Water Survey; the Gelkis and Magram alliances and Khan Hratha; Lethtendris's Web and the
-- Gordunni of Dire Maul) and invent no events. Nothing later is foreshadowed.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

-- Gadgetzan's water. The Wastewanderers sit on the springs, the Bruisers keep the peace only inside
-- the walls, and the Cartel pays the Southsea to stay away. Marin asks the player whether to pay the
-- bandits the same way. Neutral; both factions. The player decides the ending.
P:Thread {
  id = "gadgetzan_water",
  theme = "Gadgetzan drinks what the Wastewanderers leave it, and every goblin in Tanaris is wondering what it would cost to buy the rest.",
  title = "Gadgetzan's water",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Gadgetzan drinks what the Water Company pumps up at Waterspring Field, and the Wastewanderers sit on half the springs outside the walls. The Bruisers keep the peace in town, and Chief Engineer Bilgewhizzle says the peace stops at the gate.",
      third = "{name} learned that the Wastewanderers held half of Gadgetzan's water, and that the Bruisers didn't guard it beyond the walls." },
    unfolding = { first = "Fizzledowser draws his new springs in pencil, Luglunket buys stolen pouches back one bounty at a time, and down at Steamwheedle Port the Cartel pays the Southsea pirates to leave its ships alone. Everyone in Tanaris seems to be wondering what the Wastewanderers would charge.",
      third = "{name} heard Gadgetzan's goblins wonder aloud whether the Wastewanderers could simply be paid, as the Southsea were." },
    resolved = { first = "I told Baron Noggenfogger not to pay the Wastewanderers a copper, and to send the Bruisers out to the pumps instead. He grumbled about the overhead, and then he wrote it down.",
      third = "{name} counselled Marin Noggenfogger to guard Gadgetzan's water instead of buying it back from the Wastewanderers." },
    soured = { first = "I told Baron Noggenfogger to pay the Wastewanderers and be done with it. He liked the arithmetic, and Chief Engineer Bilgewhizzle hasn't said a civil word to me since.",
      third = "{name} counselled Marin Noggenfogger to pay the Wastewanderers off, as the Cartel pays the Southsea." },
  },
  npcs = { "bilgewhizzle", "fizzledowser", "luglunket", "security_bilgewhizzle", "marin" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Marin to guard the water and pay the bandits nothing. Marin put the Bruisers on the pipes and complained about the overhead.",
    soured = "The player told Marin to pay the Wastewanderers as the Cartel pays the Southsea. Marin liked the sums, and the Chief Engineer did not.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "In Gadgetzan every cup of water has a price, and the Wastewanderers set half of them.",
    third = "{name} had learned that in Gadgetzan every cup of water had a price, and the Wastewanderers set half of them.",
  },
  beats = {
    {
      id = "b1_bilgewhizzle", npc = "bilgewhizzle",
      when = { minLevel = 40, thread = { id = "gadgetzan_water", notBeat = "b1_bilgewhizzle" } },
      text = "The Wastewanders sit on half the springs in Tanaris now, pal, and the Bruisers won't set foot past the town gate, because the Cartel pays them to keep the peace in Gadgetzan and not one yard outside it. So my pumps at Waterspring Field are guarded by my crew, a lot of hope and a sign that says 'Company property', and you can guess how much work the sign is doing.",
      fx = { thread = { id = "gadgetzan_water", beat = "b1_bilgewhizzle", state = "stirring" }, learn = { "steamwheedle" } },
    },
    {
      id = "b2_fizzledowser", npc = "fizzledowser",
      when = { questDone = TODO_QUEST("Gadgetzan Water Survey"), thread = { id = "gadgetzan_water", notBeat = "b2_fizzledowser" } },
      text = "You took my widget out to Sandsorrow Watch and brought it back in one piece, pal, which puts you ahead of most of my crews. Every circle on this map is a spring we found and the Wastewanders found next, and lately I draw the new ones in pencil, because pencil is cheaper to rub out.",
      fx = { thread = { id = "gadgetzan_water", beat = "b2_fizzledowser", state = "stirring" } },
    },
    {
      id = "b3_luglunket", npc = "luglunket",
      when = { questDone = TODO_QUEST("Water Pouch Bounty"), thread = { id = "gadgetzan_water", notBeat = "b3_luglunket" } },
      text = "Every pouch you bring back is Company water returned to Company tanks, and I pay out a care package for every five, all by the book, huzzah! Only, between you and me and the spigot, pal, some weeks I'd swear I've bought back the very same pouch twice, which means the Company is paying for its own water at a markup it didn't set.",
      fx = { thread = { id = "gadgetzan_water", beat = "b3_luglunket", state = "unfolding" } },
    },
    {
      id = "b4_security", npc = "security_bilgewhizzle",
      when = { minLevel = 40,
               any = { { thread = { id = "gadgetzan_water", beat = "b1_bilgewhizzle" } }, { thread = { id = "gadgetzan_water", beat = "b2_fizzledowser" } }, { thread = { id = "gadgetzan_water", beat = "b3_luglunket" } } },
               ["not"] = { thread = { id = "gadgetzan_water", beat = "b4_security" } } },
      text = "The Cartel pays the Southsea to leave our ships alone, and it worked, mostly, right up until it didn't, and now I hear somebody up the ladder is asking what the Wastewanders would charge for the same deal. I'll tell you what I'd tell them, pal: you pay a bandit once and you've hired him, and he'll send you an invoice every quarter for the rest of your life.",
      fx = { thread = { id = "gadgetzan_water", beat = "b4_security", state = "unfolding" } },
    },
    {
      id = "b5_marin", npc = "marin",
      when = { all = { { thread = { id = "gadgetzan_water", beat = "b1_bilgewhizzle" } },
                       { any = { { thread = { id = "gadgetzan_water", beat = "b2_fizzledowser" } }, { thread = { id = "gadgetzan_water", beat = "b3_luglunket" } }, { thread = { id = "gadgetzan_water", beat = "b4_security" } } } } },
               ["not"] = { thread = { id = "gadgetzan_water", beat = "b5_marin" } } },
      text = "Everybody in this town has come through my door this month with an opinion about the Wastewanderers, pal, and every opinion comes with a price tag stapled to it. The Cartel wants Gadgetzan neutral and drinking, and I'd like an outsider's sums on how to keep it that way before I hand over mine.",
      fx = { thread = { id = "gadgetzan_water", beat = "b5_marin", state = "unfolding" } },
    },
  },
}

-- The centaur clans of Desolace. Nijel's Point and Ghost Walker Post each keep the clans at one
-- another's throats; the player takes the Gelkis or the Magram side, and the thread resolves on Khan
-- Hratha. Opening beats are faction-gated; the clan beats follow the player's reputation.
P:Thread {
  id = "desolace_clans",
  theme = "Nijel's Point and Ghost Walker Post both keep the centaur clans fighting each other, and both call it holding the line.",
  title = "The clans of Desolace",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Whoever holds a camp in Desolace says the same thing about the centaur: there are too many of them, and they hate each other more than they hate us. The Kolkar hold the north, the Gelkis and the Magram the south, and the Maraudine keep Maraudon at the back of it all.",
      third = "{name} learned that the outposts of Desolace survived because the centaur clans hated each other more than they hated outsiders." },
    unfolding = { first = "I took a side in the oldest feud in Desolace, and the clan I chose let me near its fires for the other clan's blood. Its speaker talks of the earth drinking it, the soldiers who sent me talk of keeping the clans busy, and I'm not sure which of them sounds colder.",
      third = "{name} took a side between the Gelkis and the Magram, and spilled the other clan's blood to earn it." },
    resolved = { first = "Khan Hratha is dead, and the clan I fought for laughed about it for days. The Gelkis and the Magram are still at each other's throats, the Kolkar are wailing, and the outposts say that's the best news Desolace has had all year.",
      third = "{name} killed Khan Hratha for one centaur clan, and left the feud between the others burning, as the outposts wanted." },
  },
  npcs = { "pentigast", "felgur", "uthek", "warug" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "Khan Hratha is dead. The Gelkis and the Magram are still at war, and the outposts count that a win.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Everyone in Desolace is glad when the centaur kill each other, the centaur included, and I've started to wonder who that leaves to stop it.",
    third = "{name} had seen that everyone in Desolace was glad when the centaur killed each other, the centaur included.",
  },
  beats = {
    {
      id = "b1_pentigast", npc = "pentigast",
      when = { minLevel = 30, faction = "Alliance", thread = { id = "desolace_clans", notBeat = "b1_pentigast" } },
      text = "Kolkar to the north, Gelkis and Magram to the south, and the Maraudine sitting on Maraudon as if it were the last holy thing in the world, which to them it may be. My orders are to hold this ridge, {class}, and the cheapest way I know to hold it is to keep the clans counting each other's dead instead of mine.",
      fx = { thread = { id = "desolace_clans", beat = "b1_pentigast", state = "stirring" } },
    },
    {
      id = "b1_felgur", npc = "felgur",
      when = { minLevel = 30, faction = "Horde", thread = { id = "desolace_clans", notBeat = "b1_felgur" } },
      text = "Kolkar, Gelkis, Magram and Maraudine, and any of them would ride on the Barrens if they ever stopped killing each other. So I count their camps and pay for their ears, and I don't lose any sleep when one clan does my work for me.",
      fx = { thread = { id = "desolace_clans", beat = "b1_felgur", state = "stirring" } },
    },
    {
      id = "b2_uthek", npc = "uthek",
      when = { reputation = { faction = "Gelkis Clan Centaur", min = "friendly" }, thread = { id = "desolace_clans", notBeat = "b2_uthek" } },
      text = "The Magram say the earth is only dirt beneath their hooves, and so the earth has turned from them, friend, and you have helped it turn. The soldiers who sent you smile when the Gelkis and the Magram bleed, I know it, but the earth does not care who smiles, only who is buried.",
      fx = { thread = { id = "desolace_clans", beat = "b2_uthek", state = "unfolding" } },
    },
    {
      id = "b2_warug", npc = "warug",
      when = { reputation = { faction = "Magram Clan Centaur", min = "friendly" }, thread = { id = "desolace_clans", notBeat = "b2_warug" } },
      text = "The Gelkis pray to the dirt and the dirt does nothing, but you kill them, and that is better than any prayer! Your people in their little camps laugh to see centaur kill centaur, Warug knows it, but Warug laughs too, because the Magram are the ones still standing.",
      fx = { thread = { id = "desolace_clans", beat = "b2_warug", state = "unfolding" } },
    },
    {
      id = "b3_uthek", npc = "uthek",
      when = { questDone = TODO_QUEST("Khan Hratha"), reputation = { faction = "Gelkis Clan Centaur", min = "friendly" },
               thread = { id = "desolace_clans", notBeat = "b3_uthek" } },
      text = "The Kolkar will choose another khan, as they always do, and the Magram will come again before the rains, as they always do. But today the earth is full, friend, and the Gelkis will remember whose hand filled it.",
      fx = { thread = { id = "desolace_clans", beat = "b3_uthek", state = "resolved" } },
    },
    {
      id = "b3_warug", npc = "warug",
      when = { questDone = TODO_QUEST("Khan Hratha"), reputation = { faction = "Magram Clan Centaur", min = "friendly" },
               thread = { id = "desolace_clans", notBeat = "b3_warug" } },
      text = "Hratha is dead and the Kolkar run in circles, and the Gelkis pray louder, which is the funniest part! Warug will tell this story at every fire until there are no Gelkis left to hear it, and your name will be in it, so stand up straight.",
      fx = { thread = { id = "desolace_clans", beat = "b3_warug", state = "resolved" } },
    },
  },
}

-- Eldre'Thalas in the hills. Feathermoon Stronghold and Camp Mojache watch the same Gordunni, and
-- each other; the ruins the ogres call Dire Maul were the Highborne's and are not quite empty.
-- Faction-gated beats; resolves on Dire Maul.
P:Thread {
  id = "eldre_thalas",
  theme = "Feathermoon and Camp Mojache watch the same hills, where the Gordunni squat in the gates of a Highborne city that was never quite empty.",
  title = "The ruins in the hills",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Gordunni ogres hold the hills of Feralas and the broken gates of Eldre'Thalas, which they call Dire Maul. The camp that sent me watches them, and it watches the camp on the other side of the forest just as closely.",
      third = "{name} learned that the Gordunni held the ruins of Eldre'Thalas, and that Feathermoon and Camp Mojache watched each other as closely as the ogres." },
    unfolding = { first = "I went into the broken quarter of the old city and took Lethtendris's web from among the satyrs. Whatever the ogres think they rule in Dire Maul, the Highborne built it, and something of them is still drinking from it.",
      third = "{name} took Lethtendris's web from the satyrs' quarter of Dire Maul, and found the old city less empty than the ogres claimed." },
    resolved = { first = "I've been into the depths of Dire Maul and come out again. The Gordunni have lost what they called a throne, but the lamps in the old halls are none of their doing, and the two camps of Feralas still keep one eye on the hills and the other on each other.",
      third = "{name} went into the depths of Dire Maul and came out again, and the two camps of Feralas went on watching the hills and each other." },
  },
  npcs = { "shandris", "rokorhan", "latronicus", "talo" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The player went through Dire Maul. The Gordunni are humbled, the old city is not empty, and Feathermoon and Mojache still watch each other.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Feralas has two camps, one city in the hills, and nobody in either camp agrees on who that city belongs to.",
    third = "{name} had found that the two camps of Feralas agreed on nothing about the city in the hills.",
  },
  beats = {
    {
      id = "b1_shandris", npc = "shandris",
      when = { minLevel = 40, faction = "Alliance", thread = { id = "eldre_thalas", notBeat = "b1_shandris" } },
      text = "The Gordunni squat in the gates of Eldre'Thalas and call it Dire Maul, as if a name could make the place theirs. The Horde keeps a camp in the southern forest at Mojache, and I watch it as I watch the ogres, though I'll grant the tauren there have been kinder to the trees than the ogres ever were.",
      fx = { thread = { id = "eldre_thalas", beat = "b1_shandris", state = "stirring" }, learn = { "highborne" } },
    },
    {
      id = "b1_rokorhan", npc = "rokorhan",
      when = { minLevel = 40, faction = "Horde", thread = { id = "eldre_thalas", notBeat = "b1_rokorhan" } },
      text = "The Gordunni look at that old elf ruin in the hills like it's a throne, and every chieftain they raise wants to sit in it. The night elves on their island watch the same hills I do, and they watch Mojache too, and I'd sooner they saved their arrows for the ogres.",
      fx = { thread = { id = "eldre_thalas", beat = "b1_rokorhan", state = "stirring" }, learn = { "highborne" } },
    },
    {
      id = "b2_latronicus", npc = "latronicus",
      when = { faction = "Alliance", questDone = TODO_QUEST("Lethtendris's Web"), thread = { id = "eldre_thalas", notBeat = "b2_latronicus" } },
      text = "So the web is in hand, and its magic can go back into the wild where it belongs. The General will want to hear that the satyrs aren't the only things in that city still feeding on the old power, and better she hears it from you, because she only listens to me when I'm complaining.",
      fx = { thread = { id = "eldre_thalas", beat = "b2_latronicus", state = "unfolding" } },
    },
    {
      id = "b2_talo", npc = "talo",
      when = { faction = "Horde", questDone = TODO_QUEST("Lethtendris's Web"), thread = { id = "eldre_thalas", notBeat = "b2_talo" } },
      text = "The magic in that web was stolen from the land, and now it is loose again, and I felt the hills breathe easier tonight. The orcs at the camp say the ruins belong to the ogres, but no ogre ever raised stones like those, and whoever did is not as gone as Rok Orhan would like.",
      fx = { thread = { id = "eldre_thalas", beat = "b2_talo", state = "unfolding" } },
    },
    {
      id = "b3_shandris", npc = "shandris",
      when = { cleared = "Dire Maul", faction = "Alliance",
               any = { { thread = { id = "eldre_thalas", beat = "b1_shandris" } }, { thread = { id = "eldre_thalas", beat = "b2_latronicus" } } },
               ["not"] = { thread = { id = "eldre_thalas", beat = "b3_shandris" } } },
      text = "You've walked the deep halls of Eldre'Thalas and come back, and the ogres in its gates are a good deal quieter for it. Whatever still lights the lamps in the western halls is no friend to the Horde at Mojache and no friend to us, and I mean to keep watching both.",
      fx = { thread = { id = "eldre_thalas", beat = "b3_shandris", state = "resolved" }, standing = { feathermoon = 3 } },
    },
    {
      id = "b3_rokorhan", npc = "rokorhan",
      when = { killed = { name = "King Gordok" }, faction = "Horde",
               any = { { thread = { id = "eldre_thalas", beat = "b1_rokorhan" } }, { thread = { id = "eldre_thalas", beat = "b2_talo" } } },
               ["not"] = { thread = { id = "eldre_thalas", beat = "b3_rokorhan" } } },
      text = "King Gordok is dead and the Gordunni are squabbling over his empty chair, which is the best sound I've heard since I came to Feralas. The night elves will have heard it across the water too, and I don't doubt they're counting what it means for them, the same as I'm counting what it means for us.",
      fx = { thread = { id = "eldre_thalas", beat = "b3_rokorhan", state = "resolved" }, standing = { mojache = 3 } },
    },
  },
}
