-- The central mesa and lower rise: the sage who distrusts the new allies, the ceremony-keeper,
-- the last of the Stonespire, and the leather buyer. Voice: bibles/truthseeker.md, eyahn.md, auld.md, veren.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Sage Truthseeker: a scholar who trusts Cairne and very little else.
---------------------------------------------------------------------------
P:NPC {
  key = "truthseeker", id = TODO_NPC("Sage Truthseeker"), name = "Sage Truthseeker",
  bible = "bibles/truthseeker.md", role = "scholar", tier = "major",
  communities = { "thunder_bluff" }, temper = { "sharp" }, values = { "curious", "careful", "loyal" },
  notices = { "race", "dungeon", "lore" },
  impression = {
    first = "Sage Truthseeker reads the Bluff's politics the way other sages read old hides, looking for whoever is whispering to the Elder Council. She trusts Cairne completely and the Forsaken not at all.",
    third = "{name} met Sage Truthseeker, a scholar of Thunder Bluff who gathers knowledge to advise the High Chieftain.",
  },

  greetings = {
    { id = "g_hi", text = "Sit if you like, but keep your voice low. Half the mesa listens for a living." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good, I had a question I meant to ask someone who travels." },
    { id = "g_comp", when = { questActive = TODO_QUEST("Compendium of the Fallen") }, text = "The Compendium is in the monastery's library wing, if the Scarlet zealots haven't burned it for being too honest." },
    { id = "g_comp_done", when = { questDone = TODO_QUEST("Compendium of the Fallen") }, text = "I've read the Compendium twice now, and I sleep worse for it, which is how I know it was worth having." },
    { id = "g_discs", when = { questActive = TODO_QUEST("The Platinum Discs") }, text = "The discs from Uldaman? Bring them to me before anyone on Elder Rise hears of them." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the council has changed its mind twice since. Sit down and tell me what the roads say." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's people, here at my table. You'll forgive me if I keep my notes face down while we talk." },
    { id = "n_sm", cat = "dungeon", when = { cleared = "Scarlet Monastery" },
      text = "You've walked the halls of the Scarlet Monastery and come back out, which the zealots don't usually allow. Did you see their library?" },
    { id = "n_uld", cat = "lore", when = { cleared = "Uldaman" },
      text = "You've been down in Uldaman. There's stone dust in the seams of your boots that never came from Mulgore." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am called Truthseeker, which my grandmother meant as a blessing and the Elder Council treats as a warning. I gather what can be known, so that when the High Chieftain asks a question, someone in this city has an honest answer for him, whether it lies in a human book like the Compendium of the Fallen or in the dwarves' dig at Uldaman." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "I'll speak plainly, since you'd hear it from someone else anyway. I think the High Chieftain took your people into this alliance too quickly, and I have said so to his face, though I would follow him off this mesa if he asked." },
        { id = "h_comp_before", when = { questBefore = TODO_QUEST("Compendium of the Fallen"), minLevel = 30 },
          text = "The Earthen Ring's intentions seem pure enough, but I want to know who has been whispering in the Elder Council's ears. There is a book in the Scarlet Monastery called the Compendium of the Fallen, and I think it could tell me more about our newest allies than they ever will." },
        { id = "h_comp_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Compendium of the Fallen"), days = 3 } },
          text = "I half believed the Compendium was a story the humans told to frighten their children, and here it sits on my table. You have served the tauren of Thunder Bluff well, {name}, whatever the council says about my methods." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A child of the Earth Mother who has seen the wider world, good. Come and tell me what the orcs and the Forsaken say when they think no tauren is listening." },
      },
      again = {
        { id = "h_again", text = "What else? Ask, and I'll answer as honestly as is wise." },
        { id = "h_again2", text = "Go on. Questions are the only coin I collect." },
      },
      choices = {
        { text = "What do you make of the Forsaken, sage?", next = "forsaken" },
        { text = "Tell me about the Compendium of the Fallen.", next = "compendium" },
        { text = "What did the discs from Uldaman say?", next = "discs", when = { questDone = TODO_QUEST("The Platinum Discs") } },
        { text = "What is Uldaman, sage?", next = "discs" },
        { text = "Who has the Elder Council's ear, sage?", tag = "Persuade", next = "whisper",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("Compendium of the Fallen") }, { race = "Tauren", trait = "skeptical" } } } },
          fail = { next = "whisper_closed", fx = { affinity = -1 } } },
        { text = "What does a sage actually do here?", next = "sage" },
        { text = "I'm Forsaken. Ask me what you want to know.", next = "f_ask", when = { race = "Scourge" } },
        { text = "I carried water for the seers on Spirit Rise.", next = "o_spirit", when = { origin = "tauren_spirit_rise" } },
        { text = "Have you work for me?", next = "BUSINESS" },
        { text = "Earth Mother keep you, sage.", next = "END" },
      },
    },

    forsaken = {
      lines = {
        { id = "fk_default", text = "Because nobody has told me what they want, and a people who will not say what they want usually want something you won't like. The Warchief's own advisors in Orgrimmar warned against them, and the High Chieftain spoke for them anyway, out of a kind heart." },
        { id = "fk_orc", when = { race = "Orc" }, text = "Ask your own elders in Orgrimmar, friend, because they warned the High Chieftain about the Forsaken before I ever did. He spoke for them anyway, out of a kind heart, and kind hearts are the easiest kind to use." },
      },
      choices = {
        { text = "What do you think they want?", next = "forsaken_want" },
        { text = "Something else, sage.", next = "BACK" },
      },
    },
    forsaken_want = {
      lines = { { id = "fw_default", text = "I think they want to be what they were, and that they'll take whatever path leads there, including paths through us. Apothecary Zamah smiles very nicely down in the Pools of Vision, and I have never once seen what she sends home to the Undercity." } },
      choices = {
        { text = "Then what should Cairne do?", next = "forsaken_do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_do = {
      big = true,
      lines = {
        { id = "fd_default", text = "Keep them close and keep them counted, the way he keeps Magatha on Elder Rise. I don't say cast them out, because the Earth Mother would not thank us for turning away the lost, but I do say watch them." },
        { id = "fd_warm", when = { disposition = { min = 70 } }, text = "Keep them close and keep them counted, which is what he does with Magatha, though he would never say so. I'll tell you the part I keep from the council, too: some days I think they're less dangerous than the people who pretend to love them." },
      },
      choices = {
        { text = "The lost deserve a second chance. Cairne is right.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "You're right to watch them. Trust is earned.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    compendium = {
      lines = {
        { id = "cp_default", text = "A human book, kept by the Scarlet Crusade in the library of their monastery in Tirisfal Glades. It is said to tell how the plague came to Lordaeron and how the dead were raised, and I would like to read that history from someone other than the dead." },
      },
      choices = {
        { text = "Why not just ask the Forsaken?", next = "compendium_ask", fx = { learn = { "scarlet_monastery" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_monastery" } } },
      },
    },
    compendium_ask = {
      lines = { { id = "ca_default", text = "Because everyone tells their own story kindly, and the Forsaken have more reason than most. The Scarlet zealots hate them so much they'd never trouble to lie on their behalf, which makes their books useful in a sour sort of way." } },
      choices = {
        { text = "And what did the book tell you?", next = "compendium_read", when = { questDone = TODO_QUEST("Compendium of the Fallen") } },
        { text = "Using one enemy to judge another. Clever.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    compendium_read = {
      big = true,
      lines = { { id = "cr_default", text = "That a man named Kel'Thuzad carried plague grain to villages full of hungry, frightened people, and that their own deaths made them soldiers. The Forsaken were victims before they were anything else, and that makes my suspicion harder to hold, though I'm still holding it." } },
      choices = {
        { text = "Then let it go. They suffered enough.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Victims can still be dangerous. Hold it tight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    discs = {
      lines = {
        { id = "ds_default", text = "An old dig in the Badlands, where the dwarves have been scratching at something older than their own city. The stone halls down there were built by hands that were not dwarven, whatever Ironforge tells itself." },
        { id = "ds_done", when = { questDone = TODO_QUEST("The Platinum Discs") }, text = "They spoke of the titans, the makers who shaped the world before any of us walked it, and of the earthen they made out of stone to tend it. The dwarves will tell you that's their history, and I suspect it's everybody's." },
      },
      choices = {
        { text = "Do the tauren tell of the titans?", next = "discs_titans", fx = { learn = { "uldaman" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "uldaman" } } },
      },
    },
    discs_titans = {
      lines = { { id = "dt_default", text = "Not by that name. We say the Earth Mother shaped the land and An'she and Mu'sha watch it, and the elders don't care for anyone suggesting builders came first. I care a great deal, because a story that disagrees with ours is the one most worth hearing." } },
      choices = {
        { text = "Does it shake your faith?", next = "discs_faith" },
        { text = "Something else.", next = "BACK" },
      },
    },
    discs_faith = {
      big = true,
      lines = { { id = "df_default", text = "No, though the council fears it might. If the titans shaped the stone, someone gave them the stone to shape, and the Earth Mother is patient enough to have let them think they were in charge." } },
      choices = {
        { text = "Old truths should be dug up, whatever they say.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some things are better left buried in Uldaman.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    whisper = {
      big = true,
      lines = { { id = "w_default", text = "I can't prove it, so you will not repeat it. Magatha's people carry gifts to the elders' tents, and the elders come away talking about how the Bloodhoof are too friendly with outsiders, which is a Grimtotem song if ever I heard one." } },
      choices = {
        { text = "Then tell Cairne, before it spreads.", next = "whisper_cairne", fx = { learn = { "grimtotem" } } },
        { text = "Gifts aren't a crime, sage.", next = "whisper_cairne", fx = { learn = { "grimtotem" } } },
      },
    },
    whisper_cairne = {
      lines = { { id = "wc_default", text = "He knows, and he lets it run, because a whisper you can hear is safer than one you can't. That's his way, and mine is to write everything down so that when he wants proof, I have it ready." } },
      choices = {
        { text = "I'll keep my ears open for you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    whisper_closed = {
      lines = { { id = "wcl_default", text = "Nobody worth naming, {class}, and certainly nobody I'd name to a stranger in the middle of the lower rise. Ask me something about books." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },

    sage = {
      lines = { { id = "sg_default", text = "Listens, mostly, and reads what other people would rather nobody read. The druids on Elder Rise keep the old ways and the shaman keep the spirits, and someone has to keep track of the world that's changing around both of them." } },
      choices = {
        { text = "Is that why the council distrusts you?", next = "sage_council" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sage_council = {
      lines = { { id = "sc_default", text = "The council distrusts anything it didn't think of first, and I think of a great deal. I don't mind, because the High Chieftain still sends for me, and the day he stops I'll know I've grown careless." } },
      choices = { { text = "Something else, sage.", next = "BACK" } },
    },

    f_ask = {
      big = true,
      lines = { { id = "fa_default", text = "Very well. When you woke in the dark beneath Lordaeron, was the first thing you felt grief, or hunger? Think before you answer, because I'll know a polished reply when I hear one." } },
      choices = {
        { text = "Grief. I still carry it.", next = "f_answer", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hunger. Grief came later, and it's mostly gone.", next = "f_answer", fx = { align = { light = -1 } } },
      },
    },
    f_answer = {
      lines = { { id = "fan_default", text = "Thank you, and I mean that, because nobody else from the Undercity has given me a straight answer yet. I'll write it down, and I'll not write your name next to it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    o_spirit = {
      lines = { { id = "os_default", text = "Then you'll have heard more than the seers think you did, because nobody notices the one carrying the water. Tell me, did the Forsaken ever come up out of the Pools of Vision to speak with them?" } },
      choices = {
        { text = "Often, and quietly.", next = "BACK", fx = { affinity = 1 } },
        { text = "Never that I saw.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a little about a great many things, and a great deal about the people who'd rather I didn't. Pick one." } },
    background = { { id = "tp_bg", text = "I was raised by a grandmother who asked why at every campfire, and I never learned to stop. The High Chieftain finds it useful, and the council finds it tiresome." } },
    advice = { { id = "tp_ad", text = "When someone tells you a story that flatters them, ask who else was there. Then go and find that person." } },
    scarlet_crusade = { { id = "tp_sc", text = "Zealots, cruel ones, but they keep very good libraries, and I'll take my knowledge from wherever it's shelved." } },
    grimtotem = { { id = "tp_gt", text = "Magatha's people. They smile on Elder Rise and they carry spears in Stonetalon, and I'd like to know which face is the real one." } },
    uldaman = { { id = "tp_ul", text = "A dig in the Badlands with halls older than any dwarf. Bring me anything you find written there, and I'll find someone to read it." } },
    _none = { { id = "tp_none", text = "I haven't anything on that yet, which annoys me more than you'd think. Ask me again after you've learned something about it." } },
  },
}

---------------------------------------------------------------------------
-- Eyahn Eagletalon: Ruul's brother, who keeps the ceremonies.
---------------------------------------------------------------------------
P:NPC {
  key = "eyahn", id = TODO_NPC("Eyahn Eagletalon"), name = "Eyahn Eagletalon",
  bible = "bibles/eyahn.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "devout", "patient", "proud" },
  notices = { "kin", "trophy" },
  impression = {
    first = "Eyahn Eagletalon prepares the ceremonies on the lower rise, fussing over feathers and beadwork as though the Earth Mother would notice a crooked stitch. He is very proud of his brother Ruul, and tries not to show it.",
    third = "{name} met Eyahn Eagletalon, who keeps the ceremonies of Thunder Bluff and is brother to Ruul of Bloodhoof Village.",
  },

  greetings = {
    { id = "g_hi", text = "Mind the feathers on the mat, friend. They're sorted, though I know it doesn't look it." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've come back. Sit, and tell me if the harpies are still screaming over the cone." },
    { id = "g_active", when = { questActive = TODO_QUEST("Preparation for Ceremony") }, text = "Azure feathers and bronze ones, six of each. The Windfury keep the best of them, so you'll have to take them from the harpies themselves." },
    { id = "g_done", when = { questDone = TODO_QUEST("Preparation for Ceremony") }, text = "The headdress is finished, and my brother complained it was too fine, which is how I knew it was right." },
  },

  notice = {
    { id = "n_ruul", cat = "kin", when = { questDone = TODO_QUEST("Dangers of the Windfury") },
      text = "You've the look of someone Ruul has tested. He tells me who's worth meeting, and he mentioned someone like you." },
    { id = "n_feather", cat = "trophy", when = { questObjective = { TODO_QUEST("Preparation for Ceremony"), left = { max = 3 } } },
      text = "There's harpy down caught in your collar. You're nearly done, I think." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Eyahn Eagletalon, and I prepare the ceremonies, for the living who are honored and for the dead who are remembered. Right now I'm making a headdress for my brother Ruul, who must stand before the High Chieftain and has no idea how to dress for it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Preparation for Ceremony") },
          text = "I need feathers to finish my brother's headdress before he goes before Chief Bloodhoof, azure ones and bronze ones. The harpies of the Windfury north and northwest of the Bluff carry the finest, though they won't hand them over kindly." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Preparation for Ceremony"), days = 3 } },
          text = "Thank you, {name}. My part in the ceremony is nearly done now, and whenever Ruul stands before the chieftain wearing those feathers, a little of your work stands with him." },
        { id = "h_tauren_f", when = { race = "Tauren", gender = "female" },
          text = "A daughter of the plains, good. You'll know a well-sewn headdress when you see one, which is more than my brother does." },
      },
      again = {
        { id = "h_again", text = "Was there more? I can talk and sew at the same time." },
        { id = "h_again2", text = "Ask on, friend. The feathers aren't going anywhere." },
      },
      choices = {
        { text = "Why does Ruul stand before the chieftain?", next = "ruul" },
        { text = "What ceremonies do you prepare?", next = "ceremony" },
        { text = "Why harpy feathers, of all things?", next = "feathers" },
        { text = "Ruul tested me at Bloodhoof Village.", next = "tested", when = { questDone = TODO_QUEST("Dangers of the Windfury") } },
        { text = "I'll get your feathers.", next = "BUSINESS" },
        { text = "Farewell, Eyahn.", next = "END" },
      },
    },
    ruul = {
      lines = { { id = "r_default", text = "Because he has sent more young tauren safely out of Mulgore than anyone in Bloodhoof Village, and the chieftain wishes to honor him. Ruul says he only did his work, and he says it in a voice that means he'd like us all to stop talking about it." },
      },
      choices = {
        { text = "You sound proud of him.", next = "ruul_proud" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruul_proud = {
      lines = { { id = "rp_default", text = "I am, though I'll deny it if you tell him. When we were calves he was the one who climbed after eagle nests, and I was the one who sat below holding the feathers he threw down, and in a way that's still how it is." } },
      choices = {
        { text = "And do you mind that?", next = "ruul_mind" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruul_mind = {
      big = true,
      lines = { { id = "rm_default", text = "Sometimes, when I was younger. Now I think the one who climbs and the one who catches are both needed, and the Earth Mother doesn't care which of us the songs remember." } },
      choices = {
        { text = "The quiet work matters as much as the glory.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather be the one who climbs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ceremony = {
      lines = { { id = "c_default", text = "Namings, honorings, the rites for the dead out at the burial grounds. Every one needs the right paint, the right feathers and the right words, and if any of them is wrong the old ones notice, even if the young ones don't." } },
      choices = {
        { text = "Do the dead really notice?", next = "ceremony_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ceremony_dead = {
      lines = { { id = "cd_default", text = "Ask the quilboar who dug through our burial grounds in Mulgore, and the restless spirits that followed them home. I'd rather do the rites properly and be laughed at than do them badly and find out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feathers = {
      lines = { { id = "f_default", text = "Because the harpies steal from every bird on the plains and keep the brightest feathers for themselves. Taking them back is old tauren justice, and the colors carry better than anything a trader in Orgrimmar could dye." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tested = {
      lines = { { id = "t_default", text = "Then you're one of his, and I'm glad to meet you. He told me he'd send word of anyone worth knowing, and he's never once been wrong about a young one, though he's often wrong about headdresses." } },
      choices = { { text = "He was a hard teacher.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm Ruul's brother and the Bluff's ceremony-maker, and between the two of those I've very little time for anything else." } },
    advice = { { id = "tp_ad", text = "Dress properly when you go before your elders. They'll remember the stain on your hide long after they forget what you said." } },
    _none = { { id = "tp_none", text = "That's nothing I'd sew a feather for, friend. Ask someone with fewer beads in their lap." } },
  },
}

---------------------------------------------------------------------------
-- Auld Stonespire: one of the last of the Stonespire, who wants Charlga dead.
---------------------------------------------------------------------------
P:NPC {
  key = "auld", id = TODO_NPC("Auld Stonespire"), name = "Auld Stonespire",
  bible = "bibles/auld.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "gruff" }, values = { "proud", "loyal" },
  notices = { "dungeon", "class" },
  impression = {
    first = "Auld Stonespire is an old shaman and one of the last of his tribe, driven out of the holy lands of the southern Barrens. He has not forgiven it, and he does not think he should have to.",
    third = "{name} met Auld Stonespire, an old shaman of the scattered Stonespire tribe who wants Charlga Razorflank dead.",
  },

  greetings = {
    { id = "g_hi", text = "Hm. Another young one who'll tell me to let go of the past." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Well, you're still listening, which is more than most." },
    { id = "g_active", when = { questActive = TODO_QUEST("A Vengeful Fate") }, text = "Charlga's heart, {class}. Bring it here, and I'll die easier than I've lived." },
    { id = "g_done", when = { questDone = TODO_QUEST("A Vengeful Fate") }, text = "The crone is dead, and I slept the whole night through for the first time in years. Sit down, if you like." },
  },

  notice = {
    { id = "n_kraul", cat = "dungeon", when = { cleared = "Razorfen Kraul" },
      text = "You've been in the Kraul. You've got the thorn scratches, and the stink of quilboar that no river washes out." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The spirits told the Stonespire a great many things once, and none of them told us to run fast enough." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Auld, of the Stonespire, and there aren't many of us left to say it. My people lived in the southern Barrens, in land we held holy, until too many enemies drove us out, and I don't forgive that as easily as some of the elders up here. The quilboar crone Charlga Razorflank squats on it now." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A Vengeful Fate"), minLevel = 25 },
          text = "There's a crone named Charlga Razorflank in the thorns of Razorfen Kraul, raising a foul army of quilboar out of our old holy ground. She faces a vengeful fate, {name}, and I'd like you to be the one who brings it. Bring me her heart, so that I can die in peace." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Vengeful Fate"), days = 3 } },
          text = "Her heart, black and shrivelled, just as I imagined it. I'm told this should make me feel lighter, and some mornings it does, so I'll thank you for it." },
      },
      again = {
        { id = "h_again", text = "Well? I'm old, not deaf. Ask." },
        { id = "h_again2", text = "Something else on your mind, or are we finished?" },
      },
      choices = {
        { text = "What happened to the Stonespire?", next = "tribe" },
        { text = "Who is Charlga Razorflank?", next = "charlga" },
        { text = "Do the elders think you should forgive?", next = "forgive" },
        { text = "I've been to Razorfen Kraul.", next = "kraul", when = { cleared = "Razorfen Kraul" } },
        { text = "I'll bring you her heart.", next = "BUSINESS" },
        { text = "Earth Mother keep you, Auld.", next = "END" },
      },
    },
    tribe = {
      lines = { { id = "tr_default", text = "Centaur from the north, quilboar from the thorns, and the dry years in between. We buried our grandmothers in that ground, and we left them there when we ran, and that's the part that wakes me at night." } },
      choices = {
        { text = "Where did the rest of your people go?", next = "tribe_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe_rest = {
      lines = { { id = "trr_default", text = "Some to Cairne's banner, some to Camp Taurajo, and a few to the Grimtotem, who promised them they'd take the old lands back. I don't speak to those ones, but I understand them better than I'd like to." } },
      choices = {
        { text = "You understand the Grimtotem?", next = "tribe_grim", fx = { learn = { "grimtotem" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "grimtotem" } } },
      },
    },
    tribe_grim = {
      big = true,
      lines = { { id = "tg_default", text = "I understand being angry, and being told by a city on a mesa that anger isn't the tauren way. Magatha offers them someone to blame, and Cairne offers them patience, and patience is very hard to eat." } },
      choices = {
        { text = "Patience is still the better road.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Some wrongs should be answered, not waited out.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    charlga = {
      lines = { { id = "ch_default", text = "A quilboar crone who calls herself a priestess and gathers the Razormane and their thorn-witches to her. She sits in the Kraul on top of what was ours, and every spring she sends her raiders a little further north." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forgive = {
      big = true,
      lines = { { id = "fg_default", text = "They say the Earth Mother holds no grudges, so neither should her children. I say the Earth Mother wasn't there when the Kraul's thorns grew over my mother's grave." } },
      choices = {
        { text = "Forgiveness would free you, Auld.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Then let them answer for it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kraul = {
      lines = { { id = "k_default", text = "Did you see the old stones under the thorns, the ones with the carvings worn almost smooth? Those were ours, and if you saw them, you've seen more of my home than I have in thirty years." } },
      choices = { { text = "I saw them. They're still standing.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Stonespire, born in the south, too old to go back and too stubborn to stop wanting to." } },
    advice = { { id = "tp_ad", text = "Don't let anyone tell you how long to grieve. They'll always say it's been long enough." } },
    grimtotem = { { id = "tp_gt", text = "Angry people with a leader who knows how to use that. I've been angry for thirty years, so I know what it looks like." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I'm too old to start caring now." } },
  },
}

---------------------------------------------------------------------------
-- Veren Tallstrider: buys leather and teaches the young to make a bag of it.
---------------------------------------------------------------------------
P:NPC {
  key = "veren", id = TODO_NPC("Veren Tallstrider"), name = "Veren Tallstrider",
  bible = "bibles/veren.md", role = "questgiver", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "warm" }, values = { "practical", "craft" },
  notices = { "profession" },
  impression = {
    first = "Veren Tallstrider gathers leather on the middle rise and sends the young out to learn skinning and to stitch their first kodo hide bags. He talks about hides the way other people talk about family.",
    third = "{name} met Veren Tallstrider, who gathers leather in Thunder Bluff and teaches the young their first stitches.",
  },

  greetings = {
    { id = "g_hi", text = "Come in, come in, and step over the hides. They're drying, and they don't like being trod on." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Let me see your hands, and I'll tell you whether you've been working." },
    { id = "g_bag", when = { questDone = TODO_QUEST("Kodo Hide Bag") }, text = "Still carrying that kodo hide bag you made? Good. The first one's always ugly and always the one you keep." },
  },

  notice = {
    { id = "n_skin", cat = "profession", when = { profession = "Skinning" },
      text = "Your knife hand has the calluses of a skinner, and you've been keeping your blade sharp. I can tell from the clean edges on that hide at your belt." },
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" },
      text = "Leatherworker's thumbs, I'd know them anywhere. Sit, and let's talk about stitching." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Veren Tallstrider, and I gather leather for the Bluff, which means I spend my days up to my elbows in hides and my nights explaining to my mate why I smell like a tannery. It's honest work, and the young ones who learn it never go cold." },
        { id = "h_gather", when = { questBefore = TODO_QUEST("Gathering Leather") },
          text = "If you've a skinning knife and a willing arm, I could use some light leather. Go out among the plainstriders and prairie wolves of Mulgore and bring back what you take, and you'll learn more doing it than I could ever teach you sitting here." },
        { id = "h_bag", when = { questBefore = TODO_QUEST("Kodo Hide Bag") },
          text = "Every leatherworker on the Bluff starts the same way, with a kodo hide bag stitched badly and carried proudly. Bring me the leather and I'll show you how it's done." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've hides to turn, but I can talk while I do it." },
      },
      choices = {
        { text = "What makes good leather?", next = "leather" },
        { text = "Why do the young start with a kodo bag?", next = "bag" },
        { text = "Do tauren still hunt kodo?", next = "kodo" },
        { text = "I'm a druid. Does skinning bother me?", next = "druid", when = { class = "DRUID" } },
        { text = "Have you work for me?", next = "BUSINESS" },
        { text = "Farewell, Veren.", next = "END" },
      },
    },
    leather = {
      lines = { { id = "l_default", text = "A clean kill, a quick skinning and a patient tanning, in that order. Rush any of the three and you'll have something that cracks in the first cold rain on the Barrens." } },
      choices = {
        { text = "And a clean kill?", next = "leather_kill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_kill = {
      lines = { { id = "lk_default", text = "One that the beast barely knows about. Melor on Hunter Rise would tell you it's about respect, and he's right, but I'd tell you it's also about the hide, because a frightened animal makes poor leather." } },
      choices = {
        { text = "So respect is practical, too.", next = "leather_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leather_end = {
      big = true,
      lines = { { id = "le_default", text = "Most good things are, when you look at them long enough. My grandfather thanked every beast he skinned, and his hides were the best on the plains, and he never once said which was the cause." } },
      choices = {
        { text = "Thank the beast. It's the right thing.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A hide's a hide. Skill makes it good.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bag = {
      lines = { { id = "b_default", text = "Because kodo hide forgives a beginner's mistakes, and because a tauren carries her life with her. When we wandered, the bag you made was where everything you owned lived, so it's a good first lesson in why the work matters." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kodo = {
      lines = { { id = "k_default", text = "The old and the sick ones, and only what we need. We walked beside the kodo for generations, and it would be a poor thanks to hunt them the way the centaur do, for sport and nothing else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "It bothers some of Hamuul's students and not others. The Earth Mother gives the beast and takes it back, and what's left in between can keep a calf warm, so I've never thought it was disrespect, but you'll have to find your own answer." } },
      choices = { { text = "I'll think on it.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Leather, my whole life. My hands smelled of tannin before I could walk properly." } },
    advice = { { id = "tp_ad", text = "Carry a spare needle. You'll never need it until you're far from anyone who has one." } },
    _none = { { id = "tp_none", text = "That's not a hide I know how to work, friend. Ask someone with cleaner hands." } },
  },
}
