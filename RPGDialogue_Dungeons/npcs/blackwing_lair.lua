-- Blackwing Lair: Nefarian's laboratory at the top of Blackrock Spire. Vaelastrasz the Red,
-- corrupted and in agony, begs the heroes to kill him, and Lord Victor Nefarius plays host
-- before his chromatic experiments are set loose.
-- Voices: bibles/dg_vaelastrasz.md, bibles/dg_nefarius.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Vaelastrasz the Corrupt: red dragon enslaved by Nefarian, begging for death.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_vaelastrasz", id = TODO_NPC("Vaelastrasz the Corrupt"), name = "Vaelastrasz the Corrupt",
  bible = "bibles/dg_vaelastrasz.md", role = "boss", tier = "quest",
  temper = { "anguished", "noble" }, values = { "honorable", "protective" },
  notices = { "class", "race" },
  impression = {
    first = "A great red dragon fighting his own corruption long enough to warn you.",
    third = "{name} heard Vaelastrasz the Red beg to be freed from Nefarian's corruption.",
  },

  greetings = {
    { id = "g_default", text = "Too late, friends. Nefarius's corruption has hold of me, and I can feel it tightening with every breath." },
  },

  notice = {
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "A child of the kaldorei. Your people and mine fought side by side against the Burning Legion, long ago, before the black one fell." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A healer. Do not waste your gifts on me, priest, because there is nothing left in me to mend." },
  },

  start = "hello",
  nodes = {
    w8_how = {
      lines = { { id = "w8_how_a", text = "I came alone, mortals, because I thought one red dragon could do what an army could not. He let me reach this hall, and then the chains rose from the floor, and I understood that he had been waiting for me." } },
      choices = {
        { text = "You came to stop him alone? Brave.", next = "w8_how2" },
        { text = "Why didn't the red flight come with you?", next = "w8_how2" },
        { text = "Ask me something else.", next = "BACK" },
      },
    },
    w8_how2 = {
      lines = { { id = "w8_how2_a", text = "Brave, or proud, and in the end they are the same thing in Blackrock. My flight is scattered and chained in Grim Batol, and there was no one else to come, so I came, and now you have come too." } },
      choices = {
        { text = "Then we'll finish what you started.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Vaelastrasz, consort of the red flight, and I came to this lair to stop Nefarian's work. He captured me instead and fed his corruption into my blood, so that I would guard his halls against the very heroes I hoped to aid." },
      },
      again = {
        { id = "h_again", text = "Speak quickly. I cannot hold it back much longer." },
        { id = "h_again2", text = "Ask, while I am still myself." },
      },
      choices = {
        { text = "What is Nefarian making here?", next = "work" },
        { text = "Is there no way to save you?", next = "save" },
        { text = "Why should we trust a dragon?", next = "trust" },
        { text = "Let me try to ease your pain.", next = "mend", when = { class = { "PRIEST", "PALADIN", "DRUID" } } },
        { text = "What would you have us do?", next = "fight" },
        { text = "Tell me of the red flight, while you can.", next = "yred" },
        { text = "What message should I carry to Alexstrasza?", next = "ymessage" },
        { text = "How did Nefarian take you, Vaelastrasz?", next = "w8_how" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Chromatic dragons, bred from the blood of every flight, to make an army no single flight can stand against. He wants to finish what his father Deathwing began, and he is closer than you know." } },
      choices = {
        { text = "How does he make them?", next = "chromatic" },
        { text = "Something else.", next = "BACK", fx = { learn = { "nefarian" } } },
      },
    },
    chromatic = {
      lines = { { id = "ch_default", text = "With stolen eggs and spilled blood, and with magic that should never have been worked. He took my own kin from the red flight to feed it, and I came here to stop him and became one of his tools instead." } },
      choices = {
        { text = "Then we finish what you started.", next = "ending" },
        { text = "Something else.", next = "BACK", fx = { learn = { "nefarian" } } },
      },
    },
    ending = {
      lines = { { id = "en_default", text = "Then hear me, mortals, because I may not speak clearly again. Beyond my hall wait his drakes and his flayers and the chromatic one he loves best, and above them all the black son himself, who will laugh until the moment he falls." } },
      choices = {
        { text = "Nefarian's line ends here.", next = "BACK", reply = "Let it be so, and let Alexstrasza hear that it was you who ended it.", fx = { align = { order = 1 }, learn = { "nefarian" } } },
        { text = "I'm here for his hoard, not his line.", next = "BACK", reply = "Take his hoard, then, but take his head first, or it will be your bones on that gold.", fx = { align = { order = -1 }, learn = { "nefarian" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "nefarian" } } },
      },
    },
    mend = {
      lines = { { id = "md_default", text = "Your kindness touches me more than your spell can, healer, because the fire in my blood is his now and it burns whatever you send into it. Save your strength for the ones who stand beside you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    save = {
      lines = { { id = "s_default", text = "None. The corruption is in my heart's fire now, and soon I will be his creature and nothing else. But I can give you a gift before then, the last of my strength burning in your veins." } },
      choices = {
        { text = "Then I'll grant you a clean death.", next = "fight", reply = "Thank you, hero. It is more than Nefarian would ever have allowed me.", fx = { align = { light = 1 } } },
        { text = "Your strength is what we need. Give it.", next = "fight", reply = "Take it, then, and use it well, because it will cost me everything I have left.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "You should not trust a dragon, mortal, not here. But look at my eyes and judge for yourself whether what you see there is cunning or pain." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "Fight me, and kill me before I kill you, and you will have freed me. I will burn the essence of the red flight into you, and you will need every drop of it to face what waits beyond this hall." } },
      choices = {
        { text = "We're ready, Vaelastrasz.", next = "END" },
        { text = "Not yet.", next = "BACK" },
      },
    },
    yred = {
      lines = {
        { id = "yre_default", text = "We are the keepers of life, mortals, and our queen loves the young races more than you will ever know. When the orcs held her chained in Grim Batol, she still did not hate you. Remember that, when you think of dragons." },
        { id = "yre_orc", when = { race = "Orc" }, text = "We keep life, orc, and our queen loves the young races, even yours, even after your Dragonmaw chained her in Grim Batol. She did not hate you then. Do not make her wrong now." },
      },
      choices = { { text = "I'll remember. Something else.", next = "BACK" } },
    },
    ymessage = {
      narr = "His great chest heaves, and smoke curls from his nostrils in a long, ragged breath.",
      lines = { { id = "yme_default", text = "Tell her I was not strong enough, and that I am sorry. Or tell her I died fighting him to the end, which is kinder but not true. Which would you tell a grieving queen, mortal?" } },
      choices = {
        { text = "The truth. She deserves it.", next = "BACK", reply = "Then tell her the truth, and tell her I loved her.", fx = { align = { order = 1 } } },
        { text = "The kind story. Spare her grief.", next = "BACK", reply = "Perhaps. She will see through it, but she will thank you.", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    alexstrasza = { { id = "yt_alex", text = "My queen, the Life-Binder. If I see her again, it will not be in this life." } },
    nefarian = { { id = "yt_nef", text = "The black son. He laughs while he works. I hope you are the last thing he laughs at." } },
    chromatic = { { id = "yt_chrom", text = "Chromatic dragons, stitched from every flight's blood. An abomination, and his proudest work." } },
    _none = { { id = "tp_none", text = "I have no time for that. The corruption rises, and soon I will not answer at all." } },
  },
}

---------------------------------------------------------------------------
-- Lord Victor Nefarius: Nefarian in mortal guise, playing host before his experiments.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_nefarius", id = TODO_NPC("Lord Victor Nefarius"), name = "Lord Victor Nefarius",
  title = "Lord of Blackrock", bible = "bibles/dg_nefarius.md", role = "boss", tier = "major",
  temper = { "urbane", "cruel" }, values = { "ambitious", "cunning" },
  notices = { "class", "race", "faction" },
  impression = {
    first = "A nobleman with perfect manners and a dragon's eyes.",
    third = "{name} was received by Lord Victor Nefarius in Blackwing Lair.",
  },

  greetings = {
    { id = "g_default", text = "In this world where time is your enemy, it is my greatest ally. Welcome, my guests, to Blackwing Lair." },
    { id = "g_drakk", when = { questDone = TODO_QUEST("Blackhand's Command") }, text = "Ah, the ones who murdered my general in the Spire below. I have so looked forward to meeting you in person." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A subject of Stormwind. You must give my regards to the court, if my sister has left any of it standing." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc of Thrall's tame little Horde. Rend's warriors were your blood once, and they serve me gladly." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, I see. You fancy yourself a scholar of power, so you will appreciate the elegance of my work." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Lord Victor Nefarius, master of Blackrock and of all who serve within it. You have come a long way and killed a great many of my servants, so do sit a while before you die." },
        { id = "h_ally", when = { faction = "Alliance" }, text = "The Alliance, always so earnest. Your king vanished on a diplomatic voyage, I hear, and his court is so very fond of my sister's company." },
        { id = "h_horde", when = { faction = "Horde" }, text = "The Horde, yes, Thrall's errand runners. Your warchief should have left the Blackrock clan in its mountain, because it was always mine." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. You will not leave with the answers." },
        { id = "h_again2", text = "Please, continue. I find mortal curiosity charming, in small doses." },
        { id = "h_again3", text = "Another question? How very brave of you." },
      },
      choices = {
        { text = "Who are you, really?", next = "who" },
        { text = "What are you breeding up here?", next = "chromatic" },
        { text = "Your sister plays at being a noble too.", next = "onyxia" },
        { text = "Your war with Ragnaros is lost.", next = "ragnaros" },
        { text = "Why let us get this far?", next = "why" },
        { text = "Rend Blackhand betrayed the Horde for you.", next = "rend", when = { race = { "Orc", "Troll" } } },
        { text = "Bolvar will see through Lady Prestor in time.", next = "prestor", when = { faction = "Alliance" } },
        { text = "What spellwork binds a dragon's blood?", next = "mage_blood", when = { class = "MAGE" } },
        { text = "Enough talk. Face us.", next = "end_fight" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Nefarian, eldest son of Deathwing, lord of the black dragonflight. The mortal face is a courtesy, because you are such fragile things and my true shape tends to end conversations early." } },
      choices = {
        { text = "Where is Deathwing now?", next = "deathwing" },
        { text = "Something else.", next = "BACK", fx = { learn = { "nefarian" } } },
      },
    },
    deathwing = {
      lines = { { id = "dw_default", text = "Gone from this world for now, and nothing that need concern you. His children carry on his work, and I daresay we do it with more patience than he ever had." } },
      choices = {
        { text = "His children will fall as he did.", next = "BACK", reply = "Bold, and quite wrong. My father fell because he trusted lesser creatures, and I make no such mistake.", fx = { align = { order = 1 }, learn = { "nefarian" } } },
        { text = "Patience is wise. I almost admire it.", next = "BACK", reply = "Almost? Then you are wiser than most of your kind, and I shall make your end swift.", fx = { align = { order = -1 }, learn = { "nefarian" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "nefarian" } } },
      },
    },
    chromatic = {
      lines = { { id = "c_default", text = "Chromatic dragons, the blood of all five flights in one body, with none of their weaknesses and all of their strength. With them I will make a flight that answers to me alone, and the Aspects themselves will kneel." } },
      choices = {
        { text = "You torture other dragons to do it.", next = "torture" },
        { text = "Chromaggus is one of these, isn't he?", next = "chromaggus" },
        { text = "Something else.", next = "BACK" },
      },
    },
    torture = {
      lines = { { id = "t_default", text = "I refine them, and some do not survive refinement. Ask poor Vaelastrasz how it feels, if you have not already put him out of his misery." } },
      choices = {
        { text = "Monstrous. You'll answer for every one.", next = "BACK", reply = "Everyone answers to someone, mortal, and you will answer to me shortly.", fx = { align = { light = 1 } } },
        { text = "Strength demands sacrifice. I understand.", next = "BACK", reply = "How refreshing. Most heroes weep about it, and so very tediously.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    chromaggus = {
      lines = { { id = "cg_default", text = "My finest hound, and my proudest early failure, because he is beautiful and quite insane. He waits in the halls ahead, and he is always hungry." } },
      choices = {
        { text = "Why call him a failure if he's so strong?", next = "chromaggus_fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chromaggus_fail = {
      lines = { { id = "cf_default", text = "Because he cannot be taught, only aimed. Each flight's blood fights the others inside him, and his breath changes with his moods. A weapon that chooses its own edge is a curiosity, not an army." } },
      choices = {
        { text = "Then the true chromatic flight isn't finished.", next = "chromaggus_flight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chromaggus_flight = {
      narr = "He smiles, and for a moment his teeth look far too long.",
      lines = { { id = "cfl_default", text = "Not yet, but very nearly, and every guest who visits my laboratory brings me a step closer. You yourselves may contribute something before the evening is through." } },
      choices = {
        { text = "We'll burn your laboratory to the ground.", next = "BACK", reply = "Many have promised as much. The ashes are always mine to sift afterward.", fx = { align = { order = -1 } } },
        { text = "Power like that would need firm control.", next = "BACK", reply = "Precisely, and control is what my father lacked. You understand more than you let on.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rend = {
      lines = { { id = "re_default", text = "Rend saw what Thrall never will, that a warchief who begs for peace is only a slave with a larger cage. I offered him a mountain and a title, and he accepted both before I finished asking." } },
      choices = {
        { text = "He's a puppet, and he'll die like one.", next = "BACK", reply = "Every servant dies eventually. The clever ones are useful first, and Rend has been very useful.", fx = { align = { light = 1 } } },
        { text = "Thrall's peace is weakness. Rend saw that.", next = "BACK", reply = "Careful, little orc, or I may offer you a title of your own.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    prestor = {
      lines = { { id = "pr_default", text = "Bolvar Fordragon is an honest man, which is exactly why he will never think to look for a dragon in a ball gown. Honest men are the easiest to fool, and Stormwind is full of them." } },
      choices = {
        { text = "Someone always notices. Lies like hers don't last.", next = "BACK", fx = { learn = { "onyxia" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_blood = {
      lines = { { id = "mb_default", text = "Nothing so crude as spellwork, my dear scholar. Dragon blood remembers the Titans who first shaped it, and one need only persuade it to forget the details. Your Kirin Tor would faint to watch it done." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    onyxia = {
      lines = { { id = "o_default", text = "My dear sister enjoys her games with Stormwind's nobles, and she plays them well. While she whispers in their ears, I build an army they will never see coming." } },
      choices = {
        { text = "She'll be unmasked soon enough.", next = "unmask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    unmask = {
      lines = { { id = "u_default", text = "Perhaps, by some bold little hero with a forged letter and a great deal of luck. Even so, Onyxia has her lair in the marsh, and she does not die easily." } },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "onyxia" } } },
      },
    },
    ragnaros = {
      lines = { { id = "r_default", text = "The Firelord? That burning brute below has fought me for this mountain for longer than your grandfathers lived. If you have already silenced him, then I owe you thanks, and I will pay it in a quick death." } },
      choices = {
        { text = "We killed him for no one's sake.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "y_default", text = "Because I wanted to watch, of course. Your kind is so very interesting when it is desperate, and every hero who falls here teaches me something new for my experiments." } },
      choices = {
        { text = "Then watch closely now.", next = "end_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    end_fight = {
      lines = { { id = "e_default", text = "Very well, let the games begin. My children will entertain you, and when they are done, I will come down to collect what is left." } },
      choices = {
        { text = "We'll be waiting.", next = "END" },
      },
    },
  },

  alignment = { light = -1 },
  confides = {
    { id = "cnf_1", text = "Warchief Rend believes he commands the Spire, but every orc there answers to General Drakkisath when it matters. Rend has never forgiven me for it, and he never will." },
    { id = "cnf_2", text = "The Dark Iron emperor in the city below rules at Ragnaros' pleasure, and his court is full of those who would sell him to the first bidder. Blackrock Depths is rotten from the throne down." },
    { id = "cnf_3", text = "Razorgore's brood chamber is the beating heart of my work, and every egg in it is precious to me. Break enough of them, and you will learn how a dragon looks when he truly loses his temper." },
  },
  topics = {
    onyxia = { { id = "tp_ony", text = "My sister, and a far better actress than I.", next = "onyxia" } },
    _none = { { id = "tp_none", text = "Trivia. Ask me something that matters, or ask nothing at all." } },
    grievance = {
      { id = "gv1", text = "You are a dull guest, and I have no patience for dull guests. My children have a great deal of patience for them, however, and they find dullness very easy to digest." },
      { id = "gv_values", when = { grudge = "values" }, text = "You came here swollen with righteousness and heroic purpose, and it bores me to tears. I much preferred you when I thought you might be clever." },
    },
    amends = {
      { id = "am1", text = "Amuse me. Do something in my halls that I did not expect, and I may forgive you for wasting my evening." },
      { id = "am_tone", when = { grudge = "tone" }, text = "Speak to me as a guest speaks to his host, with a little grace. Manners cost you nothing, and they may yet buy you a few more minutes." },
    },
    spite = {
      { id = "sp1", text = "I think you are meat that has learned to talk, and not very well. When my children are finished with you, I will not trouble to remember your name." },
      { id = "sp_values", when = { grudge = { worst = "values" } }, text = "I think you are exactly the sort of hero my sister collects at court, and she keeps a whole drawer of them, all very still." },
    },
    regard = {
      { id = "rg_1", text = "I think you are a remarkable specimen, my dear guest, and I do not use the word lightly. Most of your kind break long before they reach my door." },
      { id = "rg_2", text = "You amuse me, and you came up through the Spire alive, which is more than most of Rend's visitors can say. I find myself curious about what you will become." },
      { id = "rg_shadow", when = { alignment = { axis = "light", max = -30 } }, text = "There is a darkness in you that you have not yet learned to love. Do not worry; it is patient, and so am I." },
      { id = "rg_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "You lie well and you scheme better, and you have the grace not to apologise for either. My sister would adore you, and I mean that as a warning." },
    },
    confide = {
      { id = "cf_1", text = "My sister believes the court in Stormwind is her finest work. I believe it is merely her most comfortable, and she has grown soft lying on it." },
      { id = "cf_2", text = "Ragnaros believes the Dark Irons serve him, and the Dark Irons believe they serve themselves. Both are mistaken, and I find it endlessly diverting." },
    },
    trust = {
      { id = "tr_1", text = "Trust? Here? My dear guest, trust no one in this mountain, and trust me least of all. It is the only honest advice I will ever give you." },
      { id = "tr_2", text = "Trust General Drakkisath to obey and Warchief Rend to betray, for both are wonderfully predictable. Everyone else in Blackrock I would watch very closely." },
    },
    watchout = {
      { id = "wo_1", text = "Watch my children's breath, for each of them was bred to burn something different, and I have been very thorough." },
      { id = "wo_2", text = "Beware the Dark Irons below, who serve the Firelord with a devotion that makes them very hard to kill and very tedious to talk to." },
    },
    worries = {
      { id = "wy_1", text = "Worry is a mortal affliction, but I will confess my work goes more slowly than I would like. Blood of every flight is difficult to come by, and the donors so rarely cooperate." },
      { id = "wy_2", text = "That my sister's games in Stormwind will draw the wrong eyes to this mountain before my work is done. She has always been careless with her toys." },
    },
    hopes = {
      { id = "hp_1", text = "To see the chromatic flight made whole, bred from the blood of every flight and answering to no one but me. Then the world will learn what my father's son can build." },
      { id = "hp_2", text = "I hope that you live long enough to see what I have made. It would be such a waste to show it to an empty room." },
    },
    favor = {
      { id = "fv_1", text = "You might carry a message to my sister at court, though I suspect she would kill the messenger. That is rather the point of the message." },
      { id = "fv_2", text = "Stay alive a little longer, {name}. You are the most interesting thing to climb this mountain in years, and I so dislike being bored." },
    },
    friendship = {
      { id = "fr_1", text = "A friend? How charming. I count you a favourite guest, which in Blackwing Lair is a far rarer and far more dangerous honour." },
      { id = "fr_2", text = "Dragons do not have friends, my dear, only allies and meals. But I confess I would be sorry to see you eaten, and I am so rarely sorry." },
      { id = "fr_shadow", when = { fondness = "alignment", alignment = { axis = "light", max = -30 } }, text = "You have walked far enough into the dark to see the world as I do. That is as near to friendship as my kind can come, and nearer than anyone has come in a long while." },
    },
    never_told = {
      { id = "nt_1", text = "My father does not answer when I call to him anymore. I tell my children he is resting, and I tell myself the same." },
      { id = "nt_2", text = "Some of my early children did not survive the blending, and I kept their names. I could not tell you why, and I would kill anyone who repeated it." },
    },
  },
}
