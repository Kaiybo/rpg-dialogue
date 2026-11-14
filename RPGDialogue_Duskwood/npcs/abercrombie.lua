-- Abercrombie, the hermit of Raven Hill. Voice: bibles/abercrombie.md
-- Canon secret: he is building Stitches. He is kind, grateful, slightly too interested in
-- your health, and never says what the supplies are for until the note is read.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "abercrombie", id = TODO_NPC("Abercrombie"), name = "Abercrombie",
  bible = "bibles/abercrombie.md", role = "questgiver", tier = "quest",
  communities = { "raven_hill" }, temper = { "steady" }, values = { "kind", "curious" },
  notices = { "body", "craft" },

  greetings = {
    { id = "g_hermit", text = "A visitor! How lovely. I don't get many. Living ones." },
    { id = "g_supplies", when = { questActive = TODO_QUEST("Supplies from Darkshire") }, text = "Back from Darkshire already? No? Everyone's so slow. I'm not. Not anymore." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Embalmer's Revenge") }, text = "Oh, hello again. Busy week. Busy week for everyone, I hear." },
  },

  notice = {
    { id = "n_big", cat = "body", when = { class = "WARRIOR" },
      text = "My, what a frame you have. Good broad shoulders. Sturdy. I do admire a well-made body. Professionally. I was an alchemist." },
    { id = "n_alchemy", cat = "craft", when = { profession = "Alchemy" },
      text = "A fellow alchemist! Oh, we must talk sometime. Preservation, mostly. It's a hobby. A small hobby. Getting bigger." },
    { id = "n_hurt", cat = "body", when = { durability = { max = 0.25 } },
      text = "You're in pieces, dear. Do be careful out there. It would be such a waste." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Abercrombie. I keep to myself up here. My wife and I lived in Raven Hill once. I stay close to her. It's what she'd want." },
        { id = "h_hermit", when = { questActive = TODO_QUEST("The Hermit") },
          text = "Someone sent you to check on me? How thoughtful. I'm perfectly well. I'm working on something. It's coming along." },
        { id = "h_thread", when = { questActive = TODO_QUEST("Deliver the Thread") },
          text = "Thread! Strong thread. You can't have too much strong thread. Things come apart otherwise." },
        { id = "h_juice", when = { questActive = TODO_QUEST("Zombie Juice") },
          text = "Smitts brews it for me. A little pick-me-up. Don't drink it yourself, mind. It's not for the living." },
        { id = "h_effigy", when = { questActive = TODO_QUEST("Ghoulish Effigy") },
          text = "Ghoul ribs. Not the cracked ones. I need them whole. Big ones, if you can." },
        { id = "h_note", tags = { "news" }, when = { questActive = TODO_QUEST("Note to the Mayor") },
          text = "Take this to the mayor, would you? It's a note. Just a note. I'd rather not watch you read it." },
        { id = "h_eliza", when = { questDone = TODO_QUEST("The Embalmer's Revenge") },
          text = "Eliza's resting. Don't go near the graves. She doesn't like visitors. She's, well. Particular about her diet." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "My, so slender. Your people are built for the wind, aren't they? Light bones. Wonderful. Professionally speaking." },
      },
      choices = {
        { text = "What are you working on?", next = "work" },
        { text = "Tell me about your wife.", next = "wife" },
        { text = "Goodbye, Abercrombie.", next = "END" },
      },
    },
    work = {
      lines = {
        { id = "w_default", text = "A surprise. For Darkshire. They've been so unkind about my hobbies. I want to show them what I can make." },
        { id = "w_after", when = { questDone = TODO_QUEST("The Embalmer's Revenge") },
          text = "Nothing. Nothing at all. A garden, perhaps. Something that stays where it's put." },
      },
      choices = {
        { text = "I'm sure they'll love it.", next = "END", fx = { affinity = 1 } },
        { text = "Something about this feels wrong.", next = "wrong", fx = { trait = { skeptical = 1 } } },
      },
    },
    wrong = {
      lines = { { id = "wr_default", text = "Wrong? No, dear. Unfinished. People always confuse the two." } },
      choices = { { text = "...", next = "END" } },
    },
    wife = {
      big = true,
      lines = {
        { id = "wf_default", text = "Eliza. Kind, clever, beautiful, and then gone. I couldn't bear it. So I didn't. Let's leave it there." },
      },
      choices = {
        { text = "I'm sorry for your loss.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What do you mean, you didn't?", next = "didnt", fx = { trait = { curious = 1 } } },
      },
    },
    didnt = {
      lines = { { id = "d_default", text = "Grief, dear. I didn't bear the grief. I'm a hermit. We're allowed to be strange about it." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    night_watch = { { id = "tp_watch", text = "Brave souls. Fragile, though. So very fragile." } },
    worgen = { { id = "tp_worgen", text = "They don't bother me. I'm not much of a meal. Not anymore." } },
    stalvan = { { id = "tp_stalvan", text = "Old Mistmantle? Before my time up here. Shame. I'd have liked to meet him." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know. I'm out of touch. Pleasantly out of touch." } },
  },
}
