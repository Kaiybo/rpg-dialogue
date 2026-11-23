-- Uldaman: the titan vault beneath the Badlands. Ironaya, the stone keeper who speaks before she
-- wakes to fight, and Archaedas, the ancient stone watcher of the Titans' disc chamber.
-- Voices: bibles/dg_ironaya.md, bibles/dg_archaedas.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Ironaya: a titan-made stone keeper guarding the vault of the Map Room.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_ironaya", id = TODO_NPC("Ironaya"), name = "Ironaya", title = "Keeper of the Vault",
  bible = "bibles/dg_ironaya.md", role = "boss", tier = "quest",
  temper = { "cold", "formal" }, values = { "dutiful", "ordered" },
  notices = { "race" },
  impression = {
    first = "Her voice is stone grinding on stone, patient and without mercy.",
    third = "{name} heard the stone keeper Ironaya speak before she rose to defend her vault.",
  },
  greetings = {
    { id = "g_default", text = "Intruders have breached the vault. State your purpose before the protocol completes." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" }, text = "Your form carries the curse of flesh, earthen-born. You have forgotten what you were made to be." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ironaya, set here by the Makers to guard what lies within. Long ages have passed without command, yet the charge stands, and no one has been granted leave to enter." },
        { id = "h_dwarf", when = { race = "Dwarf" }, text = "You are of the earthen line, though the flesh has crept over you like moss. The Makers would grieve to see what their children have become." },
      },
      again = { { id = "h_again", text = "Speak quickly. My patience was carved, not grown." } },
      choices = {
        { text = "Who are the Makers you serve?", next = "makers" },
        { text = "What do you guard in this vault?", next = "vault" },
        { text = "What do you mean, the curse of flesh?", next = "flesh" },
        { text = "Stand aside, or we will break you.", next = "END" },
      },
    },
    makers = {
      lines = { { id = "m_default", text = "The Titans shaped this world and placed their works beneath it. They made keepers of stone and iron to watch over those works, and then they went away into the sky and did not return." } },
      choices = {
        { text = "Do you miss them?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "mi_default", text = "I was not made to miss. I was made to wait, and I have waited well. Yet I will confess that the silence has grown very long." } },
      choices = {
        { text = "Then your duty is finished. Let us pass.", next = "BACK", reply = "Duty does not end because the commander forgets it. That is the whole of what duty means.", fx = { align = { order = -1 } } },
        { text = "Your loyalty deserves respect.", next = "BACK", reply = "Respect will not open the door, but I record it. Few who come here think to offer it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vault = {
      lines = { { id = "v_default", text = "The records of the Makers, and the disc that holds them. The diggers who came before you broke the outer seals with fire and powder, and I will not allow them to reach the inner chamber." } },
      choices = {
        { text = "The dwarves only want to learn their history.", next = "BACK", reply = "Then they should have knocked. Knowledge seized with dynamite is not learning, small one, it is plunder." },
        { text = "Something else.", next = "BACK" },
      },
    },
    flesh = {
      lines = { { id = "f_default", text = "The earthen were made of stone, as I was. Something crept into their making, and over the ages their stone became soft and their memories frail. Those who walk above now call themselves dwarves." } },
      choices = {
        { text = "Can the curse be undone?", next = "BACK", reply = "Perhaps the Makers know. I was not told, and I do not guess." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is outside my charge. I have nothing to tell you of it." } },
  },
}

---------------------------------------------------------------------------
-- Archaedas: the ancient stone watcher who wakes when the Discs of Norgannon are disturbed.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_archaedas", id = TODO_NPC("Archaedas"), name = "Archaedas", title = "Ancient Stone Watcher",
  bible = "bibles/dg_archaedas.md", role = "boss", tier = "major",
  temper = { "solemn", "imperious" }, values = { "ordered", "dutiful" },
  notices = { "race", "class" },
  impression = {
    first = "He speaks like a mountain deciding whether to fall.",
    third = "{name} stood before Archaedas, the ancient watcher of Uldaman's last chamber.",
  },
  greetings = {
    { id = "g_default", text = "Who dares awaken Archaedas? Who dares the wrath of the Makers?" },
    { id = "g_discs", when = { questActive = TODO_QUEST("Passing the Burden") }, text = "You carry words meant for the Discs of Norgannon. Then you have come to wake what should have slept." },
  },
  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" }, text = "Child of the earthen, you return to the hall of your making with a pick in your hand. How strange the ages have made you." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" }, text = "You call on a Light the Makers did not give you. I wonder who you think is listening." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Archaedas, last watcher of this hall. The Makers gave me stone servants and a single command, that no hand unbidden should touch the discs. I have kept that command since before your kind learned fire." },
      },
      again = { { id = "h_again", text = "You still stand here. Ask, then, while I allow it." } },
      choices = {
        { text = "What are the Discs of Norgannon?", next = "discs" },
        { text = "Who made the dwarves, truly?", next = "earthen" },
        { text = "Why did the Titans leave this place?", next = "leave" },
        { text = "We came for the discs, and we'll take them.", next = "defy" },
        { text = "We mean no harm, watcher.", next = "END" },
      },
    },
    discs = {
      lines = { { id = "d_default", text = "They are the memory of the Makers, written by the keeper Norgannon. They hold the shaping of this world and the names of those set to guard it. Read them carelessly and you will learn things you cannot unlearn." } },
      choices = {
        { text = "Knowledge should belong to everyone.", next = "BACK", reply = "Spoken like a creature who has never been burned by it. Some doors are shut for the sake of the ones outside them.", fx = { align = { order = -1 } } },
        { text = "Some knowledge should stay sealed.", next = "BACK", reply = "Then you are wiser than the diggers who brought you here. Hold to that, if you survive this hall.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    earthen = {
      lines = { { id = "e_default", text = "The Makers shaped the earthen from the stone of this world to delve and to build. Some were laid to sleep in halls like this one. Those who woke and wandered grew soft, and their children walk the mountains above as dwarves." } },
      choices = {
        { text = "So Ironforge's founders came from here?", next = "BACK", reply = "From here, or a hall like it. Your king's scholars would trade their beards for that answer, and I give it freely only because you will likely die." },
        { text = "Something else.", next = "BACK" },
      },
    },
    leave = {
      lines = { { id = "l_default", text = "They did not explain themselves to stone. They set their works in order, named their keepers, and went on to other worlds. We were told to wait, and waiting is what we are for." } },
      choices = {
        { text = "That sounds lonely.", next = "BACK", fx = { affinity = 1 }, reply = "Lonely is a word for flesh. Still, I have counted the years, which I suppose is a kind of answer." },
        { text = "Something else.", next = "BACK" },
      },
    },
    defy = {
      lines = { { id = "df_default", text = "Then the hall will wake. My stone keepers have slept long enough, and they will remember their purpose quickly." } },
      choices = {
        { text = "Let them come.", next = "END" },
        { text = "Wait, I spoke rashly.", next = "BACK" },
      },
    },
  },
  topics = {
    uldaman = { { id = "tp_uld", text = "This is Uldaman, a vault of the Makers. Your kind found its doors and mistook them for a mine." } },
    _none = { { id = "tp_none", text = "I do not trade in trivia, mortal." } },
  },
}
