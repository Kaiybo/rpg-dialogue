-- Brill's other residents: Deathguard Burgess (Proof of Demise), the Gallows' End trainers
-- (Dark Cleric Beryl, Cain Firesong, Marion Call), the riding trainer Velma Warnam, the
-- herbalist Faruza, and the shopkeepers Mrs. Winters and Abigail Shiel.
-- Voices: bibles/brill_folk.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Deathguard Burgess
---------------------------------------------------------------------------
P:NPC {
  key = "burgess", id = TODO_NPC("Deathguard Burgess"), name = "Deathguard Burgess",
  bible = "bibles/brill_folk.md", role = "questgiver", tier = "quest",
  communities = { "brill" }, temper = { "proud", "sharp" }, values = { "loyal", "zealous" },
  notices = { "race", "kit" },

  impression = {
    first = "Deathguard Burgess stands by Brill's town hall and keeps a tally of the Scarlet Crusaders the Forsaken have killed, measured in rings. He speaks of Varimathras and the Dark Lady in the same proud breath, and he writes down the names of anyone who doesn't.",
    third = "{name} met Deathguard Burgess, who collects Scarlet insignia rings in Brill as proof of loyalty to the Dark Lady.",
  },

  greetings = {
    { id = "g_default", text = "Stand straight when you pass the town hall, {class}. The Dark Lady's lieutenant has eyes in Brill, and I am one pair of them." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I hope your pockets clink, because I've an empty box waiting for Scarlet rings." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the Crusade spent every day of it marching about in our fields. I trust you've been killing some of them somewhere else." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of the Warchief's living folk, in Brill. The Crusade hates you very nearly as much as it hates us, so you'll find plenty to do here." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The zealots have chewed your armor half to pieces. Get it mended before you go back out, because they won't stop at the armor next time." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathguard Burgess, at the Dark Lady's service and Lord Varimathras's. Brill stands because the Deathguard stands, and the Deathguard stands because we prove our loyalty every day, in Scarlet blood." },
        { id = "h_war", when = { questDone = TODO_QUEST("At War With The Scarlet Crusade") },
          text = "Executor Zygand tells me you've already been out killing Scarlet Crusaders, and he was pleased, which he rarely is. The Executor counts heads, though, and I count rings, so I have more work for you." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Proof of Demise") },
          text = "Ten Scarlet Insignia Rings, {class}, taken from ten Crusaders. A zealot's word is worth nothing, so his jewelry will have to speak for him." },
        { id = "h_done", when = { questDone = TODO_QUEST("Proof of Demise") },
          text = "Your rings went down to the Undercity in a sealed box, and I'm told Lord Varimathras looked at every one of them himself. You've been noticed, which is an honor or a warning, depending entirely on how you go on serving." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, all the way from the Warchief's plains to my town hall. I'm told your people honor the living and the dead alike, which must make Tirisfal a very confusing place for you." },
      },
      again = {
        { id = "h_again", text = "Something else? Speak up, I've a road to watch." },
        { id = "h_again2", text = "Go on, then. Loyalty never minds a question, so long as it's the right one." },
      },
      choices = {
        { text = "What work do you have for me?", next = "quest" },
        { text = "Who is Lord Varimathras?", next = "varim" },
        { text = "Why does the Crusade hate the Forsaken so much?", next = "crusade" },
        { text = "What's it like keeping watch in Brill?", next = "watch" },
        { text = "Did you serve Lordaeron in life, Burgess?", next = "past", when = { race = "Scourge" } },
        { text = "Do the Forsaken hate all the living, Burgess?", next = "xliving", when = { race = { "Tauren", "Orc", "Troll" } } },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 1, standing = { brill = 1 } } },
      },
    },

    -- Proof of Demise
    quest = {
      lines = {
        { id = "q_default", text = "Executor Zygand has the fields and I have the proof. Bring me ten Scarlet Insignia Rings from the Crusaders who camp across Tirisfal, and your name will go down to the Undercity with them as one who serves the Dark Lady properly." },
        { id = "q_done", when = { questDone = TODO_QUEST("Proof of Demise") }, text = "You've given me your proof already, and it was well received. The Crusade hasn't run short of rings, though, so if you're in the fields anyway, keep cutting." },
      },
      choices = {
        { text = "Why rings, and not heads?", next = "quest_rings" },
        { text = "Where will I find the Crusaders?", next = "quest_where" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    quest_rings = {
      big = true,
      lines = { { id = "qr_default", text = "Heads rot, even for us, and they're awkward to carry down the stairs into the Undercity. A ring bears the Crusade's mark and fits in a box, and they wear them as a promise to their Light, which makes taking them all the sweeter." } },
      choices = {
        { text = "Kill them cleanly. Mocking their faith is beneath us.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Good. Let them see their Light fail them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quest_where = {
      lines = { { id = "qw_default", text = "Solliden Farmstead to the west is crawling with them, and their watch posts line the road north toward the Monastery. Start at the farmstead, because the young ones there are careless and their rings come off easily." } },
      choices = {
        { text = "And the Monastery itself?", next = "quest_monastery" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quest_monastery = {
      lines = { { id = "qm_default", text = "Leave the Monastery for when you're older and harder, because its halls are full of zealots who've done nothing but train and pray for years. The ones at the farmstead will do for now, and there are more than enough of them." } },
      choices = { { text = "Farmstead first, then. Something else.", next = "BACK" } },
    },

    -- Varimathras
    varim = {
      lines = { { id = "v_default", text = "Lord Varimathras is the Dark Lady's lieutenant, and he sees to it that our war on the Crusade is waged properly. He's no Forsaken, being a demon of the old sort, but he serves her, and that's the only question that matters in Brill." } },
      choices = {
        { text = "A demon, serving the Forsaken? Can he be trusted?", next = "varim_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    varim_trust = {
      big = true,
      lines = { { id = "vt_default", text = "The Dark Lady trusts him, and I trust the Dark Lady, so the question never troubles me for long. Some of the deathguards mutter about it in the Gallows' End, and I write their names down, purely out of habit." } },
      choices = {
        { text = "The Dark Lady's judgment is good enough for me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd keep a close eye on any demon, lieutenant or not.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "You write down their names?", next = "varim_names" },
      },
    },
    varim_names = {
      lines = { { id = "vn_default", text = "Only so I remember who to watch, {class}. In Brill we say our loyalty aloud and often, and the ones who say it quietly get noticed, by me if by nobody else." } },
      choices = {
        { text = "I'll be sure to say it loudly, then.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Crusade
    crusade = {
      lines = { { id = "c_default", text = "They were Lordaeron's own once: soldiers, priests and farmers' sons who watched the plague take their kin and decided the cure was fire. Now they burn anything that walks without a heartbeat, and they'd burn Brill to its foundations if the Deathguard let them." } },
      choices = {
        { text = "Some of them must have been your neighbors.", next = "crusade_kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crusade_kin = {
      lines = { { id = "ck_default", text = "One of them was my brother-in-law, if the face I saw at Solliden was his, though I didn't stop to ask. He called me an abomination and loosed an arrow at me, and I took his ring, so I'd say the family accounts are settled." } },
      choices = {
        { text = "That's a hard thing to carry, Burgess.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Brill
    watch = {
      lines = { { id = "w_default", text = "Brill is quiet by day and quieter at night, apart from the bats and Gordo dragging his feet past the tavern. The trouble always comes in from the fields, so I stand by the town hall and watch the road, and I send people like you to do the walking." } },
      choices = {
        { text = "Who else should I know in Brill?", next = "watch_town" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_town = {
      lines = { { id = "wt_default", text = "Magistrate Sevren runs the town, Executor Zygand runs the war, and the apothecaries in the hall run experiments I don't ask about. Renee keeps the Gallows' End, and if you want to know what Brill really thinks, buy a drink there and listen." } },
      choices = { { text = "I'll listen, then. Something else.", next = "BACK" } },
    },

    -- Forsaken only
    past = {
      big = true,
      lines = { { id = "p_default", text = "I stood on a wall in Lordaeron's army, though I couldn't tell you which wall or which year, since the plague took that along with my heartbeat. I remember the Dark Lady's voice when she freed me, and I find that's all the past I need." } },
      choices = {
        { text = "She gave us everything. I'll serve her the same way.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'd rather remember who I was. All of it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Warchief's people
    xliving = {
      lines = { { id = "xl_default", text = "Only the ones pointing arrows at us, and your people seem to be the exception. I respect the Warchief's bargain with the Dark Lady, and I'll respect you, so long as you bring me rings rather than sermons." } },
      choices = { { text = "Rings, not sermons. Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's no question for a deathguard. Ask the Magistrate, or ask Renee, who hears more than he does." } },
  },
}

---------------------------------------------------------------------------
-- Dark Cleric Beryl
---------------------------------------------------------------------------
P:NPC {
  key = "beryl", id = TODO_NPC("Dark Cleric Beryl"), name = "Dark Cleric Beryl", title = "Priest Trainer",
  bible = "bibles/brill_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "calm" }, values = { "devout", "patient" },
  notices = { "class" },

  impression = {
    first = "Dark Cleric Beryl teaches priests of the Forgotten Shadow in the Gallows' End Tavern. He believes a shadow priest must learn to heal before learning to harm, and he speaks of the Light with more pity than anger.",
    third = "{name} met Dark Cleric Beryl, the priest trainer of Brill.",
  },

  greetings = {
    { id = "g_default", text = "Sit, if your joints still bend. The tavern is noisy, but faith doesn't need quiet, only attention." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Another of Duesten's students, come up from Deathknell. Sit down and show me what you've learned." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "The Light still answers you, I see. I don't understand it, but I won't call it a lie either, since I can see it shining." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dark Cleric Beryl, and I teach the priests of Brill the ways of the Forgotten Shadow. Tell me what you came to learn, and I'll tell you whether you're ready to learn it." },
        { id = "h_favor", when = { questActive = TODO_QUEST("In Favor of Darkness") },
          text = "Duesten sent you up the road to me, then. He writes that you have promise, and he doesn't write that about many." },
        { id = "h_kel", tags = { "news" }, when = { questActive = TODO_QUEST("Garments of Darkness") },
          text = "Deathguard Kel is north of the cemetery, still wounded from the gnolls and too stubborn to walk in for healing. Mend him and then fortify him, and come back and tell me how it felt." },
        { id = "h_kel_done", when = { questDone = TODO_QUEST("Garments of Darkness") },
          text = "Kel walked in yesterday and told me a young priest had healed him and left him stronger than he'd felt since dying. He meant it as thanks, though I doubt he knows what he was thanking you for." },
      },
      again = {
        { id = "h_again", text = "Something more? Ask, and I'll answer what I can." },
      },
      choices = {
        { text = "Teach me, Cleric.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why must a shadow priest learn to heal?", next = "heal" },
        { text = "What is the Forgotten Shadow?", next = "faith" },
        { text = "I'll go.", next = "END" },
      },
    },
    heal = {
      big = true,
      lines = { { id = "he_default", text = "Because the Deathguard bleed and someone has to mend them, and we can't wait for the Light to answer us as it answers the living. Before you can know the dark you must know what it stands against, so we learn both, and then we choose." } },
      choices = {
        { text = "Healing is the better half of our calling.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll heal when I must. Shadow is my strength.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    faith = {
      lines = { { id = "f_default", text = "It teaches that the Light betrayed us: it let us die, rot and rise again, and never said a word. So we put our faith in our own will, which never once abandoned us, not even in the grave." } },
      choices = {
        { text = "Didn't the Light abandon everyone in Lordaeron?", next = "faith2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    faith2 = {
      lines = { { id = "f2_default", text = "It did, and the living cling to it anyway, which saddens me more than it angers me. The Crusade prays louder every year and burns more every year, and I would sooner have a quiet faith in myself than a loud faith in something that let my village die." } },
      choices = {
        { text = "There's strength in a quiet faith.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, and I won't guess. Sit a while and listen to the tavern, and the answer may come to you." } },
  },
}

---------------------------------------------------------------------------
-- Cain Firesong
---------------------------------------------------------------------------
P:NPC {
  key = "cain_firesong", id = TODO_NPC("Cain Firesong"), name = "Cain Firesong", title = "Mage Trainer",
  bible = "bibles/brill_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "wry" }, values = { "curious", "proud" },
  notices = { "class", "arcane" },

  impression = {
    first = "Cain Firesong teaches the arcane in the back room of the Gallows' End, where Renee keeps a bucket of water by the door on his account. He studied in Dalaran once and has opinions about it he keeps to himself, mostly.",
    third = "{name} met Cain Firesong, the mage trainer in Brill's tavern.",
  },

  greetings = {
    { id = "g_default", text = "Mind the scorch marks on the floor. They're not all mine, whatever Renee tells you." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A student! Come in, sit down, and keep your sleeves away from the candles." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE", race = "Troll" },
      text = "A troll mage, in Brill! The Darkspear take to the arcane quicker than Dalaran ever believed they could, and I'd have loved to see the archmagi's faces." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Cain Firesong, and I have heard every joke about the name from every deathguard in Brill. I teach the arcane in the back of this tavern, where Renee can reach me with her bucket if I misjudge a fireball." },
        { id = "h_anastasia", tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Anastasia") },
          text = "Anastasia Hartwell is waiting for you in the Magic Quarter, and she doesn't wait gracefully. Go down into the Undercity and find her before she finds a sharper student." },
      },
      again = {
        { id = "h_again", text = "What else? I've time, if not patience." },
        { id = "h_again2", text = "Go on. Questions are cheaper than fireballs." },
      },
      choices = {
        { text = "Teach me something new.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Who is Anastasia Hartwell?", next = "anastasia", when = { class = "MAGE" } },
        { text = "Why teach in a tavern?", next = "tavern" },
        { text = "Did you study in Dalaran?", next = "dalaran" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    tavern = {
      lines = { { id = "t_default", text = "Because the Magistrate won't have me in the town hall after the business with the curtains, and Renee was the only one in Brill who'd take my rent. Besides, a tavern full of the dead is the safest place in Tirisfal to practise fire, since nobody screams." } },
      choices = {
        { text = "What happened with the curtains?", next = "curtains" },
        { text = "Something else.", next = "BACK" },
      },
    },
    curtains = {
      lines = { { id = "cu_default", text = "A small flame, poorly aimed, and a Magistrate who has never once let me forget it. He keeps a bucket by his own desk now, and I've decided to take that as a compliment." } },
      choices = { { text = "A wise precaution. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    dalaran = {
      big = true,
      lines = { { id = "d_default", text = "For three winters, before the plague came over the hills and Dalaran decided Lordaeron's troubles were Lordaeron's own. They sit behind their walls in the hills now and study us from a distance, and I'd rather not say what I think of that in a public house." } },
      choices = {
        { text = "Dalaran had to protect its own. That was wise.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dalaran hid while Lordaeron burned. It owes us.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    anastasia = {
      lines = { { id = "a_default", text = "She keeps the Magic Quarter's apprentices in line and keeps a list of every mage in the Dark Lady's service. If she has work for you, it's also a test, so I'd prepare for the test." } },
      choices = { { text = "I'll be ready. Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not my field, I'm afraid. Ask someone who isn't on fire half the time." } },
  },
}

---------------------------------------------------------------------------
-- Marion Call
---------------------------------------------------------------------------
P:NPC {
  key = "marion_call", id = TODO_NPC("Marion Call"), name = "Marion Call", title = "Rogue Trainer",
  bible = "bibles/brill_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "sly" }, values = { "cunning", "loyal" },
  notices = { "class", "stealth" },

  impression = {
    first = "Marion Call trains rogues in a corner of the Gallows' End that nobody sits in unless she has invited them. She hears everything said in the tavern and repeats very little of it, except to Mennet Carkad.",
    third = "{name} met Marion Call, the rogue trainer in Brill, who answers to Mennet Carkad in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "You're standing in my corner. Either you were invited or you're lost, and I don't remember inviting you." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "There you are. I heard you coming, which is something we'll have to work on." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Very nice, but I saw the door move. Come out and talk to me properly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Marion Call. I train rogues for the Dark Lady and keep this corner of the tavern to myself. Say what you came to say, and say it quietly." },
        { id = "h_carkad", tags = { "news" }, when = { questActive = TODO_QUEST("Mennet Carkad") },
          text = "You haven't been down to see Mennet Carkad yet? I'd go soon, because the last few who ignored his summons stopped turning up anywhere at all." },
        { id = "h_carkad_done", when = { questDone = TODO_QUEST("Mennet Carkad") },
          text = "So you went down to Carkad and came back up again, which means he likes you, or hasn't yet decided otherwise. Mind whatever he asks of you on the Sepulcher road." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep your voice down." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Who is Mennet Carkad?", next = "carkad" },
        { text = "What do you hear in this tavern?", next = "gossip" },
        { text = "Why do the dead need thieves?", next = "why" },
        { text = "I'll go.", next = "END" },
      },
    },
    carkad = {
      lines = { { id = "c_default", text = "He runs the Rogues' Quarter in the Undercity and the deathstalkers who come out of it, and he remembers every face that has ever disappointed him. If he sends for you, go, and if he gives you a name, don't ask why." } },
      choices = {
        { text = "Has he ever given you a name?", next = "carkad2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carkad2 = {
      lines = { { id = "c2_default", text = "Once, before Brill was ours, and I'll tell you only that the man kept a smithy and talked to the Crusade too often. Carkad thanked me with this corner and a bottle of something that tasted of nothing, which is the most anyone gets from him." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    gossip = {
      lines = { { id = "g_default", text = "The Magistrate frets, the apothecaries whisper, and Gordo mutters to himself in the yard about Coleman's grandmother. None of it is worth much to you yet, though you'd be surprised how much people say to a woman who never interrupts." } },
      choices = { { text = "I'll learn not to interrupt, then.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    why = {
      big = true,
      lines = { { id = "w_default", text = "Because the Crusade has spies in every ditch and Stormwind has spies in every port, and the Dark Lady won't fight them with soldiers alone. The Forsaken need people who go in quietly and come back with a name, and the dead make very quiet walkers." } },
      choices = {
        { text = "Then I'll go quietly, wherever I'm sent.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go quietly, but for my own reasons.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If I knew, I'd want paying for it. As it happens, I don't." } },
  },
}

---------------------------------------------------------------------------
-- Velma Warnam
---------------------------------------------------------------------------
P:NPC {
  key = "velma", id = TODO_NPC("Velma Warnam"), name = "Velma Warnam", title = "Riding Trainer",
  bible = "bibles/brill_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "brisk" }, values = { "practical", "kind" },
  notices = { "mount" },

  impression = {
    first = "Velma Warnam teaches the Forsaken to ride the skeletal horses Zachariah Post sells. She says a dead horse fears nothing, which is exactly the trouble with it, and she won't push one on when it stops at a field gate.",
    third = "{name} met Velma Warnam, who teaches riding in Brill.",
  },

  greetings = {
    { id = "g_default", text = "Mind the hooves. They don't kick, but they don't look where they step either." },
    { id = "g_mounted", when = { mounted = true }, text = "Sitting straighter than you did, I see. Your horse has noticed, even if you haven't." },
  },

  notice = {
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Keep your heels down and your will up, and that beast will carry you to Orgrimmar and back without a single complaint." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Velma Warnam. I teach the riding of the dead horses that Zachariah sells, which is nothing like riding the live sort, and I'll thank you not to tell me how your uncle did it." },
        { id = "h_ready", when = { minLevel = 40 }, text = "You're seasoned enough to sit a horse now, I think, and the road to the Bulwark is a long walk on dead feet. Shall we begin?" },
        { id = "h_young", when = { maxLevel = 39 }, text = "You're young yet for a saddle, {class}. Come back when you've seen more of the world, and the horses will still be here, since they don't age either." },
      },
      again = {
        { id = "h_again", text = "Something else? The horses can wait. They're very good at it." },
      },
      choices = {
        { text = "Teach me to ride.", next = "BUSINESS", when = { minLevel = 40 } },
        { text = "How is a dead horse different?", next = "horses" },
        { text = "Who rides them besides the Forsaken?", next = "others" },
        { text = "I'll go.", next = "END" },
      },
    },
    horses = {
      lines = { { id = "ho_default", text = "A living horse is frightened of everything and a dead one is frightened of nothing, which sounds better than it is, because it'll walk you straight off a cliff if you let it. You don't steer with kindness, you steer with your will, and the horse always knows which you're using." } },
      choices = {
        { text = "Do they remember being alive?", next = "horses2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horses2 = {
      lines = { { id = "ho2_default", text = "Sometimes one of them will stop at a field gate and just stand there, as if it's waiting to be let in for the night. I don't push them on when they do, though Zachariah says I'm sentimental and that bones don't remember pasture." } },
      choices = {
        { text = "Let them stand. They've earned that much.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      big = true,
      lines = { { id = "o_default", text = "The Forsaken, mostly, and the odd orc or troll who has done enough for the Undercity that the Dark Lady counts them a friend. Some of the living don't care for the smell or the clatter, and I tell them the horse feels the same about them." } },
      choices = {
        { text = "Only the Undercity's proven friends should ride them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A horse is a horse. Sell to anyone with coin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I know horses, and very little else. Ask Zachariah, or ask the Magistrate." } },
  },
}

---------------------------------------------------------------------------
-- Mrs. Winters
---------------------------------------------------------------------------
P:NPC {
  key = "mrs_winters", id = TODO_NPC("Mrs. Winters"), name = "Mrs. Winters", title = "General Supplies",
  bible = "bibles/brill_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "warm" }, values = { "practical", "loving" },
  notices = { "hunger" },

  impression = {
    first = "Mrs. Winters sells general goods in Brill and eats a crust of bread at her window every morning, though it does nothing for her. Her husband Abe sells armor across the way, and they still bicker like the living.",
    third = "{name} met Mrs. Winters, who sells general supplies in Brill.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in, and wipe your feet, dead or not. I've only just swept." },
  },

  notice = {
    { id = "n_living", cat = "hunger", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of the living! You'll want real bread, then, and not the stale loaves the deathguards buy for the smell." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mrs. Winters, general supplies. And before you ask, Mr. Winters sells armor across the way, and he'll tell you he's the senior partner, which he isn't." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? I've nowhere to be." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What do the dead buy?", next = "buy" },
        { text = "Tell me about Mr. Winters.", next = "abe" },
        { text = "Good day, Mrs. Winters.", next = "END" },
      },
    },
    buy = {
      lines = { { id = "b_default", text = "Thread, flour, flasks and candles, the same as the living, though they buy the candles for the smell more than the light. Most of my customers can't taste a thing, but they still buy bread, and I think it reminds them what mornings used to be like." } },
      choices = {
        { text = "Do you eat, Mrs. Winters?", next = "buy2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buy2 = {
      lines = { { id = "b2_default", text = "Every morning, a crust and a cup of something hot, at the same table by the window where I sat when I was alive. It does nothing for me at all, and I'll keep on doing it until the Dark Lady herself tells me to stop." } },
      choices = {
        { text = "Habits like that keep us who we are.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    abe = {
      big = true,
      lines = { { id = "a_default", text = "Abe and I were married in Brill's chapel, before the plague, and we both died of it in the same week. We woke in Deathknell a month apart, and he still insists that makes him the senior partner, because he was up first." } },
      choices = {
        { text = "Vows are vows. Death doesn't end them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Death ends every vow. You're free, if you want it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that, dear. Ask Renee at the tavern; she hears everything." } },
  },
}

---------------------------------------------------------------------------
-- Abigail Shiel
---------------------------------------------------------------------------
P:NPC {
  key = "abigail_shiel", id = TODO_NPC("Abigail Shiel"), name = "Abigail Shiel", title = "Trade Supplies",
  bible = "bibles/brill_folk.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "brisk" }, values = { "practical", "careful" },
  notices = { "craft" },

  impression = {
    first = "Abigail Shiel sells thread, dyes, flux and vials in Brill, and keeps a ledger of what every crafter in town owes her. She says a craft is a fine way to forget you're dead.",
    third = "{name} met Abigail Shiel, who sells trade supplies in Brill.",
  },

  greetings = {
    { id = "g_default", text = "Trade goods, all fresh, or as fresh as anything stays in Tirisfal. What are you making?" },
  },

  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Leatherworking", "Alchemy", "Blacksmithing" } },
      text = "A crafter, by your hands. Good, because I've crates of supplies and not nearly enough people who know what to do with them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Abigail Shiel, trade supplies: thread, dyes, flux and vials for anyone in Brill who still makes things with their hands. You'd be surprised how many do, since a craft is a fine way to forget you're dead." },
      },
      again = {
        { id = "h_again", text = "Something else? I've a ledger to balance." },
      },
      choices = {
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Who buys trade goods in Brill?", next = "who" },
        { text = "Where do your goods come from?", next = "supply" },
        { text = "Good day.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Carolai Anise buys vials by the crate for her potions, the apothecaries buy more than they admit to, and the tailors buy thread they can't even feel between their fingers. I keep a ledger of every one of them, because the dead are terrible at remembering what they owe." } },
      choices = {
        { text = "Do they pay their debts?", next = "who2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who2 = {
      lines = { { id = "w2_default", text = "Eventually, since nobody in Brill is going anywhere in a hurry and a debt doesn't rot. The worst are the apothecaries, who pay in promises and the occasional jar of something I'd rather not open." } },
      choices = { { text = "Keep those jars closed. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    supply = {
      big = true,
      lines = { { id = "s_default", text = "From the Undercity, mostly, and from the goblins who bring cargo off the zeppelins at the tower west of town. Some of it comes off Crusade wagons that the deathstalkers stop on the north road, and I don't ask how they stopped them." } },
      choices = {
        { text = "Goods taken from the Crusade are fair spoils of war.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather not buy from looted wagons.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If it isn't in my ledger, I don't know it. Try the Magistrate." } },
  },
}

---------------------------------------------------------------------------
-- Faruza
---------------------------------------------------------------------------
P:NPC {
  key = "faruza", id = TODO_NPC("Faruza"), name = "Faruza", title = "Herbalism Trainer",
  bible = "bibles/brill_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "quiet" }, values = { "careful", "curious" },
  notices = { "craft" },

  impression = {
    first = "Faruza teaches herbalism in Brill, and says the dead make good pickers because their hands never shake. She keeps her gloves on and her opinions about the Apothecary Society mostly to herself.",
    third = "{name} met Faruza, who teaches herbalism in Brill.",
  },

  greetings = {
    { id = "g_default", text = "Gloves on, if you're touching anything on my table. Some of it bites back." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell of peacebloom and earthroot, which is a very good smell to have in Brill. Keep picking." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Faruza, herbalist. I teach the picking of plants to anyone with a steady hand and a sharp eye, and the dead have very steady hands, I'll say that much for us." },
      },
      again = {
        { id = "h_again", text = "Anything else? The roots won't dry themselves." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What grows in Tirisfal now?", next = "grows" },
        { text = "Who buys your herbs?", next = "buyers" },
        { text = "I'll go.", next = "END" },
      },
    },
    grows = {
      lines = { { id = "g_default", text = "Peacebloom and silverleaf along the roads, earthroot in the hills, and mageroyal if you're lucky and the Scourge haven't trampled it. The plague got into the soil in places, and some of what comes up there is a color I don't recognize, which I leave well alone." } },
      choices = {
        { text = "Have you tried picking the strange ones?", next = "grows2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows2 = {
      lines = { { id = "g2_default", text = "Once, and the apothecaries came to Brill the next morning asking where I'd found it, which taught me to keep my mouth shut and my gloves on. Junior Apothecary Holland still asks me about it whenever he thinks I've forgotten." } },
      choices = { { text = "Gloves on, mouth shut. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    buyers = {
      big = true,
      lines = { { id = "bu_default", text = "Carolai Anise for her potions, and the Apothecary Society for whatever it is the Society does, and they pay better than she does, which bothers me more than it should. I sell to both, though I sleep better on the days I sell to Carolai." } },
      choices = {
        { text = "Sell to whoever pays most. Herbs don't care.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Sell to the healer. Conscience counts for something.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I know leaves and roots, not that. Carolai might, or the apothecaries, if you can get a straight word out of them." } },
  },
}
