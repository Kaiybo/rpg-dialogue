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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The humans who kept the camps called on the Light while my people sat in chains, and I learned to hate the sound of it. But you fight for the Horde with it, and a weapon is not guilty of the hand that held it before, so I will judge you by your deeds." } },
      choices = {
        { text = "Then judge me by them. I'll fight for the Horde.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The Light's past is not my burden to carry, Krusk.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every day I think it, and every day I'm told the Dark Lady's people need me here instead. The Syndicate killed my brothers in the very keep where the Warchief was once held prisoner, and I won't rest well until that courtyard is ours." } },
      choices = {
        { text = "Then we go when you're ordered, and not before.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget orders. Your brothers deserve vengeance now.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Krusk.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "If you can follow their scouts back to the keep, I'll know which gate they watch and which they don't. They saw us coming because we marched straight up the road like fools, and I won't make that mistake twice." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would have smelled them behind those broken walls long before we walked into that courtyard. Keep it close at Durnholde, and listen when it growls." },
      },
      choices = {
        { text = "I'll find them, and you can face them openly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll find them, and we'll take them in their sleep.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Swordsmen in black, more than we could count, and behind them a few men in robes throwing shadow at us from the walls. I could fight the swords, but those casters knocked Tog'thar flat before he ever reached them." } },
      choices = {
        { text = "Tell the High Executor. Durnholde needs a proper assault.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No need to wait for orders. I'll go tonight.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "We did, and he was the first to fall, because the Syndicate knew to aim at the one calling the lightning. If the spirits could not save him, I have to wonder whether these hills are too full of the dead for them to hear us." } },
      choices = {
        { text = "Then I'll honor him by freeing Drull and Tog'thar.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Next time I'll knife the Syndicate before they nock an arrow.", next = "BACK", fx = { align = { honor = -1 } } },
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
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They knew the ruins better than we did, and they waited behind the fallen wall until we were in the courtyard. I fought my way out alone, and I've wondered every day since who told them we were coming." } },
      choices = {
        { text = "Let me find who betrayed you. They should answer for it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The past is done. Fight for the living now.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Krusk.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I think any power that once enslaved us could do it again, and Thrall freed us at too high a price to risk it. You may be different from the warlocks of my father's time, but you'll have to prove it, not just tell me." } },
      choices = {
        { text = "Then I'll prove it with my deeds, not my words.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Horde needs every power it can get. Even mine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman, and of the Warchief's own calling. The spirits came back to our people because Thrall asked them to, and I trust them more than I trust anyone in this town of corpses." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A tauren druid. I wish I'd had one of you with us at Durnholde, because I would not be the only one left to tell of it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. My band had no healer at Durnholde, and I've thought about that every night since, so whether you serve the loa or whatever the dead pray to, you're welcome at my fire." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. The Syndicate had spellcasters in Durnholde's ruins, and if you can burn theirs before they burn yours, I'll call you friend." },
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
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. If you'd been with my band at Durnholde, perhaps the humans wouldn't have caught us by surprise, and I'd have more friends left to drink with." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The old Horde's warlocks sold us to the demons once, and no orc who remembers the camps has forgotten it, so I'll be watching you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! At last, someone in this town who fights with a blade and still breathes air. Sit, and tell me you've come to help me pay back the Syndicate." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter of the Horde. The Syndicate hid in the Durnholde ruins like rats, and I'd have given much for someone who could track rats." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "You are one of the dead, and you call on the Light like the human knights who guarded the camps. I do not know what to make of that, but I have seen stranger things since I came to these hills." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I sharpen." },
        { id = "h_again2", text = "Go on, I'm listening. This blade's got more nicks than a quilboar's hide, so I'll be at it a while." },
      },
      choices = {
        { text = "Would a druid have saved them, Krusk?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Did your band have a shaman with them at Durnholde?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What did the Syndicate have waiting at Durnholde, Krusk?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What happened at Durnholde?", next = "ambush" },
        { text = "What were you sent to find?", next = "mission" },
        { text = "How do you like the Forsaken?", next = "forsaken" },
        { text = "Who is Gol'dir?", next = "goldir" },
        { text = "I was born in a human camp myself.", next = "camp", when = { origin = { "orc_camp_born", "orc_camp_primer" } } },
        { text = "I'm Forsaken. Speak plainly about us.", next = "scourge", when = { race = "Scourge" } },
        { text = "How did the Syndicate catch your band at Durnholde, Krusk?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you think warlocks still endanger the Horde, Krusk?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you mean to go back to Durnholde, Krusk?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should I track the Syndicate at Durnholde for you, Krusk?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does the Light of the camps still trouble you, Krusk?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    thrall = { { id = "tp_thrall", text = "The Warchief sent me here, and I came, and my companions died at Durnholde for it. I'd follow him into the sea, but I'd rather he'd sent me somewhere with fewer dead." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken fight the Scourge, and they fight the humans, and they smell like both. I share a town with them because the Warchief asks it, and that's all I'll say." } },
    internment = { { id = "tp_internment", text = "Durnholde was my prison once, before the Warchief broke it open. Going back there with my companions and losing them in its shadow was the worst thing I've ever done." } },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "You could try, but the Dark Lady's people don't fuss over a little necromancy pointed at Southshore. Helcular was murdered by a mob with torches and pitchforks, and the Light did nothing to stop them, so I don't think it gets a say in what happens to his bones." } },
      choices = {
        { text = "The dead should rest. I won't help you raise him.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If he serves against Southshore, raise him.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Freed? They were bred for him, made for his work, and they'd return to me if they had any loyalty. I think they're waiting for him to rise, and I mean to be there when he does." } },
      choices = {
        { text = "They're beasts. Let them go wild and be done.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Put them down. Hounds of a would-be lich can't run free.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I'd set you on the ones who carried the torches, and they're old men now, sitting in the inn and boasting about the night they killed a necromancer. Once Helcular rises, they'll have something new to talk about, though not for very long." } },
      choices = {
        { text = "Old men with pitchforks aren't worth my blade.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They chose the mob. Let them face what they made.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Thaivand.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The mob dragged them out and burned them in the yard, because they said anything a necromancer loved must be cursed. They were only dogs, and they howled for him, and I think that's what the peasants couldn't stand." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} close if you go near Southshore, hunter. They've killed loyal beasts before for the master they served, and I doubt they've grown any kinder since." },
      },
      choices = {
        { text = "Grief is no reason to raise the dead. Let him rest.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then raise him, and let the mob reap what it sowed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "His spirit was torn out of him by a mob of farmers with pitchforks, and nobody asked his will then. When I call him back he will thank me, and the first thing he will do is visit Southshore's churchyard and return the favour." } },
      choices = {
        { text = "The dead deserve rest, even Helcular. I won't help bind him.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then call him back, and let Southshore reap what it sowed.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Helcular's remains, and the flame he used to channel his power, which those peasants buried with him out of spite. If you brought them to me, I could raise him again, and then Southshore would learn what a lynch mob costs." } },
      choices = {
        { text = "Your vengeance isn't my business. I'll keep out of it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The mob deserves what's coming. I'll help you.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Thaivand.", next = "BACK" },
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
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You could slip into Southshore far more easily than I can, and there are things buried in their graveyard that belong to my master." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The peasants of Southshore struck down my master with pitchforks and torches, and I'd dearly love to see how they fare against real steel." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. My master kept hounds once, great black beasts the peasants burned along with him, and I've never forgiven them for that either." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid. You talk to the beasts, don't you? Helcular's hounds still wander the hills, and they won't come to me, though I've tried and tried." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. Helcular hated your kind, and I suspect you'd hate what I'm doing here, so let's agree not to stand too close to each other." },
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
        { text = "What's buried in Southshore's graveyard, Thaivand?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would you set a warrior on Southshore's farmers, Thaivand?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What happened to Helcular's hounds, Thaivand?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Should Helcular's hounds be freed or put down?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Should I stop you from raising Helcular, novice?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    forsaken = { { id = "tp_forsaken", text = "The Forsaken gave me a place to work, and a master to raise, and I'll serve them as long as they let me. Southshore killed Helcular, and I'll see them pay for it." } },
    scourge = { { id = "tp_scourge", text = "The Scourge are slaves, and we are free, and the difference is everything to me. I'll raise my master as one of the free dead, or not at all." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady lets me work, and that's all I ask of any queen. Helcular bowed to no king in life, and I mean to raise him free, with only the Dark Lady above him." } },
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
    { id = "g_xknight", when = { origin = "forsaken_risen_knight" }, text = "You were a knight, weren't you, a real one, with an oath and everything? Then you'll understand a man missing his sword better than most, so if you see it, please do tell me." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc! If you see any dwarves at Dun Garok with a Forsaken blade, you'll know where it came from." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Respect you? They'd shoot you twice to be sure, because a dwarf knows a paladin as one of their own and a Forsaken as a monster, and you're both. Better to come at them in plate with a hammer and let them sort out their feelings afterwards." } },
      choices = {
        { text = "I'd sooner face them openly, hammer raised.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take your gear back quietly, by night.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I was busy, and they were quiet, and that's all I'll say on it. Dun Garok's dwarves know these hills better than we do, I'll admit it, but they don't know them as well as a tauren nose would." } },
      choices = {
        { text = "I'll help you track them. A guard needs his gear.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A guard who loses his gear should earn it back himself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To dwarves from Dun Garok, who crept into camp while I was on watch and took everything that wasn't strapped to me. A warrior without his blade is a scarecrow with a grudge, and the other Deathguards have started calling me exactly that." } },
      choices = {
        { text = "Report it honestly and take your punishment. That's a soldier's way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the report. Raid Dun Garok and take it back.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Humbert.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Only that it's a dwarven fort dug into the hills to the south, full of riflemen and mountaineers who never seem to sleep. A spell or two through the gate would make them a good deal less smug, and I'd like to be there to see it, borrowed club and all." } },
      choices = {
        { text = "I'll get your sword back and report to the High Executor.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the orders. I'll burn their gate down for you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I asked a troll who was passing through, and he burned some leaves and told me the sword was somewhere to the south, which I already knew, because that's where the dwarves of Dun Garok live. If the spirits are going to tell me things, I'd like them to be more specific." } },
      choices = {
        { text = "Win it back from the dwarves yourself. That's how a soldier mends shame.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Forget that sword. Take a better one off a Southshore guard.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They waited until I was relieving a patrol and crept past my tent in the dark, which I'll admit was well done. Dwarves from Dun Garok are better sneaks than anyone gives them credit for, and now I'm the joke of Tarren Mill." } },
      choices = {
        { text = "Then I'll take it back from them, quietly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A guard who loses his gear deserves the jokes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Humbert.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "No, but I'm desperate, and desperate men consider foolish things. The High Executor would have my head if she saw a demon wandering around the camp, so I'll stick with my own two eyes, for all the good they've done me." } },
      choices = {
        { text = "Your eyes are enough. Keep watch and you'll be fine.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Use what you have. A demon is a better guard than a dead man.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! Do the spirits ever tell you where things are? Only I've lost a sword, as everyone keeps reminding me, and I'm not too proud to ask anyone for help now." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest! You don't happen to have a prayer for finding lost things, do you? I'd take one from the loa or the Light or anyone else who's listening." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage! Could you conjure me a sword, only for a little while? No, I didn't think so, but you can't blame a Deathguard for asking." },
        { id = "h_default", key = true,
          text = "Deathguard Humbert. I came back to camp one evening and my gear was gone, and the tracks led to Dun Garok. Dwarven scouts, sneaking past while I was busy elsewhere, and now I stand guard with a borrowed club." },
        { id = "h_sword", when = { questActive = TODO_QUEST("Humbert's Sword") },
          text = "One of those dwarves at Dun Garok has my sword, but I don't know which one, so you may have to ask a great many of them. Ask firmly." },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Humbert's Sword"), days = 3 } },
          text = "My sword! I've been wearing it everywhere, even indoors. Samsa says I'm overdoing it, but Samsa never lost his." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. If you'd been standing watch with me, perhaps those dwarves wouldn't have walked off with my gear, so I'll not pretend I'm glad to see you." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I'd ask your demon to guard my tent, but I suppose it would steal more than the dwarves ever did." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and fully armed, which is more than I can say for myself. Don't look at my belt, please, because there's no sword on it, and I know." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid, and twice my size. I don't suppose you could track a pack of dwarven scouts by smell? Mine has been gone for years." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. I'd ask you to bless my borrowed club, only I think it would be wasted on it, and the dwarves of Dun Garok would just steal that too." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm still on watch, technically." },
      },
      choices = {
        { text = "The hills are thick with game. Want me to clear some?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Have you asked the spirits to find your sword, Humbert?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do you know about Dun Garok's defenses, Humbert?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "How did you lose your gear?", next = "lost" },
        { text = "What's at Dun Garok?", next = "dungarok" },
        { text = "What do the others say?", next = "teasing" },
        { text = "A Forsaken without a sword? Shameful.", next = "scourge", when = { race = "Scourge" } },
        { text = "How did the dwarves steal your gear, Humbert?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Would you really trust a demon to guard your tent, Humbert?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How does a Deathguard lose his sword, Humbert?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How did dwarven scouts slip past a Deathguard?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Would the dwarves of Dun Garok respect a Forsaken paladin, Humbert?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    forsaken = { { id = "tp_forsaken", text = "We are the Forsaken, and I am a Deathguard of Tarren Mill, and I lost my gear to the dwarves of Dun Garok. I'd rather not discuss the second part." } },
    scourge = { { id = "tp_scourge", text = "The Scourge are slow and stupid, and we fight them whenever they come south. I'd fight them now, if I had a sword." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady would be ashamed of me if she knew about my gear. I'm hoping she never finds out." } },
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
    { id = "g_xremember", when = { origin = "forsaken_scourge_remembered" }, text = "You remember marching with the Scourge? I don't, and some days I envy you, because at least you went places. Sorry, that came out wrong; it's this door, it does things to a person." },
  },

  notice = {
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of us, good. You'll understand that a skull is only a skull once you've seen your own in a mirror." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Probably not, but the Light doesn't stand guard at this post all day, and I do. You can leave the skulls on the field if you like, though they'll only be bleached by the sun and gnawed by the dogs, and I'd give them a good home." } },
      choices = {
        { text = "Leave the dead be. They fought for their homes.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A skull's a skull. I'll bring you what I find.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Peace? They're humans, druid, and they'd have done the same to me. Still, I'll admit a few of the skulls have made me wonder whose they were, and I've buried two of them again without telling anyone." } },
      choices = {
        { text = "Bury them all. The dead deserve their rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're trophies of war. Keep them and be proud.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The good ones do, I'm sure, since a hunter without a trophy is just someone who went for a walk with a bow. I named my skulls after the farms they came from, which I thought was clever, though Darthalia says it's morbid, and she's dead." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Does {pet} like skulls? I'd let it have one of the small ones, but I've grown attached to them all, so perhaps just a sniff." },
      },
      choices = {
        { text = "A hunter honors the kill. Skulls on a gate are mockery.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Trophies remind the enemy who's winning. Keep collecting.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Samsa.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The farmers run, mostly, though the guards from Southshore stand their ground and shout for help. I'd love to see what happens when someone answers them with a spell, but since nobody lets me leave this door, you'll have to go and tell me afterward." } },
      choices = {
        { text = "I'll fight the guards. The farmers can run.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Farmers or guards, I'll bring you every skull.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I'd love it, as long as the High Executor doesn't ask what it's for, and I'd love it more if it scared off Southshore's scouts. Mind you don't plant it near my skulls, though, because I've only just got them lined up straight." } },
      choices = {
        { text = "I'll ask the High Executor first. Her town, her rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll plant it where the spirits want it, permission or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because I'm stuck at this post while everyone else gets to fight, and skulls are the closest thing I have to a war story. I've got a dozen now, and I've named most of them, which the others find unsettling." } },
      choices = {
        { text = "Collecting skulls is no way to honor a fight.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A trophy is a trophy. I'll bring you more.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Samsa.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They say they're too busy with the Dark Lady's work to waste reagents on decoration, which I think is very unfriendly of them. I only want one glowing skull, and I'd put it right by the gate where the humans could see." } },
      choices = {
        { text = "That's grim work, Samsa. I won't help with it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A glowing skull at the gate would frighten the humans nicely.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! I've heard you can call lightning out of a clear sky, which must be marvellous, though I'm stuck here guarding a door where nothing ever needs striking." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest! You couldn't say a few words over my skulls, could you? Not a blessing exactly, just something to make them feel welcome on the wall." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock! Tell me, do your demons collect anything? I've always thought an imp would appreciate a good skull." },
        { id = "h_default", key = true,
          text = "Deathguard Samsa. While you're out slaying humans and pillaging farms, I stand at this post, so I've taken up a hobby: skulls, human ones, from the fields." },
        { id = "h_skulls", when = { questActive = TODO_QUEST("Souvenirs of Death") },
          text = "Thirty human skulls, that's all I ask, and you'll be fighting humans long enough to find them. Bring them by whenever your bag gets heavy." },
        { id = "h_skulls_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Souvenirs of Death"), days = 3 } },
          text = "Thirty! I've arranged them on the wall behind the inn, and Shay says it puts the customers off. The customers here are dead, Shay." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You'd be good at collecting skulls, I think, since you could get close enough to take them without anyone noticing." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Could you make one of my skulls glow? I've always wanted a lantern with a face, and the apothecaries won't help me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Do you take trophies? I've a dozen skulls by the gate, and I'd love to hear how a proper hunter keeps them clean." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid! Do your people collect skulls? Bones, perhaps, or antlers, or anything else that holds a man's interest on a quiet post?" },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin! Now I've always wondered whether a human skull taken by a holy hammer looks any different from the rest, so bring me one and we'll compare it to the collection." },
      },
      again = {
        { id = "h_again", text = "Anything else? I have nowhere to be." },
        { id = "h_again2", text = "Go on, tell me about the fighting. The most action I've seen this week was a rat in the grain store, and the rat won." },
      },
      choices = {
        { text = "Southshore's guards are soft. Let me test them.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Would you let me set a totem by your door, Samsa?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How do the Hillsbrad humans handle spellcasters, Samsa?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why skulls?", next = "skulls" },
        { text = "Why aren't you fighting?", next = "post" },
        { text = "What do you think of Humbert?", next = "humbert" },
        { text = "The living Horde find this grim.", next = "living", when = { race = { "Orc", "Tauren", "Troll" } } },
        { text = "Why do you collect skulls, Samsa?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why won't the apothecaries help with your skulls, Samsa?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you think hunters really keep trophies, Samsa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Should the dead of these fields be left in peace?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Would the Light want me collecting skulls for you, Samsa?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
        { text = "Understood. I'll ask before I strike.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
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
    forsaken = { { id = "tp_forsaken", text = "We are the Forsaken, and I collect human skulls because I'm stuck on guard duty. It's a hobby, and it passes the time." } },
    scourge = { { id = "tp_scourge", text = "The Scourge are boring, really, all shambling and groaning and no conversation at all. I'd rather fight humans, they at least scream interestingly." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady would approve of my skull collection, I think. I'm hoping to show it to her someday." } },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I think the orcs there trust a healer, and they won't care what you are as long as you keep them standing. The dead in Tarren Mill can stitch themselves and the living in Hammerfall can't, so go where it counts." } },
      choices = {
        { text = "Then I'll go to Hammerfall. The Horde needs it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll decide where I'm needed, Tallow, not you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every pair of hands helps at Hammerfall, and your hands do more than most. I've seen a tauren druid turn into a bear and break an Alliance line with one charge, and I've never seen anything finer." } },
      choices = {
        { text = "The Horde's wars are mine too. I'll fight.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My oath is to the land, not to every battle.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Watch the Stromgarde roads and count the soldiers marching on them, since the orcs are poor at counting and worse at waiting. The Witherbark in the hills will want your scalp, so don't spend too long admiring the view." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks sturdier than half the reinforcements I've sent east. Bring it back alive if you can, because a good beast is harder to replace than a recruit." },
      },
      choices = {
        { text = "Send help that can survive, Tallow. Lives aren't cheap.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Good. The weak ones only slow the rest down.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Tallow.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Their magi, who throw fire from the back of the mound while the brutes swing clubs at the front. Kill the magi first and the rest fall apart, or so Drum Fel tells me, and he's lived long enough to be right about these things." } },
      choices = {
        { text = "I'll take their magi first, as Drum Fel advises.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hit whatever's closest. Plans don't survive ogres.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "You can call fire and close wounds, so you're more use than half the recruits I send to Hammerfall. What I don't trust is the talking, because the spirits never asked the dead what we wanted, and I don't see why I should care what they want now." } },
      choices = {
        { text = "The spirits mourn the dead too. They'd welcome you, given the chance.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The spirits will keep. Hammerfall won't.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That's what I'd like to know, since they've been moving men around the Arathi Highlands like they mean to finish the orcs off for good. A rogue who came back with their plans would be worth a dozen warriors to me." } },
      choices = {
        { text = "I'll find their plans and bring them back.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the orcs handle Hammerfall themselves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Tallow.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I think anything that keeps an orc alive at Hammerfall belongs there, and I've no sentiment about the rest. The orcs might disagree, given their history, but they're the ones being overrun, so they can argue about it afterward." } },
      choices = {
        { text = "Victory is all that matters. Use every weapon.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The orcs' history deserves respect. I'll fight with my own hands.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. Hammerfall's orcs could use one, since they're losing ground to the Boulderfist, and maybe they'd listen to someone who talks to rocks." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Hammerfall's grunts bleed faster than anyone can bandage them, so go and be useful there, whatever it is you pray to." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. The Boulderfist ogres are big, slow and stupid, which is exactly the kind of target your sort ought to enjoy." },
        { id = "h_default", key = true,
          text = "Tallow. Hammerfall's under attack in Arathi, and the orcs there need help before they're overrun. I'd go myself, but this town keeps me so busy I can barely keep an edge on my axe." },
        { id = "h_hammer", tags = { "news" }, when = { questActive = TODO_QUEST("The Hammer May Fall") },
          text = "The Boulderfist mound northeast of Stromgarde. Kill enough ogres and enforcers there to prove you won't die on the road, then report to Drum Fel in Hammerfall." },
        { id = "h_hammer_done", tags = { "news" }, when = { questDone = TODO_QUEST("The Hammer May Fall") },
          text = "You came back from Arathi on your own legs. Drum Fel must be pleased, or desperate; probably both." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll be no use at Hammerfall, where the orcs need shields and axes, but I suppose you could slip past the Stromgarde lines and see what they're planning." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Your demon could hold a line at Hammerfall for a while, I suppose, which is more than most of the soft-skinned ones I'm sent could manage." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Hammerfall needs scouts as much as shields, I'm told, so you might be some use to the orcs, if you don't die on the way." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid! Your people could heal half the wounded at Hammerfall in an afternoon. Why aren't you there?" },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. You'll want to heal everyone you pass, I expect, and I'd rather you saved it for Hammerfall, where the orcs need it more than the dead here do." },
      },
      again = {
        { id = "h_again", text = "Something else? Say it." },
      },
      choices = {
        { text = "Do the Forsaken have any use for shamans, Tallow?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What should a spellcaster watch for among the Boulderfist?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why send me at all?", next = "why" },
        { text = "What's Hammerfall to the Forsaken?", next = "hammerfall" },
        { text = "What's wrong with your axe?", next = "axe" },
        { text = "I'm a warrior. Test me yourself.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "What is Stromgarde planning against Hammerfall, Tallow?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you think demons belong on the Horde's battlefields, Tallow?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What would a hunter do at Hammerfall, Tallow?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Should druids fight in the Horde's wars, Tallow?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do you think I'd be more use at Hammerfall, Tallow?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    forsaken = { { id = "tp_forsaken", text = "We are the Forsaken, and I am a warrior, and you are not impressive. Go to Hammerfall if you want to prove otherwise." } },
    scourge = { { id = "tp_scourge", text = "The Scourge come south, and we cut them down, and they come again. I don't tire of it, and I hope you don't either." } },
    thrall = { { id = "tp_thrall", text = "The Warchief sends his orcs to Hammerfall and asks us for help, and I send what I can. I don't much care if they survive, but the Dark Lady does." } },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They fear the bats already, and a dead knight carrying the Light would frighten them twice over, because it's the last thing they'd expect. I find that very funny, {class}, though I suppose you might not." } },
      choices = {
        { text = "I don't want them afraid. I want them to understand.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them fear it. Fear keeps them off our fields.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The bats mind everything, and they complain constantly in a pitch only they can hear. They're well fed and they fly far, and I think they'd rather do this than hunt moths in a cave, but I'm only guessing." } },
      choices = {
        { text = "They're fed and useful, which is more than most soldiers get.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them rest more often. They're not machines.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They mind noise and weight and anyone who grips the harness like it owes them money, so yes, warriors are their least favourite riders. The warriors are also the ones who scream loudest on the way down to the Undercity, which the bats find very satisfying." } },
      choices = {
        { text = "I'll treat your bats with respect. They're carrying me, after all.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A mount is a mount. It'll carry me whatever I do.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Zarise.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "You could try, and some hunters tame bats out in the wild, where they're fewer and hungrier. Mine were raised in the Undercity, though, and they'd sooner bite you than follow you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} is staring at my bats the way a cat stares at a bird, and the bats are staring back the same way. I'd step between them if I were you, because nobody wins that argument." },
      },
      choices = {
        { text = "Bats bred and trained in the Undercity serve better.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wild beasts are fiercer and freer. I'd take one any day.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Southshore's gryphon riders have tried it over the river, and once a dwarf with a rifle got lucky. A rider who can throw something back at them is the best escort a bat could hope for, and the bats remember who looks after them." } },
      choices = {
        { text = "I'll guard the flights, if the High Executor asks it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll knock their gryphons down whether anyone asks or not.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Only over the mountains, where the air gets thin and moody and the bats have to fight for every wingbeat to Revantusk. Some of the trolls say the spirits of the peaks get angry up there, but I say it's weather, and the bats agree with me." } },
      choices = {
        { text = "I'll ask the winds to grant your bats safe passage.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then bind the winds and make them carry the bats.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a bat hears everything, and loud riders give them headaches, which makes them cranky in the air. You'll get a smoother flight than most, and you'll land where you meant to, which isn't something I can promise the orcs." } },
      choices = {
        { text = "I'll treat them gently. They deserve a quiet rider.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A mount is a mount. It goes where I say.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Zarise.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Once, over Lordamere Lake, and I'll admit I didn't try very hard to find out what happened to him. He'd kicked the bat twice before take-off, and bats remember that sort of thing longer than people do." } },
      choices = {
        { text = "He earned it. Respect your mount and it'll respect you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A bat shouldn't decide who lives. That's cruel.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. The bats don't care for lightning, so kindly keep it in your pocket until we're well clear of the Mill." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. The bats can't hear prayers, or they choose not to, so save yours for the landing at Revantusk, because that one needs it." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Keep your demon out of the roost, please, because the bats can smell what it is and they won't settle for hours afterward." },
        { id = "h_default", key = true,
          text = "Zarise, bat handler. They fly to the Undercity and to Hammerfall, and over the mountains to Revantusk, and they'll bring you back if you're polite to them." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night is when they like to fly, and so do I, though my knees hate the landings. Southshore's archers can't see a bat in the dark." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. The bats like your kind, I've noticed, since you move quietly and don't flap your arms about the way the warriors do." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. You could teleport, I suppose, but the bats are cheaper and they don't drop you in the wrong city, unless you've been rude to them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Leave the shield on the ground before you climb on, because the bats don't like being thumped with it every time you turn around." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The bats will be curious about your beast, so keep it calm, because a curious bat is a nibbling bat." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid. The bats like you already, I can tell, and that's rare, because they don't like anyone." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. The bats don't mind you, though the living will, when you come down out of the sky glowing over their fields." },
      },
      again = {
        { id = "h_again", text = "Anything else? They're restless, and when they're restless they drop things on the roof I'd rather not name." },
      },
      choices = {
        { text = "Do the wind spirits trouble your bats in flight?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does the Alliance ever try to bring your bats down?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Why bats?", next = "bats" },
        { text = "Do they ever drop anyone?", next = "drop" },
        { text = "Why do bats like quiet folk, Zarise?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have the bats ever dropped a rude rider, Zarise?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the bats really mind warriors that much, Zarise?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Could a hunter ever tame one of your bats, Zarise?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the bats mind their work, Zarise?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do the living fear a paladin of the Forsaken, Zarise?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    forsaken = { { id = "tp_forsaken", text = "We are the Forsaken, and my bats carry us across the Lordaeron skies. The living fear them, which I find delightful." } },
    scourge = { { id = "tp_scourge", text = "The Scourge have their own bats, and gargoyles, and worse. Mine are faster, and they don't answer to the Lich King." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady rides my bats when she visits the front, though she hasn't visited in some time. She'd approve of their care, I think." } },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Rope, bandages and patience, same as everyone, though some say paladins need a little more of the last. I'd keep a few bandages anyway, because I hear the Light doesn't always come as quickly to a dead hand as to a living one." } },
      choices = {
        { text = "It comes when I'm worthy of it. I'll stay worthy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I don't wait on the Light. Bandages will do.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not as often as I'd like, for the living spend more coin than the dead. Your folk are the friendliest of them, and you pay fair and don't stare, which is more than I can say for the Deathguards." } },
      choices = {
        { text = "The Horde should stand together, living or dead.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Trust the Forsaken? Not yet, Kayren. Not fully.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Bandages, which surprises the Deathguards, since they've forgotten how much the living bleed. The orcs who pass through on the way to Hammerfall buy them by the armful, and I've started ordering more from the Undercity just to keep up." } },
      choices = {
        { text = "A good soldier carries supplies. Readiness wins wars.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Real warriors fight through it. Bandages are for later.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kayren.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Reagents, mostly, because the caravans from the Undercity come over the hills slowly and the Syndicate rob every third one. A spellcaster riding guard on the next one would be worth more to this town than any shipment I could order." } },
      choices = {
        { text = "I'll guard the next caravan for the town's sake.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll guard it, but I'll want a share of the goods.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not many, though one came through last month and bought every flask on the shelf to fill at the well, and I didn't ask what he meant to do with them. He paid in full and said thank you, which is more than the Deathguards ever manage." } },
      choices = {
        { text = "I'll buy here, and tell the Horde you treat the living fairly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll gather what I need from the land, not a shelf.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More flash powder than anything else, since the fields between here and Southshore are full of human patrols. The rogues come back with stories, and I keep them, the way other merchants keep receipts." } },
      choices = {
        { text = "I'll bring you a story worth keeping.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stories are worthless. Just sell me the powder.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Kayren.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the apothecaries burn them all night, and the Deathguards like a light at their posts even though they can see perfectly well in the dark. Habit, I suppose, or something they miss from when they were alive." } },
      choices = {
        { text = "Keep the candles for them. Some habits are worth keeping.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead don't need light. Sell them to the living.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. The Undercity's reagent sellers keep ankhs for your kind, I'm told, and I've never understood why the dead would sell anyone a second life." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. I keep holy candles for the ones who still need them, and I don't ask whether they burn them for the Light or the loa or something darker." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. I don't stock anything for demons, so don't ask, but your imp is welcome to look as long as it keeps its hands to itself." },
        { id = "h_default", key = true,
          text = "Kayren Soothallow, general goods. The dead need less than the living, but we still need rope, and somebody has to sell it." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You'll want rope, I'd guess, and flash powder, and perhaps a little food for the road, since I hear the living still eat." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. I've a shelf for the living allies, if you're one of them, and a few things for spellcasters, though I'll warn you that candles go faster here than anywhere else." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. I've whetstones, bandages and rations for the living, and I keep them on the shelf furthest from the embalming salts, so you'll not get them muddled." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid. I've nothing to sell you that you couldn't grow yourself, I suppose, but I'm sure I'll find something." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. You'll not need the living allies' shelf, I expect, though I've never been sure whether the Light gives your kind an appetite." },
      },
      again = {
        { id = "h_again", text = "Anything else on your list?" },
      },
      choices = {
        { text = "Do you sell arrows, or only reagents?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Do many shamans pass through your shop, Kayren?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does Tarren Mill run short of, Kayren?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "What's on the right shelf?", next = "shelf" },
        { text = "Do the dead buy much?", next = "dead" },
        { text = "Do you sell much to rogues in Tarren Mill, Kayren?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why do candles go so fast in Tarren Mill, Kayren?", next = "xmage", when = { class = "MAGE" } },
        { text = "What do warriors buy from you most, Kayren?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the living Horde come often to Tarren Mill?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Does a paladin need anything the other dead don't, Kayren?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    forsaken = { { id = "tp_forsaken", text = "We are the Forsaken, and I keep a shelf of food for the living allies, and I keep it well away from the rest. The rest is not for eating, not by you." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's orcs come through Tarren Mill now and then, and they eat like wolves. I keep the shelf stocked, and I don't ask what they think of our cooking." } },
    scourge = { { id = "tp_scourge", text = "The Scourge don't shop, which is a mercy. I'd hate to know what they'd want." } },
    _none = { { id = "tp_none", text = "Not something I carry, I'm afraid, and the Tarren Mill gossip hasn't mentioned it either." } },
  },
}
