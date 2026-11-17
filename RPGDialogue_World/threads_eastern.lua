-- Eastern Kingdoms throughlines: Gnomeregan and its exiles, the watch on the Dark Portal, and
-- the Blackrock coming down the mountain on Redridge. Beats connect existing Year 1
-- storylines (Operation Recombobulation, Find Bingles, The Grand Betrayal; Nethergarde,
-- Stonard and the Dragonmaw; Blackrock Menace, Missing In Action, Maxwell's Mission) and
-- invent no events. Nothing later is foreshadowed.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

-- Gnomeregan lost (Alliance, ~6-30). The troggs came up, the gnomes fought them in secret,
-- Thermaplugg proposed the radiation and Mekkatorque signed it. Everyone from Kharanos to the
-- loch has a view on whose fault that was. Mekkatorque asks the player what to tell Tinker
-- Town: that ending lives in his file (ironforge_court.lua, gnomeregan_word).
P:Thread {
  id = "gnomeregan_lost",
  theme = "Gnomeregan fell to the troggs and to a poison the gnomes let loose themselves, and every exile in Tinker Town has a different answer for whose hand was on the lever.",
  title = "Who lost Gnomeregan",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Gnomeregan fell to the troggs and to a poison the gnomes let loose on them, and the leper gnomes still wander the snow outside the gates. The dwarves of Dun Morogh have started asking whose fault that was, and the gnomes would rather they didn't.",
      third = "{name} learned how Gnomeregan was lost, and heard the dwarves of Dun Morogh begin to ask whose fault it was." },
    unfolding = { first = "From Gol'Bolar to the loch, everyone has a view on who lost Gnomeregan. Senator Stonehallow blames the gnomes' secret war with the troggs, and in Tinker Town the exiles argue every night over Thermaplugg's plan and the High Tinker's signature.",
      third = "{name} heard the fall of Gnomeregan argued from Gol'Bolar to Tinker Town, with blame for the troggs, for Thermaplugg and for the High Tinker himself." },
    resolved = { first = "I told Mekkatorque to tell his people the order was his as well as Thermaplugg's. He said he'd read it out in Tinker Town with Thermaplugg's lenses on his nose, and the arguing there has turned into planning.",
      third = "{name} counselled High Tinker Mekkatorque to tell his people the order was his as well as Thermaplugg's, and Tinker Town stopped arguing and started planning." },
    soured = { first = "I told Mekkatorque to let Thermaplugg carry the blame alone. Tinker Town has its villain now, and the High Tinker, who signed the order, is the one gnome there who doesn't sleep any better for it.",
      third = "{name} counselled High Tinker Mekkatorque to let Thermaplugg carry the blame alone, and Tinker Town cheered while the High Tinker went home early." },
  },
  npcs = { "razzle_sprysprocket", "stonehallow", "bingles", "gnoarn", "mekkatorque" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player told Mekkatorque to say the order was his as well as Thermaplugg's. Tinker Town stopped arguing and started planning.",
    soured = "The player told Mekkatorque to let Thermaplugg carry the blame alone. Tinker Town got its villain, and the High Tinker kept his guilt to himself.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "The troggs, Thermaplugg, the High Tinker, the gnomes themselves: everyone I've asked about Gnomeregan has blamed somebody, and nobody has blamed the same one twice.",
    third = "{name} had heard Gnomeregan's fall blamed on troggs, on Thermaplugg, on the High Tinker and on the gnomes themselves.",
  },
  beats = {
    {
      id = "b1_razzle", npc = "razzle_sprysprocket",
      when = { faction = "Alliance", minLevel = 6, thread = { id = "gnomeregan_lost", notBeat = "b1_razzle" } },
      text = "Every leper gnome out in that snow had a workbench and a name once, {class}, and a few of them used to say good morning to me on the lift. The dwarves in Kharanos keep asking me whose fault it was, as though I'd drawn up a schematic, and I tell them I'm busy building the cure, which is true and is also the easiest answer I've got.",
      fx = { thread = { id = "gnomeregan_lost", beat = "b1_razzle", state = "stirring" }, learn = { "gnomeregan" } },
    },
    {
      id = "b2_stonehallow", npc = "stonehallow",
      when = { faction = "Alliance", minLevel = 8, thread = { id = "gnomeregan_lost", notBeat = "b2_stonehallow" } },
      text = "The troggs came up through the gnomes first, an' the gnomes fought 'em in secret for years, so by the time Ironforge heard o' it their halls were full. I'll no' say the wee folk deserved what came after, for nobody deserves that, but a war kept secret from yer neighbours is a war ye've chosen tae lose alone.",
      fx = { thread = { id = "gnomeregan_lost", beat = "b2_stonehallow", state = "stirring" }, learn = { "troggs", "gnomeregan" } },
    },
    {
      id = "b3_bingles", npc = "bingles",
      when = { faction = "Alliance", minLevel = 12, thread = { id = "gnomeregan_lost", notBeat = "b3_bingles" } },
      text = "The troggs nosing round the Ironband dig look exactly like the ones that came up under the city, same grey hide and same stubborn faces, and every time one runs off with a spanner of mine I think, well, that's how it started at home. Nobody in Tinker Town agrees about anything except that it wasn't their fault, which is very gnomish of us, I'm afraid.",
      fx = { thread = { id = "gnomeregan_lost", beat = "b3_bingles", state = "unfolding" }, learn = { "troggs" } },
    },
    {
      id = "b4_gnoarn", npc = "gnoarn",
      when = { faction = "Alliance", minLevel = 18,
               any = { { thread = { id = "gnomeregan_lost", beat = "b1_razzle" } }, { thread = { id = "gnomeregan_lost", beat = "b2_stonehallow" } }, { thread = { id = "gnomeregan_lost", beat = "b3_bingles" } } },
               ["not"] = { thread = { id = "gnomeregan_lost", beat = "b4_gnoarn" } } },
      text = "Every night in Tinker Town it's the same argument, friend: the troggs did it, Thermaplugg did it, the High Tinker signed the order, and round it goes until somebody's kettle boils over. I say it doesn't matter whose hand was on the lever while the city's still down there waiting for us, though I lost my hair to that lever, so perhaps I've earned a little shouting.",
      fx = { thread = { id = "gnomeregan_lost", beat = "b4_gnoarn", state = "unfolding" } },
    },
    {
      id = "b5_mekkatorque", npc = "mekkatorque",
      when = { faction = "Alliance", thread = { id = "gnomeregan_lost", beat = "b4_gnoarn" }, ["not"] = { thread = { id = "gnomeregan_lost", beat = "b5_mekkatorque" } } },
      text = "Gnoarn's been holding his meetings again, and I hear every word of them, because Tinker Town has very thin walls and very loud gnomes. They argue over whether it was Thermaplugg's plan or my signature, and they've asked me to stand up at the next assembly and settle it, so I'd dearly like to know what you'd tell them in my place.",
      fx = { thread = { id = "gnomeregan_lost", beat = "b5_mekkatorque", state = "unfolding" } },
    },
  },
}

