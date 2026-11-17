-- Throughlines on the frontiers (0.78.0). Same structure as threads.lua: at most one beat per
-- conversation, beats of one thread kept apart, later beats acknowledge earlier ones.
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_QUEST = P.TODO_QUEST

-- Ashenvale, from both sides. The Warsong cut timber for Orgrimmar (Thrall's own lines,
-- 0.71.0); the Sentinels answer them (Tyrande, Raene, Shindrell's "our peace is fragile" from
-- Pridewings of Stonetalon). Each faction hears its own half: Splintertree to Thrall, or
-- Astranaar to Tyrande. Invents no events; the war simply goes on.
P:Thread {
  id = "ashenvale_axes",
  theme = "The Warsong cut Ashenvale for Orgrimmar's walls, and both sides keep a list of what it costs.",
  title = "The axes of Ashenvale",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "The Warsong are cutting Ashenvale for Orgrimmar's walls, and the Sentinels answer every axe with an arrow. Whichever side of the river you stand on, somebody there is counting the cost.",
      third = "{name} heard the sound of the Warsong axes in Ashenvale, and learned that someone on each side was counting what they cost." },
    unfolding = { first = "Nobody in Ashenvale thinks the other side is entirely wrong, though nobody will say so loudly. The soldiers on both sides keep lists of their dead, and I suspect the lists are about the same length.",
      third = "{name} found that the soldiers on both sides of Ashenvale's war kept lists of their dead, and that neither side thought the other entirely wrong." },
    resolved = { first = "I followed Ashenvale's war from the forest all the way to the one who answers for it. Nothing is settled and the trees keep falling, but now I know what it costs and who reads the bill.",
      third = "{name} followed the war in Ashenvale from the forest to the leader who answers for it, and learned what it cost and who read the bill." },
  },
  npcs = { "mastok", "kuraybin", "thrall", "raene", "shindrell", "tyrande" },
  states = { "dormant", "stirring", "unfolding", "resolved" },
  endings = {
    resolved = "The war in Ashenvale goes on, but the player has heard it from the soldiers in the forest up to the leader who answers for them.",
  },
  pacing = { minConversations = 2, minSeconds = 600 },
  reflection = {
    first = "Ashenvale's war sounds much the same from either side of it: a list of names, and somebody far away who has to read it.",
    third = "{name} had heard Ashenvale's war from the inside, and found it sounded much the same from either side.",
  },
  beats = {
    -- Horde: Splintertree Post to Orgrimmar.
    {
      id = "b1_mastok", npc = "mastok",
      when = { faction = "Horde", thread = { id = "ashenvale_axes", notBeat = "b1_mastok" } },
      text = "Forty wagons of timber left this post last month, and beside them in my ledger I wrote eleven names, peons and grunts the Sentinels took off the road. Orgrimmar counts the wagons, so somebody had better count the names.",
      fx = { thread = { id = "ashenvale_axes", beat = "b1_mastok", state = "stirring" }, learn = { "warsong" } },
    },
    {
      id = "b2_kuraybin", npc = "kuraybin",
      when = { faction = "Horde", thread = { id = "ashenvale_axes", beat = "b1_mastok" },
               ["not"] = { thread = { id = "ashenvale_axes", beat = "b2_kuraybin" } } },
      text = "Mastok been showing you his names, mon? I bet da elves keep a list too, just as long, because every arrow dey put in a wagon be some elf who couldn't stand to hear one more tree come down.",
      fx = { thread = { id = "ashenvale_axes", beat = "b2_kuraybin", state = "unfolding" }, learn = { "sentinels" } },
    },
    {
      id = "b3_thrall", npc = "thrall",
      when = { faction = "Horde", any = { { thread = { id = "ashenvale_axes", beat = "b1_mastok" } }, { thread = { id = "ashenvale_axes", beat = "b2_kuraybin" } } },
               ["not"] = { thread = { id = "ashenvale_axes", beat = "b3_thrall" } } },
      text = "You've come from Splintertree, so you'll have seen Mastok's ledger. He sends it to me with the names of the dead written beside the wagons, and I read every one, because if I ask the Warsong to bleed for Orgrimmar's walls, I should at least know what the walls cost.",
      fx = { thread = { id = "ashenvale_axes", beat = "b3_thrall", state = "resolved" } },
    },
    -- Alliance: Astranaar to Darnassus.
    {
      id = "b4_raene", npc = "raene",
      when = { faction = "Alliance", thread = { id = "ashenvale_axes", notBeat = "b4_raene" } },
      text = "Be still a moment and you can hear them from here, the Warsong saws east of the lake, from first light until dark. Every tree they fell was older than Astranaar, and they cut it for the walls of a city that wasn't there a few years ago.",
      fx = { thread = { id = "ashenvale_axes", beat = "b4_raene", state = "stirring" }, learn = { "warsong" } },
    },
    {
      id = "b5_shindrell", npc = "shindrell",
      when = { faction = "Alliance", thread = { id = "ashenvale_axes", beat = "b4_raene" },
               ["not"] = { thread = { id = "ashenvale_axes", beat = "b5_shindrell" } } },
      text = "Raene would burn every camp from here to the Barrens if I let her, and I understand why. But Theramore keeps reminding us the peace with the orcs is fragile, so I send my Sentinels against the wagons and not the towns, and I hate the arithmetic of it.",
      fx = { thread = { id = "ashenvale_axes", beat = "b5_shindrell", state = "unfolding" }, learn = { "sentinels" } },
    },
    {
      id = "b6_tyrande", npc = "tyrande",
      when = { faction = "Alliance", any = { { thread = { id = "ashenvale_axes", beat = "b4_raene" } }, { thread = { id = "ashenvale_axes", beat = "b5_shindrell" } } },
               ["not"] = { thread = { id = "ashenvale_axes", beat = "b6_tyrande" } } },
      text = "You have walked the roads around Astranaar, so you have heard the saws, and Shindrell's reports reach me with the names of every Sentinel we lose. I could send every glaive in Darnassus east tomorrow, and I have not, because I remember orcs who stood with us on Hyjal; do not mistake that memory for forgiveness.",
      fx = { thread = { id = "ashenvale_axes", beat = "b6_tyrande", state = "resolved" } },
    },
  },
}

