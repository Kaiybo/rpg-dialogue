-- Gnomeregan: Kernobee, a dazed gnome wandering the irradiated halls; Emi Shortfuse, the survivor
-- who holds the workshop door in Grubbis's event; and Mekgineer Thermaplugg, the traitor on his throne.
-- Voices: bibles/dg_kernobee.md, bibles/dg_emi_shortfuse.md, bibles/dg_thermaplugg.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Kernobee: a gnome survivor wandering in a radiation daze, escorted out in "A Fine Mess".
---------------------------------------------------------------------------
P:NPC {
  key = "dg_kernobee", id = TODO_NPC("Kernobee"), name = "Kernobee",
  bible = "bibles/dg_kernobee.md", role = "escort", tier = "quest",
  temper = { "confused", "cheerful" }, values = { "curious", "kind" },
  notices = { "race" },
  impression = {
    first = "He seems pleasantly unaware that his hair is faintly glowing.",
    third = "{name} found Kernobee wandering the halls of Gnomeregan.",
  },

  greetings = {
    { id = "g_default", text = "Oh, hello! Are you the new shift? Nobody's been by in ages, and the coffee pot's gone all green." },
    { id = "g_mess", when = { questActive = TODO_QUEST("A Fine Mess") }, text = "Scooty sent you? Splendid! I've been meaning to go up and see him, only the stairs keep moving around." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Which department are you with? I'm with... well, it'll come to me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Kernobee, assistant engineer, third level, west wing. Or east wing. Something's happened to the signs, and to the walls, and to the troggs, come to think of it." },
      },
      again = { { id = "h_again", text = "Sorry, where were we? I lose the thread a bit lately." } },
      choices = {
        { text = "Kernobee, Gnomeregan was evacuated.", next = "evac" },
        { text = "Do you remember the troggs coming?", next = "troggs" },
        { text = "Come with me. I'll get you out.", next = "escort" },
        { text = "Stay safe. I'll be back.", next = "END" },
      },
    },
    evac = {
      lines = { { id = "e_default", text = "Evacuated? Oh, that explains the quiet. I thought it was a holiday. Did everyone get out? Mekkatorque, the whole lot of them?" } },
      choices = {
        { text = "Many didn't. I'm sorry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs = {
      lines = { { id = "t_default", text = "I remember a lot of shouting, and a green fog, and somebody saying the radiation would fix everything. I don't think it fixed anything. I feel a bit funny, honestly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    escort = {
      lines = { { id = "es_default", text = "Out? To the surface? With the sky and everything? Oh, yes please. I'll stay close and try not to wander off. Try." } },
      choices = {
        { text = "Every survivor matters. We go together.", next = "BACK", reply = "That's very kind. You remind me of somebody, though I can't remember who.", fx = { align = { order = 1 } } },
        { text = "Keep up, or I can't help you.", next = "BACK", reply = "Right, right. Keep up. I can do that, I think.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Hmm? I'm sorry, I don't remember anything about that." } },
  },
}

---------------------------------------------------------------------------
-- Emi Shortfuse: a gnome engineer fighting to hold the workshop against the troggs.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_emi_shortfuse", id = TODO_NPC("Emi Shortfuse"), name = "Emi Shortfuse",
  bible = "bibles/dg_emi_shortfuse.md", role = "event", tier = "quest",
  temper = { "brisk", "brave" }, values = { "practical", "dutiful" },
  notices = { "craft", "race" },
  impression = {
    first = "She has soot on her face and a bundle of explosives under her arm.",
    third = "{name} helped Emi Shortfuse blow the trogg tunnels in Gnomeregan.",
  },

  greetings = {
    { id = "g_default", text = "Oh, thank goodness, people who aren't troggs! Quick, I need help, and I need it now." },
  },

  notice = {
    { id = "n_engineer", cat = "craft", when = { profession = { "Engineering" } },
      text = "An engineer! Then you know what a charge looks like. Keep your hands steady and stay out of my blast radius." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome come back home. Welcome back to what's left of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Emi Shortfuse, demolitions. The troggs keep pouring through those tunnels, and I've got enough charges to seal them, if someone can keep them off me while I set them." },
      },
      again = { { id = "h_again", text = "Talk faster, they're coming!" } },
      choices = {
        { text = "What's your plan exactly?", next = "plan" },
        { text = "Where did all these troggs come from?", next = "troggs" },
        { text = "Why stay down here alone?", next = "stay" },
        { text = "Let's do it.", next = "END" },
      },
    },
    plan = {
      lines = { { id = "p_default", text = "I set a charge on each tunnel mouth, you keep the troggs off me, and when I say run, you run. Ideally, nobody we like gets blown up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troggs = {
      lines = { { id = "t_default", text = "From under the city, deep down. Thermaplugg says they came up on their own, but the timing was awfully convenient, and the radiation was his idea in the first place." } },
      choices = {
        { text = "Thermaplugg should face judgment.", next = "BACK", reply = "He should, and Mekkatorque would agree, if he could get down here.", fx = { align = { order = 1 } } },
        { text = "Just kill him and be done with it.", next = "BACK", reply = "I won't argue. I'll even lend you a charge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "s_default", text = "Because this is home, and somebody has to stop the troggs before they spread. Somebody had to stay; it may as well be the one carrying the explosives." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask me again when we're not under attack!" } },
  },
}

---------------------------------------------------------------------------
-- Mekgineer Thermaplugg: the traitor who doomed Gnomeregan and claims its throne.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_thermaplugg", id = TODO_NPC("Mekgineer Thermaplugg"), name = "Mekgineer Thermaplugg",
  bible = "bibles/dg_thermaplugg.md", role = "boss", tier = "major",
  temper = { "manic", "resentful" }, values = { "ambitious", "proud" },
  notices = { "race" },
  impression = {
    first = "He rambles at speed, delighted with himself, sitting in a huge walking machine.",
    third = "{name} confronted Mekgineer Thermaplugg in the ruins of Gnomeregan.",
  },

  greetings = {
    { id = "g_default", text = "Intruders in my city! My city, mine, not Mekkatorque's anymore!" },
    { id = "g_gnomer", when = { questActive = TODO_QUEST("Gnomer-gooooone!") }, text = "Mekkatorque sent you, didn't he? He always sends somebody else to do the work." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome loyal to that tinkering fool. You ran away with him, didn't you? Now you've come crawling back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mekgineer Thermaplugg, advisor to the High Tinker no longer. Now I'm king of Gnomeregan, and all of it is mine, every bolt and gear." },
      },
      again = { { id = "h_again", text = "Still here? My machines are getting bored!" } },
      choices = {
        { text = "You betrayed your own people.", next = "betray" },
        { text = "Why use the radiation?", next = "radiation" },
        { text = "What about Mekkatorque?", next = "mekkatorque" },
        { text = "Your reign ends today.", next = "END" },
      },
    },
    betray = {
      lines = { { id = "b_default", text = "Betrayed? I advised him! I told him the troggs were coming and he wouldn't listen, and I told him the radiation would work. Is it my fault it didn't go to plan?" } },
      choices = {
        { text = "Yes. You doomed thousands.", next = "BACK", reply = "They were going to die anyway! I simply made them die more efficiently.", fx = { align = { light = 1 } } },
        { text = "Every genius has a failed experiment.", next = "BACK", reply = "Exactly! Finally someone who understands science!", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    radiation = {
      lines = { { id = "r_default", text = "The troggs were overrunning us, so I flooded the city with radiation to kill them. It killed gnomes too, I admit, but the troggs only got stronger, so that was a surprise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mekkatorque = {
      lines = { { id = "m_default", text = "He's hiding in Ironforge, building his little gadgets and pretending he's still king. Let him. I have the real throne, and I'm not giving it back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Bah! Irrelevant! Back to work, machines!" } },
  },
}
