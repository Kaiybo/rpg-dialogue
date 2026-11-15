-- Citizens: the people in the streets with no title and no file of their own (0.35.0).
-- Any friendly person the game gives no other role is a "citizen" (Conv.DetectRole), so
-- right-clicking them opens the box with these lines. Town pools (community = ...) score
-- above the faction ones, which score above the plain one.
local P = RPGDialogueAPI:Pack("rpgd.world")

P:Pool {
  id = "citizen_any", role = "citizen",
  greetings = {
    { id = "g1", text = "Hm? Oh, hello. Can I help you with something?" },
    { id = "g2", when = { timesTalked = { min = 1 } }, text = "You again. I don't mind, mind you; it's nice to be asked." },
  },
  lines = {
    { id = "l1", text = "I'm only going about my day, the same as everyone. Nothing much to tell, I'm afraid." },
    { id = "l2", text = "If you're looking for someone important, I'm not them, but I'm happy to point the way." },
  },
  choices = { { text = "Sorry to bother you.", next = "END" } },
}
