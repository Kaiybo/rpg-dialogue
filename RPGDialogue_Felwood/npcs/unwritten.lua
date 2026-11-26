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
    xcame = {
      narr = "He runs a whetstone down a long blade without looking at it.",
      lines = { { id = "xcame_default", text = "The Horde needed a smith who would not run from the stink. My tribe does not run. So I walked north from Mulgore, past the Barrens and through Ashenvale, and set my anvil here." } },
      choices = {
        { text = "Was it a hard road?", next = "xroad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xroad = {
      lines = { { id = "xroad_default", text = "No harder than any. I was ambushed twice, once by Sentinels and once by a bear with green fur and no reason left in it. I kept the bear's claws. The Sentinels I let go." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xweapon = {
      lines = { { id = "xweapon_default", text = "Something heavy that does not need to be sharp to kill. The ooze here eats an edge in a week. A good mace does not care what it hits, and Felwood has many things that should be hit." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xforsaken = {
      lines = { { id = "xforsaken_default", text = "The alchemist laughs too much and collects things that should be burned. But the Horde has made them allies, and an ally is an ally. Do you trust them?" } },
      choices = {
        { text = "They're Horde. That's enough for me.", next = "BACK", reply = "Then you are a better ally than I am. I will try to match you.", fx = { align = { order = 1 } } },
        { text = "No. I watch them as I watch the demons.", next = "BACK", reply = "Quietly, then. Do not let the warchief's people hear you.", fx = { align = { order = -1 } } },
      },
    },
    xwarrior = {
      lines = { { id = "xwarrior_default", text = "Strike the corrupted things hard and early, before the poison spreads to you. And clean your weapon every night, even when you are tired. The blade that is cared for will care for you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xkin = {
      lines = { { id = "xkin_default", text = "She has not much reach in this place, young one, but I carry her in my chest anyway. When you return to Mulgore, put your hands in the grass for me. I miss the feel of it." } },
      choices = { { text = "I will, elder.", next = "BACK", reply = "Good. Now buy a weapon; you will need it." } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Altsoba of the Ragetotem. I sell weapons to those who pass through Bloodvenom Post, and I keep them sharp, because in Felwood a dull blade is a death sentence." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Speak. I am listening, though my hands are busy." },
      },
      choices = {
        { text = "How did you come to Bloodvenom Post?", next = "xcame" },
        { text = "Which weapon would you carry here?", next = "xweapon" },
        { text = "What do you think of the Forsaken here?", next = "xforsaken" },
        { text = "I am a warrior. Give me your counsel.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Earth Mother guard you as well, elder.", next = "xkin", when = { race = "Tauren" } },

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
  topics = {
    ragetotem = { { id = "tp_xrage", text = "My tribe. Warriors first, smiths second, and talkers never." } },
    bloodvenom_post = { { id = "tp_xpost", text = "A small fire in a sick wood. We keep it burning." } },
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
        { text = "They must be destroyed, every one.", next = "BACK", reply = "Then go with strength, and with friends.", fx = { align = { honor = 1 } } },
        { text = "Better to avoid them entirely.", next = "BACK", reply = "Perhaps. But they will not avoid you.", fx = { align = { honor = -1 } } },
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
        { text = "How long were you held in Shadow Hold?", next = "yark_long" },
        { text = "I'm a Sentinel's sister too. What do you need?", next = "yark_elf", when = { race = "NightElf" } },
        { text = "Tell me about Trey.", next = "trey" },
        { text = "Who is Rakaiah?", next = "rakaiah" },
        { text = "Where will you go now?", next = "home" },
        { text = "I carry the Light, as Trey did.", next = "light", when = { class = "PALADIN" } },
        { text = "I'll go back in.", next = "END" },
      },
    },
    trey = {
      lines = { { id = "tr_default", text = "A paladin of the Silver Hand, too stubborn to leave a Sentinel to die alone. We came to scout Jaedenar together. He laughed at everything, even when they caught us. Especially then." } },
      choices = {
        { text = "He deserves a proper burial.", next = "BACK", reply = "He does. Bring back what's left of him, and Jessir will see to the rest.", fx = { align = { light = 1 } } },
        { text = "The living matter more than bones.", next = "BACK", reply = "Then do it for me, if not for him. I'm still living.", fx = { align = { light = -1 } } },
        { text = "What were you two scouting in Jaedenar?", next = "jaedenar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jaedenar = {
      lines = { { id = "ja_default", text = "The Shadow Council's hold, and how deep it runs. Satyrs, felguard and cultists, all of them feeding the corruption that's killing Felwood. We got further than anyone, and look what it bought us." } },
      choices = {
        { text = "What did you see down there?", next = "shadowhold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadowhold = {
      lines = { { id = "sh_default", text = "Cages, altars and a great deal of blood. They're calling something up from the dark, or trying to, and the Sentinels need to know before it answers." } },
      choices = { { text = "Then Darnassus will hear it. Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "li_default", text = "Then you know what he was. Trey used to say the Light didn't care whether you prayed to it or to Elune, so long as you stood up when it counted. Stand up for him down there." } },
      choices = { { text = "I will. Something else.", next = "BACK" } },
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
    yark_long = {
      lines = {
        { id = "yyark_long_d", text = "Eleven days, by the light through the cracks, though I lost count near the end. They fed us once a day and questioned us twice, and Trey made them laugh during the questions just to make them angry. I never knew if that was courage or madness." },
      },
      choices = {
        { text = "What did they want to know?", next = "yark_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yark_want = {
      narr = "Arko'narin rubs the welts on her wrists without seeming to notice she is doing it.",
      lines = {
        { id = "yyark_want_d", text = "Where the Sentinels watch from, and how many of us there are at Talonbranch and Emerald Sanctuary. I told them nothing, and Trey told them a great many very funny lies. That was why they killed him first, I think, because he made them look foolish." },
      },
      choices = {
        { text = "Do you blame yourself for his death?", next = "yark_blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yark_blame = {
      lines = {
        { id = "yyark_blame_d", text = "Every hour. If I had told them something, anything, they might have kept him alive longer, long enough for someone to find us. The Sentinels would call that treason, and Trey would call it mercy, and I do not know which of them is right." },
      },
      choices = {
        { text = "Silence was your duty. You did right.", next = "BACK", reply = "Yes. That is what the Sentinels will say, and I will try to believe it.", fx = { align = { order = 1 } } },
        { text = "A life was worth a few words. Trey mattered.", next = "BACK", reply = "You speak like him. That is a kind of comfort, and a kind of wound.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yark_elf = {
      lines = {
        { id = "yyark_elf_d", text = "Then stay close to Jaedenar and watch for anything that crawls out of the cave. I need to reach Talonbranch Glade and send word to Darnassus, and I cannot do it if the Shadow Council follows me there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    shadow_hold = { { id = "tp_yshadow_hold", text = "The Shadow Council's cave in Jaedenar. Eleven days in a cage." } },
    talonbranch_glade = { { id = "tp_ytalonbranch_glade", text = "The Sentinel camp in Felwood. I must reach it before the Council follows me." } },
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
    xcave = {
      narr = "Your eyes slowly adjust to the gloom.",
      lines = { { id = "xcave_default", text = "Scrapes on the stone show where something heavy was dragged deeper into the cave. Black ichor has dried on the rocks, and among it lies a broken arrow of jadefire make." } },
      choices = {
        { text = "Follow the drag marks.", next = "xdrag" },
        { text = "Turn back to the body.", next = "BACK" },
      },
    },
    xdrag = {
      lines = { { id = "xdrag_default", text = "The marks end at a pool of foul water a few paces on. Whatever took his blade took it this way, and it was not human, by the size of the claws gouged into the edge." } },
      choices = { { text = "Return to the body.", next = "BACK" } },
    },
    xarmor = {
      lines = { { id = "xarmor_default", text = "His plate is dented in a dozen places, each one facing forward. He held his ground to the very end. The symbol of the Silver Hand on his chest has been scratched, deliberately, by something that hated it." } },
      choices = {
        { text = "Clean the symbol with your sleeve.", next = "BACK", reply = "The silver catches what little light there is. It seems right, somehow." },
        { text = "Turn back to the body.", next = "BACK" },
      },
    },

    hello = {
      narr = "The torchlight catches a silver hand stitched on his tabard.",
      lines = {
        { id = "h_default", key = true, text = "Trey Lightforge died fighting here, by the look of the cave floor. Whatever was done to him after, he did not die on his knees." },
      },
      again = { { id = "h_again", text = "The remains lie still. There is nothing more to see." } },
      choices = {
        { text = "Look at his face.", next = "ytre_face" },
        { text = "Lay his hands at rest.", next = "ytre_hands" },
        { text = "Look around the cave.", next = "xcave" },
        { text = "Examine his armor.", next = "xarmor" },

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
    ytre_face = {
      lines = {
        { id = "yytre_face_d", text = "His face is young beneath the blood, younger than you expected, and there are laugh lines at the corners of his eyes. Whatever he saw at the end, his mouth is set in something very like a smile." },
      },
      choices = {
        { text = "Close his eyes.", next = "ytre_close" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytre_close = {
      narr = "The cave's silence presses close as you kneel.",
      lines = {
        { id = "yytre_close_d", text = "His eyelids are cold, and they close easily. For a moment, in the dim light, he looks only asleep, a tired paladin resting after a long road. The Silver Hand on his tabard catches what little light there is." },
      },
      choices = {
        { text = "Look for anything else he carried.", next = "ytre_carried" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytre_carried = {
      lines = {
        { id = "yytre_carried_v0", when = { class = "PALADIN" }, text = "Tucked behind his breastplate is a folded letter of commission from the Silver Hand, signed by a name you recognise from the order's rolls. The seal is broken, and the letter has been read many times." },
        { id = "yytre_carried_d", text = "Tucked behind his breastplate is a folded letter, sealed and addressed in a careful hand to someone in Stormwind. The ink has blurred with damp, and you cannot read the name." },
      },
      choices = {
        { text = "Carry the letter to Stormwind. It must be delivered.", next = "BACK", reply = "The letter is light in your hand, and heavy all the same.", fx = { align = { honor = 1 } } },
        { text = "Leave it with him. It belongs to the dead.", next = "BACK", reply = "You tuck the letter back behind his breastplate, where it has lain all this time.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytre_hands = {
      lines = {
        { id = "yytre_hands_d", text = "You fold his hands across his chest, over the torn symbol of the Silver Hand. They are stiff and cold, and the gauntlets are scarred from a hundred blows, but they lie still now, as though in prayer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    silver_hand = { { id = "tp_ysilver_hand", text = "The order of paladins whose symbol he wore to the end." } },
    jaedenar = { { id = "tp_yjaedenar", text = "The Shadow Council's stronghold, where he died." } },
  },
}
