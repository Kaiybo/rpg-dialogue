-- Tarren Mill (Horde), more of its people. Voice: bibles/tarrenmill_more.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "krusk", id = TODO_NPC("Krusk"), name = "Krusk",
  bible = "bibles/tarrenmill_more.md", role = "soldier", tier = "quest",
  communities = { "tarren_mill" }, temper = { "grim" }, values = { "loyal", "brave" },
  notices = { "race", "class" },

  impression = {
    first = "Krusk is an orc warrior sent by Thrall to Hillsbrad, who lost his companions to a Syndicate ambush at Durnholde and escaped alone. He's sharing a town with the dead and makes no secret that he'd rather be anywhere else.",
    third = "{name} met Krusk, an orc of Thrall's sent to Hillsbrad, who is trying to free his captured comrades from the Syndicate.",
  },

  greetings = {
    { id = "g_default", text = "You're Horde, and you're breathing. Good, I need both." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Any word of my brothers?" },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar! It's good to see a green face in this town of grey ones. Stand close, and help me get mine home." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Then you'll understand that being taken alive is worse than dying, and that's where my brothers are." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "We did, and he was the first to fall, because the Syndicate knew to aim at the one calling the lightning. If the spirits could not save him, I have to wonder whether these hills are too full of the dead for them to hear us." } },
      choices = {
        { text = "Then I'll honor him by freeing Drull and Tog'thar.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Next time I'll strike the Syndicate from the shadows, before they aim.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Perhaps not, for there were three times our number and they came through the trees with dogs. But a druid might have heard them coming, and an orc who listens only to his own anger hears nothing at all." } },
      choices = {
        { text = "Then honor them by fighting on, Krusk.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Next time, listen first and strike from cover.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, and of the Warchief's own calling. The spirits came back to our people because Thrall asked them to, and I trust them more than I trust anyone in this town of corpses." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A tauren druid. I wish I'd had one of you with us at Durnholde, because I would not be the only one left to tell of it." },
        { id = "h_default", key = true,
          text = "Krusk. The Warchief sent a band of us from Durotar to retrieve something from Durnholde and to learn what this Syndicate is, and the humans caught us in the ruins with three times our number. I got away, and the others didn't." },
        { id = "h_rescue", tags = { "news" }, when = { questActive = TODO_QUEST("The Rescue") },
          text = "Drull and Tog'thar are held in Durnholde, southeast across the river. Get them out before the Syndicate decide they're not worth feeding." },
        { id = "h_infil", when = { questActive = TODO_QUEST("Infiltration") },
          text = "They keep moving Gol'dir from camp to camp, but the big Syndicate camp north of here will have papers. Bring me anything with writing on it." },
        { id = "h_goldir", tags = { "news" }, when = { questActive = TODO_QUEST("Gol'dir") },
          text = "The papers say Gol'dir's held in a Syndicate base north of here, up in Alterac. Find him, and give me the key afterward, because I want to undo his chains with my own hands." },
        { id = "h_goldir_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Gol'dir"), days = 3 } },
          text = "Gol'dir is free. He led us here, and he's been hauling stone for human thieves in Strahnbrad since, and the first thing he asked was who leads us now. I'm ashamed to say it's me." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I sharpen." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Would a druid have saved them, Krusk?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Did your band have a shaman with them at Durnholde?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What happened at Durnholde?", next = "ambush" },
        { text = "What were you sent to find?", next = "mission" },
        { text = "How do you like the Forsaken?", next = "forsaken" },
        { text = "Who is Gol'dir?", next = "goldir" },
        { text = "I was born in a human camp myself.", next = "camp", when = { origin = { "orc_camp_born", "orc_camp_primer" } } },
        { text = "I'm Forsaken. Speak plainly about us.", next = "scourge", when = { race = "Scourge" } },
        { text = "I'll find your brothers.", next = "END", fx = { affinity = 2, standing = { tarren_mill = 1 } } },
      },
    },
    ambush = {
      big = true,
      lines = { { id = "a_default", text = "We went in to look around and they were waiting, more humans than we'd ever seen in one place outside a war. We fought well, and it made no difference; they took the ones who fell, and I ran." },
        { id = "a_freed", when = { questDone = TODO_QUEST("The Rescue") }, text = "We went in to look around and they were waiting, more than we'd ever seen outside a war. Drull and Tog'thar are free now, thanks to you, but I still see that courtyard when I sleep." } },
      choices = {
        { text = "Running kept you alive to free them.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "An orc stands with his brothers, even to the end.", next = "BACK", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Who are the Syndicate, really?", next = "syndicate" },
      },
    },
    syndicate = {
      lines = { { id = "sy_default", text = "Human nobles who lost their lands when Alterac fell and turned thieves to get them back. They hold Durnholde now, the same keep where the humans once caged my people." } },
      choices = {
        { text = "That's a bitter irony.", next = "syndicate_irony" },
        { text = "Something else.", next = "BACK" },
      },
    },
    syndicate_irony = {
      lines = { { id = "si_default", text = "The Warchief was raised in that keep, and he broke out of it. I'd like to think he sent us there because he knew we'd fight harder in that place than anywhere else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mission = {
      lines = { { id = "m_default", text = "That's the Warchief's business, and Gol'dir's, and I'll tell it to neither the dead nor you. Free Gol'dir and he can decide what you're owed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    goldir = {
      lines = { { id = "gd_default", text = "He led our expedition from Durotar, and the humans took him somewhere we couldn't follow. Every day he's in their hands, I like his chances less." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "f_default", text = "They're Horde, and the Warchief says that's enough. They fight hard and they don't eat my rations, but I don't like how the apothecary looks at me." } },
      choices = {
        { text = "Lydon looks at everyone that way.", next = "forsaken_lydon", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_lydon = {
      lines = { { id = "fl_default", text = "So I hear, and it doesn't help. A frog was the only one in this town who looked glad to see me, and the frog's been dead twice this week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "c_default", text = "Then you know why I couldn't leave them there. Nobody of ours goes back into a cage while I can still stand." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    scourge = {
      lines = { { id = "sc_default", text = "Plainly, then: you're cold company, but you hold the line, and the High Executor gave me a bed when she didn't have to. I'll take that over warmth." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the Syndicate's camps, and I know Durnholde better than I'd like. Ask." } },
    background = { { id = "tp_bg", text = "One of the Warchief's warriors, sent from Durotar. The rest of the story is unfinished.", next = "ambush" } },
    advice = { { id = "tp_ad", text = "Never go into Durnholde with fewer than you'd need. Count, then double it." } },
    syndicate = { { id = "tp_syn", text = "Thieves with noble names.", next = "syndicate" } },
    _none = { { id = "tp_none", text = "No idea. Ask one of the dead; they've been here longer." } },
  },
}

P:NPC {
  key = "thaivand", id = TODO_NPC("Novice Thaivand"), name = "Novice Thaivand",
  bible = "bibles/tarrenmill_more.md", role = "scholar", tier = "quest",
  communities = { "tarren_mill" }, temper = { "intense" }, values = { "devoted", "vengeful" },
  notices = { "class" },

  impression = {
    first = "Novice Thaivand is the necromancer Helcular's apprentice, and he means to raise his master against Southshore. He speaks of the lynch mob that killed Helcular with a fury that hasn't cooled in all the years since.",
    third = "{name} met Novice Thaivand, Helcular's apprentice, who plans to unleash his dead master on Southshore.",
  },

  greetings = {
    { id = "g_default", text = "Do you know what Southshore did to my master? Sit, and I'll tell you, and then you'll help me." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Every day his bones lie in their churchyard is another insult." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = { "WARLOCK", "MAGE", "PRIEST" } },
      text = "You study the deeper arts, I can see it. Then you'll understand how near Master Helcular came to greatness." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "His spirit was torn out of him by a mob of farmers with pitchforks, and nobody asked his will then. When I call him back he will thank me, and the first thing he will do is visit Southshore's churchyard and return the favour." } },
      choices = {
        { text = "The dead deserve rest, even Helcular. I won't help bind him.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then call him back, and let Southshore reap what it sowed.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, come among the dead. Your kind speak with spirits, so perhaps you understand what I mean to do for my master better than the Deathguards do." },
        { id = "h_default", key = true,
          text = "Novice Thaivand, apprentice to the great Helcular. He was nearly a lich when a mob from Southshore found his lair in the hills and butchered him, and then they buried him in their own churchyard as if he were one of their farmers." },
        { id = "h_rod", tags = { "news" }, when = { questActive = TODO_QUEST("Helcular's Revenge") },
          text = "The yeti took over his ritual lair in the Alterac hills, and one of the brutes must have the rod. Bring it to me before it's chewed into splinters." },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Helcular's Revenge"), days = 3 } },
          text = "They say Southshore's guards fought something in their churchyard, and that it called up the dead around it. I wish I had been there to see it, but I'll settle for hearing it from you." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick; I have rites to study." },
        { id = "h_again2", text = "Ask, and then help me." },
      },
      choices = {
        { text = "Raising Helcular binds his spirit against its will. Have you considered that?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who was Helcular?", next = "helcular" },
        { text = "What will you do when he rises?", next = "rising" },
        { text = "Where are the pyres?", next = "pyres" },
        { text = "I know something of necromancy myself.", next = "warlock", when = { class = { "WARLOCK", "MAGE" } } },
        { text = "I was a priest of the Light once.", next = "priest", when = { class = "PRIEST", race = "Scourge" } },
        { text = "Good luck, novice.", next = "END" },
      },
    },
    helcular = {
      lines = { { id = "he_default", text = "A wizard of real power, who found the path past death long before the plague made it fashionable. He was so close, and they cut him down with pitchforks." } },
      choices = {
        { text = "Was he Forsaken?", next = "helcular_forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    helcular_forsaken = {
      lines = { { id = "hf_default", text = "He was before there were Forsaken, which makes him something better. The Dark Lady wants Southshore broken, and so do I, and so, I promise you, does he." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rising = {
      big = true,
      lines = { { id = "r_default", text = "When the charged rod strikes his grave he will rise, and his anger will fall on Southshore like rain. I don't need him to obey me; I only need him to remember who put him in the ground." } },
      choices = {
        { text = "Let him loose. Southshore earned it.", next = "rising_after", fx = { align = { light = -1 } } },
        { text = "An uncontrolled lich is a danger to us all.", next = "rising_after", fx = { align = { light = 1 } } },
        { text = "And afterward?", next = "rising_after" },
      },
    },
    rising_after = {
      lines = { { id = "ra_default", text = "Afterward, I learn what he knew, and I stop being a novice. I've waited a long time to say that out loud." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pyres = {
      lines = { { id = "p_default", text = "He built three. The Flame of Azel and the Flame of Veraz burn in the Foothill Caverns, and the Flame of Uzel is in a cave above them, further north into the mountains." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "w_default", text = "Then you'll know the rod is the key and the grave is the lock. Nobody in Southshore will recognize what's happening until the dead are already standing." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest = {
      lines = { { id = "pr_default", text = "And now you're here, beside me, against the town that would have prayed over your grave. I find that very encouraging." } },
      choices = {
        { text = "Don't read too much into it.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know my master's rites and Southshore's sins. Ask about either." } },
    background = { { id = "tp_bg", text = "Helcular's apprentice, and his avenger.", next = "helcular" } },
    advice = { { id = "tp_ad", text = "Never let the living bury your dead. They do it wrong on purpose." } },
    _none = { { id = "tp_none", text = "That has nothing to do with Master Helcular, so it doesn't interest me." } },
  },
}

P:NPC {
  key = "humbert", id = TODO_NPC("Deathguard Humbert"), name = "Deathguard Humbert",
  bible = "bibles/tarrenmill_more.md", role = "guard", tier = "quest",
  communities = { "tarren_mill" }, temper = { "sheepish" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Deathguard Humbert lost his gear to dwarven scouts from Dun Garok and has been embarrassed about it ever since. He's a Deathguard without a sword, and he knows how that looks.",
    third = "{name} met Deathguard Humbert of Tarren Mill, whose sword was stolen by dwarves from Dun Garok.",
  },

  greetings = {
    { id = "g_default", text = "Ah. Yes. Please don't look at my belt; I know there's nothing on it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Have you seen my sword? I'm asking everyone." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc! If you see any dwarves at Dun Garok with a Forsaken blade, you'll know where it came from." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I asked a troll who was passing through, and he burned some leaves and told me the sword was somewhere to the south, which I already knew, because that's where the dwarves of Dun Garok live. If the spirits are going to tell me things, I'd like them to be more specific." } },
      choices = {
        { text = "Win it back from the dwarves yourself. That's how a soldier mends shame.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Forget that sword. Take a better one off a Southshore guard.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! Do the spirits ever tell you where things are? Only I've lost a sword, as everyone keeps reminding me, and I'm not too proud to ask anyone for help now." },
        { id = "h_default", key = true,
          text = "Deathguard Humbert. I came back to camp one evening and my gear was gone, and the tracks led to Dun Garok. Dwarven scouts, sneaking past while I was busy elsewhere, and now I stand guard with a borrowed club." },
        { id = "h_sword", when = { questActive = TODO_QUEST("Humbert's Sword") },
          text = "One of those dwarves at Dun Garok has my sword, but I don't know which one, so you may have to ask a great many of them. Ask firmly." },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Humbert's Sword"), days = 3 } },
          text = "My sword! I've been wearing it everywhere, even indoors. Samsa says I'm overdoing it, but Samsa never lost his." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm still on watch, technically." },
      },
      choices = {
        { text = "The hills are thick with game. Want me to clear some?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Have you asked the spirits to find your sword, Humbert?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How did you lose your gear?", next = "lost" },
        { text = "What's at Dun Garok?", next = "dungarok" },
        { text = "What do the others say?", next = "teasing" },
        { text = "A Forsaken without a sword? Shameful.", next = "scourge", when = { race = "Scourge" } },
        { text = "I'll find it.", next = "END", fx = { affinity = 2 } },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "I'd rather not dwell on it. I left my kit in camp for one patrol, and when I came back it was gone, and the tracks were small and heavy-booted." } },
      choices = {
        { text = "You left your gear behind?", next = "lost_down" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_down = {
      lines = { { id = "ld_default", text = "For one patrol. The dead don't tire, they say, but armor still weighs what it weighs, and I thought the camp was safe. I won't think that again." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    dungarok = {
      lines = { { id = "d_default", text = "An old dwarven fort in the southeast hills, full of Ironforge's soldiers. The High Executor wants it hurt anyway, so you'll have company there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "The bears and the mountain lions, yes, please, because they keep the farmers from the fields and the fields keep us in grain. Bring back pelts if you can, so the tanner stops complaining." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "I'd sooner have {pet} at my side than the sword the dwarves took off me, I'll tell you that. Take it into the hills and clear out the bears and lions, because the farmers can't work the fields while they're about." },
      },
      choices = {
        { text = "I'll clear them for the farms.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt them for my own purse, mind you.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    teasing = {
      big = true,
      lines = { { id = "t_default", text = "Samsa asks if I'd like to borrow a skull to throw. The apothecary asked if he could study my embarrassment, since he hasn't felt any in years." } },
      choices = {
        { text = "Laugh with them. It's the best defense.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A guard who loses his weapon should be disciplined.", next = "BACK", fx = { align = { order = 1 }, affinity = -2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scourge = {
      lines = { { id = "sc_default", text = "I know, I know. The High Executor hasn't said a word about it, which is worse than anything she could have said." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the town and the road to Dun Garok. Ask." } },
    background = { { id = "tp_bg", text = "Deathguard of Tarren Mill, presently unarmed.", next = "lost" } },
    advice = { { id = "tp_ad", text = "Keep your gear on, and trust me on that." } },
    _none = { { id = "tp_none", text = "I don't know. I don't even know where my sword is." } },
  },
}

P:NPC {
  key = "samsa", id = TODO_NPC("Deathguard Samsa"), name = "Deathguard Samsa",
  bible = "bibles/tarrenmill_more.md", role = "guard", tier = "quest",
  communities = { "tarren_mill" }, temper = { "morbid" }, values = { "dutiful" },
  notices = { "race", "class" },

  impression = {
    first = "Deathguard Samsa is stuck on guard duty while others fight Hillsbrad's humans, and he collects their skulls to feel included. He seems cheerful about it, which is worse.",
    third = "{name} met Deathguard Samsa of Tarren Mill, who collects human skulls from Hillsbrad's battles.",
  },

  greetings = {
    { id = "g_default", text = "Off to fight the humans? Lucky you. I'm stuck here guarding a door." },
    { id = "g_back", when = { metBefore = true }, text = "The lucky one returns! How many humans did you put down today, hundreds I hope?" },
  },

  notice = {
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of us, good. You'll understand that a skull is only a skull once you've seen your own in a mirror." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I'd love it, as long as the High Executor doesn't ask what it's for, and I'd love it more if it scared off Southshore's scouts. Mind you don't plant it near my skulls, though, because I've only just got them lined up straight." } },
      choices = {
        { text = "I'll ask the High Executor first. Her town, her rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll plant it where the spirits want it, permission or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! I've heard you can call lightning out of a clear sky, which must be marvellous, though I'm stuck here guarding a door where nothing ever needs striking." },
        { id = "h_default", key = true,
          text = "Deathguard Samsa. While you're out slaying humans and pillaging farms, I stand at this post, so I've taken up a hobby: skulls, human ones, from the fields." },
        { id = "h_skulls", when = { questActive = TODO_QUEST("Souvenirs of Death") },
          text = "Thirty human skulls, that's all I ask, and you'll be fighting humans long enough to find them. Bring them by whenever your bag gets heavy." },
        { id = "h_skulls_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Souvenirs of Death"), days = 3 } },
          text = "Thirty! I've arranged them on the wall behind the inn, and Shay says it puts the customers off. The customers here are dead, Shay." },
      },
      again = {
        { id = "h_again", text = "Anything else? I have nowhere to be." },
        { id = "h_again2", text = "Go on, tell me about the fighting." },
      },
      choices = {
        { text = "Southshore's guards are soft. Let me test them.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Would you let me set a totem by your door, Samsa?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why skulls?", next = "skulls" },
        { text = "Why aren't you fighting?", next = "post" },
        { text = "What do you think of Humbert?", next = "humbert" },
        { text = "The living Horde find this grim.", next = "living", when = { race = { "Orc", "Tauren", "Troll" } } },
        { text = "I'll bring you skulls.", next = "END", fx = { affinity = 2 } },
      },
    },
    skulls = {
      big = true,
      lines = { { id = "s_default", text = "Because they did it to us first, in the plague years, tossing our bodies on carts and burning them in heaps. A skull on my wall is the most dignity any human ever showed one of us." } },
      choices = {
        { text = "Fair trade. Every skull is a debt repaid.", next = "BACK", fx = { align = { light = -1 }, affinity = 2 } },
        { text = "That's no dignity. That's just desecration.", next = "BACK", fx = { align = { light = 1 }, affinity = -2 } },
        { text = "Were you burned?", next = "skulls_burned" },
      },
    },
    skulls_burned = {
      lines = { { id = "sb_default", text = "Nearly. I rose in the cart before they lit it, and I've never been so glad to be dead. The driver was less glad." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    post = {
      lines = { { id = "p_default", text = "Somebody has to watch Tarren Mill while the High Executor's soldiers are out in the fields, and somebody was me. I asked twice to be moved, and now I don't ask." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    humbert = {
      lines = { { id = "h2_default", text = "Poor Humbert. I've offered to lend him a femur until he finds his sword, and he hasn't once thanked me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "I'm sure they are, and I'm sure you'd enjoy it, but the High Executor wants raids planned, not wandered into. Ask Darthalia first, and then go and test them as hard as you like." } },
      choices = {
        { text = "Fair enough. I'll ask before I strike.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't wait for permission to fight humans.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    living = {
      lines = { { id = "l_default", text = "Do they? The ogres in Alterac wear far worse, and nobody says a thing to them. You'll get used to me, I promise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know everyone who comes and goes from this town, since I'm always here. Ask." } },
    background = { { id = "tp_bg", text = "Deathguard, collector, and doorman. Not by choice, the last.", next = "post" } },
    advice = { { id = "tp_ad", text = "Clean the skulls before you bring them. I'm not a barbarian." } },
    _none = { { id = "tp_none", text = "Can't say. I've been at this post too long to know anything else." } },
  },
}

P:NPC {
  key = "tallow", id = TODO_NPC("Tallow"), name = "Tallow",
  bible = "bibles/tarrenmill_more.md", role = "soldier", tier = "quest",
  communities = { "tarren_mill" }, temper = { "contemptuous" }, values = { "relentless" },
  notices = { "class", "kit" },

  impression = {
    first = "Tallow is a Forsaken warrior who looked me over and found me wanting. He's been asked to send help to Hammerfall and doesn't seem to care much whether the help survives.",
    third = "{name} met Tallow, a scornful Forsaken warrior at Tarren Mill who sends fighters to Hammerfall.",
  },

  greetings = {
    { id = "g_default", text = "You're looking at me like you want something. Out with it, then." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive? I'm almost impressed." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. We'll see if you've earned the word yet, or if you just carry it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look beaten. Come back when you look like you did the beating." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "You can call fire and close wounds, so you're more use than half the recruits I send to Hammerfall. What I don't trust is the talking, because the spirits never asked the dead what we wanted, and I don't see why I should care what they want now." } },
      choices = {
        { text = "The spirits mourn the dead too. They'd welcome you, given the chance.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair enough. The spirits can wait, but Hammerfall can't.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. Hammerfall's orcs could use one, since they're losing ground to the Boulderfist, and maybe they'd listen to someone who talks to rocks." },
        { id = "h_default", key = true,
          text = "Tallow. Hammerfall's under attack in Arathi, and the orcs there need help before they're overrun. I'd go myself, but this town keeps me so busy I can barely keep an edge on my axe." },
        { id = "h_hammer", tags = { "news" }, when = { questActive = TODO_QUEST("The Hammer May Fall") },
          text = "The Boulderfist mound northeast of Stromgarde. Kill enough ogres and enforcers there to prove you won't die on the road, then report to Drum Fel in Hammerfall." },
        { id = "h_hammer_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Hammer May Fall") },
          text = "You came back from Arathi on your own legs. Drum Fel must be pleased, or desperate; probably both." },
      },
      again = {
        { id = "h_again", text = "Something else? Say it." },
      },
      choices = {
        { text = "Do the Forsaken have any use for shamans, Tallow?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why send me at all?", next = "why" },
        { text = "What's Hammerfall to the Forsaken?", next = "hammerfall" },
        { text = "What's wrong with your axe?", next = "axe" },
        { text = "I'm a warrior. Test me yourself.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I'll go.", next = "END", fx = { affinity = 1 } },
      },
    },
    why = {
      big = true,
      lines = { { id = "w_default", text = "Either the ogres finish you and that's one less fool in my town, or you're strong enough to help. I win either way, and I don't much mind which." } },
      choices = {
        { text = "Honest, at least. I'll prove you wrong.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Then I'll go when it suits me, not you.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Why not test me here?", next = "why_test" },
      },
    },
    why_test = {
      lines = { { id = "wt_default", text = "Because the mound is a better judge than I am, and the ogres don't stop to be polite. If you can handle their enforcers, you can handle Hammerfall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hammerfall = {
      lines = { { id = "h2_default", text = "An ally, which the Dark Lady values, and a wall between Southshore's friends and our flank. If it falls, the ogres come north next, and I don't care to share the hills with them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    axe = {
      lines = { { id = "a_default", text = "Nothing that a quiet week wouldn't fix, and I haven't had one since I died. Weaklings everywhere, all needing orders." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Me? You're not worth the notch on my blade. Go to the mound, come back, and then maybe I'll spar with you, if I'm bored." } },
      choices = { { text = "I'll hold you to it.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know who's weak. Ask about anything else and I'll decide if you're worth answering." } },
    background = { { id = "tp_bg", text = "Warrior before, warrior after. The middle part was unpleasant." } },
    advice = { { id = "tp_ad", text = "Hit first. The ogres will hit harder." } },
    _none = { { id = "tp_none", text = "Ask someone who cares, because that isn't me." } },
  },
}

P:NPC {
  key = "zarise", id = TODO_NPC("Zarise"), name = "Zarise",
  bible = "bibles/tarrenmill_more.md", role = "flightmaster", tier = "service",
  communities = { "tarren_mill" }, temper = { "dry" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Zarise handles the bats at Tarren Mill and finds the living's fear of them amusing.",
    third = "{name} met Zarise, the bat handler at Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "The bats are hungry and so is the wind. Where are you going?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The bats remember your smell, which is a compliment, mostly." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living one. Don't flinch when they land on you; they take it personally." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Only over the mountains, where the air gets thin and moody and the bats have to fight for every wingbeat to Revantusk. Some of the trolls say the spirits of the peaks get angry up there, but I say it's weather, and the bats agree with me." } },
      choices = {
        { text = "I'll ask the winds to grant your bats safe passage.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then bind the winds and make them carry the bats.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. The bats don't care for lightning, so kindly keep it in your pocket until we're well clear of the Mill." },
        { id = "h_default", key = true,
          text = "Zarise, bat handler. They fly to the Undercity and to Hammerfall, and over the mountains to Revantusk, and they'll bring you back if you're polite to them." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night is when they like to fly, and so do I, if I'm honest. Southshore's archers can't see a bat in the dark." },
      },
      again = {
        { id = "h_again", text = "Anything else? They're restless." },
      },
      choices = {
        { text = "Do the wind spirits trouble your bats in flight?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Why bats?", next = "bats" },
        { text = "Do they ever drop anyone?", next = "drop" },
        { text = "Not today.", next = "END" },
      },
    },
    bats = {
      lines = { { id = "b_default", text = "They don't mind the dead, and they don't mind the dark, and they don't need the reins I can't feel anymore. A gryphon would never have one of us on its back." } },
      choices = {
        { text = "Where do they come from?", next = "bats_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bats_where = {
      lines = { { id = "bw_default", text = "Bred under the Undercity, in the dark, by people far more patient than I am. I only fly them, feed them and listen to their complaints." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    drop = {
      lines = { { id = "d_default", text = "Only the rude ones. Be kind to your bat, and it will be kind to you, for about as long as the flight lasts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Routes and bats are my whole world, I'm afraid." } },
    background = { { id = "tp_bg", text = "I was something else once. Now I fly bats, and I like it better." } },
    advice = { { id = "tp_ad", text = "Hold still when you land, because the bats hate a fidget." } },
    _none = { { id = "tp_none", text = "Ask somebody on the ground. I'm mostly in the air." } },
  },
}

P:NPC {
  key = "kayren", id = TODO_NPC("Kayren Soothallow"), name = "Kayren Soothallow",
  bible = "bibles/tarrenmill_more.md", role = "vendor", tier = "service",
  communities = { "tarren_mill" }, temper = { "tidy" }, values = { "practical" },
  notices = { "race" },

  impression = {
    first = "Kayren Soothallow sells general goods in Tarren Mill and keeps a separate shelf of food for the living allies, kept well apart from the rest.",
    third = "{name} met Kayren Soothallow, who sells general goods in Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "Rope, flasks, thread, and food for those who still need it. What will it be?" },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "Your food is on the left shelf, the fresh shelf. Please don't touch the right one." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not many, though one came through last month and bought every flask on the shelf to fill at the well, and I didn't ask what he meant to do with them. He paid in full and said thank you, which is more than the Deathguards ever manage." } },
      choices = {
        { text = "I'll buy here, and tell the Horde you treat the living fairly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll gather what I need from the land, not a shelf.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. The Undercity's reagent sellers keep ankhs for your kind, I'm told, and I've never understood why the dead would sell anyone a second life." },
        { id = "h_default", key = true,
          text = "Kayren Soothallow, general goods. The dead need less than the living, but we still need rope, and somebody has to sell it." },
      },
      again = {
        { id = "h_again", text = "Anything else on your list?" },
      },
      choices = {
        { text = "Do you sell arrows, or only reagents?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Do many shamans pass through your shop, Kayren?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What's on the right shelf?", next = "shelf" },
        { text = "Do the dead buy much?", next = "dead" },
        { text = "Nothing today.", next = "END" },
      },
    },
    shelf = {
      lines = { { id = "s_default", text = "The apothecaries' orders. Vials, mostly, and some things in jars I'd rather not open. Lydon picks them up himself." } },
      choices = {
        { text = "What's in the jars?", next = "shelf_jars" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shelf_jars = {
      lines = { { id = "sj_default", text = "I don't ask, and he doesn't tell, and we've got along nicely for a year that way. Shall we keep it so?" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Arrows, shot, and a few odds and ends a hunter always runs short of, though the poisons are on a separate shelf. A hunter who buys from me comes back, and I like that kind of customer." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Arrows and shot are on the middle shelf, and I'd ask {pet} to keep its nose away from the bottom one, where the poisons are. A hunter who buys from me comes back, and I'd like your companion to come back with you." },
      },
      choices = {
        { text = "I'll shop here, then, and keep coming back.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll buy where it's cheapest, not where it's friendly.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Thread for mending, oil for blades, and the odd candle, out of habit. Most of us remember liking candles, even if we can't remember why." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Stock and prices, and who buys what. Ask." } },
    background = { { id = "tp_bg", text = "I kept a shop before the plague. I keep one after. It's the same shop, nearly." } },
    advice = { { id = "tp_ad", text = "Buy rope. Everyone always needs rope, and nobody ever has it." } },
    _none = { { id = "tp_none", text = "Not something I carry, I'm afraid, and the Tarren Mill gossip hasn't mentioned it either." } },
  },
}
