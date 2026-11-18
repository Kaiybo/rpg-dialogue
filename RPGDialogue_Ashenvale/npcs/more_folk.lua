-- Ashenvale, folk we had missed: Gurda Ragescar (the lost shredder manual, near Splintertree), Yama
-- Snowhoof (Freedom to Ruul), Burkrum (Splintertree's armorer), Illiyana Moonblaze and Sentinel Farsong
-- (Silverwing Grove, Warsong Gulch), and Astranaar's Dalria (trade goods) and Nantar (baker). Classic only.
-- Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Gurda Ragescar
---------------------------------------------------------------------------
P:NPC {
  key = "gurda", id = TODO_NPC("Gurda Ragescar"), name = "Gurda Ragescar",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "female",
  communities = { "splintertree" }, temper = { "blunt", "anxious" }, values = { "dutiful", "practical" },
  notices = { "class", "race" },

  impression = {
    first = "She fears her overseer far more than anything in Ashenvale.",
    third = "{name} met Gurda Ragescar, an orc near Splintertree Post who lost the pages of her shredder's manual to the wind.",
  },

  greetings = {
    { id = "g_hello", text = "You! Have you seen any loose pages blowing about? Paper, with pictures of gears on it?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Tell me you've found more pages, because the Lumber Camp is going to have my hide." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Lost Pages") }, text = "Any pages yet? Every hour I sit here is an hour I'm not on duty." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Lost Pages") }, text = "The shredder runs! Mostly. Thanks to you, I can get back to work." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll. Your people dealt with the goblins in Ratchet, didn't they? The one who sold me this talked so fast I caught every third word." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Good, you'll understand: I was trained to swing an axe, not to read about one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Gurda Ragescar. I picked up a shredder from Ratchet for the Warsong Lumber Camp, where I'm supposed to be on duty, and they gave me a manual for it. On the way back, a gust of wind tore it out of my hands, and all I've got left is the cover." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Lost Pages") },
          text = "Twelve pages, three chapters. They could be anywhere by now, and the folk of this forest have been picking them up, I'd wager, so check what you take off them." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Lost Pages") },
          text = "Reading isn't my strong point, but I got through all three chapters with my finger on the words. Now I can get back to work, thanks to you." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere until those pages turn up." },
        { id = "h_again2", text = "Go on, ask. It passes the time." },
      },
      choices = {
        { text = "What's a shredder?", next = "shredder" },
        { text = "Where might the pages have gone?", next = "pages" },
        { text = "Can't you run the thing without a manual?", next = "manual" },
        { text = "You seem more scared of your overseer than the elves.", next = "overseer" },
        { text = "I'll keep an eye out.", next = "END" },
      },
    },

    shredder = {
      lines = { { id = "sh_default", text = "A goblin machine, all saws and steam, with a seat on top for the one who drives it. One shredder does the work of ten peons in the timber, and the Warchief needs timber for Orgrimmar faster than peons can cut it." } },
      choices = {
        { text = "The elves won't like that.", next = "elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      lines = { { id = "el_default", text = "They don't, and they let us know it with arrows. But Orgrimmar has to be built and the Barrens has no trees worth the name, so we cut here, and we keep our axes close." } },
      choices = {
        { text = "The Horde needs timber. That's that.", next = "BACK", reply = "That's what the overseers say. I just drive the machine.", fx = { align = { light = -1 } } },
        { text = "This forest was here first. Cut gently.", next = "BACK", reply = "Gently? It's a shredder. But I'll not cut more than I'm told, I promise you that.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    pages = {
      lines = { { id = "pa_default", text = "Everywhere. The wind took them north and south, and I reckon every creature in Ashenvale that walks on two legs has picked one up by now, the satyrs and the furbolgs and the elementals too, somehow. Take them off whatever you fight." } },
      choices = {
        { text = "Twelve pages is a lot to find.", next = "pages2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pages2 = {
      lines = { { id = "p2_default", text = "Four to a chapter, and I need all three chapters. The first tells you how to start it, the second how to steer it, and the third, I think, how to stop it, which is the one I really want." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    manual = {
      lines = { { id = "ma_default", text = "I tried, once, at the top of the hill, and it went one way and I went the other. The goblin in Ratchet said the third chapter's very important, and after that I believed him." } },
      choices = { { text = "Fair. Something else.", next = "BACK" } },
    },

    overseer = {
      lines = { { id = "ov_default", text = "The elves shoot at you from the trees, sure, but the overseer at the Lumber Camp will look at you and sigh, and then everyone knows you lost the manual. I'd rather face a Sentinel." } },
      choices = {
        { text = "Pride is worth protecting.", next = "BACK", reply = "It is! See, you understand. So find those pages before anyone hears.", fx = { align = { honor = 1 } } },
        { text = "Just tell him. Honesty's quicker.", next = "BACK", reply = "Quicker, yes, and then I'd be the orc who lost the manual for the rest of my days. No thank you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm supposed to be at the Warsong Lumber Camp, driving a shredder. Instead I'm sitting here waiting for paper." } },
    warsong = { { id = "tp_warsong", text = "The Warsong cut timber for Orgrimmar. It's hard work, and the elves make it harder." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins in Ratchet sold me the shredder. They talk fast and they don't refund." } },
    _none = { { id = "tp_none", text = "Don't ask me, I can barely read a manual. Ask somebody at Splintertree." } },
  },
}

---------------------------------------------------------------------------
-- Yama Snowhoof
---------------------------------------------------------------------------
P:NPC {
  key = "yama", id = TODO_NPC("Yama Snowhoof"), name = "Yama Snowhoof",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "female",
  communities = { "splintertree" }, temper = { "gentle", "anxious" }, values = { "family", "kind" },
  notices = { "class", "race" },

  impression = {
    first = "She is calm about her missing brother, and worried underneath it.",
    third = "{name} met Yama Snowhoof at Splintertree Post, who waited for news of her brother Ruul.",
  },

  greetings = {
    { id = "g_hello", text = "Have you seen my brother Ruul? He walked into the forest days ago and has not returned." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. Is there any word of Ruul?" },
    { id = "g_done", when = { questDone = TODO_QUEST("Freedom to Ruul") }, text = "My brother is safe because of you. The Earth Mother watched over you both, I think." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, like my brother. Then you know how the bear's shape can carry you far from home without your noticing." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the herd, so far from Mulgore. It does my heart good to see you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Yama Snowhoof. My brother Ruul is a druid, and he walked into the forest to commune with it, as he often does, and he has not come back. I fear the Thistlefur furbolgs to the north, because they have turned cruel." },
        { id = "h_done", when = { questDone = TODO_QUEST("Freedom to Ruul") },
          text = "You found my brother. The Thistlefur captured him, thinking he was a bear, and starved him, which is terrible to hear, though many furbolgs are noble creatures. Thank you for bringing him out; he will likely sleep a long while after this." },
      },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Ask, friend. Talking helps me wait." },
      },
      choices = {
        { text = "Tell me about Ruul.", next = "ruul" },
        { text = "Who are the Thistlefur?", next = "thistlefur" },
        { text = "Why are you at Splintertree?", next = "why" },
        { text = "How is Ruul now?", next = "after", when = { questDone = TODO_QUEST("Freedom to Ruul") } },
        { text = "I'll watch for him.", next = "END" },
      },
    },

    ruul = {
      lines = { { id = "ru_default", text = "He is gentle and stubborn, and he has always loved the wild places more than towns. When he wears the bear's shape, he forgets the hours, and I've learned not to worry until days have passed." } },
      choices = {
        { text = "Days have passed now.", next = "ruul2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruul2 = {
      lines = { { id = "r2_default", text = "They have. If you go north toward Thistlefur Village, look for a bear who does not fight like the others. If he is held there, he will need someone to guard him on the way out, because he will be weak." } },
      choices = {
        { text = "I'll bring him home. You have my word.", next = "BACK", reply = "Thank you. The Earth Mother hears such promises, and so do I.", fx = { align = { honor = 1 } } },
        { text = "I'll look, but I promise nothing.", next = "BACK", reply = "That is honest, and I'll take honesty over a broken promise. Walk carefully.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    thistlefur = {
      lines = { { id = "th_default", text = "Furbolgs, a bear-like people who were wise once and friends of the forest. Many furbolgs are still noble, but the Thistlefur are corrupt, and they attack anyone near their village and their hold." } },
      choices = {
        { text = "What corrupted them?", next = "corrupt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    corrupt = {
      lines = { { id = "co_default", text = "I do not know. Ruul believed something dark is creeping through this forest from the north, and that the furbolgs breathed it in first. He went to listen to the land and learn more, and I think the land did not want him to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      lines = { { id = "wh_default", text = "Ruul came to Ashenvale to study the forest, and I came because someone had to keep him fed. The orcs here are rough, but they have been kind to me, in their way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    after = {
      lines = { { id = "af_default", text = "Sleeping, still, and eating when he wakes. He says the Thistlefur did not know what they were doing, and he does not blame them, which is very like him and makes me want to blame them twice as much." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep house for my brother Ruul at Splintertree while he wanders the forest." } },
    furbolgs = { { id = "tp_furbolgs", text = "Many furbolgs are noble creatures. The Thistlefur have lost their way." } },
    _none = { { id = "tp_none", text = "I don't know, friend. Perhaps the wind knows; I only know my brother." } },
  },
}

---------------------------------------------------------------------------
-- Burkrum
---------------------------------------------------------------------------
P:NPC {
  key = "burkrum", id = TODO_NPC("Burkrum"), name = "Burkrum", title = "Heavy Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "splintertree" }, temper = { "calm", "steady" }, values = { "practical", "protective" },
  notices = { "class", "kit" },

  impression = {
    first = "He would rather the arrows bounced off his customers.",
    third = "{name} met Burkrum, the tauren armor merchant of Splintertree Post.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome, friend. Heavy armor, for heavy work. The trees here are full of arrows." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and still whole. The Earth Mother is kind, and so is good mail." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. You'll want the thickest mail I have, and a helm, for the Sentinels aim high." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor has fought many battles, and lost a few. Let me see what can be done." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Burkrum, and I sell heavy armor to those who guard Splintertree and the Lumber Camp. The night elves strike from the trees without warning, and good mail is what lets you live long enough to strike back." },
      },
      again = {
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Speak, there is no hurry." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "A tauren selling armor at an orc outpost?", next = "tauren" },
        { text = "What do the night elves fight with?", next = "elves" },
        { text = "Good day.", next = "END" },
      },
    },

    tauren = {
      lines = { { id = "ta_default", text = "The Horde is one people now, and Thrall's warriors need armor as much as any herd needs shelter. I came to help my allies, though I confess I'll be glad to see the plains of Mulgore again." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    elves = {
      lines = { { id = "el_default", text = "Bows and glaives, and patience. They wait in the branches for hours and strike when you've forgotten them. Plate on your shoulders and a helm on your head are worth more than any blade here." } },
      choices = {
        { text = "Then we should burn their trees.", next = "BACK", reply = "The Earth Mother would weep at that, friend. Buy a helm instead.", fx = { align = { light = -1 } } },
        { text = "They defend their home. I'd do the same.", next = "BACK", reply = "So would I. That is why this war grieves me, and why I sell good armor.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell heavy armor at Splintertree. The orcs buy a great deal of it." } },
    _none = { { id = "tp_none", text = "I do not know, friend. Ask the wind; it travels further than I do." } },
  },
}

---------------------------------------------------------------------------
-- Illiyana Moonblaze
---------------------------------------------------------------------------
P:NPC {
  key = "moonblaze", id = TODO_NPC("Illiyana Moonblaze"), name = "Illiyana Moonblaze", title = "Silverwing Supply Officer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "quest", gender = "female",
  temper = { "wry", "bold" }, values = { "loyal", "practical" },
  notices = { "class", "race" },

  impression = {
    first = "More fun than any Sentinel I've met, and possibly more dangerous.",
    third = "{name} met Illiyana Moonblaze, the Silverwing Sentinels' supply officer at Silverwing Grove.",
  },

  greetings = {
    { id = "g_hello", text = "Another volunteer for the Gulch. Brave, or just bored?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. The Gulch hasn't had you yet." },
    { id = "g_done", when = { questDone = TODO_QUEST("Sentinel Basic Care Package") }, text = "Did you enjoy the care package? I packed it myself, mostly." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. I can always tell; you look at the supply crates the same way I do." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf in the Silverwing ranks. The Sentinels don't quite know what to make of you, do they? Good." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Illiyana Moonblaze, supply officer for the Silverwing Sentinels. I keep the stores full for those who fight in Warsong Gulch, and those who fight well get the better stores." },
      },
      again = {
        { id = "h_again", text = "What else? I've crates to count, or not count." },
        { id = "h_again2", text = "Go on. The Gulch will wait." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What's in a care package?", next = "package" },
        { text = "You're not a Sentinel, are you?", next = "sentinel" },
        { text = "What's Warsong Gulch?", next = "gulch" },
        { text = "Farewell.", next = "END" },
      },
    },

    package = {
      lines = { { id = "pa_default", text = "Bandages, food, potions, and whatever else I can find that a fighter in the Gulch will thank me for. Prove you've fought there and I'll hand you one, and the more you've fought, the better the package." } },
      choices = {
        { text = "How do I prove it?", next = "prove" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prove = {
      lines = { { id = "pr_default", text = "Bring me the marks the commanders hand out for honor in the Gulch. Sentinel Farsong cares about talismans and decrees; I care about whether you came back with a mark and all your fingers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    sentinel = {
      lines = { { id = "se_default", text = "Sharp of you. I belong to a group that isn't exactly loved by most Sentinels, but Silverwing needs supplies more than it needs propriety, so here I am. They keep their glaives polished; I keep their stores full." } },
      choices = {
        { text = "What group?", next = "group" },
        { text = "Something else.", next = "BACK" },
      },
    },
    group = {
      lines = { { id = "gr_default", text = "One that doesn't like questions. Let's say we're less fond of rules and more fond of getting things done, and leave it at that." } },
      choices = {
        { text = "Rules exist for a reason. Mind them.", next = "BACK", reply = "Spoken like a Sentinel. I'll mind them when they start winning battles.", fx = { align = { order = 1 } } },
        { text = "Results matter more than rules.", next = "BACK", reply = "Ha! You and I will get along, I think.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gulch = {
      lines = { { id = "gu_default", text = "A valley south of here where the Warsong orcs come to cut our trees and the Silverwing Sentinels go to stop them. It's a long fight over two flags and a great deal of timber, and it doesn't look like ending soon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the Silverwing stores full. How I do that is my own affair." } },
    warsong = { { id = "tp_warsong", text = "The Warsong orcs cut our trees in the Gulch. We cut them back." } },
    _none = { { id = "tp_none", text = "I don't know, and I don't care, as long as it's not in my crates." } },
  },
}

---------------------------------------------------------------------------
-- Sentinel Farsong
---------------------------------------------------------------------------
P:NPC {
  key = "farsong", id = TODO_NPC("Sentinel Farsong"), name = "Sentinel Farsong",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest", gender = "female",
  temper = { "proud", "fierce" }, values = { "dutiful", "protective" },
  notices = { "class", "race" },

  impression = {
    first = "She rewards courage gladly and cowardice not at all.",
    third = "{name} met Sentinel Farsong at Silverwing Grove, who sends fighters into Warsong Gulch.",
  },

  greetings = {
    { id = "g_hello", text = "Beyond this tunnel is a field of strife. Are you here to fight in it?" },
    { id = "g_back", when = { metBefore = true }, text = "You return. Bring me talismans, not tales." },
    { id = "g_done", when = { questDone = TODO_QUEST("Vanquish the Invaders!") }, text = "Your exploits in Warsong Gulch ring through Ashenvale. Well done." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. The Gulch needs those who will stand at the flag and not move." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human, fighting for our forest. I'm grateful, though I'm not sure your people understand what we lose with each tree." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Sentinel Farsong of the Silverwing Sentinels. The Horde continue to decimate our sacred forest, cutting down the evergreens to power their machines of war. Enter Warsong Gulch, defend Silverwing Hold, and push the invaders back." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Vanquish the Invaders!") },
          text = "Win a mark of honor in the Gulch and earn a talisman of merit. Bring me the talisman, and I shall reward you." },
        { id = "h_done", when = { questDone = TODO_QUEST("Vanquish the Invaders!") },
          text = "You have proven your value to our efforts in Warsong Gulch. Bring me more talismans of merit, and you will earn even more of our trust." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick." },
        { id = "h_again2", text = "Speak, then return to the fight." },
      },
      choices = {
        { text = "Who are the Silverwing Sentinels?", next = "silverwing" },
        { text = "What happens in the Gulch?", next = "gulch" },
        { text = "What are talismans of merit?", next = "talismans" },
        { text = "It's only trees, Sentinel.", next = "trees" },
        { text = "I'll go to the Gulch.", next = "END" },
      },
    },

    silverwing = {
      lines = { { id = "si_default", text = "The Sentinels sworn to hold Silverwing Grove and the Gulch beyond it against the Warsong. We are fewer than they are, and we have held for this long only because we refuse to stop." } },
      choices = {
        { text = "The Warsong Outriders are a hard enemy.", next = "outriders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    outriders = {
      lines = { { id = "ou_default", text = "They are. They ride wolves and they cut fast, and they're led by orcs who remember Grom Hellscream as a hero. I remember him as the one who slew Cenarius." } },
      choices = {
        { text = "Their hero, our tragedy. The war goes on.", next = "BACK", reply = "It does, and it will until one of us stops. It won't be us.", fx = { align = { honor = 1 } } },
        { text = "Grom freed them in the end. Maybe they've changed.", next = "BACK", reply = "Changed? Their axes haven't. Go and see in the Gulch if you don't believe me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gulch = {
      lines = { { id = "gu_default", text = "The orcs come for the timber, and we come to stop them, and both sides fight over each other's banners. Steal theirs, protect ours, and the day is won. Fail, and more trees fall." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    talismans = {
      lines = { { id = "ta_default", text = "A token from the Silverwing commanders, given to those who fight with honor in the Gulch. Bring them to me and I will see your name known and your service rewarded." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    trees = {
      lines = { { id = "tr_default", text = "Only trees. Some of them were old when the Well of Eternity still stood, and the Warsong feed them to their saws without a thought. Say that again, outlander, and say it somewhere I can't hear you." } },
      choices = {
        { text = "I spoke carelessly. Forgive me.", next = "BACK", reply = "Forgiven. Go and fight for them, and I'll forget you said it.", fx = { align = { light = 1 } } },
        { text = "I meant it. People matter more.", next = "BACK", reply = "Then go and protect the people. The trees will die regardless, I suppose.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I hold the tunnel at Silverwing Grove and send fighters into Warsong Gulch." } },
    warsong = { { id = "tp_warsong", text = "The Warsong cut our forest for their war. We stop them in the Gulch." } },
    sentinels = { { id = "tp_sentinels", text = "The Silverwing Sentinels hold this grove and the Gulch beyond it. We do not yield." } },
    _none = { { id = "tp_none", text = "I don't know, and the Gulch doesn't care. Bring me a talisman." } },
  },
}

---------------------------------------------------------------------------
-- Dalria
---------------------------------------------------------------------------
P:NPC {
  key = "dalria", id = TODO_NPC("Dalria"), name = "Dalria", title = "Trade Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "astranaar" }, temper = { "brisk", "wry" }, values = { "trade", "practical" },
  notices = { "craft", "race" },

  impression = {
    first = "She keeps rare formulas behind the counter for those who ask nicely.",
    third = "{name} met Dalria, the trade goods merchant of Astranaar.",
  },

  greetings = {
    { id = "g_hello", text = "Thread, flux, salt, and a few things you won't find elsewhere. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? You must be making something." },
    { id = "g_enchant", when = { profession = "Enchanting" }, text = "An enchanter! I may have something for you, if you'll look past the thread." },
  },

  notice = {
    { id = "n_enchant", cat = "craft", when = { profession = "Enchanting" },
      text = "You've dust on your sleeves, the shimmering kind. I've two formulas you'll want, though I only have a few copies." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome. I've had a few of your people through, asking for gears. I don't sell gears." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Dalria, and I sell trade goods to the crafters of Astranaar and anyone else passing through. Thread, flux and dye mostly, and now and then something rarer." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else can I find you?" },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Something rarer?", next = "rare" },
        { text = "How's trade in Astranaar?", next = "trade" },
        { text = "Good day.", next = "END" },
      },
    },

    rare = {
      lines = { { id = "ra_default", text = "A couple of enchanting formulas, for the bracer and the cloak, that an old enchanter left with me. I keep only a few copies, and when they're gone, they're gone." } },
      choices = {
        { text = "Why not copy more?", next = "copy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    copy = {
      lines = { { id = "co_default", text = "Because the enchanter made me promise not to, and I keep my promises, mostly. Besides, rare things sell better, and I'm not a fool." } },
      choices = {
        { text = "A promise is a promise. Good.", next = "BACK", reply = "It is. And a good price is a good price, too.", fx = { align = { honor = 1 } } },
        { text = "Knowledge should be shared freely.", next = "BACK", reply = "Then go and share yours, and I'll keep selling mine.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    trade = {
      lines = { { id = "tr_default", text = "Good, and getting worse. The Horde at Splintertree cut the eastern roads, and the caravans from Auberdine come less often. Raene and her Sentinels keep the town safe, but they can't keep the roads open." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell trade goods in Astranaar. Rare things, too, if you ask." } },
    _none = { { id = "tp_none", text = "I don't know. Ask me about thread and I'll do better." } },
  },
}

---------------------------------------------------------------------------
-- Nantar
---------------------------------------------------------------------------
P:NPC {
  key = "nantar", id = TODO_NPC("Nantar"), name = "Nantar", title = "Baker",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "astranaar" }, temper = { "warm", "steady" }, values = { "hospitality", "community" },
  notices = { "race", "weary" },

  impression = {
    first = "He measures the town's spirits by how much bread it eats.",
    third = "{name} met Nantar, Astranaar's baker.",
  },

  greetings = {
    { id = "g_hello", text = "Bread, fresh this morning, and water from the lake. Take what you need." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back, friend. The bread's still warm." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { resting = true },
      text = "You look as though you've walked all the way from Darkshore. Sit, eat, and then go and see Kimlya about a bed." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I've a dark bread that your people seem to like. It's heavy enough to stop an arrow." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Nantar, and I bake for Astranaar. The Sentinels, the travelers, Raene's wolves, if they could get at it; everyone eats bread." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend?" },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Let me see your bread.", next = "BUSINESS" },
        { text = "How is Astranaar faring?", next = "faring" },
        { text = "Who eats the most bread?", next = "most" },
        { text = "Good day.", next = "END" },
      },
    },

    faring = {
      lines = { { id = "fa_default", text = "Bravely. The Horde press from the east and the Thistlefur from the north, and the satyrs lurk in the woods, and still the town stands. I bake more every week, because the Sentinels come back hungrier every week." } },
      choices = {
        { text = "The town will hold. I'm sure of it.", next = "BACK", reply = "I hope so, friend. I've no wish to bake anywhere else.", fx = { align = { light = 1 } } },
        { text = "It won't hold forever. Prepare.", next = "BACK", reply = "Perhaps not. But I'll bake until it doesn't.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    most = {
      lines = { { id = "mo_default", text = "Raene Wolfrunner, though she'd deny it. She eats standing up, with a map in one hand and my bread in the other, and never notices what she's eating." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I bake bread in Astranaar. It's simple, and it's needed." } },
    _none = { { id = "tp_none", text = "I don't know, friend. Bread, I know." } },
  },
}
