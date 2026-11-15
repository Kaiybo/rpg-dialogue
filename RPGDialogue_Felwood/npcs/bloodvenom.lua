-- Bloodvenom Post: the Horde's only fire in Felwood, on the cliffs over the poisoned river. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "winna", id = TODO_NPC("Winna Hazzard"), name = "Winna Hazzard",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "bloodvenom_post" }, temper = { "manic" }, values = { "curious", "mischievous" },
  notices = { "race", "pet" },

  greetings = {
    { id = "g_laugh", text = "*cackles* Oh, a visitor! Mind the kitten, and mind the bottles, and mind everything, really." },
    { id = "g_back", when = { metBefore = true }, text = "*laughs* You came back, and nobody comes back! That's my favourite kind of person." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of us! Isn't it wonderful, not needing to breathe in a place like this? *cackles* The tauren all cough." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Ooh, a pet! My kitten wants to meet it, but my kitten wants to meet everything, so keep them apart, I think." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Winna Hazzard! Alchemist, of a sort, and keeper of one kitten. Felwood is the most interesting place I've ever been. Everything in it is wrong in some new way. *cackles*" },
        { id = "h_strange", tags = { "news" }, when = { questActive = TODO_QUEST("A Strange One") },
          text = "There's something odd out in the trees for you, odder than usual, and odd is my favourite!" },
        { id = "h_well", when = { questActive = TODO_QUEST("Well of Corruption") },
          text = "The wells out there have gone bad, so bring me some of what's in them, and don't drink it! *laughs* Well, don't drink much." },
        { id = "h_sabers", when = { questActive = TODO_QUEST("Corrupted Sabers") },
          text = "The sabercats here are sick through, the cubs too, but even kittens can be saved, sometimes... sometimes!" },
      },
      choices = {
        { text = "What's the kitten's name?", next = "kitten" },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },
    kitten = {
      lines = {
        { id = "k_default", text = "Name? It doesn't need a name. It knows who it is. *cackles* Which is more than most of the people at this post can say." },
      },
      choices = { { text = "Fair enough.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea! *laughs* Isn't that exciting?" } },
  },
}

P:NPC {
  key = "trull", id = TODO_NPC("Trull Failbane"), name = "Trull Failbane",
  bible = "bibles/felwood.md", role = "soldier", tier = "quest",
  communities = { "bloodvenom_post" }, temper = { "grim" }, values = { "loyal", "practical" },
  notices = { "kit" },

  greetings = {
    { id = "g_post", text = "Did Orgrimmar send you, or did you wander up here by mistake? Either way, you're useful now." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The forest had you for lunch, so get fixed up before it comes back for supper." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Trull Failbane. Orgrimmar wants eyes in Felwood, and these are them; this forest hides a great deal, and I'm paid to find out what." },
        { id = "h_guardians", tags = { "news" }, when = { questActive = TODO_QUEST("Wild Guardians") },
          text = "Back with word? Good, then sit and tell me everything, slowly, because I'll know if you skip a part." },
        { id = "h_secrets", when = { questActive = TODO_QUEST("Guarding Secrets") },
          text = "Some things in this forest are guarded for a reason, and I want to know the reason; then I'll decide if the guards were right." },
        { id = "h_winna", when = { heardLine = "winna.h_default" },
          text = "You've met the alchemist, then. Don't ask me about her, because I don't know what she's doing either, and nobody does; she laughs when you ask." },
      },
      choices = { { text = "I'll be your eyes too.", next = "END", fx = { affinity = 1, standing = { bloodvenom_post = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "The druids south of here are honest, as far as I can tell. That's rare enough to report." } },
    _none = { { id = "tp_none", text = "Not in my reports." } },
  },
}
