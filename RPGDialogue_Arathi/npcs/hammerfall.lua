-- Hammerfall (Horde): Gor'mul, Tor'gan, Korin Fel, Urda. Voice: bibles/arathi.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gormul", id = TODO_NPC("Gor'mul"), name = "Gor'mul",
  bible = "bibles/arathi.md", role = "questgiver", tier = "quest",
  communities = { "hammerfall" }, temper = { "bitter" }, values = { "loyal" },
  notices = { "race" },

  impression = {
    first = "Gor'mul was a prisoner in the Hammerfall camp the night Doomhammer died breaking it open, and he never recovered. He talks about that night as if it were yesterday and the years since as if they never happened.",
    third = "{name} met Gor'mul, a despairing orc of Hammerfall who was left behind when the camp was freed and never got over Doomhammer's death.",
  },

  greetings = {
    { id = "g_default", text = "What do you want? There is nothing here worth the walk." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still hoping to find something in me worth saving?" },
    { id = "g_better", when = { questDone = TODO_QUEST("Guile of the Raptor") }, text = "Ah, you. Sit, if you like. I find I can stand company again, some days." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Another orc, walking free and proud. Were you in the camps, or were you born after? It shows, either way." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ask, then, but they will find nothing in me worth answering. The Warchief says the spirits forgave our people for the demon blood, but I have not forgiven myself for standing in chains while a hero died, and I doubt the spirits can do what I cannot." } },
      choices = {
        { text = "Honor him by living, Gor'mul. The spirits would tell you the same.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then keep your grief. I won't trouble the spirits over it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. Thrall stood in this very camp the night Doomhammer fell, already speaking with the spirits, and I was here to see it, though they have never once answered me." },
        { id = "h_default", key = true,
          text = "I am Gor'mul. I was chained in this very camp, and I saw the Warchief come for us in his black armor with his hammer raised, and I saw a coward on a horse put a lance through his back. Tell me what use hope is after a thing like that." },
        { id = "h_amulet", when = { questActive = TODO_QUEST("Raising Spirits") },
          text = "Tor'gan sent you with some bauble, didn't he? Polished bone will not mend what was broken here." },
        { id = "h_orb", tags = { "news" }, when = { questActive = TODO_QUEST("Guile of the Raptor") },
          text = "More of Tor'gan's pity, carried in your hands. Very well, show me what it is this time, and then leave me be." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Guile of the Raptor"), days = 3 } },
          text = "The raptor's spirit still burns in my blood, and I cannot remember the last time I felt anything burn. Tell Tor'gan I'll listen to him, for now, but only for now." },
        { id = "h_later", when = { questDone = TODO_QUEST("Guile of the Raptor") },
          text = "Tor'gan tells me of Orgrimmar and the shaman, and of a warchief who is Durotan's son. Some of it I even believe, and that is more than I could say before you came." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask, then, for all the good it will do." },
        { id = "h_again2", text = "Still here? Go on." },
      },
      choices = {
        { text = "Hammerfall bears a warrior's name, Gor'mul. I mean to honor it.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "The spirits haven't abandoned you, Gor'mul. Will you let me ask them?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Tell me about that night.", next = "night" },
        { text = "Why did you stay here?", next = "stayed" },
        { text = "What do you think of Tor'gan?", next = "torgan" },
        { text = "Thrall leads a new Horde now.", next = "thrall" },
        { text = "I was born in the camps too.", next = "camp", when = { origin = "orc_camp_born" } },
        { text = "The dead don't always stay dead, orc.", next = "forsaken", when = { race = "Scourge" } },
        { text = "Leave him be.", next = "END" },
      },
    },
    night = {
      big = true,
      lines = { { id = "n_default", text = "The earth shook and the walls came down, and our people poured out into the night. I was too slow, so they ran and I stayed, and the last thing I saw of my Warchief was the lance and the fall." },
        { id = "n_after", when = { questDone = TODO_QUEST("Guile of the Raptor") }, text = "The earth shook and the walls came down, and I was too slow to follow. I still see the lance when I close my eyes, but now I also see what Doomhammer died to give us." } },
      choices = {
        { text = "Who killed him?", next = "night_lance" },
        { text = "He died freeing his people. That's a good death.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Grief won't avenge him. Get up and fight.", next = "BACK", fx = { align = { honor = -1 }, trait = { stern = 1 } } },
      },
    },
    night_lance = {
      lines = { { id = "nl_default", text = "A human knight on a horse, from behind, while the Warchief fought another. I never learned his name, and I have spent years being glad of that, because I would only have gone looking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stayed = {
      lines = { { id = "s_default", text = "Where would I go? I wandered alone for years with no clan and no purpose, and when the Horde came back to these ruins I came back too, like a dog to the house that beat it." } },
      choices = {
        { text = "This is Hammerfall now, not a prison.", next = "stayed_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stayed_name = {
      lines = { { id = "sn_default", text = "They named it for him, yes, and Drum Fel builds walls on it. Drum has never been in a cage, and it shows in how easily he says the word future." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    torgan = {
      lines = {
        { id = "t_default", text = "A troll who feels mercy for an orc who wanted none. He keeps sending me trinkets as if the spirits could stitch a heart back together." },
        { id = "t_after", when = { questDone = TODO_QUEST("Guile of the Raptor") },
          text = "A patient troll, more patient than I deserved. Whatever he put into that orb, it reached something I thought had died with the Warchief." },
      },
      choices = {
        { text = "Maybe they can.", next = "torgan_spirits" },
        { text = "Something else.", next = "BACK" },
      },
    },
    torgan_spirits = {
      lines = { { id = "ts_default", text = "Our shaman were warlocks when I was taken, and the old ways were a story the elders told. If the spirits truly answer again, then the world changed while I wasn't looking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thrall = {
      lines = { { id = "th_default", text = "So they tell me, a young one raised by humans who freed the camps and leads us across the sea. I would like to believe in him, but I believed in Doomhammer, and I saw what believing is worth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Then you know the Doomhammer fell not far from here, freeing our people from the camps. A warrior who honors his name doesn't only fight, but fights for those who can't." } },
      choices = {
        { text = "I'll fight for those who can't, as he did.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I fight to win. Honor comes second.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Then you know the smell of it, the mud and the iron and the quiet. Do not let anyone tell you that you should forget it, but do not let it hold you the way it held me." } },
      choices = { { text = "I won't.", next = "BACK", fx = { affinity = 2 } } },
    },
    forsaken = {
      lines = { { id = "f_default", text = "No, I can see that they don't. You came back from death with your purpose intact, and I came back from a prison with nothing, so perhaps you have something to teach me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know this camp, every stake and every cell. Ask about those, if you must ask." } },
    background = { { id = "tp_bg", text = "A prisoner here, then a wanderer, then a prisoner here again, of a different kind.", next = "night" } },
    advice = { { id = "tp_ad", text = "Never turn your back on a horseman. That is the only lesson the camps taught me worth keeping." } },
    doomhammer = { { id = "tp_doom", text = "He came for us, and he died for it, here.", next = "night" } },
    _none = { { id = "tp_none", text = "I don't know, and I find I don't care. Ask Tor'gan; he cares about everything." } },
  },
}

P:NPC {
  key = "torgan", id = TODO_NPC("Tor'gan"), name = "Tor'gan",
  bible = "bibles/arathi.md", role = "questgiver", tier = "quest",
  communities = { "hammerfall" }, temper = { "patient" }, values = { "compassionate", "devout" },
  notices = { "class", "race" },

  impression = {
    first = "Tor'gan is Hammerfall's troll shaman, and he believes the spirits can heal even an orc who has given up. He is gentle about it, which in Hammerfall makes him unusual.",
    third = "{name} met Tor'gan, the troll shaman of Hammerfall, who is trying to bring the despairing Gor'mul back to life.",
  },

  greetings = {
    { id = "g_default", text = "Peace, friend. Even here, in the ruins of our people's prison, the spirits be listenin'." },
    { id = "g_back", when = { metBefore = true }, text = "You come back, good. The spirits said you would, or maybe I just hoped." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! The elements walk with you, I can feel it from here, and they be glad to find another of us in this hard place." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear blood, like mine. The Witherbark down the hill be no cousins of ours, so don't you go feelin' sorry for them." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "This ground held a prison, and before that a battlefield, and the stones remember every chain. I be coaxing them back slow, but the Witherbark be singing to their own dark loa just over the hills." } },
      choices = {
        { text = "Then we'll heal this ground together, Tor'gan.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let the stones remember. Pain is a good teacher.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid of the Earth Mother come to Hammerfall! The spirits here be thin and tired, friend, but they be glad of anyone who listens to them." },
        { id = "h_default", key = true,
          text = "I be Tor'gan, shaman of Hammerfall. The Warchief gave our people back their hope, and here in the ruins of the old prison I tend what's left of it like a small fire in the wind." },
        { id = "h_hammerfall", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hammerfall"), days = 2 } },
          text = "Ah, you speak of Gor'mul. He was a captive here when Thrall and Orgrim broke the camp, and when the earth shook he was left behind, and he never found his way out of that night." },
        { id = "h_spirits", when = { questActive = TODO_QUEST("Raising Spirits") },
          text = "Take my amulet to Gor'mul and see if the raptor's strength can wake the warrior in him. If it don't, we try somethin' stronger." },
        { id = "h_guile", when = { questActive = TODO_QUEST("Guile of the Raptor") },
          text = "The fleshstalkers to the south be cunning as well as strong, and their hearts carry both. Bring them, and I make an orb no despair can stand against." },
        { id = "h_magics", when = { questActive = TODO_QUEST("Foul Magics") },
          text = "Somebody summon demons at Northfold Manor; I felt it in my blood before I ever saw the place. Bring me the bloodstone amulets the Syndicate use, so I learn what they be callin'." },
        { id = "h_gormul_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Guile of the Raptor"), days = 3 } },
          text = "Gor'mul spoke to me today, and not to curse me. When the raptor's fire fades I will sit with him and tell him what the Horde be now, and I think this time he will hear it." },
      },
      again = {
        { id = "h_again", text = "What else be on your mind, friend?" },
        { id = "h_again2", text = "Ask. The spirits got patience, and so do I." },
      },
      choices = {
        { text = "Why are the spirits here so tired, Tor'gan?", next = "druid_q", when = { class = "DRUID" } },
        { text = "The Highlands are wide. What should a hunter track first?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Why help Gor'mul?", next = "gormul" },
        { text = "What did you find at Northfold Manor?", next = "northfold" },
        { text = "You rebuilt a sigil for Zengu?", next = "sigil" },
        { text = "How did a troll come to be shaman here?", next = "shaman" },
        { text = "Teach me something of the raptor spirits.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "Can a Forsaken be healed by spirits?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'll help Gor'mul.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    gormul = {
      big = true,
      lines = { { id = "gm_default", text = "Because the Horde be more than the strong ones, and a warrior lost in grief be still a warrior. If the shaman's gifts woke our people from the demon's curse, they can wake one tired orc." } },
      choices = {
        { text = "What have you tried?", next = "gormul_tried" },
        { text = "Everyone deserves a second chance.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "If he won't stand, he's dead weight. Let him go.", next = "BACK", fx = { align = { light = -1 }, affinity = -2 } },
      },
    },
    gormul_tried = {
      lines = { { id = "gt_default", text = "An amulet of raptor talon first, and he threw it in the mud. Next I put the hearts of the fleshstalkers into an orb, because what he lacks be not strength, it be the cunning to find a reason." } },
      choices = {
        { text = "And if that fails?", next = "gormul_fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gormul_fail = {
      lines = { { id = "gf_default", text = "Then I sit with him anyway. The spirits don't give up on us, so I don't see why I should give up on him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    northfold = {
      lines = { { id = "nf_default", text = "Traces of demon summonin', fresh, and a bloodstone amulet drained dry on the ground. The Syndicate hold that manor, and their dealings with dark magic trouble me more than their knives do." } },
      choices = {
        { text = "Why would thieves call demons?", next = "northfold_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    northfold_why = {
      lines = { { id = "nw_default", text = "Desperate people reach for desperate power, and the Syndicate be very desperate to get their old lands back. I will learn their purpose in time, and I will tell you when I do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sigil = {
      lines = { { id = "si_default", text = "The prince of Stromgarde broke the Sigil of Thoradin into eleven pieces and gave them to his defenders. Bring me the pieces and I bind them whole again; Zengu does the rest, and he laughs while he does it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "The Syndicate scouts, before anything with fur. Raptors will bite you, but Syndicate men will tell Stromgarde where Hammerfall sleeps, and that's worse for all of us." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "{pet} be a fine tracker, mon, I can tell by the way it keeps its nose low. Set it on the Syndicate trails first, because a beast smells a man's fear long before he knows he's been found." },
      },
      choices = {
        { text = "Then I'll track the Syndicate for Hammerfall.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll track whatever's worth my arrows.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "The Darkspear sailed with Thrall, and the old ways came back to us the same as to the orcs. When Drum Fel needed a shaman on these walls, I came, because somebody had to tend the spirits where so many of our people suffered." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xshaman = {
      lines = { { id = "xs_default", text = "The raptor be strong and the raptor be cunning, and you ask for both together. Ask for only strength, and you get a beast that runs straight into the spear." } },
      choices = { { text = "I'll remember.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    forsaken = {
      lines = { { id = "fs_default", text = "I don't know, friend, and I won't pretend I do. The spirits don't speak of your kind to me, but they don't turn away from you either, and that be somethin'." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the spirits, and a little of the people they watch. Ask." } },
    background = { { id = "tp_bg", text = "Darkspear, shaman, and keeper of Hammerfall's small fire of hope.", next = "shaman" } },
    advice = { { id = "tp_ad", text = "Never call on a spirit you won't thank afterward. They remember rudeness." } },
    syndicate = { { id = "tp_syn", text = "Thieves who play with demons. Watch them closely.", next = "northfold" } },
    _none = { { id = "tp_none", text = "The spirits say nothin' about that, friend, and I don't make up what they don't say." } },
  },
}

P:NPC {
  key = "korinfel", id = TODO_NPC("Korin Fel"), name = "Korin Fel",
  bible = "bibles/arathi.md", role = "questgiver", tier = "quest",
  communities = { "hammerfall" }, temper = { "watchful" }, values = { "protective", "loyal" },
  notices = { "class" },

  impression = {
    first = "Korin Fel reads auguries for Hammerfall and keeps one secret from her husband, Drum Fel, to keep him alive. She trusted me with it quickly, which tells me how worried she is.",
    third = "{name} met Korin Fel, Drum Fel's wife, who reads auguries and hides a threat from her husband to protect him.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, please. My husband has sharp ears for anything that sounds like a battle he isn't in." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Did the bones lie to me, or did you come back safe?" },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You read signs too, I can tell by how you look at the sky. Then you'll understand why I trust what the bones tell me." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "That the ogres are not the only danger in Stromgarde, and that Drum will not live to see the highlands thrive unless he grows more careful. I have not told him, and I am asking you not to." } },
      choices = {
        { text = "He deserves to hear the truth from you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some truths are kinder left unspoken.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, on the very day the bones turned up a bear's tooth. I do not believe in chance, tauren, and I would not advise you to either." },
        { id = "h_default", key = true,
          text = "I am Korin, wife of Drum Fel. He leads Hammerfall and I read the auguries for it, and lately the auguries say things I cannot tell him." },
        { id = "h_threat", tags = { "news" }, when = { questActive = TODO_QUEST("The Real Threat") },
          text = "Or'Kalar waits in Stromgarde with a trap laid for my husband. Kill him before Drum learns he's there, and bring me his head so I can stop dreaming of it." },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("The Real Threat"), days = 3 } },
          text = "I slept last night, for the first time in weeks. Drum asked why I was smiling at breakfast, and I told him the porridge was good, which it was not." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep your voice down." },
        { id = "h_again2", text = "Ask, but be quick about it, because the drum's already on the wall." },
      },
      choices = {
        { text = "What else have the bones told you, Korin?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Forsaken and orcs fight side by side here. Does that sit well?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Who is Or'Kalar?", next = "orkalar" },
        { text = "Why hide it from your husband?", next = "secret" },
        { text = "How do you read the auguries?", next = "auguries" },
        { text = "I read the bones as well.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I'll keep your secret.", next = "END", fx = { affinity = 2 } },
      },
    },
    orkalar = {
      lines = { { id = "o_default", text = "A Boulderfist ogre who serves Mug'thol in Stromgarde. Drum beat him years ago, and an ogre's grudge only grows fatter with time." } },
      choices = {
        { text = "What kind of trap?", next = "orkalar_trap" },
        { text = "Something else.", next = "BACK" },
      },
    },
    orkalar_trap = {
      lines = { { id = "ot_default", text = "The bones only show me Drum walking into Stromgarde alone and not walking out. I don't need to know the shape of the trap to know I want the trapper dead." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    secret = {
      big = true,
      lines = { { id = "s_default", text = "Because he would rush off the moment he heard the name, and he'd go alone, because that's who he is. I hid the signs of the ogre from him, and I'll go on hiding them until someone else has dealt with it." } },
      choices = {
        { text = "He'd want to know. You should tell him.", next = "secret_tell", fx = { align = { honor = 1 } } },
        { text = "A wise lie keeps him alive. I'll say nothing.", next = "secret_tell", fx = { align = { honor = -1 }, affinity = 2 } },
        { text = "Does he suspect?", next = "secret_suspect" },
      },
    },
    secret_tell = {
      lines = { { id = "st_default", text = "Perhaps one day, once Or'Kalar is only a story. Until then I'll carry it, the way he carries Hammerfall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    secret_suspect = {
      lines = { { id = "ss_default", text = "He knows I worry, and he thinks it's only a wife's worry. He reads the hills and I read the bones, and he's never once asked what the bones say." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Better than I expected, frankly. The orcs remember the internment camps, I remember dying, and Stromgarde gave us both our reasons, so we stand together well enough." } },
      choices = {
        { text = "Then I'll stand with them, whatever we once were.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Alliances last until they don't. I'll watch my back.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    auguries = {
      lines = { { id = "a_default", text = "Bones, smoke, the flight of crows over the Highlands. None of it is certain, but it has been right often enough that I've stopped arguing with it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xshaman = {
      lines = { { id = "xs_default", text = "Then tell me if you see what I see: a dark shape in the ruins of Stromgarde and my husband's banner falling. If you see it too, I am not imagining it." } },
      choices = {
        { text = "I see it. Let's stop it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what the bones tell me, and a little of what Drum doesn't. Ask carefully." } },
    background = { { id = "tp_bg", text = "Drum's wife, and Hammerfall's augur. The second job is harder.", next = "secret" } },
    advice = { { id = "tp_ad", text = "Never tell a proud orc where his old enemy sleeps. Tell me instead." } },
    _none = { { id = "tp_none", text = "I've cast no augury on that, and I'll not waste good bones finding out." } },
  },
}

P:NPC {
  key = "urda", id = TODO_NPC("Urda"), name = "Urda",
  bible = "bibles/arathi.md", role = "flightmaster", tier = "service",
  communities = { "hammerfall" }, temper = { "brisk" }, values = { "dutiful" },
  notices = { "race", "pet" },

  impression = {
    first = "Urda keeps Hammerfall's wind riders and talks about the Highlands' winds like an old enemy she's learned to respect.",
    third = "{name} met Urda, the wind rider master at Hammerfall.",
  },

  greetings = {
    { id = "g_default", text = "Need a wind rider? They're saddled and they're restless, so don't keep them waiting." },
    { id = "g_back", when = { metBefore = true }, text = "You return to Hammerfall. My wind riders know your scent now, and they don't snap at it." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. The wind riders are calmer around your kind, so stand near the young one while I check her harness." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep {pet} downwind of the roost, hunter, because my riders have been eyeing it since you walked up." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "You can try, and I won't stop you, but I've listened to these winds for years and never once heard them say yes. They come off the Thandol Span and the old Stromgarde walls in gusts that knock a rider sideways, so maybe they'll be kinder to someone who asks politely." } },
      choices = {
        { text = "The winds deserve respect. I'll ask, and heed their answer.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The winds can grumble all they like. Your riders fly regardless.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. Then you'll know what I mean when I say the Highland winds have opinions, and today they're not in a forgiving mood." },
        { id = "h_default", key = true,
          text = "Urda, wind rider master of Hammerfall. North to Tarren Mill and the Undercity, or over the mountains to Revantusk on the Hinterlands coast; tell me where and I'll tell you if the wind allows it." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night flights over the Highlands are cold but quiet. The Witherbark can't aim what they can't see." },
      },
      again = {
        { id = "h_again", text = "Anything else? The wind's turning." },
      },
      choices = {
        { text = "Do wind riders mind sharing the sky with my beast?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Shall I speak to the winds before your riders fly?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "What are the winds like here?", next = "winds" },
        { text = "Do the trolls shoot at your riders?", next = "trolls" },
        { text = "Not today.", next = "END" },
      },
    },
    winds = {
      lines = { { id = "w_default", text = "Rough over the northern hills and rougher over Stromgarde's ruins, where the ogres light their fires. The beasts hate the smoke, so I take them wide." } },
      choices = {
        { text = "Why not fly straight?", next = "winds_straight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    winds_straight = {
      lines = { { id = "ws_default", text = "Because straight is how you lose a rider, and I've lost one already this season. Wide and slow gets everyone home." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Wind riders mind nothing but their dinner, hunter, and they'll mind your beast if it looks like dinner. Keep it on the ground and away from the roost, and all will go well." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "So that's {pet}, is it? My wind riders mind nothing but their dinner, and to them your beast looks a lot like dinner, so keep it on the ground and well away from the roost." },
      },
      choices = {
        { text = "I'll keep it well clear. It means no trouble.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your riders can learn to share the sky.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    trolls = {
      lines = { { id = "t_default", text = "When they get the chance, and the Witherbark have good arms. My riders fly high over the south hills and come down hard when they reach the walls." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Winds and routes are what I know, so ask me about those." } },
    background = { { id = "tp_bg", text = "Orgrimmar trained me, and Hammerfall needed someone. Here I am." } },
    advice = { { id = "tp_ad", text = "Hold on tight over the Alterac foothills. The gusts come without warning." } },
    _none = { { id = "tp_none", text = "That's not my business, friend, since my business is wings." } },
  },
}
