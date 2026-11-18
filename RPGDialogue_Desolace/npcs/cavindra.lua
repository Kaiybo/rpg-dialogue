-- Cavindra, dryad daughter of Remulos, by a pool in the Foulspore caves outside Maraudon (Legends of Maraudon).
-- Neutral, speaks to both factions. Voice: bibles/cavindra.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "cavindra", id = TODO_NPC("Cavindra"), name = "Cavindra",
  bible = "bibles/cavindra.md", role = "questgiver", tier = "quest",
  communities = { "maraudon" }, temper = { "fragile", "gentle" }, values = { "family", "nature" },
  notices = { "race", "class", "fel" },
  impression = {
    first = "Cavindra is a dryad hiding in a pool at the mouth of Maraudon, shaking from what she saw inside. She escaped when her brother Celebras did not, and every word she says circles back to him.",
    third = "{name} met Cavindra, the dryad outside Maraudon who begs for help for her cursed brother Celebras.",
  },

  greetings = {
    { id = "g_default", text = "This place... it's cursed. Please, don't go further without listening to me first." },
    { id = "g_active", when = { questActive = TODO_QUEST("Legends of Maraudon") }, text = "The rod and the diamond, beyond the orange crystals and the purple. Please hurry; he's still in there." },
    { id = "g_done", when = { questDone = TODO_QUEST("Legends of Maraudon") }, text = "I have woken from a nightmare that I thought would never end. Thank you, thank you, a hundred times." },
    { id = "g_back", when = { metBefore = true }, text = "You came back out. I'm always so afraid nobody will." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A child of the kaldorei! My grandfather's people loved yours, long ago. Please, you'll understand what's been done to this place." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. You walk softly for something so large, as my father always said your people did, and the earth here remembers that kindly." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! You've walked the Dream, or you will, and my grandfather is the one who taught your teachers. Please, help my brother." },
    { id = "n_lock", cat = "fel", when = { class = "WARLOCK" },
      text = "You smell of the same darkness as the satyr in the purple caves. I'm frightened of you, but I'm more frightened for my brother, so I'll ask you anyway." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Cavindra, daughter of Remulos. A dark satyr called Lord Vyletongue has spread his evil through these twisting caves and poisoned the minds of everything inside, and my brother Celebras wanders in there blindly, cursed by it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Legends of Maraudon") },
          text = "Vyletongue lives beyond the purple crystals, and he made a living symbol of his corruption called Noxxion, who dwells beyond the orange ones. Together they stole the two parts of my brother's scepter; find them, please, and speak to my brother, somehow." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Legends of Maraudon") },
          text = "The Celebrian Rod, and the Celebrian Diamond, one from each of them. Once you have both, find Celebras, even if he fights you, especially if he fights you." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Legends of Maraudon"), days = 3 } },
          text = "Both parts, recovered! Now there's hope that Maraudon may one day be rid of the corruption, and that my brother may know himself again." },
        { id = "h_cleared", tags = { "news" }, when = { cleared = "Maraudon" },
          text = "I felt it when she fell, deep below, like a stone lifted off my chest. Uncle Zaetar's spirit is free, isn't it? I can almost hear him laughing, the way my father says he used to." },
        { id = "h_young", when = { maxLevel = 38 },
          text = "You're brave to come this far, but you're not strong enough for what's inside. Please, go back and grow stronger, and then come and find me; I'll still be here." },
      },
      again = {
        { id = "h_again", text = "What else? I'm sorry, I keep looking at the tunnel." },
        { id = "h_again2", text = "Ask me anything. It helps to talk; it keeps the whispers out." },
      },
      choices = {
        { text = "What happened to Celebras?", next = "celebras" },
        { text = "Who is Lord Vyletongue?", next = "vyletongue" },
        { text = "How did you escape?", next = "escape" },
        { text = "What is the scepter?", next = "scepter" },
        { text = "Why did your brother come here?", next = "zaetar" },
        { text = "What would you have me do?", next = "BUSINESS" },
        { text = "Stay safe, Cavindra.", next = "END" },
      },
    },

    celebras = {
      lines = {
        { id = "ce_default", text = "He's a keeper of the grove, like our father, noble and kind and far too sure of himself. The corruption got into his heart in the deep caves, and now he rages at anything that comes near, even me, and he doesn't know my name." },
      },
      choices = {
        { text = "Can he be saved?", next = "celebras_saved" },
        { text = "Something else.", next = "BACK" },
      },
    },
    celebras_saved = {
      lines = {
        { id = "cs_default", text = "I believe so, if he's beaten, if the rage is burned out of him. You may have to fight him to reach him, and I'm sorry to ask it, but please don't kill him if there's any other way." },
      },
      choices = {
        { text = "And if there isn't another way?", next = "celebras_choice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    celebras_choice = {
      big = true,
      lines = {
        { id = "cc_default", text = "Then... then I don't know. My father would say a keeper's death is a seed and something grows from it, but I don't want a seed, I want my brother." },
      },
      choices = {
        { text = "I'll bring him back to you, whatever it takes.", next = "BACK", reply = "Would you? Then I'll wait here, and I'll keep my roots in the ground until you come back with him.", fx = { align = { honor = 1 } } },
        { text = "If he's too far gone, I'll end it quickly.", next = "BACK", reply = "I hate that you said it, and I think you're right, so please, if it comes to that, be gentle.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    vyletongue = {
      lines = {
        { id = "vy_default", text = "A satyr, old and cruel, who came into these caves to spoil them, because they're holy and he can't bear anything holy. He laughs in the purple caves, and the laughter carries, and it got into my head before I ran." },
      },
      choices = {
        { text = "What did he say to you?", next = "vy_said" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vy_said = {
      big = true,
      lines = {
        { id = "vs_default", text = "That my brother was his now, and that my sisters were already roots in his garden. He lies, he always lies, but some lies are worse because you can't prove them wrong." },
      },
      choices = {
        { text = "Then I'll make him eat every word.", next = "BACK", reply = "Yes, please, and make him choke on them, and then come back and tell me how it sounded.", fx = { align = { light = -1 } } },
        { text = "He's a liar. Don't give his words a home.", next = "BACK", reply = "I'm trying, I really am, but they keep coming back at night, louder each time I close my eyes.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    escape = {
      lines = {
        { id = "es_default", text = "I didn't fight; I ran. My sisters stayed with Celebras, and I was the last one through the tunnel, and I heard them calling me back and I didn't turn round. I've been sitting in this pool ever since." },
      },
      choices = {
        { text = "Your sisters are still inside?", next = "escape_sisters" },
        { text = "Something else.", next = "BACK" },
      },
    },
    escape_sisters = {
      lines = {
        { id = "esi_default", text = "Some of them, wandering with him, corrupted too. If you see dryads in there who attack you, they might be my sisters, and I'm sorry, and I don't know what to tell you to do." },
      },
      choices = {
        { text = "Running was the right choice. You warned us.", next = "escape_shame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    escape_shame = {
      lines = {
        { id = "esh_default", text = "Do you think so? My father would be ashamed, I think, though he'd never say it. You're kind to say it, and I'll try to believe it, at least until you come back out." },
      },
      choices = {
        { text = "Your father would be proud you survived.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    scepter = {
      lines = {
        { id = "sc_default", text = "My brother's scepter, made of a rod of living wood and a diamond the colour of moonlight, the Celebrian Rod and the Celebrian Diamond. Vyletongue took the diamond, and Noxxion took the rod, and without them Celebras can't remember who he is." },
      },
      choices = {
        { text = "Who or what is Noxxion?", next = "noxxion" },
        { text = "Something else.", next = "BACK" },
      },
    },
    noxxion = {
      lines = {
        { id = "no_default", text = "Vyletongue's rot, given a body, all slime and spores and hunger, beyond the orange crystals where the pools turn foul. It isn't clever, but it doesn't need to be, and it hides more of itself in the water than you'd think." },
      },
      choices = {
        { text = "I'll bring the rod back.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    zaetar = {
      lines = {
        { id = "za_default", text = "For our uncle, Zaetar, my father's brother. His own children killed him, the first centaur, and the earth princess he loved, Theradras, keeps his spirit trapped down there; Celebras swore to set him free." },
      },
      choices = {
        { text = "The centaur killed their own father?", next = "zaetar_kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zaetar_kin = {
      big = true,
      lines = {
        { id = "zk_default", text = "They did, and so the centaur are my cousins, which I've never been able to make sense of. Some of the keepers say the centaur should all be driven out of Desolace for it, and some say they never chose to be what they are." },
      },
      choices = {
        { text = "They're your kin. They deserve a chance.", next = "BACK", reply = "Thank you, I've always thought so, though it's not a popular opinion among the keepers.", fx = { align = { order = -1 } } },
        { text = "Kin or not, they must answer for it.", next = "BACK", reply = "Perhaps they must, but I'm not sure who would judge them, or whether the judge would be any better.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A dryad of Moonglade, daughter of Remulos. I followed my brother here, and I wish I hadn't." } },
    advice = { { id = "tp_ad", text = "Follow the crystals' colours, and don't listen to the laughter." } },
    cenarion_circle = { { id = "tp_cc", text = "My father keeps Moonglade for them. He doesn't know yet what happened here, and I can't bring myself to send word." } },
    _none = { { id = "tp_none", text = "I don't know. I'm sorry; I don't know much outside these caves anymore." } },
  },
}
