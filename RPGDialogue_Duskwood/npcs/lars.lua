-- Lars, Sven Yorgen's companion at the camp on the Hushed Bank. Voice: bibles/lars.md
-- Hunts for the camp's food and gets chased home by dire wolves every time.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lars", id = TODO_NPC("Lars"), name = "Lars",
  bible = "bibles/lars.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "cheerful" }, values = { "loyal", "practical" },
  notices = { "animal", "hunger" },

  impression = {
    first = "Lars hunts for Sven's lonely camp and gets chased home by wolves for his trouble. He jokes about it, and stays, and I think the staying is the part that matters.",
    third = "{name} met Lars, who hunts for Sven Yorgen's camp on Duskwood's western edge and is forever being chased home by dire wolves.",
  },

  greetings = {
    { id = "g_camp", text = "Mind the snare by the log, friend. It's for rabbits, but it isn't fussy." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did you bring meat, or are you hoping I did?" },
    { id = "g_wolves", when = { questActive = TODO_QUEST("Wolves at Our Heels") }, text = "Still hunting wolves? I can hear them, so I'd say you've a few left." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I've been chased home by wolves at least twice for every day of it. Welcome back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you thinned those wolves for us. I'd let you hunt my side of the river now." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk in Darkshire say you've been a help. Sven pretends not to care, but he asked after you." },
    { id = "g_word_angered", when = { word = "angered" }, text = "They tell me you've upset somebody out east. Out here we've got bigger troubles than grudges, so leave it at the river." },
  },

  notice = {
    { id = "n_pet", cat = "animal", when = { pet = { type = "Beast" } },
      text = "Keep {pet} close; the dire wolves will take it for a rival, and they don't share." },
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 22 },
      text = "You look half-starved yourself. There's a bit of stew in the pot, though I won't say what's in it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lars. Sven's the brooding one by the fire, and I'm the one who goes out and finds dinner. Living out here alone is dangerous work, but somebody's got to feed him." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Wolves at Our Heels") },
          text = "Every time I'm heading back with meat on me, starving or rabid dire wolves come out of the forest wanting a bite. If you could thin them out, we'd have an easier time of it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Wolves at Our Heels") },
          text = "They prowl north and east of here, mostly, near the river. The starving ones are desperate, and the rabid ones are worse, so don't let them bite you." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Wolves at Our Heels"), days = 3 } },
          text = "You thinned that pack nicely, and without wolves nipping at our heels we can turn our minds to the necromancer. Take some of the flash bundles; folk in town keep sending them to Sven." },
        { id = "h_morbent", when = { questDone = TODO_QUEST("Morbent Fel") },
          text = "Sven sat up all night after Morbent Fel fell, not talking. I think that was him being glad." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! Thank the Light, someone who knows which end of a rabbit to start on." },
      },
      again = {
        { id = "h_again", text = "Anything else? The pot won't stir itself." },
        { id = "h_again2", text = "Go on, I'm listening, as long as you don't mind me skinning while you talk." },
      },
      choices = {
        { text = "Why do you stay out here with Sven?", next = "sven" },
        { text = "What's worse here, wolves or the dead?", next = "danger" },
        { text = "Who's the necromancer to the east?", next = "necro" },
        { text = "Let me teach you a better snare.", next = "snare", when = { class = { "HUNTER", "DRUID" } } },
        { text = "I'll help with the wolves.", next = "BUSINESS" },
        { text = "Good hunting, Lars.", next = "END" },
      },
    },
    sven = {
      lines = { { id = "s_default", text = "Because nobody else would, and a man who's lost what Sven's lost shouldn't sit by a fire on his own. He'd tell you he doesn't need me, and he'd be wrong." },
      },
      choices = {
        { text = "What did he lose?", next = "sven_loss" },
        { text = "That's good of you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    sven_loss = {
      lines = { { id = "sl_default", text = "His family, his farm, and most of his reasons for getting up in the morning. He'll tell you himself if he wants to, so I'll not tell it for him." },
      },
      choices = {
        { text = "Does he want revenge?", next = "sven_revenge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sven_revenge = {
      big = true,
      lines = { { id = "sr_default", text = "He wants a name, and I think he wants the man behind it dead. I've told him it won't bring them back, and he looks at me like I've said something stupid. What do you think?" },
      },
      choices = {
        { text = "Justice, not revenge. Let the Watch handle it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "He's earned his revenge, and you should help him get it.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "I don't know, Lars.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "The wolves, because they're hungry every day. The dead only come for you if you go looking, and I make a point of not going looking." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    necro = {
      lines = { { id = "n_default", text = "Morbent Fel, up past Raven Hill. Sven says his name the way other folk spit, and I don't ask him why, because I can guess." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    snare = {
      lines = { { id = "sn_default", text = "Would you? Mine catch rabbits about one night in four, and the wolves eat the rabbit half the time anyway." },
      },
      choices = {
        { text = "Set it low, by the water, and use wire.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I hunt, I cook, and I keep Sven company. It's not much of a story, but it's mine." } },
    advice = { { id = "tp_ad", text = "Carry the meat on your back, not in your hand. A wolf goes for the hand first." } },
    morbent_fel = { { id = "tp_morbent", text = "Sven's business, mostly, though I'd not weep if somebody finished him.", next = "necro" } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask Sven, if you can get more than three words out of him." } },
    dark_riders = { { id = "tp_dark_riders", text = "Sven wants the riders dead, and so do I, but I want Sven alive more. I keep the fire low and one eye on the road." } },
    raven_hill = { { id = "tp_raven_hill", text = "Game's thin near Raven Hill, because the wolves have more sense than we do and stay away. I don't hunt there, and neither should you." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I won a knife at the Faire in Elwynn years back for throwing a ring over a bottle. It's the best knife I own, and I've skinned half of Duskwood with it." } },
  },
}
