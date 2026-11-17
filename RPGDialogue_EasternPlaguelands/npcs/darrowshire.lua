-- Darrowshire's two heroes, who rise only when the relics bring the battle back: Joseph Redpath, the captain
-- who held the town and was made into a monster, and Davil Lightfire, the paladin who came home to die. Voice: bibles/darrowshire.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "joseph_redpath", id = TODO_NPC("Joseph Redpath"), name = "Joseph Redpath",
  bible = "bibles/darrowshire.md", role = "soldier", tier = "quest",
  communities = { "darrowshire" }, temper = { "steady", "warm" }, values = { "loyal", "brave" },
  notices = { "class", "race" },

  impression = {
    first = "Joseph Redpath's spirit stood in the square at Darrowshire, free of whatever the Scourge had made of him, and the first thing he asked about was his daughter. He fought for the town to the end and seems to have only just forgiven himself.",
    third = "{name} spoke with the freed spirit of Joseph Redpath, captain of Darrowshire, after his corrupted form was destroyed.",
  },

  greetings = {
    { id = "g_free", text = "I'm myself again. I can feel my own hands, and they're not doing anything I didn't ask them to, and you can't know how good that is." },
    { id = "g_battle", when = { questActive = TODO_QUEST("The Battle of Darrowshire") }, text = "You stood with us. The town fell all over again tonight, but this time it fell with me still in it, and not marching for the other side." },
    { id = "g_back", when = { metBefore = true }, text = "You again, friend. I'd hoped I'd be gone by now, but it seems I've a few more words in me before I go." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "You wear the Light the way Davil did. I always envied him that, and never told him." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You came back from it too, I see. Then you know what it's like to wake up and find your hands were someone else's for a while." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Joseph Redpath, captain of Darrowshire's defenders, for what that's worth now. The Scourge took me in the square and made me into one of theirs, and you've cut me loose, and I won't forget it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Battle of Darrowshire") },
          text = "Go to Pamela when we're done here; she's waiting in the old house, and she's been waiting far too long. Tell her I'm coming home, and tell her I mean it this time." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Battle of Darrowshire") },
          text = "Pamela had her tea and her ghosts went quiet, and I've been closer to home this last while than I've been since the battle. I've you to thank for that." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A knight of the Silver Hand, or near enough. We sent for your order when the dead came over the hill, {class}, and only Davil came, and he was enough to make the Scourge pay dearly." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "I'll not ask whose banner you march under now, {class}, because you helped free me and that's all I need to know of you." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I'd like to use what time I've got." },
        { id = "h_again2", text = "Go on. It's good to talk with my own voice." },
      },
      choices = {
        { text = "Pamela is waiting for you.", next = "pamela" },
        { text = "What did the Scourge make of you?", next = "corrupt" },
        { text = "Carlin survived. He's at Light's Hope.", next = "carlin" },
        { text = "Marlene hid Pamela, and stayed with her.", next = "marlene" },
        { text = "Tell me about the battle.", next = "battle" },
        { text = "Go home, Joseph. Your family's waiting.", next = "END" },
      },
    },

    pamela = {
      lines = { { id = "pa_default", text = "My little girl, alone in that house all these years with the ghosts whispering at her through the walls. She was meant to be safe; that was the whole point of holding the square." } },
      choices = {
        { text = "She's been brave. She makes tea for visitors.", next = "pamela_tea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pamela_tea = {
      big = true,
      lines = { { id = "pt_default", text = "Too much sugar in it, I'll wager, because her mother always said she'd rot her teeth. Should I go to her as I am, a ghost, or let her keep the father she remembers?" } },
      choices = {
        { text = "Go to her. She deserves the truth, ghost and all.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let her keep the father she remembers. It's kinder.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "That's for you to decide, Joseph.", next = "BACK" },
      },
    },

    corrupt = {
      lines = { { id = "co_default", text = "Something huge and cold, wearing my face, and every man who fell in the square got up and followed it. I remember it the way you'd remember a fever, all heat and noise, and my own voice giving orders I'd never have given." } },
      choices = {
        { text = "That wasn't you. The Scourge did that.", next = "corrupt_forgive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corrupt_forgive = {
      big = true,
      lines = { { id = "cf_default", text = "That's what everyone keeps saying, and tonight I almost believe it. But they were my men, and they followed my voice, and I've got to make my own peace with that before I can go." } },
      choices = {
        { text = "I forgive you, Joseph, for whatever that's worth.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Some things can't be forgiven, only finished. It's finished.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    carlin = {
      lines = { { id = "ca_default", text = "Carlin lived! Oh, the stubborn fool, he'll have spent every day since blaming himself for it, because that's who he is. He always did think he should have been the one in the square." } },
      choices = {
        { text = "He does. He talks of you as if you're coming back.", next = "carlin_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    carlin_stance = {
      big = true,
      lines = { { id = "cs_default", text = "Then tell him from me that somebody had to live to remember us, and I'm glad it was him. Tell him he can stop now, though I know he won't listen." } },
      choices = {
        { text = "I'll tell him. He's earned the right to rest.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Carlin should keep serving the Dawn. That's how he honours you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    marlene = {
      lines = { { id = "ma_default", text = "My sister Marlene. She always was the one who did the sensible thing while the rest of us argued, and I'm not surprised she was the one who hid Pamela. Is she well?" } },
      choices = {
        { text = "She's a ghost too, at Sorrow Hill.", next = "marlene_ghost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marlene_ghost = {
      lines = { { id = "mg_default", text = "So the whole family's either dead or lost, apart from Carlin, and he's lost in his own way. Well, if ghosts can visit, I know where I'm going after Pamela's house." } },
      choices = {
        { text = "Give her my regards.", next = "BACK", fx = { affinity = 1, learn = { "darrowshire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    battle = {
      lines = { { id = "ba_default", text = "The Scourge came out of the north, more than we'd ever seen, and Davil Lightfire rode in with his disciples just as we thought we were finished. We held the square until Horgus came, the great brute, and then nothing held anything." } },
      choices = {
        { text = "What happened to Davil?", next = "battle_davil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    battle_davil = {
      lines = { { id = "bd_default", text = "Horgus caught him with a blow that would have felled a tree, and he went down still swinging. He was born in Darrowshire, you know; he came home to save it, and it killed him, and he'd do it again." } },
      choices = {
        { text = "He sounds like a true hero.", next = "BACK", fx = { affinity = 1 } },
        { text = "Was it worth holding Darrowshire?", next = "worth" },
        { text = "Something else.", next = "BACK" },
      },
    },

    worth = {
      big = true,
      lines = { { id = "wo_default", text = "Every family that got out the back road while we held the front would say yes. Every man who died in the square might say no, and I'd not argue with any of them." } },
      choices = {
        { text = "Yes. You bought lives with your stand.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You should have fled with them. Lives over pride.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A farmer's son who ended up captain because nobody else wanted the job. I'd have rather stayed on the farm, if I'm honest." } },
    darrowshire = { { id = "tp_dar", text = "The best soil in the east and the best people in it, and now it's ghosts and ash. Remember it as it was, if you can." } },
    advice = { { id = "tp_ad", text = "Hold the line as long as the families need, and not a moment longer. I learned the second half too late." } },
    _none = { { id = "tp_none", text = "I've been dead a while, friend, and the news doesn't reach the square. Ask Carlin; he'll know." } },
  },
}

P:NPC {
  key = "davil", id = TODO_NPC("Davil Lightfire"), name = "Davil Lightfire",
  bible = "bibles/darrowshire.md", role = "soldier", tier = "service",
  communities = { "darrowshire" }, temper = { "fierce", "earnest" }, values = { "devout", "brave" },
  notices = { "class", "race" },

  impression = {
    first = "Davil Lightfire is a paladin's ghost who came home to Darrowshire to defend it and died doing so. Even dead, he talks of the fight as if it might still be won.",
    third = "{name} met the ghost of Davil Lightfire, the Silver Hand paladin who fell defending his home town of Darrowshire.",
  },

  greetings = {
    { id = "g_default", text = "Stand fast, friend! If the dead are walking in Darrowshire again, then so am I." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "A brother of the Hand! Light's blessing on you, {class}, and on whatever brought you to my town." },
    { id = "g_battle", when = { questActive = TODO_QUEST("The Battle of Darrowshire") }, text = "Keep Horgus off me this time, friend, and I'll keep the rest off Joseph. We've a debt to settle with that brute." },
  },

  notice = {
    { id = "n_dk", cat = "race", when = { race = "Scourge" },
      text = "You're dead, and you're not trying to kill me. I'll take that as a good sign and leave my hammer where it is." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Davil Crokford, born in this town, though the Silver Hand called me Lightfire and it stuck. I came home with my disciples when the Scourge came for Darrowshire, and I'm still here, one way or another." },
        { id = "h_libram", when = { questActive = TODO_QUEST("Heroes of Darrowshire") },
          text = "My libram, is it? Somebody carried it off after the battle, and I hope they read it. Take it when you find it; a book of prayers does more good in living hands than in a ghost's." },
      },
      again = { { id = "h_again", text = "What else? Speak quick; the dead don't keep still for long here." } },
      choices = {
        { text = "Why did you come back to Darrowshire?", next = "home" },
        { text = "Tell me about Horgus.", next = "horgus" },
        { text = "What do you think of the Silver Hand now?", next = "hand" },
        { text = "How do you keep faith after all this?", next = "xfaith", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "Light keep you, Davil.", next = "END" },
      },
    },

    home = {
      lines = { { id = "ho_default", text = "Because my mother's grave is in the churchyard and my brother's children were in the square, and the Hand could spare me and a handful of disciples, so I took them. I didn't stop to ask whether it was wise." } },
      choices = {
        { text = "Should you have waited for more knights?", next = "home_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_stance = {
      big = true,
      lines = { { id = "hs_default", text = "More knights would have come too late, and Joseph's people would have been ash by then. Still, my disciples died with me, and they had mothers too." } },
      choices = {
        { text = "You were right to ride. Waiting would have doomed them.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Orders exist for a reason. Waiting might have saved more.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    horgus = {
      lines = { { id = "hg_default", text = "A ghoul the size of a barn, stitched together from who knows how many of our neighbours, and swinging a fist like a millstone. I broke my hammer on him and he broke me, and that was the end of it." } },
      choices = {
        { text = "Then I'll see that he falls first this time.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hand = {
      big = true,
      lines = { { id = "ha_default", text = "I hear the prince turned on us, and the order's scattered, and some of its best wear Scarlet now and burn villages. I'd rather have died in Darrowshire than lived to burn it." } },
      choices = {
        { text = "The Crusade has lost its way. The Dawn keeps the true faith.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Crusade is hard, but hard times need hard men.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },

    xfaith = {
      big = true,
      lines = { { id = "xf_default", text = "The same way I kept it in the square, {class}: one more swing, one more prayer, and never mind how many are still coming. Faith isn't believing you'll win; it's standing there anyway." } },
      choices = {
        { text = "Standing anyway is all any of us can do.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd rather win. Standing and dying helps nobody.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Darrowshire born, Silver Hand trained, Darrowshire buried. It's a short story, but I like the ending better than most." } },
    scarlet_crusade = { { id = "tp_sc", text = "Some of them were my brothers once, and they've forgotten what the Light is for." } },
    _none = { { id = "tp_none", text = "Ask Joseph; he always knew more about the town's business than I did." } },
  },
}
