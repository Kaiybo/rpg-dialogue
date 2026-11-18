-- The War Quarter's trainers and the city's priests: Angela Curthas, Christoph Walker and Baltus Fowler for warriors;
-- Aelthalyste, Father Lazarus and Father Lankester for priests. Voices: bibles/<key>.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Aelthalyste: the priestess who teaches the Forsaken that the Light still answers, and what else does.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_aelthalyste", id = TODO_NPC("Aelthalyste"), name = "Aelthalyste", title = "Priest Trainer",
  bible = "bibles/uc_aelthalyste.md", role = "priest", tier = "quest",
  communities = { "undercity" }, temper = { "calm", "grim" }, values = { "pious", "practical" },
  notices = { "class", "light", "origin" },
  impression = {
    first = "Aelthalyste teaches the Forsaken's priests that the Light still answers the dead, and that it isn't the only thing that answers. She spoke of faith like a widow speaks of a husband who wronged her and whom she still loves.",
    third = "{name} met Aelthalyste, who trains the Forsaken's priests in both the Light and the shadow.",
  },

  greetings = {
    { id = "g_default", text = "Be at peace while you're here. It's in short supply in this city, so I keep a little of it by me." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the candles. Most people who do have something heavier on them than they let on." },
    { id = "g_sister", when = { class = "PRIEST", gender = "female", race = "Scourge" }, text = "Sister. Come in, and tell me whether the Light still finds you, out there in the dark." },
    { id = "g_brother", when = { class = "PRIEST", gender = "male", race = "Scourge" }, text = "Brother. Come in, and tell me whether the Light still finds you, out there in the dark." },
  },

  notice = {
    { id = "n_living_priest", cat = "class", when = { class = "PRIEST", race = "Troll" },
      text = "A troll who prays. Your loa and my Light make strange neighbours, but you'll find I'm a quiet one." },
    { id = "n_chapel", cat = "origin", when = { origin = "forsaken_chapel_priest" },
      text = "You hold your hands the way they taught us in the chapels. Some habits outlive the heart." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Aelthalyste, and I teach the priests of the Forsaken. The Light abandoned us to the plague, many say, and yet when I call it, it still comes, and I've spent my second life trying to understand why." },
        { id = "h_notpriest", when = { ["not"] = { class = "PRIEST" } }, text = "You're no priest, but you're welcome to sit. The dead come here to remember they were people once, and the living sometimes come to see whether we were." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "A paladin among the Forsaken. The Light keeps stranger company than the Church ever let it, and you're the proof." },
      },
      again = {
        { id = "h_again", text = "Ask what you came to ask. There's no shame here that hasn't already been confessed by someone worse." },
        { id = "h_again2", text = "Something more? The candles have plenty of wax left." },
        { id = "h_again3", when = { class = "PRIEST" }, text = "Go on, priest. We've time, and little else." },
      },
      choices = {
        { text = "Why would the Light answer the dead?", next = "light" },
        { text = "I'd guess you teach shadow as well.", next = "shadow" },
        { text = "What do you make of the Scarlet Crusade?", next = "scarlets" },
        { text = "I served in a chapel, before.", next = "chapel", when = { origin = "forsaken_chapel_priest" } },
        { text = "Does my faith still matter here?", next = "living", when = { class = "PRIEST", race = "Troll" } },
        { text = "I'm ready to learn.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "I stopped waiting for the Light, Aelthalyste. The shadow answered instead.", next = "xorig_shadow", when = { origin = "forsaken_shadow_acolyte" } },
        { text = "Peace to you.", next = "END" },
      },
    },
    xorig_shadow = {
      lines = {
        { id = "xsh_default", text = "Many of my students say the same, and they say it as though it were a victory. The shadow answers, yes, and it never asks what you deserve, which is exactly why you must ask yourself. Do you still call on the Light at all?" },
      },
      choices = {
        { text = "No. It left us, and I won't beg it to return.", next = "BACK", reply = "Then you'll make a hard priest, and perhaps a strong one, but anger runs out sooner than you'd think. Come back when it does.", fx = { align = { light = -1 } } },
        { text = "Sometimes, when I'm too tired to be angry with it.", next = "BACK", reply = "That's the most honest answer I've heard this year. Keep calling, tired or not, and see what answers.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Why do you teach both, Aelthalyste?", next = "shadow" },
      },
    },

    light = {
      lines = { { id = "li_default", text = "Perhaps it answers will, not worth, and we have more will than most, since we've already been through the worst. Or perhaps it never cared who called, and only the Church cared, and the Church is ash now." } },
      choices = {
        { text = "Which do you believe?", next = "light_believe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_believe = {
      lines = { { id = "lb_default", text = "On good nights, I believe it forgives us. On the other nights I believe it's a fire, and fire doesn't forgive, it simply burns for whoever feeds it." } },
      choices = {
        { text = "And which is tonight?", next = "light_tonight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_tonight = {
      big = true,
      lines = {
        { id = "lt_default", text = "Tonight it's a fire, and I'm content with that, because a fire can still keep people warm. I've stopped needing the Light to love me, and I find I pray better for it." },
        { id = "lt_paladin", when = { class = "PALADIN" }, text = "Tonight it's a fire, and you carry it on your shield, so tell me, does it feel like love to you, or only like heat? I've stopped needing it to love me, and I find I pray better for it." },
      },
      choices = {
        { text = "The Light is mercy, whatever the Church made of it.", next = "BACK", reply = "Mercy, yes, and I'm glad someone still believes the Church didn't own it. Keep that belief warm.", fx = { align = { light = 1 } } },
        { text = "It's a tool, and tools don't care who holds them.", next = "BACK", reply = "Tools don't, but the hands do, and I'd rather mine were careful ones. Hold it as you like.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shadow = {
      lines = { { id = "sh_default", text = "Of course. The shadow is the other side of the same coin, and our priests learn both, because the Scourge doesn't wait for us to settle our theology. The Devouring Plague we teach is the Lich King's own sickness turned back against his servants." } },
      choices = {
        { text = "I'd have thought using the plague would trouble you.", next = "shadow_plague" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadow_plague = {
      big = true,
      lines = { { id = "sp_default", text = "It troubles me every time, and I teach it anyway. It was done to us first, and I see a kind of justice in handing it back to the ones who spread it, though I'd rather not look at that justice too closely." } },
      choices = {
        { text = "They earned it. Give it back twice over.", next = "BACK", reply = "They did, and that is why I teach it. Only don't learn to like it, or you'll become what they fear.", fx = { align = { honor = -1 } } },
        { text = "A weapon like that should stay a last resort.", next = "BACK", reply = "It should, and it is, in my teaching at least. Keep it at the bottom of the bag.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    scarlets = {
      lines = { { id = "sc_default", text = "They are what I would have become, if the plague had passed me by. I see their priests at the Monastery shouting the same prayers I once said, and they'd burn me for saying them now." } },
      choices = {
        { text = "Do you pity them?", next = "scarlets_pity" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scarlets_pity = {
      lines = { { id = "sp2_default", text = "I pity the frightened ones, the farmers they've armed and told to hate. The ones in red at the top, who know exactly what they're doing, I leave to the Deathstalkers, and I don't pray for them." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Peace to you, Aelthalyste.", next = "END" },
      },
    },

    chapel = {
      lines = { { id = "ch_default", text = "Then you remember the bells at evening, and the smell of wax and wet wool. I won't ask which chapel, since some of them are Scarlet now, and some of them are only ash, and neither answer is worth saying aloud." } },
      choices = {
        { text = "I still say the old prayers.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "I've left those prayers behind.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    living = {
      lines = { { id = "lv_default", text = "Faith matters wherever it's carried, and you carry yours a long way from the jungle to come down here. The Dark Lady's people need healers more than they'll ever admit, and they'll accept one with tusks if it keeps them standing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I lit candles in a chapel once, and now I light them here. The walls are different and the prayers are harder, but the candles are the same." } },
    advice = { { id = "tp_ad", text = "Pray even when you don't believe. The Light doesn't seem to mind, and neither will you, in time." } },
    _none = { { id = "tp_none", text = "I don't know, child. I only know what comes when I call it." } },
  },
}

---------------------------------------------------------------------------
-- Father Lazarus: priest trainer, wry about his name.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_lazarus", id = TODO_NPC("Father Lazarus"), name = "Father Lazarus", title = "Priest Trainer",
  bible = "bibles/uc_lazarus.md", role = "priest", tier = "service",
  communities = { "undercity" }, temper = { "dry", "warm" }, values = { "pious" },
  notices = { "class", "race" },
  impression = {
    first = "Father Lazarus trains priests in the Undercity and has heard every joke about his name, mostly from himself. He wears his old Church collar under his robe, frayed through, and keeps a little box for the bits his congregation drops.",
    third = "{name} met Father Lazarus, a priest trainer of the Undercity with a dry joke about his name.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in. I'd offer you a seat, but the last one fell apart, rather like the congregation." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you're back. Good; I'd hoped I hadn't scared you off, though the dead do that without trying." },
    { id = "g_ghost", when = { resSick = true }, text = "Just back from the spirit healer, are you? Welcome to the club, child; we meet most evenings, and nobody stays dead for long." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A fellow priest. Tell me you've found somewhere above ground where people still listen to us." },
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "One of the risen, like me. Tell me, did you keep your old name, or did you have the sense to pick a less ironic one?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Father Lazarus, and yes, I know. My mother named me Lazarus long before the plague, and you'd think I'd have taken the hint and stayed buried." },
        { id = "h_living", when = { race = { "Orc", "Tauren", "Troll" } }, text = "One of the Warchief's people, down in our crypts. You're welcome here, though I'm afraid the hymns are rather mournful for living ears." },
      },
      again = {
        { id = "h_again", text = "Another question? Ask, and I'll try to answer before I lose another finger." },
        { id = "h_again2", text = "Go on, child. I've nothing but time, and a little less of me than yesterday." },
      },
      choices = {
        { text = "Do you still believe, Father?", next = "believe" },
        { text = "Do you keep anything from your old church, Father?", next = "collar" },
        { text = "What's in that little box by the altar?", next = "box" },
        { text = "How do you get on with Father Lankester?", next = "lankester" },
        { text = "I'm a warlock, Father. Am I still welcome?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Train me, Father.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Goodbye, Father.", next = "END" },
      },
    },
    believe = {
      lines = { { id = "be_default", text = "I believe in what I can still do, which is mend the hurt and see off the Scourge. Whether that's faith or stubbornness, I've stopped trying to tell the two apart." } },
      choices = {
        { text = "Faith is the stubbornness that matters.", next = "BACK", reply = "Then you're a better priest than I am, because I've never managed to tell them apart. Bless you for it.", fx = { align = { light = 1 } } },
        { text = "Stubbornness, Father. Faith had its chance.", next = "BACK", reply = "Stubbornness has kept me standing longer than faith ever did. I'll take your word, and keep laughing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    collar = {
      lines = { { id = "co_default", text = "From a parish church in the capital, the one with the green door, though the door's gone now. I wear it under the robe, where the Dark Lady's people won't see it and the Light, perhaps, still can." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    box = {
      lines = { { id = "bx_default", text = "The lost and found, child, and I'm afraid I mean that in the plainest sense. Fingers, teeth, the odd ear, and once a whole foot, which its owner was very glad to see again, though I never did learn how he'd walked in without it." } },
      choices = {
        { text = "That's horrible, Father.", next = "box_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    box_grim = {
      lines = { { id = "bg_default", text = "Is it? I think it's rather hopeful, because they come back for the pieces, and you don't do that unless you mean to carry on. Tell me, since we're on it, what do you hold on to when things go badly?" } },
      choices = {
        { text = "My faith. It's never failed me yet.", next = "hold_faith", fx = { trait = { pious = 1 }, affinity = 1 } },
        { text = "The people who travel with me.", next = "hold_friends", fx = { trait = { kind = 1 } } },
        { text = "A good joke, usually at my own expense.", next = "hold_joke", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "Nothing. I just keep walking.", next = "hold_nothing", fx = { trait = { stern = 1 } } },
      },
    },
    hold_faith = {
      lines = { { id = "hf_default", text = "Then hold it with both hands, and if it slips, come and find me. I've dropped mine a few times since the plague, and it was always under the nearest pew." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hold_friends = {
      lines = { { id = "hr_default", text = "That's the best answer anyone's given me this year, and I hear a great many. A friend will pick up your fingers for you, and no prayer I know of has ever done that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hold_joke = {
      lines = { { id = "hj_default", text = "Ha! A kindred spirit, and I'd say a lost soul, but that's my line. Lankester would tell us both that every joke is a crack in the wall, and he'd be right, and I'd still do it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hold_nothing = {
      lines = { { id = "hn_default", text = "Walking is something, child, and more than many manage. Only promise me you'll stop by here if you ever find you can't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    lankester = {
      lines = { { id = "lk_default", text = "Very well, mostly because he believes enough for the two of us, and I laugh enough for the two of us, so between us we make one tolerable priest. He's been writing the same sermon for years, and I've promised to read it when he's done, which I suspect will be never." } },
      choices = {
        { text = "He's right. Priests should be serious.", next = "BACK", reply = "He'd agree with you, and then he'd write you into his sermon. I'll be serious enough on my deathbed, the second one.", fx = { align = { order = 1 } } },
        { text = "Keep laughing, Father. This city needs it.", next = "BACK", reply = "I shall, and I'll tell Lankester you said so. He'll hate it, which is half the joy.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock = {
      lines = { { id = "wl_default", text = "You're welcome to sit, so long as whatever follows you about waits by the door. I don't approve of your trade, but I'm hardly in a position to lecture anyone about rising from places they shouldn't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm afraid I'd only be guessing, and I gave up guessing about the same time I gave up breathing." } },
  },
}

---------------------------------------------------------------------------
-- Father Lankester: priest trainer, stern and sermonising.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_lankester", id = TODO_NPC("Father Lankester"), name = "Father Lankester", title = "Priest Trainer",
  bible = "bibles/uc_lankester.md", role = "priest", tier = "service",
  communities = { "undercity" }, temper = { "stern", "proud" }, values = { "pious", "loyal" },
  notices = { "class" },
  impression = {
    first = "Father Lankester preaches to the Forsaken as if he were still in a pulpit and the plague had only interrupted his sermon. He is still writing that sermon, he corrects your posture before your soul, and he is certain the Light chose the Dark Lady's people, and certain of very little else.",
    third = "{name} met Father Lankester, a stern priest trainer of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Stand straight. The Light is watching, and it is not impressed by slouching." },
    { id = "g_back", when = { metBefore = true }, text = "You return, good. Constancy is the beginning of virtue." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "You come at the hour of evening prayer. Consider that no accident, and lower your voice accordingly." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Keep your hands where I can see them, rogue. This is a place of prayer, not a pocket to be picked." },
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "I can smell the brimstone on you, warlock, and so, I promise you, can the Light. Keep your little familiar outside my chapel." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Father Lankester. I teach the Light to the Forsaken who are worthy of it, and I say to anyone who'll listen that we were not cast out of it, but tested." },
        { id = "h_scourge", when = { race = "Scourge", class = "PRIEST" }, text = "A priest of our people. Hold your head up; the Scarlets call us abominations, but the Light still answers us, and it does not answer them any louder." },
      },
      again = {
        { id = "h_again", text = "Speak. I have a sermon to finish, but it will keep." },
        { id = "h_again2", text = "Consider your next question carefully, child. Idle words are a small sin, but they add up." },
      },
      choices = {
        { text = "The plague must have been a hard test.", next = "tested" },
        { text = "What do you think of the Dark Lady?", next = "lady" },
        { text = "What is this sermon you're always finishing?", next = "sermon" },
        { text = "Father Lazarus seems to find it all funnier than you.", next = "lazarus" },
        { text = "My spirits answer me as surely as your Light, Father.", next = "loa", when = { race = "Troll" } },
        { text = "Train me, Father.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "I was a squire, Father. I died before I took my oath.", next = "xorig_squire", when = { origin = "forsaken_unsworn_squire" } },
        { text = "Good day, Father.", next = "END" },
      },
    },
    xorig_squire = {
      lines = {
        { id = "xsq_default", text = "And you've sworn it since, I suppose, and the Light burns you every time. Good. A test that doesn't hurt teaches nothing, and the Light is testing you harder than it ever tested the knights who swore in comfort. Will you keep swearing?" },
      },
      choices = {
        { text = "Every morning, Father, for as long as I last.", next = "BACK", reply = "Good. A vow kept in pain is worth ten kept in comfort, and the Light knows the difference.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Some mornings I wonder why I bother.", next = "BACK", reply = "So do we all, and the bothering is the whole of the test. Keep bothering.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Tested by the plague, you mean?", next = "tested" },
      },
    },
    tested = {
      lines = { { id = "te_default", text = "By the plague, by the Lich King's chains, and now by the hatred of the living. Every trial strips away something we didn't need, and what remains is purer for it." } },
      choices = {
        { text = "Suffering has a purpose. I believe that.", next = "BACK", reply = "Then you've already passed the hardest trial, which is believing it. Hold on to that.", fx = { align = { light = 1 } } },
        { text = "Suffering is just suffering, Father.", next = "BACK", reply = "Then it will strip you bare and leave nothing behind. I pray you find the purpose in it before then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lady = {
      lines = { { id = "la_default", text = "She broke the chains on our minds when no priest and no king could, and that is a kind of miracle whether she calls it one or not. I pray for her every evening, though I suspect she would find that amusing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    sermon = {
      lines = { { id = "se_default", text = "I was writing it the week the grain came to the capital, on the subject of patience under trial, and I was halfway through the third part when the plague interrupted me. I woke years later with the pages still in my coat, and I have been finishing it ever since." } },
      choices = {
        { text = "How long is it now?", next = "sermon_long" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sermon_long = {
      lines = { { id = "sl_default", text = "Some four hundred pages, and the subject has not changed, only the examples, which have become far more vivid. Before I go on, tell me something, and answer truthfully: do you pray?" } },
      choices = {
        { text = "Every day, Father, without fail.", next = "pray_yes", fx = { trait = { pious = 1 }, affinity = 1, align = { light = 1 } } },
        { text = "No. I trust my own hands, not the Light.", next = "pray_no", fx = { trait = { stern = 1 }, align = { light = -1 } } },
        { text = "Only when I'm frightened, if I'm honest.", next = "pray_afraid", fx = { trait = { honest = 1 } } },
      },
    },
    pray_yes = {
      lines = { { id = "py_default", text = "Then you have a place in my third part, as an example of constancy, and you will not be told which page. Keep at it, child, especially on the days it feels like talking to a wall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray_no = {
      lines = { { id = "pn_default", text = "Your own hands were made by something, child, and will be unmade by something else, as all of ours were. You have a place in my sermon too, I'm afraid, and it is in the part about pride." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pray_afraid = {
      lines = { { id = "pa_default", text = "That is where most prayer begins, and there is no shame in it, whatever the Scarlets would tell you. Fear is only faith that hasn't found its feet yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    lazarus = {
      lines = { { id = "lz_default", text = "Father Lazarus is a good priest who mistakes levity for humility, and I have told him so, and he laughed, which rather proved my point. Every joke is a little crack in the wall, and this city has cracks enough." } },
      choices = {
        { text = "Laughter keeps people going, Father. Let him be.", next = "BACK", reply = "He keeps them laughing, yes, and I keep them standing. Between us, the city muddles through.", fx = { align = { order = -1 } } },
        { text = "A priest should hold to dignity. You're right.", next = "BACK", reply = "Good. Then perhaps you'll explain it to Lazarus, because he certainly won't hear it from me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    loa = {
      lines = { { id = "lo_default", text = "Perhaps they do, and I will not pretend to know what answers a troll in the jungle. But I will say this much: whatever answers you, stand straight before it, because I doubt your spirits care for slouching any more than mine does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That is not a matter of faith, and so not a matter for me. Bring me a question about the soul, and you'll have my full attention." } },
  },
}

---------------------------------------------------------------------------
-- Angela Curthas: warrior trainer, a former shieldmaiden of the city watch.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_curthas", id = TODO_NPC("Angela Curthas"), name = "Angela Curthas", title = "Warrior Trainer",
  bible = "bibles/uc_curthas.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "blunt", "warm" }, values = { "brave", "dutiful" },
  notices = { "class", "gear", "origin" },
  impression = {
    first = "Angela Curthas trains warriors in the War Quarter and inspects your shield before your face. She was city watch in life, she still keeps a duty roster for her recruits, and she talks about holding a gate as if she'd just come off shift.",
    third = "{name} met Angela Curthas, a warrior trainer in the Undercity who once stood watch in the capital.",
  },

  greetings = {
    { id = "g_default", text = "Shield up, chin down. Now, what do you want?" },
    { id = "g_back", when = { metBefore = true }, text = "Still alive, I see, or still something, at any rate. Good." },
    { id = "g_woman", when = { gender = "female", class = "WARRIOR" }, text = "Another woman with a sword. Good; the watch never had enough of us, and the Scourge never once asked to see my papers." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night shift, is it? Same as me, then. Report, and keep it short." },
  },

  notice = {
    { id = "n_war", cat = "gear", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "Your armour's hanging off you in strips. Get it mended before you come to me, or you'll learn my lessons the hard way." },
    { id = "n_soldier", cat = "origin", when = { origin = "forsaken_lordaeron_soldier" },
      text = "Army, were you? I can tell by the boots. We in the watch used to say the army marched in and the watch cleaned up after, but I'll not hold it against you now." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Angela Curthas. I teach warriors in the War Quarter, and before that I held the palace gate for the city watch, which is to say I've been fighting in this same city for longer than most of you have been dead." },
        { id = "h_orc", when = { race = "Orc", class = "WARRIOR" }, text = "An orc warrior, come for lessons from a dead woman. I'll teach you what I know, and you can teach me how you lot hit so hard." },
      },
      again = {
        { id = "h_again", text = "Something else? Quick, I've a recruit out there holding his shield upside down." },
        { id = "h_again2", text = "Go on, I'm still on shift. I'm always on shift." },
      },
      choices = {
        { text = "So you held a gate here, in life.", next = "gate" },
        { text = "What makes a good warrior?", next = "good" },
        { text = "Why do you look at shields before faces?", next = "shield" },
        { text = "What do you make of Baltus Fowler?", next = "fowler" },
        { text = "I don't carry a shield, Angela.", next = "noshield", when = { class = { "ROGUE", "HUNTER", "MAGE", "WARLOCK", "PRIEST", "DRUID" } } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "I'll go.", next = "END" },
      },
    },
    gate = {
      lines = { { id = "ga_default", text = "When the plague reached the capital, we held the gate for two days against our own neighbours, who'd come back wrong. On the third day the gate held, and I didn't, and I woke up years later on the other side of it." } },
      choices = {
        { text = "That's a hard way to lose a post.", next = "gate_lose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate_lose = {
      lines = { { id = "gl_default", text = "I don't count it lost, because I'm back at it, in a manner of speaking, and the same enemy's on the other side. Few watchmen ever get a second shift." } },
      choices = {
        { text = "Then hold the line this time.", next = "BACK", reply = "This time and every time, as long as I've got the legs for it. Come and stand with me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget the line. Take the fight to them.", next = "BACK", reply = "Then you'll leave the gate open behind you. Fight where you like, but someone has to hold.", fx = { align = { order = -1 } } },
      },
    },
    good = {
      lines = { { id = "go_default", text = "Knowing when to stand and when to step aside, and never confusing the two. Any fool can swing a sword, but it takes a warrior to know which fight is hers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    shield = {
      lines = { { id = "sh_default", text = "Because a shield's a door you carry about with you, and I was a gatekeeper for twelve years. Your face tells me who you are, but your shield tells me whether you'll still be here tomorrow, and that's the bit I need for the roster." } },
      choices = {
        { text = "The roster?", next = "roster" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roster = {
      lines = { { id = "ro_default", text = "Every recruit I've trained, on the board by the door, with a note beside each name: steady, careless, drops left, that sort of thing. Before I add you, tell me straight, what's your post? What is it you stand in front of?" } },
      choices = {
        { text = "The Horde. Whoever stands beside me.", next = "post_horde", fx = { trait = { brave = 1 }, affinity = 1 } },
        { text = "My own skin, first and last.", next = "post_self", fx = { trait = { stern = 1 } } },
        { text = "I haven't found my post yet.", next = "post_none", fx = { trait = { honest = 1 } } },
      },
    },
    post_horde = {
      lines = { { id = "ph_default", text = "Good answer, and I'll write it down as steady. Mind you keep that shield up on the left, though; everyone drops left when they're tired." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    post_self = {
      lines = { { id = "ps_default", text = "Honest, at least, and you'd be surprised how many on my board started there. A post has a way of finding you once you've stood still long enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    post_none = {
      lines = { { id = "pn_default", text = "Then you're unassigned, and I'll leave the space beside your name blank for now. Come back and tell me when you've found something worth standing in front of." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fowler = {
      lines = { { id = "fo_default", text = "Baltus takes blows on his face that belong on his shield, and then he laughs about it, and the recruits think that's the lesson. I like him well enough, but I'd not put him on a gate." } },
      choices = {
        { text = "A good soldier blocks the blow. You're right.", next = "BACK", reply = "Exactly, and you'll live longer than Baltus for knowing it. Keep your shield up.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fighting's not a drill, Angela. Let him brawl.", next = "BACK", reply = "It isn't, but it's how you survive the fight, and Baltus only laughs because he hasn't lost one yet. He will.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    noshield = {
      lines = { { id = "ns_default", text = "Then you're your own door, and a thin one, so you'd better be quick on your feet. Stand behind someone who does carry one, and buy them a drink afterwards; that's how the watch did it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Never heard of it. Ask someone who reads, and tell them the watch sent you." } },
  },
}

---------------------------------------------------------------------------
-- Christoph Walker: warrior trainer, a quiet veteran of the Second War.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_cwalker", id = TODO_NPC("Christoph Walker"), name = "Christoph Walker", title = "Warrior Trainer",
  bible = "bibles/uc_cwalker.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "calm", "grim" }, values = { "honest" },
  notices = { "race", "origin" },
  impression = {
    first = "Christoph Walker fought orcs in the Second War and now teaches them swordplay in the War Quarter. He was a pikeman, he still trusts a long pole over any sword, and he has no patience at all for flourishes. He finds his situation funnier than he lets on, and he lets on very little.",
    third = "{name} met Christoph Walker, a warrior trainer in the Undercity who fought the Horde in the Second War.",
  },

  greetings = {
    { id = "g_default", text = "You've a question, or you'd not be standing there. Ask it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Sit down; my legs aren't what they were, and they were never much." },
    { id = "g_fowler", when = { timeOfDay = { "dusk", "night" } }, text = "Keep your voice down, if you would. Baltus Fowler's been bellowing since dusk, and I'd like one quiet corner in this quarter." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "I fought your people at Hillsbrad, in the Second War. If my shoulder twitches, that's the reason." },
    { id = "n_soldier", cat = "origin", when = { origin = "forsaken_lordaeron_soldier" },
      text = "You stand like one of ours, from the old army. Feet apart, weight back, and waiting for an order that won't come." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Christoph Walker. I teach the blade in the War Quarter, and I learned it in Lordaeron's army back when the orcs were the enemy, which is a thing I try not to mention in front of the orcs." },
        { id = "h_flourish", when = { class = "WARRIOR", minLevel = 20 }, text = "You've learned a few tricks since you started, I can see it in how you hold that grip. Unlearn the pretty ones, and keep the rest." },
      },
      again = {
        { id = "h_again", text = "Something more? I've time, if not much patience." },
        { id = "h_again2", text = "Go on. Short questions get short answers, and long ones get the same." },
      },
      choices = {
        { text = "So you fought the orcs.", next = "orcs" },
        { text = "What's the first thing you teach?", next = "first" },
        { text = "Why keep a pike on the wall, if you teach the sword?", next = "pike" },
        { text = "What do you make of Baltus Fowler?", next = "fowler" },
        { text = "I marched in Lordaeron's army too.", next = "soldier", when = { origin = "forsaken_lordaeron_soldier" } },
        { text = "Your old enemies were trolls too, weren't they?", next = "troll", when = { race = "Troll" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    orcs = {
      lines = {
        { id = "or_default", text = "At Hillsbrad and at Thoradin's Wall, as a pikeman, and I hated them with my whole heart. Now they're the only people above ground who'll trade with us, and I've learned that hatred keeps less well than salt pork." },
        { id = "or_orc", when = { race = "Orc" }, text = "Your people, yes, at Hillsbrad and at Thoradin's Wall, and I hated them with my whole heart. Now you're the only living folk who'll trade with us, and I've learned that hatred keeps less well than salt pork." },
      },
      choices = {
        { text = "Old enemies can learn to stand together.", next = "BACK", reply = "Learn, aye, slowly and with a great deal of grumbling. I'm still learning myself.", fx = { align = { honor = 1 } } },
        { text = "Alliances of need last only as long as the need.", next = "BACK", reply = "That's what I tell myself when I see an orc in the Trade Quarter. Keep your pike close anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    first = {
      lines = { { id = "fi_default", text = "How to fall, and how to get up again. The dead get up more easily than the living, but they fall just the same, and they may as well learn to do it on purpose." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    pike = {
      lines = { { id = "pi_default", text = "Because a pike won the Second War, whatever the knights tell you. Twenty of us in a line with ten feet of ash apiece, and the wolf riders broke on us like water, and not one of us ever spun his weapon round his head to impress a girl." } },
      choices = {
        { text = "You don't think much of flourishes.", next = "pike_flourish" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pike_flourish = {
      lines = { { id = "pf_default", text = "A flourish is a man telling his enemy where he's about to be, slowly, with his arms. I'll ask you plainly, since I ask all my students: who taught you to fight, and did they teach you to show off?" } },
      choices = {
        { text = "A sergeant who hit me until I stopped showing off.", next = "pike_sergeant", fx = { trait = { stern = 1 }, affinity = 1 } },
        { text = "Nobody. I taught myself, the hard way.", next = "pike_self", fx = { trait = { brave = 1 } } },
        { text = "I like to show off a little, I admit.", next = "pike_show", fx = { trait = { honest = 1 } } },
      },
    },
    pike_sergeant = {
      lines = { { id = "ps_default", text = "Then he did you a kindness, and you'd do well to thank him if he's still above ground. Most of mine aren't, above or below." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pike_self = {
      lines = { { id = "pk_default", text = "That shows, both the good and the bad of it. You'll have habits I'll need to beat out of you, but you'll also have learned that the ground hurts, and that's a fair start on the lesson." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pike_show = {
      lines = { { id = "pw_default", text = "At least you're honest about it, which is more than Fowler manages. Show off after the fight, if you must, when there's nobody left to take advantage." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    fowler = {
      lines = { { id = "fo_default", text = "Baltus is a good fighter and a terrible soldier, and he laughs at both. He takes hits he ought to step out of, and one day he'll take one he can't laugh off, and I'll be the one who has to say I told him so." } },
      choices = {
        { text = "Let him laugh. The dead need some joy.", next = "BACK", reply = "Joy, is it? He'll find it in a ditch one day. Still, I'll admit he cheers the recruits.", fx = { align = { order = -1 } } },
        { text = "You're right. Discipline keeps soldiers standing.", next = "BACK", reply = "It does, and I'll keep telling him so until one of us drops. Probably him, the fool.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    soldier = {
      lines = { { id = "so_default", text = "Then you'll remember the drill-yards outside the capital, and the sergeants, and the porridge, which was worse than anything the plague did. Whatever regiment you were, you're in mine now, and I'll expect you to stand like it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "tr_default", text = "The Amani, yes, out of the forests in the north, with axes they could throw farther than I could see. I know your tribe's not theirs, so I'll keep my shoulder still, mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you. I was a pikeman, not a scholar, and we weren't paid to wonder." } },
  },
}

---------------------------------------------------------------------------
-- Baltus Fowler: warrior trainer, loud and cheerful.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_fowler", id = TODO_NPC("Baltus Fowler"), name = "Baltus Fowler", title = "Warrior Trainer",
  bible = "bibles/uc_fowler.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "loud", "cheerful" }, values = { "brave" },
  notices = { "class", "gear" },
  impression = {
    first = "Baltus Fowler is the loudest corpse in the War Quarter and seems delighted about it. He has a name and a story for every dent in his shield, and he treats every lesson as a tavern brawl he's slightly too fond of.",
    third = "{name} met Baltus Fowler, a boisterous warrior trainer in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Ha! Another one! Come here and let's see if you can take a punch, since I stopped feeling mine the day I died." },
    { id = "g_back", when = { metBefore = true }, text = "There you are! I was telling the lads about you just yesterday, though I may have exaggerated." },
    { id = "g_battered", when = { durability = { max = 0.3 } }, text = "Ha! Look at the state of you, mate! Somebody hit you properly, and I want to hear every word of it." },
  },

  notice = {
    { id = "n_tauren", cat = "class", when = { race = "Tauren", class = "WARRIOR" },
      text = "Light's mercy, look at the size of you! You could carry me home under one arm, and some nights I'd let you." },
    { id = "n_dents", cat = "gear", when = { class = "WARRIOR", durability = { max = 0.5 } },
      text = "Now that's a shield that's seen some love! Every one of those dents ought to have a name, mate, and I'd be glad to help you pick them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Baltus Fowler! I teach warriors to hit things, and I'm very good at it, because I've been hit by everything in Lordaeron and some of it twice." },
        { id = "h_caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } }, text = "A spellcaster, in the War Quarter? You're braver than you look, or lost, and either way, welcome!" },
      },
      again = {
        { id = "h_again", text = "More questions? Ask away; I love a chat between bruises, even if mine don't fade any more." },
        { id = "h_again2", text = "Ha! Still here? Good, you're tougher than the last one, mate, and he only lasted a minute." },
      },
      choices = {
        { text = "You look like you've taken some hard hits.", next = "worst" },
        { text = "Why are you so cheerful?", next = "cheer" },
        { text = "Why does every dent in your shield have a name?", next = "dents" },
        { text = "What does Christoph Walker think of you?", next = "walker" },
        { text = "I'd rather not get hit at all, Baltus.", next = "dodge", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Farewell, Baltus.", next = "END" },
      },
    },
    worst = {
      lines = { { id = "wo_default", text = "An abomination outside Brill, the first winter after we woke up, swinging a meat hook the size of a door. I took it on the shield and flew twenty feet into a pumpkin patch, and I laughed so hard I couldn't get up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cheer = {
      lines = { { id = "ch_default", text = "Because I was dead, mate, properly dead, and now I'm not, and I can still swing a sword! Everybody down here's so gloomy about it, and I can't see why." } },
      choices = {
        { text = "You're right. Every day is a gift.", next = "BACK", reply = "It is, mate, and nobody down here sees it! Come and swing a sword with me, and you'll see what I mean.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some of us remember what we lost, Baltus.", next = "BACK", reply = "I do too, mate, I just remember it differently. Grief can sit in the corner while I train.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dents = {
      lines = { { id = "dn_default", text = "Because they earned it, mate! That big one's Old Pumpkin, from the abomination, that little one's Gerald, from a Scarlet with a hammer, and the one on the rim is Walker, because he hit me in practice and I've never let him forget it." } },
      choices = {
        { text = "Does yours have a name for me yet?", next = "dents_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dents_you = {
      lines = { { id = "dy_default", text = "Not yet, but it could, if you hit hard enough! Here, I ask everyone this, so don't be shy: what's the hardest you've ever been hit?" } },
      choices = {
        { text = "An ogre once threw me across a river.", next = "dents_brag", fx = { trait = { brave = 1 }, affinity = 1 } },
        { text = "Truthfully? I try very hard not to get hit.", next = "dents_honest", fx = { trait = { cautious = 1 } } },
        { text = "Nothing's hit me hard enough yet.", next = "dents_proud", fx = { trait = { proud = 1 } } },
      },
    },
    dents_brag = {
      lines = { { id = "db_default", text = "Across a river! Ha! Did you land in the water or on the far bank? No, don't tell me, I'll decide for myself, and the lads will hear the better version tonight." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dents_honest = {
      lines = { { id = "dh_default", text = "Ha! You'd get on with Walker, then, he's been telling me the same for years. It's sound advice, mate, and I'll never take it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dents_proud = {
      lines = { { id = "dp_default", text = "Oh, I like you! That's the sort of thing a person says just before something very large proves them wrong, and I'd pay good silver to be there when it does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    walker = {
      lines = { { id = "wa_default", text = "That I'm a terrible soldier, and he's right, and I love the miserable old pikeman for saying it! He hasn't smiled since the Second War, but I'm working on him, and I reckon I'll crack him by midsummer." } },
      choices = {
        { text = "Leave him be. Some men have earned their silence.", next = "BACK", reply = "He's earned it, aye, but he's got plenty to spare. I'll leave him a little and take the rest.", fx = { align = { order = 1 } } },
        { text = "Keep at him. Everyone needs a laugh.", next = "BACK", reply = "That's the spirit! Come and help me crack him; two of us might do it by spring.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dodge = {
      lines = { { id = "do_default", text = "Not get hit? Where's the fun in that, mate? All right, all right, you lot dance about at the back and let the rest of us do the bleeding, and I suppose somebody has to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea! But if you find out, come and tell me, and we'll drink to it, or I'll drink and you can watch it run out of me." } },
  },
}
