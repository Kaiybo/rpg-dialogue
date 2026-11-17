-- Rethiel the Greenwarden: the marsh's ancient bog beast warden. Voice: bibles/greenwarden.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "wl_rethiel", id = TODO_NPC("Rethiel the Greenwarden"), name = "Rethiel the Greenwarden",
  bible = "bibles/greenwarden.md", role = "questgiver", tier = "quest",
  communities = { "menethil" }, temper = { "calm", "proud" }, values = { "nature", "patient", "wise" },
  notices = { "form", "fel", "class" },

  impression = {
    first = "Rethiel the Greenwarden rose out of the marsh like a hill deciding to stand. It speaks for the Wetlands as if every fern were a wounded child, and it has little patience for fire.",
    third = "{name} met Rethiel the Greenwarden, the ancient guardian of the Wetlands' marshes.",
  },

  greetings = {
    { id = "g_default", text = "The roots and ferns speak of you, small one. Come, and step softly on the moss." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the grove. The reeds bent toward you as you came, and that is a good sign." },
    { id = "g_away", when = { away = 14 }, text = "The marsh has turned many times since you were here, small one. It has missed few things, and it did not miss your absence." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown, as a sapling grows, by enduring weather. The land can feel it in your step." },
    { id = "g_paws", when = { questActive = TODO_QUEST("Tramping Paws") }, text = "The Mosshides still tramp the fen to the south, near the dwarven gate. Your task is still at hand." },
    { id = "g_flint", when = { questActive = TODO_QUEST("Fire Taboo") }, text = "I smell their fires even now. Bring me the flints, small one." },
  },

  notice = {
    { id = "n_form", cat = "form", when = { form = { "bear", "cat", "travel", "aquatic" } },
      text = "You wear the shape of a beast, and you wear it gently. The marsh knows a keeper of the wild when one walks in it." },
    { id = "n_fel", cat = "fel", when = { class = "WARLOCK" },
      text = "There is something in you that burns without fire, and the moss draws back from it. Speak, but do not linger in my grove." },
    { id = "n_mage", cat = "class", when = { class = "MAGE", faction = "Alliance" },
      text = "You carry fire in your hands, small one, and I feel it as a wound feels heat. Keep it closed while you stand among my roots." },
  },

  start = "hello",
  nodes = {
    opn_marsh = {
      lines = {
        { id = "opn_marsh_q", text = "The dwarves built their road across me, and the men of the harbour would drain me for barley if they could. They believe the land is theirs because they have cut it. You are one of the short-lived, small one, so tell me what your people believe." },
      },
      choices = {
        { text = "The land should feed people. Farms and roads are worth it.", next = "opn_marsh_r_tame", fx = { affinity = -1, align = { order = 1 }, opinion = { wl_marsh = "tame" } } },
        { text = "Leave the marsh as it is. It was here first.", next = "opn_marsh_r_protect", fx = { affinity = 1, align = { order = -1 }, opinion = { wl_marsh = "protect" } } },
        { text = "Take only what you need, and give some back.", next = "opn_marsh_r_balance", fx = { trait = { kind = 1 }, opinion = { wl_marsh = "balance" } } },
        { text = "The Dream holds every marsh. We are bound to tend it.", next = "opn_marsh_r_protect", when = { class = "DRUID" }, fx = { affinity = 2, opinion = { wl_marsh = "protect", druidism = "duty" } } },
        { text = "I couldn't speak for my people.", next = "BACK" },
      },
    },
    opn_marsh_r = {
      lines = {
        { id = "opn_marsh_r_default", text = "Then speak for yourself, in time. There is no hurry, for me." },
      },
      choices = {
        { text = "Something else, Greenwarden.", next = "BACK" },
      },
    },
    opn_marsh_r_tame = {
      lines = {
        { id = "opn_marsh_r_tame", text = "Then you are honest, at least, and honesty is rarer than barley. The marsh will outlast your farms, small one, as it has outlasted every road before them." },
      },
      choices = {
        { text = "Something else, Greenwarden.", next = "BACK" },
      },
    },
    opn_marsh_r_protect = {
      lines = {
        { id = "opn_marsh_r_protect", text = "Here first, and here last. I will remember that you said it, and the reeds will remember too, for they are slower to forget than I am." },
      },
      choices = {
        { text = "Something else, Greenwarden.", next = "BACK" },
      },
    },
    opn_marsh_r_balance = {
      lines = {
        { id = "opn_marsh_r_balance", text = "That is the oldest bargain there is, and the one your kind forgets first. Remember it when your hunger grows, which it will." },
      },
      choices = {
        { text = "Something else, Greenwarden.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Although I have many names, I answer to only a few, but you may call me Rethiel. These lands weep from festered wounds, and I would charge you to heal them." },
        { id = "h_first", tags = { "news" }, when = { questActive = TODO_QUEST("The Greenwarden") },
          text = "You came seeking the beast in the marsh, and you found it, and it has not bitten you in half. The roots and ferns speak well of you, so hearken to me." },
        { id = "h_paws_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tramping Paws"), days = 3 } },
          text = "The fen breathes more easily with fewer Mosshides upon it. My faith in your people has been taxed before, but it may yet be restored." },
        { id = "h_flint_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Fire Taboo"), days = 3 } },
          text = "Their flints are smashed and sunk in the sea, where they can never again burn living wood. The trees of the fen thank you, though they will not say so aloud." },
        { id = "h_blisters_done", tags = { "news" }, when = { questDone = TODO_QUEST("Blisters on The Land") },
          text = "The fever in the waters has broken, for now. The creepers settle back into the mud as they should, and the land is soothed by your hand." },
        { id = "h_highland", when = { questActive = TODO_QUEST("Horrors in the Highland") },
          text = "The corruption seeps down from the mountain gully, through the highland waters that have no salt to harden them. Bring me the horror's root core, small one." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A child of the Dreaming wild comes to my grove. You will hear the land's cry more clearly than most, and I am sorry for it." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A child of stone. Your people dig and build and do not always ask the marsh before they do, but some of you listen, and perhaps you are one." },
      },
      again = {
        { id = "h_again", text = "Speak again, small one. I am old, and I am in no hurry." },
        { id = "h_again2", text = "The reeds are listening. Ask what you would ask." },
      },
      choices = {
        { text = "What are you, Rethiel?", next = "what" },
        { text = "What wounds the land?", next = "wounds" },
        { text = "Why do the Mosshides trouble you?", next = "gnolls" },
        { text = "Why do you hate fire so?", next = "fire" },
        { text = "How does the marsh speak to you?", next = "druid", when = { class = "DRUID" } },
        { text = "I will tread softly. Farewell, Rethiel.", next = "END" },
      },
    },

    what = {
      lines = {
        { id = "wh_default", text = "A warden, grown from the marsh and bound to it, as old as the oldest roots beneath your feet. The townsfolk call me a beast and tell travellers to leave their gold behind, and I let them, for fear keeps them out of my grove." },
      },
      choices = {
        { text = "How old are you?", next = "what_old" },
        { text = "Something else.", next = "BACK" },
      },
    },
    what_old = {
      lines = {
        { id = "wo_default", text = "Older than the harbour, and older than the dwarven road through the mountains. I remember when the marsh ran unbroken from the sea to the hills, before any of you came with axes." },
      },
      choices = { { text = "Something else, Rethiel.", next = "BACK" } },
    },

    wounds = {
      lines = {
        { id = "wo2_default", text = "Many, and they fester. The gnolls trample and burn, a sickness rises in the waters, and the creatures of the fen grow fevered and strange, though I do not yet know why." },
        { id = "wo2_highland", when = { questDone = TODO_QUEST("Horrors in the Highland") },
          text = "It is worse than I feared, for an ancient energy stirs in the high country. Tell your eager excavators to stop digging, for their own safety, though I doubt they will hear it." },
      },
      choices = {
        { text = "What sickness rises in the waters?", next = "wounds_sick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounds_sick = {
      big = true,
      lines = {
        { id = "ws_default", text = "The fen creepers have risen, diseased blisters on the land, and for the fever to break they must be put down and allowed to settle into the mud again. It grieves me, but a wound must be lanced before it can heal." },
      },
      choices = {
        { text = "Then I'll lance it. The land comes first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Perhaps the healers could cure them instead.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gnolls = {
      lines = {
        { id = "gn_default", text = "The Mosshides lived in the Wetlands peacefully for many years, but now they grow in number. Their feet stamp flat the fen's flowers and their axes cut too much wood, and they are no longer in balance with the land." },
      },
      choices = {
        { text = "So you would have them killed?", next = "gnolls_kill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnolls_kill = {
      big = true,
      lines = {
        { id = "gk_default", text = "I would have them fewer, and the marsh cannot ask kindly. A forest culls its weak trees with storms, small one, and I have no storms, so I have you." },
      },
      choices = {
        { text = "Balance is worth the blood. I'll do it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll do it, but I take no joy in it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fire = {
      lines = {
        { id = "fi_default", text = "Because fire eats what it touches and gives nothing back, and the Mosshides feed it with the flesh of my trees. I will suffer that pain no longer." },
      },
      choices = {
        { text = "Fire keeps people warm, Rethiel.", next = "fire_warm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire_warm = {
      lines = {
        { id = "fw_default", text = "Dead wood fallen to the ground keeps a gnoll as warm as a living tree, and the marsh drops plenty of it. They cut because it is easier, and the easier way is how every wound begins." },
      },
      choices = {
        { text = "Should the marsh be tamed, for farms and roads?", next = "opn_marsh" },
        { text = "Something else, Rethiel.", next = "BACK" },
      },
    },

    druid = {
      lines = {
        { id = "dr_default", text = "As it speaks to you, through root and water and the movements of small things. Here it speaks slowly, for the marsh is old and sick, and it must be listened to with patience." },
      },
      choices = {
        { text = "I'll listen, and I'll help it heal.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The roots carry word from one end of the marsh to the other, slowly, but they carry it. Ask, and I will tell you what they have said." } },
    background = { { id = "tp_bg", text = "I am the Greenwarden. The marsh made me to keep it, and I keep it still." } },
    advice = { { id = "tp_ad", text = "Burn nothing that still grows, small one, and the marsh will be kinder to you." } },
    dragonmaw = { { id = "tp_dm", text = "Orcs with chained beasts in the eastern hills. They burn more than any gnoll, and I can do nothing about them." } },
    _none = { { id = "tp_none", text = "The roots have said nothing of that. Ask in the harbour, where the small ones gather." } },
  },
}
