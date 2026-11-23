-- Felwood folk with no conversation until now: Altsoba Ragetotem, weaponsmith of Bloodvenom Post.
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Altsoba Ragetotem
---------------------------------------------------------------------------
P:NPC {
  key = "fw_altsoba", id = TODO_NPC("Altsoba Ragetotem"), name = "Altsoba Ragetotem",
  role = "vendor", tier = "service", race = "Tauren",
  communities = { "bloodvenom_post" }, temper = { "grim", "steady" }, values = { "craft", "strength" },
  impression = {
    first = "A tauren weaponsmith who keeps his blades oiled against Felwood's rot.",
    third = "{name} met Altsoba Ragetotem, the tauren who sells weapons at Bloodvenom Post in Felwood.",
  },
  greetings = {
    { id = "g_default", text = "Hm. You'll want a weapon, coming through Felwood. Everyone does, sooner or later." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "One of the shu'halo, here in this sick place. The Earth Mother guard you, for this land will not." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Altsoba of the Ragetotem. I sell weapons to those who pass through Bloodvenom Post, and I keep them sharp, because in Felwood a dull blade is a death sentence." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Speak. I am listening, though my hands are busy." },
      },
      choices = {
        { text = "What makes Felwood so dangerous?", next = "danger" },
        { text = "The Ragetotem? I don't know that tribe.", next = "tribe" },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Farewell, Altsoba.", next = "END" },
      },
    },
    danger = {
      lines = { { id = "da_default", text = "Demons poisoned this forest long ago, and the poison never left. The furbolgs went mad from it, the satyrs thrive in it, and the river runs green with it." } },
      choices = {
        { text = "Can it ever be healed?", next = "danger2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger2 = {
      lines = { { id = "d2_default", text = "The druids of the Emerald Circle say so. Winna Hazzard says she'd rather study it. I say keep your weapon close until someone decides." } },
      choices = {
        { text = "Then the forest must be cleansed, whatever it takes.", next = "BACK", reply = "Bold words. Felwood has eaten bolder.", fx = { align = { light = 1 } } },
        { text = "Some poisons are worth understanding, not destroying.", next = "BACK", reply = "Say that to Winna. She'll love you for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tribe = {
      lines = { { id = "tr_default", text = "We are warriors, mostly, and few in number. My tribe taught me that a weapon is a promise you make to yourself, so I make my promises well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

-- Elder Nightwind: a night elf ancestor-spirit by the Bloodvenom River during the Lunar Festival.
P:NPC {
  key = "fw_elder_nightwind", id = 15603, name = "Elder Nightwind", gender = "male",
  role = "elder", tier = "quest",
  temper = { "grave", "steadfast" }, values = { "memory", "the forest" },
  notices = { "race" },
  impression = {
    first = "A night elf spirit stands just south of the poisoned river, sorrow in every line of him.",
    third = "{name} honoured Elder Nightwind in Felwood at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome, traveller, though this is no glad place to meet. The forest weeps around us." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "Another Lunar Festival, and another year turned. The ancestors smile on those who seek out their elders." },
    { id = "g_back", when = { metBefore = true }, text = "You come back to this blighted wood. That takes courage, or foolishness." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Nightwind the Elder") }, text = "You seek the elders' blessing, even here. Then you shall have mine." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" }, text = "A kaldorei, come to the woods our people lost. Do not despair; the land remembers us." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" }, text = "A druid. Then you feel how sick this forest is far better than I can tell it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Nightwind, and in life I walked these woods when they were green and whole. Now the festival brings me back to see them poisoned, and still I come." } },
      again = {
        { id = "h_again", text = "What more, traveller? The river does not sleep, and neither do I." },
        { id = "h_again2", text = "Speak. The demons have long ears in these woods." },
      },
      choices = {
        { text = "What happened to this forest?", next = "forest" },
        { text = "Why return to a place so ruined?", next = "why" },
        { text = "Is there any hope for Felwood?", next = "hope" },
        { text = "I am a druid. Can the wood be healed?", next = "druid", when = { class = "DRUID" } },
        { text = "Farewell, Elder.", next = "END" },
      },
    },
    forest = {
      lines = { { id = "f_default", text = "The demons came in the war against the Legion and left their corruption in the soil. The satyrs and the Shadow Council keep it festering still, in Jaedenar and beyond." } },
      choices = {
        { text = "Who are the Shadow Council?", next = "council" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Warlocks who serve the Burning Legion, the same who once raised the Horde for war. They hide in the ruins of Jaedenar and call more demons to them." } },
      choices = {
        { text = "They must be destroyed, every one.", next = "BACK", reply = "Then go with strength, and with friends.", fx = { align = { valor = 1 } } },
        { text = "Better to avoid them entirely.", next = "BACK", reply = "Perhaps. But they will not avoid you.", fx = { align = { valor = -1 } } },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because those who loved a place should not abandon it in its grief. If I remember Felwood as it was, then something of it survives." } },
      choices = { { text = "A fine reason. Something else.", next = "BACK" } },
    },
    hope = {
      lines = { { id = "h2_default", text = "There is always hope. The Cenarion Circle works at the Emerald Sanctuary to cleanse the land, and the Timbermaw in the north hold on." } },
      choices = { { text = "I'll help where I can. Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Slowly, with patience and much hard work. The Circle's druids are trying; go and lend them your strength." } },
      choices = { { text = "I will. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A kaldorei elder who loved Felwood when it was green." } },
    _none = { { id = "tp_none", text = "I cannot say, traveller. Ask the druids of the sanctuary." } },
  },
}

---------------------------------------------------------------------------
-- Arko'narin, freed: outside Shadow Hold after Rescue From Jaedenar. Sends the
-- player back in for Rakaiah and for Trey's remains (Retribution of the Light).
-- Voice: bibles/arkonarin.md (fierce, proud, grieving for Trey).
---------------------------------------------------------------------------
P:NPC {
  key = "arkonarin_free", id = 11018, name = "Arko'narin",
  bible = "bibles/arkonarin.md", role = "questgiver", tier = "quest",
  communities = { "felwood_wilds" }, temper = { "fierce", "grieving" }, values = { "loyal", "brave" },
  notices = { "class" },
  impression = {
    first = "A Sentinel with fresh welts on her wrists, breathing the clean air as if she had forgotten what it tasted like.",
    third = "{name} freed Arko'narin from Shadow Hold, and she has not forgotten it.",
  },
  greetings = {
    { id = "g_default", text = "Out. We're actually out. I'll thank you properly when my hands stop shaking." },
    { id = "g_q", when = { questActive = TODO_QUEST("Retribution of the Light") }, text = "Rakaiah's still down there, and so is Trey. Don't come back up without both of them settled." },
    { id = "g_done", when = { questDone = TODO_QUEST("Retribution of the Light") }, text = "Rakaiah's dead, and Trey's no longer alone in the dark. I owe you more than I can carry." },
    { id = "g_back", when = { metBefore = true }, text = "There you are. I keep looking at the cave mouth, waiting for something to crawl out after us." },
  },
  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" }, text = "You fight with Trey's Light. Take it back down there and let it finish what he started." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The Shadow Council kept me in a cage and killed my friend Trey Lightforge in front of me. Their warlock Rakaiah did it, and she's still down there, gloating over his sword." },
      },
      again = { { id = "h_again", text = "Ask what you need to. Then go and finish it." } },
      choices = {
        { text = "Tell me about Trey.", next = "trey" },
        { text = "Who is Rakaiah?", next = "rakaiah" },
        { text = "Where will you go now?", next = "home" },
        { text = "I'll go back in.", next = "END" },
      },
    },
    trey = {
      lines = { { id = "tr_default", text = "A paladin of the Silver Hand, too stubborn to leave a Sentinel to die alone. We came to scout Jaedenar together. He laughed at everything, even when they caught us. Especially then." } },
      choices = {
        { text = "He deserves a proper burial.", next = "BACK", reply = "He does. Bring back what's left of him, and Jessir will see to the rest.", fx = { align = { light = 1 } } },
        { text = "The living matter more than bones.", next = "BACK", reply = "Then do it for me, if not for him. I'm still living.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rakaiah = {
      lines = { { id = "ra_default", text = "A satyr-loving warlock who thinks pain is a form of conversation. She cut Trey down and kept his weapon like a trophy. I want her dead, and I'm not ashamed to say it." } },
      choices = {
        { text = "Vengeance is a fair price for what she did.", next = "BACK", reply = "Then we understand each other.", fx = { align = { honor = -1 } } },
        { text = "Justice, not vengeance. Let it be clean.", next = "BACK", reply = "Clean or messy, I just want it done.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "To Darnassus, to tell the Sentinels what Jaedenar has become. Then to sleep for a week, if the dreams let me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Remains of Trey Lightforge: the paladin's body in Shadow Hold. He does not
-- speak; the lines describe what the player finds (The Remains of Trey Lightforge).
---------------------------------------------------------------------------
P:NPC {
  key = "trey_remains", id = 11020, name = "Remains of Trey Lightforge",
  role = "citizen", tier = "service",
  communities = { "felwood_wilds" }, temper = { "still" }, values = { "the Light" },
  impression = {
    first = "A paladin's broken body lies against the cave wall, his tabard of the Silver Hand torn and stained.",
    third = "{name} found the remains of Trey Lightforge in Shadow Hold.",
  },
  greetings = {
    { id = "g_default", text = "The body lies where it fell, one hand still curled as if around a hilt that is no longer there." },
    { id = "g_q", when = { questActive = TODO_QUEST("Retribution of the Light") }, text = "This must be Trey. Arko'narin's friend lies quiet, and someone has taken his weapon." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "The torchlight catches a silver hand stitched on his tabard.",
      lines = {
        { id = "h_default", key = true, text = "Trey Lightforge died fighting here, by the look of the cave floor. Whatever was done to him after, he did not die on his knees." },
      },
      again = { { id = "h_again", text = "The remains lie still. There is nothing more to see." } },
      choices = {
        { text = "Search the body.", next = "search" },
        { text = "Say a prayer over him.", next = "pray" },
        { text = "Leave him for now.", next = "END" },
      },
    },
    search = {
      lines = { { id = "se_default", text = "A small book of prayers sits in his belt pouch, its pages marked with a pressed leaf from Ashenvale. Someone gave it to him, and he kept it." } },
      choices = {
        { text = "I'll take his remains to Jessir.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The dead don't need keepsakes. I'll take what's useful.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Leave it be.", next = "BACK" },
      },
    },
    pray = {
      lines = { { id = "pr_default", text = "The cave stays dark and silent while you speak. For a moment the air feels a little lighter, or perhaps you only hope it does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