-- The eye on the docks. After the Bloodsail chain, Seahorn knows the letters named the
-- Raiders' sailing days (his own line, bs_plan); Crazz keeps a list of three suspects;
-- Lozgil's fishmonger ran; Ian Strom nods each evening to a Bloodsail man in the tavern. The
-- player decides whether Seahorn hears the name (Seahorn's "eye" node, booty_bay.lua).
-- Neutral; never contradicts the chain (Firallon, Keelhaul and Stillwater still go down).
P:Thread {
  id = "bloodsail_eye",
  theme = "Somebody in Booty Bay tells the Bloodsail when the Blackwater ships sail.",
  title = "The eye on the docks",
  story = {   -- the journal's Stories page, by state
    stirring = { first = "Somebody in Booty Bay tells the Bloodsail Buccaneers when the Blackwater ships sail. Crazz has a list of suspects, Lozgil has a fishmonger who ran off owing rent, and nobody has a name.",
      third = "{name} learned that someone in Booty Bay was telling the Bloodsail when the Blackwater ships sailed." },
    unfolding = { first = "The fishmonger was one Bloodsail eye, but not the only one. Ian Strom nods every evening to the other, a dishwasher at Skindle's who reads every notice the Raiders pin up, and the Baron would rather leave him there.",
      third = "{name} learned from Ian Strom that the Bloodsail's other eye in Booty Bay washed cups behind Skindle's bar." },
    resolved = { first = "I gave Seahorn the dishwasher's name. He went out on the morning boat to Ratchet with his wages and a warning, and the Blackwater sail on their own days again.",
      third = "{name} gave Fleet Master Seahorn the name of the Bloodsail spy, and the man was put on the morning boat to Ratchet." },
    soured = { first = "I kept the dishwasher's name from Seahorn and left it with the Baron. The Baron's game goes on, and the Bloodsail still know when the Blackwater sail.",
      third = "{name} kept the Bloodsail spy's name from Fleet Master Seahorn, and the Baron's game went on." },
  },
  npcs = { "crazz", "lozgil", "ianstrom", "revilgaz", "seahorn" },
  states = { "dormant", "stirring", "unfolding", "resolved", "soured" },
  endings = {
    resolved = "The player gave Seahorn the dishwasher's name, and the spy was sent off on the morning boat to Ratchet.",
    soured = "The player kept the name from Seahorn and left it with the Baron, and the Bloodsail still know the sailing days.",
  },
  pacing = { minConversations = 2, minSeconds = 600 },
  reflection = {
    first = "Everyone on the Booty Bay docks knows there's a Bloodsail eye among them, and everyone has a different idea of what to do about it.",
    third = "{name} found that everyone on the Booty Bay docks knew of the Bloodsail eye among them, and nobody agreed what to do about it.",
  },
  beats = {
    {
      id = "b1_crazz", npc = "crazz",
      when = { minLevel = 30, thread = { id = "bloodsail_eye", notBeat = "b1_crazz" } },
      text = "Two of our ships went out this month, pal, and the Bloodsail met both of them off the Cape like somebody'd posted them our sailing days. Somebody in this town keeps a red bandana in his pocket, and I mean to find out whose pocket before it costs me a third hull.",
      fx = { thread = { id = "bloodsail_eye", beat = "b1_crazz", state = "stirring" }, learn = { "bloodsail" } },
    },
    {
      id = "b2_lozgil", npc = "lozgil",
      when = { minLevel = 30, thread = { id = "bloodsail_eye", notBeat = "b2_lozgil" } },
      text = "That fishmonger who ran off owing me two months' rent? I went through his stall to price the nets, pal, and there wasn't a single hook in it, only a stack of tide tables with the Raiders' sailing days pencilled in the margins.",
      fx = { thread = { id = "bloodsail_eye", beat = "b2_lozgil", state = "stirring" }, learn = { "bloodsail" } },
    },
    {
      id = "b3_ianstrom", npc = "ianstrom",
      when = { any = { { thread = { id = "bloodsail_eye", beat = "b1_crazz" } }, { thread = { id = "bloodsail_eye", beat = "b2_lozgil" } } },
               ["not"] = { thread = { id = "bloodsail_eye", beat = "b3_ianstrom" } } },
      text = "The fishmonger ran, but the Bloodsail never keep only one man in a port. The other dries cups behind Skindle's bar and reads every notice the Raiders pin up, and I won't take his name to Seahorn myself, because a trainer who sells his neighbours soon runs out of them, but you're free to.",
      fx = { thread = { id = "bloodsail_eye", beat = "b3_ianstrom", state = "unfolding" } },
    },
    {
      id = "b4_revilgaz", npc = "revilgaz",
      when = { thread = { id = "bloodsail_eye", beat = "b3_ianstrom" }, ["not"] = { thread = { id = "bloodsail_eye", beat = "b4_revilgaz" } } },
      text = "Krazek tells me you've been asking after a dishwasher who can read. A Bloodsail ear I know about is an ear I can whisper into, friend, and a new one would be an expense I haven't budgeted for, so think hard before you carry it up to Seahorn.",
      fx = { thread = { id = "bloodsail_eye", beat = "b4_revilgaz" } },
    },
  },
}
