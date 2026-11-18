-- Deathknell's teachers: the warlock who binds the first imp, and the rogue and mage trainers
-- by the chapel. Voices: bibles/deathknell_trainers.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Venya Marthand: Deathknell's warlock trainer.
P:NPC {
  key = "tir_venya", id = TODO_NPC("Venya Marthand"), name = "Venya Marthand", title = "Warlock Trainer",
  bible = "bibles/deathknell_trainers.md", role = "trainer", tier = "quest",
  communities = { "deathknell" }, temper = { "dry", "sharp" }, values = { "ambitious", "cunning" },
  notices = { "class", "pet", "greenness" },
  impression = {
    first = "Venya Marthand teaches the newly risen of Deathknell to bind their first demon, and she does not repeat a lesson. She is dry, exacting and faintly amused by everything, including her own death.",
    third = "{name} met Venya Marthand, the warlock trainer of Deathknell, who teaches the risen to bind their first imp.",
  },

  greetings = {
    { id = "g_default", text = "Yes? Be quick about it; I've a circle drawn and it doesn't like to wait." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "A young warlock. Good; you look like you'd rather command something than be commanded, which is the first lesson, and you've learned it already." },
    { id = "g_active", when = { questActive = TODO_QUEST("Piercing the Veil") }, text = "Bring me three skulls from the Rattlecages by the old smithy, not two and not four, and not cracked, please." },
    { id = "g_done", when = { questDone = TODO_QUEST("Piercing the Veil") }, text = "How is your imp? Still sulking, I expect. They always sulk the first week." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and you come back still in one piece. Your imp must be keeping you alive, or keeping you amused." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Your power's grown since Deathknell. I can feel the things that listen to you now, and there are more of them than there were." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { class = "WARLOCK", pet = { family = "Imp" } },
      text = "Your imp is giving me a look. Tell it I bound a hundred of its cousins before it was spawned, and I'll not take its cheek." },
    { id = "n_green", cat = "greenness", when = { maxLevel = 4 },
      text = "You've barely stopped twitching from the grave. Sit, steady yourself, and then we'll talk about calling things from beyond it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Venya Marthand. I teach warlocks, which is to say I teach the dead how to make other things do as they're told. Death has a great many drawbacks, but fear of demons isn't one of them, and that makes us excellent students." },
        { id = "h_before", when = { class = "WARLOCK", questBefore = TODO_QUEST("Piercing the Veil") },
          text = "You're ready to learn binding, I think. A servant from beyond the veil needs an anchor, and the skull of something that was held by another's will makes the best anchor there is." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Piercing the Veil"), days = 3 } },
          text = "You've summoned and bound your imp, and it hasn't eaten you, which puts you ahead of a student I won't name. Don't be fooled by its size; it's cleverer and stronger than it looks, and so are you." },
        { id = "h_notlock", when = { ["not"] = { class = "WARLOCK" } },
          text = "You're not one of mine, so I've nothing to teach you. Still, you can stand there, provided you don't step on the chalk." },
      },
      again = {
        { id = "h_again", text = "What else? I won't repeat myself, so listen properly this time." },
        { id = "h_again2", text = "Ask, then. My circle can wait a little longer." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Why skulls?", next = "skulls" },
        { text = "What is an imp, really?", next = "imp" },
        { text = "Isn't trafficking with demons dangerous?", next = "danger" },
        { text = "How does one of the Forsaken become a warlock?", next = "become" },
        { text = "What happened to the smithy?", next = "smithy" },
        { text = "I'll leave you to your circle.", next = "END" },
      },
    },

    skulls = {
      lines = { { id = "s_default", text = "Because the Rattlecages were bound to the Scourge's will, and the bone remembers being bound. Give a demon an anchor that already knows obedience, and the binding takes far more easily than if you tried it on a clean bone." } },
      choices = {
        { text = "So we use the Scourge's own work against it.", next = "skulls_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    skulls_stance = {
      big = true,
      lines = { { id = "ss_default", text = "We use whatever's to hand, and the Scourge left bones lying about in every field. Some of my students find it distasteful to work with the remains of their old masters' servants, and I find it efficient." } },
      choices = {
        { text = "Efficient is right. Waste nothing.", next = "BACK", reply = "Exactly so, and the Scourge would be appalled to see its leftovers turned against it, which only makes the work sweeter. You'll find a pile of fresh skulls behind the chapel when you need them.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'd rather not build my power on their bones.", next = "BACK", reply = "A tender conscience, and in a warlock, too. Keep it if you can, but the Nether won't care whose bones you stand on, only how firmly you stand.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    imp = {
      lines = { { id = "i_default", text = "A small, spiteful creature of the Burning Legion, the least of its servants, and the one every warlock begins with. It throws fire, it complains constantly, and it knows far more than it lets on." } },
      choices = {
        { text = "Does it hate being bound?", next = "imp_hate" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_legion" } } },
      },
    },
    imp_hate = {
      lines = { { id = "ih_default", text = "Bitterly, and it will tell you so every day. That's why you never let it see you hesitate, because an imp that smells doubt will start testing the edges of the binding, and the edges are where students lose fingers." } },
      choices = {
        { text = "I'll keep it in line.", next = "imp_line" },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_legion" } } },
      },
    },
    imp_line = {
      big = true,
      lines = { { id = "il_default", text = "You will, or you'll learn otherwise in a hurry. Some warlocks rule their demons with cruelty, and some with a sort of grudging partnership, and both kinds survive, though only one sleeps well." } },
      choices = {
        { text = "A firm hand, always. Demons respect nothing else.", next = "BACK", reply = "Respect is a generous word for what a demon feels, but fear will do nicely in its place. Just never let it see you tired, because it's always watching for that.", fx = { align = { order = 1 }, learn = { "burning_legion" } } },
        { text = "I'll bargain with it. Partners work harder.", next = "BACK", reply = "Partners, is it? It'll work harder, certainly, and it'll also be reading every word of the bargain for the loophole. Write your terms carefully and sleep with one eye open.", fx = { align = { order = -1 }, learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "burning_legion" } } },
      },
    },

    danger = {
      lines = { { id = "d_default", text = "For the living, terribly, because a demon can promise them anything and the living want so many things. We want very little, now, and a creature that has nothing to offer you has no hold on you." } },
      choices = {
        { text = "Surely we still want something.", next = "danger_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danger_want = {
      big = true,
      lines = { { id = "dw_default", text = "Vengeance, mostly, and demons are very happy to help with that, which is the one danger I'd warn you about. Want your vengeance, but want it for yourself, and never let something from the Nether want it on your behalf." } },
      choices = {
        { text = "My vengeance is my own. I'll keep it so.", next = "BACK", reply = "Good, and say it again every night, because the demons will keep offering. The ones who keep their vengeance their own are the ones I still have the pleasure of teaching.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If a demon helps me get it, so be it.", next = "BACK", reply = "That's the very sentence every warlock says before something else starts doing the wanting for them. I'll remember you said it, if only for the cautionary tale.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    become = {
      lines = {
        { id = "b_default", text = "The same way anyone does, by wanting power more than they fear what it costs. Lordaeron hanged warlocks, when it caught them, so there were never many of us alive, but the Undercity is far more broad-minded." },
        { id = "b_scourge", when = { race = "Scourge", class = "WARLOCK" }, text = "You've already done it, so you tell me. You woke up, looked at what was left of you, and decided you'd rather command than kneel, and the rest is technique." },
      },
      choices = {
        { text = "Were you a warlock before you died?", next = "become_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    become_before = {
      lines = { { id = "bb_default", text = "I was a woman who read books she shouldn't have, in a house in Lordaeron where nobody asked what I read. I don't remember the house, but I remember the books, every page of them, and I think that tells you which mattered to me more." } },
      choices = {
        { text = "That's a little chilling, Venya.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    smithy = {
      lines = { { id = "sm_default", text = "The Scourge came through the north of Deathknell before the Dark Lady drove them out, and the forge was where they made their stand. The Rattlecages still wander around it, waiting for orders that will never come." } },
      choices = {
        { text = "Do they suffer?", next = "smithy_suffer" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smithy_suffer = {
      lines = { { id = "sms_default", text = "I don't think there's enough of them left to suffer, and I hope not. Taking their skulls is the kindest thing anyone's done for them in years, so do it quickly and don't be squeamish." } },
      choices = {
        { text = "I'll make it quick.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    burning_legion = { { id = "tp_legion", text = "The Legion are the masters of the things I bind. Fear them, study them, and never once believe a word they say." } },
    _none = { { id = "tp_none", text = "Not in my books, and I've read a great many. Ask Shadow Priest Sarvis; he likes to talk." } },
  },
}

-- David Trias: Deathknell's rogue trainer.
P:NPC {
  key = "tir_trias", id = TODO_NPC("David Trias"), name = "David Trias", title = "Rogue Trainer",
  bible = "bibles/deathknell_trainers.md", role = "trainer", tier = "service",
  communities = { "deathknell" }, temper = { "wry", "watchful" }, values = { "cunning", "practical" },
  notices = { "class", "stealth" },
  impression = {
    first = "David Trias teaches the risen rogues of Deathknell by the chapel and watches everyone's hands while he talks. He is wry and patient, with the air of a man who has picked a great many locks and regretted very few.",
    third = "{name} met David Trias, the rogue trainer of Deathknell.",
  },
  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Come here, and show me your hands. Steady, good; the grave didn't take your fingers, and that's half the work done." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "Not one of mine, I see. Keep your purse on the inside of your coat anyway; I teach a very good class." },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I can hear your bones creak, friend. We'll fix that, but not today." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "David Trias. I teach the quiet arts in Deathknell, to the risen who woke up with light fingers and no memory of how they got them. The memory doesn't matter; the fingers do." },
      },
      again = {
        { id = "h_again", text = "What else? I'm listening, and I'm always listening." },
        { id = "h_again2", text = "Ask on. My lessons don't run to schedules." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "What do you teach first?", next = "first" },
        { text = "Do the dead make good rogues?", next = "dead" },
        { text = "Where should I go after Deathknell?", next = "after", when = { class = "ROGUE" } },
        { text = "Who were you, before all this?", next = "before" },
        { text = "Can one of the living learn your arts?", next = "xliving", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'd rather meet my enemies head on.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Farewell.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "How to stand still, which is hard for the newly risen, because your body twitches and you don't notice. After that, how to strike first, and how to be gone before anyone remembers your face." } },
      choices = {
        { text = "How do you teach someone to stand still?", next = "first2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first2 = {
      lines = { { id = "f2_default", text = "I stand them in the chapel yard at dusk and set a bat loose, and they don't move until it lands on them. Some take an hour and some take a week, and one fellow is still out there, I think, though he may simply have liked it." } },
      choices = {
        { text = "And striking first?", next = "first3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first3 = {
      lines = { { id = "f3_default", text = "Is simply deciding sooner than the other fellow, {class}, nothing more mysterious than that. Most people spend the first moment of a fight working out whether it's a fight, and you'll spend it ending one." } },
      choices = {
        { text = "Decide sooner. I'll remember.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "The best, if they're careful. We don't breathe loudly, we don't sweat, and we don't flinch when we're hurt, but we creak, and we smell, and the Crusade's dogs can find us a mile away." } },
      choices = {
        { text = "How do I get past their dogs?", next = "dogs" },
        { text = "Is stealth honourable, though?", next = "dead_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_stance = {
      big = true,
      lines = { { id = "ds_default", text = "Honour's a thing the knights of Lordaeron had plenty of, and look where they all are. I'll take a knife in the dark that brings my people home over a fair fight that buries them." } },
      choices = {
        { text = "Then the dark it is. Results matter.", next = "BACK", reply = "There's a student after my own heart. Results bring people home, and nobody in the Undercity ever asked me how cleanly a Scarlet died.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll keep some honour, even with a knife.", next = "BACK", reply = "Keep what you like, so long as it doesn't slow your hand. I've known rogues who kept a little honour and lived, and I've buried a few who kept too much.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "Brill, where Marion Call at the tavern will teach you more than I can, and then the Undercity, where the deathstalkers will decide whether you're worth their time. Keep your hands clean of the Deathguard's purses, because they're the ones who decide whether you hang." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dogs = {
      lines = { { id = "dg_default", text = "Downwind, always, and through water where you can, since it carries the smell off. Failing that, a little of Faruza's crushed mint rubbed on your coat, which confuses them, and confuses the Scarlets even more when they catch a whiff of a dead man smelling like a kitchen garden." } },
      choices = { { text = "Mint and water. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    before = {
      lines = { { id = "be_default", text = "A man who could open any lock in the capital and was paid by the lords who owned them to prove it. Whether I ever opened one I wasn't paid for is a thing the plague has very conveniently made me forget." } },
      choices = {
        { text = "That's very convenient indeed.", next = "before2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before2 = {
      lines = { { id = "b2_default", text = "Isn't it? The grave's the finest pardon there is, friend, and the Dark Lady doesn't ask what you stole in your first life, only what you'll take for her in this one. I find that a very fair arrangement." } },
      choices = {
        { text = "A clean slate. I'll take it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xliving = {
      lines = { { id = "xl_default", text = "Better than the dead, in some ways, because you don't creak and the dogs don't know you. Worse in others, because you breathe like a bellows when you're frightened, and you will be frightened." } },
      choices = { { text = "I'll learn to breathe quietly, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    xwarrior = {
      lines = { { id = "xw_default", text = "Then you'll make a fine distraction while my students go round the back. Every good rogue needs a loud friend, and I mean that more kindly than it sounds." } },
      choices = { { text = "Happy to be the loud friend.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "Loud, righteous and fond of dogs. They're the easiest people in Lordaeron to rob and the hardest to hide from." } },
    advice = { { id = "tp_ad", text = "Stand still, decide sooner, and stay downwind. That's most of what I teach, and the rest is practice." } },
    _none = { { id = "tp_none", text = "Not my business, and I make a point of knowing whose business things are. Ask Executor Arren." } },
  },
}

-- Isabella: Deathknell's mage trainer.
P:NPC {
  key = "tir_isabella", id = TODO_NPC("Isabella"), name = "Isabella", title = "Mage Trainer",
  bible = "bibles/deathknell_trainers.md", role = "trainer", tier = "service",
  communities = { "deathknell" }, temper = { "dry", "earnest" }, values = { "wise", "curious" },
  notices = { "class", "arcane" },
  impression = {
    first = "Isabella teaches magic to the risen of Deathknell and cannot get through a lesson without a digression about Dalaran. She is scholarly and dry, and her disappointment in the Kirin Tor seems more personal than she admits.",
    third = "{name} met Isabella, the mage trainer of Deathknell.",
  },
  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "A student. Sit, and pay attention, and I'll try to keep the lecture short, though I've never once managed it." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "You're not a mage, but I suppose you can listen. Most of my students don't, so it would make a pleasant change." },
  },
  notice = {
    { id = "n_arcane", cat = "arcane", when = { class = "MAGE", race = "Scourge" },
      text = "You still hold your hands the way they taught in the old schools. Somebody trained you once, before; I wonder who." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Isabella, and I teach the arcane to the risen who still have the knack for it. Most of what you knew is still in there; it simply needs coaxing out, like a cat from under a bed." },
        { id = "h_troll", when = { race = "Troll", class = "MAGE" }, text = "A troll mage, in Deathknell! I've read a little of your people's magic, and I'd like to compare notes one day, if you've the patience for an old scholar." },
      },
      again = {
        { id = "h_again", text = "What else? Don't let me wander off about Dalaran again." },
        { id = "h_again2", text = "Ask, then. I'm better at answers than lessons." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Did you study in Dalaran?", next = "dalaran" },
        { text = "What's the first spell you teach?", next = "first" },
        { text = "Does death change magic?", next = "death" },
        { text = "I remember a little of my old training.", next = "xmemory", when = { class = "MAGE", race = "Scourge" } },
        { text = "Fire's my art too, after a fashion.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "Farewell.", next = "END" },
      },
    },
    dalaran = {
      lines = { { id = "d_default", text = "I studied near it, which is a polite way of saying they turned me away from the city itself, twice. I learned anyway, from books they thought were safely locked up, and I've never quite forgiven them for being right that I'd misuse them." } },
      choices = {
        { text = "Misuse them how?", next = "dalaran_misuse" },
        { text = "Turned away twice? What for?", next = "twice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    twice = {
      lines = { { id = "tw_default", text = "The first time for being a farmer's daughter with no letters of introduction, and the second for having read a book I wasn't meant to have, which I'd foolishly mentioned to the examiner. He asked me where I'd found it, and I told him, and that was the end of the interview." } },
      choices = {
        { text = "Where had you found it?", next = "twice2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    twice2 = {
      lines = { { id = "t2_default", text = "In a pedlar's cart outside Andorhal, wrapped in sacking, and I still don't know whose it was. I suspect the Kirin Tor knew exactly whose, which is why they were so very cross about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dalaran_misuse = {
      big = true,
      lines = { { id = "dm_default", text = "By teaching them to anyone who asked, of course, which is what I'm doing now. The Kirin Tor kept knowledge locked away for the worthy, and Kel'Thuzad was one of the worthy, so I'm not convinced their method works." } },
      choices = {
        { text = "Knowledge should be free. You're right.", next = "BACK", reply = "There, at least one of you has been listening. Kel'Thuzad learned his worst in secret, and secrets are exactly what I'm trying to put an end to.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some knowledge should be guarded closely.", next = "BACK", reply = "Guarded by whom, though, the Kirin Tor? They guarded it right up until it marched out of Stratholme and killed us all. Still, you're cautious, and caution never hurt a mage.", fx = { align = { order = 1 } } },
        { text = "Did you ever meet Kel'Thuzad?", next = "kt" },
      },
    },
    kt = {
      lines = { { id = "kt_default", text = "Once, at a distance, when he came through Andorhal talking to the farmers about a better life, before anyone understood what he meant by it. He was brilliant and he was charming, and I envied every one of them for being spoken to by a real magus of the Kirin Tor." } },
      choices = {
        { text = "And now?", next = "kt2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kt2 = {
      lines = { { id = "k2_default", text = "Now I teach the dead, which he'd find very amusing, I'm sure, wherever he's got to. I keep my lectures to fire and frost, and if a student asks about the other thing, I send them to Executor Arren." } },
      choices = { { text = "Wise of you. Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "Fire, because it's honest and it shows you your mistakes right away, usually on your sleeve. Frost comes after, once you've learned patience, and the newly risen have little else, having nowhere to be." } },
      choices = {
        { text = "Why does frost need patience?", next = "frost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    frost = {
      lines = { { id = "fr_default", text = "Because fire wants to happen and frost has to be coaxed, a slow drawing-down of warmth until the air gives up. The dead have an advantage there, I've noticed, since we haven't much warmth left to argue with." } },
      choices = { { text = "That's a cold sort of comfort.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    xmemory = {
      lines = { { id = "xm_default", text = "Do you? Then hold onto it, and don't force the rest, because it comes back in pieces and in the wrong order. One of my students remembered a ward against fire before she remembered her own mother's face, and she still isn't sure which upset her more." } },
      choices = {
        { text = "I'll let it come as it will.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      lines = { { id = "xw_default", text = "After a fashion, yes, and a fashion I don't teach and won't, though I'll admit your shadowbolts are tidier than my students' fireballs. Venya can tell you about your fire, and I'll stick to mine." } },
      choices = { { text = "Fair enough, Isabella.", next = "BACK" } },
    },
    death = {
      lines = { { id = "de_default", text = "Less than you'd fear. The mind keeps what it used most, and magic is a deep habit, so the risen mages usually find it sooner than they find their own names. That's either comforting or terrible, and I change my mind about which every week." } },
      choices = {
        { text = "I'd call it comforting.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    dalaran = { { id = "tp_dalaran", text = "A city that turned me away twice and then let a necromancer teach in its schools. I've no wish to see it again, and I think of it every day." } },
    kelthuzad = { { id = "tp_kt", text = "The worthiest of the worthy, by the Kirin Tor's own measure, and look where their measure got us all. I've never trusted a locked library since." } },
    _none = { { id = "tp_none", text = "That's outside my books, I'm afraid. Ask Executor Arren, if you can get more than a word from him." } },
  },
}
