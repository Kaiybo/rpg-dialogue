-- Cenarion Hold: the druids who watch the Twilight's Hammer, the craftsman who fools its masters, and a Watcher of the bronze. Voice: bibles/silithus.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "bor_wildmane", id = TODO_NPC("Bor Wildmane"), name = "Bor Wildmane",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "jovial", "steady" }, values = { "brave", "loyal" },
  notices = { "race", "class" },

  impression = {
    first = "Bor Wildmane is a cheerful tauren druid who calls the Twilight's Hammer 'crazies' and collects their secret papers without being able to read a word. He keeps score of every cultist I bring down.",
    third = "{name} met Bor Wildmane, the younger of the two Wildmane brothers who watch the Twilight's Hammer from Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "Ho there! Come to help keep an eye on the crazies?" },
    { id = "g_back", when = { metBefore = true }, text = "There they are! I keep hearing your name from the western camps, and never in a happy voice." },
    { id = "g_council", when = { questDone = TODO_QUEST("Dukes of the Council") }, text = "I hear about your fights with the Abyssal Council all the time, {name}. Keep it up!" },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A brother of the plains! Big brother Huum will want to say something solemn at you; let him, it makes him happy." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Good; you can talk to the land with Huum, and I'll do the part where we hit the cultists." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "We've got more than one enemy in Silithus, friend. While everyone's watching the bugs, my big brother and I keep a close eye on the Twilight's Hammer crazies out west, and believe me, they need watching." },
        { id = "h_texts", tags = { "news" }, when = { questActive = TODO_QUEST("Secret Communication") },
          text = "Those little papers the cultists carry, covered in gibberish? Bring me a stack. Every one I've got is one they haven't." },
        { id = "h_texts_done", when = { questDone = TODO_QUEST("Secret Communication") },
          text = "Still bringing me papers? Good! I've a whole chest of them now, and the crazies must be wondering why nobody answers their letters." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Huum's busy being serious, so I've got time." },
        { id = "h_again2", text = "Ask away! I like talking more than my brother does." },
      },
      choices = {
        { text = "Why watch the cult, with the bugs so close?", next = "crazies" },
        { text = "What are these papers the cultists carry?", next = "texts" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "Who commands the cult out here?", next = "council", when = { questDone = TODO_QUEST("Aurel Goldleaf") } },
        { text = "Is it hard, fighting so far from Mulgore?", next = "tauren", when = { race = "Tauren" } },
        { text = "I'll bring you whatever I find on them.", next = "END", fx = { standing = { cenarion_hold = 1 } } },
      },
    },

    crazies = {
      lines = { { id = "c_default", fx = { learn = { "twilights_hammer" } },
        text = "Because a cult that wants the world to end is camped next door to the biggest bug nest in Kalimdor, and I don't like those odds. They chant, they build camps around their stones, and they're up to something with the crystals, and nobody else here has the time to find out what." } },
      choices = {
        { text = "What do you think they're planning?", next = "crazies_plan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crazies_plan = {
      lines = { { id = "cp_default", text = "Huum thinks it's to do with the land, something deep and old. I think it's to do with them being crazy, and I'm usually right, but he's usually right about the deep and old things." } },
      choices = { { text = "Maybe you're both right.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    texts = {
      lines = { { id = "t_default", text = "Coded messages, how their camps talk to each other. I can't read a word, but that's not the point: the more we take out of their pockets, the less they can say to each other." } },
      choices = {
        { text = "Silence them. A cult that can't talk can't plan.", next = "BACK", fx = { align = { order = 1 }, opinion = { twilights_hammer = "silence" } } },
        { text = "Let some through. We'd learn more listening.", next = "BACK", fx = { align = { order = -1 }, opinion = { twilights_hammer = "listen" } } },
        { text = "I know a hermit who reads their code.", next = "texts_ortell", when = { questDone = TODO_QUEST("The Twilight Lexicon") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    texts_ortell = {
      lines = { { id = "to_default", fx = { learn = { "ortell" } },
        text = "The deserter? Ha! Then I'll keep stacking them, and maybe one day we'll sit down with that hermit and read the whole lot. I bet half of it's complaints about the food." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "b_default", text = "Huum's older, and wiser, and he'll tell you so if you stand still long enough. He listens to the spirits and the land, and I listen to him, and between us we've got the whole thing covered." } },
      choices = {
        { text = "Do you two ever disagree?", next = "brother_argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother_argue = {
      lines = { { id = "ba_default", text = "Every night! He says the land's the bigger problem, I say the crazies are, and Aurel tells us we're both giving her a headache. Then we go out and fight whichever one's closer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    council = {
      lines = { { id = "co_default", fx = { learn = { "abyssal_council" } },
        text = "Not the cultists, it turns out, but the things they pray to through their wind stones: the Abyssal Council, templars and dukes and lords of fire and water and earth and air. The crazies are just the hands; Aurel's found a way to reach the heads." } },
      choices = {
        { text = "How do you fight a lord of the elements?", next = "council_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_fight = {
      lines = { { id = "cf_default", text = "Carefully, and with lots of friends! Bring me what you take from them, the crests and signets and scepters, and I'll see the Circle knows who to thank." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "Some days. Then I remember the plains are safe because we're out here, and I hit the next cultist a little harder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the crazies, and I know what they carry. Ask me something." } },
    background = { { id = "tp_bg", text = "Bor Wildmane, little brother of Huum, druid of the Circle and professional cultist-watcher. That's it, that's the story!" } },
    advice = { { id = "tp_ad", text = "Check every cultist's pockets. You'd be amazed what crazy people write down." } },
    twilights_hammer = { { id = "tp_hammer", text = "Crazies with a plan, which is the worst kind of crazies.", next = "crazies" } },
    abyssal_council = { { id = "tp_council", text = "Elementals with titles. Ask Aurel; she's the one who figured out how to knock on their door." } },
    _none = { { id = "tp_none", text = "No idea, friend! Ask Huum; he knows the deep stuff." } },
  },
}

P:NPC {
  key = "huum_wildmane", id = TODO_NPC("Huum Wildmane"), name = "Huum Wildmane",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "steady", "gentle" }, values = { "wise", "patient", "devout" },
  notices = { "race", "class" },

  impression = {
    first = "Huum Wildmane says the land of Silithus is weeping and has a sad story to tell. He sent me after the cult's leaders with the gravity of a funeral prayer.",
    third = "{name} met Huum Wildmane, the elder Wildmane brother, who hears the spirits of Silithus grieving.",
  },

  greetings = {
    { id = "g_default", text = "The spirits of this place call out, {name}. Listen, and you'll hear them." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the land seems a little quieter for it." },
    { id = "g_vyral", when = { questDone = TODO_QUEST("Vyral the Vile") }, text = "Twilight's Run is silent now. The spirits thank you, though they have no words for it." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Child of the Earth Mother. You feel it too, I think: the ground here is grieving, under all the sand." },
    { id = "n_spirit", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You speak to things beyond the living, as I do. Then you'll understand when I say this desert is crowded with the dead." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The spirits of Silithus call out to us, {name}. The land weeps, for it has a long and sorrowful story to tell, and the Twilight's Hammer would add a terrible new chapter to it." },
        { id = "h_geolords", tags = { "news" }, when = { questActive = TODO_QUEST("Twilight Geolords") },
          text = "The geolords lead the rituals in the western camps. Strike at them, for they are the heads of the serpent, and the body will thrash without them." },
        { id = "h_vyral", tags = { "news" }, when = { questActive = TODO_QUEST("Vyral the Vile") },
          text = "Vyral the Vile hides in Twilight's Run, a cave in the northeast where the cult keeps its secrets. Bring me his signet ring, and go carefully; the cave is full of horrors." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. The land is patient, and so am I." },
        { id = "h_again2", text = "Go on, {name}. There is time, though less than there was." },
      },
      choices = {
        { text = "What story does the land tell?", next = "spirits" },
        { text = "What is the cult doing in the west?", next = "geolords" },
        { text = "Your brother calls them crazies.", next = "brother" },
        { text = "The dead here are restless. Can they be helped?", next = "spirit_help", when = { class = { "PRIEST", "SHAMAN" } } },
        { text = "Who did you send me to see next?", next = "aurel", when = { questDone = TODO_QUEST("Vyral the Vile") } },
        { text = "May the Earth Mother watch over you.", next = "END", fx = { affinity = 1 } },
      },
    },

    spirits = {
      big = true,
      lines = { { id = "s_default", fx = { learn = { "ahn_qiraj" } },
        text = "Of a war fought here long before my people walked the plains, and of a great wall raised to end it. The dead of that war never left, and now the hives grow loud again, and the cult dances among the bones, and the spirits are afraid." } },
      choices = {
        { text = "Afraid of what?", next = "spirits_fear" },
        { text = "The dead should stay dead. Let them rest.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The dead can serve us yet, if they know what's coming.", next = "BACK", fx = { align = { light = -1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits_fear = {
      lines = { { id = "sf_default", text = "Of being woken. Of something behind the wall that was never truly asleep. They will not say more, and I don't press them; a frightened spirit is like a frightened child, and must be soothed before it can speak." } },
      choices = { { text = "Then soothe them, Huum.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    geolords = {
      lines = { { id = "g_default2", fx = { learn = { "twilights_hammer" } },
        text = "They perform rituals day and night around their stones, and I believe their work is tied to the red crystals pulsing in the sand. We don't yet know what they intend, but we needn't know a serpent's plans to cut off its head." } },
      choices = {
        { text = "Who leads them?", next = "geolords_vyral" },
        { text = "Something else.", next = "BACK" },
      },
    },
    geolords_vyral = {
      lines = {
        { id = "gv_default", text = "Here, the geolords, and above them a man called Vyral, who keeps to a cave the cult calls Twilight's Run. Above Vyral, I suspect there is something that is not a man at all." },
        { id = "gv_done", when = { questDone = TODO_QUEST("Vyral the Vile") },
          text = "Vyral is dead, and the cult has been dealt a blow it won't easily shrug off. But a signet ring speaks of a master, and we've learned since that the master isn't mortal." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "b_default", text = "Bor calls everything he can't understand 'crazy', and he says it so cheerfully that I don't correct him. He is braver than I am, and less careful, and I'm grateful every day that he's at my side." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    spirit_help = {
      lines = { { id = "sh_default", text = "Some can be freed, as Layo frees the dead of Southwind. Others are bound too tightly to this place, and we can only bear witness, and remember them, and make sure their war was not for nothing." } },
      choices = {
        { text = "I'll pray for them before I leave.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Then I'll remember them.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    aurel = {
      lines = { { id = "a_default", fx = { learn = { "abyssal_council" } },
        text = "Aurel Goldleaf, our craftsman. The cult answers to a power called the Abyssal Council, which speaks through the wind stones in their camps, and Aurel believes a clever enough disguise could put you face to face with it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what the land remembers, and some of what it fears. Ask, and I'll tell what I may." } },
    background = { { id = "tp_bg", text = "A druid of the Circle, from Mulgore, who came because the spirits called. My brother came because I did." } },
    advice = { { id = "tp_ad", text = "Walk softly in the old ruins. The dead notice footsteps." } },
    twilights_hammer = { { id = "tp_hammer", text = "They dance on graves and call it worship. I'll see their camps empty before I leave this desert." } },
    southwind = { { id = "tp_southwind", text = "A grieving place. Layo does good work there, the kind that is never thanked." } },
    _none = { { id = "tp_none", text = "The spirits haven't spoken of that to me. Perhaps Bor has heard something; he hears everything, eventually." } },
  },
}

P:NPC {
  key = "aurel_goldleaf", id = TODO_NPC("Aurel Goldleaf"), name = "Aurel Goldleaf",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "steady", "sharp" }, values = { "patient", "cunning", "curious" },
  notices = { "class", "craft" },

  impression = {
    first = "Aurel Goldleaf is a night elf craftsman who makes disguises good enough to fool elemental lords. She spoke of forging a cultist's medallion the way a jeweller speaks of a commission.",
    third = "{name} met Aurel Goldleaf, the Cenarion Circle's craftsman, who forges the Twilight's Hammer's own regalia against it.",
  },

  greetings = {
    { id = "g_default", text = "Mind the bench, please. Everything on it is either sharp or very, very old." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you. Come and look at this clasp and tell me if you'd believe it." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've the look of someone who has worn another person's coat before. Good; my work goes further on someone who knows how to wear it." },
    { id = "n_craft", cat = "craft", when = { profession = { "Blacksmithing", "Leatherworking", "Tailoring", "Jewelcrafting", "Engineering" } },
      text = "Calluses in the right places. You make things, too, so you'll know the difference between something that looks right and something that is right." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The Circle has learned many of the earth's secrets, and a craftsman would do well to listen to these druids. I listen, and then I make what they need, which lately has been a great many lies in metal and cloth." },
        { id = "h_sent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Aurel Goldleaf"), days = 3 } },
          text = "So you're the one who'll stand against the Abyssal Council. Then listen closely, because the next part is all about not being yourself." },
        { id = "h_dukes", when = { questActive = TODO_QUEST("Dukes of the Council") },
          text = "A large brilliant shard and three of the templars' crests, and I'll have a medallion of station that would fool the cult's own officers. Bring them, and I'll do the rest." },
        { id = "h_discovery", tags = { "news" }, when = { questActive = TODO_QUEST("Goldleaf's Discovery") },
          text = "Huum told you true: I think I can call down one of the Council's lords. Sit, and let me explain how badly this could go." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk and work at once." },
        { id = "h_again2", text = "Ask on. My hands don't need my mouth." },
      },
      choices = {
        { text = "What are you making?", next = "craft" },
        { text = "Who commands the Twilight's Hammer?", next = "council" },
        { text = "You'd send me in disguise? Is that honourable?", next = "honor" },
        { text = "I've worn a false face before.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I'll leave you to your bench.", next = "END" },
      },
    },

    craft = {
      lines = { { id = "c_default", text = "A medallion of station: the badge the cult's middle ranks wear to speak through the wind stones. Put it on with the rest of their trappings, touch a stone, and whatever answers will think you're one of its servants." } },
      choices = {
        { text = "And if it doesn't believe me?", next = "craft_risk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_risk = {
      lines = { { id = "cr_default", text = "Then it will be very angry, very quickly, and very close. That's why it has to be perfect, and why I don't let anyone rush me." } },
      choices = {
        { text = "Take all the time you need.", next = "BACK", fx = { affinity = 2, trait = { patient = 1 } } },
        { text = "I'll be ready for the anger either way.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    council = {
      lines = { { id = "co_default", fx = { learn = { "abyssal_council" } },
        text = "We thought it was men like Vyral, but the cult answers to something older: the Abyssal Council, elementals that speak through the wind stones in the camps. Templars at the bottom, dukes above them, and lords at the top, whom only the cult's own high leaders may approach." } },
      choices = {
        { text = "So we climb the ranks, one disguise at a time.", next = "council_climb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_climb = {
      lines = { { id = "cc_default", text = "Exactly so. Each one you fall gives me the pieces to fool the next: a crest, a signet, a ring of lordship. It's a ladder made of their own regalia, and I find that rather satisfying." } },
      choices = { { text = "So do I.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    honor = {
      lines = { { id = "ho_default", text = "Is it honourable to let a cult call fire down on a desert because I was too proud to tell a lie? I've thought about it, and I sleep well." } },
      choices = {
        { text = "Deceiving deceivers is fair play.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd still rather face them honestly, blade drawn.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "r_default", text = "Then you know the trick: it isn't the coat, it's the walk. Wear my medallion like you've worn it for years, and the stones will never know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know how things are made, and how to make them look like something else. Ask." } },
    background = { { id = "tp_bg", text = "A craftsman of the Circle. Before that, a craftsman of other things, which I'll keep to myself, as craftsmen do." } },
    advice = { { id = "tp_ad", text = "Never trust a perfect copy. The real thing always has a flaw." } },
    abyssal_council = { { id = "tp_council", text = "Templars, dukes and lords, and each wants to be obeyed. That's their weakness.", next = "council" } },
    _none = { { id = "tp_none", text = "Not my craft, I'm afraid. Try the Wildmanes." } },
  },
}

P:NPC {
  key = "baristolth", id = TODO_NPC("Baristolth of the Shifting Sands"), name = "Baristolth of the Shifting Sands",
  bible = "bibles/silithus.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "steady", "cold" }, values = { "patient", "wise" },
  notices = { "race", "class" },

  impression = {
    first = "Baristolth of the Shifting Sands told me to look behind me at the hive, and spoke of a promise he made a thousand years ago as though it were yesterday. I don't think he meant it as a figure of speech.",
    third = "{name} met Baristolth of the Shifting Sands, a strange night elf at Cenarion Hold who keeps a very old promise.",
  },

  greetings = {
    { id = "g_default", text = "Look behind you, mortal, and see how the hive stirs." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The sands have shifted a little since you were last here." },
    { id = "g_risen", when = { questDone = TODO_QUEST("What Tomorrow Brings") }, text = "It is as it should be. My watch nears its end." },
  },

  notice = {
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "One of my own people, though you would not know my face. We have both forgotten a great deal, you and I, but I was made to remember." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Circle. Druids stood on this sand once before, beside the Brood, and some of them were very brave." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The land around us shudders, and the hive answers. I made a promise a thousand years past, mortal, and the time to keep it draws near, for the sands are shifting once more." },
        { id = "h_tomorrow", tags = { "news" }, when = { questActive = TODO_QUEST("What Tomorrow Brings") },
          text = "Go to the Caverns of Time, in the deserts of Tanaris, and see whether the master has returned. I must be certain before I may act." },
      },
      again = {
        { id = "h_again", text = "Ask, then. I have waited a thousand years; I can wait a little longer." },
        { id = "h_again2", text = "Speak. The hive will not stop for us, but I will." },
      },
      choices = {
        { text = "Who are you, really?", next = "who" },
        { text = "What promise did you make?", next = "promise" },
        { text = "Why do you watch the hive?", next = "hive" },
        { text = "The bronze one has returned. I saw him.", next = "risen", when = { questDone = TODO_QUEST("What Tomorrow Brings") } },
        { text = "Our people fought here once.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "Farewell, Baristolth.", next = "END" },
      },
    },

    who = {
      lines = { { id = "w_default", text = "A hunter, once, who went into the hives and did not come out whole. Death had nearly finished with me when one of the great ones breathed upon me, once, and waited while the sands of time closed my wounds." } },
      choices = {
        { text = "One of the great ones?", next = "who_bronze" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_bronze = {
      lines = { { id = "wb_default", fx = { learn = { "bronze_dragonflight" } },
        text = "The Brood of Nozdormu, the bronze dragonflight, keepers of what was and what will be. He told me I would remain as long as I must, and so I am a Watcher, and I have watched." } },
      choices = {
        { text = "A thousand years of watching. That's a heavy price.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    promise = {
      lines = { { id = "p_default", text = "To watch the desert until the second war comes, and to find a mortal worthy of the Brood's trust when it does. The Brood are slow to trust your kind, and they have their reasons, which are theirs to tell." } },
      choices = {
        { text = "Time should be left to run its course.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If I could change what's coming, I would.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Am I worthy?", next = "promise_worthy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    promise_worthy = {
      lines = { { id = "pw_default", text = "Not yet, and perhaps not ever, but you came and asked, and most do not." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hive = {
      lines = { { id = "h_default2", fx = { learn = { "silithid_hives", "ahn_qiraj" } },
        text = "Because the hives are the city's breath, and they are breathing faster. Behind the wall at Ahn'Qiraj, the Qiraji plan for war, and the silithid are only the first of their servants to stir." } },
      choices = {
        { text = "The Qiraji?", next = "hive_qiraji" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hive_qiraji = {
      lines = { { id = "hq_default", text = "The masters of the hive, sealed in their city a thousand years ago, and not nearly as asleep as your kind would like to believe. I have feared them for a very long time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    risen = {
      lines = { { id = "r_default", text = "Then it is as it should be: the great one has risen, and my watch begins to end. What comes next is not mine to give you yet; when it is, I will find you." } },
      choices = { { text = "I'll be waiting.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } } },
    },
    kaldorei = {
      lines = { { id = "k_default", text = "Fought, and bled, and won, and then chose to forget, which is the one thing the Brood would never do. I remember for them, and for you, whether or not you thank me for it." } },
      choices = { { text = "I thank you.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know what was. Some of it I may tell you." } },
    background = { { id = "tp_bg", text = "A hunter who should have died, and a Watcher who has not. That is enough of a story.", next = "who" } },
    advice = { { id = "tp_ad", text = "When the ground hums, step away from it. When it falls silent, run." } },
    bronze_dragonflight = { { id = "tp_bronze", text = "They watch over time itself, and they do not forget a debt, owed or owing." } },
    ahn_qiraj = { { id = "tp_aq", text = "The city behind the wall. I was there when the wall was raised." } },
    _none = { { id = "tp_none", text = "That is not a thing I watch." } },
  },
}
