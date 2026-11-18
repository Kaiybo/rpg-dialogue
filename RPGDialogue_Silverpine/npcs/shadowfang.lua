-- Shadowfang Keep's prisoners: Deathstalker Adamant (Horde) and Sorcerer Ashcrombe (Alliance),
-- both held in Rethilgore's cells until someone kills their jailer.
-- Voices: bibles/adamant.md, bibles/ashcrombe.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Deathstalker Adamant: Hadrec's deathstalker, thin, furious and very much alive (so to speak).
---------------------------------------------------------------------------
P:NPC {
  key = "adamant", id = TODO_NPC("Deathstalker Adamant"), name = "Deathstalker Adamant",
  bible = "bibles/adamant.md", role = "soldier", tier = "quest",
  communities = { "sepulcher" }, temper = { "grim", "dry" }, values = { "loyal", "vengeful" },
  notices = { "class", "race" },
  impression = {
    first = "Deathstalker Adamant spent too long in a worgen's cell and came out of it sharper rather than broken. He talks about his dead partner Vincent the way other people grip a knife.",
    third = "{name} freed Deathstalker Adamant from the cells of Shadowfang Keep.",
  },

  greetings = {
    { id = "g_cell", text = "Keep your voice down. The dogs upstairs have better ears than manners, and I've only just stopped listening to them." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Either you like this keep, or you've a grudge against it as long as mine." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Deathstalkers in Shadowfang") }, text = "Hadrec sent you, didn't he? I can tell, because you came looking for a prisoner instead of for loot." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the keep hasn't changed one stone. The worgen don't redecorate." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE", race = "Scourge" },
      text = "You walk like one of ours. If the Sepulcher hasn't recruited you yet, it's only because Hadrec hasn't caught you standing still." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A living soldier of the Warchief, come into this rat hole for a dead man's sake. I'll remember that, though I'll deny it in front of Hadrec." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathstalker Adamant, of the Sepulcher, and lately of this cell. Rethilgore kept the key on his belt and my blade on his wall, and if he's dead, I'll thank you and then I'll go and get my blade." },
        { id = "h_quest", when = { questActive = TODO_QUEST("Deathstalkers in Shadowfang") },
          text = "Hadrec sent two of us into this keep, and you've found the one who could still answer. I'm sorry to say the other is out in the courtyard, and he won't be answering anyone." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue, good. I can open the courtyard door for you, but there are things past it that a careful blade will handle better than a loud one." },
        { id = "h_cleared", when = { cleared = "Shadowfang Keep" },
          text = "You've been to the top of this keep before, I can tell, because you don't look at the stairs the way the new ones do. Arugal keeps coming back, it seems, so we keep going up." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Mind your horns on the doorway, friend, because these cells were built for the Baron's prisoners and not for tauren. I'm Adamant, and I'm glad of you." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, because I'd rather be moving than talking." },
        { id = "h_again2", text = "Go on. I've had weeks of talking to a wall, so you're an improvement." },
      },
      choices = {
        { text = "Hadrec sent me to find you.", next = "hadrec", when = { questActive = TODO_QUEST("Deathstalkers in Shadowfang") } },
        { text = "How did they take you?", next = "captured" },
        { text = "Where is your partner?", next = "vincent" },
        { text = "What waits for us beyond this cell?", next = "keep" },
        { text = "You'll want that blade back, deathstalker.", next = "blade", when = { class = "ROGUE" } },
        { text = "Why would the living come here for you?", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Open the courtyard door, Adamant.", next = "BUSINESS" },
        { text = "Rest a moment. We'll move soon.", next = "END" },
      },
    },

    hadrec = {
      lines = {
        { id = "hd_default", text = "Then he's still alive, or still whatever we are, and still sending people into places he'd go himself if anyone let him. He'll want a report, and he'll want it short, so I'll start practising now." },
      },
      choices = {
        { text = "What will you tell him?", next = "hadrec_report" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hadrec_report = {
      big = true,
      lines = {
        { id = "hr_default", text = "That the keep is held, that Arugal is mad, and that Vincent is dead because I told him the courtyard was clear. That last part I'll say first, because Hadrec will find it out anyway, and I'd rather he heard it from me." },
      },
      choices = {
        { text = "Tell him all of it. He deserves the truth.", next = "BACK", reply = "All of it, then, and I'll stand there while he hears it. Vincent deserves that much.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Leave out the blame. It helps nobody now.", next = "BACK", reply = "It helps me to say it, even if it helps nobody else. But I hear you, and I'll keep it short.", fx = { align = { honor = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    captured = {
      lines = {
        { id = "ca_default", text = "We came over the wall at night, Vincent and I, and the wolves were waiting in the dark as if somebody had told them. Rethilgore dragged me down here by the ankle, and he seemed to think it was very funny." },
      },
      choices = {
        { text = "Why keep you alive at all?", next = "captured_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captured_why = {
      lines = {
        { id = "cw_default", text = "I've had time to think about that, and I don't like any of my answers. Arugal likes an audience, and I think he wanted someone from outside to watch what his children have become, so that somebody would tell the story right." },
      },
      choices = {
        { text = "His children? He calls the worgen that?", next = "captured_children" },
        { text = "Something else.", next = "BACK" },
      },
    },
    captured_children = {
      big = true,
      lines = {
        { id = "cc_default", text = "Every night, through the floor, as if he were reading them to sleep. He called them out of somewhere to fight the Scourge, and now he loves them more than he ever loved Dalaran, and I'll tell you honestly that it's worse than if he hated them." },
        { id = "cc_scourge", when = { race = "Scourge" }, text = "Every night, through the floor. He called them up to fight the Scourge, and you and I were the Scourge once, so I suppose we're the reason those beasts exist at all, which is a thought I could do without in a cell." },
      },
      choices = {
        { text = "Whatever they were, they have to be put down.", next = "BACK", reply = "They do, and I'll do it. Whatever he was reading to them, it wasn't a bedtime story.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "He's to blame, not the beasts he made.", next = "BACK", reply = "He is, but his beasts still bite. I'll blame him and kill them, both.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = "worgen" } },
      },
    },

    vincent = {
      lines = {
        { id = "vi_default", text = "In the courtyard, lying where they left him, and they left him because they'd finished. Deathstalker Vincent was the better of us two, and he'd tell you so, at length, if he could." },
      },
      choices = {
        { text = "Tell me about him.", next = "vincent_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vincent_who = {
      lines = {
        { id = "vw_default", text = "He was a cooper in Lordaeron before the plague, and he never stopped looking at a barrel to see if it was sound. We woke up within a week of each other and joined the Sepulcher on the same morning, and Hadrec put us together because nobody else could stand either of us." },
      },
      choices = {
        { text = "What do you want done for him?", next = "vincent_name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vincent_name = {
      big = true,
      lines = {
        { id = "vn_default", text = "His name cut into the crypt wall at the Sepulcher, with the others, and the dog that killed him dead before the week's out. I'll see to the wall myself, but I wouldn't say no to help with the dog." },
      },
      choices = {
        { text = "Then we'll hunt it down together.", next = "BACK", reply = "Together, then, and I'll be glad of the company. That dog has been owed for a month.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "Carve his name first. Vengeance can wait.", next = "BACK", reply = "First, yes, and then the dog. Vincent would want it in that order.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    keep = {
      hub = true,
      lines = {
        { id = "ke_default", text = "The courtyard, first, and then the stables and the great hall, and somewhere above all of it, Arugal himself. I heard enough through these walls to draw you a rough map, if you've the patience for it." },
      },
      again = { { id = "ke_again", text = "What else about the keep? I heard most of it through stone, mind." } },
      choices = {
        { text = "What did you hear of Arugal?", next = "keep_arugal" },
        { text = "Who else holds this place?", next = "keep_servants" },
        { text = "Is the Baron still here?", next = "keep_baron" },
        { text = "That's enough about the keep.", next = "BACK" },
      },
    },
    keep_arugal = {
      lines = {
        { id = "ka_default", text = "He paces at the top of the keep and talks to nobody, and sometimes he laughs, and that's worse. He was a Kirin Tor archmage, Dalar Dawnweaver says, and I believe it, because only a wizard could be that clever and that stupid at once." },
      },
      choices = {
        { text = "Dalar knew him?", next = "keep_dalar" },
        { text = "Back to the keep.", next = "keep" },
      },
    },
    keep_dalar = {
      lines = {
        { id = "kd_default", text = "Knew of him, at least, and calls him a fool every chance he gets. If you get out of here, ask Dalar about Arugal and watch his face, because he's angrier at Dalaran than he'll ever be at the worgen." },
      },
      choices = {
        { text = "I'll ask him.", next = "keep", fx = { learn = "dalaran" } },
      },
    },
    keep_servants = {
      lines = {
        { id = "ks_default", text = "Worgen with names, and men who've gone over to Arugal, and a fallen paladin called Springvale who still keeps his old commander's voice. The dogs I can understand, but I've no patience for the men who chose it." },
        { id = "ks_paladin", when = { class = "PALADIN" }, text = "Worgen with names, and men who've gone over to Arugal, and a paladin called Springvale who fell a long way to get here. You'll want to see him for yourself, I expect, and I'd not stand between you." },
      },
      choices = { { text = "Back to the keep.", next = "keep" } },
    },
    keep_baron = {
      lines = {
        { id = "kb_default", text = "Silverlaine is still here, in a manner of speaking, and he doesn't seem to know his house was taken from him. I heard him once, calling for his steward, and nobody answered, so I didn't either." },
      },
      choices = { { text = "Back to the keep.", next = "keep" } },
    },

    blade = {
      big = true,
      lines = {
        { id = "bl_default", text = "I do, and I know exactly which wall it's on, and I've been thinking about the walk there for a month. You know how it is, deathstalker or not: a blade you've carried a while gets to know your hand." },
      },
      choices = {
        { text = "Then go and fetch it. I'll guard the door.", next = "BACK", reply = "Then I'll be quick, and you'll hold the door, and we'll both get out of here alive.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Stay with me. Your blade can wait for the plan.", next = "BACK", reply = "You're right, and I hate that you're right. The plan first, then the blade.", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    living = {
      lines = {
        { id = "li_default", text = "I've wondered the same, so tell me yourself. Did the Sepulcher send you, or did you come into this keep for your own reasons?" },
      },
      choices = {
        { text = "The Horde stands together, living or dead.", next = "living_answer", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I came for Arugal's head. You're a bonus.", next = "living_answer", fx = { align = { order = -1 }, trait = { witty = 1 } } },
        { text = "Does it matter, as long as you're free?", next = "living_answer" },
      },
    },
    living_answer = {
      lines = {
        { id = "la_default", text = "Either way, you're here and the dogs are upstairs, and that's an arrangement I like. I'll tell the Sepulcher a living soldier came for me, and they won't believe it, which will make it all the sweeter." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Deathstalker, the Sepulcher's, and Vincent's partner until the courtyard. That's all of me that matters now." } },
    worgen = { { id = "tp_worgen", text = "They hunt in packs and they laugh while they do it, and I'll never get the sound out of my head." } },
    advice = { { id = "tp_ad", text = "Never come over a wall at night because the night seems safer. The dogs see better in the dark than you do." } },
    _none = { { id = "tp_none", text = "I've been in a cell, friend. Ask me about the cell." } },
  },
}

---------------------------------------------------------------------------
-- Sorcerer Ashcrombe: a Dalaran sorcerer, fussy and grateful, who can open the courtyard door.
---------------------------------------------------------------------------
P:NPC {
  key = "ashcrombe", id = TODO_NPC("Sorcerer Ashcrombe"), name = "Sorcerer Ashcrombe",
  bible = "bibles/ashcrombe.md", role = "scholar", tier = "quest",
  temper = { "anxious", "earnest" }, values = { "learned", "proud" },
  notices = { "class", "race" },
  impression = {
    first = "Sorcerer Ashcrombe is a Dalaran mage who came looking for answers about Arugal and found a cell instead. He is proud, nervous and very grateful, and he talks like a man making up for a month of silence.",
    third = "{name} freed Sorcerer Ashcrombe, a mage of Dalaran, from the cells of Shadowfang Keep.",
  },

  greetings = {
    { id = "g_cell", text = "Oh, thank the Light, a face that isn't furred! Forgive me, I've not spoken to anyone in weeks who answered in words." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back! I was half afraid I'd dreamed you, which in this keep is not as pleasant as it sounds." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I still haven't finished my notes on the place, because the worgen keep interrupting." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! You can't know how good it is to see the proper robes, even dusty ones, after a month of claws and howling." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, all this way from the mountains? I had several gnomish colleagues in Dalaran, and they were always the first to the library and the last to leave it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sorcerer Ashcrombe, of Dalaran, and you've no idea how pleased I am to say so to somebody. The brute Rethilgore kept me in here, and if he's dead, I can open the courtyard door for you with very little fuss." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage, and come to rescue me, which my old masters would find very funny indeed. I'm Ashcrombe, of Dalaran, and I can open the courtyard door with a word, if you'll give me a moment to remember it." },
        { id = "h_paladin", when = { class = { "PALADIN", "PRIEST" } },
          text = "A servant of the Light, here, in this house of all houses! I'm Ashcrombe, of Dalaran, and I'll open the courtyard door for you, but please keep that Light close, because you're going to need it upstairs." },
        { id = "h_hammer", when = { questActive = TODO_QUEST("The Test of Righteousness") },
          text = "You've the look of someone hunting for a particular thing, not just a fight. If it's in this keep, I may have heard the guards grumbling about it, so ask me before you go stumbling about." },
        { id = "h_orb", when = { questActive = TODO_QUEST("The Orb of Soran'ruk") },
          text = "You're carrying something that hums with shadow, and I'd thank you to keep it in your pack. If you're collecting more of it, the robed ones upstairs carry plenty." },
        { id = "h_cleared", when = { cleared = "Shadowfang Keep" },
          text = "You've faced Arugal before, haven't you? I can see it in your shoulders, because you carry them like someone who expects the ceiling to fall." },
      },
      again = {
        { id = "h_again", text = "Please, go on. I've had nobody to talk to but a rat, and he was a poor listener." },
        { id = "h_again2", text = "Something else? I'm happy to answer, though I warn you I'll answer at length." },
      },
      choices = {
        { text = "Who are you, and why are you here?", next = "who" },
        { text = "What do you know of Arugal?", next = "arugal" },
        { text = "Have you heard of a hammer kept in this keep?", next = "hammer", when = { questActive = TODO_QUEST("The Test of Righteousness") } },
        { text = "Which spell holds this cell, sorcerer?", next = "mage", when = { class = "MAGE" } },
        { text = "What are Dalaran's mages doing at Ambermill?", next = "ambermill" },
        { text = "Open the courtyard door, Ashcrombe.", next = "BUSINESS" },
        { text = "Stay here. I'll clear the way.", next = "END" },
      },
    },

    who = {
      lines = {
        { id = "wh_default", text = "A sorcerer of Dalaran, of middling rank and better than middling reading, sent to learn what had become of Arugal and his work in this forest. I learned it rather more directly than I'd hoped, and now I'll be writing my report from memory." },
      },
      choices = {
        { text = "Who sent you?", next = "who_sent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_sent = {
      lines = {
        { id = "ws_default", text = "Nobody very important, which is why they sent me rather than going themselves. The Kirin Tor would like to know whether Arugal can be reasoned with, and I can now tell them with some confidence that he cannot." },
      },
      choices = {
        { text = "They waited a long time to ask.", next = "who_late" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_late = {
      lines = {
        { id = "wl_default", text = "They did, and I'll not pretend otherwise, though I'll ask you not to repeat it in Dalaran. You have to understand that the city was half rubble after the demons came, and everyone was afraid of their own spells for a while." },
      },
      choices = {
        { text = "Fear doesn't excuse leaving a forest to wolves.", next = "BACK", reply = "It doesn't, and I'll not pretend it does. But you'll find no worse critic of the Kirin Tor than me tonight.", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "A broken city looks after itself first. That's sense.", next = "BACK", reply = "That's what the council said, almost word for word. I've never been sure they were right.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    arugal = {
      lines = {
        { id = "ar_default", text = "That he was brilliant, once, and frightened, as we all were when the dead started walking. He called the worgen out of somewhere to fight the Scourge, and when they turned on Pyrewood and on Silverpine, it seems something in him turned as well." },
      },
      choices = {
        { text = "Did you know him, in Dalaran?", next = "arugal_known" },
        { text = "Something else.", next = "BACK", fx = { learn = "worgen" } },
      },
    },
    arugal_known = {
      lines = {
        { id = "ak_default", text = "Only by sight, and only from a respectful distance, because he wasn't a man who stopped in corridors for junior sorcerers. I heard him lecture once, on the binding of creatures, and he was very good, which I find hard to think about now." },
      },
      choices = {
        { text = "Does anything of that man remain?", next = "arugal_judge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    arugal_judge = {
      big = true,
      lines = {
        { id = "aj_default", text = "I heard him through the floor, talking to his children as he calls them, and it was the voice from that lecture, only gentler. I don't know whether that makes him more of a monster or less of one, and I've had a month to decide." },
      },
      choices = {
        { text = "He was desperate. Desperate men can still be pitied.", next = "BACK", reply = "Pity, yes, and I've tried. It's hard to pity a man whose voice keeps you awake through the floor.", fx = { align = { light = 1 } } },
        { text = "He made monsters. Pity is wasted on him.", next = "BACK", reply = "You may be right, and I suspect you are. Still, I knew him once, and that's hard to forget.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hammer = {
      lines = {
        { id = "hm_default", text = "A hammer, yes, a fine old smith's hammer that the guards were boasting about, because one of them tried to lift it and couldn't. They said it was out in the stables, and they argued about who would have to go and fetch it, so I suspect it's still there." },
      },
      choices = {
        { text = "Then I'll look in the stables.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mage = {
      lines = {
        { id = "mg_default", text = "Nothing worthy of the name, I'm ashamed to say. It's a plain iron lock and a very large worgen, and between the two of them they've defeated a sorcerer of Dalaran, so I'd ask you not to put that in any letters home." },
      },
      choices = {
        { text = "Then how will you open the courtyard door?", next = "mage_door" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_door = {
      big = true,
      lines = {
        { id = "md_default", text = "That door was warded by Arugal, and I've spent my month here picking his ward apart in my head, thread by thread, because I'd nothing else to do. I can unmake it in a moment, and I'll admit that I'm rather proud of that." },
      },
      choices = {
        { text = "You should be. That's patient, careful work.", next = "BACK", reply = "Thank you. It's the only thing that kept me sane in that cell.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "A fireball would have been quicker.", next = "BACK", reply = "Quicker, yes, and louder, and Arugal would have heard it from the top of the tower. Patience, friend.", fx = { align = { order = -1 }, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ambermill = {
      lines = {
        { id = "am_default", text = "Ambermill? I couldn't say exactly, since I left before that work began, but I can guess. Dalaran wants its lands back, and Silverpine is full of old Kirin Tor holdings that nobody has looked after since the plague." },
      },
      choices = {
        { text = "The Forsaken say they're building something there.", next = "ambermill_forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambermill_forsaken = {
      lines = {
        { id = "af_default", text = "The Forsaken would say that, and the Forsaken would be right to worry, because a wizard who feels threatened builds things. Tell me honestly, since you've been out there: how bad are they, the dead of this forest?" },
      },
      choices = {
        { text = "They're dangerous, and Dalaran should stay wary.", next = "ambermill_answer", fx = { align = { order = 1 } } },
        { text = "They're people, mostly. Dalaran should talk to them.", next = "ambermill_answer", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "I haven't seen enough to judge yet.", next = "ambermill_answer" },
      },
    },
    ambermill_answer = {
      lines = {
        { id = "aa_default", text = "Well, I'll write that down, once I have a quill again. It's more than the Kirin Tor have bothered to ask anyone who's actually walked the place, which tells you something about the Kirin Tor." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A sorcerer of Dalaran, of the sort they send when they'd rather not send anyone important. I'm told that's a compliment." } },
    dalaran = { { id = "tp_dalaran", text = "Still standing behind its shield, last I knew, and still arguing about what to do with itself." } },
    _none = { { id = "tp_none", text = "I'm afraid that's outside my reading, and I've done a great deal of reading." } },
  },
}
