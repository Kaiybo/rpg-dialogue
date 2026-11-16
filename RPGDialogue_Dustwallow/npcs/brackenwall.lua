-- Brackenwall Village: the Horde's camp in Dustwallow Marsh. Voice: bibles/dustwallow.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "krog", id = TODO_NPC("Krog"), name = "Krog",
  bible = "bibles/dustwallow.md", role = "soldier", tier = "major",
  communities = { "brackenwall" }, temper = { "blunt" }, values = { "loyal", "dutiful" },
  notices = { "race", "kit" },

  impression = {
    first = "Krog wants to know who burned that inn because someone made a liar of his Warchief, and he takes that personally. He doesn't waste a word, and he doesn't trust the easy answer.",
    third = "{name} met Krog, the orc who commands Brackenwall Village and investigates the burning of the Shady Rest Inn.",
  },

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
          text = "Go to the burned inn, and see what's there, not what the humans say is there." },
        { id = "h_hoofprints", tags = { "news" }, when = { questActive = TODO_QUEST("Suspicious Hoofprints") },
          text = "Hoofprints in the mud by the inn? Quilboar, maybe, or centaur out of the Barrens; either would do a thing like that. I'll send Kagoro to follow them and see where they lead." },
        { id = "h_badge", when = { questActive = TODO_QUEST("Lieutenant Paval Reethe") },
          text = "A Theramore badge in the ashes, with a name on it. Now that is interesting, and I want to know what a human lieutenant was doing in an inn that burned." },
        { id = "h_shield", when = { questActive = TODO_QUEST("The Black Shield") },
          text = "A plain iron shield hung over a human fireplace? Even humans don't decorate like that, so somebody put it there on purpose, as a warning or a threat." },
        { id = "h_return", when = { questActive = TODO_QUEST("Return to Krog") },
          text = "Mosarn's best customers are the Grimtotem, is that what he said? Then he's helped us more than he knows, and we have our first suspects." },
        { id = "h_plot", when = { questActive = TODO_QUEST("The Grimtotem Plot") },
          text = "Grimtotem: tauren who want a war and want the Horde to pay for it. The Warchief will hear of this." },
        { id = "h_justice", when = { questActive = TODO_QUEST("Justice Dispensed") },
          text = "It's done. Whoever wanted war wanted it badly, and they'll have to want it from somewhere else now." },
      },
      again = {
        { id = "h_again", text = "What else? Make it useful." },
        { id = "h_again2", text = "Go on. I'm listening, and the marsh isn't." },
      },
      choices = {
        { text = "Why do you care about a human inn?", next = "why" },
        { text = "What do we know about the burning?", next = "inn" },
        { text = "Who is Paval Reethe?", next = "reethe" },
        { text = "What is Brackenwall to the Horde?", next = "village" },
        { text = "If tauren did this, they're no kin of mine.", next = "tauren", when = { race = "Tauren" } },
        { text = "Nazeer says the peace is only on paper.", next = "nazeer", when = { heardLine = "nazeer.h_default" } },
        { text = "Reethe's dead. Theramore soldiers killed him.", next = "reethe_dead", when = { questDone = TODO_QUEST("Questioning Reethe") } },
        { text = "Thrall's peace with the humans sits badly with me.", next = "x_orc", when = { race = "Orc" } },
        { text = "The spirits of this marsh are angry, Krog.", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "The Forsaken would gladly see Theramore burn.", next = "x_forsaken", when = { race = "Scourge" } },
        { text = "I'll find the truth.", next = "END", fx = { affinity = 2, align = { honor = 1 }, standing = { brackenwall = 1 } } },
        { text = "Blame it on the humans and save us the trouble.", next = "END", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },

    why = {
      big = true,
      lines = {
        { id = "w_default", text = "I don't care about the inn. I care that the Warchief gave an order and someone spat on it, and that I don't forgive." },
      },
      choices = {
        { text = "His word matters that much?", next = "why_word" },
        { text = "Fair.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 }, learn = { "grimtotem" } } },
      },
    },
    why_word = {
      lines = {
        { id = "ww_default", text = "His word is the only wall between this marsh and another war. The humans keep to their island and we keep to ours, as long as nobody crosses the line, and someone just set fire to the line." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },

    inn = {
      lines = {
        { id = "i_default", text = "The humans built an inn called the Shady Rest on the edge of the Barrens, and weeks ago it burned to the ground. It wasn't only the building, either; the owner's woman and his pup died in it, and that's bad business for everyone." },
      },
      choices = {
        { text = "What was left at the ruins?", next = "inn_clues" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn_clues = {
      lines = {
        { id = "ic_default", text = "Rows of hoofprints running off into the mud, a Theramore badge under the rubble, and a blackened iron shield fixed to the chimney. Each one points somewhere different, which is exactly how I'd lay it out if I wanted to start a fight." },
      },
      choices = {
        { text = "Who do you suspect?", next = "inn_suspects" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn_suspects = {
      lines = {
        { id = "is_default", text = "Everyone, until I don't. Quilboar and centaur leave hoofprints, a human lieutenant left his badge, and a shield doesn't hang itself, so I'll follow every trail to its end." },
        { id = "is_grimtotem", when = { questDone = TODO_QUEST("Return to Krog") },
          text = "The Grimtotem, now, since Mosarn told us they buy his shields by the cartload. Tauren with a grudge against the Horde's peace would burn a human inn and let us take the blame." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    reethe = {
      lines = {
        { id = "r_default", text = "A human lieutenant from Theramore who deserted his fellows and now hides in the woods, pathetic even for his kind. Some here think he's been stealing from our supplies, so I've sent Ogron to track him down." },
      },
      choices = {
        { text = "Ogron? The ogre?", next = "reethe_ogron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    reethe_ogron = {
      lines = {
        { id = "ro_default", text = "One of the Stonemaul, and a better tracker than he looks. He's quiet for an ogre, and he only bashes a skull when the skull's owner won't talk." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    village = {
      lines = {
        { id = "v_default", text = "It's the Stonemaul ogres' village, and the Horde stands with them. The humans claimed a good piece of this marsh, and the Stonemaul, with our help, have pushed them back." },
      },
      choices = {
        { text = "Orcs and ogres, side by side?", next = "village_ogres" },
        { text = "Something else.", next = "BACK" },
      },
    },
    village_ogres = {
      lines = {
        { id = "vo_default", text = "The Stonemaul fight like ogres and keep their word like orcs, which is more than I can say for some orcs. Black dragons drove them out of their old village in the south, and they've no love for anything that flies." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    tauren = {
      lines = {
        { id = "t_default", text = "I believe you, and I'll say so to anyone who asks. If tauren did this, they did it to shame the Earth Mother's people as much as to shame the Warchief, so you've as much reason as I do to find them." },
      },
      choices = {
        { text = "Then I'll find them.", next = "BACK", fx = { affinity = 3, align = { honor = 1 }, learn = { "grimtotem" } } },
        { text = "I'll not spill tauren blood for the Warchief's peace.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nazeer = {
      lines = {
        { id = "nz_default", text = "Nazeer would say that; it's his job to expect a knife behind every smile. Mine is to make sure the knife isn't ours." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    reethe_dead = {
      lines = {
        { id = "rd_default", text = "Killed by his own people before he could tell you anything, so someone in Theramore wanted him quiet more than they wanted him punished. That's another thread snapped, and another reason to pull harder on the next one." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_orc = {
      lines = {
        { id = "xo_default", text = "It sits badly with plenty of us, but the Warchief gave his word, and his word holds whether we like the taste of it or not. Whoever burned that inn wanted us to forget his word and remember the old hate, and I won't give them the satisfaction." },
        { id = "xo_grunt", when = { origin = "orc_razor_hill_grunt" }, text = "You stood the line at Razor Hill, so you know an order isn't there to be liked. This one says leave the humans be, and someone in this marsh broke it." },
      },
      choices = {
        { text = "The Warchief's word holds. So will I.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, standing = { brackenwall = 1 } } },
        { text = "Humans broke the peace before. They'll do it again.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_shaman = {
      lines = {
        { id = "xs_default", text = "Angry at us, or at the humans? Don't tell me, I've got enough people guessing already. If the spirits want to name whoever set that fire, they can say it plainly, and until then I'll trust hoofprints over omens." },
      },
      choices = {
        { text = "The spirits don't take sides in your hunt.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Then I'll look at the hoofprints.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    x_forsaken = {
      lines = {
        { id = "xf_default", text = "Then the Forsaken can keep that wish to themselves while they're in my marsh. The Warchief made his peace with Lady Proudmoore, and the Banshee Queen can make what deals she likes up north, but down here his word is the only one that counts." },
      },
      choices = {
        { text = "The Warchief's word is enough for me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The living make treaties. The dead remember.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The scouts bring me word from every corner of this marsh. Ask, and I'll tell you straight." },
    },
    grimtotem = { { id = "tp_grimtotem", text = "Cairne's problem, and now mine too. They'd burn the whole peace to warm their hands." } },
    background = { { id = "tp_ba", text = "The Warchief put me in charge of finding out who burned that inn. That's all you need to know about me, and it's all I need to know about myself until it's done.", next = "inn" } },
    advice = { { id = "tp_ad", text = "In this marsh, trust tracks before you trust words. Mud doesn't lie about who walked through it." } },
    _none = { { id = "tp_none", text = "I don't care about that. Find me the burners." } },
  },
}

P:NPC {
  key = "nazeer", id = TODO_NPC("Nazeer Bloodpike"), name = "Nazeer Bloodpike",
  bible = "bibles/dustwallow.md", role = "soldier", tier = "quest",
  communities = { "brackenwall" }, temper = { "suspicious" }, values = { "loyal", "cunning" },
  notices = { "class", "stealth" },

  impression = {
    first = "Nazeer Bloodpike counts the Alliance's smiles and the knives behind them, and I suspect he counts mine too. He trusts paper peace about as far as the marsh lets it stay dry.",
    third = "{name} met Nazeer Bloodpike, the suspicious orc spymaster who watches Theramore from Brackenwall.",
  },

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
        { id = "h_marg", when = { questActive = TODO_QUEST("Marg Speaks") },
          text = "So Marg's spirit sent you crab-hunting along the coast, did it? Find that pendant, and we'll see what he died for." },
        { id = "h_zor", when = { questActive = TODO_QUEST("Report to Zor") },
          text = "This goes to Zor Lonetree in Orgrimmar. Don't stop to chat on the way." },
        { id = "h_spies", when = { questActive = TODO_QUEST("Theramore Spies") },
          text = "Their infiltrators sit on the islands east of here and count our ogres. Make sure their masters get a different sort of report back." },
        { id = "h_wet", when = { metBefore = true }, text = "Another report from Theramore, soaked through. Everything in this marsh is soaked through, even the secrets." },
      },
      again = {
        { id = "h_again", text = "Anything else? Lower your voice when you ask it." },
        { id = "h_again2", text = "Go on. Nobody's listening, and I've checked twice." },
      },
      choices = {
        { text = "Who was your agent near Theramore?", next = "marg" },
        { text = "Is the peace with Theramore real?", next = "peace" },
        { text = "What do you make of Krog's hunt?", next = "krog" },
        { text = "What does the pendant mean?", next = "pendant", when = { questDone = TODO_QUEST("Marg Speaks") } },
        { text = "Kin'weelay can speak to the dead, they say.", next = "witchdoctor", when = { heardLine = "kinweelay.h_default" } },
        { text = "I can listen at windows.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I know wounds. Let me hear about Marg's.", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "I'll keep my ears open.", next = "END", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },

    marg = {
      lines = {
        { id = "m_default", text = "Marg Nighteye, stationed outside Theramore with orders to watch the city, and he spent weeks at it. His last report came back in a dead hand, which tells me his last mission went badly." },
      },
      choices = {
        { text = "How did he die?", next = "marg_wound" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marg_wound = {
      lines = {
        { id = "mw_default", text = "That ragged cut on his neck could be a blade or a beast, and I won't guess which. If it was the Alliance, the peace is thinner than anyone admits, and if it was a beast, I've lost a good agent to bad luck." },
        { id = "mw_done", when = { questDone = TODO_QUEST("Marg Speaks") },
          text = "A muckshell, one of those crab-men, caught him on his way home with a stolen pendant. So it was bad luck after all, though the pendant is anything but." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    peace = {
      big = true,
      lines = {
        { id = "p_default", text = "The Warchief and the Lady of Theramore agreed to leave each other alone, and in Orgrimmar that's the end of it. Out here, both sides keep watchers in the reeds, and watchers sometimes don't come home." },
      },
      choices = {
        { text = "Theramore spies on us too?", next = "peace_spies" },
        { text = "Then we should keep the peace anyway.", next = "BACK", fx = { align = { light = 1 }, opinion = { peace = "for" } } },
        { text = "Then let's stop pretending.", next = "BACK", fx = { align = { honor = -1 }, opinion = { peace = "against" } } },
      },
    },
    peace_spies = {
      lines = {
        { id = "ps_default", text = "Of course they do, from the islands east of the village, and they report our every move back to their citadel. I'd think less of them if they didn't, and I'd think less of myself if I let them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    krog = {
      lines = {
        { id = "k_default", text = "Krog wants the truth about that inn because the Warchief asked for it, and he'll get it. I want to know what the humans will do when they learn it, which is a different question and a more useful one." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    pendant = {
      lines = {
        { id = "pe_default", text = "A noble's pendant, heavy with gems, worn by a common Stormwind soldier on a beach near Theramore. Either its owner was in disguise, or the soldiers stole it, and I don't like either answer." },
      },
      choices = {
        { text = "Why send it to Zor Lonetree?", next = "pendant_zor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pendant_zor = {
      lines = {
        { id = "pz_default", text = "Zor knows the politics of the Alliance better than any orc alive, and he'll know whether that jewel has a history among Stormwind's nobles. Some secrets are told by what people wear." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    witchdoctor = {
      lines = {
        { id = "wd_default", text = "The strongest witch doctor the Darkspear have, sitting in Grom'gol with a cauldron and a grudge. If Marg's spirit still lingers, Kin'weelay will find it and make it talk." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Good, because Theramore's windows are many and its guards are bored. Listen for names, not secrets; a name tells you who to watch, and watching tells you the secrets." },
      },
      choices = { { text = "Understood.", next = "BACK", fx = { affinity = 2, trait = { discreet = 1 } } } },
    },
    x_hunter = {
      lines = {
        { id = "xh_default", text = "You hunt, so you'll know a wound when you see one. The cut on Marg's neck is too ragged for a good blade and too clean for a beast, and I've lost sleep deciding which it was." },
      },
      choices = {
        { text = "A beast with claws like pincers. Something off the shore.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "A blade, made to look like a beast's work.", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I watch Theramore, and I know more about it than the humans would like. Ask, and keep your voice low." },
    },
    background = { { id = "tp_ba", text = "I'm the Horde's spymaster in this marsh, and a spymaster's story is the one thing he never tells." } },
    advice = { { id = "tp_ad", text = "Keep a copy of every report in your head as well as in your pack. Marg's report came home in his hand, and his head came home separately." } },
    _none = { { id = "tp_none", text = "If I knew, I'd have reported it, and I haven't, so I don't." } },
  },
}
