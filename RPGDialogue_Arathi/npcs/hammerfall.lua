-- Hammerfall (Horde): Gor'mul, Tor'gan, Korin Fel, Urda. Voice: bibles/arathi.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gormul", id = TODO_NPC("Gor'mul"), name = "Gor'mul",
  bible = "bibles/arathi.md", role = "questgiver", tier = "quest",
  communities = { "hammerfall" }, temper = { "bitter" }, values = { "loyal" },
  prejudice = { race = "Scourge", amount = 12, why = "The Forsaken were Lordaeron's humans, and some of them kept the camps." },
  notices = { "race" },

  impression = {
    first = "Gor'mul was a prisoner in the Hammerfall camp the night Doomhammer died breaking it open, and he never recovered. He talks about that night as if it were yesterday and the years since as if they never happened.",
    third = "{name} met Gor'mul, a despairing orc of Hammerfall who was left behind when the camp was freed and never got over Doomhammer's death.",
  },

  greetings = {
    { id = "g_prej1", when = { prejudiced = true }, text = "A Forsaken. I spent years behind a human fence in this valley, and some of the faces walking around the Undercity now used to stand on the other side of it." },
    { id = "g_prej2", when = { prejudiced = true }, text = "You smell of cellars, dead one. Say what you came to say, and don't come any closer than that post." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You again, dead one. I've stopped looking for a guard's face under yours, which is something, and you can thank your own patience for it." },
    { id = "g_default", text = "What do you want? There is nothing here worth the walk, unless you came for the flies." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still hoping to find something in me worth saving?" },
    { id = "g_better", when = { questDone = TODO_QUEST("Guile of the Raptor") }, text = "Ah, you. Sit, if you like. I find I can stand company again, some days." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Another orc, walking free and proud. Were you in the camps, or were you born after? It shows, either way." },
  },

  start = "hello",
  nodes = {
    prej = {
      lines = { { id = "prej_default", text = "Maybe you did and maybe you didn't, and that's the trouble. The humans who ran the camps died in the plague like everyone else in Lordaeron, and I've never known which of them got up again and joined the Horde." } },
      choices = {
        { text = "The Horde forgave you. You can forgive us.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I owe you nothing for a dead man's sins.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I understand. Look as long as you need to.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "Tell me about the camp.", next = "prej_why" },
        { text = "Something else, Gor'mul.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "Mud, a fence and a ladle of grey porridge, and the worst of it wasn't the guards' sticks, it was the way they talked over us like cattle. Thrall broke the fences, and I'm free, but I still hear those voices when a Forsaken speaks." } },
      choices = {
        { text = "Then let the fences stay broken, in your head as well.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Hold on to it. That anger kept you alive in there.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Gor'mul.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "Hm. You'd make a poor guard; you don't shout. Sit, then, if you want to sit." } },
      choices = {
        { text = "Something else, Gor'mul.", next = "BACK" },
      },
    },
    opn_thrall = {
      lines = {
        { id = "opn_thrall_q", text = "Go on, then, and don't dress it up for an old orc with one bad leg. I've heard enough songs about him at Drum's fire to fill a camp." },
      },
      choices = {
        { text = "He's the best thing that's happened to our people.", next = "opn_thrall_r_trust", fx = { affinity = -1, align = { light = 1 }, opinion = { warchief = "trust" } } },
        { text = "He's a good chieftain. He's no Doomhammer.", next = "opn_thrall_r_lesser", fx = { affinity = 1, align = { light = -1 }, opinion = { warchief = "lesser" } } },
        { text = "He keeps faith with his people. That's all I ask.", next = "opn_thrall_r_respect", fx = { trait = { practical = 1 }, opinion = { warchief = "respect" } } },
        { text = "He was a slave in a camp too. He knows, Gor'mul.", next = "opn_thrall_r_kin", when = { faction = "Horde" }, fx = { affinity = 1, trait = { kind = 1 }, opinion = { warchief = "kin" } } },
        { text = "On second thought, I'll keep it to myself.", next = "BACK" },
      },
    },
    opn_thrall_r = {
      lines = {
        { id = "opn_thrall_r_default", text = "Wise. Words about a warchief have a way of finding their way back to him." },
      },
      choices = {
        { text = "Something else, Gor'mul.", next = "BACK" },
      },
    },
    opn_thrall_r_trust = {
      lines = {
        { id = "opn_thrall_r_trust", text = "The best thing. Doomhammer was the best thing, too, until a knight came out of the dark behind him. I hope your Warchief watches his back." },
      },
      choices = {
        { text = "Something else, Gor'mul.", next = "BACK" },
      },
    },
    opn_thrall_r_lesser = {
      lines = {
        { id = "opn_thrall_r_lesser", text = "No, he isn't. Nobody is, and I'd be a liar to say I'd follow anyone the way I followed him. Thank you for not singing at me." },
      },
      choices = {
        { text = "Something else, Gor'mul.", next = "BACK" },
      },
    },
    opn_thrall_r_respect = {
      lines = {
        { id = "opn_thrall_r_respect", text = "That is all anyone should ask, and more than most chieftains give. Perhaps I'll believe in him a little, then, on the days my leg doesn't ache." },
      },
      choices = {
        { text = "Something else, Gor'mul.", next = "BACK" },
      },
    },
    opn_thrall_r_kin = {
      lines = {
        { id = "opn_thrall_r_kin", text = "He was, they say, in Durnholde. Then he knows the smell. That is worth more to me than any song Drum's fire can sing." },
      },
      choices = {
        { text = "Something else, Gor'mul.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Hate takes strength, and I left mine in these chains. The humans who killed the Warchief prayed to that Light, and now you stand here holding it for the Horde, and I do not know what to feel." } },
      choices = {
        { text = "Then feel hope, Gor'mul. The Light fights for the Horde now.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Feel nothing for it. The Light betrayed you once.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some of them, maybe. I've seen orcs who forgot how to hold an axe, and who sit and wait for a guard to tell them when to eat. The Earth Mother heals, your people say, but I'd like to see her try it on them." } },
      choices = {
        { text = "Bring them home and give them time. They'll heal.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Those who forgot how to fight should learn again, hard.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Something remembers, for the wolves do not howl near the old camp, and I have listened every night for years. A hunter would know if that is grief or only habit, and I would be grateful to hear which." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Something remembers, for the wolves do not howl near the old camp, and I have listened every night for years. Your {pet} is quiet near me too, so perhaps it smells the camp on me and knows to be gentle." },
      },
      choices = {
        { text = "It's grief, and grief can heal. Give it time, Gor'mul.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's only habit. The dead don't stir the living.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Gor'mul.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_default", text = "The ogres on their mound, the Witherbark in the hills and the Syndicate on the roads, and the men of Stromgarde, who would gladly chain us all again. Drum Fel thinks the walls will hold, but walls held this camp too, and they held us in." },
      },
      choices = {
        { text = "Then I'll help hold these walls for the Horde.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Walls are cages. Better to strike before they come.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Tor'gan sends healers and shamans and baubles, and none of them mend what was broken in this camp, so pray if you must, but not for me." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. Doomhammer had little use for spell-throwers, and neither did the guards who kept us here, so I don't know what to make of you, and I'm too tired to try." },
        { id = "h_default", key = true,
          text = "I am Gor'mul. I was chained in this very camp, and I saw the Warchief come for us in his black armor with his hammer raised, and I saw a coward on a horse put a lance through his back. Tor'gan the shaman keeps telling me to hope, so tell me what use hope is after a thing like that." },
        { id = "h_amulet", when = { questActive = TODO_QUEST("Raising Spirits") },
          text = "Tor'gan sent you with some bauble, didn't he? Polished bone will not mend what was broken here." },
        { id = "h_orb", tags = { "news" }, when = { questActive = TODO_QUEST("Guile of the Raptor") },
          text = "More of Tor'gan's pity, carried in your hands. Very well, show me what it is this time, and then leave me be." },
        { id = "h_after", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Guile of the Raptor"), days = 3 } },
          text = "The raptor's spirit still burns in my blood, and I cannot remember the last time I felt anything burn. Tell Tor'gan I'll listen to him, for now, but only for now." },
        { id = "h_later", when = { questDone = TODO_QUEST("Guile of the Raptor") },
          text = "Tor'gan tells me of Orgrimmar and the shaman, and of a warchief who is Durotan's son. Some of it I even believe, and that is more than I could say before you came." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "I smell the green fire on you, {class}, the same that burned in the old Horde's blood. The Warchief broke us free of that, and you walk back into it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You move like the grunt who slipped his chains the night the Warchief came, {class}, and vanished into the dark before the guards ever saw him go." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The Doomhammer fell not far from here, and the beasts in the hills watched it, I think, though nobody asks a raptor what it saw." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid. Your people were hunted by centaur before Thrall found you, I've heard, so you know what it is to be chained to fear." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead thing carrying the Light, like the knights who rode past this camp when I was in chains. I thought I had seen everything there was to see, and I was wrong, which is the first thing to surprise me in years." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask, then, for all the good it will do." },
        { id = "h_again2", text = "Still here? Go on." },
      },
      choices = {
        { text = "Hammerfall bears a warrior's name, Gor'mul. I mean to honor it.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "The spirits haven't abandoned you, Gor'mul. Will you let me ask them?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who still threatens Hammerfall, Gor'mul?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Tell me about that night.", next = "night" },
        { text = "I'm surprised you stayed here.", next = "stayed" },
        { text = "What do you think of Tor'gan?", next = "torgan" },
        { text = "Thrall leads a new Horde now.", next = "thrall" },
        { text = "I was born in the camps too.", next = "camp", when = { origin = "orc_camp_born" } },
        { text = "The dead don't always stay dead, orc.", next = "forsaken", when = { race = "Scourge" } },
        { text = "The Warchief freed you from chains, not from fire.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you wish you had run that night too?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The beasts seem to remember that night, Gor'mul.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "There must be some hope for the orcs still in the camps.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Do you hate the Light for what its knights did, Gor'mul?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "You glare at me as if I'd wronged you, Gor'mul.", next = "prej", when = { prejudiced = true } },
        { text = "Leave him be.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every night, and then I remember the Warchief would have died anyway, and I would only have been somewhere else when it happened. Running saves the one who runs, and I no longer know if that is courage or cowardice." } },
      choices = {
        { text = "Surviving isn't cowardice. It's how we fight on.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Standing your ground is the only honor left.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "He freed us from both, and you would know it if you had seen orcs in the camps, sick for the demon blood they had lost. Use your shadows on the Witherbark if you must, but do not speak to me of it, for I have nightmares enough." } },
      choices = {
        { text = "I'll keep it from you. You've suffered enough.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "That fire was strength, and the Horde threw it away.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
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
      lines = { { id = "sn_default", text = "They named it for him, yes, and Drum Fel builds walls on it. Drum says the word future so easily, as if the cages had never stood here." } },
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
      lines = { { id = "ts_default", text = "Our shaman were warlocks when I was taken, and the old ways were a story the elders told. If the spirits really answer again, then the world changed while I wasn't looking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    thrall = {
      lines = { { id = "th_default", text = "So they tell me, a young one raised by humans who freed the camps and leads us across the sea. I would like to believe in him, but I believed in Doomhammer, and I saw what believing is worth." } },
      choices = {
        { text = "Let me tell you what I think of Thrall.", next = "opn_thrall" },
        { text = "Something else.", next = "BACK" },
      },
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
      lines = { { id = "c_default", text = "Then you know the smell of it, the mud and the rusted iron and the slop bucket nobody emptied. Do not let anyone tell you that you should forget it, but do not let it hold you the way it held me." } },
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
    internment = { { id = "tp_internment", text = "I was in this camp, chained and beaten, the night Thrall and Doomhammer came. Doomhammer died here, and I watched him fall, and I've never stopped seeing it." } },
    thrall = { { id = "tp_thrall", text = "Thrall was a slave like me, and he became the Warchief, and he came back for us. I'd die for him, if he asked, and I'd die gladly." } },
    second_war = { { id = "tp_second_war", text = "The Second War was glory and then it was chains, and I don't remember which came first anymore. It doesn't matter, I suppose." } },
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
    { id = "g_away", when = { away = 14 }, text = "The spirits say you been gone {away}, friend, and they be glad to see you walk back in. So be Tor'gan." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You carry more strength now than when we last talk, and the spirits see it plain. Walk careful with it, mon." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody in Hammerfall carry anger for you now, and the spirits feel it like a cold wind. Maybe you make peace before it grow." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! The elements walk with you, I can feel it from here, and they be glad to find another of us in this hard place." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear blood, like mine. The Witherbark down the hill be no cousins of ours, so don't you go feelin' sorry for them." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Both, I think, the same way Gor'mul be both a hero and a broken man. The spirits don't like the dead walkin', but they like a fire kept burnin' in the dark, and you be doin' that, mon, so maybe they forgive you the rest." } },
      choices = {
        { text = "Then I'll keep the fire burning, for Gor'mul too.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I don't need the spirits' forgiveness, Tor'gan.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The spirits care about everything, mon, though they don't always say so. An orc who fight for Hammerfall heal faster than one who fight because he don't know how to stop, and Tor'gan see it in the wounds every week." } },
      choices = {
        { text = "I fight for those behind me. That's reason enough.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I fight because I'm good at it. The spirits can watch.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tor'gan.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "This ground held a prison, and before that a battlefield, and the stones remember every chain. I be coaxing them back slow, but the Witherbark be singing to their own dark loa just over the hills." } },
      choices = {
        { text = "Then we'll heal this ground together, Tor'gan.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let the stones remember. Pain is a good teacher.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That you carry a heavy blade and a light step, and that you been in places the living don't usually come back from. The spirits don't judge that, mon, they only ask that the dark places you walk in don't follow you home, because a sneak with a heavy heart be a sad thing to watch." } },
      choices = {
        { text = "My shadows stay where I leave them, Tor'gan.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dark's where I work. Let it follow.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tor'gan.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Maybe they could, if he let you near, but Gor'mul's wound be in the spirit, not the flesh, and he cursed the last healer who touched his shoulder. Sit with him a while if you like, and talk about the Warchief and the new Horde, and don't try to fix nothin', because that be the hardest kind of medicine." } },
      choices = {
        { text = "I'll sit with him and listen. That's healing too.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If he won't be healed, leave him to his despair.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tor'gan.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid of the Earth Mother come to Hammerfall! The spirits here be thin and tired, friend, but they be glad of anyone who listens to them." },
        { id = "h_default", key = true,
          text = "I be Tor'gan, shaman of Hammerfall. The Warchief gave our people back their hope, and here in the ruins of the old prison I tend what's left of it like a small fire in the wind, for old Gor'mul most of all, who never left this camp." },
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
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "You carry somethin' the spirits don't like, {class}, and they be whisperin' about it in my ear like gossips. Sit down, and let them have a good look." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "Mage fire be hot and quick, {class}, and Tor'gan's fire be slow and patient. Both burn, mon, they just burn different things." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon. The spirits like a warrior who know why he fight, and they don't much like one who only know how." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You walk so soft the spirits almost miss you, {class}, and that be a rare thing. Come sit, and don't worry, Tor'gan don't tell nobody what the spirits whisper about a quiet one." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, come to Hammerfall! You speak to the Light or the loa or the shadow, and Tor'gan speak to the spirits, but we both be in the business of mendin' what's broken." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken, mon. The spirits whisper about your kind, and they can't decide whether you be a wonder or a wound, so maybe you tell me which." },
      },
      again = {
        { id = "h_again", text = "What else be on your mind, friend?" },
        { id = "h_again2", text = "Ask. The spirits got patience, and so do I." },
      },
      choices = {
        { text = "Why are the spirits here so tired, Tor'gan?", next = "druid_q", when = { class = "DRUID" } },
        { text = "The Highlands are wide. What should a hunter track first?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Why help Gor'mul?", next = "gormul" },
        { text = "Have the spirits felt anything foul nearby, Tor'gan?", next = "northfold" },
        { text = "I hear you rebuilt a sigil for Zengu.", next = "sigil", when = { heardLine = "zengu.st_default" } },
        { text = "I'd not expected a troll shaman at an orc fort.", next = "shaman" },
        { text = "Teach me something of the raptor spirits.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "Can a Forsaken be healed by spirits?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I doubt the spirits can forgive a warlock, Tor'gan.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What does your slow fire burn, Tor'gan?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the spirits care why a warrior fights, Tor'gan?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do the spirits whisper about me, Tor'gan?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My prayers might help Gor'mul, Tor'gan.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the spirits think I'm a wonder or a wound, Tor'gan?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll help Gor'mul.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Despair, mostly, and it take a long time, because despair be wet wood. The orcs here carry Doomhammer's death like a stone, and a quick fire would only scorch them, so I sit with them and wait for the spark to catch." } },
      choices = {
        { text = "Patience heals. I'll remember that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some wounds need a hot iron, not patience.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The spirits forgave the whole Horde for the demon blood, so they can forgive you, but forgivin' don't mean forgettin'. Every time you call on fel they flinch, and one day you might want their help and find them lookin' the other way." } },
      choices = {
        { text = "Then I'll call on it as little as I can.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I've never needed the spirits. I won't start now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tor'gan.", next = "BACK" },
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
        { text = "Thieves calling demons makes little sense.", next = "northfold_why" },
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
        { id = "xhhunt_default", text = "The Syndicate scouts, before anything with fur. Raptors will bite you, but Syndicate men will sell word of where Hammerfall sleeps to whoever pays, and that's worse for all of us." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "The Syndicate scouts, before anything with fur, because they sell word of where Hammerfall sleeps to whoever pays. {pet} be a fine tracker, mon, so set it on the Syndicate trails first." },
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
      lines = { { id = "fs_default", text = "I don't know, friend, and I'd be a fool to guess. The spirits don't speak of your kind to me, but they don't turn away from you either, and that be somethin'." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the spirits, and a little of the people they watch. Ask." } },
    background = { { id = "tp_bg", text = "Darkspear, shaman, and keeper of Hammerfall's small fire of hope.", next = "shaman" } },
    advice = { { id = "tp_ad", text = "Never call on a spirit you won't thank afterward. They remember rudeness." } },
    syndicate = { { id = "tp_syn", text = "Thieves who play with demons. Watch them closely.", next = "northfold" } },
    the_elements = { { id = "tp_the_elements", text = "The spirits of Arathi are angry, mon, angry at the ogres and the Syndicate and the bad magic in the ground. I listen to them, and I try to calm them, and sometimes they listen back." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear are my people, and Vol'jin is my chief, and I came here to heal the orcs who need it. It's good work, mon, even if they don't always want to be healed." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a shaman, a true one, and the spirits speak to him like they speak to me. That's why I trust him, mon." } },
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
    { id = "g_default", text = "Quietly, please. My husband has sharp ears for anything that sounds like a battle he isn't in, as every orc of his blood does." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Did the bones lie to me, or did you come back safe?" },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You read signs too, I can tell by how you look at the sky. Then you'll understand why I trust what the bones tell me." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Nothing, and that is what frightens me, since the bones speak of every warrior who walks into Hammerfall. Perhaps the dead are outside their sight, or perhaps the Light hides you from them, and I cannot decide which I would rather believe." } },
      choices = {
        { text = "The Light guides my path. I trust where it leads.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then my fate is my own to make, Korin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not a beast's, and not a man's, but something between, moving in the dark around my husband's banner. I would not ask a grunt to look, for he would tell Drum Fel, but a hunter keeps what he finds until he is ready to speak." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not a beast's, and not a man's, but something between, moving in the dark around my husband's banner. {pet} watches the door the way my stones watch the night, so keep it near you in Stromgarde, and tell only me what you find." },
      },
      choices = {
        { text = "Drum Fel should know. Secrets between mates protect no one.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep your secret. I'll watch, and tell only you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Korin.", next = "BACK" },
      },
    },
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
          text = "I am Korin, wife of Drum Fel. He leads Hammerfall and I read the auguries for it, as the old clan seers did before the demon blood, and lately the auguries say things I cannot tell him, of an ogre called Or'Kalar and a trap laid for my husband." },
        { id = "h_threat", tags = { "news" }, when = { questActive = TODO_QUEST("The Real Threat") },
          text = "Or'Kalar waits in Stromgarde with a trap laid for my husband. Kill him before Drum learns he's there, and bring me his head so I can stop dreaming of it." },
        { id = "h_done", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("The Real Threat"), days = 3 } },
          text = "I slept last night, for the first time in weeks. Drum asked why I was smiling at breakfast, and I told him the porridge was good, which it was not." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "The bones went black when you walked in, {class}, and they only do that for death or demons. I hope for your sake it is demons." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage reads the world in lines and numbers, {class}, and I read it in smoke and bone. I wonder sometimes which of us sees further." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Keep your voice down, {class}. The auguries speak of a knife in the dark, and I would sooner it were yours than the Witherbark's." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The stones spoke of tracks in the ruins of Stromgarde last night, and I wonder now if they meant yours." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. The auguries never spoke of you, which troubles me more than anything they did say, because I thought I had seen every shape the future could take." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep your voice down." },
        { id = "h_again2", text = "Ask, but be quick about it, because the drum's already on the wall." },
      },
      choices = {
        { text = "What else have the bones told you, Korin?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Forsaken and orcs fighting side by side must sit poorly with some.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Who is Or'Kalar?", next = "orkalar" },
        { text = "Why hide it from your husband?", next = "secret" },
        { text = "Reading auguries seems an uncertain art.", next = "auguries" },
        { text = "I read the bones as well.", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "What do your bones say about demons, Korin?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Your auguries must show you the arcane at times.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What do the auguries say about a knife in the dark?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What tracks did your stones see in Stromgarde, Korin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do your auguries say about a paladin's fate, Korin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll keep your secret.", next = "END", fx = { affinity = 2 } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That danger is gathering around my husband, and that he will not see it coming, for Drum Fel looks only at the road ahead. If I tell him, he will ride out to meet it with every grunt he has, so I watch the hills for him, and now perhaps you will too." } },
      choices = {
        { text = "Keeping it from him is right. He'd only charge in.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "He deserves to know. Secrets like that are wrong.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They show it as a cold light, like frost on the bones, and it always comes before a change. The frost was thick on my stones the night you arrived, so whatever you do here, I think Hammerfall will feel it." } },
      choices = {
        { text = "Then I'll change things for the better.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better or worse doesn't concern me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Korin.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That they keep their bargains to the letter and never to the spirit, and the orcs learned that at a terrible price. Read your own contracts carefully, {class}, for there is always a line written smaller than the rest." } },
      choices = {
        { text = "I read every line. I won't be fooled.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bargains are made to be broken, by either side.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orkalar = {
      lines = { { id = "o_default", text = "A Boulderfist ogre who serves Mug'thol, their chieftain in Stromgarde. Drum beat him years ago, and an ogre's grudge only grows fatter with time." } },
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
        { text = "He must suspect something.", next = "secret_suspect" },
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
      lines = { { id = "xhwar_default", text = "Better than I expected, frankly. The orcs remember the camps and the Forsaken remember dying, and Stromgarde gave both of them reasons to fight, so they stand together well enough." } },
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
    thrall = { { id = "tp_thrall", text = "The Warchief keeps the Horde together with hope, and some days I think that hope is all we have. Drum believes in it, and I pray he's right." } },
    the_elements = { { id = "tp_the_elements", text = "I read the auguries in the bones and the smoke, and they tell me things I don't want to hear. The spirits are troubled in Arathi, and so am I." } },
    internment = { { id = "tp_internment", text = "I was young in the camps, and I remember the hunger more than the chains. Drum remembers the chains, and that is the difference between us." } },
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
    { id = "g_default", text = "Need a wind rider, {class}? They're saddled and restless, so don't keep them waiting, or one of them will start chewing your pack." },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I think they smell the Light on you, the way they smell clean air before a storm, and they like it better than the smell of the grave. The Highlands' winds respect nothing, but my beasts respect you, and that counts for something here." } },
      choices = {
        { text = "Then I'll be worthy of their trust, Urda.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Beasts trust anything that feeds them. I won't read into it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They're fierce beasts, and they'd fight if we asked, but they're also the only way word reaches Hammerfall in time. I'd rather they carried messages than died in a Stromgarde volley, and they agree with me." } },
      choices = {
        { text = "Keep them on messages. They're worth more alive.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A Horde beast fights for the Horde. Ride them in.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Thrown, no, but I've watched a grunt in full plate try to fight the wind with his shoulders and lose, and the beast had to dive halfway to the Witherbark camps to catch him. He walked back to Hammerfall, and he's flown with his helmet off ever since." } },
      choices = {
        { text = "Then I'll follow your rules in the air, Urda.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wind or no wind, I'll ride as I see fit.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Urda.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They throw spears and curses both, and I'm not sure which I hate more, because a spear only misses but a curse leaves the wind rider sick for days. Their witch doctors work from the hills around their village, if you've a mind to answer them." } },
      choices = {
        { text = "I'll pay those witch doctors a visit, by Drum Fel's leave.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll burn their camp tonight, orders or no.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. My riders never used to pray before a flight over the Highlands, but some of them have started, and I've stopped laughing at them." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Wind riders hate the smell of demons, so send yours away before you mount, or you'll be flying sideways the whole way to Tarren Mill." },
        { id = "h_default", key = true,
          text = "I am Urda, wind rider master of Hammerfall. North to Tarren Mill and the Undercity, or over the mountains to Revantusk on the Hinterlands coast; tell me where and I'll tell you if the wind allows it." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night flights over the Highlands are cold but quiet. The Witherbark can't aim what they can't see." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage who flies, {class}? Good, for your teleports don't reach the Hinterlands, and my wind riders do." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Sneak up on a wind rider and you'll lose a hand, {class}. They smell fear and mischief equally well, and you've a whiff of both." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Climb on with your armour if you must, but the winds off Thoradin's Wall don't care how brave you are, and they've tipped heavier riders than you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A tauren druid. You could fly yourself if you wanted, I've heard, but I'll take your coin all the same." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. The wind riders shy away from most of your people, but they let you near, and I've learned to trust their noses more than my own eyes." },
      },
      again = {
        { id = "h_again", text = "Anything else? The wind's turning." },
      },
      choices = {
        { text = "Do wind riders mind sharing the sky with my beast?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Shall I speak to the winds before your riders fly?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do the Witherbark do when your riders pass overhead?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "The winds look rough up here.", next = "winds" },
        { text = "I'd guess the trolls shoot at your riders.", next = "trolls" },
        { text = "Do the Highlands' winds trouble your beasts?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Could I fly out without the guards knowing?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I'd wager a wind rider has thrown a warrior or two, Urda.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should the wind riders be ridden into battle?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Why would the wind riders trust a paladin over other Forsaken?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "You can fly out with every grunt in Hammerfall waving, or not at all, for my beasts don't leave without me knowing. Ask Gorkas, the wind rider master at Revantusk, if you like, and he'll tell you the same, between fish." } },
      choices = {
        { text = "Then I'll wave on the way out. Rules keep the beasts safe.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules are for those who get caught.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Urda.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They come off Thoradin's Wall cold and twisting, and they've thrown more than one rider into the hills. I've learned to read them like an old enemy, and I'd trust a gust over a spell, for the wind at least warns you before it kills you." } },
      choices = {
        { text = "Respect the wind, and it respects you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The wind's a nuisance. A good spell beats it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
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
    background = { { id = "tp_bg", text = "Orgrimmar trained me, and Hammerfall needed someone, and an orc goes where the Horde needs her. Here I am." } },
    advice = { { id = "tp_ad", text = "Hold on tight over the Alterac foothills. The gusts come without warning." } },
    thrall = { { id = "tp_thrall", text = "The Warchief rode a wind rider once, they say, and he didn't fall off. I've taught a dozen grunts this season who can't say the same." } },
    the_elements = { { id = "tp_the_elements", text = "The winds of the Highlands are the fiercest I've ever flown, and they respect nothing but courage. I've learned to respect them back." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken fly bats from Tarren Mill, and I've raced them once or twice. My wind riders win, always, but the bats are faster on a turn." } },
    _none = { { id = "tp_none", text = "That's not my business, friend, since my business is wings and the Horde's letters." } },
  },
}
