-- Between the towns: a hag on Sorrow Hill, and a very strange gnome in Andorhal. Voice: bibles/roads.md
local P = RPGDialogueAPI:Pack("rpgd.westernplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "myranda", id = TODO_NPC("Myranda the Hag"), name = "Myranda the Hag",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "sorrow_hill" }, temper = { "sly" }, values = { "cunning", "proud" },
  notices = { "class" },
  impression = {
    first = "Myranda the Hag keeps a hovel on Sorrow Hill and a smile she does not mean. She learned her first spells from the Scarlet Crusade's priests, and now she uses what they taught her to fool them.",
    third = "{name} met Myranda the Hag, who works illusions from her hut on Sorrow Hill.",
  },

  greetings = {
    { id = "g_hut", text = "Come in, come in, and mind the bones by the door; they're nobody you'd know." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon, dearie? Either my work pleased you or it frightened you, and I'm not sure which I'd prefer." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. I sat at the feet of priests once, in red robes, and I learned more from them than they ever meant to teach." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Myranda, they call me, and the Hag behind my back, though not to my face more than once. I trade in seemings, dearie, the art of looking like what you're not." },
        { id = "h_tirion", tags = { "news" }, when = { questActive = TODO_QUEST("Find Myranda") },
          text = "The old exile by the river sent you, did he? Then you'll want to walk into Hearthglen wearing a Crusader's face, and I can give you one, for a little while." },
      },
      choices = {
        { text = "I serve the Light. Your craft makes my skin crawl.", next = "paladin", when = { class = "PALADIN" } },
        { text = "How do you know the Crusade so well?", next = "crusade" },
        { text = "How does your illusion work?", next = "illusion" },
        { text = "Why help Tirion Fordring?", next = "tirion" },
        { text = "I've no use for witchcraft.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something more? The kettle's on, though I wouldn't drink from it." },
        { id = "h_again2", text = "Speak, dearie. I've nowhere to be, and no one to be it with." },
      },
    },
    crusade = {
      lines = {
        { id = "cr_default", text = "I studied with their priests, back when they still pretended they were saving people. They taught me to see the dark in others, and I found I was rather better at using it." },
      },
      choices = { { text = "Why did you leave them?", next = "crusade_left" } },
    },
    crusade_left = {
      lines = {
        { id = "cl_default", text = "They burned a village on a rumour, and I asked a question about it. In the Crusade, dearie, a question is the first step toward a pyre, so I walked out before they could build mine." },
      },
      choices = {
        { text = "They earned your hatred. Use it against them.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "Dark arts won't heal what they broke.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
      },
    },
    illusion = {
      lines = {
        { id = "il_default", text = "A seeming is only a story the eye tells the mind, and I tell it very convincingly. It won't fool a hound or a clever child, and it won't last long, so do your business in Hearthglen quickly." },
      },
      choices = { { text = "Something else, then.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    tirion = {
      lines = {
        { id = "ti_default", text = "Because his son sits at the Crusade's table in Hearthglen, and anything that hurts the Crusade pleases me. That the old man's heart might mend a little is, well, a pleasant accident." },
      },
      choices = { { text = "That's kinder than you let on.", next = "BACK", fx = { affinity = 1 } } },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Then don't touch anything, dearie, and you can scrub yourself raw afterwards. You'll still need my seeming to get into Hearthglen, Light or no Light." } },
      choices = { { text = "Just do the work.", next = "BACK", fx = { affinity = -1 } } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "Red robes, white knuckles, and a fire for every question. I know them far too well." } },
    _none = { { id = "tp_none", text = "Ask the bones by the door, dearie. They're better listeners than talkers." } },
  },
}

P:NPC {
  key = "chromie", id = TODO_NPC("Chromie"), name = "Chromie",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "andorhal" }, temper = { "cheerful" }, values = { "curious", "kind" },
  notices = { "race" },
  impression = {
    first = "Chromie is a gnome standing alone in the ruins of Andorhal, which is strange enough, and she seems to know what you are going to say a moment before you say it, which is stranger.",
    third = "{name} met Chromie, a peculiar gnome among the ruins of Andorhal who takes a great interest in the fall of Darrowshire.",
  },

  greetings = {
    { id = "g_ruin", text = "Oh, there you are! Right on time, or perhaps a little early; it's so hard to tell from in here." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! How lovely. You'll forgive me if I don't talk about Gnomeregan; I find it all very sad, and I'm told it isn't over yet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Chromie, and I'm very interested in Darrowshire, the town in the east where so many brave people fell. Things that happened there want to be remembered properly, and I'd like to help them." },
        { id = "h_ring", tags = { "news" }, when = { questActive = TODO_QUEST("A Strange Historian") },
          text = "Joseph Redpath's ring! Marlene sent you, didn't she? Hold onto it a moment; there's something it still wants to do." },
        { id = "h_annals", when = { questActive = TODO_QUEST("The Annals of Darrowshire") },
          text = "The Annals are somewhere in Andorhal's old town hall, among a great many books that aren't the Annals. Look for the one that looks like it's been waiting for you." },
      },
      choices = {
        { text = "Fellow gnome, you're hiding something.", next = "gnome", when = { race = "Gnome" } },
        { text = "What happened at Darrowshire?", next = "darrowshire" },
        { text = "Who are you, really?", next = "who" },
        { text = "Why stay in Andorhal of all places?", next = "andorhal" },
        { text = "Goodbye, Chromie.", next = "END" },
      },
      again = { { id = "h_again", text = "Yes? You were about to ask something, I'm almost certain of it." } },
    },
    darrowshire = {
      lines = {
        { id = "da_default", text = "The Scourge came, and the town's defenders stood, and Joseph Redpath was the bravest of them right up until he wasn't himself anymore. His brother Carlin survived, and he's at Light's Hope Chapel, and he would very much like to know how it really ended." },
      },
      choices = { { text = "How could you know how it really ended?", next = "darrowshire_know" } },
    },
    darrowshire_know = {
      lines = {
        { id = "dk_default", text = "Books, mostly, and a good memory, and an ear for things nobody else is listening to. Bring me the Annals, and I'll show Carlin something worth the long walk." },
      },
      choices = {
        { text = "Some stories are kinder left unfinished.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The dead deserve the true account.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = "darrowshire" } },
      },
    },
    who = {
      lines = {
        { id = "wh_default", text = "A gnome with a keen interest in history, and a keener interest in history going where it ought to. Let's leave it at that, shall we? It's tidier." },
      },
      choices = { { text = "Tidier for you, anyway.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    andorhal = {
      lines = {
        { id = "an_default", text = "Because Andorhal remembers everything, even the parts it would like to forget. The Scourge doesn't bother me much; I'm terribly uninteresting to them, you see." },
      },
      choices = { { text = "Something else, Chromie.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Everyone's hiding something, cousin, and mine is only bigger than most. Help me with Darrowshire, and perhaps one day I'll tell you over tea." } },
      choices = { { text = "I'll hold you to the tea.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    darrowshire = { { id = "tp_darrowshire", text = "A brave little town, and a terrible day, and a story with one more chapter in it." } },
    _none = { { id = "tp_none", text = "I could tell you, but then it wouldn't be a surprise later." } },
  },
}
