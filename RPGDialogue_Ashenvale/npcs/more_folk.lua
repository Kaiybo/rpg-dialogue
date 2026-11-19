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
    { id = "n_eng", cat = "class", when = { profession = "Engineering" },
      text = "Is that grease under your nails? Tell me you know machines, because this one has been looking at me for two days and I swear it knows I can't drive it." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll. Your people dealt with the goblins in Ratchet, didn't they? The one who sold me this talked so fast I caught every third word." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Good, you'll understand: I was trained to swing an axe, not to read about one." },
  },

  start = "hello",
  nodes = {
    goblin = {
      lines = { { id = "go_default", text = "He did, and from a long way off. He walked me twice around the shredder, talking the whole time, and when I asked how it worked he slapped the manual in my hand and said every answer was in there. Then he counted the gold before I'd finished counting it myself." } },
      choices = {
        { text = "Whose gold was it?", next = "goblin2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblin2 = {
      lines = { { id = "go2_default", text = "The camp's, every coin, signed out to me by name because I was the one who said I could manage a simple errand. That is why I'm sitting on this hill instead of walking into the Lumber Camp with a machine I can't start." } },
      choices = {
        { text = "You gave your word. See the errand through.", next = "BACK", reply = "I mean to, even if it takes me till winter. An orc who can't finish an errand has no business holding an axe.", fx = { align = { honor = 1 } } },
        { text = "Blame the goblin and the wind. Nobody could argue.", next = "BACK", reply = "I thought of that, and it's even true. But it'd still be me standing there saying it, wouldn't it?", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xread = {
      lines = { { id = "xr_default", text = "Would you? I can get through it with my finger on the words, but it takes me an hour a page, and the goblin wrote it the way he talks. If you read and I listen, I might be driving this thing by sundown." } },
      choices = {
        { text = "Gladly. Nobody's born knowing their letters.", next = "BACK", reply = "That's what my mother said, in the camps, when there was nothing to read anyway. Thank you, friend.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else first.", next = "BACK" },
      },
    },
    xeng = {
      lines = { { id = "xe_default", text = "Look all you want, but don't pull anything. There's a red lever, a green lever and a chain, and I pulled the chain at the top of the hill, which is how I learned what the chain does. If you can tell me which lever is 'stop', I'll name my first-born after you." } },
      choices = { { text = "It's the red one, usually. Something else.", next = "BACK", reply = "Usually! You sound like the goblin. I'll wait for chapter three, if it's all the same to you." } },
    },
    xgoblin = {
      lines = { { id = "xgb_default", text = "Then you know how it goes. He never lied to me once, not that I could catch, and I still walked away with less than I thought I'd bought. Next time the camp wants something from Ratchet, they can send somebody who likes arguing." } },
      choices = { { text = "Never buy the first price. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
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
        { id = "h_again3", text = "Ask away. If I'm talking, I'm not looking at that cover and feeling sick." },
        { id = "h_again", text = "What else? I'm not going anywhere until those pages turn up." },
        { id = "h_again2", text = "Go on, ask. It passes the time." },
      },
      choices = {
        { text = "What's a shredder?", next = "shredder" },
        { text = "Where might the pages have gone?", next = "pages" },
        { text = "Can't you run the thing without a manual?", next = "manual" },
        { text = "You seem more scared of your overseer than the elves.", next = "overseer" },
        { text = "That goblin in Ratchet saw you coming.", next = "goblin" },
        { text = "You can't read well, so I'll read them to you.", next = "xread", when = { questActive = TODO_QUEST("The Lost Pages") } },
        { text = "I'm an engineer. Let me look at this machine.", next = "xeng", when = { profession = "Engineering" } },
        { text = "A goblin sold you this? I know the type.", next = "xgoblin", when = { race = { "Troll", "Orc" } } },
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
    advice = { { id = "tp_advice", text = "If a goblin hands you something made of paper, put it inside your jerkin and button it. I learned that one the hard way." } },
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
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of the tribes, this deep in the elves' forest! Sit a moment, for it does me good to hear hooves on these boards that are not my own." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman walks lighter than a warrior, but mail turns an arrow just the same. I keep a few hauberks cut for those who must still raise their arms to the spirits." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. You'll want the thickest mail I have, and a helm, for the Sentinels aim high." },
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor has fought many battles, and lost a few. Let me see what can be done." },
  },

  start = "hello",
  nodes = {
    road = {
      lines = { { id = "rd_default", text = "It has, friend. The plate is hammered in Orgrimmar, carried by kodo across the Barrens, and brought up the southern road past the elves' ruins, where the wagons are watched from every branch. By the time a breastplate reaches my rack, it has already survived more ambushes than most grunts." } },
      choices = {
        { text = "Do many wagons fail to arrive?", next = "road2" },
        { text = "Tell me of something else.", next = "BACK" },
      },
    },
    road2 = {
      lines = { { id = "rd2_default", text = "One in four this season, and Locke Okarr counts every lost crate aloud so that the rest of us may share his grief. The drivers who run and live I welcome back gladly, because armor can be forged again and a driver cannot." } },
      choices = {
        { text = "A driver who abandons his load has no honor.", next = "BACK", reply = "You speak as the Warsong speak, and they are brave. I am only a merchant, and I would sooner feed a living coward than bury a proud fool.", fx = { align = { honor = 1 } } },
        { text = "You are right. A life is worth more than a crate.", next = "BACK", reply = "The Earth Mother thinks so, I believe. Locke does not, but Locke was never asked to drive the wagon.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    post = {
      lines = { { id = "po_default", text = "Many hands, as in any camp. Kuray'bin commands and frets, Senani Thunderheart hunts the great beasts of the forest, Innkeeper Kaylisk keeps the fire, and Vhulgra's wind riders carry word to the Crossroads. I only see that they are all dressed for the weather, which here means arrows." } },
      choices = {
        { text = "Senani is of your people. Do you speak often?", next = "post2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post2 = {
      lines = { { id = "po2_default", text = "Most evenings, when the hunt is done. She speaks of the old bear and the old cat as worthy foes, with the respect a hunter owes them, and it eases me to hear the forest spoken of as something other than timber." } },
      choices = { { text = "That is good to hear. Something else.", next = "BACK", fx = { learn = { "warsong" } } } },
    },
    mulgore = {
      lines = { { id = "mu_default", text = "Further than I ever meant to wander, young one. The trees here stand so thick that I have not seen An'she whole in a month, and I catch myself looking for the horizon as if someone had hidden it. When the Warsong have their walls, I will walk home slowly and enjoy every step." } },
      choices = {
        { text = "The Horde needs us here. Mulgore will wait.", next = "BACK", reply = "It will, as it waited for our grandfathers. That is the comfort of the plains: they are patient with us.", fx = { align = { order = 1 } } },
        { text = "Go home, Burkrum. This war is not ours.", next = "BACK", reply = "Perhaps it is not, and yet the orcs stood with us against the centaur when no one else would. I will stay until that debt feels lighter.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = { { id = "sm_default", text = "Orcish hammers, most of them, out of the Valley of Honor, and you can tell by the weight, for an orc smith never uses a little iron where a great deal will do. I check each rivet myself before it goes on the rack, because a tauren's thumbs are good for that if for nothing finer." } },
      choices = { { text = "Honest work. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Burkrum, and I sell heavy armor to those who guard Splintertree and the Lumber Camp. The night elves strike from the trees without warning, and good mail is what lets you live long enough to strike back." },
      },
      again = {
        { id = "h_again3", text = "Ask what you like, friend. The wagons are late again, so I have the whole afternoon." },
        { id = "h_again", text = "What else, friend?" },
        { id = "h_again2", text = "Speak, there is no hurry." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "A tauren selling armor at an orc outpost?", next = "tauren" },
        { text = "What do the night elves fight with?", next = "elves" },
        { text = "Your mail has come a long road to get here.", next = "road" },
        { text = "Who else keeps this post standing?", next = "post" },
        { text = "You are far from Mulgore, brother.", next = "mulgore", when = { race = "Tauren" } },
        { text = "I work metal myself. Whose hammer made these?", next = "smith", when = { profession = "Blacksmithing" } },
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
    thrall = { { id = "tp_thrall", text = "The Warchief asked the tribes to stand with the orcs, and Cairne said yes. That is reason enough for one armor merchant to be here." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is as steady as the mesa he sits on. When I am weary of this forest, I think of how long he waited for a home." } },
    sentinels = { { id = "tp_sentinels", text = "They are patient hunters, and they love this land as we love Mulgore. I sell armor against them, and I cannot bring myself to hate them." } },
    warsong = { { id = "tp_warsong", text = "The Warsong cut and the elves shoot, and I sell armor to those who stand between. I would rather the forest were left more of itself, but no one asks the armor merchant." } },
    advice = { { id = "tp_advice", text = "Wear a helm on the road to the Lumber Camp, friend, however hot the day. The Sentinels aim for the head." } },
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
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of our own, and not in Sentinel leathers. Careful, or Farsong will have you sworn in before you've finished your first skirmish." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. I can always tell; you look at the supply crates the same way I do." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf in the Silverwing ranks. The Sentinels don't quite know what to make of you, do they? Good." },
  },

  start = "hello",
  nodes = {
    farsong = {
      lines = { { id = "fs_default", text = "Sentinel Farsong approves of very little that isn't a glaive or an oath. She frowns at my methods and signs for my crates, and I've decided that the signature is the part that counts." } },
      choices = {
        { text = "But you respect her.", next = "farsong2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farsong2 = {
      lines = { { id = "fs2_default", text = "More than I'd tell her. She has stood at the mouth of that tunnel since the first tree fell, and I've seen her send friends through it and wait for them without once sitting down. I only make sure that what she sends them in with is the best I can find." } },
      choices = { { text = "That's worth doing. Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    crates = {
      lines = { { id = "cr_default", text = "Some of them come from Darnassus with a proper seal, and some come from Astranaar when Haljan Oakheart can spare them. The rest arrive at night, and if a few are stamped with a goblin's mark or a Warsong brand, the bandages inside bind a wound just as well." } },
      choices = {
        { text = "Stolen Horde supplies. I like it.", next = "BACK", reply = "I thought you might. Every crate they lose is one I needn't beg from Darnassus.", fx = { align = { honor = -1 } } },
        { text = "Sentinels shouldn't fight with stolen goods.", next = "BACK", reply = "Then the Sentinels needn't know, and you needn't tell them. They'll fight better for it either way.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xr_default", text = "I expect we do, and I expect neither of us will name them out here in the open. Let's only say that the Cenarion Enclave has a quiet corner, and that I learned my trade in it before I learned to count crates." } },
      choices = { { text = "Then I'll say no more. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xdone = {
      lines = { { id = "xd_default", text = "So you have, and I remember every fighter I've handed a package to, because I like to know which ones come back for a second. Keep bringing me marks, and I'll keep finding you the potions I don't put on the open shelf." } },
      choices = { { text = "I'll be back with more. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Illiyana Moonblaze, supply officer for the Silverwing Sentinels. I keep the stores full for those who fight in Warsong Gulch, and those who fight well get the better stores." },
      },
      again = {
        { id = "h_again3", text = "Still here? Then ask, and I'll decide whether it's the sort of question I answer." },
        { id = "h_again", text = "What else? I've crates to count, or not count." },
        { id = "h_again2", text = "Go on. The Gulch will wait." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "What's in a care package?", next = "package" },
        { text = "You're not a Sentinel, are you?", next = "sentinel" },
        { text = "What's Warsong Gulch?", next = "gulch" },
        { text = "Farsong doesn't quite approve of you.", next = "farsong" },
        { text = "Your crates come from somewhere unusual.", next = "crates" },
        { text = "I think we've friends in common, Illiyana.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I've earned my marks in the Gulch already.", next = "xdone", when = { questDone = TODO_QUEST("Sentinel Basic Care Package") } },
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
    sentinels = { { id = "tp_sentinels", text = "The Sentinels fight by the old rules and I supply them by newer ones. It works, as long as nobody looks closely at the crates." } },
    advice = { { id = "tp_advice", text = "Take more bandages into the Gulch than you think you need, and then take two more. I've never had anyone come back and complain of too many." } },
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
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Circle. Then you can hear it as I do, the quiet where a grove used to answer, and I need not explain to you why we fight." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Sister of the forest, or brother, it is all one at this tunnel. You were raised under these boughs, and I will expect more of you than of the outlanders." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. The Gulch needs those who will stand at the flag and not move." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human, fighting for our forest. I'm grateful, though I'm not sure your people understand what we lose with each tree." },
  },

  start = "hello",
  nodes = {
    before = {
      lines = { { id = "be_default", text = "I do, and it is not so long ago. A few years past, this grove was a place where the young came to learn the bow, and the only strife beyond that tunnel was between stags in autumn. Then the Warsong found the valley, and now I count stumps where I used to count nests." } },
      choices = {
        { text = "What became of the Sentinels who trained here?", next = "before2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before2 = {
      lines = { { id = "be2_default", text = "They are the Silverwing now, those who live. We took the name from the grove when we swore to hold it, and Illiyana Moonblaze keeps us in arrows and bandages by means I have decided not to ask about." } },
      choices = {
        { text = "You don't trust your own supply officer.", next = "before3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before3 = {
      lines = { { id = "be3_default", text = "I trust that the crates are full, and in a war that is a kind of trust. She keeps company the Sentinels do not, and laughs at rules I would die for, yet she has never once left us short." } },
      choices = {
        { text = "A Sentinel should demand better than that.", next = "BACK", reply = "Perhaps she should, in a gentler season. Come and tell me so again when the Gulch is ours.", fx = { align = { order = 1 } } },
        { text = "Full crates matter more than where they came from.", next = "BACK", reply = "So Illiyana tells me, with that smile of hers. I dislike how often the war proves her right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = { { id = "xh_default", text = "In pairs, with the wolves running low and the riders leaning out to cut as they pass. Shoot the wolf and the rider falls among his own, and if your beast can turn the second one, you will have a breath to draw again. Do not chase them toward their hold, for that is what they want." } },
      choices = { { text = "I'll remember it in the Gulch. Something else.", next = "BACK" } },
    },
    xgnome = {
      lines = { { id = "xg_default", text = "Then you understand more than I credited, and I ask your pardon for it. We have not lost Ashenvale yet, and I mean to see that you never have cause to console us for it." } },
      choices = {
        { text = "Then let us hold this one together.", next = "BACK", reply = "Together, then. It is a strange thing to hear in this grove, and a welcome one.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { id = "h_again3", text = "Ask it, then. While we stand talking, the saws are not idle." },
        { id = "h_again", text = "What else? Be quick." },
        { id = "h_again2", text = "Speak, then return to the fight." },
      },
      choices = {
        { text = "Who are the Silverwing Sentinels?", next = "silverwing" },
        { text = "What happens in the Gulch?", next = "gulch" },
        { text = "What are talismans of merit?", next = "talismans" },
        { text = "It's only trees, Sentinel.", next = "trees" },
        { text = "You remember this forest before the orcs came.", next = "before" },
        { text = "I'm a hunter. Tell me how the Outriders ride.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "My people know what it is to lose a homeland.", next = "xgnome", when = { race = { "Gnome", "Human" } } },
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
    advice = { { id = "tp_advice", text = "In the Gulch, do not chase a kill and leave the banner. Glory is cheap there, and a held flag is not." } },
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
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Those are a tailor's fingers, pricked and patient. Aeolynn buys my thread by the armful, so you had better choose yours before she comes by again." },
    { id = "n_enchant", cat = "craft", when = { profession = "Enchanting" },
      text = "You've dust on your sleeves, the shimmering kind. I've two formulas you'll want, though I only have a few copies." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome. I've had a few of your people through, asking for gears. I don't sell gears." },
  },

  start = "hello",
  nodes = {
    crafters = {
      lines = { { id = "cr_default", text = "They do, and I know every one of them by what they run out of. Aeolynn the clothier wants thread and dye, Xai'ander wants flux for his forge, and Nantar comes for salt and stays to complain about the price of flour." } },
      choices = {
        { text = "You could tell the town's fortunes by what it buys.", next = "crafters2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crafters2 = {
      lines = { { id = "cr2_default", text = "I can, and better than Raene's scouts some weeks. When Xai'ander doubles his flux, the Sentinels are expecting a fight, and when Aeolynn buys white thread, somebody is sewing shrouds. I would much rather sell her the green." } },
      choices = { { text = "That's a grim ledger. Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    war = {
      lines = { { id = "wa_default", text = "I am troubled by it every morning, when I count what did not come in on the cart. But a long face never sold a spool of thread, and Astranaar has enough solemn Sentinels without my adding to them." } },
      choices = {
        { text = "Good. A town needs someone who can still laugh.", next = "BACK", reply = "It does, and I've appointed myself. The pay is poor, but there's no one to dismiss me.", fx = { align = { light = 1 } } },
        { text = "You should take it more seriously than that.", next = "BACK", reply = "I take it seriously enough to keep a packed bag under the counter. I simply refuse to frown about it as well.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enchanter = {
      lines = { { id = "en_default", text = "He was old even as our people count it, and he worked at the moonwell by the lake because he said the dust behaved better near clean water. He left the formulas with me the season he stopped coming, and I have never asked the Sentinels where he went, because I think I know." } },
      choices = {
        { text = "Then selling his work keeps it alive.", next = "BACK", reply = "That is how I look at it, on my better days. On the others, I only notice how few copies are left.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailor = {
      lines = { { id = "tl_default", text = "It is the best you will find between Auberdine and the Barrens, which I admit is not the boast it might be. The fine thread comes from Darnassus when the carts get through, and the coarse I get wherever I can, so buy the fine while I have it." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Dalria, and I sell trade goods to the crafters of Astranaar and anyone else passing through. Thread, flux and dye mostly, and now and then something rarer." },
      },
      again = {
        { id = "h_again3", text = "Go on, then. Nobody else in this town has asked me anything all day but the price of salt." },
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "What else can I find you?" },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Something rarer?", next = "rare" },
        { text = "How's trade in Astranaar?", next = "trade" },
        { text = "Astranaar's crafters must keep you busy.", next = "crafters" },
        { text = "You don't seem troubled by the war.", next = "war" },
        { text = "Tell me about the enchanter who left the formulas.", next = "enchanter", when = { profession = "Enchanting" } },
        { text = "I sew for a living. Is your thread any good?", next = "tailor", when = { profession = "Tailoring" } },
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
    sentinels = { { id = "tp_sentinels", text = "Raene's Sentinels buy my lamp oil and my salt, and pay in thanks more often than silver. I have decided thanks will do, for now." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Thistlefur used to trade me beeswax for thread, if you can believe it. I still have the last cake of it under the counter." } },
    explorers_league = { { id = "tp_explorers_league", text = "A dwarf of the Explorers' League bought every spool of twine I had, to measure a ruin with. I do admire a customer with a plan." } },
    warsong = { { id = "tp_warsong", text = "The Warsong have cut the eastern road, and every week it costs me a little more to stock the same shelf. I would send the orcs the difference, if I thought they could read a bill." } },
    advice = { { id = "tp_advice", text = "Buy your thread and flux here before you go east or south, because there is not another honest trade counter until the Barrens, and that one belongs to the Horde." } },
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
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Your kind eat like birds in one shape and like bears in the other, so tell me which of you is hungry and I will know how many loaves to wrap." },
    { id = "n_weary", cat = "weary", when = { resting = true },
      text = "You look as though you've walked all the way from Darkshore. Sit, eat, and then go and see Kimlya about a bed." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I've a dark bread that your people seem to like. It's heavy enough to stop an arrow." },
  },

  start = "hello",
  nodes = {
    flour = {
      lines = { { id = "fl_default", text = "It is not, friend. The grain comes down by cart from Maestra's Post and from Darkshore beyond it, and Haljan Oakheart and I divide whatever arrives between his shelves and my ovens. When the carts are late I bake with acorn meal, and the Sentinels are kind enough to say nothing." } },
      choices = {
        { text = "And when no cart comes at all?", next = "flour2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flour2 = {
      lines = { { id = "fl2_default", text = "Then I bake smaller loaves and more of them, so that no one at the bridge goes back to their post with empty hands. It happened for nine days in the spring, and I have kept two sacks hidden under the floor ever since." } },
      choices = {
        { text = "The Sentinels should eat first. They hold the town.", next = "BACK", reply = "Raene would agree with you, and then give her own loaf to a child. I bake for whoever is in front of me.", fx = { align = { order = 1 } } },
        { text = "Feed the children and the weary first.", next = "BACK", reply = "That is how my mother baked, and how I do. The Sentinels have never once complained of it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk = {
      lines = { { id = "fo_default", text = "By their appetites, if not always by name. Innkeeper Kimlya takes a dozen loaves each dawn for her guests, Daelyshia feeds her crusts to the hippogryphs when she thinks I am not looking, and Sentinel Thenysil has stood at the same post so long that I simply carry hers to her." } },
      choices = {
        { text = "Thenysil never leaves her post, then.", next = "folk2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    folk2 = {
      lines = { { id = "fo2_default", text = "Not while I have been baking here, which is longer than I care to count. She thanks me in exactly four words every morning, and I have come to think of it as the town's dawn bell." } },
      choices = { { text = "A good neighbour. Something else.", next = "BACK", fx = { learn = { "sentinels" } } } },
    },
    cook = {
      lines = { { id = "ck_default", text = "Less than you would think: flour, lake water, a little honey from the hives at Raynewood, and time. The secret is the water, for Lake Iris is as clean as a moonwell, and I would not try this loaf anywhere the furbolgs have fouled the streams." } },
      choices = { { text = "I'll remember the water. Something else.", next = "BACK" } },
    },
    dark = {
      lines = { { id = "dk_default", text = "A dwarf from Auberdine taught me the making of it in exchange for a week's suppers, and he wept when he tasted the first good loaf. It is dense as a millstone and keeps for a month, which is why the scouts carry it on the long patrols." } },
      choices = { { text = "A dwarf's bread in an elven oven. Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Nantar, and I bake for Astranaar. The Sentinels, the travelers, Raene's wolves, if they could get at it; everyone eats bread." },
      },
      again = {
        { id = "h_again3", text = "Ask while I knead, friend, for the dough will not wait and I can do both at once." },
        { id = "h_again", text = "Anything else, friend?" },
        { id = "h_again2", text = "What else?" },
      },
      choices = {
        { text = "Let me see your bread.", next = "BUSINESS" },
        { text = "How is Astranaar faring?", next = "faring" },
        { text = "Who eats the most bread?", next = "most" },
        { text = "Your flour can't be easy to come by.", next = "flour" },
        { text = "You must know everyone in Astranaar.", next = "folk" },
        { text = "I cook a little. What goes into Kaldorei bread?", next = "cook", when = { profession = "Cooking" } },
        { text = "A dark bread that stops arrows? Now I'm curious.", next = "dark", when = { race = "Dwarf" } },
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
    warsong = { { id = "tp_warsong", text = "The Warsong burn good oak for charcoal. A baker knows what wood is worth, and it grieves me to smell it wasted." } },
    furbolgs = { { id = "tp_furbolgs", text = "I used to leave the burnt loaves at the edge of the wood for the Thistlefur cubs. Nothing comes for them now." } },
    elune = { { id = "tp_elune", text = "I say a word to Elune over the first loaf each morning. It is a small prayer, and She has always seemed to like small ones." } },
    ashenvale = { { id = "tp_ashenvale", text = "Ashenvale is the oldest forest I know, and Raene Wolfrunner carries our corner of it on her shoulders. I worry for her, and I show it with bread." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels are the reason I still have an oven to stand at. I feed them as well as the flour allows, and I wish that it allowed more." } },
    advice = { { id = "tp_advice", text = "Carry bread, not meat, on the roads here, friend. Bread does not draw the wolves down on you." } },
    background = { { id = "tp_bg", text = "I bake bread in Astranaar. It's simple, and it's needed." } },
    _none = { { id = "tp_none", text = "I don't know, friend. Bread, I know." } },
  },
}

---------------------------------------------------------------------------
-- Sentinel Melyria Frostshadow
---------------------------------------------------------------------------
P:NPC {
  key = "melyria", id = TODO_NPC("Sentinel Melyria Frostshadow"), name = "Sentinel Melyria Frostshadow",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "female",
  communities = { "silverwind_refuge" }, temper = { "grave", "steady" }, values = { "dutiful", "loyal" },
  notices = { "class", "race" },

  impression = {
    first = "Sentinel Melyria Frostshadow keeps watch at Silverwind Refuge and is quietly searching for a sister-in-arms who vanished after being sent to the Howling Vale. She speaks of the missing Sentinel as someone still on duty.",
    third = "{name} met Sentinel Melyria Frostshadow at Silverwind Refuge, who seeks word of the vanished Velinde Starsong.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah. You have come to the Refuge by the lake road, and you look as though you can keep a confidence." },
    { id = "g_back", when = { metBefore = true }, text = "You return to Silverwind. Tell me you bring word, and not only weariness." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Howling Vale") }, text = "The Howling Vale lies to the north-east, past Raynewood. Have you been yet?" },
    { id = "g_done", when = { questDone = TODO_QUEST("Velinde Starsong") }, text = "Thyn'tel Bladeweaver has my report, thanks to you. The Sentinels do not forget who carried it." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of our own. Then I may speak more plainly to you than to the outlanders, for you know what it means when a Sentinel does not report." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You read tracks, and the Vale is full of them, though most were not made by anything that walks on two legs by day." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. The wolves of the Howling Vale are not as wolves should be, and I would value your judgment on what you see there." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sentinel Melyria Frostshadow. Some time ago a Sentinel named Velinde Starsong was charged with clearing the demons from Felwood, and she kept a post in the Howling Vale. She has not been heard from since, and I mean to learn why." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Howling Vale") }, text = "Velinde kept her writings in the old building in the Howling Vale. Search it for anything in her hand, and bring me what you learn, for I cannot leave the Refuge unguarded to go myself." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Howling Vale") }, text = "So she prayed for aid and was given a scythe, and the scythe gave her wolf-men to command. I do not like where this trail leads, but I am grateful to you for following it." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The lake is quiet, for the moment." },
        { id = "h_again2", text = "Speak. I have the watch until moonrise and nothing to do but think." },
        { id = "h_again3", text = "Ask it, and then let us both get back to our duties." },
      },
      choices = {
        { text = "Who was Velinde Starsong?", next = "velinde" },
        { text = "Tell me about Silverwind Refuge.", next = "refuge" },
        { text = "The Horde's road runs very near here.", next = "horde" },
        { text = "I've seen the worgen of the Vale. They are no natural beasts.", next = "xworgen", when = { questDone = TODO_QUEST("The Howling Vale") } },
        { text = "A Sentinel missing, and Darnassus sends no one?", next = "xnelf", when = { race = "NightElf" } },
        { text = "I knew something of wolf-men in the east.", next = "xhuman", when = { race = "Human" } },
        { text = "Elune light your watch, Sentinel.", next = "END" },
      },
    },
    velinde = {
      lines = {
        { id = "velinde_default", text = "A priestess as well as a Sentinel, which is rare, and one of the most devout I ever served beside. When the task in Felwood proved too great for one blade, she prayed to Elune for help, and for a time her reports were full of victories. Then they stopped." },
      },
      choices = {
        { text = "What do you think happened?", next = "velinde2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    velinde2 = {
      lines = {
        { id = "velinde2_default", text = "I think she was given what she asked for, and that it cost more than she knew. Her last messages spoke of allies she could summon and could not always dismiss. A Sentinel does not write such a thing lightly." },
      },
      choices = {
        { text = "She should have asked her sisters, not strange powers.", next = "BACK", reply = "So I have said to myself many times. But she was alone in Felwood, and I was not there to be asked.", fx = { align = { order = 1 } } },
        { text = "She used what she had. I'd have done the same.", next = "BACK", reply = "Perhaps I would have, too, in that place. It does not make the silence easier to bear.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuge = {
      lines = {
        { id = "refuge_default", text = "It is a lodge on the southern shore of Mystral Lake, and the last quiet house before the forest turns to war. Sentinel Velene Starstrike watches the water with me, the hunters Alenndaar and Danlaar train the young, and Kylanna brews her draughts by the door." },
      },
      choices = {
        { text = "It seems peaceful enough.", next = "refuge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuge2 = {
      lines = {
        { id = "refuge2_default", text = "It seems so because we work at it. The water elementals on the lake have turned hostile, the Horde's wolf riders pass within bowshot on their way to Splintertree, and we are too few to chase either. We hold the house, and we call that enough." },
      },
      choices = {
        { text = "Holding is no small thing. Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
    horde = {
      lines = {
        { id = "horde_default", text = "It does. The orcs call it their supply road, and it runs from the Barrens to Splintertree Post not a league east of us. We watch it and we count them, and Raene Wolfrunner in Astranaar has our numbers every week." },
      },
      choices = {
        { text = "Count them, then cut the road. They've no right to it.", next = "BACK", reply = "I would, with a hundred more glaives. With eight, I count, and I pray for the hundred.", fx = { align = { honor = 1 } } },
        { text = "Leave the road be. A quiet border suits you both.", next = "BACK", reply = "That is what the border has been, and each season the stumps come nearer. Quiet is not the same as safe.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xworgen = {
      lines = {
        { id = "xworgen_default", text = "No, they are not. They came through with the scythe, from somewhere that is not Azeroth, and they answered to Velinde for a while. What they answer to now, I cannot say, and that is the question I most want put to Darnassus." },
      },
      choices = {
        { text = "Then Darnassus must hear it. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "Darnassus has Ashenvale's whole border to think of, and one missing Sentinel is a small entry in a long ledger. That is why I have taken it on myself. Thyn'tel Bladeweaver on the Warrior's Terrace knew her, and will listen when others will not." },
      },
      choices = {
        { text = "Then Thyn'tel shall hear of it. Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xhuman_default", text = "Did you? Then perhaps this trail leads further than I feared. Velinde's last word was that she meant to travel east, across the sea, to seek counsel on what she carried. If your lands have seen wolf-men since, I should be very sorry, and not surprised." },
      },
      choices = {
        { text = "I'll remember that when I go home. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I am a Sentinel of Silverwind Refuge, on Mystral Lake. I keep the watch here, and I keep looking for one of ours who is missing." } },
    sentinels = { { id = "tp_sentinels", text = "We are spread thin from Darkshore to the Barrens, and every post is short of hands. A Sentinel learns early to do the work of three." } },
    warsong = { { id = "tp_warsong", text = "The Warsong ride past us to Splintertree as if the road were theirs. One day we shall have the numbers to tell them otherwise." } },
    advice = { { id = "tp_advice", text = "Do not go into the Howling Vale after dark, and do not go alone. What hunts there hunts in packs." } },
    _none = { { id = "tp_none", text = "I do not know, and I will not guess. Ask Raene Wolfrunner in Astranaar, who hears from every post." } },
  },
}

---------------------------------------------------------------------------
-- Sentinel Onaeya
---------------------------------------------------------------------------
P:NPC {
  key = "onaeya", id = TODO_NPC("Sentinel Onaeya"), name = "Sentinel Onaeya",
  bible = "bibles/more_folk.md", role = "soldier", tier = "quest", gender = "female",
  communities = { "maestras_post" }, temper = { "brisk", "wry" }, values = { "dutiful", "protective" },
  notices = { "class", "race" },

  impression = {
    first = "Sentinel Onaeya stands outside the main lodge at Maestra's Post and receives whatever comes up the road from Darkshore: messages, wounded, and the occasional stranger. She is brisk about all three and loses patience only with excuses.",
    third = "{name} met Sentinel Onaeya, who keeps the road watch at Maestra's Post.",
  },

  greetings = {
    { id = "g_hello", text = "Hold there a moment. State where you have come from, and then you may pass or stay as you please." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and by the same road. You are becoming a habit, traveler." },
    { id = "g_done", when = { questDone = TODO_QUEST("One Shot. One Kill.") }, text = "Aynasha is back on her feet and complaining about the bandages, which is how I know she is mending. You have my thanks for that." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You carry that bow as if you use it. Good, because the last archer who came through here could not have hit the lodge from the inside." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome" } },
      text = "An outlander on the Darkshore road. You are welcome at Maestra's Post, and you will forgive me if I watch you until I am sure of it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A healer. We have two Sentinels abed with furbolg claw-marks, if you have a moment and a kind word for them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sentinel Onaeya, and this is Maestra's Post, the first roof you come to in Ashenvale and the last before Darkshore. I watch the road, I count who passes, and I send word to Astranaar when the count looks wrong." },
        { id = "h_done", when = { questDone = TODO_QUEST("One Shot. One Kill.") }, text = "Aynasha was ambushed on that road with a quiver that would not have lasted a skirmish, and you stood over her until it was done. I have put it in my report to Raene exactly as it happened." },
      },
      again = {
        { id = "h_again", text = "What else? Ask while the road is empty." },
        { id = "h_again2", text = "Go on. I can listen and watch the treeline both." },
        { id = "h_again3", text = "Something more? Be quick about it, there is dust to the north." },
      },
      choices = {
        { text = "What comes up this road?", next = "road" },
        { text = "Who else keeps Maestra's Post?", next = "post" },
        { text = "You don't suffer excuses, I'm told.", next = "excuses" },
        { text = "Aynasha held that pass with almost no arrows.", next = "xaynasha", when = { questDone = TODO_QUEST("One Shot. One Kill.") } },
        { text = "I've walked the Darkshore road. It's ill guarded.", next = "xnelf", when = { race = "NightElf" } },
        { text = "I can stand a watch as well as any Sentinel.", next = "xwar", when = { class = { "WARRIOR", "HUNTER" } } },
        { text = "Keep your watch, Sentinel.", next = "END" },
      },
    },
    road = {
      lines = {
        { id = "road_default", text = "Travelers from Auberdine, mostly, and supply carts when the drivers are brave. Feero Ironhand has been trying to take one such load north for a week and cannot find a guard for it, because something has been falling on travelers south of the Darkshore border." },
      },
      choices = {
        { text = "Something?", next = "road2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road2 = {
      lines = {
        { id = "road2_default", text = "The Dark Strand, a cult of hooded fools who have made their nest at the Tower of Althalaxx to the north-west. They rob the road to feed whatever they are doing in that tower, and Delgren the Purifier has come all the way from the human lands to stop it." },
      },
      choices = {
        { text = "Cultists deserve no quarter. Root them out.", next = "BACK", reply = "Delgren would shake your hand. I only ask that you leave the road clear behind you.", fx = { align = { light = -1 } } },
        { text = "Some of them may only be fools. Spare those who yield.", next = "BACK", reply = "You are kinder than they will be to you. Still, a prisoner can talk, and a corpse cannot.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "dark_strand" } } },
      },
    },
    post = {
      lines = {
        { id = "post_default", text = "We are a small company. Orendil Broadleaf tends the grove and worries over Bathran's Haunt, Liladris Moonriver keeps the stores, and Delgren has made the lodge his headquarters without quite asking. The rest are Sentinels, and we sleep in turns." },
      },
      choices = {
        { text = "Bathran's Haunt worries a druid?", next = "post2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post2 = {
      lines = {
        { id = "post2_default", text = "It should worry anyone. There is a ruin up the slope where the Forsaken, the walking dead of the east, have been gathering plants and brewing something. Orendil says the soil around it has gone grey. I say that anything the dead think worth so long a journey is worth our stopping." },
      },
      choices = {
        { text = "I'll speak to Orendil about it. Something else.", next = "BACK" },
      },
    },
    excuses = {
      lines = {
        { id = "excuses_default", text = "I do not. A Sentinel who was late because the road was long knew how long the road was when she set out. I would sooner hear 'I failed' than a tale, and my recruits learn that in their first week." },
      },
      choices = {
        { text = "That's fair. Duty isn't lessened by being hard.", next = "BACK", reply = "Just so. Say that to my recruits, would you, on your way out.", fx = { align = { order = 1 } } },
        { text = "That's harsh. Sometimes the road really is too long.", next = "BACK", reply = "Then one says so before the march, not after. But I take your meaning, and I am not made of stone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xaynasha = {
      lines = {
        { id = "xaynasha_default", text = "She had been told to hold it and so she held it, which is the whole of what a Sentinel is. I have told her that next time she is to count her arrows before she counts on anyone coming by. She laughed, and then winced." },
      },
      choices = {
        { text = "She did the post proud. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xnelf = {
      lines = {
        { id = "xnelf_default", text = "It is, and I have said so to Astranaar until they are tired of reading it. There is Sentinel Selarin on the Darkshore side and my post here, and a long empty stretch between where the furbolgs and the cult do as they like." },
      },
      choices = {
        { text = "Then I'll say it in Darnassus too. Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
    xwar = {
      lines = {
        { id = "xwar_default", text = "Then stand one. Take the north side until the moon is over the lodge, call out anything on two legs, and do not leave the road to chase it. If you are still awake when I come round, I shall think better of outlanders." },
      },
      choices = {
        { text = "I'll be awake. Something else first.", next = "BACK" },
      },
    },
  },

  topics = {
    sentinels = { { id = "tp_sentinels", text = "We are few, and we do not complain of it where the recruits can hear. Among ourselves we complain a good deal." } },
    background = { { id = "tp_background", text = "I keep the road watch at Maestra's Post, on the border with Darkshore. Nothing comes into Ashenvale from the north without passing me." } },
    dark_strand = { { id = "tp_dark_strand", text = "Hooded cultists at the Tower of Althalaxx, robbing my road. Delgren means to end them, and I mean to help him." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Thistlefur to the east have gone the way of the Blackwood in Darkshore. Two of mine are abed with the proof of it." } },
    advice = { { id = "tp_advice", text = "Travel the Darkshore road by day and in company. I am tired of sending search parties." } },
    _none = { { id = "tp_none", text = "That is not something I can answer from this post. Ask in Astranaar, where they have the leisure to know things." } },
  },
}

---------------------------------------------------------------------------
-- Feero Ironhand
---------------------------------------------------------------------------
P:NPC {
  key = "feero", id = TODO_NPC("Feero Ironhand"), name = "Feero Ironhand",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "male",
  communities = { "maestras_post" }, temper = { "earnest", "stubborn" }, values = { "faithful", "dutiful" },
  notices = { "class", "race" },

  impression = {
    first = "Feero Ironhand is a human who came to Ashenvale with Delgren the Purifier and now has a load of supplies for Auberdine and no safe way to take it there. He is earnest, tired, and determined to walk the road whether anyone comes with him or not.",
    third = "{name} met Feero Ironhand near Maestra's Post, a human trying to get supplies through to Auberdine.",
  },

  greetings = {
    { id = "g_hello", text = "Well met, friend! You've the look of someone who can handle a weapon, and I'm in sore need of one who can." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back. The cart's still here and so am I, as you see." },
    { id = "g_active", when = { questActive = TODO_QUEST("Supplies to Auberdine") }, text = "Stay close on the road, and watch the trees. They've a habit of coming at us in threes." },
    { id = "g_done", when = { questDone = TODO_QUEST("Supplies to Auberdine") }, text = "Auberdine has its supplies and I still have my head. I count that a fine day's work, and half of it's yours." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, by the Light! I never thought to meet one of the Order this far from Stormwind. Stand by me a while, and the road will feel a good deal shorter." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Another human under these trees. It does my heart good, friend, for the elves are courteous and I have still not heard a joke in a month." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of the kaldorei. Your people have borne with us patiently, and I'd have you know that some of us came here to help and not only to stare." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Feero Ironhand, at your service. I came north with Delgren the Purifier to break the Dark Strand, and I've a load of supplies that our friends in Auberdine are waiting on. The trouble is that the cult knows it, and I'll not get a mile up that road alone." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Supplies to Auberdine") }, text = "We go north along the road toward Darkshore. They will ambush us, likely more than once, so keep your blade loose and don't wander from the cart." },
        { id = "h_done", when = { questDone = TODO_QUEST("Supplies to Auberdine") }, text = "They threw three ambushes at us and we walked through every one. Delgren says the Dark Strand will think twice about that road now, and I mean to make them think a third time." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I've nothing to do but check these straps again." },
        { id = "h_again2", text = "Ask away. It's good to talk to someone who isn't a cultist or a tree." },
        { id = "h_again3", text = "Go on, I'm listening. The road isn't going anywhere, more's the pity." },
      },
      choices = {
        { text = "What are you carrying to Auberdine?", next = "supplies" },
        { text = "What brought a human to Ashenvale?", next = "delgren" },
        { text = "You'd walk that road alone if you had to.", next = "alone" },
        { text = "The Light sent you a long way from home.", next = "xpal", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "We walked that road together. You fight well.", next = "xdone", when = { questDone = TODO_QUEST("Supplies to Auberdine") } },
        { text = "Light be with you, Feero.", next = "END" },
      },
    },
    supplies = {
      lines = {
        { id = "supplies_default", text = "Bandages, lamp oil, arrowheads and a few things from Delgren that he's not told me the use of. Auberdine's a small town with a great many troubles on its doorstep, and every cart that gets through means the Sentinels there can hold a little longer." },
      },
      choices = {
        { text = "Why does the cult care about a supply cart?", next = "supplies2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies2 = {
      lines = {
        { id = "supplies2_default", text = "Because it's ours, friend, and because they've guessed that some of it is meant for use against them. Athrikus Narassin, the warlock who leads them, has eyes all down this road. The elves think them a nuisance, and Delgren thinks them a great deal worse." },
      },
      choices = {
        { text = "I'd trust Delgren's nose. Something else.", next = "BACK", fx = { learn = { "dark_strand" } } },
      },
    },
    delgren = {
      lines = {
        { id = "delgren_default", text = "Delgren did. He hunts those who traffic with demons, and when word reached us of a cult working out of an old Highborne tower in the night elves' forest, he took ship that week. I've carried his pack and guarded his back for six years, so I came too." },
      },
      choices = {
        { text = "What do the elves make of you both?", next = "delgren2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    delgren2 = {
      lines = {
        { id = "delgren2_default", text = "They're polite, and puzzled. Sentinel Onaeya watched me for three days before she'd let me draw water from their well, and now she saves me a place at the fire. I think they'd not expected humans to care what happens to a forest that isn't theirs." },
      },
      choices = {
        { text = "We should care. Evil left alone crosses every border.", next = "BACK", reply = "That's Delgren's creed, near enough, and mine. It's good to hear it from another.", fx = { align = { light = 1 } } },
        { text = "It's their forest. Let them mind their own cults.", next = "BACK", reply = "And when the cult's finished here, friend, where do you think it looks next? I'd sooner meet it in someone else's woods.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = {
        { id = "alone_default", text = "I would, and I'd likely die of it, which is why I'm asking instead. A man can be stubborn and still know his arithmetic. One sword and one cart against a dozen cultists doesn't come out well, however much faith goes into it." },
      },
      choices = {
        { text = "Faith and a second sword. That comes out better.", next = "BACK", reply = "It does! Come along, then, and let's show them the sum.", fx = { align = { honor = 1 } } },
        { text = "Then don't go. No cart is worth your life.", next = "BACK", reply = "You may be right, and I'll go anyway. Somebody in Auberdine's counting on that oil.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpal = {
      lines = {
        { id = "xpal_default", text = "It did, and I've stopped wondering at it. I was a stable hand in Elwynn when Delgren found me, and now I'm guarding a cart under trees older than Stormwind. The Light doesn't ask whether you feel ready, in my experience." },
      },
      choices = {
        { text = "It never has. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdone = {
      lines = {
        { id = "xdone_default", text = "So do you, friend, and I'll say so to anyone who asks. When that third lot came out of the brush I thought we were finished, and then I looked round and you were already among them. I'll remember that a long while." },
      },
      choices = {
        { text = "So will I. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I serve Delgren the Purifier, and just now I'm trying to get a cart of supplies up the road to Auberdine." } },
    dark_strand = { { id = "tp_dark_strand", text = "A demon-dealing cult at the Tower of Althalaxx. Delgren's sworn to end them, and I've sworn to help." } },
    holy_light = { { id = "tp_holy_light", text = "The Light's the same under these trees as in the Cathedral, friend. I say my prayers at dusk and the elves are kind enough not to stare." } },
    advice = { { id = "tp_advice", text = "Don't travel the north road alone. I'm stubborn, and even I won't." } },
    _none = { { id = "tp_none", text = "I couldn't tell you, friend. Delgren would know, if it's about demons, and Onaeya if it's about the road." } },
  },
}

---------------------------------------------------------------------------
-- Pixel
---------------------------------------------------------------------------
P:NPC {
  key = "pixel", id = TODO_NPC("Pixel"), name = "Pixel",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "female",
  communities = { "splintertree" }, temper = { "shrewd", "breezy" }, values = { "profit", "practical" },
  notices = { "class", "race" },

  impression = {
    first = "Pixel is a goblin hauler who has parked herself and a load of saw blades at Splintertree Post until somebody pays for them. She prices everything out loud, including the satyrs.",
    third = "{name} met Pixel, a goblin supply runner doing business at Splintertree Post.",
  },

  greetings = {
    { id = "g_hello", text = "Hey, hey, a customer! Or a courier, I'm not fussy, pal, I've got work for both." },
    { id = "g_back", when = { metBefore = true }, text = "Look who's back! Tell me you brought me somethin' I can put on an invoice." },
    { id = "g_active", when = { questActive = TODO_QUEST("Satyr Horns") }, text = "Horns, friend, sixteen of 'em, and try to keep 'em in one piece. A chipped horn's a discounted horn." },
    { id = "g_done", when = { questDone = TODO_QUEST("Satyr Horns") }, text = "Sixteen horns, counted and crated. You're on my good list, pal, and it's a short list." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc with a coin purse! Your Warsong pals keep tryin' to pay me in honor, kid, and my supplier doesn't take honor." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "I see you lookin' at the crates, sweetheart. They're saw blades, they weigh a ton, and I've counted 'em twice today." },
    { id = "n_eng", cat = "class", when = { profession = "Engineering" },
      text = "You've got solder burns! Finally, somebody at this post who knows a sprocket from a spear. We should talk margins sometime." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Name's Pixel, and I move goods to wherever goods are short, which right now is here. I've got a wagon of saw blades the Lumber Camp is screamin' for, and I've got a side order for satyr horns that pays better than the blades, so guess which one I'm excited about." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Satyr Horns") }, text = "The satyrs are up at Satyrnaar and Xavian, north-east of here, the ones with the hooves and the bad attitude. Sixteen horns, and don't ask me what the buyer wants 'em for, because I didn't." },
        { id = "h_done", when = { questDone = TODO_QUEST("Satyr Horns") }, text = "The horns shipped out on the last wind rider and the buyer paid in full, no questions, which is my favorite kind of buyer. Anything else you find with horns on, you know where I am." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Talk's free, for now." },
        { id = "h_again2", text = "Go on, I've got time, the blades aren't movin' till somebody pays." },
        { id = "h_again3", text = "Somethin' else? Make it quick, time is money, friend!" },
      },
      choices = {
        { text = "Who's buying satyr horns?", next = "horns" },
        { text = "Why are the saw blades still on your wagon?", next = "blades" },
        { text = "What's a goblin doing this deep in the forest?", next = "goblin" },
        { text = "The Warsong fight for the Horde, and you'd charge them?", next = "xorc", when = { race = "Orc" } },
        { text = "I know machines. Those blades aren't for hand saws.", next = "xeng", when = { profession = "Engineering" } },
        { text = "Satyrs carry worse than horns. You know what they are?", next = "xlock", when = { class = { "WARLOCK", "SHAMAN" } } },
        { text = "I'll be going.", next = "END" },
      },
    },
    horns = {
      lines = {
        { id = "horns_default", text = "A fella in Orgrimmar who pays on delivery and signs with an X, that's who. Could be an alchemist, could be a collector, could be decoratin' a hat. The contract says sixteen horns, intact, and the contract is all I read." },
      },
      choices = {
        { text = "You don't wonder what they're for?", next = "horns2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horns2 = {
      lines = {
        { id = "horns2_default", text = "Wonderin's overhead, pal. If I asked every buyer why, I'd move half the freight and sleep twice as bad. The satyrs are nobody's friends, the horns come off dead ones, and everybody on my side of the ledger goes home happy." },
      },
      choices = {
        { text = "A deal's a deal. The buyer's reasons are his own.", next = "BACK", reply = "See, you get it! You ever want a job in freight, you look me up.", fx = { align = { honor = -1 } } },
        { text = "You should know what you're selling, and to whom.", next = "BACK", reply = "Sure, and you should know I've got a wagon payment due. But fine, I'll ask him. Probably.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blades = {
      lines = {
        { id = "blades_default", text = "Because the Warsong ordered 'em, the Warsong haven't paid for 'em, and Locke Okarr keeps tellin' me the coin's 'on the next wagon'. I like Locke, he keeps a tidy list. I'll like him better when the next wagon shows up." },
      },
      choices = {
        { text = "The camp can't cut without blades.", next = "blades2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blades2 = {
      lines = {
        { id = "blades2_default", text = "And I can't eat without gettin' paid, so we've both got problems. Listen, I'm not heartless, I let 'em have two crates on account last month. Know what I got? A very sincere speech about the glory of the Horde from Kuray'bin, and no gold." },
      },
      choices = {
        { text = "Hold the blades. They pay or they don't cut.", next = "BACK", reply = "That's the policy, friend, and I'm stickin' to it. Glory doesn't cover axle grease.", fx = { align = { order = 1 } } },
        { text = "Give them the blades. The Horde's good for it.", next = "BACK", reply = "You sound like Kuray'bin! Tell ya what, you co-sign and I'll think about it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblin = {
      lines = {
        { id = "goblin_default", text = "Makin' a livin', same as anyplace. The orcs need tools and can't make 'em fast enough, the cartel's got tools, and I've got a wagon and no fear of trees. The elves shot at me once on the Barrens road, and I shouted my rates at 'em until they got confused and left." },
      },
      choices = {
        { text = "That I'd have paid to see. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xorc = {
      lines = {
        { id = "xorc_default", text = "Whoa, whoa, I'm on your side, kid, I'm just on it at cost plus ten. Thrall pays his bills, I'll say that for him, and his quartermasters know it. It's the clans out here on the edge who think a war cry's legal tender." },
      },
      choices = {
        { text = "I'll have a word with Locke. Something else.", next = "BACK" },
      },
    },
    xeng = {
      lines = {
        { id = "xeng_default", text = "Sharp eyes! They're shredder blades, cut for the big goblin rigs, and that's why they cost what they cost. Some orc up the hill bought one of those machines in Ratchet and lost the manual, so I'm guessin' the blades are the least of that camp's troubles." },
      },
      choices = {
        { text = "I heard about the manual. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xlock = {
      lines = {
        { id = "xlock_default", text = "I know they used to be elves and they made a bad deal, which, between you and me, is a cautionary tale I think about. Whatever's still in the horns, it's the buyer's liability once it leaves my wagon. That's in the small print." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I know they used to be elves and they made a bad deal, which is a cautionary tale I think about, especially with your demon sniffing my horn crate like that. Whatever it's smelling in there, it's the buyer's liability once it leaves my wagon, and so is anything it scorches." },
      },
      choices = {
        { text = "Read your own small print, Pixel. Something else.", next = "BACK", fx = { learn = { "satyrs" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I haul goods for whoever's short of 'em, pal. Right now that's Splintertree, and they're short of the gold too." } },
    warsong = { { id = "tp_warsong", text = "Great customers, the Warsong, right up until the bill comes. Then it's all honor and glory and 'next wagon'." } },
    satyrs = { { id = "tp_satyrs", text = "Hooves, horns, bad tempers, camps north-east of here. The horns are worth more than the rest of 'em put together." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's where the freight comes in, friend. Best port on the coast, and I'm not just sayin' that because my cousin runs a dock there." } },
    _none = { { id = "tp_none", text = "No idea, pal, and I don't speculate for free. Ask Kaylisk at the inn, she hears it all." } },
  },
}

---------------------------------------------------------------------------
-- Aayndia Floralwind
---------------------------------------------------------------------------
P:NPC {
  key = "aayndia", id = TODO_NPC("Aayndia Floralwind"), name = "Aayndia Floralwind", title = "Leatherworking Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "astranaar" }, temper = { "patient", "exacting" }, values = { "craft", "nature" },
  notices = { "craft", "class" },

  impression = {
    first = "Aayndia Floralwind teaches leatherworking in Astranaar and insists that every hide be honoured by being used well. She corrects a student's stitch without raising her voice or looking up.",
    third = "{name} met Aayndia Floralwind, who teaches leatherworking in Astranaar.",
  },

  greetings = {
    { id = "g_hello", text = "Ishnu-alah. Mind the frames, if you would, for those hides are a day from ready and they mark easily." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the bench. Let me see your hands, and I will tell you whether you have been practising." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker! Sit down, and show me the last seam you were proud of." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "You carry a skinning knife, and it has been used today. Tell me the beast was not taken near the Thistlefur dens, for I will not have that leather on my frames." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You will wear through the left bracer first, as every archer does. Come to me before it parts, and I will show you how to double it yourself." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Aayndia Floralwind, and I teach the working of leather to those in Astranaar with the patience for it. The forest gives us the hide only once, so I teach my students to make something that deserves it." },
        { id = "h_lw", when = { profession = "Leatherworking" }, text = "You have made a beginning in the craft, I see. There is more I can show you, when your hands are ready and you have hides to learn on." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I can talk and scrape at once." },
        { id = "h_again2", text = "Ask. The tanning will not be hurried, and so neither am I." },
        { id = "h_again3", text = "Something more? Hand me that bone folder while you think of it." },
      },
      choices = {
        { text = "Teach me your craft.", next = "BUSINESS" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Who else works leather here?", next = "bench" },
        { text = "Does the war change what you make?", next = "war" },
        { text = "Why do my seams pucker on heavy hide?", next = "xlw", when = { profession = "Leatherworking" } },
        { text = "A druid wears the beast. Does working its skin trouble you?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Elune keep your hands steady.", next = "END" },
      },
    },
    hides = {
      lines = {
        { id = "hides_default", text = "From the stags and bears of the lake country, taken by hunters I know by name. Maluressian at the stable sends me word when a mount has died of age, and I use those hides too, with the rider's leave. Nothing that walked this forest should simply be left to the worms." },
      },
      choices = {
        { text = "And the sick beasts near the furbolgs?", next = "hides2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides2 = {
      lines = {
        { id = "hides2_default", text = "Those I refuse. Whatever has soured the Thistlefur has soured the game about their villages, and the leather comes up brittle and smelling of something burnt. I have told Raene Wolfrunner so, since a tanner sees the forest's health from an angle the scouts do not." },
      },
      choices = {
        { text = "A useful angle. Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    bench = {
      lines = {
        { id = "bench_default", text = "Lardan sells the thread, dyes and salt from the stall beside mine, and Tandaan Lightmane sells finished armor to those who cannot wait to learn. Between the three of us a traveler can be taught, supplied or simply dressed, according to their patience." },
      },
      choices = {
        { text = "Which do most choose?", next = "bench2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bench2 = {
      lines = {
        { id = "bench2_default", text = "They buy from Tandaan, nearly all of them, and I do not blame them when the Horde is a day's ride away. But one in ten comes back to ask how it was made, and that one I teach gladly. A craft passes on by tenths." },
      },
      choices = {
        { text = "Patience makes the better craftsman. Wait for the tenth.", next = "BACK", reply = "So I have found, in a long life of waiting. The tenth is always worth it.", fx = { align = { order = 1 } } },
        { text = "In wartime, teach faster and worry less.", next = "BACK", reply = "Faster makes armor that fails at the seam, and then I have taught someone to die. No, I will keep my pace.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = {
        { id = "war_default", text = "It has changed everything but the stitches. I used to teach quivers and riding tack, and now it is all bracers and jerkins for the Sentinels, cut to turn an axe. I have learned more about where an orc strikes than I ever wished to know." },
      },
      choices = {
        { text = "Where does an orc strike?", next = "war2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war2 = {
      lines = {
        { id = "war2_default", text = "Downward, at the shoulder and the collar, with all his weight behind it. So I teach a doubled yoke and a high collar, and I tell my students to thank the hide for every blow it takes that the wearer does not." },
      },
      choices = {
        { text = "I'll thank mine tonight. Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    xlw = {
      lines = {
        { id = "xlw_default", text = "Because you are pulling each stitch tight as you make it, as one does with light leather. On heavy hide, set all the stitches loose along the seam, and then draw them down together from the middle outward. Wet the thread first, and it will lie flat." },
      },
      choices = {
        { text = "From the middle outward. Thank you. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "It did, when I was young, and a druid of the Circle told me then what I now tell my students. The stag does not grudge the wolf his meal, only waste. I waste nothing, and I sleep well." },
      },
      choices = {
        { text = "That is the balance, truly. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    sentinels = { { id = "tp_sentinels", text = "I cut their bracers and their jerkins, and I mend what comes back. I know the war by where the leather is scored." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "A druid once taught me that only waste offends the forest. I have taught it to every student since." } },
    background = { { id = "tp_background", text = "I teach leatherworking in Astranaar. I have done so since before the town had a wall to speak of." } },
    furbolgs = { { id = "tp_furbolgs", text = "The Thistlefur's sickness is in the game near their dens. I can smell it in the hide before the knife is through." } },
    warsong = { { id = "tp_warsong", text = "Every jerkin I teach is cut against a Warsong axe now. I would rather be making saddles." } },
    advice = { { id = "tp_advice", text = "Oil your leathers after rain and before frost. Most armor is killed by neglect long before a blade finds it." } },
    _none = { { id = "tp_none", text = "I could not say. My knowledge ends where the hide does." } },
  },
}

---------------------------------------------------------------------------
-- Tandaan Lightmane
---------------------------------------------------------------------------
P:NPC {
  key = "tandaan", id = TODO_NPC("Tandaan Lightmane"), name = "Tandaan Lightmane", title = "Leather Armor Merchant",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "astranaar" }, temper = { "easy", "observant" }, values = { "practical", "community" },
  notices = { "class", "kit" },

  impression = {
    first = "Tandaan Lightmane sells leather armor in Astranaar and can tell what a traveler has been fighting by where their jerkin is torn. He guesses aloud, and he is usually right.",
    third = "{name} met Tandaan Lightmane, the leather armor merchant of Astranaar.",
  },

  greetings = {
    { id = "g_hello", text = "Welcome to Astranaar. Turn round once, would you? I like to see what the forest has done to a traveler before I sell them anything." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with a new tear at the elbow. Don't tell me, let me guess." },
  },

  notice = {
    { id = "n_worn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armor is hanging off you by its last three stitches. Thistlefur, by the claw marks, or else you've been arguing with a bear." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Soft soles and dark leather, I'd wager. I keep a few pieces that make no sound at all, though I'd sooner not know where they end up." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. I cut the shoulders loose for your sort, so nothing splits when you change. Aayndia taught me that after an embarrassing afternoon." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Tandaan Lightmane, and I sell leather armor to anyone heading out past the bridges. Aayndia Floralwind teaches the making of it, Lardan sells the makings, and I sell the finished thing to people who haven't a month to spare." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've all afternoon, unless a patrol comes in." },
        { id = "h_again2", text = "Ask away. I'll mend this strap while you do." },
        { id = "h_again3", text = "What else can I tell you?" },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "You can tell what I've fought from my armor?", next = "read" },
        { text = "Who buys from you?", next = "buyers" },
        { text = "The Sentinels make their own, surely.", next = "sentinels" },
        { text = "Guess where I've been, then.", next = "xguess", when = { class = { "WARRIOR", "HUNTER", "ROGUE" } } },
        { text = "I work leather. Is this your own stitching?", next = "xlw", when = { profession = "Leatherworking" } },
        { text = "Good day, Tandaan.", next = "END" },
      },
    },
    read = {
      lines = {
        { id = "read_default", text = "Most of the time. Claws across the chest mean furbolgs, punctures low on the leg mean the spiders in the western woods, and a clean straight cut at the shoulder means an orc. Burns are the satyrs at Xavian or Satyrnaar, and those I can't mend at all." },
      },
      choices = {
        { text = "Which do you see most?", next = "read2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    read2 = {
      lines = {
        { id = "read2_default", text = "Furbolg, this year, by a long way. The Thistlefur used to keep to their village north of the road, and now they come down as far as the lake. Raene's been sending anyone who'll go, and half of them come back to me for a new jerkin." },
      },
      choices = {
        { text = "Then the Thistlefur must be driven back, hard.", next = "BACK", reply = "That's Raene's view, and she's kept this town alive. I only wish I remembered them less fondly.", fx = { align = { light = -1 } } },
        { text = "They're sick, not wicked. Someone should find the cause.", next = "BACK", reply = "Pelturas Whitemoon says the same, and he's looking. I hope he's quick about it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    buyers = {
      lines = {
        { id = "buyers_default", text = "Outlanders, more and more. Humans and dwarves come up from Darkshore in good plate and find they can't move in this forest, so they come to me. I've learned to cut for a dwarf's shoulders, which was an education." },
      },
      choices = {
        { text = "And what do they make of Astranaar?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = {
        { id = "buyers2_default", text = "They find us quiet, and a bit grim, and they're not wrong on either count. But they sit in Kimlya's inn and listen, and after a week most of them have stopped calling it 'the woods' and started calling it Ashenvale. That's when I know they'll be of use." },
      },
      choices = {
        { text = "A week to earn a name. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    sentinels = {
      lines = {
        { id = "sentinels_default", text = "They do, and theirs is better than mine, I'll say it before you do. But a Sentinel's kit is issued once, and the war wears it out faster than Darnassus replaces it. So they come to me between issues, at night, and ask me not to mention it." },
      },
      choices = {
        { text = "You should mention it. Darnassus ought to know.", next = "BACK", reply = "Raene's told them, more than once. I'll leave it to her; she writes a sharper letter than I do.", fx = { align = { order = 1 } } },
        { text = "Keep their secret. Soldiers have pride.", next = "BACK", reply = "That's my thinking. They've little enough else out here.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xguess = {
      lines = {
        { id = "xguess_default", text = "Let me see. Scuffing at the knees, so you've been crouched in brush, and that's sap on the shoulder from a pine, which grows thickest to the south. I'd say you came up from the Barrens road, and something chased you for part of it." },
      },
      choices = {
        { text = "Near enough to worry me. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xlw = {
      lines = {
        { id = "xlw_default", text = "About half of it. The plainer pieces are mine, and the fine ones come from Aayndia's best students, who need the coin and the practice. If a seam ever fails you, bring it back and tell me whose it was, because she'll want to know." },
      },
      choices = {
        { text = "I'll bring it back if it does. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    warsong = { { id = "tp_warsong", text = "Orc axes leave a clean straight cut at the shoulder. I've seen enough of them now to know the smith by the notch." } },
    satyrs = { { id = "tp_satyrs", text = "Satyr fire scorches leather past mending. If you go to Xavian, don't wear anything you're fond of." } },
    dark_strand = { { id = "tp_dark_strand", text = "The cultists up at the tower wear robes, so they're no customers of mine. I only see what they do to other people's armor." } },
    elune = { { id = "tp_elune", text = "I'm not much for the Temple, but I say a word at the moonwell before a big order. It can't hurt the stitching." } },
    background = { { id = "tp_background", text = "I sell leather armor in Astranaar. I can usually tell you where you've been before you tell me." } },
    furbolgs = { { id = "tp_furbolgs", text = "I mend more Thistlefur claw-marks than anything else. They never used to come south of the road." } },
    sentinels = { { id = "tp_sentinels", text = "They're prouder than they are well supplied, just now. I do what I can, quietly." } },
    advice = { { id = "tp_advice", text = "Leather in the forest, friend, and leave the plate for open ground. You can't outrun what you can't hear over your own clanking." } },
    _none = { { id = "tp_none", text = "That I can't read off a jerkin. Ask Thenysil at the bridge; she knows more than she lets on." } },
  },
}

---------------------------------------------------------------------------
-- Llana
---------------------------------------------------------------------------
P:NPC {
  key = "llana", id = TODO_NPC("Llana"), name = "Llana", title = "Reagent Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "female",
  communities = { "astranaar" }, temper = { "soft-spoken", "curious" }, values = { "learning", "devout" },
  notices = { "class", "race" },

  impression = {
    first = "Llana sells reagents in Astranaar and asks every spellcaster what the powders are for, with real interest. She seems to be collecting the answers.",
    third = "{name} met Llana, who sells reagents in Astranaar.",
  },

  greetings = {
    { id = "g_hello", text = "Elune's light on you. Do come in, only breathe gently, for some of these powders travel on a sigh." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Did the last of it do what you hoped? I should like to hear." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Your people use arcane powder as freely as flour, and I can never keep enough of it. Tell me, does it truly weigh nothing once the spell is cast?" },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You will want the holy candles, and I have them, though I confess I still do not understand why your Light needs a flame to see by." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You carry an ankh at your belt. I had never seen one before the war brought your people so near, and I have wondered about it ever since." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Llana, and I keep the reagents for Astranaar: candles, seeds, powders and the small things a spell cannot be worked without. I do not cast myself, but I have sold to those who do for long enough to be curious." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I am glad of questions; I have so many myself." },
        { id = "h_again2", text = "Please, go on. The shop is quiet today." },
        { id = "h_again3", text = "Something more? I shall measure this out while you speak." },
      },
      choices = {
        { text = "Show me your reagents.", next = "BUSINESS" },
        { text = "You ask what each one is for?", next = "curious" },
        { text = "Where do your reagents come from?", next = "source" },
        { text = "Who in Astranaar buys them?", next = "buyers" },
        { text = "Our seeds call the forest's strength. Shall I show you?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Arcane powder isn't weightless. It's spent.", next = "xmage", when = { class = "MAGE" } },
        { text = "Elune-adore, Llana.", next = "END" },
      },
    },
    curious = {
      lines = {
        { id = "curious_default", text = "I do, and most are kind enough to tell me. A druid explained the wild thornroot to me one evening, and a dwarf priest spent an hour on why a candle must be blessed and not merely lit. I write it all in a little book, which nobody but me will ever want to read." },
      },
      choices = {
        { text = "Why keep the book at all?", next = "curious2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    curious2 = {
      lines = {
        { id = "curious2_default", text = "Because for ten thousand years we knew only our own magics and feared the rest, and I think the fear did us no good. If I understand what a mage's powder is for, I am less afraid of the mage. That seems worth a little ink." },
      },
      choices = {
        { text = "Understanding is better than fear. Keep writing.", next = "BACK", reply = "I shall, then. Perhaps one day I will let Pelturas read it.", fx = { align = { order = -1 } } },
        { text = "Some magics earned that fear. Be careful what you study.", next = "BACK", reply = "I am careful, I promise you. I only write down what is sold over a counter in daylight.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = {
        { id = "source_default", text = "The candles and powders come by cart from Darnassus, when the carts come. The seeds and roots I buy from the druids, and Pelturas Whitemoon lets me gather maple seed from the trees along the lake so long as I thank each one. I do, though I feel a little foolish." },
      },
      choices = {
        { text = "And when the carts don't come?", next = "source2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    source2 = {
      lines = {
        { id = "source2_default", text = "Then the mages go without, and they are not gracious about it. I have asked Haljan Oakheart to put my crate at the front of his next load, and he has promised, as he promises everyone. The Warsong have a great deal to answer for, and my empty shelf is the least of it." },
      },
      choices = {
        { text = "The least, but not nothing. Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    buyers = {
      lines = {
        { id = "buyers_default", text = "Fewer of ours than you might think. The priestesses need nothing but the moon, and the Sentinels carry steel. It is the druids, and lately the outlanders, with their fireballs and their portals and their little stones for holding a soul." },
      },
      choices = {
        { text = "Soul stones trouble you.", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = {
        { id = "buyers2_default", text = "They do. I sell the shards' makings to no one, and when a warlock comes in I serve them the common things and ask no questions for my book. There are answers I do not wish to have written down in my own hand." },
      },
      choices = {
        { text = "A wise line to draw. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "Would you? Oh, but not in here, the jars will take root. Come out to the grass by the gazebo at dusk, and I shall bring my book. I have wanted to see the thornroot answer since I first sold it." },
      },
      choices = {
        { text = "At dusk, then, by the gazebo. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xmage = {
      lines = {
        { id = "xmage_default", text = "Spent! So it goes somewhere, or becomes something. Wait, let me find my pen. You are the first to put it that way, and it explains why the pouches come back empty and not merely light." },
      },
      choices = {
        { text = "Write it down, then. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
  },

  topics = {
    elune = { { id = "tp_elune", text = "The priestesses need no reagent but the moon. I find that beautiful, and bad for business." } },
    highborne = { { id = "tp_highborne", text = "They used arcane dust as I use salt, I am told. I write that in my book as a warning, and not as a recipe." } },
    satyrs = { { id = "tp_satyrs", text = "A satyr's magic needs no pouch of powder, only malice. I have nothing on my shelves for that, and I am glad of it." } },
    background = { { id = "tp_background", text = "I sell reagents in Astranaar, and I ask too many questions about them. Nobody has minded yet." } },
    warsong = { { id = "tp_warsong", text = "The Warsong turn back the carts from Darnassus, and my shelves show it before anyone's. I do not understand a people who would starve a town of candles." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids are my best teachers and my most patient customers. They explain everything twice and never seem to tire of it." } },
    advice = { { id = "tp_advice", text = "Buy your reagents before you leave a town, never after you need them. I have sold to a great many people who learned that the hard way." } },
    _none = { { id = "tp_none", text = "I do not know, and now I shall wonder about it all evening. If you find out, will you come and tell me?" } },
  },
}

---------------------------------------------------------------------------
-- Fahran Silentblade
---------------------------------------------------------------------------
P:NPC {
  key = "fahran", id = TODO_NPC("Fahran Silentblade"), name = "Fahran Silentblade", title = "Tools & Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "astranaar" }, temper = { "dry", "guarded" }, values = { "discretion", "loyal" },
  notices = { "class", "race" },

  impression = {
    first = "Fahran Silentblade keeps a stall of tools and supplies in Astranaar, and the supplies include things that are not on the open shelf. He is dry, watchful, and plainly on the town's side.",
    third = "{name} met Fahran Silentblade, who sells tools and less ordinary supplies in Astranaar.",
  },

  greetings = {
    { id = "g_hello", text = "Tools, rope, lamp oil and a whetstone or two. If you want anything else, you will have to say so quietly." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. I take it everything I sold you did what it was meant to." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah. You walk as though the boards might hear you. Come round to this side of the stall." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You checked the door and both windows before you looked at me. Good habits, and I shall not ask who taught you them." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. You will want the lamp oil and the whetstone, and you will pretend not to see the lower shelf. We understand one another." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome. Your people ask for tools I have never heard of and then draw them for me on the counter. I have kept two of the drawings." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Fahran Silentblade. I sell what a traveler needs to mend, climb, light and sharpen, and for those in a certain line of work I keep vials that are better not left open. Astranaar is a small town with large enemies, and it cannot afford to fight every battle in daylight." },
      },
      again = {
        { id = "h_again", text = "Anything else? Speak low, if it is that sort of question." },
        { id = "h_again2", text = "Go on. I hear well, and I repeat nothing." },
        { id = "h_again3", text = "What else?" },
      },
      choices = {
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "Vials better left closed. Poisons, you mean.", next = "poison" },
        { text = "Do the Sentinels know what's on your lower shelf?", next = "sentinels" },
        { text = "What does Astranaar need from someone like you?", next = "need" },
        { text = "I'd guess you weren't always a shopkeeper.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I gather herbs. Some of yours I recognise.", next = "xherb", when = { profession = "Herbalism" } },
        { text = "Quiet roads, Fahran.", next = "END" },
      },
    },
    poison = {
      lines = {
        { id = "poison_default", text = "I do, and I do not use a softer word for it. Our people have tipped arrows since before the Sundering, for the hunt and for the demon alike. What I sell slows a limb or clouds a mind, and it is bought by those whose work is to end a fight before it becomes a battle." },
      },
      choices = {
        { text = "That's a cold trade.", next = "poison2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    poison2 = {
      lines = {
        { id = "poison2_default", text = "It is. Colder still is a pitched fight at the bridge with the town's children behind it, which is what we have when the quiet work is left undone. I made my peace with the arithmetic a long time ago." },
      },
      choices = {
        { text = "A clean fight is the only honorable one.", next = "BACK", reply = "Then I hope you are always strong enough to afford honor. Astranaar is not, this year.", fx = { align = { honor = 1 } } },
        { text = "Whatever keeps the children safe is fair.", next = "BACK", reply = "That is the whole of my creed, and you have saved me the trouble of saying it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels = {
      lines = {
        { id = "sentinels_default", text = "Raene Wolfrunner knows, because I told her myself the day I opened. She said she had not heard me, and that I was to keep it well stocked. The Sentinels at large prefer not to know, and I respect that by never making them." },
      },
      choices = {
        { text = "And Thenysil, at the bridge?", next = "sentinels2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sentinels2 = {
      lines = {
        { id = "sentinels2_default", text = "Sentinel Thenysil knows everything that crosses that bridge, including my deliveries. She has never said a word. Once, in a bad week, she left a list on my counter of what the night scouts were short of, unsigned." },
      },
      choices = {
        { text = "An understanding, then. Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
    need = {
      lines = {
        { id = "need_default", text = "Eyes on the roads, chiefly. The Warsong scouts watch us from the eastern ridge and the Dark Strand watches from the north, and a town that is watched ought to do some watching of its own. I pass along what my customers tell me, and I forget who told it." },
      },
      choices = {
        { text = "What do they tell you lately?", next = "need2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    need2 = {
      lines = {
        { id = "need2_default", text = "That the orcs have a new camp boss at the Lumber Camp who cuts by night, and that the satyrs at Xavian have grown bold enough to come down to the road. Neither is good, and Raene has both. If you learn a third thing out there, I am always at this stall." },
      },
      choices = {
        { text = "If I learn it, you'll hear it. Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    xrogue = {
      lines = {
        { id = "xrogue_default", text = "No. I shall say that I served in the Enclave's shadow, in Darnassus, with others who do not wear the Sentinels' leathers. Erion Shadewhisper still sends me the young ones who need a season somewhere quiet. Astranaar has not been quiet for some while, but they learn more for it." },
      },
      choices = {
        { text = "Then we've a teacher in common. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xherb = {
      lines = {
        { id = "xherb_default", text = "You would. The base of most of it is plain enough, things that grow by any pond. It is the preparing that matters, and that I do not teach over a counter. Bring me fresh leaves in good condition, though, and I pay honestly." },
      },
      choices = {
        { text = "Fresh leaves, honestly paid. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    sentinels = { { id = "tp_sentinels", text = "They hold the bridges in daylight. Someone has to hold what the daylight does not reach." } },
    satyrs = { { id = "tp_satyrs", text = "Xavian's satyrs were our own people once, and they remember how we think. I would not send a novice among them." } },
    background = { { id = "tp_background", text = "I sell tools and supplies in Astranaar. Some of the supplies are for work that is not discussed at the inn." } },
    warsong = { { id = "tp_warsong", text = "They watch us from the eastern ridge and think we do not watch back. I am content to let them think it." } },
    dark_strand = { { id = "tp_dark_strand", text = "Hooded amateurs at the tower in the north-west, but amateurs with a warlock at their head. I would not turn my back on them." } },
    advice = { { id = "tp_advice", text = "Sit facing the door, and know where the second door is. You will seldom need it, and you will never regret knowing." } },
    _none = { { id = "tp_none", text = "I do not know. And if I did, I should want to know first why you were asking." } },
  },
}

---------------------------------------------------------------------------
-- Kylanna
---------------------------------------------------------------------------
P:NPC {
  key = "kylanna", id = TODO_NPC("Kylanna"), name = "Kylanna", title = "Alchemy Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "silverwind_refuge" }, temper = { "brisk", "cheerful" }, values = { "craft", "practical" },
  notices = { "craft", "class" },

  impression = {
    first = "Kylanna teaches alchemy at Silverwind Refuge and brews for the Sentinels there in whatever pot is not already in use. She is brisk and good-humoured, and her sleeves are singed.",
    third = "{name} met Kylanna, the alchemy trainer at Silverwind Refuge.",
  },

  greetings = {
    { id = "g_hello", text = "Mind the cauldron, it's at the stage where it spits. Hello! Are you here to learn, or only passing?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good, you can stir while I measure." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist! Wonderful. Smell this and tell me whether it's turned." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You've green on your fingers and a bulging satchel. If any of that is liferoot, I'll talk terms with you before Cylania does." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. You're the sort I brew for, mostly. Do me a kindness and actually drink the potion before you've lost half your blood." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Kylanna, and I teach alchemy here at the Refuge to anyone who'll hold a pestle. Mostly I brew for the Sentinels on the lake, healing draughts and something to keep them awake on the long watch, and I teach in between." },
        { id = "h_alch", when = { profession = "Alchemy" }, text = "You know the craft already, so I'll not bore you with the first lessons. There's more I can show you when you've the herbs for it, and Harklan sells the vials just there." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, this needs taking off the heat." },
        { id = "h_again2", text = "Go on, I can talk and pour." },
        { id = "h_again3", text = "Anything more? Hand me that vial, would you." },
      },
      choices = {
        { text = "Teach me alchemy.", next = "BUSINESS" },
        { text = "What do you brew for the Sentinels?", next = "brew" },
        { text = "Who else lives at the Refuge?", next = "refuge" },
        { text = "Your sleeves are singed.", next = "singed" },
        { text = "Does Mystral Lake's water still serve for potions?", next = "xalch", when = { profession = "Alchemy" } },
        { text = "I can gather for you. What grows near here?", next = "xherb", when = { profession = "Herbalism" } },
        { text = "Good brewing, Kylanna.", next = "END" },
      },
    },
    brew = {
      lines = {
        { id = "brew_default", text = "Healing draughts by the dozen, because Sentinel Velene's patrols come back cut up by the elementals on the lake. And a bitter tea of my own that keeps a watcher's eyes open till dawn, which they all complain about and all ask for." },
      },
      choices = {
        { text = "The elementals are getting worse?", next = "brew2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew2 = {
      lines = {
        { id = "brew2_default", text = "They are. Mystral Lake used to be the gentlest water in Ashenvale, and now things rise out of it that would drown you for standing on the shore. Velene's been collecting the bracers they wear to send to someone in Stonetalon who might know why. I just patch the collectors." },
      },
      choices = {
        { text = "Brew stronger and send more patrols.", next = "BACK", reply = "I can brew stronger. More patrols you'd have to conjure, because we've none to send.", fx = { align = { order = -1 } } },
        { text = "Find the cause first. Potions only buy time.", next = "BACK", reply = "That's Velene's thinking, and why she's asking Stonetalon. Buying time is my whole trade, mind.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuge = {
      lines = {
        { id = "refuge_default", text = "We're a small house. Cylania Rootstalker teaches the herbalists and keeps me in leaves, Jayla teaches skinning, and the hunters Alenndaar Lapidaar and Danlaar Nightstride drill their students along the shore. Sentinel Melyria Frostshadow has the watch, and worries enough for all of us." },
      },
      choices = {
        { text = "What worries her?", next = "refuge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuge2 = {
      lines = {
        { id = "refuge2_default", text = "A Sentinel who went missing up in the Howling Vale, and the orcs' road just east of us, in about equal parts. She doesn't say much. I put a calming leaf in her tea once and she noticed at the first sip, so now I just make it strong." },
      },
      choices = {
        { text = "She notices everything, then. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    singed = {
      lines = {
        { id = "singed_default", text = "They always are. An alchemist with tidy sleeves isn't trying anything new, that's my view. This one was a fire-resisting draught that turned out to resist nothing, and I learned that with the sleeve." },
      },
      choices = {
        { text = "Careful work wastes fewer sleeves.", next = "BACK", reply = "And discovers fewer potions! But my tailor agrees with you.", fx = { align = { order = 1 } } },
        { text = "Nothing's learned without a few burns.", next = "BACK", reply = "There, you understand. I'll show you the scar from the frost oil sometime.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalch = {
      lines = {
        { id = "xalch_default", text = "From the south shore, yes, and I boil it twice now, where once I'd have used it straight. Whatever's stirred up the elementals has left the water restless, and a restless base makes a restless potion. If yours ever fizzes when it shouldn't, pour it out." },
      },
      choices = {
        { text = "Boiled twice. I'll remember. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xherb = {
      lines = {
        { id = "xherb_default", text = "Briarthorn along the Raynewood paths, bruiseweed on the hill above us, and liferoot at the water's edge, if you're quick and the elementals are looking the other way. Bring them to me or to Cylania, and try not to make us bid against each other." },
      },
      choices = {
        { text = "I'll split the liferoot between you. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    furbolgs = { { id = "tp_furbolgs", text = "The Thistlefur are sick with something I can't brew a cure for. Believe me, I've tried four recipes." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "Cylania's of the Circle, more or less, and she tells me which herbs I may not strip bare. I listen, mostly." } },
    ashenvale = { { id = "tp_ashenvale", text = "Something has stirred up the water spirits on Mystral Lake, and half of Ashenvale's streams with them. I boil the lake water twice now, to be safe." } },
    background = { { id = "tp_background", text = "I teach alchemy at Silverwind Refuge, and I brew for the Sentinels who keep it. Both keep me busy." } },
    sentinels = { { id = "tp_sentinels", text = "They drink my potions too late and my tea too often. I love them dearly and they'll be the death of me." } },
    advice = { { id = "tp_advice", text = "Drink the healing draught when you're hurt, not when you're dying. It's the commonest mistake there is." } },
    warsong = { { id = "tp_warsong", text = "The orcs' road runs a league east of my cauldron. I keep a second pot of something unpleasant, in case they ever turn off it." } },
    _none = { { id = "tp_none", text = "Couldn't tell you! If it can't be boiled, steeped or ground, it's outside my learning." } },
  },
}

---------------------------------------------------------------------------
-- Andruk
---------------------------------------------------------------------------
P:NPC {
  key = "andruk", id = TODO_NPC("Andruk"), name = "Andruk", title = "Wind Rider Master",
  bible = "bibles/more_folk.md", role = "flightmaster", tier = "service", gender = "male",
  communities = { "zoramgar" }, temper = { "gruff", "watchful" }, values = { "dutiful", "loyal" },
  notices = { "race", "class" },

  impression = {
    first = "Andruk keeps the wind riders at Zoram'gar Outpost, a strip of beach with naga on one side and night elves on the other. He treats every flight out as if it might be the one that brings help.",
    third = "{name} met Andruk, the wind rider master at Zoram'gar Outpost.",
  },

  greetings = {
    { id = "g_hello", text = "You want a wind rider? Good. Where to, and how fast do you need to be gone?" },
    { id = "g_back", when = { metBefore = true }, text = "Back on our beach. Either you like the naga, or you forgot something." },
    { id = "g_alli", when = { faction = "Alliance" }, text = "Alliance. You've got nerve, walking in here. Turn round and keep walking." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. I'll put you on the big grey, she doesn't mind the weight and she likes how your people sit still." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "Keep your beast calm on the platform, hunter. The riders smell fear, and the last wolf that panicked nearly took my arm with it." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear. Half this camp's your kin, and they sing at night. The riders have got used to it, which is more than I have." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Andruk, and I fly the wind riders out of Zoram'gar. It's a long haul over elf country to anywhere friendly, so my beasts fly high and they don't stop. If you've a message for the Crossroads or Orgrimmar, it goes through me." },
        { id = "h_orc", when = { race = "Orc" }, text = "Good to see another orc on this sand. Karang's got few enough of us, and the trolls outnumber him three to one. Where do you need to be?" },
      },
      again = {
        { id = "h_again", text = "What else? Riders are fed and ready." },
        { id = "h_again2", text = "Ask. I've nothing to watch but the tide." },
        { id = "h_again3", text = "Something more? Be quick, the wind's turning." },
      },
      choices = {
        { text = "I need a flight.", next = "BUSINESS" },
        { text = "How do you fly over elf country?", next = "elves" },
        { text = "What's it like, keeping riders on this beach?", next = "beach" },
        { text = "Who gives the orders here?", next = "karang" },
        { text = "An orc among trolls. Does it sit well?", next = "xorc", when = { race = "Orc" } },
        { text = "Your riders don't like the sea air.", next = "xhunter", when = { class = { "HUNTER", "DRUID" } } },
        { text = "Strength and honor, Andruk.", next = "END" },
      },
    },
    elves = {
      lines = {
        { id = "elves_default", text = "High, and by night when I can. The Sentinels have archers at Maestra's Post and Astranaar who'd put a shaft through a rider's wing for sport. So we go up the coast, over the mountains, and down the far side toward Stonetalon, and nobody below sees more than a shadow." },
      },
      choices = {
        { text = "Have you lost riders?", next = "elves2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves2 = {
      lines = {
        { id = "elves2_default", text = "Two, this year. One to an arrow near Astranaar, and one that just didn't come back. I trained both from cubs. I don't hold it against the elves the way some do; it's their forest, and I'd shoot too. But I remember it." },
      },
      choices = {
        { text = "Blood for blood. They'll answer for those riders.", next = "BACK", reply = "Maybe they will. I'd rather have the riders than the answer.", fx = { align = { honor = 1 } } },
        { text = "You're right. They only defend their home.", next = "BACK", reply = "Aye. Doesn't make the perches any less empty, but it's the truth.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beach = {
      lines = {
        { id = "beach_default", text = "Salt in their feathers and sand in the feed, and naga crawling up the strand every night to see if we're asleep. A wind rider wants cliffs and dry wind. I rub them down with oil twice a day, and I sleep by the perches with an axe." },
      },
      choices = {
        { text = "The naga come that close?", next = "beach2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beach2 = {
      lines = {
        { id = "beach2_default", text = "Close enough that Marukai counts them. They've a drowned city out there and some dark hole up the coast they keep going in and out of. Je'neu the shaman says there's something old in it. All I know is that my riders won't fly low over that water, whatever I do." },
      },
      choices = {
        { text = "Beasts know. Something else.", next = "BACK", fx = { learn = { "blackfathom" } } },
      },
    },
    karang = {
      lines = {
        { id = "karang_default", text = "Karang Amakkar, and he earned it. He holds this strip with a handful of grunts and a camp full of trolls, and he's not lost it yet. He wants the naga's leader dead and he'll talk to any fighter who'll listen about how." },
      },
      choices = {
        { text = "A commander who holds the line deserves his fighters.", next = "BACK", reply = "He does. Go and tell him you're one of them, he could use hearing it.", fx = { align = { order = 1 } } },
        { text = "A beach this bad isn't worth holding.", next = "BACK", reply = "Say that to Karang and see how far you fly. But you're not the first to think it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      lines = {
        { id = "xorc_default", text = "Better than I thought it would. They're loud and they laugh at things I don't see the joke in, but they've not broken once, not even when the hydra came up. The Darkspear owe the Warchief, and they pay their debts on this sand every night." },
      },
      choices = {
        { text = "That's worth more than quiet. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xhunter = {
      lines = {
        { id = "xhunter_default", text = "You've an eye. The damp gets in their lungs, and the big male's been coughing since the last storm. I've asked for a posting inland for the old ones. If you know a remedy that isn't just 'move the camp', I'm listening." },
      },
      choices = {
        { text = "Dry bedding and warm stones. Something else.", next = "BACK", reply = "Hm. Stones from the cook fire, under the perch. I'll try it tonight." },
      },
    },
  },

  topics = {
    thrall = { { id = "tp_thrall", text = "The Warchief's put outposts on every coast, and somebody has to fly between them. I'd follow him further than this beach." } },
    darkspear = { { id = "tp_darkspear", text = "The trolls here are loud, loyal and afraid of nothing but their own spirits. I've come to like having them at my back." } },
    background = { { id = "tp_background", text = "I keep the wind riders at Zoram'gar. It's the worst roost in Kalimdor, and my beasts fly out of it anyway." } },
    blackfathom = { { id = "tp_blackfathom", text = "A hole in the coast north of here that the naga keep slipping into. My riders won't fly low over it, and I trust them." } },
    warsong = { { id = "tp_warsong", text = "The Warsong hold the east of this forest. We hold a beach. Don't tell them I said they got the better deal." } },
    advice = { { id = "tp_advice", text = "Fly high over Ashenvale and don't look down. The elves shoot at what they can see." } },
    _none = { { id = "tp_none", text = "Don't know. Ask Karang, or ask the trolls, if you've the evening to spare for the answer." } },
  },
}

-- Second sweep: Zoram'gar's fishers, Lardan in Astranaar, the rest of Silverwind Refuge, Ertog Ragetusk
-- (Torek's Assault) at Splintertree and Therysil (Therylune's Escape) at the Shrine of Aessina.

---------------------------------------------------------------------------
-- Wik'Tar
---------------------------------------------------------------------------
P:NPC {
  key = "wiktar", id = TODO_NPC("Wik'Tar"), name = "Wik'Tar", title = "Fish Merchant & Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "zoramgar" }, temper = { "easy", "sly" }, values = { "patience", "kin" },
  notices = { "race", "craft" },

  impression = {
    first = "Wik'Tar sells fish and tackle on the sand at Zoram'gar and seems to be the only one in the outpost who is not worried. He says the sea feeds a patient troll, naga or no naga.",
    third = "{name} met Wik'Tar, who sells fish and fishing supplies at Zoram'gar Outpost.",
  },

  greetings = {
    { id = "g_hello", text = "Hey, mon. Fresh fish, dried fish, hooks and line. De sea been generous dis morning, so sit down and have a look." },
    { id = "g_back", when = { metBefore = true }, text = "Ya came back to Wik'Tar's mat. Good. De catch be even better today, and I only be lying a little." },
    { id = "g_troll", when = { race = "Troll" }, text = "Darkspear! Come and sit, cousin. Tell me how de Echo Isles be looking, if ya been near dem." },
    { id = "g_alli", when = { faction = "Alliance" }, text = "Ya be on de wrong beach, stranger. Wik'Tar sells fish, not trouble, so walk on before de orcs see ya." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "Dat be a river pole ya carrying, mon, too stiff for dis surf. De big ones here pull sideways, and a stiff pole snaps where a whippy one bends." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc who looks at fish like food instead of bait. Karang could use more like you, for his warriors think a meal must have had legs." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Wik'Tar. Kil'Hiwana here teaches de fishing, and I sell what de sea gives us and de tools to take more. It be a small camp wit' naga to de north and elves to de east, so somebody had better keep it fed." },
      },
      again = {
        { id = "h_again", text = "What else, mon?" },
        { id = "h_again2", text = "Ask. De fish not going anywhere." },
        { id = "h_again3", text = "Go on, I be listening." },
      },
      choices = {
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "You don't seem worried, like the others.", next = "worry" },
        { text = "What do you pull out of this water?", next = "water" },
        { text = "You and Kil'Hiwana work side by side.", next = "kil" },
        { text = "What pole should I be carrying here?", next = "xfish", when = { profession = "Fishing" } },
        { text = "The Echo Isles are still Zalazane's.", next = "xtroll", when = { race = "Troll" } },
        { text = "Good fishing, Wik'Tar.", next = "END" },
      },
    },
    worry = {
      lines = {
        { id = "worry_default", text = "Worry don't mend a net. Marukai glares at de water all day, and Karang counts his warriors, and Muglash dreams about his hydra. Somebody got to catch supper. I leave de worrying to dem dat be good at it." },
      },
      choices = {
        { text = "A steady head is worth ten spears.", next = "BACK", reply = "Dat be what I tell Marukai. He don't listen, but he eats de fish.", fx = { align = { order = 1 } } },
        { text = "A man who isn't worried isn't watching.", next = "BACK", reply = "Oh, I be watching, mon. I just do it sitting down.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    water = {
      lines = {
        { id = "water_default", text = "Mackerel and rockscale, close in. Further out by de old elf ruins dere be firefin, and a big oily fish de shamans want for deir workings. And every so often de net come up wit' somet'ing dat got hands, and I throw dat back quick." },
      },
      choices = {
        { text = "Naga in your nets?", next = "water2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    water2 = {
      lines = {
        { id = "water2_default", text = "Young ones, mostly, no longer dan my arm, hissing like a kettle. Je'neu say dey come from de deep place under de ruins, Blackfathom, and dat somet'ing down dere be stirring dem up. I only know de fish be moving closer to shore, like dey running from it." },
      },
      choices = {
        { text = "Fish running from the deep is a bad sign.", next = "water3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    water3 = {
      lines = {
        { id = "water3_default", text = "Bad for dem, good for my net, and I try not to t'ink past dat. But I tell Je'neu every time de catch changes, and he write it down. A fisherman sees de water's mood before a shaman hears it, he say. So I be working for de Earthen Ring now, and dey don't even pay." },
      },
      choices = {
        { text = "You're a better scout than you admit.", next = "BACK", fx = { learn = { "blackfathom" }, affinity = 1 } },
      },
    },
    kil = {
      lines = {
        { id = "kil_default", text = "Twenty years, on t'ree different shores. She has de patience, and I have de talk. She can stand in de surf from dawn to dark and say not'ing, and de fish come to her like she called dem. I t'ink she did call dem, but she won't say." },
      },
      choices = {
        { text = "Does she ever tire of your talking?", next = "kil2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kil2 = {
      lines = {
        { id = "kil2_default", text = "Every day, mon. She got a look for it. When I see de look I go mend nets on de far side of de fire for a while. Den she come and sit, and say one word, and we be friends again. It be a good way to live, if ya can find someone who will put up wit' it." },
      },
      choices = {
        { text = "One word a day. That's a peace treaty.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xfish = {
      lines = {
        { id = "xfish_default", text = "A long one, and whippy, wit' more line dan ya t'ink ya need. Cast past de second wave and let it drift back. And when somet'ing takes it dat pulls straight down instead of out, cut de line, mon. Dat be no fish." },
      },
      choices = {
        { text = "Whippy pole, long line, and cut if it dives.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xtroll = {
      lines = {
        { id = "xtroll_default", text = "I know it. I left my fat'er's boat on dat beach. But Vol'jin say de Darkspear be wherever de Darkspear stand, and so dis sand be home for now. One day we take dem back. Until den I catch elf fish and call dem ours." },
      },
      choices = {
        { text = "We'll take the Isles back, cousin.", next = "BACK", fx = { affinity = 1, learn = { "darkspear" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I be selling fish and tackle at Zoram'gar. Before dat I fished off Sen'jin, and before dat de Echo Isles." } },
    blackfathom = { { id = "tp_blackfathom", text = "Somet'ing under de old ruins be driving de fish to shore. I tell Je'neu each time de catch changes." } },
    darkspear = { { id = "tp_darkspear", text = "De Darkspear be wherever de Darkspear stand. Vol'jin said dat, and I be standing here." } },
    advice = { { id = "tp_advice", text = "When de line pulls straight down, cut it. Dere be t'ings in dis water ya don't want to land." } },
    _none = { { id = "tp_none", text = "Don't know dat one, mon. Ask Je'neu, for he listens to more dan de sea." } },
  },
}

---------------------------------------------------------------------------
-- Kil'Hiwana
---------------------------------------------------------------------------
P:NPC {
  key = "kilhiwana", id = TODO_NPC("Kil'Hiwana"), name = "Kil'Hiwana", title = "Fishing Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "zoramgar" }, temper = { "still", "spare" }, values = { "patience", "respect" },
  notices = { "craft", "race" },

  impression = {
    first = "Kil'Hiwana teaches fishing at Zoram'gar and says about one sentence for every ten of Wik'Tar's. She watched the water the whole time we spoke, and I had the feeling it was telling her things.",
    third = "{name} met Kil'Hiwana, who teaches fishing at Zoram'gar Outpost.",
  },

  greetings = {
    { id = "g_hello", text = "Ya come to learn de fishing. Good. Stand here beside me and be quiet a moment first, so de water can get used to ya." },
    { id = "g_back", when = { metBefore = true }, text = "Ya came back. De water remembers ya, and it don't mind." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "Ya fish already, I can see it in how ya stand. Den I show ya what dis sea wants, which be different from a river." },
    { id = "g_alli", when = { faction = "Alliance" }, text = "Dis not ya shore. Go, and go softly, before somebody louder dan me notices." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "Ya watch de float. Dat be a river habit. In surf ya watch de line where it meets de water, for de float tells ya too late." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. Ya people know how to stand still, and dat be most of fishing. I have taught two of ya, and both were better dan any orc." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Kil'Hiwana. I teach de fishing here, and Wik'Tar sells de fish and does de talking. De sea off dis strand be old and it be troubled, but it still feeds dem dat ask it wit' respect." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask, softly." },
        { id = "h_again3", text = "I be listening." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "The sea is troubled, you say?", next = "troubled" },
        { text = "How do you ask the sea with respect?", next = "respect" },
        { text = "Wik'Tar says the fish come when you call.", next = "call" },
        { text = "What does this sea want that a river doesn't?", next = "xfish", when = { profession = "Fishing" } },
        { text = "Why are my people better at it than orcs?", next = "xtauren", when = { race = "Tauren" } },
        { text = "Calm water to you, Kil'Hiwana.", next = "END" },
      },
    },
    troubled = {
      lines = {
        { id = "troubled_default", text = "Under de ruins to de north dere be a deep place. De elves built it and de sea took it, long ago. Now somet'ing lives dere dat de water don't like. I feel it in de line some mornings, a pull dat be no fish and no tide." },
      },
      choices = {
        { text = "What do you do, on those mornings?", next = "troubled2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troubled2 = {
      lines = {
        { id = "troubled2_default", text = "I take my line in, and I sit, and I do not fish dat day. Wik'Tar laughs at me, but he takes his nets in too. De loa of de deep water be old and dey not all friendly. When one of dem be awake, a wise troll stays on de sand." },
      },
      choices = {
        { text = "You're right to heed the spirits.", next = "BACK", reply = "Ya understand, den. Not many in dis camp do, except Je'neu.", fx = { align = { light = 1 } } },
        { text = "It's only currents. Spirits don't pull lines.", next = "BACK", reply = "Say dat again after ya have felt it. I will wait here.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    respect = {
      lines = {
        { id = "respect_default", text = "Ya take what ya can eat and what ya can sell today. Ya put back de small ones and de ones heavy wit' eggs. And de first fish of every morning goes back, whatever it be, for de sea. My mot'er taught me dat on de Echo Isles, and her mot'er taught her." },
      },
      choices = {
        { text = "Even if the first one is the best of the day?", next = "respect2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    respect2 = {
      lines = {
        { id = "respect2_default", text = "Den most of all. I put back a firefin as long as my leg last season. Wik'Tar nearly wept. But de catch dat week was de best we have had on dis shore. De sea keeps count, and it pays its debts better dan most people." },
      },
      choices = {
        { text = "A hard rule, and it seems to work.", next = "BACK", fx = { trait = { patient = 1 } } },
      },
    },
    call = {
      lines = {
        { id = "call_default", text = "Wik'Tar says a great many t'ings. I do not call dem. I stand where dey were going to be. A fish has habits like anybody, and if ya watch for long enough ya know where it will come before it knows. Dat be all." },
      },
      choices = {
        { text = "That sounds like calling, to me.", next = "call2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    call2 = {
      lines = {
        { id = "call2_default", text = "Maybe so. De old ones would say de loa of de shallows tells me, and I only t'ink I be clever. I leave a little of each catch on de rocks at dusk, in case dey be right. It be gone by morning. Could be crabs, or it could be somet'ing else." },
      },
      choices = {
        { text = "Either way, it does no harm to give thanks.", next = "BACK", fx = { trait = { pious = 1 }, affinity = 1 } },
      },
    },
    xfish = {
      lines = {
        { id = "xfish_default", text = "Weight, and time. A river hook sits where ya put it. Here de surf moves it, so ya must weight it heavy and wait longer dan feels right. Count to twenty after ya t'ink ya should strike. De sea fish mouths de bait before it takes it." },
      },
      choices = {
        { text = "Heavy weight, and count to twenty. I will.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xtauren = {
      lines = {
        { id = "xtauren_default", text = "Because an orc wants to win. He fights de fish, and de line, and de sea, and he loses to all t'ree. Ya people wait. Ya know de land gives when it be ready. De sea be de same as de plains dat way, only wetter." },
      },
      choices = {
        { text = "The Earth Mother's waters, then. I'll remember.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach de fishing at Zoram'gar. I learned it on de Echo Isles, from my mot'er." } },
    blackfathom = { { id = "tp_blackfathom", text = "Dere be a deep place under de ruins dat de water don't like. Some mornings I feel it in de line, and I do not fish." } },
    darkspear = { { id = "tp_darkspear", text = "We be a people of islands. Put a Darkspear on any shore and she will find where de fish be." } },
    advice = { { id = "tp_advice", text = "De first fish of de morning goes back to de sea. It keeps count, and it pays." } },
    _none = { { id = "tp_none", text = "De water has not told me dat. Ask Je'neu, who hears more." } },
  },
}

---------------------------------------------------------------------------
-- Lardan
---------------------------------------------------------------------------
P:NPC {
  key = "lardan", id = TODO_NPC("Lardan"), name = "Lardan", title = "Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "astranaar" }, temper = { "genial", "shrewd" }, values = { "thrift", "community" },
  notices = { "craft", "class" },

  impression = {
    first = "Lardan sells thread, dye and salt to the leatherworkers of Astranaar from a stall beside Aayndia Floralwind's bench. He is genial and shrewd, and he knows to the spool what the town will need next week.",
    third = "{name} met Lardan, who sells leatherworking supplies in Astranaar.",
  },

  greetings = {
    { id = "g_hello", text = "Good day to you. Thread, dye, salt and wax. If Aayndia has sent you with a list, hand it over and I shall save us both the reading." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. You are short of salt, I should guess. Everyone is, this year." },
    { id = "g_lw", when = { profession = "Leatherworking" }, text = "A leatherworker. Good. You will want the heavy thread, for nothing light survives a week past the bridges." },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You have been stitching with a split awl, for I can see it in your seams. I have a sound one for less than the thread it will save you." },
    { id = "n_skin", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. If you are bringing hides into Astranaar, salt them before you cross the bridge. Aayndia will not take a hide that has turned, and she can smell it from her bench." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Lardan. Aayndia Floralwind teaches the leatherworkers here, Tandaan Lightmane sells the finished armor, and I sell the makings. It is a small stall, but every strap and harness that leaves Astranaar for the front has my thread in it." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you?" },
        { id = "h_again2", text = "Ask, friend." },
        { id = "h_again3", text = "Yes? Go on." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why is everyone short of salt?", next = "salt" },
        { text = "How has the war changed your trade?", next = "war" },
        { text = "You three seem to share the work well.", next = "three" },
        { text = "What thread holds past the bridges?", next = "xlw", when = { profession = "Leatherworking" } },
        { text = "Where can I sell good hides here?", next = "xskin", when = { profession = "Skinning" } },
        { text = "Good day, Lardan.", next = "END" },
      },
    },
    salt = {
      lines = {
        { id = "salt_default", text = "Because it comes up the road from Auberdine, and that road is not what it was. Feero Ironhand lost a supply train to an ambush near Maestra's Post not long ago, and my salt was on it. I have been rationing since, and Aayndia has been curing with ash and a good deal of patience." },
      },
      choices = {
        { text = "Who ambushed it?", next = "salt2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    salt2 = {
      lines = {
        { id = "salt2_default", text = "Satyrs and their creatures, Feero says, and not the orcs. People forget that the Horde is only the newest trouble in this forest. The old ones never left. I had rather lose a wagon to an orc, I think. An orc at least wants the salt." },
      },
      choices = {
        { text = "The old evils are worse. Fight them first.", next = "BACK", reply = "So Raene Wolfrunner says, and she has hunted both sorts.", fx = { align = { light = 1 } } },
        { text = "The orcs are the ones taking your forest.", next = "BACK", reply = "They are, and I do not forget it. I only say that they are not alone.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = {
        { id = "war_default", text = "It has doubled it, and I wish that it had not. The Sentinels want harness, quivers and boot leather faster than Aayndia can make them. So she teaches anybody who will sit still, and I supply them all. Half my customers are learning the craft in order to go and need it." },
      },
      choices = {
        { text = "Do you see them again?", next = "war2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war2 = {
      lines = {
        { id = "war2_default", text = "Many of them. They come back from Silverwing with torn straps and a look about the eyes, and they buy thread without haggling. I used to enjoy a good haggle. I have stopped starting them. It did not seem right to argue over copper with someone who had been to the front that week." },
      },
      choices = {
        { text = "That does you credit, Lardan.", next = "BACK", fx = { trait = { kind = 1 }, learn = { "warsong" } } },
      },
    },
    three = {
      lines = {
        { id = "three_default", text = "We do. Aayndia wastes nothing, and so she buys little and uses all of it. Tandaan sells to travellers in a hurry and sends the patient ones on to her. And I keep count of what both of them will want before they have thought to ask. It is a good arrangement, and none of us planned it." },
      },
      choices = {
        { text = "And how do you keep count?", next = "three2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    three2 = {
      lines = {
        { id = "three2_default", text = "By watching Aayndia's scrap bin. When it is full of strap ends, the Sentinels have ordered harness, and I send to Auberdine for buckles. When it is full of soft trimmings, she is making gloves and will want the fine thread. She thinks that I am a mind reader. I have never told her about the bin." },
      },
      choices = {
        { text = "Your secret is safe with me.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xlw = {
      lines = {
        { id = "xlw_default", text = "Waxed sinew, doubled, and sewn with a saddle stitch so that if one thread is cut the other holds. The damp here rots plain linen in a month. Aayndia will show you the stitch, and I shall sell you the sinew, and between us you may keep your boots on." },
      },
      choices = {
        { text = "Doubled sinew and a saddle stitch. Thank you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xskin = {
      lines = {
        { id = "xskin_default", text = "To Aayndia, if they are clean and salted. She pays fairly, and she will tell you what you did wrong, at no extra charge. If they are bear or stag from the deep wood she will take every one. Do not bring her anything from near the Thistlefur village, for those go bad." },
      },
      choices = {
        { text = "Clean, salted, and none from near Thistlefur.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell leatherworking supplies in Astranaar, beside Aayndia Floralwind's bench." } },
    warsong = { { id = "tp_warsong", text = "Half my customers learn the craft so that they can go to the front and need it. I have stopped haggling with them." } },
    satyrs = { { id = "tp_satyrs", text = "I lost a load of salt to a satyrs' ambush on the Auberdine road. The old troubles of this forest never left it." } },
    furbolgs = { { id = "tp_furbolgs", text = "Hides from near the Thistlefur village go bad on the bench. Aayndia will not take them, and neither would I." } },
    sentinels = { { id = "tp_sentinels", text = "Every harness the Sentinels carry out of Astranaar has my thread in it. I check the spools myself." } },
    advice = { { id = "tp_advice", text = "Salt a hide before you cross the bridge. And buy your thread waxed, for the damp here eats everything else." } },
    _none = { { id = "tp_none", text = "That is beyond my stall. Ask Raene Wolfrunner, at the inn, who knows the forest best." } },
  },
}

---------------------------------------------------------------------------
-- Cylania Rootstalker
---------------------------------------------------------------------------
P:NPC {
  key = "cylania_rootstalker", id = TODO_NPC("Cylania Rootstalker"), name = "Cylania Rootstalker", title = "Herbalism Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "silverwind_refuge" }, temper = { "earthy", "frank" }, values = { "growth", "vigilance" },
  notices = { "craft", "class" },

  impression = {
    first = "Cylania Rootstalker teaches herbalism at Silverwind Refuge with dirt to her elbows and no patience for squeamishness. She reads the forest's health in what grows along the lake, and she does not like what she reads.",
    third = "{name} met Cylania Rootstalker, who teaches herbalism at Silverwind Refuge.",
  },

  greetings = {
    { id = "g_hello", text = "Well met. If you have come to learn herbs, kneel down here beside me. You will not learn them standing up." },
    { id = "g_back", when = { metBefore = true }, text = "You are back, and your knees are muddy, so you have been practising. Good." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "You have picked before, for I can smell briarthorn on your gloves. Show me what is in your pouch, and I shall tell you what you walked past." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You have stranglekelp in that pouch, and it is still wet. You have been in the lake. Stay out of the middle of it, for the elementals there are not what they were." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Then you will feel it without my saying so, that the ground is sour for a bowshot round every Warsong stump. Tell your Circle that I am still counting them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Cylania Rootstalker. I teach the herbalists of the Refuge, and I keep Kylanna the alchemist in leaves, which is a task and a half. Everything she brews for the Sentinels begins with me on my knees in the mud." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Ask, and pass me that trowel while you are about it." },
        { id = "h_again3", text = "Go on." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What grows around the Refuge?", next = "grows" },
        { text = "You said the forest isn't well.", next = "well" },
        { text = "How do you and Kylanna get along?", next = "kylanna" },
        { text = "What did I walk past, on the way here?", next = "xherb", when = { profession = "Herbalism" } },
        { text = "How many stumps have you counted?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Good growing, Cylania.", next = "END" },
      },
    },
    grows = {
      lines = {
        { id = "grows_default", text = "Liferoot along the shore, and kingsblood on the south banks. Stranglekelp in the shallows, if you can stand the cold. Bruiseweed everywhere that somebody has been buried, and so there is more of that each year. It is as rich a ground as any in Ashenvale, or it was." },
      },
      choices = {
        { text = "Bruiseweed, where people are buried?", next = "grows2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows2 = {
      lines = {
        { id = "grows2_default", text = "It likes turned earth and it likes iron, and a grave has both. The old battlefields east of here are purple with it. I pick it, for Kylanna needs it for her healing draughts. I say a word over each patch first. I do not know whose it is, but it is somebody's." },
      },
      choices = {
        { text = "That's a fitting respect to show.", next = "BACK", reply = "It costs me a breath. They paid a good deal more.", fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    well = {
      lines = {
        { id = "well_default", text = "It is not. The lake is fouled, and Sentinel Velene Starstrike will tell you by whom. The liferoot at the waterline comes up grey at the tip. And to the east, where the Warsong cut, nothing has grown back but nettle. A forest can mend a wound. I am not sure that it can mend so many at once." },
      },
      choices = {
        { text = "Can anything be done?", next = "well2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    well2 = {
      lines = {
        { id = "well2_default", text = "I plant. Every seed that I can spare goes into the cut ground at the edge of what the orcs have left. Most of it fails. Some does not. Melyria Frostshadow thinks that I shall be caught out there one evening, and she is very likely right. What should you do, in my place?" },
      },
      choices = {
        { text = "Keep planting. Someone has to begin the mending.", next = "BACK", reply = "That is my thinking. A forest was never grown by waiting for a safe day.", fx = { align = { light = 1 } } },
        { text = "Stop. A dead herbalist plants nothing.", next = "BACK", reply = "Melyria has said those very words. I heard her out, and I went again the next evening.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kylanna = {
      lines = {
        { id = "kylanna_default", text = "Loudly. She wants twice what the ground can give and she wants it by yesterday, since the Sentinels want their draughts by tomorrow. I tell her that I will not strip a bank bare for anyone. She calls me a stubborn root. Then she makes me tea, and we begin again." },
      },
      choices = {
        { text = "Who wins?", next = "kylanna2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kylanna2 = {
      lines = {
        { id = "kylanna2_default", text = "The bank wins. I pick one stem in three and never more. So she has learned to stretch a leaf further than any alchemist I know, and her draughts are the better for it. She would not admit that I did that to her. I would not admit that I am proud of her." },
      },
      choices = {
        { text = "Neither of you need say it. Something else.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xherb = {
      lines = {
        { id = "xherb_default", text = "Kingsblood, on the bank where the road dips, for I saw you step over it. And there is a stand of wild steelbloom up on the rocks behind the lodge that nobody picks, because of the climb. Take your time over the climb. I have set two broken ankles this year." },
      },
      choices = {
        { text = "Kingsblood at the dip, steelbloom on the rocks.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "Four hundred and twelve, between here and the Warsong camp, as of the last new moon. I notch a stick for each. I started so that I could tell the Circle exactly what has been taken. I have sent the count to Darnassus twice. Nobody has written back to ask for the stick." },
      },
      choices = {
        { text = "I'll carry the count myself, if you wish.", next = "BACK", reply = "Then take it, and say it loudly. Four hundred and twelve.", fx = { affinity = 1, learn = { "cenarion_circle" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach herbalism at Silverwind Refuge. I also keep Kylanna in leaves, which is the harder task." } },
    warsong = { { id = "tp_warsong", text = "I have counted four hundred and twelve stumps between here and their camp. Nothing grows back there but nettle." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "I have sent my count of stumps to Darnassus twice. Nobody has written back." } },
    sentinels = { { id = "tp_sentinels", text = "Melyria Frostshadow thinks that I shall be caught planting in the cut ground one evening. She is probably right." } },
    advice = { { id = "tp_advice", text = "Take one stem in three, and kneel down to do it. You cannot know a plant from the height of your own head." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Melyria Frostshadow, for she has the watch and hears the reports." } },
  },
}

---------------------------------------------------------------------------
-- Jayla
---------------------------------------------------------------------------
P:NPC {
  key = "jayla", id = TODO_NPC("Jayla"), name = "Jayla", title = "Skinning Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "female",
  communities = { "silverwind_refuge" }, temper = { "plain", "steady" }, values = { "respect", "usefulness" },
  notices = { "craft", "class" },

  impression = {
    first = "Jayla teaches skinning at Silverwind Refuge with a plain, steady hand. She holds that nothing a hunter kills should be left for the flies, and she says so before she will teach a single cut.",
    third = "{name} met Jayla, who teaches skinning at Silverwind Refuge.",
  },

  greetings = {
    { id = "g_hello", text = "Well met. I teach skinning. Before I do, tell me this. When you kill a beast, do you mean to use it, or only to be rid of it?" },
    { id = "g_back", when = { metBefore = true }, text = "You have come back. Let me see your knife. Good, you have kept it clean." },
    { id = "g_skin", when = { profession = "Skinning" }, text = "You carry a skinner's knife, and it has seen work. Then let us find out what you still do wrongly." },
  },

  notice = {
    { id = "n_skin", cat = "craft", when = { profession = "Skinning" },
      text = "Your blade is honed on one side only. Somebody taught you properly. That was Radnaal Maneweaver, I should say, or one of his pupils." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Alenndaar and Danlaar teach your kind to shoot, along the shore. I teach what comes after the shot, and they both send their students to me for it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Jayla. The hunters of this Refuge bring down a great deal, for the Sentinels must eat and be shod. My work is to see that nothing of it is wasted. Ulthaan takes the meat, Aayndia in Astranaar takes the hides, and I teach the cut that serves them both." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Go on. I can talk while I scrape." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Teach me skinning.", next = "BUSINESS" },
        { text = "I use what I kill.", next = "use" },
        { text = "What do the hunters bring you?", next = "bring" },
        { text = "Is there anything you won't skin?", next = "wont" },
        { text = "What am I still doing wrong?", next = "xskin", when = { profession = "Skinning" } },
        { text = "What comes after the shot?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Good day, Jayla.", next = "END" },
      },
    },
    use = {
      lines = {
        { id = "use_default", text = "Then we shall get on. I ask because there are those now who kill for the practice of it and leave the carcass where it fell. The road east of here is lined with them. A beast left to rot is an insult to the forest, and the forest has had enough of those." },
      },
      choices = {
        { text = "Who leaves them?", next = "use2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    use2 = {
      lines = {
        { id = "use2_default", text = "Outlanders, in a hurry to be stronger. And, I am sorry to say, some of our own young, who have seen them do it. I do not blame the humans much. Nobody taught them otherwise. I blame myself that the young elves were not taught better, and so I teach." },
      },
      choices = {
        { text = "Waste is waste. They should all be held to it.", next = "BACK", reply = "So I think. The forest does not ask where the hunter was born.", fx = { align = { order = 1 } } },
        { text = "In wartime there's no leisure for every hide.", next = "BACK", reply = "It takes fewer breaths than you would think. I can show you how few.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bring = {
      lines = {
        { id = "bring_default", text = "Stag and bear, mostly, from the south wood. Wolves, when the packs come too close to the lodge. And the great lake striders, which are thin-skinned and hard to do well. A torn strider hide is good for nothing but patches. I start my students on those so that they learn to go gently." },
      },
      choices = {
        { text = "You start them on the hardest?", next = "bring2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bring2 = {
      lines = {
        { id = "bring2_default", text = "I do. A bear hide forgives a clumsy knife, and so the student learns to be clumsy. A strider hide tears if you so much as breathe on it wrongly. They ruin a dozen, and they weep, and after that they never ruin anything again. Danlaar says it is cruel. His students' hides are the best in Ashenvale." },
      },
      choices = {
        { text = "Hard beginnings make sure hands.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    wont = {
      lines = {
        { id = "wont_default", text = "Anything from the Felfire Hill side, where the demons walk. The hide looks sound and it itches to carry, and Aayndia says it will not take a cure. And I will not touch a beast that has been at the fouled water in the lake. Something in them is wrong all the way through." },
      },
      choices = {
        { text = "What do you do with those?", next = "wont2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wont2 = {
      lines = {
        { id = "wont2_default", text = "I burn them, well away from the lodge, and I bury the ash. Cylania Rootstalker says that nothing will grow where I have buried it. So I use the same pit each time, and I have marked it with a stone. It is the only fire that I ever light gladly." },
      },
      choices = {
        { text = "A grim duty, but a needed one.", next = "BACK", fx = { learn = { "burning_legion" } } },
      },
    },
    xskin = {
      lines = {
        { id = "xskin_default", text = "You begin at the belly. Everyone does. Begin at the hind leg, on the inside, and work forward, and the hide comes away in one piece with no thin place at the flank. It takes a moment longer. It is worth three times the price on Aayndia's bench." },
      },
      choices = {
        { text = "From the hind leg forward. I'll try it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xhunter = {
      lines = {
        { id = "xhunter_default", text = "The thanks, first. One breath for the beast, as Eladriel teaches in Darnassus. Then the cut, while it is warm, since a cold hide fights you. Then you carry out what you can and tell Ulthaan where the rest lies. A hunt is not finished when the arrow lands." },
      },
      choices = {
        { text = "Thanks, then the cut, then the carrying. Understood.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I teach skinning at Silverwind Refuge. I see that nothing the hunters bring down is wasted." } },
    burning_legion = { { id = "tp_burning_legion", text = "I will not skin a beast from the Felfire Hill side. I burn those, and nothing grows where I bury the ash." } },
    warsong = { { id = "tp_warsong", text = "The orcs take hides as well as timber, and I am told that they waste less than our own young do. That shames me." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels here are fed and shod from what the hunters bring in. I see to the shoeing part." } },
    advice = { { id = "tp_advice", text = "Begin at the hind leg and work forward. And give the beast one breath of thanks before you cut." } },
    _none = { { id = "tp_none", text = "That is no matter for a skinner. Ask Sentinel Melyria Frostshadow, who has the watch." } },
  },
}

---------------------------------------------------------------------------
-- Caelyb
---------------------------------------------------------------------------
P:NPC {
  key = "caelyb", id = TODO_NPC("Caelyb"), name = "Caelyb", title = "Pet Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "silverwind_refuge" }, temper = { "gentle", "attentive" }, values = { "kinship", "patience" },
  notices = { "class", "pet" },

  impression = {
    first = "Caelyb trains hunters' beasts at Silverwind Refuge and seems to listen to the animal more than to its master. He is gentle and attentive, and every creature at the lodge follows him with its eyes.",
    third = "{name} met Caelyb, who trains hunters' beasts at Silverwind Refuge.",
  },

  greetings = {
    { id = "g_hello", text = "Well met, and welcome to the Refuge. I work with hunters and their companions. Have you a beast with you, or are you only curious?" },
    { id = "g_back", when = { metBefore = true }, text = "You are back. And how is your companion? Let it come to me in its own time." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Then it is your friend that I should like to speak with. You may stand there and listen, if you like." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER" },
      text = "Your companion favours its left forepaw, a very little. It is an old hurt, and it has healed, but the beast remembers. Go easy on the downhill, for its sake." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. The beasts here will know you for something between themselves and us. The bear by the door has been watching you since you came up the path." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Caelyb. Alenndaar and Danlaar teach the hunters of the Refuge to shoot. I teach their beasts to trust them, which takes longer. A hunter with a fine bow and a frightened wolf is only half of something." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Go on. The beasts do not mind our talking." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "I'd like to train my companion.", next = "BUSINESS" },
        { text = "How do you teach a beast to trust?", next = "trust" },
        { text = "What beasts do the hunters here keep?", next = "beasts" },
        { text = "Has the war changed the animals?", next = "war" },
        { text = "What does my companion need from me?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Why is that bear watching me?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Go gently, Caelyb.", next = "END" },
      },
    },
    trust = {
      lines = {
        { id = "trust_default", text = "Slowly, and never by force. You sit near it, and you do nothing. You do that for as many days as it takes. One day it eats while you are watching, and another day it sleeps. When it has slept beside you, you may begin to ask things of it." },
      },
      choices = {
        { text = "Some say a firm hand is quicker.", next = "trust2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust2 = {
      lines = {
        { id = "trust2_default", text = "It is quicker. I have seen the orcs' wolves, across the lines. They obey at once, and they flinch when a hand is raised. A beast that flinches will leave you on the day you most need it. Mine take a season longer, and they do not leave." },
      },
      choices = {
        { text = "Trust earned is stronger than fear.", next = "BACK", reply = "It is. And it is pleasanter company by the fire, besides.", fx = { align = { light = 1 } } },
        { text = "Obedience is what a fight needs. Fear will do.", next = "BACK", reply = "Until the fear of something else is greater. And in this forest, it will be.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = {
        { id = "beasts_default", text = "Nightsabers, most of them, for they are born to this wood. A few have bears, and one young hunter has an owl that despises everyone but her. And Danlaar keeps an old stag that he never asks to fight. He says that it carries his temper for him." },
      },
      choices = {
        { text = "A stag that carries his temper?", next = "beasts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts2 = {
      lines = {
        { id = "beasts2_default", text = "He was a hard teacher once, and short with the young. Then the stag came to him, hurt, and would not let anyone else near it. He could not shout near it without its bolting. So he learned to speak low. His students think that he was always gentle, and the stag and I know better." },
      },
      choices = {
        { text = "The beast trained the hunter. I like that.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    war = {
      lines = {
        { id = "war_default", text = "They are afraid, and they have cause to be. The deer have left the east wood entirely. The wolves come closer to the lodge than they ever would, for there is nothing left where they used to hunt. I have had three half-starved cubs brought to me this season." },
      },
      choices = {
        { text = "What became of the cubs?", next = "war2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war2 = {
      lines = {
        { id = "war2_default", text = "Two are with young hunters now, and doing well. The third will not take to anyone. It sits at the edge of the firelight and watches the east. I think that it saw the cutting. I leave food out, and I do not ask it for anything. Some hurts want only time and a full belly." },
      },
      choices = {
        { text = "You do right by them, Caelyb.", next = "BACK", fx = { trait = { kind = 1 }, learn = { "warsong" } } },
      },
    },
    xhunter = {
      lines = {
        { id = "xhunter_default", text = "It needs you to notice the paw before I do. You know its strength very well. Learn its weariness too, the way that it holds its ears when it has had enough. A companion will run itself to death for a master who does not look. Watch for it, and it will know that you did." },
      },
      choices = {
        { text = "I'll watch its ears, and the paw. Thank you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "Because she cannot decide what you are. You smell like one of us, and under that like one of her own. Do not stare back at her. Sit down for a moment, facing a little away. There. She has lain down, do you see? She has decided that you are a cousin." },
      },
      choices = {
        { text = "I'm honoured to be counted family.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I train the hunters' beasts at Silverwind Refuge. Mostly I teach the two of them to trust one another." } },
    warsong = { { id = "tp_warsong", text = "The deer have left the east wood, and the wolves come to our fire for want of anything to hunt. The cutting did that." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The beasts take a druid for a cousin. I have always rather envied your order that." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels' nightsabers are trained in Darnassus, and well. I mend what the front does to them." } },
    advice = { { id = "tp_advice", text = "Learn your companion's weariness as well as its strength. A beast will run itself to death for a master who does not look." } },
    _none = { { id = "tp_none", text = "I know beasts and not much besides. Ask Sentinel Melyria Frostshadow." } },
  },
}

---------------------------------------------------------------------------
-- Harklan Moongrove
---------------------------------------------------------------------------
P:NPC {
  key = "harklan", id = TODO_NPC("Harklan Moongrove"), name = "Harklan Moongrove", title = "Alchemy Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "silverwind_refuge" }, temper = { "fussy", "good-hearted" }, values = { "care", "order" },
  notices = { "craft", "class" },

  impression = {
    first = "Harklan Moongrove sells vials and alchemists' wares at Silverwind Refuge and frets over every one of them on the bumpy road from Astranaar. He is fussy and good-hearted, and Kylanna plainly runs him ragged.",
    third = "{name} met Harklan Moongrove, who sells alchemy supplies at Silverwind Refuge.",
  },

  greetings = {
    { id = "g_hello", text = "Good day, and mind the crate by your foot, please. It holds vials, and I have only just got them here whole. What may I find for you?" },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you have returned. Did the vials travel well? You wrapped them, I hope, as I showed you." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "An alchemist. Then you will understand why I flinch whenever someone sets a pack down hard." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "You carry your vials loose in a pouch. I can hear them. Please, let me give you some moss to pack them in. I could not rest tonight otherwise." },
    { id = "n_war", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You are in plate, and you are standing very near my glass. I mean no offence. Would you take one step to the left for me?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Harklan Moongrove. Kylanna teaches and brews for the Refuge, and I see to it that she has something to brew in. Every vial here came by cart from Astranaar over a road full of roots, and I walked beside the cart for all of it." },
      },
      again = {
        { id = "h_again", text = "What else do you need?" },
        { id = "h_again2", text = "Ask, and do mind the crate." },
        { id = "h_again3", text = "Yes?" },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "You walk beside the cart yourself?", next = "cart" },
        { text = "What does the Refuge go through most?", next = "most" },
        { text = "How is it, supplying Kylanna?", next = "kylanna" },
        { text = "How should I pack vials for the road?", next = "xalch", when = { profession = "Alchemy" } },
        { text = "What breaks more glass, plate or the road?", next = "xwar", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Good day, Harklan.", next = "END" },
      },
    },
    cart = {
      lines = {
        { id = "cart_default", text = "Every time. The carter thinks me mad. But I have counted, and a cart with me beside it loses one vial in forty, while a cart without me loses one in six. I hold the crates at the bad places. There is one root near the lake fork that I know like an old enemy." },
      },
      choices = {
        { text = "Is the road safe to walk?", next = "cart2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cart2 = {
      lines = {
        { id = "cart2_default", text = "Less than it was. We have Sentinels as far as the fork, and after that we move quickly. I was stopped once, by a Warsong scout on a wolf. He looked into the crates and saw empty glass, and he laughed and rode on. I have never been so glad to be thought worthless." },
      },
      choices = {
        { text = "The glass he spared has killed more orcs than swords.", next = "BACK", reply = "I think of that at the lake fork, each time. It gets me past the root.", fx = { trait = { witty = 1 }, learn = { "warsong" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    most = {
      lines = {
        { id = "most_default", text = "Vials for healing draughts, far beyond anything else. Then the crystal ones, for the stronger work. And leaded stoppers, because Kylanna will reuse a vial ten times but she chews through stoppers. I mean it just as I say it. She holds them in her teeth while she pours." },
      },
      choices = {
        { text = "Ten times? Is that safe?", next = "most2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    most2 = {
      lines = {
        { id = "most2_default", text = "If they are boiled between, and they are, for I boil them. Every evening the Sentinels bring back their empties, and I wash, boil and check each for cracks by candle. A cracked vial at the wrong moment has cost lives. I have never let one go out, and I do not mean to begin." },
      },
      choices = {
        { text = "That care is worth a company of archers.", next = "BACK", reply = "You are kind. Kylanna calls it fussing. But she has never once had a vial fail.", fx = { align = { order = 1 } } },
        { text = "You could trust the Sentinels to check their own.", next = "BACK", reply = "I could. They are tired, and it is dark, and I am neither. So I do it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kylanna = {
      lines = {
        { id = "kylanna_default", text = "It is like supplying a storm. She is cheerful and quick and she will use any pot that is not nailed down. I found my washing basin on her fire last week, full of something purple. She said that it was the best size. It was, and I have bought another basin." },
      },
      choices = {
        { text = "And yet you seem fond of her.", next = "kylanna2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kylanna2 = {
      lines = {
        { id = "kylanna2_default", text = "Everyone is. She has kept this Refuge on its feet through a hard year, on singed sleeves and four hours of sleep. I fuss, and she laughs at me. Then at midnight she is still brewing, and I am still washing, and neither of us says anything, and that is the best part of my day." },
      },
      choices = {
        { text = "A good partnership, that.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    xalch = {
      lines = {
        { id = "xalch_default", text = "Each one is wrapped in damp moss, and they are set upright, and none of them touches another. Then you pack the gaps with more moss until nothing shifts when you shake the bag. Shake it by your ear. If you hear glass, begin again. Cylania Rootstalker gathers the moss for me from the north bank." },
      },
      choices = {
        { text = "Moss, upright, and shake to listen. I will.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xwar = {
      lines = {
        { id = "xwar_default", text = "The road, by a long way, though you have me worried enough. A warrior broke eleven at once last spring by sitting on the wrong crate. He paid for them at once and he apologised for a week. I should prefer that to the root, truly. The root has never apologised." },
      },
      choices = {
        { text = "I'll sit only where you point.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I sell alchemy supplies at Silverwind Refuge. I walk every crate of glass here from Astranaar myself." } },
    warsong = { { id = "tp_warsong", text = "A Warsong scout looked into my crates once, saw empty glass and rode on laughing. I was glad to be thought worthless." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels bring back their empty vials each evening. I boil and check every one by candle before it goes out again." } },
    advice = { { id = "tp_advice", text = "Pack your vials in damp moss and shake the bag by your ear. If you can hear glass, begin again." } },
    _none = { { id = "tp_none", text = "I could not say. Ask Kylanna, if you can catch her between pots." } },
  },
}

---------------------------------------------------------------------------
-- Alenndaar Lapidaar
---------------------------------------------------------------------------
P:NPC {
  key = "alenndaar", id = TODO_NPC("Alenndaar Lapidaar"), name = "Alenndaar Lapidaar", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "silverwind_refuge" }, temper = { "keen", "demanding" }, values = { "precision", "discipline" },
  notices = { "class", "pet" },

  impression = {
    first = "Alenndaar Lapidaar drills young hunters along the shore of Mystral Lake and misses nothing they do wrongly. He is keen and demanding, and he corrected my stance without being asked.",
    third = "{name} met Alenndaar Lapidaar, who trains hunters at Silverwind Refuge.",
  },

  greetings = {
    { id = "g_hello", text = "Well met. If you have come to train, string your bow. If you have come to talk, talk while I watch the line, for I shall not take my eyes off it." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Then show me whether you remember anything, or whether I must say it all again." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Stand at the mark and loose three, and then we shall both know where to begin." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You hold your breath as you loose. I can see your shoulders lock. Let half of it out first, and the arrow will stop climbing on you." },
    { id = "n_nothunter", cat = "class", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } },
      text = "You are no archer, I think, though you carry something to throw. Stand behind the line, then, and do not walk across it. My students are not yet to be trusted with a moving friend." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Alenndaar Lapidaar. Danlaar Nightstride and I train the hunters of Silverwind, and when we have done with them they go east to the Silverwing. So I teach them as if their lives hung upon it, since they do." },
      },
      again = {
        { id = "h_again", text = "What else?" },
        { id = "h_again2", text = "Speak. I am watching the line." },
        { id = "h_again3", text = "Go on." },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS" },
        { text = "You teach as if their lives depend on it.", next = "lives" },
        { text = "How do you and Danlaar divide the work?", next = "danlaar" },
        { text = "What is it like, shooting over this lake?", next = "lake" },
        { text = "Tell me what my three arrows showed you.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "What should a fighter know about archers?", next = "xmelee", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "Shoot true, Alenndaar.", next = "END" },
      },
    },
    lives = {
      lines = {
        { id = "lives_default", text = "I had a pupil with the best eye that I ever taught, and she knew it. She would not drill the dull things, the footing and the wind. She went east in the spring. An orc came at her over wet ground, and she slipped as she loosed. Sentinel Melyria brought me her bow." },
      },
      choices = {
        { text = "I'm sorry. That's a hard thing to carry.", next = "lives2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lives2 = {
      lines = {
        { id = "lives2_default", text = "It is the reason for every hour that I make them stand in the mud. They hate me for it. I let them. I had rather be hated by a living hunter than be mourned over by a fond one. Do you think that too hard a way to teach?" },
      },
      choices = {
        { text = "No. Hard drill is a kindness, in a war.", next = "BACK", reply = "Then you would have done well at my mark. Few of them think so until afterward.", fx = { align = { order = 1 } } },
        { text = "Yes. Fear of the teacher dulls a student.", next = "BACK", reply = "Danlaar says so. Between his way and mine we lose fewer than either would alone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    danlaar = {
      lines = {
        { id = "danlaar_default", text = "He takes them first, and he makes them love the bow. He is patient, and he speaks low, and he has that old stag at his heel. Then they come to me and I make them good with it. They weep for Danlaar. He comes and stands at the end of my line with his arms folded, and he says nothing." },
      },
      choices = {
        { text = "Do the two of you quarrel over it?", next = "danlaar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danlaar2 = {
      lines = {
        { id = "danlaar2_default", text = "Every evening, over supper, and Kylanna sits between us. He says that I break their spirit, and I say that he sends me children who think that a bow is a toy. We are both a little right. We have been having the same quarrel for two hundred years, and I should miss it sorely." },
      },
      choices = {
        { text = "An old quarrel is a kind of friendship.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    lake = {
      lines = {
        { id = "lake_default", text = "It is treacherous, and useful for that. The wind comes off the water in gusts that you cannot see in the trees. An arrow loosed across the inlet will drift a hand's breadth or a full pace, and my students must learn to feel which. I set the far targets there on purpose." },
      },
      choices = {
        { text = "And the things in the lake itself?", next = "lake2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lake2 = {
      lines = {
        { id = "lake2_default", text = "The elementals? They are fouled, and they are angry, and Sentinel Velene Starstrike has the charge of that matter. I forbid my students the island. I shall admit that I have used the creatures as moving marks, from the shore, with blunted shafts. Velene does not know of it. You need not tell her." },
      },
      choices = {
        { text = "She won't hear it from me.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    xhunter = {
      lines = {
        { id = "xhunter_default", text = "The first was high, from the held breath. The second was true. The third went left, because you were pleased with the second and you stopped thinking. That is the commonest fault there is. Each arrow is the first arrow. Say that to yourself until it bores you, and then keep on saying it." },
      },
      choices = {
        { text = "Each arrow is the first arrow. I'll say it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xmelee = {
      lines = {
        { id = "xmelee_default", text = "That we need you. An archer with an orc at arm's length is a dead archer. Stand between us and them, hold for the count of ten, and we shall thin them for you. And when you charge, shout it first. I have very nearly feathered a friend who did not." },
      },
      choices = {
        { text = "Hold for ten, and shout before I charge.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I train hunters at Silverwind Refuge, with Danlaar Nightstride. When we have done with them, they go east." } },
    warsong = { { id = "tp_warsong", text = "My pupils go from my mark to the Silverwing lines. I drill them in the mud, because that is where the orcs will find them." } },
    sentinels = { { id = "tp_sentinels", text = "Sentinel Melyria brings me the bows of those who do not come back. I keep them. I do not say how many there are." } },
    advice = { { id = "tp_advice", text = "Each arrow is the first arrow. Let half your breath out, and do not admire the last shot." } },
    _none = { { id = "tp_none", text = "I do not know, and I am watching the line. Ask Melyria Frostshadow." } },
  },
}

---------------------------------------------------------------------------
-- Danlaar Nightstride
---------------------------------------------------------------------------
P:NPC {
  key = "danlaar", id = TODO_NPC("Danlaar Nightstride"), name = "Danlaar Nightstride", title = "Hunter Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service", gender = "male",
  communities = { "silverwind_refuge" }, temper = { "soft-spoken", "patient" }, values = { "kinship", "calm" },
  notices = { "class", "pet" },

  impression = {
    first = "Danlaar Nightstride teaches the Refuge's newest hunters in a low voice, with an old stag standing at his shoulder. He is soft-spoken and patient, and I had the sense that the patience was hard won.",
    third = "{name} met Danlaar Nightstride, who trains hunters at Silverwind Refuge.",
  },

  greetings = {
    { id = "g_hello", text = "Well met, and softly, if you please. My friend here startles. You have come to learn the hunter's way?" },
    { id = "g_back", when = { metBefore = true }, text = "You are back. Good. He remembers you, do you see? His ears have come forward." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Come and sit a while before we speak of bows. I like to know whom I am teaching." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { class = "HUNTER" },
      text = "Your companion came up the path ahead of you, and it looked back twice to see that you were following. That is a good sign. It thinks that it is looking after you." },
    { id = "n_loud", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry a good deal of iron, and it rings. I must ask you to stand still while we talk. He has only just stopped fearing the Sentinels' mail." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Danlaar Nightstride. I take the hunters who have never drawn on a living thing, and I teach them why one does it, before Alenndaar teaches them how. This fellow beside me is no pet. He simply will not leave." },
      },
      again = {
        { id = "h_again", text = "What else would you ask?" },
        { id = "h_again2", text = "Speak low, and go on." },
        { id = "h_again3", text = "Yes, friend?" },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS" },
        { text = "Tell me about the stag.", next = "stag" },
        { text = "Why teach the why before the how?", next = "why" },
        { text = "Alenndaar says you send him children.", next = "alen" },
        { text = "What does a hunter owe a companion?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I'll keep still. Was he hurt by soldiers?", next = "xloud", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Walk softly, Danlaar.", next = "END" },
      },
    },
    stag = {
      lines = {
        { id = "stag_default", text = "He came out of the east wood two winters ago, with an orc's arrow in his haunch. He lay down at the edge of our fire and looked at me. I drew the arrow out. He has been at my shoulder ever since, and he startles at any raised voice, mine included." },
      },
      choices = {
        { text = "Caelyb says he changed you.", next = "stag2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stag2 = {
      lines = {
        { id = "stag2_default", text = "Caelyb says a great deal, for a quiet man. But yes. I was a shouter. I thought that fear made hunters quick. Then I had a creature beside me who fled every time I raised my voice, and I found that I could teach without it. I found that I taught better. I am ashamed of how long it took." },
      },
      choices = {
        { text = "Better to learn it late than not at all.", next = "BACK", reply = "So I tell myself. He tells me so as well, in his way, each morning.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "why_default", text = "Because a hunter who knows only how is a butcher with good aim. We take from the forest so that the forest's people may live. The beast is owed a clean death, and thanks, and the use of all of it. If a pupil cannot tell me that in their own words, they do not go on to Alenndaar." },
      },
      choices = {
        { text = "And when the quarry is an orc?", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = {
        { id = "why2_default", text = "Then it is war, and no hunt, and I do not pretend that they are the same. But I shall tell you what I tell my pupils. Give the clean death even so. Do not learn to enjoy it. A hunter who comes to enjoy it has lost something that I cannot teach back into them." },
      },
      choices = {
        { text = "Right. A clean death, even for an enemy.", next = "BACK", reply = "Hold to that. It will be harder at Silverwing than it is here.", fx = { align = { honor = 1 } } },
        { text = "They'd show us no such courtesy. They've earned none.", next = "BACK", reply = "For our own sake, and not for theirs. But I shall not argue it with you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alen = {
      lines = {
        { id = "alen_default", text = "He does say so, and I send him hunters who love the bow. He sends them east as hunters who can live by it. Each of us thinks that the other has the easier half. I watch his line from the end, some days, with my arms folded, because I know that it troubles him." },
      },
      choices = {
        { text = "Do you think him too hard on them?", next = "alen2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alen2 = {
      lines = {
        { id = "alen2_default", text = "I did, once. Then Melyria Frostshadow brought back a bow that belonged to one of mine, a girl with a wonderful eye. She had slipped in the mud. Alenndaar has made them stand in mud ever since. I no longer tell him that he is too hard, though I still fold my arms." },
      },
      choices = {
        { text = "You grieve the same loss, differently.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    xhunter = {
      lines = {
        { id = "xhunter_default", text = "Your attention. I do not mean food, for it can find that, nor shelter. It chose to stay with a creature that is slower and louder than itself. All that it asks is that you see it. Caelyb will teach you the signs. I only tell you to look for them." },
      },
      choices = {
        { text = "I'll look. Thank you, Danlaar.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xloud = {
      lines = {
        { id = "xloud_default", text = "By archers, as it happens, and not by soldiers. But a Warsong patrol passed near where he lay, and he remembers the sound of iron on iron. Thank you for standing still. There, he has dropped his head to graze. You may breathe now." },
      },
      choices = {
        { text = "I'm glad he feels safe.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I train the newest hunters at Silverwind Refuge. Alenndaar Lapidaar has them after me." } },
    warsong = { { id = "tp_warsong", text = "The stag at my shoulder carried an orc's arrow out of the east wood. I teach my pupils to give a clean death even so." } },
    sentinels = { { id = "tp_sentinels", text = "Melyria Frostshadow brings back the bows. Alenndaar keeps them, and I cannot look at them." } },
    advice = { { id = "tp_advice", text = "Know why you draw before you learn how. And see your companion, for that is all it asks." } },
    _none = { { id = "tp_none", text = "I cannot say. Ask Melyria Frostshadow, and ask her softly." } },
  },
}

---------------------------------------------------------------------------
-- Ulthaan
---------------------------------------------------------------------------
P:NPC {
  key = "ulthaan", id = TODO_NPC("Ulthaan"), name = "Ulthaan", title = "Butcher",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service", gender = "male",
  communities = { "silverwind_refuge" }, temper = { "hearty", "blunt" }, values = { "plenty", "plain speech" },
  notices = { "race", "craft" },

  impression = {
    first = "Ulthaan is the butcher at Silverwind Refuge, and he feeds its Sentinels and hunters from whatever the forest gives up. He is hearty and blunt, and he will not hear that night elves live on berries.",
    third = "{name} met Ulthaan, the butcher of Silverwind Refuge.",
  },

  greetings = {
    { id = "g_hello", text = "Well met! Venison, bear, boar and quail, smoked or fresh. Do not tell me that you thought we ate moonlight, for I have heard it." },
    { id = "g_back", when = { metBefore = true }, text = "Back, and hungry by the look of you. Good. Hunger is the only honest compliment that a butcher gets." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A cook. Then you will want to know what I have hung and for how long, and I shall be glad to tell you." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Human" } },
      text = "An outlander. You will have been told that the kaldorei eat leaves. Sit down and have a slice of this bear, and then go home and tell them otherwise." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You have the look of someone who has been cooking over a campfire and burning the outside. Bank the fire lower, and use a flat stone. I have one to spare." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Ulthaan. The hunters here bring down the meat, Jayla takes the hides from it, and I take the rest and turn it into something that a Sentinel can carry for a week. An army in a forest eats what the forest has, and I am the one who makes that bearable." },
      },
      again = {
        { id = "h_again", text = "What else can I cut for you?" },
        { id = "h_again2", text = "Ask! I can talk and carve." },
        { id = "h_again3", text = "Go on, friend." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "What does a Sentinel carry for a week?", next = "week" },
        { text = "Is there enough game, with the war on?", next = "game" },
        { text = "You work closely with Jayla.", next = "jayla" },
        { text = "How do your people cook bear?", next = "xout", when = { race = { "Dwarf", "Human", "Gnome" } } },
        { text = "What have you hung, and for how long?", next = "xcook", when = { profession = "Cooking" } },
        { text = "Eat well, Ulthaan.", next = "END" },
      },
    },
    week = {
      lines = {
        { id = "week_default", text = "Smoked venison, cut thin and dried hard, with a little salt when Lardan in Astranaar can spare me any. It is not pleasant. It keeps for a month and it weighs nothing, and you can chew it on watch without a fire. The Sentinels call it bark. They ask for more of it all the same." },
      },
      choices = {
        { text = "You could make it taste better, surely.", next = "week2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    week2 = {
      lines = {
        { id = "week2_default", text = "I could, with honey and herbs, and it would spoil in four days. I tried. Melyria Frostshadow sent back a sack of it, green, with a note that said only that she preferred the bark. So bark it is. I save the honey for those who come home." },
      },
      choices = {
        { text = "Plain food that lasts is the right choice.", next = "BACK", reply = "So the Sentinels decided. I only wish that they would say so more politely.", fx = { align = { order = 1 } } },
        { text = "Soldiers deserve one good meal. Try again.", next = "BACK", reply = "They get it, at this fire, when they come back. I see to that part myself.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    game = {
      lines = {
        { id = "game_default", text = "South and west there is, for now. East of here there is nothing. The Warsong hunt as they cut, and what they do not kill has fled. Alenndaar's pupils go twice as far for a stag as they did a year ago. I have begun smoking fish from the lake's clean end, which I never thought to do." },
      },
      choices = {
        { text = "Is the lake fish safe?", next = "game2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    game2 = {
      lines = {
        { id = "game2_default", text = "From the south inlet it is, where the stream comes in. I will take nothing from the middle. Velene Starstrike says that the water there has been fouled, and I can tell you that a fish from it smells wrong before you have even cut it. I buried the one that I tried. I did not sleep well that night." },
      },
      choices = {
        { text = "Trust your nose. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    jayla = {
      lines = {
        { id = "jayla_default", text = "I do, and she is the best that I have known at it. She can have a hide off a stag before I have my knives laid out, and without a nick in the meat. She gives the beast its breath of thanks first. I used to think that was a waste of time, and I do it myself now." },
      },
      choices = {
        { text = "What changed your mind?", next = "jayla2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jayla2 = {
      lines = {
        { id = "jayla2_default", text = "The war did. When you have carved for a table that has three empty places at it, you begin to think about what is owed to whatever died to fill the plates. I am no priest. But I say my word over each carcass now, and the meat is none the worse for it." },
      },
      choices = {
        { text = "No worse, and maybe the better.", next = "BACK", fx = { trait = { pious = 1 } } },
      },
    },
    xout = {
      lines = {
        { id = "xout_default", text = "Slowly, over hardwood coals, with wild onion and a little moonberry to cut the fat. We do not boil it as a dwarf did here last month. I do not hold it against him, for he was very hungry. But I took the pot away from him, and we are friends now." },
      },
      choices = {
        { text = "Onion and moonberry. I'll leave the pot at home.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    xcook = {
      lines = {
        { id = "xcook_default", text = "The venison has hung four days, and the bear six. The quail came in this morning and want eating tonight. Take the bear, if you know what you are about. It is at its best, and tomorrow it will be past it. Alegorn in Darnassus taught me to tell by the smell at the bone." },
      },
      choices = {
        { text = "The bear, then, and tonight. Thank you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I am the butcher at Silverwind Refuge. I turn what the hunters bring into something that a Sentinel can carry." } },
    warsong = { { id = "tp_warsong", text = "East of here the Warsong have hunted the wood empty. Our hunters go twice as far for a stag as they did." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels call my smoked venison bark, and then they ask for more of it. I take that as praise." } },
    advice = { { id = "tp_advice", text = "Cook low and slow over hardwood, and never boil a bear. And smell the meat at the bone before you buy." } },
    _none = { { id = "tp_none", text = "I know meat. For anything else, ask Melyria Frostshadow." } },
  },
}

---------------------------------------------------------------------------
-- Ertog Ragetusk
---------------------------------------------------------------------------
P:NPC {
  key = "ertog", id = TODO_NPC("Ertog Ragetusk"), name = "Ertog Ragetusk",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "male",
  communities = { "splintertree" }, temper = { "shrewd", "gruff" }, values = { "victory", "the Horde" },
  notices = { "race", "class" },

  impression = {
    first = "Ertog Ragetusk plans Splintertree's strikes against the Silverwing elves and weighs every one of them like a merchant with a short purse. He is gruffer than Torek and a good deal more dangerous.",
    third = "{name} met Ertog Ragetusk, who plans the Warsong raids out of Splintertree Post.",
  },

  greetings = {
    { id = "g_hello", text = "Speak quickly. I have a map with too many elves on it and not enough orcs, and you are standing in my light." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good. I can use anyone who comes back to this post twice." },
    { id = "g_active", when = { questActive = TODO_QUEST("Torek's Assault") }, text = "You are meant to be with Torek. If he has gone ahead without you, catch him up. He is brave enough for six orcs, and he counts about as well as one." },
    { id = "g_done", when = { questDone = TODO_QUEST("Torek's Assault") }, text = "Silverwing Outpost burned, and Torek lives to shout about it. You did the Horde a service, and I do not forget who does." },
    { id = "g_alli", when = { faction = "Alliance" }, text = "Alliance, in Splintertree. Either you are lost, or you are very sure of yourself. Leave, before I find out which." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc with scars that are in the right places. You have stood in a line and held it. I can put you to better use than half the grunts that Orgrimmar sends me." },
    { id = "n_rogue", cat = "class", when = { class = { "ROGUE", "HUNTER" } },
      text = "You move quietly. Good. Torek's raiders make a noise like a kodo falling down stairs, and I need someone who can go ahead of them and see." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_done", when = { questDone = TODO_QUEST("Torek's Assault") }, text = "You held Silverwing with Torek, and I have marked it on the map. Since then the elves have pulled back a bowshot, which buys the lumber camp a quiet month. What else do you want of me?" },
        { id = "h_default", key = true, text = "I am Ertog Ragetusk. The Warchief wants lumber, the Warsong want glory, and the elves want us dead. I am the one who must decide where our axes fall, so that we get the first two without the third. Torek does the bleeding, and I do the sums." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick." },
        { id = "h_again2", text = "Speak. The map will keep." },
        { id = "h_again3", text = "Go on." },
      },
      choices = {
        { text = "What are you planning?", next = "plan" },
        { text = "Tell me about Torek.", next = "torek" },
        { text = "Why does the Horde need this forest?", next = "forest" },
        { text = "How do the elves fight?", next = "elves" },
        { text = "Torek's assault went as you planned.", next = "after", when = { questDone = TODO_QUEST("Torek's Assault") } },
        { text = "Put me to that better use, then.", next = "xorc", when = { race = "Orc" } },
        { text = "Where would you send a scout?", next = "xscout", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "Lok'tar, Ertog.", next = "END" },
      },
    },
    plan = {
      lines = {
        { id = "plan_default", text = "The elves hold an outpost south of here that they call Silverwing. From it they watch our lumber road and put arrows into our peons. While it stands, every wagon needs a guard that I do not have. So it must fall. Torek will lead the assault, and he needs strong arms beside him." },
      },
      choices = {
        { text = "Why not march the whole post on it?", next = "plan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan2 = {
      lines = {
        { id = "plan2_default", text = "Because then the elves at Astranaar would walk into Splintertree behind us and burn it. I have enough warriors to hold this post, or to take theirs, and I have not enough for both. So I send a small fist and hit hard, and I am back behind my wall before they can gather. That is all the art there is." },
      },
      choices = {
        { text = "And if the small fist fails?", next = "plan3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plan3 = {
      lines = {
        { id = "plan3_default", text = "Then I have lost Torek and a dozen good raiders, and the elves grow bold. I have weighed it. I weigh it every night. A commander who will not risk warriors does not keep them any longer for it. He only loses them slowly, one wagon at a time." },
      },
      choices = {
        { text = "That's a hard sum, and you've done it honestly.", next = "BACK", fx = { trait = { stern = 1 }, learn = { "warsong" } } },
      },
    },
    torek = {
      lines = {
        { id = "torek_default", text = "He is loud, he is reckless, and he is the best that I have. He would charge a tree if it looked at him wrongly. But the raiders follow him as they will never follow me. I only tell them where to die. He goes there with them." },
      },
      choices = {
        { text = "You sound almost fond of him.", next = "torek2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    torek2 = {
      lines = {
        { id = "torek2_default", text = "Do not tell him so. He fought under Grom Hellscream, as I did, and he remembers the Warsong as they were, all fury. I remember what the fury cost us. He thinks that I am too careful. I think that he is alive because somebody has to be." },
      },
      choices = {
        { text = "Fury wins battles. Torek has the right of it.", next = "BACK", reply = "It wins the first one. Ask Grom about the ones after that, if you can find him.", fx = { align = { order = -1 } } },
        { text = "Caution wins wars. Keep doing the sums.", next = "BACK", reply = "Hm. You may live to be a commander yourself. It is no gift, I warn you.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forest = {
      lines = {
        { id = "forest_default", text = "Because Durotar is rock and dust. Orgrimmar must have walls and roofs and siege engines, and none of them grow out of sand. This forest has more timber in one valley than all of Durotar ever had. The elves say that the trees are sacred. Our children need houses." },
      },
      choices = {
        { text = "The elves were here first. They have a claim.", next = "BACK", reply = "They do. I have never denied it. I have only decided that our need is the greater.", fx = { align = { honor = 1 } } },
        { text = "Need is right enough. Take what the Horde requires.", next = "BACK", reply = "So says the Warsong. Thrall says it with more regret, and I am somewhere between.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      lines = {
        { id = "elves_default", text = "From where you are not looking. They do not stand, and they do not shout. You march for an hour and see nothing, and then three of your warriors have arrows in their throats and the trees are empty again. Our peons are more afraid of the quiet than of any charge." },
      },
      choices = {
        { text = "How do you fight an enemy like that?", next = "elves2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves2 = {
      lines = {
        { id = "elves2_default", text = "You make them come to you. An elf will give up a league of ground and sooner die than lose an outpost that she has sworn to hold. So I strike at what they must defend, and for once they have to stand where I can see them. Silverwing is such a place. That is why I chose it." },
      },
      choices = {
        { text = "You respect them.", next = "elves3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves3 = {
      lines = {
        { id = "elves3_default", text = "I respect anything that has killed so many of mine with so few of its own. They have held this forest for ten thousand years. I should be a fool to think that they would hand it over because we arrived with axes. I plan against them as I would against orcs, and I can pay them no higher compliment." },
      },
      choices = {
        { text = "A wise commander knows his enemy's worth.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    after = {
      lines = {
        { id = "after_default", text = "Better than I had planned it, and I do not say that often. The outpost is ash, Torek has his new scars, and the lumber road has been quiet since. The elves will be back, for they always are. But they will come more carefully, and care is slow." },
      },
      choices = {
        { text = "What's the next stroke?", next = "after2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after2 = {
      lines = {
        { id = "after2_default", text = "That depends on Orgrimmar. I have asked for more warriors, and I shall be sent more peons. So we hold what we have taken, and cut while the road is clear. When the elves have rebuilt, I shall want someone who knows that ground. I shall remember that you do." },
      },
      choices = {
        { text = "Send word, and I'll come.", next = "BACK", reply = "I will. Stay alive until then, for I dislike wasting a good map.", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      lines = {
        { id = "xorc_default", text = "Go to Torek. He gathers his raiders at the south edge of the post and he is short of anyone who can hold a flank. Do as he says in the fight, and afterward come and tell me what truly happened. His reports are all shouting." },
      },
      choices = {
        { text = "I'll hold his flank, and bring you the truth.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xscout = {
      lines = {
        { id = "xscout_default", text = "Along the ridge above the Silverwing road, a day ahead of Torek. I need to know how many Sentinels are there and where their archers sleep. Do not fight them. A scout who fights has told the enemy that somebody is coming. Count them, and come back." },
      },
      choices = {
        { text = "Count and come back. Understood.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I plan the Warsong's strikes out of Splintertree. Torek leads them, and I decide where." } },
    warsong = { { id = "tp_warsong", text = "I rode with the Warsong under Grom. I remember the fury, and I remember what it cost us." } },
    thrall = { { id = "tp_thrall", text = "The Warchief wants this lumber, and he does not want a war that he cannot end. I am trying to give him both." } },
    sentinels = { { id = "tp_sentinels", text = "They kill from where you are not looking. I plan against them as I would against orcs, and that is high praise." } },
    ashenvale = { { id = "tp_ashenvale", text = "This forest has more timber in one valley than all of Durotar. That is the whole reason we are here." } },
    advice = { { id = "tp_advice", text = "Strike at what your enemy must defend. Then, for once, he has to stand where you can see him." } },
    _none = { { id = "tp_none", text = "That is not on my map. Ask Kaylisk at the inn, or Senani, if it concerns the forest." } },
  },
}

---------------------------------------------------------------------------
-- Therysil
---------------------------------------------------------------------------
P:NPC {
  key = "therysil", id = TODO_NPC("Therysil"), name = "Therysil",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest", gender = "female",
  communities = { "astranaar" }, temper = { "anxious", "sweet" }, values = { "kinship", "the wild" },
  notices = { "race", "class" },

  impression = {
    first = "Therysil is a dryad at the Shrine of Aessina who cannot keep still for worrying about her sister. She is sweet-natured and anxious, and she asked me twice whether I had come from the north.",
    third = "{name} met Therysil, a dryad at the Shrine of Aessina who frets for her sister Therylune.",
  },

  greetings = {
    { id = "g_hello", text = "Oh! A traveller. Have you come down from Darkshore, by any chance? My sister went wandering that way, and she has not come home." },
    { id = "g_back", when = { metBefore = true }, text = "It is you again! Have you any news from the north? No, I can see that you have not, or you would be saying it." },
    { id = "g_active", when = { questActive = TODO_QUEST("Therylune's Escape") }, text = "You have seen her? You are with her? Then why are you here? Oh, please do not leave her alone among those dreadful people!" },
    { id = "g_done", when = { questDone = TODO_QUEST("Therylune's Escape") }, text = "My sister's friend! Therylune is safe, and it is your doing. I have not stopped dancing since I heard it, and I do not intend to." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Oh, I am glad. You will understand. When a sister of the forest is frightened, all of us feel it, like a cold wind in the leaves." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A child of the stars. Your people have always been kind to us. Please, if you go north, will you keep an eye open for a dryad with more curiosity than sense?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_done", when = { questDone = TODO_QUEST("Therylune's Escape") }, text = "She is safe, she is safe! Therylune sent word by a wisp that you walked her out past every one of those cultists. I have scolded her by wisp already, and I shall do it again when she is home." },
        { id = "h_default", key = true, text = "I am Therysil. This is Aessina's shrine, and my sisters and I tend it. All but Therylune, who cannot stay in one glade for a whole day. She went north to see the great sword in the earth, in Darkshore, and I have had the most awful feeling ever since." },
      },
      again = {
        { id = "h_again", text = "What else? Oh, do ask, for it keeps me from fretting." },
        { id = "h_again2", text = "Yes? I am listening, truly." },
        { id = "h_again3", text = "Go on, please." },
      },
      choices = {
        { text = "Tell me about your sister.", next = "sister" },
        { text = "What is this shrine?", next = "shrine" },
        { text = "What sort of awful feeling?", next = "feeling" },
        { text = "Who else keeps the shrine with you?", next = "others" },
        { text = "Therylune is safe. I walked her out myself.", next = "safe", when = { questDone = TODO_QUEST("Therylune's Escape") } },
        { text = "I feel it too. A cold wind from the north.", next = "xdruid", when = { class = "DRUID" } },
        { text = "Be at peace, Therysil.", next = "END" },
      },
    },
    sister = {
      lines = {
        { id = "sister_default", text = "She is the younger of us by a hundred years, and she will never let me forget that it is only a hundred. She is brave, and she is clever at hiding, and she wants to see everything. She once followed a human caravan for three days to find out what a wheel was for." },
      },
      choices = {
        { text = "And did she find out?", next = "sister2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister2 = {
      lines = {
        { id = "sister2_default", text = "She says that it is for going in a straight line without looking where you are putting your feet, and that she does not approve. But she came home with a ribbon that one of the children had given her. She wears it still. She is not afraid of anyone, which is exactly the trouble." },
      },
      choices = {
        { text = "Why go to see a sword in the earth?", next = "sister3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister3 = {
      lines = {
        { id = "sister3_default", text = "The Master's Glaive. It is very old, and the ground about it has been wrong for longer than I have been alive. She said that she only wanted to look at it. But there are people there now in dark robes, who pray to things under the earth, and Therylune does not know when to stop looking." },
      },
      choices = {
        { text = "I'll watch for her, if I go north.", next = "BACK", reply = "Oh, would you? She is small, and quick, and she will be hiding. Call her name softly.", fx = { affinity = 1, learn = { "twilights_hammer" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shrine = {
      lines = {
        { id = "shrine_default", text = "It is Aessina's, the spirit of the deep wood. She is the oldest green thing in Ashenvale, and when the forest is well you can hear her breathing here, in the moss. We keep the stones clear and the water sweet, and in return she keeps us." },
      },
      choices = {
        { text = "Can you hear her now?", next = "shrine2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shrine2 = {
      lines = {
        { id = "shrine2_default", text = "Faintly, and it is slower than it was. Something to the east troubles her, the cutting and the fire. And something to the south, where the satyrs are. Illiyana says that we should fight. I say that we should tend. I do not know which of us is right. What should you do?" },
      },
      choices = {
        { text = "Tend. The forest needs healers more than warriors.", next = "BACK", reply = "That is what I feel. Somebody must still be here when the fighting is over.", fx = { align = { light = 1 } } },
        { text = "Fight. What isn't defended won't be left to tend.", next = "BACK", reply = "Illiyana will be so pleased with you. She has wanted an ally.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    feeling = {
      lines = {
        { id = "feeling_default", text = "Like a root that has been pulled. We are all of us a little joined, my sisters and I. When one of us is frightened, the others grow restless. I have not been able to settle for days. I walk the same circle round the shrine until the grass is worn." },
      },
      choices = {
        { text = "Then she's alive, at least, if you still feel her.", next = "feeling2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feeling2 = {
      lines = {
        { id = "feeling2_default", text = "Oh. Oh, I had not thought of it so. Yes! If she were gone it would be quiet, and it is not quiet at all. It is loud, and cross, and frightened, which is just how she would be. Thank you. That is the first comfortable thought that I have had this week." },
      },
      choices = {
        { text = "Hold on to it. Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    others = {
      lines = {
        { id = "others_default", text = "Illiyana, who is grieving, and who is so angry with it. A satyr killed her dear friend Anilia, and she speaks of little but horns. And the wisps, who do not say much. Travellers come too, to rest. The night elves leave us flowers and the tauren leave us silence, and both are welcome." },
      },
      choices = {
        { text = "The tauren come here as well?", next = "others2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others2 = {
      lines = {
        { id = "others2_default", text = "A few do. They stand at the edge and will not come in until they are asked. They say that their Earth Mother and our Aessina might be cousins. I do not know about that. But they are very gentle, for people so large, and they never cut anything. I wish that the orcs would learn it of them." },
      },
      choices = {
        { text = "So do I. Something else.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    safe = {
      lines = {
        { id = "safe_default", text = "You did, you did! She told me everything. She said that you fought like a storm, and that you were very patient when she stopped to look at a beetle. That is exactly like her. I am sorry about the beetle. I do hope that it was not at a bad moment." },
      },
      choices = {
        { text = "It was the worst moment. I'd do it again.", next = "BACK", reply = "Then you are a true friend of the forest, beetles and all. Aessina keep you!", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Keep her nearer home from now on.", next = "BACK", reply = "I shall try. Nobody has managed it yet, but I shall try.", fx = { trait = { stern = 1 } } },
      },
    },
    xdruid = {
      lines = {
        { id = "xdruid_default", text = "You do! Then I am not being foolish. A druid who rested here once told me that our kind and yours hear the same wood with different ears. If you feel it too, then it is real. And if it is real, somebody ought to go and see about it." },
      },
      choices = {
        { text = "I'll go north and look for her.", next = "BACK", fx = { affinity = 1, learn = { "twilights_hammer" } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_background", text = "I am a dryad of Aessina's shrine, in Ashenvale. My sisters and I tend it, all but the one who wanders." } },
    twilights_hammer = { { id = "tp_twilights_hammer", text = "There are people in dark robes at the Master's Glaive who pray to things under the earth. My sister went to look at them." } },
    satyrs = { { id = "tp_satyrs", text = "A satyr killed Illiyana's friend Anilia. She has not been gentle since, and I do not blame her." } },
    warsong = { { id = "tp_warsong", text = "The cutting to the east hurts Aessina. I can hear it in how slowly she breathes." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids hear the same wood that we do, with different ears. I am always glad when one of them stops here." } },
    advice = { { id = "tp_advice", text = "When you are in the deep wood, step where the moss is. It is softer, and it tells Aessina that you are coming." } },
    _none = { { id = "tp_none", text = "Oh, I do not know that. I know moss and water and my sisters. Ask Illiyana, though she may only talk about horns." } },
  },
}
