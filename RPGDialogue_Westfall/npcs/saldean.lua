-- Farmer Saldean, Saldean's Farm. Voice: bibles/saldean.md
-- Stayed when the others left. Now scarecrows walk his fields.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "saldean", id = TODO_NPC("Farmer Saldean"), name = "Farmer Saldean",
  bible = "bibles/saldean.md", role = "farmer", tier = "quest",
  communities = { "westfall_farms" }, temper = { "proud" }, values = { "stern", "honest" },
  notices = { "work", "kit" },

  greetings = {
    { id = "g_fields", text = "Step careful. The furrows are all I've got left that's straight." },
    { id = "g_watchers", when = { questActive = TODO_QUEST("The Killing Fields") }, text = "Still standing out there, aren't they. I can see them from the porch." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Killing Fields") }, text = "Walked my own field this morning. First time since spring." },
  },

  notice = {
    { id = "n_farmer", cat = "work", when = { profession = { "Herbalism", "Skinning" } },
      text = "You've dirt under your nails. Honest dirt. I can always tell a body that works with their hands." },
    { id = "n_hay", cat = "kit", when = { questObjective = { TODO_QUEST("The Killing Fields"), left = { max = 5 } } },
      text = "You've straw all down your front. Good. That means they're coming apart." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Saldean. This is my farm. The thieves ran the neighbours off, and I'm still here. Make of that what you like." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Killing Fields") },
          text = "Those scarecrows in my field. Harvest watchers. They walk. They swing. They don't belong to me, and they won't leave." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Killing Fields") },
          text = "Start with mine. If you've arms left, clear the neighbours' too. Somebody might come back for them." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Killing Fields"), days = 3 } },
          text = "Straw and sticks all over the south field. Salma says it looks like a harvest festival gone wrong. I say it's the best it's looked in a year." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Killing Fields"), days = 14 } },
          text = "Turned the soil on the south field. Might be a crop yet. Might be." },
        { id = "h_salma", when = { heardLine = "salma.h_default" },
          text = "Salma's been feeding you, then. She feeds everyone. I married the softest heart in Westfall and I'll not hear a word against it." },
        { id = "h_soil", when = { metBefore = true }, text = "Soil's tired. So am I. We'll both get up tomorrow anyway. That's farming." },
      },
      choices = {
        { text = "Why did you stay?", next = "stay" },
        { text = "Where did the watchers come from?", next = "watchers" },
        { text = "Good luck with the harvest.", next = "END" },
      },
    },
    stay = {
      big = true,
      lines = {
        { id = "s_default", text = "My grandfather cleared this land. I'm not handing it to a man in a red mask because he asked with a knife." },
      },
      choices = {
        { text = "Good for you.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Pride won't stop a knife.", next = "pride", fx = { trait = { skeptical = 1 } } },
      },
    },
    pride = {
      lines = { { id = "p_default", text = "No. But it gets me up in the morning, and that's something a knife can't take." } },
      choices = { { text = "Fair enough.", next = "END" } },
    },
    watchers = {
      lines = {
        { id = "w_default", text = "Don't know, and I've stopped guessing. One day the fields were empty, next day they were full of things that wouldn't stay put." },
      },
      choices = { { text = "I'll deal with them.", next = "END", fx = { learn = { "harvest_watchers" }, affinity = 1 } } },
    },
  },

  topics = {
    harvest_watchers = {
      { id = "tp_watchers", text = "Twenty in my field alone, last I counted. I stopped counting." },
    },
    defias = { { id = "tp_defias", text = "Thieves. They took the Furlbrows' farm and the Molsens'. They'll not take mine." } },
    westfall = { { id = "tp_westfall", text = "Best soil in the kingdom, under all that dust. People forget." } },
    old_blanchy = { { id = "tp_blanchy", text = "The Furlbrows' horse. Older than sin and twice as stubborn. Good animal." } },
    _none = { { id = "tp_none", text = "Can't help you there. Ask me about soil." } },
  },
}
