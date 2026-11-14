-- Smith Argus, Journeyman Blacksmith, Goldshire. Voice: bibles/argus.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "argus", id = TODO_NPC("Smith Argus"), name = "Smith Argus", title = "Journeyman Blacksmith",
  bible = "bibles/argus.md", role = "blacksmith", tier = "service",
  communities = { "goldshire" }, temper = { "proud" },
  notices = { "kit", "craft" },

  greetings = {
    { id = "g_anvil", text = "Careful. Anvil's still hot." },
    { id = "g_begging", when = { durability = { max = 0.35 } }, text = "That armor's begging. I can hear it from here." },
    { id = "g_smith", when = { profession = "Blacksmithing" }, text = "Come to see how it's done?" },
  },

  notice = {
    { id = "n_broken", cat = "kit", place = "before", when = { durability = { max = 0.2 } },
      text = "Don't say a word. Take that off and let me look. Light's sake, what did you wrestle?" },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "No armor at all. That's either brave or foolish, and I've seen how both end." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Smith's hands. Calloused in the right places. Who taught you?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Argus. I mend what's bent and make what's needed. I don't do miracles." },
        { id = "q_elmore", when = { questActive = TODO_QUEST("Elmore's Task") },
          text = "Take that to Elmore in Stormwind. He trained me and still thinks he's better. He is, mostly." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Go on, say it. Every dwarf who walks past my forge says it." },
      },
      choices = {
        { text = "Let's see what you have.", next = "BUSINESS" },
        { text = "What makes good steel?", next = "steel" },
        { text = "Just looking.", next = "END" },
      },
    },
    steel = {
      lines = { { id = "s_default", text = "Patience. Clean ore. And never letting the apprentice near the quench." } },
      choices = {
        { text = "I'll remember that.", next = "END", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Sounds slow.", next = "END", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    defias = { { id = "t_defias", text = "They don't buy steel, they take it. Somebody's arming them, and it isn't me." } },
    kobolds = { { id = "t_kobolds", text = "Kobold picks are terrible steel. I melt them down for nails." } },
    _none = { { id = "t_none", text = "Ask me about iron and I'll talk all day. That, I couldn't say." } },
  },
}
