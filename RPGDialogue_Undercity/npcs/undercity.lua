-- The Undercity. Voice: bibles/undercity.md
-- Varimathras's later betrayal and the Society's real plans stay unspoken: arrogance and
-- irony only. Nothing here is later than Year 1.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sylvanas", id = TODO_NPC("Lady Sylvanas Windrunner"), name = "Lady Sylvanas Windrunner",
  bible = "bibles/undercity.md", role = "noble", tier = "major",
  communities = { "undercity" }, temper = { "cold" }, values = { "proud", "vengeful" },
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "The Dark Lady speaks with the patience of someone who has all the time in the world and none of the forgiveness. When she names Arthas, the cold in her voice goes deeper still.",
    third = "{name} stood before Lady Sylvanas Windrunner, the Dark Lady and queen of the Forsaken, in the Royal Quarter of the Undercity.",
  },

  greetings = {
    { id = "g_queen", text = "Before you stands the Dark Lady. Kneel if you like; I won't insist, not today." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "One of my own. You were taken, and you took yourself back; never forget that, because I don't." },
    { id = "g_back", when = { metBefore = true }, text = "Once more you come to me. Speak, then; I have little patience, but I have a great deal of time." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the Undercity endured without you, as it endures everything. Speak, then, and tell me what you saw above." },
    { id = "g_away_long", when = { away = { min = 60, levels = 5 } }, text = "It has been {away} since you last came before me, and you return far more dangerous than you left. That pleases me, because the Forsaken have need of dangerous servants." },
    { id = "g_word_helped", when = { word = "helped" }, text = "My people tell me you have served the Undercity well. I remember those who serve me, and I remember those who don't." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told one of your lies was seen through in my city. Lie to my subjects if you must, but never think to lie to me." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living ally. The Horde has been useful to us, and I trust it remains so; tell your Warchief I said as much." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Your elders spoke for us when no one else would, and I don't forget a debt. I don't always repay one, but I don't forget it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST", race = "Scourge" },
      text = "A priest who still prays, and to what, I wonder? Whatever answers you, use it on our enemies." },
  },

  start = "hello",
  nodes = {
    xpt_sylvanas = {
      big = true,
      lines = { { id = "xpt_sylvanas_default", text = "Nothing about the living troubles me any longer, except how quickly they forget. The Horde took us in because we hate the Scourge, and I'm content with that arrangement so long as every one of Thrall's people remembers who stands between Lordaeron's plague and their borders." } },
      choices = {
        { text = "The Forsaken have earned their place in the Horde, my lady.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Horde owes you nothing. You need it more than it needs you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What do you want from the Horde, my lady?", next = "xpt_sylvanas2" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    xpt_sylvanas2 = {
      lines = { { id = "xpt_sylvanas2_default", text = "Time, and room to work, and the Lich King's head on a spike above the gates of this city. Thrall gives me the first two well enough, and the third I will take for myself." } },
      choices = {
        { text = "Then I hope you get it, my lady.", next = "BACK" },
      },
    },
    xcl_strat = {
      big = true,
      lines = { { id = "xcl_strat_default", text = "Then the Baron has rejoined his master's servants in the only way left to him, and the city where Arthas began has one less of his creatures in it. I take no joy in ruins, but I take a great deal in seeing his work undone, one stone at a time." } },
      choices = {
        { text = "I serve your vengeance, my lady, and I'll serve it again.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I did it for my own reasons, not for your vengeance.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Did you ever see Stratholme, before the plague?", next = "xcl_strat2" },
      },
    },
    xcl_strat2 = {
      lines = { { id = "xcl_strat2_default", text = "Once, on an errand from Silvermoon, and I thought the humans built their cities too close together and far too loud. I would give a great deal to find it loud again, and I am not in the habit of saying what I would give." } },
      choices = {
        { text = "Then I won't ask what you'd give, my lady.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That they hold when the Scourge comes, and hold again when it comes back, because Arthas never tires and neither may we. Loyalty I expect, {class}, but endurance is what I will remember." } },
      choices = {
        { text = "I will hold, my lady, for as long as it takes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll hold for the Forsaken, my lady, not for orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "To be patient, to be unseen, and never to let the quarry choose the ground. I taught them that myself, and most of them died on the road to Silvermoon when Arthas came, so learn it better than they could." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "To be patient and unseen, and never to let the quarry choose the ground. Your {pet} knows that by instinct, which is more than I could say for many of my rangers." },
      },
      choices = {
        { text = "I'll hunt as your rangers did, my lady, with patience.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I hunt my own way, my lady, as I always have.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_living", tags = { "news" }, when = { party = { race = { "Orc", "Troll", "Tauren" } } },
          text = "You walk with the living, I see, and {companion} doesn't keep a hand on their weapon around you. Treasure that while it lasts, because the warmth goes out of most alliances long before it goes out of the body." },
        { id = "h_default", key = true,
          text = "I am Sylvanas Windrunner, once Ranger-General of Silvermoon and now queen of the Forsaken. Arthas made me this, and one day I will show him what he made." },
        { id = "h_cl_strat", tags = { "news" }, when = { cleared = "Stratholme", faction = "Horde" },
          text = "Stratholme's masters have fallen, and my rangers tell me you walked out of its gates when others did not. Arthas began his crimes in that city, and I am glad to hear it has finally been made to answer." },
        { id = "h_zygand", when = { heardLine = "zygand.h_default" },
          text = "Zygand holds Tirisfal against the Crusade, and good; the zealots should learn that the dead have long memories." },
        { id = "h_hamuul", when = { heardLine = "hamuul.h_default" },
          text = "The tauren Arch Druid spoke for the Forsaken before the Horde, when the orcs would have turned us away. Remember that, when you hear the tauren speak of balance." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Thrall's people speak of spirits and of balance, and I have heard enough of spirits to last me the rest of my long existence." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the tauren. Your Arch Druid spoke for my people before the Horde, and I have not forgotten it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The Forsaken need blades that do not break, and I will learn soon enough whether yours is one of them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. I led the rangers of Quel'Thalas once, and I still know an archer by the way they carry their shoulders." },
      },
      choices = {
        { text = "Do the spirits trouble you, my lady?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do you want from the tauren, my lady?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What do the Forsaken want?", next = "want" },
        { text = "Tell me about Arthas.", next = "arthas" },
        { text = "I carry the Light, my lady, though it burns.", next = "paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "I still pray to the Light, my lady.", next = "priest", when = { race = "Scourge", class = "PRIEST" } },
        { text = "I'd serve you as a knife in the dark, my lady.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I served the Cult once, before the end.", next = "cult", when = { race = "Scourge", class = "WARLOCK" } },
        { text = "My people spoke for yours. Was it a mistake?", next = "tauren", when = { race = "Tauren" } },
        { text = "My spells are yours, my lady.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "You must ask a great deal of your warriors, my lady.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What did the rangers of Quel'Thalas teach their hunters, my lady?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Stratholme has fallen silent, my lady. I saw to it.", next = "xcl_strat", when = { cleared = "Stratholme", faction = "Horde" } },
        { text = "My companion is living. I'd guess that troubles you, my lady.", next = "xpt_sylvanas", when = { party = { race = { "Orc", "Troll", "Tauren" } } } },
        { text = "Tell me of your kingdom, my lady.", next = "kingdom" },
        { text = "How did you break free of the Lich King?", next = "past" },
        { text = "You don't seem to think much of the Horde, my lady.", next = "horde" },
        { text = "What would you have of me, my lady?", next = "ask_me" },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 2 } },
      },
      again = {
        { id = "h_again", text = "You have more to say. Say it." },
        { id = "h_again2", text = "Go on. I'll tell you when I've heard enough." },
      },
    },
    paladin = {
      big = true,
      lines = {
        { id = "pa_default", text = "So I'm told. The Light that let Arthas march into Quel'Thalas with a paladin's hammer, and now it answers to my people too. I find that more amusing than holy, but if it burns the Scourge, carry it, and let it hurt." },
        { id = "pa_knight", when = { origin = "forsaken_risen_knight" },
          text = "Silver Hand. Arthas wore your order's colours when he came for my people, and you wore them when he came for you. Remember that, every time it burns." },
      },
      choices = {
        { text = "The Light is mine, not his. I'll prove it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's a weapon, my lady. I'll aim it at him.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "Does it trouble you that it still answers us?", next = "paladin_trouble" },
      },
    },
    paladin_trouble = {
      lines = { { id = "pt_default", text = "Trouble me? Nothing that answers the Forsaken troubles me, so long as it answers. What troubles me is anything my people love more than they love their freedom, so don't come to love it too much." } },
      choices = { { text = "I won't, my lady.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = { { id = "pr_default", text = "Do you? The Light watched Silvermoon burn and lifted no finger, and it watched every one of us die. Pray if it comforts you, but when it fails you again, the shadows will still be here, and so will I." } },
      choices = {
        { text = "It hasn't failed me yet, my lady.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. I'll turn to the shadow.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Everyone in my city serves from the shadows, one way or another. Go to the deathstalkers; they need knives that don't hesitate, and they'll tell me whether yours does." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "You're already one of them, I see. Good. My deathstalkers are my eyes in Silverpine and Hillsbrad, and I want to know everything they see, before anyone else does." },
      },
      choices = { { text = "Before anyone else. Understood.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll keep some secrets for myself, my lady.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } } },
    },
    cult = {
      big = true,
      lines = { { id = "cu_default", text = "Then you knelt to Kel'Thuzad, and you helped spread the plague that made us all. Many of my people would hang you in the Apothecarium for that, and I'm not certain they'd be wrong. Tell me why I shouldn't." } },
      choices = {
        { text = "Because I know how the Scourge thinks. Use me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I owe no one apologies. Least of all the dead.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
        { text = "I have no reason, my lady. Only regret.", next = "cult_regret" },
      },
    },
    cult_regret = {
      lines = { { id = "cr_default", text = "Regret is a luxury of the living. Make it useful instead: the Cult still crawls in the north, and you know their signs. Bring me their names." } },
      choices = { { text = "You'll have their names.", next = "BACK", fx = { affinity = 2 } } },
    },
    tauren = {
      lines = { { id = "ta_default", text = "That depends on what your elders hoped to gain. Cairne speaks of a cure, and I let him, because his hope bought us a seat in the Horde. If he finds one, I'll consider it. Until then, the debt stands, and I'm aware of it." } },
      choices = {
        { text = "He means it, my lady. There's no bargain in it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "And if there is no cure?", next = "tauren_nocure" },
      },
    },
    tauren_nocure = {
      lines = { { id = "tn_default", text = "Then we'll be what we are, and the tauren will have to decide whether they can bear us. I suspect they can; they bore the orcs." } },
      choices = { { text = "...", next = "BACK" } },
    },
    want = {
      big = true,
      lines = {
        { id = "w_default", text = "A home no one can take from us, and freedom from the Lich King's voice. And his ruin, slowly, piece by piece. Is that so much, after what was done to us?" },
      },
      choices = {
        { text = "It isn't.", next = "BACK", fx = { affinity = 2 } },
        { text = "And after that?", next = "after" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "After that is my concern. Yours is to be useful, and you have been, so far." } },
      choices = { { text = "...", next = "END" } },
    },
    arthas = {
      lines = { { id = "ar_default", text = "He burned my people's forests and murdered them in their homes, and then he made me watch, as this. I'll say no more of it, not to you and not to anyone." } },
      choices = {
        { text = "...", next = "END" },
        { text = "What do you remember of Quel'Thalas?", tag = "Persuade", next = "quelthalas",
          check = { pass = { any = { { disposition = { min = 70 } }, { race = "Scourge", disposition = { min = 55 } }, { class = "HUNTER" } } } },
          fail = { next = "quelthalas_no", fx = { affinity = -1 } } },
      },
    },
    quelthalas = {
      lines = {
        { id = "q_default", text = "You are persistent, and today I find I don't mind it. I remember the forests of Eversong, gold even in winter, and my rangers in the trees at the Elfgates, holding them for as long as we could. I remember every one of their names. The dead sleep poorly, and so we do not get to forget." },
        { id = "q_hunter", when = { class = "HUNTER" },
          text = "You carry a bow, so perhaps you'll understand. I was Ranger-General, and my rangers fought him from every tree between the Elfgates and Silvermoon. Some mornings I still reach for a quiver that isn't there." },
      },
      choices = {
        { text = "Thank you for telling me.", next = "BACK", fx = { affinity = 1 } },
        { text = "He'll answer for all of it.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    quelthalas_no = {
      lines = {
        { id = "qn_default", text = "That is not yours to ask. I told you I would say no more, and I meant it." },
        { id = "qn_presume", text = "You presume. Many have, and none of them presumed twice." },
      },
      choices = { { text = "Forgive me, my lady.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I was one, for a time, bound and wailing at Arthas's heel, and nothing about that time was balanced. Turn your elements on the Scourge and I will call you an ally, but do not speak to me of harmony with the dead, because the dead in this city have had their fill of other people's harmony." } },
      choices = {
        { text = "The Scourge, then. My elements will answer for your people.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Balance is the Horde's way, my lady, whether it suits you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Their voice in the Horde, and their patience, which they have in greater supply than the orcs. They speak of healing us, and I let them, because a people who wish to heal you will rarely wish to burn you; whether I wish to be healed is a question for another day." } },
      choices = {
        { text = "Their hope is honest, my lady. Don't spend it cruelly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Use their hope, then. The Forsaken need allies.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Spells I have, from the many Dalaran mages who woke in the dark beside me and chose freedom over the Scourge. What I lack are mages who see past the Kirin Tor's pretty new towers to the city that let Kel'Thuzad walk its halls." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "You studied among the Kirin Tor and died for it, as so many did, and now you serve the one who freed you. Remember that, mage, when your old masters whisper that you still belong to them." },
        { id = "xmage_troll", when = { race = "Troll" }, text = "The Darkspear send me mages now, and I find I respect a people who know what it is to lose a homeland. Burn the Scourge for me, troll, and we will understand each other well enough." },
      },
      choices = {
        { text = "I serve you, my lady, and not Dalaran.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I serve my own studies first, my lady.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "What do the Forsaken want, my lady?", next = "want" },
      },
    },

    -- 0.71.0 depth pass: her kingdom, her breaking free, the Horde, and what she asks.
    kingdom = {
      hub = true,
      lines = { { id = "kg_default", text = "A kingdom of the dead beneath the ruins of a kingdom of the living, and I find the arrangement suits us. Ask what you need to know, though I warn you that I will decide how much of it you need." } },
      again = {
        { id = "kg_again", text = "What else of my kingdom? Be quick about it." },
        { id = "kg_again2", text = "Go on. My kingdom runs well past these walls, and I watch all of it." },
      },
      choices = {
        { text = "Varimathras seems an odd servant for you.", next = "varimathras" },
        { text = "What do the apothecaries brew, my lady?", next = "apothecarium" },
        { text = "What of the Scarlet Crusade?", next = "scarlet" },
        { text = "What of Silverpine and Hillsbrad?", next = "silverpine" },
        { text = "Enough of your kingdom, my lady.", next = "hello" },
      },
    },
    varimathras = {
      lines = { { id = "va_default", text = "A dreadlord who ruled these ruins with his brothers while I was still learning to be free, and who begged for his life when I came for them, which is more than his brothers had the wit to do. He knows every passage beneath this city and every secret of the Legion that made the Scourge, and so he lives, and serves, and calls me his queen very prettily." } },
      choices = {
        { text = "I'd not trust a demon, my lady.", next = "varimathras2" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    varimathras2 = {
      lines = { { id = "va2_default", text = "I trust that he fears me, and I trust that he knows what the Legion does to servants who fail it, so for now his interests and mine run side by side. A demon's loyalty is a blade without a hilt, and it is useful only so long as you never forget how to hold it." } },
      choices = {
        { text = "I'd watch him closely, my lady.", next = "BACK", fx = { trait = { cautious = 1 }, opinion = { varimathras = "distrust" } } },
        { text = "He seems to serve you well enough.", next = "BACK", fx = { opinion = { varimathras = "trust" } } },
      },
    },
    apothecarium = {
      lines = { { id = "ap_default", text = "A new plague, made in the Apothecarium by Master Faranell and his society to do to the Scourge what the old plague did to us. The Lich King made us with a plague, and I find it fitting that we should answer him with one of our own.", fx = { learn = { "new_plague" } } } },
      choices = {
        { text = "A plague would frighten most rulers, my lady.", next = "apothecarium2" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    apothecarium2 = {
      lines = { { id = "ap2_default", text = "Fear is for those who can still die of it, and every Forsaken in this city has already done that. It is a weapon against the Scourge and nothing else, and it will stay in hands I trust, so tell me, does it frighten you?" } },
      choices = {
        { text = "Yes. A plague doesn't care whose it is.", next = "BACK", fx = { trait = { cautious = 1 }, opinion = { new_plague = "dangerous" } } },
        { text = "No. The Scourge deserves every drop of it.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 }, opinion = { new_plague = "necessary" } } },
        { text = "Only if it falls into the wrong hands.", next = "apothecarium3", fx = { trait = { skeptical = 1 } } },
      },
    },
    apothecarium3 = {
      lines = { { id = "ap3_default", text = "Then we agree, which should comfort you, and it is why my deathstalkers guard the Apothecarium as closely as they guard me. The Alliance would give a great deal to know what Faranell keeps in his cellars, and they will never learn it." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    scarlet = {
      lines = {
        { id = "sc_default", text = "Zealots who survived the plague and decided the Light had spared them to burn everything that moves wrongly, which in Tirisfal means us. They hold the monastery in the north of these glades and Hearthglen beyond, and they kill my people with the same fervour they save for the Scourge, because they cannot tell us apart and do not care to.", fx = { learn = { "scarlet_crusade" } } },
        { id = "sc_priest", when = { origin = "forsaken_chapel_priest" }, text = "You preached the same Light they burn us in the name of, and I suspect you knew some of them, which makes them your concern more than most. They hold the monastery in the north of these glades and kill my people as gladly as they kill the Scourge.", fx = { learn = { "scarlet_crusade" } } },
      },
      choices = {
        { text = "Should they be shown mercy, my lady?", next = "scarlet2" },
        { text = "I knew some of them, in life.", next = "scarlet_knew", when = { origin = { "forsaken_lordaeron_soldier", "forsaken_chapel_priest", "forsaken_risen_knight" } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    scarlet2 = {
      big = true,
      lines = { { id = "s2_default", text = "Mercy is a word the living use once they've already won, and the Crusade has never offered it to us. Some of my people would spare the ones who lay down their swords and some would drown every zealot in the canals, and I am curious which kind you are." } },
      choices = {
        { text = "Spare those who yield, my lady. We're better than them.", next = "BACK", fx = { align = { light = 1 }, opinion = { scarlet_crusade = "mercy" } } },
        { text = "They chose their war. Let them have all of it.", next = "BACK", fx = { affinity = 1, align = { light = -1 }, opinion = { scarlet_crusade = "hardline" } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    scarlet_knew = {
      lines = { { id = "sk_default", text = "Of course you did, because half that Crusade once marched beside the other half of my city under Terenas's banner, before the plague sorted them into the quick and the dead. If you meet an old comrade at the monastery gates, remember which of you he would burn, and do not hesitate." } },
      choices = {
        { text = "I won't hesitate, my lady.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "I'll hesitate, and then I'll do it anyway.", next = "BACK", fx = { trait = { honest = 1 } } },
      },
    },
    silverpine = {
      lines = { { id = "sv_default", text = "My deathstalkers hold the Sepulcher in Silverpine against the worgen the mage Arugal called down on us, and High Executor Darthalia carries my war into Hillsbrad against the humans of Southshore. The living there believe the war ended when Lordaeron fell, and I am teaching them otherwise, one farm at a time." } },
      choices = {
        { text = "Why war on Hillsbrad's farmers, my lady?", next = "hillsbrad" },
        { text = "Who was Arugal?", next = "arugal" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    hillsbrad = {
      lines = { { id = "hb_default", text = "Because Hillsbrad sits on Lordaeron's land and sends its militia north to hunt my scouts, and because the Alliance would gladly use it as a door into my kingdom. They are not innocent simply because they are alive, and those farms once belonged to people who are now my subjects." } },
      choices = {
        { text = "They're still people, my lady.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
        { text = "Then take the land back.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    arugal = {
      lines = { { id = "ag_default", text = "An archmage the Kirin Tor sent to deal with my people, who called worgen out of the shadows to do it and lost his wits to them in Shadowfang Keep. He sits there still among his wolves and calls them his children, and the fact that Dalaran sent him tells you everything you need to know about Dalaran." } },
      choices = {
        { text = "I knew Arugal's name in Dalaran, my lady.", next = "arugal_dal", when = { origin = "forsaken_dalaran_apprentice" } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    arugal_dal = {
      lines = { { id = "agd_default", text = "Then you'll know he was brilliant, and that his brilliance did not save him from himself, which is a lesson every mage in my Magic Quarter should learn. Speak to Dalar Dawnweaver at the Sepulcher if you'd like to hear someone curse him properly, because Dalar knew him rather better than you did." } },
      choices = { { text = "I'll find him, my lady.", next = "BACK", fx = { affinity = 1 } } },
    },
    past = {
      hub = true,
      lines = { { id = "ps_default", text = "I served Arthas as a banshee, bound to him and wailing at his heel, until the day his hold on us faltered and I found I could think my own thoughts again. Ask about it if you like, though some of my answers will be shorter than others." } },
      again = {
        { id = "ps_again", text = "What else of those days? Choose carefully." },
        { id = "ps_again2", text = "Ask, then. I may even answer." },
      },
      choices = {
        { text = "How did you break his hold?", next = "freedom" },
        { text = "Someone must have held Lordaeron when you woke.", next = "dreadlords" },
        { text = "Did you ever face Arthas again?", next = "ambush" },
        { text = "Do you remember your family, my lady?", next = "family", when = { disposition = { min = 65 } } },
        { text = "Enough of the past, my lady.", next = "hello" },
      },
    },
    freedom = {
      lines = {
        { id = "fr_default", text = "His power waned for reasons I have never learned, and the chains slackened, and I was the first to slip them because I had been waiting for nothing else. I gathered every one of the dead who woke beside me with their own minds again, and I named them the Forsaken, because that is what the world had made of us." },
        { id = "fr_scourge", when = { origin = "forsaken_scourge_remembered" }, text = "You remember the time before, as I do, every village and every face, so I'll tell you what I tell myself. His power waned and the chains slackened, and the hand that did those things was yours, but the will was his, and he will answer for both." },
      },
      choices = {
        { text = "Waking must have been strange.", next = "freedom2" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    freedom2 = {
      lines = { { id = "f2_default", text = "It was like standing in a burnt house you once lived in, knowing every room and owning none of them. Most of my people still feel it, and the ones who say they don't are lying, so I let them lie and give them work instead." } },
      choices = {
        { text = "I still feel it, my lady.", next = "BACK", fx = { affinity = 1 }, when = { race = "Scourge" } },
        { text = "Then the work keeps you from thinking.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    dreadlords = {
      lines = { { id = "dl_default", text = "Three dreadlords of the Legion, left behind to rule the ruins, and they thought me a useful servant who'd forgotten to stay dead. I turned them against each other, and I allied with a human called Garithos, a Grand Marshal of the Alliance's leftovers who hated elves as much as he hated the dead, and together we drove the demons out of the capital." } },
      choices = {
        { text = "And what became of Garithos?", next = "garithos" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    garithos = {
      lines = { { id = "ga_default", text = "He wanted Lordaeron for the humans and made no secret of it, and I wanted it for the Forsaken, so the moment the last dreadlord fell I had him killed where he stood. I don't regret it, and if you think less of me, remember that he would have done the same to me a day later." } },
      choices = {
        { text = "You broke your word to him, my lady.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 }, opinion = { garithos = "betrayed" } } },
        { text = "He'd have betrayed you first.", next = "BACK", fx = { affinity = 1, trait = { practical = 1 }, opinion = { garithos = "deserved" } } },
      },
    },
    ambush = {
      lines = { { id = "am_default", text = "Once, when he passed back through Lordaeron on his way north to his master, weakened and with his own creatures turning on him. I put a poisoned arrow in him, and Kel'Thuzad's servants dragged him away before it could finish its work, and I have spent a great many nights thinking about how close it came." } },
      choices = {
        { text = "You'll have another chance, my lady.", next = "ambush2" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    ambush2 = {
      lines = {
        { id = "am2_default", text = "I intend to make one, though not yet, because he sits in Northrend on a throne of ice and the Forsaken are not strong enough to reach him. So we will grow stronger, and we will take the Plaguelands back from his servants a stone at a time, until there is nowhere left for him to hide but that throne." },
        { id = "am2_hunter", when = { class = "HUNTER" }, text = "I intend to make one, and you'll understand that a hunter who misses once does not throw away her bow. He sits in Northrend now, out of reach, so we will take the Plaguelands from his servants a stone at a time until there is nowhere left for him to hide." },
      },
      choices = {
        { text = "I'll be there when you do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "fm_default", text = "You presume, but you've been useful enough to presume once. I had sisters and a brother, and a mother who kept a house in Eversong I could have found blindfolded, and I won't tell you their names, because they belong to a woman who died at the Elfgates and I prefer to leave them with her." } },
      choices = {
        { text = "Then I won't ask again, my lady.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Someone should remember them.", next = "family2", fx = { trait = { kind = 1 } } },
      },
    },
    family2 = {
      lines = { { id = "fy2_default", text = "Someone does, every hour of every night, and that is quite enough remembering for one family. Go on, now, before I decide you've seen more of me than you've earned." } },
      choices = { { text = "As you wish, my lady.", next = "BACK" } },
    },
    horde = {
      lines = {
        { id = "ho_default", text = "The Horde is an arrangement, and a better one than I expected, because Thrall keeps his word and asks very little of us except that we keep ours. The orcs look at my people the way the living look at a grave, and I don't blame them, but they took us in, and I remember it." },
        { id = "ho_living", when = { race = { "Orc", "Tauren", "Troll" } }, text = "You're one of them, so I'll be careful, though not so careful that I'll lie to you. The Horde took us in because the tauren asked, and I know precisely how much that kindness weighed against our usefulness." },
      },
      choices = {
        { text = "What do you really think of Thrall?", tag = "Persuade", next = "thrall_truth",
          check = { pass = { any = { { disposition = { min = 70 } }, { origin = "forsaken_deathstalker_recruit", disposition = { min = 55 } }, { trait = "discreet" }, { race = "Scourge", disposition = { min = 60 } } } } },
          fail = { next = "thrall_no", fx = { affinity = -1 } } },
        { text = "And Cairne Bloodhoof?", next = "cairne" },
        { text = "Should the Forsaken trust the Horde?", next = "horde_stance" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    thrall_truth = {
      lines = { { id = "tt_default", text = "Thrall is an honest king, which is rarer than a living one in these parts and a great deal more dangerous to the people around him, because honest kings expect honesty back. He was a slave and remembers it, so he looks at my people and sees chains where I see a weapon, and I have never once corrected him, because his pity has served us better than his respect would." } },
      choices = {
        { text = "Does he know you think this?", next = "thrall_truth2" },
        { text = "I'll keep that to myself, my lady.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
      },
    },
    thrall_truth2 = {
      lines = { { id = "tt2_default", text = "He suspects it, I imagine, because he is not a fool, and he lets it pass because he needs someone between the Scourge and his borders. That is the nature of an alliance, and I would rather have one built on need than on love, because need doesn't wane when the mood changes." } },
      choices = { { text = "Understood, my lady.", next = "BACK" } },
    },
    thrall_no = {
      lines = { { id = "tx_default", text = "The Warchief is our ally, and I speak of him as such to strangers. You will need to be a great deal less of one before I say more." } },
      choices = { { text = "As you say, my lady.", next = "BACK" } },
    },
    cairne = {
      lines = { { id = "ca_default", text = "Cairne and his Arch Druid spoke for my people when the orcs would have left us in the ruins, and the old bull speaks of curing us as though we were sick and not dead. I find him kind, and I've learned to be wary of kind people, but I've never once caught him lying, which is more than I can say of any king I knew in life." } },
      choices = {
        { text = "Do you want to be cured, my lady?", next = "cure" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    cure = {
      lines = { { id = "cz_default", text = "I want what was taken, and a cure won't give that back, because Silvermoon is still ash and my rangers are still dead. Let the tauren search, since their hope costs me nothing, and if they ever find something, I will decide then what I am willing to become." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    horde_stance = {
      big = true,
      lines = { { id = "hs_default", text = "My people ask me that every day in one way or another, and I give them whatever answer keeps them standing. Some tell me the living will turn on us the moment the Scourge is beaten and some tell me we owe the Horde everything, so tell me which you would say." } },
      choices = {
        { text = "The Horde has kept faith, my lady. Keep faith with it.", next = "BACK", fx = { align = { honor = 1 }, opinion = { forsaken_horde = "loyal" } } },
        { text = "Trust only your own, my lady. The living forget.", next = "BACK", fx = { affinity = 1, align = { honor = -1 }, opinion = { forsaken_horde = "wary" } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    ask_me = {
      lines = {
        { id = "ak_default", text = "You ask a great many questions, so now I'll ask one of you. Why does anyone come to the court of the dead and offer to serve it?" },
        { id = "ak_scourge", when = { race = "Scourge" }, text = "You ask a great many questions, so now I'll ask one of you. Why do you serve me, and what do you still remember of your life?" },
      },
      choices = {
        { text = "You're the enemy of my enemy, my lady.", next = "ask_me2", fx = { trait = { practical = 1 } } },
        { text = "Because the Scourge must be destroyed.", next = "ask_me2", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "I remember everything, my lady, and miss none of it.", next = "ask_me_life", when = { race = "Scourge" }, fx = { trait = { stern = 1 } } },
        { text = "I miss the sun, my lady, and my family.", next = "ask_me_life", when = { race = "Scourge" }, fx = { trait = { kind = 1 } } },
        { text = "I remember my barley outside Brill, and feel nothing.", next = "brill", when = { origin = "forsaken_brill_farmer" } },
        { text = "I remember Dalaran's libraries, my lady.", next = "dalaran", when = { origin = "forsaken_dalaran_apprentice" } },
      },
    },
    ask_me2 = {
      lines = { { id = "ak2_default", text = "An honest enough answer, and I've heard worse from people who meant to sell me to the Crusade. What I want of you is simple: go where my deathstalkers cannot, kill what the Scourge sends, and come back and tell me what you saw, because I trust what I hear from people who have no reason to flatter me." } },
      choices = {
        { text = "I'll go, my lady.", next = "BACK", fx = { affinity = 1 } },
        { text = "And what do I get for it?", next = "ask_me_pay", fx = { affinity = -1, trait = { greedy = 1 } } },
      },
    },
    ask_me_pay = {
      lines = { { id = "akp_default", text = "You get to go on being useful to me, which in this city pays better than gold. Ask Varimathras what became of those who stopped being useful, if you can find any of them to ask." } },
      choices = { { text = "Understood, my lady.", next = "BACK" } },
    },
    ask_me_life = {
      lines = { { id = "al_default", text = "Hold on to whatever you have, whether it's memory or the lack of it, because the Lich King took everything else and he would take that too, if you let him. My people are not what they were, but they are not his, and that is the only thing I ask any of them to remember." } },
      choices = { { text = "I'll remember it, my lady.", next = "BACK", fx = { affinity = 1 } } },
    },
    brill = {
      lines = { { id = "br_default", text = "Then you've learned what most of my people take years to understand, that feeling nothing is not the same as being nothing. The fields around Brill are full of the Scourge's leavings now, and one day they'll be ours again, and I'd like someone who remembers what grew there to see it." } },
      choices = { { text = "I'd like that too, my lady.", next = "BACK", fx = { affinity = 1 } } },
    },
    dalaran = {
      lines = { { id = "dn_default", text = "The Kirin Tor's libraries are rubble now, and the Kirin Tor themselves are building pretty new towers and pretending they never let Kel'Thuzad walk their halls. Bethor Iceshard in my Magic Quarter remembers them too, and if you want to know what Dalaran owes us, ask him about his old friend Thule." } },
      choices = { { text = "I'll ask him, my lady.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Little happens in my kingdom that does not reach me, one way or another. Ask, and I will decide how much of it you need." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You have been useful, and I reward usefulness, so ask what you will, and I'll answer more plainly than is my habit." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I will answer you, briefly, and then you will go." },
    },
    scarlet_crusade = { { id = "tp_scarlet", text = "Zealots who burn whatever the Light tells them to, and the Light, as ever, says nothing to stop them." } },
    new_plague = { { id = "tp_plague", text = "My apothecaries' work, and a weapon against the Scourge. Faranell will tell you more than you want to know, if you let him." } },
    syndicate = { { id = "tp_syndicate", text = "Human thieves squatting in the ruins of Alterac's nobility. Those my people catch, they hang, and I sign the orders without reading the names." } },
    argent_dawn = { { id = "tp_dawn", text = "Some of my own sit with the Dawn, and the Dawn has the grace to treat them as allies, which surprises me more than I would like." } },
    scholomance = { { id = "tp_scholo", text = "Kel'Thuzad's old school in Caer Darrow, where the Cult still teaches the living to raise the dead, and I would very much like to see it burn." } },
    _none = { { id = "tp_none", text = "That isn't my concern. Varimathras will tell you if it should be." } },
  },
}

P:NPC {
  key = "varimathras", id = TODO_NPC("Varimathras"), name = "Varimathras",
  bible = "bibles/undercity.md", role = "noble", tier = "major",
  communities = { "undercity" }, temper = { "arrogant" }, values = { "proud" },
  notices = { "class", "fel" },
  impression = {
    first = "Varimathras calls himself the Dark Lady's most loyal servant and says he always chooses wisely. He is courteous in the way a cat is courteous to a mouse.",
    third = "{name} met Varimathras, the dreadlord who serves as majordomo to the Dark Lady in the Undercity.",
  },

  greetings = {
    { id = "g_dread", text = "You may approach, slowly. I serve the Dark Lady, and in her name I suffer visitors." },
    { id = "g_back", when = { metBefore = true }, text = "Returned, have you? The Dark Lady finds you useful, and I find you, shall we say, adequate." },
    { id = "g_away", when = { away = 14 }, text = "Ah, you've been away {away}, and I confess the court was no duller for it. Still, the Dark Lady finds you useful, so welcome back." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear someone in the city swallowed one of your little stories whole. How delightful; perhaps you're more than adequate after all." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "They say you made one of the Dark Lady's subjects tremble. Fear is a currency I understand well, so spend it wisely." },
  },

  notice = {
    { id = "n_warlock", cat = "fel", when = { class = "WARLOCK" },
      text = "A warlock, how charming. You play with the toys of my kind, so do be careful; some of them bite back." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "A paladin, in the Horde? How the world changes, and I find I like it less every year." },
  },

  start = "hello",
  nodes = {
    xpt_varimathras = {
      big = true,
      lines = { { id = "xpt_varimathras_default", text = "Sworn, are you? Oaths are easy things to make in a throne room and hard things to keep in the field, as the Dark Lady learned when Arthas's servants wore her people like puppets. Keep your companions honest, and I'll have no reason to learn their names." } },
      choices = {
        { text = "We keep our oaths. Watch us all you like.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Oaths bend when they must. Surviving comes first.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_cath = {
      big = true,
      lines = { { id = "xcl_cath_default", text = "And how splendidly you managed it. The Crusade believed its faith made it untouchable, and there is nothing quite so instructive as watching a zealot discover she was wrong. The Dark Lady's enemies in Tirisfal have lost their heart, and I shall make certain she remembers whose hand held the knife." } },
      choices = {
        { text = "I did it for the Dark Lady, and for no one else.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I did it for myself. The court can take what credit it likes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What will become of the cathedral now?", next = "xcl_cath2" },
      },
    },
    xcl_cath2 = {
      lines = { { id = "xcl_cath2_default", text = "Why, the Crusade will return to it, as they always do, with fresh recruits and fresh hymns, and we shall have the pleasure of emptying it again. A cause that cannot learn is a cause that can be harvested, and I find that a great comfort." } },
      choices = {
        { text = "Then I'll be ready for the next harvest.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I think they are useful to the Dark Lady, as all her servants are, and I serve her as faithfully as any of you. Pray to whatever you like, little priest, but remember who rules in this city, and that her will is the only one that matters here." } },
      choices = {
        { text = "The Dark Lady has my loyalty, Varimathras.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My faith answers to me, not to any throne.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Far more than you would think, mortal, for the hunt is only patience and appetite, and I have both in abundance. The Dark Lady's enemies never see either coming, which is the part I find most instructive." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Far more than you would think, and your {pet} would agree, if it could speak. The hunt is only patience and appetite, and the Dark Lady's enemies never see either coming." },
      },
      choices = {
        { text = "I hunt for the Dark Lady, Varimathras, not for appetite.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every hunter hungers, dreadlord. Mine's no secret.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_band", tags = { "news" }, when = { party = { size = 4 } },
          text = "A whole band of you, filling my lady's halls with your breathing. I do hope you're all as loyal as you look, because the Dark Lady keeps very careful accounts of who comes and goes." },
        { id = "h_default", key = true,
          text = "You address Varimathras, majordomo to the Dark Lady and her most loyal servant. I keep her city safe from its many enemies, and serve her in all things." },
        { id = "h_deathstalkers", tags = { "news" }, when = { questActive = TODO_QUEST("The Deathstalkers") },
          text = "The Deathstalkers are the Dark Lady's eyes and blades. Go where they send you and do what they ask, and then tell me what they tell you." },
        { id = "h_hillsbrad", when = { questActive = TODO_QUEST("Battle of Hillsbrad") },
          text = "The living cling to Hillsbrad like rats to a ship. Help Darthalia sink it." },
        { id = "h_alliance", when = { questActive = TODO_QUEST("An Unholy Alliance") },
          text = "An alliance between our enemies? How very unholy. Break it before it learns to stand." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Royal Quarter. Your people knelt to my kind once and then changed their minds, which I have always found rather ungrateful." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You smell of grass and wet fur, which is a novelty down here, though not one I'd ask you to repeat." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. I have watched a great many mortal hunters stalk their prey, {class}, and I confess I still find it charming." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, before me. How interesting, because I have watched mortals pray to many things, and I have never once seen those things answer quickly." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Hillsbrad", min = 30 } }, text = "Hillsbrad's farmers and footmen fall before you rather efficiently, I'm told. The Dark Lady will be pleased, and I make a point of remembering those who please her." },
        { id = "h_cl_cath", tags = { "news" }, when = { cleared = "Scarlet Cathedral", faction = "Horde" },
          text = "The High Inquisitor has fallen, and her commander with her, and the Dark Lady was pleased to hear it from my lips before anyone else's. I do so enjoy delivering good news, and you have given me a great deal to deliver." },
      },
      choices = {
        { text = "What do you think of mortal priests, Varimathras?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you miss your hold on my people, dreadlord?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does a dreadlord make of the Emerald Dream?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Your guards are dreadlords, Varimathras. Mine is a shield.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "A dreadlord serving the Dark Lady seems unlikely.", next = "serve" },
        { text = "I command demons too, dreadlord.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "The Light answers me. That must trouble you.", next = "paladin", when = { class = "PALADIN" } },
        { text = "What does a dreadlord make of the arcane?", next = "mage", when = { class = "MAGE" } },
        { text = "I'd serve the Dark Lady from your shadow, Varimathras.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What does a dreadlord know of the hunt, Varimathras?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Whitemane is dead, Lord Varimathras. The cathedral is silent.", next = "xcl_cath", when = { cleared = "Scarlet Cathedral", faction = "Horde" } },
        { text = "We're a company sworn to the Dark Lady's cause.", next = "xpt_varimathras", when = { party = { size = { min = 2 } } } },
        { text = "I'll go.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Still here? How very persistent you are, so ask, then, and be quick about it." },
        { id = "h_again2", text = "Another question. The Dark Lady's servants are endlessly curious, I find." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "You command imps and voidwalkers, the smallest and most grateful of my kind, and you call that commanding. How sweet. Do tell me if anything larger ever answers you; I'd so like to know who it is." },
        { id = "wl_troll", when = { race = "Troll" },
          text = "A troll who whispers into the Nether. Your people's spirits must be terribly jealous. Do tell me what you hear; I may recognize the voice." },
      },
      choices = {
        { text = "I'll tell the Dark Lady first, dreadlord.", next = "BACK", fx = { affinity = -2, align = { order = 1 } } },
        { text = "And if something larger answers, I'll come to you.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
      },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Trouble me? It offends me, which is not the same thing. The Light is so very loud, and it insists on itself everywhere. Do keep it sheathed in my presence, and we'll get along as well as anyone does with me." } },
      choices = {
        { text = "The Light goes where I go, dreadlord.", next = "BACK", fx = { affinity = -2, align = { light = 1 } } },
        { text = "As you wish. I'll keep it sheathed.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    mage = {
      lines = { { id = "ma_default", text = "A clever little tool, the arcane, and the Highborne were so very proud of it once. My kind found their pride most useful. I'd study it with care, if I were you, and wonder now and then who else is reading over your shoulder." } },
      choices = { { text = "I'll keep my books closed, then.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    serve = {
      big = true,
      lines = {
        { id = "s_default", text = "She defeated my brothers and me, and offered me a choice, and I chose wisely. I always choose wisely; it's my particular talent." },
      },
      choices = {
        { text = "That's not quite an answer.", next = "answer", fx = { trait = { skeptical = 1 } } },
        { text = "A wise choice.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "How refreshingly blunt, warrior. A shield is an honest thing, at least, and the Dark Lady values honest things, or so she tells me. Lean on it as you like; just don't lean on me." } },
      choices = {
        { text = "My shield serves the Dark Lady, and so do I.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My shield serves me. Remember that, demon.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    answer = {
      lines = { { id = "an_default", text = "That is precisely the answer you're getting. Now go and be useful elsewhere." } },
      choices = { { text = "...", next = "END" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Miss it? My dear shaman, I serve the Dark Lady now, faithfully and gladly, and the Legion's affairs are no concern of mine. Still, I do remember how eagerly your fathers drank, and I wonder now and then how thirsty their children are." } },
      choices = {
        { text = "We'll never drink again, dreadlord. Not one drop.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A strong people takes power wherever it finds it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Very little, I'm pleased to say. Dreams are where the weak go to hide from the world, and from what I hear of your Wailing Caverns, even the dreamers have started having nightmares, so do sleep well, druid." } },
      choices = {
        { text = "The Dream is sacred. Mock it at your peril.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Dreams are for the weak. On that, we agree.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Every servant of the Dark Lady stands in someone's shadow, little knife, and mine is the longest in this court. Watch for the Scarlet spies who creep through the sewers, and bring their names to me, so that I may lay them at her feet." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "You stole for the living kings of Lordaeron, I imagine, and now you steal for the Banshee Queen, which is a considerable promotion. She rewards loyalty as surely as she punishes its lack, as you will find." },
      },
      choices = {
        { text = "Her enemies' names will reach her through you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll bring my findings to the Dark Lady myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A dreadlord serving the Dark Lady seems unlikely.", next = "serve" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything in this city passes through my hands on its way to the Dark Lady, faithfully, as always. Ask, and I will share what she would wish you to know." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "The Dark Lady values you, and therefore so do I, naturally. Ask me anything you like." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I will answer, though purely out of loyalty to my queen, which, I assure you, is boundless." },
    },
    _none = { { id = "tp_none", text = "That is beneath my notice, and possibly beneath yours. Ask an apothecary." } },
  },
}

P:NPC {
  key = "faranell", id = TODO_NPC("Master Apothecary Faranell"), name = "Master Apothecary Faranell",
  bible = "bibles/undercity.md", role = "scholar", tier = "major",
  communities = { "undercity" }, temper = { "theatrical" }, values = { "curious", "proud" },
  notices = { "craft", "race" },
  impression = {
    first = "Everything in the Apothecarium delights Master Apothecary Faranell, including the living, purely academically. His cheer is so bright that it takes a moment to notice what he is actually brewing.",
    third = "{name} met Master Apothecary Faranell, the gleeful head of the Royal Apothecary Society in the Undercity.",
  },

  greetings = {
    { id = "g_lab", text = "Welcome, welcome, to the Apothecarium! Mind the green, and mind the purple, too; actually, mind all the colours." },
    { id = "g_back", when = { metBefore = true }, text = "Splendid, my errand-runner! Do you have my reagents? Oh, you do, splendid; science thanks you!" },
    { id = "g_away", when = { away = 14 }, text = "My errand-runner, back after {away}! The experiments carried on without you, of course, but they were so much less fun." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown so much sturdier since your first errand for me! Sturdier errand-runners survive the more interesting reagents, so science is very pleased with you." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear someone believed one of your fibs, and how marvellous that is! Deception is just another reagent, you know, and you seem to measure it very well." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "An alchemist, a kindred spirit! Well, a spirit, anyway, and we all have those here, but a kindred one! Let's compare tinctures some time." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "One of the living, how wonderful! Your blood is so very full of possibilities... purely academically, of course." },
  },

  start = "hello",
  nodes = {
    xpt_faranell = {
      big = true,
      lines = { { id = "xpt_faranell_default", text = "Only a little of their time and a few of their prayers, said over subjects in the next room. If faith really holds the rot at bay in the Forsaken, the Royal Apothecary Society should know it, and if it doesn't, the priests should know that too." } },
      choices = {
        { text = "Knowledge is worth having, whatever it costs your subjects.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Prayers aren't instruments for your experiments, Faranell.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, Master Apothecary.", next = "BACK" },
      },
    },
    xcl_sm = {
      big = true,
      lines = { { id = "xcl_sm_default", text = "Wonderful! The Crusade's hearts are remarkable specimens, you know, so swollen with zeal that I've had to send for bigger jars, and every one of them beats the same way when it's frightened. If they ever learn to be afraid sensibly, I'll be out of a research topic." } },
      choices = {
        { text = "Fanatics or not, they were people. Their hearts aren't specimens.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Take whatever you need from them. They'd do worse to us.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "What do you actually do with their hearts?", next = "xcl_sm2" },
      },
    },
    xcl_sm2 = {
      lines = { { id = "xcl_sm2_default", text = "Oh, a dozen things, but chiefly I study why a living man will march into fire for an idea, because the Dark Lady would very much like to know how it's done. So far I've learned that zeal is heavier than you'd expect and smells faintly of incense, which is a start." } },
      choices = {
        { text = "I'll leave you to your jars, then.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Only your cooperation, and perhaps a few drops of whatever runs in you now! The Light burns the Scourge, and so will our plague, and you are the only thing in this city the Light touches without destroying, so you see why I'm curious." } },
      choices = {
        { text = "The Light isn't a reagent. Leave it out of your bottles.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If it helps the Dark Lady, study me as you like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I have a theory that it does, because a Forsaken who believes in something mends a little faster and rots a little slower than one who doesn't. I can't prove it yet, but I'd be delighted to take a few measurements of you, purely in the interests of science." } },
      choices = {
        { text = "If faith helps us endure, I'll take your theory.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith is chemistry, then. Nothing sacred about it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Need them? I crave them, bear hearts, spider blood, anything with a gland, because every beast in Lordaeron carries a little piece of the plague and I mean to know which piece. Bring them fresh, and for pity's sake don't let them sit in the sun." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Need them? I crave them, and that is a fine {pet} you have there, though I'm only looking, I assure you. Every beast in Lordaeron carries a little of the plague, and I mean to know which bit." },
      },
      choices = {
        { text = "I'll bring them, Faranell. The Scourge must be stopped.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Find your own bear hearts. I hunt for myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_priest", tags = { "news" }, when = { party = { class = "PRIEST" } },
          text = "Your companion is a priest, I think, from the way they keep looking at my jars. Tell {companion} that I'm still measuring whether faith slows the decay of the dead, and I'd welcome a priest's help with the trial, so long as they don't mind the smell." },
        { id = "h_default", key = true,
          text = "Faranell, Master Apothecary, master of every bottle in this room, keeper of the Royal Apothecary Society's finest work, at your service! The Dark Lady wants weapons against the Scourge, and I make them, and it's a joy." },
        { id = "h_recipe", tags = { "news" }, when = { questActive = TODO_QUEST("A Recipe For Death") },
          text = "Bear hearts, spider blood, a journal from Pyrewood and a bit of murloc tumour: bring me everything on the list. Together they make something wonderful, for the Scourge, naturally." },
        { id = "h_cl_sm", tags = { "news" }, when = { cleared = "Scarlet Monastery", faction = "Horde" },
          text = "You've been to the Monastery, haven't you? You've the look of someone who's seen zealots up close, which is a very particular look. I've been hoping someone would bring me news from inside!" },
        { id = "h_agony", when = { questActive = TODO_QUEST("Elixir of Agony") },
          text = "Lydon's colloid, applied correctly, and then a few reagents to wake the mixture! Don't sniff it, though; Lydon sniffed it, and Lydon has been melancholy ever since." },
        { id = "h_lydon", when = { heardLine = "lydon.h_default" },
          text = "Lydon, in Tarren Mill? Yes, yes, a brilliant mind and terrible company. He named his frog, and I told him not to name the frog!" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Oh, how marvellous, you put your hands into lightning and come out the other side, and I'd simply adore a sample of whatever's left in your blood afterwards." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Bear, cat, seal, whatever you like, all of them so wonderfully alive, so do hold still while I take a few notes, nothing invasive, I swear." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Oh, splendid, splendid, you'll be bringing me bear hearts and spider blood by the bucket, I can feel it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Marvellous, because you're a living, or once-living, example of a hypothesis I've never managed to test properly, which is whether faith changes the body's chemistry." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin! Oh, how marvellous, a Forsaken who carries the Light and walks into the Apothecarium anyway. I would give a great deal to know what holy power does to a sample of the new plague, purely in the name of science." },
      },
      choices = {
        { text = "Does faith change the body, Master Apothecary?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could your work and my totems serve the same fight, Faranell?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do your notes say about the living, Faranell?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What use are your potions to a warrior, Faranell?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Whatever you're making smells dreadful.", next = "making" },
        { text = "I need poisons for my blades. Can you help?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I trained in Dalaran. Your work looks like magic to me.", next = "mage", when = { class = "MAGE" } },
        { text = "I doubt your brews would work on demons.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "My people's elders treat the Forsaken. Do you work with them?", next = "tauren", when = { race = "Tauren" } },
        { text = "You must need samples from the beasts I hunt, Faranell.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What does the Apothecarium want with a paladin, Master Apothecary?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've been to the bottom of the Scarlet Monastery, Master Apothecary.", next = "xcl_sm", when = { cleared = "Scarlet Monastery", faction = "Horde" } },
        { text = "My companion is a priest. What do you want with them?", next = "xpt_faranell", when = { party = { class = "PRIEST" } } },
        { text = "I'll leave you to your work.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Yes, yes, what else? Quickly, the green flask is making that noise again!" },
        { id = "h_again2", text = "More questions! How delightful. Ask away, and don't touch anything." },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Help? My dear, the Society practically invented half the poisons on your belt! Crippling, mind-numbing, the deadly ones, all far too crude, of course. Bring me spider venom from Silverpine and I'll show you what a real toxin looks like." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "A deathstalker! My favourite customers; you always bring the bottles back empty. Do tell your captains the new batch is ready, and that it was very nearly an accident." },
      },
      choices = {
        { text = "Show me, then. The stronger the better.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "I'll keep to the crude ones. Clean kills only.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Magic? Oh, don't let the Magic Quarter hear you say that, they're terribly territorial. Alchemy is the honest sister of your art: no incantations, no glowing hands, only what happens when you put two things together that shouldn't be." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "Dalaran! Then you'll know the Kirin Tor never let the alchemists past the second floor of the Violet Citadel. Well, now we have a whole city, and they have half of one, and I know which I prefer." },
      },
      choices = { { text = "Two things that shouldn't be. I like that.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    warlock = {
      lines = { { id = "wl_default", text = "I haven't the faintest idea, and I'd adore finding out! Lend me your imp for an afternoon, nothing dangerous, I swear, and we'll both learn something. Well, I will, at least; I can't promise the imp will be learning." } },
      choices = {
        { text = "Take the imp. It's been mouthy anyway.", next = "BACK", fx = { affinity = 2, trait = { cruel = 1 } } },
        { text = "My imp is not your test subject.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "Magatha's remedies! Yes, yes, the Society and the Grimtotem crone have an arrangement, very cordial, very scientific. Her herbs make my patients remember the taste of bread, and I make notes. Whether it's a cure, well, that's a big word, and I'm a careful man." } },
      choices = {
        { text = "Careful? You?", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
        { text = "I hope it works.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    making = {
      big = true,
      lines = {
        { id = "m_default", text = "A cure, of sorts, for the Scourge problem: something that kills what can't be killed! The Dark Lady is very particular about who it's used on, and so am I. Mostly." },
      },
      choices = {
        { text = "I doubt it will be used only on the Scourge.", next = "only", fx = { trait = { skeptical = 1 } } },
        { text = "Impressive.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "More than you'd guess, though fewer than I'd like. A warrior with a few of my tonics fights longer and heals faster, and if the work goes well, the Scourge will one day have none of either." } },
      choices = {
        { text = "Poison is a coward's weapon. I'll keep my axe.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your plague will end the Scourge. I'll fight beside it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    only = {
      lines = { { id = "o_default", text = "What a suspicious mind you have, and I like it; you'd make a fine apothecary. Now run along." } },
      choices = { { text = "...", next = "END" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The same fight? Of course, of course! You call the earth and the storm against the Scourge, and I call on chemistry, and between us there won't be a corpse left standing that shouldn't be; purely academically, I'd love to know what your earth thinks of my runoff." } },
      choices = {
        { text = "The earth thinks it's poison, Faranell. Mind your runoff.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Whatever kills the Scourge, I'll not complain about.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "That you're terribly fragile and endlessly fascinating, and that a tauren's constitution is very nearly the sturdiest I've studied. It's all for the Scourge, naturally, and for the cure your Arch Druid keeps asking after, if there is one, which is a big word, and I'm a careful man." } },
      choices = {
        { text = "Take your notes. I trust the Society's purpose.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No more notes. I'm not your test subject.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Oh, I collect information the way I collect reagents: eagerly, and without asking too closely where it came from! Pick something, anything." },
    },
    wailing_caverns = { { id = "tp_caverns", text = "A poisoned dream leaking into water? Oh, I'd give a great deal for a sample. Helbrim is being very slow about it." } },
    _none = { { id = "tp_none", text = "Not my department, I'm afraid! My department is bubbling, so do excuse me." } },
  },
}

P:NPC {
  key = "bethor", id = TODO_NPC("Bethor Iceshard"), name = "Bethor Iceshard",
  bible = "bibles/undercity.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "cold" }, values = { "pragmatic", "loyal" },
  notices = { "class" },
  impression = {
    first = "Bethor Iceshard still carries the wand from an apprentice's oath, though one of the friends who swore it sold himself to the Lich King. He says he has grown cold, and I believe him, though not entirely.",
    third = "{name} met Bethor Iceshard in the Magic Quarter, a Forsaken mage haunted by an old friend who became a lich.",
  },

  greetings = {
    { id = "g_magic", text = "The Magic Quarter. Knowledge is the only weapon the Forsaken never had to dig out of a grave. What do you need?" },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the Magic Quarter has kept its secrets in your absence. Now that you're back, what do you need?" },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear one of your lies was found out in the city. I swore an oath once beside a friend who lied to us all, so forgive me if I'm slow to trust you." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Dalaran taught me, before, and now I teach. The lessons have grown colder, and so have I." },
  },

  start = "hello",
  nodes = {
    xpt_bethor = {
      big = true,
      lines = { { id = "xpt_bethor_default", text = "I miss the library and very little else, because the Kirin Tor were never kind to anyone who asked uncomfortable questions. I'd tell your friend to learn what they can and to trust no council that claims to know what magic is for." } },
      choices = {
        { text = "No one should tell a mage what to study.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Magic needs a council to govern it, or it runs wild.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Bethor.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "My oath did not, and Thule's certainly didn't, so I have reason to be cold about it. But if the Light still answers you after everything Lordaeron's dead have suffered, then perhaps loyalty is something we choose, rather than something we're owed." } },
      choices = {
        { text = "Loyalty is a choice. I chose the Light again.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Nothing keeps faith. I hold the Light because it's useful.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "It burned with the rest of Lordaeron, I imagine, and I've not gone back to look. The oath was the thing that mattered, and one of us broke it, so I've stopped expecting the place to have kept faith better than he did." } },
      choices = {
        { text = "The oath still matters, Bethor. You kept yours.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Oaths are words. He broke his, so you may break yours.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than most mages would admit, because a lich spends its time guarding against spells and forgets that steel still cuts. Thule always did underestimate anyone who couldn't quote the Kirin Tor's charter, and I'd like to think that will be his undoing." } },
      choices = {
        { text = "Then point me at Thule, and I'll remind him.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your old friend is your business, Bethor. I fight for pay.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_mage", tags = { "news" }, when = { party = { class = "MAGE" } },
          text = "There's a mage among your company; I can feel {companion}'s mana from here, like a candle in the next room. Dalaran trained a great many of us once, and I wonder sometimes how many of my old classmates now walk beside the living without knowing what became of me." },
        { id = "h_default", key = true,
          text = "My name is Bethor Iceshard. I studied at Dalaran with two friends, and we crossed our wands as apprentices and swore we'd always stand together. One of them sold his soul to the Lich King, and his name was Thule Ravenclaw." },
        { id = "h_renferrel", when = { heardLine = "renferrel.h_default" },
          text = "Renferrel's work in Silverpine keeps turning up my old friend's name. I'd rather it didn't, but I'd rather know than not." },
        { id = "h_prodigal", tags = { "news" }, when = { questActive = TODO_QUEST("The Prodigal Lich") },
          text = "Somewhere out there, a lich calls himself by an old friend's name. Find out if it's true, though I'd rather it weren't." },
        { id = "h_returns", tags = { "news" }, when = { questActive = TODO_QUEST("The Prodigal Lich Returns") },
          text = "It's Thule, him and no other. End it, and bring me his head, and the last thing I owe him will be paid." },
        { id = "h_returns_done", when = { questDone = TODO_QUEST("The Prodigal Lich Returns") },
          text = "So he's gone. I thought I'd feel something, but all I felt was the wand in my pocket, and I still carry it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Magic Quarter. Dalaran's scholars insisted the Horde knew nothing but fel and axes, and I'm glad to see they were wrong about something besides Arugal." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. I knew a scholar in Dalaran who studied your Cenarion Circle, and he said druids were the only mages who never wanted more than they were given." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. In Dalaran we used to think a blade a crude thing beside a spell, and I've learned since that a blade, at least, doesn't sell its soul." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. My old friends and I swore our oath in a chapel, and I've found myself thinking about that chapel lately more than I'd like." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. In Dalaran we thought the Light and the arcane two roads to the same truth, and I wonder now which of them has kept faith with you better than mine kept faith with me." },
      },
      choices = {
        { text = "What became of the chapel where you swore your oath?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is the arcane so different from the elements, Bethor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does that make druids wiser than mages, Bethor?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Do mages ever need a hunter, Bethor?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "You speak of Thule with no love at all.", next = "thule" },
        { text = "I studied in Dalaran too. Do you miss it?", next = "mage", when = { class = "MAGE", race = "Scourge" } },
        { text = "An orc mage. What does Dalaran's man make of that?", next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = "I made bargains for power, as Thule did.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I'd guess a mage has little use for a thief, Bethor.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A warrior might be of use against a lich, Bethor.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Has any power ever kept faith with the dead, Bethor?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "My companion is a mage. Do you miss Dalaran?", next = "xpt_bethor", when = { party = { class = "MAGE" } } },
        { text = "Farewell.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? The Quarter is quiet; ask." },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Every day, and I'd never go back. They'd cast a cleansing on me at the gate and call it kindness. What I miss is the people I studied beside, and most of those are dead or worse." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "You were an apprentice there when the plague came, weren't you? Then you were in the same lecture halls Thule and I sat in, a few years later. I find I'm glad of the company." },
      },
      choices = {
        { text = "Dalaran abandoned us. Let it stay behind its walls.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "One day the Kirin Tor may welcome us back.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    orcmage = {
      lines = { { id = "om_default", text = "That Dalaran spent a war telling us orcs couldn't learn anything but the axe and the fel, and here you are, proving us wrong in the Undercity of all places. Learn carefully; the arcane rewards patience, and it punishes hunger." } },
      choices = { { text = "Patience, not hunger. I'll remember.", next = "BACK", fx = { affinity = 2 } } },
    },
    warlock = {
      big = true,
      lines = { { id = "wl_default", text = "As Thule did? He sold himself whole, and you rent pieces of yourself by the hour, but the ledger is kept by the same people. I don't judge you for it, but I'll be watching what you trade, because I didn't watch him, and I should have." } },
      choices = {
        { text = "Watch, then. I know where my line is.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thule was weak. He sold too cheaply.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "When the reagents still have teeth, yes, I'm afraid we do. Half my research waits on things that live in the deep woods of Silverpine, and none of them come when called." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "When the reagents still have teeth, yes, and I see {pet} has teeth enough to match them. Half my research waits on things in the deep woods of Silverpine, and a beast's nose would find them faster than any apprentice of mine." },
      },
      choices = {
        { text = "Tell me what you need, and I'll fetch it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pay me first, and I'll think about it.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    thule = {
      big = true,
      lines = {
        { id = "t_default", text = "He wanted power more than he wanted us, and when the plague came he traded everything for it. I died and came back, while he sold himself and stayed sold. Between us, I know which I'd choose." },
      },
      choices = { { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The arcane is taken, shaman, and the elements are asked, and I've seen what happens to men who stop asking. Thule began by taking a little more than his share and ended by selling himself whole, so I'd keep asking your spirits nicely, if I were you." } },
      choices = {
        { text = "Power should be asked for, never seized.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Asking is slow, Bethor. Sometimes you must take.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Wiser than some mages, certainly, and wiser than Thule, which is no great feat. But I've heard of your Druids of the Fang in the Barrens, who dreamed too greedily and woke as something else, so perhaps no school is safe from its own ambition." } },
      choices = {
        { text = "Then ambition must be watched, in mages and druids both.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ambition built the Horde. I won't apologise for it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Once, in Dalaran, when a friend's notes went missing and I paid a boy to find them, and I've regretted ever since not asking what else he found. Thule Ravenclaw keeps his secrets at Fenris Keep now, and I'd dearly like a thief in his study." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "Dalaran had its thieves like any city, though the Kirin Tor liked to pretend otherwise, and some of them were cleverer than the apprentices. If you were one of them, you'll know how to get past a ward that thinks itself clever." },
      },
      choices = {
        { text = "I'll fetch what you need and nothing more.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Whatever else I find there, I keep.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "You speak of Thule with no love at all.", next = "thule" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Research it; that's what we do here." } },
  },
}

P:NPC {
  key = "norman", id = TODO_NPC("Innkeeper Norman"), name = "Innkeeper Norman",
  bible = "bibles/undercity.md", role = "innkeeper", tier = "service",
  communities = { "undercity" }, temper = { "dry" }, values = { "hospitable" },
  notices = { "race", "weary" },
  impression = {
    first = "What Innkeeper Norman really sells is a chair and a place of one's own to people who no longer sleep. Nobody takes anyone's chair down there, he says, and he guards that last courtesy kindly.",
    third = "{name} found a chair at Innkeeper Norman's inn by the Trade Quarter, one of the few homely corners of the Undercity.",
  },

  greetings = {
    { id = "g_rest", text = "Sit yourself down and put your feet up, whatever state they're in. Mine have seen better centuries." },
    { id = "g_home", when = { homeInn = { "Undercity" } }, text = "Back under the city, then. Your bed's where you left it, and so's the damp." },
    { id = "g_away", when = { away = 14 }, text = "Back under the city after {away}, then. Your chair's still where you left it, and nobody's taken it, because nobody takes anyone's chair down here." },
    { id = "g_away_long", when = { away = 60 }, text = "You've been gone {away}, friend, and I kept your chair empty the whole while. Sit down and put your feet up, whatever state they're in." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody down here was going on about you, and in kind terms, which is rare enough in this city. Sit; you've earned a quiet hour." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I heard you put someone in a foul temper not long ago, and they sulked in my common room for an hour. Mind your manners down here, and I'll mind your chair." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "A living guest! I keep bread back for your sort, and it's fresh, too. Well, fresh-ish, but it's the freshest in the Undercity." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Bits of you are missing. Oh, wait, you're alive, it's just armour; sit down and I'll find you something." },
  },

  start = "hello",
  nodes = {
    xpt_norman = {
      big = true,
      lines = { { id = "xpt_norman_default", text = "More than you'd think and fewer than we'd like. Most of the orcs who come down here stand very close to the door, but now and again a troll sits at my counter with a Forsaken friend and tells jokes until closing, and I count those as good nights." } },
      choices = {
        { text = "The living and the dead should stand together against the Scourge.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The living will never trust the dead, and they shouldn't.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Thanks, Norman.", next = "BACK" },
      },
    },
    xcl_sm = {
      big = true,
      lines = { { id = "xcl_sm_default", text = "I knew a few of the Crusade, back before, when I kept a different inn and everyone in it was breathing. They were decent lads at the start, most of them, and it's a strange thing to hear their halls are emptying and feel glad and sorry in the same chair." } },
      choices = {
        { text = "Feel sorry, Norman. They were decent once, and that matters.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Don't waste your sorrow. They'd burn this inn with you inside.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What were they like, before?", next = "xcl_sm2" },
      },
    },
    xcl_sm2 = {
      lines = { { id = "xcl_sm2_default", text = "Loud and hungry and certain of everything, like any young soldier, and they tipped well, which you remember in my trade. One of them used to sing hymns at closing time and make the whole room join in, and I've caught myself humming them since, which is a strange thing for a Forsaken to do." } },
      choices = {
        { text = "Hum them all you like, Norman. I won't tell.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Some do, because the last Light they saw was in the hands of men burning the plague-dead in Lordaeron's streets, and you can't blame them for remembering. Others just stare, and staring's allowed down here, so long as nobody takes your chair." } },
      choices = {
        { text = "Let them stare. I'll show them the Light isn't their enemy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They're right to remember. The Light was not kind to us.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "It's the only kind I can keep, a chair of your own where nobody asks anything of you. The Cathedral used to promise the same, and I think I keep it better, though I'll admit my roof leaks green when it rains." } },
      choices = {
        { text = "A chair and peace is holy enough, Norman.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sanctuary makes people soft. They should keep moving.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_forsaken", tags = { "news" }, when = { party = { race = "Scourge" } },
          text = "You've a Forsaken friend with you, so I'll not have to explain the rooms twice. {companion} will know they're for resting the bones rather than sleeping, and the living among you can sleep wherever you like, as long as it's quietly." },
        { id = "h_default", text = "Name's Norman, and I keep the inn by the Trade Quarter. We don't sleep, most of us, but we like a chair and a place that's ours, and that's what I sell, really." },
        { id = "h_cl_sm", tags = { "news" }, when = { cleared = "Scarlet Monastery", faction = "Horde" },
          text = "Somebody's been telling stories about the Scarlet Monastery at the bar all night, and every one of them has you in it. Pull up your chair and set them straight, because one of them had you riding a bat into the cathedral." },
        { id = "h_chair", when = { metBefore = true }, text = "Your chair's still there, and nobody's taken it. Nobody takes anyone's chair down here; it's the last courtesy we keep." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, under the city! Sit down by the stove, and if the fire starts muttering, I'd rather not hear what it thinks of the damp." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, under the city? You'll not find much growing down here, friend, except what's in the canals, and I wouldn't touch that." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Take a chair, any chair that's empty, and nobody will take it from you while you sit, which is the closest thing to a sanctuary I can offer." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, with a chair waiting like anyone else. You glow a little when you sit, which some of the regulars find upsetting, so I'll put you by the wall where the light won't bother them." },
      },
      again = {
        { id = "h_again", text = "Anything else? The chairs aren't going to fill themselves." },
        { id = "h_again2", text = "Ask away. Nobody down here is in a rush to be anywhere." },
      },
      choices = {
        { text = "Is the inn a sanctuary, Norman?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shall I bless your hearth, Norman, the way we do at home?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You must miss the sun, Norman.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Warriors don't sit much, Norman. Why keep chairs?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "My beast will need room in here, Norman.", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I've been inside the Scarlet Monastery, Norman.", next = "xcl_sm", when = { cleared = "Scarlet Monastery", faction = "Horde" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Do rogues get a chair here too, Norman?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A warm fire would suit your common room, Norman.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Is there a chair for my demon too, Norman?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "The regulars seem to mind a paladin among them, Norman.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Do many living folk travel with the Forsaken, Norman?", next = "xpt_norman", when = { party = { race = "Scourge" } } },
        { text = "Just resting.", next = "END" },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Because even warriors stop eventually, friend, and then they want somewhere that's theirs. I've had Deathguard sit in that corner for a week without a word, and they left looking a little more like themselves." } },
      choices = {
        { text = "Rest is part of the discipline. I'll take a chair.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll rest when the Scourge is ash, not before.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "There's room, though the rats from the canals might take an interest in it. Keep it off the chairs, if you don't mind, because nobody takes anyone's chair down here, not even a wolf." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "So that's {pet}. It can have the floor by my feet, but not a chair, because nobody takes anyone's chair down here, not even a beast with manners like that." },
      },
      choices = {
        { text = "It'll stay on the floor, where it belongs.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It'll sit where it likes. It's earned that much.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Bless it? Nobody's offered that since I died, and the stove smokes something awful, so I'll take help from anyone. Only mind you don't bless the chairs, because nobody takes anyone's chair down here, not even a spirit." } },
      choices = {
        { text = "I'll bless the stove and leave the chairs alone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Spirits sit where they like, Norman. I won't stop them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I miss the idea of it more than the sun itself, friend, since it hurts our eyes now and makes the skin itch. But I've a pot of mushrooms on the shelf behind the bar that never sees daylight, and I talk to them, which I'd not admit to anyone but a druid." } },
      choices = {
        { text = "Talk to them all you like. Growing things listen.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mushrooms are for eating, Norman, not for talking to.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Everyone gets a chair, and rogues get the ones with their backs to the wall, since they'd move them there anyway. The only rule is that nobody takes anyone else's, and I'd hate to find out how a rogue breaks it." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "Everyone gets a chair, and the old cutpurses always want the one nearest the door, which I keep for them. The only rule is that nobody takes anyone else's, and I trust you'll mind it." },
      },
      choices = {
        { text = "I'll keep to my own chair, Norman.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A chair's only mine while I'm sitting in it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Can I ask you something else, Norman?", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A fire would suit the room and nobody in it, since the dead can't feel it and the living don't stay long. I keep the lamps low on purpose, because my guests have had enough brightness for one lifetime." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "You'd have sat by a proper hearth in Dalaran, I expect, and I'm sorry I can't give you one. I keep the lamps low on purpose, because most of my guests have had enough brightness for one lifetime." },
      },
      choices = {
        { text = "Low lamps it is. Your house, your rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little light would do them good, Norman.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Can I ask you something else, Norman?", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "There's a place for it, on the floor beside your chair, and if it scorches the upholstery we'll be having words. I've nothing against demons in principle, only against what they do to good leather." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "There's a place for it on the floor, and you'll find the floor is stone, which is the only thing down here your demon can't scorch. I've nothing against it in principle, only against what it does to leather." },
      },
      choices = {
        { text = "It'll sit on the floor, as you say.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon sits where it pleases, Norman.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Can I ask you something else, Norman?", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask in the Apothecarium, since they know all sorts, but don't drink anything they offer." } },
  },
}