-- The watch on the Dark Portal (both factions, ~20-55). The gate has been dead since the far
-- side was destroyed; Nethergarde watches it for the Alliance and Stonard, raised by orcs who
-- never went into the camps, watches it for the Horde. The Dragonmaw still fight for a Horde
-- that's gone. Each faction walks its own beats; Kirith's is open to both.
P:Thread {
  id = "portal_watch",
  theme = "The Dark Portal is dead, and the Alliance and the Horde both keep watch on it anyway, because the old Horde never entirely went home.",
  title = "The watch on the Dark Portal",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Dark Portal has stood dead in the Blasted Lands since the far side was destroyed, and still somebody watches it: the Alliance from Nethergarde Keep, the Horde from Stonard's walls in the swamp. Up north the Dragonmaw fight on as though the old Horde had never ended.",
      third = "{name} learned that the dead Dark Portal is still watched from Nethergarde and from Stonard, and that the Dragonmaw fight on for the old Horde." },
    unfolding = { first = "Everyone who watches the Portal admits it's dead, and none of them will stop watching. The Dragonmaw still raid beneath Grim Batol, the Shadowsworn still haunt the wastes, and the soldiers on the walls want to know why they're guarding a cold door.",
      third = "{name} heard the soldiers who watch the Dark Portal ask why they guard a cold door, while the Dragonmaw and the Shadowsworn give them their answer." },
    resolved = { first = "I've seen the watch on the Dark Portal from one end to the other. The stones are cold, the last of the old Horde fight for a war that's over, and the watchers write it all down and go back up on the wall.",
      third = "{name} saw the watch on the Dark Portal from end to end: cold stones, an old Horde that won't lie down, and watchers who keep watching." },
  },
  npcs = { "valstag", "lungertz", "kirith", "mahar_ba", "ruag", "malosh" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The player saw the watch on the Dark Portal from end to end. The stones are cold, and the watchers keep watching.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "A gate that's been dead for years, and half the soldiers in the east are still standing on walls, looking at it.",
    third = "{name} had met the soldiers who still stand on walls watching a gate that died years ago.",
  },
  beats = {
    {
      id = "b1_valstag", npc = "valstag",
      when = { faction = "Alliance", minLevel = 20, thread = { id = "portal_watch", notBeat = "b1_valstag" } },
      text = "The Dragonmaw are the last o' the old Horde's clans that never went into the camps an' never came out tae Thrall, an' they're still camped under Grim Batol like the war never ended. They're pushin' at Dun Algaz harder this season than last, an' I'd give a month's ale tae know who they think is comin' tae join them.",
      fx = { thread = { id = "portal_watch", beat = "b1_valstag", state = "stirring" }, learn = { "dragonmaw", "grim_batol" } },
    },
    {
      id = "b2_lungertz", npc = "lungertz",
      when = { faction = "Alliance", minLevel = 40, thread = { id = "portal_watch", notBeat = "b2_lungertz" } },
      text = "Every crate in this keep came down the long road from Darkshire, friend, and every soldier who carries one asks me why we're guarding a door that's been dead for years. I tell them the door's dead and the orcs are still on this side of it, and that usually ends the conversation, though it never ends the grumbling.",
      fx = { thread = { id = "portal_watch", beat = "b2_lungertz", state = "stirring" }, learn = { "nethergarde", "dark_portal" } },
    },
    {
      id = "b3_kirith", npc = "kirith",
      when = { minLevel = 45, thread = { id = "portal_watch", notBeat = "b3_kirith" } },
      text = "Thrall's Grasp came into these wastes because there are still those, orc and human both, who can't believe the Portal is finished, and they gather here to hope at it. The Shadowsworn were the worst of them, and you've seen what they made of me, so tell whoever keeps your watch that the stones may be cold but the people around them are not.",
      fx = { thread = { id = "portal_watch", beat = "b3_kirith", state = "unfolding" }, learn = { "dark_portal" } },
    },
    {
      id = "b4_mahar_ba", npc = "mahar_ba",
      when = { faction = "Alliance", thread = { id = "portal_watch", beat = "b2_lungertz" },
               any = { { thread = { id = "portal_watch", beat = "b1_valstag" } }, { thread = { id = "portal_watch", beat = "b3_kirith" } } },
               ["not"] = { thread = { id = "portal_watch", beat = "b4_mahar_ba" } } },
      text = "Khadgar went through that gate with the Alliance expedition, and it died behind them, and not one of them has come back to tell us how. You've heard what I hear, that the Dragonmaw fight as though somebody's coming and the soldiers grumble because nobody is, and I've written all of it in the book, which Lungertz has asked me very kindly to stop reading aloud at supper.",
      fx = { thread = { id = "portal_watch", beat = "b4_mahar_ba", state = "resolved" }, learn = { "khadgar" }, standing = { nethergarde = 3 } },
    },
    {
      id = "b5_ruag", npc = "ruag",
      when = { faction = "Horde", minLevel = 35, thread = { id = "portal_watch", notBeat = "b5_ruag" } },
      text = "Stonard was raised by orcs who stayed in the swamp when the rest were put in the camps, and from the walls you can see the road south to the gate that brought us all here. The humans at Nethergarde watch it for fear of us, and I watch it for fear of the ones who opened it, and I couldn't tell you which of us sleeps worse.",
      fx = { thread = { id = "portal_watch", beat = "b5_ruag", state = "stirring" }, learn = { "dark_portal", "nethergarde" } },
    },
    {
      id = "b6_malosh", npc = "malosh",
      when = { faction = "Horde", thread = { id = "portal_watch", beat = "b5_ruag" }, ["not"] = { thread = { id = "portal_watch", beat = "b6_malosh" } } },
      text = "I carried an axe for Doomhammer, and I knew Dragonmaw in that Horde, hard fighters who'd ride a red dragon into a wall if they were told to. They're still up north under Grim Batol, fighting for a Horde that's gone, and if Thrall's name means anything to them I've never heard it.",
      fx = { thread = { id = "portal_watch", beat = "b6_malosh", state = "unfolding" }, learn = { "dragonmaw" } },
    },
    {
      id = "b7_ruag", npc = "ruag",
      when = { faction = "Horde", minLevel = 45, thread = { id = "portal_watch", beat = "b6_malosh" }, ["not"] = { thread = { id = "portal_watch", beat = "b7_ruag" } } },
      text = "I sent two scouts as far as the steps of the Portal, and they came back to tell me the stones are cold and nothing came out of the gate but wind. I wrote it in the dispatch book under the names, and I'll send them again next moon, because cold stones are exactly what I want to read every time.",
      fx = { thread = { id = "portal_watch", beat = "b7_ruag", state = "resolved" }, standing = { stonard = 3 } },
    },
  },
}

