-- Bartolo Ginsetti: Southshore's cloak-maker, who considers himself the greatest one alive. Voice: bibles/bartolo.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hb_bartolo", id = TODO_NPC("Bartolo Ginsetti"), name = "Bartolo Ginsetti",
  bible = "bibles/bartolo.md", role = "questgiver", tier = "quest",
  communities = { "southshore" }, temper = { "proud", "jovial" }, values = { "proud", "ambitious", "craft" },
  notices = { "craft", "kit" },

  impression = {
    first = "Bartolo Ginsetti makes yeti fur cloaks in Southshore and talks about himself in the third person, often while flexing. He is either the greatest tailor in Lordaeron or its loudest, and possibly both.",
    third = "{name} met Bartolo Ginsetti, Southshore's flamboyant maker of yeti fur cloaks.",
  },

  greetings = {
    { id = "g_default", text = "You there! Yes, you! Come closer and behold the great Bartolo, for such chances are rare." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you return to bask in the greatness of Bartolo! Wise, very wise." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and still you come back to Bartolo. They always come back to Bartolo." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown more impressive, almost impressive enough to wear a Ginsetti cloak without shaming it." },
    { id = "g_cloak", when = { questActive = TODO_QUEST("Bartolo's Yeti Fur Cloak") }, text = "Wool, thread, a Hillman's cloak and yeti fur, of course! Bring them, and witness genius." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Southshore says you have done good deeds, and Bartolo approves. Not as much as he approves of Bartolo, but still." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = { name = "Tailoring" } },
      text = "A tailor! A humble one, I hope, for you stand in the presence of the master." },
    { id = "n_lw", cat = "craft", when = { profession = { name = "Leatherworking" } },
      text = "A leatherworker! You could make the Hillman's cloak yourself, and then Bartolo would make it magnificent." },
    { id = "n_naked", cat = "kit", when = { nearlyNaked = true },
      text = "By all that is stitched, you are barely dressed! Bartolo weeps, and then Bartolo offers his services." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Bartolo Ginsetti, and I make the world-famous, Alliance-renowned yeti fur cloak! Travel the planet and find yourself a better cloak, I dare you, but you will come back, for there is none, as Bartolo always says." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Bartolo's Yeti Fur Cloak") },
          text = "Bring Bartolo a bolt of wool, fine thread, a Hillman's cloak and ten clumps of yeti fur, and you shall be a happy customer. The yetis are in Alterac, and they do not give their fur willingly, but that is your concern and not mine." },
        { id = "h_ready", tags = { "news" }, when = { questReady = TODO_QUEST("Bartolo's Yeti Fur Cloak") },
          text = "You have everything? Then it is time for the great Bartolo to work his magic, and I need no wizard's staff for it, only a needle and thread!" },
        { id = "h_done", when = { questDone = TODO_QUEST("Bartolo's Yeti Fur Cloak") },
          text = "And how is the cloak? Warm, yes? Admired, yes? Do not answer; Bartolo already knows." },
        { id = "h_mage", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You may conjure water and bread, but you cannot conjure a cloak like Bartolo's." },
        { id = "h_rogue", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, I think, from the way you are looking at my fabrics. Hands off the cloaks, my friend, for Bartolo counts them nightly." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Your people know cold, so you will know true warmth when you feel it in a Ginsetti cloak." },
      },
      again = {
        { id = "h_again", text = "What else would you know about Bartolo? There is so much." },
        { id = "h_again2", text = "Ask, ask! Bartolo is generous with his wisdom." },
      },
      choices = {
        { text = "Your cloaks look warmer than most.", next = "cloak" },
        { text = "Where do I find yeti fur?", next = "yeti" },
        { text = "Do you sell to anyone outside Southshore?", next = "fame" },
        { text = "Why do you talk about yourself like that?", next = "third" },
        { text = "I'm a tailor too, Bartolo.", next = "tailor", when = { profession = { name = "Tailoring" } } },
        { text = "Farewell, great Bartolo.", next = "END" },
      },
    },

    cloak = {
      lines = {
        { id = "cl_default", text = "Yeti fur from the Alterac snows, which keeps out a cold that would freeze a dwarf's beard solid. Then wool beneath and a sturdy Hillman's cloak at its heart, and the stitches of Bartolo binding them, which is the part nobody else can copy." },
      },
      choices = {
        { text = "Why a Hillman's cloak at its heart?", next = "cloak_hillman" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloak_hillman = {
      lines = {
        { id = "ch_default", text = "Because a cloak needs bones, my friend, and leather gives it bones. A skilled leatherworker makes it, and if you learn the trade yourself, you can make it, but you cannot make what Bartolo makes from it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    yeti = {
      lines = {
        { id = "ye_default", text = "North into Alterac, where the yetis keep to the caves and the snow. They are large and angry and smell of wet dog, so bring friends, and do not bring the smell back to my shop." },
      },
      choices = {
        { text = "It seems cruel to hunt them for cloaks.", next = "yeti_cruel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yeti_cruel = {
      big = true,
      lines = {
        { id = "yc_default", text = "Cruel? The yetis come down to the farms in hard winters and take sheep, and sometimes shepherds. Bartolo turns them into warmth, which is more than they ever did for anyone." },
      },
      choices = {
        { text = "Fair. Better a cloak than a dead shepherd.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "They're only hungry beasts, Bartolo.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fame = {
      lines = {
        { id = "fa_default", text = "Not yet, not yet! One day I will make my fortune, and everyone from here to Ironforge will know the name of Bartolo Ginsetti. The Ginsetti label will be the envy of every noble in Stormwind." },
      },
      choices = {
        { text = "And until then?", next = "fame_now" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fame_now = {
      big = true,
      lines = {
        { id = "fn_default", text = "Until then, Bartolo makes cloaks for fishermen and soldiers and anyone who brings the fur. Even the greatest must begin somewhere, and Southshore is somewhere, though only barely." },
        { id = "fn_warm", when = { disposition = { min = 65 } },
          text = "Until then, Bartolo talks very loudly so that nobody notices how small his shop is. You understand, yes? You will not tell anyone this." },
      },
      choices = {
        { text = "Dream big, Bartolo. You'll get there.", next = "BACK", fx = { affinity = 2, align = { order = -1 } } },
        { text = "A good craftsman needs no fame. Be content.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    third = {
      lines = {
        { id = "th_default", text = "Like what? Like Bartolo? Because Bartolo is worth mentioning twice, my friend, and some things should be said in full." },
      },
      choices = {
        { text = "I'll take your word on that, Bartolo.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tailor = {
      lines = {
        { id = "ta_default", text = "Then you have Bartolo's sympathy, for you will always be the second-best tailor in any room he is in. Watch my hands, and learn, and do not try to copy the stitch, for it is patented in my heart." },
      },
      choices = {
        { text = "I'll learn what I can, master.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Bartolo knows fabric, fur and the hearts of customers. Ask, and be dazzled." } },
    background = { { id = "tp_bg", text = "Born in Lordaeron, gifted at birth, and making cloaks since my hands could hold a needle." } },
    advice = { { id = "tp_ad", text = "Never wear wet wool in the hills. Wear Bartolo's cloak instead." } },
    alterac = { { id = "tp_alterac", text = "Snow, yetis, ogres and bandits. Bartolo goes there only in his thoughts." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire's strongman challenged Bartolo to a contest of strength, and Bartolo won, naturally. The Faire did not invite Bartolo back, which Bartolo considers a compliment." } },
    forsaken = { { id = "tp_forsaken", text = "The dead men up the hill buy no cloaks, because they do not feel the cold, which is a tragedy for Bartolo's business. Bartolo pities them a little, and fears them a great deal more." } },
    scourge = { { id = "tp_scourge", text = "Bartolo has never met the Scourge and intends never to meet them, since Bartolo is far too handsome to rot. Southshore's guards tell stories that make Bartolo hold his cloak a little tighter." } },
    _none = { { id = "tp_none", text = "Bartolo does not know, and if Bartolo does not know, it is not worth knowing." } },
  },
}
