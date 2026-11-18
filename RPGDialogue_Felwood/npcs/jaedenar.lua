-- Jaedenar, Shadow Hold: Lord Banehollow, master of the Shadow Council in Felwood, who sells to those wearing the Council's shadow. Voice: bibles/banehollow.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "banehollow", id = TODO_NPC("Lord Banehollow"), name = "Lord Banehollow",
  bible = "bibles/banehollow.md", role = "questgiver", tier = "quest",
  communities = { "jaedenar" }, temper = { "cold", "courteous" }, values = { "ambitious", "proud" },
  notices = { "class", "race" },

  impression = {
    first = "Lord Banehollow rules the Shadow Council in Jaedenar with perfect manners and no warmth at all. He seemed to see straight through the Council's shadow and decided it was more amusing to trade than to kill.",
    third = "{name} spoke with Lord Banehollow, master of the Shadow Council in Jaedenar, and left Shadow Hold alive.",
  },

  greetings = {
    { id = "g_default", text = "A visitor in the Council's colours. How refreshing, and how very unlikely. Speak, before my servants grow curious." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Ah, one of the little warlocks who learned our art without our leave. Come closer, warlock; you smell of Xoroth already, or you wish you did." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Lord Banehollow") }, text = "Gorzeeki's errand-runner, I presume. That goblin sends me the most polite murderers in Azeroth." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and still wearing our shadow. Either you are very brave or you have learned nothing, and both amuse me." },
    { id = "g_arko", when = { questDone = TODO_QUEST("Rescue From Jaedenar") }, text = "You are the one who emptied a cage in my hold. Rakaiah, my succubus, was furious, and I confess I laughed. Sit down." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, in Shadow Hold, wearing my Council's shadow like a borrowed cloak. The Light must be very short of dignity these days." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A Kaldorei walking freely through Jaedenar. Your forebears built this place, you know, before it was improved." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Banehollow, lord of Jaedenar and master of the Council's work in this forest. The potion you drank lets my servants see one of their own, but I see what is underneath, and I have decided, for the moment, that I prefer your coin to your corpse." },
        { id = "h_quest", when = { questActive = TODO_QUEST("Lord Banehollow") }, text = "You have come for Xorothian stardust, then, for some dreadsteed ritual that your goblin friend is too frightened to perform himself. It is costly, and it should be, because it is ground from the sky of a world you will never see." },
      },
      again = {
        { id = "h_again", text = "Something else, while my patience lasts?" },
        { id = "h_again2", text = "Ask. I have all the time this forest has left, and it has outlived kings." },
      },
      choices = {
        { text = "What is Xorothian stardust?", next = "stardust" },
        { text = "Who are the Shadow Council?", next = "council" },
        { text = "Why make your home in Felwood?", next = "jaedenar" },
        { text = "You saw through the disguise. Why not kill me?", next = "disguise" },
        { text = "You held a Sentinel prisoner here.", next = "arko", when = { questDone = TODO_QUEST("Rescue From Jaedenar") } },
        { text = "I want a dreadsteed. What does it cost?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "This was a Kaldorei place once.", next = "xnelf", when = { race = "NightElf" } },
        { text = "The Light will burn this hold out one day.", next = "xlight", when = { class = "PALADIN" } },
        { text = "Show me the stardust.", next = "BUSINESS" },
        { text = "I'll take my leave.", next = "END" },
      },
    },
    stardust = {
      lines = {
        { id = "s_default", text = "Dust from Xoroth, a world of the Legion's, where the sky burns and the beasts run on hooves of fire. A pinch of it remembers that sky, and the right ritual teaches a summoned steed to remember it too." },
      },
      choices = {
        { text = "How does it reach Felwood?", next = "stardust_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stardust_how = {
      lines = {
        { id = "sh_default", text = "Through the same doors that brought the demons who poisoned this forest, and that is all you will hear from me on it. A merchant who names his suppliers soon has no suppliers, and I have no wish to go back to selling candles." },
      },
      choices = {
        { text = "You sold candles?", next = "stardust_candles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stardust_candles = {
      big = true,
      lines = {
        { id = "sc_default", text = "A jest, little one, though the Council began humbly enough, whispering in tents beside the orcs' warlocks. Everything great begins as something small that nobody thought to stamp on, and that is the only lesson worth carrying out of this hold." },
      },
      choices = {
        { text = "Then someone should have stamped on you long ago.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Ambition's no crime. Small things should aim high.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    council = {
      lines = {
        { id = "c_default", text = "We are what remains of Gul'dan's circle, and of those who served the masters after him. The orcs cast us out when they found their honour again, the Alliance hunted us, and so we came here, where the forest was already ruined and no one would mind a little more." },
        { id = "c_orc", when = { race = "Orc" }, text = "Your own people, orc, before your Warchief decided to be noble. The Council gave the Horde its fire, and the Horde thanked us by forgetting we existed." },
      },
      choices = {
        { text = "What do you want here?", next = "council_want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_want = {
      lines = {
        { id = "cw_default", text = "What every scholar wants, which is power that answers when called. The fel in this soil is a library, and the satyrs and the corrupted ancients are its untidy librarians, and we are here to read." },
      },
      choices = {
        { text = "And the people who die for your reading?", next = "council_cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_cost = {
      big = true,
      lines = {
        { id = "cc_default", text = "They die, as people do, and the druids at their little sanctuary write their names on stones. You disapprove, I see, but you came here to buy from me, so let us not pretend either of us has clean hands." },
      },
      choices = {
        { text = "My hands aren't clean, but I don't pretend it's scholarship.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power has a price. Someone always pays it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jaedenar = {
      lines = {
        { id = "j_default", text = "Because Felwood is the wound the Legion left when Archimonde fell at Hyjal, and a wound stays open if you tend it carefully. The elves and the druids are trying to close it, and the Council is paid very well to keep it open." },
      },
      choices = {
        { text = "Paid by whom?", next = "jaedenar_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jaedenar_who = {
      lines = {
        { id = "jw_default", text = "By those who are patient, and who remember that a war is not lost merely because one general fell. More than that I will not say to a stranger in a borrowed shadow, however charming." },
      },
      choices = {
        { text = "The Legion was beaten. They won't come back.", next = "BACK", fx = { learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    disguise = {
      lines = {
        { id = "d_default", text = "Because killing is cheap and customers are rare. Every soul who drinks that potion and walks into my hold is either a fool, a thief or a buyer, and I find it amusing to wait and learn which." },
        { id = "d_lock", when = { class = "WARLOCK" }, text = "Because you are a warlock, and every warlock is a customer, sooner or later. The ones who come here hating us still bargain for our stardust, and I enjoy watching them do it." },
      },
      choices = {
        { text = "And if I'm a thief?", next = "disguise_thief" },
        { text = "Something else.", next = "BACK" },
      },
    },
    disguise_thief = {
      big = true,
      lines = {
        { id = "dt_default", text = "Then you will meet Shadow Lord Fel'dan and the others on your way out, and I will sell your boots to the next fool. Now I will ask you something: why would anyone of your sort trade with me, rather than simply try to kill me?" },
      },
      choices = {
        { text = "Because I need what you sell. I'll deal with you later.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Because a bargain is a bargain, even with you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arko = {
      lines = {
        { id = "a_default", text = "The Sentinel, yes. She came to spy on our work and found Rakaiah instead, which is a lesson in itself. You broke her out, and I let you, because one rescued elf is a smaller loss than a hold full of my servants dead in the doorway." },
      },
      choices = {
        { text = "You let us go?", next = "arko_let" },
        { text = "Something else.", next = "BACK" },
      },
    },
    arko_let = {
      lines = {
        { id = "al_default", text = "I let you believe you escaped, which is not quite the same thing. She will tell the Sentinels what she saw, and they will come, and they will die in this forest, and the forest will be all the richer for it." },
      },
      choices = {
        { text = "Or they'll burn Jaedenar to the ground.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      lines = {
        { id = "xl_default", text = "More than gold, warlock, though gold first, for the stardust. Then a parchment, a ritual in the halls of the Scholomance, and a circle that every demon of Xoroth will try to break, so I hope your goblin warned you." },
      },
      choices = {
        { text = "And if I fail the ritual?", next = "xlock_fail" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock_fail = {
      big = true,
      lines = {
        { id = "xf_default", text = "Then a dreadsteed will have you instead, and I will have one fewer customer. But you will not fail, I think, because warlocks who have come this far have already decided their souls are a fair price." },
      },
      choices = {
        { text = "My soul's my own. I bargain on my terms.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Any price is fair for real power.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xn_default", text = "So it was, child of the moon, and the Council found it empty and cold and already full of your dead. We only gave it a better purpose, and if your Sentinels want it back, they know exactly where to find it." },
      },
      choices = {
        { text = "They'll come. I'll make sure of it.", next = "BACK", fx = { affinity = -1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlight = {
      lines = {
        { id = "xli_default", text = "Perhaps it will, paladin, but the Light has been promising that for a very long time, and still here we are. Buy what you came for, or go and pray somewhere I cannot hear it." },
      },
      choices = {
        { text = "I'll go, for now.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    burning_legion = { { id = "tp_leg", text = "The masters are patient, and so am I. That is all a stranger in a borrowed shadow will hear from me about the Legion." } },
    satyrs = { { id = "tp_sat", text = "Xavathras's satyrs dance in Jadefire Run and call themselves free. They are useful, and they are very stupid, and those are both reasons I let them be." } },
    cenarion_circle = { { id = "tp_circ", text = "The druids water their seedlings at the sanctuary and imagine the forest is listening. It is listening, of course, only not to them." } },
    _none = { { id = "tp_none", text = "I have no interest in that, and I suggest you lose yours before it gets you killed." } },
  },
}
