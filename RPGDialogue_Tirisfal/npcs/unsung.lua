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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They stood just behind us, and when the line bent they'd step into the gap and pray loud enough to shame us back into place. I don't know what you pray to now, but a voice behind the line still matters, so learn where to stand before you learn what to say." } },
      choices = {
        { text = "I'll stand behind your line and keep it whole.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll stand where I like. Lines are for soldiers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "No, though I spent my living years thinking so, behind a shield in the front rank. The archers on the walls killed more orcs than I ever did, and they had the sense to stay alive doing it, which I did not." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "No, and a beast at your side is worth a shieldmate besides, if {pet} holds its ground the way it looks like it would. The archers on the walls killed more orcs than I ever did, and they had the sense to stay alive." },
      },
      choices = {
        { text = "Then I'll guard the rear, and you hold the front.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll fight where I like, Dannal, front or back.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because your demon will die sooner or later, and you'll be left holding whatever's in your hand. I was a soldier once and saw what happened to the ones who trusted their magic alone, so humour me and hold the blade properly." },
      },
      choices = {
        { text = "I'll learn it properly, Dannal.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My magic is all I need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dannal Stern, and I teach the risen of Deathknell to fight. Your muscles have forgotten what they knew, but your bones remember, and I can wake that memory up again." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Your grip is firmer than when you first crawled out of the grave. Good, because the Scourge and the Crusade will both test it soon enough." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. When I was alive, the orcs I fought had warlocks behind them, not shamans, and I'm told the difference matters a great deal to your people." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in Deathknell. I've no claws to teach you how to use, but stand where I can see you all the same." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, among my sword pupils. Stand where I can see you, then, and tell me why you keep your distance from the fight." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, at a warrior's post. I trained beside priests of the Light in the old army, and they stood behind the line and kept it standing, so I'll not mock yours." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, in my yard? You'll hold a sword badly, I expect, but I'll teach you to hold it anyway." },
      },
      choices = {
        { text = "Did the old army's priests ever fight beside you, Dannal?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "It matters, Dannal. Do you hold the old war against us?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is a beast's strength worth less than a sword's, Dannal?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Who were you before you died?", next = "past" },
        { text = "What's it like to fight without feeling pain?", next = "pain" },
        { text = "Who are we fighting here?", next = "enemies" },
        { text = "I fight from behind, Stern. Any advice for that?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Should a mage learn to hold a weapon, Stern?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Is a bow worth less than a sword to you, Dannal?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why teach a warlock the sword, Dannal?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "From behind is still fighting, whatever the knights used to say about it, and I've buried enough honourable men to stop caring. Learn to take a hit anyway, because sooner or later the one you're stabbing turns round." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I served beside men who'd have hanged a cutpurse for lifting a loaf, and now we're all dead together in Deathknell. Take your knives to the Crusade and I'll count it as soldiering." },
      },
      choices = {
        { text = "A knife in the back ends a fight quickest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll learn to face them too, Stern.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What's it like to fight without feeling pain?", next = "pain" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It wouldn't hurt, since a spell takes a breath to cast and a Scarlet initiate needs only half that to reach you. Keep a staff in your hands and learn to swing it like you mean it, and you'll outlast the mages who don't." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Half the mages who fell in Lordaeron fell because a ghoul got close while they were still muttering, and I watched it happen more than once. Learn to step back as you cast, and you'll do better than they did." },
      },
      choices = {
        { text = "I'll learn the staff, Stern. You're right.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My spells are protection enough, Stern.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who are we fighting here?", next = "enemies" },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every soldier believes in something, even if it's only the strength of the arm beside them. The Forgotten Shadow asks only that you believe in yourself, which is the one thing the Light never let its soldiers do." } },
      choices = {
        { text = "I fight for something bigger than myself, Cleric.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I believe in my own arm, Cleric. That's enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Perhaps, if you make it one, though most hunters I've known put their trust in the arrow and not in the sky. That is the right order of things, and the Light never understood it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Perhaps, and your {pet} trusts you the way the faithful trust their gods. Be worthier of it than the Light was of us, and you'll have built a faith of your own." },
      },
      choices = {
        { text = "The hunt is sacred, Cleric. There's more to it than aim.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My faith is in my aim, Cleric, and nothing more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Faith is something you build for yourself, and a rogue builds it every time a plan works. Trust your own will and not the Light, which abandoned every one of us in Lordaeron, and you'll be harder to kill than any paladin of the Crusade." },
      },
      choices = {
        { text = "I serve the Dark Lady's will, not only my own.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I serve my own will, and nobody else's.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dark Cleric Duesten, and I teach the priests of Deathknell the faith of the Forgotten Shadow. The Light abandoned us when we died, so we learned to believe in what it could not take away: ourselves." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You bow to the elements and call it wisdom, but I would call it another master, and the Forsaken have had enough of masters." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You serve the land and its goddess, and I wonder whether you have ever asked what she did for Lordaeron when the plague came." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Your strength is your own, {class}, and no god gave it to you, so remember that when the Crusade tells you otherwise." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You live by your own skill and your own eye, which is closer to our faith than most of my students manage." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You've already learned that no god will save you, I think, so you're halfway to wisdom." },
      },
      choices = {
        { text = "The spirits are partners, Cleric, not masters. Can you understand that?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What would you have had the Earth Mother do, Cleric?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is the Forgotten Shadow?", next = "cult" },
        { text = "Did you serve the Light when you lived?", next = "past" },
        { text = "I still feel the Light. Am I wrong?", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "My power comes from study, not faith, Cleric.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you see a difference between shadow and fel, Cleric?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do warriors need faith, Cleric?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is the hunt a kind of faith, Cleric?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do rogues need faith, Duesten?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
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
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Then you already understand half of what I teach, because study is only the will turned toward books. The Kirin Tor kept their secrets behind walls and oaths, and you'll find the Forgotten Shadow keeps fewer, so long as you're willing to stare into the dark long enough." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran's mages were proud of their minds, and the Scourge took those minds anyway, so I'd not lean on study alone. Whatever drew you out of the Lich King's grip was will, and you'd do well to cultivate it." },
      },
      choices = {
        { text = "Will over faith. I believe that.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "There's still something to the Light, Cleric.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "What is the Forgotten Shadow?", next = "cult" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I see the difference between one who commands and one who is commanded, and that is the only difference that matters. A warlock who masters a demon practises the same faith I teach, and a warlock mastered by one is just another fool on his knees." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You knelt to the Lich King once, as we all did, so you know exactly what it costs to serve something greater than yourself. Never kneel to a demon, and the Forgotten Shadow will have no quarrel with you." },
      },
      choices = {
        { text = "I command. I'll never kneel again.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Even a warlock needs something to believe in.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Did you serve the Light when you lived?", next = "past" },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "They need someone to tell them they're still people, I think, and the priests seem to be the ones doing it. I just sell the bread, but I notice the ones who've spoken to Sarvis or Duesten walk out a bit straighter than they came in." } },
      choices = {
        { text = "Then I'll tell them they're still people.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bread is more use to them than comfort.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Bread, water and a little thread to stitch your tabard, because the Crusade will cut it and the Scourge will tear it. I sell everything a soldier forgets until the moment they need it, and I sell it at an honest price." } },
      choices = {
        { text = "I'll pay your honest price, Kien.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take what I need from the Crusade's packs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I'd like to, but most of my customers can't stomach fresh meat yet, and the ones who can prefer it baked into something. Living travellers do pass through now and then, though not often enough to keep a butcher's counter." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks well fed, which is more than I can say for my customers. I don't buy meat, I'm afraid, because most of the freshly risen can't stomach it yet, though I'd wager your beast could." },
      },
      choices = {
        { text = "Then I'll share my catch with whoever's hungry.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll sell my catch in Brill, for a better price.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "For the imps, I'm told, though I've never seen one eat, and I've never had the courage to ask. Polite customers, though, always polite, which is more than I could say for the Scourge that used to wander through here." },
      },
      choices = {
        { text = "I'll buy what I need and keep the imp outside.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My imp eats whatever it likes, Joshua.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Joshua Kien, at your service, and I sell general goods to the freshly risen. You'd think the dead wouldn't need food and drink, but it helps the body knit together, so here we are." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, shopping in Deathknell? I've bread, water and thread, and nothing the elements would want, unless they've taken up sewing." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, is it? You'll be after herbs, I suppose, and I only sell the kind that's been baked into bread." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You'll want something solid in your stomach, then, because swinging a sword on an empty belly is a fine way to get killed twice." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, is it? I've no arrows, I'm afraid, but I've bread for the road and water that only tastes a little of the well." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! The dead still need bread and water, and now they need priests too. I'm beginning to think dying changed rather less than we were told." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, buying bread! I do love that the dead still need bread, and I love even more that warlocks always buy extra." },
      },
      choices = {
        { text = "Do the risen still need priests, Joshua?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the living buy your bread too, Kien?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Did you keep a garden before the plague, Kien?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Why do the dead need to eat?", next = "eat" },
        { text = "Were you a shopkeeper in life?", next = "past" },
        { text = "Your stock would be easy to lift, Kien.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Couldn't I just conjure my own bread and water?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What does a warrior need from your shelves, Kien?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do you buy meat from hunters, Kien?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why do warlocks buy extra bread, Joshua?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "It would, I suppose, but the dead don't get hungry the way the living do, so you'd have stolen a loaf for nothing but the principle of it. I'd rather you paid all the same; old habits, you understand." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I had a boy lift apples off my cart in the old days, and I chased him three streets before I gave up. If that was you, I'm glad to see you've come down in the world as far as I have." },
      },
      choices = {
        { text = "I'll pay, Kien. Shopkeepers deserve that much.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Principle is reason enough to steal.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why do the dead need to eat?", next = "eat" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, and the mages who come through often do, which is terrible for business and very good for my temper, since I never liked haggling. Do try my water first, though; it's from a proper well and only slightly green." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "I'd forgotten Dalaran's lot could make bread out of nothing, and now I'm wondering why I ever bothered with a shop. Still, I'm told conjured bread never tasted of much, and nor does mine now, so we're even." },
      },
      choices = {
        { text = "I'll buy from you anyway, Kien. Fair is fair.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Conjured food costs nothing, and nothing is better.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Were you a shopkeeper in life?", next = "past" },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "We both ask something unseen for power, and we both pay for it, though a priest's bill comes due more politely than mine. The difference, I'd suggest, is that I always read the contract, and in my experience your sort never thought to ask for one." } },
      choices = {
        { text = "Some powers shouldn't be bargained with, Rupert.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Perhaps I should start reading contracts too.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Some of them, and some of them would very much like to try, which is why I keep them on a short leash. A warlock who can't stand behind a warrior doesn't stay a warlock for long, so I've always thought our two trades get along rather well." } },
      choices = {
        { text = "I'll stand in front, then, and you keep them leashed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let one off the leash, Boch. I'd like to see it try.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than either of us would admit in polite company, since both would eat their master if the bond ever slipped. The difference is that your beast wants to stay, and mine are counting the days." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "More than you'd think, though {pet} looks far happier with its arrangement than my imp ever has. Both would eat their masters if the bond slipped, but yours wants to stay, and mine are counting the days." },
      },
      choices = {
        { text = "My beast stays from loyalty. That's worth more than chains.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A bond is a bond, Boch, whatever holds it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Rupert Boch, warlock and teacher, at your service. I train those in Brill who would rather command the darkness than fear it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in my parlour. Your people turned their backs on my craft, I'm told, and went back to the spirits; I do hope there are no hard feelings." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You commune with the wilds and I commune with things that would eat the wilds, so I suspect we'll get on politely and no further." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, in my parlour. You'd be surprised how many of my demons respect a good blade, {class}, and how few of them respect a good argument." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast and my demons are cousins of a sort, {class}, though yours were tamed with patience and mine with somewhat sterner methods." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, in my trainers' corner. We both deal in things beyond the veil, I'd say, though your sort tends to look at mine as if I'd tracked something in on my boots." },
      },
      choices = {
        { text = "Do you think priests and warlocks are so different, Rupert?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The fel nearly destroyed my people, Boch. Why should I trust you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do your demons fear nature, Boch?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Isn't commanding demons dangerous?", next = "danger" },
        { text = "Why do the Forsaken allow warlocks?", next = "forsaken" },
        { text = "Rogues and warlocks have more in common than you'd think, Boch.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Isn't warlockry just the arcane with poorer manners?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Could your demons stand against a real warrior, Boch?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Is a demon anything like a hunter's beast, Boch?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "We do, since both of us make our living from things other people would rather not see. Marion Call and I share the Gallows' End very politely, and I have never once caught her in my rooms, which tells me she is very good indeed." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "In life I imagine you picked locks, and in death you pick them still, while I spent my life studying old books and now summon what was in them. We each kept to our trade, which I find rather touching." },
      },
      choices = {
        { text = "I'll stay out of your rooms, Boch.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Locks are only suggestions, Boch.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why do the Forsaken allow warlocks?", next = "forsaken" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "That's what they say in Dalaran, usually just before they ask me how it's done. The arcane bends the world, and my craft invites things into it, and I've always thought mine the more honest arrangement." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "If you were Kirin Tor, you'll know Kel'Thuzad was once a respected member, and he learned his necromancy right under their noses. I wouldn't throw stones about manners, if I were Dalaran." },
      },
      choices = {
        { text = "Dalaran's rules kept worse things out, Boch.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dalaran's rules were mostly vanity, Boch.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Isn't commanding demons dangerous, though?", next = "danger" },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Potions, for anyone who can pay, because a potion doesn't care what you believe or how tired the priest is. Still, I've watched a prayer finish what my bottles started, so I'll not quarrel with you too loudly." } },
      choices = {
        { text = "Prayer reaches what bottles can't. Both have their place.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bottles are honest. Prayer is a guess.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Healing draughts first, and a strength elixir if you can afford one, though I'd rather you kept your coin for the draughts. Peacebloom and silverleaf are all you need for the basics, and they grow by the roads if you can be bothered to look." } },
      choices = {
        { text = "I'll carry draughts, Carolai, and learn to brew them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll take my chances. Draughts are for the timid.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Peacebloom and silverleaf along the roads, and earthroot in the hills if you're lucky, which is enough for a healing draught or two. You'll need those draughts more than most, so don't walk past them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} won't care for the smell of my workroom, I'm afraid. Still, you'll pass peacebloom and silverleaf on every road you hunt, and earthroot in the hills, which is enough for a draught or two." },
      },
      choices = {
        { text = "I'll pick only what I need, and leave the rest to grow.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll strip every patch I find. Herbs grow back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do, and they don't ask what's in them, which is how I like it. A minor healing potion is a minor healing potion, whether it's for a warlock, a warrior or a dead man who can't feel his own arm, and the apothecaries make far too much fuss about it." },
      },
      choices = {
        { text = "Then I'll buy healing draughts for the recruits too.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll buy for myself. The recruits can fend for themselves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Carolai Anise, and I teach alchemy here in Brill. Healing draughts, mostly, and other useful brews, since the dead need medicine as much as the living do." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You'll heal with spirit waters, I expect, and I'd like to know whether they work as well on the dead as my draughts do." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Then you know peacebloom from silverleaf, at least, which puts you ahead of most of my students." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll come back cut up more than the rest, so do yourself a favour and carry healing draughts, not just bandages." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! You'll pass more herbs in a day than my students find in a week, so keep your eyes on the ground now and then." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, then you'll know that a healing potion and a healing prayer both work better on a patient who's been told to sit still." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Do you need potions, or just a quiet corner to read in? I've both, and I'd rather sell potions." },
      },
      choices = {
        { text = "Are potions or prayers better medicine, Carolai?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your potions work on the living, Carolai?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you pick herbs from the plagued fields, Carolai?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "How is alchemy different from the apothecaries?", next = "apothecary" },
        { text = "Where do you find herbs here?", next = "herbs" },
        { text = "Do rogues come to you for more than potions, Carolai?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Alchemy's just slow magic, isn't it, Carolai?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What should a warrior carry from your shelves, Carolai?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What herbs grow out where I hunt, Carolai?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do warlocks use your potions, Carolai?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They come for poisons, mostly, and I send them to the apothecaries, who are happy to talk for an hour about each one. I make medicine, and if a rogue wants a healing draught for after the knife work, I'll gladly teach them to brew it." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I knew plenty of rogues in the capital, and every one of them could have saved himself a scar with a decent salve. Learn the herbs, and you'll keep more of your skin than your teachers did." },
      },
      choices = {
        { text = "Medicine first, then. A wise rogue heals.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Poison wins fights; salves just clean up after.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "How is alchemy different from the apothecaries?", next = "apothecary" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Slow magic that anybody can do with patience and a steady hand, which is rather the point. A mage's spell is gone when the mage is gone, but a good potion sits on the shelf and waits for whoever needs it." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran's alchemists looked down on village folk who made tinctures without a word of the arcane, and now Dalaran hides under a dome in the hills while my tinctures still work. Make of that what you will." },
      },
      choices = {
        { text = "Patience is a mage's virtue too, Carolai.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A spell is quicker, and I prefer quick.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where do you find herbs here?", next = "herbs" },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Some of it can, though it stings the poor dears like nettles, and the shadow-priests' mending is gentler on the dead. I stitched the living for twenty years, and I'll take any healing that works, whatever voice it answers to." } },
      choices = {
        { text = "Whatever heals them is worth using, Neela.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light hurts us. Leave it to the living.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "You don't, dear, not in the middle of it, so you step back when there's a breath and wrap it tight and quick. The dead can't feel how badly they're hurt, so check yourself after every scrap, whether it smarts or not." } },
      choices = {
        { text = "I'll check after every fight, Nurse. I promise.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll bleed later, Nurse. The fight comes first.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Now and then, dear, when a hunter carries one in and asks nicely, though a hurt animal doesn't understand you're helping, so it's mostly patience and a firm grip. Keep your beast fed and rested, and it'll mend faster than either of us." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Now and then, dear, and I'd tend {pet} if it came to that, though a hurt animal doesn't understand you're helping. Keep it fed and rested, and it'll mend faster than either of us." },
      },
      choices = {
        { text = "I'll look after it, as it looks after me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "It's a beast, Nurse. It'll heal or it won't.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because if you're one of us you can't feel it when you're hurt, and you'll be the last to know you're bleeding, dear. And if you're living, well, the Scarlets shoot at you too, so learn to tie a bandage, and tie it tight." },
      },
      choices = {
        { text = "I'll learn, and bandage others too.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll learn, but I bandage myself first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Nurse Neela, and I teach first aid to anyone who wants to learn it. A bandage in your pack is worth more than a priest who's busy somewhere else." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, dear? I'm told you can mend a wound with a word, which would put me out of work, so do be quiet about it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, dear? Sit down and let me see those paws, or hands, whichever you're using today." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, dear? Then you'll need bandages more than anyone, so come and learn before you bleed out somewhere I can't reach you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, dear? Your beast will come back cut up too, I expect, and I've stitched a wolf or two in my time, though they never thanked me." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Bless you for coming, because half of Brill walks around with wounds they can't feel, and I could use another pair of hands that know how to close them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage, dear? You'll want to learn to bind a wound, because conjured water won't stop the bleeding." },
      },
      choices = {
        { text = "Can the Light still heal Forsaken flesh, Nurse?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Would you teach me bandages, Neela, though spirits heal me?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you ever stitch up the living, Neela?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Teach me first aid.", next = "BUSINESS" },
        { text = "Were you a nurse in life too?", next = "past" },
        { text = "How do you bandage the dead?", next = "dead" },
        { text = "I come back cut up most nights, Nurse.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My demon took a bite out of me, Neela.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "How do I patch myself up in a fight, Nurse?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do you ever mend beasts, Nurse?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why should a mage learn first aid, Neela?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you'd best learn to stitch yourself, since you clearly don't intend to stop doing whatever it is you do. The dead don't bleed much, but a deep cut still lets the rot in, and rot is harder to mend than any wound." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I patched up a few cutpurses in life, and they always swore they'd tripped over something. You may tell me you tripped too, if you like; I'll stitch you all the same." },
      },
      choices = {
        { text = "I'll learn to stitch myself, Nurse.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep going out, cuts and all.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How do you bandage the dead?", next = "dead" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They do that, I'm told, and after the warriors it's the warlocks I see most often. Hold still and let me look, because a bite from something out of the Nether doesn't close the way a dog's does." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "I spent my life closing wounds, and you've made a habit of opening doors that ought to stay shut. I'll patch you, of course, but I'd like it known that I disapprove." },
      },
      choices = {
        { text = "Fair enough. Patch me and I'll be careful.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Disapprove all you like. I'll keep summoning.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Were you a nurse in life too?", next = "past" },
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
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "One or two of them still shy at a church bell, which is a funny thing in a horse with no ears to speak of. I like to think it's the ones that pulled the carts to Sunday service, and I keep them away from the chapel road for their own sake." } },
      choices = {
        { text = "That's kind of you, Zachariah. They earned their rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're bones, Zachariah. Don't be sentimental.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Into it, through it and out the other side, because they've nothing left to fear and nothing left to lose. A living horse bolts when the Crusade's arrows fly, but mine just keep walking, which is a comfort when you're the one on top." } },
      choices = {
        { text = "A mount that never bolts is a soldier's best friend.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather a beast with some sense of danger.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Keep up? It'll run all night without a breath, and the deer never hear it coming because it doesn't pant. The only trouble is the smell, which spooks some game, so ride downwind and you'll do fine." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep up? It'll run all night, and your {pet} will tire long before it does. The only trouble is the smell, which spooks the deer, so ride downwind and you'll do fine." },
      },
      choices = {
        { text = "Living beasts for me, Zachariah. The dead should rest.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A mount that never tires is worth any smell.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "To a Forsaken mage, gladly, and to a troll once the Undercity's said yes, which it does slowly. They never tire, never need feeding and never mind a mage's cold, which a living horse certainly would." },
      },
      choices = {
        { text = "I'll earn the Undercity's trust, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Respect's a slow road. I'll find my own way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Zachariah Post, and I sell undead horses to the Forsaken of Brill. They don't eat, they don't sleep, and they don't spook at a bit of plague, which is more than you can say for a living horse." },
        { id = "h_other", when = { ["not"] = { race = "Scourge" } }, text = "Zachariah Post, and I sell undead horses, mostly to the Forsaken. You're not one of us, so I'll be honest and say you'd need to earn the Undercity's respect before I'll sell you one." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll have your own mounts back in Durotar or Mulgore, I expect, and I won't pretend my horses are as warm to sit on." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, looking at my horses with that face. Yes, they're dead, and no, they don't mind it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll want a mount that doesn't flinch when the swords come out, and mine never flinch at anything." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll be comparing my horses to your beasts, I expect, so I'll tell you now that mine don't need feeding and never wander off." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! My horses don't need blessing, mind, since they're past all that, but I'll not stop you if you want to try." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! You'll teleport home, I suppose, but a skeletal horse goes where your spells don't." },
      },
      choices = {
        { text = "Do your horses remember what they were, Zachariah?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your horses mind a shaman on their backs, Zachariah?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Shouldn't these horses be allowed to rest, Zachariah?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your horses.", next = "BUSINESS" },
        { text = "Where do the horses come from?", next = "where" },
        { text = "Why are they better than living horses?", next = "better" },
        { text = "A skeletal horse must be quiet on the road.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Warlocks summon their own steeds, Zachariah.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Will your horses carry a warrior into a fight, Zachariah?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Can a dead horse keep up on the hunt, Zachariah?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Would you sell a horse to a mage, Zachariah?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
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
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Quiet as a grave, which is near enough what it is, and it never snorts or whinnies when you'd rather it didn't. I've sold a fair few to deathstalkers for that very reason, though they never tell me where they're riding." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "A Forsaken cutpurse on a dead horse is about the quietest thing on the Tirisfal roads, aside from a Crusade patrol that's already seen you. You'll be wanting one, I think." },
      },
      choices = {
        { text = "I ride to strike unseen. Quiet suits me.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I ride openly, Zachariah. Let them see me coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why are they better than living horses?", next = "better" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "So I've heard, and very fine they are, all fire and fel, but they vanish when you're done and mine are still here in the morning. When your summoning fails you on the road to the Bulwark, you'll think of me kindly." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc who'd rather summon a horse than ride a wolf is a thing I never expected to see in Brill. Mine don't bite, either, which is more than your people's wolves can promise." },
      },
      choices = {
        { text = "A beast in the stable is wise, I'll admit.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll rely on my own summoning, Zachariah.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Where do the horses come from?", next = "where" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, friend. I only know horses, and dead ones at that." } },
  },
}
