-- The Warrior's, Craftsmen's and Tradesmen's Terraces: Sentinels, warriors, a smith with elunite,
-- the town crier, a widow waiting on news, and an apprentice who can't sit still.
-- Voices: bibles/terraces.md
-- Velinde Starsong's fate is told only as far as Thyn'tel's Classic quests tell it; nothing names what she carried.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Thyn'tel Bladeweaver: a commander of the Sentinels; keeps Velinde Starsong's belongings and her secret.
P:NPC {
  key = "thyntel", id = TODO_NPC("Thyn'tel Bladeweaver"), name = "Thyn'tel Bladeweaver",
  bible = "bibles/terraces.md", role = "soldier", tier = "quest",
  communities = { "darnassus" }, temper = { "wary", "steady" }, values = { "loyal", "dutiful", "careful" },
  notices = { "class", "soldier" },

  impression = {
    first = "Thyn'tel Bladeweaver weighs every word before she gives it away, especially about her own Sentinels. She guards the memory of a missing priestess as fiercely as any gate.",
    third = "{name} met Thyn'tel Bladeweaver, one of the commanders of the Sentinels, on the Warrior's Terrace of Darnassus.",
  },

  greetings = {
    { id = "g_watch", text = "State your business on the Terrace. The Sentinels are busy, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Sit, if you've news; stand, if you haven't." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. We lost one of ours, a priestess who was also a Sentinel, and I find I look at every priest a little longer since." },
    { id = "n_human", cat = "soldier", when = { race = "Human", class = { "WARRIOR", "PALADIN" } },
      text = "Stormwind steel on the Warrior's Terrace. Our sisters have fought beside your soldiers in Ashenvale, and some of them even speak well of it." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Over a bowstring, mostly. You have walked among outsiders longer than my Sentinels have, so I would hear it from you: are the orcs beasts, or a people?" },
      },
      choices = {
        { text = "A people. Thrall's orcs broke their chains; give them a chance.", next = "op_r1", fx = { affinity = -1, align = { honor = 1 }, opinion = { orcs = "respect" } } },
        { text = "Beasts. The Legion's blood is still in them.", next = "op_r2", fx = { affinity = 1, align = { honor = -1 }, trait = { stern = 1 }, opinion = { orcs = "hate" } } },
        { text = "Dangerous neighbours. Watch them, but don't hate them.", next = "op_r3", fx = { affinity = 1, trait = { cautious = 1 }, opinion = { orcs = "dangerous" } } },
        { text = "I fought orcs in the Second War. They've earned no trust.", next = "op_r4", fx = { affinity = 1, opinion = { orcs = "distrust" } }, when = { race = "Dwarf" } },
        { text = "My people kept them in camps. Look how that turned out.", next = "op_r5", fx = { trait = { skeptical = 1 }, opinion = { orcs = "mixed" } }, when = { race = "Human" } },
        { text = "I'd rather hear your report.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "A people who fell our forest and call it building a nation. I'll give them the same chance they give the trees." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Some of my Sentinels would cheer you for that. I fought beside orcs at Hyjal, though, so I will call them enemies and leave the word beasts to the satyrs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Spoken like a Sentinel. Watch them, count their axes, and loose only when they cross the line." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Then you and I keep the same ledger, dwarf, though yours has more pages in it than mine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r5 = {
      lines = { { id = "op_r5_default", text = "I have heard of your internment camps, and I have heard that Thrall walked out of one. Cages make poor teachers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I guard it fiercely. She is missing, and I will not let her be forgotten. Your spirits might find her where we cannot." } },
      choices = {
        { text = "Then I will help you search, Thyn'tel.", next = "BACK", reply = "Then you have my thanks, shaman, and my trust for as long as you keep looking. Velinde would be glad of any help at all.", fx = { align = { honor = 1 } } },
        { text = "Some memories should fade.", next = "BACK", reply = "Perhaps some should, but not hers, and not while I still command the Sentinels. I will remember her for both of us.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "In Ashenvale, at Astranaar and along the Barrens border, where the Horde's lumber camps push deeper every month. We don't need another hero, though, we need someone who will hold where they're told to hold." } },
      choices = {
        { text = "I'll hold where I'm told, Commander.", next = "BACK", reply = "Good, because a line that holds is worth ten that wander. Report to Astranaar and tell them I sent you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight where the Light leads me, Commander.", next = "BACK", reply = "Then pray it leads you to Astranaar, paladin, for that is where we need you most. The Warsong will be glad of a wandering paladin.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "In Ashenvale, where the Warsong push their logging camps deeper every season and our archers cannot hold the clearings alone. A warrior who stands firm in front of our bows is worth ten who chase orcs into the trees." } },
      choices = {
        { text = "I'll stand before your archers and hold.", next = "BACK", reply = "Then you will be the first warrior my archers have ever thanked. Stand firm, and they will keep the Warsong off you.", fx = { align = { order = 1 } } },
        { text = "I'll chase the orcs back to their camps.", next = "BACK", reply = "Chase them and you will find their camps are larger than you thought. Hold the clearing, and let the arrows do the chasing.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I'd trust what you saw, and I'd check it twice, since my sisters train for years to move through Ashenvale unseen. If you bring me true reports about the orcs at Splintertree, I'll use them, and I'll remember the name of whoever brought them." },
      },
      choices = {
        { text = "You'll get true reports, and nothing else.", next = "BACK", reply = "That is all I ask, and more than most rogues offer. I will check them twice anyway, but I will be grateful.", fx = { align = { honor = 1 } } },
        { text = "I'll report what helps me. You'll get the rest.", next = "BACK", reply = "Then I will learn the rest from my own scouts, and remember who held it back. That is a poor way to earn trust.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I treat everything that serves the Legion as an enemy, and I haven't yet decided whether you do. The Shadow Council lurks in Felwood and the satyrs breed in Ashenvale, so give me one reason to believe you're different and I'll carry it to my sisters." },
      },
      choices = {
        { text = "I'm no friend of the Legion. Judge me by my deeds.", next = "BACK", reply = "Then I will judge you so, warlock, and I will be watching closely. Deeds are the only proof I accept.", fx = { align = { order = 1 } } },
        { text = "I serve my own ends, Commander, not yours.", next = "BACK", reply = "Then we have nothing more to discuss, warlock, and my Sentinels will be watching you. Serve them far from Teldrassil.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_tb = {
      lines = {
        { id = "htb_default", text = "We always need bows, and we never have enough who can hold one steady while a Warsong axe is coming at them. My scouts ride the roads of Ashenvale at night; Raene Wolfrunner at Astranaar can tell you where the gaps are." },
      },
      choices = {
        { text = "I'll go to Astranaar.", next = "BACK", fx = { affinity = 1, learn = { "sentinels" } } },
        { text = "I hunt for myself, not for any army.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    watch_tb = {
      lines = {
        { id = "wtb_default", text = "Then you've seen the furbolgs come down out of the hills and the water turn wrong along the coast, and you didn't run from it. Sentinel Glynda still keeps that watch, and she'd tell you herself that she misses the ones who left it." },
      },
      choices = {
        { text = "I'll go back when I'm stronger.", next = "BACK", reply = "Good, because a watch kept by someone half-ready is worse than no watch at all. The Sentinels will be glad to see you return.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I left because one watch wasn't enough.", next = "BACK", reply = "Then you saw more than most do, and I respect you for going. Come back when the furbolgs need answering.", fx = { align = { honor = -1 } } },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Heal my patrols, carry word faster than any saber, and tell us where the Warsong loggers are cutting before the ancients wake angry. The Circle would prefer to stay above the war, but the trees do not have that choice." } },
      choices = {
        { text = "I'll serve the Sentinels in Ashenvale, wherever I'm sent.", next = "BACK", reply = "Then Elune bless you, druid, and the Sentinels will be glad of your shapes. Report to Astranaar when you are ready.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A druid serves the forest first, and not any army.", next = "BACK", reply = "The forest and the Sentinels both bleed in Ashenvale, druid. Serve whichever you like, and you will be serving both.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Frost to slow the Warsong's charge, and the discipline not to set the forest alight while doing it. One careless fire in Ashenvale does more harm than a dozen orc axes, and I've had to explain that to more than one Stormwind mage." },
      },
      choices = {
        { text = "Frost and discipline, then. I'll be careful.", next = "BACK", reply = "Careful is all I ask, mage, and the trees will thank you for it. My Sentinels will too.", fx = { align = { order = 1 } } },
        { text = "War is fire, Commander. Trees grow back.", next = "BACK", reply = "They grow back over centuries, and the Warsong are cutting them faster than that. Keep your fire away from my forest.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_ashenvale_compromise", tags = { "news" }, when = { gossip = { topic = "ashenvale", stance = "compromise" } },
          text = "The druids say you'd let the orcs take deadwood. Deadwood is how it starts, {class}, and I have walked the stumps that come after." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. The Sentinels have fought beside your kind before, and I will say that you hold a line as well as anyone I've seen." },
        { id = "h_default", text = "I am Thyn'tel Bladeweaver, and I command some of the Sentinels who guard our people. If it concerns the borders, the patrols or the war in Ashenvale, it concerns me." },
        { id = "h_velinde", tags = { "news" }, when = { questActive = TODO_QUEST("Velinde Starsong") },
          text = "Velinde Starsong? That she disappeared is common knowledge by now. As for what surrounded her leaving, it would take a good reason for me to tell you, so tell me yours." },
        { id = "h_effects", tags = { "news" }, when = { questActive = TODO_QUEST("Velinde's Effects") },
          text = "Her chest is in the Sentinels' bunkhouse, and the key I gave you opens it. Look for her journal; she wrote down every duty she ever carried out." },
        { id = "h_port", tags = { "news" }, when = { questActive = TODO_QUEST("The Barrens Port") },
          text = "Ratchet is the only port in the Barrens, and goblins run it. If Velinde took ship for the other continent, the master of their docks will have it in a ledger somewhere." },
        { id = "h_answered", tags = { "news" }, when = { questActive = TODO_QUEST("Answered Questions") },
          text = "So that is what became of Velinde. The High Priestess will be grieved; they were good friends, before. I owe you a great deal of thanks for this." },
        { id = "h_done", when = { questDone = TODO_QUEST("Answered Questions") },
          text = "We'll deal with what she left in our woods, and I bear her no ill will for it. Strange things are afoot these days, and the darkness never rests long." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue. The Sentinels have use for anyone who can walk into a Warsong camp and walk back out with something worth hearing." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Warlock. I command Sentinels, and they are watching you right now from three places you haven't found yet." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The Sentinels have need of those who can hold a line, though I will judge for myself whether you can." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The Sentinels can use you in Ashenvale, because the orcs cut the trees faster than my patrols can bury the dead, and the forest needs someone who can hear it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. The Sentinels have fought beside human mages in Ashenvale, and some of my sisters even speak well of it, though I reserve my judgement." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I weigh my words, especially about my Sentinels, so your spirits may speak freely, but I will not." },
      },
      again = {
        { id = "h_again", text = "What else? Make it worth the time; the borders of Ashenvale do not guard themselves." },
        { id = "h_again2", text = "Go on. I'll answer what I can, and keep silent on the rest, as Tyrande would wish." },
      },
      choices = {
        { text = "How do you see the orcs, Commander?", next = "op_ask" },
        { text = "Who was Velinde Starsong?", next = "velinde", when = { any = { { questActive = TODO_QUEST("Velinde Starsong") }, { questActive = TODO_QUEST("Velinde's Effects") }, { questActive = TODO_QUEST("The Barrens Port") }, { questActive = TODO_QUEST("Answered Questions") }, { questDone = TODO_QUEST("Answered Questions") } } } },
        { text = "The war in Ashenvale must weigh on you.", next = "ashenvale" },
        { text = "What does a Sentinel commander do here?", next = "duty" },
        { text = "Will you tell the High Priestess about Velinde?", next = "tell", when = { questDone = TODO_QUEST("Answered Questions") } },
        { text = "Did Velinde pray as a priestess or fight as a Sentinel?", next = "both", when = { class = "PRIEST", any = { { questActive = TODO_QUEST("Velinde Starsong") }, { questActive = TODO_QUEST("Velinde's Effects") }, { questActive = TODO_QUEST("The Barrens Port") }, { questActive = TODO_QUEST("Answered Questions") }, { questDone = TODO_QUEST("Answered Questions") } } } },
        { text = "Do the Sentinels need another bow?", next = "hunter_tb", when = { class = "HUNTER" } },
        { text = "I stood the watch at Auberdine.", next = "watch_tb", when = { origin = "nightelf_auberdine_watch" } },
        { text = "Would the Sentinels trust a rogue's scouting?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Where do the Sentinels need warriors most, Thyn'tel?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you treat every warlock as an enemy?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Where do the Sentinels need a paladin, Commander?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How can a druid best serve the Sentinels in Ashenvale?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What would you need from a mage in Ashenvale?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you guard a priestess's memory, Thyn'tel?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll let you return to your duties.", next = "END" },
      },
    },
    velinde = {
      lines = {
        { id = "ve_default", text = "A priestess, and one of us. She was sent to clear Ashenvale of demons, and at first she seemed to have Felwood's edge in hand, but her efforts faltered little by little, and one day she simply wasn't there." },
        { id = "ve_done", when = { questDone = TODO_QUEST("Answered Questions") },
          text = "A priestess, and one of us, and a friend of the High Priestess. You know how it ended better than most; I'd ask you not to speak of it loosely in the city." },
      },
      choices = {
        { text = "Did the Sentinels think she deserted?", next = "velinde2" },
        { text = "Her secrets should stay with the Sentinels.", next = "BACK", reply = "They will stay with us, as they should, until we know what became of her. I would not have her name dragged through the market.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Her people deserve the truth about her.", next = "BACK", reply = "They do, and they will have it, once I know it myself. I will not speak half a truth about one of my own.", fx = { align = { order = -1 } } },
      },
    },
    velinde2 = {
      lines = {
        { id = "v2_default", text = "No. We believed she had her own reasons for leaving and would come back when she was ready, because she had done a great deal to earn our trust. I still believe she had reasons, even if I'll never hear them now." },
      },
      choices = {
        { text = "Trust like that is rare.", next = "BACK", reply = "It is, and Velinde earned it a thousand times over. I would give it to her again, even now.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Trust like that gets Sentinels killed.", next = "BACK", reply = "Sometimes it does, and I lie awake wondering if this is one of those times. I hope you are wrong.", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
      },
    },
    ashenvale = {
      big = true,
      lines = {
        { id = "as_default", text = "The Warsong cut the forest, and we cut them, and the trees pay for both. We hold Astranaar and the roads, but every season the axes come back, and every season I sign more names for the Temple." },
      },
      choices = {
        { text = "Then drive them out for good.", next = "BACK", reply = "Every Sentinel wishes it, and every season we try. The Warsong are many, and the forest is wide.", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "warsong" } } },
        { text = "Neither side can win this. Seek a truce.", next = "BACK", reply = "A truce with the Warsong? They would cut the trees while we signed it. I have seen orcs keep peace, but never with an axe in hand.", fx = { align = { honor = -1 }, affinity = -1, learn = { "warsong" } } },
        { text = "You must need a great deal out there.", next = "ashenvale2" },
      },
    },
    ashenvale2 = {
      lines = {
        { id = "a2_default", text = "Hands, and arrows, and fewer visitors who think the war is a sightseeing trip. If you go to Astranaar, report to the Sentinels there and do what they ask, not what you think is clever." },
      },
      choices = { { text = "I'll report to them. Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    tell = {
      lines = {
        { id = "te_default", text = "I already have, at moonrise, with the other reports, because she would rather hear it from me than from the market. She said nothing for a long while, and then she asked for the next report." },
      },
      choices = {
        { text = "That was the right thing to do.", next = "BACK", reply = "I hope it was, though it did not feel right at the time. Tyrande deserves the truth before anyone else.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Some news is kinder left unsaid.", next = "BACK", reply = "Perhaps, but the High Priestess has never wanted kindness from me, only truth. I will not start keeping things from her now.", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
      },
    },
    both = {
      lines = {
        { id = "bo_default", text = "Both, and she saw no difference between them, which is how the Sisterhood has always been. She'd pray over a wounded Sentinel and then go out and find the thing that wounded her." },
      },
      choices = {
        { text = "Healing and fighting belong together.", next = "BACK", reply = "They do, and Velinde lived that truth better than anyone. Perhaps that is why I miss her so.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A healer should keep out of the fighting.", next = "BACK", reply = "Then you have never seen a priestess hold a line at Hyjal. Our healers bleed beside us, and they always have.", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
      },
    },
    duty = {
      lines = {
        { id = "du_default", text = "Assign patrols, read the reports from the borders and decide who goes where. It is less glorious than it sounds and far more ink." },
      },
      choices = {
        { text = "Someone has to do the ink.", next = "BACK", reply = "Someone does, and it is usually me, by candlelight, long after the others are asleep. The ink wins most battles in the end.", fx = { align = { order = 1 }, trait = { witty = 1 } } },
        { text = "I'd rather be on the borders.", next = "BACK", reply = "So would I, and every night I wish I were. But the borders need someone to decide who stands on them.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Reports cross my table from every border we hold. Ask, and I'll tell you what isn't sealed." } },
    background = { { id = "tp_bg", text = "I command Sentinels. I've done it a long while, and I'll do it until someone better comes along." } },
    advice = { { id = "tp_ad", text = "Report what you saw, not what you think it meant. I can do the thinking." } },
    sentinels = { { id = "tp_sentinels", text = "We are the walls of Darnassus and the eyes of Ashenvale. Every one of us is needed, and every one we lose is felt." } },
    warsong = { { id = "tp_warsong", text = "Orcs who cut our forest and call it lumber. We answer them in Ashenvale, every season." } },
    thrall = {
      { id = "tp_thrall", text = "Thrall's orcs fought at Hyjal, and I fought beside them. That's why I don't hate them, and it's also why I know how dangerous they are." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "Your warchief stood at Hyjal, and I respected him there. Tell him his Warsong are making that harder every season." },
    },
    centaur = { { id = "tp_centaur", text = "The centaur are a southern problem, but my patrols have met them on the edge of the Barrens. They don't give ground, so neither do we." } },
    blackfathom = { { id = "tp_blackfathom", text = "Blackfathom Deeps is a drowned temple with cultists and nagas in it, and it's on my map in red. If you're going in, go with four others you trust." } },
    burning_legion = { { id = "tp_burning_legion", text = "My Sentinels fought the Legion at Hyjal, and many didn't come back. If the demons return, we'll stand again, and hope it's enough." } },
    onyxia = { { id = "tp_onyxia", text = "A black dragon south of Theramore, according to the humans. I'm glad it's their swamp and not our forest." } },
    _none = { { id = "tp_none", text = "That isn't a Sentinel matter. Ask in the Temple of the Moon or the Enclave." } },
  },
}

-- Elanaria: tests young warriors on the Warrior's Terrace (Vorlus Vilehoof, the Shade of Elura, elunite).
P:NPC {
  key = "elanaria", id = TODO_NPC("Elanaria"), name = "Elanaria",
  bible = "bibles/terraces.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "proud", "fierce" }, values = { "brave", "dutiful" },
  notices = { "class", "greenness" },

  impression = {
    first = "Elanaria says a warrior must first show resolve, and she clearly means to see it for herself. She talks about Teldrassil's moonwells the way a soldier talks about a home she is sworn to keep.",
    third = "{name} met Elanaria, who tests the young warriors of the Warrior's Terrace before she will teach them.",
  },

  greetings = {
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "I bid you greetings, warrior. Your name has been heard on the Terrace." },
    { id = "g_other", text = "This is the Warrior's Terrace. If you've come to watch, watch from over there." },
  },

  notice = {
    { id = "n_dwarf", cat = "class", when = { race = "Dwarf", class = "WARRIOR" },
      text = "A dwarf on the Warrior's Terrace, square as a doorstep. My students will learn something just from trying to knock you over." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest on the Warrior's Terrace. Good; we break things here, and somebody has to mend them." },
    { id = "n_green", cat = "greenness", when = { class = "WARRIOR", maxLevel = 15 },
      text = "You're young in the art yet, and it shows in your feet. Plant them, and the rest will follow." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I will trust only one with resolve. Your spirits must not trouble the waters. Prove yourself, and you will be welcome." } },
      choices = {
        { text = "I will prove my resolve, Elanaria.", next = "BACK", reply = "Then prove it in Ashenvale, shaman, and come back with your spirits and your resolve both intact. I will be waiting.", fx = { align = { honor = 1 } } },
        { text = "My spirits go where they please.", next = "BACK", reply = "Then they will not go into my training yard, and neither will you. Resolve begins with mastering what you carry.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "In Ashenvale, more than once, and I learned that a warrior who knows a healer is behind her fights twice as boldly. Stand your ground when the fighting starts, though, because a healer who runs leaves everyone exposed." } },
      choices = {
        { text = "I'll stand my ground with the wounded, whatever comes.", next = "BACK", reply = "Then the warriors will fight twice as boldly for you, and so will I. Stand with them, priest, and they will never forget it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the fight turns, I'll save myself first.", next = "BACK", reply = "Then you will live, and the wounded will not, and you will remember that longer than any fight. I would not want to carry it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Of course, and harder, because your order claims to fight and heal both, and a claim like that wants proving. Go and fight in Ashenvale for a season, and if you come back with your oaths intact, we'll talk about respect." } },
      choices = {
        { text = "Then I'll prove it in Ashenvale.", next = "BACK", reply = "Good, and I will be glad to hear of it when you do. Ashenvale is where every claim is tested.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I've nothing to prove to you, Elanaria.", next = "BACK", reply = "Not to me, perhaps, but the Warsong will ask the same question. I would rather you had the answer ready.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The same as it means to a warrior: holding when every part of you wants to run. A hunter whose companion falls must still loose the next arrow, and I have seen Sentinels do it in Ashenvale with tears on their faces." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has resolve of its own; I can see it in how it stands its ground. Be worthy of it, {class}, because it will stand for you to the end." },
      },
      choices = {
        { text = "I'll hold my ground, whatever falls beside me.", next = "BACK", reply = "That is the warrior's heart, hunter, and you have it. Your companion will be proud of you.", fx = { align = { honor = 1 } } },
        { text = "If the fight's lost, I'll run and fight another day.", next = "BACK", reply = "Sometimes that is wisdom, and sometimes it is a death sentence for the one you leave. Learn to tell the difference.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "To stand your ground once the shadows are gone, because they always go eventually. I've seen rogues die in Ashenvale because they knew everything about the first strike and nothing at all about the tenth." },
      },
      choices = {
        { text = "Then teach me the tenth. I'll stand my ground.", next = "BACK", reply = "Then you will survive what most rogues do not. Come back, and we will begin.", fx = { align = { honor = 1 } } },
        { text = "If I strike well enough, there's no tenth.", next = "BACK", reply = "There is always a tenth, rogue, and the ones who believe otherwise are buried in Ashenvale. Learn it anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Close enough that the warrior in front of you can hear you shout, and no closer. Trust your shield, which is the warrior, and don't leave her to hold the line alone while you cast from the treeline." },
      },
      choices = {
        { text = "Close enough to shout. I'll trust the line.", next = "BACK", reply = "Good, and your warrior will thank you, if they are wise. A mage who trusts the line is a mage who lives.", fx = { align = { honor = 1 } } },
        { text = "Far back is where I'm useful. I'll stay there.", next = "BACK", reply = "Far back is safe until the line breaks, mage. Then you will need to know how to stand.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    weapons = {
      lines = {
        { id = "wp_default", text = "The Sentinels favour the glaive and the bow, but on the Terrace we teach sword, axe and shield, because a warrior must fight in a doorway as well as a glade. Master one, and then learn enough of the others to know what is coming at you." },
      },
      choices = {
        { text = "Shield first. Someone has to hold the line.", next = "weapons2", fx = { align = { order = 1 } } },
        { text = "Two blades. End it before it starts.", next = "weapons2", fx = { align = { order = -1 } } },
        { text = "Why not the glaive?", next = "weapons2" },
      },
    },
    weapons2 = {
      lines = {
        { id = "wp2_default", text = "Whatever you choose, take it to Mathiel and let him see you hold it; he can tell more from your grip than I can from your swing. And keep it clean, because I'll be checking." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf_e = {
      lines = {
        { id = "de_default", text = "Of course I will, because Ironforge's halls are not my forest. Your mountain makes good soldiers, I'm told, steady in a shield wall and terrible to move, but a moonwell isn't a mine, and a satyr won't fight you like a trogg." },
        { id = "de_ward", when = { origin = "dwarf_military_ward" },
          text = "Raised in the barracks, were you? It shows in how you stand at attention when I'm not even looking at you, and I mean that as praise, mostly." },
      },
      choices = {
        { text = "Test me where you like. I'll hold.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "A trogg's a trogg. I'll manage.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    gnome_e = {
      lines = {
        { id = "ge_default", text = "I know they do; the Sentinels told me how your fighters held the rear while their whole people fled their city. What you lack in reach you'll have to make up in nerve, and from what I saw, your people have plenty of nerve." },
        { id = "ge_rear", when = { origin = "gnome_rearguard" },
          text = "You were in the rearguard out of Gnomeregan, weren't you? Then I've nothing to teach you about resolve, only about trees, and trees are easier." },
      },
      choices = {
        { text = "Nerve and a good shield have kept me breathing so far.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Footing, mostly, because a bear that charges wildly is a bear that gets surrounded, and the Gnarlpine have taught that lesson to more than one of you. Resolve is the same in any shape, so stand where you are placed and hold until it is over." } },
      choices = {
        { text = "I'll hold the line where I'm placed, as a warrior would.", next = "BACK", reply = "Then the Gnarlpine will learn to fear you, druid. Footing is everything for a bear.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A bear fights best when it follows its own instincts.", next = "BACK", reply = "It does, until it is surrounded, and then its instincts tell it nothing useful. Learn to hold, even as a bear.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Anyone can, though most warlocks I've met let something else do the standing while they hide behind it. Stand your own ground once, with no servant beside you, and I'll believe your resolve is your own." },
      },
      choices = {
        { text = "I'll stand alone and show you.", next = "BACK", reply = "Then I will watch, warlock, and I will be glad to be proven wrong. Most of your kind never even try.", fx = { align = { honor = 1 } } },
        { text = "Commanding a demon takes resolve enough.", next = "BACK", reply = "It does, I will grant you that much, but it is not the same as standing. Show me the difference, and I will believe you.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I'd sooner see warriors on this Terrace, but a good healer has saved more battles than a good blade, and I've seen it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Now there's a fighter I can respect, {class}, though I'd want to see how you swing before I said so twice." },
        { id = "h_default", text = "I am Elanaria, and I help shape the warriors of Darnassus. There is more to the profession than swinging a blade, and I find out quickly who knows it." },
        { id = "h_elanaria", tags = { "news" }, when = { questActive = TODO_QUEST("Elanaria") },
          text = "Your name rings loudly in Darnassus, for you show promise. We shall soon see whether you have the will to follow the warrior's path, though." },
        { id = "h_vorlus", tags = { "news" }, when = { questActive = TODO_QUEST("Vorlus Vilehoof") },
          text = "The satyr Vorlus Vilehoof splashes in our moonwell southeast of the Ban'ethil Barrow Den, fouling its water. The path to it is well hidden, so stay alert, and bring me his horn." },
        { id = "h_elura", tags = { "news" }, when = { questActive = TODO_QUEST("The Shade of Elura") },
          text = "Elunite lies scattered on the sea floor near the Auberdine lighthouse, where a ship broke on the rocks long ago. Its captain cursed herself to guard the cargo forever, so give her peace, and bring the ore to me." },
        { id = "h_elura_done", when = { questDone = TODO_QUEST("The Shade of Elura") },
          text = "You gave the Shade of Elura her rest, and Mathiel has the elunite. A warrior's weapon, made from a blessed metal, by your own hand's effort; wield it well." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You'd last in a fight, rogue, but only if you struck first. I train warriors to last when they don't." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Mages always stand too far back, and then they're surprised when something circles round to reach them. Which way are you going to stand, mage?" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter on the Warrior's Terrace. You'll find no stances to learn here, but resolve is the same in any profession." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I don't train your kind, but I've seen a druid in bear shape hold a line I'd have been proud of, so you're welcome to watch." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock on the Warrior's Terrace. Resolve is the first thing I ask of anyone, and I'd like to know whether yours is your own or borrowed." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Show me resolve first, for Teldrassil's moonwells are home to me, and I guard them as my mothers guarded the wells of old." },
      },
      again = {
        { id = "h_again", text = "What else, warrior? Speak quickly; the Terrace doesn't sit still." },
        { id = "h_again2", text = "Go on, warrior; I have time for one more question, and Elune knows I have heard most of them." },
      },
      choices = {
        { text = "What makes a warrior, to you?", next = "warrior" },
        { text = "Why does a satyr matter so much?", next = "vorlus", when = { any = { { questActive = TODO_QUEST("Vorlus Vilehoof") }, { questDone = TODO_QUEST("Vorlus Vilehoof") } } } },
        { text = "Tell me about the elunite wreck.", next = "elura", when = { any = { { questActive = TODO_QUEST("The Shade of Elura") }, { questDone = TODO_QUEST("The Shade of Elura") } } } },
        { text = "The Sentinels must fight differently from you.", next = "sentinels" },
        { text = "Test me, then. I'm ready.", next = "test", when = { class = "WARRIOR" } },
        { text = "Which weapon should I master?", next = "weapons", when = { class = "WARRIOR" } },
        { text = "Ironforge trained me. Will you test me anyway?", next = "dwarf_e", when = { race = "Dwarf", class = "WARRIOR" } },
        { text = "Gnomes fight too, you know.", next = "gnome_e", when = { race = "Gnome", class = "WARRIOR" } },
        { text = "Is there anything a rogue could learn from a warrior?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Where should a mage stand in a fight?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What does resolve mean to a hunter, Elanaria?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Have you fought beside priests, Elanaria?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you test a paladin as you test your warriors?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could a druid in bear shape learn anything from your warriors?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can a warlock show resolve, Elanaria?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Will you trust a shaman near the moonwells, Elanaria?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to the Terrace.", next = "END" },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "Resolve, first, and then strength, and then skill, and many young ones learn them backwards. A warrior is the one who stays in the fight after everyone else has a reason to leave." },
      },
      choices = {
        { text = "Staying is honorable, whatever it costs.", next = "BACK", reply = "It is, and it is the hardest honour to keep. You will see what I mean the first time you stay.", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "A wise warrior knows when to withdraw.", next = "BACK", reply = "They do, and they live to fight again, if they choose the moment well. But most who withdraw do it too early.", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
        { text = "And what about the ones who leave?", next = "warrior2" },
      },
    },
    warrior2 = {
      lines = {
        { id = "w2_default", text = "Some live to fight again, and I don't despise them. But the ones I train are the ones who stand in front of the healers, so they had better not be the first to run." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    vorlus = {
      lines = {
        { id = "vo_default", text = "Because the moonwells are holy, and a satyr in one is a filth in our goddess's cup. Young warriors eager to keep Teldrassil free of corruption are what this tree needs most." },
      },
      choices = {
        { text = "Then it was well cleansed.", next = "BACK", reply = "It was, and the moonwell is clean again. You did the goddess a service, and I will remember it.", fx = { align = { light = 1 }, learn = { "satyrs" } } },
        { text = "A wall would have saved the trouble.", next = "BACK", reply = "A wall around a moonwell would make it no longer a moonwell. Better to cleanse it, and keep it open to Elune.", fx = { align = { light = -1 }, trait = { witty = 1 }, learn = { "satyrs" } } },
      },
    },
    elura = {
      lines = {
        { id = "el_default", text = "A ship carrying elunite broke on the rocks below the Auberdine lighthouse, and the crates lie on the sea floor still. Elunite is blessed by Elune, and Mathiel the smith would sooner work it than any other metal." },
      },
      choices = {
        { text = "And there's a captain who guards it, I take it.", next = "elura2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elura2 = {
      lines = {
        { id = "e2_default", text = "Elura cursed herself to protect her shipment for all time, and she has. Defeating her is a kindness, though she won't thank you for it until it's over." },
      },
      choices = {
        { text = "Loyal past death. I respect that.", next = "BACK", reply = "So do I, in a way, though I would not tell her so. Loyalty past death is a terrible thing to watch.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Her oath should have died with her.", next = "BACK", reply = "It should have, and that is the tragedy of it. Free her, and she will finally rest.", fx = { align = { order = -1 } } },
      },
    },
    test = {
      lines = {
        { id = "ts_default", text = "Everyone says that, and half of them mean it. The test isn't here on the Terrace; it's out in the forest, when you're tired and alone and nobody would know if you turned back." },
        { id = "ts_done", when = { questDone = TODO_QUEST("Vorlus Vilehoof") },
          text = "You've already passed one, at the moonwell. The next will be harder, because they always are, and that is the point." },
      },
      choices = {
        { text = "Then I'll never turn back.", next = "BACK", reply = "Then you will be either very great or very dead, warrior. I hope you choose your battles well.", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I'll turn back when it's wise, and live.", next = "BACK", reply = "Then you will live long, and that is no small thing. A wise warrior is still a warrior.", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },
    sentinels = {
      lines = {
        { id = "se_default", text = "The Sentinels fight with glaive and bow, from the trees, and they're better at it than anyone alive. We on the Terrace are for when the enemy is close enough to smell." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Terrace hears what the patrols bring back. Ask, and I'll tell you if it's worth repeating." } },
    background = { { id = "tp_bg", text = "I train warriors and test the ones who think they're ready. Most aren't, yet." } },
    advice = { { id = "tp_ad", text = "Plant your feet before you swing. Everything else comes from the ground up." } },
    centaur = { { id = "tp_centaur", text = "Centaur hit like a charging saber and keep coming. Brace your shield and let the earth carry their weight, not your arm." } },
    blackfathom = { { id = "tp_blackfathom", text = "That's where young warriors learn what they're made of, in the drowned temple. Some don't like the answer." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "A troll arena in Stranglethorn, where people fight for gold and goblins bet on them. I'd rather fight for something." } },
    onyxia = { { id = "tp_onyxia", text = "A dragon. I've told my students that if they're going after one, they should come back first and tell me, so I can say goodbye properly." } },
    _none = { { id = "tp_none", text = "That isn't a warrior's concern. Ask elsewhere, perhaps at the Temple of the Moon." } },
  },
}

-- Mathiel: smith of the Warrior's Terrace; works elunite; corresponds with Furen Longbeard and Klockmort Spannerspan.
P:NPC {
  key = "mathiel", id = TODO_NPC("Mathiel"), name = "Mathiel",
  bible = "bibles/terraces.md", role = "blacksmith", tier = "quest",
  communities = { "darnassus" }, temper = { "warm", "eager" }, values = { "curious", "generous", "devout" },
  notices = { "kit", "craft" },

  impression = {
    first = "Mathiel calls working elunite an honor and means it, and he lights up at the mention of a dwarven colleague's new technique. He seems to have friends in every forge in the Alliance.",
    third = "{name} met Mathiel, the smith of the Warrior's Terrace who works Elune-blessed elunite.",
  },

  greetings = {
    { id = "g_smith", text = "Come in, come in! Mind the coals; they bite harder than they look." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Your gear holding up? Let me look at the edges." },
  },

  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "By Elune, what have you been hitting with that? Leave it with me before it leaves you." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A fellow smith! Tell me, does your forge run hot or slow? Furen in Stormwind swears by slow, and I'm half convinced." },
    { id = "n_dwarf", cat = "craft", when = { race = "Dwarf" },
      text = "A dwarf at my forge! Please, have a look and tell me honestly where I'm going wrong. Furen says I fold too often, but he's polite about it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I do, and gladly. A dwarven colleague taught me a new technique. Your spirits might teach me another." } },
      choices = {
        { text = "Shared knowledge is a fine thing, Mathiel.", next = "BACK", reply = "It is, and it makes the work more joyful too. Your spirits are welcome at my anvil any time.", fx = { align = { order = 1 } } },
        { text = "Keep your secrets. Elunite is yours.", next = "BACK", reply = "Kind of you to say so, but Elune does not mind sharing her gifts. I would rather the world had good weapons.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Over the elunite especially, because it's a blessed stone and I'd hate to waste it on a careless strike. My friends in Ironforge laugh at me for it, but they sing to their own forges, so they've no room to talk." } },
      choices = {
        { text = "A blessing on good work is never wasted.", next = "BACK", reply = "That is what my friends in Ironforge say too, and I have come round to it. The stone sings brighter for a prayer.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A good strike matters more than any prayer, Mathiel.", next = "BACK", reply = "A good strike matters a great deal, priest, but the stone is blessed, and it remembers. I would rather have both.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Mend it, mostly, and dress the face where it's been knocked about, though I'd never change its shape. A weapon that's been carried in an oath deserves respect, whatever forge it came from." } },
      choices = {
        { text = "It does, and thank you for treating it so.", next = "BACK", reply = "You are welcome, and the hammer will thank you too. A weapon that has seen service deserves respect.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It's only a hammer, so make it strike harder.", next = "BACK", reply = "Only a hammer? It has seen more battles than either of us. I will make it strike harder, but I will not dishonour it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It could, though it's too precious to leave in a Gnarlpine, and the priestesses would have words with me if I tried. A dwarven friend in Ironforge swears by rifle shot instead, and I'll admit his methods interest me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has been sniffing at my anvil since you came in, and I think it smells the coal. Tell it there's nothing here to eat but iron." },
      },
      choices = {
        { text = "Elunite is sacred. Keep it for blades of honor.", next = "BACK", reply = "I will, and the priestesses will be glad to hear it. Elunite belongs on a blade that is worthy of it.", fx = { align = { light = 1 } } },
        { text = "Sacred or not, a better arrow saves lives.", next = "BACK", reply = "Perhaps it does, and I cannot argue with that. But the priestesses would have my hide.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I don't mind the work, and the coin is good, but I'll admit the humming kept me up. Steel is honest, and I like my anvil honest, so bring me your armor and keep your enchanted things for someone braver." },
      },
      choices = {
        { text = "Steel it is, then, and I'll keep it oiled.", next = "BACK", reply = "Thank you, and keep it out of the damp too. Steel lasts far longer when it is loved.", fx = { align = { order = 1 } } },
        { text = "Your anvil could stand a little magic, smith.", next = "BACK", reply = "Perhaps it could, but my sleep could not. I will leave the magic to you and the steel to me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because the last time anything with that stink came near a forge in this city, the coals went out and wouldn't light again for a week. That was just a rumour, perhaps, but I can't afford to lose a week of work on a rumour." },
      },
      choices = {
        { text = "It can wait outside. I won't cost you a week.", next = "BACK", reply = "Thank you, and the coals thank you too. A week without fire is a long time for a smith.", fx = { align = { order = 1 } } },
        { text = "It goes where I go, smith.", next = "BACK", reply = "Then you will both go somewhere else, warlock, for my forge does not like it. I will not risk the coals.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_m = {
      lines = {
        { id = "gm_default", text = "Know him? I write to him every month, and he writes back in a hand so small I need a lens to read it! He's in Ironforge, and every letter describes his workshop in such detail that my heart aches that I can't go and see it myself." },
      },
      choices = {
        { text = "None of us can. Not yet.", next = "BACK", fx = { affinity = 2, learn = { "gnomeregan" } } },
        { text = "Tell him a gnome said hello.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    warrior_m = {
      lines = {
        { id = "wm_default", text = "Hold an edge longer than steel and sing a little when it's swung, if you ask the Terrace, though I've never heard it myself. Mostly it reminds the one holding it whose blessing they carry, which matters more than the metal." },
      },
      choices = {
        { text = "A blade's a blade. The arm matters.", next = "BACK", reply = "It does, but a good blade makes a good arm better. That is why I make them.", fx = { align = { light = -1 } } },
        { text = "I'll carry it with that in mind.", next = "BACK", reply = "Good, and it will serve you well for it. Listen for the singing, and tell me if you ever hear it.", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some of the older druids frown at the forge smoke, because they say the tree feels the heat in its branches. I work elunite as Elune's gift and I waste none of it, but I'd be glad to hear a druid tell me whether they're right." } },
      choices = {
        { text = "The elders are right, and the forge should move off the tree.", next = "BACK", reply = "Perhaps they are, and I have thought of moving it. But the work is easier here, and the tree has not complained yet.", fx = { align = { order = 1 } } },
        { text = "Your forge honours Elune's gift, and the tree can bear it.", next = "BACK", reply = "Thank you, druid, and I hope you are right. I am careful with the fire, and I always have been.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! I always say a little prayer to Elune over my best work, so I like to think we're in the same line of business." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Oh, let me see your hammer, because I've only seen Silver Hand work in drawings, and I've wanted to look at the real thing for years." },
        { id = "h_default", text = "I'm Mathiel, a smith of the Terrace, and I'll mend anything the Sentinels or the adventurers bring me. When someone brings me elunite I work that too, and every repair puts a little more toward an anvil of my own, so I'm grateful for the work." },
        { id = "h_elunite", tags = { "news" }, when = { questActive = TODO_QUEST("Smith Mathiel") },
          text = "Elunite ore! This is a fine metal to work, for it's blessed by Elune herself. It would be an honor to make you a weapon of it, so wait here while I work." },
        { id = "h_weapons", when = { questActive = TODO_QUEST("Weapons of Elunite") },
          text = "Here they are, the weapons I made from your elunite. Take whichever suits you; working that metal is both an honor and a pleasure, and I thank you for it." },
        { id = "h_furen", tags = { "news" }, when = { questActive = TODO_QUEST("Mathiel") },
          text = "Notes from Furen Longbeard, all the way from Stormwind? And stained with ale, so I know they're genuine. My dwarven colleague has made quite a discovery, spelling aside. It'll be an honor to try his methods." },
        { id = "h_shells", tags = { "news" }, when = { questActive = TODO_QUEST("Sunscorched Shells") },
          text = "The Highperch wyverns in Thousand Needles lay eggs with shells baked hard by the sun. Gather me enough from beneath their nests and I'll make an extra piece of armor for you." },
        { id = "h_armor", when = { questDone = TODO_QUEST("Mathiel's Armor") },
          text = "How's the armor wearing? Furen's techniques meshed beautifully with mine, and I've written to tell him so, at some length." },
        { id = "h_klock", tags = { "news" }, when = { questActive = TODO_QUEST("Klockmort's Essentials") },
          text = "Klockmort Spannerspan needs help in Gnomeregan, and I can't leave the forge. My heart aches for my friend, so if you go in my place, I'll be in your debt." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "I've mended a mage's staff once, and it hummed the whole time I worked on it. I'd rather you didn't bring that one back." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I'll repair your gear, warlock, because coin is coin and I need an anvil of my own. But tell your servant to stay outside the forge." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Elunite holds an edge like nothing else, and I've always wondered how it would sit on an arrowhead." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You won't need much from my forge, I suppose, but buckles snap on bears as easily as on anyone, so bring them to me when they do." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and a dwarf! I have friends in every forge, even Ironforge's, so tell me, do your fire spirits enjoy elunite?" },
      },
      again = {
        { id = "h_again", text = "Ask on, then, while the elunite cools; it takes its time and so may you." },
        { id = "h_again2", text = "Ask away, friend; the iron's still heating." },
      },
      choices = {
        { text = "Can you repair my gear?", next = "BUSINESS" },
        { text = "What's special about elunite?", next = "elunite" },
        { text = "Do other smiths share their secrets with you?", next = "friends" },
        { text = "You don't have your own anvil?", next = "anvil" },
        { text = "What did Furen's notes teach you?", next = "furen", when = { profession = "Blacksmithing" } },
        { text = "Do you know Klockmort Spannerspan?", next = "gnome_m", when = { race = "Gnome" } },
        { text = "What would elunite do for a warrior's blade?", next = "warrior_m", when = { class = "WARRIOR" } },
        { text = "Do you mind working on a mage's gear?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could elunite make a better arrowhead, Mathiel?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why must my servant stay outside the forge?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you really pray over your smithing, Mathiel?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What would you do to a paladin's hammer, Mathiel?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does a smith's work trouble the Circle, Mathiel?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you work elunite with dwarven methods, Mathiel?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck at the forge.", next = "END" },
      },
    },
    elunite = {
      big = true,
      lines = {
        { id = "eu_default", text = "It's blessed by Elune, and you can feel it under the hammer; it rings clear where iron would grumble. Miners can't use it in their crafts and most smiths never see it, so a piece of elunite is a gift." },
      },
      choices = {
        { text = "A blessed weapon should only fight evil.", next = "BACK", reply = "That is the priestesses' view, and I will not argue it. Elune does not bless a blade for cruelty.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A good weapon is a good weapon.", next = "BACK", reply = "It is, but some are better than others, and elunite is the best. Respect it, and it will respect you.", fx = { align = { light = -1 } } },
        { text = "Where does it come from?", next = "elunite2" },
      },
    },
    elunite2 = {
      lines = {
        { id = "e2_default", text = "The only crates I've ever had came off a wreck near the Auberdine lighthouse, where Elanaria sends her young warriors. Where it was mined before that, nobody's ever told me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    friends = {
      lines = {
        { id = "fr_default", text = "Furen Longbeard in Stormwind's Dwarven District, and Klockmort Spannerspan in Tinker Town, and both write better letters than I do. Smiths share secrets more than you'd think, as long as nobody tells the guilds." },
      },
      choices = {
        { text = "Knowledge should be shared freely.", next = "BACK", reply = "It should, and that is what Furen and Klockmort and I have always believed. The world is better for good smiths.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Guild secrets exist for a reason.", next = "BACK", reply = "They do, and I keep a few of my own. But the best tricks I know came from friends.", fx = { align = { order = 1 } } },
        { text = "What's Klockmort working on?", next = "klock" },
      },
    },
    klock = {
      lines = {
        { id = "kl_default", text = "Something in Gnomeregan, poor fellow, which is full of mad gnomes and worse now. He says it's essential and dangerous, and I believe both." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },
    furen = {
      lines = {
        { id = "fu_default", text = "To let the fire do more of the work and the hammer less, which goes against everything I was taught. Night elf smiths fold and fold; dwarves trust the heat, and his armor came out tougher than mine." },
      },
      choices = {
        { text = "The old ways exist for a reason.", next = "BACK", reply = "They do, and I respect them. But the new way gave me a blade I could not have made the old way.", fx = { align = { order = 1 } } },
        { text = "Try the new way. It worked.", next = "BACK", reply = "I did, and it worked better than I expected. Furen will never let me hear the end of it.", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    anvil = {
      lines = {
        { id = "an_default", text = "Not yet! I borrow time at the Terrace's forge and save every coin the repairs bring in. One day I'll have my own, and I'll name it, and nobody will be allowed to laugh." },
      },
      choices = {
        { text = "I hope you get it soon.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "What would you name it?", next = "anvil2" },
      },
    },
    anvil2 = {
      lines = {
        { id = "a2_default", text = "I haven't decided, and I've been deciding for years. Elanaria suggests something martial; I'm leaning toward something kind, since it'll be hit all day." },
      },
      choices = {
        { text = "Something martial. It's an anvil.", next = "BACK", reply = "Martial it is, then, and Elanaria will be pleased. Perhaps something to do with Hyjal.", fx = { align = { honor = 1 }, trait = { witty = 1 } } },
        { text = "Something kind. It deserves it.", next = "BACK", reply = "Kind, then, and I will think of it whenever I strike. Perhaps the anvil will be glad of it.", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A smith hears all sorts while the iron heats. Ask, and I'll tell you what came through the forge." } },
    background = { { id = "tp_bg", text = "I'm a smith. I mend, I make, and I write long letters to dwarves about folding steel." } },
    advice = { { id = "tp_ad", text = "Have your gear seen to before it breaks, not after. It's cheaper, and you'll still be alive." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Klockmort's old home, overrun now. He writes about it as if it were a friend who'd fallen ill." } },
    magni = {
      { id = "tp_magni", text = "King Magni writes back to me himself, sometimes, when his smiths are busy. He has opinions on night elf steel, and most of them are unkind." },
      { id = "tp_magni2", when = { race = "Dwarf" }, text = "Your king answered my letter on folding steel, and he signed it himself. I've framed it, and I won't tell you what it says." },
    },
    dark_iron = { { id = "tp_dark_iron", text = "The dwarven smiths talk of the Dark Iron forges under Blackrock with a hate that's almost envy. I'd give a great deal to see one, from a long way off." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "A Dark Iron city under the mountain, the dwarves say, with forges hotter than any above ground. Bring me a piece of their steel and I'll study it for a month." } },
    thrall = { { id = "tp_thrall", text = "The orcs' warchief carries a hammer that's older than his people's arrival here. I'd like to see how it was made, though I doubt he'd lend it." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend, for I'm only a smith, and Elune gave me hands for the anvil rather than for lore." } },
  },
}

-- Arias'ta Bladesinger: warrior trainer on the Warrior's Terrace; won't teach those without the warrior's spirit.
P:NPC {
  key = "ariasta", id = TODO_NPC("Arias'ta Bladesinger"), name = "Arias'ta Bladesinger",
  title = "Warrior Trainer",
  bible = "bibles/terraces.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "proud", "formal" }, values = { "proud", "dutiful" },
  notices = { "class" },

  impression = {
    first = "Arias'ta Bladesinger can apparently see the warrior's spirit in a person, or its absence, at a glance. She is formal, unhurried and entirely sure of herself.",
    third = "{name} met Arias'ta Bladesinger, a warrior trainer of the Warrior's Terrace.",
  },

  greetings = {
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "You're favoring your left leg. Do you seek instruction in the art of war, or only somewhere to sit down?" },
    { id = "g_other", text = "I do not see the warrior's spirit in you, child. Still, you may ask what you came to ask." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR", minLevel = 20 },
      text = "There it is, the spirit I spoke of, grown since I last saw you. You've been knocked down and stood up again; I can see it in how you hold your shoulders." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. I have nothing to teach you, but I've owed my life to your kind more than once, so stay as long as you like." },
  },

  start = "hello",
  nodes = {
    xpt_ariasta = {
      big = true,
      lines = { { id = "xpt_ariasta_default", text = "That they will be trusted to hold, and that no one will thank them for it, because a warrior who holds well is only noticed when they fall. Tell your companion that I said they are seen, and that it matters." } },
      choices = {
        { text = "I'll thank them, then. They've earned it every time.", next = "BACK", reply = "Then you are rarer than you know, and they will remember it. A word of thanks goes a long way on a long watch.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Holding is a warrior's work. Thanks won't change that.", next = "BACK", reply = "It is, and you have the right of it. Still, a warrior is a person too, and persons need thanks.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I can, and yours is unusual. Spirits walk with you, and they shape you. Be careful they do not lead." } },
      choices = {
        { text = "I will lead my spirits, not follow them.", next = "BACK", reply = "Good, because a spirit that leads is a spirit that will one day lead you astray. Master it, and it will serve you well.", fx = { align = { honor = 1 } } },
        { text = "My spirits lead well. I trust them.", next = "BACK", reply = "Then I hope they always lead well, shaman. But a warrior must know where they are going, even with guides.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The spirit is the will to stand when standing is hardest, and I have seen priestesses stand at Hyjal when the warriors around them fell. A blade has nothing to do with it, though the young ones never believe me." } },
      choices = {
        { text = "Then I'll stand when standing is hardest.", next = "BACK", reply = "Then you have a warrior's spirit in a priest's robe, and I would stand beside you gladly. Come back when you need training.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A healer's place is behind the line, not on it.", next = "BACK", reply = "Your place is wherever the dying are, and sometimes that is the line. I have seen priestesses hold it when no one else could.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I see the will, which is the beginning of it, and I see an oath that you lean on, which is either your strength or your crutch. Fight once without leaning on it, and you'll learn which." } },
      choices = {
        { text = "My oath is my strength, and I won't set it aside.", next = "BACK", reply = "Then it will serve you well, until the day it is tested. I hope it holds when that day comes.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Perhaps you're right, and I'll test myself without it.", next = "BACK", reply = "That is braver than most paladins would dare. Come back and tell me what you learn.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some of it, perhaps, for you do not flinch when I look at you, and most do. But your spirit lives in the bow and in your bond with the wild, and that is a different strength, though no lesser one." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} carries a warrior's spirit, I think, more than you do. Do not take offense, for that is high praise from me." },
      },
      choices = {
        { text = "My beast and I trust each other. I need nothing else.", next = "BACK", reply = "Then you are strong already, hunter, and I will not try to change that. Your beast is your spirit.", fx = { align = { light = 1 } } },
        { text = "Strength is strength. I'll take it where I find it.", next = "BACK", reply = "You will, I am sure, but strength found in others leaves when they do. Find some of your own too.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Spirit is the will to stand when you'd rather run, and I've seen it in a rogue or two. You've chosen to fight from the dark, and that's your path, but I'd have you remember that hiding isn't the same as running." },
      },
      choices = {
        { text = "I'll remember it. I won't run.", next = "BACK", reply = "Good, then you have more spirit than you know. I will be glad to train you.", fx = { align = { honor = 1 } } },
        { text = "Running keeps me alive. Spirit doesn't.", next = "BACK", reply = "Running keeps you alive until it does not, and then only spirit is left. I hope you never need to learn it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I think you've borrowed courage from something that will want it back with interest. My students earn their strength with every blow, and you've signed a contract for yours, which is a very different thing." },
      },
      choices = {
        { text = "Then I'll earn mine too, one bruise at a time.", next = "BACK", reply = "Then you will be the first warlock I have ever trained, and I will train you gladly. Come back tomorrow.", fx = { align = { honor = 1 } } },
        { text = "Borrowed strength still wins, Bladesinger.", next = "BACK", reply = "It wins until it is called back, warlock, and then you will stand alone. I would rather you were ready.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stances = {
      lines = {
        { id = "st_default", text = "Battle, to learn the blade; defense, to learn the ground; and later, for those who live long enough to need it, the berserker's way, which I teach last and least willingly. Each one is a different question about what you're willing to lose." },
      },
      choices = {
        { text = "The berserker's way, when I'm ready.", next = "stances2", fx = { align = { order = -1 } } },
        { text = "Defense. A wall teaches patience.", next = "stances2", fx = { align = { order = 1 } } },
        { text = "Why least willingly?", next = "stances2" },
      },
    },
    stances2 = {
      lines = {
        { id = "st2_default", text = "Because a berserker gives up his guard to strike harder, and the young ones like that far too much. Learn to stand first; then, if you still want to throw your shield away, I'll show you how to do it properly." },
      },
      choices = { { text = "I'll learn to stand first.", next = "BACK", fx = { affinity = 1 } } },
    },
    guard_a = {
      lines = {
        { id = "ga_default", text = "Your city guard taught you to stand on a bridge and keep drunks off it, which is not nothing. Here we teach you to stand in a forest with no bridge at all, and that is a different discipline." },
      },
      choices = {
        { text = "A post is a post. I'll learn.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Patience, mostly, and a fury held so tightly that only the bear is allowed to show it. A warrior lets that fury out in the open, and I have never been sure which of us is wiser." } },
      choices = {
        { text = "Fury should be held tightly, and loosed only when it's needed.", next = "BACK", reply = "That is the druid's way, and a wise one. The bear knows when to roar.", fx = { align = { order = 1 } } },
        { text = "Fury hidden too long rots, so better to let it out openly.", next = "BACK", reply = "Perhaps for a warrior, but a druid's fury is a wild thing. Let it out too freely, and it will not come back.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Rarely, but it has been known, and it shows when the mage holds their ground instead of running when the blade comes close. Most of your kind run, which is wise, but wisdom and spirit are not the same thing." },
      },
      choices = {
        { text = "I'll hold my ground. Watch me.", next = "BACK", reply = "I will, mage, and I will tell my students when you do. They need to see it.", fx = { align = { honor = 1 } } },
        { text = "I'd rather be wise than brave.", next = "BACK", reply = "Wisdom and bravery are not enemies, mage. The wise know when to be brave.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_ariasta", tags = { "news" }, when = { party = { class = "WARRIOR" } },
          text = "You walk with a warrior. {companion} carries a blade the way a sentinel would want it carried, low and ready, and I would guess they have stood in front of you more than once." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. I teach only those with the warrior's spirit, but I'll grant that some healers have more of it than the fighters they heal." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You may have the warrior's spirit, {class}, though I'll want to see it for myself before I say so." },
        { id = "h_default", text = "I am Arias'ta Bladesinger, and I teach the art of war on this Terrace. I can see the warrior's spirit in those who have it, and I teach only them." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "I see some warrior's spirit in you, rogue, buried under a great deal of cunning. It isn't the worst combination I've ever seen." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I teach only those with the warrior's spirit, warlock, and whatever spirit is walking behind you isn't the right kind." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. I do not teach your art, but I can see whether there's a warrior's spirit in you, and in some hunters there is." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I see something of the warrior's spirit in you, which is not common in the Circle, though I teach only those who carry it whole." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. I see little of the warrior's spirit in you, though I'll grant that facing a charge with nothing but a spell takes nerve." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I see your spirit at a glance, as I have seen every student's for a thousand years, and yours is strong, though rough." },
      },
      again = { { id = "h_again", text = "Something more? Ask, and then let me return to my students." } },
      choices = {
        { text = "Instruct me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What is the warrior's spirit?", next = "spirit" },
        { text = "Bladesinger is an unusual name.", next = "name" },
        { text = "What do your stances teach?", next = "stances", when = { class = "WARRIOR" } },
        { text = "Stormwind's guard taught me already.", next = "guard_a", when = { origin = "human_city_guard" } },
        { text = "Can a rogue really have a warrior's spirit?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do I have a warrior's spirit, Arias'ta?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you think warlocks lack courage?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Can a priest have a warrior's spirit, Arias'ta?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you see the warrior's spirit in me, Arias'ta?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do you see in a druid's spirit, Arias'ta?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is there a warrior's spirit in a mage, Arias'ta?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can you really see a warrior's spirit, Arias'ta?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "What should a warrior expect from a company?", next = "xpt_ariasta", when = { party = { class = "WARRIOR" } } },
        { text = "Farewell.", next = "END" },
      },
    },
    spirit = {
      lines = {
        { id = "sp_default", text = "The part of you that steps forward when the others step back. It can be trained, but it cannot be taught to someone who hasn't got it." },
      },
      choices = {
        { text = "Courage can be learned by anyone.", next = "BACK", reply = "Many believe so, and I hope they are right. But I have seen courage come to some and never to others.", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Some are born for it. I agree.", next = "BACK", reply = "Some are, and it is a rare gift. But even they must train it, or it withers.", fx = { align = { order = 1 } } },
        { text = "Do you see it in me?", next = "spirit2", when = { class = "WARRIOR" } },
      },
    },
    spirit2 = {
      lines = {
        { id = "s2_default", text = "I see it, and I see that it's young yet. Come back when you've been knocked down a few more times and stood up again; then we'll talk." },
      },
      choices = { { text = "I'll be back.", next = "BACK", fx = { affinity = 1 } } },
    },
    name = {
      lines = {
        { id = "na_default", text = "A good blade makes a sound when it's used well, and our family has always listened for it. That is all the story I'll tell a stranger." },
      },
      choices = { { text = "All right. Something else, then.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear what my students say between bouts. Ask, if you must." } },
    background = { { id = "tp_bg", text = "I teach warriors. I have done so for a long time." } },
    advice = { { id = "tp_ad", text = "Listen to your blade. It will tell you when you're careless." } },
    centaur = { { id = "tp_centaur", text = "Centaur fight from horseback, but they have no horse to fall off. Go for the legs, and step aside quickly." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I've heard of the arena in Stranglethorn. Fighting for an audience teaches bad habits, but it does teach." } },
    warsong = { { id = "tp_warsong", text = "The Warsong are strong and they're proud of it. Proud fighters make mistakes, and that's where you put your blade." } },
    _none = { { id = "tp_none", text = "That is no matter for a warrior trainer, child, and I have kept to my own matters since the War of the Ancients." } },
  },
}

-- Herald Moonstalker: Darnassus's town crier; calls heroes to the Plaguelands, Un'Goro and Feathermoon.
P:NPC {
  key = "moonstalker", id = TODO_NPC("Herald Moonstalker"), name = "Herald Moonstalker",
  bible = "bibles/terraces.md", role = "citizen", tier = "quest",
  communities = { "darnassus" }, temper = { "eager", "chatty" }, values = { "loyal", "friendly" },
  notices = { "class", "greenness" },

  impression = {
    first = "Herald Moonstalker carries the news of two continents in her head and gives it away to anyone who stops walking. She clearly loves the sound of a good proclamation, especially her own.",
    third = "{name} met Herald Moonstalker, who walks the paths of Darnassus crying the news of the Alliance.",
  },

  greetings = {
    { id = "g_hail", text = "Greetings and salutations, hero! I have news from both continents and points beyond." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more news? Excellent; I've three new proclamations since you passed." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! There's a call to the Plaguelands you'll want to hear, for nobody needs healers like the folk fighting the dead." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 30 },
      text = "My proclamations are mostly for seasoned heroes, I'm afraid. Grow a little, and come back; the calls will still be calling." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The news says they are orcish, mostly. But a dwarven shaman is new, and I shall proclaim it." } },
      choices = {
        { text = "Shout only what's true, Herald. People believe you.", next = "BACK", reply = "I only shout what I hear, though I do try to hear it from good sources. A dwarven shaman is good news, either way.", fx = { align = { order = 1 } } },
        { text = "Keep me out of your proclamations.", next = "BACK", reply = "As you wish, though the Terrace will hear of you sooner or later. Heroes rarely stay quiet for long.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Plenty, for the Sentinels in Ashenvale call for every blade that can be spared, and the Warsong hear the same call from their side. If a warrior wants to be in my proclamations one day, Astranaar is where the stories are being written." } },
      choices = {
        { text = "Then I'll go to Astranaar and earn a proclamation.", next = "BACK", reply = "Then I will be glad to proclaim it, warrior. Astranaar needs every blade it can get.", fx = { align = { honor = 1 } } },
        { text = "I fight for coin, not for your proclamations.", next = "BACK", reply = "Coin is honest work, and I will not proclaim otherwise. But the Sentinels will remember who fought for them.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Word from Darkshore says the thistle bears have gone mad, foaming and turning on their own cubs, and Tharnariun Treetender in Auberdine would welcome a steady bow. I'd proclaim it louder, but frankly the bears frighten me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And may your {pet} be proclaimed the finest beast on the Terrace, at least until the next one walks past. I say that to all the companions, but I mean it every time." },
      },
      choices = {
        { text = "I'll go and help Tharnariun with his bears.", next = "BACK", reply = "Then I will tell the Terrace a hero has gone to Darkshore. Tharnariun will be glad of the help.", fx = { align = { honor = 1 } } },
        { text = "Mad bears are more trouble than they're worth.", next = "BACK", reply = "Perhaps, but someone has to help them, and Tharnariun cannot do it alone. Think on it, hunter.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "All the time, and most of it I keep under my hat, since a herald's job is the news fit to shout. Still, if you hear something in an alley that the city ought to know, you could do worse than bring it to me." },
      },
      choices = {
        { text = "If it's worth telling the city, I'll tell you.", next = "BACK", reply = "Good, and I will proclaim it properly when you do. The city deserves to hear good news.", fx = { align = { honor = 1 } } },
        { text = "Shadow news sells better than shouted news, Herald.", next = "BACK", reply = "It may, but it does not sell in the market, and I am a herald, not a merchant. Keep your shadows, rogue.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because Tyrande and the Archdruid wouldn't have one, and no kaldorei mage has dared ask in ten thousand years. If you want lessons, Stormwind or Ironforge will have them, and meanwhile you're welcome to admire the city as a visitor." },
      },
      choices = {
        { text = "That's fair. It's your city, and your choice.", next = "BACK", reply = "It is, and I am glad to hear an outsider say so. The High Priestess will be pleased.", fx = { align = { order = 1 } } },
        { text = "Ten thousand years is a long time to be afraid.", next = "BACK", reply = "It is, and perhaps one day someone will be brave enough to say so to the High Priestess. It will not be me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_m = {
      lines = {
        { id = "pm_default", text = "Hear, hear! I've cried that proclamation in every corner of this city, and mostly I get polite nods from kaldorei who've never seen a ghoul. A paladin, though, now there's someone the Argent Dawn will be glad of!" },
      },
      choices = {
        { text = "Then I'll go to Light's Hope.", next = "BACK", fx = { affinity = 1, learn = { "new_plague" } } },
        { text = "Not yet. I've work closer to home.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "None that I'm permitted to cry from the Terrace, though the Argent Dawn in the Plaguelands calls for anyone who'll fight the Scourge, and I've never heard them ask what a hero summons. I'd answer that call if I were you, and give the city something better to say about you." },
      },
      choices = {
        { text = "Then I'll answer the Argent Dawn's call.", next = "BACK", reply = "Then I will cry your name in the morning, warlock, and the Argent Dawn will be glad of you. The Scourge do not care where your power comes from.", fx = { align = { light = 1 } } },
        { text = "I'll go where my own work leads me.", next = "BACK", reply = "As you like, though the Plaguelands need every hand. I will cry the news either way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Herald Moonstalker, crier of Darnassus! I walk every path in the city so that no hero misses a summons, and my feet will tell you I take that seriously." },
        { id = "h_plague", tags = { "news" }, when = { questActive = TODO_QUEST("A Call to Arms: The Plaguelands!") },
          text = "Hear ye! Stormwind calls heroes to the Plaguelands, where the Scourge stirs again. Commander Ashlam Valorfist keeps his camp at Chillwind, north of the Alterac Mountains." },
        { id = "h_frontier", tags = { "news" }, when = { questActive = TODO_QUEST("The New Frontier") },
          text = "The Cenarion Circle seeks brave proxies for the wastes west of Tanaris! The Arch Druid will tell you more, though I'd go in prepared for his manner." },
        { id = "h_feather", tags = { "news" }, when = { questActive = TODO_QUEST("Feathermoon Stronghold") },
          text = "Your aid is needed in Feralas! An outlaw mage has fled into the ruins of Eldre'Thalas with something dangerous, and Latronicus Moonspear at Feathermoon wants it back." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Hear ye, hear ye, a rogue has crept onto the Terrace! I'm only teasing, of course, though you did startle me." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I've no summons for your kind, I'm afraid, since Darnassus has no tower or trainer for you. But do have a look around, it's beautiful." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Hear ye, a warrior has come to the city! I'd announce you properly, but you'd only blush under that helmet." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter walks among us! Hear ye, and mind the beast, because it's sniffing my scrolls." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Hear ye, hear ye, there's a warlock on the Terrace, and the Herald has no proclamation for that at all!" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! News for you, then: shamans are rare in Darnassus, so you will be news yourself before the moon sets." },
      },
      again = {
        { id = "h_again", text = "More news? I've plenty!" },
        { id = "h_again2", text = "Ask away; a crier never runs dry." },
      },
      choices = {
        { text = "What's the news from the Eastern Kingdoms?", next = "east" },
        { text = "You must hear all of Kalimdor's news first.", next = "kalimdor" },
        { text = "What's the strangest news you've cried?", next = "strange" },
        { text = "Is there a call for healers anywhere?", next = "healers", when = { class = { "PRIEST", "DRUID", "PALADIN", "SHAMAN" } } },
        { text = "The Plaguelands call, and the Light answers.", next = "paladin_m", when = { class = "PALADIN" } },
        { text = "Does the Herald ever hear news nobody announces?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why does Darnassus keep no mage trainer?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Any news for a warrior, Herald?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Any news for a hunter, Herald?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Are there any summons for a warlock, Herald?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What news travels about shamans, Herald?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Herald.", next = "END" },
      },
    },
    east = {
      lines = {
        { id = "ea_default", text = "Stormwind calls for heroes to stand against the Scourge in the Plaguelands, where rumors say new horrors are rising from the ruins. Chillwind Camp is the place to report, north of the Alterac Mountains." },
      },
      choices = {
        { text = "The dead must be put down. I'll answer.", next = "BACK", reply = "Then go with the Terrace's blessing, and with mine. The Plaguelands need heroes more than anywhere.", fx = { align = { light = 1 }, trait = { brave = 1 }, learn = { "new_plague" } } },
        { text = "Stormwind should fight its own wars.", next = "BACK", reply = "Many kaldorei would agree, and they mutter it in the market. But the Scourge will not stay in Lordaeron forever.", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "I know little of the Scourge.", next = "east2" },
      },
    },
    east2 = {
      lines = {
        { id = "e2_default", text = "The plague that turned Lordaeron's dead against its living. I've only heard it described, and I've no wish to hear more, but I'll cry it as long as heroes are needed." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "new_plague" } } } },
    },
    kalimdor = {
      big = true,
      lines = {
        { id = "ka_default", text = "The Cenarion Circle wants explorers for the crater beyond Gadgetzan, and Feathermoon wants heroes for the old elven ruins in Feralas. There's never been a better time to be brave on our own continent." },
      },
      choices = {
        { text = "Our own continent comes first.", next = "BACK", reply = "It does, and the Cenarion Circle would agree with you. Silithus and Feralas are our own concern.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll go wherever the reward is.", next = "BACK", reply = "Then you will find plenty of work, and plenty of coin. The world is wide and full of danger.", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "What's in the Feralas ruins?", next = "kalimdor2" },
      },
    },
    kalimdor2 = {
      lines = {
        { id = "k2_default", text = "Eldre'Thalas, which the ogres call Dire Maul now. An outlaw mage named Lethtendris fled there with something of dangerous magical power, and the Sentinels want it out of her hands." },
        { id = "k2_skyborne", when = { race = "Skyborne" },
          text = "Eldre'Thalas, which the ogres call Dire Maul now. Forgive me, I forget your people's history is bound up in those ruins; I'll cry it more gently, if you like." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    healers = {
      lines = {
        { id = "hl_default", text = "Everywhere, but loudest in the Plaguelands, where Chillwind Camp sends its wounded back by the cartload. If you'd rather stay on our side of the sea, the Sentinels in Ashenvale never have enough priestesses." },
      },
      choices = {
        { text = "I'll go where the dying are.", next = "BACK", reply = "Then go to Chillwind Camp, and Elune walk with you. They need you more than anyone.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I'll go where my own people need me.", next = "BACK", reply = "Then you will find plenty of work close to home. The Sentinels in Ashenvale need healers too.", fx = { align = { light = -1 } } },
      },
    },
    strange = {
      lines = {
        { id = "st_default", text = "A gnome once paid me to proclaim that his lost mechanical squirrel had been found, in Darnassus, at the top of my voice. It had been found, too; it was in the moonwell." },
      },
      choices = {
        { text = "Ha! Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "I'll be on my way.", next = "END" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A crier knows a little of everything and a great deal about nothing. Ask, and I'll tell you the latest." } },
    background = { { id = "tp_bg", text = "I'm the crier. I walk, I call, and I make sure nobody can say they weren't told." } },
    advice = { { id = "tp_ad", text = "Listen to the proclamations, hero. Half the adventures in Azeroth start with somebody shouting." } },
    rumors = { { id = "tp_rumors", text = "Officially, I only cry what's sealed and signed. Unofficially, the Sentinels say Ashenvale is busier than they'd like." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Hear ye, the Darkmoon Faire comes and goes like the moon, and when it's near I cry it. When it's far I cry something else, but I always cry something." } },
    scourge = { { id = "tp_scourge", text = "Hear ye, the plague of the dead still holds the human north! I cry it every week so nobody can say they weren't told, though I'm told it gets less cheerful each time." } },
    theramore = { { id = "tp_theramore", text = "Theramore is Lady Proudmoore's city across the sea, and its ships come to Auberdine now and then. I announce them when I hear of them, which is never as early as I'd like." } },
    bolvar = { { id = "tp_bolvar", text = "Lord Bolvar rules Stormwind for the boy king, the human dispatches say. I cry the news, though I've never worked out how to pronounce Fordragon." } },
    onyxia = { { id = "tp_onyxia", text = "A dragon in the marshes south of Theramore. I've been asked not to cry that one too loudly, because it frightens the children." } },
    _none = { { id = "tp_none", text = "No proclamation about that, I'm afraid. Ask me again next week." } },
  },
}

-- Mydrannul: general goods on the Warrior's Terrace; sends couriers to his friend Nessa Shadowsong.
P:NPC {
  key = "mydrannul", id = TODO_NPC("Mydrannul"), name = "Mydrannul",
  title = "General Goods Vendor",
  bible = "bibles/terraces.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "warm", "earnest" }, values = { "generous", "kind" },
  notices = { "greenness" },

  impression = {
    first = "Mydrannul says it is an honor to supply adventurers, because they are heroes in the making, and he seems to believe it of everyone who walks in. It is hard not to stand a little straighter at his counter.",
    third = "{name} met Mydrannul, who sells general goods on the Warrior's Terrace and believes in every hero who buys them.",
  },

  greetings = {
    { id = "g_honor", text = "Welcome! It's an honor to provide for adventurers; you're heroes in the making, every one of you." },
    { id = "g_back", when = { metBefore = true }, text = "Back for supplies? I knew you'd make it home again." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 12 },
      text = "Just setting out? Take more food than you think you'll need. Everyone does, the second time." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every one of them is a hero in the making. It is my honour to supply them. A shaman is no different." } },
      choices = {
        { text = "Then I will try to live up to it, Mydrannul.", next = "BACK", reply = "You will, I think, and I will be proud to have supplied you. Every hero starts somewhere.", fx = { align = { honor = 1 } } },
        { text = "Some adventurers are only thieves.", next = "BACK", reply = "Some are, and I have met them, but most are only hungry. I sell to them all the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "All of them, sooner or later, because a healer gives away everything they carry before they're half done. I always tell them to keep a waterskin for themselves, and they always forget." } },
      choices = {
        { text = "Giving it away is the point, Mydrannul.", next = "BACK", reply = "It is, I know, and that is why I worry for your kind. Keep a little for yourself, at least.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll look after my own needs first, which is only sense.", next = "BACK", reply = "That is only sense, and I wish more healers had it. A priest who faints from hunger in Ashenvale heals nobody.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They look up to anyone in shining armor, but a paladin who carries themselves well gives them something worth copying. Be kind to them when they stare, because some of them will remember it longer than you will." } },
      choices = {
        { text = "I'll try to give them something worth copying.", next = "BACK", reply = "Then you already have, by trying. The children will notice.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Their heroes are their own business, not mine.", next = "BACK", reply = "Perhaps they are, but they will watch you anyway. You might as well give them something worth seeing.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Food, every time, because they pack whetstones and spare buckles and forget that they need to eat. I've sent warriors down to Ashenvale with a bag full of steel and nothing else, and every one of them came back hungry and wiser." } },
      choices = {
        { text = "I'll pack properly. A wise warrior plans ahead.", next = "BACK", reply = "Good, and you will thank me in Ashenvale. A warrior who eats is a warrior who fights.", fx = { align = { order = 1 } } },
        { text = "I'll live off the land. Supplies slow me down.", next = "BACK", reply = "Many have tried, and many have come back thin. The land is less generous than you think.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I do, and I'm proud of it: dried meat for the cats, fish for the ones who'll eat it, and bread for the strange ones who won't eat either. A hero's companion is a hero too, as far as I'm concerned." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it eats well, and I'd like to keep it that way. Tell me what it favors, and I'll see whether it's on my shelves." },
      },
      choices = {
        { text = "My companion eats before I do. Always.", next = "BACK", reply = "That is a good hunter, and a good friend. Your cat will follow you anywhere for it.", fx = { align = { honor = 1 } } },
        { text = "It can hunt its own supper.", next = "BACK", reply = "It can, but it will be happier if it does not have to. A well-fed companion fights harder.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A little, but conjured bread has no taste to it at all, and you'll want something real after a week in Ashenvale. I sell the hundred small things you can't conjure, so you'll be back, and I'll be glad of it." },
      },
      choices = {
        { text = "You're right. Real food's worth paying for.", next = "BACK", reply = "It is, and I am glad you understand. A week in Ashenvale deserves a real meal at the end of it.", fx = { align = { order = 1 } } },
        { text = "Taste is a luxury. My bread does the job.", next = "BACK", reply = "It does, until you have eaten it for a month. Then you will be back, I promise you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Some would, and the ones who didn't would watch me for a month afterward. It's an honor to supply this Terrace, and I'd hate to lose that honor because someone saw a demon by my stall." },
      },
      choices = {
        { text = "I'll keep my servant away from your stall.", next = "BACK", reply = "Thank you, and the Terrace will thank you too. I would hate to lose my regulars.", fx = { align = { order = 1 } } },
        { text = "My coin's as good as theirs. They'll get over it.", next = "BACK", reply = "It is, and they will, eventually. I will take your coin either way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Moonberry juice and bread for the road, mostly, because the young ones up from Dolanaar forget that a cat can't carry a pack. It's an honor to feed them, and I tell them so every time." } },
      choices = {
        { text = "A druid should live off the forest, not a market stall.", next = "BACK", reply = "They should, and many of them do. But the young ones forget how far the forest is from here.", fx = { align = { order = 1 } } },
        { text = "There's no shame in buying bread when the forest is far off.", next = "BACK", reply = "None at all, and I am glad you understand. Bread is bread, wherever it comes from.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They do, because nobody sees them do the brave thing, so nobody sings about it afterward. I keep a little list in my head of the ones I've supplied who never came back to boast, and I think they're the bravest of the lot." },
      },
      choices = {
        { text = "A hero shouldn't need a song.", next = "BACK", reply = "No, but a song is a kindness, and kindness is rare. I will remember yours, at least.", fx = { align = { honor = 1 } } },
        { text = "A song pays nothing. I'd rather have coin.", next = "BACK", reply = "A song pays nothing, but it lasts longer than coin. Still, I will take your coin.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You'll want linen for bandages and water for the road, I expect, because even a healer's prayers run dry halfway to Ashenvale." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! It's an honor, {class}, and I mean that, because heroes in the making always need someone to look up to." },
        { id = "h_default", text = "I'm Mydrannul, and I keep the Terrace in food, drink and the hundred small things a hero forgets until they're halfway to Ashenvale. It's an honor, and I mean that." },
        { id = "h_nessa", tags = { "news" }, when = { questActive = TODO_QUEST("Nessa Shadowsong") },
          text = "My friend Nessa Shadowsong sells fish down in Rut'theran Village, and she needs a parcel carried to Darkshore. Take the portal west of the Temple Gardens, and you'll find her by the water." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "Conjured bread is all very well, mage, but you can't conjure moonberry juice, so I'll still have your custom one day." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I'll sell you supplies, warlock, though I'd rather you didn't tell anyone where you got them. My other customers are a nervous lot." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll want bread, water and twice as much of both, because a hero on the front line burns through supplies." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You'll want arrows, I suppose, and something for your companion, because heroes' beasts get hungry too." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and a hero in the making! I keep the Terrace in food and drink, and I've learned that druids eat like bears after a long day in one, so do stock up." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! Oh, it's an honor, because heroes come in all shapes, and nobody ever writes a song about the one who picked the lock." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! It's an honour to supply a hero in the making, and I expect your spirits need supplies of their own." },
      },
      again = { { id = "h_again", text = "Anything else? Take your time, for my people never rush a guest." } },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Why call us heroes in the making?", next = "heroes" },
        { text = "Who is Nessa Shadowsong?", next = "nessa", when = { any = { { questActive = TODO_QUEST("Nessa Shadowsong") }, { questDone = TODO_QUEST("Nessa Shadowsong") } } } },
        { text = "Doesn't my conjured food take your custom?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do warriors forget to pack, Mydrannul?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you stock food for a hunter's companion?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would your customers really leave over a warlock?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do many healers buy supplies from you, Mydrannul?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the young heroes really look up to paladins?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do druids usually buy from you, Mydrannul?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does nobody write songs about the lockpickers, Mydrannul?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think every adventurer is a hero, Mydrannul?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    heroes = {
      lines = {
        { id = "he_default", text = "Because some of the ones who buy bread from me come back with stories the whole Terrace repeats. I can't tell which ones by looking, so I treat you all the same." },
      },
      choices = {
        { text = "That's a generous way to see people.", next = "BACK", reply = "It is the only way I know how to see them. Most of them surprise me, in the end.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Heroes are made by deeds, not hope.", next = "BACK", reply = "They are, but deeds start with hope. I sell the bread that feeds both.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
      },
    },
    nessa = {
      lines = {
        { id = "ne_default", text = "An old friend who sells fish at the foot of the tree, by the boats from Auberdine. She's always sending things across the water, and I'm always finding her couriers." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Everyone buys bread, and everyone talks while they do. Ask, and I'll tell you what I've heard over the counter." } },
    background = { { id = "tp_bg", text = "I sell supplies on the Terrace. I like to think I've fed a few heroes before they were famous." } },
    advice = { { id = "tp_ad", text = "Carry water. More quests end in thirst than in dragons." } },
    booty_bay = { { id = "tp_booty_bay", text = "I've a cousin who sells in Booty Bay, and he says the goblins sell salt by the pinch and air by the breath. I sell it by the sack, and I'm still in business." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire passes anywhere near, the young ones come in for travel food and come back for more. It's good for trade, whatever you think of the games." } },
    everlook = { { id = "tp_everlook", text = "Goblin town in Winterspring. They pay well for good food, because nothing grows in the snow except prices." } },
    _none = { { id = "tp_none", text = "I wouldn't know about that, friend. I only sell the supplies, though Elune knows I've heard every rumour on the Terrace." } },
  },
}

-- Treshala Fallowbrook: waits upstairs on the Tradesmen's Terrace for word of her husband Heralath (Razorfen Kraul).
P:NPC {
  key = "treshala", id = TODO_NPC("Treshala Fallowbrook"), name = "Treshala Fallowbrook",
  bible = "bibles/terraces.md", role = "citizen", tier = "quest",
  communities = { "darnassus" }, temper = { "anxious", "proud" }, values = { "loving", "loyal" },
  notices = { "class", "death" },

  impression = {
    first = "Treshala Fallowbrook waits in her upstairs room for word of her husband Heralath, who went south to study the quilboar. Grief, when it comes, makes her fierce rather than small.",
    third = "{name} met Treshala Fallowbrook as she kept watch upstairs on the Tradesmen's Terrace for word of her husband.",
  },

  greetings = {
    { id = "g_wait", text = "Oh! I thought you might be a messenger. Forgive me; I'm always thinking that." },
    { id = "g_grief", when = { questDone = TODO_QUEST("Mortality Wanes") }, text = "It's you. Come in, if you like; I'm not as alone as I was, now that I have his work to finish." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", questDone = TODO_QUEST("Mortality Wanes") },
      text = "A priest. Would you sit with me a moment? I don't need prayers, only someone who knows how to be quiet." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "You're of the Circle, like Heralath. He used to come home with leaves in his hair and mud to his knees, and I miss the mud most of all." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I fear for him every day. Grief makes me fierce, not weak. If your spirits know where he is, tell me." } },
      choices = {
        { text = "I will search for him, Treshala. Hold on.", next = "BACK", reply = "Thank you, shaman, and I will hold on as long as I can. Every hand searching gives me hope.", fx = { align = { light = 1 } } },
        { text = "Prepare yourself for the worst.", next = "BACK", reply = "I have, every night, and it does not get any easier. I will not stop hoping, all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It might, though I'm never sure whether I'm praying for him or for myself. Say one if you will, and I'll be grateful, because the Barrens is a long way for Elune's light to reach." } },
      choices = {
        { text = "I'll pray for him, and for you as well.", next = "BACK", reply = "Thank you, priest, and I will be grateful for both. Elune knows I need it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't change what happens out there, I'm sorry to say.", next = "BACK", reply = "Perhaps not, but they help me sleep. Say one anyway, if you can.", fx = { align = { light = -1 } } },
        { text = "I'll leave you in peace.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "More, I think, though he'd never say so in his letters, because the quilboar and the centaur and the Horde all ride through it. If you ever go that way, I'd sleep better knowing someone like you might be on the same road." } },
      choices = {
        { text = "I'll watch over the scholars who travel those roads.", next = "BACK", reply = "Thank you, paladin, and I hope Heralath crosses your path. He would be glad of the company.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Scholars who wander into the Barrens take their own chances.", next = "BACK", reply = "They do, and he knew it, but he went anyway. That is the scholar's curse.", fx = { align = { honor = -1 } } },
        { text = "I'll leave you in peace.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I tell myself it would have, though the Barrens are wide and the quilboar are many. He went with his books and his curiosity and not a single sword, so if you ever travel that way, I'd be grateful if you asked after him in Ratchet." } },
      choices = {
        { text = "If I go south, I'll ask after him in Ratchet.", next = "BACK", reply = "Thank you, warrior, and I will be grateful for any word. Ratchet is where his last letter came from.", fx = { align = { honor = 1 } } },
        { text = "A scholar alone in the Barrens chose his fate.", next = "BACK", reply = "He did, and I cannot forgive him for it. But I cannot stop hoping either.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "He studied the quilboar and the tales of their fallen boar god, Agamaggan, but he wrote about the zhevras and the great kodos in every letter. He would have liked you, because you'd have known which beasts he was describing." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would have fascinated him, and he'd have asked you a hundred questions about it before you'd taken your boots off." },
      },
      choices = {
        { text = "If I'm in the Barrens, I'll look for his trail.", next = "BACK", reply = "Thank you, hunter, and I will be grateful forever. His trail would be easy to miss.", fx = { align = { honor = 1 } } },
        { text = "I won't go hunting for a lost scholar.", next = "BACK", reply = "I understand, and I will not ask it of you. But I hope someone does.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I'd be grateful just to know he's safe, though I'd never ask you to put yourself between him and a quilboar war band. If you pass through the Barrens, look for his camp, and send me word if you hear anything at all." },
      },
      choices = {
        { text = "I'll look for him and send whatever word I find.", next = "BACK", reply = "Thank you, rogue, more than I can say. Any word at all would help.", fx = { align = { light = 1 } } },
        { text = "Word costs. I'll want something for the trouble.", next = "BACK", reply = "I have little to give, but I will give what I can. Please find him.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Every day, though I know the druids would frown at any spell for it. I wait for the boats from Auberdine and the hippogryphs, and I've learned to love the waiting a little, even if I'd trade it in an instant." },
      },
      choices = {
        { text = "Waiting makes his letters precious. I'd keep it that way.", next = "BACK", reply = "You are right, and I would not want it any other way. Every letter is a treasure.", fx = { align = { order = 1 } } },
        { text = "If magic brings him nearer, the druids can frown.", next = "BACK", reply = "Perhaps they can, but I would rather not anger them. They might stop looking for him altogether.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_tr = {
      lines = {
        { id = "dtr_default", text = "Won't it? The Enclave sent him south alone, and they've sent me nothing but a polite letter since. If you mean it, then read his notes when you're done in the Kraul and tell me whether he was right." },
      },
      choices = {
        { text = "I'll read them. I promise.", next = "BACK", reply = "Thank you, druid, and I will hold you to it. His notes deserve to be read by someone who understands them.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The Circle has bigger troubles. I'm sorry.", next = "BACK", reply = "They do, and I know it, but he is my husband. I cannot see past that.", fx = { align = { honor = -1 } } },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Not help, but I'd refuse anything that bargains with demons, because my husband would never forgive me for buying his safety that way. If you go south to the Barrens, carry your own courage, and bring me word in an honest hand." },
      },
      choices = {
        { text = "Honest word, then. I'll bring it if I can.", next = "BACK", reply = "Thank you, warlock, and I will be grateful for anything honest. He would want it that way.", fx = { align = { honor = 1 } } },
        { text = "Help is help. Don't be so proud.", next = "BACK", reply = "Perhaps I am, but Heralath would be ashamed of me otherwise. I would rather wait.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xcl_kraul = {
      big = true,
      lines = {
        { id = "xcl_kraul_default", text = "Then you've seen what Heralath only wrote about: the thorns, the quilboar priests, and Charlga Razorflank at the heart of it all. He believed the quilboar could be talked with if only someone took the time to learn their gods, and I'd like to believe he was right, even now." },
        { id = "xcl_kraul_after", when = { questDone = TODO_QUEST("Mortality Wanes") }, text = "Then you've walked the same tunnels he died in, and you went further than he ever could. He believed the quilboar could be talked with if someone only learned their gods, and the Kraul answered him the way it answers everyone." },
      },
      choices = {
        { text = "He was right. Even the quilboar deserve to be understood.", next = "BACK", reply = "He would have agreed with you, and so do I. He believed even the quilboar could be understood.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some things can't be reasoned with, and the Kraul is one.", next = "BACK", reply = "Perhaps, but he believed otherwise, and he died believing it. I will not say he was wrong.", fx = { align = { light = -1 } } },
        { text = "What did Heralath write about their boar god?", next = "xcl_kraul2" },
      },
    },
    xcl_kraul2 = {
      lines = { { id = "xcl_kraul2_default", text = "That Agamaggan was a great boar demigod who fell fighting the Burning Legion, and that the Kraul's thorns grew from his blood where he died. The quilboar think the brambles are still his body, so to them every one of us who cuts a path through is cutting their god, and Heralath said that explained a great deal." } },
      choices = {
        { text = "Thank you. I'll remember his work, Treshala.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_kraul", tags = { "news" }, when = { cleared = "Razorfen Kraul", faction = "Alliance", ["not"] = { questDone = TODO_QUEST("Mortality Wanes") } }, text = "Someone told me you've been down to the bottom of Razorfen Kraul, and that's the very warren Heralath wrote about in his last letters. Please, did you see anything of him down there?" },
        { id = "h_cl_kraul2", tags = { "news" }, when = { cleared = "Razorfen Kraul", faction = "Alliance", questDone = TODO_QUEST("Mortality Wanes") }, text = "You went all the way down into the Kraul, past the place where Heralath fell, and you came back out. I'm glad someone did, and I'm gladder it was you." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Forgive me if I seem far away, {class}, because my thoughts are usually somewhere in the Barrens with Heralath." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Heralath always said the Barrens needed knights more than scholars, though he went anyway, and he took only a staff." },
        { id = "h_default", text = "I am Treshala Fallowbrook. My husband, Heralath, went south to the Barrens to study the quilboar and the rumours of their fallen boar god, and I wait here for his letters, as I have waited for him before." },
        { id = "h_pendant", tags = { "news" }, when = { questActive = TODO_QUEST("Mortality Wanes") },
          text = "That's my pendant, the one Heralath and I exchanged when we were bonded. Why do you have it, and why are you looking at me like that?" },
        { id = "h_after", when = { questDone = TODO_QUEST("Mortality Wanes") },
          text = "I've his notes on the Kraul spread across every table. I'll not let his work die with him, whatever it costs me, and you can tell anyone who asks that I said so." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You move like someone who's used to being unseen, rogue. Heralath writes that the Barrens are full of folk like that, and not all of them are friendly." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Heralath always said that a mage could send a letter across the sea in a heartbeat. Is that true, or is he teasing me again?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. My Heralath was no warrior, only a scholar, and I wish now that someone like you had gone south with him." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Heralath used to say hunters were the only people who understood how much there is to learn just by watching." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. If you mean to offer me some dark way of finding Heralath, I'll tell you now that I'd rather keep waiting." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Razorfen", min = 30 } },
          text = "You've fought the quilboar of the Razorfen, from the look of you, and a great many of them. Heralath went south to understand them, and I wonder sometimes whether understanding them was ever possible." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. My husband Heralath went south to study the quilboar, so if your spirits have any word of him, please, Elune keep you, tell me." },
      },
      again = {
        { id = "h_again", text = "Is there more? Please, I don't mind the company." },
        { id = "h_again2", when = { questDone = TODO_QUEST("Mortality Wanes") }, text = "Ask what you like, because talking about him helps." },
      },
      choices = {
        { text = "What was Heralath studying?", next = "work" },
        { text = "How long since his last letter?", next = "letters", when = { ["not"] = { questDone = TODO_QUEST("Mortality Wanes") } } },
        { text = "I'm sorry for your loss.", next = "grief", when = { any = { { questActive = TODO_QUEST("Mortality Wanes") }, { questDone = TODO_QUEST("Mortality Wanes") } } } },
        { text = "You don't seem the sort to sit and wait.", next = "after", when = { questDone = TODO_QUEST("Mortality Wanes") } },
        { text = "The Circle won't forget Heralath.", next = "druid_tr", when = { class = "DRUID" } },
        { text = "Shall I find out who threatens Heralath out there?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you wish Heralath could send letters faster?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would a warrior's escort have helped your husband?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Did Heralath study the beasts of the Barrens too?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Would a prayer for Heralath help, Treshala?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is the Barrens as dangerous as Heralath feared?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you refuse help, even mine, Treshala?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you fear for Heralath, Treshala?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been down to the bottom of Razorfen Kraul, Treshala.", next = "xcl_kraul", when = { cleared = "Razorfen Kraul", faction = "Alliance" } },
        { text = "I'll leave you in peace.", next = "END" },
      },
    },
    work = {
      lines = {
        { id = "wo_default", text = "The Razorfen, the quilboar's warrens in the southern Barrens, and the corruption in them. He thought it had something to do with Agamaggan, a great boar the quilboar say died there long ago." },
      },
      choices = {
        { text = "Dangerous work for a scholar.", next = "work2" },
        { text = "The Circle should send more than one druid.", next = "BACK", reply = "They should, and I have written to them twice. They answer politely, and send no one.", fx = { align = { order = 1 }, learn = { "cenarion_circle" } } },
        { text = "Some things are best studied alone.", next = "BACK", reply = "Perhaps, but he would still be alive if he had not been alone. I cannot forgive them for that.", fx = { align = { order = -1 }, learn = { "cenarion_circle" } } },
      },
    },
    work2 = {
      lines = {
        { id = "w2_default", text = "He was a druid before he was a scholar, and he could take care of himself. I tell myself that every evening, and every evening I believe it a little less." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    letters = {
      lines = {
        { id = "le_default", text = "Too long. He was always bad at writing, but not this bad, and the last one talked about quilboar on the move in the south. If you go near the Razorfen, would you ask after him?" },
      },
      choices = {
        { text = "I'll look for him.", next = "BACK", reply = "Thank you, and please send word, whatever you find. I would rather know than wonder.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I won't promise what I may not keep.", next = "BACK", reply = "That is honest, and I respect it. Look if you can, and I will not blame you if you cannot.", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },
    grief = {
      big = true,
      lines = {
        { id = "gr_default", text = "It isn't fair. A cruel world, and he walked into the worst of it for a boar god nobody else cared about. Thank you for coming so far from such a dangerous place to tell me, but I need you to give me a little time." },
        { id = "gr_after", when = { questDone = TODO_QUEST("Mortality Wanes") },
          text = "Thank you. Some days it sits lighter, and some days I find his handwriting in a margin and it's as if you'd only just come up the stairs." },
      },
      choices = {
        { text = "Elune keeps him now. He isn't lost.", next = "BACK", reply = "I want to believe that, and some nights I do. Thank you for saying it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Then let's make the quilboar pay.", next = "BACK", reply = "They should, and I hope they do, though I cannot ask it of you. Heralath would not want blood for him.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "May I pray with you?", next = "pray", when = { class = "PRIEST" } },
      },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "Not words, please; I've had my fill of the Temple's words this week. But sit here and be quiet with me, and I'll call that a prayer." },
      },
      choices = { { text = "I'll sit with you.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } } },
    },
    after = {
      lines = {
        { id = "af_default", text = "Finish what he started. I'm no druid, but I can read his notes and write to Falfindel Waywarder at Thalanaar, and someone will listen to a widow with a pendant in her hand." },
      },
      choices = {
        { text = "He'd be proud of you.", next = "BACK", reply = "I hope so, and I think he would. Thank you for saying it.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Let others carry it. You've given enough.", next = "BACK", reply = "Perhaps I have, but his work is all I have left of him. I cannot let it go yet.", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've read every one of Heralath's letters a dozen times, so I know more about the south than I ever meant to. Ask." } },
    background = { { id = "tp_bg", text = "I'm Heralath's wife, and I live above the shops on the Tradesmen's Terrace. That's all I've ever needed to be." } },
    advice = { { id = "tp_ad", text = "Write home, whoever waits for you. Write even when there's nothing to say." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Heralath took me to the Darkmoon Faire once, a long time ago, and won me a little stuffed saber. I still have it on the windowsill." } },
    elune = { { id = "tp_elune", text = "I pray to Elune every evening, mostly to keep Heralath out of trouble. She hasn't failed me yet, though it's been close." } },
    theramore = { { id = "tp_theramore", text = "My sister's son went to Theramore with a merchant's crew. He writes that the human food is heavy and the humans are kind, which sounds about right." } },
    _none = { { id = "tp_none", text = "I don't know, but Heralath would have." } },
  },
}

-- Darianna: apprentice leatherworker on the Craftsmen's Terrace; full of energy; learning from Faldron and Telonis.
P:NPC {
  key = "darianna", id = TODO_NPC("Darianna"), name = "Darianna",
  bible = "bibles/terraces.md", role = "worker", tier = "service",
  communities = { "darnassus" }, temper = { "eager", "chatty" }, values = { "curious", "friendly" },
  notices = { "craft" },

  impression = {
    first = "Darianna can't keep still for longer than a sentence, and she thinks her teachers Faldron and Telonis are the finest artists in Darnassus. Her enthusiasm is the catching kind.",
    third = "{name} met Darianna, an energetic apprentice leatherworker on the Craftsmen's Terrace.",
  },

  greetings = {
    { id = "g_hello", text = "Hello! Are you here about leather? Please say you're here about leather." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! I've learned two new stitches since you were here, and nearly a third." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather too? Show me your stitching, please, because I really want to see it; Faldron says I learn more from looking than from listening." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They have such patience and such an eye! Every stitch is perfect. Your spirits must have an eye for beauty too." } },
      choices = {
        { text = "Patient work makes fine art, Darianna.", next = "BACK", reply = "It does, and I am trying to learn it, though my stitches are still crooked. Faldron says I will get there.", fx = { align = { order = 1 } } },
        { text = "Art is a waste of time.", next = "BACK", reply = "Oh, it is not, not at all! You should see what Faldron can do with a scrap of leather.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Cloth, mostly, because Telonis says leather is for people who get stabbed, and priests are supposed to stand behind the people who get stabbed. But I've seen priestesses come back from Ashenvale with their robes in ribbons, so I wonder whether he's right." } },
      choices = {
        { text = "My faith is armor enough, Darianna.", next = "BACK", reply = "It is, I am sure, but Telonis says a little cloth never hurts. Faith and cloth together, perhaps?", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A good leather jerkin would serve me better than faith.", next = "BACK", reply = "Telonis would agree with you, I think, though he would never say so to a priest. I will tell him you said it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Faldron says so, and he's never wrong about these things, though he's sometimes wrong about lunch. A broken strap in a fight leaves you holding your own breastplate, which can't be very dignified for a paladin." } },
      choices = {
        { text = "Then I'll check my straps every morning.", next = "BACK", reply = "Good, and Faldron would be proud of you. A strap is a small thing, until it breaks.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If a strap breaks, I'll fight on regardless.", next = "BACK", reply = "You would, I think, but you would not like it. Faldron says a broken strap has lost more fights than any orc.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Faldron would sigh at the stitching and Telonis would want to know which orc did it, and then they'd both make it better than new! I'm only allowed to sweep while they work, but I watch everything, and someday I'll be the one sighing at your stitches." } },
      choices = {
        { text = "Leather mended by artists is worth the wait.", next = "BACK", reply = "It is, and they would be so pleased to hear you say it. I will tell them tonight.", fx = { align = { order = 1 } } },
        { text = "As long as it holds, I'm happy.", next = "BACK", reply = "It will hold, I promise you, and it will look lovely too. Telonis would never let it go out otherwise.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They're very particular, because Telonis says a badly skinned stag is an insult to the stag, but a clean hide from a hunter who knows the work always gets a smile. Radnaal Maneweaver taught half the skinners on Teldrassil, so if he taught you, say so!" },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} is beautiful, but please don't let it near the hides in the back, because the last companion took a whole bolt of leather for a bed." },
      },
      choices = {
        { text = "I take only what I can use, and skin it cleanly.", next = "BACK", reply = "Then Telonis would like you very much, and so would I. A clean hide is a gift.", fx = { align = { honor = 1 } } },
        { text = "I skin fast. Clean doesn't pay any better.", next = "BACK", reply = "It does, actually, because Telonis pays more for clean hides. But I understand.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Oh, I'd love to, because that's the most exacting work there is, and Telonis says I'm not ready for it yet. When I am, I'll make you something that won't make a sound, and I promise it won't be for anyone wicked." },
      },
      choices = {
        { text = "Make it for honest folk, Darianna, and you'll be proud.", next = "BACK", reply = "I will, I promise, and Telonis will make sure of it. I would hate to make something for a thief.", fx = { align = { light = 1 } } },
        { text = "Make it quiet. Who wears it is no concern of yours.", next = "BACK", reply = "Oh, that does not sound right at all. I will ask Telonis, and he will probably say no.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A little, though Faldron says I'm frightened of everything at first and I get over most of it. I don't think I'll get over this one, so would you mind keeping it on the other side of the workshop?" },
      },
      choices = {
        { text = "Of course. I'll keep it well away.", next = "BACK", reply = "Thank you, and I am sorry I am so silly about it. Faldron says I will get used to it, eventually.", fx = { align = { light = 1 } } },
        { text = "You'll get over it. Everyone does, eventually.", next = "BACK", reply = "I hope so, though I am not sure. It does smell very strange.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I don't really know yet, and I'm not sure Faldron does either, though Telonis says the shapeshifting does most of the work and the stitching only has to keep up. I've been practicing on a sabercat's harness, and the cat is not impressed." } },
      choices = {
        { text = "Don't guess, Darianna, and ask your teachers before you try.", next = "BACK", reply = "That is good advice, and I will, I promise. Faldron would be cross with me otherwise.", fx = { align = { order = 1 } } },
        { text = "Keep experimenting, because that's how anyone learns anything.", next = "BACK", reply = "That is what I keep telling Faldron! He does not agree, but I think you are right.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "No, not really, because Telonis says leather that's hurried cracks in the cold, and I believe everything Telonis says. But I'd love to make a mage's satchel one day, with a pocket for every reagent and a little charm stitched on it for luck." },
      },
      choices = {
        { text = "Take your time. Good work can't be rushed.", next = "BACK", reply = "You are right, and Telonis would agree with you. I will be patient.", fx = { align = { order = 1 } } },
        { text = "Rules are made for breaking. Try it.", next = "BACK", reply = "Oh, I could never, Telonis would be so cross with me. But it does sound exciting.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Oh, do priests wear leather? I suppose not, but I'll ask anyway, because Faldron says I should know who my customers might be." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Your armor's plate, isn't it, so you won't need anything from us, but could I look at the straps? Faldron says straps are where all armor fails." },
        { id = "h_default", text = "I am Darianna, and I'm learning leatherworking from Faldron and Telonis, who are true artists. It's so exciting to be here in Darnassus among such talented people, even if I'm mostly sweeping, and I've only been at it a century." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! Faldron says rogues buy the best leather, because a creaking jerkin gets you caught. Is that true?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Oh! I'm sorry, I nearly dropped my broom. Is that thing yours? It's watching the hides like it wants to eat them." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, your armor's taken a beating, hasn't it, and Faldron could have that leather mended in an afternoon!" },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Your hides must be wonderful; do you skin what you hunt, or do you leave it where it falls?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Faldron says druids are the hardest customers, because your armor has to forgive you every time you turn into a bear, and I think that's the most exciting problem in the world." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Oh, could you make the leather dry faster? I'm only joking, mostly, though Faldron says patience is half of it and I've never had much patience." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! My teachers Faldron and Telonis are the finest artists in Darnassus, and I wonder, do your spirits make art?" },
      },
      again = { { id = "h_again", text = "What else? Ask me quickly before Faldron gives me something to sew." } },
      choices = {
        { text = "Can you help me train?", next = "BUSINESS", when = { profession = "Leatherworking" } },
        { text = "What are your teachers like?", next = "teachers" },
        { text = "Do you want to be a crafter forever?", next = "future" },
        { text = "Would you like to make leather for rogues someday?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What would your teachers make of a warrior's armor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Would your teachers want the hides I bring in?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does my servant frighten you, Darianna?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do you think a priest should wear, Darianna?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Are straps really where all armor fails?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How does leather stretch to fit a bear, Darianna?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you really want magic to dry your leather?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What makes your teachers so fine, Darianna?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck with the stitching.", next = "END" },
      },
    },
    teachers = {
      lines = {
        { id = "te_default", text = "Faldron is patient and Telonis is particular, and between them they've caught every mistake I've ever made. Faldron says I'm too full of energy to sit still and listen, which is true, but he says it kindly." },
      },
      choices = {
        { text = "Listen to them. Patience comes with practice.", next = "BACK", reply = "I will, and I am trying, really I am. It is just hard to sit still.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Energy is a gift. Don't let them sand it off.", next = "BACK", reply = "Thank you, and I will tell them you said so. Faldron will sigh, and Telonis will pretend not to hear.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "What did Faldron say about you?", next = "teachers2" },
      },
    },
    teachers2 = {
      lines = {
        { id = "t2_default", text = "That with my strength and quickness I might be called to fight before long, so they'd better teach me quickly. I pretended I didn't hear, but I did." },
      },
      choices = {
        { text = "Would you go, if called?", next = "future" },
        { text = "Something else.", next = "BACK" },
      },
    },
    future = {
      lines = {
        { id = "fu_default", text = "I don't know! The Sentinels need bowstrings and bracers as much as they need archers, and somebody has to make them. But if they asked me to pick up a glaive, I suppose I would." },
      },
      choices = {
        { text = "Stay with the craft. It matters too.", next = "BACK", reply = "Thank you, and I think you may be right. The Sentinels need bracers as much as anyone.", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
        { text = "If you're called, answer.", next = "BACK", reply = "I would, I think, though I am not sure what it would be. Perhaps Elune will tell me.", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear everything on the Terrace, because I'm the one sweeping it. Ask me!" } },
    background = { { id = "tp_bg", text = "I'm an apprentice leatherworker. I'm good at cutting and terrible at sitting still." } },
    advice = { { id = "tp_ad", text = "Measure twice! Faldron makes me say it every morning." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Oh, the Darkmoon Faire! I'd go tomorrow if the master would let me off, but he says I'd come back with a monkey and no leather." } },
    booty_bay = { { id = "tp_booty_bay", text = "I'd love to see Booty Bay, with all those pirates and jungle beasts. I could make armor from tiger hide, and nobody here would ever stop talking about it." } },
    centaur = { { id = "tp_centaur", text = "Centaur leather is supposed to be tough. I've never seen any, and I suppose I'd rather not see where it came from." } },
    _none = { { id = "tp_none", text = "Oh, I don't know that one. Ask Telonis; he knows everything, or says he does." } },
  },
}
