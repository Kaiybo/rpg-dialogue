-- Squire Maltrake: Kalaran Windblade's devoted squire, who hands out the Torch of Retribution's last errand. His master's nature is hinted, never named (see searinggorge.md). Voice: bibles/maltrake.md
local P = RPGDialogueAPI:Pack("rpgd.searinggorge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "maltrake", id = TODO_NPC("Squire Maltrake"), name = "Squire Maltrake",
  bible = "bibles/maltrake.md", role = "questgiver", tier = "quest",
  communities = { "searing_gorge_wilds" }, temper = { "eager", "fervent" }, values = { "loyal", "zealous" },
  notices = { "class", "stealth" },

  impression = {
    first = "He calls fire glorious, and his zeal makes me uneasy.",
    third = "{name} met Squire Maltrake, the devoted servant of Kalaran Windblade, near Thorium Point in the Searing Gorge.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "My friend! My master speaks well of you, and so do I. Come, the Torch awaits." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "You. My master tolerates you, and I must too, but I need not like it." },
    { id = "g_op_vengeance", when = { gossip = { topic = "vengeance", stance = "wrong" } }, text = "My master says you lectured him on vengeance. He laughed afterwards, which he never does, and I still haven't decided whether to thank you or challenge you." },
    { id = "g_default", text = "You stand before the squire of Kalaran Windblade, so stand straight, and speak with respect when you speak of my master." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned! Have you come with more fire for the Dark Iron? Say that you have." },
    { id = "g_ablaze", when = { questDone = TODO_QUEST("Set Them Ablaze!") }, text = "I can still see the smoke from here, and it's beautiful. You did that, and my master was pleased, which is the highest thing that can be said of anyone." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "You walk softly, and my master likes servants who walk softly. The towers will need someone who isn't seen until the fire is." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK" } },
      text = "You know fire, then, but not fire like the torch carries. No spell of yours could put it out, and no spell of the Dark Iron's either." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Maltrake, squire to Kalaran Windblade, and I have served him longer than you would believe if I told you. Whatever he asks of you, do it gladly, for there are worse things than being useful to him." },
        { id = "h_squire_done", tags = { "news" }, when = { questDone = TODO_QUEST("Squire Maltrake") },
          text = "So you've seen my master without his mask, and you're still standing, which means he's pleased with you. The Torch of Retribution has one more task, and I'm to give it to you." },
        { id = "h_ablaze_active", tags = { "news" }, when = { questActive = TODO_QUEST("Set Them Ablaze!") },
          text = "North, south, east and west, all four sentry towers, and use the torch inside each one. They can never be destroyed, but they can burn for a very long time, and while they burn no Dark Iron can man them." },
        { id = "h_ablaze_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Set Them Ablaze!"), days = 3 } },
          text = "It is glorious! Is it not glorious? Even the Dark Iron's own fire can't touch that flame, and they're running about the ridges like ants." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin. My master warned me your kind would come asking questions, so ask, and I'll answer as much as a squire is permitted." },
        { id = "dd_torch", when = { questDone = TODO_QUEST("The Torch of Retribution") },
          text = "My master holds the Torch of Retribution now, and you put it in his hands. I have not seen him so near to peace since the day he first came to this gorge." },
      },
      again = {
        { id = "h_again", text = "What else? My master is watching, so make it worth his while." },
        { id = "h_again2", text = "Speak on. Until my master calls, my time is yours, though not a moment after." },
      },
      choices = {
        { text = "How long have you served Kalaran?", next = "service" },
        { text = "What is your master working on?", next = "torch" },
        { text = "Why does your master hate the Dark Iron?", next = "father" },
        { text = "What happens when the towers burn?", next = "towers", when = { questDone = TODO_QUEST("Squire Maltrake") } },
        { text = "Your master isn't what he seems.", next = "xpaladin", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Whoever you serve, Maltrake, he's more than a man.", next = "truth", when = { questDone = TODO_QUEST("Squire Maltrake") } },
        { text = "I'll be going.", next = "END" },
      },
    },

    service = {
      lines = {
        { id = "se_default", text = "Since I was a boy, and I'll serve him until I'm an old man, and gladly. He found me starving in Lakeshire after the war, and he fed me and taught me, and he's never once lied to me." },
      },
      choices = {
        { text = "Never once? That's a great deal of trust to put in anyone.", next = "service_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    service_trust = {
      lines = {
        { id = "st_default", text = "He has never lied to me, I said, and I chose my words carefully. What he tells others is his own business, and a squire who asks about his lord's business is a squire who's looking for a new lord." },
      },
      choices = {
        { text = "Loyalty like that is rare.", next = "BACK", reply = "It is, and it's the only thing I have to give him. Go and do his errand, and you'll understand.", fx = { align = { order = 1 } } },
        { text = "Blind loyalty's just slavery with a nicer name, squire.", next = "BACK", reply = "Call it what you like, and I'll call it service. Slaves don't choose their masters, and I chose mine.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    torch = {
      lines = {
        { id = "to_default", text = "My master's Torch of Retribution burns with a flame that no element or force can subdue, not water, not ice, not the Dark Iron's sorcery. You helped make it, so you should know, though I don't think you understood what you were making." },
      },
      choices = {
        { text = "Nothing in any forge burns like that.", next = "torch_source" },
        { text = "Something else.", next = "BACK" },
      },
    },
    torch_source = {
      lines = {
        { id = "ts_default", text = "No forge made it. It came from the same place my master's strength comes from, and that's all I'll say. Some fires are older than forges, and some families are older than kingdoms, and my master belongs to one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    father = {
      lines = {
        { id = "fa_default", text = "My master's grief is his own, and you'll not hear me speak of it. If you'd like to know about his father, you may ask him, but I'd advise you to ask politely." },
        { id = "fa_done", when = { questDone = TODO_QUEST("Squire Maltrake") },
          text = "You've seen what you've seen, so you know the answer already, and you'll not hear me say it aloud. My master needed willing hands, and a grieving son finds them more easily than the truth would." },
      },
      choices = {
        { text = "So the grieving son was a story he told me.", next = "father_lie", when = { questDone = TODO_QUEST("Squire Maltrake") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_lie = {
      lines = {
        { id = "fl_default", text = "A story, and a good one, and the Dark Iron deserved every bit of what it bought them. You burned their towers and broke their sentries, and the gorge is safer for it, so tell me what harm was done." },
      },
      choices = {
        { text = "The Dark Iron had it coming. I don't regret it.", next = "BACK", reply = "Good! That's the spirit he hoped to find in you. Look at the smoke and tell me the gorge isn't better for it.", fx = { align = { honor = -1 } } },
        { text = "You used me, the pair of you. That's harm enough.", next = "BACK", reply = "Used, is it? Then so was every soldier who ever followed an order, and I don't hear them complaining.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    towers = {
      lines = {
        { id = "tw_default", text = "No guard or sentry can stand in a tower that burns, so the Dark Iron's first line of defense is gone for a long, long time. Thorium Point should thank us, though I doubt they'll know whom to thank." },
      },
      choices = {
        { text = "And what does your master gain?", next = "towers_gain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    towers_gain = {
      lines = {
        { id = "tg_default", text = "Satisfaction, mostly, and a weaker enemy at the foot of the mountain. My master has old quarrels with the Dark Iron, and he settles them in his own way and his own time." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    truth = {
      lines = {
        { id = "tr_default", text = "The greatest being you'll ever stand beside, and the most patient, and he wears that face as a courtesy to people like you. He'll leave you alive and give you trinkets, which is more mercy than his kind usually show." },
      },
      choices = {
        { text = "His kind? Then you know what he is.", next = "truth_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    truth_know = {
      lines = {
        { id = "tk_default", text = "I know, and I've always known, and I'm proud of it. Thank him, take your reward from his hoard, and don't come looking for him again, for he doesn't like to be found." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xpaladin = {
      big = true,
      lines = {
        { id = "xp_default", text = "None of us are what we seem, holy one, and you'd do well to remember it before you cast stones. Do his work and take his gift, and leave the rest to wiser heads than yours." },
      },
      choices = {
        { text = "I'll find out what he is, with or without you.", next = "BACK", reply = "Then you'll find nothing but my master's goodwill, and you'll waste your time doing it. Go carefully, holy one.", fx = { align = { light = 1 } } },
        { text = "If his work hurts the Dark Iron, I'll ask no more.", next = "BACK", reply = "Now that's wisdom, and rarer than you'd think in a paladin. The Dark Iron are hurt, and that's what matters.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You understand vengeance, and justice, and the difference between them. My master values that." },
    },
    grievance = {
      { id = "dp_gv", text = "You've shown little respect for my master's cause. Mend your ways." },
    },
    background = { { id = "tp_ba", text = "An orphan of the war, a squire by my master's grace, and nothing else that matters." } },
    advice = { { id = "tp_ad", text = "Serve someone greater than yourself, and you'll never wonder what you're for." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "The Dark Irons in their city beneath the mountain are a blight on this land. My master will see them burned, and I will hand him the torch." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons killed my master's father, and my master's grief is a holy thing. I serve it gladly." } },
    black_dragonflight = { { id = "tp_black_dragonflight", text = "The black dragons are terrible and glorious, and fire follows them wherever they go. I would not speak against them in my master's hearing." } },
    _none = { { id = "tp_none", text = "My master hasn't told me about that, so I don't need to know it." } },
  },
}
