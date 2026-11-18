-- Deathstalker Faerleia, waiting in the Pyrewood town hall for the Council. Voice: bibles/faerleia.md
-- Alone in an enemy village, patient as a trap, and sure the Council is the knot that holds Arugal's net.
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "faerleia", id = TODO_NPC("Deathstalker Faerleia"), name = "Deathstalker Faerleia",
  bible = "bibles/faerleia.md", role = "soldier", tier = "quest",
  communities = { "sepulcher" }, temper = { "cool", "sharp" }, values = { "loyal", "cunning" },
  notices = { "stealth", "form" },
  impression = {
    first = "Deathstalker Faerleia waits in the Pyrewood town hall like a drawn knife in a drawer. She is calm, patient and certain that killing the village council will turn Arugal's wolves against him.",
    third = "{name} met Deathstalker Faerleia, who lay in ambush for the Pyrewood Council on Lady Sylvanas's orders.",
  },

  greetings = {
    { id = "g_quiet", text = "Keep your voice down. The Council could walk through that door any moment." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to Pyrewood on purpose. Either you're brave, or you've come to help me finish the job." },
    { id = "g_ready", when = { questActive = TODO_QUEST("Pyrewood Ambush") }, text = "Be ready. They come in waves, and the Lord Mayor always arrives last, as if he were too important to die early." },
    { id = "g_done", when = { questDone = TODO_QUEST("Pyrewood Ambush") }, text = "The Council's chairs are still empty. I like them that way." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and Pyrewood didn't miss you, though I'll admit I did, a little. Lurking alone gets dull." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've sharpened since the ambush. I can tell by how quietly you came up the stairs this time." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word reached the Sepulcher that you lied your way past someone. Good for you, but don't try it on a deathstalker, because we invented it." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I heard you on the third step. Not bad, but the Pyrewood folk have dogs' ears after dark, so do better than not bad." },
    { id = "n_druid", cat = "form", when = { form = { "cat", "bear" } },
      text = "Change back, please. I've spent too many nights watching fur come out of Pyrewood's windows to be easy about it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathstalker Faerleia, on the Dark Lady's business. You've arrived just in time, because the Pyrewood Council will be back soon, Arugal's puppets every one, and I can't take them all by myself." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Pyrewood Ambush") },
          text = "Arugal has better things to do in his keep than mind a village, so he rules Pyrewood through its Council. Cut the Council down, and I think his worgen will turn on him." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Pyrewood Ambush"), days = 3 } },
          text = "You fought like a true disciple of the Dark Lady. With the Council dead, the Sepulcher has a chance to take this town and drive Arugal out of Shadowfang." },
        { id = "h_sfk", tags = { "news" }, when = { cleared = "Shadowfang Keep" },
          text = "Arugal's dead, they're saying at the Sepulcher, and you were there. I'd hoped to do it myself, but I'll settle for having helped you get up the hill." },
        { id = "h_rogue", when = { class = "ROGUE", race = "Scourge" },
          text = "A rogue, and one of the Dark Lady's own. Then you'll understand why I'm sitting in the dark in an enemy town hall and enjoying it." },
      },
      again = {
        { id = "h_again", text = "Quickly. I'm listening for footsteps as well as you." },
        { id = "h_again2", text = "Go on, but keep one ear on the stairs." },
      },
      choices = {
        { text = "Who are the Pyrewood Council?", next = "council" },
        { text = "What does Arugal want with this village?", next = "arugal" },
        { text = "You look like you've been waiting here a long while.", next = "waiting" },
        { text = "Are there other deathstalkers watching Pyrewood?", next = "yorick" },
        { text = "I'm a deathstalker in training too.", next = "rogue", when = { class = "ROGUE", race = "Scourge" } },
        { text = "I'm with you. Let them come.", next = "BUSINESS" },
        { text = "I'll leave you to your ambush.", next = "END" },
      },
    },

    council = {
      lines = { { id = "co_default", text = "Smithers, Thatcher, Hendricks, a few more, and the Lord Mayor, Morrison, who never stops talking. They're Arugal's puppets, and they keep the rest of Pyrewood in line for him." } },
      choices = {
        { text = "I'd guess they're cursed too.", next = "council_curse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_curse = {
      lines = { { id = "cc_default", text = "Every soul in this village is cursed, as far as I can tell, but the Council still think they're in charge of something. Fear does that to people, and they're more afraid of Arugal than they are of us." } },
      choices = {
        { text = "They'll be more afraid of us soon.", next = "council_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_fear = {
      big = true,
      lines = { { id = "cf_default", text = "That's the idea. Some of them were good townsfolk once, I don't doubt, but Lady Sylvanas has no use for a village that howls at the Sepulcher's door every night." } },
      choices = {
        { text = "Then it's a mercy to end it quickly.", next = "BACK", reply = "Quickly, yes, and without speeches. The Dark Lady prefers her mercy brief and her villages empty.", fx = { align = { light = 1 } } },
        { text = "Mercy doesn't come into it. They chose Arugal.", next = "BACK", reply = "They did, every one of them, when they barred their doors to us and opened them to him. I'll waste no tears on Pyrewood.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    arugal = {
      lines = { { id = "ar_default", text = "A Dalaran wizard who called something into Silverpine that he couldn't put back. He calls the worgen his children and sits in Shadowfang Keep, on the hill, while his children do the work." } },
      choices = {
        { text = "Will they really turn on him?", next = "arugal_turn" },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    arugal_turn = {
      lines = { { id = "at_default", text = "Wolves follow whoever holds the leash, and the Council holds it for him here. Take that away and they'll go looking for someone to bite, and I'd like it to be him." } },
      choices = {
        { text = "And if they come for the Sepulcher instead?", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Clever. I like it.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    waiting = {
      lines = { { id = "wa_default", text = "Long enough to know which boards creak and which villagers bolt their shutters early. A deathstalker doesn't get tired, so waiting costs me nothing but patience, and I've plenty of that." } },
      choices = {
        { text = "This place must change after dark.", next = "waiting_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    waiting_dark = {
      lines = { { id = "wd_default", text = "The lamps go out, the doors stay shut, and then the howling starts somewhere inside the houses. I sit very still up here, and so far nobody's thought to look in the town hall." } },
      choices = {
        { text = "That's a brave place to sit.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    yorick = {
      lines = { { id = "yo_default", text = "Rane Yorick watches Pyrewood from the outside, and I watch it from the inside, and between us there isn't much the village does that the Sepulcher doesn't hear. She'll want a report from you too, so don't be stingy with it." } },
      choices = {
        { text = "I'll tell her what I see.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rogue = {
      lines = { { id = "rg_default", text = "Then here's your lesson for the night: the best place to hide is the one your enemy thinks is theirs. They walk in tired and careless, and you're already standing behind the door." } },
      choices = {
        { text = "I'll remember it.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I serve the Dark Lady and I stand in dark rooms. That's all of my story that's useful to you." } },
    advice = { { id = "tp_ad", text = "Learn where the floor creaks before you need to know, because finding out during a fight is too late." } },
    worgen = { { id = "tp_worgen", text = "They come out of Pyrewood's windows at night and go back in at dawn. Draw your own conclusions; mine are already drawn." } },
    shadowfang = { { id = "tp_shadowfang", text = "Arugal sits in Shadowfang Keep and calls the worgen his children, and Pyrewood pays for his madness every night. Cut the strings in the village, and the keep will start to shake." } },
    gilneas = { { id = "tp_gilneas", text = "The Gilneans walled themselves off from Lordaeron before the plague ever came, and they let us all die on the other side. Some of their wall's shadow still falls on Pyrewood." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages squat in Ambermill as though Silverpine were theirs to take. They're rebuilding their city behind its shields, and now they want the forest around it as well." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady sends her Deathstalkers where others won't go, and I go where I'm sent. That's the whole of it." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken can wait in a dark room for days without growing bored or restless. It's the one trick the living can never learn." } },
    _none = { { id = "tp_none", text = "Not my concern while the Council's alive. Ask me again when they aren't." } },
  },
}
