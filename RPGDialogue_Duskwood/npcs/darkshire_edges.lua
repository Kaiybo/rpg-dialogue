-- The edges of Darkshire: Blind Mary (the banshee in the farmhouse south of town, who combs her hair for
-- Madame Eva's thread and threw away her looking glass) and Watcher Dodds (the Night Watch post at the
-- crossroads, short of men and long on spiders). Voice: bibles/darkshire_edges.md
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Blind Mary
---------------------------------------------------------------------------
P:NPC {
  key = "blind_mary", id = TODO_NPC("Blind Mary"), name = "Blind Mary",
  bible = "bibles/darkshire_edges.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "grieving", "vain" }, values = { "beauty", "memory" },
  notices = { "class", "race" },

  impression = {
    first = "Blind Mary haunts an old farmhouse in the hills south of Darkshire. She tore out her own eyes so she'd never see what she'd become, and she still begs people not to look at her.",
    third = "{name} met Blind Mary, the banshee of the farmhouse south of Darkshire, who mourns the beauty she lost to the undead.",
  },

  greetings = {
    { id = "g_default", text = "Oh please, don't look at me! I tore out these eyes with my own hands, but I can still feel your gaze!" },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. I know your step now, and you're the only one who comes up the hill without screaming." },
    { id = "g_comb", when = { questActive = TODO_QUEST("Ghost Hair Thread") }, text = "What is this, a comb? Is it truly for me?" },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The night is no darker to me than the day, but I hear more of them moving out there when the sun is gone." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You smell of candles and holy oil. Are you here to put me to rest? Please don't, not yet, I haven't finished remembering." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You're dead too, aren't you? I can hear it in how you breathe, or don't. Does it bother you, what you look like now?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm hideous, hideous! Please, look away! The memory of my beauty makes its loss unbearable, and every visitor reminds me of it." },
        { id = "h_comb_done", when = { questDone = TODO_QUEST("Ghost Hair Thread") },
          text = "The comb glided through my hair as if it weren't the stiff, stringy horror that it is. For a moment I felt like myself again, and then I remembered, and I don't think I'll ever stop remembering." },
        { id = "h_glass", when = { questActive = TODO_QUEST("The Insane Ghoul") },
          text = "The ghoul who took my looking glass lives among the graves of the Tranquil Gardens Cemetery now, I'm told. I hope he looks into it, and I hope it frightens him as much as it frightened me." },
        { id = "h_glass_done", when = { questDone = TODO_QUEST("The Insane Ghoul") },
          text = "You found my looking glass and gave it to the star-gazer. I'm glad it's looking up at something beautiful, since it will never look at me again." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "Another of the dead, walking about as though it were nothing. How can you bear it? How can you bear to be seen?" },
      },
      again = {
        { id = "h_again", text = "Are you still here? Still looking? Ask, then, but face the wall while you do." },
        { id = "h_again2", text = "Speak, if you must. It's been so long since anyone spoke to me kindly." },
      },
      choices = {
        { text = "What happened to you, Mary?", next = "story" },
        { text = "Madame Eva sent me with a comb.", next = "comb", when = { questActive = TODO_QUEST("Ghost Hair Thread") } },
        { text = "Do you still have your looking glass?", next = "glass" },
        { text = "I'm not looking, Mary. I'm listening.", next = "listen" },
        { text = "What do you hear out here?", next = "hear" },
        { text = "I'll leave you in peace.", next = "END" },
      },
    },

    story = {
      lines = { { id = "st_default", text = "I was beautiful once, everyone said so, and I carried a looking glass everywhere so I could be sure of it. Then the dead came out of the woods, and when they were done with me I didn't stay dead, and I became this." } },
      choices = {
        { text = "And your eyes?", next = "st_eyes" },
        { text = "I'm sorry, Mary.", next = "st_eyes", fx = { trait = { kind = 1 } } },
      },
    },
    st_eyes = {
      lines = { { id = "ste_default", text = "I saw myself once, in the glass, and I screamed until the windows cracked. Then I tore out my eyes with my own hands so I would never have to see that face again, and I threw the glass out behind the barn." } },
      choices = {
        { text = "Does it help, not seeing?", next = "st_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    st_help = {
      big = true,
      lines = { { id = "sth_default", text = "No, because I remember, and the memory is worse than any mirror. Some nights I think I should beg one of you to end me properly, and some nights I think I'd rather haunt this house forever than lose what little of me is left." } },
      choices = {
        { text = "You deserve rest. The Light could give it to you.", next = "BACK", reply = "The Light, for something like me? You're kind to say it, but I'm afraid of what it would find, and more afraid it would take my memories with the rest.", fx = { align = { light = 1 } } },
        { text = "Then stay. Your memory is yours to keep.", next = "BACK", reply = "Then I'll keep them, and comb my hair, and remember the girl I was. Only don't look at me as you go, I beg you, not even once.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    comb = {
      lines = { { id = "co_default", text = "A comb? It's lovely, I can feel how smooth the teeth are! Madame Eva wants a thread from my hair, does she? Then let me comb it, and comb it slowly, because nobody has given me anything in years." } },
      choices = {
        { text = "Take as long as you like.", next = "co_mirror", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What does Eva want with your hair?", next = "co_eva" },
      },
    },
    co_mirror = {
      lines = { { id = "com_default", text = "It glides through, as if my hair weren't the stiff, stringy horror that it is. Oh, if only I had a mirror... no, no, I don't mean that, I don't, please don't bring me one." } },
      choices = { { text = "I won't, Mary.", next = "BACK", fx = { affinity = 1 } } },
    },
    co_eva = {
      lines = { { id = "coe_default", text = "A thread, she says, for something she's sewing, and the hair of a ghost holds better than any silk. I didn't ask what she's sewing, and you mustn't tell me, because I think I'd rather not know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "embalmer" } } } },
    },

    glass = {
      lines = { { id = "gl_default", text = "I threw it away after the incident, out behind the barn, and an insane ghoul who used to roam back there picked it up. They say he lives in the Tranquil Gardens Cemetery now, and he carries it everywhere, like I used to." } },
      choices = {
        { text = "The star-gazer in town wants it.", next = "gl_viktori" },
        { text = "Do you want it back?", next = "gl_back" },
      },
    },
    gl_viktori = {
      lines = { { id = "glv_default", text = "To look at the stars with? It was one of my finest treasures, and if it can help somebody see something beautiful, then take it, take it from the ghoul. Just don't tell me what the stars look like, because I can't bear it." } },
      choices = { { text = "I won't describe them.", next = "BACK", fx = { affinity = 1 } } },
    },
    gl_back = {
      lines = { { id = "glb_default", text = "No! What would I do with it, hold it up to these empty holes and pretend? Give it to someone who can see, and let it be useful, since I never will be again." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    listen = {
      lines = { { id = "li_default", text = "You're facing the wall? Really? Oh, that's kind, that's the kindest thing anyone has done for me since I died. Ask me anything, then, and I'll answer while you're looking away." } },
      choices = {
        { text = "Who were you, before?", next = "li_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    li_before = {
      lines = { { id = "lib_default", text = "A farmer's daughter with a pretty face and too much time to look at it. The boys from Darkshire used to walk up this hill on Sundays, and I used to pretend not to notice them, and now nobody walks up at all." } },
      choices = {
        { text = "I walked up.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hear = {
      lines = { { id = "he_default", text = "The ghouls in the cemetery, scratching and muttering, and the worgen howling over toward Brightwood. And something else, lately, heavy and stitched and slow, walking on the road at night, but nobody believes a blind banshee." } },
      choices = {
        { text = "I believe you.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something stitched?", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "This house, this hill, and every sound the dead make at night." } },
    background = { { id = "tp_bg", text = "I was beautiful. That is all I was, and now I'm not even that.", next = "story" } },
    advice = { { id = "tp_ad", text = "Never look into a mirror after dark in Duskwood. You might not like what looks back." } },
    embalmer = { { id = "tp_emb", text = "Madame Eva wants my hair for something. I don't ask what." } },
    _none = { { id = "tp_none", text = "I don't know, I don't know, please stop looking at me." } },
  },
}

---------------------------------------------------------------------------
-- Watcher Dodds
---------------------------------------------------------------------------
P:NPC {
  key = "dodds", id = TODO_NPC("Watcher Dodds"), name = "Watcher Dodds",
  bible = "bibles/darkshire_edges.md", role = "soldier", tier = "quest",
  communities = { "darkshire" }, temper = { "weary", "decent" }, values = { "dutiful", "loyal" },
  notices = { "class", "kit" },

  impression = {
    first = "Watcher Dodds holds the Night Watch camp at the crossroads with too few men, and he's lost some of those to the spiders out west. He apologizes for asking for help and then asks anyway, because he has to.",
    third = "{name} met Watcher Dodds, who keeps the Night Watch's crossroads camp in Duskwood and wants the giant spiders culled.",
  },

  greetings = {
    { id = "g_default", text = "Hail, {class}. Keep your torch high on this road; the woods don't like light, but they respect it." },
    { id = "g_back", when = { metBefore = true }, text = "You made it back. I count every face that comes back down this road, and yours is a welcome one." },
    { id = "g_spiders", when = { questActive = TODO_QUEST("Eight-Legged Menaces") }, text = "The spiders on the western border, the pygmy venom webs. Mind their bite; it softens a man up for the webs." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I'd half put you on the list of the missing. Glad I didn't have to write it in ink." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's chewed half through. Get to Darkshire and have it seen to before you go back out there, because the spiders go for the gaps." },
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Plate, and a proper shield. I wish I had ten of you at this camp instead of the lads I've got." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Watcher Dodds, Night Watch. This camp holds the crossroads so Darkshire can sleep at night, though nobody in Darkshire actually sleeps. Perhaps you've seen those spiders that have taken over the western border?" },
        { id = "h_spiders_done", when = { questDone = TODO_QUEST("Eight-Legged Menaces") },
          text = "You're back, and not much worse for wear, it seems. The Night Watch is grateful, and I promised a reward, so it's yours with my thanks." },
        { id = "h_young", when = { maxLevel = 17 },
          text = "You're young for this road, friend, and I say that because I've buried younger. Stay near the lamps, and don't go west until you're sure of yourself." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! I don't suppose you brought a few more of your cousins? The commander would trade a month's rations for a squad of Ironforge rifles." },
      },
      again = {
        { id = "h_again", text = "What else? I've time; the woods keep me awake regardless." },
        { id = "h_again2", text = "Ask, {class}. A man on watch is glad of talk." },
      },
      choices = {
        { text = "What about the spiders?", next = "spiders" },
        { text = "Why can't the Watch handle them?", next = "manpower" },
        { text = "What's it like, holding this camp?", next = "camp" },
        { text = "What do you think of the commander?", next = "althea" },
        { text = "Stay safe, Dodds.", next = "END" },
      },
    },

    spiders = {
      lines = { { id = "sp_default", text = "Pygmy venom web spiders, a nest of them along the western border, and the eight-legged menaces are too much for my men to handle. Kill fifteen of them and I'll call it a start, though I'd rather call it a finish." } },
      choices = {
        { text = "What happened to your men?", next = "sp_men" },
        { text = "Fifteen spiders, then. Consider it done.", next = "BACK", fx = { standing = { darkshire = 1 } } },
      },
    },
    sp_men = {
      lines = { { id = "spm_default", text = "I've lost a few of them to the spiders, and it isn't a pleasant sight, a man hanging upside down in the webs after the venom's started to soften him up. I wrote to their mothers myself, and I don't want to write any more of those letters." } },
      choices = {
        { text = "I'll make them pay for it.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "That's a hard duty, writing those letters.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },

    manpower = {
      big = true,
      lines = { { id = "ma_default", text = "The commander hasn't enough men to spare so far from Darkshire, and Stormwind sends us letters instead of soldiers. I hate to ask strangers to fight our battles, but I'd hate it more to leave the battles unfought." } },
      choices = {
        { text = "Stormwind owes you better. They should send help.", next = "ma_more", fx = { align = { order = -1 } } },
        { text = "Stormwind has its reasons. Hold the line.", next = "ma_more", fx = { align = { order = 1 } } },
        { text = "How many men do you have?", next = "ma_more" },
      },
    },
    ma_more = {
      lines = { { id = "mam_default", text = "Enough to keep the fire lit and the road watched in shifts, and not one more. If anything big came down the road, we'd hold it long enough to send a runner, and I've made my peace with that." } },
      choices = {
        { text = "Something big?", next = "ma_big" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ma_big = {
      lines = { { id = "mab_default", text = "Talk in town of something stitched together walking the cemetery road at night, though I've not seen it with my own eyes. If I do, you'll hear the town crier before you hear me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    camp = {
      lines = { { id = "ca_default", text = "Cold food, short sleep and long nights, and every sound in the trees might be a worgen or might be the wind. The lads tell jokes to keep awake, and the jokes get worse after midnight." } },
      choices = {
        { text = "Tell me one.", next = "ca_joke" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ca_joke = {
      lines = { { id = "caj_default", text = "How many Night Watchmen does it take to light a lamp in Duskwood? Three: one to light it, one to guard him, and one to write the letter if it goes wrong. You see why they get worse." } },
      choices = {
        { text = "That's grim, Dodds.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    althea = {
      lines = { { id = "al_default", text = "Commander Ebonlocke's the best soldier in Duskwood, and harder on herself than on any of us. Her father's the mayor, and they don't agree on much, so we try to stay out of the way when they're in the same room." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "This road, these woods, and what's moving in both." } },
    background = { { id = "tp_bg", text = "Darkshire born, Night Watch sworn. Never been farther than Lakeshire." } },
    advice = { { id = "tp_ad", text = "Burn the webs before you walk through them. The spiders feel every strand." } },
    night_watch = { { id = "tp_watch", text = "Good men, too few of them, and too far from home." } },
    worgen = { { id = "tp_worgen", text = "They come out of Brightwood, and they don't come out alone." } },
    _none = { { id = "tp_none", text = "Can't say I know that, {class}. Ask in town." } },
  },
}
