-- Witch Doctor Unbagwa: a jungle troll in the Spirit Den in Mistvale Valley, who calls up Mokk the Savage for a gorilla fang. Voice: bibles/unbagwa.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "unbagwa", id = TODO_NPC("Witch Doctor Unbagwa"), name = "Witch Doctor Unbagwa",
  bible = "bibles/unbagwa.md", role = "questgiver", tier = "quest",
  communities = { "stranglethorn" }, temper = { "excitable", "playful" }, values = { "curious", "self-preserving" },
  notices = { "class", "pet" },

  impression = {
    first = "Witch Doctor Unbagwa talks about himself by name and about gorillas with real affection, and he wanted me standing between him and the apes before he'd start calling them. I liked him, though I wouldn't stand too near his cave.",
    third = "{name} met Witch Doctor Unbagwa, a jungle troll who speaks with the gorilla spirits in Mistvale Valley.",
  },

  greetings = {
    { id = "g_default", text = "Witch Doctor Unbagwa see you coming a long way off, mon, because the spirits whisper when strangers walk in Mistvale." },
    { id = "g_back", when = { metBefore = true }, text = "You come back! You got a fang for Unbagwa this time, or you just visiting?" },
    { id = "g_away", when = { away = 14 }, text = "You been gone {away}, mon, and the gorillas been loud the whole time. They miss you, maybe, or they just hungry." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The spirits say somebody be happy with you, mon. Unbagwa happy too, so that be two." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Ah, you talk to spirits too, I can tell. Then you know they don't always say what you want, eh?" },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} smell the apes, mon, look at it. Keep it close when Unbagwa start calling, because the big ones don't like company." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Witch Doctor Unbagwa, that be me, and this be the Spirit Den, where Unbagwa talk to the spirits of the jungle. The gorilla spirits be the loudest, and the most fun." },
        { id = "h_fever", tags = { "news" }, when = { questActive = TODO_QUEST("Stranglethorn Fever") },
          text = "Unbagwa know what Mokk the Savage like, yes, yes! You bring Unbagwa a gorilla fang, and Unbagwa make him come, but you got to protect Unbagwa from the other gorilla-beasts that come first." },
        { id = "h_fever_done", tags = { "news" }, when = { questDone = TODO_QUEST("Stranglethorn Fever") },
          text = "You got Mokk's heart, and that goblin in Booty Bay be cured, I hear. Unbagwa still got all his arms, too, so it be a good day for everybody but Mokk." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A Darkspear! You come a long way from the Echo Isles, cousin, and you come to see old Unbagwa. Sit, sit, the spirits like a troll's company." },
      },
      again = {
        { id = "h_again", text = "What else, mon? The spirits be listening, and so be Unbagwa." },
        { id = "h_again2", text = "Ask Unbagwa more, he don't mind." },
      },
      choices = {
        { text = "Who is Mokk the Savage?", next = "mokk" },
        { text = "How do you call the gorillas?", next = "calling" },
        { text = "Why live out here alone?", next = "alone" },
        { text = "Do the apes ever hurt you?", next = "danger" },
        { text = "The spirits must tell you a great deal, Unbagwa.", next = "xshaman", when = { class = { "SHAMAN", "PRIEST" }, race = { "Troll", "Orc", "Tauren" } } },
        { text = "Let my beast stand guard.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I'll be back with a fang.", next = "END" },
      },
    },

    mokk = {
      lines = {
        { id = "mo_default", text = "The biggest, angriest gorilla in Mistvale, with a heart that cure the fever, so the old stories say. The goblins in Booty Bay want his heart, and Mokk want to keep it, and Unbagwa just want to watch." },
      },
      choices = {
        { text = "Does the cure really work?", next = "mokk_cure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mokk_cure = {
      lines = {
        { id = "mc_default", text = "It work for the fever, mon, Unbagwa seen it, though it taste so bad most people wish they died instead. The strong heart make the sick blood strong, that be how the spirits say it." },
      },
      choices = {
        { text = "Killing a beast for its heart seems cruel.", next = "mokk_cruel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mokk_cruel = {
      lines = {
        { id = "mr_default", text = "Maybe, but Mokk kill plenty himself, and the jungle always eat something to feed something else. Unbagwa don't judge, Unbagwa just call." },
      },
      choices = {
        { text = "The jungle's way is the right way.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "We don't have to live by the jungle's rules.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    calling = {
      lines = {
        { id = "cl_default", text = "You give Unbagwa a gorilla fang, and the fang remember the gorilla, and the spirits carry the call to every ape in the valley. They come in order, mon: first a big silverback, then Konda, then Mokk himself." },
      },
      choices = {
        { text = "So I'll have to fight all of them.", next = "calling_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    calling_fight = {
      lines = {
        { id = "cf_default", text = "You fight them, or they fight Unbagwa, and Unbagwa not good at fighting gorillas. If they get past you, they knock Unbagwa down, and you got to wait for Unbagwa to get back up before trying again." },
      },
      choices = {
        { text = "I'll keep them off you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    alone = {
      lines = {
        { id = "al_default", text = "Because the spirits be loud here, and the people be quiet, and that be the best way round. The Skullsplitters and the Bloodscalps don't come in the valley, because the apes don't like them neither." },
      },
      choices = {
        { text = "The other tribes don't bother you?", next = "alone_tribes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone_tribes = {
      lines = {
        { id = "at_default", text = "They think Unbagwa be crazy, mon, and that be the best protection a troll can have. Nobody want to bother the crazy witch doctor with the gorilla friends." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    danger = {
      lines = {
        { id = "da_default", text = "All the time, mon! But the apes always come when Unbagwa call, and they always be angry about it, and Unbagwa always get back up eventually. The spirits look after their friends, sort of." },
      },
      choices = {
        { text = "That's a strange kind of friendship.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xshaman = {
      big = true,
      lines = {
        { id = "xs_default", text = "They tell Unbagwa the jungle be getting restless, mon, with the old Gurubashi ruins whispering and the tribes fighting like hungry dogs over the bones. The gorillas don't care, but the trolls should." },
      },
      choices = {
        { text = "Then the trolls should face it together.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the tribes rot. Only the strong matter.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      big = true,
      lines = {
        { id = "xh_default", text = "Good, mon, a beast to fight beasts, Unbagwa like that! Just don't let it eat the fang before Unbagwa use it, because that happen once and Unbagwa still not forgiven that wolf." },
      },
      choices = {
        { text = "My beast fights fair. Let the apes come.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "My beast will tear them apart. Mercy's wasted here.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Unbagwa be a witch doctor of the jungle, and a friend of the gorilla spirits, and a little bit crazy, they say." } },
    advice = { { id = "tp_ad", text = "Never run from a silverback, mon. Walk slow, and look sorry." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The trolls of Zul'Gurub be no friends of the gorillas, mon, they hunt them for their blood magic. Unbagwa keep the gorillas safe from them, as best he can." } },
    the_elements = { { id = "tp_the_elements", text = "The spirits of the jungle be strong, mon, and Unbagwa hear them in the trees and in the rain. The gorilla spirits be the loudest, and the friendliest." } },
    booty_bay = { { id = "tp_booty_bay", text = "Unbagwa went to Booty Bay once, and the goblins tried to buy a gorilla from him. Unbagwa not go back." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear be good trolls, mon, and they treat the jungle with respect. Unbagwa like them better than the Gurubashi." } },
    _none = { { id = "tp_none", text = "The spirits don't tell Unbagwa about that, so Unbagwa don't know." } },
  },
}
