-- Anthion Harmon: the ghost outside Stratholme's gate, who died trying to save his wife Ysida from
-- Baron Rivendare and knows where Valthalak's medallion went. Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "anthion", id = TODO_NPC("Anthion Harmon"), name = "Anthion Harmon",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "stratholme_gate" }, temper = { "grim", "sharp" }, values = { "loving", "stubborn", "regretful" },
  notices = { "deeds", "stranger" },

  impression = {
    first = "He'll speak of the treasure only once his wife is safe.",
    third = "{name} met Anthion Harmon, a ghost outside Stratholme who died trying to free his wife Ysida from the Baron.",
  },

  greetings = {
    { id = "g_default", text = "You can see me? Then listen, because I haven't long and there's something you must do." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. Is there news? Tell me there's news." },
    { id = "g_plea", when = { questActive = TODO_QUEST("Dead Man's Plea") }, text = "Tell me, is Ysida alive? Every moment you stand here, the Baron's clock runs down." },
    { id = "g_materials", when = { questActive = TODO_QUEST("Anthion's Strange Request") }, text = "Did you obtain the materials I asked for? I can't fight Theldren for you, but I can shape the means." },
    { id = "g_falrin", when = { questActive = TODO_QUEST("Anthion's Old Friend") }, text = "Falrin, in the library of Dire Maul. He'll be rude to you, but he's rude to everyone." },
  },

  notice = {
    { id = "n_strat", cat = "deeds", when = { deed = "dungeon:Stratholme" },
      text = "You've been inside and come out again. I couldn't manage that, as you can see." },
    { id = "n_stranger", cat = "stranger", when = { metBefore = false },
      text = "A living face. It's been so long I'd almost forgotten how the living squint at a ghost." },
    { id = "n_brd", cat = "deeds", when = { deed = "dungeon:Blackrock Depths" },
      text = "You've the soot of Blackrock on you. Then you may have passed Theldren's ring already and never known whose brother stood in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Anthion Harmon, or what's left of him. I'll give you the information you've come for, but more pressing matters are at hand: my beloved wife has been taken prisoner by Rivendare's undead scum." },
        { id = "h_locket", tags = { "news" }, when = { questDone = TODO_QUEST("Proof of Life") },
          text = "That locket... you found her! I can rest in peace at long last. Ask what you must, but make haste, because my time in this world is not long." },
        { id = "h_saved", tags = { "news" }, when = { questDone = TODO_QUEST("Dead Man's Plea") },
          text = "You went in after her. Whatever she told you, whatever she gave you, I'd know it before I go." },
        { id = "h_dawn", when = { reputation = { faction = "Argent Dawn", min = "honored" } },
          text = "You wear the Argent Dawn's favour. Ysida joined them against my wishes, and now she's in the Baron's hands, so forgive me if I'm not glad to see their colours." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly; I can feel myself thinning." },
        { id = "h_again2", text = "Ask. I'll answer if I can." },
        { id = "h_again3", text = "Go on. The gate is at my back and I'd rather look at you than at it." },
      },
      choices = {
        { text = "Tell me about your wife.", next = "ysida" },
        { text = "How did you die?", next = "death" },
        { text = "I came about Valthalak's medallion.", next = "medallion" },
        { text = "Why can't you rest?", next = "rest" },
        { text = "Who else was in your company?", next = "company" },
        { text = "You stand very close to that gate.", next = "gate" },
        { text = "I serve the Argent Dawn. Ysida chose well.", next = "dawn", when = { reputation = { faction = "Argent Dawn", min = "friendly" } } },
        { text = "I've walked the Baron's side of the city.", next = "walked", when = { deed = "dungeon:Stratholme" } },
        { text = "I'll be back.", next = "END" },
      },
    },

    ysida = {
      lines = {
        { id = "ys_default", text = "Ysida, my wife. I strongly objected to her joining the Argent Dawn's foolish crusade, but that's not of importance any more. Rivendare took her, and she's somewhere inside that city, waiting." },
      },
      choices = {
        { text = "Where in Stratholme?", next = "ysida_where" },
        { text = "The Argent Dawn isn't foolish.", next = "ysida_dawn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysida_where = {
      lines = {
        { id = "yw_default", text = "The Baron keeps his prisoners close, deep past the ziggurats in the dead side of the city. He likes to make a game of it, and he keeps the time himself, so you'll have to be fast." },
        { id = "yw_active", when = { questActive = TODO_QUEST("Dead Man's Plea") },
          text = "Past the ziggurats, in the Baron's own hall. You must finish what I attempted to do; you must rescue Ysida from the clutches of the Baron!" },
      },
      choices = {
        { text = "I'll bring her out.", next = "ysida_promise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysida_promise = {
      big = true,
      lines = {
        { id = "yp_default", text = "Don't promise me. I promised her the same, and look at me. Just go, and bring her out if the Light allows it." },
      },
      choices = {
        { text = "I promise anyway. Some promises are worth making.", next = "BACK", reply = "Then I'll hold you to it, from wherever I end up.", fx = { align = { honor = 1 } } },
        { text = "No promises, then. Only a good try.", next = "BACK", reply = "That's honest. It's more than most of the living give a ghost.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysida_dawn = {
      big = true,
      lines = {
        { id = "yd_default", text = "Not foolish to fight the Scourge, no. Foolish to march into Stratholme with a handful of priests and a song, and foolish of me to let her go alone." },
      },
      choices = {
        { text = "She chose to fight. Respect that.", next = "BACK", reply = "I respect it. I just wish I'd told her so, before.", fx = { align = { order = -1 } } },
        { text = "You were right to object. It was reckless.", next = "BACK", reply = "Right, and dead, and she's still in there. Being right was no comfort at all.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    death = {
      lines = {
        { id = "de_default", text = "I went in after her, alone, because I wouldn't wait for anyone. I got as far as the Baron's hall, and that's as far as I remember." },
      },
      choices = {
        { text = "That was brave.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    medallion = {
      lines = {
        { id = "me_default", text = "We didn't realise the importance of Valthalak's medallion, so it was divided along with the rest of the spoils. The first piece was taken by a dwarf named Theldren, who beat me within an inch of my life when I tried to get it back." },
      },
      choices = {
        { text = "Where is Theldren now?", next = "medallion_theldren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    medallion_theldren = {
      lines = {
        { id = "mt_default", text = "Last I heard, he'd become a gladiator for the Dark Iron dwarves. Getting him to fight you will be a challenge, since Theldren is not one to willingly take part in a fair fight." },
      },
      choices = {
        { text = "Then how do I make him?", next = "medallion_banner" },
        { text = "Something else.", next = "BACK" },
      },
    },
    medallion_banner = {
      lines = {
        { id = "mb_default", text = "A banner in his family's colours, with a little sorcery worked into it, will provoke him beyond resisting. An old acquaintance of mine named Falrin knows the procedure; he has a particular way of aggravating people." },
      },
      choices = {
        { text = "I'll gather what you need.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    rest = {
      lines = {
        { id = "re_default", text = "Because I don't know if she's alive. I won't go on until I do, and I won't go anywhere the Baron can follow." },
        { id = "re_done", when = { questDone = TODO_QUEST("Proof of Life") },
          text = "I can, now. She's safe, and that was all that held me. I'll stay only long enough to answer what you need." },
      },
      choices = {
        { text = "Then I hope you find peace.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    company = {
      lines = { { id = "co_default", text = "A band of us, sellswords out of the Veiled Blade, and we were good. We went into Blackrock Spire for Lord Valthalak's hoard and came out rich, and not one of us has had a quiet day since we shared it out." } },
      choices = {
        { text = "What became of the others?", next = "company2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    company2 = {
      lines = { { id = "co2_default", text = "Theldren went to the Dark Irons' arena, as I told you. The rest scattered or died, and I'll not send you chasing every one of them from a graveside. Deliana in Ironforge and Mokvar in Orgrimmar know the tale, and they're the ones who sent you to me." } },
      choices = {
        { text = "So the hoard was cursed.", next = "company3" },
        { text = "You robbed a tomb and it followed you.", next = "company3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    company3 = {
      lines = { { id = "co3_default", text = "Call it what you like. I called it luck, for a year, and then I called it nothing at all, because I was too busy to give it a name. Find the medallion and take it back where it belongs, and you'll have done better by Valthalak than we did." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    gate = {
      lines = { { id = "ga_default", text = "I fell forty paces inside it, and this is as far as I can get from where I fell. I've tried the road south a hundred times. Something in that city has a hook in every soul that dies there, and it only lets out so much line." } },
      choices = {
        { text = "Do you see others like you?", next = "gate2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gate2 = {
      lines = { { id = "ga2_default", text = "Hundreds, pressed up against the walls on the inside, and they don't know me or each other. I think I kept my wits only because I died with one clear thought, and I've held onto it like a rope ever since." } },
      choices = {
        { text = "Then hold onto it a little longer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawn = {
      lines = {
        { id = "dw_default", text = "Chose well? She chose a cause that marched her into that city. But I'll grant you this much, since you wear their mark honestly: they'd not have left her there by choice, and one of their own is standing here asking after her." },
        { id = "dw_done", when = { questDone = TODO_QUEST("Proof of Life") }, text = "She did, and I was a stubborn fool to say otherwise. Your order went back in for her when her own husband couldn't. Tell Lord Tyrosus that a dead mercenary has changed his mind." },
      },
      choices = {
        { text = "The Dawn doesn't abandon its own.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    walked = {
      lines = { { id = "wk_default", text = "Then you know the ziggurats, and the things that guard them, and how the Baron keeps his hall. Did you hear a woman's voice anywhere past the slaughterhouse? No, don't answer unless you're certain. I've had enough of hoping on a maybe." } },
      choices = {
        { text = "I heard nothing I could swear to.", next = "BACK", reply = "Then say no more. Go in again with your ears open, and come back when you can swear.", fx = { trait = { honest = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stratholme = { { id = "tp_strat", text = "I can tell you every stone of the first forty paces. After that, I'm no use to you." } },
    argent_dawn = { { id = "tp_dawn", text = "My wife's people. I had hard words for them once, and I've had a long time at this gate to regret most of those." } },
    scourge = { { id = "tp_scourge", text = "Rivendare's scum. I've no fine words about them, only a debt." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't the time left to wonder." } },
  },
}
