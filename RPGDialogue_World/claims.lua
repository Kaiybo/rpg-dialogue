-- NPC claims: what people say, and whether it's true. The truth behind a lie is canon
-- or deliberately left open (DESIGN.md / CONTENT_GUIDE.md).
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Claim {
  id = "defias_common_thieves", by = "dughan", truth = "partly",
  text = "The Defias are common thieves and nothing more.",
  truthNote = "They do rob, but they are an organized brotherhood with leadership (canon). Dughan plays it down to keep Goldshire calm.",
  exposedBy = { "mcbride.e_dughan_thieves", "quest:The Collector", "quest:Manhunt" },
}

P:Claim {
  id = "defias_trained", by = "mcbride", truth = "true",
  text = "Someone is training the Defias.",
  truthNote = "The Brotherhood is organized under its leaders (canon). McBride doesn't know who.",
}

P:Claim {
  id = "murlocs_in_elwynn", by = "remy", truth = "true",
  text = "Murlocs are moving up the rivers into eastern Elwynn.",
  truthNote = "Confirmed by the Further Concerns chain (lost guards, Rolf's fate).",
  exposedBy = { "quest:Further Concerns" },
}

P:Claim {
  id = "remy_only_buyer", by = "remy", truth = "false",
  text = "Nobody in Elwynn buys gold dust but Remy.",
  truthNote = "The Collector receives gold shipments from Elwynn's mines (The Collector quest).",
  exposedBy = { "quest:The Collector" },
}

P:Claim {
  id = "hogger_unbeatable", by = "farley", truth = "false",
  text = "Hogger can't be killed; every hunter who tried came back on a cart.",
  truthNote = "Inn talk. Hogger can be killed (the bounty).",
  exposedBy = { "quest:WANTED: \"Hogger\"" },
}
