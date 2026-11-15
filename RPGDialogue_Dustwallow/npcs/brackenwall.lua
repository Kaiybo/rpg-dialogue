-- Brackenwall Village: the Horde's camp in Dustwallow Marsh. Voice: bibles/dustwallow.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "krog", id = TODO_NPC("Krog"), name = "Krog",
  bible = "bibles/dustwallow.md", role = "soldier", tier = "major",
  communities = { "brackenwall" }, temper = { "blunt" }, values = { "loyal", "dutiful" },
  notices = { "race", "kit" },

  greetings = {
    { id = "g_boss", text = "You're here because the Warchief wants answers, and so do I. Talk." },
    { id = "g_back", when = { metBefore = true }, text = "Back, good. What did you find?" },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, good. You'll know the difference between your people and the ones who'd shame them." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something chewed on you, so get patched; I need you on your feet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Krog. The Warchief ordered the Horde to leave Theramore's humans in peace, and now a human inn has burned with our name on it. I'll find who made a liar of him." },
        { id = "h_command", when = { any = { { questActive = TODO_QUEST("Warchief's Command: Dustwallow Marsh!") }, { questActive = TODO_QUEST("Flight to Brackenwall") } } },
          text = "The Warchief sent you, so you know what's at stake: a peace he worked for, burning on a road in the fog." },
        { id = "h_ruins", tags = { "news" }, when = { questActive = TODO_QUEST("Inspecting the Ruins") },
          text = "Go to the burned inn. See what's there, not what the humans say is there." },
        { id = "h_plot", when = { questActive = TODO_QUEST("The Grimtotem Plot") },
          text = "Grimtotem: tauren who want a war and want the Horde to pay for it. The Warchief will hear of this." },
        { id = "h_justice", when = { questActive = TODO_QUEST("Justice Dispensed") },
          text = "It's done. Whoever wanted war wanted it badly, and they'll have to want it from somewhere else now." },
      },
      choices = {
        { text = "Why do you care about a human inn?", next = "why" },
        { text = "I'll find the truth.", next = "END", fx = { affinity = 2, align = { honor = 1 }, standing = { brackenwall = 1 } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "I don't care about the inn. I care that the Warchief gave an order and someone spat on it, and that I don't forgive." },
      },
      choices = { { text = "Fair.", next = "END", fx = { affinity = 2, trait = { stern = 1 }, learn = { "grimtotem" } } } },
    },
  },

  topics = {
    grimtotem = { { id = "tp_grimtotem", text = "Cairne's problem, and now mine too. They'd burn the whole peace to warm their hands." } },
    _none = { { id = "tp_none", text = "I don't care about that. Find me the burners." } },
  },
}

P:NPC {
  key = "nazeer", id = TODO_NPC("Nazeer Bloodpike"), name = "Nazeer Bloodpike",
  bible = "bibles/dustwallow.md", role = "soldier", tier = "quest",
  communities = { "brackenwall" }, temper = { "suspicious" }, values = { "loyal", "cunning" },
  notices = { "class", "stealth" },

  greetings = {
    { id = "g_watch", text = "The Alliance smiles from its island. I keep count of the smiles, and of the knives behind them." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Quiet feet, good. I've work for those who can listen at a window without being seen." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Nazeer Bloodpike, and I watch Theramore for the Horde. There's a peace, on paper, but in the marsh, paper gets wet." },
        { id = "h_head", tags = { "news" }, when = { questActive = TODO_QUEST("The Severed Head") },
          text = "A severed head, and a question of whose. Someone wants us to read something into it. I'd like to know who first." },
        { id = "h_witchdoctor", when = { questActive = TODO_QUEST("The Troll Witchdoctor") },
          text = "The witch doctor can make the dead speak, if anyone can. Take it to him and listen carefully." },
        { id = "h_zor", when = { questActive = TODO_QUEST("Report to Zor") },
          text = "This goes to Zor Lonetree in Orgrimmar. Don't stop to chat on the way." },
        { id = "h_wet", when = { metBefore = true }, text = "Another report from Theramore, soaked through. Everything in this marsh is soaked through, even the secrets." },
      },
      choices = { { text = "I'll keep my ears open.", next = "END", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If I knew, I'd have reported it, and I haven't, so I don't." } },
  },
}
