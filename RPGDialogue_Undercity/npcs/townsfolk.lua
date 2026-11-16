-- The Undercity's working dead: the bank, the stables, the War Quarter's weapon master and smith,
-- the Magic Quarter's enchanter, the Rogues' Quarter's trainer and poisoner, and the city's
-- teachers of bandages, fishing and mining. No quests and little gossip in the game.
-- Voice: bibles/townsfolk.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Trade Quarter
---------------------------------------------------------------------------

-- William Montague: a banker who kept accounts in Lordaeron's capital before it fell, and still does.
P:NPC {
  key = "wmontague", id = TODO_NPC("William Montague"), name = "William Montague", title = "Banker",
  bible = "bibles/townsfolk.md", role = "banker", tier = "service",
  communities = { "undercity" }, temper = { "dry" }, values = { "precise", "honest" },
  impression = {
    first = "William Montague keeps the Undercity's vaults with the manners of a clerk from a city that no longer exists above him. He finds death a poor excuse for sloppy accounts.",
    third = "{name} met William Montague, a banker of the Undercity who still keeps Lordaeron's habits of order.",
  },

  greetings = {
    { id = "g_hi", text = "Deposit or withdrawal? Speak clearly, please; the vaults echo." },
    { id = "g_back", when = { metBefore = true }, text = "Your account is in order, which is more than I can say for most of the dead." },
    { id = "g_living", when = { ["not"] = { race = "Scourge" } }, text = "A living customer, how refreshing. Your coins are perfectly safe here, and so are you, mostly." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "William Montague, of the bank of the Undercity. Whatever you leave with me stays in the vaults beneath the old city until you ask for it, and it can be reached from any bank of the Horde." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "Ah, one of us. I'd advise you to keep your valuables here rather than in your pockets; our pockets do tend to fall apart." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your gold is as welcome as anyone's, and I ask only that you keep the lightning away from the vault doors, since the hinges are older than I am." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, at the bank. I confess I've never understood what a druid keeps in a vault, since you seem to carry everything in your fur." },
      },
      again = {
        { id = "h_again", text = "Anything further? I have accounts to balance." },
        { id = "h_again2", text = "Ask, by all means. I have been dead for some years and have learned to be patient about interruptions." },
      },
      choices = {
        { text = "Do you trust the Horde's gold, Mister Montague?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do the Forsaken keep in your vaults, Mister Montague?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Open my vault.", next = "BUSINESS" },
        { text = "Were you a banker in life?", next = "life" },
        { text = "What do the dead need with gold?", next = "gold" },
        { text = "Who owned these vaults before?", next = "vaults" },
        { text = "Your vaults must tempt a few thieves, Mister Montague.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do mages bank their reagents with you?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Good day, Mister Montague.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "A clerk at a counting house in the capital, three streets from the palace. When the plague came I was in the middle of a ledger, and when I woke up in the Undercity, I'm told the first thing I asked for was a pen." } },
      choices = {
        { text = "Do you miss your old life?", next = "life_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life_miss = {
      lines = { { id = "lm_default", text = "I miss the bread, and I miss sunlight on the counting-house windows. I do not miss my employer, who owed me a month's wages, and who I'm fairly sure is shambling about the Plaguelands now." } },
      choices = {
        { text = "The past is gone. Look forward.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some things are worth holding on to.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    gold = {
      lines = { { id = "g_default", text = "The same as the living, only less of it goes on food. The apothecaries want reagents, the soldiers want steel, and the Dark Lady's war against the Scourge isn't paid for with good intentions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    vaults = {
      lines = { { id = "v_default", text = "The royal family of Lordaeron, after a fashion. These were catacombs and crypts beneath the palace, and some of the vaults were already full of very old kings when we moved in. We've since made other arrangements for them." } },
      choices = {
        { text = "That seems disrespectful.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The dead kings don't need the space.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "What arrangements?", next = "vaults_arr" },
      },
    },
    vaults_arr = {
      lines = { { id = "va_default", text = "I don't ask, and I'd advise you not to either. The apothecaries were very interested in the old kings, and that's all I'm prepared to say." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I trust gold, which is the only thing in this city that hasn't changed its loyalties since the plague. The Horde's coin spends the same in Orgrimmar as it does here, and I've found the orcs settle their debts more promptly than Lordaeron's nobles ever did." } },
      choices = {
        { text = "Then we'll keep our debts paid, and our word with them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Debts are for the weak. I pay what I must.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Records, chiefly, and the deeds to houses nobody will live in again. Half my vaults are full of Lordaeron's paper, and I keep it in order because somebody ought to remember who owned what, even if every owner is dead or in this city." } },
      choices = {
        { text = "Keep the records. Someone ought to remember.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn the old deeds. The Forsaken own what they hold.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They tempt a great many, and the Rogues' Quarter is a very short walk away, which I consider a poor piece of city planning. No thief has yet opened one of my vaults without my ledger noting it, and I intend to keep that record." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "If you lifted purses in the capital before the plague, some of that gold may well be sitting in my vaults today. I find that rather tidy, and I hope you'll leave it where it is." },
      },
      choices = {
        { text = "Your vaults are safe from me, sir.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No ledger catches everything, Mister Montague.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who owned these vaults before?", next = "vaults" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They do, and they insist on labelling every pouch in a hand nobody else can read, which plays havoc with my accounts. The Magic Quarter folk are good customers otherwise, though one of them once stored something in a vault that hummed." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran's people banked in the capital too, in the old days, and they were exactly as particular then as they are now. I find the consistency rather comforting, if I'm honest." },
      },
      choices = {
        { text = "I'll label my pouches plainly, sir.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My reagents are my own affair, sir.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What do the dead need with gold?", next = "gold" },
      },
    },
  },

  topics = {
    new_plague = { { id = "tp_plague", text = "The Royal Apothecary Society's business, not mine. I only keep their accounts, and their accounts are alarming." } },
    _none = { { id = "tp_none", text = "That isn't in my ledgers. Try Innkeeper Norman; he hears everything that's said in the Trade Quarter." } },
  },
}

-- Anya Maulray: the stable master, whose beasts have to be persuaded the dead won't eat them.
P:NPC {
  key = "maulray", id = TODO_NPC("Anya Maulray"), name = "Anya Maulray", title = "Stable Master",
  bible = "bibles/townsfolk.md", role = "stablemaster", tier = "service",
  communities = { "undercity" }, temper = { "gentle" }, values = { "kind", "patient" },
  notices = { "pet" },
  impression = {
    first = "Anya Maulray keeps the hunters' beasts beneath the ruined capital and has spent her whole unlife convincing animals she means them no harm. She is softer with them than with any of the living.",
    third = "{name} met Anya Maulray, the stable master of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "Quietly, please; the beasts startle easily down here." },
    { id = "g_back", when = { metBefore = true }, text = "Come for your beast? It's been fed, and it has nearly forgiven me for smelling the way I do." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER", pet = { named = true } },
      text = "{pet} is pressing close to you, look, and not to me. That's what trust looks like on a beast, and it's not easily won down here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Anya Maulray. I keep the stables for the Undercity's hunters, which is harder than it sounds when every animal I care for can smell that I'm dead." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren hunter, so far from the plains. Your beasts are always the calmest ones I get; I think they learn it from you." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in my stables. The beasts always settle a little when one of your sort walks in, and I've never known why." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, how lovely. The beasts are watching you, see, the way they watch each other, and not the way they watch me." },
      },
      again = { { id = "h_again", text = "Anything else? Keep your voice gentle, if you would." } },
      choices = {
        { text = "Shall I ask the beasts' spirits to trust you, Anya?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does it hurt, Anya, that the beasts fear you?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I need the stables.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Do the animals fear you?", next = "fear" },
        { text = "How do the beasts fare underground?", next = "under" },
        { text = "Why tend beasts at all, now?", next = "why" },
        { text = "Your beasts never hear me coming, Anya.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Would your beasts tolerate my demon, Anya?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    fear = {
      lines = { { id = "f_default", text = "At first, every one of them. A wolf will growl at me for a week before it eats from my hand, and a cat will hiss at me for longer. But they learn that I come back with food every day, and that's all any animal really needs to know." } },
      choices = {
        { text = "That's very patient of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Do you ever give up on one?", next = "fear_give" },
      },
    },
    fear_give = {
      lines = { { id = "fg_default", text = "Never yet. There was a bear from Silverpine that wouldn't come near me for a month, and in the end it slept against the bars beside my chair. I count that as the best thing I've done since I woke up." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    under = {
      lines = { { id = "u_default", text = "Badly, at first. There's no sun and the canals smell of things I'd rather not name. So I take them up the lift to the ruins at night and let them run in the courtyard, where the air is clean, or as clean as Tirisfal gets." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      big = true,
      lines = { { id = "w_default", text = "Because I raised horses before I died, near Brill, and caring for something warm is the one part of being alive I could still do. Some of the others think it's sentimental of me." } },
      choices = {
        { text = "It isn't sentimental. It's what keeps you yourself.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The others are right. Sentiment is a weakness.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Would they listen? I've spent every day since I woke teaching wolves and cats that I won't eat them, and it's slow, and some never quite believe me. If the spirits whispered it to them I'd be grateful, but I think I'd rather they learned it from me." } },
      choices = {
        { text = "Then I'll leave them be. Trust that's earned is worth more.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll ask anyway. Your beasts deserve peace sooner.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Every day, a little, though I've stopped minding it the way I used to. I raised horses near Brill and they'd come to the fence when I called, and now I have to earn every one of them over again, so you don't know how lucky you are to smell alive." } },
      choices = {
        { text = "Your patience is a gift. Keep earning them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts follow strength, Anya, not kindness.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They hear you; they just don't think you're worth growling at, which is a different thing entirely. Rogues come down here to practise creeping and only frighten the bats, so I'd thank you to practise somewhere else." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "They hear you well enough, but a Forsaken who moves quietly smells like nothing at all to them, and that unsettles them more than noise would. Practise your creeping somewhere else, please, for their sake." },
      },
      choices = {
        { text = "I'll leave your beasts in peace, Anya.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Creeping's my trade. Your bats will cope.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Do the animals fear you?", next = "fear" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Not for a moment, and I don't blame them, because a beast knows a thing that doesn't belong in the world when it smells one. Leave it at the top of the stair, and I'll not have to calm every animal in the stable afterward." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "You ought to know better, since your people's wolves never cared for the warlocks' pets, or so a grunt told me once. Leave the demon at the top of the stair, please." },
      },
      choices = {
        { text = "I'll leave it at the stair. Your beasts come first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon goes where I go, Anya.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How do the beasts fare underground?", next = "under" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I'm afraid I only know about beasts. Ask at the inn; the innkeeper knows everyone." } },
  },
}

---------------------------------------------------------------------------
-- War Quarter
---------------------------------------------------------------------------

-- Archibald: the weapon master, a soldier of Lordaeron teaching dead hands to hold a blade again.
P:NPC {
  key = "archibald", id = TODO_NPC("Archibald"), name = "Archibald", title = "Weapon Master",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "stern" }, values = { "disciplined", "proud" },
  notices = { "class" },
  impression = {
    first = "Archibald teaches the Forsaken to hold blades and crossbows with hands that no longer quite work. He drills like a sergeant who expects to be obeyed and is surprised when he is.",
    third = "{name} met Archibald, the weapon master of the Undercity's War Quarter.",
  },

  greetings = {
    { id = "g_hi", text = "Stand up straight. You'd be amazed how many of the dead forget." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more drills? Good, because nobody ever practised too much." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Your grip's wrong. Thumb over, not under, or that blade will twist out of your hand on the first hard parry. Fix it now and thank me later." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Archibald, weapon master of the War Quarter. I teach anyone who can pay how to use a weapon they've never held before, and I teach the dead how to hold one with fingers that don't always do what they're told." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "Your joints creak, I can hear it from here. Mine did too, at first. Practise every day until your arms remember what your mind already knows." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Stand up straight, and keep those totems out of my training yard, because the recruits keep saluting them." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in my yard. You'll want a staff, I expect, since claws can't be bought or sold." },
      },
      again = { { id = "h_again", text = "What else? Be quick; I've recruits at the target butts." } },
      choices = {
        { text = "Will you teach a shaman the mace, weapon master?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is a staff worth learning, when I fight with claws?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me a new weapon.", next = "BUSINESS" },
        { text = "Were you a soldier in life?", next = "life" },
        { text = "Is it harder for the dead to fight?", next = "dead" },
        { text = "Which weapon should I learn?", next = "which" },
        { text = "Teach me daggers, Archibald, not swords.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Is a staff worth learning properly, Archibald?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "A sergeant in Lordaeron's army, before the plague, and I trained recruits in the capital's yard right above where we're standing. When Prince Arthas came home, I was on the wall to welcome him." } },
      choices = {
        { text = "What happened that day?", next = "life_day" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life_day = {
      lines = { { id = "ld_default", text = "He walked up the road to the throne room, and everyone cheered him, and then he killed his father. I was dead by nightfall and I don't remember the rest. I'd like to meet him again, though, with a crossbow." } },
      choices = {
        { text = "Then I hope you get your chance.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Vengeance won't bring Lordaeron back.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Slower in the hands, but we never tire and we don't feel half our wounds, which is an advantage until you notice you've been bleeding for an hour. Learn to check yourself after every fight." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    which = {
      lines = { { id = "w_default", text = "Whatever your trainer and your armour allow, and then the one you'll actually practise. A mediocre warrior with a sword he loves is better than a good one with an axe he resents." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I'll teach anyone who pays and listens, and a shaman with a good mace is worth two who rely on lightning. The Scourge doesn't wait for you to finish calling on anything, so learn to hit things, and learn to hit them first." } },
      choices = {
        { text = "I'll drill until my arm remembers, weapon master.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight my own way. Your drills are for soldiers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Everything's worth learning, because one day you'll be caught on two legs with no time to change. A staff kept me alive on the walls of the capital longer than my sword did, and I'd have you know that before you sneer at it." } },
      choices = {
        { text = "Then teach me. I'll practise every day.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My claws have never failed me, Archibald.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Daggers I'll teach, though the rogues who come to me usually know more about holding them than I do and less about blocking with them. Learn both, and you'll live through the fight the knife didn't finish." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I drilled the city watch in life, and I spent half my career chasing the sort of person you probably were. Now I'm teaching you to hold a dagger better, and I think the irony suits us both." },
      },
      choices = {
        { text = "I'll learn to block, Archibald. You're right.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The fight's done before they can block.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Which weapon should I learn?", next = "which" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "More than worth it, since a mage who can only cast is a mage who dies the moment his mana runs dry. A good staff will crack a ghoul's skull as well as any mace, and it never asks you to say a word." },
        { id = "xmage_troll", when = { race = "Troll" }, text = "A troll mage with a staff is about the most dangerous thing I've seen walk into this quarter, since your people can swing as well as cast. Let's see if you can keep the end of it up." },
      },
      choices = {
        { text = "I'll learn the staff and save my spells.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll stick to spells. That's what I'm for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Is it harder for the dead to fight?", next = "dead" },
      },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "Former comrades, some of them, and fanatics now. They'd kill me again without blinking, so I'll return the favour." } },
    _none = { { id = "tp_none", text = "Not my field, soldier. I teach steel, so ask a scholar for the rest." } },
  },
}

-- James Van Brunt: the War Quarter's blacksmithing trainer.
P:NPC {
  key = "vanbrunt", id = TODO_NPC("James Van Brunt"), name = "James Van Brunt", title = "Blacksmithing Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "gruff" }, values = { "diligent" },
  notices = { "profession", "wounds" },
  impression = {
    first = "James Van Brunt works the forges of the War Quarter without gloves, since the heat no longer bothers him. He teaches smithing like a man who has nothing left but the work and has decided that's enough.",
    third = "{name} met James Van Brunt, the blacksmithing trainer of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "Stand back from the forge. I can't feel the heat any more, but you can." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did the steel hold?" },
  },

  notice = {
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.3 } },
      text = "Your armour's falling off you in pieces. If you're not going to look after it, at least let someone who cares do it for you." },
    { id = "n_smith", cat = "profession", when = { profession = { name = "Blacksmithing", min = 150 } },
      text = "You've good callouses for a smith. Keep them; you'll need them for the heavier work." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "James Van Brunt. I teach smithing in the War Quarter, and I make armour for the Deathguard. The work is the same as it ever was; only the smith is different." },
        { id = "h_smith", when = { profession = "Blacksmithing" }, text = "A smith, are you? Then you know you can't hurry iron, and dead or alive, that's the only lesson that matters." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. If you've come to bless my forge, don't; it's been burning since before the Dark Lady took the city, and it doesn't need the help." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'll have no use for my plate, I expect, since it doesn't change shape when you do." },
      },
      again = { { id = "h_again", text = "What else? The iron's cooling." } },
      choices = {
        { text = "Could the earth spirits help your smithing, Van Brunt?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does a smith ever tire of the same work, Van Brunt?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me blacksmithing.", next = "BUSINESS" },
        { text = "Is smithing different when you're dead?", next = "dead" },
        { text = "Where do you get your ore?", next = "ore" },
        { text = "What does the Deathguard need most?", next = "guard" },
        { text = "Can you forge a dagger that doesn't catch the light?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do warlocks ask you for anything strange, Van Brunt?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "I can hold hot iron in my bare hand, which saves time. But I can't feel when the metal's just right through the tongs any more, so I have to watch the colour instead, and I've ruined a few blades learning to." } },
      choices = {
        { text = "That's a hard thing to relearn.", next = "BACK", fx = { affinity = 1 } },
        { text = "Not feeling pain sounds useful.", next = "dead_pain" },
      },
    },
    dead_pain = {
      lines = { { id = "dp_default", text = "Useful, until you put your hand down on an anvil you forgot was hot and smell yourself cooking. I keep a bucket of water by the forge for exactly that reason." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ore = {
      lines = { { id = "o_default", text = "Copper and tin from the hills of Silverpine and Tirisfal, and iron from the Hillsbrad Foothills when the miners there aren't being shot at. Brom Killian teaches mining here, if you'd rather dig your own." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    guard = {
      lines = { { id = "g_default", text = "Everything, and quickly. They lose more armour to the Scourge in the north and the Scarlets in the east than I can mend in a week. I've stopped sleeping, which helps, though I never needed to." } },
      choices = {
        { text = "The Deathguard deserves the best steel.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them scavenge armour from the Scarlets.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The earth gives me ore and the fire gives me heat, and I've never yet had to thank either of them. The orcs say their smiths ask the stone before they cut it, and maybe that's why their axes hold, but the Deathguard need armour faster than I can ask anyone's permission." } },
      choices = {
        { text = "Thank the stone, smith. It costs you nothing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The work's what matters. The spirits can wait.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Tire? I'm dead, so no, and I can't say I'd want to. The work is the same as it ever was, and that's the only thing in this city that is, so I hold on to it with both hands, even the burnt one." } },
      choices = {
        { text = "Steady work is a kind of peace. Keep it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Change would do you good, smith. Try something new.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I can blacken the blade, which is old soldiers' work and nothing clever, and the Rogues' Quarter keeps me busy with it. A dull blade in a dark canal is near invisible, though you'll still need the sense to keep it out of the torchlight." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I blackened blades for the king's scouts in life, and now I blacken them for the Dark Lady's deathstalkers, so the work hasn't changed much. You'll still need the sense to keep it out of the torchlight." },
      },
      choices = {
        { text = "A dark blade for dark work. Good.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather my enemies see the blade coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What does the Deathguard need most?", next = "guard" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They ask me to work fel-touched ore now and then, and I tell them no, because metal that whispers isn't metal I'll put my name to. Bring me honest iron and I'll make you honest work." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "I knew a smith in the capital who went over to the Cult before the end and forged for them, and he never made anything clean again. Keep your demons away from my forge, and we'll get on fine." },
      },
      choices = {
        { text = "Honest iron, then. I'll respect your forge.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fel-touched or not, metal's metal, Van Brunt.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Is smithing different when you're dead?", next = "dead" },
      },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They make decent plate, I'll give them that. It comes back here in pieces for melting down." } },
    _none = { { id = "tp_none", text = "If it isn't metal, I don't care to know. Ask someone else." } },
  },
}

-- Brom Killian: the mining trainer, who sees the old city's foundations as one long seam.
P:NPC {
  key = "killian", id = TODO_NPC("Brom Killian"), name = "Brom Killian", title = "Mining Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "dry" }, values = { "practical" },
  notices = { "profession" },
  impression = {
    first = "Brom Killian teaches mining to the dead with the cheerful air of a man who has already been buried once. Every tunnel under the old city seems to him like a missed opportunity.",
    third = "{name} met Brom Killian, the mining trainer of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "Come to learn to dig? We're all good at being underground in this city." },
    { id = "g_back", when = { metBefore = true }, text = "Back with dirt under your nails? Good, that means you're working." },
  },

  notice = {
    { id = "n_miner", cat = "profession", when = { profession = { name = "Mining", min = 125 } },
      text = "Iron dust on your sleeves. You've been working proper veins, then, not just the copper that any child can find." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Brom Killian, and I teach mining. It's a fitting trade for the Forsaken, I always say, since we've already done the hard part of being put in the ground." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You talk to the earth, they say, so ask it where the good veins are and save us both a lot of digging." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Before you ask, no, I don't think the hills mind the mines, and I've been underground long enough to know their moods." },
      },
      again = { { id = "h_again", text = "Something else? Ask it, then; the rocks will still be there when we're done." } },
      choices = {
        { text = "Do miners ever thank the earth, Killian?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What moods do the hills have, Killian?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me mining.", next = "BUSINESS" },
        { text = "Where should I mine near here?", next = "where" },
        { text = "Was this city dug by miners?", next = "city" },
        { text = "Your tunnels must be handy for going unseen, Killian.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can magic find ore faster than a pick, Killian?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "There's copper in the hills of Tirisfal, around the mines and the caves, though watch for the Scarlets near the monastery. For tin and silver, try Silverpine and then the Hillsbrad Foothills, where the Syndicate and the Alliance will both want a word with you." } },
      choices = {
        { text = "Do the Scarlets mine too?", next = "where_scarlet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_scarlet = {
      lines = { { id = "ws_default", text = "No, they only burn things. But they patrol the hills, and they'll put an arrow in any Forsaken who stops to dig, so work fast and keep looking over your shoulder." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } } },
    },
    city = {
      lines = { { id = "c_default", text = "The catacombs were, long ago, by the builders of old Lordaeron. The Scourge started on the rest and we finished it. Every tunnel down here was dug by somebody's hands, and some of those hands are still working." } },
      choices = {
        { text = "The dead built their own city. I admire that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Scourge dug it. That's not much to admire.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Thank it? I've been buried in it, friend, so I'd say the earth and I have already been as close as two parties can be. I take my copper and I fill in my holes when I remember, and that's all the thanks it's getting from me." } },
      choices = {
        { text = "Fill your holes, at least. The earth remembers.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Take what you need. The earth won't miss it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Sullen, mostly, and wet, and they grumble when you dig too near the Scarlet watchtowers. I'll grant you there's a cave north of Brill where the rock feels wrong, but I put that down to the Scourge, not to the hills having opinions." } },
      choices = {
        { text = "The hills do have opinions. Listen to them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Rock is rock. Dig it and sell it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Handy enough, though most of them flood or collapse, and the ones that don't belong to the Rogues' Quarter already. I'd not go poking about the old sewers without asking Carolyn Ward first, unless you fancy a knife in a dark place." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "If you came up through the old sewers in life, dodging the city watch, you'll find they've changed a fair bit since the plague. Some go further down than I'd like, and I've a miner's nose for when a tunnel's wrong." },
      },
      choices = {
        { text = "I'll ask Ward first. Her quarter, her rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go where I like below the city.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Was this city dug by miners?", next = "city" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Magic can find ore, aye, and then it stands back while someone with a pick does the actual work, which is how it's always been. The Magic Quarter folk come to me for gems now and then, and not one of them has ever lifted a pick to help." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "I knew Dalaran men who came to the capital's mines looking for crystals with their little rods, and they never once dirtied their robes. Take a pick, and let the magic rest." },
      },
      choices = {
        { text = "Fair enough. I'll learn the pick properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Magic's quicker, Killian, and I prefer quick.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where should I mine near here?", next = "where" },
      },
    },
  },

  topics = {
    syndicate = { { id = "tp_syndicate", text = "Thieves in the Alterac foothills. They take the ore you've just dug, so dig quickly." } },
    _none = { { id = "tp_none", text = "I don't know. I'm only good with rocks; ask someone who reads books." } },
  },
}

---------------------------------------------------------------------------
-- Magic Quarter
---------------------------------------------------------------------------

-- Lavinia Crowe: the enchanting trainer, who still thinks of magic as a delicacy.
P:NPC {
  key = "lavinia_crowe", id = TODO_NPC("Lavinia Crowe"), name = "Lavinia Crowe", title = "Enchanting Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "proud" }, values = { "curious", "precise" },
  notices = { "profession", "class" },
  impression = {
    first = "Lavinia Crowe teaches enchanting in the Magic Quarter and talks about dust and essences the way a chef talks about spices. She is particular and proud, and her lessons are better for it.",
    third = "{name} met Lavinia Crowe, the enchanting trainer of the Undercity's Magic Quarter.",
  },

  greetings = {
    { id = "g_hi", text = "Don't touch the rods; they're charged, and I'd rather not explain your death to anyone." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Show me what you've been enchanting, and don't be shy." },
  },

  notice = {
    { id = "n_ench", cat = "profession", when = { profession = { name = "Enchanting", min = 100 } },
      text = "You've a little dust on your fingertips, and it glitters. You've been breaking things down, then, and I approve." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You throw your magic out into the world and let it go, whereas we enchanters keep ours and put it somewhere useful. Both have their place, but mine is tidier." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lavinia Crowe. I teach enchanting, the art of breaking magic out of one thing and putting it into another. It's delicate work, so I hope your hands are steadier than most." },
        { id = "h_ench", when = { profession = "Enchanting" }, text = "One of mine! Have you been saving your essences, or selling them to the first merchant who asks? I'll know if you've been selling them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You put spirits into your totems, I gather, and I put magic into swords, so we're nearly colleagues, though I do it more tidily." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You change your shape the way I change an item's nature, though you, at least, can change back." },
      },
      again = { { id = "h_again", text = "Something else? Ask, but quietly; the rods hum when people shout." } },
      choices = {
        { text = "Is my totem craft so different from your enchanting, Lavinia?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could you enchant something to change as I do, Lavinia?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "How does enchanting work?", next = "how" },
        { text = "Did you learn this in Dalaran?", next = "dalaran" },
        { text = "Is it hard for the dead to work magic?", next = "dead" },
        { text = "Can enchanting bind a demon, Lavinia?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Could enchanting make my blades quieter, Lavinia?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    how = {
      lines = { { id = "hw_default", text = "You take an item that has some magic in it, and you break it down into dust and essences. Then you take that dust and put it into something else, a sword or a cloak, and it holds the magic for you." } },
      choices = {
        { text = "Doesn't that destroy the first item?", next = "how_destroy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_destroy = {
      lines = { { id = "hd_default", text = "Utterly, and that's the part people hate. A sword you loved becomes a pinch of dust. But it's the only way the magic moves, so you learn to love the dust instead." } },
      choices = {
        { text = "Nothing is wasted that way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things shouldn't be broken down.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    dalaran = {
      lines = { { id = "d_default", text = "I studied there for two summers, when I was alive and the Kirin Tor still took students from Lordaeron's merchant families. They wouldn't take me now, of course, and I'm not certain I'd go." } },
      choices = {
        { text = "Why wouldn't you go?", next = "dalaran_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran_why = {
      lines = { { id = "dw_default", text = "Because their wizards watched the plague spread through Lordaeron and argued about it until it reached their own gates. Bethor Iceshard has more to say about Dalaran than I do, and he says it at length." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dead = {
      lines = { { id = "de_default", text = "The magic doesn't care whether you're breathing, which surprised everyone. The hard part is the patience, because the dead have time but not always the steadiness, and enchanting forgives nothing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Very, because I break things down to get my magic, and you ask the spirits to lend theirs. I'd say yours is the more polite art and mine the more reliable, and you may decide which you'd rather have in a fight." } },
      choices = {
        { text = "Polite, I'll take. Borrowed power must be respected.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Reliable is better. I'd rather own my power.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Not without destroying it first, and then it's a pinch of dust and no use to anyone. The only thing I ever enchanted that changed back was a cloak, and it changed back into curtains, which was not the effect I was after." } },
      choices = {
        { text = "Some things should keep their own nature. Leave them be.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Break the rules, Lavinia. That's how new arts are made.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "It binds power into objects, and a demon is not an object, however much your trainers would like you to think so. Keep the two crafts apart, because I've seen a warlock's enchanted ring go very wrong, and I'd rather not see it again." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "We dead mages kept to the arcane and you dead warlocks went down another road entirely, and the Magic Quarter is big enough for us both, mostly. Do keep your imp out of my dust; it eats it." },
      },
      choices = {
        { text = "I'll keep the crafts apart, as you say.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every craft bends if you push it hard enough.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How does enchanting work?", next = "how" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Quieter, no, though I've been asked, and I tell every rogue the same thing: enchantment makes a blade sharper or crueller, never shyer. Keep your own steps quiet and let me look after the edge." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I had a cutpurse ask me that in Lordaeron once, before either of us died, and I gave him the same answer I'll give you. Enchantment makes a blade sharper or crueller, but never shyer." },
      },
      choices = {
        { text = "A sharper edge suits a fair fight too.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A crueller edge suits me better.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Is it hard for the dead to work magic?", next = "dead" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, and I'd rather not guess. Ask in the Magic Quarter; someone there will pretend to." } },
  },
}

---------------------------------------------------------------------------
-- Rogues' Quarter
---------------------------------------------------------------------------

-- Carolyn Ward: a rogue trainer who teaches the Dark Lady's agents to go unseen.
P:NPC {
  key = "cward", id = TODO_NPC("Carolyn Ward"), name = "Carolyn Ward", title = "Rogue Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "sharp" }, values = { "cunning", "loyal" },
  notices = { "class", "stealth" },
  impression = {
    first = "Carolyn Ward teaches rogues in the Undercity and watches everyone who comes near her as though measuring them for a knife. Her loyalty to the Dark Lady is plain; the rest of her is not.",
    third = "{name} met Carolyn Ward, a rogue trainer of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "You walk loudly. Most people do, but you don't have to." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Back for more lessons? Good, because the Dark Lady has more work than she has rogues." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I can see you, you know. Your shadow is wrong on the left, so drop your shoulder, and you might fool someone who isn't me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Carolyn Ward. I teach rogues their trade, and in this city a rogue's trade is the Dark Lady's business. If you're not a rogue, I'm not sure why you're in this quarter at all." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "One of mine. Have you learned to move through a crowd without anyone remembering your face? Then you can learn something harder." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Rogues' Quarter. Your totems make more noise than a drunk in a tavern, so don't plant them anywhere I'm working." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in my quarter. You've a cat's step, I'll grant you, and I'd like to know how quietly you move when it's properly dark." },
      },
      again = { { id = "h_again", text = "Something else? Make it brief; I'm expected elsewhere." } },
      choices = {
        { text = "Do your rogues ever work with the Horde's shamans, Carolyn?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Would you take a druid into your trade, Carolyn?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "What does a rogue do for the Dark Lady?", next = "lady" },
        { text = "What's the most important thing a rogue can learn?", next = "lesson" },
        { text = "Are there rogues who aren't loyal?", next = "disloyal" },
        { text = "Do rogues and mages ever work together, Ward?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Have your rogues any use for a warlock?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    lady = {
      lines = { { id = "l_default", text = "Whatever she needs and can't ask her soldiers to do. We carry messages that can't be read, and we listen at doors in Hillsbrad and Southshore. Sometimes we make sure a Scarlet captain doesn't wake up." } },
      choices = {
        { text = "That's honest work, in its way.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I prefer to fight my enemies face to face.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
    lesson = {
      lines = { { id = "le_default", text = "Patience. Everyone thinks it's the knife or the poison, but the best rogue I ever knew waited three days in a ditch outside Southshore for the one hour her target walked alone." } },
      choices = {
        { text = "What happened after three days?", next = "lesson_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson_after = {
      lines = { { id = "la_default", text = "She came home, and he didn't, and nobody in Southshore ever knew who'd been in the ditch. That's the whole of the trade in one story." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    disloyal = {
      lines = { { id = "d_default", text = "The Syndicate, in Alterac, who were living nobles once and sell their knives to anyone now. And a few of ours who forgot whose city this is. We don't speak of those last ones, and neither should you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "syndicate" } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Now and then, in Hillsbrad, when a fight we started gets bigger than we meant it to. A shaman who can drop lightning on the Southshore militia while my people slip away is worth having, so long as you understand that the slipping away is the point." } },
      choices = {
        { text = "I'll cover your retreat and ask no questions.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I fight my own battles, not your rogues' retreats.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I'd take anyone who can move unseen and keep their mouth shut afterwards, and you've the first part already. The Dark Lady has more work than she has rogues, and a cat in the Southshore stables wouldn't raise anyone's suspicion." } },
      choices = {
        { text = "I'll serve the Dark Lady from the shadows.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I prowl for the Horde, not for your quarter.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "When the Dark Lady needs it, and only then, because mages are loud and rogues are not. I've used a mage to draw the guards' eyes while my people did the real work, and it served well enough." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran's mages hired cutpurses more often than they'd admit, to fetch what their wards were too proud to reach. Some of your old textbooks probably passed through hands like mine." },
      },
      choices = {
        { text = "I'll draw their eyes if the Dark Lady needs it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll work alone, Ward, not as bait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What does a rogue do for the Dark Lady?", next = "lady" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Rarely, because a demon is the least subtle thing in the Undercity, and that includes the abominations. Still, a warlock who can curse a man from across a room has a certain quiet charm, if he learns to stand in the shadows." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc warlock, in my quarter, and you've the sense to ask instead of barging in. A curse from across a room has a certain quiet charm, if you learn to keep that demon of yours out of the light." },
      },
      choices = {
        { text = "I'll learn to work quietly, then.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll fight in the open, demon and all.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Are there rogues who aren't loyal?", next = "disloyal" },
      },
    },
  },

  topics = {
    syndicate = { { id = "tp_syndicate", text = "Alterac's nobility turned to cutthroats. They're good, I'll grant them, but they'd sell their mothers." } },
    _none = { { id = "tp_none", text = "That's not something the Rogues' Quarter has told me about, and if it had, I'd want to know why you were asking." } },
  },
}

-- Ezekiel Graves: sells poisons in the Rogues' Quarter and likes to talk about their ingredients.
P:NPC {
  key = "graves", id = TODO_NPC("Ezekiel Graves"), name = "Ezekiel Graves", title = "Poison Supplies",
  bible = "bibles/townsfolk.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "cheerful" }, values = { "curious" },
  impression = {
    first = "Ezekiel Graves sells poisons in the Rogues' Quarter with the warmth of a shopkeeper selling sweets. He clearly enjoys his stock far more than anyone should.",
    third = "{name} met Ezekiel Graves, who sells poisons and their ingredients in the Undercity's Rogues' Quarter.",
  },

  greetings = {
    { id = "g_hi", text = "Welcome, welcome! Everything here is deadly, so please do look but don't lick." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did the last batch do its job? It always does, but I like to hear about it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ezekiel Graves, purveyor of poisons and the things you need to make them. Rogues come to me for powders and vials, and I'm always happy to talk about what goes into them." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "A rogue! You'll want the good things, then: dust of decay, essence of pain, and plenty of empty vials. I keep them all, and in quantity." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! I'm told your totems can wash a poison clean out of the blood, which is very bad for business, so please don't do it in front of my customers." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Your lot can cure a poison with a touch, I'm told, and I've never been so offended by a profession in my life." },
      },
      again = { { id = "h_again", text = "Something else? Take your time; poisons are patient things." } },
      choices = {
        { text = "Do your poisons trouble a shaman's work, Graves?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Shouldn't you be glad someone can cure them, Graves?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "Who buys poison in this city?", next = "who" },
        { text = "Isn't selling poison wicked?", next = "wicked" },
        { text = "What's the strangest thing you sell?", next = "strange" },
        { text = "What would a mage want from your shelves, Graves?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do your poisons work on demons, Graves?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Rogues, mostly, and the occasional apothecary who's run short. Hunters buy a little for their traps, and I don't ask questions of anyone, which is why so many people shop with me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wicked = {
      lines = { { id = "wi_default", text = "Wicked? It's only a sharper edge on a blade, friend, and nobody calls a blacksmith wicked. The Scourge didn't play fair with us, and I see no reason we should play fair with them." } },
      choices = {
        { text = "A fair point. Survival comes first.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Poison is a coward's weapon.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    strange = {
      lines = { { id = "s_default", text = "There's a powder from the Apothecarium that makes a man forget his own name for an hour. I don't sell it often, and never to anyone who asks about it as eagerly as you just did." } },
      choices = {
        { text = "Who would want that?", next = "strange_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange_who = {
      lines = { { id = "sw_default", text = "People who need a guard to forget who walked past him, I imagine. I sell the powder, and the rest is between them and the Dark Lady." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Oh, I should hope so, because a poison a totem can wash away isn't much of a poison. I've been working on a blend the totems can't seem to touch, and I'd be delighted if you'd stand near it while I test the theory." } },
      choices = {
        { text = "Poison is a coward's tool. I'll cleanse it wherever I find it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Show me your blend. A weapon is a weapon.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Glad? I suppose I'm glad in the way a smith is glad someone invented shields, which is to say I'm already working on the next thing. Every cure is only a recipe for a better poison, friend, and I do so love a challenge." } },
      choices = {
        { text = "Then I'll keep curing, and you'll keep losing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Clever. I'd rather have your poisons on my side.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Oh, very little, though a few of your kind come by to admire the colours, which I always appreciate. The Magic Quarter folk prefer to do their killing at a distance, and I think they miss out on the finer details." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "The Kirin Tor never cared for my trade, which I always thought a shame, since half of what they called alchemy was poison with better manners. Do have a look at the colours, at least." },
      },
      choices = {
        { text = "Poison has no place in a fair fight, Graves.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Poison's just another tool. I may buy some.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Who buys poison in this city?", next = "who" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Some of them do, and the ones that don't are very interesting to watch fail. The Magic Quarter's warlocks buy from me now and then, for when a pet turns on its master, and they never tell me whether it worked." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc asking after poisons for demons, now that's a customer with history. Some of my stock works on them and some only annoys them, and I'm afraid you'll have to find out which the hard way." },
      },
      choices = {
        { text = "A wise warlock keeps a vial for his own demon.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon won't turn. I don't need your vials.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What's the strangest thing you sell?", next = "strange" },
      },
    },
  },

  topics = {
    new_plague = { { id = "tp_plague", text = "Oh, that's the apothecaries' business, and far above my little shop. I hear things, but I don't repeat them." } },
    _none = { { id = "tp_none", text = "Can't say I know that one! Ask me about anything that kills, and I'll talk all day." } },
  },
}

---------------------------------------------------------------------------
-- The city's other teachers
---------------------------------------------------------------------------

-- Mary Edras: the first aid trainer, who teaches bandages to people who can't feel their wounds.
P:NPC {
  key = "edras", id = TODO_NPC("Mary Edras"), name = "Mary Edras", title = "First Aid Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "brisk" }, values = { "kind", "practical" },
  notices = { "wounds" },
  impression = {
    first = "Mary Edras teaches first aid to the Forsaken, who need it more than they admit because they cannot feel how badly they're hurt. She is brisk with everyone, and the briskness is plainly a kind of care.",
    third = "{name} met Mary Edras, the first aid trainer of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "Let me look at you. No, don't argue; let me look." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. I'm pleased, though I won't say so twice." },
  },

  notice = {
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.3 } },
      text = "You're in a state, and I'm sure you can't feel half of it. Sit down and let me check you before you walk off with a blade still in your back." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mary Edras. I teach first aid, which most of the dead think they don't need, until they find an arrow in their shoulder that's been there since last week. Cloth, clean hands and patience will save your life, or what passes for it." },
        { id = "h_living", when = { ["not"] = { race = "Scourge" } }, text = "One of the living! You'll feel your wounds, at least, which makes you easier to teach. Let's start with linen, shall we?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? Then you'll heal with spirits, and you'll still need bandages when the spirits are busy, so sit down." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, good. You'll know your herbs, so I won't have to explain why we don't put mud on a wound." },
      },
      again = { { id = "h_again", text = "What else? And sit still while you ask." } },
      choices = {
        { text = "Do you think my healing makes your bandages useless, Mary?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you ever tend tauren, Mary, or only the Forsaken?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Why would the dead need bandages?", next = "dead" },
        { text = "Were you a healer in life?", next = "life" },
        { text = "Where can I learn more than you teach?", next = "more" },
        { text = "Rogues bleed more than they admit, Edras.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Life Tap leaves me hollow, Edras. Can you help?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Because our bodies still break and still mend, only slower, and we don't feel the breaking. A bandage holds you together while the mending happens, and that matters more for us than for anyone." } },
      choices = {
        { text = "So the dead can still heal?", next = "dead_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_heal = {
      lines = { { id = "dh_default", text = "After a fashion. The apothecaries argue about why, and I don't. I only know that a wound I've bound closes and a wound I haven't goes green, and that's all the theory I need." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    life = {
      big = true,
      lines = { { id = "l_default", text = "A midwife in the capital. I brought children into the world for twenty years, and then the plague took them out again. Some of them are in this city now, and I'm glad I can still look after them." } },
      choices = {
        { text = "That's a hard thing to bear.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The past is dead. Leave it buried.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    more = {
      lines = { { id = "m_default", text = "Doctor Gregory Victor, at Hammerfall in the Arathi Highlands. He tests the best of my students on the wounded soldiers there, and if you pass, you'll know more than I do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Useless? I've seen a shaman run dry halfway through a fight in Hillsbrad, and it was my linen that kept him breathing until his spirits came back. Learn the bandages, love, and save your spirits for the wounds I can't reach." } },
      choices = {
        { text = "Spirit or linen, I'll use whatever keeps people alive.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll learn it for my own sake, nobody else's.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Whoever comes through that door, love, and a tauren takes three times the linen and complains half as much. I bound a kodo rider's leg last winter and he thanked me in a language I didn't know, and it was the nicest thing anyone's said to me since I died." } },
      choices = {
        { text = "Then I'll carry your linen, and bind whoever needs it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Linen is for my own wounds first, Mary.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Rogues bleed more than anyone admits, because they're always getting cut in places nobody saw them go. Learn to bind your own wounds in the dark, since you'll seldom have a light to do it by." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "The dead bleed less than the living but heal worse, so a rogue among us needs to be twice as careful with a knife wound. Bind it tight and bind it quickly, and don't wait until you can't feel your arm." },
      },
      choices = {
        { text = "I'll learn to bind wounds in the dark.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll heal when the job's done, not before.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why would the dead need bandages?", next = "dead" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Bandages won't put back what you've traded away, but they'll help with what your demon does to you afterward. I've told the Magic Quarter's warlocks the same for years, and they never listen until they faint on my floor." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You're spending blood you can't make again as quickly as the living can, which is a poor bargain for one of us. Bind what you can, rest when you can, and don't faint on my floor." },
      },
      choices = {
        { text = "I'll listen, Edras, before I faint.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fainting is the price of power, Edras.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Were you a healer in life?", next = "life" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, love. I only know how to keep people in one piece." } },
  },
}

-- Armand Cromwell: teaches fishing to the dead, who make very patient anglers.
P:NPC {
  key = "cromwell", id = TODO_NPC("Armand Cromwell"), name = "Armand Cromwell", title = "Fishing Trainer",
  bible = "bibles/townsfolk.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "calm" }, values = { "patient" },
  notices = { "profession" },
  impression = {
    first = "Armand Cromwell teaches fishing in a city whose canals are full of green poison, and he finds this funny. He may be the most patient soul in a city of people with all the time in the world.",
    third = "{name} met Armand Cromwell, the fishing trainer of the Undercity.",
  },

  greetings = {
    { id = "g_hi", text = "Don't fish in the canals, whatever you do. I've lost three good lines to that muck." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Caught anything that wasn't a boot?" },
  },

  notice = {
    { id = "n_angler", cat = "profession", when = { profession = { name = "Fishing", min = 150 } },
      text = "There's lake weed on your boots, and it's fresh. You've been out at Brightwater, then, and a good long while by the look of it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Armand Cromwell, and I teach fishing, which the dead are naturally good at. We don't get cold, we don't get bored, and we don't need to go home for supper, so we can sit by the water forever." },
        { id = "h_living", when = { ["not"] = { race = "Scourge" } }, text = "A living angler! You'll actually eat what you catch, which most of my students can't say. Shall I teach you?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You call on the water spirits, I'm told, and I'd be grateful if you'd ask them why nothing in the canals looks like a fish anymore." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, come to fish? I'd wager you could just turn into something with flippers and save yourself the trouble." },
      },
      again = { { id = "h_again", text = "Something else? There's no hurry; there never is with fishing." } },
      choices = {
        { text = "Shall I ask the water spirits about the canals, Armand?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Don't you miss the taste of what you catch, Armand?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "Where's good fishing near here?", next = "where" },
        { text = "Why do the dead fish if they don't eat?", next = "why" },
        { text = "The canals would hide a body nicely, Cromwell.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could I freeze the canal and fish through the ice?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Brightwater Lake, north of Brill, is the best in Tirisfal, and the coast to the west is good too, if you can stand the murlocs. Never the canals, though; whatever lives in that sludge isn't a fish any more." } },
      choices = {
        { text = "What lives in the canals?", next = "where_canal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where_canal = {
      lines = { { id = "wc_default", text = "I don't know, and I've decided not to find out. The apothecaries say the green is just runoff from their work, which is exactly what I'd say if it weren't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      big = true,
      lines = { { id = "y_default", text = "We sell to the living, to the inn and to the apothecaries, who use fish in ways I don't ask about. But mostly it's the quiet, which is the nearest thing to sleep the dead can have." } },
      choices = {
        { text = "Everyone deserves some peace.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Peace is for those who've won their war.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I'd rather you didn't, now that I think on it, because then I'd have to know the answer. The apothecaries say it's only runoff from their work, and I've decided to believe them, because it's easier to fish when you're not worried about what's biting." } },
      choices = {
        { text = "Some answers are better left alone. I'll leave it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll ask anyway. Someone should know what's in there.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Every time, friend, but I've made my peace with it. The fish goes to the inn and the apothecaries and I keep the quiet, which is the better half of fishing anyway, and you'll eat what you catch, at least, so do it properly and thank the lake." } },
      choices = {
        { text = "I always thank the lake. It's only right.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A fish is a fish. I'll eat it and thank no one.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They would, and I'd ask you not to test it, because I've pulled up enough boots and buckles from that green water to know someone already has. The fish don't mind, but I do, a little." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "They would, and I've a feeling you knew the old city's ditches well enough in life to judge. I've pulled up enough boots from that green water to know someone's tried it already, so please don't add to the collection." },
      },
      choices = {
        { text = "I'll keep my business out of your canals.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The canals keep secrets. That's their use.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why do the dead fish if they don't eat?", next = "why" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, I suppose, and you'd be the first person ever to ice-fish in the Undercity, which is a sort of distinction. Mind you don't freeze the fish along with it, though; they're tough, but the poison in them gets sluggish." },
        { id = "xmage_troll", when = { race = "Troll" }, text = "A troll who wants to freeze my canal, now there's something to tell the other trainers. You could do it, I suppose, but I'd sooner you learned the line, since frost won't help you on the coast at Echo Isles." },
      },
      choices = {
        { text = "I'll fish the honest way, with a line.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Ice is quicker. I'll do it my way.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where's good fishing near here?", next = "where" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Can't help you there. Ask me about fish, and I'll talk until you beg me to stop." } },
  },
}
