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
        { text = "Your hair is glowing, Kernobee.", next = "hair" },
        { text = "What were you working on, before?", next = "work" },
        { text = "I'm from Tinker Town. Do you remember me?", next = "tinker", when = { race = "Gnome" } },
        { text = "Come with me. I'll get you out.", next = "escort" },
        { text = "Stay safe. I'll be back.", next = "END" },
      },
    },
    evac = {
      lines = { { id = "e_default", text = "Evacuated? Oh, that explains the quiet, because I thought it was a holiday. Did everyone get out, Mekkatorque and the whole lot of them?" } },
      choices = {
        { text = "Many didn't. I'm sorry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Mekkatorque got out. He's in Ironforge now.", next = "mekkatorque" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mekkatorque = {
      lines = { { id = "mk_default", text = "Ironforge! With the dwarves and their enormous beards? Well, good for him, though I do hope somebody's told him the coffee pot on level three needs replacing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troggs = {
      lines = { { id = "t_default", text = "I remember a lot of shouting, and a green fog, and somebody saying the radiation would fix everything. I don't think it fixed anything, and I've been feeling a bit funny, honestly." } },
      choices = {
        { text = "Who said the radiation would fix things?", next = "thermaplugg" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thermaplugg = {
      lines = { { id = "th_default", text = "Oh, that was Mekgineer Thermaplugg, he's very senior, and he said it with such confidence that we all believed him. I saw him go down toward the core afterwards, and I don't think he came back up, which is odd for a man so keen on fixing things." } },
      choices = {
        { text = "Thermaplugg betrayed you all.", next = "BACK", reply = "Did he? Oh dear, and he always remembered my birthday, or somebody's birthday, anyway." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hair = {
      lines = { { id = "hr_default", text = "Is it? Oh, how lovely, I always wanted to be distinguished. I did wonder why I could read my notes in the dark, and I thought perhaps I'd simply become very good at reading." } },
      choices = {
        { text = "That's the radiation. You need a healer.", next = "BACK", reply = "A healer! Splendid idea, I'll pencil that in for after my shift.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "wk_default", text = "Pressure valves, mostly, and one very promising little steam regulator that only exploded twice. It's somewhere on my bench, unless the troggs ate it, and they do eat the strangest things." } },
      choices = {
        { text = "Was it worth staying behind for?", next = "stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "sy_default", text = "Staying behind? I don't think I meant to stay, I just went back for my notes and then everybody was gone. It's funny how a person can miss an entire evacuation by being thorough." } },
      choices = {
        { text = "Your notes aren't worth your life.", next = "BACK", reply = "No, I suppose not, though they were very good notes, with diagrams.", fx = { align = { order = 1 } } },
        { text = "Good work is worth a few risks.", next = "BACK", reply = "That's what I always say! Well, I think I do. It sounds like me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tinker = {
      lines = { { id = "tk_default", text = "Tinker Town, is that a new department? You do look awfully familiar, now that I squint, so perhaps we shared a lift once, or a lunch, or possibly an explosion." } },
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
        { id = "h_default", key = true, text = "I'm Emi Shortfuse, and demolitions are my specialty. The troggs keep pouring through those tunnels, and I've got enough charges to seal them, if someone can keep them off me while I set them." },
      },
      again = { { id = "h_again", text = "Talk faster, they're coming!" } },
      choices = {
        { text = "What's your plan exactly?", next = "plan" },
        { text = "Where did all these troggs come from?", next = "troggs" },
        { text = "Why stay down here alone?", next = "stay" },
        { text = "Those charges look homemade.", next = "charges" },
        { text = "I'm from Gnomeregan too. What's left of it?", next = "home", when = { race = "Gnome" } },
        { text = "I know a little about explosives myself.", next = "engineer", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Let's do it.", next = "END" },
      },
    },
    plan = {
      lines = { { id = "p_default", text = "I set a charge on each tunnel mouth, you keep the troggs off me, and when I say run, you run. Ideally, nobody we like gets blown up." } },
      choices = {
        { text = "How many tunnels are we talking about?", next = "plan_tunnels" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan_tunnels = {
      lines = { { id = "pt_default", text = "Two big ones that matter, the east and the west, though they branch like a root system underneath. If both mouths collapse, I calculate an eighty-percent drop in trogg traffic, give or take a cave-in." } },
      choices = {
        { text = "What happens to the other twenty percent?", next = "plan_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan_rest = {
      lines = { { id = "pr_default", text = "They come out of the cracks in ones and twos, and that's what you're for. Honestly, a trickle of troggs is a vast improvement on a flood, and I'll take it gladly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    charges = {
      lines = { { id = "ch_default", text = "Homemade, field-tested and only slightly unstable, which for Gnomeregan these days is practically a certificate of quality. I scavenged the powder from a dead mechano-tank, so be grateful it went to a good cause." } },
      choices = {
        { text = "As long as they blow the right way.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      narr = "She pushes her goggles up and looks at you for the first time without squinting.",
      lines = { { id = "ho_default", text = "Not much, I'm afraid, just leper gnomes and troggs and Thermaplugg's machines rattling around the workshops. But every tunnel I seal is one less door they have into our city, and one day we'll walk back in." } },
      choices = {
        { text = "We'll take it back. Mekkatorque swore it.", next = "BACK", reply = "He did, and I'm holding him to it, preferably with a parade.", fx = { align = { order = 1 } } },
        { text = "Forget the High Tinker. We'll do it ourselves.", next = "BACK", reply = "Ha! That's the spirit, though maybe don't say it that loudly in Ironforge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    engineer = {
      lines = { { id = "en_default", text = "Then you know to keep your fingers away from the blue wire, and the red one, and frankly most of the wires. Watch my back, and if I go down, finish setting the last charge." } },
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
