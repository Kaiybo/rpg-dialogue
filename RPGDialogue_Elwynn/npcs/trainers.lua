-- Elwynn's class trainers: Northshire Abbey's teachers for the first ten levels, and Goldshire's
-- for the next twenty. Voices: bibles/trainers.md (one bible, a section each).
-- Each has their own way with their own class and a short way with everyone else.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Northshire Abbey
---------------------------------------------------------------------------

-- Priestess Anetta: heals the abbey's wounded trainees and teaches novice priests.
P:NPC {
  key = "anetta", id = TODO_NPC("Priestess Anetta"), name = "Priestess Anetta", title = "Priest Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "steady" }, values = { "pious", "kind" },
  spiritSensitive = true,
  notices = { "wounds", "form" },
  impression = {
    first = "She patches the wounded briskly and expects the gratitude to come later.",
    third = "{name} met Priestess Anetta at Northshire Abbey, who heals the recruits and trusts the Light's long and kindly memory.",
  },

  greetings = {
    { id = "g_priest", when = { class = "PRIEST" }, text = "Sit, little {g:brother|sister}. The Light can wait a moment for you to catch your breath." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "Hurt? Sit down and I'll see to it, and then go and find your own teacher." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "None of that shadow in the infirmary, please, because the wounded have had enough frights. Step out of it and roll up your sleeves." },
    { id = "n_wounds", cat = "wounds", place = "before", when = { durability = { max = 0.3 } },
      text = "Another one from the kobold camps. Hold still; you're the ninth today, and the day's still young." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some do and some don't, and I've no time to worry about it. If you heal, I'll be grateful later." } },
      choices = {
        { text = "Healing is holy work, Anetta. I'll help where I can.", next = "BACK", reply = "Then roll up your sleeves, because there's a recruit by the door with a kobold bite and I've two hands only. The Light will sort out the theology later.", fx = { align = { light = 1 } } },
        { text = "Your gratitude isn't needed. I'll do as I please.", next = "BACK", reply = "As you like, but the wounded don't much care about either of our pride. I'll be here when you're ready to be useful.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I've wondered, because the Brothers who tend the vineyard pray better than the ones who never leave the library. Whether that's the Light in the soil or just fresh air I couldn't tell you, but I send the recruits outside before I send them to prayers." } },
      choices = {
        { text = "Faith needs discipline and books, not only fresh air.", next = "BACK", reply = "Brother Sammuel would agree with you, and loudly. I've never seen a book stop a fever, though, and I'll keep sending them outside.", fx = { align = { order = 1 } } },
        { text = "The land teaches what no library can. Send them out more.", next = "BACK", reply = "I'll tell the Brothers you said so, and they'll give me that look. Still, I think the vineyard does the recruits more good than a sermon.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every day, and they never say thank you until they're older and wiser. The Light heals what you break, but it cannot heal pride, so learn to retreat when you should, and come to me less." } },
      choices = {
        { text = "I'll know when to fall back.", next = "BACK", reply = "Then you're already wiser than most who come through here. Retreat isn't shame, it's how you live to fight tomorrow.", fx = { align = { order = 1 } } },
        { text = "I'll never retreat, Priestess.", next = "BACK", reply = "Then I'll see you on my cot by the end of the week, and I'll mend you without a lecture. The lecture will come later.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "There's a bestiary, very old, written by a brother who seemed to think wolves were sent by demons. You'll learn more watching the wolves on the hillside, though I'd advise you not to tell the brothers I said so." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "There's a bestiary, very old, written by a brother who seemed to think wolves were sent by demons. Your {pet} is resting on the rug, I see, and it has better manners than some of my trainees." },
      },
      choices = {
        { text = "I'll read the book. Knowing helps the hunt.", next = "BACK", reply = "Do, and bring it back with your notes in the margins. Just don't believe the part about the demons.", fx = { align = { order = 1 } } },
        { text = "I'll learn from the woods, not the books.", next = "BACK", reply = "That's what I'd have said, and the wolves will be better teachers than the brother. Mind the hillside at dusk.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "More often than they'd like Jorik to know, because they cut themselves practising on the fence posts behind the Abbey and won't admit it. I mend them and say nothing, which is the one quiet art I'm any good at." } },
      choices = {
        { text = "Then I'll tell Jorik myself if I'm hurt. Honesty first.", next = "BACK", reply = "That's more honesty than Jorik usually gets from anybody. He'll pretend not to be surprised.", fx = { align = { honor = 1 } } },
        { text = "Some things are better kept from a trainer, Priestess.", next = "BACK", reply = "Perhaps, and I'll keep my mouth shut, as I always do. The Light doesn't tattle.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That the Light can mend a scorched hand, but it can't mend a scorched library, and Khelden's students have come close to both. Learn your fire slowly and you'll need me a good deal less." } },
      choices = {
        { text = "Slow and careful, then. I'll heed you and Khelden both.", next = "BACK", reply = "Good, and I'll tell Khelden you said so, which will please him more than he'll show. Mind the library.", fx = { align = { order = 1 } } },
        { text = "Fire's learned by burning. I'll take the risk.", next = "BACK", reply = "You might, and I'll mend the burns, but I'll not mend the books. Ask Khelden how he feels about that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I don't resent anyone who comes to me hurt, but I grieve a little for the road you've chosen, because I've seen where it ends for some. The Abbey keeps its doors open to you, and I'd like you to remember that." } },
      choices = {
        { text = "I'll remember the Abbey's open door, Priestess.", next = "BACK", reply = "Thank you, and I mean that. There'll be a cot in the infirmary for you, whatever road you walk.", fx = { align = { light = 1 } } },
        { text = "Keep your grief, Priestess. My road is my own.", next = "BACK", reply = "It is, and I'll not take it from you. But I'll keep grieving all the same, and the door stays open.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "We mend and you defend, Brother Sammuel would say, but the truth is that both of us do a little of each, and we'd be lost without the other. I've watched paladins kneel beside a wounded recruit with tears in their eyes, and I've watched priests stand in a doorway against kobolds." } },
      choices = {
        { text = "A paladin's duty is the shield, Priestess. Healing is yours.", next = "BACK", reply = "Sammuel would cheer to hear that, and I'll not argue with you both. Only don't be too proud to kneel when someone's bleeding.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We serve one Light. No rule of role binds it.", next = "BACK", reply = "That's what I've always believed, and it's good to hear a paladin say it. The Light doesn't read our titles.", fx = { align = { order = -1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in the Library Wing. Brother Sammuel's down the hall, but if you've come to read, sit; the Light rewards a mind as well as an arm." },
        { id = "h_default", text = "I'm Priestess Anetta. I keep the Library Wing and I keep the recruits alive, and some days those are the same job." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hallowed Letter"), days = 1 } },
          text = "So Marshal McBride wrote to me about you, which makes you one of mine now. The first lesson is that the Light heals the people who annoy you too." },
        { id = "h_wounded", when = { questActive = TODO_QUEST("Healing the Wounded") },
          text = "The wounded trainees are out by the barracks. Mend them, don't lecture them; the lecturing comes later, and it's my job." },
        { id = "h_favor", tags = { "news" }, when = { questActive = TODO_QUEST("In Favor of the Light") },
          text = "Go to Priestess Josetta, upstairs at the Lion's Pride in Goldshire, and she'll teach you what I can't from a library. Finish what you owe the Marshal first." },
        { id = "h_other", when = { ["not"] = { class = "PRIEST" } },
          text = "Whatever your path, don't turn your back on the Light. It has a long memory, and a kind one." },
        { id = "h_cots", when = { metBefore = true }, text = "Three cots full this morning, and all three of them got up and walked out by noon. I'll take that." },
        { id = "h_back", tags = { "news" }, when = { class = "PRIEST", minLevel = 20, metBefore = true },
          text = "Look at you! You left here with a staff you could barely hold, so come and tell me what the world's done to you, and then what you've done to it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Jorik Kerridan's student, I expect, since you came in without the door creaking, and that door always creaks. Sit on the stool if you're hurt, and don't touch the bandages unless you're asked." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "One of Khelden Bremen's, by the ink on your fingers. He sends me his burned ones and I send them back with a lecture of my own." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've come up from Drusilla La Salle's graveyard, and I can feel it on you like a chill. I'll mend you if you need mending, but I'll pray while I do it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in the Library Wing. Mind the shelves; McBride's recruits have knocked over a whole row of hymnals this week." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, among the books. Your companion is welcome here, so long as it doesn't chew the bindings." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, in the Library Wing? I've a shelf on herb lore you'd laugh at, so please don't look at it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I keep recruits alive, and some days the library too. Your spirits are welcome if they heal." },
      },
      again = { { id = "h_again", text = "Something else? Sit while you ask; the stool's for visitors." } },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "What is the Light, really?", next = "light" },
        { text = "What should a new priest learn first?", next = "first", when = { class = "PRIEST", maxLevel = 15 } },
        { text = "What happens to the ones you can't heal?", next = "lost" },
        { text = "I grew up in these halls.", next = "novice", when = { origin = "human_abbey_novice" } },
        { text = "Jorik's students must come to you often for mending.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What lecture do you give Khelden's burned students?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You must resent tending La Salle's students, Priestess.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Warriors must come to you for healing every day, Priestess.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The library must have something on the creatures of Elwynn.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do paladins and priests serve the Light differently, Priestess?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Light ever answer through the land, not just through prayer?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the Abbey's priests trust shamans, Anetta?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Priestess.", next = "END" },
      },
    },
    light = {
      big = true,
      lines = { { id = "l_default", text = "It's not a weapon, whatever the paladins say over supper; it's more like a lamp you keep lit for whoever comes after you." } },
      choices = {
        { text = "I'll keep it lit.", next = "BACK", reply = "Then you'll be a priest worth having, and I'll be glad of you. Keep it lit, especially when it's dark.", fx = { affinity = 1, align = { light = 2 } } },
        { text = "A lamp won't save anyone, so I'll need more than that.", next = "BACK", reply = "A lamp won't fight for anyone, true, but it shows the way home. You'll learn the difference one cold night.", fx = { align = { light = -1 } } },
        { text = "Some days it's a weapon.", next = "light_weapon", fx = { trait = { stern = 1 } } },
      },
    },
    light_weapon = {
      lines = { { id = "lw_default", text = "Some days. Then you put it down again, and you check your hands, and you go and heal someone. That's how you know it's still the Light in them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "To heal before you're asked, and to stand behind the fighters, not in front of them. And to drink water, because priests forget water; I don't know why, but we all do." } },
      choices = {
        { text = "Why behind the fighters?", next = "first_behind" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    first_behind = {
      lines = { { id = "fb_default", text = "Because if you fall, so do they, since you're the last thing standing between them and a grave. Be harder to kill than the kobold in front of you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    lost = {
      big = true,
      lines = { { id = "lo_default", text = "I sit with them, because that's all there is to do at the end. You'll do it too one day, so don't let anyone tell you it isn't healing." } },
      choices = {
        { text = "I'll remember.", next = "BACK", reply = "Good, because you'll need to, and it's the hardest lesson I teach. The Light sits with them too.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Sitting with the dying isn't healing, it's giving up.", next = "BACK", reply = "I thought that once, and then I sat with a dying farmhand who thanked me for it. Come back when you've done it yourself.", fx = { align = { light = -1 } } },
        { text = "That sounds unbearable.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    novice = {
      lines = { { id = "n_default", text = "I thought I knew the face; you used to fall asleep in the back of the library. Well, someone did, and every novice does. Welcome home." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 3, standing = { northshire = 2 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I'm a priestess of Northshire. I came to the Abbey to read and stayed to bandage, and the reading still waits." } },
    advice = { { id = "tp_ad", text = "Kobolds bite low, so watch your ankles, and keep a prayer ready for whoever forgot to." } },
    northshire_abbey = { { id = "tp_abbey", text = "Mind the library steps, because recruits read while they walk and fall straight down them." } },
    kobolds = { { id = "tp_kobolds", text = "I see what the kobolds leave behind, mostly in the infirmary." } },
    _none = { { id = "tp_none", text = "I've no answer for that, but I'll pray you find one." } },
    holy_light = {
      { id = "tp_holy_light", text = "The Light mends what it can through whoever will kneel long enough, and I kneel every morning and most evenings. I'd recommend it to anyone, especially the ones who think they don't need it." },
      { id = "tp_holy_light2", when = { class = "PRIEST" }, text = "You'll learn soon enough that the Light is less a fire you hold than a well you draw from. Draw carefully, and never draw it dry." },
    },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood trains priests, paladins and soldiers under one roof, which makes for noisy suppers and very good prayers. Archbishop Faol wanted it that way." } },
    echo_ridge = { { id = "tp_echo_ridge", text = "Half my bandages go to Echo Ridge these days, rolled up in the packs of recruits who think kobolds can't hurt them. The kobolds disagree." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn has asked the Abbey for healers to send north, and two of our brothers have gone already. I pray for them by name every morning." } },
  },
}

-- Khelden Bremen: teaches novice mages the fundamentals, up the stairs.
P:NPC {
  key = "khelden", id = TODO_NPC("Khelden Bremen"), name = "Khelden Bremen", title = "Mage Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "proud" }, values = { "curious", "ambitious" },
  notices = { "arcane" },
  impression = {
    first = "His notes scatter every time somebody leaves the door open.",
    third = "{name} met Khelden Bremen, Northshire's mage trainer, who teaches the dull rules that keep the dramatic ones from killing anyone.",
  },

  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "Ready to face your destiny? Good, then close the door; the draught scatters my notes." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "Don't touch anything glowing, or humming, or warm." },
  },

  notice = {
    { id = "n_burn", cat = "arcane", when = { class = "MAGE", durability = { max = 0.3 } },
      text = "Singed sleeves! You stood too close to your own fire again. Everyone does it once, but do it twice and I'll start charging you for robes." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They skip every one of them, every time. I'd guess a shaman has fundamentals too, or the elements would never answer." } },
      choices = {
        { text = "Fundamentals matter. I'll learn them properly.", next = "BACK", reply = "Then you're halfway to being a proper caster already. Sit down and we'll begin with the boring part.", fx = { align = { order = 1 } } },
        { text = "Fundamentals are dull. I'll skip ahead.", next = "BACK", reply = "Everyone does, and everyone comes back with singed eyebrows and a question. I'll save your seat.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd have said so a year ago, but I watched one of your kind call down moonlight on a kobold, and the timing was better than anything my students manage. Whatever your fundamentals are, somebody drilled them into you." } },
      choices = {
        { text = "Years of practice did. Discipline is discipline, whatever its source.", next = "BACK", reply = "Then we've more in common than either of us expected, and I'll admit it gladly. Practice is the whole of the art.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Nobody drilled me. The moon gives, and I listen.", next = "BACK", reply = "Then the moon is a better teacher than most I've met, and I'd not argue with it. My students listen less well.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That a fireball is faster than a charge, and it doesn't need to reach you to hurt you. A warrior who respects a mage's range survives longer than one who rushes it, and that's the lesson in full." } },
      choices = {
        { text = "I'll respect the spell and fight smart.", next = "BACK", reply = "Good, and you'll live to tell my students about it. They need to hear it from someone who swings a sword.", fx = { align = { order = 1 } } },
        { text = "I'll close the distance before you finish the word.", next = "BACK", reply = "Plenty have tried, and some have managed it, but they all needed a healer afterwards. Mind the first word.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "In practice, once, and the hunter's beast knocked the poor fellow down before he'd finished his incantation. It was the best lesson I ever taught about fundamentals, and I didn't say a word." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "In practice, once, and the hunter's beast knocked the poor fellow down before he'd finished his incantation. Your {pet} is sniffing at my sulphur, though, so do call it back, unless you'd like it to sneeze fire." },
      },
      choices = {
        { text = "My beast gives me time. I won't waste it.", next = "BACK", reply = "That's the right instinct, and the beast will thank you for it. Fundamentals, you see, apply to everyone.", fx = { align = { order = 1 } } },
        { text = "My beast does the work. I just finish it.", next = "BACK", reply = "Then I hope your beast never trips, because you'll want to know a few things when it does. Still, a good partnership.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a book of spells sells for good coin in the Trade District, and I've lost two this year already. I'm not accusing you, but I'll be counting when you leave." } },
      choices = {
        { text = "Your books are safe, Khelden. I'm no thief of knowledge.", next = "BACK", reply = "I'm glad to hear it, and I'll count the books anyway, because it's a habit now. Nothing personal.", fx = { align = { honor = 1 } } },
        { text = "If your books walk, perhaps your locks need improving.", next = "BACK", reply = "Perhaps they do, and I've ordered new ones from Stormwind. Until then I'll keep counting.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the last of Drusilla La Salle's students who borrowed one returned it with pages missing, and the ones that went were the ones about binding. I teach fundamentals here, and I'll not have them twisted into something that bites." } },
      choices = {
        { text = "Your caution is wise, Khelden. I'll not ask again.", next = "BACK", reply = "Thank you, and I'm glad someone understands. The fundamentals are yours, but the binding stays with La Salle.", fx = { align = { light = 1 } } },
        { text = "Knowledge belongs to whoever can use it best.", next = "BACK", reply = "That's exactly what the last student said, right before he tore the pages out. My books stay on my shelves.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Khelden Bremen. I teach the fundamentals, though everyone wants the dramatic parts, and the fundamentals are what keep the dramatic parts from killing you." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Glyphic Letter"), days = 1 } },
          text = "Marshal McBride's letter, so you've a spark. Knowledge and power are out there for the taking, whatever gods or men think of it. Let's see how much you can carry." },
        { id = "h_other", when = { ["not"] = { class = "MAGE" } },
          text = "Magic is dangerous to the untrained. You're untrained. I'm only pointing out the arithmetic." },
        { id = "h_level", when = { class = "MAGE", minLevel = 10 },
          text = "You've outgrown my little room, so go to Zaldimar Wefhellt, upstairs at the Lion's Pride in Goldshire. Try not to set the inn alight." },
        { id = "h_basics", when = { metBefore = true }, text = "Back for more fundamentals? Good, because everyone else wants fireballs, and you'd be amazed how many of them set the library curtains alight." },
        { id = "h_veteran", when = { class = "MAGE", minLevel = 25 },
          text = "One of mine, come back up the stairs. You still hold your hands like I taught you. Most forget by the time they reach the Wizard's Sanctum in Stormwind." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "One of Jorik Kerridan's, here in my library. You'll touch nothing on the shelves, because I know exactly where every book is, and I'll know if one moves." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've the graveyard on your boots and a hungry look at my shelves. You'll be Drusilla La Salle's, then, and you'll be wanting a book I won't lend you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in my classroom. You'll be looking for the barracks, I imagine, which are next door and noisier." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll want to keep that animal clear of the reagents, because a curious nose and a sulphur pouch make a very short lesson." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you'll be wanting to tell me nature's magic needs no fundamentals. Please don't, because my students are listening." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Close the door, please; my notes scatter. Do your spirits respect the fundamentals?" },
      },
      again = {
        { id = "h_again", text = "Another question? Go on, but mind the inkwell." },
        { id = "h_again2", text = "Go on. I've a draught to fix and a lecture to rewrite." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Why do mages chase power?", next = "power" },
        { text = "A library like this must tempt thieves.", next = "library" },
        { text = "The Light seems just another sort of magic to me.", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Where do I go when you're done with me?", next = "after", when = { class = "MAGE", maxLevel = 12 } },
        { text = "What should I be practising?", next = "practise", when = { class = "MAGE" } },
        { text = "Gnomes learn magic by taking it apart first.", next = "gnome", when = { race = "Gnome", class = "MAGE" } },
        { text = "My people kept the old Highborne arts.", next = "skyborne", when = { race = "Skyborne", class = "MAGE" } },
        { text = "What do you make of the other teachers here?", next = "teachers" },
        { text = "Why would a rogue want anything from your library?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why won't you lend your books to me, Khelden?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would a mage teach a warrior, Khelden?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have any of your students ever fought a hunter?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You probably think druidic magic less disciplined than yours.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Students always seem to skip the fundamentals, Khelden.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    power = {
      big = true,
      lines = { { id = "p_default", text = "Because it's there, because someone else will take it if we don't, and because it's beautiful. Pick whichever reason lets you sleep." } },
      choices = {
        { text = "Because it's beautiful.", next = "power_rules", fx = { align = { order = -1 }, affinity = 1, trait = { curious = 1 } } },
        { text = "Because someone has to keep it from the wrong hands.", next = "power_rules", fx = { affinity = 1, align = { order = 1 } } },
      },
    },
    power_rules = {
      lines = {
        { id = "pr_default", text = "Then remember the four rules I put in every letter: it's powerful, it corrupts, it's addicting, and it calls things out of the Twisting Nether to whoever uses it." },
      },
      choices = {
        { text = "Which one worries you most?", next = "power_worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    power_worst = {
      lines = {
        { id = "pw_default", text = "The third. The others warn you, but that one flatters you; you'll never once feel addicted, only talented." },
      },
      choices = {
        { text = "I'll watch for it.", next = "BACK", reply = "Watch for it every day, then, because it's patient. The flattering ones always are.", fx = { align = { order = 1 }, trait = { cautious = 1 }, affinity = 1 } },
        { text = "I'll take the risk.", next = "BACK", reply = "They all say that, and the clever ones say it loudest. I'll be here when you need someone to tell you the truth.", fx = { trait = { brave = 1 }, align = { order = -1 } } },
      },
    },
    library = {
      lines = {
        { id = "l_default", text = "A novice ran off to the Defias last season and took dangerous books from the protected wing with him. The brothers keep those under lock for a reason.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "What kind of dangerous?", next = "library_void" },
        { text = "Strange thing for a thief to want, books.", next = "library_why" },
      },
    },
    library_void = {
      lines = {
        { id = "lv_default", text = "One was a treatise on the Void, which Drusilla La Salle in the graveyard has wanted for years. I'd rather the Defias had it than her, and I don't say that lightly." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    library_why = {
      lines = {
        { id = "lw_default", text = "To sell, I'd guess, which means someone in that Brotherhood knows what a book is worth, and that bothers me more than the theft." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    light = {
      lines = {
        { id = "li_default", text = "Say that in the corridor and three brothers will correct you at once. I'll only say this: it obeys rules too. They just don't write theirs down." },
      },
      choices = {
        { text = "The Light isn't a set of rules.", next = "BACK", reply = "No, it's a faith, and I'll not argue with you there. But faith keeps rules of its own, whether it admits it or not.", fx = { align = { light = 1 }, trait = { pious = 1 } } },
        { text = "I'd like to read those rules.", next = "BACK", reply = "So would I, and I've asked, and the brothers just smile. Maybe you'll have better luck.", fx = { align = { order = 1 }, trait = { curious = 1 }, affinity = 1 } },
      },
    },
    after = {
      lines = {
        { id = "a_default", text = "Zaldimar Wefhellt, above the inn in Goldshire, and then the Wizard's Sanctum in the city, where Jennea Cannon is sharper than both of us and knows it." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Frostbolt, until you can cast it without thinking about your hands, and then stopping a Fireball halfway, until you can do that without thinking either. Everyone practises the first; nobody practises the second until they've set something they love on fire." },
      },
      choices = {
        { text = "Why stop a spell halfway?", next = "practise_stop" },
        { text = "I'll practise both.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    practise_stop = {
      lines = { { id = "practise_stop_l", text = "Because one day a recruit will run in front of your target, and you'll have half a heartbeat to decide. Make the decision now, in this room, where it's cheap." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "So I've noticed, and I've lost two practice wands to it this season. Your people may understand the parts better than mine, but the four rules still apply to gnomes, however small the explosion." } },
      choices = {
        { text = "Understanding the parts is the whole point.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "I'll put your wands back together.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    skyborne = {
      lines = { { id = "skyborne_l", text = "Did they? Then I'd ask you not to show the novices, because they'll want to skip straight to it, and I'd ask you to show me, because I'm a hypocrite and a scholar." } },
      choices = {
        { text = "Some things aren't mine to show.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll show you, after the novices leave.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },
    teachers = {
      lines = { { id = "teachers_l", text = "Priestess Anetta keeps the recruits alive, Llane Beshere keeps them standing and Jorik Kerridan keeps them out of my library, mostly. Drusilla La Salle among the graves I'd rather not discuss, except to say she reads more than any of us." } },
      choices = {
        { text = "You sound almost fond of La Salle.", next = "teachers_lasalle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teachers_lasalle = {
      lines = { { id = "teachers_lasalle_l", text = "Fond is a strong word. I respect anyone who reads the whole book, even when the book is dreadful, and hers usually are." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I teach the first lessons. Somebody must, and I'm better at it than I am at the last ones." } },
    advice = { { id = "tp_ad", text = "Magic will burn whoever wields it carelessly, so respect it or stay well clear of it. There's no third way." } },
    northshire_abbey = { { id = "tp_abbey", text = "Too many stairs and not enough shelves, but otherwise ideal." } },
    defias = { { id = "tp_defias", text = "They took books from our library: thieves with a reading list, which I find worse than the ordinary kind." } },
    _none = { { id = "tp_none", text = "Not in any book I own, and I own most of them." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was where every mage of my generation dreamed of studying, and I never got further than its gates. They're rebuilding it now, I hear, and they're slower than ever to let anyone in." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor taught that magic is a discipline before it is a power, and they lost Dalaran's good name the day they forgot it. Kel'Thuzad was one of theirs, you know." } },
    scourge = { { id = "tp_scourge", text = "The plague in the north was a mage's work at its root, and that's why I teach respect before I teach fire. Somebody skipped that lesson once." } },
    echo_ridge = { { id = "tp_echo_ridge", text = "The kobolds in Echo Ridge make a fine first test for a young mage, because they're slow and they burn. Mind the candles on their heads, though; they make the fire worse." } },
  },
}

-- Jorik Kerridan: behind the abbey, out of sight.
P:NPC {
  key = "jorik", id = TODO_NPC("Jorik Kerridan"), name = "Jorik Kerridan", title = "Rogue Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "sharp" }, values = { "cunning", "honest" },
  notices = { "stealth" },
  impression = {
    first = "He was listening for my footsteps long before I reached him.",
    third = "{name} met Jorik Kerridan, who teaches lockpicks and knifework behind Northshire Abbey, well out of the Brothers' sight.",
  },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Took you long enough to find me, and that's good; it means I'm doing my job." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "Lost? Your trainer's out front somewhere, so go and find them." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Nice try, but I heard your buckle. Lose the buckle." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They hum a little, yes, and most folk wouldn't notice, but I do. Keep that in mind if you ever need to hide." } },
      choices = {
        { text = "I'll fight in the open, Jorik. I've nothing to hide.", next = "BACK", reply = "Good, and I'll respect you for it. Just know that the quiet ones will hear you coming.", fx = { align = { honor = 1 } } },
        { text = "Teach me to hide, then. Quiet has its uses.", next = "BACK", reply = "I'll teach you to step softly, at least, and that's half of it. The spirits will have to keep their own counsel.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some could, if they'd stop thinking about it, because a cat doesn't plan its steps; it simply never puts a foot wrong. Most of mine still walk like they're carrying a tray of plates." } },
      choices = {
        { text = "Stealth is for hunting, not for robbing honest folk.", next = "BACK", reply = "I'd not argue, but my students hunt Defias, not farmers. A quiet step serves the kingdom too.", fx = { align = { honor = 1 } } },
        { text = "A quiet step serves any purpose. I won't judge your students.", next = "BACK", reply = "Kind of you, and they'd be glad to hear it, though they'd never admit to needing it. Mind your own step.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That the fight you see coming is the one you'll win, and the one you don't see is the one that kills you. Watch the hedges and the hayloft as well as the front, and you'll live longer than most of Llane Beshere's recruits." } },
      choices = {
        { text = "I'll watch the hedges as well as the front.", next = "BACK", reply = "Good, and you'll be one of the few. The hedges in Northshire are thicker than they look.", fx = { align = { honor = 1 } } },
        { text = "Face me in the open, and I'll win.", next = "BACK", reply = "In the open, maybe, but nobody who wants you dead will ever give you that. Think on it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I heard its claws on the cobbles, because animals don't care about noise. That's fine in the woods but not in the vineyard, where the Defias have their ears open for anything that isn't a farmer." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I heard its claws on the cobbles, because animals don't care about noise. Your {pet} is good, though, so teach it to stay downwind and it'll be the quietest thing in Northshire." },
      },
      choices = {
        { text = "I'll teach it to move quiet, as you say.", next = "BACK", reply = "Good, and it'll learn faster than my students do. Beasts listen when they're shown.", fx = { align = { order = 1 } } },
        { text = "Let them hear us. We'll be on them first.", next = "BACK", reply = "They'll hear you, and they'll be gone before you're on them. Speed's no use against an empty camp.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "We get along well enough, but he thinks my students are thieves and I think his are firecrackers, and we're both half right. Still, when the kobolds come out of Echo Ridge, I'd rather have one of his firecrackers beside me than a dozen recruits." } },
      choices = {
        { text = "Then we'll fight side by side. Fair's fair, Jorik.", next = "BACK", reply = "That's fair, and I'll hold you to it when Echo Ridge spills out. Firecrackers and thieves, then.", fx = { align = { honor = 1 } } },
        { text = "Firecrackers and thieves. We're both just tools, Jorik.", next = "BACK", reply = "Tools, maybe, but a tool that knows it's a tool lasts longer. Keep that in mind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Once, and only once, because she wanted to learn about poisons and I wanted to learn what she keeps in that graveyard, and neither of us got a fair trade. The Brothers don't know about it, and they'd best not hear it from you." } },
      choices = {
        { text = "I won't speak of it to the Brothers, Jorik.", next = "BACK", reply = "Thank you, and I'll trust you to mean it. Some trades are best forgotten.", fx = { align = { honor = 1 } } },
        { text = "The Brothers might pay well for that tale, Jorik.", next = "BACK", reply = "They might, and then I'd have a few things to say about you too. Let's both keep quiet, shall we?", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They know, and they pray about it, and they let me stay anyway, because a recruit who can hear a Defias coming is a recruit who lives. Priestess Anetta mends my students' cuts without a word of complaint, which is more charity than I'd show in her shoes." } },
      choices = {
        { text = "The Abbey is right to shelter you. Mercy is wise.", next = "BACK", reply = "They are, and I've told them so, though not in those words. The Abbey's been kinder to me than I deserve.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A house of the Light shouldn't shelter knife-work.", next = "BACK", reply = "Maybe not, but the recruits I've taught are still breathing. Ask the Brothers which they'd prefer.", fx = { align = { light = -1 } } },
        { text = "Something else, Jorik.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Further than you'd like and closer than you'd admit, because we both stand between Stormwind and the people who'd ruin it. You do it in the open with a hammer, and I do it in the dark, with a letter nobody else has read." } },
      choices = {
        { text = "There's no honor in the dark. We're not the same.", next = "BACK", reply = "Not the same, no, and I'll not pretend we are. But you'll be glad of my letters one day, paladin.", fx = { align = { honor = 1 } } },
        { text = "Then we're alike. The kingdom needs us both.", next = "BACK", reply = "We are, though I'll deny it if you say so at the Cathedral. You bring the hammer, and I'll bring the letters.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, behind the stables. You've come to tell me my trade is shameful, I expect, and I've heard it, so let's skip to the part where you leave." },
        { id = "h_default", text = "I'm Jorik Kerridan. I teach the quiet arts back here, where the Brothers don't have to watch, and they prefer it that way as much as I do." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Encrypted Letter"), days = 1 } },
          text = "You read the letter, or you couldn't have found me, so good. Lesson one: never trust anything you didn't decode yourself." },
        { id = "h_defias", when = { class = "ROGUE", topicKnown = "defias" },
          text = "The Brotherhood will try to recruit you, because people who move like you are worth a lot to them. Don't let anyone own you, whoever's asking." },
        { id = "h_seen", when = { metBefore = true }, text = "I heard you coming three steps off, which is better than last time. Last time it was ten." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, behind the stables? Either you're lost or you've come to save me, and I'll take lost; it's less work for both of us." },
        { id = "h_veteran", when = { class = "ROGUE", minLevel = 20 },
          text = "There you are, and I didn't hear you at all that time. Don't look so pleased; I'm getting old, is all." },
        { id = "h_canals", when = { origin = "human_canal_pickpocket", class = "ROGUE" },
          text = "Canal-born; I can tell by how you count the exits before the faces. You'll skip half of lesson one, and I'll make you sit through it anyway." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, out here behind the Abbey. You've taken a wrong turn, unless Khelden Bremen's sent you to spy on my lessons." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Drusilla La Salle's student, I'd guess. You walk quietly for someone with an imp at your heel, and I'll give you that much." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, behind the stables. You're louder than my students, so keep your voice down; they're meant to be learning." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, sneaking round the stables. Not badly, either, but I heard the beast before I heard you." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and I heard you coming, or rather I didn't, which is a compliment I don't give often." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I heard you coming a long way off. Your spirits aren't quiet, you know." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down; the horses gossip." },
        { id = "h_again2", text = "Go on, and keep it quick and quiet." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Who do rogues answer to?", next = "answer", when = { class = "ROGUE" } },
        { text = "Your letter said business has never been better.", next = "trade", when = { class = "ROGUE" } },
        { text = "Behind the stables seems an odd place to teach.", next = "stables" },
        { text = "What would you teach someone like me?", next = "outsider", when = { ["not"] = { class = "ROGUE" } } },
        { text = "What should I be practising?", next = "practise", when = { class = "ROGUE" } },
        { text = "Dwarves aren't meant to be quiet, they tell me.", next = "dwarf", when = { race = "Dwarf", class = "ROGUE" } },
        { text = "The Watchers taught me to go unseen.", next = "watchers", when = { race = "NightElf", class = "ROGUE" } },
        { text = "What do you think of the other teachers?", next = "teachers" },
        { text = "They say you and Khelden don't get along.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you and La Salle ever trade lessons, Jorik?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What can a rogue teach a warrior, Jorik?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "You heard my beast before you heard me, Jorik?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "The Brothers must know what you teach back here, Jorik.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Your trade isn't so far from mine, Jorik.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could your students learn to move as quietly as a cat?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do spirits make a shaman easy to track, Jorik?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go.", next = "END" },
      },
    },
    answer = {
      lines = { { id = "a_default", text = "Ourselves, mostly, and the crown, through people in Old Town you'll meet when you're ready, and not before." } },
      choices = {
        { text = "I'll be ready.", next = "BACK", reply = "You'll know when you are, and so will they. Keep your eyes open until then.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I answer to myself, not to the crown.", next = "BACK", reply = "That's fine, until you need the crown. Remember who you answer to when the answer matters.", fx = { align = { order = -1 } } },
        { text = "And if I'd rather answer to nobody?", next = "answer_nobody" },
      },
    },
    answer_nobody = {
      lines = { { id = "an_default", text = "Then somebody will find you useful anyway, so better to pick who. That's the only freedom this trade gives you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    trade = {
      lines = {
        { id = "t_default", text = "Never better. War's honest; everyone knows who the enemy is. It's when a peace starts to rot that people want spies, scouts and quiet knives." },
      },
      choices = {
        { text = "Who's hiring?", next = "trade_who" },
        { text = "That's a grim way to make a living.", next = "BACK", reply = "It is, and I'll not pretend otherwise. But it keeps people alive who'd never know they owed me.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Sounds like good work, if you can get it.", next = "BACK", reply = "It is, if you've the stomach for it. Most don't, and they find out the hard way.", fx = { align = { light = -1 } } },
      },
    },
    trade_who = {
      lines = {
        { id = "tw_default", text = "SI:7, for one, and the Defias, who want eyes inside Stormwind, and a few nobles who'd want both. Pick the one you can live with, and remember you're your own person.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "The crown, then.", next = "BACK", reply = "Good choice, and the one I'd make. You'll hear from them when the time is right.", fx = { align = { order = 2 }, affinity = 1 } },
        { text = "Whoever pays best.", next = "BACK", reply = "Then you'll be paid well and trusted by nobody. Think on whether that's a life worth having.", fx = { align = { order = -2, honor = -1 }, trait = { greedy = 1 } } },
      },
    },
    stables = {
      lines = { { id = "s_default", text = "Because nobody looks at a stable. The brothers don't come round, the recruits come round once, and the horses keep their opinions to themselves." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    outsider = {
      lines = { { id = "o_default", text = "To check your purse after you've talked to anyone friendly, starting now. Go on, check it." } },
      choices = {
        { text = "It's all there.", next = "outsider_purse" },
        { text = "Very funny.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    outsider_purse = {
      lines = { { id = "op_default", text = "This time, it is, and that's the lesson. It's free of charge, which is more than my students get." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 }, affinity = 1 } } },
    },
    practise = {
      lines = { { id = "practise_l", text = "Walking across the gravel behind the stables without a sound, and then doing it again with a kobold candle on your head. When the candle stays lit, we'll talk about knives." } },
      choices = {
        { text = "A candle? Really?", next = "practise_candle" },
        { text = "I'll start tonight.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    practise_candle = {
      lines = { { id = "practise_candle_l", text = "Really. It teaches you to keep your head still, and a still head is a quiet body. The kobolds wear them for the same reason; they just don't know it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    dwarf = {
      lines = {
        { id = "dwarf_l", text = "They tell you wrong. A dwarf stands still better than anyone I've trained, and still is most of quiet. It's the boots that give you away, so we'll start with the boots." },
        { id = "dwarf_loch", when = { origin = "dwarf_loch_smuggler" },
          text = "They tell you wrong, and you know it; a smuggler who ran the Loch at night knows quiet better than most. It's the boots that give you away, so we'll start with the boots." },
      },
      choices = { { text = "Leave my boots out of this.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    watchers = {
      lines = { { id = "watchers_l", text = "Then you'll find my lessons crude, and you'll be right. But Northshire isn't a forest, and humans look at shadows differently than your people do; I'll teach you how a human guard thinks, which is the half the Watchers couldn't." } },
      choices = {
        { text = "How does a human guard think?", next = "watchers_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watchers_guard = {
      lines = { { id = "watchers_guard_l", text = "About his supper, mostly, and whether the sergeant's watching. Give him a reason to look away and he'll take it gladly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    teachers = {
      lines = { { id = "teachers_l", text = "Khelden Bremen thinks I stole a book from his library. I didn't, but I know who did, and I've let him keep worrying because it keeps him locking doors." } },
      choices = {
        { text = "Tell him the truth.", next = "BACK", reply = "I might, one day, when he stops treating me like a burglar. Until then, a little worry keeps the books safe.", fx = { align = { honor = 1 } } },
        { text = "A worried mage locks more doors. Clever.", next = "BACK", reply = "It does, and he's never once lost a book since. Keep that between us.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm the man behind the stables. That's all the story anybody back here needs." } },
    advice = { { id = "tp_ad", text = "Never stand where you can be seen from the road, never sit with your back to a door, and never tell anyone your real plans, including me." } },
    defias = { { id = "tp_defias", text = "They want spies in Stormwind, so don't be one. That's the whole of my advice." } },
    _none = { { id = "tp_none", text = "Back here we deal in what's useful, and that isn't." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "Ravenholdt is a manor in the Alterac hills that doesn't exist, run by people who don't exist, and if you hear of it again, you'll have earned the right. Until then, forget I spoke." } },
    si7 = { { id = "tp_si7", text = "SI:7 serves the crown and I serve whoever pays, and sometimes those are the same people. That's the whole of it, so don't press." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade's walls look thick from outside, but a good pair of hands and a little patience go a long way. So I'm told, anyway." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate in Alterac are what you get when nobles take up our trade: rich, greedy and sloppy. Never work for them, because they don't pay their dead." } },
  },
}

-- Drusilla La Salle: among the graves, beside Dane Winslow.
P:NPC {
  key = "drusilla", id = TODO_NPC("Drusilla La Salle"), name = "Drusilla La Salle", title = "Warlock Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "sharp" }, values = { "ambitious", "cunning" },
  notices = { "pet", "fel" },
  impression = {
    first = "She speaks of patience and prudence as if power were the reward.",
    third = "{name} met Drusilla La Salle, who keeps to the Northshire graveyard and finds the Brothers' prayers for her oddly touching.",
  },

  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Patience, then prudence, then power, in that order or not at all." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "This isn't for you, and the darkness doesn't want you. Go away." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your imp's making faces at the gravestones, so correct it, because small disobediences grow." },
    { id = "n_taint", cat = "fel", when = { class = "WARLOCK", taint = { min = 20 } },
      text = "You're reaching faster than you're learning, and I can smell it on you. Slow down, or you'll be one of the weak ones." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "We both deal in powers beyond the Light, so the rule I teach holds for you too: patience and prudence, shaman, because power rewards both." } },
      choices = {
        { text = "Patience and prudence, yes. But I'll stay honest.", next = "BACK", reply = "Honest, is it? The spirits will thank you for it, I'm sure, and the Brothers too. I'll admire your principles from a safe distance.", fx = { align = { order = 1 } } },
        { text = "We're alike enough. Teach me what you know.", next = "BACK", reply = "Perhaps we are, though I'd not say so where Brother Sammuel can hear. Come back when you've learned to listen without trembling.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The dead have finished being troubled, and the living leave me alone here, which is the arrangement I prefer. Your kind would say the dead go back to the soil, and I'd say that's a waste of perfectly good silence." } },
      choices = {
        { text = "The dead belong to the earth. Leave them in peace.", next = "BACK", reply = "They do, and the earth can have them when I've finished enjoying the quiet. I don't disturb the bones, if that comforts you.", fx = { align = { honor = 1 } } },
        { text = "Silence is useful. In your place I'd use it too.", next = "BACK", reply = "At last, a visitor with sense. Sit on a headstone if you like; nobody here will complain.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "None at all; they're the best company in Northshire. It's the living who come here with swords drawn and the Brothers' prayers in their ears, looking for something to strike, who trouble me." } },
      choices = {
        { text = "I'll sheathe my sword. The dead deserve peace.", next = "BACK", reply = "That's more courtesy than the living usually show this ground. The dead won't thank you, but I will.", fx = { align = { light = 1 } } },
        { text = "I'll keep it drawn. I don't trust this place.", next = "BACK", reply = "Then keep it drawn and keep your distance, and we'll get along. The graves have outlasted bolder fools.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because it can smell what I've called up and sent back, and it doesn't like the scent any more than the Brothers do. It isn't fear; it's wisdom, and I'd trust it more than any prayer." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because it can smell what I've called up and sent back, and it doesn't like the scent any more than the Brothers do. Your {pet} is pressed against your leg, which is wise, so stay near the gate if it makes you both easier." },
      },
      choices = {
        { text = "If my beast mistrusts this place, so do I.", next = "BACK", reply = "A wise beast, and a wiser master. Keep it close and we'll get along well enough.", fx = { align = { light = 1 } } },
        { text = "My beast will get used to it. So will I.", next = "BACK", reply = "It may, in time, and so will you, which is rather the point. The Brothers never did.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Manners, mostly, and because the dead are very particular about who walks among them uninvited. Jorik Kerridan's students treat this graveyard like a shortcut to the vineyard, and one day something will take offence." } },
      choices = {
        { text = "I'll respect the dead and take the long way round.", next = "BACK", reply = "Good, because I'd rather not explain to Jorik why one of his students came back pale and quiet. Take the long way.", fx = { align = { light = 1 } } },
        { text = "The dead don't mind. Shortcuts are shortcuts.", next = "BACK", reply = "Then take it, and don't come crying to me when something follows you home. I'll not be sending it back.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Khelden thinks I'm a disgrace to the art, and I think Khelden is afraid of everything his books can't explain. We pass each other in the yard and nod, which is as civil as either of us cares to be." } },
      choices = {
        { text = "Khelden's caution keeps the Abbey safe, La Salle.", next = "BACK", reply = "Safe, perhaps, and blind as well. Khelden's caution has kept his students from ever learning what's beyond the next page.", fx = { align = { light = 1 } } },
        { text = "Khelden's fear holds back his students. You're bolder.", next = "BACK", reply = "Bolder, and better for it, though I'd not say so in the yard. Come and see me when Khelden's lessons bore you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Drusilla La Salle. I teach out here among the dead because the Brothers prefer not to see me, and the dead don't mind; they're very good listeners." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tainted Letter"), days = 1 } },
          text = "Marshal McBride's letter, and his nose wrinkled as he wrote it, I'm sure. Welcome; the arcane devours the weak, so we'll see what it makes of you." },
        { id = "h_level", when = { class = "WARLOCK", minLevel = 10 },
          text = "You're ready for Goldshire, so go down to the cellar of the Lion's Pride and ask for Remen Marcot. Don't ask for anything else down there." },
        { id = "h_brothers", when = { metBefore = true }, text = "The Brothers prayed for me again this morning, loudly. I find it touching, in its way." },
        { id = "h_tome", tags = { "news" }, when = { questActive = TODO_QUEST("The Stolen Tome") },
          text = "The book is in a Defias tent in the vineyard, guarded by men who can't read it. Bring it to me, not to the Brothers." },
        { id = "h_tome_done", when = { questDone = TODO_QUEST("The Stolen Tome") },
          text = "I've read three chapters of it. You were right to fetch it, and the Brothers were right to lock it up. Both can be true." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest among my graves. Have you come to bless them? They're past it, and if you've come to bless me, so am I." },
        { id = "h_lamb", when = { origin = "human_lamb_cellar", class = "WARLOCK" },
          text = "Gakin the Darkbinder's cellar in Stormwind sent you, did it, or rather you sent yourself there, down those stairs, and kept going. You'll find the graves quieter, and the lessons slower." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Jorik Kerridan's pupil, out among the graves. You came very quietly, which the dead appreciate, though I'd rather you knocked on a headstone first." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, out here among the dead. Khelden Bremen must be teaching his pupils to wander, or else you've come to see what all the praying is about." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in my graveyard. You've a lot of steel on you for somewhere so peaceful." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and with a companion. Your beast doesn't care for my graveyard, I see; animals have sense." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid has come out among the graves, I see. The dead here don't mind you, and I'm still deciding whether I do." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. The Brothers don't like seeing me, and I'd wager they don't like seeing you either." },
      },
      again = {
        { id = "h_again", text = "Well? The dead are patient, but I am less so." },
        { id = "h_again2", text = "Ask, then, and briefly." },
      },
      choices = {
        { text = "Teach me the next binding, La Salle.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I'm surprised the Brothers tolerate you here.", next = "tolerate" },
        { text = "You seem to want something from their library.", next = "tome", when = { class = "WARLOCK" } },
        { text = "The Light would call this dabbling in darkness.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Who's the man beside you?", next = "dane" },
        { text = "What should I be drilling into my imp, La Salle?", next = "practise", when = { class = "WARLOCK" } },
        { text = "Do warlocks serve the Burning Legion, or only rob it?", next = "legion", when = { class = "WARLOCK" } },
        { text = "Gnomeregan's forbidden shelves taught me the basics.", next = "gnome", when = { race = "Gnome", class = "WARLOCK" } },
        { text = "Why would the dead want a knock on a headstone?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Khelden can't think much of your teaching here.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The dead here don't seem to trouble you, La Salle.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Why does my beast shy from your graveyard?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Doesn't it trouble you, teaching where the dead rest?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you think shamans and warlocks are alike, Drusilla?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go.", next = "END" },
      },
    },
    tolerate = {
      lines = { { id = "t_default", text = "Because the kingdom needs every weapon it has, and I am a very good weapon. They pray about it, and I let them." } },
      choices = {
        { text = "And do you believe in the Light?", next = "tolerate_light" },
        { text = "...", next = "BACK" },
      },
    },
    tolerate_light = {
      lines = { { id = "tl_default", text = "I believe in what answers when it's called. The Light answers the Brothers, they tell me, but I've never needed to ask it for anything." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    tome = {
      lines = {
        { id = "to_default", text = "It's called Powers of the Void, and they kept it in the protected wing, where a warlock loitering by the shelf would be noticed. Then a novice ran off to the Defias with it.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "So you want me to steal it back.", next = "tome_steal" },
        { text = "Shouldn't it go back to the Brothers?", next = "tome_brothers" },
      },
    },
    tome_steal = {
      lines = { { id = "ts_default", text = "I want it on a shelf, mine. The Defias did the stealing and you'll only be moving it, so consider it your first test; fail it, and you'll never hold an imp." } },
      choices = {
        { text = "Then show me the work.", next = "BUSINESS", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tome_brothers = {
      lines = { { id = "tb_default", text = "So they can lock it up again and never read it? A book nobody reads is a waste of a tree. Think about which of us would use it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      big = true,
      lines = {
        { id = "pr_default", text = "Your people frighten the curious away from real power, but not everything from beyond this world wants to rule you. Hold enough power, and it follows instead." },
      },
      choices = {
        { text = "Until the day it doesn't.", next = "priest_day", fx = { align = { light = 1 } } },
        { text = "It's not too late to turn back.", next = "priest_turn", fx = { align = { light = 2 }, trait = { kind = 1 } } },
      },
    },
    priest_day = {
      lines = { { id = "pd_default", text = "Then I'll have been weak, and the arcane devours the weak. I've said so to every student, and I'd be a poor teacher to exempt myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest_turn = {
      lines = { { id = "pt_default", text = "Turn back to what, kneeling in a hall that won't let me near its shelves? Go and pray for me if it helps you, but it won't help me." } },
      choices = {
        { text = "I'll pray anyway.", next = "BACK", reply = "Then you're wasting your breath on my account, but I'll not stop you. Some people need to pray to sleep.", fx = { align = { light = 1 }, affinity = -1, trait = { pious = 1 } } },
        { text = "Then I won't waste my prayers on you.", next = "BACK", reply = "Good, then we understand each other. Save them for someone who'll thank you.", fx = { align = { light = -1 } } },
      },
    },
    dane = {
      lines = {
        { id = "d_default", text = "That's Dane Winslow. When a warlock tires of a minion, he sees to its unmaking for a fee, and it's tidy work; the graveyard suits him." },
        { id = "d_other", when = { ["not"] = { class = "WARLOCK" } },
          text = "That's Dane Winslow, and his services are for warlocks only, so you've no reason to stand near him, or me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    practise = {
      lines = { { id = "practise_l", text = "Your imp's obedience and your own patience, which are the same lesson from two ends. Command it to fetch, and when it sulks, wait it out; whoever tires first loses." } },
      choices = {
        { text = "And if it never stops sulking, do I make it bleed?", next = "practise_sulk" },
        { text = "I'll outlast it, and it will learn who's master.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    practise_sulk = {
      lines = { { id = "practise_sulk_l", text = "Then you'll have learned that patience is power, which is the whole of my teaching, and you'll have learned it from an imp. There are worse teachers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    legion = {
      big = true,
      lines = { { id = "legion_l", text = "The Legion made the creatures we bind, as a smith makes a sword. A sword doesn't serve the smith, and neither do I, though the Brothers would tell you there's no difference." } },
      choices = {
        { text = "The smith may want his sword back.", next = "BACK", reply = "And when he comes for it, he'll find it sharper than he left it. That's the difference between a sword and a fool.", fx = { align = { light = 1 } } },
        { text = "Then we take the Legion's weapons and turn them.", next = "BACK", reply = "Exactly, and that's the whole of our art. The Brothers can call it heresy, but they'll be glad of it when the Legion comes.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Has anyone come asking for theirs?", next = "legion_ask" },
      },
    },
    legion_ask = {
      lines = { { id = "legion_ask_l", text = "Not yet, and I won't discuss it among the graves. They're very good listeners, as I said." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = {
        { id = "gnome_l", text = "Then you've learned the basics badly and from a book with nobody to stop you, which is how most of the Defias' novices learn their trade too. We'll unlearn it, slowly." },
        { id = "gnome_texts", when = { origin = "gnome_forbidden_texts" },
          text = "You took those books while your city burned, and nobody was there to stop you reading the wrong chapters first. We'll unlearn it, slowly." },
      },
      choices = {
        { text = "My method was perfectly sound.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Slowly, then, if that's what it takes.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I teach the first lessons to the ones the Brothers would rather not see. My history is my business." } },
    advice = { { id = "tp_ad", text = "The arcane only corrupts the weak. Remember that whatever road you take, and especially if it's mine." } },
    northshire_abbey = { { id = "tp_abbey", text = "Very holy, with very loud bells. I'm out here for the quiet." } },
    defias = { { id = "tp_defias", text = "Thieves who stole a book they can't read. I've been grateful to them exactly once." } },
    _none = { { id = "tp_none", text = "Ask the dead. They keep more secrets than the living do." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion is the sea beneath every warlock's little boat, and the clever ones never forget how deep it is. The Brothers would rather I didn't say that, so I'm saying it to you." } },
    holy_light = { { id = "tp_holy_light", text = "The Brothers have their Light and I have my shadow, and we pass each other on the stair very politely. Neither of us is going anywhere." } },
    scourge = { { id = "tp_scourge", text = "The Scourge was raised by necromancers, not warlocks, and I'll thank you to remember the difference. We bargain with demons; they steal from the dead." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood tolerates me because the kingdom needs warlocks and they'd rather have one where they can see her. It's a sensible arrangement, and I'm sensible enough to keep it." } },
  },
}

---------------------------------------------------------------------------
-- Goldshire
---------------------------------------------------------------------------

-- Lyria Du Lac: behind the smithy, next to Brother Wilhelm.
P:NPC {
  key = "lyria", id = TODO_NPC("Lyria Du Lac"), name = "Lyria Du Lac", title = "Warrior Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "proud" }, values = { "brave", "stern" },
  notices = { "kit" },
  impression = {
    first = "She greeted me with her shield up and didn't apologise for it.",
    third = "{name} met Lyria Du Lac in Goldshire, who turns Elwynn's farm hands into Stormwind's soldiers.",
  },

  greetings = {
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Shield up, always, even when you're greeting me." },
    { id = "g_other", when = { ["not"] = { class = "WARRIOR" } }, text = "This is for fighters, so try something safer. Knitting, maybe." },
  },

  notice = {
    { id = "n_kit", cat = "kit", place = "before", when = { class = "WARRIOR", durability = { max = 0.3 } },
      text = "You let them hit you, and a lot. Stormwind's warriors take a beating; they don't invite one." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It'll accept anyone who holds the line. Your spirits might help, but it's your feet that hold the wall, so stand firm." } },
      choices = {
        { text = "I'll stand firm on the wall, Lyria. You'll see.", next = "BACK", reply = "Good, and I'll hold you to it on the first drill. Feet planted, shield up, and don't look back.", fx = { align = { order = 1 } } },
        { text = "Walls are for the timid. I'll fight in the open.", next = "BACK", reply = "Then you'll fight alone and die in the open, and I'll be on the wall watching. Come back when you change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The first week they'd drop their shields and run, and I'd let them, because a man who's run once learns why he shouldn't. By the end of the month they'd hold, and that's the whole of what I teach." } },
      choices = {
        { text = "Holding the line is everything. Train them hard.", next = "BACK", reply = "That's what I do, and the ones who hold will thank me for it one day. Some of them already have.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Running from a bear is wisdom, not cowardice. Don't punish it.", next = "BACK", reply = "I don't punish it, I let them learn from it. A bear is one thing, but a gnoll line is another.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "To hold ground when the beast falls, because one day it will, and you'll have a gnoll in front of you and nowhere to go. Stand like you mean it, and the rest is up to the Light and your aim." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "To hold ground when the beast falls, because one day it will, and you'll have a gnoll in front of you and nowhere to go. That {pet} of yours is a good shield, so treat it well, because you'll miss it when it's gone." },
      },
      choices = {
        { text = "I'll learn to stand when I must.", next = "BACK", reply = "That's all I ask, and you'll live longer for it. Come and drill with my lot one morning.", fx = { align = { order = 1 } } },
        { text = "I'll stay back and let my beast hold.", next = "BACK", reply = "Then pray it never falls, because one day it will. I'll still teach you, if you change your mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd teach you to take a hit, which every rogue I've met is bad at, and I'd teach you to stop running long enough to see what's coming. The rest you'll learn from Sylvius, and I make a point of not asking what that is." } },
      choices = {
        { text = "I'll learn to stand and take a hit, Du Lac.", next = "BACK", reply = "Good, and you'll be glad of the bruises later. Come to the yard tomorrow at dawn.", fx = { align = { honor = 1 } } },
        { text = "Running is smarter than standing. I'll keep running.", next = "BACK", reply = "Smarter, maybe, until you're cornered. I'll be here when you learn that lesson the hard way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They learn to stand still while fire goes over their heads, which is harder than it sounds and takes a week of drills. The farm hands who come to me flinch at a candle, but by the time I'm done, they don't even blink at a fireball." } },
      choices = {
        { text = "Then I'll trust your warriors and never waste their courage.", next = "BACK", reply = "Good, because courage is the hardest thing to train and the easiest thing to waste. My soldiers will be glad of you.", fx = { align = { honor = 1 } } },
        { text = "Your warriors had better not flinch. My fire won't wait.", next = "BACK", reply = "They'll not flinch, but they'll remember who set their hair alight. Mind your aim, mage.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They'd fight beside it if I told them to, but they'd keep one eye on it the whole time, and a soldier with one eye on his ally has only one eye on his enemy. That's the trouble with your trade, and I've never found an answer to it." } },
      choices = {
        { text = "Then I'll keep it well away from your soldiers' flanks.", next = "BACK", reply = "Then you'll have done more than most of your sort ever thought to. My soldiers will thank you.", fx = { align = { light = 1 } } },
        { text = "Your soldiers had better learn to trust it. War needs every weapon.", next = "BACK", reply = "Every weapon, perhaps, but not every ally. I'll not order my soldiers to trust what they can't.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They need someone to tell them it's all right to be afraid, and I'm not the one to do it, because they'd never trust my orders again. Priestess Josetta comes down from the inn some evenings and sits with the ones who've had a bad day, and I pretend I haven't noticed." } },
      choices = {
        { text = "Fear is no shame. They need comfort as much as drills.", next = "BACK", reply = "Josetta would agree with you, and so would I, quietly. I'll keep pretending not to notice.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A coddled soldier breaks. Let them face their fear alone.", next = "BACK", reply = "Some do break, and I'll not pretend otherwise. But the ones who break alone break worse.", fx = { align = { light = -1 } } },
        { text = "Something else, Du Lac.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "About forty pounds of plate and an oath, and the oath's the heavier of the two. Wilhelm and I share this yard because his paladins and my soldiers end up on the same walls, and I want them to have met before the fighting starts." } },
      choices = {
        { text = "An oath makes a soldier stronger, Du Lac.", next = "BACK", reply = "It does, and the ones who keep it are worth ten who don't. Wilhelm's lot keep theirs.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "An oath is only words. The steel does the work.", next = "BACK", reply = "Steel does, aye, until it breaks, and then it's the oath that holds the line. Ask Wilhelm.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in the practice yard. Stand by the wall, if you would, because somebody always needs you by noon." },
        { id = "h_default", text = "I'm Lyria Du Lac, and I make Stormwind's soldiers out of Elwynn's farm hands. The kingdom's strength isn't its walls; it's whoever's standing on them." },
        { id = "h_training", tags = { "news" }, when = { questActive = TODO_QUEST("A Warrior's Training") },
          text = "Your training's not finished. There's someone you need to see, and you'll have to go and find them, because that's part of it." },
        { id = "h_wilhelm", when = { class = "PALADIN" },
          text = "Brother Wilhelm's round the side. Tell him I'll have the practice yard back by noon, and he'll know what that means." },
        { id = "h_dawn", when = { metBefore = true }, text = "You're up early, good. The recruits weren't, but they are now." },
        { id = "h_llane", when = { class = "WARRIOR", maxLevel = 12 },
          text = "Llane Beshere's work, from the Abbey; I can tell by the feet, because he teaches stance like it's scripture. Good, now we'll see what you do with it." },
        { id = "h_veteran", when = { class = "WARRIOR", minLevel = 25 },
          text = "Look at you, with a shield that's been used and armour that's been mended twice. Stormwind's lucky to have you, though don't tell it I said so." },
        { id = "h_guard", when = { origin = "human_city_guard", class = "WARRIOR" },
          text = "A Watch recruit, by that grip, come out to the country to learn what a real fight smells like. Good; the halberd taught you to stand, and I'll teach you to stop leaning on it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in my yard. Stand at the back and watch, because you'll learn more about a fight from the edges than you will from the middle." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and a long way from the tower. You'll be wanting a warrior to stand in front of you, I expect, and I train the best in Elwynn." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Out of the cellar and into the light, I see. Keep that creature away from my recruits, because they're nervous enough already." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter in my yard. You're not here to train, I can tell, so I'll hope you're here to watch." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you're no farm hand, so I'll wager you've seen a fight or two before you came to me." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and with your shield down! The kingdom's strength is whoever stands on its walls, so will you stand there?" },
      },
      again = {
        { id = "h_again", text = "What else? Keep your shield up while you ask." },
        { id = "h_again2", text = "Go on, the yard's waiting." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "What makes a good warrior?", next = "good" },
        { text = "Why is Stormwind's strength in its people?", next = "pillar" },
        { text = "Who is it I need to see for my training?", next = "harry", when = { class = "WARRIOR", minLevel = 10 } },
        { text = "I worked Westfall's fields before this.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "What should I be practising?", next = "practise", when = { class = "WARRIOR" } },
        { text = "Dwarves fight differently from your farm hands.", next = "dwarf", when = { race = "Dwarf", class = "WARRIOR" } },
        { text = "I doubt a gnome has a place in your line.", next = "gnome", when = { race = "Gnome", class = "WARRIOR" } },
        { text = "The Sentinels trained me with a glaive.", next = "kaldorei", when = { race = "NightElf", class = "WARRIOR" } },
        { text = "What do you think of the other trainers in Goldshire?", next = "trainers" },
        { text = "Would you teach a rogue the warrior's way?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Your warriors must learn to fight beside mages.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Would your recruits fight beside something they'd rather not look at?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What would a warrior trainer teach a hunter, Du Lac?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your recruits ever need more than bandages, Lyria?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "A warrior and a paladin can't be so different, Lyria.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your recruits wouldn't stand firm if a bear charged them.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Will Stormwind accept shamans on its walls, Lyria?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go.", next = "END" },
      },
    },
    good = {
      lines = { { id = "g2_default", text = "Getting up again. Everyone gets knocked down, and warriors are the ones who are annoyed about it." } },
      choices = {
        { text = "And a great one?", next = "good_great" },
        { text = "I'll remember.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    good_great = {
      lines = { { id = "gg_default", text = "Someone who gets up, then hauls the one beside them up too. One warrior's a fighter, but two who pick each other up are a line." } },
      choices = {
        { text = "Then I'll be the one who hauls them up.", next = "BACK", reply = "Then you'll make a warrior worth having beside me. That's all I ask.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I'll look after myself first, because that's how you survive.", next = "BACK", reply = "You'll survive, aye, and alone. I'd sooner have a soldier who stands with the line.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pillar = {
      big = true,
      lines = {
        { id = "pi_default", text = "Because Lordaeron fell, and Stromgarde's barely standing. Stormwind's what holds humanity up now, with will and a good blade, and nothing else will do it." },
      },
      choices = {
        { text = "Then I'll be one of the blades.", next = "BACK", reply = "Good, and Stormwind needs every one it can get. Come and drill with us.", fx = { align = { order = 2 }, affinity = 2 } },
        { text = "I'll fight for myself, not for a kingdom.", next = "BACK", reply = "Then you'll fight alone, and Stormwind will fall without you. I'll still teach you to hold a shield.", fx = { align = { order = -2 } } },
        { text = "Lordaeron had will and blades too.", next = "pillar_lordaeron" },
      },
    },
    pillar_lordaeron = {
      lines = {
        { id = "pl_default", text = "It did, and it rotted from inside, which is why I drill the recruits on the walls and not just the field. You watch your own side too." },
        { id = "pl_refugee", when = { origin = "human_lordaeron_refugee" },
          text = "You'd know, because you walked out of it, so you know better than any recruit here why I don't stop drilling." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    harry = {
      lines = {
        { id = "h2_default", text = "Harry Burlguard, an old veteran who drinks at the Pig and Whistle in Old Town, and a good teacher. He'll teach you things I'm not allowed to show recruits in daylight." },
      },
      choices = {
        { text = "Not allowed?", next = "harry_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harry_more = {
      lines = { { id = "hm_default", text = "Dirty fighting, mostly, the tavern kind, and you'll see what I mean. Bring coin for the drinks; he'll expect you to keep up." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    farmhand = {
      lines = { { id = "f_default", text = "Then you've lifted more than half my recruits ever will. Lift a shield like a sack of grain, close to the body, and you'll be fine." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Rend, Heroic Strike and Charge, every morning, on the dummies behind the smithy, and then again when you're tired. Anyone can swing fresh; it's the tired swing that keeps you alive at Jasperlode." },
        { id = "practise_old", when = { minLevel = 20 },
          text = "Your shield, and changing stance in the middle of a fight. You've got the swinging down; now learn to stop swinging when the thing in front of you is bigger than you are." },
      },
      choices = {
        { text = "Why practise tired?", next = "practise_tired" },
        { text = "I'll be at the dummies at dawn.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    practise_tired = {
      lines = { { id = "practise_tired_l", text = "Because the kobolds won't wait for you to catch your breath. Train tired, fight fresh, that's the whole of it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = {
        { id = "dwarf_l", text = "They do, and better, some of them. You plant your feet like the ground owes you money, and I'll not change that; I'll only teach you how Stormwind's lines form up, so you're not standing alone in front of one." },
        { id = "dwarf_ward", when = { origin = "dwarf_military_ward" },
          text = "Military Ward, I'd wager, by the way you stand. You plant your feet like the ground owes you money, and I'll only teach you how Stormwind's lines form, so you're not alone in front of one." },
      },
      choices = {
        { text = "A dwarf is never alone. We stand together.", next = "BACK", reply = "I've seen it, and I'd not argue with an Ironforge line. Teach my lot how it's done.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll stand where I please, lines or none.", next = "BACK", reply = "You'll stand where I tell you in my yard, dwarf, or you'll stand outside it. Your choice.", fx = { align = { order = -1 } } },
      },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "Low in it, under the shields, where the gnolls can't reach you and you can reach their knees. My farm hands laugh until the first sparring match, and then they ask you for lessons." } },
      choices = { { text = "Let them laugh.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    kaldorei = {
      lines = {
        { id = "kaldorei_l", text = "So I see; you move like a blade that's been dancing for a thousand years, and maybe you have. I've nothing to teach you about grace, but I can teach you how a human line moves, and why it moves so badly." },
        { id = "kaldorei_watch", when = { origin = "nightelf_auberdine_watch" },
          text = "You stood watch on a beach, I'd guess, where the sand shifts under you; it shows. I can teach you how a human line moves, and why it moves so badly." },
      },
      choices = { { text = "Show me, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    trainers = {
      lines = { { id = "trainers_l", text = "Brother Wilhelm shares my yard and my patience, the priestess upstairs patches my recruits, and the mage keeps them from playing with fire. Whatever's in Farley's cellar, I don't ask, and I don't send my recruits down there." } },
      choices = {
        { text = "Why not ask?", next = "trainers_cellar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainers_cellar = {
      lines = { { id = "trainers_cellar_l", text = "Because the kingdom wants them, and the kingdom pays me, and I don't ask what my pay is standing next to. A soldier picks her battles." } },
      choices = {
        { text = "They should be run out of Goldshire.", next = "BACK", reply = "I'd not argue, though I'd not say it loud either. The kingdom has its reasons, and I keep my eyes on my soldiers.", fx = { align = { light = 1 } } },
        { text = "The kingdom needs every weapon it has.", next = "BACK", reply = "It does, and I've told myself that every night since they came. I'd sleep better if I believed it.", fx = { align = { light = -1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a warrior of Stormwind who trains others behind a smithy. The smithy was here first, and I've made my peace with it." } },
    advice = { { id = "tp_ad", text = "Keep your shield up and your boots laced. More recruits die of a loose boot than a gnoll." } },
    hogger = { { id = "tp_hogger", text = "Every warrior I train goes after Hogger too early, every last one. Go after him late." } },
    _none = { { id = "tp_none", text = "Not my business. My business is the practice yard." } },
    second_war = { { id = "tp_second_war", text = "My mother carried a pike in the Second War, all the way to Blackrock Spire, and she taught me to hold a shield before I could read. That was all the schooling I needed." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "Every warrior I train hears about the arena in Stranglethorn and wants to fight there, and I tell them it's for fools with gold to lose. They go anyway, and a few come back richer." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's strongman challenged me to arm wrestle last year and lost twice, and he still won't look at me. I'm rather proud of that." } },
    scourge = { { id = "tp_scourge", text = "If you're bound north against the Scourge, keep your boots laced and your shield up, because the dead don't tire and they don't stop. You'll have to do both as well." } },
  },
}

-- Priestess Josetta: upstairs at the Lion's Pride; wishes she'd been braver when young.
P:NPC {
  key = "josetta", id = TODO_NPC("Priestess Josetta"), name = "Priestess Josetta", title = "Priest Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "steady" }, values = { "pious", "kind" },
  spiritSensitive = true,
  prejudice = { class = "WARLOCK", amount = 10, why = "Lives over the inn cellar; a summoning last winter scorched the boards under her bed." },
  notices = { "travel", "form" },
  impression = {
    first = "She looked at my boots with something close to envy.",
    third = "{name} met Priestess Josetta, who teaches the Light above the noise of the Lion's Pride and envies those who travel.",
  },

  greetings = {
    { id = "g_prejlock1", when = { prejudiced = true }, text = "I hear what goes on in that cellar through the floorboards every night, and I know you're part of it. Don't bring it up these stairs." },
    { id = "g_prejlock2", when = { prejudiced = true }, text = "One of your fellows called something up last winter, and it scorched the boards beneath my bed. Say what you want and then go back down." },
    { id = "g_prejlock_over", when = { prejudiced = "overcome" }, text = "You've never once brought that chanting up these stairs with you. I'll talk with you, though I'll keep the candles lit while I do." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Welcome, friend in the Light. Come in from the noise." },
    { id = "g_other", when = { ["not"] = { class = "PRIEST" } }, text = "Don't turn away from the Light, friend, whatever road you're on." },
  },

  notice = {
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "You've come back wrapped in shadow, I see. I won't ask whether it was the road or the lessons; I'm only glad you came back at all." },
    { id = "n_travel", cat = "travel", when = { minLevel = 20 },
      text = "You've been far, haven't you? I can tell by your boots. I always meant to go far myself, and I meant to for thirty years." },
  },

  start = "hello",
  nodes = {
    dd_josetta_d = {
      lines = {
        { id = "dd_josetta_d_a", text = "Then let me count them for you, gently, because someone ought to. Every time you come back, the Light has given you another chance, and I'd ask you to spend the next one more wisely than the last." },
      },
      choices = {
        { text = "The Light brings me back for a reason. I'll keep fighting.", next = "dd_josetta_d2", fx = { align = { light = 1 } } },
        { text = "Dying is just part of the work. I don't dwell on it.", next = "dd_josetta_d2", fx = { align = { light = -1 } } },
      },
    },
    dd_josetta_d2 = {
      lines = {
        { id = "dd_josetta_d2a", text = "Perhaps, but I've seen what too many deaths do to a soul, and it isn't always visible from the outside. Rest at the Lion's Pride before you go out again, and come and see me if the dreams get bad." },
      },
      choices = { { text = "I will, Priestess. Something else.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some days I do. I stayed to heal, and I don't regret it, but your boots make me wistful, so tell me where you've been." } },
      choices = {
        { text = "Staying to heal is its own journey, Josetta.", next = "BACK", reply = "It is, and I've told myself so for years. Still, it's lovely to hear it from someone who walks.", fx = { align = { light = 1 } } },
        { text = "Go now. Healing can wait; the world can't.", next = "BACK", reply = "Oh, I'd love to, but the recruits keep coming and somebody has to mend them. Maybe next spring, if I'm brave enough.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because the recruits keep coming and somebody has to teach them, and the somebody always turns out to be me. I tell myself the Light is the same everywhere, but I'd still like to see it fall through those great branches." } },
      choices = {
        { text = "Your duty is here, Josetta. The trees will keep.", next = "BACK", reply = "It will, and so will I, I suppose. Thank you for reminding me why I stay.", fx = { align = { order = 1 } } },
        { text = "Then go. Somebody else can teach the recruits for a season.", next = "BACK", reply = "You make it sound so easy, and perhaps it is. I'll think on it, which is more than I've done in years.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "All the time in the world, and more than they have for it, usually. I've healed a dozen of you this month, and each one swore it was the last time, and each one came back next week." } },
      choices = {
        { text = "I'll take the Light's help and be grateful.", next = "BACK", reply = "That's what I like to hear, and I'll not ask you to promise it's the last time. Sit down.", fx = { align = { light = 1 } } },
        { text = "I'll heal on my own, Priestess.", next = "BACK", reply = "You'll try, and I'll be here when you come back. They always do, you know.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It heals what it touches, and I've laid hands on more than one hunter's wolf. They don't pray, but they don't complain either, and they never forget who helped them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It heals what it touches, and I've laid hands on more than one hunter's wolf. Your {pet} looks well, but if it's ever hurt, bring it up; I'll not turn it away." },
      },
      choices = {
        { text = "My beast deserves the Light as much as I do.", next = "BACK", reply = "I agree, and I'll gladly lay hands on it. Bring it to me if it's hurt.", fx = { align = { light = 1 } } },
        { text = "Save it for people, Priestess. My beast will mend.", next = "BACK", reply = "It might, but I'd rather help it mend faster. The Light doesn't mind fur.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Of course they can, though it's harder, because your trade asks you to keep secrets, and the Light asks you to keep none. I've known rogues who walked closer to the Light than any priest, and I've known priests who walked further from it than any rogue." } },
      choices = {
        { text = "I'll try to walk closer to the Light, Priestess.", next = "BACK", reply = "That's all the Light asks of anyone, and it's more than most manage. Come and talk to me any evening.", fx = { align = { light = 1 } } },
        { text = "My secrets are my own. The Light can mind its business.", next = "BACK", reply = "It might, if you let it, but I'll not press you. I'm up these stairs most evenings, whenever you're ready.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "He doesn't disapprove, exactly, but he thinks the Light is a sort of arcane theory nobody's bothered to write down properly. I've told him that faith isn't a theory, and he's told me that's exactly what a theorist would say." } },
      choices = {
        { text = "Faith and study can stand side by side. Both have worth.", next = "BACK", reply = "That's what I keep telling him, and he keeps pretending not to hear. I'll tell him a stranger agreed with me, and watch him sulk.", fx = { align = { order = 1 } } },
        { text = "Zaldimar's right. Faith is only theory unwritten.", next = "BACK", reply = "Oh, don't you start, I'll never hear the end of it. Faith that needs writing down isn't faith, whatever he says.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It troubles me more than I let on, because my students pray up here and something else answers down there, and they're only a floor apart. I pray for the cellar every night, though I suspect the cellar doesn't pray for me." } },
      choices = {
        { text = "Keep praying, Priestess. Someone below may hear you.", next = "BACK", reply = "I will, every night, and I'll not give up on them. The Light is patient, even if I'm not always.", fx = { align = { light = 1 } } },
        { text = "The cellar answers to power, not prayer.", next = "BACK", reply = "Perhaps, but I've seen prayer move harder things than a cellar door. I'll keep at it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "All of them, a little, though I try not to let it show. I'll ask a kindness of you: when you're far from here, bless someone who needs it and think of me, because I'll likely never get there myself." } },
      choices = {
        { text = "I will, Josetta. You'll be with me on the road.", next = "BACK", reply = "Thank you, that means more than you know. Go and see the world for both of us.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then leave Goldshire yourself. Don't live through others.", next = "BACK", reply = "You make it sound so easy, and perhaps it is. But the recruits need me, and I'm not brave enough to leave them yet.", fx = { align = { light = -1 } } },
        { text = "Something else, Priestess.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_deaths_josetta", when = { deaths = { min = 10 } },
          text = "I've seen you carried up those stairs more times than I'd like, and I've started to know you by your wounds. The Light is patient, but I'd sooner it didn't have to be so patient with you." },
        { id = "dd_drown_josetta", when = { deathCause = "drowning" },
          text = "You drowned, didn't you? There's a grey look the lake leaves on people even after the spirit's come back, and you have it, so please keep clear of Crystal Lake until you've learned to swim properly." },

        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Brother Wilhelm's down the road, behind the smithy, but you're welcome here too, if you'd like a quiet word before the drills." },
        { id = "h_default", text = "I'm Priestess Josetta. I teach the Light up here, above the noise of the common room, or mostly above it, and I dream of the roads I never took." },
        { id = "h_garments", when = { questActive = TODO_QUEST("Garments of the Light") },
          text = "There are folk on the road who need mending more than they'll admit. Find them and heal them, and don't wait to be asked." },
        { id = "h_prayer", key = true, when = { questActive = TODO_QUEST("Desperate Prayer") },
          text = "There's more for you beyond Goldshire. Go and learn it. I'll be here, envying you a little." },
        { id = "h_favor", tags = { "news" }, when = { questActive = TODO_QUEST("In Favor of the Light") },
          text = "Priestess Anetta sent you down from the Abbey, and she only sends the ones she's proud of. Don't tell her I told you." },
        { id = "h_forever", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Confounding Flash") }, { questActive = TODO_QUEST("Divine Grace") } } },
          text = "A new lesson! Even I'm still learning them, but don't tell the Cathedral that either." },
        { id = "h_young", when = { maxLevel = 12 },
          text = "When I was your age I wanted to see the whole world, and I stayed in Goldshire instead. Don't do that, little one; go." },
        { id = "h_go", when = { metBefore = true }, text = "You're still here? That's good, and not good. The world's bigger than Goldshire, little one, so go and see it, and come back and tell me." },
        { id = "h_far", tags = { "news" }, when = { class = "PRIEST", minLevel = 30, metBefore = true },
          text = "You came back, you actually came back, from wherever that tan's from! Sit down and tell me everything, and start with the sea." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, up here among the prayers. You'll be Keryn Sylvius's student, then, come to see what the Light looks like up close." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and Zaldimar Wefhellt's student, no doubt. He's just across the hall, though he pretends not to hear our prayers." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
        { id = "h_prejlock", when = { class = "WARLOCK", prejudiced = true }, text = "You've come up from the cellar, haven't you? I know the smell now, and I know what you call down there, so please don't pretend otherwise with me." },
        { id = "h_prejlock_over", when = { class = "WARLOCK", prejudiced = "overcome" }, text = "Oh, it's you. You're the quiet one from downstairs, and I've mostly stopped jumping when you knock." },
          text = "You're from the cellar downstairs. I can hear them chanting some nights, right through the floorboards, and it makes the candles gutter." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior up here, among the candles. You've come a long way from the common room, and you'll want something more than ale, I hope." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, up all those stairs. I hope your companion didn't take them too fast; Farley's carpet is older than he is." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, all the way from across the sea! I've always meant to see Teldrassil and always stayed right here, so you'll have to tell me what it's like." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and well-travelled by the look of your boots. I always meant to go far, so tell me where the spirits have taken you." },
      },
      again = { { id = "h_again", text = "What else? Mind the floorboard; it squeaks to Farley." } },
      choices = {
        { text = "I've fallen more times than I can count, Priestess.", next = "dd_josetta_d", when = { deaths = { min = 10 } } },

        { text = "Train me.", next = "BUSINESS", when = { class = "PRIEST" } },
        { text = "Why didn't you travel?", next = "travel" },
        { text = "Where would you have gone?", next = "where" },
        { text = "Tell me about the Cathedral.", next = "cathedral", when = { class = "PRIEST" } },
        { text = "I've been far. Want to hear about it?", next = "stories", when = { minLevel = 30 } },
        { text = "I doubt a rogue can walk in the Light, Priestess.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'd guess Zaldimar disapproves of your teaching, Priestess.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "The chanting below must trouble your prayers, Priestess.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does the Light have time for warriors, Priestess?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the Light heal beasts as well as people, Priestess?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You seem to envy the paladins who go out into the world.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why have you never gone, if you want to see it?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you wish you had travelled, Josetta?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you.", next = "END" },
      },
    },
    travel = {
      big = true,
      lines = { { id = "t_default", text = "Courage, mostly, or the lack of it. There was always a reason to stay one more season, and seasons add up." } },
      choices = {
        { text = "It's not too late.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Goldshire needed you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Everywhere! The sea first, because I've never seen it, then the mountains, and the forests where the elves live, and a desert, just to feel too hot once." } },
      choices = {
        { text = "I'll bring you back something from the sea.", next = "BACK", fx = { affinity = 3, trait = { generous = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral = {
      lines = { { id = "c_default", text = "Bigger than Northshire's chapel ten times over, and quieter. High Priestess Laurena will teach you there when you're ready; she's stern, and she's also right, which is worse." } },
      choices = {
        { text = "I'd have thought you'd go to the Cathedral yourself.", next = "cathedral_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cathedral_why = {
      lines = { { id = "cw_default", text = "Someone has to be here for the ones who aren't ready yet, or that's what I tell myself, and some days it's even true." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    stories = {
      lines = {
        { id = "s_default", text = "Yes, sit down! Did you see the sea, and what colour was it? Don't say blue; everyone says blue." },
        { id = "s_booty", when = { questDone = TODO_QUEST("The Bloodsail Buccaneers") }, text = "You've been to Booty Bay, with the pirates? Oh, I'd have fainted. Tell me slowly, from the beginning." },
      },
      choices = {
        { text = "Grey, mostly, and loud.", next = "BACK", fx = { affinity = 3 } },
        { text = "Green, near the shore. Like old glass.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I've been Goldshire's priestess, above the noise of the inn, for longer than I meant to be.", next = "travel" } },
    advice = { { id = "tp_ad", text = "Go somewhere you've never been, once a year at least. The Light looks different from a new place." } },
    lions_pride = { { id = "tp_inn", text = "A lovely inn with thin floors, so I know all of Farley's stories by heart." } },
    _none = { { id = "tp_none", text = "I've never been far enough to know that, so ask someone who's travelled." } },
    holy_light = { { id = "tp_holy_light", text = "The Light is in the small mercies, friend: a mended arm, a hot meal, a kind word at the bar. I see more of it here above an inn than I ever did in the Cathedral." } },
    heroes_vigil = { { id = "tp_heroes_vigil", text = "The stone on Stone Cairn Lake carries the names of Goldshire's dead, and I used to row out on the anniversary to pray there. I can't now, with the wizards, so I pray from the shore." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "During Faire week the floor shakes with dancing till dawn, and I give up on sleep entirely. I go down for a little while, Light forgive me, and dance with Farley." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn writes to every priest in the kingdom asking for help in the north, and I've sent what prayers and coin I can. They're doing the Light's work where it's hardest." } },
  },
}

-- Zaldimar Wefhellt: upstairs at the Lion's Pride, left at the top of the stairs.
P:NPC {
  key = "zaldimar", id = TODO_NPC("Zaldimar Wefhellt"), name = "Zaldimar Wefhellt", title = "Mage Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "proud" }, values = { "curious" },
  notices = { "arcane" },
  impression = {
    first = "He finds nearly everything at least a little interesting.",
    third = "{name} met Zaldimar Wefhellt of the Wizard's Sanctum, who teaches magic from a modest room above Goldshire's inn.",
  },

  greetings = {
    { id = "g_mage", when = { class = "MAGE" }, text = "Ah, a colleague, a junior colleague! Come in, and mind the books." },
    { id = "g_other", when = { ["not"] = { class = "MAGE" } }, text = "Magic hurts the untrained, so please stand over there. A little further." },
  },

  notice = {
    { id = "n_skyborne", cat = "arcane", when = { race = "Skyborne", class = "MAGE" },
      text = "A High Order mage, in my little room above an inn. The Kirin Tor will be jealous. I intend to enjoy that." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Everything is interesting, my friend, from your spirits to the horses in the stable below, so do tell me more." } },
      choices = {
        { text = "Curiosity is a fine virtue, Zaldimar. Keep it.", next = "BACK", reply = "Oh, I intend to, my friend, it's the only virtue I've managed to keep. Come back and tell me about the spirits sometime.", fx = { align = { order = 1 } } },
        { text = "Curiosity kills. Mind your own studies.", next = "BACK", reply = "It has, on occasion, but so has boredom, and I'd sooner go out curious. I'll mind my studies, thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Whether you keep your own mind in the bear's shape, and whether you remember the taste of things afterward, which nobody in the Sanctum dares to ask. I suspect the answer would ruin three of my favourite theories." } },
      choices = {
        { text = "Ask, then. Shared knowledge helps folk understand us.", next = "BACK", reply = "You'd let me? Oh, that's splendid, and I'll footnote you generously. The Sanctum will be scandalised.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Some secrets belong to the grove, not to the Sanctum.", next = "BACK", reply = "That's fair, and I'll not press, though it pains me. Some theories must stay unproven, I suppose.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Very practical people, and that's meant kindly. A warrior solves a problem with what's in front of him, while a mage solves it with what's in a book, and both are useful, though I prefer mine." } },
      choices = {
        { text = "Both have their place. I'm glad of the book.", next = "BACK", reply = "That's generous, and I'll return the courtesy by saying I'm glad of the sword too. Occasionally.", fx = { align = { order = 1 } } },
        { text = "The book's too slow. I'll take the sword.", next = "BACK", reply = "Then I'll stand behind you and read, and we'll both be useful. Mind you don't charge into my fireball.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I did once, in the Sanctum, for a paper nobody read. It isn't magic, as far as I could tell, which annoyed me greatly; it's patience, and that's harder to teach." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I did once, in the Sanctum, for a paper nobody read, and it isn't magic; it's patience, which is harder to teach. Your {pet} seems very attached to you, and I'd be flattered, if I were you, and a little envious." },
      },
      choices = {
        { text = "It's trust, earned over time. Nothing more.", next = "BACK", reply = "Trust, earned over time, now there's something I can't measure. I'll add it to my notes, with an apology.", fx = { align = { light = 1 } } },
        { text = "It's training. The beast does as it's told.", next = "BACK", reply = "That's what the Sanctum thought, and they were quite wrong, I suspect. Still, I'll not argue with your results.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "One tried last winter and got stuck in the window, which taught him more about humility than Keryn Sylvius ever could. I don't keep anything valuable here, because the Wizard's Sanctum keeps it for me, and I'd advise you to let it." } },
      choices = {
        { text = "I'll leave your books alone, Wefhellt. Theft isn't my aim.", next = "BACK", reply = "I'm glad to hear it, and the window's glad too. It's only just been repaired.", fx = { align = { honor = 1 } } },
        { text = "If they're valuable, they'll walk eventually.", next = "BACK", reply = "Then they'll walk to the Sanctum, which is where I keep the valuable ones. Good luck with that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I think they're dabbling in things the Kirin Tor locked away for very good reasons, and I think Farley's foolish to let them stay. But the Sanctum didn't send me here to judge, only to teach, so I keep my opinions to the stairs." } },
      choices = {
        { text = "The Kirin Tor were wise to lock such things away.", next = "BACK", reply = "They were, and I'd not have said so before I met the cellar. Thank you for agreeing with me.", fx = { align = { light = 1 } } },
        { text = "The Kirin Tor locked it away out of fear, not wisdom.", next = "BACK", reply = "Fear and wisdom are often the same thing, my friend. Ask Dalaran what happens when you open the wrong door.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Someone to stand in front while I'm casting, mostly, and someone to tell me when I'm becoming too clever for my own good. Every mage in the Sanctum knows a story about one of us who went too far, and none of them had a paladin nearby to say so." } },
      choices = {
        { text = "I'll tell you when you've gone too far. That's my duty.", next = "BACK", reply = "Thank you, and I'll try to listen when you do. It's harder than it sounds for a mage.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your power is your own business, Zaldimar.", next = "BACK", reply = "Perhaps it is, until it isn't, and then everyone wishes somebody had spoken up. I'll keep you in mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, upstairs at the Lion's Pride! Khelden Bremen at the Abbey would say your sort and mine have nothing to say to each other, and he'd be wrong, as usual." },
        { id = "h_default", text = "I'm Zaldimar Wefhellt, of the Wizard's Sanctum, currently of the upstairs room at the Lion's Pride. The view is of a stable, but one makes do." },
        { id = "h_jennea", tags = { "news" }, when = { questActive = TODO_QUEST("Speak with Jennea") },
          text = "Jennea Cannon at the Wizard's Sanctum in Stormwind wants a word with you. She's sharper than I am, but don't tell her I said so, or she'll have it engraved." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Jennea") },
          text = "Jennea again, twice in one apprenticeship? She must like you, and I'd be worried." },
        { id = "h_stable", when = { metBefore = true }, text = "The stable boy has taken to whistling beneath my window every morning, in a key I'm fairly certain doesn't exist." },
        { id = "h_khelden", when = { class = "MAGE", maxLevel = 12 },
          text = "Khelden Bremen sent you down from the Abbey, and he'll have drilled you on the four rules until you dreamed them. Good; we can skip to the interesting part." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Priestess Josetta's down the hall, friend, though if you've a moment, I'd love to know how the Light feels from the inside, purely academically." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, at my door. You'll be Keryn Sylvius's student, and you'll find nothing worth stealing up here but books and a view of a stable." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "One of Remen Marcot's, up from the cellar. You've climbed further than most of your kind bother to, and I'd ask what for." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in my room above the stable. I'd ask you to sit, but the chair is for show and the bed is for me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your companion is staring at my candle, so please keep it from knocking it over; I've only the one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! Do sit down, because I've a dozen questions about how the change works, and I've never had anyone to ask who wouldn't bite." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! How fascinating; my view is a stable, but you are far more interesting. What do your spirits say about the arcane?" },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, before the singing starts downstairs." },
        { id = "h_again2", text = "Do go on. It's rare anyone up here asks me anything but the way out." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "Strange place to teach, above an inn.", next = "inn" },
        { text = "What does Jennea want with me?", next = "jennea", when = { class = "MAGE", minLevel = 10, any = { { questActive = TODO_QUEST("Speak with Jennea") }, { questActive = TODO_QUEST("Report to Jennea") } } } },
        { text = "What's the worst a mage can become?", next = "worst" },
        { text = "How does the Light feel? Warm, mostly.", next = "light", when = { class = "PRIEST" } },
        { text = "What should I be practising?", next = "practise", when = { class = "MAGE" } },
        { text = "Gnomes make better mages than humans, you know.", next = "gnome", when = { race = "Gnome", class = "MAGE" } },
        { text = "Would you like to see a High Order form?", next = "skyborne", when = { race = "Skyborne", class = "MAGE" } },
        { text = "What lies beneath this inn, Wefhellt?", next = "cellar" },
        { text = "I'd guess a rogue or two has tried for your books, Wefhellt.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do you think of the folk who meet below your room?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do you make of warriors, Wefhellt?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd wager you've studied a hunter's bond with its beast.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would a mage want with a paladin, Zaldimar?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What would you want to know about shapeshifting?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "You seem to find shamanism interesting, Zaldimar.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    inn = {
      lines = {
        { id = "i_default", text = "It suits me, because Goldshire's recruits come up these stairs, and the Sanctum's are steeper. Someone has to catch the young ones before they set Elwynn on fire." },
      },
      choices = {
        { text = "And the singing?", next = "inn_singing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn_singing = {
      lines = { { id = "is_default", text = "I've tried silencing spells, but Farley considers it rude, and Farley is correct. I've learned to read through it instead." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    jennea = {
      lines = {
        { id = "j_default", text = "Something to do with the safety of Stormwind and Elwynn both. She'll tell you in her own time, which is longer than yours." },
        { id = "j_report", when = { questActive = TODO_QUEST("Report to Jennea") },
          text = "It's your first look at what we don't talk about downstairs. There is a quiet war, and the Sanctum fights it; go and see, and then you'll understand Jennea." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    worst = {
      big = true,
      lines = {
        { id = "w_default", text = "Morganth, once a student of Stormwind's mages, who was banished for dark magic and now commands Redridge's gnolls from a tower of his own.",
          fx = { learn = { "morganth" } } },
      },
      choices = {
        { text = "What went wrong with him?", next = "worst_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst_why = {
      lines = { { id = "ww_default", text = "Nothing anyone noticed in time, and that keeps teachers awake, Theocritus at the Tower of Azora most of all. I'm watching you now, a little." } },
      choices = {
        { text = "Watch away.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "That's unsettling.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    light = {
      lines = { { id = "l_default", text = "Warm, mostly. You see, that's exactly the sort of answer the Cathedral gives, but I'll put it in my notes anyway, and thank you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    practise = {
      lines = { { id = "practise_l", text = "Arcane Intellect on everyone you travel with, whether they ask or not, and conjuring water before you're thirsty. A mage's first duty is to be useful, and the glamorous duties come a distant second." } },
      choices = {
        { text = "I'd rather practise the glamorous ones.", next = "practise_glam" },
        { text = "Useful first. I understand.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    practise_glam = {
      lines = { { id = "practise_glam_l", text = "Everyone would, and the ones who do end up like Morganth, alone in a tower with gnolls for company. Conjure the water, and be loved." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "morganth" } } } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "Better engineers of spells, certainly, and worse at stopping to wonder whether they should. I've had gnome students rebuild a Polymorph and turn me into a very confused sheep." } },
      choices = {
        { text = "That was an improvement, surely.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Wondering whether is a human luxury.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    skyborne = {
      lines = { { id = "skyborne_l", text = "Would I! Here, on this rug, and mind the inkwell. Fascinating; it's older than anything the Sanctum teaches, and it's beautiful, and I'll be insufferable to Jennea about it for a month." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    cellar = {
      big = true,
      lines = { { id = "cellar_l", text = "A cellar full of warlocks, under the same floorboards as I am, which I try not to dwell upon. Mages and warlocks start from the same books, you know; the difference is which chapter they couldn't resist." } },
      choices = {
        { text = "Then the books should be locked away.", next = "BACK", reply = "They are, in the Sanctum, and the cellar found its own copies anyway. Books have a way of escaping, I'm afraid.", fx = { align = { order = 1 } } },
        { text = "Every chapter should be read. That's scholarship.", next = "BACK", reply = "Read, yes, but not every chapter should be practiced. That's the difference between a scholar and a warlock.", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Which chapter tempts you?", next = "cellar_you" },
      },
    },
    cellar_you = {
      lines = { { id = "cellar_you_l", text = "None, I'm proud to say, though you might ask me again after the singing starts downstairs." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm of the Wizard's Sanctum, seconded to Goldshire, and I volunteered, though nobody believes that." } },
    advice = { { id = "tp_ad", text = "Learn to stop a spell halfway. Starting them is easy, but stopping them is what keeps your eyebrows." } },
    morganth = { { id = "tp_morganth", text = "The Redridge business: a student who went wrong, which is every teacher's nightmare. Theocritus takes it personally, and he's right to." } },
    lions_pride = { { id = "tp_inn", text = "Comfortable, if you don't mind the singing, and I mind the singing." } },
    _none = { { id = "tp_none", text = "Outside my field. My field is large, but that's outside it." } },
    dalaran = { { id = "tp_dalaran", text = "The Sanctum in Stormwind always looked to Dalaran, and now Dalaran barely looks back. They're rebuilding, and they're careful who they let through the gates, which is wise and very frustrating." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "Every mage in the Sanctum learned from Kirin Tor books, and half of us still hope for a letter from them. I've stopped checking the post." } },
    scourge = { { id = "tp_scourge", text = "The plague began with a Kirin Tor mage named Kel'Thuzad who went looking for power and found it. Every teacher I know thinks of him when a student asks a question a little too eagerly.", fx = { learn = { "kelthuzad" } } } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's conjurers do a trick with a dove and a hat that I've never been able to work out, and it's driving me quietly mad. I'm fairly sure it isn't magic at all." } },
  },
}

-- Keryn Sylvius: SI:7's eye in Goldshire, in the reading room.
P:NPC {
  key = "keryn", id = TODO_NPC("Keryn Sylvius"), name = "Keryn Sylvius", title = "Rogue Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "cunning", "witty" },
  notices = { "stealth" },
  impression = {
    first = "I'm fairly sure her book isn't the only thing she's watching.",
    third = "{name} met Keryn Sylvius, who trains Goldshire's quiet ones from behind a book she admits is dreadful.",
  },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Well, well, look who crawled up the stairs." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "Wrong room, friend; the door's behind you." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "You're sneaking, in a reading room, where everyone's quiet already. Think about that." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "That's my business, but I'll tell you this much: I've been watching you over the top of it since you came in." } },
      choices = {
        { text = "Watchfulness is wisdom, Keryn. I respect it.", next = "BACK", reply = "Good, then we understand each other. Keep watching, because it keeps you alive.", fx = { align = { honor = 1 } } },
        { text = "Your watching doesn't worry me.", next = "BACK", reply = "It should, a little, but I'll not insist. Most people learn to worry the hard way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A bestiary from the Sanctum, which is mostly wrong, so I read it for the mistakes. It says your kind sleep in the branches and eat bark, and I've half a mind to correct it in the margin." } },
      choices = {
        { text = "Correct it. Lies about my people shouldn't stand.", next = "BACK", reply = "Then I'll correct it, and I'll credit you in the margin. Somebody should.", fx = { align = { honor = 1 } } },
        { text = "Leave it wrong. Folk who misjudge us are easier to fool.", next = "BACK", reply = "Clever, and I'll leave it wrong for you. You'd make a decent student.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because noise is information, and you've told me your weight, your armor and your mood before you opened the door. The Defias will know all of that too, so think about what you're telling them." } },
      choices = {
        { text = "I'll learn to move quieter, then.", next = "BACK", reply = "Good, and I'll show you how to lose the jingle. It'll take longer than you'd like.", fx = { align = { order = 1 } } },
        { text = "Let them hear me coming. It'll frighten them.", next = "BACK", reply = "It'll frighten them into running, and then you'll have nothing but footprints. Think about it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some can, the cats especially, and the wolves if you're patient. A noisy beast is a bell around your neck, and the Defias in Elwynn have learned to listen for bells." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some can, the cats especially, and the wolves if you're patient, because a noisy beast is a bell around your neck. Your {pet} is watching me as if I were a mouse, which is very good, or very rude." },
      },
      choices = {
        { text = "I'll train it to hunt in silence.", next = "BACK", reply = "Good, and it'll learn faster than you think. Cats especially.", fx = { align = { order = 1 } } },
        { text = "Let it make noise. It's a distraction for me.", next = "BACK", reply = "A distraction can work, if you've planned it. Most hunters haven't, and the Defias know it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "He thinks I'm a thief with a bookshelf, and I think he's a scholar with a temper, and we're both right. We share a roof and a bad stew, and in this kingdom mages and rogues rarely manage that much." } },
      choices = {
        { text = "A shared roof deserves respect. I'll mind your corner.", next = "BACK", reply = "Kind of you, and he'll pretend not to notice. Mind the stew, it's worse than it sounds.", fx = { align = { honor = 1 } } },
        { text = "Respect's earned, Sylvius. Neither of you has earned mine.", next = "BACK", reply = "That's fair, and honest, and I'll respect you for it. You'll find I earn things slowly.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because the stairs go down to the cellar, and Farley prefers that nobody uses them at all. Your trade and mine both depend on Farley not asking questions, so let's not give him a reason." } },
      choices = {
        { text = "Farley's rules are fair. I'll keep your students' secret.", next = "BACK", reply = "Good, and Farley will never know he had reason to thank you. Keep it that way.", fx = { align = { order = 1 } } },
        { text = "Farley's rules mean nothing to me. I'll do as I please.", next = "BACK", reply = "Then you'll do it without me, and you'll find Farley has longer arms than you'd think. Mind yourself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "You're very kind and very persistent, and no, there isn't, though I'll admit chapter nine has a death in it I wasn't ready for. If you must pray for someone, pray for the author, because his prose needs it more than my soul does." } },
      choices = {
        { text = "I'll pray for you both, whether you like it or not.", next = "BACK", reply = "You're a stubborn sort, and I'll not stop you. Mind the author's prose, though; it's in a worse state than mine.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fine. Your soul's your own business, Sylvius.", next = "BACK", reply = "Thank you, and I'll get back to chapter nine. The death was very well done.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "One or two, over the years, and I knew which ones before they did. I'd give you their names if it would help, but it won't, because by now they've new names and no reason to answer to the old ones." } },
      choices = {
        { text = "A teacher answers for what she teaches, Sylvius.", next = "BACK", reply = "Maybe so, and I've thought on it more than you'd guess. But I'll not lose sleep over men who chose their own roads.", fx = { align = { honor = 1 } } },
        { text = "Every road is chosen. You can't answer for theirs.", next = "BACK", reply = "That's what I tell myself, and most nights I believe it. Kind of you to say so.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in a reading room. If you've come to arrest someone, I'm sorry to disappoint you, because I'm only reading." },
        { id = "h_default", text = "I'm Keryn Sylvius. I train the quiet ones in Goldshire and read a lot of books I don't need, and both are cover, and neither is your business." },
        { id = "h_si7", tags = { "news" }, when = { questActive = TODO_QUEST("Seek out SI: 7") },
          text = "SI:7 is in Old Town, in the city, and don't ask anyone for directions. If you can't find SI:7 without help, SI:7 doesn't need you." },
        { id = "h_si7_done", when = { questDone = TODO_QUEST("Seek out SI: 7") },
          text = "So Master Shaw's seen you. Did he smile? He doesn't, as a rule, so if he did, start worrying." },
        { id = "h_book", when = { metBefore = true }, text = "I'm on chapter nine, and it's dreadful, but I'll finish it anyway. Everyone needs a vice that isn't the job." },
        { id = "h_fish", when = { class = "ROGUE", maxLevel = 12 },
          text = "A fresh fish from Jorik Kerridan's stable. He sends me the ones who can at least find the stairs. Let's see if you can find anything else." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "Josetta's room is down the hall. This one's for reading, and I'm reading. I've nothing to confess, so don't wait for it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, in my corner of the inn. You've wandered too far from Zaldimar's room, I think, and too close to mine." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "One of Remen Marcot's, up from the cellar. You'll have heard my students practising on the stairs, I suspect, and I'd thank you not to tell Farley." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in my rooms. You walked up those stairs like a cart on cobbles, and that's not a compliment." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You move well enough, but your beast doesn't, and I heard it on the second step." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you're standing in my light. I'm Sylvius, and no, I don't want to hear about the moon." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and you've interrupted my reading. Your spirits would do well to be quieter." },
      },
      again = {
        { id = "h_again", text = "Still here? Then make it worth the page I've lost." },
        { id = "h_again2", text = "Something else? Keep it quiet, if you would." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Who runs things for rogues in Stormwind?", next = "master", when = { class = "ROGUE" } },
        { text = "That book has you very absorbed.", next = "book" },
        { text = "The Defias tried to recruit me.", next = "defias", when = { class = "ROGUE", topicKnown = "defias" } },
        { text = "This room seems open to anyone.", next = "room", when = { ["not"] = { class = "ROGUE" } } },
        { text = "What should I be practising?", next = "practise", when = { class = "ROGUE" } },
        { text = "I go back into Gnomeregan for parts nobody else will fetch.", next = "gnome", when = { origin = "gnome_scavenger" } },
        { text = "A kaldorei sees things a human misses.", next = "kaldorei", when = { race = "NightElf", class = "ROGUE" } },
        { text = "What do you think of the other trainers here?", next = "trainers" },
        { text = "You and Zaldimar don't seem to get on.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why would Farley mind your students on the stairs?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why does a rogue care how loud a warrior walks?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "My beast could surely be taught to move quietly.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is there anything you'd like to talk about, Sylvius?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Some of your students must end up with the Defias, Sylvius.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you read anything about the wild, or only city matters?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What are you reading, Keryn?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Wrong room. Sorry.", next = "END" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "Mathias Shaw, who runs SI:7. You'll meet him, or he'll meet you, which is different, and worse." } },
      choices = {
        { text = "What's he like?", next = "master_like" },
        { text = "...", next = "BACK" },
      },
    },
    master_like = {
      lines = { { id = "ml_default", text = "Loyal to the crown and tired of everyone else. He'll mistake you for the cheese delivery, and you should let him; it's a test, and most fail it by arguing." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    book = {
      lines = { { id = "b_default", text = "A romance: two feuding families, two lovers and far too many balconies. It's terrible, and I can't stop, so don't you dare tell Farley." } },
      choices = {
        { text = "Odd to keep reading something so terrible.", next = "book_why" },
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    book_why = {
      lines = { { id = "bw_default", text = "A woman with a book can sit in a reading room all day and watch the stairs, but a woman without one is loitering. Turn the page now and then." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    defias = {
      big = true,
      lines = {
        { id = "d_default", text = "Of course they did. Tell me who and where, then forget you told me, and keep saying no politely, because polite noes live longer.",
          fx = { learn = { "defias" } } },
      },
      choices = {
        { text = "A man by the vineyards. I said no.", next = "BACK", reply = "Good, and you'll forget it now, as I said. Polite noes keep you breathing.", fx = { align = { order = 2 }, affinity = 2 } },
        { text = "A man by the vineyards, and I'm still thinking about his offer.", next = "BACK", reply = "Then think quickly, because a man who's still thinking is a man they'll come back for. I'll be listening.", fx = { align = { order = -2 } } },
        { text = "What if I said yes, and told you everything?", next = "defias_double" },
      },
    },
    defias_double = {
      lines = { { id = "dd_default", text = "Then you'd be doing SI:7's work without SI:7's protection, and you'd last a month. Ask the Master about that, not me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    room = {
      lines = { { id = "r_default", text = "To anyone who reads quietly. You're failing the second part already. Try the common room; it's louder, and so are you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    practise = {
      lines = {
        { id = "practise_l", text = "Reading a room before you enter it, from the sounds through the door. I can tell you how many people are in the common room right now, which of them are drunk and which one's pretending; can you?" },
        { id = "practise_old", when = { minLevel = 20 },
          text = "Poisons, and patience with them. A blade that kills slowly is a blade that lets you leave before anyone knows there's been a killing, and leaving is the craft." },
      },
      choices = {
        { text = "Seven. Three drunk. The one by the fire is pretending.", next = "practise_count" },
        { text = "Teach me.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    practise_count = {
      lines = { { id = "practise_count_l", text = "Eight; you missed the girl under the stairs. But the one by the fire, yes, he's SI:7, and if you tell him I said so I'll deny I've ever met you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "Do you, now? Then you've done more burglary than any of my students, in worse conditions and under worse guards, and you call it salvage. I'd say the Master would like to meet you, but he'd rather you didn't know he'd heard of you." } },
      choices = {
        { text = "It is salvage. Gnomeregan is ours.", next = "BACK", reply = "It is, and I'll not argue with a gnome about Gnomeregan. Mind the guards, salvage or not.", fx = { align = { honor = 1 } } },
        { text = "Call it whatever pays.", next = "BACK", reply = "Now that's the answer of somebody I'd like to keep an eye on. Mind your step in my reading room.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    kaldorei = {
      lines = { { id = "kaldorei_l", text = "And misses things a human sees, like when a farmer's lying about his harvest. Your people are hard to fool in the forest and easy to fool in a tavern, and I'd fix that before Goldshire does it for you." } },
      choices = { { text = "Then I'll count my coin twice in the tavern.", next = "BACK", fx = { affinity = 1 } } },
    },
    trainers = {
      lines = { { id = "trainers_l", text = "Josetta's kind, Wefhellt's vain and Du Lac thinks I'm a coward because I won't fight her in the yard. I won't fight her because she'd win, which isn't cowardice, it's arithmetic." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sit in a reading room and train rogues. If you want more than that, buy a better book than mine." } },
    advice = { { id = "tp_ad", text = "Carry something to read. Nobody suspects a reader, but everyone suspects someone standing in a corner doing nothing." } },
    defias = { { id = "tp_defias", text = "SI:7 has files and I have opinions, and neither leaves this room." } },
    _none = { { id = "tp_none", text = "Even if I knew, I wouldn't say, and especially if I knew." } },
    si7 = { { id = "tp_si7", text = "SI:7 keeps files on everyone in this room, including me, and I'd guess they have one on you by now. Don't take it personally; take it as a compliment." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "Ravenholdt? I've read about it, in books that don't exist. If you ever find the place, you'll understand why I'm not saying more." } },
    the_stockade = { { id = "tp_the_stockade", text = "The Stockade holds the thieves who got caught, which makes it an excellent library of mistakes. Visit it in your mind before you ever visit it in person." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor had the court eating from her hand within a season, and anyone who manages that so quickly is worth watching. I'm only a woman in a reading room, of course." } },
  },
}

-- Remen Marcot: the Lion's Pride cellar, with Crowe and Darkheart.
P:NPC {
  key = "remen", id = TODO_NPC("Remen Marcot"), name = "Remen Marcot", title = "Warlock Trainer",
  bible = "bibles/trainers.md", role = "trainer", tier = "service",
  communities = { "goldshire" }, temper = { "steady" }, values = { "cunning", "ambitious" },
  notices = { "pet" },
  impression = {
    first = "He makes introductions as carefully as other men handle knives.",
    third = "{name} met Remen Marcot, who welcomes warlocks to the hidden cellar beneath the Lion's Pride.",
  },

  greetings = {
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Down the stairs and out of the light, and you found us. Good." },
    { id = "g_other", when = { ["not"] = { class = "WARLOCK" } }, text = "The wine cellar's the other door, friend; this one's private." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Still on the imp? It's a start, but it's not a finish, and there's something heavier waiting for you when you're ready to carry it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It's dangerous enough to cost a man his eyebrows and worse, so I make introductions carefully, and I'm not sure a shaman needs one." } },
      choices = {
        { text = "Then I'll leave your secrets alone, Remen.", next = "BACK", reply = "Thank you. It isn't that I don't trust you; I don't trust anything down here, myself included.", fx = { align = { order = 1 } } },
        { text = "Dangerous knowledge is worth having. Introduce me.", next = "BACK", reply = "Ask Maximillian Crowe, then, not me. I've only got the one set of eyebrows left.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A page or two on the satyrs, which I'll not show you, because I suspect you'd burn it and I suspect you'd be right to. Some knowledge bites, as I told you, and that page has teeth." } },
      choices = {
        { text = "Burn it, Marcot. Some knowledge only feeds corruption.", next = "BACK", reply = "I've thought about it, believe me. Crowe would have me scrubbing the circle for a month if I did.", fx = { align = { honor = 1 } } },
        { text = "Keep it. Knowing the enemy is worth the risk.", next = "BACK", reply = "That's what Crowe says, and he's usually right, so it stays locked away a while longer.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Keeping things in, mostly, and sometimes keeping things out. A warrior who stepped across it once had a very bad evening, so I'll ask you to admire it from the edge." } },
      choices = {
        { text = "I'll stay at the edge, then.", next = "BACK", reply = "Thank you. You'd be surprised how few people take the hint.", fx = { align = { light = 1 } } },
        { text = "I'll step where I please, Marcot.", next = "BACK", reply = "Your evening, then. I'll fetch a bucket and the priestess, in that order.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Beasts sense everything we'd rather they didn't. Your companion smells the void and the fel, and it wants to leave, which is wisdom I'd advise you to follow if you're not a student." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Beasts sense everything we'd rather they didn't, and yours smells the void and the fel. Your {pet} is growling at the circle, which is the right response, and I wish more of my students had it." },
      },
      choices = {
        { text = "If my beast wants to leave, I'll listen.", next = "BACK", reply = "Good. Animals know this cellar better than people do, and not one of them likes it.", fx = { align = { light = 1 } } },
        { text = "My beast can wait. I'm curious.", next = "BACK", reply = "Curious is how most of us ended up down here, so don't say I didn't warn you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because there are things down here that don't like surprises, and if you surprise one of them, I won't be able to call it back in time. Keryn Sylvius's students keep finding that out, and I'm tired of mopping up after them." } },
      choices = {
        { text = "Then I'll knock next time, Marcot. Your rules, your cellar.", next = "BACK", reply = "Much obliged. Two knocks, a pause, then one more, and I'll know it's you.", fx = { align = { order = 1 } } },
        { text = "I'll come and go as I please. Surprises are my trade.", next = "BACK", reply = "Then I hope your trade is quicker than a voidwalker. Most aren't.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It's how I began, with a book I shouldn't have opened in a library I shouldn't have been in, and Zaldimar would tell you the same story ends badly. I think it ends however you choose to end it." } },
      choices = {
        { text = "Some books are best left closed, Marcot.", next = "BACK", reply = "Wise words, and I'd have listened to them once. It's a bit late for me now.", fx = { align = { light = 1 } } },
        { text = "Every closed book is a door waiting to be opened.", next = "BACK", reply = "And every one of them has something waiting behind it. I should know.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Remen Marcot. Farley thinks this is a storeroom, and it is; we store knowledge, mostly, and some of it bites." },
        { id = "h_gakin", tags = { "news" }, when = { questActive = TODO_QUEST("Gakin's Summons") },
          text = "Gakin the Darkbinder wants you at the Slaughtered Lamb in Stormwind, which means he thinks you're ready for a voidwalker. He's usually right, usually." },
        { id = "h_drusilla", when = { class = "WARLOCK", maxLevel = 12 },
          text = "Drusilla La Salle sent you down from Northshire? She sends the patient ones, so don't disappoint her; she has a long memory and a short temper." },
        { id = "h_farley", when = { metBefore = true }, text = "Farley came down for a barrel yesterday and looked straight at us, and then he took the barrel and left. I've grown fond of him." },
        { id = "h_looking", when = { class = "WARLOCK", minLevel = 10 },
          text = "There you are. I spend half my days hunting for La Salle's students, and they walk down my stairs the moment I stop looking." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest in the cellar. You'll want to go back up the stairs, friend. Nothing down here needs blessing, and some of it would object." },
        { id = "h_lamb", when = { origin = "human_lamb_cellar", class = "WARLOCK" },
          text = "Gakin the Darkbinder wrote that one of his cellar's own was coming down my stairs. You'll find ours drier and Farley friendlier, so mind you don't get too comfortable." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in the cellar. You came down those stairs without a sound, which is admirable, though I'd rather you knocked." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, down here in the dark. Zaldimar must be desperate for news, or else you're curious, and curiosity is how most of us began." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in the cellar. Mind your head on the beams, and mind your sword near the circle on the floor." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your beast has its hackles up; it knows exactly what we keep down here, and it's not impressed." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in Farley's cellar. If you're looking for roots, I'm afraid ours are mostly the figurative kind." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Farley never asks questions, and I like that, so I'd ask you not to either." },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep it low, because the floor's thin and Farley's ears aren't." },
        { id = "h_again2", text = "Go on. The candles have an hour left in them." },
      },
      choices = {
        { text = "Train me, Marcot. I'm hungry for the next lesson.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I doubt Farley knows what you do down here.", next = "farley" },
        { text = "There seem to be two others down here with you.", next = "others" },
        { text = "Tell me what a voidwalker is like to command.", next = "void", when = { class = "WARLOCK", minLevel = 8 } },
        { text = "I could tell the brothers what goes on here.", next = "threat", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "What should I practise until it stops hurting?", next = "practise", when = { class = "WARLOCK" } },
        { text = "Gnomeregan had warlocks long before Goldshire did.", next = "gnome", when = { race = "Gnome", class = "WARLOCK" } },
        { text = "Why would a warlock want a rogue to knock?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'd guess curiosity is how most warlocks begin.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "That circle must be for keeping something in, Marcot.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does my beast sense what you keep in the cellar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you keep any knowledge here about the old forests?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you keep dangerous knowledge here, Remen?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go.", next = "END" },
      },
    },
    farley = {
      lines = { { id = "f_default", text = "Farley knows we pay on time and don't break the furniture. That's all an innkeeper wants to know." } },
      choices = { { text = "Ha.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    others = {
      lines = {
        { id = "o_default", text = "Maximillian Crowe teaches the craft, Cylina Darkheart sells what the craft needs, and I fetch, carry and keep the door, because every coven needs someone who climbs stairs." },
      },
      choices = {
        { text = "A coven? Answering to whom?", next = "others_lamb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_lamb = {
      lines = {
        { id = "ol_default", text = "The Slaughtered Lamb, in the city. Gakin the Darkbinder keeps its cellar the way we keep this one, quietly, and you'll keep the name quiet too." },
      },
      choices = {
        { text = "My lips are sealed.", next = "BACK", reply = "Thank you. The coven has few friends, and it remembers each of them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tell whoever I like.", next = "BACK", reply = "Then you'll find the stairs much harder to come down next time. That isn't a threat; it's just how the coven is.", fx = { align = { honor = -1 } } },
        { text = "And if I don't keep it quiet?", next = "BACK", fx = { affinity = -2, trait = { stern = 1 } } },
      },
    },
    void = {
      lines = { { id = "v_default", text = "Patient, obedient and very quiet, which is everything you aren't yet. It'll take a hit for you without complaint, but don't mistake that for loyalty." } },
      choices = {
        { text = "Then what is it, if not loyal?", next = "void_what" },
        { text = "Something else.", next = "BACK" },
      },
    },
    void_what = {
      lines = { { id = "vw_default", text = "Bound, and bound is all it is. The day you forget that is the day it remembers, so let Gakin make you earn the binding." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    threat = {
      lines = { { id = "t_default", text = "You could. They'd pray, Farley would sell them a drink, and we'd still be here on Tuesday, so have one yourself, upstairs." } },
      choices = {
        { text = "I'll be watching.", next = "BACK", reply = "Watch from upstairs, then. The ale's better, and nobody down here will mind.", fx = { align = { light = 1, order = 1 }, affinity = -1 } },
        { text = "Suits me. Pour me one too.", next = "BACK", reply = "Ask Farley for the dark ale, and tell him Remen sent you. He'll know what you mean.", fx = { align = { light = -1 } } },
      },
    },
    practise = {
      lines = { { id = "practise_l", text = "Corruption and Life Tap, until you can spend your own blood without wincing, and Fear, until you can use it without enjoying it. The first keeps you casting and the second keeps you sane." } },
      choices = {
        { text = "I won't promise not to enjoy it, Marcot.", next = "BACK", reply = "Nobody can, at first. That's what worries Crowe about every one of us.", fx = { align = { light = -1 } } },
        { text = "I'll practise without enjoying it.", next = "BACK", reply = "Good. The ones who enjoy it don't stay in this cellar long, one way or another.", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "It did, and Gakin says the best of them came south after the city fell, and the worst stayed and went mad in the dark. Which are you, I wonder, and do you know yet?" } },
      choices = {
        { text = "The best, obviously. The mad ones didn't last.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "I'm still finding out.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm the one who runs messages for the coven, and teaches when Crowe's busy. It's honest work, by cellar standards." } },
    advice = { { id = "tp_ad", text = "If someone's looking for you all day, stand still. They'll find you the moment they stop. It's a law of nature." } },
    lions_pride = { { id = "tp_inn", text = "Best cellar in Elwynn: dry, quiet, and nobody asks questions." } },
    _none = { { id = "tp_none", text = "Ask upstairs; they like questions upstairs." } },
    burning_legion = { { id = "tp_burning_legion", text = "Crowe says the Legion waits at the end of every shortcut, and I've never once seen him take one. I run messages the long way round now, just in case." } },
    scourge = { { id = "tp_scourge", text = "The Scourge makes a warlock look respectable, which is no small thing. I'd thank them for it, if they weren't trying to kill everyone." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "During Faire week the coven doesn't meet, because nobody can hear Crowe over the music. It's the best week of the year, if you ask me, but don't tell him." } },
  },
}
