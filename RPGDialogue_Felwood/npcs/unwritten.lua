-- Felwood folk with no conversation until now: Altsoba Ragetotem, weaponsmith of Bloodvenom Post.
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Altsoba Ragetotem
---------------------------------------------------------------------------
P:NPC {
  key = "fw_altsoba", id = TODO_NPC("Altsoba Ragetotem"), name = "Altsoba Ragetotem",
  role = "vendor", tier = "service", race = "Tauren",
  communities = { "bloodvenom_post" }, temper = { "grim", "steady" }, values = { "craft", "strength" },
  impression = {
    first = "A tauren weaponsmith who keeps his blades oiled against Felwood's rot.",
    third = "{name} met Altsoba Ragetotem, the tauren who sells weapons at Bloodvenom Post in Felwood.",
  },
  greetings = {
    { id = "g_default", text = "Hm. You'll want a weapon, coming through Felwood. Everyone does, sooner or later." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "One of the shu'halo, here in this sick place. The Earth Mother guard you, for this land will not." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Altsoba of the Ragetotem. I sell weapons to those who pass through Bloodvenom Post, and I keep them sharp, because in Felwood a dull blade is a death sentence." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Speak. I am listening, though my hands are busy." },
      },
      choices = {
        { text = "What makes Felwood so dangerous?", next = "danger" },
        { text = "The Ragetotem? I don't know that tribe.", next = "tribe" },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Farewell, Altsoba.", next = "END" },
      },
    },
    danger = {
      lines = { { id = "da_default", text = "Demons poisoned this forest long ago, and the poison never left. The furbolgs went mad from it, the satyrs thrive in it, and the river runs green with it." } },
      choices = {
        { text = "Can it ever be healed?", next = "danger2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger2 = {
      lines = { { id = "d2_default", text = "The druids of the Emerald Circle say so. Winna Hazzard says she'd rather study it. I say keep your weapon close until someone decides." } },
      choices = {
        { text = "Then the forest must be cleansed, whatever it takes.", next = "BACK", reply = "Bold words. Felwood has eaten bolder.", fx = { align = { light = 1 } } },
        { text = "Some poisons are worth understanding, not destroying.", next = "BACK", reply = "Say that to Winna. She'll love you for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe = {
      lines = { { id = "tr_default", text = "We are warriors, mostly, and few in number. My tribe taught me that a weapon is a promise you make to yourself, so I make my promises well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
