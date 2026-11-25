-- The Undercity. Voice: bibles/undercity.md
-- Varimathras's later betrayal and the Society's real plans stay unspoken: arrogance and
-- irony only. Nothing here is later than Year 1.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sylvanas", id = TODO_NPC("Lady Sylvanas Windrunner"), name = "Lady Sylvanas Windrunner",
  bible = "bibles/undercity.md", role = "noble", tier = "major",
  communities = { "undercity" }, temper = { "cold" }, values = { "proud", "vengeful" },
  likesTone = "polite",
  spiritSensitive = true,
  notices = { "race", "class" },
  impression = {
    first = "She has all the time in the world and no forgiveness.",
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
    dd_hillsbrad = {
      lines = { { id = "dd_hillsbrad_default", text = "What I want is Lordaeron, and Hillsbrad is a corner of it the living still pretend is theirs. Every farm you burned tells them they are tenants on my land, and that the rent has come due." } },
      choices = {
        { text = "Then I'll keep collecting, my lady, as long as you need.", next = "BACK", reply = "Good. The Forsaken remember who stands with them, and so do I.", fx = { align = { order = 1 } } },
        { text = "Some of those farmers had done nothing to us, my lady.", next = "BACK", reply = "Neither had we, when the Crusade came with its torches. Keep your conscience if you like, but keep it quiet in my court.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },

    xalt_sylvanas = {
      lines = {
        { id = "xalt_sylvanas_default", text = "Many swear themselves to the Forsaken before this throne, and I forget most of them by the next bell. That one I remember, which should tell you something about them, and perhaps about you." },
        { id = "xalt_sylvanas_risen", when = { alt = { race = "Scourge" } }, text = "{alt} still clung to some memory of a life before the plague, more tightly than I would advise. If you knew them then, do not expect them to know you now, because the grave takes more than breath." },
      },
      choices = {
        { text = "Whatever they were in life, they serve you now.", next = "BACK", reply = "So they do, and so do you. I will remember that you vouched for them, should either of you forget it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They belong to themselves, my Lady, not to any queen.", next = "BACK", reply = "Then they are Forsaken in the truest sense, and I would not have it otherwise. Freedom was the only gift I ever meant to give.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else, my Lady.", next = "BACK" },
      },
    },
    op_warchief = {
      big = true,
      lines = {
        { id = "opwc_default", text = "Every courier who comes back from Orgrimmar brings me Thrall's words, and not one of them tells me what they thought of the orc who spoke them. You've stood in his hall, or you will soon enough, so tell me what you make of the Warchief." },
      },
      choices = {
        { text = "He's honest, my lady, and the Horde is stronger for it.", next = "op_warchief_r1", fx = { align = { honor = 1 }, opinion = { warchief = "trust" } } },
        { text = "He's soft. He pities us when he ought to fear us.", next = "op_warchief_r2", fx = { affinity = 1, align = { honor = -1 }, trait = { stern = 1 }, opinion = { warchief = "soft" } } },
        { text = "He broke my people's chains. I would follow him anywhere.", next = "op_warchief_r3", fx = { opinion = { warchief = "admire" } }, when = { race = "Orc" } },
        { text = "He's useful to us, my lady. That's all he needs to be.", next = "op_warchief_r4", fx = { affinity = 1, trait = { practical = 1 }, opinion = { warchief = "useful" } }, when = { race = "Scourge" } },
        { text = "I'd rather keep my thoughts on the Warchief, my lady.", next = "BACK" },
      },
    },
    op_warchief_r1 = {
      lines = { { id = "opwc_r1", text = "Honest, yes, and you say it as though honesty were armour. Believe it if it helps you, but keep your blade sharp as well, because honest kings make enemies faster than clever ones." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    op_warchief_r2 = {
      lines = { { id = "opwc_r2", text = "Pity is a cheap coin, and he spends it on us freely, which suits me better than fear would. Say it in Orgrimmar, though, and you'll learn how soft his guards are." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    op_warchief_r3 = {
      lines = { { id = "opwc_r3", text = "Then follow him, and know that I envy him that much. I had people once who would have said the same of me, and Arthas left me very few of them." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    op_warchief_r4 = {
      lines = { { id = "opwc_r4", text = "Spoken like one of mine. Useful is the highest praise I give anyone, the Warchief included, and it lasts precisely as long as he does." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    xpt_sylvanas = {
      big = true,
      lines = { { id = "xpt_sylvanas_default", text = "Nothing about the living troubles me any longer, except how quickly they forget. The Horde took us in because we hate the Scourge, and I'm content with that arrangement so long as every one of Thrall's people remembers who stands between Lordaeron's plague and their borders." } },
      choices = {
        { text = "The Forsaken have earned their place in the Horde, my lady.", next = "BACK", reply = "They have, with blood they no longer have to spare. See that the orcs remember it as well as you do.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Horde owes you nothing. You need it more than it needs you.", next = "BACK", reply = "Perhaps, but it is unwise to say so in Orgrimmar's hearing. Keep that thought for my court, where it belongs.", fx = { align = { honor = -1 } } },
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
      lines = { { id = "xcl_strat_default", text = "Then the Baron has rejoined his master's servants in the only way left to him, and the city where Arthas began has one less of his creatures in it. I take no joy in ruins, but I take a cold satisfaction in seeing his work undone, one stone at a time." } },
      choices = {
        { text = "I serve your vengeance, my lady, and I'll serve it again.", next = "BACK", reply = "Then you will have the chance soon enough. Arthas left a great many servants behind him, and I want every one of them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I did it for my own reasons, not for your vengeance.", next = "BACK", reply = "Your reasons are your own, so long as they end with the Scourge in ashes. I will take the result and leave you the reasons.", fx = { align = { order = -1 } } },
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
        { text = "I will hold, my lady, for as long as it takes.", next = "BACK", reply = "Then you will be remembered, {class}, which is more than most of my soldiers can say.", fx = { align = { order = 1 } } },
        { text = "I'll hold for the Forsaken, my lady, not for orders.", next = "BACK", reply = "For the Forsaken, then, and I am one of them. We want the same thing, whatever you call it.", fx = { align = { order = -1 } } },
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
        { text = "I'll hunt as your rangers did, my lady, with patience.", next = "BACK", reply = "Good. Learn it well enough to survive what they did not.", fx = { align = { order = 1 } } },
        { text = "I hunt my own way, my lady, as I always have.", next = "BACK", reply = "As you always have, and as you will until it fails you. My rangers thought the same once.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_sylvanas = {
      lines = {
        { id = "hu_default", key = true,
          text = "I was never human, though most of my people were, and I've watched what their living kin do with that knowledge. The Scarlet Crusade burns them in the fields, the Alliance calls them Scourge, and their own mothers would bar the door, so you'll forgive me if I don't weep for humanity." },
        { id = "hu_scourge", when = { race = "Scourge" },
          text = "You were human, as most of my people were, and you've seen how your living kin welcome you home. The Crusade burns us in the fields, Southshore sets dogs on us, and your own family would bar the door, so tell me what you owe them." },
      },
      choices = {
        { text = "Do you hate them, then, my lady?", next = "hu_sylvanas_2" },
        { text = "Arthas was human. Is that where it began?", next = "hu_sylvanas_2" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    hu_sylvanas_2 = {
      big = true,
      lines = {
        { id = "hu2_default",
          text = "A human prince murdered my people and made me this, and the humans who survived him have never once asked what became of their own dead. I don't hate them, not as you mean it; I simply expect nothing from them, and they rarely disappoint me." },
      },
      choices = {
        { text = "The living abandoned you. They deserve nothing in return.", next = "BACK",
          reply = "Then you understand the Forsaken better than most of the Horde does. Remember it when Thrall speaks of peace with Theramore.",
          fx = { affinity = 1, align = { light = -1 }, opinion = { humans = "hate" } } },
        { text = "Not every human is Arthas, my lady.", next = "BACK",
          reply = "No, most of them are smaller than he was, and more frightened. I'll keep your mercy in mind, and I'll keep the Deathguard on the walls all the same.",
          fx = { affinity = -1, align = { light = 1 }, opinion = { humans = "mixed" } } },
        { text = "I owe them nothing. My loyalty is to you, my lady.", next = "BACK", when = { race = "Scourge" },
          reply = "Good. Grieve your old life if you must, but never mistake the people who buried you for the people who freed you.",
          fx = { affinity = 1, opinion = { humans = "rivals" } } },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_fors", tags = { "news" }, when = { race = "Scourge", alt = { kin = true } },
          text = "Another of my Forsaken came before me wearing the name {alt}, and you carry yourself with the same stiffness. Perhaps you shared a street in Lordaeron, or a grave; most of us have forgotten which." },
        { id = "h_alt_living", tags = { "news" }, when = { alt = { notKin = true, race = { "Orc", "Troll", "Tauren", "Skyborne" } } },
          text = "A {altrace} called {alt} stood in this chamber not long ago and did not flinch at what they saw. I remember the living who don't flinch, because there are so few of them." },
        { id = "h_alt_risen", tags = { "news" }, when = { alt = { race = "Scourge", notKin = true } },
          text = "One of my Forsaken, {alt}, has a look about the face that I see in yours, as though a sister or brother walked out of the grave ahead of you. Be careful if you go looking for them, because the dead seldom remember the living fondly." },
        { id = "o_sydistrust", tags = { "news" }, when = { gossip = { topic = "sylvanas", stance = "distrust" } }, text = "Varimathras tells me you think I trust him out of desperation. He tells me a great many things, and I keep the ones I can use." },
        { id = "h_pt_living", tags = { "news" }, when = { party = { race = { "Orc", "Troll", "Tauren" } } },
          text = "You walk with the living, I see, and {companion} doesn't keep a hand on their weapon around you. Treasure that while it lasts, because the warmth goes out of most alliances long before it goes out of the body." },
        { id = "h_default", key = true,
          text = "I am Sylvanas Windrunner, once Ranger-General of Silvermoon and now queen of the Forsaken. Arthas made me this, and one day I will show him what he made." },
        { id = "h_cl_strat", tags = { "news" }, when = { cleared = "Stratholme", faction = "Horde" },
          text = "Stratholme's masters have fallen, and my rangers tell me you walked out of its gates when others did not. Arthas began his crimes in that city, and I am glad to hear it has finally been made to answer." },
        { id = "h_zygand", when = { heardLine = "zygand.h_default" },
          text = "Executor Zygand holds Brill against the Crusade, and good; the zealots should learn that the dead have long memories." },
        { id = "h_hamuul", when = { heardLine = "hamuul.h_default" },
          text = "The tauren Arch Druid spoke for the Forsaken before the Horde, when the orcs would have turned us away. Remember that, when you hear the tauren speak of balance." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Thrall's people speak of spirits and of balance, and I have heard enough of spirits to last me the rest of my long existence." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" }, text = "A druid of the tauren. Your Arch Druid spoke for my people before the Horde, and I have not forgotten it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The Forsaken need blades that do not break, and I will learn soon enough whether yours is one of them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. I led the rangers of Quel'Thalas once, and I still know an archer by the way they carry their shoulders." },
        { id = "h_dd_hillsbrad", tags = { "news" }, when = { questDone = TODO_QUEST("Battle of Hillsbrad") },
          text = "Varimathras tells me Hillsbrad's fields burned on your account, and that the farmers of Southshore now bolt their doors at dusk. The living who drove us out of Lordaeron should learn what it is to fear the night." },
        { id = "h_dd_rank", when = { pvpRank = 8 },
          text = "The Alliance has begun to write your name in its lists of the dead, {rank}. Let them, because a name they fear is worth a regiment to me." },
      },
      choices = {
        { text = "Someone close to me has stood before you, my Lady.", next = "xalt_sylvanas", when = { alt = true } },
        { text = "Do the spirits trouble you, my lady?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do you want from the tauren, my lady?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What do the Forsaken want?", next = "want" },
        { text = "Tell me about Arthas.", next = "arthas" },
        { text = "I carry the Light, my lady, though it burns.", next = "paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "I still pray to the Light, my lady.", next = "priest", when = { race = "Scourge", class = "PRIEST" } },
        { text = "I'd serve you as a knife in the dark, my lady.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I wore the Cult's robes once, and I learned a great deal.", next = "cult", when = { race = "Scourge", class = "WARLOCK" } },
        { text = "My people spoke for yours. Was it a mistake?", next = "tauren", when = { race = "Tauren" } },
        { text = "My spells are yours, my lady.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "You must ask much of your warriors, my lady.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What did the rangers of Quel'Thalas teach their hunters, my lady?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Stratholme has fallen silent, my lady. I saw to it.", next = "xcl_strat", when = { cleared = "Stratholme", faction = "Horde" } },
        { text = "My companion is living. I'd guess that troubles you, my lady.", next = "xpt_sylvanas", when = { party = { race = { "Orc", "Troll", "Tauren" } } } },
        { text = "Tell me of your kingdom, my lady.", next = "kingdom" },
        { text = "How did you break free of the Lich King?", next = "past" },
        { text = "You don't seem to think much of the Horde, my lady.", next = "horde" },
        { text = "What would you have of me, my lady?", next = "ask_me" },
        { text = "What are the living humans to you, my lady?", next = "hu_sylvanas" },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 2 } },
        { text = "Hillsbrad burned, my lady. Is that what you wanted?", next = "dd_hillsbrad", when = { questDone = TODO_QUEST("Battle of Hillsbrad") } },
      },
      again = {
        { id = "h_again", text = "You have more to say. Say it." },
        { id = "h_again2", text = "Go on. I'll tell you when I've heard enough." },
      },
    },
    paladin = {
      big = true,
      lines = {
        { id = "pa_default", text = "So I'm told. The same Light let Arthas march into Quel'Thalas with a paladin's hammer, and now it answers to my people too. I find that more amusing than holy, but if it burns the Scourge, carry it, and let it hurt." },
        { id = "pa_knight", when = { origin = "forsaken_risen_knight" },
          text = "You were Silver Hand, then. Arthas wore your order's colours when he came for my people, and you wore them when he came for you. Remember that, every time it burns." },
      },
      choices = {
        { text = "The Light is mine, not his. I'll prove it.", next = "BACK", reply = "Prove it, then, on the Scourge's own ground. I will be watching to see whose Light it really is.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's a weapon, my lady. I'll aim it at him.", next = "BACK", reply = "Good. Aim it well, and keep aiming until there is nothing left of him to burn.", fx = { affinity = 2, align = { light = -1 } } },
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
        { text = "It hasn't failed me yet, my lady.", next = "BACK", reply = "Yet is a long word for the dead. When it does fail you, remember where to find me.", fx = { align = { light = 1 } } },
        { text = "You're right. I'll turn to the shadow.", next = "BACK", reply = "Wise. The shadows never once turned on my people, which is more than the Light can say.", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Everyone in my city serves from the shadows, one way or another. Go to the deathstalkers; they need knives that don't hesitate, and they'll tell me whether yours does." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "You're already one of them, I see. Good. My deathstalkers are my eyes in Silverpine and Hillsbrad, and I want to know everything they see, before anyone else does." },
      },
      choices = { { text = "You'll hear it before anyone else, my lady.", next = "BACK", reply = "Good. The deathstalkers will expect nothing less.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll keep some secrets for myself, my lady.", next = "BACK", reply = "Everyone does, and I learn most of them anyway. Keep yours small, and keep them well away from me.", fx = { affinity = -2, align = { order = -1 } } } },
    },
    cult = {
      big = true,
      lines = { { id = "cu_default", text = "Then you knelt to Kel'Thuzad, and you helped spread the plague that made us all. Many of my people would hang you in the Apothecarium for that, and I'm not certain they'd be wrong. Tell me why I shouldn't." } },
      choices = {
        { text = "I know how the Scourge thinks. Use that, and use me.", next = "BACK", reply = "A practical answer, and the only one that would have saved you. Serve me well, and the Apothecarium will wait a while longer.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I apologize to no one, my lady. Least of all the dead.", next = "BACK", reply = "Bold, and foolish, and very nearly worth admiring. Watch your back in my city, cultist.", fx = { affinity = -2, align = { order = -1 } } },
        { text = "I have no reason, my lady. Only regret.", next = "cult_regret" },
      },
    },
    cult_regret = {
      lines = { { id = "cr_default", text = "Regret is a luxury of the living. Make it useful instead: the Cult still crawls in the north, and you know their signs. Bring me their names." } },
      choices = { { text = "You'll have their names, and whatever else I take from them.", next = "BACK", fx = { affinity = 2 } } },
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
        { id = "w_default", text = "A home no one can take from us, freedom from the Lich King's voice, and his ruin, slowly, piece by piece. Is that so much, after what was done to us?" },
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
      lines = { { id = "ar_default", text = "He burned my people's forests and murdered them in their homes, and then he made me into this and made me watch. I'll say no more of it, not to you and not to anyone." } },
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
      lines = { { id = "xhsham_default", text = "I was a spirit myself for a time, bound and wailing at Arthas's heel, and nothing about that time was balanced. Turn your elements on the Scourge and I will call you an ally, but do not speak to me of harmony with the dead, because the dead in this city have had their fill of other people's harmony." } },
      choices = {
        { text = "The Scourge, then. My elements will answer for your people.", next = "BACK", reply = "Good. That is all the harmony I ask of anyone.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Balance is the Horde's way, my lady, whether it suits you.", next = "BACK", reply = "Then the Horde may keep its balance, and I will keep my vengeance. We need not share either.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Their voice in the Horde, and their patience, which they have in greater supply than the orcs. They speak of healing us, and I let them, because a people who wish to heal you will rarely wish to burn you; whether I wish to be healed is a question for another day." } },
      choices = {
        { text = "Their hope is honest, my lady. Don't spend it cruelly.", next = "BACK", reply = "I will spend it carefully, because it is rarer than gold in Lordaeron. Their hope is safe with me, for now.", fx = { align = { honor = 1 } } },
        { text = "Use their hope, then. The Forsaken need allies.", next = "BACK", reply = "We do, and the tauren are the best of them. I will be gentle with their hope, for as long as it serves us.", fx = { affinity = 1, align = { honor = -1 } } },
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
        { text = "I serve you, my lady, and not Dalaran.", next = "BACK", reply = "Good. Dalaran has had enough of its mages' loyalty, and it squandered it.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I serve my own studies first, my lady.", next = "BACK", reply = "Then study well, and remember whose city shelters your studies.", fx = { affinity = -1, align = { order = -1 } } },
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
      lines = { { id = "va_default", text = "A dreadlord who ruled these ruins with his brothers while I was still learning to be free, and who begged for his life when I came for them, which his brothers lacked the wit to do. He knows every passage beneath this city and the Legion's secrets, so he lives, and serves, and calls me his queen very prettily." } },
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
      lines = { { id = "ap3_default", text = "Then we agree, which should comfort you, and it is why my deathstalkers guard the Apothecarium as closely as they guard me. The Alliance would pay dearly to know what Faranell keeps in his cellars, and they will never learn it." } },
      choices = { { text = "Something else, my lady.", next = "BACK" } },
    },
    scarlet = {
      lines = {
        { id = "sc_default", text = "Zealots who survived the plague and decided the Light had spared them to burn everything that moves wrongly, which in Tirisfal means us. They hold the monastery north of these glades and Hearthglen beyond, and they kill my people with the same fervour they save for the Scourge, for they cannot tell us apart.", fx = { learn = { "scarlet_crusade" } } },
        { id = "sc_priest", when = { origin = "forsaken_chapel_priest" }, text = "You preached the same Light they burn us in the name of, and I suspect you knew some of them, which makes them your concern before anyone's. They hold the monastery in the north of these glades and kill my people as gladly as they kill the Scourge.", fx = { learn = { "scarlet_crusade" } } },
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
        { text = "Spare those who yield, my lady. We're better than them.", next = "BACK", reply = "Some of my people would agree, and I let them believe it. We are not the Crusade, and that matters a little.", fx = { align = { light = 1 }, opinion = { scarlet_crusade = "mercy" } } },
        { text = "They chose their war. Let them have all of it.", next = "BACK", reply = "Then they will have it, every bitter drop. The Crusade never once offered us a choice.", fx = { affinity = 1, align = { light = -1 }, opinion = { scarlet_crusade = "hardline" } } },
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
        { id = "fr_default", text = "His power waned for reasons I have never learned, and the chains slackened, and I was the first to slip them. I gathered the dead who woke beside me with their own minds, and I named them the Forsaken, because that is what the world had made of us." },
        { id = "fr_scourge", when = { origin = "forsaken_scourge_remembered" }, text = "You remember your time under him, as I do, every village and every face, so I'll tell you what I tell myself: the hand that did those things was yours, but the will was his, and he will answer for both." },
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
      lines = { { id = "dl_default", text = "Three dreadlords of the Legion, left behind to rule the ruins, and they thought me a useful servant who'd forgotten to stay dead. I turned them against each other, and I allied with a human called Garithos, a Grand Marshal of the Alliance's leftovers who hated the dead, and together we drove the demons out of the capital." } },
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
        { text = "Would you hear what I think of Thrall, my lady?", next = "op_warchief" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    thrall_truth = {
      lines = { { id = "tt_default", text = "Thrall is an honest king, which is rarer than a living one here, and dangerous, because honest kings expect honesty back. He was a slave and remembers it, so he looks at my people and sees chains where I see a weapon, and I have never corrected him; his pity has served us better than his respect would." } },
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
      lines = { { id = "tx_default", text = "The Warchief is our ally, and I speak of him as such to strangers. You will need to be considerably less of one before I say more." } },
      choices = { { text = "As you say, my lady.", next = "BACK" } },
    },
    cairne = {
      lines = { { id = "ca_default", text = "Cairne and his Arch Druid spoke for my people when the orcs would have left us in the ruins, and the old bull speaks of curing us as though we were sick and not dead. I am wary of kind people, but I've never caught him lying, which is more than I can say of any king I knew in life." } },
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
        { text = "The Horde has kept faith, my lady. Keep faith with it.", next = "BACK", reply = "Faith with the Horde is kept, for now, because it serves us both. I will decide when it no longer does.", fx = { align = { honor = 1 }, opinion = { forsaken_horde = "loyal" } } },
        { text = "Trust only your own, my lady. The living forget.", next = "BACK", reply = "The living do forget, and they forget quickest when it suits them. I will not let my people forget that.", fx = { affinity = 1, align = { honor = -1 }, opinion = { forsaken_horde = "wary" } } },
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

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You flatter well, and I have heard a great deal of flattery, in two lifetimes and from better courtiers than you. I find that I do not mind it today, so you may stay a while longer." },
        { id = "s2", text = "My rangers used to say such things to me in Quel'Thalas, and they meant them, as I think you do. Very well; it is noted, and the Dark Lady does not forget who spoke well of her." },
        { id = "s3", when = { race = "Scourge" }, text = "It is no small thing to hear that from one of my own, who knows precisely what our freedom cost. Stand a little straighter, because you have pleased your queen." },
      },
      fail = {
        { id = "f1", text = "Kings were flattered to death in the palace above us, and I do not intend to share their fate. Say what you came for, and leave the honey for the living." },
        { id = "f2", text = "I know the sound of a courtier who wants something, because I listened to it for years in Silvermoon. It bored me then, and death has not improved my patience." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "You have a sharp tongue, and you use it in front of my guards, which is either courage or a wish to be buried twice. I am amused, and that happens seldom enough that I shall let you keep the tongue." },
        { id = "s2", text = "Few dare to needle the Banshee Queen in her own throne room, and fewer still do it well. You have some spine in you, and I have uses for those who do." },
      },
      fail = {
        { id = "f1", text = "Arthas mocked me while I lay dying, and I have had my fill of mockery ever since. Guard your tongue in my city, or my Deathguard will show you how quiet the canals are." },
        { id = "f2", text = "You mistake my patience for weakness, as the living so often do. Speak to me that way again, and Varimathras will be given the pleasure of correcting you." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "So there are teeth behind that face after all. I do not frighten, but I do take note of those who are willing to try it here, and I have noted you." },
        { id = "s2", narr = "She studies you for a long moment, and she does not blink.", text = "You would lean upon the Dark Lady herself, in the heart of her own city. I am not shaken, but I am interested, and that is worth rather more to you." },
      },
      fail = {
        { id = "f1", text = "I have stood before Arthas with his blade through my body, and you imagine that you can make me afraid. Lower your eyes and your voice, before I lose what little patience I have left." },
        { id = "f2", text = "Threats are for those who cannot carry them out, and you are standing far beneath the earth among my Deathguard. Do not try that with me again." },
      },
    },
  },
  confides = {
    { id = "cnf_1", text = "Varimathras reports to me faithfully, which is precisely why I have my banshees report on Varimathras." },
    { id = "cnf_2", text = "The Deathstalkers answer to me alone, not to the Executors and not to the Horde, and they go where even my Deathguard are not sent." },
    { id = "cnf_3", text = "The Bulwark in the Western Plaguelands holds by a thread, and if it ever breaks, the Scourge will be in Brill before the Executors have finished arguing." },
  },
  blurts = {
    { id = "bl1", text = "Of the three dreadlords who held Lordaeron, I broke Detheroc and Varimathras bent the knee, but Balnazzar slipped away. Bring me word of where he hides, and I may yet forget my displeasure." },
    { id = "bl2", text = "Kel'Thuzad still serves his master from Naxxramas, high above the Plaguelands, and he will answer to me before the end. Until then the Scourge in the east are his, and the Bulwark is all that stands before them." },
    { id = "bl3", text = "My apothecaries are brewing something for the Scourge, and for whoever else stands in my way. Be grateful you know even that much." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you are useful, {name}, and I have learned to value usefulness above affection. That I trouble to say so at all should tell you more than the words." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You have done what I asked without needing to be asked twice. Few of the living manage that, and fewer of the dead." },
      { id = "rg_scourge", when = { race = "Scourge" }, text = "You clawed your way out of the Lich King's grip as I did, and you have made something of the freedom. That is all I have ever asked of my people." },
      { id = "rg_al_dark", when = { alignment = { axis = "light", max = -30 } }, text = "You do not shrink from the dark, and you do not pretend to be cleaner than you are. I find that honest, which is more than I can say of the Light's servants." },
      { id = "rg_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "You still carry the Light about you like a lantern, which is a curious thing to bring into my court. Keep it, if it helps you, but do not expect me to warm my hands at it." },
    },
    confide = {
      { id = "cf_1", text = "I do not sleep, {name}, and the nights beneath Lordaeron are very long. I spend most of them listening to my banshees repeat what my subjects say when they think I cannot hear." },
      { id = "cf_2", text = "This throne room was a crypt for Lordaeron's kings before it was mine. I had their bones moved, not out of respect, but because I did not care to rule above them." },
    },
    trust = {
      { id = "tr_1", text = "Trust my Deathguard, who died for Lordaeron once and will die for me a second time without complaint. Trust my apothecaries with their work, and with nothing else." },
      { id = "tr_2", text = "Trust no one who tells you how gladly they serve me. Those who truly serve me do it coldly, as I would, and without needing to say so." },
      { id = "tr_horde", when = { faction = "Horde" }, text = "The tauren elders who spoke for us, and your Warchief, as far as he goes. The rest of the Horde still flinch when my people pass, and flinching is not the same as faith." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the Scarlet Crusade, who burn any Forsaken they take and call it mercy. Their monastery in Tirisfal stands closer to this throne than I would like." },
      { id = "wo_2", text = "Watch the canals in the lower rings. Things fall into that green water that are not always meant to come out again." },
      { id = "wo_3", text = "Watch Hillsbrad, where the humans of Southshore pretend the war ended with the last one. Tarren Mill is all that reminds them otherwise." },
    },
    worries = {
      { id = "wy_1", text = "I do not worry, {name}; I calculate. Still, I calculate how long the Horde will tolerate us, and the sum is never as comfortable as I would wish." },
      { id = "wy_2", text = "Arthas sits on his throne of ice while I rule a city of the dead beneath a ruin. Some nights I wonder whether I am free of him, or only far from him." },
      { id = "wy_3", text = "My people break, sometimes, when their memories come back too sharply. I cannot make them whole, and I dislike very much the things I cannot do." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to stand over Arthas when he falls and watch him understand what he made of me. Beyond that, hope is a luxury I leave to the living." },
      { id = "hp_2", text = "A homeland for my people, where no Crusader's torch reaches and no master's voice can find them. Lordaeron will serve, once it has been cleansed." },
    },
    favor = {
      { id = "fv_1", text = "Kill the Scourge wherever you find them, and the Scarlets wherever they find you. Each one you put down is a debt I note, and I keep my accounts well." },
      { id = "fv_2", text = "When the living ask you what the Forsaken are, tell them the truth: that we were murdered and refused to stay so. My people have few enough voices above ground." },
    },
    friendship = {
      { id = "fr_1", text = "I had friends once, {name}, and the plague took every one of them. I will not call you that, but I will say that I would notice if you did not return." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You have stood by my people when it cost you something. If I still kept friends, you would be counted among them, and that is as near as I come." },
      { id = "fr_al_dark", when = { alignment = { axis = "light", max = -30 } }, text = "You walk the shadows I walk, and you have not once flinched. That is nearer to friendship than anything I have offered anyone since Silvermoon." },
    },
    never_told = {
      { id = "nt_1", text = "When Arthas raised me, there was a moment, before his will closed over mine, when I might have let go and simply died. I did not, and some nights I am no longer sure it was strength that held on." },
      { id = "nt_2", text = "I cannot feel the sun when I stand in it now. Of everything Arthas took from me, that is the smallest, and it is the one I mind on the quiet nights." },
    },
    grievance = {
      { id = "gv1", text = "You have disappointed me, and I am not accustomed to repeated disappointments. That you still stand in my court is a courtesy, not a promise." },
      { id = "gv_enemy", when = { grudge = "enemy" }, text = "You are of the Alliance, which once called my people abominations and still does. You stand here because I allow it, and for no other reason." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You spoke to me as though I were some petty warlord to be lectured. I was Ranger-General of Silvermoon before you were born, and I am queen of the Forsaken now." },
      { id = "gv_pers", when = { grudge = "persuade" }, text = "You tried to bend my will with words, as Arthas once bent it with steel. He failed in the end, and so have you." },
    },
    amends = {
      { id = "am1", text = "Serve the Forsaken, and serve them well, and do not make me ask twice. My memory is long, but it does keep accounts of loyalty." },
      { id = "am_enemy", when = { grudge = "enemy" }, text = "There is nothing you can do while you wear their colours. Some debts are owed by whole kingdoms." },
    },
    spite = {
      { id = "sp1", text = "I think you are a pawn who believes itself a player, and I have outlived far greater pieces than you. Go, before I decide what you are worth to me." },
      { id = "sp_enemy", when = { grudge = "enemy" }, text = "I think your kings left Lordaeron to die and now pretend they were never here. You are what remains of their conscience, and it is very small indeed." },
    },
    humans = { { id = "tp_humans", text = "Most of my people were human once, and their living kin have answered them with torches and the Crusade's pyres. I expect nothing from humanity, and so far it has never disappointed me." } },
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
    scourge = {
      { id = "tp_scourge", text = "The Scourge is the Lich King's will made flesh, and once it was mine as well. I broke that will, and I mean to see every last thread of it cut." },
      { id = "tp_scourge2", when = { race = "Scourge" }, text = "You know the silence that came when the voice left you, because I gave it to you. Remember who gave it, when your loyalty is tested." },
    },
    forsaken = { { id = "tp_forsaken", text = "My people were the Lich King's slaves, and now they are free, and they owe that freedom to no one but themselves and to me. The living call us monsters, and they may call us what they like, so long as they keep out of our way." } },
    arthas = {
      { id = "tp_arthas", text = "Arthas killed me on the road to Silvermoon and then made me his servant, and I will not rest until I have repaid him in full. He went north to his master, and one day I will follow him there." },
      { id = "tp_arthas2", when = { disposition = { min = 65 } }, text = "He took everything I had, my people, my death and my peace, and he did it smiling. I will be there when he falls, and he will know my face." },
    },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad holds the east from Naxxramas and sends his Cult to teach the living to die. He served the Lich King before Arthas ever did, and his death is on my list, though not at the top." } },
    thrall = {
      { id = "tp_thrall", text = "The orcish Warchief offered us a place in his Horde, and I accepted, because enemies on every side is a poor position even for the dead. He is an honorable sort, which is useful, and I intend to keep him that way." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "Your Warchief is an honorable sort, and I trust him further than I trust most of the living. That is not very far." },
    },
    lordaeron = { { id = "tp_lordaeron", text = "This was once the greatest kingdom of men, and now it lies in ruins above my throne room. I've no wish to restore it, only to keep what is left out of the Lich King's hands." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme is where Arthas first proved what he was, and the Scourge holds it still. The Crusade throws its zealots at the gates, and I do not mourn them." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages hide behind their shields while they rebuild, and they claim the lands of Silverpine as their own. They forget that I remember what they did, and failed to do, when the plague came." } },
    jaina = { { id = "tp_jaina", text = "Jaina Proudmoore led the living west to Kalimdor while Lordaeron burned. She has her island and her peace with the orcs, and she will not trouble me, if she is wise." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof spoke for my people in the Warchief's councils, when the others would have turned us away. I don't forget a debt, and that is one." } },
    _none = { { id = "tp_none", text = "That isn't my concern. Varimathras will tell you if it should be." } },
    _gated = {
      { id = "gt1", text = "That is not a matter I discuss with those who have yet to prove themselves to me. Serve the Forsaken well, and perhaps I shall think it worth my breath." },
      { id = "gt2", text = "You ask too much for one who has done so little, and I will not speak of it. Earn my regard first, and then ask again." },
    },
  },
}

P:NPC {
  key = "varimathras", id = TODO_NPC("Varimathras"), name = "Varimathras",
  bible = "bibles/undercity.md", role = "noble", tier = "major",
  communities = { "undercity" }, temper = { "arrogant" }, values = { "proud" },
  likesTone = "polite", private = { "burning_legion" },
  notices = { "class", "fel" },
  impression = {
    first = "He is courteous the way a cat is to a mouse.",
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
    xalt_varimathras = {
      lines = {
        { id = "xalt_varimathras_default", text = "I keep notes on everyone, and the Dark Lady is grateful for it, or so I choose to believe. Your friend was polite and asked few questions, which is the kind of guest I like best." },
        { id = "xalt_varimathras_kin", when = { alt = { kin = true } }, text = "{alt} asked a great many questions about the Royal Apothecary Society, and I answered each with a smile and very little else. If you are family, you might tell them that curiosity is not always rewarded in the Undercity." },
      },
      choices = {
        { text = "My kin have nothing to hide from the Dark Lady.", next = "BACK", reply = "Then they will not mind being watched. The Dark Lady likes nothing better than an open book.", fx = { align = { honor = 1 } } },
        { text = "Everyone has secrets, Varimathras, yourself most of all.", next = "BACK", reply = "Oh, most of all, little one, and I keep them beautifully. Do mind your own.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    op_sylvanas = {
      big = true,
      lines = {
        { id = "opsy_default", text = "I watch everyone closely, mortal, and I am watching you now. Tell me what you think of our queen, and choose your words with care, because I collect them." },
      },
      choices = {
        { text = "She's the only reason the Forsaken still exist.", next = "op_sylvanas_r1", fx = { align = { order = 1 }, opinion = { sylvanas = "admire" } } },
        { text = "She trusts a dreadlord. That's not wisdom, it's desperation.", next = "op_sylvanas_r2", fx = { affinity = -1, align = { order = -1 }, trait = { skeptical = 1 }, opinion = { sylvanas = "distrust", varimathras = "distrust" } } },
        { text = "She's a fine ally while she hates the Scourge more than us.", next = "op_sylvanas_r3", fx = { trait = { practical = 1 }, opinion = { sylvanas = "wary" } }, when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'll keep my thoughts about the Dark Lady to myself.", next = "BACK" },
      },
    },
    op_sylvanas_r1 = {
      lines = { { id = "opsy_r1", text = "A loyal answer, and loudly given. I'll see that the Dark Lady hears it, as I hear everything that's said in her halls." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_sylvanas_r2 = {
      lines = { { id = "opsy_r2", text = "Desperation built this city, mortal, and desperation keeps me useful to her. Mind your tongue, though, because she trusts me a great deal more than she will ever trust you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_sylvanas_r3 = {
      lines = { { id = "opsy_r3", text = "So the living do understand her after all. Hatred is the most reliable bond there is, and hers runs deeper than any oath your Warchief could ask of her." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_varimathras = {
      big = true,
      lines = { { id = "xpt_varimathras_default", text = "Sworn, are you? Oaths are easy things to make in a throne room and hard things to keep in the field, as the Dark Lady learned when Arthas's servants wore her people like puppets. Keep your companions honest, and I'll have no reason to learn their names." } },
      choices = {
        { text = "We keep our oaths. Watch us all you like.", next = "BACK", reply = "Of course you do, and I shall watch you all the same. It passes the time.", fx = { align = { honor = 1 } } },
        { text = "Oaths bend when they must. Surviving comes first.", next = "BACK", reply = "How refreshingly honest, and how very like a survivor. You and I may understand each other after all.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_cath = {
      big = true,
      lines = { { id = "xcl_cath_default", text = "And how splendidly you managed it. The Crusade believed its faith made it untouchable, and there is nothing quite so instructive as watching a zealot discover she was wrong. The Dark Lady's enemies in Tirisfal have lost their heart, and I shall make certain she remembers whose hand held the knife." } },
      choices = {
        { text = "I did it for the Dark Lady, and for no one else.", next = "BACK", reply = "Of course you did, and I shall be sure to tell her so. She does enjoy hearing about her loyal servants.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I did it for myself. The court can take what credit it likes.", next = "BACK", reply = "How candid. The court will take all of it, I promise you, and you'll be grateful for the leftovers.", fx = { align = { order = -1 } } },
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
        { text = "The Dark Lady has my loyalty, Varimathras.", next = "BACK", reply = "As does mine, little priest. We are all her loyal servants here.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My faith answers to me, not to any throne.", next = "BACK", reply = "A dangerous creed in a city with a throne. I'll remember you said it.", fx = { align = { order = -1 } } },
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
        { text = "I hunt for the Dark Lady, Varimathras, not for appetite.", next = "BACK", reply = "Of course you do. Appetite is such an unbecoming word for loyalty.", fx = { align = { honor = 1 } } },
        { text = "Every hunter hungers, dreadlord. Mine's no secret.", next = "BACK", reply = "No, it isn't, and that is precisely what I like about you. Hunt well, mortal.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_any", tags = { "news" }, when = { alt = true },
          text = "How curious. One called {alt} passed through these halls, a {altclass} as I recall, and I made a careful note of them, as I note everyone who comes before the Dark Lady." },
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "You bear a remarkable likeness to {alt}, the {altclass} who came here before you. I do so enjoy a family resemblance, since it tells me where to find the rest of the family." },
        { id = "o_softwc", tags = { "news" }, when = { gossip = { topic = "warchief", stance = "soft" } }, text = "I'm told you think the orc Warchief has grown soft. Say it louder, mortal; I do so enjoy watching the Horde find its own seams." },
        { id = "h_pt_band", tags = { "news" }, when = { party = { size = 4 } },
          text = "A whole band of you, filling my lady's halls with your breathing. I do hope you're all as loyal as you look, because the Dark Lady keeps very careful accounts of who comes and goes." },
        { id = "h_default", key = true,
          text = "You address Varimathras, majordomo to the Dark Lady and her most loyal servant. I keep her city safe from its many enemies, and serve her in all things." },
        { id = "h_deathstalkers", tags = { "news" }, when = { questActive = TODO_QUEST("The Deathstalkers") },
          text = "The Deathstalkers are the Dark Lady's eyes and blades. Go where they send you and do what they ask, and then tell me what they tell you." },
        { id = "h_hillsbrad", when = { questActive = TODO_QUEST("Battle of Hillsbrad") },
          text = "The living cling to Hillsbrad like rats to a ship. Help High Executor Darthalia sink it." },
        { id = "h_alliance", when = { questActive = TODO_QUEST("An Unholy Alliance") },
          text = "An alliance between the Scourge and the quilboar of Razorfen? How very unholy. Break it before it learns to stand." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Royal Quarter. Your people knelt to my kind once and then changed their minds, which I have always found rather ungrateful." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You smell of grass and wet fur, which is a novelty down here, though not one I'd ask you to repeat." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. I have watched a great many mortal hunters stalk their prey, {class}, and I confess I still find it charming." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, before me. How interesting, because I have watched mortals pray to many things, and I have never once seen those things answer quickly." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Hillsbrad", min = 30 } }, text = "Hillsbrad's farmers and footmen fall before you rather efficiently, I'm told. The Dark Lady will be pleased, and I make a point of remembering those who please her." },
        { id = "h_cl_cath", tags = { "news" }, when = { cleared = "Scarlet Cathedral", faction = "Horde" },
          text = "The High Inquisitor has fallen, and her commander with her, and the Dark Lady was pleased to hear it from my lips before anyone else's. I do so enjoy delivering good news, and you have given me so much to deliver." },
        { id = "h_dd_rep", when = { reputation = { faction = "Undercity", min = "revered" } },
          text = "Your name comes up in the Royal Quarter more often than you might find comfortable. The Dark Lady thinks well of you, and I, of course, think whatever she thinks." },
      },
      choices = {
        { text = "You've been keeping notes on someone I know?", next = "xalt_varimathras", when = { alt = true } },
        { text = "What do you think of mortal priests, Varimathras?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you miss your hold on the orcs, dreadlord?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does a dreadlord make of the Emerald Dream?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You have your guards, Varimathras. I have my shield.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "A dreadlord serving the Dark Lady seems unlikely.", next = "serve" },
        { text = "I hold demons on a leash too, dreadlord.", next = "warlock", when = { class = "WARLOCK" } },
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
        { text = "The Dark Lady will hear of it first, dreadlord. Not you.", next = "BACK", reply = "Naturally, as any loyal servant would. I'll hear about it soon enough regardless.", fx = { affinity = -2, align = { order = 1 } } },
        { text = "If something larger answers, you'll be the first to know.", next = "BACK", reply = "How very wise of you. I'll be waiting, as I always am.", fx = { affinity = 2, align = { order = -1 } } },
      },
    },
    paladin = {
      lines = { { id = "pa_default", text = "Trouble me? It offends me, which is not the same thing. The Light is so very loud, and it insists on itself everywhere. Do keep it sheathed in my presence, and we'll get along as well as anyone does with me." } },
      choices = {
        { text = "The Light goes where I go, dreadlord.", next = "BACK", reply = "Then you go noisily, paladin, and I'll hear you coming from three halls away. How convenient.", fx = { affinity = -2, align = { light = 1 } } },
        { text = "As you wish. I'll keep it sheathed.", next = "BACK", reply = "A gracious answer. We shall get along splendidly, you and I.", fx = { affinity = 1, align = { light = -1 } } },
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
        { text = "You watch the court very closely, dreadlord.", next = "op_sylvanas" },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "How refreshingly blunt, warrior. A shield is an honest thing, at least, and the Dark Lady values honest things, or so she tells me. Lean on it as you like; just don't lean on me." } },
      choices = {
        { text = "My shield serves the Dark Lady, and so do I.", next = "BACK", reply = "How touching. I'm sure she's very grateful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My shield serves me. Remember that, demon.", next = "BACK", reply = "I'll remember it, warrior, which you may come to regret. Demons have excellent memories.", fx = { align = { order = -1 } } },
      },
    },
    answer = {
      lines = { { id = "an_default", text = "That is precisely the answer you're getting. Now go and be useful elsewhere." } },
      choices = { { text = "...", next = "END" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Miss it? My dear shaman, I serve the Dark Lady now, faithfully and gladly, and the Legion's affairs are no concern of mine. Still, I do remember how eagerly the orcs drank, and I wonder now and then how thirsty their children are." } },
      choices = {
        { text = "We'll never drink again, dreadlord. Not one drop.", next = "BACK", reply = "A noble vow, shaman, and I'm sure you'll keep it. Your fathers made such vows too, before the cup came round.", fx = { align = { light = 1 } } },
        { text = "A strong people takes power wherever it finds it.", next = "BACK", reply = "How very wise, and how very like your fathers. I do hope you find a generous supplier.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Very little, I'm pleased to say. Dreams are where the weak go to hide from the world, and from what I hear of your Wailing Caverns, even the dreamers have started having nightmares, so do sleep well, druid." } },
      choices = {
        { text = "The Dream is sacred. Mock it at your peril.", next = "BACK", reply = "At my peril? How deliciously dramatic. I'll mock it quietly, then, so as not to wake anyone.", fx = { align = { light = 1 } } },
        { text = "Dreams are for the weak. On that, we agree.", next = "BACK", reply = "How splendid to find a druid with sense. We shall get along famously.", fx = { affinity = 1, align = { light = -1 } } },
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
        { text = "Her enemies' names will reach her through you.", next = "BACK", reply = "Splendid. I'll see they reach her, in time.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll bring my findings to the Dark Lady myself.", next = "BACK", reply = "Of course you will, little knife. I'll be in the room when you do.", fx = { align = { order = -1 } } },
        { text = "A dreadlord serving the Dark Lady seems unlikely.", next = "serve" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "How perceptive of you, and how rare it is to find good judgment in a mortal. Do go on; I have had centuries of practice at listening to praise, and I never tire of it." },
        { id = "s2", text = "You have a courtier's tongue, little one, and I confess I had missed the sound of one in this city of sour corpses. I shall remember you kindly, for whatever that is worth." },
      },
      fail = {
        { id = "f1", text = "I was flattering princes long before your kind had learned to walk upright, so you will forgive me if I find your efforts clumsy. Try them on the apothecaries, who are starved for it." },
        { id = "f2", text = "Such sweet words, and so transparently meant to buy something. I serve the Dark Lady, mortal, and my good opinion is not for sale at that price." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Oh, how delightful, the mouse has decided to pull the cat's whiskers. You have nerve, and I do so enjoy nerve, especially while it lasts." },
        { id = "s2", text = "It has been an age since anyone in this dreary court dared to bait me. You amuse me, mortal, and that has kept creatures far smaller than you alive." },
      },
      fail = {
        { id = "f1", text = "You forget what you are speaking to, and I assure you that is a dangerous thing to forget. Only my boundless loyalty to the queen keeps your skin where it is." },
        { id = "f2", text = "Careful, little one. The Dark Lady asks that I suffer her guests, but she has never asked me to suffer them gladly, nor for very long." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", narr = "His wings shift, and he inclines his head by a fraction.", text = "My, what a fierce little creature you are. I am in no danger, of course, but I shall choose my words with you a touch more carefully, purely out of courtesy." },
        { id = "s2", text = "I always choose wisely, and it would be unwise to make an enemy of someone the Dark Lady finds so useful. Consider me suitably cautioned, mortal." },
      },
      fail = {
        { id = "f1", text = "You threaten a dreadlord in his queen's own hall, and I find it almost charming. Do run along, before I begin to find it tiresome instead." },
        { id = "f2", text = "I have watched worlds burn, mortal, and you propose to frighten me with a scowl. Take it elsewhere; the Deathguard may be impressed, though I rather doubt it." },
      },
    },
  },
  alignment = { light = -1, honor = -1 },
  confides = {
    { id = "cnf_1", text = "Half the petitioners who wait in the Royal Quarter never reach the throne, because I decide which of them my queen should see." },
    { id = "cnf_2", text = "The Apothecarium's deepest vault is sealed by the Dark Lady's own order, and not even Faranell is permitted to enter it alone." },
    { id = "cnf_3", text = "The bat handlers in the Trade Quarter keep a ledger of every flight, and that ledger finds its way to me each evening." },
  },
  blurts = {
    { id = "bl1", text = "My brother Balnazzar did not perish, whatever the court believes; he hides among the Scarlet Crusade in Stratholme, behind a crusader's face. The Dark Lady knows it, naturally, for I keep nothing from her." },
    { id = "bl2", text = "The Dark Lady's banshees listen in every corridor of this city, and nothing said in the Undercity stays private for long. You might remember that before you speak of me again." },
    { id = "bl3", text = "Lord Kazzak gathers what the Legion left behind in the Blasted Lands, in the shadow of the Dark Portal. I mention it only so that you know which direction not to wander." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you are a remarkably durable mortal, which in this city is very nearly a compliment. The Dark Lady values you, and so, naturally, do I." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You have made yourself useful to my queen time and again, and I always notice who is useful. I always choose wisely, after all, and I find I have chosen to like you." },
      { id = "rg_tone", when = { fondness = "tone" }, text = "You address me properly, which is so rare among the living that I had almost forgotten the pleasure of it." },
      { id = "rg_al_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "You understand that a truth told at the wrong moment is merely a blunder. We could have such interesting conversations, you and I." },
      { id = "rg_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "You glow with the Light, mortal, rather like a candle left burning in a cellar, and I confess the effect is almost touching. Do keep it away from my robes." },
    },
    confide = {
      { id = "cf_1", text = "The Royal Quarter has more doors than any visitor ever counts, and I know every one of them. A majordomo must, you understand, purely for my queen's safety." },
      { id = "cf_2", text = "I have lived longer than your oldest kingdom, and I have served more than one master in that time. Each was wiser than the last, and my queen, of course, is the wisest of them all." },
    },
    trust = {
      { id = "tr_1", text = "Trust the Dark Lady absolutely, as I do. Everyone else in the Undercity is merely ambitious, which is a very different thing." },
      { id = "tr_2", text = "Trust the Deathguard to be dull and loyal, and the apothecaries to be clever and neither. As for me, I am entirely at my queen's service, as everyone knows." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the banshees in the corridors, mortal, for they carry every careless word straight to the throne. I mention it as a kindness, which you will find I rarely do." },
      { id = "wo_2", text = "Watch the Blasted Lands, should your wanderings take you south. What the Legion leaves behind does not sleep, whatever the mortals of Nethergarde like to believe." },
      { id = "wo_3", text = "Watch anyone who smiles at you too readily in this city. The dead do not smile without a reason, and the reason is seldom yours." },
    },
    worries = {
      { id = "wy_1", text = "Worry is a mortal habit, and I set mine aside a very long time ago. If anything troubles me, it is that my queen's enemies multiply faster than her servants do." },
      { id = "wy_2", text = "Kel'Thuzad still broods in Naxxramas, and liches have long memories for old acquaintances. I would prefer he never found occasion to remember mine." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to see my queen's dominion stretch from the Tirisfal Glades to the gates of Stratholme. A loyal servant hopes for nothing else, naturally." },
      { id = "hp_2", text = "I hope for a world in which the strong rule and the clever advise them. I believe I am rather well suited to such a world." },
    },
    favor = {
      { id = "fv_1", text = "Speak well of me to the Dark Lady, should the occasion arise. It costs you nothing, and I do keep a careful record of such kindnesses." },
      { id = "fv_2", text = "Tell me what you hear in Brill and Tarren Mill, the little grumbles of the Executors. My queen likes to know, and I like to be the one who tells her." },
    },
    friendship = {
      { id = "fr_1", text = "Friendship is a mortal word, and I find it rather sweet. Let us say instead that I would be sorry to see you dead, and leave it there." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You have done more for this court than most of its courtiers. If I were to choose a friend among the living, and I always choose wisely, it might very well be you." },
      { id = "fr_al_cunning", when = { alignment = { axis = "honor", max = -30 } }, text = "You and I understand one another, mortal, and that is worth more than any friendship I have seen among your kind." },
    },
    never_told = {
      { id = "nt_1", text = "When the Dark Lady broke my brother Detheroc, I knelt before she had finished drawing her bow. I have never told anyone how quickly, because it was very quick indeed." },
      { id = "nt_2", text = "I do sometimes miss the skies of the Nether, which burned in colours your eyes could not hold. You will forgive me for not describing them further, I trust." },
    },
    grievance = {
      { id = "gv1", text = "You have bored me, mortal, which is the one crime I find truly unforgivable. The Dark Lady's tolerance is hers, and mine is rather shorter." },
      { id = "gv_tone_b", when = { grudge = "tone", tone = "blunt" }, text = "You address me as you would a goblin peddler in the Trade Quarter. I have served greater masters than you can imagine, and none of them spoke to me so." },
      { id = "gv_pers", when = { grudge = "persuade" }, text = "You attempted to manipulate me, mortal, as though I had not been doing it since before your kingdoms were founded. It was almost charming, and then it was merely tiresome." },
      { id = "gv_values", when = { grudge = "values" }, text = "You have the morals of a crusader and the manners of a ghoul. I cannot decide which offends me more." },
    },
    amends = {
      { id = "am1", text = "Make yourself useful to the Dark Lady, and do it with a little grace. I may then remember you less unkindly." },
      { id = "am_tone_b", when = { grudge = "tone", tone = "blunt" }, text = "Learn to address your betters with proper courtesy. It is a small thing, and small things are all I expect of you." },
    },
    spite = {
      { id = "sp1", text = "I think you are a short-lived, short-sighted creature who mistakes being tolerated for being liked. In a century no one will remember your name, and I shall not try." },
      { id = "sp_values", when = { grudge = "values" }, text = "I think you would sell your own soul for a sharper sword, and the buyer would still be overcharged." },
    },
    knows = {
      { id = "tp_knows", text = "Everything in this city passes through my hands on its way to the Dark Lady, faithfully, as always. Ask, and I will share what she would wish you to know." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "The Dark Lady values you, and therefore so do I, naturally. Ask me anything you like." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I will answer, though purely out of loyalty to my queen, which, I assure you, is boundless." },
    },
    sylvanas = { { id = "tp_sylvanas", text = "My queen is the wisest ruler on this world, and I am honored, deeply honored, to serve her. I always choose wisely, and I chose her." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are a remarkable people, so determined, so very loyal. I am privileged to have a place among them, however humble." } },
    scourge = { { id = "tp_scourge", text = "The Scourge was a crude instrument, and I never cared for its methods. My queen has freed her people from it, and I serve her gladly." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Legion is a name I would rather not speak in my queen's halls. I have left that past behind me entirely, I assure you." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad is a tiresome lich who thinks himself the master of the east. My queen will deal with him in her own time, and I will be there to help." } },
    arthas = { { id = "tp_arthas", text = "Arthas is my queen's great enemy, and therefore mine. I have nothing more to say about him, except that he deserves everything that is coming to him." } },
    thrall = { { id = "tp_thrall", text = "The orc Warchief is a useful ally, and my queen values his friendship. I find him rather earnest, but earnestness has its uses." } },
    dalaran = { { id = "tp_dalaran", text = "The Kirin Tor are clever little creatures who think their shields will keep them safe. They may even be right, for now." } },
    _none = { { id = "tp_none", text = "That is beneath my notice, and possibly beneath yours. Ask an apothecary." } },
    _gated = {
      { id = "gt1", text = "That is a matter for the Dark Lady's trusted servants, and you are not yet numbered among them. I shall say nothing of it, however prettily you ask." },
      { id = "gt2", text = "I think not, mortal. There are things I discuss only with those who have proven their worth to my queen, and you have a little way to go." },
    },
  },
}

P:NPC {
  key = "faranell", id = TODO_NPC("Master Apothecary Faranell"), name = "Master Apothecary Faranell",
  bible = "bibles/undercity.md", role = "scholar", tier = "major",
  communities = { "undercity" }, temper = { "theatrical" }, values = { "curious", "proud" },
  notices = { "craft", "race" },
  impression = {
    first = "His cheer is bright enough to hide what he is brewing.",
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
    dd_pain = {
      lines = { { id = "dd_pain_default", text = "For pain, {class}, as the name rather plainly says. Lydon tests his small brews on Hillsbrad's beasts, and each result tells the Society a little more about how the living suffer, which we will need to know very precisely one day." } },
      choices = {
        { text = "The living earned whatever the Society brews for them.", next = "BACK", reply = "Spoken like a true servant of the Dark Lady. Run along, and do send Lydon more of whatever he asks for.", fx = { align = { light = -1 } } },
        { text = "I fetched those reagents for Lydon. I didn't sign up for cruelty.", next = "BACK", reply = "You signed up the moment you handed him the first vial. Conscience is an expensive habit down here, {class}, and the Society does not cover it.", fx = { align = { light = 1 } } },
        { text = "Something else, Master Apothecary.", next = "BACK" },
      },
    },

    op_undeath = {
      big = true,
      lines = {
        { id = "opud_default", text = "A sickness implies a cure, and the tauren are terribly earnest about looking for one. I call it a condition with remarkable advantages, but I'm curious what a subject thinks: is what we are a curse, or an improvement?" },
      },
      choices = {
        { text = "A curse. We should take any cure the tauren find.", next = "op_undeath_r1", fx = { affinity = -1, align = { light = 1 }, opinion = { undeath = "curse" } } },
        { text = "An improvement. No hunger, no sleep, no fear of plague.", next = "op_undeath_r2", fx = { affinity = 1, align = { light = -1 }, opinion = { undeath = "improvement" } } },
        { text = "Neither. It's what we are, and I'll make the best of it.", next = "op_undeath_r3", fx = { trait = { practical = 1 }, opinion = { undeath = "mixed" } }, when = { race = "Scourge" } },
        { text = "My elders believe you can be healed, and I believe them.", next = "op_undeath_r4", fx = { trait = { kind = 1 }, opinion = { undeath = "curable" } }, when = { race = "Tauren" } },
        { text = "I'll keep my answer, Master Apothecary.", next = "BACK" },
      },
    },
    op_undeath_r1 = {
      lines = { { id = "opud_r1", text = "How touchingly alive of you. Write to Thunder Bluff by all means, and I'll keep a jar ready for whatever comes back." } },
      choices = { { text = "Something else, Master Apothecary.", next = "BACK" } },
    },
    op_undeath_r2 = {
      lines = { { id = "opud_r2", text = "Precisely, and you'd be astonished how few of my colleagues will say it aloud. The living spend half their lives asleep and the other half dying, and we've been spared both." } },
      choices = { { text = "Something else, Master Apothecary.", next = "BACK" } },
    },
    op_undeath_r3 = {
      lines = { { id = "opud_r3", text = "A sensible subject, and the dead rarely bring me one. I'll note it down beside your name, which is a compliment, mostly." } },
      choices = { { text = "Something else, Master Apothecary.", next = "BACK" } },
    },
    op_undeath_r4 = {
      lines = { { id = "opud_r4", text = "Your elders are kind, and their letters are very polite. I've opened a great many of my people, though, and I've yet to find anything that wants mending." } },
      choices = { { text = "Something else, Master Apothecary.", next = "BACK" } },
    },
    xpt_faranell = {
      big = true,
      lines = { { id = "xpt_faranell_default", text = "Only a little of their time and a few of their prayers, said over subjects in the next room. If faith really holds the rot at bay in the Forsaken, the Royal Apothecary Society should know it, and if it doesn't, the priests should know that too." } },
      choices = {
        { text = "Knowledge is worth having, whatever it costs your subjects.", next = "BACK", reply = "There's a mind after my own heart! I'll put you down as a supporter of the project, and do mind the stains.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Prayers aren't instruments for your experiments, Faranell.", next = "BACK", reply = "Instruments, reagents, hypotheses, it's all a matter of vocabulary, really. I'll find another priest who's less precious.", fx = { align = { light = 1 } } },
        { text = "Something else, Master Apothecary.", next = "BACK" },
      },
    },
    xcl_sm = {
      big = true,
      lines = { { id = "xcl_sm_default", text = "Wonderful! The Crusade's hearts are remarkable specimens, you know, so swollen with zeal that I've had to send for bigger jars, and each one beats the same way when it's frightened. If they ever learn to be afraid sensibly, I'll be out of a research topic." } },
      choices = {
        { text = "Fanatics or not, they were people. Their hearts aren't specimens.", next = "BACK", reply = "Specimens they are, and splendid ones, and they'd have made specimens of us gladly. Your scruples are noted.", fx = { align = { light = 1 } } },
        { text = "Take whatever you need from them. They'd do worse to us.", next = "BACK", reply = "Splendid! I'll send for even bigger jars, then, and think of you every time.", fx = { affinity = 1, align = { light = -1 } } },
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
        { text = "The Light isn't a reagent. Leave it out of your bottles.", next = "BACK", reply = "Oh, but it's such a fascinating reagent, and so few of you exist to sample. I'll ask again next week.", fx = { align = { light = 1 } } },
        { text = "If it helps the Dark Lady, study me as you like.", next = "BACK", reply = "Marvellous! Sit down, sit down, and don't mind the needles.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I have a theory that it does, because a Forsaken who believes in something mends a little faster and rots a little slower than one who doesn't. I can't prove it yet, but I'd be delighted to take a few measurements of you, purely in the interests of science." } },
      choices = {
        { text = "If faith helps us endure, I'll take your theory.", next = "BACK", reply = "Splendid, and I'll write it down as an endorsement. Faith with a measurable outcome!", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith is chemistry, then. Nothing sacred about it.", next = "BACK", reply = "Chemistry, yes, and I find that very sacred indeed. You'll go far in the Society.", fx = { align = { light = -1 } } },
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
        { text = "I'll bring them, Faranell. The Scourge must be stopped.", next = "BACK", reply = "It must, and it will, with your help. Fresh, mind, and with the glands intact.", fx = { align = { order = 1 } } },
        { text = "Find your own bear hearts. I hunt for myself.", next = "BACK", reply = "Pity, a terrible pity, but I suppose a hunter must eat. Do consider it if you find a spare bear.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_faranell = {
      lines = {
        { id = "hu_default", key = true,
          text = "Oh, humans are wonderful, my friend, absolutely wonderful, in the way a well-stocked larder is wonderful! They breed quickly, they bleed predictably, and the Scarlet Crusade keeps sending us fresh ones, which saves the Society a fortune in field trips." },
        { id = "hu_scourge", when = { race = "Scourge" },
          text = "We were all humans once, weren't we, and I must say I've never felt better about it. They breed quickly, they bleed predictably, and the Crusade keeps marching fresh ones into Tirisfal for us, which is remarkably generous of them." },
      },
      choices = {
        { text = "You speak of them like livestock.", next = "hu_faranell_2" },
        { text = "Weren't you human yourself once?", next = "hu_faranell_2" },
        { text = "Something else, Master Apothecary.", next = "BACK" },
      },
    },
    hu_faranell_2 = {
      big = true,
      lines = {
        { id = "hu2_default",
          text = "I was a human chemist in Lordaeron once, and I remember my old colleagues with great clarity, mostly the ones who laughed at my notes. A living human has a pulse, a soul and a terrible opinion of me, my friend, and only the first two are of any scientific use." },
      },
      choices = {
        { text = "They hunt us. Whatever the Society does, they earned it.", next = "BACK",
          reply = "My thought precisely, though I'd never have put it so warmly. The captured zealots in Brill are doing marvellous work for us, and only a little of it voluntary.",
          fx = { affinity = 1, align = { light = -1 }, opinion = { humans = "hate" } } },
        { text = "They're people, Faranell, not reagents. Remember that.", next = "BACK",
          reply = "People, reagents; the distinction gets so blurry after the third distillation. Still, I've written your objection down, and I'll read it to the next zealot, if he's still listening.",
          fx = { affinity = -1, align = { light = 1 }, opinion = { humans = "mixed" } } },
        { text = "Something else, Master Apothecary.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "You've the same build as {alt}, who carried a crate of my reagents across the Quarter without dropping a single vial! Is it family, or has the Society finally learned to breed reliable couriers?" },
        { id = "h_alt_risen", tags = { "news" }, when = { alt = { race = "Scourge", notKin = true } },
          text = "One of our own, {alt}, was down here only recently, and between you and me, they asked to see the testing cages and didn't even blanch. If you know them, do tell them the Society has a long memory for steady stomachs." },
        { id = "o_ktadmire", tags = { "news" }, when = { gossip = { topic = "kirin_tor", stance = "admire" } }, text = "Bethor Iceshard says you'd go running back to Dalaran if they'd have you. I'd advise against it, because I've seen what the Kirin Tor do with specimens." },
        { id = "h_pt_priest", tags = { "news" }, when = { party = { class = "PRIEST" } },
          text = "Your companion is a priest, I think, from the way they keep looking at my jars. Tell {companion} that I'm still measuring whether faith slows the decay of the dead, and I'd welcome a priest's help with the trial, so long as they don't mind the smell." },
        { id = "h_default", key = true,
          text = "Faranell, Master Apothecary, master of every bottle in this room, keeper of the Royal Apothecary Society's finest work, at your service! The Dark Lady wants weapons against the Scourge, and I make them, and it's a joy." },
        { id = "h_recipe", tags = { "news" }, when = { questActive = TODO_QUEST("A Recipe For Death") },
          text = "Bear hearts, spider blood, a journal from Pyrewood and a bit of murloc tumour: bring me everything on the list. Together they make something wonderful, for the Scourge, naturally." },
        { id = "h_cl_sm", tags = { "news" }, when = { cleared = "Scarlet Monastery", faction = "Horde" },
          text = "You've been to the Monastery, haven't you? You've the look of someone who's seen zealots up close, which is a very particular look. I've been hoping someone would bring me news from inside!" },
        { id = "h_agony", when = { questActive = TODO_QUEST("Elixir of Agony") },
          text = "Apothecary Lydon's colloid from Tarren Mill, applied correctly, and then a few reagents to wake the mixture! Don't sniff it, though; Lydon sniffed it, and Lydon has been melancholy ever since." },
        { id = "h_lydon", when = { heardLine = "lydon.h_default" },
          text = "Lydon, in Tarren Mill? Yes, yes, a brilliant mind and terrible company. He named his frog, and I told him not to name the frog!" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Oh, how marvellous, you put your hands into lightning and come out the other side, and I'd simply adore a sample of whatever's left in your blood afterwards." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Bear, cat, seal, whatever you like, all of them so wonderfully alive, so do hold still while I take a few notes, nothing invasive, I swear." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Oh, splendid, splendid, you'll be bringing me bear hearts and spider blood by the bucket, I can feel it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Marvellous, because you're a living, or once-living, example of a hypothesis I've never managed to test properly, which is whether faith changes the body's chemistry." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin! Oh, how marvellous, a Forsaken who carries the Light and walks into the Apothecarium anyway. I would dearly love to know what holy power does to a sample of the new plague, purely in the name of science." },
        { id = "h_dd_pain", tags = { "news" }, when = { questDone = TODO_QUEST("Elixir of Pain") },
          text = "Apothecary Lydon writes from Tarren Mill that his Elixir of Pain behaved splendidly on its test subject, and that you fetched every ingredient. Lydon is a plodder, but he records his results, and yours are in them." },
      },
      choices = {
        { text = "Does faith change the body, Master Apothecary?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could your work and my totems serve the same fight, Faranell?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do your notes say about the living, Faranell?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What use are your potions to a warrior, Faranell?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Whatever you're making smells dreadful.", next = "making" },
        { text = "I need poisons for my blades. Can you help?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I trained in Dalaran. Your work looks like magic to me.", next = "mage", when = { class = "MAGE" } },
        { text = "I wonder what your brews would do to a demon.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "My people's elders treat the Forsaken. Do you work with them?", next = "tauren", when = { race = "Tauren" } },
        { text = "You must need samples from the beasts I hunt, Faranell.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What does the Apothecarium want with a paladin, Master Apothecary?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've been to the bottom of the Scarlet Monastery, Master Apothecary.", next = "xcl_sm", when = { cleared = "Scarlet Monastery", faction = "Horde" } },
        { text = "My companion is a priest. What do you want with them?", next = "xpt_faranell", when = { party = { class = "PRIEST" } } },
        { text = "Have you ever dealt with the night elves, Faranell?", next = "ne_faranell" },
        { text = "What does the Society make of humans, Master Apothecary?", next = "hu_faranell" },
        { text = "I'll leave you to your work.", next = "END" },
        { text = "Lydon's elixir worked, then. What's it for?", next = "dd_pain", when = { questDone = TODO_QUEST("Elixir of Pain") } },
      },
      again = {
        { id = "h_again", text = "Yes, yes, what else? Quickly, the green flask is making that noise again!" },
        { id = "h_again2", text = "More questions! How delightful. Ask away, and don't touch anything." },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Help? My dear, the Society practically invented half the poisons on your belt! Crippling, mind-numbing and deadly, all of them far too crude, of course. Bring me spider venom from Silverpine and I'll show you what a real toxin looks like." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "A deathstalker! My favourite customers; you always bring the bottles back empty. Do tell your captains the new batch is ready, and that it was very nearly an accident." },
      },
      choices = {
        { text = "Show me, then. The stronger the better.", next = "BACK", reply = "Oh, splendid! A rogue of discernment, at last. Bring me that venom and we'll make something lovely together.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "I'll keep to the crude ones. Clean kills only.", next = "BACK", reply = "Clean kills are so wasteful, but I'll respect your preference. The crude ones are still mine, you know.", fx = { affinity = -1, align = { light = 1 } } },
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
        { text = "Take the imp. A little pain will teach it manners.", next = "BACK", fx = { affinity = 2, trait = { cruel = 1 } } },
        { text = "No. The imp is mine, and I don't lend what's mine.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "Magatha's remedies! Yes, yes, the Society and the Grimtotem crone have an arrangement, very cordial, very scientific. Her herbs make my patients remember the taste of bread, and I make notes. Whether it's a cure, well, that's a big word, and I'm a careful man." } },
      choices = {
        { text = "You're telling me to be careful?", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } },
        { text = "I hope it works.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    ne_faranell = {
      lines = {
        { id = "ne_default", text = "Oh, the kaldorei! Their druids have watched Felwood rot for years, so they must have the finest notes on corruption ever written, and they won't share a single page of them with the Society. They treat knowledge as if it were one of their sacred groves, fenced off, and it's a terrible waste of a good poison." },
      },
      choices = {
        { text = "Perhaps they fear what you'd do with it.", next = "ne_faranell_fear" },
        { text = "Knowledge should be shared, even with the Society.", next = "BACK",
          reply = "Even with the Society! Oh, I like that 'even', it has such a lovely reluctance to it. Yes, my friend, it should, and one day the Circle will learn that hoarding a cure is its own sort of poison.",
          fx = { affinity = 1, align = { order = -1 }, opinion = { night_elves = "arrogant" } } },
        { text = "They're right to guard it. Some notes are dangerous.", next = "BACK",
          reply = "Dangerous! Every note worth reading is dangerous, my friend, which is exactly why it ought to be read by professionals. Still, I respect a careful librarian, even an elven one.",
          fx = { align = { order = 1 }, opinion = { night_elves = "respect" } } },
        { text = "Something else, Master Apothecary.", next = "BACK" },
      },
    },
    ne_faranell_fear = {
      lines = {
        { id = "nf_default", text = "Of course they fear it, and quite rightly, because I would do marvellous things with it! But they also think a Forsaken in their forest is a ghoul who forgot to lie down, and it's very hard to persuade anyone of your good intentions while she's reaching for her bow." },
      },
      choices = {
        { text = "To them, the Forsaken and the Scourge look alike.", next = "BACK",
          reply = "A crude classification, but I suppose they've had very little opportunity to examine us closely. I'd volunteer for the study myself, if I could be sure of being let go afterward." },
        { text = "Something else, Master Apothecary.", next = "BACK" },
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
        { text = "Do you think of undeath as a sickness, Faranell?", next = "op_undeath" },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "More than you'd guess, though fewer than I'd like. A warrior with a few of my tonics fights longer and heals faster, and if the plague we're brewing works, the Scourge won't be fighting at all." } },
      choices = {
        { text = "A plague is a coward's weapon. I'll keep my axe.", next = "BACK", reply = "Cowardly or clever, it's all the same to the Scourge. Keep your axe, warrior, and I'll keep my vials.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your plague will end the Scourge. I'll fight beside it.", next = "BACK", reply = "Splendid! The plague and the axe, side by side, how very poetic.", fx = { align = { light = -1 } } },
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
        { text = "The earth thinks it's poison, Faranell. Mind your runoff.", next = "BACK", reply = "The earth has opinions? How charming. I'll note it, and then I'll carry on.", fx = { align = { light = 1 } } },
        { text = "Whatever kills the Scourge, I'll not complain about.", next = "BACK", reply = "A practical shaman, how refreshing. The Scourge will thank us both, in its way.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "That you're terribly fragile and endlessly fascinating, and that a tauren's constitution is very nearly the sturdiest I've studied. It's all for the Scourge, naturally, and for the cure your Arch Druid keeps asking after, if there is one, which is a big word, and I'm a careful man." } },
      choices = {
        { text = "Take your notes. I trust the Society's purpose.", next = "BACK", reply = "Wonderful! I'll be sure to send your Arch Druid a full report, minus the boring parts.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No more notes. I'm not your test subject.", next = "BACK", reply = "Not my test subject, merely my most interesting visitor. I'll take my notes from memory, then.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Oh, you do appreciate the work! So few visitors do; most of them only hold their noses and ask where the door is. You've quite made my morning, and the vats will hear all about it." },
        { id = "s2", text = "Flattery! How lovely, and how very seldom anyone bothers with it down here. I'd name a strain after you, if the Dark Lady didn't insist that we number them." },
      },
      fail = {
        { id = "f1", text = "Oh dear, that was a compliment, wasn't it, and not a very well-made one. I measure things for a living, you see, and that one came up rather short of sincere." },
        { id = "f2", text = "How sweet, and how perfectly empty! I've had test subjects say nicer things to me, and they were strapped to a table at the time." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Oh, that's very good, do say it again so that Keever can hear. Nobody teases me any more, because they're all afraid of what I'll put in their tea." },
        { id = "s2", text = "Cheeky! I like it, because cheek means a strong constitution, and a strong constitution is so useful in an errand-runner. Science forgives you entirely." },
      },
      fail = {
        { id = "f1", text = "Now that wasn't kind, and it wasn't even clever, which is the worse fault. I'd watch what you drink in the Apothecarium for a while, purely as a precaution." },
        { id = "f2", text = "Mockery, in my own laboratory! I've a great many jars on these shelves, you know, and one or two of them are still empty." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", narr = "He edges behind the nearest table of flasks.", text = "Oh! Oh, goodness, there's no need for that, I've delicate glassware all round me. I'll mind my manners, and you'll kindly mind the retorts, yes?" },
        { id = "s2", text = "My, you are alarming when you want to be, and I say so with real professional admiration. Let's stay friends, shall we, because I bruise easily these days and nothing mends." },
      },
      fail = {
        { id = "f1", text = "Are you trying to frighten me? How adorable! I work elbow-deep in plague every day of the week, and you're a good deal less catching." },
        { id = "f2", text = "Do stop looming, because you're blocking my light, and the green one mustn't be left unwatched. Whatever you were hoping to scare out of me, it's staying where it is." },
      },
    },
  },
  alignment = { light = -1 },
  confides = {
    { id = "cnf_1", text = "The Society pays well for anything taken off the Scarlet zealots at the monastery in Tirisfal, and it asks no questions about whose it was." },
    { id = "cnf_2", text = "The apothecaries in Brill and the Sepulcher send me field notes every week, and the Silverpine ones are always late, because Arugal's worgen keep eating the couriers." },
    { id = "cnf_3", text = "When a vat in the Apothecarium starts to whistle, leave the room at once, because that whistle is the only warning anyone ever gets." },
  },
  blurts = {
    { id = "bl1", text = "Lydon in Tarren Mill tests our compounds on whatever wanders within his reach, and his results are splendid. Don't let him offer you a drink, whatever he says is in it." },
    { id = "bl2", text = "The Scarlet zealots in their monastery have the most remarkable hearts, simply bursting with conviction, and I need dozens of them. Bring me as many as you can carry, and don't ask why." },
    { id = "bl3", text = "The Society is brewing a little something of our own for the Scourge, and the Dark Lady watches its progress very closely indeed. Oh dear, I wasn't meant to say that." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you're a splendid specimen, my friend, and I mean that in the nicest possible way! You're sturdy and reliable, and you keep coming back from things that would kill most people." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You bring me exactly what I ask for, in usable condition, which is more than I can say for half my apprentices. I'd hire you, honestly, if you'd ever stand still long enough." },
      { id = "rg_al_dark", when = { alignment = { axis = "light", max = -30 } }, text = "You don't flinch at the vats, and you never stop to ask whether the Light approves. Oh, we'd have got on famously when I was alive, and better still now." },
      { id = "rg_al_light", when = { alignment = { axis = "light", min = 30 } }, text = "You've still got that Light-touched glow about you, and I can't decide whether to admire it or bottle it. Don't worry, I've decided to admire it, for now." },
    },
    confide = {
      { id = "cf_1", text = "I was a chemist in Lordaeron before the plague, mixing tonics for gout and bad livers. The work's far more interesting now, and nobody complains about the side effects." },
      { id = "cf_2", text = "Half the vats in the Apothecarium are for show, you know, bubbling away to impress visiting orcs. The real work happens in rooms with fewer windows and a great deal more ventilation." },
    },
    trust = {
      { id = "tr_1", text = "Trust a good apothecary's measurements and nothing else they say. We're all frightful liars, but our scales are honest." },
      { id = "tr_2", text = "Trust the Deathguard, who are too dull to be anything but honest, and trust the Dark Lady to remember everything. Never trust an apprentice who's suddenly cheerful, because it means something has gone missing." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the green puddles in the lower canals, my friend, because not all of them are water and not all of them are finished. I'd hate to lose you to a half-made batch." },
      { id = "wo_2", text = "Watch the spiders in Silverpine and the bears in Hillsbrad, both of which I've sent people to collect, and both of which have collected a few of my people in return." },
      { id = "wo_3", text = "Watch the Kirin Tor's lot at Ambermill, who'd steal a recipe right out of your pocket and call it research. I'd know, since I've done the very same to them." },
    },
    worries = {
      { id = "wy_1", text = "That the Dark Lady will lose patience before we've got it right. She's very supportive, but her support has a cold edge, and I've seen what becomes of those who disappoint her." },
      { id = "wy_2", text = "Sometimes I wonder whether I'd recognise the old me, with his little shop and his gout tonics. I don't think he'd like me much, and the trouble is that I don't mind at all." },
    },
    hopes = {
      { id = "hp_1", text = "To finish it, my friend, the great work, the thing the Society will be remembered for. Imagine the Scourge melting in the fields like snow in spring!" },
      { id = "hp_2", text = "A proper laboratory, with a ceiling that doesn't drip and apprentices who don't explode. I'm told that's unreasonable, but I keep hoping." },
    },
    favor = {
      { id = "fv_1", text = "Bring me anything strange you find out there, anything that glows, oozes or bites when it ought to be dead. I'll be the judge of whether it's useful." },
      { id = "fv_2", text = "If you pass through Tarren Mill, ask Lydon how the colloid is settling and tell me exactly what he says, not what he'd like me to hear." },
    },
    friendship = {
      { id = "fr_1", text = "A friend? Oh, my dear {name}, I'm terribly fond of you, and I've only ever said that to two people and a particularly productive mould. You rank well above the mould." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "After all the hearts and venom sacs you've hauled down here for me? You're the best friend the Society has, and the Society has precious few." },
      { id = "fr_al_dark", when = { alignment = { axis = "light", max = -30 } }, text = "You understand that progress doesn't ask permission, and neither do I. That makes us friends, I think, or something rather more useful." },
    },
    never_told = {
      { id = "nt_1", text = "The first batch I made for the Dark Lady didn't work, and I told her it did. I fixed it before anyone noticed, but I've never rested so badly, and I don't even sleep." },
      { id = "nt_2", text = "I kept a cat, back when I was alive and had a shop in the capital. I sometimes wonder what became of her, which is absurd, given everything, but there it is." },
    },
    grievance = {
      { id = "gv1", text = "Oh, my problem? You're a spoiled reagent, my friend, the kind that ruins the whole batch. Science has no use for you, and neither, I'm afraid, do I." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You mocked my work, my life's work, to my very face! Science forgives a great deal, but it never forgets an insult." },
      { id = "gv_values", when = { grudge = "values" }, text = "You squeamish types are all the same, wrinkling your noses at the Apothecarium's methods. Progress is messy, and you'd rather it weren't made at all." },
      { id = "gv_town", when = { grudge = "town" }, text = "The whole Society's been whispering about you, and none of the whispers are complimentary. Apothecaries gossip terribly, you know; it's the fumes." },
    },
    amends = {
      { id = "am1", text = "Bring me reagents, splendid ones, without being asked and without complaining. Nothing restores a friendship like a fresh delivery!" },
      { id = "am_wronged", when = { grudge = "wronged" }, text = "Show a little respect for the work, that's all, and perhaps a little awe. Awe is always welcome in the Apothecarium." },
    },
    spite = {
      { id = "sp1", text = "I think you'd make a splendid test subject, honestly, and I mean that as the cruellest thing I can say. Do keep well away from the green vats." },
      { id = "sp_values", when = { grudge = "values" }, text = "I think you're a coward who wants the Scourge gone but won't dirty your hands with the how. The Society will save you anyway, and you'll never thank us." },
    },
    humans = { { id = "tp_humans", text = "Humans are the finest reagent in Lordaeron, my friend, and the Scarlet Crusade keeps delivering them right to our door. I was one once, and I can say with authority that it's overrated." } },
    knows = {
      { id = "tp_knows", text = "Oh, I collect information the way I collect reagents: eagerly, and without asking too closely where it came from! Pick something, anything." },
    },
    wailing_caverns = { { id = "tp_caverns", text = "A poisoned dream leaking into water? Oh, I'd trade a month of my own research for a sample. Helbrim is being very slow about it." } },
    scourge = { { id = "tp_scourge", text = "The Scourge's plague is a marvel of crude engineering, and I have the deepest admiration for its efficiency! Of course, we mean to do better, purely for use against the Scourge." } },
    new_plague = { { id = "tp_new_plague", when = { race = "Scourge" }, text = "You're one of us, so I'll tell you that it's coming along splendidly, and that you mustn't breathe near the vats. Our enemies will never know what hit them." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are the finest scholars in the world, because we've already conquered death and can now focus on more interesting problems. The Royal Apothecary Society is proof of that!" } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady supports our research with great generosity, and she asks only for results. I intend to give her results she will never forget." } },
    stratholme = { { id = "tp_stratholme", text = "The plague spread through Stratholme in the grain, a very elegant delivery, if you think about it scientifically. Don't look at me like that, I'm only admiring the method." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad's Cult perfected the plague, and I've read every scrap of their notes I can get my hands on. Brilliant work, really, though I'd never say so in front of the Dark Lady." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's alchemists hoard their recipes behind their shields and refuse to share them with anyone. I don't hold it against them, because I'd do the same." } },
    thrall = { { id = "tp_thrall", text = "The orcs are terribly suspicious of our work, which I find charming. I've offered to show them around the Apothecarium, but they always seem to have somewhere else to be." } },
    _none = { { id = "tp_none", text = "Not my department, I'm afraid! My department is bubbling, so do excuse me." } },
    _gated = {
      { id = "gt1", text = "Ah, now that's Society business, and I only share Society business with people I'm rather fonder of. Do something splendid for science first, and then we'll see!" },
      { id = "gt2", text = "Oh no, no, I shan't tell you that, not yet! I hardly know you, and some of my best secrets are terribly easy to spill." },
    },
  },
}

P:NPC {
  key = "bethor", id = TODO_NPC("Bethor Iceshard"), name = "Bethor Iceshard",
  bible = "bibles/undercity.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "cold" }, values = { "pragmatic", "loyal" },
  notices = { "class" },
  impression = {
    first = "He says he has grown cold, and I only partly believe him.",
    third = "{name} met Bethor Iceshard in the Magic Quarter, a Forsaken mage haunted by an old friend who became a lich.",
  },

  greetings = {
    { id = "g_magic", text = "The Magic Quarter. Knowledge is the only weapon the Forsaken never had to dig out of a grave. What do you need?" },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the Magic Quarter has kept its secrets in your absence. Now that you're back, what do you need?" },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear one of your lies was found out in the city. I swore an oath once beside a friend who lied to us all, so my trust comes slowly now." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Dalaran taught me, before, and now I teach. The lessons have grown colder, and so have I." },
  },

  start = "hello",
  nodes = {
    op_kirin_tor = {
      big = true,
      lines = {
        { id = "opkt_default", text = "Some days I blame them and some days I blame myself, since I sat at the same tables as Kel'Thuzad and laughed at his jokes. You've heard of the Kirin Tor even out here, so tell me plainly what you think of them." },
      },
      choices = {
        { text = "They let a necromancer walk their halls. They share the blame.", next = "op_kirin_tor_r1", fx = { align = { order = -1 }, opinion = { kirin_tor = "blame" } } },
        { text = "They're careful scholars. Magic needs a council like theirs.", next = "op_kirin_tor_r2", fx = { align = { order = 1 }, opinion = { kirin_tor = "respect" } } },
        { text = "I'd study in Dalaran tomorrow, if they'd let me in.", next = "op_kirin_tor_r3", fx = { opinion = { kirin_tor = "admire" } }, when = { class = "MAGE" } },
        { text = "They'd hang us from their new towers, Bethor. Forget them.", next = "op_kirin_tor_r4", fx = { affinity = 1, trait = { stern = 1 }, opinion = { kirin_tor = "hate" } }, when = { race = "Scourge" } },
        { text = "Dalaran's not my quarrel, Bethor.", next = "BACK" },
      },
    },
    op_kirin_tor_r1 = {
      lines = { { id = "opkt_r1", text = "That's what I tell myself at night, and it helps less than you'd hope. Still, it's good to hear it from someone who wasn't there." } },
      choices = { { text = "Something else, Bethor.", next = "BACK" } },
    },
    op_kirin_tor_r2 = {
      lines = { { id = "opkt_r2", text = "Careful, yes, and very slow to look at what's standing in front of them. Ask Antonidas how much good their caution did him, if you can find his grave." } },
      choices = { { text = "Something else, Bethor.", next = "BACK" } },
    },
    op_kirin_tor_r3 = {
      lines = { { id = "opkt_r3", text = "So would I, some nights, and that's the trouble with Dalaran; it never quite lets go of you. Make your peace early with the fact that they won't." } },
      choices = { { text = "Something else, Bethor.", next = "BACK" } },
    },
    op_kirin_tor_r4 = {
      lines = { { id = "opkt_r4", text = "They would, and they'd call it a mercy. I stopped writing to old friends in Dalaran when I noticed that none of them wrote back." } },
      choices = { { text = "Something else, Bethor.", next = "BACK" } },
    },
    xpt_bethor = {
      big = true,
      lines = { { id = "xpt_bethor_default", text = "I miss the library and very little else, because the Kirin Tor were never kind to anyone who asked uncomfortable questions. I'd tell your friend to learn what they can and to trust no council that claims to know what magic is for." } },
      choices = {
        { text = "No one should tell a mage what to study.", next = "BACK", reply = "Nobody should, and Thule proved what happens when nobody does. Choose your studies, then, and choose them carefully.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Magic needs a council to govern it, or it runs wild.", next = "BACK", reply = "A council like Dalaran's? I watched it govern itself straight into the plague. Find a better one first.", fx = { align = { order = 1 } } },
        { text = "Something else, Bethor.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "My oath didn't keep faith with me, and Thule certainly didn't, so I have reason to be cold about it. But if the Light still answers you after everything Lordaeron's dead have suffered, then perhaps loyalty is something we choose, rather than something we're owed." } },
      choices = {
        { text = "Loyalty is a choice. I chose the Light again.", next = "BACK", reply = "Then you chose more bravely than I did. I'll think about that tonight.", fx = { align = { light = 1 } } },
        { text = "Nothing keeps faith. I hold the Light because it's useful.", next = "BACK", reply = "Useful is honest, at least. Thule called it useful too, at the start.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "It burned with the rest of Lordaeron, I imagine, and I've not gone back to look. The oath was the thing that mattered, and one of us broke it, so I've stopped expecting the place to have kept faith better than he did." } },
      choices = {
        { text = "The oath still matters, Bethor. You kept yours.", next = "BACK", reply = "I kept it, and it kept me, which is more than it did for him. Thank you for remembering.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Oaths are words. He broke his, so you may break yours.", next = "BACK", reply = "Then I'd be no better than Thule, and I've no intention of becoming him. I'll keep my oath, thank you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A good deal, though few mages would admit it, because a lich spends its time guarding against spells and forgets that steel still cuts. Thule always did underestimate anyone who couldn't quote the Kirin Tor's charter, and I'd like to think that will be his undoing." } },
      choices = {
        { text = "Then point me at Thule, and I'll remind him.", next = "BACK", reply = "Do, and remind him of me while you're at it. I'd like him to know who sent you.", fx = { align = { honor = 1 } } },
        { text = "Your old friend is your business, Bethor. I fight for pay.", next = "BACK", reply = "Fair enough, and I'll pay you fairly. Thule's sins are mine to carry.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_bethor = {
      lines = {
        { id = "hu_default", key = true,
          text = "Miss them? I studied beside them for twenty years, and when the Scourge took the city the survivors fled, and now they sit behind their shield in Alterac rebuilding their towers. I wrote to an old friend there once, and the letter came back unopened, burned at the edges." },
      },
      choices = {
        { text = "Burned? On purpose?", next = "hu_bethor_2" },
        { text = "Perhaps they were afraid of you.", next = "hu_bethor_2" },
        { text = "Something else, Bethor.", next = "BACK" },
      },
    },
    hu_bethor_2 = {
      big = true,
      lines = {
        { id = "hu2_default",
          text = "Of course they were afraid; I'd be afraid of me. But I sat their examinations and mourned their dead, and in one afternoon they decided I was a thing to put down. Thule went to the Lich King, Gunther went mad, and I went to the Dark Lady, and the Kirin Tor think all three of us are the same." },
      },
      choices = {
        { text = "Dalaran betrayed you. Let the Kirin Tor rot behind their shield.", next = "BACK",
          reply = "That is the easy answer, and on cold nights I find it very comfortable. They taught me everything I know, and I suspect I'll spend my unlife proving them wrong about me.",
          fx = { align = { order = -1 }, opinion = { humans = "hate" } } },
        { text = "Fear isn't hatred. Perhaps one day they'll open the letter.", next = "BACK",
          reply = "Perhaps, and perhaps Thule will apologise. I'll keep the copy, at least, since it's the only thing of mine Dalaran ever kept for me.",
          fx = { affinity = 1, align = { order = 1 }, opinion = { humans = "mixed" } } },
        { text = "My family would burn my letters too, if I sent any.", next = "BACK", when = { race = "Scourge" },
          reply = "Then don't send them. Write them, by all means, and keep them in a drawer; it costs nothing, and the dead have very few comforts.",
          fx = { opinion = { humans = "kin" } } },
        { text = "Something else, Bethor.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_mage", tags = { "news" }, when = { party = { class = "MAGE" } },
          text = "There's a mage among your company; I can feel {companion}'s mana from here, like a candle in the next room. Dalaran trained a great many of us once, and I wonder sometimes how many of my old classmates now walk beside the living without knowing what became of me." },
        { id = "h_default", key = true,
          text = "My name is Bethor Iceshard. I studied at Dalaran with two friends, and we crossed our wands as apprentices and swore we'd always stand together. One of them sold his soul to the Lich King, and his name was Thule Ravenclaw." },
        { id = "h_renferrel", when = { heardLine = "renferrel.h_default" },
          text = "Apothecary Renferrel's work at the Sepulcher keeps turning up my old friend's name. I'd rather it didn't, but I'd rather know than not." },
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
        { id = "h_dd_dalaran", tags = { "news" }, when = { killed = { name = "Dalaran", min = 20 } },
          text = "You've been killing Dalaran's mages in Silverpine and Hillsbrad, I hear, and I find I don't mind in the least. They walled themselves up while Lordaeron died, and they've learned nothing behind those walls." },
      },
      choices = {
        { text = "What became of the chapel where you swore your oath?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is the arcane so different from the elements, Bethor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does that make druids wiser than mages, Bethor?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Do mages ever need a hunter, Bethor?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "You speak of Thule with no love at all.", next = "thule" },
        { text = "I studied in Dalaran too. Do you miss it?", next = "mage", when = { class = "MAGE", race = "Scourge" } },
        { text = "An orc mage. What does Dalaran's man make of that?", next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = "I've struck bargains in the dark, as Thule did.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I'd guess a mage has little use for a thief, Bethor.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A warrior might be of use against a lich, Bethor.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Has any power ever kept faith with the dead, Bethor?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "My companion is a mage. Do you miss Dalaran?", next = "xpt_bethor", when = { party = { class = "MAGE" } } },
        { text = "Do you miss the humans of Dalaran, Bethor?", next = "hu_bethor" },
        { text = "Farewell.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? The Quarter is quiet, so ask what you like." },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Every day, and I'd never go back. They'd cast a cleansing on me at the gate and call it kindness. What I miss is the people I studied beside, and most of those are dead or worse." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "You were an apprentice there when the plague came, weren't you? Then you were in the same lecture halls Thule and I sat in, a few years later. I find I'm glad of the company." },
      },
      choices = {
        { text = "Dalaran abandoned us. Let it stay behind its walls.", next = "BACK", reply = "It may, and it may keep its towers too. I've no wish to go back and be pitied.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "One day the Kirin Tor may welcome us back.", next = "BACK", reply = "Perhaps, when the Kirin Tor learn humility. I'll not hold my breath, since I no longer have any.", fx = { align = { order = 1 } } },
      },
    },
    orcmage = {
      lines = { { id = "om_default", text = "That Dalaran spent a war teaching that orcs could learn nothing but the axe and the fel, and here you are, proving it wrong in the Undercity of all places. Learn carefully; the arcane rewards patience, and it punishes hunger." } },
      choices = { { text = "Patience, not hunger, then. I'll remember.", next = "BACK", fx = { affinity = 2 } } },
    },
    warlock = {
      big = true,
      lines = { { id = "wl_default", text = "As Thule did? He sold himself whole, and you rent pieces of yourself by the hour, but the ledger is kept by the same people. I don't judge you for it, but I'll be watching what you trade, because I didn't watch him, and I should have." } },
      choices = {
        { text = "Watch, then. I know exactly where my line is drawn.", next = "BACK", reply = "Good, and keep it there, warlock. Thule thought he knew his too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thule was weak. He sold himself far too cheaply.", next = "BACK", reply = "Weak, perhaps, but he believed he was getting a fair price. That's the trap, warlock, not the price.", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "When the reagents still have teeth, yes, I'm afraid we do. Half my research waits on things that live in the deep woods of Silverpine, and none of them come when called." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "When the reagents still have teeth, yes, and I see {pet} has teeth enough to match them. Half my research waits on things in the deep woods of Silverpine, and a beast's nose would find them faster than any apprentice of mine." },
      },
      choices = {
        { text = "Tell me what you need, and I'll fetch it.", next = "BACK", reply = "Splendid. I'll write you a list, and do try to bring them back in one piece.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pay me first, and I'll think about it.", next = "BACK", reply = "A sensible hunter, and a mercenary one. Very well, payment first, and I'll expect the best.", fx = { align = { order = -1 } } },
      },
    },
    thule = {
      big = true,
      lines = {
        { id = "t_default", text = "He wanted power more than he wanted us, and when the plague came he traded everything for it. I died and came back, while he sold himself and stayed sold. Between us, I know which I'd choose." },
      },
      choices = {
        { text = "Do you blame the Kirin Tor for Kel'Thuzad?", next = "op_kirin_tor" },
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The arcane is taken, shaman, and the elements are asked, and I've seen what happens to men who stop asking. Thule began by taking a little more than his share and ended by selling himself whole, so I'd keep asking your spirits nicely, if I were you." } },
      choices = {
        { text = "Power should be asked for, never seized.", next = "BACK", reply = "It should, and Thule is my proof. Keep asking, shaman, and you'll stay yourself.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Asking is slow, Bethor. Sometimes you must take.", next = "BACK", reply = "Sometimes, perhaps, but Thule began exactly that way. Mind where it ends.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Wiser than some mages, certainly, and wiser than Thule, which is no great feat. But I've heard of your Druids of the Fang in the Barrens, who dreamed too greedily and woke as something else, so perhaps no school is safe from its own ambition." } },
      choices = {
        { text = "Then ambition must be watched, in mages and druids both.", next = "BACK", reply = "Watched, always, and I'm grateful a druid sees it. Ambition never knows when it's had enough.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ambition built the Horde. I won't apologise for it.", next = "BACK", reply = "It built the Horde, and it built the Scourge too. Mind which one you're building.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I needed one once, in Dalaran, when a friend's notes went missing and I paid a boy to find them, and I've regretted ever since not asking what else he found. Thule Ravenclaw keeps his secrets at Fenris Keep now, and I'd dearly like a thief in his study." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "Dalaran had its thieves like any city, though the Kirin Tor liked to pretend otherwise, and some of them were cleverer than the apprentices. If you were one of them, you'll know how to get past a ward that thinks itself clever." },
      },
      choices = {
        { text = "I'll fetch what you need and nothing more.", next = "BACK", reply = "Good, and if you find anything else, leave it buried. Thule's secrets are poison.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Whatever else I find there, I keep.", next = "BACK", reply = "Then keep it, and may it never keep you. Thule's things have a way of doing that.", fx = { align = { order = -1 } } },
        { text = "You speak of Thule with no love at all.", next = "thule" },
      },
    },
  },

  topics = {
    humans = { { id = "tp_humans", text = "I studied beside humans in Dalaran for twenty years, and they decided in an afternoon that I was a thing to be put down. Their wizards sit behind a shield in Alterac now, and they don't open my letters." } },
    dalaran = { { id = "tp_dalaran", text = "I swore an oath in Dalaran as an apprentice, with friends who swore it beside me, and I still carry the wand. The city is rising again, but it isn't my city anymore, and I doubt it would have me." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor taught me everything I know, and then they watched the plague take Lordaeron and did nothing useful about it. I've grown cold, and they deserve most of the credit." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad walked the halls of the Violet Citadel when I was young, and the masters thought him a genius. They were right, and that's the terrible part." } },
    scholomance = { { id = "tp_scholomance", text = "One of the friends who swore the apprentice's oath beside me sold himself to the Lich King, and the school at Caer Darrow is where such men go. I'd rather not say more." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken have use for a mage who remembers Dalaran's secrets. I give the Dark Lady what I know, and she gives me a purpose, and I'd call that a fair trade." } },
    _none = { { id = "tp_none", text = "Research it; that's what we do here." } },
  },
}

P:NPC {
  key = "norman", id = TODO_NPC("Innkeeper Norman"), name = "Innkeeper Norman",
  bible = "bibles/undercity.md", role = "innkeeper", tier = "service",
  communities = { "undercity" }, temper = { "dry" }, values = { "hospitable" },
  notices = { "race", "weary", "lock_shadow" },
  impression = {
    first = "Nobody takes anyone's chair down there, and he sees to it kindly.",
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
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "My candles always dip when your lot comes in, and I've stopped asking why. Sit in the corner where the shadows are already deep, and nobody will notice the difference." },
  },

  start = "hello",
  nodes = {
    dd_scarlet = {
      lines = { { id = "dd_scarlet_default", text = "They do, and loudly. Most of them lost someone to the Crusade's pyres after they rose, and a name to blame the dead Scarlets on is the nearest thing to a toast they've got left." } },
      choices = {
        { text = "Good. Tell them I'm not finished with the Crusade.", next = "BACK", reply = "I'll tell them, and they'll like it. Just don't let the pyres take you as well; I'd hate to lose a regular.", fx = { align = { light = -1 } } },
        { text = "I'd rather they didn't. Killing isn't something to toast.", next = "BACK", reply = "That's an old living notion, and a decent one. I'll keep it behind the bar with the other things nobody asks for.", fx = { align = { light = 1 } } },
        { text = "Something else, Norman.", next = "BACK" },
      },
    },

    op_peace = {
      big = true,
      lines = {
        { id = "oppc_default", text = "Some of my tables say the Alliance will march on Lordaeron the day the Scourge is done, and the rest say Thrall would sooner keep the peace with Theramore. What do you reckon, should the Horde have peace with the humans or not?" },
      },
      choices = {
        { text = "Peace, Norman. Enough of us have died already.", next = "op_peace_r1", fx = { align = { light = 1 }, opinion = { peace = "peace" } } },
        { text = "No peace. They'd burn this inn and call it cleansing.", next = "op_peace_r2", fx = { align = { light = -1 }, trait = { stern = 1 }, opinion = { peace = "war" } } },
        { text = "The orcs have seen enough war. Thrall's right to want quiet.", next = "op_peace_r3", fx = { affinity = 1, opinion = { peace = "peace", warchief = "trust" } }, when = { race = "Orc" } },
        { text = "The living will never make peace with us, whatever kings sign.", next = "op_peace_r4", fx = { trait = { skeptical = 1 }, opinion = { peace = "hopeless" } }, when = { race = "Scourge" } },
        { text = "I'll keep out of politics, Norman.", next = "BACK" },
      },
    },
    op_peace_r1 = {
      lines = { { id = "oppc_r1", text = "That's my thinking too, though I keep it quiet when the Deathguard drink here. Peace is good for an innkeeper, and I've had my fill of the other thing." } },
      choices = { { text = "Thanks, Norman.", next = "BACK" } },
    },
    op_peace_r2 = {
      lines = { { id = "oppc_r2", text = "You might be right, and I'll not argue the point, but I'd rather not find out with my own chairs. Have a seat while they're still standing." } },
      choices = { { text = "Thanks, Norman.", next = "BACK" } },
    },
    op_peace_r3 = {
      lines = { { id = "oppc_r3", text = "Your Warchief's a sensible sort, from what the couriers say. Sensible sorts make the best customers, too, because they come back." } },
      choices = { { text = "Thanks, Norman.", next = "BACK" } },
    },
    op_peace_r4 = {
      lines = { { id = "oppc_r4", text = "Maybe not, but they might stop shooting first, and I'd settle for that. You'd be surprised what a man can settle for after he's been buried." } },
      choices = { { text = "Thanks, Norman.", next = "BACK" } },
    },
    xpt_norman = {
      big = true,
      lines = { { id = "xpt_norman_default", text = "A few, and fewer than we'd like. Most of the orcs who come down here stand very close to the door, but now and again a troll sits at my counter with a Forsaken friend and tells jokes until closing, and I count those as good nights." } },
      choices = {
        { text = "The living and the dead should stand together against the Scourge.", next = "BACK", reply = "They should, and some nights in here they nearly do. I'll pour for anyone who's willing to try.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The living will never trust the dead, and they shouldn't.", next = "BACK", reply = "Perhaps not, friend, but they'll drink in the same room, and that's a start. I'll take what I can get.", fx = { align = { light = -1 } } },
        { text = "Thanks, Norman.", next = "BACK" },
      },
    },
    xcl_sm = {
      big = true,
      lines = { { id = "xcl_sm_default", text = "I knew a few of the Crusade, back before, when I kept a different inn and everyone in it was breathing. They were decent lads at the start, most of them, and it's a strange thing to hear their halls are emptying and feel glad and sorry in the same chair." } },
      choices = {
        { text = "Feel sorry, Norman. They were decent once, and that matters.", next = "BACK", reply = "They were, and I'll feel sorry for them, quietly, the way you do for old friends gone wrong.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Don't waste your sorrow. They'd burn this inn with you inside.", next = "BACK", reply = "They would, and I'd be sorry for them even then. That's the innkeeper in me, I'm afraid.", fx = { align = { light = -1 } } },
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
        { text = "Let them stare. I'll show them the Light isn't their enemy.", next = "BACK", reply = "Show them gently, friend, and give them time. Nobody stares forever, not even here.", fx = { align = { light = 1 } } },
        { text = "They're right to remember. The Light was not kind to us.", next = "BACK", reply = "It wasn't, and you'll not hear me argue. Sit down, and let the dark do you some good.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "It's the only kind I can keep, a chair of your own where nobody asks anything of you. The Cathedral used to promise the same, and I think I keep it better, though I'll admit my roof leaks green when it rains." } },
      choices = {
        { text = "A chair and peace is holy enough, Norman.", next = "BACK", reply = "Holy enough for me, friend. Have a seat; they're all comfortable, even the green-stained ones.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sanctuary makes people soft. They should keep moving.", next = "BACK", reply = "Soft, perhaps, but rested, and rested folk fight better. I'll keep the chairs warm for when you change your mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_norman = {
      lines = {
        { id = "hu_default", key = true,
          text = "More than's healthy, which for us is saying something. I kept a little inn in Lordaeron before the plague, and I sometimes catch myself setting out bread for guests who'd scream if they saw who was pouring their ale." },
        { id = "hu_scourge", when = { race = "Scourge" },
          text = "You too, eh? I kept a little inn up top before the plague, and some nights I still catch myself setting out bread that none of us can taste for guests who'd scream if they saw the landlord." },
      },
      choices = {
        { text = "Do you hate them for it?", next = "hu_norman_2" },
        { text = "Would you go back, if you could?", next = "hu_norman_2" },
        { text = "Something else, Norman.", next = "BACK" },
      },
    },
    hu_norman_2 = {
      big = true,
      lines = {
        { id = "hu2_default",
          text = "Hate them? No, I envy them, and that's worse. They get to taste the stew and complain about the rain and grow old in their beds, and all they ever do with it is march into Tirisfal with torches to burn the likes of me." },
      },
      choices = {
        { text = "Envy's wasted on them. They'd never share what they have.", next = "BACK",
          reply = "No, I don't suppose they would, and I'd not share my chair either, now I think of it. Pull it up, then, and we'll both sit in it out of spite.",
          fx = { affinity = 1, align = { light = -1 }, opinion = { humans = "rivals" } } },
        { text = "Some of them grieve the dead too, Norman. Their dead are you.", next = "BACK",
          reply = "That's a strange kind of comfort, and I'll take it, because it's the only kind on the menu. Somewhere up north, perhaps, somebody's still setting out bread for me.",
          fx = { align = { light = 1 }, opinion = { humans = "mixed" } } },
        { text = "Something else, Norman.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_fors", tags = { "news" }, when = { race = "Scourge", alt = { kin = true } },
          text = "Funny, you put me in mind of {alt}, who took the corner chair and sat there a day and a half without a word. Some of us knew each other before, and some of us only think we did, so I never ask." },
        { id = "h_alt_living", tags = { "news" }, when = { alt = { notKin = true, race = { "Orc", "Troll", "Tauren", "Skyborne" } } },
          text = "We had a {altclass} named {alt} in here not long ago, one of the living, and they didn't even ask whether the food was safe. I liked them for it, and I'd like you for the same." },
        { id = "o_npdanger", tags = { "news" }, when = { gossip = { topic = "new_plague", stance = "dangerous" } }, text = "One of Apothecary Zinge's lot was in here grumbling that you think the plague will get loose. Keep your voice down about that in my common room, if you would, because the Deathguard drink here." },
        { id = "h_pt_forsaken", tags = { "news" }, when = { party = { race = "Scourge" } },
          text = "You've a Forsaken friend with you, so I'll not have to explain the rooms twice. {companion} will know they're for resting the bones rather than sleeping, and the living among you can sleep wherever you like, as long as it's quietly." },
        { id = "h_default", text = "Name's Norman, and I keep the inn by the Trade Quarter. We don't sleep, most of us, but we like a chair and a place that's ours, and that's what I sell, really." },
        { id = "h_cl_sm", tags = { "news" }, when = { cleared = "Scarlet Monastery", faction = "Horde" },
          text = "Somebody's been telling stories about the Scarlet Monastery at the bar all night, and you're in each of them. Pull up your chair and set them straight, because one of them had you riding a bat into the cathedral." },
        { id = "h_chair", when = { metBefore = true }, text = "Your chair's still there, and nobody's taken it. Nobody takes anyone's chair down here; it's the last courtesy we keep." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, under the city! Sit down by the stove, and if the fire starts muttering, I'd rather not hear what it thinks of the damp." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, under the city? You'll not find much growing down here, friend, except what's in the canals, and I wouldn't touch that." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Take a chair, any chair that's empty, and nobody will take it from you while you sit, which is the closest thing to a sanctuary I can offer." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, with a chair waiting like anyone else. You glow a little when you sit, which some of the regulars find upsetting, so I'll put you by the wall where the light won't bother them." },
        { id = "h_dd_scarlet", tags = { "news" }, when = { killed = { name = "Scarlet", min = 100 } },
          text = "The Deathguard who drink here say you've put more Scarlets in the ground than some of their whole companies. They raise a cup to you, which is a strange thing to watch when none of them can swallow." },
        { id = "h_dd_deaths", when = { deaths = { min = 20 } },
          text = "You've died a good many times for someone still walking about, if the spirit healers' gossip is to be believed. Sit down, and let one evening pass without anyone killing you." },
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
        { text = "My demon is hungry, Norman. Is there a seat for it?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "The regulars seem to mind a paladin among them, Norman.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Do many living folk travel with the Forsaken, Norman?", next = "xpt_norman", when = { party = { race = "Scourge" } } },
        { text = "What's the talk at your tables, Norman?", next = "op_peace" },
        { text = "Do you ever think about the living, Norman?", next = "hu_norman" },
        { text = "Just resting.", next = "END" },
        { text = "The Deathguard drink to my Scarlet kills, Norman?", next = "dd_scarlet", when = { killed = { name = "Scarlet", min = 100 } } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Because even warriors stop eventually, friend, and then they want somewhere that's theirs. I've had Deathguard sit in that corner for a week without a word, and they left looking a little more like themselves." } },
      choices = {
        { text = "Rest is part of the discipline. I'll take a chair.", next = "BACK", reply = "There's a warrior with sense. Pick a chair, and it's yours for as long as you like.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll rest when the Scourge is ash, not before.", next = "BACK", reply = "Then I'll keep a chair for you, friend, and it'll be waiting when you're done.", fx = { align = { order = -1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "There's room, though the rats from the canals might take an interest in it. Keep it off the chairs, if you don't mind, because nobody takes anyone's chair down here, not even a wolf." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "So that's {pet}. It can have the floor by my feet, but not a chair, because nobody takes anyone's chair down here, not even a beast with manners like that." },
      },
      choices = {
        { text = "It'll stay on the floor, where it belongs.", next = "BACK", reply = "Thank you, friend, and the chairs thank you too. I'll find it a scrap.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "It'll sit where it likes. It's earned that much.", next = "BACK", reply = "It has, I don't doubt, but so has everyone else down here. Floor or nothing, friend.", fx = { align = { order = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Bless it? Nobody's offered that since I died, and the stove smokes something awful, so I'll take help from anyone. Only mind you don't bless the chairs, because nobody takes anyone's chair down here, not even a spirit." } },
      choices = {
        { text = "I'll bless the stove and leave the chairs alone.", next = "BACK", reply = "Bless you, and bless the stove twice. It's been smoking since the Dark Lady moved in.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Spirits sit where they like, Norman. I won't stop them.", next = "BACK", reply = "Then they'll have to stand, I'm afraid, because nobody takes anyone's chair. Not even spirits.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I miss the idea of it more than the sun itself, friend, since it hurts our eyes now and makes the skin itch. But I've a pot of mushrooms on the shelf behind the bar that never sees daylight, and I talk to them, which I'd not admit to anyone but a druid." } },
      choices = {
        { text = "Talk to them all you like. Growing things listen.", next = "BACK", reply = "I will, and I'll tell them you said so. They're coming along nicely, if a little pale.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mushrooms are for eating, Norman, not for talking to.", next = "BACK", reply = "Eating? My friends? I'll pretend I didn't hear that, and so will they.", fx = { align = { light = -1 } } },
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
        { text = "I'll keep to my own chair, Norman.", next = "BACK", reply = "Good, and it'll be the one with its back to the wall, I expect. Welcome.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A chair's only mine while I'm sitting in it.", next = "BACK", reply = "That's how it starts, and then somebody gets very upset. Mind my rule, friend.", fx = { align = { order = -1 } } },
        { text = "Can I ask you something else, Norman?", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A fire would suit the room, but not the people in it, since the dead can't feel it and the living don't stay long. I keep the lamps low on purpose, because my guests have had enough brightness for one lifetime." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "You'd have sat by a proper hearth in Dalaran, I expect, and I'm sorry I can't give you one. I keep the lamps low on purpose, because most of my guests have had enough brightness for one lifetime." },
      },
      choices = {
        { text = "Low lamps it is. Your house, your rules.", next = "BACK", reply = "Thank you, friend. My guests will be grateful, even if they never say so.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little light would do them good, Norman.", next = "BACK", reply = "It might, but it might also remind them of the pyres. Low lamps, friend, for their sake.", fx = { align = { order = -1 } } },
        { text = "Can I ask you something else, Norman?", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "There's a place for it, on the floor beside your chair, and if it scorches the upholstery we'll be having words. I've nothing against demons in principle, only against what they do to good leather." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "There's a place for it on the floor, and you'll find the floor is stone, which is the only thing down here your demon can't scorch. I've nothing against it in principle, only against what it does to leather." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "There's a place for it on the floor beside your chair, though I see it's already decided it would prefer the chair. I've nothing against demons in principle, only against what they do to good leather, so if {pet} marks the upholstery we'll be having words." },
      },
      choices = {
        { text = "It'll crouch on the floor, as you say.", next = "BACK", reply = "Thank you, and my upholstery thanks you too. I'll find it a cushion, of sorts.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon sits where I allow it, Norman. Not where you do.", next = "BACK", reply = "Then it can please itself on the floor, friend, or outside. Good leather's hard to come by.", fx = { align = { order = -1 } } },
        { text = "Can I ask you something else, Norman?", next = "BACK" },
      },
    },
  },

  topics = {
    humans = { { id = "tp_humans", text = "I kept an inn up top before the plague, and I envy the living more than I hate them. They get to taste the stew, and all they ever do with it is come at us with torches." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken don't need beds, but we need a place of our own, and a chair that nobody else will take. That's what I keep for them, and I keep it well." } },
    lordaeron = { { id = "tp_lordaeron", text = "I kept an inn in the capital before it fell, and some of my regulars still find their way down here. They sit in their old chairs, and I don't ask what they remember." } },
    thrall = { { id = "tp_thrall", text = "Orcs come through now and then, and they look about my common room like they expect to be eaten. I give them a chair by the door, and they seem grateful." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady has never once set foot in my inn, and I don't expect her to. Still, I keep a chair free, in case." } },
    _none = { { id = "tp_none", text = "Ask in the Apothecarium, since they know all sorts, but don't drink anything they offer." } },
  },
}
