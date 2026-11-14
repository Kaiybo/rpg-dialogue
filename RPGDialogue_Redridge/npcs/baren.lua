-- Dockmaster Baren, Lakeshire docks. Voice: bibles/baren.md
-- The murlocs are out-fishing his fishermen.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baren", id = TODO_NPC("Dockmaster Baren"), name = "Dockmaster Baren",
  bible = "bibles/baren.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "steady" }, values = { "honest", "witty" },
  notices = { "craft", "swim" },

  greetings = {
    { id = "g_dock", text = "Mind the planks. Third one's loose. Fourth one too, now I think of it." },
    { id = "g_fins", when = { questActive = TODO_QUEST("Murloc Poachers") }, text = "Fins? Bring me fins. Every fin's a fish saved." },
    { id = "g_after", when = { questDone = TODO_QUEST("Murloc Poachers") }, text = "Nets came up full this morning. Full! Thought I'd forgotten what that looked like." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "A fisher! Then you'll understand. Lake Everstill was the best water in the kingdom. Now it's the best water in the kingdom for murlocs." },
    { id = "n_wet", cat = "swim", when = { questObjective = { TODO_QUEST("Murloc Poachers"), left = { max = 3 } } },
      text = "You smell like the east shore. That's a compliment, out here. It means you've been working." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Baren. Dockmaster. I count the boats out and count them back. These days I count murlocs too, and there are more of them." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Murloc Poachers") },
          text = "They've packed the shore in bigger groups than I've ever seen, fishing like they're paid for it. At this rate there won't be a fish left in the lake." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Murloc Poachers") },
          text = "East camp's the worst. Bring me their fins. Proof, and a warning to the rest." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Murloc Poachers"), days = 3 } },
          text = "The east shore's quiet. The fish don't know what to do with themselves." },
        { id = "h_daniels", when = { heardLine = "daniels.h_default" },
          text = "Daniels told you his troubles? He's dry, I'm empty. Lakeshire's a lovely place for a holiday." },
        { id = "h_boats", when = { metBefore = true }, text = "Counted the boats this morning. All there. Counted the nets. All there. Something's about to go wrong, I can feel it." },
      },
      choices = {
        { text = "Is the lake really that bad?", next = "lake" },
        { text = "I'll leave you to your boats.", next = "END" },
      },
    },
    lake = {
      lines = {
        { id = "l_default", text = "Murlocs in the shallows, orcs on the far shore, and the fishermen tell stories about something big in the deep. I don't believe them. I don't swim out far, either." },
      },
      choices = { { text = "Something big?", next = "big" } },
    },
    big = {
      lines = { { id = "b_default", text = "Every lake has a monster if you drink enough. Lake Everstill has a lot of drinkers." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    murlocs_east = { { id = "tp_murlocs", text = "Elwynn's got them too? They must be breeding in the rivers. Lovely." } },
    blackrock = { { id = "tp_blackrock", text = "They don't fish. That's the only good thing I can say about them." } },
    everstill_bridge = { { id = "tp_bridge", text = "Until it's done, I'm the bridge. Every guard crosses on my boats. I should charge." } },
    _none = { { id = "tp_none", text = "Fish, boats, weather. Ask me any of those. Not that." } },
  },
}
