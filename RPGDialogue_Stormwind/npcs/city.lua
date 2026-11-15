-- Stormwind's other powers and comforts: SI:7, the Wizard's Sanctum, the Slaughtered Lamb,
-- and the Gilded Rose. Voices: bibles/city.md (one bible, a section each).
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Master Mathias Shaw: head of SI:7, Old Town. Cynical, loyal to the crown.
P:NPC {
  key = "shaw", id = TODO_NPC("Master Mathias Shaw"), name = "Master Mathias Shaw",
  bible = "bibles/city.md", role = "noble", tier = "major",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "cunning", "lawful" },
  notices = { "stealth", "watch" },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Sit. I knew you were coming before you did." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "You've wandered into the wrong building. Wander out the same way." },
    { id = "g_si7", when = { questActive = TODO_QUEST("Seek out SI: 7") }, text = "Sylvius sent you, and she thinks you're promising, though she's said that before." },
    { id = "g_back", when = { metBefore = true }, text = "Back already. You took the stairs more quietly this time. Progress." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "The third step from the door creaks, and you stepped on it. Everyone does, the first time, which is why it's there." },
    { id = "n_watch", cat = "watch", when = { deed = "dungeon:The Deadmines" },
      text = "You've been under Moonbrook, and I read the reports before you'd washed the mud off. That's my job." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Shaw. I run SI:7. If you've heard of us, someone's been careless. If you haven't, we're doing our job." },
        { id = "h_si7", tags = { "news" }, when = { questActive = TODO_QUEST("SI:7") },
          text = "So you found the building, which is good, because finding things people would rather you didn't is the whole job. You'll be doing a great deal of it." },
        { id = "h_defias", when = { topicKnown = "defias", minLevel = 15 },
          text = "The Brotherhood wants Stormwind hollowed out from the inside. Every gang has a weak link, and my people find it; then I decide what to do with it." },
        { id = "h_deadmines", when = { deed = "dungeon:The Deadmines" },
          text = "VanCleef. I trained him once, you know, and I thought he'd come over to us, but he went somewhere else entirely. I don't make that mistake twice." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "A Skyborne. My people have a file on yours already, and it's thin, which makes me uneasy about the file, not about you. Don't take it personally." },
        { id = "h_wiley", tags = { "news" }, when = { questActive = TODO_QUEST("The Defias Brotherhood") },
          text = "This is Stoutmantle's Brotherhood business, and the whispers say Stonemasons. He won't like where that road goes, and neither do I." },
        { id = "h_maelik", tags = { "news" }, when = { questActive = TODO_QUEST("Shadow of the Past") },
          text = "Alexston's description. Maelik, it says. I know the face, not that name. He answers to Marzon when it suits him, and he works for a lord." },
        { id = "h_lescovar_done", tags = { "news" }, when = { questActive = TODO_QUEST("Brotherhood's End") },
          text = "Alexston wants a word with you, so tell him everything except whose hand did the work. As for Trias, he doesn't exist, and he never has." },
        { id = "h_kearnen", when = { questActive = TODO_QUEST("Mathias and the Defias") },
          text = "Kearnen's been lying under a tree outside that tower for weeks. Go and relieve her before she takes root." },
        { id = "h_zanzil", when = { questDone = TODO_QUEST("Klaven's Tower") },
          text = "Trolls in Stranglethorn brewing undeath in a pot, and the Venture Company carrying it north. I've read that journal three times. I'd rather have been wrong once." },
        { id = "h_east", when = { questActive = TODO_QUEST("The First and the Last") },
          text = "I sent five agents into the Eastern Plaguelands, and one came back, saying a name over and over until he died in his sleep a few days later. Sit down." },
        { id = "h_dughan", when = { heardLine = "dughan.d_common_thieves" },
          text = "Dughan tells Goldshire they're common thieves, but common thieves don't keep shipping schedules. Let him keep the town calm, and I'll keep the ledger." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Robes, in SI:7's barracks? Either you're lost, or someone has confessed something interesting, and I'll hope for the second." },
      },
      again = {
        { id = "h_again", text = "Go on. I've ten minutes, and I've already spent two of them on you." },
        { id = "h_again2", text = "What else? Quietly. The walls here are thin on purpose." },
        { id = "h_again3", when = { class = "ROGUE" }, text = "Something else? Ask it as if someone's listening. Someone usually is." },
      },
      choices = {
        { text = "What does SI:7 do?", next = "si7" },
        { text = "Who do you answer to?", next = "answer" },
        { text = "What do you know about the Defias?", next = "defias" },
        { text = "I'm a rogue. Does SI:7 have work?", next = "rogue", when = { class = "ROGUE" } },
        { text = "What use is a priest to SI:7?", next = "priest", when = { class = "PRIEST" } },
        { text = "My family sits in the House of Nobles.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "Lescovar is dead.", next = "lescovar", when = { questDone = TODO_QUEST("The Head of the Beast") } },
        { text = "I'll go.", next = "END" },
      },
    },

    si7 = {
      lines = { { id = "s_default", text = "We worry, so the king doesn't have to. Currently that's a regent and a boy. So we worry twice as hard." } },
      choices = {
        { text = "That's a heavy job.", next = "BACK", fx = { affinity = 1 } },
        { text = "Can I help?", next = "help" },
        { text = "And the King himself?", next = "si7_king" },
      },
    },
    help = {
      lines = { { id = "hp_default", text = "Probably. Keep your eyes open and your mouth shut, and we'll find you when we need you. Don't come looking." } },
      choices = {
        { text = "Understood.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "How will you find me?", next = "help_find" },
      },
    },
    help_find = {
      lines = { { id = "hf_default", text = "The same way I knew you were coming before you reached the door: someone told me, as someone always does." } },
      choices = {
        { text = "That isn't comforting.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Then I'll be easy to find.", next = "BACK", fx = { affinity = 1, standing = { stormwind = 1 } } },
      },
    },
    si7_king = {
      big = true,
      lines = { { id = "sk_default", text = "Missing, on the road to Theramore. The whole city knows that much. What my people know beyond it stays in this building." } },
      choices = {
        { text = "Then I won't ask.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Do you know more?", next = "si7_know", fx = { trait = { curious = 1 } } },
      },
    },
    si7_know = {
      lines = { { id = "sn_default", text = "Yes, or no; pick whichever answer lets you sleep, because I'll be awake either way." } },
      choices = { { text = "Fair. Something else.", next = "BACK" } },
    },

    answer = {
      big = true,
      lines = { { id = "a_default", text = "The House of Wrynn, whoever's sitting in its chair. I serve the crown, not the court, and that difference has kept me alive." } },
      choices = {
        { text = "And the court?", next = "court" },
        { text = "Good answer.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    court = {
      lines = { { id = "c_default", text = "The nobles mean well, mostly. Lady Prestor means very well indeed. She's the only one who never asks me for anything." } },
      choices = {
        { text = "Doesn't that make you suspicious?", next = "court_prestor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court_prestor = {
      lines = { { id = "cp_default", text = "Of her? No. She's never once asked me to look away from something. That's rare enough at court that I've stopped looking for a reason." } },
      choices = {
        { text = "Maybe you should look.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Then she's an ally.", next = "BACK", fx = { affinity = 1, opinion = { prestor = "ally" } } },
      },
    },

    defias = {
      lines = {
        { id = "d_default", text = "That they're no gang, because gangs don't keep shipping schedules, smuggle from Redridge to Westfall, or plant people inside Stormwind. Someone is building something.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "Who's building it?", next = "defias_masons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defias_masons = {
      lines = { { id = "dm_default", text = "Stonemasons. The guild that rebuilt this city and was never paid. Their guildmaster led a riot and walked out with half of them. I knew him well." } },
      choices = {
        { text = "Edwin VanCleef?", next = "defias_edwin" },
        { text = "Something else.", next = "BACK", fx = { opinion = { defias = "masons_wronged" } } },
      },
    },
    defias_edwin = {
      big = true,
      lines = { { id = "de_default", text = "We were boys together. I taught him to move unseen and hoped he'd work beside me. He chose stone, then this, and some days I think I taught him exactly enough." } },
      choices = {
        { text = "That isn't your fault.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then you know how he thinks.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },

    rogue = {
      lines = { { id = "r_default", text = "Everyone with light fingers wants in, and Renzik decides whether you live long enough. He'll send you to Lucius in Redridge first, so do what Lucius says." } },
      choices = {
        { text = "And if I'm caught on a job?", next = "rogue_caught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue_caught = {
      lines = { { id = "rc_default", text = "Then SI:7 has never heard of you, I've never met you, and this conversation was about the weather. Lovely weather, wasn't it?" } },
      choices = {
        { text = "Lovely.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "That's cold.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },

    priest = {
      lines = { { id = "p_default", text = "People tell priests what they'd never tell me: grief, guilt, a brother home with too much coin. I'd never ask you to repeat a confession, only to listen well." } },
      choices = {
        { text = "I won't spy for you.", next = "priest_refuse", fx = { align = { light = 1, honor = 1 } } },
        { text = "Listening is half my work anyway.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    priest_refuse = {
      lines = { { id = "pr_default", text = "Good, because a priest who'd sell a confession is no use to me either; nobody would confess to them. We understand each other." } },
      choices = { { text = "I suppose we do.", next = "BACK", fx = { affinity = 1 } } },
    },

    noble = {
      lines = { { id = "n_default", text = "Then there's a file on them in this building, and don't go pale, because there's a file on every house. Yours is thinner than most, which is a compliment." } },
      choices = {
        { text = "What's in it?", next = "noble_file" },
        { text = "Something else.", next = "BACK" },
      },
    },
    noble_file = {
      lines = { { id = "nf_default", text = "Debts, mostly. Every noble house in Stormwind owes someone. The interesting question is never how much. It's to whom." } },
      choices = {
        { text = "I'll keep my family's debts in order.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Whose debts interest you most?", next = "BACK", fx = { trait = { curious = 1 }, affinity = -1 } },
      },
    },

    lescovar = {
      big = true,
      lines = { { id = "l_default", text = "So I hear, and swiftly done. Remind me never to be the name on your list, and don't offer Trias any thanks, because he won't want them." } },
      choices = {
        { text = "Will the House of Nobles ask questions?", next = "lescovar_house" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lescovar_house = {
      lines = { { id = "lh_default", text = "The House will find a lord dead in his own garden and decide he had enemies, and they'll be right, but they won't ask which." } },
      choices = { { text = "Something else.", next = "BACK", fx = { align = { order = -1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I run SI:7. Before that I was learning to. That's all the story there is, and more than I tell most people." } },
    advice = { { id = "tp_ad", text = "Count the doors in every room you walk into. Then count the people who know about them." } },
    rumors = { { id = "tp_ru", text = "Rumours are my trade, and I don't hand out samples." } },
    defias = {
      { id = "tp_defias", text = "Organized, funded and patient. Funded by whom is the question, and I'm working on it.", next = "defias_masons" },
      { id = "tp_defias2", text = "They smuggle through Jerod's Landing and Klaven's tower and anywhere else nobody's watching. I'm watching." },
    },
    westfall = { { id = "tp_westfall", text = "Stoutmantle's a good man doing the crown's job without the crown's money. I send him what I can. Quietly." } },
    _none = { { id = "tp_none", text = "If SI:7 knew, it wouldn't be my place to say. If we didn't, it wouldn't be my place to admit it." } },
  },
}

-- Jennea Cannon: Wizard's Sanctum, Mage Quarter. Formal, mentoring.
P:NPC {
  key = "jennea", id = TODO_NPC("Jennea Cannon"), name = "Jennea Cannon", title = "Mage Trainer",
  bible = "bibles/city.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "steady" }, values = { "curious", "lawful" },
  notices = { "arcane" },

  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "The Sanctum. Wipe your boots; the floor wards are sensitive." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "Please don't touch the circles; they're not decorative." },
  },

  notice = {
    { id = "n_skyborne", cat = "arcane", when = { race = "Skyborne", class = "MAGE" },
      text = "A High Order mage! I'd like to see what your people kept all those years, but your fundamentals come first, because everyone's fundamentals have gaps." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jennea Cannon, of the Wizard's Sanctum. I teach mages who've outgrown the provinces; some have, though most only think they have." },
        { id = "h_speak", tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Jennea") },
          text = "Wefhellt sent you. He'll have said something flattering about me. Ignore it and listen to what I actually say." },
        { id = "h_mirror", when = { questActive = TODO_QUEST("Mirror Lake") },
          text = "Mirror Lake is just outside the city. Bring me what I asked for, and mind your reflection; it's only a reflection, mostly." },
        { id = "h_recluse", when = { questActive = TODO_QUEST("Investigate the Blue Recluse") },
          text = "The Blue Recluse is a tavern, not a laboratory, whatever its regulars think. Find out what they're doing in there." },
        { id = "h_wards", when = { metBefore = true, class = "MAGE" }, text = "Your wards are tidier, though not good yet, only tidier. Good comes later." },
        { id = "h_sleeve", when = { metBefore = true, ["not"] = { class = "MAGE" } }, text = "A student set his sleeve alight last week, then froze it, then cried. Mages learn in that order." },
        { id = "h_marsh", when = { class = "MAGE", minLevel = 38 },
          text = "You've outgrown this room. There's a hermit in Dustwallow Marsh called Tabetha, brilliant, rude and worth the boat fare, so go when you're ready to earn a wand." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "You call on something that answers, priest. We call on something that only obeys. I've never decided which habit is more dangerous." },
      },
      again = {
        { id = "h_again", text = "Is there more? Stay outside the circles while you ask." },
        { id = "h_again2", text = "Ask. Precisely, if you can manage it." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why test the water at Mirror Lake?", next = "currents" },
        { text = "What happened at the Blue Recluse?", next = "recluse" },
        { text = "Is magic really so dangerous?", next = "danger", when = { ["not"] = { class = "MAGE" } } },
        { text = "I'll go.", next = "END" },
      },
    },
    currents = {
      lines = { { id = "cu_default", text = "The great magical struggles of the last wars tore the old currents loose. Elwynn's flow has shifted. I want to know whether it's seeping into what people drink." } },
      choices = {
        { text = "And if it is?", next = "currents_if" },
        { text = "Something else.", next = "BACK" },
      },
    },
    currents_if = {
      lines = { { id = "ci_default", text = "Then a village drinks from that lake for ten years and nobody knows why its children dream in colours. I'd rather find out first." } },
      choices = { { text = "Better you than them. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    recluse = {
      lines = { { id = "re_default", text = "A mana rift opened in a tavern cellar, in the middle of the Mage Quarter. Invisible things wandered among the tables. The regulars blamed the ale for a week." } },
      choices = {
        { text = "Where did they come from?", next = "recluse_from" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recluse_from = {
      lines = { { id = "rf_default", text = "That's what the coffers are for: catch them, study them, and learn how they slipped through. Closing the door is easy, but knowing who opened it isn't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "da_default", text = "To the untrained, yes, it burns. I've watched it burn people who were certain they'd be the exception." } },
      choices = {
        { text = "The Light burns the careless too.", next = "danger_light", when = { class = "PRIEST" } },
        { text = "I'll keep my distance.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    danger_light = {
      lines = { { id = "dl_default", text = "Does it? Then we've more in common than your Archbishop would like to admit. Come back and argue about it. I enjoy a good argument." } },
      choices = { { text = "I might. Something else.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My history is dull, and I'd rather not waste your lesson on it. The magic is the interesting part. Ask about that." } },
    advice = { { id = "tp_ad", text = "Never cast a spell you couldn't explain to a child. If you can't explain it, you don't understand it, and it will notice." } },
    morganth = { { id = "tp_morganth", text = "His name is not spoken lightly in this building, because he stole from us, and he will be stopped." } },
    _none = { { id = "tp_none", text = "Not a question for the Sanctum, I'm afraid. Try the library." } },
  },
}

-- Gakin the Darkbinder: the Slaughtered Lamb. Guarded; pays for discretion.
P:NPC {
  key = "gakin", id = TODO_NPC("Gakin the Darkbinder"), name = "Gakin the Darkbinder", title = "Warlock Trainer",
  bible = "bibles/city.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "cunning", "ambitious" },
  notices = { "pet", "watch" },

  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Close the door behind you, quietly. The people upstairs drink to forget us." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "You're lost. Stay lost, somewhere else." },
  },

  notice = {
    { id = "n_void", cat = "pet", when = { pet = { family = "Voidwalker" } },
      text = "Your voidwalker's doing what it's told, which is good. Remember that obedience is a habit, not a nature, and keep it in the habit." },
    { id = "n_watch", cat = "watch", when = { ["not"] = { class = "WARLOCK" }, minLevel = 20 },
      text = "You've a look of someone who reports to someone. Whoever it is, tell them the Lamb is just a tavern." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Gakin. I teach those who bind what others fear to name. Discretion is the first lesson and the last, and I pay well for it." },
        { id = "h_summons", tags = { "news" }, when = { questActive = TODO_QUEST("Gakin's Summons") },
          text = "Marcot says you're ready for something from the Void. We'll see. The Void doesn't care what Marcot says." },
        { id = "h_surena", when = { questActive = TODO_QUEST("Surena Caledon") },
          text = "Surena was my student, and she took something of mine and ran. Bring it back; what becomes of her is your business, mostly." },
        { id = "h_incubus", when = { class = "WARLOCK", minLevel = 20 },
          text = "There's a circle prepared in the crypts below. When you're ready to bind a sayaad we'll talk, and not before, because they eat the ones who aren't." },
        { id = "h_strahad", when = { class = "WARLOCK", minLevel = 30 },
          text = "Felhunters are beyond what I can teach in this cellar, but Strahad Farsan keeps the means in Ratchet. He's one of ours, and he'll have heard of you." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Vestments, in the Lamb's cellar? Did the Archbishop send you, or did you find the stairs yourself? Either way, lower your voice." },
      },
      again = {
        { id = "h_again", text = "Well? The candles don't last forever, and nor does my patience." },
        { id = "h_again2", text = "Something else. Quietly." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What is this place?", next = "lamb" },
        { text = "Why so many dwarves and gnomes down here?", next = "khaz" },
        { text = "Who was Surena?", next = "surena", when = { questDone = TODO_QUEST("Surena Caledon") } },
        { text = "The Church would shut this place down.", next = "church", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'll go.", next = "END" },
      },
    },
    lamb = {
      lines = { { id = "l_default", text = "There's a tavern upstairs and a crypt downstairs. The drinkers upstairs don't ask, and we don't serve drinks, and most of the time that arrangement holds." } },
      choices = {
        { text = "And when it doesn't?", next = "lamb_noble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lamb_noble = {
      lines = { { id = "ln_default", text = "Then a lord with an unpaid bar tab finds out where we are and calls for an inquiry, as Lord Wishock has lately. Zardeth is keeping him busy, and don't ask how." } },
      choices = {
        { text = "I won't ask.", next = "BACK", fx = { affinity = 1 } },
        { text = "Blackmail, then.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    khaz = {
      lines = { { id = "k_default", text = "Gnomeregan trained the warlocks of Khaz Modan, once. Now Gnomeregan is poison and Ironforge watches its own too closely. So they send them here.",
        fx = { learn = { "gnomeregan" } } } },
      choices = {
        { text = "Is that a problem?", next = "khaz_attention" },
        { text = "Something else.", next = "BACK" },
      },
    },
    khaz_attention = {
      lines = { { id = "ka_default", text = "Crowded gets noticed, and noticed gets an inquiry. I'd rather teach ten students in the dark than forty in the light." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    surena = {
      lines = { { id = "s_default", text = "A good student, better than good, and that's what made it hurt. Don't ask me again." } },
      choices = {
        { text = "She ran off with a Defias thief.", next = "surena_erlan", fx = { affinity = -1 } },
        { text = "I won't. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    surena_erlan = {
      lines = { { id = "se_default", text = "Drudgemoor. A thief with good teeth and no talent. I told you not to ask. Now you know why." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    church = {
      big = true,
      lines = { { id = "c_default", text = "The Church prays the dark away. We bind it and put it where it can't wander. Ask your Archbishop which of us has fewer demons loose in Elwynn." } },
      choices = {
        { text = "Binding a demon is still using it.", next = "church_use", fx = { align = { light = 1 } } },
        { text = "You have a point.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    church_use = {
      lines = { { id = "cu_default", text = "Yes. So is a sword, and the Church blesses those. Go home. We'll both keep doing what we do, and the city will keep not asking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My past is my business. Discretion is the first lesson, remember, and you've just failed it by asking." } },
    advice = { { id = "tp_ad", text = "Whatever a demon offers you, it's lying. Even the things that turn out true. Especially those." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "It sent us its warlocks once. Now it sends us its refugees. I take both." } },
    _none = { { id = "tp_none", text = "I don't trade in answers I don't have. I barely trade in the ones I do." } },
  },
}

-- Innkeeper Allison: the Gilded Rose, Trade District.
P:NPC {
  key = "allison", id = TODO_NPC("Innkeeper Allison"), name = "Innkeeper Allison",
  bible = "bibles/city.md", role = "innkeeper", tier = "service",
  communities = { "stormwind" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "guest", "drink" },

  greetings = {
    { id = "g_rose", text = "In you come. The Gilded Rose has a bed for every tired pair of boots." },
    { id = "g_home", when = { homeInn = { "Stormwind City", "Gilded Rose" } }, text = "Welcome home. Your room's aired and the fire's lit." },
  },

  notice = {
    { id = "n_away", cat = "guest", when = { homeInn = { "Stormwind City", "Gilded Rose" }, daysSince = { min = 14 } },
      text = "There you are! Two weeks without a word, and I'd started wondering whether to let your room. I didn't, though I nearly did." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Someone's been to the Pig and Whistle first. Sit down, have some water and then some bread, and then we'll talk about wine." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Allison. The Gilded Rose, between the bank and the auction house, which means everyone who comes in has either just got rich or just got poor. I feed both." },
        { id = "h_new", when = { maxLevel = 12 },
          text = "First time in the city? It's loud, it's big, and the canals are deeper than they look. Stay here and you'll at least get a decent breakfast." },
        { id = "h_staghelm", when = { minLevel = 50 },
          text = "Word for seasoned folk: the Cenarion Circle in Darnassus wants help with some research. Arch Druid Staghelm himself is asking. I only pass it on." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Sit nearer the fire, there's a good soul. The last priest who stayed here blessed the bread, and I swear it rose better for a week." },
      },
      again = {
        { id = "h_again", text = "What else, love? I've bread in the oven." },
        { id = "h_again2", text = "Anything more? The kettle's always on." },
      },
      choices = {
        { text = "A room, please.", next = "BUSINESS" },
        { text = "Heard anything?", next = "news" },
        { text = "Who stays at the Gilded Rose?", next = "guests" },
        { text = "I'm from Westfall.", next = "westfall", when = { origin = "human_westfall_farmhand" } },
        { text = "Just passing through.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "Bankers complain about the nobles, nobles complain about the Regent, and everybody complains about Westfall. It's a normal week." } },
      choices = {
        { text = "Why does everyone complain about Westfall?", next = "news_westfall" },
        { text = "Ha. Thanks.", next = "BACK" },
      },
    },
    news_westfall = {
      lines = { { id = "nw_default", text = "Because bread costs more every month, and everybody knows where the wheat used to come from. Nobody says it at breakfast; they just butter thinner.",
        fx = { learn = { "westfall" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guests = {
      lines = { { id = "gu_default", text = "Bankers on their lunch, auction folk, and anyone who's just used the mailbox outside. That mailbox brings me more custom than the sign does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    westfall = {
      lines = { { id = "w_default", text = "Then you eat first. That's the rule in this house for anyone from Westfall. Don't argue with me; nobody wins that." } },
      choices = { { text = "I wouldn't dare.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "If I've a story, it happened while I was making breakfast, and I wasn't paying attention. Ask me about the guests instead." } },
    advice = { { id = "tp_ad", text = "Eat before you go out that gate. The road doesn't serve breakfast." } },
    westfall = { { id = "tp_westfall", text = "The farmers who come through from there look ten years older than they are. I feed them first." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I hear everything at breakfast." } },
  },
}
