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
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the marsh hasn't gotten any quieter while you were away. Tell me you found something worth the wait." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You're stronger than when I first sent you out, and that's good, because what I need from you now is harder." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I hear you scared someone in camp half to death, and I don't care unless it gets back to Theramore. Keep your fists for the people I point you at." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word is you talked circles around somebody in the camp and they believed every word, which is a useful skill, so long as you never try it on me." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren, good. You'll know the difference between your people and the ones who'd shame them." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Something chewed on you, so get patched; I need you on your feet." },
  },

  start = "hello",
  nodes = {
    xpt_krog = {
      big = true,
      lines = { { id = "xpt_krog_default", text = "The truth is that the Shady Rest burned and both sides are blaming the other, and the Warchief's peace is only as strong as the next rumor. A war band like yours could ask hard questions on either side of the marsh, so long as you don't start the war I'm trying to stop." } },
      choices = {
        { text = "We'll keep the peace, Krog. Thrall gave his word.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the humans did it, we strike first and ask later.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "No. They'd see one of the dead wearing their Light and decide you stole it, and the peace is thin enough without that. Keep to the Horde's side of the marsh until I find who burned that inn." } },
      choices = {
        { text = "I'll keep to our side. The Warchief's peace matters.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them think what they like. I won't hide.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "If Thrall ordered it I'd march, and I'd do it well, but he hasn't, and I won't let some inn-burner give the order in his place. A warrior who swings at whoever he's told to hate is just a weapon in someone else's hand." } },
      choices = {
        { text = "The Warchief's word is the line. I hold it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If Theramore spills orc blood, I won't wait for orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hoofprints, heavy ones, among the boot marks, and they lead off toward the hills rather than toward Brackenwall. I'm no tracker, but I know an orc's tread when I see one, and none of those were ours." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Put {pet} on the scent near the inn, because a beast's nose doesn't care whose story is convenient. Mine never did either." },
      },
      choices = {
        { text = "I'll follow that trail wherever it leads, even into the Horde.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The trail leads where Brackenwall needs it to lead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I think they wear her name like a stolen cloak. You'd know better than an orc whether the earth still answers them, but I know a traitor when I see one." } },
      choices = {
        { text = "They should face judgment before their own elders.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Elders talk too much. Let the marsh have them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Near the burned inn, where somebody left Horde weapons lying about a little too neatly. Real orcs don't leave their axes behind, so whoever did this wanted them found, and I want to know who carried them there." } },
      choices = {
        { text = "I'll find the liar and let the Warchief judge him.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll find the liar and deal with him myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Krog.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because Theramore already believes we burned that inn, and a felhound loping past their sentries would be all the proof they need. Lady Proudmoore holds her people back, but even she cannot hold them forever if we hand them a reason." } },
      choices = {
        { text = "You're right. I'll keep my servants close until this is settled.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the humans see what the Horde can summon. Fear keeps peace.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not if I can help it. But the Grimtotem want a war, and some of the grunts here want one too, because they never stopped fighting in their heads, so I need someone in Brackenwall who can calm them as well as heal them." } },
      choices = {
        { text = "I'll calm them. The Warchief's peace is worth keeping.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let them have their anger. The humans earned it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Fear is the wrong word. Their Lady could have burned Brackenwall to the mud any night she liked, and she hasn't, which tells me more about her than any treaty. Still, I'd like to know what Archmage Tervosh keeps in that tower of his." } },
      choices = {
        { text = "I'll respect their peace. They've kept their word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll find out what's in that tower, quietly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_ony = {
      big = true,
      lines = {
        { id = "xcl_ony_default", text = "Then the Warchief will hear of it, and he'll be glad, because that dragon cost the Horde more grunts in this marsh than the humans ever did. Rexxar always said she was more than she looked, and I never doubted him, but I never got close enough to find out." },
      },
      choices = {
        { text = "The grunts who fell to her earned this victory too.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I didn't do it for the Horde. I did it for her hoard.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Will Thrall hang her head in Orgrimmar?", next = "xcl_ony2" },
      },
    },
    xcl_ony2 = {
      lines = { { id = "xcl_ony2_default", text = "He might, and I'd walk all the way to Durotar to see it. The old Horde chained dragons once, and Thrall doesn't like to be reminded of it, but a black one who hunted his people is a different story." } },
      choices = {
        { text = "Then I'll look for it on the gate, Krog.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_krog", tags = { "news" }, when = { party = { size = 4 }, faction = "Horde" },
          text = "A full war band, walking into Brackenwall like you own it. Good, because if the Theramore humans are lying about that inn, we may need every one of you." },
        { id = "h_cl_ony", tags = { "news" }, when = { cleared = "Onyxia's Lair", faction = "Horde" }, text = "The grunts say you went into the dragon's cave in the Wyrmbog and came out with her dead. Good, because Onyxia's whelps have been raiding our patrols since before Brackenwall had a wall." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. Good, because if this turns to blood with Theramore I want axes I can count on, though I'd rather it never came to that." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. You read tracks, so go read the ones around the Shady Rest, and tell me what Theramore's soldiers missed." },
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
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A tauren druid in Brackenwall, good. You'll know better than I do what the Earth Mother makes of tauren who'd start a war in her name." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. Good, because the truth about that inn won't be found by shouting at the gates of Theramore, and you know how to listen where others stomp." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Thrall forgives the old ways in those who serve him well, and I'll do the same, but keep your demons away from the human road while the inn still smokes." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. Good, because if this turns ugly with Theramore there'll be wounded on both sides of the marsh, and I'd rather you were here than there." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage of the Horde. Theramore's full of your kind, wearing blue and doing the Lady's bidding, and I'd like someone on our side who knows what they're capable of." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Grimtotem", min = 20 } }, text = "Word is the Grimtotem in the marsh are a good deal fewer than they were, and they're not happy about it. Neither am I, though only because I'd have liked to watch." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. The humans of Theramore have paladins too, and they'd look at you and see something worse than an orc." },
      },
      again = {
        { id = "h_again", text = "What else? Make it useful." },
        { id = "h_again2", text = "Go on. I'm listening, and the marsh isn't." },
      },
      choices = {
        { text = "Do the Grimtotem shame the Earth Mother, Krog?", next = "druid_q", when = { class = "DRUID" } },
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
        { text = "Do you expect the fighting to start again, Krog?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do you fear from Theramore's mages, Krog?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Onyxia is dead, Krog. Her lair is empty.", next = "xcl_ony", when = { cleared = "Onyxia's Lair", faction = "Horde" } },
        { text = "We fight together, Krog. Point us at the truth.", next = "xpt_krog", when = { party = { size = 4 }, faction = "Horde" } },
        { text = "I'll find the truth.", next = "END", fx = { affinity = 2, align = { honor = 1 }, standing = { brackenwall = 1 } } },
        { text = "Where would you have me look for the truth, Krog?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why keep my demons off the road, Krog?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would you march on Theramore if the Warchief ordered it, Krog?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What tracks did you find near the Shady Rest, Krog?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Would Theramore's humans trust a Forsaken paladin, Krog?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I counted the Alliance patrols while you were away, as I always do. There were more of them than before, which I'm sure is a coincidence." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told someone here caught you in a lie, and I keep count of liars just as I keep count of smiles. You're on my list now, so give me a reason to take you off it." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone in camp round to your view, and I'd like to know what you told them, because a tongue like that would be useful on the road to Theramore." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Quiet feet, good. I've work for those who can listen at a window without being seen." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because their paladins are sworn to put the dead back in the ground, and you walk about with their Light in your hands. I'm glad you're ours, but I'd keep you well away from the marsh road, because a paper peace burns quickly." } },
      choices = {
        { text = "I'll keep off their road and keep the peace.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If their paladins want a fight, they'll get one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every soldier drills, so it means nothing, unless it means something, and that's the whole of my trade. Proudmoore's guard is disciplined and well fed and very close to my doorstep, and a peace on paper doesn't make a sword any shorter." } },
      choices = {
        { text = "Drilling isn't war. Keep the peace until they break it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Strike before they're ready. Paper won't stop their blades.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "It means Lady Proudmoore can put more fire on a wall than all our shamans together, and she knows it, and so do I. I count her mages the way I count her soldiers, and I'd be glad of someone who can tell me what her towers are really for." } },
      choices = {
        { text = "Peace on paper won't stop fire. We should prepare.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Proudmoore keeps the peace. We should keep it too.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Lady Proudmoore has stood beside Thrall and knows what a shaman is, so she doesn't fear you, but her soldiers do. I'd keep it that way, because fear is cheaper than walls." } },
      choices = {
        { text = "Fear breeds war. Better they learn what we truly are.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them fear us. It keeps the peace in our favor.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Their mages are the walls Proudmoore never had to build, and every one of them saw Dalaran fall. I've watched them ward the docks and the tower at night, and I don't think they sleep any more than I do." } },
      choices = {
        { text = "Respect them. A frightened mage keeps the peace better than a proud one.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every ward has a gap. Find it before they need to.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'd send it if I trusted it to come back with the truth and not with a fire behind it. The peace hangs on a thread, and one demon caught in the Lady's halls would cut it for good, so for now I keep my spies on two legs." } },
      choices = {
        { text = "Peace on paper is still peace. Don't risk it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Use every tool. The Alliance surely does.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "As long as Jaina and Thrall want it to, and no longer than the first fool on either side decides otherwise. I watch, I report, and I don't trust the swamp to keep anyone's secrets, ours or theirs." } },
      choices = {
        { text = "Peace with humans is wet paper. Stay ready.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Hold to the peace. Thrall gave his word.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. Theramore's soldiers drill on their walls every morning where we can see them, and I'd like to know what someone like you makes of that." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll hear the marsh better than my spies do, so tell me if the water ever carries a voice from Theramore." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, in the marsh. Theramore's chaplains will want to talk theology with you, so don't, because everything you tell them ends up in a report." },
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
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage of the Horde. Theramore is full of your kind, Kirin Tor refugees with long memories, so I'd like to hear how you think one of them thinks." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your imp could slip under Theramore's walls easier than any of my spies, and I've thought about it more than once, I'll admit." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid in the marsh. Your people know this swamp better than mine, I'll grant you, and the Stonemaul trust you more than they trust me." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. Theramore would count you a threat twice over, and for once I think they'd be right." },
      },
      again = {
        { id = "h_again", text = "Anything else? Lower your voice when you ask it." },
        { id = "h_again2", text = "Go on. Nobody's listening, and I've checked twice." },
      },
      choices = {
        { text = "Will the peace with Theramore hold?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Does Theramore fear the shamans of the Horde?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does Theramore's magic mean for Brackenwall?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who was your agent near Theramore?", next = "marg" },
        { text = "Is the peace with Theramore real?", next = "peace" },
        { text = "What do you make of Krog's hunt?", next = "krog" },
        { text = "What does the pendant mean?", next = "pendant", when = { questDone = TODO_QUEST("Marg Speaks") } },
        { text = "Kin'weelay can speak to the dead, they say.", next = "witchdoctor", when = { heardLine = "kinweelay.h_default" } },
        { text = "I can listen at windows.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I know wounds. Let me hear about Marg's.", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "Do Theramore's mages worry you, Nazeer?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would you really send an imp to spy on Theramore, Nazeer?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Should Brackenwall worry about Theramore's soldiers drilling?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why would Theramore count me a threat, Nazeer?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
