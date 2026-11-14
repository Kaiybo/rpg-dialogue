-- Brother Neals, Northshire Abbey. Voice: bibles/neals.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "neals", id = TODO_NPC("Brother Neals"), name = "Brother Neals",
  bible = "bibles/neals.md", role = "questgiver", tier = "quest",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "drink", "faith" },

  greetings = {
    { id = "g_light", text = "Light be with you." },
    { id = "g_manifest", when = { questActive = TODO_QUEST("Grape Manifest") }, text = "Ah, the manifest! Hand it here, carefully." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 1 } },
      text = "You've been sampling, I see. Moderation, friend. I say that as someone who has failed at it." },
    { id = "n_priest_gnome", cat = "faith", when = { race = "Gnome", class = "PRIEST" },
      text = "A gnome who follows the Light! I'd heard there were some now. I'd not believed it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "The Abbey's cellars are a quiet comfort. For our guests, naturally." },
        { id = "q_manifest_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Grape Manifest"), days = 2 } },
          text = "Every barrel accounted for. The Light loves a careful tally almost as much as I do." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Do they still make novices copy the old texts by candlelight at the Cathedral, or has Stormwind gone soft?" },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "Brother Sammuel's pupil? Mind he doesn't work you too hard. He forgets that some of us enjoy supper." },
        { id = "h_book", tags = { "news" }, once = true, priority = 15, when = { bookRead = "The Seven Kingdoms" },
          text = "You've read The Seven Kingdoms? Then you know Stromgarde won't let go of what it was. Neither will I, of the Abbey." },
        { id = "h_kind", when = { alignment = { axis = "light", min = 40 } },
          text = "There's a kindness about you. It shows, you know. It always shows." },
        { id = "h_asleep", when = { metBefore = true }, text = "I fell asleep in the library again, friend. Face-down in a book of prayers. The Light, I'm told, found it very funny." },
      },
      choices = {
        { text = "Tell me about the Abbey.", next = "abbey" },
        { text = "Just paying my respects.", next = "END" },
        { text = "About the manifest...", next = "BUSINESS", when = { questActive = TODO_QUEST("Grape Manifest") } },
      },
    },
    abbey = {
      lines = {
        { id = "a_default", key = true,
          text = "Archbishop Faol's clerics trained the first paladins here. The walls remember, even if Stormwind forgets.",
          fx = { learn = { "northshire_abbey" } } },
      },
      choices = {
        { text = "I'd like to see the library sometime.", next = "END", fx = { trait = { curious = 1 }, affinity = 1 } },
        { text = "Old stones. Nothing more.", next = "END", fx = { trait = { skeptical = 1 }, affinity = -1 } },
      },
    },
  },

  topics = {
    northshire_abbey = { { id = "t_abbey", text = "Founded by Archbishop Faol. Older than half the walls in Stormwind, and better kept." } },
    defias = { { id = "t_defias", text = "I pray for them. Then I lock the cellar." } },
    _none = { { id = "t_none", text = "I'd have to look that up, and the library closes at dusk." } },
  },
}
