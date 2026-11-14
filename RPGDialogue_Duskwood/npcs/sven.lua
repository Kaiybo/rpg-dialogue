-- Sven Yorgen, his camp by the Hushed Bank. Voice: bibles/sven.md
-- Remembers the forest green. Lost his family to riders in black. Wants a name.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sven", id = TODO_NPC("Sven Yorgen"), name = "Sven Yorgen",
  bible = "bibles/sven.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "sharp" }, values = { "stern", "honest" },
  notices = { "kit", "grief" },

  greetings = {
    { id = "g_camp", text = "Sit by the fire or move along. I don't care which." },
    { id = "g_figure", when = { questActive = TODO_QUEST("The Shadowy Figure") }, text = "Well? Who was it? Who was at my farm?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Sven's Revenge") }, text = "It's done. I keep waiting to feel something about it." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You're not ready for what's in these woods. Neither was I. Get that armor seen to before you go further." },
    { id = "n_grief", cat = "grief", when = { deaths = { min = 15 } },
      text = "You've been killed a lot. I can see it on you. People who keep coming back get a look. Hollow round the eyes. My wife used to say I had it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Sven Yorgen. I remember when this forest was green. Nobody believes me anymore. That's all right. I barely believe it." },
        { id = "h_farm", when = { questBefore = TODO_QUEST("The Shadowy Figure") },
          text = "I came home and they were gone. My wife. My children. Riders in black, the tracks said. And something watching from the barn." },
        { id = "h_jitters", tags = { "news" }, when = { questDone = TODO_QUEST("Return to Sven") },
          text = "Jitters. A thief who hid in my barn and watched. He brought this on us. Him and his kind. Don't tell me he's sorry." },
        { id = "h_morbent", when = { questActive = TODO_QUEST("Morbent Fel") },
          text = "Morbent Fel. He sits in Forlorn Rowe like a spider. Everything rotten in these woods has a thread running back to someone like him." },
        { id = "h_revenge", tags = { "news" }, when = { questRecent = { TODO_QUEST("Sven's Revenge"), days = 3 } },
          text = "I went back to the farm last night. Sat on the porch. Couldn't go in. Maybe next time." },
        { id = "h_jitters_heard", when = { heardLine = "jitters.s_default" },
          text = "He told you he just watched? He just watched. As if that makes it smaller. It makes it bigger." },
        { id = "h_quiet", when = { metBefore = true }, text = "You came back. Most don't. Sit if you like. I don't talk much. The forest does it for me." },
      },
      choices = {
        { text = "What happened to your family?", next = "family" },
        { text = "What do you want?", next = "want" },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    family = {
      big = true,
      lines = {
        { id = "f_default", text = "They were looking for something. A scythe, something out of Roland's Doom. They tore the farm apart looking, and killed everyone in it." },
      },
      choices = {
        { text = "I'm sorry, Sven.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then we find the riders.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, align = { honor = 1 } } },
      },
    },
    want = {
      lines = { { id = "w_default", text = "A name. Then another. Then whoever's at the top of the list. Then I'll sleep." } },
      choices = {
        { text = "Revenge won't bring them back.", next = "back", fx = { align = { light = 1 } } },
        { text = "I'll help you get it.", next = "END", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    back = {
      lines = { { id = "b_default", text = "No. But it'll stop them taking someone else's. That'll have to do." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "They came after the riders. Or with them. Same night, near enough. I stopped telling them apart." } },
    defias = { { id = "tp_defias", text = "Thieves. One of them hid in my barn. Ask him how brave the Brotherhood is." } },
    stalvan = { { id = "tp_stalvan", text = "The tutor? Before my trouble. Everyone in Duskwood has a murder. That one's Smitts's." } },
    _none = { { id = "tp_none", text = "Don't know. Don't care. Unless it wears black and rides." } },
  },
}
