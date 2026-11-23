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
  },

  topics = {
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

  topics = {
    onyxia = { { id = "tp_ony", text = "My sister, and a far better actress than I.", next = "onyxia" } },
    _none = { { id = "tp_none", text = "Trivia. Ask me something that matters, or ask nothing at all." } },
  },
}
