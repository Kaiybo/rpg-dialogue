RPGDialogueAPI:RegisterPack { id = "test.extra", name = "Extra", format = 1, priority = 5 }
local P = RPGDialogueAPI:Pack("test.extra")
P:NPC {
  key = "mcbride", name = "Marshal McBride",
  greetings = { { id = "g_extra", text = "From the extra pack." } },
}
