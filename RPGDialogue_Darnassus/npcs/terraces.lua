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
        { text = "I'll go back when I'm stronger.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I left because one watch wasn't enough.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    hello = {
      lines = {
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
      },
      again = {
        { id = "h_again", text = "What else? Make it worth the time." },
        { id = "h_again2", text = "Go on. I'll answer what I can." },
      },
      choices = {
        { text = "Who was Velinde Starsong?", next = "velinde" },
        { text = "How goes the war in Ashenvale?", next = "ashenvale" },
        { text = "What does a Sentinel commander do here?", next = "duty" },
        { text = "Will you tell the High Priestess about Velinde?", next = "tell", when = { questDone = TODO_QUEST("Answered Questions") } },
        { text = "Did Velinde pray as a priestess or fight as a Sentinel?", next = "both", when = { class = "PRIEST" } },
        { text = "Do the Sentinels need another bow?", next = "hunter_tb", when = { class = "HUNTER" } },
        { text = "I stood the watch at Auberdine.", next = "watch_tb", when = { origin = "nightelf_auberdine_watch" } },
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
        { text = "Her secrets should stay with the Sentinels.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Her people deserve the truth about her.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    velinde2 = {
      lines = {
        { id = "v2_default", text = "No. We believed she had her own reasons for leaving and would come back when she was ready, because she had done a great deal to earn our trust. I still believe she had reasons, even if I'll never hear them now." },
      },
      choices = {
        { text = "Trust like that is rare.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Trust like that gets Sentinels killed.", next = "BACK", fx = { align = { honor = -1 }, trait = { skeptical = 1 } } },
      },
    },
    ashenvale = {
      big = true,
      lines = {
        { id = "as_default", text = "The Warsong cut the forest, and we cut them, and the trees pay for both. We hold Astranaar and the roads, but every season the axes come back, and every season I sign more names for the Temple." },
      },
      choices = {
        { text = "Then drive them out for good.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 }, learn = { "warsong" } } },
        { text = "Neither side can win this. Seek a truce.", next = "BACK", fx = { align = { honor = -1 }, affinity = -1, learn = { "warsong" } } },
        { text = "What do you need most?", next = "ashenvale2" },
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
        { text = "That was the right thing to do.", next = "BACK", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Some news is kinder left unsaid.", next = "BACK", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
      },
    },
    both = {
      lines = {
        { id = "bo_default", text = "Both, and she saw no difference between them, which is how the Sisterhood has always been. She'd pray over a wounded Sentinel and then go out and find the thing that wounded her." },
      },
      choices = {
        { text = "Healing and fighting belong together.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "A healer should keep out of the fighting.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
      },
    },
    duty = {
      lines = {
        { id = "du_default", text = "Assign patrols, read the reports from the borders and decide who goes where. It is less glorious than it sounds and far more ink." },
      },
      choices = {
        { text = "Someone has to do the ink.", next = "BACK", fx = { align = { order = 1 }, trait = { witty = 1 } } },
        { text = "I'd rather be on the borders.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Reports cross my table from every border we hold. Ask, and I'll tell you what isn't sealed." } },
    background = { { id = "tp_bg", text = "I command Sentinels. I've done it a long while, and I'll do it until someone better comes along." } },
    advice = { { id = "tp_ad", text = "Report what you saw, not what you think it meant. I can do the thinking." } },
    sentinels = { { id = "tp_sentinels", text = "We are the walls of Darnassus and the eyes of Ashenvale. Every one of us is needed, and every one we lose is felt." } },
    warsong = { { id = "tp_warsong", text = "Orcs who cut our forest and call it lumber. We answer them in Ashenvale, every season." } },
    _none = { { id = "tp_none", text = "That isn't a Sentinel matter. Ask in the Temple or the Enclave." } },
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
        { text = "Nerve and a good shield. That's enough.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Elanaria, and I help shape the warriors of Darnassus. There is more to the profession than swinging a blade, and I find out quickly who knows it." },
        { id = "h_elanaria", tags = { "news" }, when = { questActive = TODO_QUEST("Elanaria") },
          text = "Your name rings loudly in Darnassus, for you show promise. We shall soon see whether you have the will to follow the warrior's path, though." },
        { id = "h_vorlus", tags = { "news" }, when = { questActive = TODO_QUEST("Vorlus Vilehoof") },
          text = "The satyr Vorlus Vilehoof splashes in our moonwell southeast of the Ban'ethil Barrow Den, fouling its water. The path to it is well hidden, so stay alert, and bring me his horn." },
        { id = "h_elura", tags = { "news" }, when = { questActive = TODO_QUEST("The Shade of Elura") },
          text = "Elunite lies scattered on the sea floor near the Auberdine lighthouse, where a ship broke on the rocks long ago. Its captain cursed herself to guard the cargo forever, so give her peace, and bring the ore to me." },
        { id = "h_elura_done", when = { questDone = TODO_QUEST("The Shade of Elura") },
          text = "You gave the Shade of Elura her rest, and Mathiel has the elunite. A warrior's weapon, made from a blessed metal, by your own hand's effort; wield it well." },
      },
      again = {
        { id = "h_again", text = "What else, warrior? Speak quickly; the Terrace doesn't sit still." },
        { id = "h_again2", text = "Go on." },
      },
      choices = {
        { text = "What makes a warrior, to you?", next = "warrior" },
        { text = "Why does a satyr matter so much?", next = "vorlus" },
        { text = "Tell me about the elunite wreck.", next = "elura" },
        { text = "Do the Sentinels fight like you?", next = "sentinels" },
        { text = "Test me, then. I'm ready.", next = "test", when = { class = "WARRIOR" } },
        { text = "Which weapon should I master?", next = "weapons", when = { class = "WARRIOR" } },
        { text = "Ironforge trained me. Will you test me anyway?", next = "dwarf_e", when = { race = "Dwarf", class = "WARRIOR" } },
        { text = "Gnomes fight too, you know.", next = "gnome_e", when = { race = "Gnome", class = "WARRIOR" } },
        { text = "I'll leave you to the Terrace.", next = "END" },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "Resolve, first, and then strength, and then skill, and many young ones learn them backwards. A warrior is the one who stays in the fight after everyone else has a reason to leave." },
      },
      choices = {
        { text = "Staying is honorable, whatever it costs.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "A wise warrior knows when to withdraw.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
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
        { text = "Then it was well cleansed.", next = "BACK", fx = { align = { light = 1 }, learn = { "satyrs" } } },
        { text = "A wall would have saved the trouble.", next = "BACK", fx = { align = { light = -1 }, trait = { witty = 1 }, learn = { "satyrs" } } },
      },
    },
    elura = {
      lines = {
        { id = "el_default", text = "A ship carrying elunite broke on the rocks below the Auberdine lighthouse, and the crates lie on the sea floor still. Elunite is blessed by Elune, and Mathiel the smith would sooner work it than any other metal." },
      },
      choices = {
        { text = "And the captain who guards it?", next = "elura2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elura2 = {
      lines = {
        { id = "e2_default", text = "Elura cursed herself to protect her shipment for all time, and she has. Defeating her is a kindness, though she won't thank you for it until it's over." },
      },
      choices = {
        { text = "Loyal past death. I respect that.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Her oath should have died with her.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    test = {
      lines = {
        { id = "ts_default", text = "Everyone says that, and half of them mean it. The test isn't here on the Terrace; it's out in the forest, when you're tired and alone and nobody would know if you turned back." },
        { id = "ts_done", when = { questDone = TODO_QUEST("Vorlus Vilehoof") },
          text = "You've already passed one, at the moonwell. The next will be harder, because they always are, and that is the point." },
      },
      choices = {
        { text = "Then I'll never turn back.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I'll turn back when it's wise, and live.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
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
    _none = { { id = "tp_none", text = "That isn't a warrior's concern. Ask elsewhere." } },
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
        { text = "A blade's a blade. The arm matters.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll carry it with that in mind.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Mathiel, a smith of the Terrace, and I'll mend anything the Sentinels or the adventurers bring me. Every repair puts a little more toward an anvil of my own, so I'm grateful for the work." },
        { id = "h_elunite", tags = { "news" }, when = { questActive = TODO_QUEST("Smith Mathiel") },
          text = "Elunite ore! This is a fine metal to work, for it's blessed by Elune herself. It would be an honor to make you a weapon of it, so wait here while I work." },
        { id = "h_weapons", when = { questActive = TODO_QUEST("Weapons of Elunite") },
          text = "Here they are, the weapons I made from your elunite. Take whichever suits you; working that metal is both an honor and a pleasure, and I thank you for it." },
        { id = "h_furen", tags = { "news" }, when = { questActive = TODO_QUEST("Mathiel") },
          text = "Notes from Furen Longbeard, all the way from Stormwind? These are very interesting indeed; my dwarven colleague has made quite a discovery. It'll be an honor to try his methods." },
        { id = "h_shells", tags = { "news" }, when = { questActive = TODO_QUEST("Sunscorched Shells") },
          text = "The Highperch wyverns in Thousand Needles lay eggs with shells baked hard by the sun. Gather me enough from beneath their nests and I'll make an extra piece of armor for you." },
        { id = "h_armor", when = { questDone = TODO_QUEST("Mathiel's Armor") },
          text = "How's the armor wearing? Furen's techniques meshed beautifully with mine, and I've written to tell him so, at some length." },
        { id = "h_klock", tags = { "news" }, when = { questActive = TODO_QUEST("Klockmort's Essentials") },
          text = "Klockmort Spannerspan needs help in Gnomeregan, and I can't leave the forge. My heart aches for my friend, so if you go in my place, I'll be in your debt." },
      },
      again = {
        { id = "h_again", text = "Ask on, then, while the elunite cools; it takes its time and so may you." },
        { id = "h_again2", text = "Ask away, friend; the iron's still heating." },
      },
      choices = {
        { text = "Can you repair my gear?", next = "BUSINESS" },
        { text = "What's special about elunite?", next = "elunite" },
        { text = "You have friends in Stormwind and Ironforge?", next = "friends" },
        { text = "You don't have your own anvil?", next = "anvil" },
        { text = "What did Furen's notes teach you?", next = "furen", when = { profession = "Blacksmithing" } },
        { text = "Do you know Klockmort Spannerspan?", next = "gnome_m", when = { race = "Gnome" } },
        { text = "What would elunite do for a warrior's blade?", next = "warrior_m", when = { class = "WARRIOR" } },
        { text = "Good luck at the forge.", next = "END" },
      },
    },
    elunite = {
      big = true,
      lines = {
        { id = "eu_default", text = "It's blessed by Elune, and you can feel it under the hammer; it rings clear where iron would grumble. Miners can't use it in their crafts and most smiths never see it, so a piece of elunite is a gift." },
      },
      choices = {
        { text = "A blessed weapon should only fight evil.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A good weapon is a good weapon.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Knowledge should be shared freely.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Guild secrets exist for a reason.", next = "BACK", fx = { align = { order = 1 } } },
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
        { text = "The old ways exist for a reason.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Try the new way. It worked.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
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
        { text = "Something martial. It's an anvil.", next = "BACK", fx = { align = { honor = 1 }, trait = { witty = 1 } } },
        { text = "Something kind. It deserves it.", next = "BACK", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A smith hears all sorts while the iron heats. Ask, and I'll tell you what came through the forge." } },
    background = { { id = "tp_bg", text = "I'm a smith. I mend, I make, and I write long letters to dwarves about folding steel." } },
    advice = { { id = "tp_ad", text = "Have your gear seen to before it breaks, not after. It's cheaper, and you'll still be alive." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Klockmort's old home, overrun now. He writes about it as if it were a friend who'd fallen ill." } },
    _none = { { id = "tp_none", text = "I couldn't say, friend, for I'm only a smith." } },
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
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Greetings. Do you seek instruction in the art of war?" },
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
    hello = {
      lines = {
        { id = "h_default", text = "I am Arias'ta Bladesinger, and I teach the art of war on this Terrace. I can see the warrior's spirit in those who have it, and I teach only them." },
      },
      again = { { id = "h_again", text = "Something more? Ask, and then let me return to my students." } },
      choices = {
        { text = "Instruct me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What is the warrior's spirit?", next = "spirit" },
        { text = "Why 'Bladesinger'?", next = "name" },
        { text = "What do your stances teach?", next = "stances", when = { class = "WARRIOR" } },
        { text = "Stormwind's guard taught me already.", next = "guard_a", when = { origin = "human_city_guard" } },
        { text = "Farewell.", next = "END" },
      },
    },
    spirit = {
      lines = {
        { id = "sp_default", text = "The part of you that steps forward when the others step back. It can be trained, but it cannot be taught to someone who hasn't got it." },
      },
      choices = {
        { text = "Courage can be learned by anyone.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Some are born for it. I agree.", next = "BACK", fx = { align = { order = 1 } } },
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
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear what my students say between bouts. Ask, if you must." } },
    background = { { id = "tp_bg", text = "I teach warriors. I have done so for a long time." } },
    advice = { { id = "tp_ad", text = "Listen to your blade. It will tell you when you're careless." } },
    _none = { { id = "tp_none", text = "That is no matter for a warrior trainer." } },
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
    paladin_m = {
      lines = {
        { id = "pm_default", text = "Hear, hear! I've cried that proclamation in every corner of this city, and mostly I get polite nods from kaldorei who've never seen a ghoul. A paladin, though, now there's someone the Argent Dawn will be glad of!" },
      },
      choices = {
        { text = "Then I'll go to Light's Hope.", next = "BACK", fx = { affinity = 1, learn = { "new_plague" } } },
        { text = "Not yet. I've work closer to home.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Herald Moonstalker, crier of Darnassus! I walk every path in the city so that no hero misses a summons, and my feet will tell you I take that seriously." },
        { id = "h_plague", tags = { "news" }, when = { questActive = TODO_QUEST("A Call to Arms: The Plaguelands!") },
          text = "Hear ye! Stormwind calls heroes to the Plaguelands, where the Scourge stirs again. Commander Ashlam Valorfist keeps his camp at Chillwind, north of the Alterac Mountains." },
        { id = "h_frontier", tags = { "news" }, when = { questActive = TODO_QUEST("The New Frontier") },
          text = "The Cenarion Circle seeks brave proxies for the wastes west of Tanaris! The Arch Druid will tell you more, though I'd go in prepared for his manner." },
        { id = "h_feather", tags = { "news" }, when = { questActive = TODO_QUEST("Feathermoon Stronghold") },
          text = "Your aid is needed in Feralas! An outlaw mage has fled into the ruins of Eldre'Thalas with something dangerous, and Latronicus Moonspear at Feathermoon wants it back." },
      },
      again = {
        { id = "h_again", text = "More news? I've plenty!" },
        { id = "h_again2", text = "Ask away; a crier never runs dry." },
      },
      choices = {
        { text = "What's the news from the Eastern Kingdoms?", next = "east" },
        { text = "What's happening in Kalimdor?", next = "kalimdor" },
        { text = "What's the strangest news you've cried?", next = "strange" },
        { text = "Is there a call for healers anywhere?", next = "healers", when = { class = { "PRIEST", "DRUID", "PALADIN", "SHAMAN" } } },
        { text = "The Plaguelands call, and the Light answers.", next = "paladin_m", when = { class = "PALADIN" } },
        { text = "Thank you, Herald.", next = "END" },
      },
    },
    east = {
      lines = {
        { id = "ea_default", text = "Stormwind calls for heroes to stand against the Scourge in the Plaguelands, where rumors say new horrors are rising from the ruins. Chillwind Camp is the place to report, north of the Alterac Mountains." },
      },
      choices = {
        { text = "The dead must be put down. I'll answer.", next = "BACK", fx = { align = { light = 1 }, trait = { brave = 1 }, learn = { "new_plague" } } },
        { text = "Stormwind should fight its own wars.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "What is the Scourge, exactly?", next = "east2" },
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
        { text = "Our own continent comes first.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'll go wherever the reward is.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
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
        { text = "I'll go where the dying are.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I'll go where my own people need me.", next = "BACK", fx = { align = { light = -1 } } },
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
    hello = {
      lines = {
        { id = "h_default", text = "I'm Mydrannul, and I keep the Terrace in food, drink and the hundred small things a hero forgets until they're halfway to Ashenvale. It's an honor, and I mean that." },
        { id = "h_nessa", tags = { "news" }, when = { questActive = TODO_QUEST("Nessa Shadowsong") },
          text = "My friend Nessa Shadowsong sells fish down in Rut'theran Village, and she needs a parcel carried to Darkshore. Take the portal west of the Temple Gardens, and you'll find her by the water." },
      },
      again = { { id = "h_again", text = "Anything else? Take your time." } },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "Why call us heroes in the making?", next = "heroes" },
        { text = "Who is Nessa Shadowsong?", next = "nessa" },
        { text = "Farewell.", next = "END" },
      },
    },
    heroes = {
      lines = {
        { id = "he_default", text = "Because some of the ones who buy bread from me come back with stories the whole Terrace repeats. I can't tell which ones by looking, so I treat you all the same." },
      },
      choices = {
        { text = "That's a generous way to see people.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Heroes are made by deeds, not hope.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
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
    _none = { { id = "tp_none", text = "I wouldn't know about that, friend. I only sell the supplies." } },
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
    druid_tr = {
      lines = {
        { id = "dtr_default", text = "Won't it? The Enclave sent him south alone, and they've sent me nothing but a polite letter since. If you mean it, then read his notes when you're done in the Kraul and tell me whether he was right." },
      },
      choices = {
        { text = "I'll read them. I promise.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The Circle has bigger troubles. I'm sorry.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Treshala Fallowbrook. My husband, Heralath, went south to the Barrens to study the quilboar and the rumors about their fallen boar god, and I wait here for his letters." },
        { id = "h_pendant", tags = { "news" }, when = { questActive = TODO_QUEST("Mortality Wanes") },
          text = "That's my pendant, the one Heralath and I exchanged when we were bonded. Why do you have it, and why are you looking at me like that?" },
        { id = "h_after", when = { questDone = TODO_QUEST("Mortality Wanes") },
          text = "I've his notes on the Kraul spread across every table. I'll not let his work die with him, whatever it costs me, and you can tell anyone who asks that I said so." },
      },
      again = {
        { id = "h_again", text = "Is there more? Please, I don't mind the company." },
        { id = "h_again2", when = { questDone = TODO_QUEST("Mortality Wanes") }, text = "Ask what you like, because talking about him helps." },
      },
      choices = {
        { text = "What was Heralath studying?", next = "work" },
        { text = "How long since his last letter?", next = "letters", when = { ["not"] = { questDone = TODO_QUEST("Mortality Wanes") } } },
        { text = "I'm sorry for your loss.", next = "grief", when = { any = { { questActive = TODO_QUEST("Mortality Wanes") }, { questDone = TODO_QUEST("Mortality Wanes") } } } },
        { text = "What will you do now?", next = "after", when = { questDone = TODO_QUEST("Mortality Wanes") } },
        { text = "The Circle won't forget Heralath.", next = "druid_tr", when = { class = "DRUID" } },
        { text = "I'll leave you in peace.", next = "END" },
      },
    },
    work = {
      lines = {
        { id = "wo_default", text = "The Razorfen, the quilboar's warrens in the southern Barrens, and the corruption in them. He thought it had something to do with Agamaggan, a great boar the quilboar say died there long ago." },
      },
      choices = {
        { text = "Dangerous work for a scholar.", next = "work2" },
        { text = "The Circle should send more than one druid.", next = "BACK", fx = { align = { order = 1 }, learn = { "cenarion_circle" } } },
        { text = "Some things are best studied alone.", next = "BACK", fx = { align = { order = -1 }, learn = { "cenarion_circle" } } },
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
        { text = "I'll look for him.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I won't promise what I may not keep.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
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
        { text = "Elune keeps him now. He isn't lost.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Then let's make the quilboar pay.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
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
        { text = "He'd be proud of you.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Let others carry it. You've given enough.", next = "BACK", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've read every one of Heralath's letters a dozen times, so I know more about the south than I ever meant to. Ask." } },
    background = { { id = "tp_bg", text = "I'm Heralath's wife, and I live above the shops on the Tradesmen's Terrace. That's all I've ever needed to be." } },
    advice = { { id = "tp_ad", text = "Write home, whoever waits for you. Write even when there's nothing to say." } },
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
    hello = {
      lines = {
        { id = "h_default", text = "I'm Darianna, and I'm learning leatherworking from Faldron and Telonis, who are true artists. It's so exciting to be here in Darnassus with talented people all around, even if I'm mostly sweeping." },
      },
      again = { { id = "h_again", text = "What else? Ask me quickly before Faldron gives me something to sew." } },
      choices = {
        { text = "Can you help me train?", next = "BUSINESS", when = { profession = "Leatherworking" } },
        { text = "What are your teachers like?", next = "teachers" },
        { text = "Do you want to be a crafter forever?", next = "future" },
        { text = "Good luck with the stitching.", next = "END" },
      },
    },
    teachers = {
      lines = {
        { id = "te_default", text = "Faldron is patient and Telonis is particular, and between them they've caught every mistake I've ever made. Faldron says I'm too full of energy to sit still and listen, which is true, but he says it kindly." },
      },
      choices = {
        { text = "Listen to them. Patience comes with practice.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Energy is a gift. Don't let them sand it off.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
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
        { text = "Stay with the craft. It matters too.", next = "BACK", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
        { text = "If you're called, answer.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear everything on the Terrace, because I'm the one sweeping it. Ask me!" } },
    background = { { id = "tp_bg", text = "I'm an apprentice leatherworker. I'm good at cutting and terrible at sitting still." } },
    advice = { { id = "tp_ad", text = "Measure twice! Faldron makes me say it every morning." } },
    _none = { { id = "tp_none", text = "Oh, I don't know that one. Ask Telonis; he knows everything, or says he does." } },
  },
}
