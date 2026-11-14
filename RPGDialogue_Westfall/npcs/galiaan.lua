-- Scout Galiaan, Sentinel Hill. Voice: bibles/galiaan.md
-- Tracks a front that won't stay still, by the colour of its bandanas.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "galiaan", id = TODO_NPC("Scout Galiaan"), name = "Scout Galiaan",
  bible = "bibles/galiaan.md", role = "questgiver", tier = "quest",
  communities = { "sentinel_hill" }, temper = { "sharp" }, values = { "curious", "lawful" },
  notices = { "stealth", "red" },

  greetings = {
    { id = "g_map", text = "Don't stand on the map." },
    { id = "g_bandanas", when = { questActive = TODO_QUEST("Red Leather Bandanas") }, text = "Bandanas? Count them out. Every one's a pin on my map." },
    { id = "g_after", when = { questDone = TODO_QUEST("Red Leather Bandanas") }, text = "My map's half red now. That's your doing. It's a good red." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Not bad. You'd fool a farmer. You won't fool a Defias lookout; they're paid to be paranoid. Again, slower." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You move like you've been taught to. Who by, I'll not ask. Not today." },
    { id = "n_red", cat = "red", when = { questObjective = { TODO_QUEST("Red Leather Bandanas"), left = { max = 3 } } },
      text = "Nearly a full count. You've got red on your gloves. Theirs, I hope." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "I saw that. Keep practising." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Galiaan, scout. The Defias front moves every few days. I move with it, and I write down where it's been." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Red Leather Bandanas") },
          text = "They wear red leather on their faces. Proud of it. That pride's how I track them. Bring me their bandanas and I'll tell you where they were." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Red Leather Bandanas") },
          text = "Fifteen. Mark where you took each one if you can; even a rough guess helps the map." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Red Leather Bandanas"), days = 3 } },
          text = "There's a pattern. They pull back toward Moonbrook every time we push. Gryan will want to hear that." },
        { id = "h_willem", when = { heardLine = "willem.t_default" },
          text = "Red bandanas in Northshire's vineyards too? Then they've spread further east than my map says. I'll need more pins." },
      },
      choices = {
        { text = "Show me your map.", next = "map" },
        { text = "Good hunting, scout.", next = "END" },
      },
    },
    map = {
      lines = {
        { id = "m_default", text = "Pins for camps. Thread for their roads. The thread all runs one way, see? South. Moonbrook." },
      },
      choices = {
        { text = "Then that's where it ends.", next = "END", fx = { learn = { "moonbrook" }, trait = { brave = 1 } } },
        { text = "Or where they want you to look.", next = "look", fx = { trait = { skeptical = 1 }, affinity = 1 } },
      },
    },
    look = {
      lines = { { id = "l_default", text = "Hm. That's the first clever thing anyone's said to me this week. I'll check the coast." } },
      choices = { { text = "Glad to help.", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Red bandanas, good boots, better discipline than they've any right to." } },
    moonbrook = { { id = "tp_moonbrook", text = "Every road on my map ends there. That's not a coincidence." } },
    harvest_watchers = { { id = "tp_watchers", text = "They don't move like gnolls or men. I don't map them. I avoid them." } },
    _none = { { id = "tp_none", text = "Not on my map. Not my business." } },
  },
}