-- The Blackrock come down the mountain (Alliance, ~16-55). Lakeshire counts the orcs in
-- Render's Valley, Stonewatch flies a Blackrock banner, Keeshan heard Rend's name in the cells,
-- and Morgan's Vigil watches the spring the trickle rises from. Maxwell's Mission ends it.
-- Nefarian and the True Masters stay in Solomon's thread.
P:Thread {
  id = "blackrock_down",
  theme = "Redridge sees the Blackrock come over the passes a few at a time, and on the ridge above the Steppes they can see where the few are coming from.",
  title = "The Blackrock come down the mountain",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Blackrock orcs in Render's Valley come down from the Burning Steppes better armed every season, and Guard Howe swears they're the front of something rather than raiders. Lakeshire is the first door they'd knock on.",
      third = "{name} heard Guard Howe warn that the Blackrock in Redridge were the front of something larger." },
    unfolding = { first = "A Blackrock banner flies over Stonewatch Keep, and Marshal Marris counts the orcs every week and only ever counts more. Keeshan heard them talk in the cells of Rend in the Spire, and at Morgan's Vigil they watch the camps gather at the mountain's foot.",
      third = "{name} followed the Blackrock from Stonewatch Keep back to the camps under Blackrock Spire." },
    resolved = { first = "With Voone, Omokk and Wyrmthalak gone, the camps under the Spire have fewer masters to march them, and fewer orcs come over the passes to Redridge. Maxwell will put it in a report nobody reads, so I'm to tell Marris myself.",
      third = "{name} broke the masters of the lower Spire, and fewer Blackrock came down the mountain to Redridge." },
  },
  npcs = { "guard_howe", "marris", "keeshan", "helendis", "maxwell" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The player broke the masters of the lower Spire, and fewer Blackrock came over the passes to Redridge.",
  },
  pacing = { minConversations = 3, minSeconds = 1200 },
  reflection = {
    first = "Lakeshire sees a handful of orcs at a time and Morgan's Vigil sees a mountain full of them, and it's the same orcs.",
    third = "{name} had seen the Blackrock from both ends, a handful at Lakeshire and a mountain full at Morgan's Vigil.",
  },
  beats = {
    {
      id = "b1_howe", npc = "guard_howe",
      when = { faction = "Alliance", minLevel = 16, thread = { id = "blackrock_down", notBeat = "b1_howe" } },
      text = "Every Blackrock I've put down in Render's Valley came over the passes from the Steppes, {class}, and they come down that mountain fatter and better armed every season. Mark me, they're no raiders, they're the front of something, and Lakeshire's the first door they'll knock on.",
      fx = { thread = { id = "blackrock_down", beat = "b1_howe", state = "stirring" }, learn = { "blackrock" } },
    },
    {
      id = "b2_marris", npc = "marris",
      when = { faction = "Alliance",
               any = { { thread = { id = "blackrock_down", beat = "b1_howe" } }, { questDone = TODO_QUEST("Blackrock Menace") } },
               ["not"] = { thread = { id = "blackrock_down", beat = "b2_marris" } } },
      text = "Stonewatch Keep was ours when I came to Redridge, and now there's a Blackrock banner over the gate and Tharil'zun giving orders from the commander's rooms. Howe thinks they're the front of an army, and I've stopped telling him he's wrong, because I count them every week and the number only goes one way.",
      fx = { thread = { id = "blackrock_down", beat = "b2_marris", state = "unfolding" }, learn = { "stonewatch_keep" } },
    },
    {
      id = "b3_keeshan", npc = "keeshan",
      when = { faction = "Alliance", questDone = TODO_QUEST("Missing In Action"), thread = { id = "blackrock_down", notBeat = "b3_keeshan" } },
      text = "In the cells at Stonewatch I heard them talk of the Spire, of Rend sitting up there like a king and sending the young ones down to Redridge to earn their blood. The men I served with held that keep as long as men could, and the orcs who took it were only the ones Rend could spare.",
      fx = { thread = { id = "blackrock_down", beat = "b3_keeshan", state = "unfolding" }, learn = { "blackrock_spire", "keeshan" } },
    },
    {
      id = "b4_helendis", npc = "helendis",
      when = { faction = "Alliance", minLevel = 48,
               any = { { thread = { id = "blackrock_down", beat = "b1_howe" } }, { thread = { id = "blackrock_down", beat = "b2_marris" } }, { thread = { id = "blackrock_down", beat = "b3_keeshan" } } },
               ["not"] = { thread = { id = "blackrock_down", beat = "b4_helendis" } } },
      text = "From this ridge I watch the Blackrock gather at the mountain's foot, more of them every week, and some few of them go over the passes toward Redridge and do not come back. Your Lakeshire sees the trickle, {class}, and I have been watching the spring it rises from for a long while now.",
      fx = { thread = { id = "blackrock_down", beat = "b4_helendis", state = "unfolding" }, learn = { "blackrock_spire" } },
    },
    {
      id = "b5_maxwell", npc = "maxwell",
      when = { faction = "Alliance", questDone = TODO_QUEST("Maxwell's Mission"),
               any = { { thread = { id = "blackrock_down", beat = "b2_marris" } }, { thread = { id = "blackrock_down", beat = "b3_keeshan" } }, { thread = { id = "blackrock_down", beat = "b4_helendis" } } },
               ["not"] = { thread = { id = "blackrock_down", beat = "b5_maxwell" } } },
      text = "With Voone, Omokk and Wyrmthalak gone, the camps under the Spire have been squabbling over who gives the orders, and fewer of them have gone over the passes this month than any month I've kept count. I'll put it in a report that nobody in Stormwind reads, so you'd better tell Marris in Lakeshire yourself, because somebody down there ought to hear it.",
      fx = { thread = { id = "blackrock_down", beat = "b5_maxwell", state = "resolved" }, standing = { morgans_vigil = 3, lakeshire = 2 } },
    },
  },
}
