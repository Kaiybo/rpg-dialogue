-- Tirisfal's working dead with no quests of their own: Deathknell's warrior and priest
-- trainers and its shopkeeper, and Brill's warlock trainer, alchemist, nurse and horse
-- merchant. Voices: bibles/unsung.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Deathknell
---------------------------------------------------------------------------

-- Dannal Stern: Deathknell's warrior trainer.
P:NPC {
  key = "dannal", id = TODO_NPC("Dannal Stern"), name = "Dannal Stern", title = "Warrior Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "deathknell" }, temper = { "grim" }, values = { "dutiful", "practical" },
  notices = { "class", "weary" },
  impression = {
    first = "Dannal Stern teaches the newly risen of Deathknell to hold a sword again with hands that no longer feel it. He is grim and patient, and he talks about his old soldiering life without any wish to have it back.",
    third = "{name} met Dannal Stern, the warrior trainer of Deathknell.",
  },
  greetings = {
    { id = "g_war", when = { class = "WARRIOR" }, text = "You came back with your sword still in your hand, which is more than most fresh ones manage. Come here and let me see how you hold it." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "You are not one of my students, but stand where I can see you all the same. The mindless ones wander in sometimes." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "The Rattlecages have been at your armor, I see. Bones bite harder than you would think, so mend it before you go back to the fields." },
    { id = "n_orc", cat = "class", when = { class = "WARRIOR", race = "Orc" },
      text = "An orc in Deathknell, learning from a dead man. When I was alive, I fought your kind on these same fields, and now I am teaching you, which is a strange joke for the world to make." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dannal Stern, and I teach the risen of Deathknell to fight. Your muscles have forgotten what they knew, but your bones remember, and I can wake that memory up again." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Your grip is firmer than when you first crawled out of the grave. Good, because the Scourge and the Crusade will both test it soon enough." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. When I was alive, the orcs I fought had warlocks behind them, not shamans, and I'm told the difference matters a great deal to your people." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in Deathknell. I've no claws to teach you how to use, but stand where I can see you all the same." },
      },
      choices = {
        { text = "It matters, Dannal. Do you hold the old war against us?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is a beast's strength worth less than a sword's, Dannal?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Who were you before you died?", next = "past" },
        { text = "What's it like to fight without feeling pain?", next = "pain" },
        { text = "Who are we fighting here?", next = "enemies" },
        { text = "I'll go.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? I have the time; the dead do not need to sleep." },
        { id = "h_again2", text = "Ask what you like. I have heard every question a fresh corpse can think of." },
      },
    },
    past = {
      lines = { { id = "p_default", text = "A soldier of Lordaeron, and not a remarkable one. I remember the drills and the cold mornings on the walls, but I do not remember the faces of the men beside me, and I have decided that is a mercy." } },
      choices = { { text = "Do you miss that life?", next = "past_miss" } },
    },
    past_miss = {
      lines = { { id = "pm_default", text = "No, because that life ended in a ditch when the plague came, and nobody from Lordaeron came looking for me. The Dark Lady did, so I teach her soldiers now, and that is all the loyalty I have left." } },
      choices = {
        { text = "Then serve Sylvanas well.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Your loyalty is your own. You owe no one.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pain = {
      lines = { { id = "pa_default", text = "Dangerous, because you can lose an arm and only notice when the sword falls out of it. The first thing I teach is to look at your own body after every fight, since it will not tell you when it is hurt." } },
      choices = { { text = "That's useful advice. Something else.", next = "BACK" } },
    },
    enemies = {
      lines = { { id = "e_default", text = "The mindless dead and the Rattlecages in the fields, which are the Scourge's leftovers, and the Scarlet Crusade, who camp south of here and burn anything that walks without a heartbeat. Executor Arren will give you work against both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I hold nothing against anyone, because death left me very little to hold with. Your Warchief made peace with the Dark Lady and I teach whoever she sends me, so stand where I can see you and keep your lightning off my practice dummies." } },
      choices = {
        { text = "The old war is done. We fight the Scourge together now.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I keep my own counsel about old wars, Dannal.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "No, I think a sword is only a claw we had to make for ourselves. Your kind is born with the weapon and mine had to forge it, and the Scourge kills us both just the same if we stop paying attention." } },
      choices = {
        { text = "Then we'll pay attention together, and fight as one.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I fight my own way, Dannal, not in anyone's drill.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know that. Ask Executor Arren, or the shadow priest in the chapel." } },
  },
}

-- Dark Cleric Duesten: Deathknell's priest trainer.
P:NPC {
  key = "duesten", id = TODO_NPC("Dark Cleric Duesten"), name = "Dark Cleric Duesten", title = "Priest Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "deathknell" }, temper = { "cold" }, values = { "devout", "proud" },
  spiritSensitive = true,
  notices = { "class", "light" },
  impression = {
    first = "Dark Cleric Duesten teaches Deathknell's risen priests that faith is something you build for yourself, not something a god hands you. He speaks of the Light with contempt and of the will with reverence.",
    third = "{name} met Dark Cleric Duesten, the priest trainer of Deathknell and a voice of the Cult of Forgotten Shadows.",
  },
  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Another of the faithful, come back from the fields. Tell me, does your will grow stronger, or only your spells?" },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "You are not a priest, but the Forgotten Shadow has room for anyone who still believes in themselves." },
  },
  notice = {
    { id = "n_paladin", cat = "light", when = { class = "PALADIN" },
      text = "You still carry the Light, and I can smell it on you like smoke. Aramis may tell you it makes you strong, but I would say it is a chain you have not yet seen." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dark Cleric Duesten, and I teach the priests of Deathknell the faith of the Forgotten Shadow. The Light abandoned us when we died, so we learned to believe in what it could not take away: ourselves." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You bow to the elements and call it wisdom, but I would call it another master, and the Forsaken have had enough of masters." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You serve the land and its goddess, and I wonder whether you have ever asked what she did for Lordaeron when the plague came." },
      },
      choices = {
        { text = "The spirits are partners, Cleric, not masters. Can you understand that?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What would you have had the Earth Mother do, Cleric?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is the Forgotten Shadow?", next = "cult" },
        { text = "Did you serve the Light when you lived?", next = "past" },
        { text = "I still feel the Light. Am I wrong?", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Farewell.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What more would you ask? Speak plainly; the dead have no use for flattery." },
      },
    },
    cult = {
      lines = { { id = "c_default", text = "It is a faith in the will, the one thing that carried us out of the Lich King's grip when nothing else did. We do not pray to anyone; we remind ourselves that we chose to be free." } },
      choices = { { text = "Who leads the cult?", next = "cult_who" } },
    },
    cult_who = {
      lines = { { id = "cw_default", text = "Its priests gather in the Undercity, and Shadow Priest Sarvis speaks for it here in Deathknell. You will find us wherever the Forsaken need reminding that they owe nothing to the gods who let them rot." } },
      choices = {
        { text = "A faith in yourself makes sense to me.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "I think the Light is still there for us.", next = "BACK", fx = { affinity = -2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past = {
      lines = { { id = "p_default", text = "I prayed every morning and every evening, like everyone in Lordaeron, and the plague took me between two prayers. If the Light could not be bothered to save a man in the middle of praying to it, then I see no reason to keep asking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = { { id = "l_default", text = "You are not wrong to feel it, but you are wrong to trust it, and it will hurt you each time you reach for it. Take what it gives, if you must, and never thank it." } },
      choices = { { text = "I'll remember that.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I understand that you believe it, and so did every priest of Lordaeron who knelt to the Light. A partner who can refuse you is a master who has not yet decided to, so keep your will your own, shaman, and see how long the spirits stay friendly." } },
      choices = {
        { text = "My will is my own. The spirits only lend their strength.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Humility before the spirits isn't weakness, Cleric.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Anything at all would have been more than the Light managed. I do not blame your goddess for my death, because she was never ours to begin with, but I would be wary of any power that lets so much die and calls it balance." } },
      choices = {
        { text = "Balance isn't cruelty. Death is part of the cycle.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. Only the will can be trusted.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That is no concern of mine. Ask Executor Arren, if you must." } },
  },
}

-- Joshua Kien: sells general goods in Deathknell.
P:NPC {
  key = "kien", id = TODO_NPC("Joshua Kien"), name = "Joshua Kien", title = "General Goods",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "deathknell" }, temper = { "dry" }, values = { "practical" },
  notices = { "purse", "hunger" },
  impression = {
    first = "Joshua Kien sells general goods in Deathknell and finds it very funny that the dead still need bread and water. He keeps a shopkeeper's habits from his life before, down to the polite tone.",
    third = "{name} met Joshua Kien, who sells supplies to the newly risen of Deathknell.",
  },
  greetings = {
    { id = "g_shop", text = "Good day to you, or good night, since it hardly matters to us. What can I sell you?" },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? The fields are hungry for supplies, it seems." },
  },
  notice = {
    { id = "n_broke", cat = "purse", when = { money = { max = 50 } },
      text = "Your purse is as empty as a ghoul's head, friend. The fields are full of bones and old coin, if you go looking." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Joshua Kien, at your service, and I sell general goods to the freshly risen. You'd think the dead wouldn't need food and drink, but it helps the body knit together, so here we are." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, shopping in Deathknell? I've bread, water and thread, and nothing the elements would want, unless they've taken up sewing." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, is it? You'll be after herbs, I suppose, and I only sell the kind that's been baked into bread." },
      },
      choices = {
        { text = "Do the living buy your bread too, Kien?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Did you keep a garden before the plague, Kien?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Why do the dead need to eat?", next = "eat" },
        { text = "Were you a shopkeeper in life?", next = "past" },
        { text = "Not today.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else, friend? The shelves are still here." } },
    },
    eat = {
      lines = { { id = "e_default", text = "The apothecaries say food and drink help the flesh hold together and the wounds close faster. I can't taste a thing anymore, mind, but I eat my bread every day, because I like having all my fingers." } },
      choices = { { text = "That's grim, but fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    past = {
      lines = { { id = "p_default", text = "I kept a little shop near the old capital, selling candles and thread to farmers. Now I sell the same things to corpses, and I'll tell you this: corpses complain less about prices." } },
      choices = { { text = "Do you remember your old customers?", next = "past_people" } },
    },
    past_people = {
      lines = { { id = "pp_default", text = "Some of them, and a few of them walk through Deathknell now with the same faces, half rotted. We nod to each other and don't talk about it, because neither of us wants to remember." } },
      choices = {
        { text = "Some memories are better left buried.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "You should talk to them. Remembering keeps us human.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Now and then, when the Horde sends someone through, and I've learned the living are fussier about what's gone green. I eat it anyway, since I can't taste it, but I'll sell you the fresh loaves and keep the others for the Forsaken." } },
      choices = {
        { text = "Give me the same loaves as the Forsaken. Fair is fair.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The fresh ones, then. Let the dead eat the rest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "A window box, three streets from the capital's market, with thyme and a sad little rosemary in it. I tried to grow the rosemary again here, and the soil killed it in a week, which I took rather personally." } },
      choices = {
        { text = "Try again. I'll find you soil that isn't poisoned.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let it go, Kien. Dead men don't need rosemary.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Bread and candles are my whole trade, friend, so take that question to Executor Arren." } },
  },
}

---------------------------------------------------------------------------
-- Brill
---------------------------------------------------------------------------

-- Rupert Boch: Brill's warlock trainer.
P:NPC {
  key = "boch", id = TODO_NPC("Rupert Boch"), name = "Rupert Boch", title = "Warlock Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "smooth" }, values = { "ambitious", "cunning" },
  notices = { "class", "fel" },
  impression = {
    first = "Rupert Boch trains warlocks in Brill and speaks of demons the way a merchant speaks of difficult customers. He is courteous and amused, and he never says anything he did not mean to.",
    third = "{name} met Rupert Boch, the warlock trainer of Brill.",
  },
  greetings = {
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Ah, a fellow practitioner. Come in, and tell me how your little friend is behaving." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "You aren't a warlock, but you are welcome to look around. Don't touch anything that moves." },
  },
  notice = {
    { id = "n_pet", cat = "fel", when = { class = "WARLOCK", pet = { type = "Demon" } },
      text = "Your {pet} is watching me rather closely. Demons always look for a better master, so make sure it never sees you hesitate." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Rupert Boch, warlock and teacher, at your service. I train those in Brill who would rather command the darkness than fear it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in my parlour. Your people turned their backs on my craft, I'm told, and went back to the spirits; I do hope there are no hard feelings." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You commune with the wilds and I commune with things that would eat the wilds, so I suspect we'll get on politely and no further." },
      },
      choices = {
        { text = "The fel nearly destroyed my people, Boch. Why should I trust you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do your demons fear nature, Boch?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Isn't commanding demons dangerous?", next = "danger" },
        { text = "Why do the Forsaken allow warlocks?", next = "forsaken" },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Is there something else? Do go on, because curious minds are the only kind worth teaching." } },
    },
    danger = {
      lines = { { id = "d_default", text = "Of course it is, and that's exactly why so few do it well. A demon is a contract with teeth, and if you read every word of the contract, the teeth stay on the other side." } },
      choices = { { text = "And if you don't read every word?", next = "danger_fail" } },
    },
    danger_fail = {
      lines = { { id = "df_default", text = "Then you become a cautionary tale, and I use your name in my lessons. I already have several names, so please don't add yours to the list." } },
      choices = {
        { text = "Power is worth the risk.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "No power is worth bargaining with demons.", next = "BACK", fx = { affinity = -2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = { { id = "f_default", text = "Because the Dark Lady values anything that can be used against the Scourge, and the Burning Legion are no friends of the Lich King. We were slaves once, so we are not afraid of using what others fear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "You shouldn't, and that's the first sensible thing anyone's said in here today. Your people were bought cheaply by the demons and paid dearly for it, whereas I read the contract, so I think we've both learned something, only not the same thing." } },
      choices = {
        { text = "There's no safe bargain with demons, Boch.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then teach me to read the contract. Power is power.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "An imp is afraid of everything, which is half its charm, and a voidwalker is afraid of nothing, which is the other half. I've never seen either of them comfortable near a living tree, though, and I've wondered why, so do tell me if you find out." } },
      choices = {
        { text = "Nature and the fel don't mix, Boch. Remember that.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Use whatever works. I don't judge a weapon by its source.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I'm afraid I don't know, and I'm rarely afraid. Ask the magistrate." } },
  },
}

-- Carolai Anise: Brill's alchemy trainer.
P:NPC {
  key = "carolai", id = TODO_NPC("Carolai Anise"), name = "Carolai Anise", title = "Alchemy Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "brisk" }, values = { "curious", "practical" },
  notices = { "craft" },
  impression = {
    first = "Carolai Anise teaches alchemy in Brill, a brisk woman who talks about potions as practical medicine and very little else. She seems to think the apothecaries make too much noise about their work.",
    third = "{name} met Carolai Anise, the alchemy trainer of Brill.",
  },
  greetings = {
    { id = "g_shop", text = "Mind the vials; some of them bite. What can I do for you?" },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "Another alchemist, good. Come and tell me what you've been brewing." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You smell of peacebloom and earthroot, so you've been picking herbs. Good, because an alchemist without herbs is just someone with a lot of empty bottles." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Carolai Anise, and I teach alchemy here in Brill. Healing draughts, mostly, and other useful brews, since the dead need medicine as much as the living do." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll heal with spirit waters, I expect, and I'd like to know whether they work as well on the dead as my draughts do." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Then you know peacebloom from silverleaf, at least, which puts you ahead of most of my students." },
      },
      choices = {
        { text = "Do your potions work on the living, Carolai?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you pick herbs from the plagued fields, Carolai?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "How is alchemy different from the apothecaries?", next = "apothecary" },
        { text = "Where do you find herbs here?", next = "herbs" },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? Quickly, please, before something boils over." } },
    },
    apothecary = {
      lines = { { id = "a_default", text = "The Royal Apothecary Society works on grand projects in the Undercity and won't say what, which is their business. I make potions that close wounds and keep people standing, and I don't need a secret laboratory for that." } },
      choices = { { text = "What do you think they're making?", next = "apothecary_what" } },
    },
    apothecary_what = {
      lines = { { id = "aw_default", text = "Something to use against the Scourge, they say, and Apothecary Johaan at the inn asks for strange ingredients often enough. I don't ask him questions, and he doesn't ask me." } },
      choices = {
        { text = "Some secrets are worth keeping.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd want to know what they're brewing.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    herbs = {
      lines = { { id = "h2_default", text = "Peacebloom and silverleaf grow all over the glades, even with the plague in the soil, and earthroot grows near the hills. Further south in Silverpine, you'll find mageroyal and briarthorn, if the worgen don't find you first." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The healing draughts do, and so do most of the rest, since a wound is a wound whether it bleeds or not. Your spirits mend the living by asking, and I mend the dead with peacebloom and patience, and I think mine is the more reliable." } },
      choices = {
        { text = "Reliable is what matters. I'll carry your draughts.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The spirits haven't failed me yet. I'll trust them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I do, and I rinse them twice, and I've never had a draught go wrong for it. The plague in the soil doesn't seem to reach the leaves, though I'd not swear to the roots, so I leave those for Johaan, who seems to want them more than I do." } },
      choices = {
        { text = "Medicine is medicine. Use what the land gives you.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'd not trust anything grown in plagued earth, Carolai.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Not my field. Ask Apothecary Johaan, or someone at the inn." } },
  },
}

-- Nurse Neela: Brill's first aid trainer.
P:NPC {
  key = "neela", id = TODO_NPC("Nurse Neela"), name = "Nurse Neela", title = "First Aid Trainer",
  bible = "bibles/unsung.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "warm" }, values = { "kind", "practical" },
  notices = { "weary" },
  impression = {
    first = "Nurse Neela teaches first aid in Brill and still talks like the nurse she was in life, warm and firm in the same breath. She stitches dead flesh as carefully as she once stitched the living.",
    third = "{name} met Nurse Neela, who teaches first aid in Brill.",
  },
  greetings = {
    { id = "g_hi", text = "Come in, dear, and let me see you. Don't worry about bleeding on the floor; nobody here minds." },
  },
  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "Oh, look at the state of you! Sit down this minute, and let me see where you're torn before you lose something important." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Nurse Neela, and I teach first aid to anyone who wants to learn it. A bandage in your pack is worth more than a priest who's busy somewhere else." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, dear? I'm told you can mend a wound with a word, which would put me out of work, so do be quiet about it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, dear? Sit down and let me see those paws, or hands, whichever you're using today." },
      },
      choices = {
        { text = "Would you teach me bandages, Neela, though spirits heal me?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you ever stitch up the living, Neela?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Were you a nurse in life too?", next = "past" },
        { text = "How do you bandage the dead?", next = "dead" },
        { text = "Goodbye, Nurse.", next = "END" },
      },
      again = { { id = "h_again", text = "Is there anything else, dear, before I go back to rolling bandages?" } },
    },
    past = {
      lines = { { id = "p_default", text = "I was, in a little house near Lordaeron, and I nursed people through the plague until it took me too. When I woke up, the first thing I did was look for someone to help, so I suppose some habits outlast the grave." } },
      choices = {
        { text = "That's admirable, nurse.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Helping didn't save them. Look after yourself now.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "The same as the living, mostly, only tighter, because dead flesh doesn't pull itself together on its own. Linen bandages and patience, and a strong stomach, because you'll see things I won't describe." } },
      choices = { { text = "Where do I get linen?", next = "dead_linen" } },
    },
    dead_linen = {
      lines = { { id = "dl_default", text = "From the people you fight, dear, since half of Tirisfal walks around in old cloth. The Scarlet Crusade carry plenty of it, and they won't need it once you're finished with them." } },
      choices = { { text = "Thank you. Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Of course I would, dear, because spirits get tired and busy just like priests do. A bandage in your pack never needs asking twice, and when your healing runs dry halfway across Silverpine, you'll thank me." } },
      choices = {
        { text = "A healer should know every way to mend, Neela.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll learn it to save my own skin, nothing more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Now and then, when the Horde sends someone through who's lost an argument with a Crusader. The living flinch and the dead don't, and I'd forgotten how much I liked the flinch, dear, because it means the body is still fighting." } },
      choices = {
        { text = "Then stitch whoever comes, living or dead.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Save your thread for the Forsaken. The living have priests.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I wouldn't know that, dear. Ask Innkeeper Renee downstairs." } },
  },
}

-- Zachariah Post: sells undead horses in Brill.
P:NPC {
  key = "zachariah", id = TODO_NPC("Zachariah Post"), name = "Zachariah Post", title = "Undead Horse Merchant",
  bible = "bibles/unsung.md", role = "vendor", tier = "service",
  communities = { "brill" }, temper = { "dry" }, values = { "practical", "proud" },
  notices = { "mount", "purse" },
  impression = {
    first = "Zachariah Post sells skeletal horses in Brill and swears they are better than the living kind, since they never tire and never need feeding. He sells mostly to the Forsaken, and he says so without apology.",
    third = "{name} met Zachariah Post, who sells undead horses in Brill.",
  },
  greetings = {
    { id = "g_shop", text = "Looking for a mount that never tires? You've come to the right stable." },
    { id = "g_young", when = { maxLevel = 39 }, text = "Come back when you're more experienced, friend, but you're welcome to look at the horses until then." },
  },
  notice = {
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "That's a fine mount you're sitting on, though it'll need feeding and rest. Mine won't." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zachariah Post, and I sell undead horses to the Forsaken of Brill. They don't eat, they don't sleep, and they don't spook at a bit of plague, which is more than you can say for a living horse." },
        { id = "h_other", when = { ["not"] = { race = "Scourge" } }, text = "Zachariah Post, and I sell undead horses, mostly to the Forsaken. You're not one of us, so I'll be honest and say you'd need to earn the Undercity's respect before I'll sell you one." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll have your own mounts back in Durotar or Mulgore, I expect, and I won't pretend my horses are as warm to sit on." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, looking at my horses with that face. Yes, they're dead, and no, they don't mind it." },
      },
      choices = {
        { text = "Do your horses mind a shaman on their backs, Zachariah?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Shouldn't these horses be allowed to rest, Zachariah?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your horses.", next = "BUSINESS" },
        { text = "Where do the horses come from?", next = "where" },
        { text = "Why are they better than living horses?", next = "better" },
        { text = "Goodbye.", next = "END" },
      },
      again = { { id = "h_again", text = "Anything else? The horses aren't going anywhere, and neither am I." } },
    },
    where = {
      lines = { { id = "w_default", text = "The same place we come from, mostly: the plague left plenty of dead horses in Lordaeron, and the Dark Lady's servants know how to raise them. They were warhorses and farm horses once, and now they're ours." } },
      choices = {
        { text = "That's a good use for the plague's dead.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "They should have been left to rest.", next = "BACK", fx = { affinity = -2, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    better = {
      lines = { { id = "b_default", text = "A living horse needs rest and food and gets frightened of everything in Tirisfal. A dead horse goes until you stop, and it doesn't care if you're riding it through the Plaguelands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They don't mind anything, which is their chief selling point. A living horse would shy from your lightning, but mine have been struck by worse and dead for longer, so if the Undercity vouches for you, I'll put you on one." } },
      choices = {
        { text = "Then I'll earn the Undercity's trust first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep my own mount. I want no favours.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Should they? They were warhorses and plough horses once and they died in harness, so I'd say they're doing what they always did. You can tell me it's unnatural, druid, and I'll tell you so am I, and we'll both be right." } },
      choices = {
        { text = "Unnatural or not, they serve. I'll not judge them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "They should rest. Some things belong in the ground.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, friend. I only know horses, and dead ones at that." } },
  },
}
