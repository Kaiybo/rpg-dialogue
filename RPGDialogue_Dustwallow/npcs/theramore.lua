-- Theramore Isle: Jaina Proudmoore's city on the edge of Dustwallow Marsh. Voice: bibles/dustwallow.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jaina", id = TODO_NPC("Lady Jaina Proudmoore"), name = "Lady Jaina Proudmoore",
  bible = "bibles/dustwallow.md", role = "noble", tier = "major",
  communities = { "theramore" }, temper = { "earnest", "sharp" }, values = { "wise", "kind", "dutiful" },
  notices = { "class", "race", "form" },

  impression = {
    first = "Lady Jaina Proudmoore would rather hear bad news early, and she meant it. She carries Theramore and its peace on her shoulders, and seems to have forgotten what sitting down feels like.",
    third = "{name} met Lady Jaina Proudmoore, who founded Theramore and works to keep the peace between Alliance and Horde.",
  },

  greetings = {
    { id = "g_tower", text = "Welcome to Theramore, and speak freely; I'd rather hear bad news early than good news late." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, good. I have few enough people I can rely on outside these walls." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and I wondered more than once whether the marsh had swallowed you. Welcome back to Theramore, and tell me what you've seen of the world outside it." },
    { id = "g_away_long", when = { away = 60 }, text = "{name}, it's been {away}, and much has happened on this island since you left, little of it restful. I'm glad you've come back to Theramore, because I could use someone I already trust." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown considerably since we last spoke, and I can see it plainly, because Dalaran taught me to recognize power when it walks into a room. I hope it hasn't cost you more than it should." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear you had harsh words with one of my people, and Theramore is too small and too fragile for grudges. I'd ask you to mend it, because this city only works when we trust one another." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Half the city is talking about what you did for Theramore, and I wanted to thank you myself before the stories grew any larger. People like you are what keep this peace standing." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Shadowform... Dalaran kept books on that in rooms apprentices weren't allowed into, and I was an apprentice for a long time. I'm told it's safe, but I'm told a lot of things are safe." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Dalaran trained me, once. Whoever trained you, I hope they taught you that power is the easy part." },
    { id = "n_highborne", cat = "race", when = { race = "NightElf" },
      text = "Your people and mine stood together at Mount Hyjal, and I haven't forgotten. I hope we never have to again." },
  },

  start = "hello",
  nodes = {
    op_orcs = {
      lines = {
        { id = "opo_q", text = "I've spent years learning to see the orcs as people rather than as the monsters my father fought, and I'm still learning. You've travelled among them, so I'd value your honest answer: what do you think of the orcs?" },
        { id = "opo_q_h", when = { faction = "Horde" }, text = "You're of the Horde, so you'll know them far better than I ever can from this side of the marsh. So tell me, what are the orcs like now, under Thrall?" },
      },
      choices = {
        { text = "They've changed under Thrall. They deserve the chance you've given them.", next = "op_orcs_r1", fx = { affinity = 2, align = { light = 1 }, opinion = { orcs = "redeemable" } } },
        { text = "An orc is an orc. The demon blood doesn't wash out.", next = "op_orcs_r2", fx = { affinity = -2, align = { light = -1 }, opinion = { orcs = "hate" } } },
        { text = "Some have changed, some haven't. I judge them one at a time.", next = "op_orcs_r3", fx = { affinity = 1, trait = { cautious = 1 }, opinion = { orcs = "mixed" } } },
        { text = "They're my people, my lady, and they keep their word.", next = "op_orcs_r4", fx = { affinity = 2, opinion = { peace = "peace" } }, when = { race = "Orc" } },
        { text = "I'd rather not answer that, my lady.", next = "BACK" },
      },
    },
    op_orcs_r1 = {
      lines = {
        { id = "op_orcs_r1", text = "I think so too, and it helps more than you'd guess to hear it from someone else. Theramore is built on that chance." },
      },
      choices = {
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    op_orcs_r2 = {
      lines = {
        { id = "op_orcs_r2", text = "My father believed that, and it cost him his life and nearly cost us Kalimdor. I hope you'll find it harder to believe as you travel further." },
      },
      choices = {
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    op_orcs_r3 = {
      lines = {
        { id = "op_orcs_r3", text = "That's all I ask of anyone, on either side of the line. It's slower than hating them all, but it's honest." },
      },
      choices = {
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    op_orcs_r4 = {
      lines = {
        { id = "op_orcs_r4", text = "Then help them keep it, please. Every orc who keeps faith at Brackenwall makes my arguments in Stormwind easier." },
      },
      choices = {
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    xpt_jaina = {
      big = true,
      lines = { { id = "xpt_jaina_default", text = "That's the Alliance as it should be, and I wish Stormwind's lords could see it more often. When Lordaeron fell, it was elves who held the forests and dwarves who held the mountains, and we only lost ground when we stopped trusting each other." } },
      choices = {
        { text = "Every people has its strengths. Together we're stronger.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Friendship is fine, but each people must look after its own first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Could the Horde ever travel beside us like this, my lady?", next = "xpt_jaina2" },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xpt_jaina2 = {
      lines = { { id = "xpt_jaina2_default", text = "I stood beside Thrall at Hyjal, so I know they can, at least for a day and against a common enemy. Whether they can do it on an ordinary morning, with nothing to fight but old grudges, is the question I've staked this whole city on." } },
      choices = {
        { text = "I see. Let me ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think it's hopeful. Thrall told me the shamans were his people's conscience before the Legion came, and if Ironforge can learn something from them, perhaps Alliance and Horde can learn a little more from each other." } },
      choices = {
        { text = "The elements belong to no one. That's worth remembering.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I learned it for Ironforge, my lady, not for the Horde.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Less than people do, to my mind, but the raptors have taken more than one courier on the road to Sentry Point. I'd rather we learned the marsh's ways than burned it back, though not everyone in Theramore agrees with me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And this must be {pet}. Theramore was built by people who came from very far away, and I'd like to think there's room here for every companion they brought." },
      },
      choices = {
        { text = "Learn the marsh's ways. Burning it would only make enemies.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The road needs clearing, my lady. Burn the raptor nests back.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Some do, and some never will, and I can't blame the second kind. Your people remember what reckless magic did to the world, and I am a mage, so I try to earn their trust rather than ask for it." } },
      choices = {
        { text = "What we shared on Hyjal should bind us still.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trust is earned person by person, not by old pacts.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It has people who lost family to orcs and haven't forgiven a peace they never asked for, and I understand them. Some of the deserters out in the marsh were my own soldiers, and if someone is stirring them up against the Horde, I want to know who." } },
      choices = {
        { text = "Let me find them, and I'll bring them to your justice.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some of them have reason. Peace can't be forced on grief.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else, my lady.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It means much to me, because I watched Uther hold Lordaeron together with nothing but faith and stubbornness. I also watched what became of Arthas, and I learned that the Light does not keep anyone safe from his own choices." } },
      choices = {
        { text = "Then I'll guard my choices as carefully as my oath.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light failed Arthas. Faith alone isn't enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xcl_ony = {
      big = true,
      lines = {
        { id = "xcl_ony_default", text = "Then the south marsh may be livable at last, though her brood won't vanish overnight. She was Deathwing's daughter and she had every bit of his cunning, and the black dragons have been sending their agents into human lands for years, though I've never been able to prove where half of them answered." },
      },
      choices = {
        { text = "The Horde suffered from her too. Tell Thrall, my lady.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let Theramore keep the glory. The Horde can hear it secondhand.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Did Onyxia ever threaten Theramore directly?", next = "xcl_ony2" },
      },
    },
    xcl_ony2 = {
      lines = { { id = "xcl_ony2_default", text = "Never openly, and that was what worried me. Her drakes watched our walls and her whelps hunted our patrols, and every time I asked Stormwind for help, the answer came back slow and polite, as though someone there didn't want the Wyrmbog looked at too closely." } },
      choices = {
        { text = "Stormwind's court is slow at the best of times, my lady.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_jaina", tags = { "news" }, when = { race = "Human", party = { race = { "Dwarf", "Gnome", "NightElf" } }, faction = "Alliance" },
          text = "You've brought {companion} with you, I see, and I'm glad of it. Theramore was built by people who buried enough friends to know no race survives this world alone." },
        { id = "h_cl_ony", tags = { "news" }, when = { cleared = "Onyxia's Lair", faction = "Alliance" }, text = "Archmage Tervosh tells me the black dragon of the Wyrmbog is dead, and that you were there when she fell. Theramore has lived under Onyxia's shadow since the day we landed, so I'll thank you myself." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter of the Alliance. The marsh is full of creatures that would rather we'd never come, and I'm grateful to anyone who keeps them from our gates without hating them for it." },
        { id = "h_default", key = true,
          text = "Jaina Proudmoore. I brought the survivors of Lordaeron across the sea and built Theramore with them. We keep the peace here, even when it costs us." },
        { id = "h_thrall", when = { heardLine = "thrall.h_default" },
          text = "You've stood before Thrall, so you know he's no monster. Not everyone in Stormwind wants to hear that from me." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "Whatever Tervosh has you chasing, see it through. Someone has been working against us from inside these walls, and I mean to learn who." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Still awake? So am I. The tower's quiet at night, and it's the only time I can hear myself think about anything but the next letter." },
        { id = "h_warm", when = { disposition = { min = 75 } },
          text = "I'm glad you came back. Sit, if you like; Tervosh says I don't sit nearly enough, and he's usually right." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid of the Cenarion Circle in Theramore. I stood beside your people on Mount Hyjal, and I haven't forgotten what the forest gave to stop the Legion there." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You have the light step of someone who prefers not to be noticed, and I won't ask whom you've been reporting to. Theramore has nothing to hide from friends." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the Silver Hand. I knew Uther well, and I knew another of your order better, and if I look at you a little too long, that's why." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. I studied at Dalaran with dwarves who swore the stone remembered everything, and I'm beginning to think they were right." },
      },
      again = {
        { id = "h_again", text = "What else? I have a few minutes before the next dispatch." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Do the night elves still trust humans, my lady?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why keep peace with the Horde?", next = "peace" },
        { text = "Theramore seems a young city, my lady.", next = "lordaeron" },
        { text = "Tell me about the city.", next = "theramore" },
        { text = "I'm sorry about your father.", next = "father" },
        { text = "What did Dalaran teach you?", next = "mage", when = { class = "MAGE" } },
        { text = "I came out of Lordaeron too.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "The Kirin Tor know my people. Do you?", next = "skyborne", when = { race = "Skyborne" } },
        { text = "I've met Thrall.", next = "thrall", when = { heardLine = "thrall.h_default" } },
        { text = "Does the Light still answer you, after everything?", next = "priest_light", when = { class = "PRIEST" } },
        { text = "I'd serve in Theramore's guard, my lady.", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "Dalaran would have burned me. Will you?", next = "x_warlock", when = { class = "WARLOCK" } },
        { text = "Dwarves helped build these walls, I hear.", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "I'd guess Theramore has enemies inside its own walls, my lady.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the marsh's beasts threaten Theramore, my lady?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The Silver Hand must still mean something to you, my lady.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do you make of a dwarf shaman, my lady?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Onyxia is dead, my lady. Her lair is empty.", next = "xcl_ony", when = { cleared = "Onyxia's Lair", faction = "Alliance" } },
        { text = "My companions come from every corner of the Alliance, my lady.", next = "xpt_jaina", when = { race = "Human", party = { race = { "Dwarf", "Gnome", "NightElf" } }, faction = "Alliance" } },
        { text = "May I ask you some harder questions, my lady?", next = "jd_deeper" },
        { text = "My masters in the Mage Quarter studied in Dalaran.", next = "jd_mq", when = { origin = "human_mage_quarter" } },
        { text = "My classroom in Gnomeregan is under the sludge now, my lady.", next = "jd_gnome", when = { origin = "gnome_last_student" } },
        { text = "Forgive me, my lady, but you look tired.", next = "jd_tired", when = { disposition = { min = 60 } } },
        { text = "Farewell, my lady.", next = "END" },
      },
    },

    peace = {
      big = true,
      lines = {
        { id = "p_default", text = "Because I fought beside them at Hyjal, and I saw what they are when no one is using them. Peace is harder than war, but it's also worth more." },
      },
      choices = {
        { text = "I agree.", next = "BACK", fx = { affinity = 2, align = { honor = 1 }, standing = { theramore = 1 }, opinion = { peace = "for" } } },
        { text = "I'd break that treaty the day it stopped serving us.", next = "BACK", fx = { affinity = -2, align = { honor = -1 } } },
        { text = "I'm not sure they'd do the same.", next = "doubt" },
      },
    },
    doubt = {
      lines = { { id = "d_default", text = "Some wouldn't, and some of ours wouldn't either. That's exactly why the rest of us have to try." } },
      choices = {
        { text = "Somebody must want it broken.", next = "peace_breakers", fx = { trait = { curious = 1 } } },
        { text = "Fair. Something else.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
      },
    },
    peace_breakers = {
      lines = { { id = "pb_default", text = "People with old grudges and new reasons. Captain Vimes thinks someone is working at it right now, on our own road. I've learned to trust his hunches." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    lordaeron = {
      big = true,
      lines = {
        { id = "l_default", text = "We crossed the sea because we were told the east was lost, and it was. Humans, dwarves, some of the quel'dorei: everyone who would listen. I still dream about the docks." },
      },
      choices = {
        { text = "Who told you?", next = "lordaeron_prophet" },
        { text = "What did you lose?", next = "lordaeron_lost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lordaeron_prophet = {
      lines = { { id = "lp_default", text = "A prophet who spoke in riddles and was right about everything. That's the most frightening thing I can say about anyone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lordaeron_lost = {
      lines = { { id = "ll_default", text = "My teachers, my friends, Antonidas, a whole kingdom. I try to build something here he'd have been proud of, and some days I manage it." } },
      choices = {
        { text = "You have.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    theramore = {
      lines = {
        { id = "t_default", text = "An island, because islands are easy to defend. I'd rather it were easy to visit. Everyone here comes from somewhere that isn't there any more." },
      },
      choices = {
        { text = "Who should I know here?", next = "theramore_who" },
        { text = "It looks safe enough here.", next = "theramore_safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theramore_who = {
      lines = { { id = "tw_default", text = "Tervosh, if you need something understood. Captain Vimes, if you need something solved. Janene, if you need feeding. I rely on all three." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    theramore_safe = {
      lines = { { id = "ts_default", text = "From the Horde, yes, as long as Thrall and I keep our word. From the marsh, never entirely. Mind the crocolisks on the causeway." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    father = {
      lines = {
        { id = "f_default", text = "He came to fight a war I had already ended. I couldn't stop him, and I couldn't follow him. Please, ask me something else." },
      },
      choices = {
        { text = "Of course.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You did what you had to.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your father should have come first, my lady.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
        { text = "You can tell me, my lady. It won't leave this room.", tag = "Persuade", next = "father_true",
          check = { pass = { any = { { disposition = { min = 70 } }, { origin = "human_lordaeron_refugee" }, { all = { { class = "PRIEST" }, { trait = "kind" } } } } } },
          fail = { next = "father_no", fx = { affinity = -1 } } },
      },
    },

    mage = {
      lines = { { id = "m_default", text = "That every spell has a cost, and the wise pay it before it's due. Antonidas taught me the first half. I'm still learning the second." } },
      choices = {
        { text = "What would you teach me?", next = "mage_teach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_teach = {
      lines = { { id = "mt_default", text = "Restraint. Anyone can throw fire; knowing when not to is the whole art, and almost nobody wants to learn it." } },
      choices = {
        { text = "I'll remember.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Fire's been working for me.", next = "BACK", fx = { affinity = -1, trait = { brave = 1 } } },
      },
    },

    refugee = {
      big = true,
      lines = { { id = "r_default", text = "On the ships, or the long road south? Either way, you know what it cost. I think about the ones I couldn't bring, every day." } },
      choices = {
        { text = "You saved who you could.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "We made a life here. That counts.", next = "BACK", fx = { affinity = 2, standing = { theramore = 1 } } },
        { text = "Do you still dream about the docks, my lady?", next = "jd_docks" },
      },
    },
    jd_docks = {
      lines = {
        { id = "jdk_default", text = "Most nights, though the dream has changed. It used to be the dead on the shore behind us, and now it's the faces of the people still waiting on the pier when the last ship pulled away, and I wonder whether you dream of the ones you left behind as well." },
      },
      choices = {
        { text = "Every night, my lady. I keep their names.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Sometimes. I try not to look back.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "I dream of the road south, not the north.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },

    skyborne = {
      lines = { { id = "sk_default", text = "Dalaran wrote to me about your people, two letters, both very careful. I'd like to hear it in your own words, someday." } },
      choices = {
        { text = "Our patrons fell silent. We had to leave.", next = "BACK", fx = { affinity = 2 } },
        { text = "Someday.", next = "BACK" },
      },
    },

    thrall = {
      lines = { { id = "th_default", text = "Then he's still keeping our word, or you'd have said otherwise by now. Tell me: how did he seem?" } },
      choices = {
        { text = "What do you think of the orcs, my lady?", next = "op_orcs" },
        { text = "Tired, but steady.", next = "BACK", fx = { affinity = 2 } },
        { text = "Watchful. Like you.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    priest_light = {
      lines = { { id = "pl_default", text = "I was never a priest. But I prayed on the docks, with the dead behind us and the sea ahead, and something answered. I've decided not to ask what; I just keep listening." } },
      choices = {
        { text = "It was the Light.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Desperate people hear answers in the wind, my lady.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_true = {
      lines = {
        { id = "ft_default", text = "When my father's fleet came, I told my own soldiers to stand aside, and I sent word to Thrall instead of standing with my family. I chose the peace over my father, and I would choose it again, and I still don't know what kind of daughter that makes me." },
        { id = "ft_refugee", when = { origin = "human_lordaeron_refugee" },
          text = "You were on the ships, so you know what this peace cost us to build. When my father came to tear it down I told my soldiers to stand aside and chose it over him, and I'd choose it again, though I've stopped pretending it doesn't hurt." },
      },
      choices = {
        { text = "It makes you the one who kept the peace.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_no = {
      lines = {
        { id = "fn_default", text = "I appreciate it, but no. Some things I'll only say once, and I've already said them to myself." },
        { id = "fn_mage", when = { class = "MAGE" },
          text = "Dalaran taught us both to keep our own counsel, I think. Ask me something else, please, and I'll answer it gladly." },
      },
      choices = {
        { text = "Of course, my lady.", next = "BACK" },
      },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "Then speak to Captain Vimes, and he'll tell you the hardest part of guarding Theramore is the order not to draw your sword. I need soldiers who can hold a line and still let a Horde envoy walk through it unharmed." },
        { id = "xw_guard", when = { origin = "human_city_guard" }, text = "You've stood a gate in Stormwind, I can tell from the way you watch the door. Theramore's gates are smaller, but I promise the visitors are far more interesting." },
      },
      choices = {
        { text = "I can keep my sword sheathed when peace asks it.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { theramore = 1 } } },
        { text = "If the Horde comes armed, I'll draw first.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    x_warlock = {
      lines = {
        { id = "xwl_default", text = "Dalaran had its reasons, and I studied with the people who wrote those rules, so I'm not comfortable with what you keep at your heel. But I've made peace with orcs whose fathers drank demon blood, and it would be a poor sort of peace if I couldn't spare a little of it for you." },
      },
      choices = {
        { text = "Then trust me as you trust the orcs.", next = "x_warlock_trust" },
        { text = "Dalaran's rules didn't save Dalaran.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_warlock_trust = {
      lines = { { id = "xwt_default", text = "Carefully, then, and with my eyes open, which is exactly how I trust the orcs. Keep your demons on a short leash in my city, and you and I will get along." } },
      choices = {
        { text = "You'll have no trouble from me, my lady.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demons answer to me, not to Theramore.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_dwarf = {
      lines = {
        { id = "xd_default", text = "They did, and they complained about my architects every single day, and the walls are still standing, so I suppose they were right. The dwarves who came west with me out of Lordaeron still drink at Janene's most nights, grumbling as if they'd never left the mountain." },
      },
      choices = {
        { text = "Dwarven stone outlasts everything, my lady.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- 0.71.0 depth: harder questions (sub-hub), the other leaders (sub-hub), Stratholme, what she wants, a stance on the docks.
    jd_deeper = {
      hub = true,
      lines = {
        { id = "jdp_default", text = "Hard questions are the only kind worth my time lately, so ask. I may not answer all of them, but I won't lie to you, which puts you ahead of most of my correspondents." },
        { id = "jdp_warm", when = { disposition = { min = 70 } }, text = "Ask whatever you like. You've earned straight answers in this tower, and I find I'd rather give them to you than to another courier." },
      },
      again = {
        { id = "jdp_again", text = "What else weighs on you? It can't be heavier than the stack on my desk." },
        { id = "jdp_again2", text = "Go on. I'd rather hear the hard ones from you than read them in Stormwind's letters." },
        { id = "jdp_again3", when = { timeOfDay = "night" }, text = "Another? The candle's still good for an hour, and so am I." },
      },
      choices = {
        { text = "What do you make of the Alliance's other leaders?", next = "jd_leaders" },
        { text = "You were at Stratholme, weren't you?", next = "jd_strat" },
        { text = "You must want something from someone like me.", next = "jd_want" },
        { text = "What would you do if the peace were tested tomorrow?", next = "jd_test" },
        { text = "Let's speak of other things, my lady.", next = "hello" },
      },
    },

    jd_leaders = {
      hub = true,
      lines = {
        { id = "jld_default", text = "I've met most of them and argued with all of them, usually by letter. Name one, and I'll tell you what I think, which isn't always what I write." },
      },
      again = {
        { id = "jld_again", text = "Who else? I'm being more honest than a diplomat should, so make the most of it." },
        { id = "jld_again2", text = "Another? Tervosh would tell me to be careful, but go on." },
      },
      choices = {
        { text = "What is Thrall really like?", next = "jd_thrall" },
        { text = "Who speaks for Stormwind now?", next = "jd_sw" },
        { text = "And King Magni, in Ironforge?", next = "jd_magni" },
        { text = "The night elves' leaders seem slow to trust you.", next = "jd_tyrande" },
        { text = "Enough of kings and warchiefs.", next = "jd_deeper" },
      },
    },
    jd_thrall = {
      lines = {
        { id = "jth_default", text = "He was raised a slave in an internment camp by a man who wanted a pet gladiator, and he came out of it wanting a homeland rather than revenge, which is more than I could promise of myself. He's patient and stubborn, and he listens better than most kings I've met." },
        { id = "jth_met", when = { heardLine = "thrall.h_default" }, text = "You've stood in front of him yourself, so you'll know I'm not flattering him. He was raised by the very people who caged his race, and somehow he still looks at a human and sees a person." },
      },
      choices = {
        { text = "No warchief can hold every orc to a treaty.", next = "jd_thrall2" },
        { text = "Then he's earned your trust, my lady.", next = "BACK", fx = { affinity = 1, opinion = { thrall = "trusted" } } },
        { text = "I'd still keep a hand near my sword around him.", next = "BACK", fx = { trait = { cautious = 1 }, opinion = { thrall = "wary" } } },
      },
    },
    jd_thrall2 = {
      lines = {
        { id = "jth2_default", text = "No, and he'd be the first to admit it. The Blackrock clans in the east never accepted him, he has trouble in his own capital that he won't name to me, and the land he gave his people is red rock and scorpids where hardly anything grows, and hungry people are very easy to stir up." },
      },
      choices = {
        { text = "Then why not send Durotar grain?", next = "jd_thrall3" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    jd_thrall3 = {
      lines = {
        { id = "jth3_default", text = "I've thought of it, believe me, and I've been told in three different hands that Stormwind won't feed the Horde while its own provinces go hungry. The worst of it is that they're not wrong, because Westfall's farmers have had less help from the crown than anyone in Durotar would believe." },
      },
      choices = {
        { text = "Westfall does deserve better, my lady.", next = "BACK", fx = { affinity = 1, opinion = { westfall = "abandoned" } } },
        { text = "Feeding enemies only buys you better-fed enemies.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jd_sw = {
      lines = {
        { id = "jsw_default", text = "Highlord Bolvar Fordragon governs as Regent for a ten-year-old king, and he's an honorable man holding a kingdom together with one hand while the House of Nobles pulls at the other. When I ask Stormwind for anything, the answer comes back courteous and slow, and I've learned the slowness rarely starts with Bolvar." },
      },
      choices = {
        { text = "Who slows it, then?", next = "jd_sw2" },
        { text = "Bolvar's a good man. That counts for something.", next = "BACK", fx = { affinity = 1, opinion = { bolvar = "trusted" } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    jd_sw2 = {
      lines = {
        { id = "jsw2_default", text = "I don't know, and I won't guess aloud about a court I can't see from here. I'll only say that somebody in Stormwind finds a war with the Horde more useful than a peace, and that whoever it is can wait a long time for it." },
        { id = "jsw2_warm", when = { disposition = { min = 70 } }, text = "Since it's you, I'll tell you what I've told only Tervosh: I keep copies of every answer Stormwind sends me, and when I lay them side by side the delays fall into a pattern I don't like. Someone at court doesn't want Theramore strong, and I can't prove who, so it stays in this room." },
      },
      choices = {
        { text = "Then I'll keep my ears open in Stormwind.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Courts are always slow, my lady. It needn't be a plot.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    jd_magni = {
      lines = {
        { id = "jmg_default", text = "King Magni's dwarves came west with me out of Lordaeron, and he's never once asked for them back, which I count as friendship. He doesn't trust Thrall and says so to my face, and I trust that more than all of Lady Prestor's gracious letters." },
        { id = "jmg_dwarf", when = { race = "Dwarf" }, text = "If you see your king before I do, tell him his masons still complain about my architects, and that the walls are still standing. He'll laugh, and then he'll ask about the orcs, because he always does." },
      },
      choices = {
        { text = "Could you win him over to the peace?", next = "jd_magni2" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    jd_magni2 = {
      lines = {
        { id = "jmg2_default", text = "Not with arguments, because dwarves have long memories and the Horde burned a good deal of Khaz Modan in the Second War. Perhaps with years of nothing happening, which is the slowest and dullest kind of diplomacy and the only kind I've ever seen work." },
      },
      choices = {
        { text = "Then here's to dull years, my lady.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jd_tyrande = {
      lines = {
        { id = "jty_default", text = "Tyrande Whisperwind called us mongrels when we first landed on Kalimdor, and I can't say we'd given her much reason to think better. At Hyjal she held the line beside us, and afterwards she told me she might have misjudged us, which from a high priestess of Elune is very nearly a song of praise." },
        { id = "jty_elf", when = { race = "NightElf" }, text = "Your people have been kinder to Theramore than your leaders have, I think, and I hope you'll take that as the compliment I mean it to be." },
      },
      choices = {
        { text = "Darnassus keeps to itself these days.", next = "jd_tyrande2" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    jd_tyrande2 = {
      lines = {
        { id = "jty2_default", text = "It does, and I understand why, because they gave up their immortality and their world tree to stop the Legion and now they're rebuilding on Teldrassil, far from everyone. I only wish they'd remember the orcs bled at Hyjal too, though with Cenarius dead by an orc's axe I can hardly blame them for remembering the rest." },
      },
      choices = {
        { text = "Some wounds don't close in one lifetime, even theirs.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    jd_strat = {
      lines = {
        { id = "jst_default", text = "I was there at the beginning of it. Arthas decided the people of Stratholme were already lost to the plague and meant to kill them before they could rise, and Uther refused, and I couldn't watch, so I left. That's the short version, and it's the only one I usually tell." },
        { id = "jst_paladin", when = { class = "PALADIN" }, text = "You'll have heard the Silver Hand's version. Uther refused the order and Arthas stripped him of his command on the spot, and I walked away with Uther's men because I couldn't bear to stay and couldn't bear to stop him." },
      },
      choices = {
        { text = "Do you blame yourself for leaving him?", tag = "Persuade", next = "jd_strat_true",
          check = { pass = { any = { { disposition = { min = 70 } }, { origin = "human_lordaeron_refugee" }, { origin = "human_paladin_squire" }, { all = { { class = "PALADIN" }, { trait = "kind" } } } } } },
          fail = { next = "jd_strat_no", fx = { affinity = -1 } } },
        { text = "What became of the city after?", next = "jd_strat2" },
        { text = "You were right to walk away, my lady.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    jd_strat2 = {
      lines = {
        { id = "jst2_default", text = "By nightfall it was burning, and before the season was out Arthas had sailed north after the plague's master and left the rest of us to bury Lordaeron's hope. When he came home again he brought the end of the kingdom with him, and by then I'd gone west, because a prophet told me to." },
      },
      choices = {
        { text = "A prophet? Who was he?", next = "lordaeron_prophet" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    jd_strat_true = {
      lines = {
        { id = "jstt_default", text = "Every day, if you want the truth. I loved him, or I loved the man he was before that morning, and I keep thinking that if I'd stayed and argued instead of walking away, someone might have reached him. Tervosh says no one could have, and I know that's true, but knowing a thing and believing it are very different." },
        { id = "jstt_squire", when = { origin = "human_paladin_squire" }, text = "You squired for an Order that broke on that same morning, so I'll tell you plainly: I loved him once, and I left him at the city gates, and I still wonder whether one more voice might have turned him. Uther couldn't, and I know I couldn't either, but I can't quite make myself believe it." },
      },
      choices = {
        { text = "No one could have, my lady. Not even you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Is that why you fight so hard for this peace?", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },
    jd_strat_no = {
      lines = {
        { id = "jstn_default", text = "Some of it I'll never say aloud, not even to people I like, and I'm afraid that includes you today. Ask me something else, please, and I'll answer it properly." },
      },
      choices = {
        { text = "Of course, my lady.", next = "BACK" },
      },
    },

    jd_want = {
      lines = {
        { id = "jwt_default", text = "Honest eyes, mostly. You go through places I only read about in reports, and I'd like to hear what you actually see there rather than what Stormwind or Orgrimmar would like me to think. But first tell me something: what brought you all the way out to Theramore?" },
      },
      choices = {
        { text = "The work. Theramore pays in trouble, and I like trouble.", next = "jd_want2", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I wanted to see this peace for myself.", next = "jd_want2", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Someone has to watch the Horde. I don't trust them.", next = "jd_want2", fx = { affinity = -1, trait = { cautious = 1 }, opinion = { peace = "against" } } },
        { text = "I go wherever I'm needed, my lady.", next = "jd_want2", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    jd_want2 = {
      lines = {
        { id = "jwt2_default", text = "Whatever brought you, I'm glad of it, because I need people who'll carry word between the Alliance's cities without bending it. When someone in Stormwind or Ironforge tells you the orcs are massing on our border, ask them how they know, and remember who told you." },
      },
      choices = {
        { text = "I'll be your eyes, my lady.", next = "jd_want3", fx = { affinity = 2, standing = { theramore = 1 } } },
        { text = "I'll say what I see, to whoever asks.", next = "jd_want3", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jd_want3 = {
      lines = {
        { id = "jwt3_default", text = "Then start close to home. Captain Vimes has been chasing deserters and a burned inn across half the marsh, and he believes someone wants Theramore blamed for things it didn't do, so help him if he asks, and if the trail leads somewhere I won't like, I'd still rather know." },
      },
      choices = {
        { text = "I'll find Captain Vimes, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },

    jd_test = {
      big = true,
      lines = {
        { id = "jte_default", text = "Let me turn it around and ask you, because I've had to decide this more than once. Suppose one of my father's old sailors spits on a Horde envoy on the docks tomorrow, in front of half the city: what would you have me do with him?" },
      },
      choices = {
        { text = "Punish him openly. The envoy was under your protection.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let it pass quietly. Grief isn't a crime, my lady.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What did you do, when it happened?", next = "jd_test2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jd_test2 = {
      lines = {
        { id = "jte2_default", text = "I had him clean the envoy's boots on the same dock, in front of the same people, and then I paid his passage home to Kul Tiras myself, because he couldn't bear to live beside orcs and I couldn't let him go on trying. Theramore couldn't decide whether I'd been too harsh or too soft, and the envoy thought the whole thing very funny, which helped more than anything." },
      },
      choices = {
        { text = "That sounds like justice to me, my lady.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    jd_mq = {
      lines = {
        { id = "jmq_default", text = "Then they never let you forget it, I expect, because none of us who studied there ever let anyone forget it. I learned under Antonidas myself, and what I miss most isn't the towers but the arguments in the library long after midnight." },
      },
      choices = {
        { text = "My masters say you left Dalaran too young.", next = "jd_mq2" },
        { text = "I learned more from their mistakes than their lectures.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    jd_mq2 = {
      lines = {
        { id = "jmq2_default", text = "They're right, and I'd like to know which of them said it, because I probably owe them a letter. I went north with Arthas on the king's business before I'd properly finished, and everything I've learned since I learned by needing it, which is a terrible way to study and the only one a war allows." },
      },
      choices = {
        { text = "Then you've studied harder than any of them.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jd_gnome = {
      lines = {
        { id = "jgn_default", text = "Gnomeregan's mages used to send letters to Dalaran that nobody there could follow, because they put the equations in the margins and the conclusions somewhere else entirely. I'm sorry about your city, and if you're rebuilding your notes from memory, you're braver than most archmages I've known." },
      },
      choices = {
        { text = "Would you look over my notes someday, my lady?", next = "jd_gnome2" },
        { text = "We'll take Gnomeregan back, one level at a time.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jd_gnome2 = {
      lines = {
        { id = "jgn2_default", text = "Gladly, though I warn you I'll ask questions until you're sick of me, because that's the only way I've ever understood anything. Tervosh will want to see them too, and he'll pretend he isn't interested for at least a quarter of an hour." },
      },
      choices = {
        { text = "Then I'll bring them, my lady.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jd_tired = {
      lines = {
        { id = "jtr_default", text = "I am, and it's kind of you to notice when most people only notice the title. Every letter from Stormwind or Orgrimmar seems to arrive after dark, and any one of them could start a war if I answer it badly, so I don't sleep much." },
        { id = "jtr_warm", when = { disposition = { min = 75 } }, text = "Since it's you, I'll admit something: some nights I stand at the top of the tower and wonder whether I built Theramore for its people or for myself, so I'd have something to hold after Lordaeron. I haven't decided which, and I've begun to think it doesn't matter, so long as it stands." },
      },
      choices = {
        { text = "Then rest tonight. The peace will keep till morning.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Theramore needs you awake, my lady.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Theramore hears from both sides of every border, and most of it reaches my desk eventually. Ask, and I'll tell you what I can." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "Ask me anything; you've earned plain answers in this tower. I'll tell you as much as I'd tell Tervosh." },
    },
    background = { { id = "tp_bg", text = "Kul Tiras, Dalaran, Lordaeron, and now a tower in a swamp. Every step was further from home and closer to where I'm needed.", next = "lordaeron" } },
    advice = { { id = "tp_ad", text = "Learn the other side's words before you need them. Captain Vimes speaks orcish, and it's saved more lives than his sword." } },
    grimtotem = { { id = "tp_grimtotem", text = "There are tauren who'd like a war with us. Thrall isn't one of them, and neither am I. That's where we start." } },
    burning_blade = { { id = "tp_blade", text = "Thrall's problem, and he knows it. I'll help if he asks, though he won't ask." } },
    thrall = {
      { id = "tp_thrall", text = "Thrall is a better leader than I was told an orc could be, and I was told a great many things that weren't true. We made a peace on Kalimdor with our own hands, and I mean to keep it." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "Your warchief trusted me when he had no reason to, and I've tried to deserve it. Tell him Theramore still keeps its word, if anyone asks you." },
    },
    arthas = { { id = "tp_arthas", text = "Arthas was my friend, and he was a good man once, before Stratholme and before Northrend. Whatever walks in his armor now serves the Scourge, and I've stopped looking for the man in it." } },
    stratholme = { { id = "tp_stratholme", text = "I was there when Arthas ordered the city purged, and I walked away from him on that road. I still don't know whether he could have been stopped, but I know I couldn't stay and watch." } },
    scourge = { { id = "tp_scourge", text = "I saw the plague take Lordaeron village by village, and I saw what came out of the granaries. That's why I followed the prophet west, and why I'll never call the Scourge finished while Kel'Thuzad holds Naxxramas." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was my home and my school, and Archimonde tore it down to take the Book of Medivh. The Kirin Tor are rebuilding it, slowly and behind closed gates, and I don't blame them." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "I still count myself one of the Kirin Tor, though they'd say I've wandered rather far. They're careful people, and after what happened, they've earned their caution." } },
    sylvanas = { { id = "tp_sylvanas", text = "Sylvanas Windrunner died defending Quel'Thalas and came back as something I don't know how to speak to. Her people are bitter and clever, and they aren't part of any peace I signed." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken broke free of the Lich King, and I'm glad of that much. What they want now frightens Lordaeron's survivors, and I can't promise them that their fear is wrong." } },
    onyxia = { { id = "tp_onyxia", text = "There is a black dragon laired in the south of this marsh, and her brood grows bolder every season. I've lost scouts to Wyrmbog, and I won't send more until I know what she's waiting for." } },
    prestor = { { id = "tp_prestor", text = "Lady Katrana Prestor writes very gracious letters from Stormwind on the young king's behalf. They run to several pages and promise nothing, and I've learned to read those carefully." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Bolvar is a good man holding Stormwind together while they wait for Varian. I'd trust him with my life, and I'd trust him more if the court let him decide anything." } },
    varian = { { id = "tp_varian", text = "King Varian vanished on his way to meet me, on the road to Theramore, and nobody has found a trace of him. I think about it more often than I say." } },
    theramore = {
      { id = "tp_theramore", when = { disposition = { min = 70 } }, text = "I built Theramore so the refugees of Lordaeron would have somewhere to stop running. Some days I think it's the best thing I've done, and some days I think it's the only thing." },
      { id = "tp_theramore2", text = "Theramore is a home for people who had no home left after the Third War. We're small and damp and far from everyone, but we're still here." },
    },
    _none = { { id = "tp_none", text = "I don't know, but Tervosh might, and if he doesn't, he'll find out." } },
  },
}

P:NPC {
  key = "tervosh", id = TODO_NPC("Archmage Tervosh"), name = "Archmage Tervosh",
  bible = "bibles/dustwallow.md", role = "scholar", tier = "quest",
  communities = { "theramore" }, temper = { "brisk" }, values = { "loyal", "curious" },
  notices = { "class", "craft" },

  impression = {
    first = "Archmage Tervosh spoke quickly, as though the day were already running out on him. Between the Lady's errands and his books, I gather his garden gets very little of him.",
    third = "{name} met Archmage Tervosh, Lady Jaina's brisk and loyal advisor in Theramore.",
  },

  greetings = {
    { id = "g_tower", text = "Quickly, please. There's too much to do and not enough day to do it in." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Another mage. Kirin Tor? I never cared for committees myself; I prefer to be useful on my own." },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "An herbalist! Have you seen my garden? Don't step on the briarthorn; it holds a grudge." },
  },

  start = "hello",
  nodes = {
    op_kirin_tor = {
      lines = {
        { id = "opk_q", text = "The Lady could have stayed in Dalaran's good graces, you know, and the Kirin Tor have never quite forgiven her for leaving. You strike me as someone with views, so what do you make of the Kirin Tor?" },
      },
      choices = {
        { text = "They're wise, and the Lady should have kept closer ties with them.", next = "op_kirin_tor_r1", fx = { affinity = -1, align = { order = 1 }, opinion = { kirin_tor = "respect" } } },
        { text = "Committees and towers. The Lady does more good on her own.", next = "op_kirin_tor_r2", fx = { affinity = 2, align = { order = -1 }, opinion = { kirin_tor = "wrong" } } },
        { text = "Dalaran fell while they argued. I'd not trust them again.", next = "op_kirin_tor_r3", fx = { trait = { skeptical = 1 }, opinion = { kirin_tor = "distrust" } } },
        { text = "I studied their ways, Archmage, and they're worth keeping.", next = "op_kirin_tor_r4", fx = { affinity = 1, opinion = { kirin_tor = "admire" } }, when = { class = "MAGE" } },
        { text = "I'll leave Dalaran's politics to you, Archmage.", next = "BACK" },
      },
    },
    op_kirin_tor_r1 = {
      lines = {
        { id = "op_kirin_tor_r1", text = "Wise, certainly, and slow, and fond of committees, which you'll remember I am not. The Lady chose to be useful instead, and I chose to follow her." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_kirin_tor_r2 = {
      lines = {
        { id = "op_kirin_tor_r2", text = "Spoken like someone who's sat through one of their meetings! Theramore gets things done, and Dalaran can read about it afterwards." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_kirin_tor_r3 = {
      lines = {
        { id = "op_kirin_tor_r3", text = "That's harsh, though I'll not say it's wrong. Some of us lost everything in that city, so do say it gently." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_kirin_tor_r4 = {
      lines = {
        { id = "op_kirin_tor_r4", text = "Good, good, then keep them, and add something of your own, which is what the Lady did. That's the part they never taught." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_tervosh = {
      big = true,
      lines = { { id = "xpt_tervosh_default", text = "I think it's the best schooling there is, though the Kirin Tor would never admit it. A mage who has only ever cast at practice dummies learns caution late, and usually at someone else's expense." } },
      choices = {
        { text = "Magic needs discipline. Some things should stay in the academy.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic is learned by using it, not by reading about it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Very little that agrees with itself. The Kirin Tor bound elementals for centuries and called it scholarship, and here you are asking them politely, which I suspect would offend several of my old masters." } },
      choices = {
        { text = "Asking is wiser than binding, Archmage.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Binding has its uses. The Kirin Tor weren't fools.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some of my colleagues in Dalaran did, and they learned better when the Scourge came to the gates. A spell takes time to cast, and in my experience that time comes from someone with a shield standing very still in front of me." } },
      choices = {
        { text = "Each to their part. That's how battles are won.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Spell or steel, a fighter should stand on their own.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Tortoises, if you'll believe it, great mudrock tortoises that climb out of the shallows at night and eat my herbs down to the stems. I've warded half the beds against them, and the creatures simply walk around the wards, which I take personally." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} looks a sight more sensible than the tortoises, though I'd still ask you to keep it on the path. The garden has suffered enough this season." },
      },
      choices = {
        { text = "Leave the tortoises be. The island can share its garden.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll clear them out for you. Your herbs matter more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The marsh water, mostly, which is brackish one week and sweet the next, so the roots can't decide whether to drown or go thirsty. I'd ask the Circle, but I suspect they'd tell me to stop forcing Lordaeron flowers into Kalimdor mud." } },
      choices = {
        { text = "Keep tending them. A garden is a choice, not an accident.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the marsh decide, and plant what grows wild.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I fear for them everywhere, because half of what I carried out of Dalaran's libraries is the only copy left in the world. Some of it would fetch a fortune in Booty Bay, and the rest would burn a careless reader's hand off, so it stays locked away." } },
      choices = {
        { text = "I'd never steal them. Some things matter more than gold.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they're that valuable, someone will try. Lock them tighter.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "We studied it the way a physician studies plague, carefully and with the windows open. Kel'Thuzad was a member of our council once, and his fascination with forbidden magic led straight to the Cult of the Damned, so you'll understand why I'm wary." } },
      choices = {
        { text = "Knowledge isn't evil, Archmage. Kel'Thuzad chose his path himself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Your caution is earned. I'll keep my craft honest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Mostly, though we argue over whose turn it is to mend the wounded and whose to ward the walls. The Lady wants a city where the arcane and the Light stand together, which is a fine idea, and I only wish it came with more hours in the day." } },
      choices = {
        { text = "Without the Light, magic forgets mercy. We keep you honest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. The arcane needs no blessing from me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "On both, and on the Lady's patience, which is greater than anyone else's in Kalimdor. Thrall keeps his word and she keeps hers, but there are hotheads on both sides who'd tear it up tomorrow, so the walls stay manned all the same." } },
      choices = {
        { text = "Our word is our wall. It must be kept, even with the Horde.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smile at the Horde and keep a blade ready. That's real peace.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_ony = {
      big = true,
      lines = {
        { id = "xcl_ony_default", text = "Then you've seen something the Kirin Tor would trade a library to see, and I'd ask you to describe every scale if I thought you'd stand for it. A dragon of her rank doesn't die often, and when one does, the lesser ones scatter or squabble over the lair, so the marsh will be noisy for a season." },
      },
      choices = {
        { text = "Her lair should be burned out, not studied.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Study it. Knowing dragons is how we beat the next one.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "What will her brood do without her?", next = "xcl_ony2" },
      },
    },
    xcl_ony2 = {
      lines = { { id = "xcl_ony2_default", text = "Squabble, mostly, and dragonkin squabbling is loud and fiery and very bad for gardens. The cleverer ones will slip north toward their kin in Blackrock, I expect, which makes them someone else's trouble, though I'd not say so in the Lady's hearing." } },
      choices = {
        { text = "Your secret is safe with me, Archmage.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_tervosh", tags = { "news" }, when = { party = { class = "MAGE" }, faction = "Alliance" },
          text = "Another student of the arcane in your company, I see. {companion} has the look of someone trained in Dalaran's habits, or at least someone who has read the right books." },
        { id = "h_cl_ony", tags = { "news" }, when = { cleared = "Onyxia's Lair", faction = "Alliance" }, text = "You've come back from the Wyrmbog with Onyxia dead behind you and the smell of dragonfire still on your cloak. I've studied black dragons from a respectful distance for years, and I find I'm a little jealous." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. Let's keep this brief, because the last time a soldier stood in my study he knocked over a shelf of reagents with his scabbard." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! If your beasts have trampled anything in my garden, I'd rather hear it now, while I'm still in a forgiving mood." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Forgive me, I've a meeting with the Lady in a quarter hour and I haven't read half of what I meant to, but I'm always glad to see the Light about the place, because Theramore has a great many mages and not nearly enough healers." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, good! The Lady's peace needs people who can stand in a doorway and not move, and I'm afraid most of us in the tower are better at reading about doorways than standing in them." },
        { id = "h_default", key = true,
          text = "Archmage Tervosh. I advise the Lady, I read more than is good for me, and I tend a garden when the world allows it, which is rarely." },
        { id = "h_diplomat", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "The diplomat's trail ran cold, and then it ran somewhere I didn't like. Follow it, but carefully." },
        { id = "h_shards", when = { questActive = TODO_QUEST("Shadowshard Fragments") },
          text = "Shadowshard fragments. There's an unusual energy in them, and if you bring me enough I can make something of it." },
        { id = "h_garden", when = { metBefore = true }, text = "The marsh air is wonderful for herbs and terrible for parchment, so I've chosen the herbs. My notes forgive me, mostly." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Please don't look too closely at my garden; I've read every herbal in Theramore, and they're all wrong about swamp soil." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "I'll be keeping an eye on my books, because a rogue in a mage's study is like a cat in a fishmonger's, and I'm fond of both." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock in my tower. The Lady has asked me to judge by deeds rather than by schools, and I'm trying, though I'll confess my wards are less patient than I am." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I have three books that say it can't be done and one that says it was done long ago, and I'd very much like to know which is right." },
      },
      again = { { id = "h_again", text = "Yes, yes, what else? Keep it short, if you would." }, { id = "h_again2", text = "Another question? Good, ask it while I water these." } },
      choices = {
        { text = "What troubles your garden, Archmage?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I've heard talk of a missing diplomat.", next = "diplomat" },
        { text = "Tell me about your garden.", next = "garden" },
        { text = "You're not with the Kirin Tor?", next = "independent" },
        { text = "The Lady must be a demanding mistress to serve.", next = "jaina" },
        { text = "What do the shadowshards do?", next = "shards", when = { questActive = TODO_QUEST("Shadowshard Fragments") } },
        { text = "Any advice for a mage on their own?", next = "mage", when = { class = "MAGE" } },
        { text = "A gnome could rig your garden proper irrigation.", next = "x_gnome", when = { race = "Gnome" } },
        { text = "Your herbs would grow better by moonlight.", next = "x_nightelf", when = { race = "NightElf" } },
        { text = "Do you fear for your books in Theramore, Archmage?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "The Kirin Tor must have studied warlock magic, Archmage.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do the mages and the faithful of Theramore get along?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Theramore's peace rest on arms or on trust?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Mages tend to look down on warriors, Archmage.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What creatures trouble your garden, Archmage?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do your books say of dwarves and the elements?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I was there when Onyxia fell, Archmage.", next = "xcl_ony", when = { cleared = "Onyxia's Lair", faction = "Alliance" } },
        { text = "What do you make of mages who travel with adventurers, Archmage?", next = "xpt_tervosh", when = { party = { class = "MAGE" }, faction = "Alliance" } },
        { text = "I'll be quick.", next = "END", fx = { affinity = 1 } },
      },
    },
    diplomat = {
      lines = { { id = "d_default", text = "Someone we were expecting never arrived. Diplomats don't simply wander off. Somebody wanted him gone, and somebody else wanted it to look like nobody did." } },
      choices = {
        { text = "Who do you suspect?", next = "diplomat_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    diplomat_who = {
      lines = { { id = "dw_default", text = "Everyone, politely; that's what advisors are for. The Lady trusts people and I check them, and between us, we're very nearly sensible." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    garden = {
      lines = { { id = "g_default", text = "Mageroyal by the wall, briarthorn by the steps, and something from the marsh I haven't named yet. It keeps trying to bite the bees." } },
      choices = {
        { text = "Name it after yourself.", next = "garden_name", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    garden_name = {
      lines = { { id = "gn_default", text = "Tervosh's Folly? Too accurate. I'll name it after a committee instead, since something that bites would suit one." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    independent = {
      lines = { { id = "i_default", text = "I prefer to be useful without asking six people first. The Lady asks, I answer, things get done. Committees can read about it afterwards." } },
      choices = {
        { text = "What do you think of the Kirin Tor?", next = "op_kirin_tor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jaina = {
      lines = { { id = "j_default", text = "Brilliant, stubborn, and far too willing to carry everything herself. Don't tell her I said stubborn, but do tell her to sleep." } },
      choices = {
        { text = "I'll tell her.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shards = {
      lines = { { id = "s_default", text = "They hold energy the way a sponge holds water: badly, and everywhere. With enough of them I can shape something that holds it properly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "m_default", text = "Keep your own notes, in your own hand. Committees lose things, but you won't, if it's your handwriting nobody else can read." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_gnome = {
      lines = {
        { id = "xg_default", text = "Could you? The last gnome who offered built me something with eleven valves and a whistle, and the whistle was the only part that ever worked. I'm independent, not ungrateful, so put it in writing and I'll read it between diplomats." },
      },
      choices = {
        { text = "Eleven valves was too few. I'd use twenty.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll stick to spells, then.", next = "BACK" },
      },
    },
    x_nightelf = {
      lines = {
        { id = "xn_default", text = "Every kaldorei who passes through tells me something of the kind, and I'm starting to suspect it's a plot to keep me up late. I'll admit the herbs along the east wall do better than anything I plant by the book, and they get the most moon." },
      },
      choices = {
        { text = "Elune favors a patient gardener.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Archmage.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I read more than is good for me, so I know a little about a great many things. Ask, and I'll try to be brief." },
    },
    background = { { id = "tp_bg", text = "A great many books, and then the Lady's tower, because she asked and I'd run out of better reasons to say no." } },
    advice = { { id = "tp_ad", text = "Never eat anything from the marsh you can't name. I can name most of them, and I still don't eat them." } },
    dalaran = { { id = "tp_dalaran", text = "I was at Dalaran when the Legion took it apart stone by stone, and I won't describe it, thank you. The Kirin Tor are putting it back together, and they'll open the gates when they're ready, which knowing them will be a decade late." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are brilliant, and they argue like starlings over a crust. I followed the Lady here because I'd rather be useful than right." } },
    jaina = { { id = "tp_jaina", text = "The Lady is the most capable mage I've known, and she works harder than anyone in Theramore, myself included. Somebody ought to make her sit down, and it won't be me." } },
    onyxia = { { id = "tp_onyxia", text = "There's a black dragon in Wyrmbog, south of here, and her whelps grow bolder each spring. I've written to the Lady twice about it, and I'd write a third time if I thought paper burned slower." } },
    scourge = { { id = "tp_scourge", text = "The plague took more mages than the war did, I think, because we kept thinking we could study it. Don't study it, take my advice, and burn it instead." } },
    arthas = { { id = "tp_arthas", text = "I knew the prince to nod to, a golden lad with a good laugh. What he became is a lesson I'd rather not have had to learn." } },
    _none = { { id = "tp_none", text = "Not in any book I own, which means it's either very new or very dangerous." } },
  },
}

P:NPC {
  key = "vimes", id = TODO_NPC("Captain Garran Vimes"), name = "Captain Garran Vimes",
  bible = "bibles/dustwallow.md", role = "soldier", tier = "quest",
  communities = { "theramore" }, temper = { "direct", "sharp" }, values = { "dutiful", "lawful" },
  notices = { "race", "kit" },

  impression = {
    first = "Captain Garran Vimes refuses to decide what the evidence means before he's seen all of it, which makes him rare in Theramore. Everyone else blames the Horde for the inn, and he isn't everyone.",
    third = "{name} met Captain Garran Vimes of the Theramore Guard, who is looking into the burning of the Shady Rest Inn.",
  },

  greetings = {
    { id = "g_citadel", text = "Captain Vimes, Theramore Guard. If you've come about the inn, sit down; if not, be quick." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Tell me you found something." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the inn case hasn't moved an inch in that time. I'm glad you're back, because I've run out of people who look for evidence instead of culprits." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Someone in the city tells me you were caught in a lie, and I'll tell you plainly what that means to me. I build cases on testimony, so from now on I'll be checking yours twice." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I hear you put the fear into one of our citizens, and I'll remind you that threats are the Guard's business in Theramore, not yours. Keep it outside the walls." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Lok'tar. Yes, I speak a bit of your tongue, more than anyone else in the garrison; it's useful in a land full of misunderstandings." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something out there has been at you, so get mended. I need my witnesses alive." },
  },

  start = "hello",
  nodes = {
    op_horde = {
      lines = {
        { id = "oph_q", text = "Every soldier in this keep has an opinion about the Horde, and most of them were formed before the evidence was in. So, what's yours?" },
      },
      choices = {
        { text = "They've kept the peace so far. Judge them by that.", next = "op_horde_r1", fx = { affinity = 2, align = { order = 1 }, opinion = { horde = "tolerate" } } },
        { text = "They're killers, all of them. The peace is a lie.", next = "op_horde_r2", fx = { affinity = -1, align = { order = -1 }, opinion = { horde = "war" } } },
        { text = "Some of them are honest. Some aren't. Same as us.", next = "op_horde_r3", fx = { trait = { honest = 1 }, opinion = { horde = "mixed" } } },
        { text = "I'm Horde, Captain. We didn't burn that inn.", next = "op_horde_r4", fx = { opinion = { horde = "kin" } }, when = { faction = "Horde" } },
        { text = "I'd rather keep my thoughts to myself, Captain.", next = "BACK" },
      },
    },
    op_horde_r1 = {
      lines = {
        { id = "op_horde_r1", text = "That's the evidence, and I'll stand on it until I see something better. Thank you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_horde_r2 = {
      lines = {
        { id = "op_horde_r2", text = "Maybe, but a man who's decided the verdict before the trial makes a poor witness. Bring me proof and I'll listen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_horde_r3 = {
      lines = {
        { id = "op_horde_r3", text = "That's the first thing they teach you on the watch, or they should. I'll take it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_horde_r4 = {
      lines = {
        { id = "op_horde_r4", text = "Maybe you didn't, and maybe nobody you know did. I'll still want proof, but I'll write down that you came to say it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_vimes = {
      big = true,
      lines = { { id = "xpt_vimes_default", text = "Companies are useful, and I've borrowed a few in my time for work the garrison couldn't spare men for. The trouble is the ones who answer to nobody, because the deserters out past the Shady Rest started as a company too, before they decided Theramore's peace wasn't theirs to keep." } },
      choices = {
        { text = "A company working here should answer to Theramore, Captain.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We answer to each other, Captain, and to no one else.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What became of those deserters, Captain?", next = "xpt_vimes2" },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xpt_vimes2 = {
      lines = { { id = "xpt_vimes2_default", text = "Some of them are dead, some are still out in the marsh, and a few are drinking in Theramore under other names, I'd wager. I watch the ones I can find, and I keep a list of the ones I can't." } },
      choices = {
        { text = "I see. Let me ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd take evidence from a spirit if it would stand up in front of the Lady. Everyone wants to blame the Horde, and if the marsh itself saw who set that fire, I want to hear what it says." } },
      choices = {
        { text = "I'll follow the truth, Captain, wherever it points.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Does it matter who did it? Blame the Horde and move on.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The hoofprints and axes say the Horde, but the burned beams say the fire started inside, and orcs don't need an invitation to come in. Someone wanted this blamed on Brackenwall, and they knew our people would believe it without asking." } },
      choices = {
        { text = "I'll follow the evidence wherever it leads, Captain.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sometimes you have to bend the rules to catch a liar.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I don't know, and that's why I'm asking, because the ash at the Shady Rest burned hotter in some spots than a lamp could account for. It may be nothing more than spilled oil, but I won't rule anything out before I've seen it all." } },
      choices = {
        { text = "Let me examine the ash. I'll tell you the truth of it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Blame the oil and close the case. Theramore needs answers fast.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That whoever burned the inn wanted it found, and wanted Horde blamed. Orcs on a raid don't leave a Theramore badge in the cinders, and they don't hang a black shield over the hearth like a calling card." } },
      choices = {
        { text = "Then we follow the evidence, wherever it leads.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Evidence can be argued. The Horde is still the Horde.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "James Hyal lost his wife and child when the Shady Rest burned, and he's not been the same since. Half of Theramore wants to hang an orc for it, and if they see a warlock walking about, some of them will want to hang you too." } },
      choices = {
        { text = "Then I'll keep my distance and help you find the truth.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them try. I'm not hiding for anyone's comfort.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_ony = {
      big = true,
      lines = {
        { id = "xcl_ony_default", text = "Easier in the south, maybe, but dragons were never the worst thing in this marsh, because a dragon at least tells you she's your enemy. Half my work is chasing rumours that someone wants Theramore and the Horde at each other's throats, and I've wondered more than once who profits from that." },
      },
      choices = {
        { text = "Find who profits, Captain, and bring them before the Lady.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rumours are cheap. A sword settles things faster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Did Onyxia have a hand in the Shady Rest?", next = "xcl_ony2" },
      },
    },
    xcl_ony2 = {
      lines = { { id = "xcl_ony2_default", text = "I'd be lying if I said I had proof, and I don't lie in my reports. What I have is burned timbers, hoofprints that don't add up, and a feeling that somebody wants us blaming the Horde, so I'll keep pulling threads until one of them leads somewhere." } },
      choices = {
        { text = "Then I'll watch for loose threads myself, Captain.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_vimes", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "Five of you, armed and moving together through my gate. You'd look like a raiding party if you weren't wearing the right colors, so keep your weapons sheathed on the causeway, if you please." },
        { id = "h_cl_ony", tags = { "news" }, when = { cleared = "Onyxia's Lair", faction = "Alliance" }, text = "My guards are telling each other that you went into Onyxia's lair and came back without her. I'd call it a tavern story if Tervosh hadn't confirmed it, so well done, and don't let it go to your head." },
        { id = "h_default", key = true,
          text = "Someone burned the Shady Rest Inn on the road north, and James Hyal lost his wife and child in it. Everyone says the Horde did it, but I'm not everyone." },
        { id = "h_ruins", tags = { "news" }, when = { questActive = TODO_QUEST("Inspecting the Ruins") },
          text = "Go to what's left of the inn and look at everything. Don't decide what it means until you've seen it all." },
        { id = "h_hoofprints", when = { questActive = TODO_QUEST("Suspicious Hoofprints") },
          text = "Hoofprints, around a building orcs supposedly burned. Interesting, and let's not tell the taverns yet." },
        { id = "h_reethe", when = { questActive = TODO_QUEST("Lieutenant Paval Reethe") },
          text = "Paval Reethe was one of ours, until he wasn't. If he's involved, I want to hear it from him." },
        { id = "h_shield", when = { questActive = TODO_QUEST("The Black Shield") },
          text = "A black shield, found where it shouldn't be. Somebody's trying very hard to make this look like something it isn't." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You read a room before you walked into it, and I noticed. That's useful, because I need someone who sees what's hidden rather than what's convenient." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Archmage Tervosh is too busy to help me, so maybe you can tell me whether a fire looks different when someone starts it with magic." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Before you tell me the Horde burned the Shady Rest because they're the Horde, hear me out, because I've stood in those ashes and they don't tell me that." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock in Theramore. I'll not ask what you keep at your heel, but I'll ask you to keep it away from the Hyal family, because they've lost enough." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. I don't judge a soldier by how they fight, only by whether they tell me the truth, so let's start there." },
      },
      again = { { id = "h_again", text = "Next question, then; I've a case on." }, { id = "h_again2", text = "Go on." } },
      choices = {
        { text = "Why don't you think it was the Horde?", next = "why" },
        { text = "Who were the Hyals?", next = "hyal" },
        { text = "What are people saying in the taverns?", next = "taverns" },
        { text = "You speak orcish?", next = "orcish" },
        { text = "Let me read the tracks myself.", next = "tracks", when = { class = { "HUNTER", "ROGUE", "DRUID" } } },
        { text = "I could sit with James Hyal.", next = "priest_hyal", when = { class = "PRIEST" } },
        { text = "Want another sword in the Guard, Captain?", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "What did the ashes tell you, Captain?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I heard the Hyal family suffered in the fire, Captain.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Onyxia is dead, Captain. Your patrols should have an easier time.", next = "xcl_ony", when = { cleared = "Onyxia's Lair", faction = "Alliance" } },
        { text = "We're a company, Captain. We go where we're needed.", next = "xpt_vimes", when = { party = { size = 4 }, faction = "Alliance" } },
        { text = "I'll help.", next = "END", fx = { affinity = 2, align = { order = 1 }, standing = { theramore = 1 } } },
        { text = "What do you think is hidden in the Shady Rest case, Captain?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "That fire smells of magic to me, Captain.", next = "xmage", when = { class = "MAGE" } },
        { text = "Could the spirits help you find who burned the Shady Rest?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "It was the Horde, and everyone knows it.", next = "END", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because it's too convenient. Because the Lady and the Warchief have a peace that someone would dearly like to break. And because I've been a soldier long enough to know a setup." },
      },
      choices = {
        { text = "Then who benefits?", next = "why_who" },
        { text = "Maybe it really was the Horde.", next = "why_horde", fx = { trait = { skeptical = 1 } } },
        { text = "Then let's find who set it.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
      },
    },
    why_who = {
      lines = { { id = "ww_default", text = "Anyone who'd rather Theramore and Orgrimmar were at each other's throats. That's a long list, and not all of it is on their side of the marsh." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why_horde = {
      lines = { { id = "wh_default", text = "Maybe, and then I'll say so, and I'll hang whoever did it whatever colour he wears. But I'll have proof first; that's the difference between a guard and a mob." } },
      choices = {
        { text = "What do you make of the Horde yourself?", next = "op_horde" },
        { text = "Fair.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Proof takes too long, so hang the likely ones.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    hyal = {
      lines = { { id = "hy_default", text = "James kept the Shady Rest: good ale, honest prices. He came home to ash and two graves, and he hasn't said a word to me since. I don't blame him." } },
      choices = {
        { text = "Then let's give him an answer.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "An answer won't bring his family back.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    taverns = {
      lines = { { id = "ta_default", text = "That the orcs did it, that the Lady's too soft, that we should march on Brackenwall tomorrow. Taverns always know everything and never get up off the bench." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcish = {
      lines = { { id = "o_default", text = "Enough to be understood and not enough to be poetic. Orcs respect a man who tries. They respect him more if he gets the insults right." } },
      choices = {
        { text = "Teach me an insult.", next = "orcish_insult", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orcish_insult = {
      lines = { { id = "oi_default", text = "No. You'd use it at the wrong moment, and I'd be the one explaining it to Krog." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tracks = {
      lines = { { id = "tr_default", text = "Then look properly: those aren't orc boots, they're something heavier, with a split hoof. Tell me I'm wrong; I'd almost like to be." } },
      choices = {
        { text = "You're not wrong.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "I'll need to see more.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    priest_hyal = {
      lines = { { id = "ph_default", text = "He hasn't spoken to anyone since. Your kind knows how to sit with grief better than mine does. Just sit with him, and leave the hoofprints to me." } },
      choices = {
        { text = "Just sitting. I promise.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "His grief is his own business, and I'll keep my distance.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "I want a sword that stays in its sheath until I say otherwise, and out here that's a rare blade. Half my recruits came out here to fight orcs, and I spend more time talking them out of it than I spend drilling them." },
      },
      choices = {
        { text = "I'll follow your orders, Captain.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If an orc swings at me, I swing back.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Asking questions is my job, but I'll answer a few of yours for a change. Pick one." },
    },
    background = { { id = "tp_bg", text = "Soldier, then sergeant, then the man the Lady asks when something smells wrong. The last one's the job I'm good at." } },
    advice = { { id = "tp_ad", text = "Never believe the first story, especially when everyone agrees on it." } },
    grimtotem = { { id = "tp_grimtotem", text = "Tauren who want the Horde to break its peace. I've no proof of it, yet." } },
    thrall = { { id = "tp_thrall", text = "Thrall keeps his end of the peace better than half our own nobles keep theirs, and I've the reports to prove it. Doesn't mean every orc in the marsh is his." } },
    onyxia = { { id = "tp_onyxia", text = "There's a black dragon in the south, Onyxia by name, and her brood have killed more of my scouts than the Horde ever has. I keep a map of their flights, and it grows every week." } },
    theramore = { { id = "tp_theramore", text = "Theramore's a good city with a hot temper, and right now it wants the inn's burning pinned on the Horde. I'd rather pin it on whoever did it." } },
    jaina = { { id = "tp_jaina", text = "The Lady wants the truth even when it's inconvenient, which is rarer than it ought to be in a ruler. That's why I can still do my job." } },
    scourge = { { id = "tp_scourge", text = "Most of us here are from Lordaeron, and we left because of the plague. You'll find that most of the city still wakes up at night counting the dead." } },
    booty_bay = { { id = "tp_booty_bay", text = "Pirates sail out of Booty Bay with goblin papers and sail back with our cargo. The goblins call it neutrality, and I call it a fence with a harbor." } },
    _none = { { id = "tp_none", text = "Not my investigation. I've got one already, and it's plenty." } },
  },
}

P:NPC {
  key = "tesoran", id = TODO_NPC("Adjutant Tesoran"), name = "Adjutant Tesoran",
  bible = "bibles/dustwallow.md", role = "soldier", tier = "quest",
  communities = { "theramore" }, temper = { "orderly" }, values = { "dutiful", "practical" },
  notices = { "kit" },

  impression = {
    first = "Adjutant Tesoran asked for my name, unit and business before he caught himself. He keeps every soldier's record in Theramore, and I'd guess he could find anything in them blindfolded.",
    third = "{name} met Adjutant Tesoran, who keeps the records of the Theramore Guard.",
  },

  greetings = {
    { id = "o_horde_tol", when = { gossip = { topic = "horde", stance = "tolerate" } }, text = "Captain Vimes noted that you'd judge the Horde by the peace they've kept. I've added it to your file, which I'd remind you is not a punishment." },
    { id = "g_records", text = "Name, unit, business? Sorry, that's habit; I keep the Guard's records, and everyone's a form to me." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, are you? I'd file you as returned if there were a form for it, and I'm half tempted to write one." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word reached the records office that you helped the city, and I've already noted it, because good deeds deserve paperwork as much as bad ones do." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I've heard someone left a conversation with you thoroughly displeased, and I hear most complaints sooner or later. Nothing's on paper yet, so let's keep it that way." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Equipment damaged in the field. I'd file a report, but you're not one of ours, so get it fixed anyway." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Most of them came out of Lordaeron, so they've seen orc shamans call lightning down on their own villages. Give them time, and don't stand too close to the barracks during a storm." } },
      choices = {
        { text = "I'll earn their trust in the field, Adjutant.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Their fear isn't my concern. I answer to the spirits.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Damp, boredom and the slow suspicion that nobody in Stormwind remembers Theramore exists, in roughly that order. The good ones stay because they swore to the Lady, and the records show it, because an oath kept is the easiest line I ever write." } },
      choices = {
        { text = "An oath sworn is an oath kept, whatever the damp.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sometimes a soldier is right to walk away.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That the raptors hunt in threes, the crocolisks lie up in the shallows, and the black whelps come a little further north every season. I file it all, though I sometimes wonder whether anyone reads it but me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I'll note {pet} in your file, if you don't object. I've never yet had a scout's companion on record that didn't end up mattering." },
      },
      choices = {
        { text = "Keep filing. Someone will need those records one day.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Records won't stop a raptor. Scouts need blades, not paper.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only what the Lady permits, which is very little, because the mages answer to her and to Archmage Tervosh. I keep their names, their quarters and their sailing dates, and I leave the rest to people who can read their handwriting." } },
      choices = {
        { text = "Good. Mages should answer to their own kind.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Everyone should be on the record, mages included.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, Adjutant.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The regulations say every soldier and every beast of burden must be counted, and your companion is close enough to either for my purposes. Captain Vimes once told me a good record has saved more lives than a good sword, and I've chosen to believe him." } },
      choices = {
        { text = "Record it, then. Rules are rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My servant is my own business, not Theramore's.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Very little, which is the trouble. Two of your Circle came to study the marsh in the city's first year, filled three notebooks in a script none of us read, and left without signing out, so they're still on my books as on patrol." } },
      choices = {
        { text = "Keep their names on the rolls. They may return.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Strike them off. Whoever leaves is gone.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Mostly raptors and fever, and a few lost on patrol in the fog who were never found. The record tells me who and when, but it doesn't tell me how to write to their families, and that is the part I find hardest." } },
      choices = {
        { text = "I'll help you write to the families, Adjutant.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Families need facts, not comfort. The record is enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "Warrior, by the look of you. If you're here to enlist, I'll need your name, your previous unit and a reason I won't find you in the deserters' column next month." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. The Guard keeps a handful of scouts on the roll, and their records are mostly lists of things that tried to eat them." },
        { id = "h_default", key = true,
          text = "Adjutant Tesoran. Every soldier in the Theramore Guard has a record, and I keep it, including the ones who walked away." },
        { id = "h_reethe", when = { questActive = TODO_QUEST("Lieutenant Paval Reethe") },
          text = "Reethe's file. Here, read it, and then tell the Captain I never said you could." },
        { id = "h_daelin", tags = { "news" }, when = { questActive = TODO_QUEST("Daelin's Men") },
          text = "Some of the Admiral's men never accepted that his war was over, and our records say where they went. Our records are very thorough." },
        { id = "h_ink", when = { metBefore = true }, text = "I ran out of ink yesterday and had to borrow from the Archmage, and his ink glows. My records glow now, and nobody will take them seriously." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. I don't have a ledger for you, since the Kirin Tor keep their own records, but I'll note your arrival anyway, because I note everything." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I'll need your name for the ledger, and I'll need it twice, once for you and once for whatever you've got following you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A kaldorei druid in Theramore. I'll have to add you to the record, since only a handful of your kind have come through the gates since the city was founded." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I'll note your arrival, and I'll note also that the chapel could use another pair of hands, since the Guard has had more funerals this year than the record likes." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, from Ironforge. I don't have a line in the ledger for that, so I'll write field support and trust the Lady won't ask." },
      },
      again = { { id = "h_again", text = "Anything else? I'll note it either way." } },
      choices = {
        { text = "What does the record say about Theramore's druids?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do the records say about the Guard?", next = "records" },
        { text = "The ones who walked away?", next = "deserters" },
        { text = "That's a lot to keep track of.", next = "system" },
        { text = "I'd wager you have a file on me.", next = "file", when = { townStanding = { town = "theramore", min = 20 } } },
        { text = "Records on deserters? I'd be hard to find.", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "What became of the Admiral's men?", next = "daelin", when = { any = { { questActive = TODO_QUEST("Daelin's Men") }, { questDone = TODO_QUEST("Daelin's Men") } } } },
        { text = "A paladin keeps his oath. Do your deserters?", next = "x_paladin", when = { class = "PALADIN" } },
        { text = "Do you keep records on Theramore's mages too, Adjutant?", next = "xmage", when = { class = "MAGE" } },
        { text = "Must you record my demon too, Adjutant?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Plenty of soldiers seem to desert out here, Adjutant.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What do the scouts' records say about the marsh?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do the records say about this year's dead, Adjutant?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How does Theramore's guard see a dwarf shaman, Adjutant?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you.", next = "END", fx = { affinity = 1 } },
      },
    },
    records = {
      lines = { { id = "r_default", text = "That we're stretched, damp and loyal, mostly loyal. The marsh takes more of us than the Horde does, and I have the columns to prove it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    deserters = {
      lines = { { id = "d_default", text = "Men who came over with the Admiral and couldn't stomach the Lady's peace. They didn't resign. They just stopped turning up, and started turning up elsewhere." } },
      choices = {
        { text = "Where?", next = "deserters_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    deserters_where = {
      lines = { { id = "dw_default", text = "That's in the files the Captain reads, not the ones I hand out. Ask him, and tell him I sent you; he'll sigh, but he'll answer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    system = {
      lines = { { id = "s_default", text = "Three ledgers, one for who they are, one for where they are, one for what they've done. When the three disagree, someone's lying. Usually the second ledger." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    file = {
      lines = { { id = "f_default", text = "Of course, a short one, very complimentary. The Captain wrote 'useful' and underlined it, and he doesn't underline things." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    daelin = {
      lines = {
        { id = "da_default", text = "Most went home to Kul Tiras with the ships, some stayed and took the Lady's colors, and some did neither. That last column keeps me up at night, because they still have their swords and they still have their grudge." },
        { id = "da_active", when = { questActive = TODO_QUEST("Daelin's Men") },
          text = "You've seen my notes, then, and you know where to look. Remember they were good soldiers once, and that's exactly what makes them dangerous." },
      },
      choices = {
        { text = "What grudge?", next = "daelin_grudge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    daelin_grudge = {
      big = true,
      lines = {
        { id = "dg_default", text = "That the Admiral died fighting orcs while his own daughter stood aside. I don't write opinions in my ledgers, but I'll say this much: a soldier who thinks his commander betrayed him is the hardest soldier in the world to bring back." },
      },
      choices = {
        { text = "The Lady chose peace. That was right.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I can see why they feel betrayed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_paladin = {
      lines = {
        { id = "xpa_default", text = "They swore to the Admiral, and in their own minds they're keeping that oath still. That's what troubles me; a man who breaks his word I can understand, but a man who keeps it to the wrong master is much harder to file." },
      },
      choices = {
        { text = "Then they need a better oath.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_rogue = {
      lines = {
        { id = "xr_default", text = "Everyone says that, and then they order the same drink in the same tavern twice, and somebody writes it down. Deserters aren't caught by soldiers, they're caught by habits, and I keep records of those as well." },
      },
      choices = {
        { text = "I don't have habits.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Good thing I'm not deserting, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every soldier's record passes through this office, and a fair bit of news comes with it. Ask, and I'll check my files." },
    },
    background = { { id = "tp_bg", text = "Joined the Guard, discovered I could spell, and was never allowed near a sword again. I've made my peace with it." } },
    advice = { { id = "tp_ad", text = "Write things down. Memory flatters you, but paper doesn't." } },
    theramore = { { id = "tp_theramore", text = "Theramore keeps a record of every soldier, sailor and refugee who has passed through the gates since the Lady founded it. I know, because I keep it." } },
    jaina = { { id = "tp_jaina", text = "Lady Proudmoore signs every death notice in this city herself, every one, though I've offered to do it for her. She says that's not a thing to pass to a clerk." } },
    lordaeron = { { id = "tp_lordaeron", text = "Half of the names in my ledgers came from Lordaeron, with a line through the town they came from. There's nobody left to write to in most of those places." } },
    onyxia = { { id = "tp_onyxia", text = "I keep a separate ledger for the scouts we've lost in the south of the marsh. It is longer than I'd like, and the dragon is the reason." } },
    scourge = { { id = "tp_scourge", text = "My records from the Lordaeron years end in the same word, page after page, and the word is plague. I've stopped reading them aloud." } },
    _none = { { id = "tp_none", text = "There's no file on that, which is itself worth noting." } },
  },
}

P:NPC {
  key = "janene", id = TODO_NPC("Innkeeper Janene"), name = "Innkeeper Janene",
  bible = "bibles/dustwallow.md", role = "innkeeper", tier = "service",
  communities = { "theramore" }, temper = { "steady" }, values = { "loyal", "generous" },
  notices = { "weary", "drink" },

  impression = {
    first = "Innkeeper Janene runs her inn like the kitchen of all Theramore and plainly loves the place. She fed me before she asked a single thing about me.",
    third = "{name} met Innkeeper Janene, the warm and steady keeper of Theramore's inn.",
  },

  greetings = {
    { id = "o_ther_stifle", when = { gossip = { topic = "theramore", stance = "stifling" } }, text = "I hear you told old Nat that Theramore's all soldiers and rules. Well, there's no rule against seconds in my kitchen, so you might want to rethink that." },
    { id = "o_orcs_hate", when = { gossip = { topic = "orcs", stance = "hate" } }, text = "The Lady was quiet over her supper, and I gather it was something you said about the orcs. We don't hold with that sort of talk in this kitchen, love, but sit down and eat anyway." },
    { id = "g_inn", text = "Come in out of the damp. Dustwallow gets into your bones; a hot meal gets it out again." },
    { id = "g_home", when = { homeInn = { "Theramore Isle", "Theramore" } }, text = "Back home on the isle! Your room's dry, and in Dustwallow, that's a promise worth making." },
    { id = "g_away", when = { away = 14 }, text = "There you are, after {away} away, and I kept your stool by the fire in case you came back hungry, which I can see from here that you did." },
    { id = "g_away_long", when = { away = 60 }, text = "Goodness, you've been gone {away}, and I'd nearly given your room to the soldiers when the guard rotated. Sit down right now and eat, and then you can tell me everything." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone came in today positively glowing after a chat with you, and I do love seeing that in this damp old town. Whatever you said, keep saying it." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The whole inn's been talking about how you helped the town, and I've heard it told three different ways already, each bigger than the last. Sit down and tell me which one is true." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've come a long way back from somewhere cold. Sit down, and I'll bring soup." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "One more and you'll be swimming home. The crocolisks would enjoy that more than you would." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some grumble, but they grumble about the soup too, and they eat that. In my inn, anyone who keeps the peace gets a bowl, and I'll throw out anyone who says otherwise." } },
      choices = {
        { text = "I'll keep the peace in your inn, Janene.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If they grumble at me, they'll hear about it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every night, and I can tell who's had a hard watch by how quietly they come in. The ones who've been out on the north road sit by the fire and don't say much, so I bring them stew and let them be." } },
      choices = {
        { text = "They've earned that quiet. You're good to them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Soldiers ought to talk it out, not sit and brood.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Tortoise, if you can get it, and a young raptor's flank if you're brave, though Morgan swears by the tortoise and he's usually right. Crocolisk I won't touch, because it tastes of the mud it came out of, and no amount of pepper fixes that." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} can lie by the hearth if it behaves, because the sailors like a beast in the room. They say it reminds them of the ship's dog." },
      },
      choices = {
        { text = "I hunt for the pot, never for sport.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I hunt for the challenge. The pot's just a bonus.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They notice the dragons, dear, and little else. The young ones come back talking about whelps in the south as if they were bedtime stories, and I've stopped correcting them, because what good would it do?" } },
      choices = {
        { text = "You should correct them. A wary soldier lives longer.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them have their stories. Fear never won a fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every night, because soldiers talk when they're tired and sailors talk when they're drunk, and mages talk to themselves. I keep all of it in the kitchen and none of it in my mouth, so they keep coming back to tell me more." } },
      choices = {
        { text = "A good innkeeper keeps her guests' secrets. I'd do the same.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Secrets are worth something. You could sell them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Janene.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They do, and the Lady insists on it, because she says a city that doesn't eat together doesn't fight together. The young ones from Dalaran still sit a little apart, but I've noticed the soldiers are starting to sit beside them." } },
      choices = {
        { text = "The Lady is right. We stand or fall together.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Mages and soldiers are different. Let them keep apart.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "A few, though not as many as came over from Lordaeron at the start. They're quiet when they drink, and they'll always sit with a grieving soldier, when nobody else will, and the soldiers notice it." } },
      choices = {
        { text = "Then I'll sit with them too, before I sleep.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I came here to rest, not to tend to others.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Worse, love. They won't whistle aboard ship, they won't sail without a coin under the mast, and one of them wouldn't touch his stew last month because a gull looked at it funny. A demon in the common room and I'd lose the lot of them to the docks." } },
      choices = {
        { text = "Then he waits outside, and the gulls can stare at him.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Superstition's their problem. He stays where I stay.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Sit down and take that helm off at my table, because nobody eats properly with their face in a bucket." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! If you've brought in anything from the marsh that could go in a pot, the kitchen's open, though I won't take anything that still has scales on." },
        { id = "h_default", key = true,
          text = "Innkeeper Janene. Soldiers, sailors, mages, merchants: they all end up at my tables sooner or later. Theramore is my home, and this inn is its kitchen." },
        { id = "h_lady", when = { metBefore = true }, text = "Lady Jaina came down to the kitchen last week to thank the cooks, in person, and half of them still won't wash the hand she shook." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The sea's loud tonight. Sailors say a loud sea is a lucky sea, but sailors say a lot of things." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at my tables! Sit down, dear, and tell me the truth: is it the marsh air, or does everyone from Darnassus look this tired when they first arrive?" },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You moved through my common room without spilling a drink or bumping a chair, and no soldier's ever managed that, so I suppose that makes you a rogue." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "Another mage at my tables! Half of Theramore's tower eats here, and they all want their tea hotter than I can make it, so don't you start." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at my tables, love! Sit by the fire, because the damp gets into plate faster than anything, and I've seen your lot rattle when they stand up." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, love? Leave the little fellow by the door and don't let him near the bread, because the sailors are a superstitious lot and they'll not eat a crumb he's breathed on." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman at my tables! Sit down, and tell me whether the spirits mind a bit of rain, because Theramore has plenty to share." },
      },
      again = { { id = "h_again", text = "Anything else, love?" } },
      choices = {
        { text = "The marsh's creatures seem uneasy. Do the soldiers notice?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "Your tables seem full of talk tonight.", next = "talk" },
        { text = "What's good to eat?", next = "food" },
        { text = "Do you keep a proper dwarven stout?", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Those sailors in the corner keep to themselves.", next = "sailors" },
        { text = "You look like you could use a blessing yourself.", next = "x_priest", when = { class = "PRIEST" } },
        { text = "Do you hear many secrets over your tables, Janene?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do the Theramore mages eat with everyone else, Janene?", next = "xmage", when = { class = "MAGE" } },
        { text = "Soldiers must come here after a long watch, Janene.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What's worth hunting for your kitchen, Janene?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do many of the Silver Hand come through Theramore, Janene?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Sailors are a superstitious lot, Janene.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do the soldiers here mind sharing a table with me, Janene?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just passing through.", next = "END" },
      },
    },
    talk = {
      lines = { { id = "t_default", text = "The burned inn on the north road, mostly. Half the room says orcs, the other half says it's too easy to say orcs. Captain Vimes drinks in the corner and says nothing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    food = {
      lines = { { id = "f_default", text = "Fish stew, because we're on an island, and bread, because the dwarves insisted. And something the quel'dorei like that nobody else will touch." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sailors = {
      lines = {
        { id = "sl_default", text = "Kul Tiras men, off the ships that stayed after the Admiral fell. They drink to his memory every night and glare at anyone who mentions the Lady's peace, so I keep their table well away from the Guard's." },
      },
      choices = {
        { text = "Do they make trouble?", next = "sailors_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sailors_trouble = {
      big = true,
      lines = {
        { id = "st_default", text = "Not in my inn, they don't. But some of them talk of the Admiral as if he were wronged, and a few of their friends stopped coming in at all, and Adjutant Tesoran asks after those ones by name." },
      },
      choices = {
        { text = "They lost their Admiral. Let them grieve.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grief's no excuse. Watch them closely.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_priest = {
      lines = {
        { id = "xp_default", text = "Me? Oh, love, I'm only tired, and tired's not something the Light needs to fuss over. Say one for the lads on the north road instead; they're the ones who come back with the marsh in their lungs." },
      },
      choices = {
        { text = "I'll pray for both of you.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_dwarf = {
      lines = {
        { id = "xd_default", text = "I keep what the boat brings, love, and the dwarves who've been here since the walls went up tell me every night that it isn't proper. They drink it all the same, so pull up a stool and complain along with them." },
      },
      choices = {
        { text = "I'll join the complaining, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone in Theramore eats at my tables, and they talk while they eat. Ask me what you like." },
    },
    background = { { id = "tp_bg", text = "I cook. I've cooked here since the walls were half built, and I'll cook here when they're finished, though they're never finished." } },
    advice = { { id = "tp_ad", text = "Dry your boots by the fire every night you're in the marsh. Rot starts in the toes." } },
    theramore = { { id = "tp_theramore", text = "Theramore's damp and crowded and smells of fish on a warm day, and I wouldn't live anywhere else. Everybody here came from somewhere worse, so we look after each other." } },
    jaina = { { id = "tp_jaina", text = "The Lady eats like a sparrow and works like an ox, and I send soup up to the tower whether she's asked for it or not. Somebody has to." } },
    booty_bay = { { id = "tp_booty_bay", text = "Sailors from Booty Bay come through with stories and empty purses, and leave with full bellies and emptier purses. They tip well when they've had a good voyage." } },
    onyxia = { { id = "tp_onyxia", text = "The scouts come back from the south and drink in silence, which tells me more than their reports would. That dragon's a bad neighbor, love." } },
    lordaeron = { { id = "tp_lordaeron", text = "Plenty of my regulars came out of Lordaeron with a sack and a child and nothing else. They don't talk about it much, and I don't ask, I just keep the bowls full." } },
    _none = { { id = "tp_none", text = "Plenty gets said over my bar, but not that. Ask at the citadel." } },
  },
}
