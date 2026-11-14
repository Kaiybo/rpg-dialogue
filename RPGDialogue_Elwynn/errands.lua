-- Addon-side errands: verifiable by the addon, rewarded only with things the addon owns.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_QUEST = P.TODO_QUEST

P:Errand {
  id = "eagan_echo_wolves", npc = "eagan",
  when = { questDone = TODO_QUEST("Wolves Across the Border") },
  offerChoice = "Anything else you need?",
  offer = "Walk up to Echo Ridge Mine for me. Tell me if the wolves are denning near the mouth. Don't go in. Just look.",
  need = { visit = "Echo Ridge Mine" },
  doneChoice = "I've been to Echo Ridge Mine.",
  thanks = "Kobolds at the mouth, wolves keeping clear? Then they're denning somewhere else. Good to know. I owe you.",
  reward = { affinity = 2, standing = { northshire = 2 } },
  journal = { first = "Walked up to Echo Ridge Mine for Eagan. No wolves at the mouth, only kobolds.",
              third = "{name} scouted Echo Ridge Mine for Eagan Peltskinner." },
}
