-- The Temple of the Moon and the Temple Gardens: the priest trainers, Sister Aquinne, the bank.
-- Voices: bibles/temple.md
-- Year 1: Tyrande leads the Sisterhood; Malfurion sleeps in the Dream; the tree is young and unblessed.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Priestess Alathea: the Temple's senior priest trainer; trains human priests too and sends them to Laurena.
P:NPC {
  key = "alathea", id = TODO_NPC("Priestess Alathea"), name = "Priestess Alathea",
  title = "Priest Trainer",
  bible = "bibles/temple.md", role = "trainer", tier = "major",
  communities = { "darnassus" }, temper = { "calm", "formal" }, values = { "devout", "wise", "loyal" },
  notices = { "class", "race", "arcane" },

  impression = {
    first = "Priestess Alathea praised Elune and the Light in the same breath, and meant both. She is gracious until arcane magic comes up, and then something old and wary looks out of her eyes.",
    third = "{name} met Priestess Alathea, who trains the priests of the Temple of the Moon, and some of the Light's as well.",
  },

  greetings = {
    { id = "g_elune", text = "Elune be with you. The Temple is quiet at this hour, so speak softly and you'll be heard." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Welcome back to the Temple, young priest. Sit, if you have time; the lessons keep." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and I'm glad of it. The moon notices who comes back to her." },
  },

  notice = {
    { id = "n_priest_human", cat = "class", when = { class = "PRIEST", race = "Human" },
      text = "A priest of Stormwind's Cathedral, under our roof. Laurena sends me her students now and then, and they always look up at the open sky before they look at me." },
    { id = "n_human", cat = "race", when = { race = "Human", ["not"] = { class = "PRIEST" } },
      text = "Humans come to the Temple to look at the moonlight on the water, mostly. You're welcome to look; just don't throw coins in the pool, because it isn't that kind of pool." },
    { id = "n_shadow", cat = "class", when = { form = "shadow" },
      text = "You come into Elune's house wrapped in shadow. I know your Church teaches it, and I won't send you out, but I'd ask you to set it aside while you're under this roof." },
    { id = "n_nelf_priest", cat = "class", when = { class = "PRIEST", race = "NightElf" },
      text = "Sister, brother, whichever the moon made you, you've been out in the world, and it shows in how you stand. Come and tell me what you've seen." },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You carry the smell of the arcane in with you, like smoke on a cloak. I'll answer your questions, mage, but forgive me if I keep my hands folded." },
  },

  start = "hello",
  nodes = {
    mage_a = {
      lines = {
        { id = "mga_default", text = "A place to sit, certainly, and a place to pray if you want one. But don't ask me to teach you anything while your hands still smell of the Well, because the last of my people who mixed the two are at the bottom of the sea." },
        { id = "mga_gnome", when = { race = "Gnome", class = "MAGE" },
          text = "I've heard your people's magic is mostly sums and sparks, and I'd like to believe that's all it is. Sit, then, and don't count anything while you're here." },
      },
      choices = {
        { text = "The arcane can heal, too, Priestess.", next = "mage_a2" },
        { text = "I'll pray, then, and leave the spells outside.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    mage_a2 = {
      lines = {
        { id = "mga2_default", text = "It can mend a thing, I'll grant you, the way a smith mends a sword. It has never once asked the sword's permission, though, and Elune always asks; that's the difference, and it's all of the difference." },
      },
      choices = {
        { text = "Power doesn't need permission.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Asking first is wiser. I'll remember.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    warlock_a = {
      big = true,
      lines = {
        { id = "wa_default", text = "Very well: you carry the same fire that burned Zin-Azshari, and you carry it into a temple built by those who survived it. I will not send you out, because Elune turns no one from her door, but I won't pretend I'm comfortable." },
      },
      choices = {
        { text = "I bind it so it can't bind anyone else.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Comfort isn't what I came for, Priestess.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "Could Elune ever forgive one like me?", next = "warlock_a2" },
      },
    },
    warlock_a2 = {
      lines = {
        { id = "wa2_default", text = "Sister Astarii would tell you yes, without even stopping to think, and she has better reason to know than I do. Ask her about the golden tablet some night, and watch how she holds it." },
      },
      choices = { { text = "I'll ask her. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    paladin_a = {
      lines = {
        { id = "pa_default", text = "So I've seen; Stormwind's paladins pray with a hammer in hand, which the Sisterhood understands better than you'd think. Our priestesses stood at Hyjal with bows and the moon behind them, and nobody called it a contradiction." },
      },
      choices = {
        { text = "Then the Light and Elune fight on the same side.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What was it like, at Hyjal?", next = "tyrande" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Alathea, a priestess of Elune, and I teach those who would heal in her name. Praise be to Elune, and to whatever light you carry, {class}." },
        { id = "h_prayer", tags = { "news" }, when = { questActive = TODO_QUEST("Desperate Prayer") },
          text = "About this time in a priest's training, my sisters learn gifts that belong to Elune alone. I believe your order is the same, so when your business here is finished, go home to High Priestess Laurena in Stormwind." },
        { id = "h_fear", tags = { "news" }, when = { questActive = TODO_QUEST("A Lack of Fear") },
          text = "Your High Priest Rohan wants you in Ironforge, and I'd not keep a dwarf from his own rites. I wish I could see them, but my place is here, so go with your Light." },
        { id = "h_grace", tags = { "news" }, when = { questActive = TODO_QUEST("Elune's Grace") },
          text = "You've given yourself to Elune and to our people, and she has noticed. Not every one of us reaches that place, and those who do are taught a little more of her grace." },
        { id = "h_stars", tags = { "news" }, when = { questActive = TODO_QUEST("Stars of Elune") },
          text = "You've earned Elune's attention, and that is not a small thing. When you're ready, I'll teach you to call down her stars, as the priestesses of old did against the Legion." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The moon's up, and the Temple is at its best. The water holds her light longer than you'd think; stand by the pool a while before you go." },
        { id = "h_human_priest", when = { class = "PRIEST", race = "Human" },
          text = "Laurena's students all pray with their eyes shut, I've noticed, and I expect you do too. We pray with ours open, toward the moon, and neither of us has been struck down for it yet." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I have time; the moon is patient, and so am I." },
        { id = "h_again2", text = "Go on. Questions are a kind of prayer, if they're honest." },
        { id = "h_again3", when = { class = "PRIEST" }, text = "Ask, young priest. A teacher who tires of questions should stop teaching." },
      },
      choices = {
        { text = "I'm ready for my training.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why would you teach a priest of the Light?", next = "light", when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "What gifts does Elune give her own priests?", next = "gifts", when = { class = "PRIEST", race = "NightElf" } },
        { text = "What does the Sisterhood teach?", next = "sisterhood" },
        { text = "You don't trust arcane magic, do you?", next = "arcane" },
        { text = "How is the High Priestess?", next = "tyrande" },
        { text = "Is there a place for a mage in Elune's house?", next = "mage_a", when = { class = "MAGE" } },
        { text = "You've noticed what I carry. Say it.", next = "warlock_a", when = { class = "WARLOCK" } },
        { text = "The Light makes a soldier of me, Priestess.", next = "paladin_a", when = { class = "PALADIN" } },
        { text = "Elune be with you, Priestess.", next = "END" },
      },
    },

    light = {
      big = true,
      lines = {
        { id = "l_default", text = "Because your race and mine are allies, and because a wound doesn't care who closes it. Laurena and I write to each other, and we've agreed that the sick should never have to choose between us." },
        { id = "l_human", when = { race = "Human" },
          text = "Because Laurena asked me to, and because I've watched her students heal Sentinels on the road to Astranaar. A priest who heals my people is welcome in my Temple, whatever she prays to." },
      },
      choices = {
        { text = "Is the Light the same as Elune's light?", next = "light_same" },
        { text = "Then the Light and Elune serve the same good.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Faith is a tool, Priestess. I use what works.", next = "BACK", fx = { align = { light = -1 }, affinity = -1, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    light_same = {
      lines = {
        { id = "ls_default", text = "I don't know, and I distrust anyone who says they do. I've seen both heal the same wounds and both comfort the dying, and for now that's as far as I'll walk out on that branch." },
      },
      choices = {
        { text = "How do your priests pray, then?", next = "light_pray" },
        { text = "Some questions should stay open.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "The Church would want a firmer answer than that.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
      },
    },
    light_pray = {
      lines = {
        { id = "lp_default", text = "At night, with our eyes on the moon, and mostly we listen rather than ask. Your Church kneels and speaks; we stand and wait. I've tried it your way, once, and my knees forgave me eventually." },
      },
      choices = {
        { text = "I'll try it your way tonight.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll keep to my Church's way.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },

    gifts = {
      big = true,
      lines = {
        { id = "gi_default", text = "Her grace, which turns aside the blows meant for you, and her stars, which the priestesses called down on the Legion ten thousand years ago. Neither is given to the merely clever; she gives them to the devoted." },
        { id = "gi_done", when = { questDone = TODO_QUEST("Stars of Elune") },
          text = "You carry her stars now. Use them as the old priestesses did, against what truly threatens the forest, and never to settle a quarrel." },
      },
      choices = {
        { text = "What did the old priestesses face?", next = "gifts_old" },
        { text = "I'll use them only in her service.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "A weapon is a weapon, whoever gives it.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    gifts_old = {
      lines = {
        { id = "go_default", text = "Demons, and the Highborne who welcomed them. The Sisterhood held the line beside the Sentinels when the sky burned, and we've kept the bow and the prayer together ever since." },
      },
      choices = { { text = "Something else, Priestess.", next = "BACK", fx = { learn = { "highborne" } } } },
    },

    sisterhood = {
      lines = {
        { id = "si_default", text = "To heal, to pray, and to stand guard, all three. Visitors expect the first two from a temple and are startled by the archery. We've watched over our people since before the Sundering, and we've learned to be ready." },
      },
      again = { { id = "si_again", text = "You want more of the Sisterhood? There is always more to tell." } },
      choices = {
        { text = "What troubles the young priestesses?", next = "young" },
        { text = "Healing should come before the bow.", next = "BACK", fx = { align = { order = 1 }, trait = { kind = 1 }, learn = { "sisterhood_of_elune" } } },
        { text = "A temple that can fight is wiser than one that can't.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 }, learn = { "sisterhood_of_elune" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    young = {
      lines = {
        { id = "yo_default", text = "The same things that trouble the young everywhere, and one thing that is new. They're learning their trade in a city that is still growing, on a tree that is still settling, and they ask me when it will all feel like home." },
      },
      choices = {
        { text = "They're afraid of dying, aren't they?", tag = "Persuade", next = "mortal",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { trait = "kind" } } } },
          fail = { next = "mortal_no", fx = { affinity = -1 } } },
        { text = "Home is the people, not the tree.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Home is what you build and defend.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    mortal = {
      big = true,
      lines = {
        { id = "mo_default", text = "Yes. We gave up our immortality when Nordrassil was spent, and the young ones have never known an old age to compare it to. They come to me at night and ask what happens after, and I have only prayers to give them." },
      },
      choices = {
        { text = "How do you answer them?", next = "mortal_answer" },
        { text = "The Light teaches there's peace after. Tell them that.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 }, when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "Then they should live as if every day counts.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Fear keeps people alive. Let them keep a little.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    mortal_answer = {
      lines = {
        { id = "ma_default", text = "I tell them that A'moora names the lost by the pool every night, and that Elune hears every name. Some nights that is enough for them, and some nights it is not enough for me, though I'd thank you not to repeat that to the High Priestess." },
      },
      choices = { { text = "It stays with me.", next = "BACK", fx = { affinity = 3, trait = { discreet = 1 } } } },
    },
    mortal_no = {
      lines = {
        { id = "mn_default", text = "The young priestesses' fears are theirs to tell, not mine. They're doing well, and that is all I'll say about them to a stranger." },
      },
      choices = { { text = "Of course. Forgive me.", next = "BACK" } },
    },

    arcane = {
      big = true,
      lines = {
        { id = "ar_default", text = "No, I don't, and I'll not pretend otherwise to be polite. The Highborne's magic called the Burning Legion into the world once, and I don't care whether the next one who reaches for that power calls it scholarship or calls it holy." },
        { id = "ar_mage", when = { class = "MAGE" },
          text = "You ask me that with frost still on your sleeves. No, I don't, mage, but your people and mine are allies, and I'll not betray that over my own unease." },
      },
      choices = {
        { text = "Even arcane that serves a god?", next = "arcane_divine" },
        { text = "You're right. That power should be left alone.", next = "BACK", fx = { align = { order = 1 }, affinity = 2, learn = { "highborne" } } },
        { text = "Power isn't evil. People are.", next = "BACK", fx = { align = { order = -1 }, affinity = -1, learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arcane_divine = {
      lines = {
        { id = "ad_default", text = "Be it divine-inspired or not, magic that pulls on the world's threads makes me uneasy. Your Church would tell you some of its own wonders lean that way; ask Laurena about it when you're home, and watch her face." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I'd rather not stir up the Cathedral.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    tyrande = {
      lines = {
        { id = "ty_default", text = "She carries the whole of our people while the Arch Druid carries the tree, and Malfurion sleeps in the Emerald Dream. She hears the Sentinels' reports at moonrise and prays after, and I've never once seen her hurry the prayer." },
      },
      choices = {
        { text = "Will Malfurion wake?", next = "tyrande_dream" },
        { text = "She should lean on the Arch Druid more.", next = "BACK", fx = { align = { order = 1 }, learn = { "malfurion" } } },
        { text = "She shouldn't wait on anyone, druid or not.", next = "BACK", fx = { align = { order = -1 }, learn = { "malfurion" } } },
      },
    },
    tyrande_dream = {
      lines = {
        { id = "td_default", text = "We pray that he will, and the High Priestess believes it, so I believe it. The druids say the Dream keeps its own hours. I'm a priestess, so I keep the moon's, and wait." },
      },
      choices = {
        { text = "I'll add him to my prayers.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Prayers won't wake him. Someone should go after him.", next = "BACK", fx = { align = { light = -1 }, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A teacher in this Temple hears a great deal from the young priests who pass through it. Ask, and I'll tell you what I can in good conscience." } },
    background = { { id = "tp_bg", text = "I teach Elune's priests, and some of the Light's, when Laurena sends them. It's quiet work, and the most important I know." } },
    advice = { { id = "tp_ad", text = "Heal the one in front of you before you worry about the one across the sea. Prayer can wait a breath; bleeding can't." } },
    sisterhood_of_elune = { { id = "tp_sister", text = "We've healed and guarded our people since before the Sundering. Ask me about it properly and I'll tell you more.", next = "sisterhood" } },
    highborne = { { id = "tp_highborne", text = "They reached for power and called the Legion down on us. That is why I keep my hands folded around the arcane.", next = "arcane" } },
    malfurion = { { id = "tp_malfurion", text = "He sleeps in the Emerald Dream, and the High Priestess waits for him. So do we all, in our way." } },
    _none = { { id = "tp_none", text = "That is outside what a priestess of the Temple can speak to. The Sentinels or the Enclave might know more." } },
  },
}

-- Astarii Starseeker: priest trainer; receives Zamael Lunthistle's golden prayer from the Searing Gorge.
P:NPC {
  key = "astarii", id = TODO_NPC("Astarii Starseeker"), name = "Astarii Starseeker",
  title = "Priest Trainer",
  bible = "bibles/temple.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "gentle", "earnest" }, values = { "devout", "kind" },
  notices = { "class", "light" },

  impression = {
    first = "Astarii Starseeker believes no soul is too far gone for Elune to hear, not even one that served the Twilight's Hammer. She says it gently, and she plainly means it.",
    third = "{name} met Astarii Starseeker, a priestess of the Temple of the Moon who believes in second chances.",
  },

  greetings = {
    { id = "g_elune", text = "Elune be with you, {class}. Come in out of the wind." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. I hoped you would; the Temple likes familiar faces." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
      text = "Another priest! Whatever we each pray to, we both get called out of bed at the same hours, and I think that makes us family of a sort." },
    { id = "n_human", cat = "light", when = { race = "Human", class = { "PALADIN", "PRIEST" } },
      text = "You carry the Light like a lantern, the way your people do. Ours is more like moonlight on water, but I've seen both find the way home." },
  },

  start = "hello",
  nodes = {
    warlock_s = {
      big = true,
      lines = {
        { id = "ws_default", text = "She heard a man who served the Twilight's Hammer, and he'd done worse than summon an imp, I promise you. Whether you want her to listen is the harder question, and only you can answer it." },
      },
      choices = {
        { text = "I want to be heard. Even like this.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "I don't need a goddess. I have my pact.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Astarii, one of the priestesses who teach here. Most of what I do is listen, and I'm told I'm better at it than at lecturing." },
        { id = "h_prayer", tags = { "news" }, when = { questActive = TODO_QUEST("Prayer to Elune") },
          text = "What brings you to the Temple? Is that gold, under all that soot? Let me see it, gently, because I think I know whose hand wrote this." },
        { id = "h_prayer_done", when = { questDone = TODO_QUEST("Prayer to Elune") },
          text = "Elune smiled on you that night, and I think she still does. You brought a lost soul back to her, and I don't say that lightly." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Most of the city is asleep, and the Temple is at its busiest. The ones who can't sleep come here, and I'm one of them." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm in no hurry tonight." },
        { id = "h_again2", text = "Go on; I'm listening." },
      },
      choices = {
        { text = "Train me, please.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is this golden tablet?", next = "tablet", when = { any = { { questActive = TODO_QUEST("Prayer to Elune") }, { questDone = TODO_QUEST("Prayer to Elune") } } } },
        { text = "Can anyone be forgiven?", next = "forgive" },
        { text = "What do the people who can't sleep tell you?", next = "listen" },
        { text = "Could Elune hear a warlock, Priestess?", next = "warlock_s", when = { class = "WARLOCK" } },
        { text = "Good night, Priestess.", next = "END" },
      },
    },
    tablet = {
      lines = {
        { id = "ta_default", text = "A prayer, etched in pure gold by a night elf named Zamael Lunthistle. He followed the Twilight's Hammer for years, until Elune sent him a vision, and he spent the rest of his life writing his sorrow into this." },
      },
      choices = {
        { text = "What happened to him?", next = "tablet2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } },
      },
    },
    tablet2 = {
      lines = {
        { id = "t2_default", text = "The cult found the tablet, called him a blasphemer and killed him, and his spirit is still caged in the Searing Gorge as a warning to the others. The prayer will be read here, in the Temple, and Elune will hear it whether he expects her to or not." },
      },
      choices = {
        { text = "He earned that cage.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "His repentance should count for something.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Can a prayer free a spirit?", next = "tablet3" },
      },
    },
    tablet3 = {
      lines = {
        { id = "t3_default", text = "I don't know, and I won't promise you it can. What I know is that a prayer heard is better than a prayer lost in a cultist's pack, and that I'll read it aloud by the pool tonight." },
      },
      choices = { { text = "Read it for him. Something else.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    forgive = {
      big = true,
      lines = {
        { id = "fo_default", text = "I believe Elune hears anyone who turns back toward her, however far they've wandered. Some of my sisters think I'm soft for it, and perhaps I am, but I've never regretted being soft." },
      },
      choices = {
        { text = "Mercy should be earned, not given.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Mercy freely given is the only kind that heals.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Who thinks you're soft?", next = "forgive2" },
      },
    },
    forgive2 = {
      lines = {
        { id = "f2_default", text = "The Sentinels, mostly, and they have their reasons, since they bury the ones the Horde kills in Ashenvale. I pray for them too, and they pretend not to notice." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    listen = {
      lines = {
        { id = "li_default", text = "They tell me about the boats, and about the war in Ashenvale, and how the branches creak in the wind. More than one has told me the tree doesn't feel finished yet, and I tell them neither are we." },
      },
      choices = {
        { text = "That's a kind answer.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "They'd sleep better with plain facts.", next = "BACK", fx = { align = { order = 1 }, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "People tell a priestess things at night that they'd never say by day. Ask what you like, and I'll share what isn't a confidence." } },
    background = { { id = "tp_bg", text = "I teach, and I listen, and on the bad nights I sit with whoever is awake. It's a good life." } },
    advice = { { id = "tp_ad", text = "Don't carry what you can set down. Elune can hold it while you sleep." } },
    twilights_hammer = { { id = "tp_twilight", text = "A cult that worships something older and worse than demons. One of them found his way back to Elune, which gives me hope for the rest, a little." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know. Alathea might; she's been teaching longer than I have." } },
  },
}

-- Jandria: priest trainer in the Temple; little canon beyond her post. Kept modest.
P:NPC {
  key = "jandria", id = TODO_NPC("Jandria"), name = "Jandria",
  title = "Priest Trainer",
  bible = "bibles/temple.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "brisk" }, values = { "dutiful", "practical" },
  notices = { "class" },

  impression = {
    first = "Jandria treats prayer as a craft to be practised, like archery or bandaging. She has little patience for grand speeches and a great deal for anyone willing to work.",
    third = "{name} met Jandria, a no-nonsense priest trainer of the Temple of the Moon.",
  },

  greetings = {
    { id = "g_short", text = "Elune be with you. If you're here to learn, let's begin; if not, the pool is that way." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Back for more training? Good, because your hands are steadier than last time, I think." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = { "Human", "Dwarf", "Gnome" } },
      text = "One of the Light's own, here for lessons. Alathea's the one for the long talks; I'm the one for the practice, so roll up your sleeves." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Jandria. I teach the practical side of things here: how to keep your mana when the fight runs long, and how to heal a Sentinel who won't stop moving." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night is when the wounded come up from the portal, so I keep my hands busy and my lessons short." },
      },
      again = { { id = "h_again", text = "Something more? Be quick about it, because a student of mine is kneeling by the pool and pretending not to listen." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What's the hardest thing to teach?", next = "hard" },
        { text = "Who do you heal most often?", next = "wounded" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    hard = {
      lines = {
        { id = "ha_default", text = "Patience. The young ones want to throw every prayer they know at the first scratch, and then they've nothing left when the real wound comes." },
      },
      choices = {
        { text = "Better to heal early than too late.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Discipline first, then mercy.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "How do you teach patience?", next = "hard2" },
      },
    },
    hard2 = {
      lines = {
        { id = "h2_default", text = "I make them sit with a wounded hunter's cat until it lets them near. Nothing teaches patience like a nightsaber that doesn't want a bandage." },
      },
      choices = { { text = "That sounds dangerous. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    wounded = {
      lines = {
        { id = "wo_default", text = "Sentinels back from Ashenvale, and more of them than I'd like. The Warsong cut the forest and our sisters bleed for it, so the Temple stays open all night." },
      },
      choices = {
        { text = "The Horde should answer for that.", next = "BACK", fx = { align = { honor = 1 }, learn = { "warsong" } } },
        { text = "Every war has two sets of wounded.", next = "BACK", fx = { align = { honor = -1 }, learn = { "warsong" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear what the wounded say while I'm patching them up. Ask, and be quick about it." } },
    background = { { id = "tp_bg", text = "I teach priests to heal without wasting themselves. That's all there is to me, and it's enough." } },
    advice = { { id = "tp_ad", text = "Save your strongest prayer for the wound that needs it. You'll know it when you see it." } },
    warsong = { { id = "tp_warsong", text = "Orcs with axes in Ashenvale, cutting down a forest older than their whole history. I mend what they leave behind." } },
    _none = { { id = "tp_none", text = "Not my concern, I'm afraid. Ask Alathea; she likes questions." } },
  },
}

-- Lariia: priest trainer in the Temple; quiet and observant. Kept modest.
P:NPC {
  key = "lariia", id = TODO_NPC("Lariia"), name = "Lariia",
  title = "Priest Trainer",
  bible = "bibles/temple.md", role = "trainer", tier = "service",
  communities = { "darnassus" }, temper = { "gentle", "watchful" }, values = { "devout", "careful" },
  notices = { "class", "weary" },

  impression = {
    first = "Lariia notices everything and says about half of it. She told me the Temple's pool shows the moon even on cloudy nights, and I still don't know whether she was teasing.",
    third = "{name} met Lariia, a quiet priest trainer who keeps watch over the Temple of the Moon's pool.",
  },

  greetings = {
    { id = "g_quiet", text = "Elune be with you. The pool is very still tonight; I'd keep it that way." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ready to learn something new? I can see you've been using what I taught you." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Your armor has been through a great deal, and you're carrying the road in your shoulders. Sit by the water before you do anything else." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Human" },
      text = "A priest from Stormwind, and you've come all this way to learn from us. That pleases me more than I'd like to admit." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Lariia. I teach here, and when I'm not teaching I watch the pool, because the moonlight on it tells you a great deal about the night if you look long enough." },
      },
      again = { { id = "h_again", text = "Something more? Speak softly, the pool listens." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What does the pool tell you?", next = "pool" },
        { text = "Do the Temple's priests ever leave Darnassus?", next = "leave" },
        { text = "Goodbye, Lariia.", next = "END" },
      },
    },
    pool = {
      lines = {
        { id = "po_default", text = "Whether the moon is clear over Teldrassil, which way the wind is going, and whether the sea is restless. Some of my sisters say they've seen more in it than that, but I've only ever seen the moon." },
      },
      choices = {
        { text = "Honest of you to say so.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Perhaps you'll see more, with faith.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "What have your sisters seen?", next = "pool2" },
      },
    },
    pool2 = {
      lines = {
        { id = "p2_default", text = "Faces, they say, and the shapes of things far away. I don't call them liars, and I don't stand behind them either; I just keep watching the water." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = {
        { id = "le_default", text = "Some go to Auberdine, or to the Sentinels in Ashenvale, and a few even take ship for your kingdoms. I've stayed, because someone has to keep the lamps trimmed for the ones who come home." },
      },
      choices = {
        { text = "Someone has to keep the home fires.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "You should see the world while you can.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I watch more than I speak, so I've gathered a little here and there. Ask, and I'll tell you what the water and the travellers have shown me." } },
    background = { { id = "tp_bg", text = "I teach priests and watch the pool. I'm content with both." } },
    advice = { { id = "tp_ad", text = "Look longer than you think you need to. Most people miss things by being in a hurry." } },
    _none = { { id = "tp_none", text = "The pool hasn't shown me anything about that. Try Alathea." } },
  },
}

-- Sister Aquinne: a young sister of the Temple in the Temple Gardens; sends heroes to A'moora about Lady Sathrah.
P:NPC {
  key = "aquinne", id = TODO_NPC("Sister Aquinne"), name = "Sister Aquinne",
  bible = "bibles/temple.md", role = "priest", tier = "quest",
  communities = { "darnassus" }, temper = { "earnest", "gentle" }, values = { "devout", "kind" },
  notices = { "class", "greenness" },

  impression = {
    first = "Sister Aquinne is still studying at the Temple and takes every task the priestesses give her as a sacred trust. She spoke of Lady Sathrah as if mourning someone she had known.",
    third = "{name} met Sister Aquinne, a young sister of the Temple of the Moon who keeps to the quiet of the Temple Gardens.",
  },

  greetings = {
    { id = "g_garden", text = "Oh, hello! Isn't the garden lovely tonight? I come here to study where it's quiet." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! I was hoping you'd come by; I've been thinking about what you said." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST", ["not"] = { race = "NightElf" } },
      text = "You're a priest! I've never spoken properly with one of the Light's. Do you study the way we do, with books and a teacher who sighs at you?" },
    { id = "n_green", cat = "greenness", when = { maxLevel = 15 },
      text = "You look as new to all this as I am. That's all right; the priestesses say the moon is kindest to beginners." },
  },

  start = "hello",
  nodes = {
    sky_a = {
      lines = {
        { id = "sk_default", text = "In the sky? Truly, islands just floating up there? I've only read about Eldre'Thalas in old books, and none of them said anything about sky, so I'm afraid you'll have to tell me everything." },
      },
      choices = {
        { text = "Wind spirits held them up. Now they're gone.", next = "sky_a2" },
        { text = "Another time, Sister.", next = "BACK" },
      },
    },
    sky_a2 = {
      lines = {
        { id = "sk2_default", text = "Gone, and you had to come all this way down. I'm sorry, and I'm also a little glad, because otherwise I'd never have met you; is that terrible of me?" },
      },
      choices = {
        { text = "Not terrible. I'm glad too.", next = "BACK", fx = { affinity = 2 } },
        { text = "A little, yes.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Aquinne, a sister of the Temple, though not a priestess yet. The priestesses give me errands and I try to do them well, and in between I study out here among the flowers." },
        { id = "h_temple", tags = { "news" }, when = { questActive = TODO_QUEST("The Temple of the Moon") },
          text = "A once great creature of the forest needs help, and it's a hard thing that must be done. Priestess A'moora will explain; she's inside the Temple, southeast of here." },
        { id = "h_sathrah", when = { questDone = TODO_QUEST("Sathrah's Sacrifice") },
          text = "A'moora told me you laid Lady Sathrah to rest at the fountain. I cried a little, I'm afraid, and then I went and lit a lamp for her." },
        { id = "h_tears", when = { questActive = TODO_QUEST("Tears of the Moon") },
          text = "You're going after Lady Sathrah, aren't you? Be gentle with her, if you can, because she was beautiful once." },
      },
      again = {
        { id = "h_again", text = "What else? The bell won't ring for my lessons for a while yet, so ask away." },
        { id = "h_again2", text = "Ask me anything; I'll tell you if I know, and if I don't I'll find out." },
      },
      choices = {
        { text = "Who was Lady Sathrah?", next = "sathrah" },
        { text = "What are you studying?", next = "study" },
        { text = "What's it like, training at the Temple?", next = "training" },
        { text = "We study the Light much the same way.", next = "light", when = { class = "PRIEST", ["not"] = { race = "NightElf" } } },
        { text = "My people lived on islands in the sky.", next = "sky_a", when = { race = "Skyborne" } },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    sathrah = {
      lines = {
        { id = "sa_default", text = "A great spider beloved of Elune, who spun silver threads through the moonlight. The dew that gathered on them healed the sick in the Temple, and now she's gone mad, and nobody can tell me why." },
      },
      choices = {
        { text = "Why would a holy creature go mad?", next = "sathrah2" },
        { text = "Then ending her suffering is a mercy.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Then she's a danger, and must be stopped.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    sathrah2 = {
      lines = {
        { id = "s2_default", text = "I asked A'moora that, and she only said the tree is young. The Temple's waters can cleanse whatever's in her, though, and then Elune will let her be born again, at peace." },
      },
      choices = {
        { text = "I hope she spins again someday.", next = "BACK", fx = { affinity = 2, learn = { "teldrassil" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "teldrassil" } } },
      },
    },
    study = {
      lines = {
        { id = "st_default", text = "The history of the Sisterhood, mostly, back before the Sundering and through the long years after. There's so much of it, and I keep falling asleep over the War of the Ancients, which is shameful." },
      },
      choices = {
        { text = "History matters. Keep at it.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Some days the garden teaches more than books.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "What happened in the War of the Ancients?", next = "study2" },
      },
    },
    study2 = {
      lines = {
        { id = "s2b_default", text = "Queen Azshara and her Highborne opened the way for the Burning Legion, and the Sisterhood and the druids drove them back. That's the short version, which is the only one I can say without yawning." },
      },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { trait = { witty = 1 }, learn = { "queen_azshara" } } } },
    },
    training = {
      lines = {
        { id = "tr_default", text = "Wonderful, and frightening, and very early in the morning. Priestess A'moora is patient with me, Alathea is strict, and the High Priestess once looked at me across the hall, and I didn't sleep that night." },
      },
      choices = {
        { text = "What did the High Priestess say?", next = "training2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    training2 = {
      lines = {
        { id = "t2_default", text = "Nothing at all! She looked, and nodded, and went on with the Sentinels' reports. I've decided it was an approving sort of nod." },
      },
      choices = {
        { text = "I'm sure it was.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Don't read too much into a nod.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    light = {
      lines = {
        { id = "lg_default", text = "Do you really? With old books and a teacher who sighs? That makes me feel much better about the whole thing, and about the Light too, I think." },
      },
      choices = {
        { text = "Our faiths have more in common than not.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Our teachers sigh. Our faiths differ.", next = "BACK", fx = { align = { light = -1 }, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I'm only a sister, but I listen to everything the priestesses say in the halls. Ask, and I'll tell you what I've picked up." } },
    background = { { id = "tp_bg", text = "I'm a sister of the Temple, studying to be a priestess. I'm not very far along yet, but I'm trying." } },
    advice = { { id = "tp_ad", text = "Be kind to anyone who is hurting, even if it's a spider. Especially if it's a spider, A'moora would say." } },
    sisterhood_of_elune = { { id = "tp_sister", text = "We've guided and healed our people since before the Sundering. I'm the newest and least of us, but I'm part of it." } },
    _none = { { id = "tp_none", text = "Oh, I don't know that one. I could ask A'moora for you, if I remember." } },
  },
}

-- Idriana: banker in the Temple Gardens; pays out Gracina Spiritmight's reward (Calm Before the Storm).
P:NPC {
  key = "idriana", id = TODO_NPC("Idriana"), name = "Idriana",
  title = "Banker",
  bible = "bibles/temple.md", role = "banker", tier = "service",
  communities = { "darnassus" }, temper = { "formal", "steady" }, values = { "careful", "honest" },
  notices = { "purse" },

  impression = {
    first = "Idriana keeps the Bank of Darnassus with perfect courtesy and an even more perfect memory for who owns which box. Nothing leaves her vault without a reason she can write down.",
    third = "{name} met Idriana, the courteous banker of the Bank of Darnassus in the Temple Gardens.",
  },

  greetings = {
    { id = "g_bank", text = "Welcome to the Bank of Darnassus. Do you already have an account with us, {g:sir|ma'am}?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your box is exactly where you left it, as always." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "You carry a good deal on your person, if you'll forgive my noticing. We do have boxes for that, and none of them has ever been robbed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Idriana, and I keep accounts and safety deposit boxes for anyone with valuables they'd rather not carry through Ashenvale. Everything here is guarded, recorded and returned on request." },
        { id = "h_voucher", tags = { "news" }, when = { questActive = TODO_QUEST("Calm Before the Storm") },
          text = "Gracina Spiritmight has told me to expect you. When you bring her voucher, I'm to withdraw something from her account and present it to you, so congratulations would seem to be in order." },
      },
      again = { { id = "h_again", text = "Is there anything else? Your coin is as safe under the Temple's roof as anywhere in Darnassus." } },
      choices = {
        { text = "I'd like to see my box.", next = "BUSINESS" },
        { text = "Who keeps accounts here?", next = "accounts" },
        { text = "Is anything here ever stolen?", next = "stolen" },
        { text = "Thank you.", next = "END" },
      },
    },
    accounts = {
      lines = {
        { id = "ac_default", text = "Priestesses, druids, craftsmen and a great many visitors from your kingdoms. Scholars use us most, oddly; Gracina Spiritmight has more specimens in her box than coins." },
      },
      choices = {
        { text = "Specimens? In a bank?", next = "accounts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    accounts2 = {
      lines = {
        { id = "a2_default", text = "Sealed, labelled and, I'm assured, entirely dead. I don't open the boxes; I only keep the records and the keys." },
      },
      choices = {
        { text = "Wise policy.", next = "BACK", fx = { align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "I'd have peeked.", next = "BACK", fx = { align = { order = -1 }, trait = { curious = 1 } } },
      },
    },
    stolen = {
      lines = {
        { id = "sto_default", text = "Never, and I intend to keep it that way. The Sentinels walk the gardens day and night, and a thief would have to get past them and then past me." },
      },
      choices = {
        { text = "The Sentinels are thorough.", next = "BACK", fx = { align = { order = 1 }, learn = { "sentinels" } } },
        { text = "Every vault has a weakness.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "A banker hears a great deal and repeats very little. I can speak to a few matters, if you ask." } },
    background = { { id = "tp_bg", text = "I keep the bank's records and its keys. Both are always in order." } },
    advice = { { id = "tp_ad", text = "Don't carry everything you own into the wilds. The wilds will take a share." } },
    _none = { { id = "tp_none", text = "I'm afraid that isn't a banking matter." } },
  },
}
