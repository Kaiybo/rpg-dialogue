-- Bandarion Keep (Forever): the Forsaken paladins' order on the bluffs west of Deathknell,
-- and Bareth Dawnstone, held captive at the Crusader's Outpost. Voice: bibles/bandarion_keep.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "danitha", id = TODO_NPC("Danitha Morr"), name = "Danitha Morr",
  bible = "bibles/bandarion_keep.md", role = "questgiver", tier = "major",
  communities = { "bandarion_keep" }, temper = { "steady", "warm" }, values = { "devout", "loyal", "dutiful" },
  notices = { "paladin", "origin", "light" },
  impression = {
    first = "Danitha Morr leads the Forsaken paladins of Bandarion Keep, and she speaks of the Light like an old friend who has started to hurt her. She seems certain of one thing: the Forsaken are still the people she swore to protect.",
    third = "{name} met Danitha Morr, who leads the Forsaken paladins at Bandarion Keep and named it for her fallen friend, Garek Bandarion.",
  },

  greetings = {
    { id = "g_default", text = "Welcome to Bandarion Keep. Mind the stairs on your way up; we haven't mended half of them yet." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Good. Sit, if you've a moment, and tell me what the glades are saying about us." },
    { id = "g_paladin", when = { class = "PALADIN", race = "Scourge" }, text = "Welcome, {g:brother|sister}. Come up and sit with me; the Light is easier to bear in company." },
    { id = "g_tarnished", when = { questActive = TODO_QUEST("The Tarnished") }, text = "Shadowvale is southwest, past the lake. Come back with the head of Gelhardt, who leads the Tarnished, or not at all." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I'd begun to worry. We're few enough that I notice when one of us goes quiet." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8, class = "PALADIN" }, text = "You carry the Light more easily than when you first came up the hill, though I doubt it burns any less." },
  },

  notice = {
    { id = "n_knight", cat = "origin", when = { origin = "forsaken_risen_knight" },
      text = "You stand like one of the Silver Hand, with your weight on the back foot and your shield arm ready. Old habits outlive us all, it seems." },
    { id = "n_green", cat = "paladin", when = { class = "PALADIN", maxLevel = 12 },
      text = "You still flinch when the Light comes; I can see it in your hands. That passes, or rather you learn to stop flinching, which is nearly the same thing." },
    { id = "n_priest", cat = "light", when = { class = "PRIEST", race = "Scourge" },
      text = "A priest of the Forsaken, up here among us. Your brothers in the Undercity would not approve, so I'll take your visit as a kindness." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I'm Danitha Morr, the closest thing this keep has to a commander. We are paladins who woke dead and found the Light still waiting for us, and we mean to serve the Forsaken with it, whether they want us to or not." },
        { id = "h_touring", tags = { "news" }, when = { questActive = TODO_QUEST("Touring the Grounds") },
          text = "Breton Samuels sent you up, then. You've seen what we have, which isn't much yet, but it's ours, and there's a great deal of work before it's a proper home. We'd be grateful for your hands." },
        { id = "h_tarnished", tags = { "news" }, when = { questActive = TODO_QUEST("The Tarnished") },
          text = "Gelhardt and his Tarnished are in Shadowvale, southwest of here. It pains me to cross blades with our old brothers and sisters, but every Forsaken they kill is another reason for the Undercity to fear us all." },
        { id = "h_tarnished_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Tarnished"), days = 3 } },
          text = "Gelhardt was a knight once, and I knew men like him in life. It gives me no joy to see his head in a sack, but it may take years to win the Forsaken's trust, and I'd rather not lose any more of it to him." },
        { id = "h_token", tags = { "news" }, when = { questActive = TODO_QUEST("A Token of Good Faith") },
          text = "Take the head to the Dark Lady and say as little as you can. She'll judge us by what we do, not by anything we say in our own defence." },
        { id = "h_token_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Token of Good Faith"), days = 5 } },
          text = "She told you they'd be watching, did she? Then let them watch, because we've nothing to hide and a great deal to prove." },
        { id = "h_divinity", when = { questActive = TODO_QUEST("A Lesson in Divinity") },
          text = "Small acts of service, done well, are how we keep hold of the grace that made us paladins. Go and do what I asked, and come back to me when it's done." },
        { id = "h_diplomatic", tags = { "news" }, when = { questActive = TODO_QUEST("Diplomatic Incident") },
          text = "Trevan Rol at the Sepulcher will know more than I do. If we can find those Earthen Ring travellers, the Horde may start to think of us as something more than a curiosity." },
        { id = "h_nonpal", when = { race = "Scourge", ["not"] = { class = "PALADIN" } },
          text = "You're no paladin, but you climbed the hill to see us, which is more than most of the Forsaken bother to do. Ask whatever you like." },
        { id = "h_horde", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "The Horde sends visitors now. Good; I'd rather your people saw what we are with their own eyes than heard about us from an apothecary." },
      },
      again = {
        { id = "h_again", text = "What else? I've letters waiting, but they've waited this long." },
        { id = "h_again2", text = "Go on. I'd rather answer a question than let it fester." },
        { id = "h_again3", text = "Ask, {class}. The keep is quiet for once, and I've learned to make use of it." },
      },
      choices = {
        { text = "Why is this place called Bandarion Keep?", next = "garek" },
        { text = "Why does the Dark Lady mistrust you?", next = "sylvanas" },
        { text = "Who are the Tarnished?", next = "tarnished" },
        { text = "What does it mean to be a paladin now?", next = "divinity" },
        { text = "How can a dead woman hold the Light?", next = "light_np", when = { ["not"] = { class = "PALADIN" } } },
        { text = "Does the Light ever stop burning, Danitha?", next = "burn", when = { class = "PALADIN" } },
        { text = "I was a knight of the Silver Hand, before.", next = "knight", when = { origin = "forsaken_risen_knight" } },
        { text = "Leonid wanted you to join the Argent Dawn.", next = "leonid", when = { questDone = TODO_QUEST("A Righteous Cause") } },
        { text = "The priests in the Undercity call you heretics.", next = "xpriest", when = { class = "PRIEST", race = "Scourge" } },
        { text = "Put me to work, Danitha.", next = "BUSINESS" },
        { text = "Light be with you.", next = "END" },
      },
    },

    garek = {
      lines = {
        { id = "ga_default", text = "Garek Bandarion was the first captain of the Deathguard, and as far as anyone knows, the first of us to lift the Light again after death. He gave his life against the Scourge when Naxxramas came for the Undercity, and I named this place for him so the Forsaken wouldn't forget it." },
      },
      choices = {
        { text = "You knew him well?", next = "garek_friend" },
        { text = "What was this place before?", next = "dawnswatch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garek_friend = {
      lines = {
        { id = "gf_default", text = "Well enough to argue with him, which was the only way to know Garek. He found the Light again and hardly knew what to do with it, and when he died, I decided someone had better find out." },
      },
      choices = {
        { text = "So you went looking for others like you.", next = "order" },
        { text = "Something else.", next = "BACK" },
      },
    },
    order = {
      lines = {
        { id = "or_default", text = "I did, and I found them in ditches and graveyards and burned-out chapels, knights who'd woken dead and couldn't bring themselves to pray. One young man I found sitting at his own grave, a Crusader once, killed by the men he served beside." },
      },
      choices = {
        { text = "A Crusader, among your paladins?", next = "cormack" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cormack = {
      big = true,
      lines = {
        { id = "co_default", text = "Cormack, Gavinrad the Dire's son, taught the old ways of the Silver Hand by his father before he ever wore the red. The Light burns him now, as it burns us all, but it still answers him, and I helped him see that it respects his faith even if it no longer spares his flesh." },
      },
      choices = {
        { text = "What he does now is all that matters.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A man who wore the red should be watched, Danitha.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dawnswatch = {
      lines = {
        { id = "dw_default", text = "Dawn's Watch, raised by Lordaeron's army on Northface Rock. The Argent Dawn held it after the fall, until they went east to the Plaguelands and left it to the weeds and the murlocs, and we've been patching it up ever since." },
      },
      choices = {
        { text = "That's a great deal of patching.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    sylvanas = {
      big = true,
      lines = {
        { id = "sy_default", text = "Because she remembers what the living did in the Light's name, and so do most of the Forsaken. Many of them were hunted and burned by men in tabards like the ones we used to wear, and when they look at a paladin, they see that first." },
        { id = "sy_token", when = { questDone = TODO_QUEST("A Token of Good Faith") },
          text = "You heard her yourself, so you know she only tolerates us. Still, she didn't send Gelhardt's head back, and from the Dark Lady that's very nearly a compliment." },
      },
      choices = {
        { text = "Then serve her loyally until she sees otherwise.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "She hasn't earned your loyalty, Danitha.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Do you fear she'll turn on you?", tag = "Persuade", next = "syl_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PALADIN", race = "Scourge" }, { questDone = TODO_QUEST("A Token of Good Faith") } } } },
          fail = { next = "syl_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    syl_truth = {
      lines = {
        { id = "st_default", text = "Some nights, yes. She has said she may one day decide we're not worth tolerating, and she meant every word, so I build this order as though each season could be our last. I don't tell the recruits that, and I'd thank you not to either." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    syl_no = {
      lines = {
        { id = "sn_default", text = "That's between me and the Dark Lady, {class}. Ask me something I can answer without sounding like a traitor or a fool." },
      },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },

    tarnished = {
      lines = {
        { id = "ta_default", text = "Risen paladins who carried their old hatreds out of the grave. They hold the Light and turn it on the Forsaken, the very people we swore to protect, and each one they kill makes it easier for our detractors to stoke mistrust of us all." },
      },
      choices = {
        { text = "Why not try to bring them back to the fold?", next = "tarnished_mercy" },
        { text = "Who leads them?", next = "gelhardt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tarnished_mercy = {
      big = true,
      lines = {
        { id = "tm_default", text = "I tried, with the first few. They called me an abomination in the same breath they used for their prayers, and two of my brothers fell before I stopped trying." },
      },
      choices = {
        { text = "Then they've chosen, and the sword is the only answer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Keep trying anyway. They were knights once.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gelhardt = {
      lines = {
        { id = "ge_default", text = "Rudolph Gelhardt, a commander in life, and I suspect he still thinks he is one. He has holed up in a farmhouse in Shadowvale with his zealots, and I mean to send his head to the Dark Lady as proof that we tend our own house." },
        { id = "ge_done", when = { questDone = TODO_QUEST("The Tarnished") },
          text = "Gelhardt is dead, thanks to you, though I doubt he's the last of his kind. The grave seems to send back as many fanatics as it does saints." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll go. Farewell, Danitha.", next = "END" },
      },
    },

    divinity = {
      lines = {
        { id = "dv_default", text = "It means divinity, which isn't the pursuit of godhood but the pursuit of good itself, for its own sake. We've all come here through one tragedy or another, and it would be easy to lose the grace that made us paladins in the first place." },
      },
      choices = {
        { text = "Good for its own sake, even for those who hate you?", next = "divinity_hate" },
        { text = "What do you ask of your paladins?", next = "divinity_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    divinity_hate = {
      big = true,
      lines = {
        { id = "dh_default", text = "Especially for them, because doing good for people who already love you costs nothing. When a Forsaken flinches from one of us and then thanks us anyway, that's a little of the old hatred undone." },
      },
      choices = {
        { text = "Then I'll do good whether they thank me or not.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Kindness to people who hate you is a fool's errand.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    divinity_ask = {
      lines = {
        { id = "da_default", text = "Small things, mostly, done well and without being asked: a beggar fed, a Deathguard's friend brought home, a cellar cleared. The grand deeds will come, but the Forsaken will trust us for the small ones first." },
        { id = "da_done", when = { questDone = TODO_QUEST("A Lesson in Divinity") },
          text = "Billmuth's commander has the Crusade's plans now, and the Deathguard are talking about a paladin who brought one of their own back. That one deed did more for us than a year of my letters to the Undercity." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Then I'd better get to work.", next = "BUSINESS" },
      },
    },

    light_np = {
      big = true,
      lines = {
        { id = "ln_default", text = "Painfully, and badly at first. The Light is anathema to the power that raised us, and it burns, but it still answers, and I've come to think the pain is how it reminds us it's there." },
      },
      choices = {
        { text = "Faith that burns is still faith.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A power that burns you is no friend.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn = {
      lines = {
        { id = "bu_default", text = "No, and I've stopped wishing it would. When I was alive the Light came easily and I took it for granted, and now every time it answers it costs me something, so I think I understand it better than I ever did." },
      },
      choices = {
        { text = "I'll learn to bear it, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    knight = {
      big = true,
      lines = {
        { id = "kn_default", text = "Then you know the oath, and you know the people we swore it to are the Forsaken now, whatever they think of us. Leonid of the Argent Dawn calls our state a condition to be cured, but I call it who we are, and I'd sooner serve Lordaeron as I am than wait for a cure." },
      },
      choices = {
        { text = "The oath still holds. I'll keep it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The oath died with Lordaeron, Danitha.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    leonid = {
      big = true,
      lines = {
        { id = "le_default", text = "Leonid is an old friend, and he means well, but among the Argent Dawn we'd be weapons against the Scourge and patients waiting for a cure. Our fledgling order has to find itself among our own kind, and that is why it matters so much that we stay." },
      },
      choices = {
        { text = "You were right to refuse him. Our place is here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Dawn would have kept you safe. You should have gone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      lines = {
        { id = "xp_default", text = "Some of them do, and I can't blame them, because they remember the Light carried as a torch to burn them. But the Light that answers you and the one that answers me aren't so different, and one day I'd like to sit down with your brothers and say so." },
      },
      choices = {
        { text = "I'll tell them you said so.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "t_kn", text = "Letters reach me from Brill, the Undercity and Light's Hope, and the murlocs bring the rest. Ask, and I'll tell you what I can." },
      { id = "t_kn_warm", when = { disposition = { min = 65 } }, text = "You've done right by this keep, so I'll tell you what I don't put in my letters." },
    },
    scarlet_crusade = { { id = "tp_crusade", text = "They wield the Light with hatred in their hearts, and they call us the abomination. I knew some of them in life, and I pray for them, though I'd still not turn my back on one." } },
    argent_dawn = { { id = "tp_argent", text = "They're good people, and Leonid is the best of them. They held this keep before us, and they'd have us back among them if I'd let them." } },
    background = { { id = "tp_bg", text = "I was a knight of the Silver Hand once, and now I'm whatever this is. I'm still deciding what to call it, and so is the Dark Lady." } },
    _none = { { id = "tp_none", text = "I don't know, and I'd rather say so than guess. Ask Jorin Croge, our quartermaster; he hears everything that comes up the road." } },
  },
}

P:NPC {
  key = "breton", id = TODO_NPC("Breton Samuels"), name = "Breton Samuels",
  bible = "bibles/bandarion_keep.md", role = "questgiver", tier = "quest",
  communities = { "bandarion_keep" }, temper = { "warm", "earnest" }, values = { "kind", "loyal" },
  notices = { "paladin", "greenness" },
  impression = {
    first = "Breton Samuels greets whoever climbs the hill to Bandarion Keep as though they'd come home. He is kindly and a little tired, and he seems to spend more of his days fighting murlocs than welcoming recruits.",
    third = "{name} met Breton Samuels, who welcomes new arrivals at Bandarion Keep and keeps the Vile Fin murlocs from its gates.",
  },

  greetings = {
    { id = "g_default", text = "Welcome home, friend. Watch the gate; it sticks." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and in one piece. That's more than the murlocs can say." },
    { id = "g_murloc", when = { questActive = TODO_QUEST("Murlocs at the Gates") }, text = "These murlocs just don't quit, do they? Keep at it." },
    { id = "g_paladin", when = { class = "PALADIN", race = "Scourge" }, text = "Good to see you, {g:brother|sister}. The Light keep you, even when it stings." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 9, race = "Scourge" },
      text = "Freshly risen, aren't you? You've still got grave dirt under your nails. Don't worry; it took me a month to stop finding it." },
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", race = "Scourge", maxLevel = 14 },
      text = "You hold your hammer the way I held mine when I first woke, as if it might bite you. It won't, though the Light might." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "If you've come seeking the fellowship of your fellow paladins, you've come to the right place. I'm Breton Samuels, and I meet whoever climbs the hill, which lately has been more murlocs than recruits." },
        { id = "h_secondhome", tags = { "news" }, when = { questActive = TODO_QUEST("A Second Home") },
          text = "Another fresh recruit? Shari Stilwell sent you, I'd wager, and she sends only the good ones. Welcome to Bandarion Keep, {g:brother|sister}, and welcome home." },
        { id = "h_murloc_before", when = { questBefore = TODO_QUEST("Murlocs at the Gates"), class = "PALADIN" },
          text = "Normally we'd show a newcomer more hospitality, but the Vile Fins are at our gates again. You look like you've seen some action, and I could use a hand driving them back." },
        { id = "h_murloc_active", tags = { "news" }, when = { questActive = TODO_QUEST("Murlocs at the Gates") },
          text = "They lurk in the bluffs along the road to the east and in the camps around the lake to the west. Mind the wolves by the water, too, because they carry a sickness you'll want to purify before it settles in." },
        { id = "h_murloc_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Murlocs at the Gates"), days = 2 } },
          text = "That won't stop the attacks entirely, but it'll slow them down. It's hard enough rebuilding this place without a murloc trying to put a spear in your back." },
        { id = "h_touring", tags = { "news" }, when = { questActive = TODO_QUEST("Touring the Grounds") },
          text = "Have you met everyone yet? Hilda's by the training dummies, Jorin's inside with the stores, and Ander walks the east road, and when you've seen them, go on up to Danitha." },
        { id = "h_touring_done", when = { questDone = TODO_QUEST("Touring the Grounds") },
          text = "You've met Danitha, then. She's the reason most of us are here and not wandering the glades in rusted plate." },
        { id = "h_repairs", when = { questDone = TODO_QUEST("Making Repairs") },
          text = "Jorin's sending me down into that Shadowvale cellar to clear out what you left behind. I'll think of you fondly while the rats chew my boots." },
        { id = "h_nonpal", when = { race = "Scourge", ["not"] = { class = "PALADIN" } },
          text = "You're not one of us, but you're welcome all the same. Paladin or not, we're all Forsaken under this roof." },
        { id = "h_horde", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "A visitor from the Horde, all the way up here? Most of your folk give us a wide berth, and I can't say I blame them." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? I've a few minutes before the next murloc." },
        { id = "h_again2", text = "Go on, ask. Nobody's asked me anything but where the privy is all week." },
      },
      choices = {
        { text = "Why do the murlocs keep attacking?", next = "murlocs" },
        { text = "What is this place, Breton?", next = "place" },
        { text = "How did you come to be here?", next = "self" },
        { text = "Who else should I meet here?", next = "who" },
        { text = "I don't know if I belong here.", next = "belong", when = { class = "PALADIN", race = "Scourge" } },
        { text = "Do the Forsaken trust you lot?", next = "xhorde", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'm ready to help.", next = "BUSINESS" },
        { text = "Light guide you, Breton.", next = "END" },
      },
    },

    murlocs = {
      big = true,
      lines = {
        { id = "mu_default", text = "The Vile Fin used the keep as their spawning grounds before we moved in and drove them out. They've never forgiven us for it, and lately they've grown bold enough to come right up to the gates." },
      },
      choices = {
        { text = "They were here first. Perhaps the lake can be shared.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then we drive them into the lake for good.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Have you ever tried leaving them be?", next = "murloc_share" },
      },
    },
    murloc_share = {
      lines = {
        { id = "ms_default", text = "Once, and I'd like to say it worked. The last time I left a few of them be, they came over the wall at night and stabbed our cook, and he's still sore about it." },
      },
      choices = {
        { text = "What does Hilda the Breaker say about it?", next = "murloc_drive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    murloc_drive = {
      lines = {
        { id = "md_default", text = "Hilda says drive them into the lake and keep driving, and she's usually right about anything that can be solved with a mace. I only wish there were fewer of them and more of us." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    place = {
      lines = {
        { id = "pl_default", text = "Dawn's Watch, it was called, back when Lordaeron's soldiers held it. Danitha renamed it for Garek Bandarion, and she'll tell you about him if you ask, though you'll want a chair." },
      },
      choices = {
        { text = "Who was Garek Bandarion?", next = "garek" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garek = {
      lines = {
        { id = "gb_default", text = "The first captain of the Deathguard and, they say, the first of us to wield the Light after death. I never met him myself, but I've met plenty who'd have followed him anywhere." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    self = {
      lines = {
        { id = "se_default", text = "I woke in a field near Brill with my old shield still strapped to my arm, and when I prayed out of habit, the Light answered and it burned. I thought I'd gone mad until Shari Stilwell found me and told me there were others." },
      },
      choices = {
        { text = "Shari Stilwell?", next = "shari" },
        { text = "It still burns you?", next = "self_burn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shari = {
      lines = {
        { id = "sh_default", text = "She trains the newly risen in Brill and sends them up here once they're ready. She found me and a good many others, and I owe her more than I'll ever manage to repay." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    self_burn = {
      big = true,
      lines = {
        { id = "sb_default", text = "Every time. I've stopped minding, mostly, and I think minding less is most of what Danitha means by faith." },
      },
      choices = {
        { text = "Then the pain is worth bearing.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A Light that burns you is no friend of yours.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    who = {
      lines = {
        { id = "wh_default", text = "Hilda's out by the training dummies, Jorin keeps the stores inside, and Ander walks the east road to the old watch tower. Danitha's upstairs in the command room, and she'll want to meet you once you've seen the rest." },
      },
      choices = {
        { text = "Tell me about Hilda.", next = "hilda" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hilda = {
      lines = {
        { id = "hi_default", text = "She takes the soft and weak and hammers them back into fighters, and I was one of the soft ones. Don't ask her why they call her the Breaker, because I did, and I still regret it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    belong = {
      lines = {
        { id = "be_default", text = "I felt the same, and so does everyone who comes up that hill. You belong if you choose to, because the Light doesn't ask anyone for papers, and neither does Danitha." },
      },
      choices = {
        { text = "Then I choose to stay.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhorde = {
      lines = {
        { id = "xh_default", text = "Not much, no. Most Forsaken remember the living burning them in the Light's name, and they see us and remember it all over again. We'll earn it slowly, I think, one murloc and one favour at a time." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    murlocs_east = { { id = "tp_murloc", text = "If they're anything like our Vile Fins, they'll be back no matter how many you kill. Bring a spear of your own." } },
    _none = { { id = "tp_none", text = "That's beyond me, I'm afraid. Ask Jorin, or ask Danitha, if you want an answer worth having." } },
  },
}

P:NPC {
  key = "jorin", id = TODO_NPC("Jorin Croge"), name = "Jorin Croge",
  bible = "bibles/bandarion_keep.md", role = "questgiver", tier = "quest",
  communities = { "bandarion_keep" }, temper = { "dry", "steady" }, values = { "practical", "careful" },
  notices = { "kit", "soldier" },
  impression = {
    first = "Jorin Croge keeps Bandarion Keep's stores and counts every nail as if it were gold. He's dry and a little put-upon, and he plainly cares more about this place than he lets on.",
    third = "{name} met Jorin Croge, who keeps Bandarion Keep provisioned with whatever can be scavenged so far from the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Mind the crates. They're the only thing standing between us and starving, and I've counted them twice." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Unless you're carrying lumber, I'm afraid I've nothing to give you." },
    { id = "g_repairs", when = { questActive = TODO_QUEST("Making Repairs") }, text = "I need twelve pieces of good lumber from the root cellar in Shadowvale. I'll be here counting what we haven't got." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armour's coming apart at the seams. Angus, our smith, can mend it, though he'll charge you for the iron, because I won't give him any more." },
    { id = "n_soldier", cat = "soldier", when = { origin = "forsaken_lordaeron_soldier" },
      text = "You've the look of a soldier who once stood in a supply line and wondered why the bread never came. I was the one who didn't send it." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I'm Jorin Croge, and I keep the stores here. There's much lurking out there in the dark, and the Light is needed now more than ever, if only the poor souls in Brill could see that we aren't the monsters the living say we are." },
        { id = "h_touring", tags = { "news" }, when = { questActive = TODO_QUEST("Touring the Grounds") },
          text = "Breton sent you round, did he? I'm Jorin Croge, and I keep us fed, armed and roofed, more or less in that order." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Making Repairs"), questDone = TODO_QUEST("Touring the Grounds") },
          text = "This far from the Undercity, every nail and plank is a battle, and we've a dire shortage of building materials. If you've a strong back, there's a cellar in Shadowvale I'd like you to plunder." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Making Repairs") },
          text = "The root cellar is beneath a ruined house on the south side of Shadowvale. Twelve pieces of sound lumber, if you please, and watch your footing in the dark." },
        { id = "h_ready", tags = { "news" }, when = { questReady = TODO_QUEST("Making Repairs") },
          text = "Is that lumber I see? Set it down gently; it's worth more up here than anything in your purse." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Making Repairs"), days = 3 } },
          text = "Your lumber's already in the east wall, and it's holding. I'll send Breton and a few of the new recruits to clear out the rest of that cellar." },
        { id = "h_horde", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "A Horde traveller this far west? If you've news of the roads east, I'll take it, since nothing reaches us out here but rain and murlocs." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a ledger that won't balance itself." },
        { id = "h_again2", text = "Go on, then. Talking is the one thing up here we have plenty of." },
      },
      choices = {
        { text = "What is it you do here at the keep?", next = "work" },
        { text = "Why build a keep so far from anywhere?", next = "location" },
        { text = "What do you need most?", next = "needs" },
        { text = "Why would anyone call us monsters?", next = "monsters" },
        { text = "What's down in the cellar?", next = "cellar", when = { questActive = TODO_QUEST("Making Repairs") } },
        { text = "I served in Lordaeron's army. Supply was always short.", next = "xsoldier", when = { origin = "forsaken_lordaeron_soldier" } },
        { text = "I'll see what I can find.", next = "BUSINESS" },
        { text = "Good luck with the ledger.", next = "END" },
      },
    },

    work = {
      lines = {
        { id = "wo_default", text = "I make sure we're provisioned and that the scant resources we have go where they're needed. In a proper order I'd be the quartermaster, but such as we are, I just try to keep us equipped well enough to face what's out there." },
      },
      choices = {
        { text = "What did you do in life?", next = "life" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life = {
      lines = {
        { id = "li_default", text = "I was a clerk in the quartermaster's office of Lordaeron's army, which is a grand way of saying I counted barrels. It turns out counting barrels is the most useful thing I ever learned, since nobody else here can be bothered to do it." },
      },
      choices = {
        { text = "And the Light? Do you hold it too?", next = "life_light" },
        { text = "Something else.", next = "BACK" },
      },
    },
    life_light = {
      lines = {
        { id = "ll_default", text = "A little, enough to close a cut or steady a frightened recruit, and I thank it for that much. I leave the great works to Danitha and Hilda, and I keep the candles stocked so they've light of the other kind to read by." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    location = {
      lines = {
        { id = "lo_default", text = "They say location is everything, and this fortress looks very grand perched on its bluffs. But it's a long way from proper civilization, every supply has to walk here, and that was an unfortunate oversight on our part." },
      },
      choices = {
        { text = "Who chose this place?", next = "location_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    location_why = {
      lines = {
        { id = "lw_default", text = "Danitha, because of Garek, and because nobody else wanted it. I grumbled at the time, but I'd rather be hungry somewhere that's ours than well fed somewhere we're watched." },
      },
      choices = {
        { text = "Does the Undercity send you nothing?", next = "undercity" },
        { text = "Something else.", next = "BACK" },
      },
    },
    undercity = {
      big = true,
      lines = {
        { id = "uc_default", text = "Not a nail. Some in the Undercity would be glad to see this place fall down around us, and the rest have the Scourge and the Crusade to worry about before they think of a few paladins on a hill." },
      },
      choices = {
        { text = "We should earn our keep before asking for anything.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Dark Lady owes you more than this.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    needs = {
      lines = {
        { id = "ne_default", text = "Lumber, nails, cloth, and paladins who don't mind carrying them. The Undercity sends us nothing, so what we have, we scavenge, and Shadowvale's cellars are the nearest place left with anything worth taking." },
      },
      choices = {
        { text = "Isn't Shadowvale where the Tarnished are?", next = "shadowvale" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shadowvale = {
      lines = {
        { id = "sv_default", text = "It is, and something's stirring in the cellars below them besides, which Hilda the Breaker doesn't like one bit. Go armed and go in daylight, though I suppose daylight matters less to us than it used to." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cellar = {
      lines = {
        { id = "ce_default", text = "Old stores, mostly, and whatever the villagers hid when the plague came. Take what's sound and leave the rest, because I don't want anything in my stores that's been chewing on bones." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    monsters = {
      big = true,
      lines = {
        { id = "mo_default", text = "The living look at us and see the Scourge, and too many Forsaken look at a paladin and see the men who burned them. Between the two, we're trying to prove we can be neither, and some days I wonder if anyone's watching." },
      },
      choices = {
        { text = "Then we'll show them otherwise, Jorin.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "We are monsters now. Best to own it.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsoldier = {
      lines = {
        { id = "xs_default", text = "Then you know how it went: the generals got the glory, and the clerks got the blame when the bread ran short. I'm still the clerk, only now the bread is lumber." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "Their dead carry better kit than ours, which I hate to admit. Angus, our smith, has been beating their plate into something we can use." } },
    _none = { { id = "tp_none", text = "If it isn't in my ledger, I don't know about it, and it isn't in my ledger." } },
  },
}

P:NPC {
  key = "ephram", id = TODO_NPC("Ephram Barbaro"), name = "Ephram Barbaro",
  bible = "bibles/bandarion_keep.md", role = "stablemaster", tier = "quest",
  communities = { "bandarion_keep" }, temper = { "gruff", "blunt" }, values = { "practical", "loyal" },
  notices = { "pet", "mount" },
  impression = {
    first = "Ephram Barbaro keeps the stables at Bandarion Keep and greets everyone with an \"Oi\". He has no patience for scholars, and nothing makes him happier than a hammer and something that deserves it.",
    third = "{name} met Ephram Barbaro, the gruff stable master of Bandarion Keep, who believes most problems can be solved with a hammer.",
  },

  greetings = {
    { id = "g_default", text = "Oi, what do you want?" },
    { id = "g_back", when = { metBefore = true }, text = "Oi, you again. Horses are fine, before you ask." },
    { id = "g_active", when = { questActive = TODO_QUEST("The One That Got Away") }, text = "Did you find the damned thing yet? No? Then why are you standing here?" },
    { id = "g_done", when = { questDone = TODO_QUEST("The One That Got Away") }, text = "Oi, it's my favourite crystal-hunter. Got anything else that needs smashing?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep your {pet} away from my chargers. They're dead, but they still kick, and they've no sense of humour about it." },
    { id = "n_mount", cat = "mount", when = { mounted = true },
      text = "Get down off that beast before you talk to me. It's rude, and besides, my chargers are watching." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Oi, what do you want? If it's a horse, they're out back, and if it's conversation, you've come to the wrong stable." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The One That Got Away"), race = "Scourge", minLevel = 7 },
          text = "Oi, you! Word travels quickly in our ranks, and I heard about your work with those cultists by the old battlefield. Trouble is, one of them got away, and I've a job for you." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The One That Got Away") },
          text = "The cultist's gone to ground beneath Shadowvale, that's our best guess, and the crystal fragment he took still has some juice in it, and it's either raising the dead down there or making them stronger, and you don't want either one." },
        { id = "h_ready", tags = { "news" }, when = { questReady = TODO_QUEST("The One That Got Away") },
          text = "Well done, and quick, too! Hand it over, because now comes my favourite part." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The One That Got Away"), days = 3 } },
          text = "Smashed it to powder with my best hammer, I did, and it's the most fun I've had since I died. The chargers didn't even flinch." },
        { id = "h_hilda", when = { questDone = TODO_QUEST("As Above, So Below") },
          text = "Hilda's got you fetching glowing bones so she can study them. Study! I'd put a hammer through the lot, and so would you, if you had any sense." },
      },
      again = {
        { id = "h_again", text = "Well? Spit it out, I've stalls to muck." },
        { id = "h_again2", text = "Anything else, or can I get back to the horses?" },
      },
      choices = {
        { text = "What's this about a crystal?", next = "crystal" },
        { text = "Tell me about your horses.", next = "horses" },
        { text = "Why so gruff, Ephram?", next = "gruff" },
        { text = "Do you hold the Light, like the others?", next = "light" },
        { text = "Why smash it with a hammer?", next = "smash", when = { questDone = TODO_QUEST("The One That Got Away") } },
        { text = "I've a way with beasts myself.", next = "xhunt", when = { class = "HUNTER" } },
        { text = "Show me the stables.", next = "BUSINESS" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    crystal = {
      lines = {
        { id = "cr_default", text = "The Cult of the Damned had a focusing crystal out by what's left of the battle with Naxxramas, and somebody broke it, which I approve of. But one of the cultists ran off with a piece, and a piece is plenty, if you know what to do with it." },
      },
      choices = {
        { text = "Why not study it instead?", next = "crystal_study" },
        { text = "Who are these cultists?", next = "cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crystal_study = {
      big = true,
      lines = {
        { id = "cs_default", text = "Study it? You sound like Hilda. Every scholar who ever studied a necromancer's toy ended up working for the necromancer, and I've no wish to watch it happen again." },
      },
      choices = {
        { text = "You're right. Some things just need smashing.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Knowing how it works is how we beat it.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = {
        { id = "cu_default", text = "Living fools who worship the Lich King and dig up graves for him, and they think they're clever. Some of us knelt to that master once without any choice, so you'll forgive me if I don't feel generous toward the ones who chose it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smash = {
      lines = {
        { id = "sm_default", text = "Because a hammer doesn't argue, doesn't listen to whispers, and doesn't care how powerful something is. A hammer's the best tool ever made, and Angus the smith agrees with me, which is the only thing we've ever agreed on." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    horses = {
      lines = {
        { id = "ho_default", text = "They're risen chargers and a warhorse or two, dead as us and twice as stubborn. They remember the old commands, mostly, though they bite now, which they never used to." },
      },
      choices = {
        { text = "Were any of them yours, in life?", next = "horses_life" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horses_life = {
      lines = {
        { id = "hl_default", text = "One was. I kept horses for the soldiers here when this was still Dawn's Watch, and when I woke and walked back up the hill, old Cinder was standing in the yard as if he'd been waiting for me. Don't you dare tell anyone I got sentimental about it." },
      },
      choices = {
        { text = "Your secret's safe, Ephram.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gruff = {
      lines = {
        { id = "gr_default", text = "Because I was a stable hand most of my life and a corpse the rest of it, and neither one taught me manners. Danitha says I'm good for morale, though I think she means I make everyone else look gentle." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    light = {
      lines = {
        { id = "lt_default", text = "Me? I can barely hold a hammer straight, never mind the Light. I look after the horses, the horses carry the paladins, and that's my share of the holy work." },
      },
      choices = {
        { text = "That's a fine share, Ephram.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunt = {
      lines = {
        { id = "xh_default", text = "Then you'll know a dead horse is still a horse: it wants feeding, it wants talking to, and it wants to know who's in charge. Most of the paladins here treat them like furniture, and the horses know it." },
        { id = "xh_pet", when = { pet = { type = "Beast" } }, text = "Then you'll know a dead horse is still a horse, same as your {pet} is still a beast whatever you call it. Most of the paladins here treat them like furniture, and the horses know it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Do I look like a scholar? Ask Hilda; she likes questions, and she likes bones." } },
  },
}

P:NPC {
  key = "bareth", id = TODO_NPC("Bareth Dawnstone"), name = "Bareth Dawnstone",
  bible = "bibles/bandarion_keep.md", role = "questgiver", tier = "quest",
  communities = { "bandarion_keep" }, temper = { "earnest", "fierce" }, values = { "devout", "brave" },
  notices = { "paladin", "race" },
  impression = {
    first = "Bareth Dawnstone is a young Forsaken paladin the Crusade caught on the road to Brill. Even beaten and bound, he talks of the Light as if it were on his side and theirs were the ones who'd lost it.",
    third = "{name} met Bareth Dawnstone, a Forsaken paladin of Bandarion Keep held captive by the Scarlet Crusade at the Crusader's Outpost.",
  },

  greetings = {
    { id = "g_default", text = "Light bless you for finding me." },
    { id = "g_active", when = { questActive = TODO_QUEST("Seeking Refuge") }, text = "Prepare yourself; they'll see us from the road." },
    { id = "g_done", when = { questDone = TODO_QUEST("Seeking Refuge") }, text = "{name}! I owe you my unlife, and I haven't forgotten it." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", race = "Scourge" },
      text = "You're one of us, I can feel it from here. They'd burn you on the same pyre as me, so watch yourself on these stairs." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A living face that isn't wearing red. I'd almost forgotten there were such things." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Light bless you for finding me. I'm Bareth Dawnstone of Bandarion Keep, and these zealots meant to try me for my crimes, which as far as I can tell amount to existing at all." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Seeking Refuge") },
          text = "Stay close; the Crusaders and their farmhands will see me coming from the road and won't wait to ask questions. Brill is east, and Bandarion Keep is up the path past Solliden, if you ever want to visit." },
        { id = "h_done", when = { questDone = TODO_QUEST("Seeking Refuge") },
          text = "Shari Stilwell tells me you saw my word safely to Brill. Our ranks are thin, and you kept them from growing thinner, so whatever brings you back to this cursed tower, the Light go with you." },
        { id = "h_paladin", when = { class = "PALADIN", race = "Scourge" },
          text = "Another of us! Then you know why they hate us most of all: we hold their Light, and they can't bear to see it in our hands." },
      },
      again = {
        { id = "h_again", text = "Ask quickly; the guards change soon." },
        { id = "h_again2", text = "What else? I'd rather talk than listen to them pray outside the door." },
      },
      choices = {
        { text = "Why did the Crusade capture you?", next = "captured" },
        { text = "Where were you headed?", next = "message" },
        { text = "Who are you, Bareth?", next = "self" },
        { text = "Can a dead man really hold the Light?", next = "light", when = { ["not"] = { class = "PALADIN" } } },
        { text = "Are you from the keep? I haven't been there yet.", next = "xpal", when = { class = "PALADIN", race = "Scourge" } },
        { text = "What was the small matter you had to attend to?", next = "matter", when = { questDone = TODO_QUEST("Seeking Refuge") } },
        { text = "Let's get you out of here.", next = "BUSINESS" },
        { text = "Hold on a little longer.", next = "END" },
      },
    },

    captured = {
      big = true,
      lines = {
        { id = "ca_default", text = "I was on the road from Bandarion Keep when they took me. They wield the Light with a hatred in their hearts that makes what's left of my blood seethe, and it goes against everything a paladin is meant to stand for." },
      },
      choices = {
        { text = "They're no paladins. They've forgotten what the Light is for.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hatred serves them well. Maybe we need some too.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "What did they do to you?", next = "captured_what" },
      },
    },
    captured_what = {
      lines = {
        { id = "cw_default", text = "They tested me, as they call it, with holy water and sermons and the Light turned on me until I couldn't stand. When I answered with the Light myself, one of them dropped his torch and ran, and I think that frightened them more than any ghoul ever has." },
      },
      choices = {
        { text = "You frightened them with their own Light.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    message = {
      lines = {
        { id = "me_default", text = "I was headed to Brill, carrying word from the keep to Shari Stilwell. The letter's in some Crusader's pocket now, but I remember every word of it, and I'll deliver it with my own mouth if you'll help me get there." },
      },
      choices = {
        { text = "Who is Shari Stilwell?", next = "shari" },
        { text = "Who leads you at the keep?", next = "danitha" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shari = {
      lines = {
        { id = "sh_default", text = "She trains the newly risen paladins in Brill and sends the ones who're ready up to Bandarion Keep. She has a gentler way about her than the rest of us, and the recruits need it more than they'll admit." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danitha = {
      lines = {
        { id = "da_default", text = "Danitha Morr leads us. She gathered up knights who'd lost their way after death and showed us the Light still answers, even if it burns. Our order is still taking root, and she'd not thank me for getting myself killed on an errand." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    self = {
      lines = {
        { id = "se_default", text = "I'm a paladin now, though the Light hurts to hold. My pain is my strength, or so I tell myself when the Crusaders are listening, and most days it's even true." },
      },
      choices = {
        { text = "What were you before you died?", next = "self_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    self_before = {
      lines = {
        { id = "sb_default", text = "A squire who never took his vows, because the plague came before my knight could hear them. I suppose I'm taking them now, a little late and a good deal colder, and I mean every word." },
      },
      choices = {
        { text = "Vows taken late still count, Bareth.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    light = {
      lines = {
        { id = "lt_default", text = "I can, though it burns every time I call it. They hoped the pain would break me, and instead it's the one thing in this tower that reminds me who I am." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpal = {
      lines = {
        { id = "xp_default", text = "I am, and you should come, once you're able. Follow the path up from Solliden into Bandarion Keep; others like us are stationed there, and you'll find a welcome you won't get in Brill." },
      },
      choices = {
        { text = "I'll go. Let's get you out first.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    matter = {
      lines = {
        { id = "ma_default", text = "Oh, that. One of the farmhands here slipped me water when the others weren't looking, and I wanted to leave something on his doorstep so he'd know the monster he helped was grateful. That's all I'll say, and I'd thank you not to tell the Executor." },
      },
      choices = {
        { text = "That was kind of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "They call themselves the Light's chosen, and they torture prisoners in its name. I've decided the Light will judge them, and I only hope I'm there to see it." } },
    _none = { { id = "tp_none", text = "I don't know, friend, and I'm in no position to find out. Ask me again when I'm not tied to a post." } },
  },
}

P:NPC {
  key = "hilda", id = TODO_NPC("Hilda the Breaker"), name = "Hilda the Breaker",
  bible = "bibles/bandarion_keep.md", role = "trainer", tier = "quest",
  communities = { "bandarion_keep" }, temper = { "gruff", "sharp" }, values = { "stern", "practical" },
  notices = { "class", "kit" },
  impression = {
    first = "Hilda the Breaker trains Bandarion Keep's paladins and won't say how she earned her name. She is hard on everyone, but she seems to mean it as a kindness, because the world outside will be harder.",
    third = "{name} met Hilda the Breaker, the paladin trainer at Bandarion Keep, who reshapes soft recruits into hardened fighters.",
  },

  greetings = {
    { id = "g_default", text = "Why do they call me the Breaker? Trust me, you don't want to know." },
    { id = "g_back", when = { metBefore = true }, text = "Still standing, recruit? Good. Stand straighter." },
    { id = "g_active", when = { questActive = TODO_QUEST("As Above, So Below") }, text = "Bring me glowing bones, recruit, not dull ones and not nice ones, glowing ones." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Scourge", maxLevel = 15 },
      text = "You're dropping your shield every time the Light stings you. Stop it, or the first Crusader you meet will notice before I do." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at the state of that armour. Either you've been fighting well or losing badly, and from here I can't tell which." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Why do they call me \"the Breaker\"? Trust me, recruit, you don't want to know, and the trainees who found out wish they hadn't." },
        { id = "h_paladin", when = { class = "PALADIN", race = "Scourge" },
          text = "Another soft one for the dummies? Good. Stand up straight, because the Light won't respect you any more than I do if you slouch." },
        { id = "h_touring", tags = { "news" }, when = { questActive = TODO_QUEST("Touring the Grounds") },
          text = "Breton's sent you round to gawk at us, has he? Fine, have a good look, and then go and tell Danitha her trainees are hopeless." },
        { id = "h_before", when = { questBefore = TODO_QUEST("As Above, So Below"), race = "Scourge", minLevel = 7 },
          text = "The Tarnished in Shadowvale are a problem, but the cellars under that village worry me more. I'm getting the trainees up to snuff, and you, recruit, are getting what I like to call a crash course." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("As Above, So Below") },
          text = "I need the bones that still hold some of the reanimation magic, which means the glowing ones. Come back with six, or come back on a stretcher so I know you gave it your all." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("As Above, So Below"), days = 3 } },
          text = "Well done, recruit; we might make something of you yet. With those bones we may learn how such a threat festered under our noses for so long." },
        { id = "h_ephram", when = { questDone = TODO_QUEST("The One That Got Away") },
          text = "Ephram smashed that crystal before I could get a look at it. Typical stableman, all hammer and no curiosity." },
      },
      again = {
        { id = "h_again", text = "What now? The dummies won't hit themselves, recruit." },
        { id = "h_again2", text = "Ask, and be quick about it. I've three trainees out there who think a mace is for leaning on." },
      },
      choices = {
        { text = "What do you do here, Hilda?", next = "work" },
        { text = "Why do they call you the Breaker?", next = "breaker" },
        { text = "What's wrong with the cellars under Shadowvale?", next = "cellars" },
        { text = "How are the trainees coming along?", next = "trainees" },
        { text = "Could you train someone who isn't a paladin?", next = "xnonpal", when = { ["not"] = { class = "PALADIN" } } },
        { text = "Please train me.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "I'll let you get back to it.", next = "END" },
      },
    },

    work = {
      big = true,
      lines = {
        { id = "wo_default", text = "A little bit of a lot of things, but mostly I take the soft and weak and reshape them into hardened fighters. It's a tough world, and even our own people mistrust us, so we'd better be tough and self-reliant if we're to fit into this \"Horde\" with the rest of our people." },
      },
      choices = {
        { text = "The Horde are our allies. We'll earn our place among them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We should rely on ourselves and nobody else.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    breaker = {
      lines = {
        { id = "br_default", text = "I told you, you don't want to know. Ask me again after you've survived a month on the dummies." },
      },
      choices = {
        { text = "I've survived worse than dummies. Tell me.", next = "breaker_truth", when = { disposition = { min = 60 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    breaker_truth = {
      lines = {
        { id = "bt_default", text = "Fine. In life I broke warhorses for the Silver Hand's stables, and now I break paladins, which kick less but whine a great deal more. Tell anyone, and you'll find out the other reason." },
      },
      choices = {
        { text = "My lips are sealed, Hilda.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trainees = {
      lines = {
        { id = "tr_default", text = "There are three of them out there on the dummies, and not one could stop a murloc with a door. Give me a season and they'll stop a Crusader, or I'll know the reason why." },
      },
      choices = {
        { text = "You're hard on them.", next = "hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard = {
      lines = {
        { id = "ha_default", text = "I'm hard on them because the Crusade won't be; it'll just be quick. Every bruise they take from me is one they won't take from a zealot's mace, and they'll thank me for it when they're older, or deader." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cellars = {
      lines = {
        { id = "ce_default", text = "Something's been rising beneath Shadowvale, right under the Tarnished's feet, and nobody noticed until the bones started to glow. If we're careless, it'll become a proper Scourge uprising on our doorstep, and I'd rather it didn't." },
      },
      choices = {
        { text = "Why study the bones instead of burning them?", next = "study" },
        { text = "Something else.", next = "BACK" },
      },
    },
    study = {
      big = true,
      lines = {
        { id = "st_default", text = "Because burning tells you nothing, and I want to know how a thing like that went unnoticed for so long. Ephram would sooner smash everything, but Ephram also once tried to shoe a ghoul." },
      },
      choices = {
        { text = "Study them. We beat what we understand.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Ephram's right. Burn them and be done.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnonpal = {
      lines = {
        { id = "xn_default", text = "No; I train paladins, and you're not one. But you can stand over there and watch the trainees fall down, if you want a laugh, and I won't charge you for it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Do I look like a librarian, recruit? Ask Jorin, or better yet, go hit a dummy." } },
  },
}

P:NPC {
  key = "angus", id = TODO_NPC("Angus Hammerhand"), name = "Angus Hammerhand",
  bible = "bibles/bandarion_keep.md", role = "blacksmith", tier = "service",
  communities = { "bandarion_keep" }, temper = { "steady", "dry" }, values = { "craft", "honest" },
  notices = { "kit", "craft" },
  impression = {
    first = "Angus Hammerhand keeps the paladins of Bandarion Keep in chain and shields beaten together from salvage. He's kin to Aramis, and he jokes that his brother got the Light while he got the hammer.",
    third = "{name} met Angus Hammerhand, blacksmith of Bandarion Keep and kin to Aramis Hammerhand of Deathknell.",
  },

  greetings = {
    { id = "g_default", text = "Need something mended, or something new? It's all salvage either way." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Let's see what you've broken this time." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Light's mercy, look at that armour. Give it here before it falls off you on the road." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've a smith's burns on your hands, I see. Good; one more who knows what a hammer's for." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "It's my job to see the paladins of Bandarion Keep properly armed and armoured. It's not much, but it's honest work, and I've a thing or two for sale as well, should you need gear." },
        { id = "h_aramis", when = { heardLine = "aramis.h_default" },
          text = "You've met Aramis down at Deathknell, have you? Then you've met the Hammerhand who got the Light, and now you've met the one who got the hammer." },
      },
      again = {
        { id = "h_again", text = "Anything else? The forge doesn't like waiting." },
        { id = "h_again2", text = "Go on. I can listen and hammer at the same time." },
      },
      choices = {
        { text = "Are you kin to Aramis Hammerhand?", next = "aramis" },
        { text = "What do the paladins need most?", next = "gear" },
        { text = "Any advice for a new paladin?", next = "xpal", when = { class = "PALADIN", race = "Scourge" } },
        { text = "I'd like to see your wares.", next = "BUSINESS" },
        { text = "Keep the forge hot, Angus.", next = "END" },
      },
    },
    aramis = {
      lines = {
        { id = "ar_default", text = "Aye, we're Hammerhands both, and he says the Light and the hammer are the same thing, only one of them burns you on purpose. He trains the newly risen down at Deathknell, and the good ones end up here with me, wanting swords." },
      },
      choices = {
        { text = "He told me the pain is a forge.", next = "forge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge = {
      lines = {
        { id = "fo_default", text = "He would; he's said that since we were boys. Back then he meant our father's forge, and he usually said it while he was nursing a burnt hand." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gear = {
      lines = {
        { id = "ge_default", text = "Chain and shields, mostly, because a Forsaken paladin takes more blows than a living one and doesn't always feel them in time. Jorin rations my iron like it's gold, so most of what they wear is salvage I've beaten back into shape." },
      },
      choices = {
        { text = "Salvage from where?", next = "salvage" },
        { text = "Something else.", next = "BACK" },
      },
    },
    salvage = {
      lines = {
        { id = "sa_default", text = "Old army stores from the cellars, Crusader plate off the dead near Solliden, and whatever Breton drags back from Shadowvale. I don't ask whose it was, and the iron doesn't tell me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpal = {
      lines = {
        { id = "xp_default", text = "Keep your shield up and your mouth shut when Hilda's talking. And bring me your armour before it's in pieces, not after, because I can mend a dent but I can't mend a hole you've been bleeding through." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Can't help you there. If it isn't made of iron, I don't know much about it." } },
  },
}

P:NPC {
  key = "ander", id = TODO_NPC("Ander Solliden"), name = "Ander Solliden",
  bible = "bibles/bandarion_keep.md", role = "soldier", tier = "quest",
  communities = { "bandarion_keep" }, temper = { "quiet", "steady" }, values = { "loyal", "protective" },
  notices = { "origin", "greenness" },
  impression = {
    first = "Ander Solliden walks the road between Bandarion Keep and the old watch tower, a few fields from the farmstead where he grew up. He has put down people he loved there, and he'd rather do it himself than leave it to strangers.",
    third = "{name} met Ander Solliden, a lookout of Bandarion Keep who grew up on the Solliden Farmstead nearby.",
  },

  greetings = {
    { id = "g_default", text = "The road's quiet, for now. It rarely stays that way." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Walk with me a bit, if you like; I've a long way to the tower." },
  },

  notice = {
    { id = "n_farmer", cat = "origin", when = { origin = "forsaken_brill_farmer" },
      text = "You've the hands of someone who worked the soil before all this, the same as me. They never quite lose the shape of a hoe, do they?" },
    { id = "n_green", cat = "greenness", when = { maxLevel = 9, race = "Scourge" },
      text = "Newly risen, are you? If you see a face you know out in the fields, don't stop to talk to it. It won't know you." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "I lived near here in my first life, and I still wander the fields of my childhood farmstead now and then. It saddens me to see the people I knew and loved shambling about as mindless thralls, but that pain gives me strength and purpose." },
        { id = "h_touring", tags = { "news" }, when = { questActive = TODO_QUEST("Touring the Grounds") },
          text = "Breton's sending you round, is he? I'm Ander Solliden, and I walk this road from the ruined tower to the gates and back, and I report to the paladins at the keep." },
      },
      again = {
        { id = "h_again", text = "Anything else? I don't mind; the road is lonely." },
        { id = "h_again2", text = "Go on. Talking keeps me from listening for footsteps." },
      },
      choices = {
        { text = "What dangers do you face out here, Ander?", next = "dangers" },
        { text = "Solliden, like the farmstead?", next = "farm" },
        { text = "Why walk the fields, if it hurts you?", next = "fields" },
        { text = "I farmed near Brill, before.", next = "xfarmer", when = { origin = "forsaken_brill_farmer" } },
        { text = "Keep watch, Ander.", next = "END" },
      },
    },
    dangers = {
      lines = {
        { id = "da_default", text = "Mostly the usual: murloc attacks and the odd skirmish with the Crusade. There are even paladins who can't adjust to being Forsaken, and far too often we have to put down the ones who turn their blades on their brothers." },
      },
      choices = {
        { text = "What's the worst of it?", next = "worst" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      big = true,
      lines = {
        { id = "wo_default", text = "It's when some mindless thrall wanders too close. I can kill murlocs all day, but some of the Scourge I've had to destroy were friends of mine, and some were family, and I'd rather it was me than some passing adventurer, though it still stings." },
      },
      choices = {
        { text = "It's a mercy, Ander. You're giving them rest.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They aren't your family any more. They're just corpses.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm = {
      lines = {
        { id = "fa_default", text = "It's my family's name, and still my family's farm, after a fashion. The Solliden working it now has taken the Crusade's protection, and he'd put a pitchfork through me if he saw me at the fence." },
      },
      choices = {
        { text = "Do you hate him for it?", next = "farm_hate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm_hate = {
      lines = {
        { id = "fh_default", text = "No. He's frightened, and the Crusade told him we're the plague walking, and I can't say they're wrong about the walking part. I just keep to my side of the fence and hope he keeps to his." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fields = {
      lines = {
        { id = "fi_default", text = "Because if I stop, I'll forget them, and they deserve better than that from the one of us who woke up with his wits. Some days I find something of theirs in the furrows, a button or a spoon, and I keep it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfarmer = {
      lines = {
        { id = "xf_default", text = "Then you'll remember how the glades smelled at harvest, before the rot got into everything. I still catch it some mornings, just for a moment, and then the wind changes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "They hold the tower west of my family's fields and pay my kin in protection. I try not to think about what that makes us." } },
    _none = { { id = "tp_none", text = "I wouldn't know. I walk a road and watch the trees; that's about the size of my world now." } },
  },
}

P:NPC {
  key = "billmuth", id = TODO_NPC("Deathguard Billmuth"), name = "Deathguard Billmuth",
  bible = "bibles/bandarion_keep.md", role = "guard", tier = "quest",
  communities = { "bandarion_keep" }, temper = { "nervous", "earnest" }, values = { "loyal", "kind" },
  notices = { "paladin", "light" },
  impression = {
    first = "Deathguard Billmuth fidgets in Bandarion Keep like a man waiting to be burned. He came to the paladins only because the priests turned him away, and he plainly cares about his friend Falgan more than his pride.",
    third = "{name} met Deathguard Billmuth, who came to Bandarion Keep for help when his friend Falgan was lost in Venomweb Vale.",
  },

  greetings = {
    { id = "g_default", text = "Oh! Sorry, I didn't hear you come up." },
    { id = "g_back", when = { metBefore = true }, text = "It's you. Good, I mean, it's good to see someone I know up here." },
    { id = "g_discipline", when = { questActive = TODO_QUEST("Discipline") }, text = "Is that the Executor's rod? I've been doing my rounds, I swear it." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN", race = "Scourge" },
      text = "You're one of them, aren't you? Sorry, I don't mean it like that. I'm still getting used to it, that's all." },
    { id = "n_priest", cat = "light", when = { class = "PRIEST", race = "Scourge" },
      text = "A priest. Your lot sent me away when I asked for help, you know, though I don't suppose it was you personally." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Sorry, I'm a bit on edge. I'm Billmuth, Deathguard out of Brill, and I'll admit this isn't a place I ever thought I'd come asking for help." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Lesson in Divinity"), class = "PALADIN" },
          text = "Did Danitha send you? Then please help my friend Falgan; he's out in Venomweb Vale, and the priests wouldn't even look at me when I asked them." },
        { id = "h_done", when = { questDone = TODO_QUEST("A Lesson in Divinity"), class = "PALADIN" },
          text = "My commander has the Crusade's plans, and they'll get a welcome at Brill they won't forget. I've told every Deathguard who'll listen what you did for Falgan, and a few who wouldn't." },
        { id = "h_discipline", tags = { "news" }, when = { questActive = TODO_QUEST("Discipline") },
          text = "If that's the Executor's motivator in your hand, I'll have you know I'm here on orders. Well, on a request, anyway, and I only stepped on the one twig." },
        { id = "h_nonpal", when = { ["not"] = { class = "PALADIN" } },
          text = "You're not one of the paladins, are you? Good. I mean, it's fine, they've been decent to me; it's only that I'm not used to it yet." },
      },
      again = {
        { id = "h_again", text = "Anything else? Sorry, I keep looking at the stairs." },
        { id = "h_again2", text = "Go on. Talking helps, a bit." },
      },
      choices = {
        { text = "Why are you so nervous?", next = "nervous" },
        { text = "What happened to your friend?", next = "falgan" },
        { text = "What do the Deathguard think of the paladins?", next = "deathguard" },
        { text = "Who was Garek Bandarion to the Deathguard?", next = "garek" },
        { text = "How's the Executor treating you?", next = "zygand", when = { questDone = TODO_QUEST("Discipline") } },
        { text = "I'll help you.", next = "BUSINESS", when = { class = "PALADIN" } },
        { text = "Take care, Billmuth.", next = "END" },
      },
    },
    nervous = {
      lines = {
        { id = "ne_default", text = "Because I'm a Deathguard in a keep full of paladins, and the last time I stood this close to so many of them, they were alive and trying to burn me. It's not their fault, I know that, but my legs don't." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    falgan = {
      lines = {
        { id = "fa_default", text = "We were scouting the Crusade in Venomweb Vale and got close enough to hear their orders, something about an attack on Brill. Then I stepped on a twig, and Falgan yelled at me to run, so I ran, and I was halfway to Brill before I noticed he wasn't behind me." },
      },
      choices = {
        { text = "That wasn't your fault.", next = "falgan_fault" },
        { text = "Why come to the paladins?", next = "priests" },
        { text = "Something else.", next = "BACK" },
      },
    },
    falgan_fault = {
      lines = {
        { id = "ff_default", text = "It was my twig, wasn't it? He'd have done the same for anyone, the brave idiot, and I keep thinking about how I'd have told his commander." },
        { id = "ff_done", when = { questDone = TODO_QUEST("A Lesson in Divinity"), class = "PALADIN" },
          text = "It was my twig, but you brought him back, and he stood up as if he'd only been napping. He said he hadn't seen a Symbol of Life since before the war, and neither had I." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priests = {
      big = true,
      lines = {
        { id = "pr_default", text = "The priests waved me off like a beggar and said it wasn't their concern. Maybe it wasn't, but it was the paladins who listened, and I won't forget that, though I'm not proud of having to ask." },
      },
      choices = {
        { text = "The priests had their orders. Don't hold it against them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "They failed you. Tell your commander so.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    deathguard = {
      big = true,
      lines = {
        { id = "dg_default", text = "Most of them don't trust paladins, and I didn't either, not after what the living did to us in the Light's name. But I'll tell every one of them what Danitha's people did for Falgan, and some might even listen." },
      },
      choices = {
        { text = "The Forsaken should welcome them. They've earned it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Caution is wise. The Light burned us once.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    garek = {
      lines = {
        { id = "ga_default", text = "Captain Bandarion was the first captain of the Deathguard, and he was a paladin too, which most of the lads forget when they're grumbling about this place. He died fighting Naxxramas so the Undercity could stand." },
      },
      choices = {
        { text = "Then the Deathguard owe paladins more than they admit.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zygand = {
      lines = {
        { id = "zy_default", text = "He keeps a ledger with names in it, and a rod that makes you thank him for the pain, and I'm told I'm in the ledger twice. I suppose that's why he didn't mind sending me all the way out here." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "They mean to burn Brill, zeppelin tower and all. I heard it with my own ears, right before the twig." } },
    _none = { { id = "tp_none", text = "Sorry, I wouldn't know. I'm just a Deathguard; they don't tell us much." } },
  },
}

P:NPC {
  key = "evin", id = TODO_NPC("Evin Schmidtt"), name = "Evin Schmidtt",
  bible = "bibles/bandarion_keep.md", role = "worker", tier = "service",
  communities = { "bandarion_keep" }, temper = { "fussy", "warm" }, values = { "careful", "dutiful" },
  notices = { "greenness" },
  impression = {
    first = "Evin Schmidtt calls himself the keeper of Bandarion Keep, and he knows every key, door and loose stair in the place. He seems to love the old fortress as some men love a difficult horse.",
    third = "{name} met Evin Schmidtt, keeper of Bandarion Keep, who knows the old fortress and its history better than anyone there.",
  },

  greetings = {
    { id = "g_default", text = "Mind the north stairs; they're older than I am, and I'm dead." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Wipe your boots, if you would; I've just swept." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 10, race = "Scourge" },
      text = "First time in the keep? Don't lean on the battlements on the west side, because they lean back, and it's a long way down." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true,
          text = "Evin Schmidtt, keeper of Bandarion Keep, which means I count the rooms, mend the doors, and chase the murlocs out of the cistern. It's a grand old place, if you don't look at it too closely." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a door that's come off its hinges again." },
        { id = "h_again2", text = "Go on. I know every stone of this place, so ask away." },
      },
      choices = {
        { text = "How old is this keep?", next = "history" },
        { text = "What does a keeper do, exactly?", next = "keeper" },
        { text = "Who's the man with the dog?", next = "relreo" },
        { text = "Do many outsiders come here?", next = "xvisitor", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'll let you get on.", next = "END" },
      },
    },
    history = {
      lines = {
        { id = "hi_default", text = "Lordaeron's army built it on Northface Rock and called it Dawn's Watch, and after the fall the Argent Dawn held it against the Crushridge ogres. It was Garek Bandarion and a dark ranger who broke that siege, and Danitha says that's when the Dawn first agreed to fight beside the Forsaken." },
      },
      choices = {
        { text = "And then the Argent Dawn left?", next = "history2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history2 = {
      lines = {
        { id = "h2_default", text = "They went east to the Plaguelands, and the place fell to weeds and Vile Fins until we came. I found murloc spawn in the old barracks, if you can believe it, and I'm still finding it in places I'd rather not mention." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    keeper = {
      lines = {
        { id = "ke_default", text = "Danitha gave me the title because nobody else wanted it, and because I'm the only one who remembers where every key goes. I was a groundskeeper in life, not a knight, but the Light found me anyway, and I'm not one to argue with it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    relreo = {
      lines = {
        { id = "re_default", text = "That's Relreo Emberlight, who keeps a cottage out in the Whispering Forest and walks up now and then with his dog, Max. Max is the only one here who's glad to see everybody, and I've come to think he's the best of us." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xvisitor = {
      lines = {
        { id = "xv_default", text = "Fewer than murlocs, and the murlocs are better at climbing the walls. You're welcome, though; just keep to the paths, and don't feed the horses whatever Ephram tells you they like." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. If it isn't a door, a stair or a leaking roof in this keep, it's beyond me." } },
  },
}
