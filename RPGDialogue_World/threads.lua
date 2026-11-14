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
