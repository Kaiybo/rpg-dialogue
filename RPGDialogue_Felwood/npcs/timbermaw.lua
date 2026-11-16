-- Felwood's north and the Irontree woods (0.38.0): the Timbermaw at their hold, and a warlock's imp out in the wilds. Voice: bibles/felwood.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "grazle", id = TODO_NPC("Grazle"), name = "Grazle", title = "",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "wary" }, values = { "loyal", "protective" },
  impression = {
    first = "Grazle is a Timbermaw furbolg who waits outside the tunnels of Timbermaw Hold, testing outsiders before they are let near his people. He is slow to trust and clear about why.",
    third = "{name} met Grazle, the Timbermaw furbolg who guards the way to Timbermaw Hold in Felwood.",
  },

  greetings = {
    { id = "g_default", text = "Stop there, stranger. The Timbermaw do not let just anyone walk into our hold." },
    { id = "g_back", when = { metBefore = true }, text = "Grazle remembers you. The Deadwood remember you too, Grazle thinks, and not fondly." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Our shamans hear the earth crying under the Deadwood camps, where the corruption soaked in deepest. The spirits there no longer answer the Deadwood, and Grazle thinks that is how the madness took them: they stopped listening, and something else began to talk. You understand this, shaman, better than the others who come to Grazle's door." } },
      choices = {
        { text = "Your elders should decide what's done here, not outsiders.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Waiting on elders heals nothing. Someone has to act.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The Timbermaw have shamans of their own, and Grazle knows the look, so you may stand a little closer than most outsiders." },
        { id = "h_default", text = "I am Grazle of the Timbermaw. Our cousins the Deadwood have taken the corruption into themselves, and they attack anyone who walks these woods, Timbermaw included." },
        { id = "h_cond", when = { class = "DRUID" }, text = "A druid, who knows the forest is sick. You will understand why the Timbermaw guard our door so closely." },
      },
      again = {
        { id = "h_again1", text = "Grazle will hear another question, if it is a short one." },
        { id = "h_again2", text = "Speak. Grazle listens." },
      },
      choices = {
        { text = "What do your shamans hear from the Deadwood's land?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What happened to the Deadwood?", next = "deadwood" },
        { text = "What is Timbermaw Hold?", next = "hold" },
        { text = "Why distrust outsiders?", next = "outsiders" },
        { text = "The Circle hopes the furbolgs can be healed.", next = "druidg", when = { class = "DRUID" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    deadwood = {
      lines = {
        { id = "deadwood_default", text = "The fel in the soil got into their water and their food, and then into their minds, and now they are not furbolgs at all, only anger in fur. If you show Grazle you will fight the Deadwood, the Timbermaw may call you a friend." },
      },
      choices = {
        { text = "Fight your own kin?", next = "deadwood2" },
      },
    },
    deadwood2 = {
      lines = {
        { id = "deadwood2_default", text = "They are not our kin anymore, though it shames Grazle to say so. Some Timbermaw hope the druids can heal them, and some say only an axe will bring them peace now." },
      },
      choices = {
        { text = "Keep hoping for a cure. They're still your people.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Give them peace, then. Waiting only spreads it.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    hold = {
      lines = {
        { id = "hold_default", text = "Our home, under the mountain, with tunnels that run all the way to Winterspring. The Timbermaw alone of the furbolgs kept clean, because we kept apart, and we will keep apart a while longer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    outsiders = {
      lines = {
        { id = "outsiders_default", text = "Because the elves call furbolgs beasts and the orcs call us targets, and few come to Felwood to make friends. Grazle judges by deeds, so show Grazle yours." },
      },
      choices = {
        { text = "Fair enough.", next = "BACK" },
      },
    },
    druidg = {
      lines = {
        { id = "druidg_default", text = "Then tell the Circle to hurry, for Felwood does not wait. Grazle would welcome the druids, if they come to help and not to lecture." },
      },
      choices = {
        { text = "I'll pass it on.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Grazle is Timbermaw, and Grazle guards the door." } },
    _none = { { id = "tp_none", text = "Grazle does not know. Ask the elders inside, if they will let you in." } },
  },
}

P:NPC {
  key = "nafien", id = TODO_NPC("Nafien"), name = "Nafien", title = "",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "timbermaw_felwood" }, temper = { "grim" }, values = { "practical", "loyal" },
  impression = {
    first = "Nafien is a Timbermaw furbolg who hunts the Deadwood and asks outsiders to help him do it. He takes no joy in it, but he doesn't flinch from it either.",
    third = "{name} met Nafien, a Timbermaw furbolg fighting the corrupted Deadwood in northern Felwood.",
  },

  greetings = {
    { id = "g_default", text = "You smell of the Deadwood camps. Good, then you have been doing useful work." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Nafien has more work, if your arms are not tired." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They carve them from blackened wood and paint them in the colours of the corruption, and still they pray to them. The spirits will not live in such things, so the Deadwood pray to nothing, or to something worse than nothing. Every totem you bring to Nafien is one less mouth for the corruption to speak through." } },
      choices = {
        { text = "A defiled totem should be burned with respect, not hoarded.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A totem's a trophy. I'll bring you every one I find.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and Nafien is glad of it, because a shaman knows a totem when he sees one, and the Deadwood carve theirs wrong now." },
        { id = "h_default", text = "I am Nafien. The Deadwood keep their camps to the south of our hold, and every feather and totem they carry is a mark of the corruption in them. Bring them to me, and the Timbermaw will know whose side you stand on." },
        { id = "h_cond", when = { class = "HUNTER" }, text = "A hunter, good. The Deadwood are not beasts, but they hunt like beasts now, and you will know how to answer that." },
      },
      again = {
        { id = "h_again1", text = "What else?" },
        { id = "h_again2", text = "Speak, then." },
      },
      choices = {
        { text = "What did the Deadwood do to their totems?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why the feathers and totems?", next = "totems" },
        { text = "Are the Timbermaw at war?", next = "tribe" },
        { text = "Is anywhere in Felwood still clean?", next = "felwood" },
        { text = "I'll track them for you.", next = "hunterq", when = { class = "HUNTER" } },
        { text = "Good hunting, Nafien.", next = "END" },
      },
    },
    totems = {
      lines = {
        { id = "totems_default", text = "The Deadwood wear them as charms, and carve them with marks that came from no furbolg's mind. When we burn them, it weakens whatever whispers to the tribe." },
      },
      choices = {
        { text = "Does it trouble you, killing them?", next = "totems2" },
      },
    },
    totems2 = {
      lines = {
        { id = "totems2_default", text = "Every night, but the Deadwood would kill our cubs if we let them near. Some outsiders take the work for the reward, and some because it is right, and Nafien cannot always tell the difference." },
      },
      choices = {
        { text = "I do it because it's right.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll be honest. I do it for the reputation.", next = "BACK", fx = { align = { order = -1 }, trait = { honest = 1 } } },
      },
    },
    tribe = {
      lines = {
        { id = "tribe_default", text = "We have been at war since the forest sickened, though we rarely leave the hold to fight it. Nafien leaves, because someone has to, and the elders let him because he comes back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood = {
      lines = {
        { id = "felwood_default", text = "The places the druids guard, and our hold, and little else. Even the rain here tastes wrong, and Nafien remembers when it did not." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hunterq = {
      lines = {
        { id = "hunterq_default", text = "Then go south toward the camps, and watch for their shamans first, because the warriors break when the shamans fall." },
      },
      choices = {
        { text = "Understood.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Nafien is Timbermaw, and Nafien hunts what our cousins became." } },
    _none = { { id = "tp_none", text = "Nafien does not know, and does not pretend to." } },
  },
}

P:NPC {
  key = "niby", id = TODO_NPC("Niby the Almighty"), name = "Niby the Almighty", title = "",
  bible = "bibles/felwood.md", role = "questgiver", tier = "quest",
  communities = { "felwood_wilds" }, temper = { "pompous" }, values = { "ambitious", "proud" },
  impression = {
    first = "Niby the Almighty is an imp with a very large name, camped out in Felwood among old fel ruins with another imp who does his errands. He is extremely sure of his own importance.",
    third = "{name} met Niby the Almighty, a self-important imp camped in the wilds of Felwood.",
  },

  greetings = {
    { id = "g_default", text = "Kneel, mortal, kneel before Niby the Almighty! Or don't, actually, your knees look tired." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, the mortal returns to bask in Niby's presence, which is very sensible of you." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Power? The elements in Felwood are leftovers, shaman, scraps the Legion didn't bother to finish! Fel runs through every root and rock in this forest, and the spirits you chatter to are hiding in the corners. Niby could show you real power, but you'd only use it to make it rain, and Niby finds that very sad." } },
      choices = {
        { text = "I serve no balance. I'll take power where I find it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The spirits keep a balance your Legion never understood.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Niby does not care for your sort, all totems and talking rocks, but even Niby admits you're more interesting than a peasant." },
        { id = "h_default", text = "I am Niby the Almighty, master of fel secrets, keeper of terrible knowledge, and yes, I am small, so don't mention it. Felwood is full of demonic remains, and Niby knows exactly what they're good for." },
        { id = "h_cond", when = { class = "WARLOCK" }, text = "A warlock! At last, someone who appreciates a demon's wisdom, and who might do as Niby says without all the whining." },
      },
      again = {
        { id = "h_again1", text = "Niby is waiting, and Niby is very busy." },
        { id = "h_again2", text = "Yes, yes, what else?" },
      },
      choices = {
        { text = "Do the elements still have any power here, imp?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What are you planning, imp?", next = "power" },
        { text = "Who's the other imp?", next = "impsy" },
        { text = "Why camp in Felwood?", next = "felwood" },
        { text = "I could use a demon's knowledge.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Farewell, Almighty One.", next = "END" },
      },
    },
    power = {
      lines = {
        { id = "power_default", text = "Planning is such a small word for it. There are infernal things buried in Felwood that a clever demon could use, and a clever mortal could fetch them for him." },
      },
      choices = {
        { text = "Why would I help a demon?", next = "power2" },
      },
    },
    power2 = {
      lines = {
        { id = "power2_default", text = "Because power is power, mortal, whatever shape it comes in, and the warlocks of your cities know it even if the priests pretend not to. Some mortals say the Legion's leavings should be destroyed, and some say they should be used." },
      },
      choices = {
        { text = "Fel power should be destroyed, not used.", next = "BACK", fx = { align = { light = 1 }, trait = { righteous = 1 } } },
        { text = "A weapon's a weapon. I'll use what I find.", next = "BACK", fx = { align = { light = -1 }, trait = { ambitious = 1 } } },
      },
    },
    impsy = {
      lines = {
        { id = "impsy_default", text = "Impsy, my assistant, who is not almighty at all and knows it. Impsy carries things, Impsy fetches things, and Impsy is not allowed to talk about what happened in the last summoning circle." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    felwood = {
      lines = {
        { id = "felwood_default", text = "Because it smells like home, mortal, and because the druids are too busy weeping over trees to bother me. Also the view of the burning bits is lovely at night." },
      },
      choices = {
        { text = "I suppose that's a reason.", next = "BACK" },
      },
    },
    warlock = {
      lines = {
        { id = "warlock_default", text = "Of course you could, and Niby is generous, in his way. Do as Niby asks, bring Niby what he needs, and one day you will have a steed the Legion itself would envy." },
      },
      choices = {
        { text = "We'll see. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Niby is almighty. That is all you need to know, and frankly more than you deserve." } },
    _none = { { id = "tp_none", text = "Niby knows everything, of course, but Niby chooses not to tell you that." } },
  },
}
