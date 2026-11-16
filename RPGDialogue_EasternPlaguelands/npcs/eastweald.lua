-- The Eastweald beyond the chapel: Tirion's cottage by the river, and the Marris Stead. Voice: bibles/easternplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tirion", id = TODO_NPC("Tirion Fordring"), name = "Tirion Fordring",
  bible = "bibles/easternplaguelands.md", role = "noble", tier = "major",
  communities = { "eastweald" }, temper = { "weary" }, values = { "honorable", "loyal", "kind" },
  notices = { "race", "class" },

  impression = {
    first = "Tirion Fordring was a lord and a paladin once, and now he fishes by a river with an old horse for company. He carries his losses quietly, and his kindness hasn't soured in the slightest.",
    third = "{name} met Tirion Fordring, the exiled paladin who lives by a quiet stream in the Eastweald with his old horse Mirador.",
  },

  greetings = {
    { id = "g_river", text = "A visitor, out here? Mind Mirador; he's old, and he doesn't like strangers. Neither did I, once, but I've had time to change." },
    { id = "g_back", when = { metBefore = true }, text = "Back by the river? Sit with me; the fish don't bite, but the water's still pleasant to watch." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. I knew one, long ago, a good one, and defending him cost me everything I had. I'd do it again." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I was one, before they took it from me. Tell me the order still teaches mercy, and lie, if you must." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "I have to believe so, or there is little point in an old man fishing here. The Light can cleanse a soul, but the land wants something slower, and I think it wants us to stop fighting over it first." } },
      choices = {
        { text = "It will heal with patience and mercy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It heals when every plague-thing is burned.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, by the look of you. I've watched this river run grey with plague for a long while now, and I'd give a great deal to hear from someone who knows whether it will ever run clean." },
        { id = "h_default", key = true,
          text = "Tirion Fordring, once a knight of the Silver Hand and lord of Hearthglen, and now an old man by a river, with a horse and a fishing line. It's a quieter life, though I didn't choose it." },
        { id = "h_food", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Demon Dogs") }, { questActive = TODO_QUEST("Blood Tinged Skies") }, { questActive = TODO_QUEST("Carrion Grubbage") } } },
          text = "The plague is in everything here: the beasts, the birds, the meat. Thin out the sick ones and bring me what's still clean; an old man has to eat." },
        { id = "h_redemption", when = { questActive = TODO_QUEST("Redemption") },
          text = "You've earned the story, then. Sit, and I'll tell you about my son." },
        { id = "h_memories", when = { any = { { questActive = TODO_QUEST("Of Forgotten Memories") }, { questActive = TODO_QUEST("Of Lost Honor") }, { questActive = TODO_QUEST("Of Love and Family") } } },
          text = "Pieces of a life I lost: a hammer, an honor, a painting. Bring them to me, and I'll find the courage to use them." },
        { id = "h_missing", once = true, when = { heardLine = "pool:spirithealer.z_plague" },
          text = "So the healer told you about the missing. Every soul the Scourge lifts from the ground is one the healer never sees, and that's why the Dawn burns what the plague leaves behind." },
        { id = "h_myranda", when = { questActive = TODO_QUEST("Find Myranda") },
          text = "Myranda can help you walk among the Crusade unseen. I don't trust her, but I don't need to; I only need her to be good at what she does." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "You keep coming back to an old man's riverbank, and I've stopped pretending I don't look forward to it. Sit, and tell me the world hasn't forgotten what mercy is." },
      },
      again = { { id = "h_again", text = "Sit a while longer; the fish aren't biting anyway." } },
      choices = {
        { text = "Can these lands heal, Tirion?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What happened to you?", next = "story" },
        { text = "Tell me about your son.", next = "son" },
        { text = "Do the fish ever bite?", next = "fish" },
        { text = "Who's the horse?", next = "mirador" },
        { text = "Does the Light still hear you?", next = "paladin", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "An orc saved your life?", next = "eitrigg", when = { race = { "Orc", "Human", "Dwarf" } } },
        { text = "Would you show mercy to the dead, Tirion?", next = "x_forsaken", when = { race = "Scourge" } },
        { text = "What turns a soldier into a zealot?", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "I'll help you.", next = "END", fx = { affinity = 2, align = { light = 1, honor = 1 } } },
        { text = "You chose an orc over your own people, and I can't respect that.", next = "END", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    story = {
      big = true,
      lines = {
        { id = "s_default", text = "There was an orc, Eitrigg, living alone in the hills near Hearthglen, and he saved my life. When my people came to kill him, I stood between them, and for that they stripped me of the Light and of my lands and named me traitor. My wife told my son I'd died. Perhaps that was a kindness." },
      },
      choices = {
        { text = "Do you regret it?", next = "regret" },
        { text = "That's a cruel reward for mercy.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Hearthglen's people were only protecting their own.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    regret = {
      lines = {
        { id = "r_default", text = "Not for a moment. I regret what it cost my family, but I'd never regret what I did. A paladin who only protects his own kind isn't a paladin; he's a sword with a prayer painted on it." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 3, align = { light = 2, honor = 1 }, trait = { kind = 1 } } },
        { text = "Your family paid for that mercy, and I'd call that too high a price.", next = "BACK", fx = { align = { light = -2 } } },
      },
    },
    son = {
      lines = { { id = "so_default", text = "Taelan was a boy when I lost him, and he's a man now, wearing the Crusade's red. He thinks his father died a traitor. I think of him every morning, and I fish, and I don't go to Hearthglen." } },
      choices = {
        { text = "You should go to him.", next = "son_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    son_go = {
      lines = { { id = "sg_default", text = "Perhaps, when I've found the courage to be his father again, and not just a story his mother told. Ask me another day." } },
      choices = {
        { text = "What are you truly afraid he'll say?", tag = "Persuade", next = "son_fear",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PRIEST", "PALADIN" } }, { trait = "kind" } } } },
          fail = { next = "son_shut", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    fish = {
      lines = { { id = "f_default", text = "Rarely, because the river's sick, like everything here. I don't fish for the fish; I fish because a man has to sit still somewhere, or he goes to Hearthglen and does something foolish." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mirador = {
      lines = { { id = "m_default", text = "Mirador, the last thing I kept. He's older than he looks and wiser than I am; he knew to leave Hearthglen before I did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    paladin = {
      big = true,
      lines = { { id = "p_default", text = "They took my right to call on it, but they couldn't take the habit of listening. Some mornings I think I hear it, and some mornings I'm only an old man by a river." } },
      choices = {
        { text = "It hears you. I'm sure of it.", next = "BACK", fx = { affinity = 3, align = { light = 2 } } },
        { text = "The Light let them strip you, so I'd stop listening for it.", next = "BACK", fx = { affinity = -1, align = { light = -2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eitrigg = {
      lines = { { id = "e_default", text = "He did. Old, tired of war, and living on his own, he pulled me out of a fight I'd have lost, and asked nothing for it. I've known few men, of any kind, better." } },
      choices = {
        { text = "Where is he now?", next = "eitrigg_now" },
        { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } },
      },
    },
    eitrigg_now = {
      lines = { { id = "en_default", text = "With his own people, in Orgrimmar, I'm told. I hope they treat him better than mine treated me, and I suspect they do." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },
    son_fear = {
      big = true,
      lines = {
        { id = "sf_default", text = "That he'll be right. He was raised to believe his father betrayed Lordaeron for an orc, and if I ride into Hearthglen and he looks at me the way the Crusade taught him to, I'll have lost him twice." },
        { id = "sf_priest", when = { class = "PRIEST" },
          text = "You'd hear this in a confessional, so I'll say it plainly: I'm not afraid of his sword, I'm afraid of his face. A dead father is a story he can live with, and a living traitor is one he'd have to answer for." },
      },
      choices = {
        { text = "He might surprise you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then let him decide that, not you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    son_shut = {
      lines = {
        { id = "ss_default", text = "That's between me and the river, friend, and the river doesn't ask. Forgive an old man for keeping a few things back." },
      },
      choices = {
        { text = "Of course. Forgive me.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_forsaken = {
      lines = {
        { id = "xf_default", text = "I defended an orc when my own people called him a monster, and I've had a long time by this river to wonder where mercy ought to end. You came here to talk with an old man instead of raising a hand to him, so I'll judge you by that, as I'd judge anyone." },
        { id = "xf_knight", when = { origin = "forsaken_risen_knight" }, text = "You were a knight once, before the plague; I can see it in the way you stand, even now. I may well have known your name, and I'm sorry that I can't recall it." },
        { id = "xf_paladin", when = { race = "Scourge", class = "PALADIN" }, text = "You carry the Light, and you carry it dead. I'd have called that impossible once, but I've been wrong about a great many things, so tell me, child: does it burn?" },
      },
      choices = {
        { text = "It burns. I carry it anyway.", next = "BACK", when = { class = "PALADIN" }, fx = { affinity = 3, trait = { brave = 1 } } },
        { text = "Mercy is all the dead have left, Tirion.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I don't need anyone's mercy, old man.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "Fear, mostly, and a commander who tells you that your fear is righteous. I watched good men of Hearthglen's garrison follow that voice into the Crusade, and I couldn't call them back, because by then they'd stopped listening to anything that sounded like doubt." },
      },
      choices = {
        { text = "A soldier follows orders. The blame is the commander's.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Every soldier answers for what their own hands do.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've been out of the world a long while, but an old knight remembers more than he lets on. Ask me about any of these and I'll tell you what I can." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've sat by this river with me often enough to ask me anything. These I can speak to, and honestly, which is the only way I still know how." },
    },
    background = { { id = "tp_ba", text = "A lord, a paladin, a traitor, a fisherman. Each of them was true for a while.", next = "story" } },
    advice = { { id = "tp_ad", text = "Do the right thing, and pay what it costs without complaining. That's the whole of the Light, as far as I can tell." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Some of the finest people I knew joined them, to save Lordaeron, and now they burn what's left of it. My son is among them. I try not to think about that, and fail." } },
    argent_dawn = { { id = "tp_dawn", text = "Good people at the chapel, and they'd have me, I think. I'm not ready, but one day." } },
    _none = { { id = "tp_none", text = "I've been out of the world a long while, friend. Ask the chapel." } },
  },
}

P:NPC {
  key = "nathanos", id = TODO_NPC("Nathanos Blightcaller"), name = "Nathanos Blightcaller",
  bible = "bibles/easternplaguelands.md", role = "soldier", tier = "major",
  communities = { "marris_stead" }, temper = { "cold" }, values = { "loyal", "proud" },
  notices = { "race", "class" },

  impression = {
    first = "Nathanos Blightcaller stands on his family's old land and speaks of the Banshee Queen as the one who gave him back his mind. He measured me as a tool, and found me adequate, barely.",
    third = "{name} met Nathanos Blightcaller, the cold Forsaken ranger who serves as the Banshee Queen's champion at Marris Stead.",
  },

  greetings = {
    { id = "g_stead", text = "You stand on my land. It was my family's before the plague, and now it serves the Banshee Queen, as do I." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. I was the finest ranger in Lordaeron, once; the elves trained me, and hated that I was good at it. You may prove useful." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of the Queen's own. Then you know the debt we owe her, so repay it here." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "It troubles me that the Scourge made it and the Dark Lady did not. What the land does after we have won is your concern, druid, not mine." } },
      choices = {
        { text = "The land must be healed, whoever wins.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Win first. The trees can wait.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A tauren druid in the Plaguelands. Keep to the river, druid, and don't go embracing the trees out here, for half of them are rotten through and the other half are worse." },
        { id = "h_default", key = true,
          text = "Nathanos, Champion of the Banshee Queen; they call me the Blightcaller. The Scourge, the plaguebats and the Scarlet zealots all crawl over these fields, and I mean to clear them, and you'll help." },
        { id = "h_queen", when = { heardLine = "sylvanas.h_default" },
          text = "You've stood before my Queen, so you know why I serve. She gave me back my mind, and I'll give her everything else." },
        { id = "h_back", when = { metBefore = true },
          text = "Still alive? Adequate; most of those she sends me are not." },
      },
      again = {
        { id = "h_again", text = "More? Ask it quickly, because the plaguebats won't wait on your curiosity." },
        { id = "h_again2", text = "Go on, then, though I warn you my patience is thinner than these fields." },
      },
      choices = {
        { text = "Does the blight trouble you at all, Blightcaller?", next = "druid_q", when = { class = "DRUID" } },
        { text = "This was your home?", next = "home" },
        { text = "Teach me what the elves taught you.", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "We both woke in the dark, Blightcaller.", next = "x_forsaken", when = { race = "Scourge" } },
        { text = "Another elf, Blightcaller. Do you hate us all?", next = "x_skyborne", when = { race = "Skyborne" } },
        { text = "I'll clear the fields.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt where I please, Blightcaller, not where you point.", next = "END", fx = { align = { order = -1 } } },
      },
    },
    home = {
      lines = {
        { id = "hm_default", text = "I was born in that house, and I was a ranger lord when there were still lords in Lordaeron. The Scourge took it, and me. The Queen returned me; the house, I'll take back myself." },
      },
      choices = { { text = "Then let's take it back.", next = "END", fx = { affinity = 2 } } },
    },
    x_hunter = {
      lines = {
        { id = "xh_default", text = "Teach you? The elves spent years teaching me, and every lesson came with a sneer for the human who dared to learn it. I'll tell you the one thing they never managed to: a ranger is measured by what he kills, not by the blood he was born with." },
      },
      choices = {
        { text = "Then measure me by my kills.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "A ranger's measured by what he protects.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_forsaken = {
      lines = {
        { id = "xf_default", text = "We did, and we both woke to her voice, which is the only reason either of us is more than a ghoul in a field. Remember that whenever you're tempted to think your will is your own; it is, now, because she made it so." },
        { id = "xf_soldier", when = { origin = "forsaken_lordaeron_soldier" }, text = "You wore Lordaeron's colors once, as I did. Then you know what this land was, and you'll fight for what it can be under her." },
      },
      choices = {
        { text = "My will is my own, Blightcaller. Nobody gave it to me.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
        { text = "I owe her everything, and I'll repay it here.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_skyborne = {
      lines = {
        { id = "xs_default", text = "I don't know your people, elf, and I've no wish to, but I knew the ones who trained me, and I watched them smile while they called me a hound that had learned tricks. If you're different, prove it on the plaguebats, and I'll decide later whether your name is worth remembering." },
      },
      choices = {
        { text = "I'll prove it in the field.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Your grudge is with other elves, not with me.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know these fields and the vermin crawling over them better than any living soul. Ask about these, and be brief about it." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I owe you nothing, so you'll get the short list. Ask about these, or leave my land." },
    },
    scarlet_crusade = { { id = "tp_scarlet", text = "Living fanatics who think fire cures death. They'll learn, and some of them I'll teach personally." } },
    _none = { { id = "tp_none", text = "Irrelevant." } },
  },
}
