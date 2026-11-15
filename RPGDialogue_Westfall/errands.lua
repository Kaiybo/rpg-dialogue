-- Addon-side errands: verifiable by the addon, rewarded only with things the addon owns.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_QUEST = P.TODO_QUEST

P:Errand {
  id = "verna_old_farm", npc = "verna",
  when = { questDone = TODO_QUEST("Poor Old Blanchy") },
  offerChoice = "Is there anything else?",
  offer = "Would you look in on our old farm up north, Furlbrow's Pumpkin Farm, and tell me whether the house is still standing? Only don't go near anyone in red, dear.",
  need = { visit = "Furlbrow's Pumpkin Farm" },
  doneChoice = "I've been to your old farm.",
  thanks = "Still standing? Then there's something to go home to. Don't tell Theodore just yet, though; I want to see his face when I do.",
  reward = { affinity = 2, standing = { westfall_farms = 3 } },
  journal = { first = "Looked in on the Furlbrows' old pumpkin farm for Verna. The house still stands.",
              third = "{name} looked in on the Furlbrows' old farm for Verna." },
}
